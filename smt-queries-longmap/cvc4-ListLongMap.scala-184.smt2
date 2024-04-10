; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3684 () Bool)

(assert start!3684)

(declare-fun b!25804 () Bool)

(declare-fun e!16719 () Bool)

(declare-fun tp_is_empty!1049 () Bool)

(assert (=> b!25804 (= e!16719 tp_is_empty!1049)))

(declare-datatypes ((V!1223 0))(
  ( (V!1224 (val!551 Int)) )
))
(declare-datatypes ((ValueCell!325 0))(
  ( (ValueCellFull!325 (v!1636 V!1223)) (EmptyCell!325) )
))
(declare-datatypes ((array!1337 0))(
  ( (array!1338 (arr!631 (Array (_ BitVec 32) ValueCell!325)) (size!732 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1337)

(declare-fun b!25805 () Bool)

(declare-datatypes ((array!1339 0))(
  ( (array!1340 (arr!632 (Array (_ BitVec 32) (_ BitVec 64))) (size!733 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1339)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun e!16716 () Bool)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25805 (= e!16716 (and (= (size!732 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!733 _keys!1833) (size!732 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011) (= (size!733 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294)) (bvsgt #b00000000000000000000000000000000 (size!733 _keys!1833))))))

(declare-fun b!25806 () Bool)

(declare-fun e!16715 () Bool)

(assert (=> b!25806 (= e!16715 tp_is_empty!1049)))

(declare-fun mapNonEmpty!1075 () Bool)

(declare-fun mapRes!1075 () Bool)

(declare-fun tp!3595 () Bool)

(assert (=> mapNonEmpty!1075 (= mapRes!1075 (and tp!3595 e!16715))))

(declare-fun mapKey!1075 () (_ BitVec 32))

(declare-fun mapValue!1075 () ValueCell!325)

(declare-fun mapRest!1075 () (Array (_ BitVec 32) ValueCell!325))

(assert (=> mapNonEmpty!1075 (= (arr!631 _values!1501) (store mapRest!1075 mapKey!1075 mapValue!1075))))

(declare-fun b!25807 () Bool)

(declare-fun e!16717 () Bool)

(assert (=> b!25807 (= e!16717 (and e!16719 mapRes!1075))))

(declare-fun condMapEmpty!1075 () Bool)

(declare-fun mapDefault!1075 () ValueCell!325)
