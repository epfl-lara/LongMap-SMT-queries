; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113306 () Bool)

(assert start!113306)

(declare-fun b_free!31357 () Bool)

(declare-fun b_next!31357 () Bool)

(assert (=> start!113306 (= b_free!31357 (not b_next!31357))))

(declare-fun tp!109877 () Bool)

(declare-fun b_and!50561 () Bool)

(assert (=> start!113306 (= tp!109877 b_and!50561)))

(declare-fun b!1344305 () Bool)

(declare-fun e!765123 () Bool)

(assert (=> b!1344305 (= e!765123 false)))

(declare-datatypes ((V!54913 0))(
  ( (V!54914 (val!18753 Int)) )
))
(declare-fun minValue!1245 () V!54913)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91501 0))(
  ( (array!91502 (arr!44207 (Array (_ BitVec 32) (_ BitVec 64))) (size!44759 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91501)

(declare-fun lt!594999 () Bool)

(declare-fun zeroValue!1245 () V!54913)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17780 0))(
  ( (ValueCellFull!17780 (v!21400 V!54913)) (EmptyCell!17780) )
))
(declare-datatypes ((array!91503 0))(
  ( (array!91504 (arr!44208 (Array (_ BitVec 32) ValueCell!17780)) (size!44760 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91503)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24228 0))(
  ( (tuple2!24229 (_1!12125 (_ BitVec 64)) (_2!12125 V!54913)) )
))
(declare-datatypes ((List!31369 0))(
  ( (Nil!31366) (Cons!31365 (h!32574 tuple2!24228) (t!45885 List!31369)) )
))
(declare-datatypes ((ListLongMap!21885 0))(
  ( (ListLongMap!21886 (toList!10958 List!31369)) )
))
(declare-fun contains!9063 (ListLongMap!21885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5804 (array!91501 array!91503 (_ BitVec 32) (_ BitVec 32) V!54913 V!54913 (_ BitVec 32) Int) ListLongMap!21885)

(assert (=> b!1344305 (= lt!594999 (contains!9063 (getCurrentListMap!5804 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344306 () Bool)

(declare-fun e!765122 () Bool)

(declare-fun e!765125 () Bool)

(declare-fun mapRes!57742 () Bool)

(assert (=> b!1344306 (= e!765122 (and e!765125 mapRes!57742))))

(declare-fun condMapEmpty!57742 () Bool)

(declare-fun mapDefault!57742 () ValueCell!17780)

(assert (=> b!1344306 (= condMapEmpty!57742 (= (arr!44208 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17780)) mapDefault!57742)))))

(declare-fun b!1344307 () Bool)

(declare-fun tp_is_empty!37357 () Bool)

(assert (=> b!1344307 (= e!765125 tp_is_empty!37357)))

(declare-fun res!891931 () Bool)

(assert (=> start!113306 (=> (not res!891931) (not e!765123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113306 (= res!891931 (validMask!0 mask!1977))))

(assert (=> start!113306 e!765123))

(assert (=> start!113306 tp_is_empty!37357))

(assert (=> start!113306 true))

(declare-fun array_inv!33507 (array!91501) Bool)

(assert (=> start!113306 (array_inv!33507 _keys!1571)))

(declare-fun array_inv!33508 (array!91503) Bool)

(assert (=> start!113306 (and (array_inv!33508 _values!1303) e!765122)))

(assert (=> start!113306 tp!109877))

(declare-fun mapNonEmpty!57742 () Bool)

(declare-fun tp!109876 () Bool)

(declare-fun e!765124 () Bool)

(assert (=> mapNonEmpty!57742 (= mapRes!57742 (and tp!109876 e!765124))))

(declare-fun mapRest!57742 () (Array (_ BitVec 32) ValueCell!17780))

(declare-fun mapValue!57742 () ValueCell!17780)

(declare-fun mapKey!57742 () (_ BitVec 32))

(assert (=> mapNonEmpty!57742 (= (arr!44208 _values!1303) (store mapRest!57742 mapKey!57742 mapValue!57742))))

(declare-fun b!1344308 () Bool)

(declare-fun res!891927 () Bool)

(assert (=> b!1344308 (=> (not res!891927) (not e!765123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91501 (_ BitVec 32)) Bool)

(assert (=> b!1344308 (= res!891927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344309 () Bool)

(declare-fun res!891928 () Bool)

(assert (=> b!1344309 (=> (not res!891928) (not e!765123))))

(assert (=> b!1344309 (= res!891928 (and (= (size!44760 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44759 _keys!1571) (size!44760 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344310 () Bool)

(declare-fun res!891930 () Bool)

(assert (=> b!1344310 (=> (not res!891930) (not e!765123))))

(declare-datatypes ((List!31370 0))(
  ( (Nil!31367) (Cons!31366 (h!32575 (_ BitVec 64)) (t!45886 List!31370)) )
))
(declare-fun arrayNoDuplicates!0 (array!91501 (_ BitVec 32) List!31370) Bool)

(assert (=> b!1344310 (= res!891930 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31367))))

(declare-fun b!1344311 () Bool)

(assert (=> b!1344311 (= e!765124 tp_is_empty!37357)))

(declare-fun mapIsEmpty!57742 () Bool)

(assert (=> mapIsEmpty!57742 mapRes!57742))

(declare-fun b!1344312 () Bool)

(declare-fun res!891929 () Bool)

(assert (=> b!1344312 (=> (not res!891929) (not e!765123))))

(assert (=> b!1344312 (= res!891929 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44759 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113306 res!891931) b!1344309))

(assert (= (and b!1344309 res!891928) b!1344308))

(assert (= (and b!1344308 res!891927) b!1344310))

(assert (= (and b!1344310 res!891930) b!1344312))

(assert (= (and b!1344312 res!891929) b!1344305))

(assert (= (and b!1344306 condMapEmpty!57742) mapIsEmpty!57742))

(assert (= (and b!1344306 (not condMapEmpty!57742)) mapNonEmpty!57742))

(get-info :version)

(assert (= (and mapNonEmpty!57742 ((_ is ValueCellFull!17780) mapValue!57742)) b!1344311))

(assert (= (and b!1344306 ((_ is ValueCellFull!17780) mapDefault!57742)) b!1344307))

(assert (= start!113306 b!1344306))

(declare-fun m!1231483 () Bool)

(assert (=> b!1344305 m!1231483))

(assert (=> b!1344305 m!1231483))

(declare-fun m!1231485 () Bool)

(assert (=> b!1344305 m!1231485))

(declare-fun m!1231487 () Bool)

(assert (=> b!1344310 m!1231487))

(declare-fun m!1231489 () Bool)

(assert (=> mapNonEmpty!57742 m!1231489))

(declare-fun m!1231491 () Bool)

(assert (=> start!113306 m!1231491))

(declare-fun m!1231493 () Bool)

(assert (=> start!113306 m!1231493))

(declare-fun m!1231495 () Bool)

(assert (=> start!113306 m!1231495))

(declare-fun m!1231497 () Bool)

(assert (=> b!1344308 m!1231497))

(check-sat (not b_next!31357) (not b!1344310) b_and!50561 (not start!113306) tp_is_empty!37357 (not b!1344305) (not b!1344308) (not mapNonEmpty!57742))
(check-sat b_and!50561 (not b_next!31357))
