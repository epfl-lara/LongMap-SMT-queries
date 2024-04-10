; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133668 () Bool)

(assert start!133668)

(declare-fun b!1562868 () Bool)

(declare-fun e!870969 () Bool)

(declare-fun tp_is_empty!38751 () Bool)

(assert (=> b!1562868 (= e!870969 tp_is_empty!38751)))

(declare-fun b!1562869 () Bool)

(declare-fun res!1068484 () Bool)

(declare-fun e!870971 () Bool)

(assert (=> b!1562869 (=> (not res!1068484) (not e!870971))))

(declare-datatypes ((array!104208 0))(
  ( (array!104209 (arr!50296 (Array (_ BitVec 32) (_ BitVec 64))) (size!50846 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104208)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104208 (_ BitVec 32)) Bool)

(assert (=> b!1562869 (= res!1068484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562870 () Bool)

(declare-fun e!870972 () Bool)

(declare-fun e!870973 () Bool)

(declare-fun mapRes!59502 () Bool)

(assert (=> b!1562870 (= e!870972 (and e!870973 mapRes!59502))))

(declare-fun condMapEmpty!59502 () Bool)

(declare-datatypes ((V!59875 0))(
  ( (V!59876 (val!19459 Int)) )
))
(declare-datatypes ((ValueCell!18345 0))(
  ( (ValueCellFull!18345 (v!22211 V!59875)) (EmptyCell!18345) )
))
(declare-datatypes ((array!104210 0))(
  ( (array!104211 (arr!50297 (Array (_ BitVec 32) ValueCell!18345)) (size!50847 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104210)

(declare-fun mapDefault!59502 () ValueCell!18345)

(assert (=> b!1562870 (= condMapEmpty!59502 (= (arr!50297 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18345)) mapDefault!59502)))))

(declare-fun res!1068485 () Bool)

(assert (=> start!133668 (=> (not res!1068485) (not e!870971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133668 (= res!1068485 (validMask!0 mask!947))))

(assert (=> start!133668 e!870971))

(assert (=> start!133668 true))

(declare-fun array_inv!39093 (array!104210) Bool)

(assert (=> start!133668 (and (array_inv!39093 _values!487) e!870972)))

(declare-fun array_inv!39094 (array!104208) Bool)

(assert (=> start!133668 (array_inv!39094 _keys!637)))

(declare-fun mapIsEmpty!59502 () Bool)

(assert (=> mapIsEmpty!59502 mapRes!59502))

(declare-fun b!1562871 () Bool)

(assert (=> b!1562871 (= e!870971 false)))

(declare-fun lt!671796 () Bool)

(declare-datatypes ((List!36502 0))(
  ( (Nil!36499) (Cons!36498 (h!37944 (_ BitVec 64)) (t!51349 List!36502)) )
))
(declare-fun arrayNoDuplicates!0 (array!104208 (_ BitVec 32) List!36502) Bool)

(assert (=> b!1562871 (= lt!671796 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36499))))

(declare-fun b!1562872 () Bool)

(declare-fun res!1068486 () Bool)

(assert (=> b!1562872 (=> (not res!1068486) (not e!870971))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562872 (= res!1068486 (and (= (size!50847 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50846 _keys!637) (size!50847 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562873 () Bool)

(assert (=> b!1562873 (= e!870973 tp_is_empty!38751)))

(declare-fun mapNonEmpty!59502 () Bool)

(declare-fun tp!113337 () Bool)

(assert (=> mapNonEmpty!59502 (= mapRes!59502 (and tp!113337 e!870969))))

(declare-fun mapValue!59502 () ValueCell!18345)

(declare-fun mapKey!59502 () (_ BitVec 32))

(declare-fun mapRest!59502 () (Array (_ BitVec 32) ValueCell!18345))

(assert (=> mapNonEmpty!59502 (= (arr!50297 _values!487) (store mapRest!59502 mapKey!59502 mapValue!59502))))

(assert (= (and start!133668 res!1068485) b!1562872))

(assert (= (and b!1562872 res!1068486) b!1562869))

(assert (= (and b!1562869 res!1068484) b!1562871))

(assert (= (and b!1562870 condMapEmpty!59502) mapIsEmpty!59502))

(assert (= (and b!1562870 (not condMapEmpty!59502)) mapNonEmpty!59502))

(get-info :version)

(assert (= (and mapNonEmpty!59502 ((_ is ValueCellFull!18345) mapValue!59502)) b!1562868))

(assert (= (and b!1562870 ((_ is ValueCellFull!18345) mapDefault!59502)) b!1562873))

(assert (= start!133668 b!1562870))

(declare-fun m!1438573 () Bool)

(assert (=> b!1562869 m!1438573))

(declare-fun m!1438575 () Bool)

(assert (=> start!133668 m!1438575))

(declare-fun m!1438577 () Bool)

(assert (=> start!133668 m!1438577))

(declare-fun m!1438579 () Bool)

(assert (=> start!133668 m!1438579))

(declare-fun m!1438581 () Bool)

(assert (=> b!1562871 m!1438581))

(declare-fun m!1438583 () Bool)

(assert (=> mapNonEmpty!59502 m!1438583))

(check-sat tp_is_empty!38751 (not b!1562871) (not start!133668) (not b!1562869) (not mapNonEmpty!59502))
(check-sat)
