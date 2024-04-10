; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113404 () Bool)

(assert start!113404)

(declare-fun b_free!31455 () Bool)

(declare-fun b_next!31455 () Bool)

(assert (=> start!113404 (= b_free!31455 (not b_next!31455))))

(declare-fun tp!110170 () Bool)

(declare-fun b_and!50743 () Bool)

(assert (=> start!113404 (= tp!110170 b_and!50743)))

(declare-fun b!1346202 () Bool)

(declare-fun e!765973 () Bool)

(assert (=> b!1346202 (= e!765973 false)))

(declare-datatypes ((V!55043 0))(
  ( (V!55044 (val!18802 Int)) )
))
(declare-fun minValue!1245 () V!55043)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91746 0))(
  ( (array!91747 (arr!44329 (Array (_ BitVec 32) (_ BitVec 64))) (size!44879 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91746)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17829 0))(
  ( (ValueCellFull!17829 (v!21450 V!55043)) (EmptyCell!17829) )
))
(declare-datatypes ((array!91748 0))(
  ( (array!91749 (arr!44330 (Array (_ BitVec 32) ValueCell!17829)) (size!44880 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91748)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun zeroValue!1245 () V!55043)

(declare-fun lt!595485 () Bool)

(declare-datatypes ((tuple2!24238 0))(
  ( (tuple2!24239 (_1!12130 (_ BitVec 64)) (_2!12130 V!55043)) )
))
(declare-datatypes ((List!31392 0))(
  ( (Nil!31389) (Cons!31388 (h!32597 tuple2!24238) (t!45982 List!31392)) )
))
(declare-datatypes ((ListLongMap!21895 0))(
  ( (ListLongMap!21896 (toList!10963 List!31392)) )
))
(declare-fun contains!9139 (ListLongMap!21895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5915 (array!91746 array!91748 (_ BitVec 32) (_ BitVec 32) V!55043 V!55043 (_ BitVec 32) Int) ListLongMap!21895)

(assert (=> b!1346202 (= lt!595485 (contains!9139 (getCurrentListMap!5915 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!893278 () Bool)

(assert (=> start!113404 (=> (not res!893278) (not e!765973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113404 (= res!893278 (validMask!0 mask!1977))))

(assert (=> start!113404 e!765973))

(declare-fun tp_is_empty!37455 () Bool)

(assert (=> start!113404 tp_is_empty!37455))

(assert (=> start!113404 true))

(declare-fun array_inv!33403 (array!91746) Bool)

(assert (=> start!113404 (array_inv!33403 _keys!1571)))

(declare-fun e!765974 () Bool)

(declare-fun array_inv!33404 (array!91748) Bool)

(assert (=> start!113404 (and (array_inv!33404 _values!1303) e!765974)))

(assert (=> start!113404 tp!110170))

(declare-fun b!1346203 () Bool)

(declare-fun res!893280 () Bool)

(assert (=> b!1346203 (=> (not res!893280) (not e!765973))))

(assert (=> b!1346203 (= res!893280 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44879 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346204 () Bool)

(declare-fun e!765971 () Bool)

(assert (=> b!1346204 (= e!765971 tp_is_empty!37455)))

(declare-fun b!1346205 () Bool)

(declare-fun mapRes!57889 () Bool)

(assert (=> b!1346205 (= e!765974 (and e!765971 mapRes!57889))))

(declare-fun condMapEmpty!57889 () Bool)

(declare-fun mapDefault!57889 () ValueCell!17829)

(assert (=> b!1346205 (= condMapEmpty!57889 (= (arr!44330 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17829)) mapDefault!57889)))))

(declare-fun b!1346206 () Bool)

(declare-fun res!893276 () Bool)

(assert (=> b!1346206 (=> (not res!893276) (not e!765973))))

(declare-datatypes ((List!31393 0))(
  ( (Nil!31390) (Cons!31389 (h!32598 (_ BitVec 64)) (t!45983 List!31393)) )
))
(declare-fun arrayNoDuplicates!0 (array!91746 (_ BitVec 32) List!31393) Bool)

(assert (=> b!1346206 (= res!893276 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31390))))

(declare-fun b!1346207 () Bool)

(declare-fun res!893277 () Bool)

(assert (=> b!1346207 (=> (not res!893277) (not e!765973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91746 (_ BitVec 32)) Bool)

(assert (=> b!1346207 (= res!893277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57889 () Bool)

(declare-fun tp!110169 () Bool)

(declare-fun e!765972 () Bool)

(assert (=> mapNonEmpty!57889 (= mapRes!57889 (and tp!110169 e!765972))))

(declare-fun mapValue!57889 () ValueCell!17829)

(declare-fun mapRest!57889 () (Array (_ BitVec 32) ValueCell!17829))

(declare-fun mapKey!57889 () (_ BitVec 32))

(assert (=> mapNonEmpty!57889 (= (arr!44330 _values!1303) (store mapRest!57889 mapKey!57889 mapValue!57889))))

(declare-fun b!1346208 () Bool)

(declare-fun res!893279 () Bool)

(assert (=> b!1346208 (=> (not res!893279) (not e!765973))))

(assert (=> b!1346208 (= res!893279 (and (= (size!44880 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44879 _keys!1571) (size!44880 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57889 () Bool)

(assert (=> mapIsEmpty!57889 mapRes!57889))

(declare-fun b!1346209 () Bool)

(assert (=> b!1346209 (= e!765972 tp_is_empty!37455)))

(assert (= (and start!113404 res!893278) b!1346208))

(assert (= (and b!1346208 res!893279) b!1346207))

(assert (= (and b!1346207 res!893277) b!1346206))

(assert (= (and b!1346206 res!893276) b!1346203))

(assert (= (and b!1346203 res!893280) b!1346202))

(assert (= (and b!1346205 condMapEmpty!57889) mapIsEmpty!57889))

(assert (= (and b!1346205 (not condMapEmpty!57889)) mapNonEmpty!57889))

(get-info :version)

(assert (= (and mapNonEmpty!57889 ((_ is ValueCellFull!17829) mapValue!57889)) b!1346209))

(assert (= (and b!1346205 ((_ is ValueCellFull!17829) mapDefault!57889)) b!1346204))

(assert (= start!113404 b!1346205))

(declare-fun m!1233431 () Bool)

(assert (=> b!1346207 m!1233431))

(declare-fun m!1233433 () Bool)

(assert (=> b!1346206 m!1233433))

(declare-fun m!1233435 () Bool)

(assert (=> b!1346202 m!1233435))

(assert (=> b!1346202 m!1233435))

(declare-fun m!1233437 () Bool)

(assert (=> b!1346202 m!1233437))

(declare-fun m!1233439 () Bool)

(assert (=> start!113404 m!1233439))

(declare-fun m!1233441 () Bool)

(assert (=> start!113404 m!1233441))

(declare-fun m!1233443 () Bool)

(assert (=> start!113404 m!1233443))

(declare-fun m!1233445 () Bool)

(assert (=> mapNonEmpty!57889 m!1233445))

(check-sat tp_is_empty!37455 (not start!113404) (not mapNonEmpty!57889) (not b!1346202) (not b!1346206) (not b!1346207) b_and!50743 (not b_next!31455))
(check-sat b_and!50743 (not b_next!31455))
