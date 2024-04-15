; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111392 () Bool)

(assert start!111392)

(declare-fun b_free!30049 () Bool)

(declare-fun b_next!30049 () Bool)

(assert (=> start!111392 (= b_free!30049 (not b_next!30049))))

(declare-fun tp!105623 () Bool)

(declare-fun b_and!48251 () Bool)

(assert (=> start!111392 (= tp!105623 b_and!48251)))

(declare-fun mapIsEmpty!55451 () Bool)

(declare-fun mapRes!55451 () Bool)

(assert (=> mapIsEmpty!55451 mapRes!55451))

(declare-fun b!1318038 () Bool)

(declare-fun e!752176 () Bool)

(assert (=> b!1318038 (= e!752176 false)))

(declare-datatypes ((array!88607 0))(
  ( (array!88608 (arr!42778 (Array (_ BitVec 32) (_ BitVec 64))) (size!43330 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88607)

(declare-fun lt!586263 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52929 0))(
  ( (V!52930 (val!18009 Int)) )
))
(declare-fun zeroValue!1279 () V!52929)

(declare-datatypes ((ValueCell!17036 0))(
  ( (ValueCellFull!17036 (v!20638 V!52929)) (EmptyCell!17036) )
))
(declare-datatypes ((array!88609 0))(
  ( (array!88610 (arr!42779 (Array (_ BitVec 32) ValueCell!17036)) (size!43331 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88609)

(declare-fun minValue!1279 () V!52929)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((tuple2!23258 0))(
  ( (tuple2!23259 (_1!11640 (_ BitVec 64)) (_2!11640 V!52929)) )
))
(declare-datatypes ((List!30397 0))(
  ( (Nil!30394) (Cons!30393 (h!31602 tuple2!23258) (t!43997 List!30397)) )
))
(declare-datatypes ((ListLongMap!20915 0))(
  ( (ListLongMap!20916 (toList!10473 List!30397)) )
))
(declare-fun contains!8556 (ListLongMap!20915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5368 (array!88607 array!88609 (_ BitVec 32) (_ BitVec 32) V!52929 V!52929 (_ BitVec 32) Int) ListLongMap!20915)

(assert (=> b!1318038 (= lt!586263 (contains!8556 (getCurrentListMap!5368 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318039 () Bool)

(declare-fun res!874760 () Bool)

(assert (=> b!1318039 (=> (not res!874760) (not e!752176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88607 (_ BitVec 32)) Bool)

(assert (=> b!1318039 (= res!874760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!874759 () Bool)

(assert (=> start!111392 (=> (not res!874759) (not e!752176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111392 (= res!874759 (validMask!0 mask!2019))))

(assert (=> start!111392 e!752176))

(declare-fun array_inv!32487 (array!88607) Bool)

(assert (=> start!111392 (array_inv!32487 _keys!1609)))

(assert (=> start!111392 true))

(declare-fun tp_is_empty!35869 () Bool)

(assert (=> start!111392 tp_is_empty!35869))

(declare-fun e!752173 () Bool)

(declare-fun array_inv!32488 (array!88609) Bool)

(assert (=> start!111392 (and (array_inv!32488 _values!1337) e!752173)))

(assert (=> start!111392 tp!105623))

(declare-fun b!1318040 () Bool)

(declare-fun e!752172 () Bool)

(assert (=> b!1318040 (= e!752173 (and e!752172 mapRes!55451))))

(declare-fun condMapEmpty!55451 () Bool)

(declare-fun mapDefault!55451 () ValueCell!17036)

(assert (=> b!1318040 (= condMapEmpty!55451 (= (arr!42779 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17036)) mapDefault!55451)))))

(declare-fun b!1318041 () Bool)

(declare-fun res!874761 () Bool)

(assert (=> b!1318041 (=> (not res!874761) (not e!752176))))

(assert (=> b!1318041 (= res!874761 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43330 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318042 () Bool)

(declare-fun e!752175 () Bool)

(assert (=> b!1318042 (= e!752175 tp_is_empty!35869)))

(declare-fun mapNonEmpty!55451 () Bool)

(declare-fun tp!105624 () Bool)

(assert (=> mapNonEmpty!55451 (= mapRes!55451 (and tp!105624 e!752175))))

(declare-fun mapValue!55451 () ValueCell!17036)

(declare-fun mapRest!55451 () (Array (_ BitVec 32) ValueCell!17036))

(declare-fun mapKey!55451 () (_ BitVec 32))

(assert (=> mapNonEmpty!55451 (= (arr!42779 _values!1337) (store mapRest!55451 mapKey!55451 mapValue!55451))))

(declare-fun b!1318043 () Bool)

(declare-fun res!874757 () Bool)

(assert (=> b!1318043 (=> (not res!874757) (not e!752176))))

(declare-datatypes ((List!30398 0))(
  ( (Nil!30395) (Cons!30394 (h!31603 (_ BitVec 64)) (t!43998 List!30398)) )
))
(declare-fun arrayNoDuplicates!0 (array!88607 (_ BitVec 32) List!30398) Bool)

(assert (=> b!1318043 (= res!874757 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30395))))

(declare-fun b!1318044 () Bool)

(declare-fun res!874758 () Bool)

(assert (=> b!1318044 (=> (not res!874758) (not e!752176))))

(assert (=> b!1318044 (= res!874758 (and (= (size!43331 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43330 _keys!1609) (size!43331 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318045 () Bool)

(assert (=> b!1318045 (= e!752172 tp_is_empty!35869)))

(assert (= (and start!111392 res!874759) b!1318044))

(assert (= (and b!1318044 res!874758) b!1318039))

(assert (= (and b!1318039 res!874760) b!1318043))

(assert (= (and b!1318043 res!874757) b!1318041))

(assert (= (and b!1318041 res!874761) b!1318038))

(assert (= (and b!1318040 condMapEmpty!55451) mapIsEmpty!55451))

(assert (= (and b!1318040 (not condMapEmpty!55451)) mapNonEmpty!55451))

(get-info :version)

(assert (= (and mapNonEmpty!55451 ((_ is ValueCellFull!17036) mapValue!55451)) b!1318042))

(assert (= (and b!1318040 ((_ is ValueCellFull!17036) mapDefault!55451)) b!1318045))

(assert (= start!111392 b!1318040))

(declare-fun m!1205223 () Bool)

(assert (=> start!111392 m!1205223))

(declare-fun m!1205225 () Bool)

(assert (=> start!111392 m!1205225))

(declare-fun m!1205227 () Bool)

(assert (=> start!111392 m!1205227))

(declare-fun m!1205229 () Bool)

(assert (=> mapNonEmpty!55451 m!1205229))

(declare-fun m!1205231 () Bool)

(assert (=> b!1318038 m!1205231))

(assert (=> b!1318038 m!1205231))

(declare-fun m!1205233 () Bool)

(assert (=> b!1318038 m!1205233))

(declare-fun m!1205235 () Bool)

(assert (=> b!1318039 m!1205235))

(declare-fun m!1205237 () Bool)

(assert (=> b!1318043 m!1205237))

(check-sat tp_is_empty!35869 (not start!111392) (not b!1318038) (not b!1318043) (not b!1318039) (not b_next!30049) (not mapNonEmpty!55451) b_and!48251)
(check-sat b_and!48251 (not b_next!30049))
