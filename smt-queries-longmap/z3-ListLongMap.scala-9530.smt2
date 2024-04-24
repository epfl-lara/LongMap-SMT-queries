; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113266 () Bool)

(assert start!113266)

(declare-fun b_free!31093 () Bool)

(declare-fun b_next!31093 () Bool)

(assert (=> start!113266 (= b_free!31093 (not b_next!31093))))

(declare-fun tp!109083 () Bool)

(declare-fun b_and!50125 () Bool)

(assert (=> start!113266 (= tp!109083 b_and!50125)))

(declare-fun b!1341135 () Bool)

(declare-fun res!889315 () Bool)

(declare-fun e!764018 () Bool)

(assert (=> b!1341135 (=> (not res!889315) (not e!764018))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91163 0))(
  ( (array!91164 (arr!44033 (Array (_ BitVec 32) (_ BitVec 64))) (size!44584 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91163)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341135 (= res!889315 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44584 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341136 () Bool)

(assert (=> b!1341136 (= e!764018 false)))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54561 0))(
  ( (V!54562 (val!18621 Int)) )
))
(declare-fun zeroValue!1245 () V!54561)

(declare-datatypes ((ValueCell!17648 0))(
  ( (ValueCellFull!17648 (v!21264 V!54561)) (EmptyCell!17648) )
))
(declare-datatypes ((array!91165 0))(
  ( (array!91166 (arr!44034 (Array (_ BitVec 32) ValueCell!17648)) (size!44585 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91165)

(declare-fun minValue!1245 () V!54561)

(declare-fun lt!594410 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24024 0))(
  ( (tuple2!24025 (_1!12023 (_ BitVec 64)) (_2!12023 V!54561)) )
))
(declare-datatypes ((List!31179 0))(
  ( (Nil!31176) (Cons!31175 (h!32393 tuple2!24024) (t!45503 List!31179)) )
))
(declare-datatypes ((ListLongMap!21689 0))(
  ( (ListLongMap!21690 (toList!10860 List!31179)) )
))
(declare-fun contains!9048 (ListLongMap!21689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5813 (array!91163 array!91165 (_ BitVec 32) (_ BitVec 32) V!54561 V!54561 (_ BitVec 32) Int) ListLongMap!21689)

(assert (=> b!1341136 (= lt!594410 (contains!9048 (getCurrentListMap!5813 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!889318 () Bool)

(assert (=> start!113266 (=> (not res!889318) (not e!764018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113266 (= res!889318 (validMask!0 mask!1977))))

(assert (=> start!113266 e!764018))

(declare-fun tp_is_empty!37093 () Bool)

(assert (=> start!113266 tp_is_empty!37093))

(assert (=> start!113266 true))

(declare-fun array_inv!33465 (array!91163) Bool)

(assert (=> start!113266 (array_inv!33465 _keys!1571)))

(declare-fun e!764020 () Bool)

(declare-fun array_inv!33466 (array!91165) Bool)

(assert (=> start!113266 (and (array_inv!33466 _values!1303) e!764020)))

(assert (=> start!113266 tp!109083))

(declare-fun mapNonEmpty!57346 () Bool)

(declare-fun mapRes!57346 () Bool)

(declare-fun tp!109084 () Bool)

(declare-fun e!764021 () Bool)

(assert (=> mapNonEmpty!57346 (= mapRes!57346 (and tp!109084 e!764021))))

(declare-fun mapValue!57346 () ValueCell!17648)

(declare-fun mapKey!57346 () (_ BitVec 32))

(declare-fun mapRest!57346 () (Array (_ BitVec 32) ValueCell!17648))

(assert (=> mapNonEmpty!57346 (= (arr!44034 _values!1303) (store mapRest!57346 mapKey!57346 mapValue!57346))))

(declare-fun b!1341137 () Bool)

(declare-fun e!764019 () Bool)

(assert (=> b!1341137 (= e!764020 (and e!764019 mapRes!57346))))

(declare-fun condMapEmpty!57346 () Bool)

(declare-fun mapDefault!57346 () ValueCell!17648)

(assert (=> b!1341137 (= condMapEmpty!57346 (= (arr!44034 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17648)) mapDefault!57346)))))

(declare-fun b!1341138 () Bool)

(assert (=> b!1341138 (= e!764021 tp_is_empty!37093)))

(declare-fun b!1341139 () Bool)

(declare-fun res!889317 () Bool)

(assert (=> b!1341139 (=> (not res!889317) (not e!764018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91163 (_ BitVec 32)) Bool)

(assert (=> b!1341139 (= res!889317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57346 () Bool)

(assert (=> mapIsEmpty!57346 mapRes!57346))

(declare-fun b!1341140 () Bool)

(assert (=> b!1341140 (= e!764019 tp_is_empty!37093)))

(declare-fun b!1341141 () Bool)

(declare-fun res!889316 () Bool)

(assert (=> b!1341141 (=> (not res!889316) (not e!764018))))

(declare-datatypes ((List!31180 0))(
  ( (Nil!31177) (Cons!31176 (h!32394 (_ BitVec 64)) (t!45504 List!31180)) )
))
(declare-fun arrayNoDuplicates!0 (array!91163 (_ BitVec 32) List!31180) Bool)

(assert (=> b!1341141 (= res!889316 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31177))))

(declare-fun b!1341142 () Bool)

(declare-fun res!889319 () Bool)

(assert (=> b!1341142 (=> (not res!889319) (not e!764018))))

(assert (=> b!1341142 (= res!889319 (and (= (size!44585 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44584 _keys!1571) (size!44585 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113266 res!889318) b!1341142))

(assert (= (and b!1341142 res!889319) b!1341139))

(assert (= (and b!1341139 res!889317) b!1341141))

(assert (= (and b!1341141 res!889316) b!1341135))

(assert (= (and b!1341135 res!889315) b!1341136))

(assert (= (and b!1341137 condMapEmpty!57346) mapIsEmpty!57346))

(assert (= (and b!1341137 (not condMapEmpty!57346)) mapNonEmpty!57346))

(get-info :version)

(assert (= (and mapNonEmpty!57346 ((_ is ValueCellFull!17648) mapValue!57346)) b!1341138))

(assert (= (and b!1341137 ((_ is ValueCellFull!17648) mapDefault!57346)) b!1341140))

(assert (= start!113266 b!1341137))

(declare-fun m!1229355 () Bool)

(assert (=> b!1341136 m!1229355))

(assert (=> b!1341136 m!1229355))

(declare-fun m!1229357 () Bool)

(assert (=> b!1341136 m!1229357))

(declare-fun m!1229359 () Bool)

(assert (=> start!113266 m!1229359))

(declare-fun m!1229361 () Bool)

(assert (=> start!113266 m!1229361))

(declare-fun m!1229363 () Bool)

(assert (=> start!113266 m!1229363))

(declare-fun m!1229365 () Bool)

(assert (=> mapNonEmpty!57346 m!1229365))

(declare-fun m!1229367 () Bool)

(assert (=> b!1341141 m!1229367))

(declare-fun m!1229369 () Bool)

(assert (=> b!1341139 m!1229369))

(check-sat (not b!1341139) b_and!50125 (not b_next!31093) (not b!1341141) tp_is_empty!37093 (not b!1341136) (not start!113266) (not mapNonEmpty!57346))
(check-sat b_and!50125 (not b_next!31093))
