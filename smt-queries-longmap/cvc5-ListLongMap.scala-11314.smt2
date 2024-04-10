; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131788 () Bool)

(assert start!131788)

(declare-fun b!1543047 () Bool)

(declare-fun res!1058797 () Bool)

(declare-fun e!858635 () Bool)

(assert (=> b!1543047 (=> (not res!1058797) (not e!858635))))

(declare-datatypes ((array!102780 0))(
  ( (array!102781 (arr!49592 (Array (_ BitVec 32) (_ BitVec 64))) (size!50142 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102780)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102780 (_ BitVec 32)) Bool)

(assert (=> b!1543047 (= res!1058797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058798 () Bool)

(assert (=> start!131788 (=> (not res!1058798) (not e!858635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131788 (= res!1058798 (validMask!0 mask!926))))

(assert (=> start!131788 e!858635))

(assert (=> start!131788 true))

(declare-datatypes ((V!58813 0))(
  ( (V!58814 (val!18966 Int)) )
))
(declare-datatypes ((ValueCell!17978 0))(
  ( (ValueCellFull!17978 (v!21767 V!58813)) (EmptyCell!17978) )
))
(declare-datatypes ((array!102782 0))(
  ( (array!102783 (arr!49593 (Array (_ BitVec 32) ValueCell!17978)) (size!50143 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102782)

(declare-fun e!858636 () Bool)

(declare-fun array_inv!38585 (array!102782) Bool)

(assert (=> start!131788 (and (array_inv!38585 _values!470) e!858636)))

(declare-fun array_inv!38586 (array!102780) Bool)

(assert (=> start!131788 (array_inv!38586 _keys!618)))

(declare-fun b!1543048 () Bool)

(declare-fun e!858637 () Bool)

(declare-fun tp_is_empty!37777 () Bool)

(assert (=> b!1543048 (= e!858637 tp_is_empty!37777)))

(declare-fun mapIsEmpty!58369 () Bool)

(declare-fun mapRes!58369 () Bool)

(assert (=> mapIsEmpty!58369 mapRes!58369))

(declare-fun b!1543049 () Bool)

(assert (=> b!1543049 (= e!858635 false)))

(declare-fun lt!665918 () Bool)

(declare-datatypes ((List!35903 0))(
  ( (Nil!35900) (Cons!35899 (h!37344 (_ BitVec 64)) (t!50597 List!35903)) )
))
(declare-fun arrayNoDuplicates!0 (array!102780 (_ BitVec 32) List!35903) Bool)

(assert (=> b!1543049 (= lt!665918 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35900))))

(declare-fun b!1543050 () Bool)

(declare-fun e!858639 () Bool)

(assert (=> b!1543050 (= e!858639 tp_is_empty!37777)))

(declare-fun b!1543051 () Bool)

(assert (=> b!1543051 (= e!858636 (and e!858639 mapRes!58369))))

(declare-fun condMapEmpty!58369 () Bool)

(declare-fun mapDefault!58369 () ValueCell!17978)

