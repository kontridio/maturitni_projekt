"""pes model utulek update 2

Revision ID: 706c7b82c0f1
Revises: a392838f0d97
Create Date: 2024-01-06 19:36:11.903907

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '706c7b82c0f1'
down_revision = 'a392838f0d97'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('pes', schema=None) as batch_op:
        batch_op.alter_column('utulek_nazev',
               existing_type=sa.INTEGER(),
               type_=sa.String(length=45),
               existing_nullable=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('pes', schema=None) as batch_op:
        batch_op.alter_column('utulek_nazev',
               existing_type=sa.String(length=45),
               type_=sa.INTEGER(),
               existing_nullable=False)

    # ### end Alembic commands ###
