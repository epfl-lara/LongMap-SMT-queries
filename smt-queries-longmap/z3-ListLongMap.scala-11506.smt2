; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133870 () Bool)

(assert start!133870)

(declare-fun b_free!32143 () Bool)

(declare-fun b_next!32143 () Bool)

(assert (=> start!133870 (= b_free!32143 (not b_next!32143))))

(declare-fun tp!113732 () Bool)

(declare-fun b_and!51709 () Bool)

(assert (=> start!133870 (= tp!113732 b_and!51709)))

(declare-fun b!1565121 () Bool)

(declare-fun res!1069972 () Bool)

(declare-fun e!872366 () Bool)

(assert (=> b!1565121 (=> (not res!1069972) (not e!872366))))

(declare-datatypes ((array!104454 0))(
  ( (array!104455 (arr!50415 (Array (_ BitVec 32) (_ BitVec 64))) (size!50967 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104454)

(declare-datatypes ((List!36647 0))(
  ( (Nil!36644) (Cons!36643 (h!38090 (_ BitVec 64)) (t!51496 List!36647)) )
))
(declare-fun arrayNoDuplicates!0 (array!104454 (_ BitVec 32) List!36647) Bool)

(assert (=> b!1565121 (= res!1069972 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36644))))

(declare-fun mapIsEmpty!59767 () Bool)

(declare-fun mapRes!59767 () Bool)

(assert (=> mapIsEmpty!59767 mapRes!59767))

(declare-fun b!1565122 () Bool)

(declare-fun res!1069970 () Bool)

(assert (=> b!1565122 (=> (not res!1069970) (not e!872366))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104454 (_ BitVec 32)) Bool)

(assert (=> b!1565122 (= res!1069970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565123 () Bool)

(declare-fun e!872364 () Bool)

(declare-fun e!872367 () Bool)

(assert (=> b!1565123 (= e!872364 (and e!872367 mapRes!59767))))

(declare-fun condMapEmpty!59767 () Bool)

(declare-datatypes ((V!60097 0))(
  ( (V!60098 (val!19542 Int)) )
))
(declare-datatypes ((ValueCell!18428 0))(
  ( (ValueCellFull!18428 (v!22294 V!60097)) (EmptyCell!18428) )
))
(declare-datatypes ((array!104456 0))(
  ( (array!104457 (arr!50416 (Array (_ BitVec 32) ValueCell!18428)) (size!50968 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104456)

(declare-fun mapDefault!59767 () ValueCell!18428)

(assert (=> b!1565123 (= condMapEmpty!59767 (= (arr!50416 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18428)) mapDefault!59767)))))

(declare-fun b!1565125 () Bool)

(assert (=> b!1565125 (= e!872366 (not true))))

(declare-datatypes ((tuple2!25286 0))(
  ( (tuple2!25287 (_1!12654 (_ BitVec 64)) (_2!12654 V!60097)) )
))
(declare-datatypes ((List!36648 0))(
  ( (Nil!36645) (Cons!36644 (h!38091 tuple2!25286) (t!51497 List!36648)) )
))
(declare-datatypes ((ListLongMap!22721 0))(
  ( (ListLongMap!22722 (toList!11376 List!36648)) )
))
(declare-fun lt!671983 () ListLongMap!22721)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671982 () V!60097)

(declare-fun contains!10289 (ListLongMap!22721 (_ BitVec 64)) Bool)

(declare-fun +!5097 (ListLongMap!22721 tuple2!25286) ListLongMap!22721)

(assert (=> b!1565125 (not (contains!10289 (+!5097 lt!671983 (tuple2!25287 (select (arr!50415 _keys!637) from!782) lt!671982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51812 0))(
  ( (Unit!51813) )
))
(declare-fun lt!671981 () Unit!51812)

(declare-fun addStillNotContains!544 (ListLongMap!22721 (_ BitVec 64) V!60097 (_ BitVec 64)) Unit!51812)

(assert (=> b!1565125 (= lt!671981 (addStillNotContains!544 lt!671983 (select (arr!50415 _keys!637) from!782) lt!671982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26328 (ValueCell!18428 V!60097) V!60097)

(declare-fun dynLambda!3873 (Int (_ BitVec 64)) V!60097)

(assert (=> b!1565125 (= lt!671982 (get!26328 (select (arr!50416 _values!487) from!782) (dynLambda!3873 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60097)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60097)

(declare-fun getCurrentListMapNoExtraKeys!6728 (array!104454 array!104456 (_ BitVec 32) (_ BitVec 32) V!60097 V!60097 (_ BitVec 32) Int) ListLongMap!22721)

(assert (=> b!1565125 (= lt!671983 (getCurrentListMapNoExtraKeys!6728 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565126 () Bool)

(declare-fun res!1069971 () Bool)

(assert (=> b!1565126 (=> (not res!1069971) (not e!872366))))

(assert (=> b!1565126 (= res!1069971 (and (= (size!50968 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50967 _keys!637) (size!50968 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565127 () Bool)

(declare-fun res!1069969 () Bool)

(assert (=> b!1565127 (=> (not res!1069969) (not e!872366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565127 (= res!1069969 (validKeyInArray!0 (select (arr!50415 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59767 () Bool)

(declare-fun tp!113731 () Bool)

(declare-fun e!872368 () Bool)

(assert (=> mapNonEmpty!59767 (= mapRes!59767 (and tp!113731 e!872368))))

(declare-fun mapValue!59767 () ValueCell!18428)

(declare-fun mapRest!59767 () (Array (_ BitVec 32) ValueCell!18428))

(declare-fun mapKey!59767 () (_ BitVec 32))

(assert (=> mapNonEmpty!59767 (= (arr!50416 _values!487) (store mapRest!59767 mapKey!59767 mapValue!59767))))

(declare-fun b!1565128 () Bool)

(declare-fun tp_is_empty!38917 () Bool)

(assert (=> b!1565128 (= e!872367 tp_is_empty!38917)))

(declare-fun b!1565129 () Bool)

(assert (=> b!1565129 (= e!872368 tp_is_empty!38917)))

(declare-fun res!1069967 () Bool)

(assert (=> start!133870 (=> (not res!1069967) (not e!872366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133870 (= res!1069967 (validMask!0 mask!947))))

(assert (=> start!133870 e!872366))

(assert (=> start!133870 tp!113732))

(assert (=> start!133870 tp_is_empty!38917))

(assert (=> start!133870 true))

(declare-fun array_inv!39379 (array!104454) Bool)

(assert (=> start!133870 (array_inv!39379 _keys!637)))

(declare-fun array_inv!39380 (array!104456) Bool)

(assert (=> start!133870 (and (array_inv!39380 _values!487) e!872364)))

(declare-fun b!1565124 () Bool)

(declare-fun res!1069968 () Bool)

(assert (=> b!1565124 (=> (not res!1069968) (not e!872366))))

(assert (=> b!1565124 (= res!1069968 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50967 _keys!637)) (bvslt from!782 (size!50967 _keys!637))))))

(assert (= (and start!133870 res!1069967) b!1565126))

(assert (= (and b!1565126 res!1069971) b!1565122))

(assert (= (and b!1565122 res!1069970) b!1565121))

(assert (= (and b!1565121 res!1069972) b!1565124))

(assert (= (and b!1565124 res!1069968) b!1565127))

(assert (= (and b!1565127 res!1069969) b!1565125))

(assert (= (and b!1565123 condMapEmpty!59767) mapIsEmpty!59767))

(assert (= (and b!1565123 (not condMapEmpty!59767)) mapNonEmpty!59767))

(get-info :version)

(assert (= (and mapNonEmpty!59767 ((_ is ValueCellFull!18428) mapValue!59767)) b!1565129))

(assert (= (and b!1565123 ((_ is ValueCellFull!18428) mapDefault!59767)) b!1565128))

(assert (= start!133870 b!1565123))

(declare-fun b_lambda!24947 () Bool)

(assert (=> (not b_lambda!24947) (not b!1565125)))

(declare-fun t!51495 () Bool)

(declare-fun tb!12603 () Bool)

(assert (=> (and start!133870 (= defaultEntry!495 defaultEntry!495) t!51495) tb!12603))

(declare-fun result!26505 () Bool)

(assert (=> tb!12603 (= result!26505 tp_is_empty!38917)))

(assert (=> b!1565125 t!51495))

(declare-fun b_and!51711 () Bool)

(assert (= b_and!51709 (and (=> t!51495 result!26505) b_and!51711)))

(declare-fun m!1439443 () Bool)

(assert (=> b!1565122 m!1439443))

(declare-fun m!1439445 () Bool)

(assert (=> b!1565125 m!1439445))

(declare-fun m!1439447 () Bool)

(assert (=> b!1565125 m!1439447))

(declare-fun m!1439449 () Bool)

(assert (=> b!1565125 m!1439449))

(declare-fun m!1439451 () Bool)

(assert (=> b!1565125 m!1439451))

(declare-fun m!1439453 () Bool)

(assert (=> b!1565125 m!1439453))

(declare-fun m!1439455 () Bool)

(assert (=> b!1565125 m!1439455))

(assert (=> b!1565125 m!1439451))

(declare-fun m!1439457 () Bool)

(assert (=> b!1565125 m!1439457))

(assert (=> b!1565125 m!1439445))

(assert (=> b!1565125 m!1439453))

(assert (=> b!1565125 m!1439447))

(declare-fun m!1439459 () Bool)

(assert (=> b!1565125 m!1439459))

(assert (=> b!1565127 m!1439453))

(assert (=> b!1565127 m!1439453))

(declare-fun m!1439461 () Bool)

(assert (=> b!1565127 m!1439461))

(declare-fun m!1439463 () Bool)

(assert (=> start!133870 m!1439463))

(declare-fun m!1439465 () Bool)

(assert (=> start!133870 m!1439465))

(declare-fun m!1439467 () Bool)

(assert (=> start!133870 m!1439467))

(declare-fun m!1439469 () Bool)

(assert (=> b!1565121 m!1439469))

(declare-fun m!1439471 () Bool)

(assert (=> mapNonEmpty!59767 m!1439471))

(check-sat (not b!1565121) (not b!1565127) tp_is_empty!38917 (not start!133870) (not b_lambda!24947) (not b!1565125) (not b!1565122) (not b_next!32143) b_and!51711 (not mapNonEmpty!59767))
(check-sat b_and!51711 (not b_next!32143))
