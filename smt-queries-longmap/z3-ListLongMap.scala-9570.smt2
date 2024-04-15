; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113282 () Bool)

(assert start!113282)

(declare-fun b_free!31333 () Bool)

(declare-fun b_next!31333 () Bool)

(assert (=> start!113282 (= b_free!31333 (not b_next!31333))))

(declare-fun tp!109805 () Bool)

(declare-fun b_and!50537 () Bool)

(assert (=> start!113282 (= tp!109805 b_and!50537)))

(declare-fun b!1344017 () Bool)

(declare-fun res!891750 () Bool)

(declare-fun e!764944 () Bool)

(assert (=> b!1344017 (=> (not res!891750) (not e!764944))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91453 0))(
  ( (array!91454 (arr!44183 (Array (_ BitVec 32) (_ BitVec 64))) (size!44735 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91453)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344017 (= res!891750 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44735 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344018 () Bool)

(declare-fun e!764945 () Bool)

(declare-fun tp_is_empty!37333 () Bool)

(assert (=> b!1344018 (= e!764945 tp_is_empty!37333)))

(declare-fun mapIsEmpty!57706 () Bool)

(declare-fun mapRes!57706 () Bool)

(assert (=> mapIsEmpty!57706 mapRes!57706))

(declare-fun b!1344019 () Bool)

(declare-fun res!891747 () Bool)

(assert (=> b!1344019 (=> (not res!891747) (not e!764944))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54881 0))(
  ( (V!54882 (val!18741 Int)) )
))
(declare-datatypes ((ValueCell!17768 0))(
  ( (ValueCellFull!17768 (v!21388 V!54881)) (EmptyCell!17768) )
))
(declare-datatypes ((array!91455 0))(
  ( (array!91456 (arr!44184 (Array (_ BitVec 32) ValueCell!17768)) (size!44736 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91455)

(assert (=> b!1344019 (= res!891747 (and (= (size!44736 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44735 _keys!1571) (size!44736 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344020 () Bool)

(declare-fun res!891748 () Bool)

(assert (=> b!1344020 (=> (not res!891748) (not e!764944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91453 (_ BitVec 32)) Bool)

(assert (=> b!1344020 (= res!891748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344021 () Bool)

(assert (=> b!1344021 (= e!764944 false)))

(declare-fun lt!594963 () Bool)

(declare-fun minValue!1245 () V!54881)

(declare-fun zeroValue!1245 () V!54881)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24214 0))(
  ( (tuple2!24215 (_1!12118 (_ BitVec 64)) (_2!12118 V!54881)) )
))
(declare-datatypes ((List!31355 0))(
  ( (Nil!31352) (Cons!31351 (h!32560 tuple2!24214) (t!45871 List!31355)) )
))
(declare-datatypes ((ListLongMap!21871 0))(
  ( (ListLongMap!21872 (toList!10951 List!31355)) )
))
(declare-fun contains!9056 (ListLongMap!21871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5797 (array!91453 array!91455 (_ BitVec 32) (_ BitVec 32) V!54881 V!54881 (_ BitVec 32) Int) ListLongMap!21871)

(assert (=> b!1344021 (= lt!594963 (contains!9056 (getCurrentListMap!5797 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!891751 () Bool)

(assert (=> start!113282 (=> (not res!891751) (not e!764944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113282 (= res!891751 (validMask!0 mask!1977))))

(assert (=> start!113282 e!764944))

(assert (=> start!113282 tp_is_empty!37333))

(assert (=> start!113282 true))

(declare-fun array_inv!33489 (array!91453) Bool)

(assert (=> start!113282 (array_inv!33489 _keys!1571)))

(declare-fun e!764941 () Bool)

(declare-fun array_inv!33490 (array!91455) Bool)

(assert (=> start!113282 (and (array_inv!33490 _values!1303) e!764941)))

(assert (=> start!113282 tp!109805))

(declare-fun b!1344022 () Bool)

(declare-fun e!764942 () Bool)

(assert (=> b!1344022 (= e!764941 (and e!764942 mapRes!57706))))

(declare-fun condMapEmpty!57706 () Bool)

(declare-fun mapDefault!57706 () ValueCell!17768)

(assert (=> b!1344022 (= condMapEmpty!57706 (= (arr!44184 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17768)) mapDefault!57706)))))

(declare-fun b!1344023 () Bool)

(assert (=> b!1344023 (= e!764942 tp_is_empty!37333)))

(declare-fun b!1344024 () Bool)

(declare-fun res!891749 () Bool)

(assert (=> b!1344024 (=> (not res!891749) (not e!764944))))

(declare-datatypes ((List!31356 0))(
  ( (Nil!31353) (Cons!31352 (h!32561 (_ BitVec 64)) (t!45872 List!31356)) )
))
(declare-fun arrayNoDuplicates!0 (array!91453 (_ BitVec 32) List!31356) Bool)

(assert (=> b!1344024 (= res!891749 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31353))))

(declare-fun mapNonEmpty!57706 () Bool)

(declare-fun tp!109804 () Bool)

(assert (=> mapNonEmpty!57706 (= mapRes!57706 (and tp!109804 e!764945))))

(declare-fun mapRest!57706 () (Array (_ BitVec 32) ValueCell!17768))

(declare-fun mapValue!57706 () ValueCell!17768)

(declare-fun mapKey!57706 () (_ BitVec 32))

(assert (=> mapNonEmpty!57706 (= (arr!44184 _values!1303) (store mapRest!57706 mapKey!57706 mapValue!57706))))

(assert (= (and start!113282 res!891751) b!1344019))

(assert (= (and b!1344019 res!891747) b!1344020))

(assert (= (and b!1344020 res!891748) b!1344024))

(assert (= (and b!1344024 res!891749) b!1344017))

(assert (= (and b!1344017 res!891750) b!1344021))

(assert (= (and b!1344022 condMapEmpty!57706) mapIsEmpty!57706))

(assert (= (and b!1344022 (not condMapEmpty!57706)) mapNonEmpty!57706))

(get-info :version)

(assert (= (and mapNonEmpty!57706 ((_ is ValueCellFull!17768) mapValue!57706)) b!1344018))

(assert (= (and b!1344022 ((_ is ValueCellFull!17768) mapDefault!57706)) b!1344023))

(assert (= start!113282 b!1344022))

(declare-fun m!1231291 () Bool)

(assert (=> b!1344021 m!1231291))

(assert (=> b!1344021 m!1231291))

(declare-fun m!1231293 () Bool)

(assert (=> b!1344021 m!1231293))

(declare-fun m!1231295 () Bool)

(assert (=> b!1344020 m!1231295))

(declare-fun m!1231297 () Bool)

(assert (=> b!1344024 m!1231297))

(declare-fun m!1231299 () Bool)

(assert (=> start!113282 m!1231299))

(declare-fun m!1231301 () Bool)

(assert (=> start!113282 m!1231301))

(declare-fun m!1231303 () Bool)

(assert (=> start!113282 m!1231303))

(declare-fun m!1231305 () Bool)

(assert (=> mapNonEmpty!57706 m!1231305))

(check-sat (not b!1344021) (not start!113282) (not b_next!31333) (not b!1344024) (not mapNonEmpty!57706) tp_is_empty!37333 (not b!1344020) b_and!50537)
(check-sat b_and!50537 (not b_next!31333))
