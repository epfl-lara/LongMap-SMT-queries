; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113556 () Bool)

(assert start!113556)

(declare-fun b_free!31549 () Bool)

(declare-fun b_next!31549 () Bool)

(assert (=> start!113556 (= b_free!31549 (not b_next!31549))))

(declare-fun tp!110457 () Bool)

(declare-fun b_and!50869 () Bool)

(assert (=> start!113556 (= tp!110457 b_and!50869)))

(declare-fun b!1348003 () Bool)

(declare-fun res!894441 () Bool)

(declare-fun e!766886 () Bool)

(assert (=> b!1348003 (=> (not res!894441) (not e!766886))))

(declare-datatypes ((array!91875 0))(
  ( (array!91876 (arr!44393 (Array (_ BitVec 32) (_ BitVec 64))) (size!44945 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91875)

(declare-datatypes ((List!31511 0))(
  ( (Nil!31508) (Cons!31507 (h!32716 (_ BitVec 64)) (t!46131 List!31511)) )
))
(declare-fun arrayNoDuplicates!0 (array!91875 (_ BitVec 32) List!31511) Bool)

(assert (=> b!1348003 (= res!894441 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31508))))

(declare-fun b!1348004 () Bool)

(assert (=> b!1348004 (= e!766886 (not true))))

(declare-datatypes ((V!55169 0))(
  ( (V!55170 (val!18849 Int)) )
))
(declare-datatypes ((tuple2!24378 0))(
  ( (tuple2!24379 (_1!12200 (_ BitVec 64)) (_2!12200 V!55169)) )
))
(declare-datatypes ((List!31512 0))(
  ( (Nil!31509) (Cons!31508 (h!32717 tuple2!24378) (t!46132 List!31512)) )
))
(declare-datatypes ((ListLongMap!22035 0))(
  ( (ListLongMap!22036 (toList!11033 List!31512)) )
))
(declare-fun lt!595726 () ListLongMap!22035)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9138 (ListLongMap!22035 (_ BitVec 64)) Bool)

(assert (=> b!1348004 (contains!9138 lt!595726 k0!1142)))

(declare-fun lt!595725 () V!55169)

(declare-datatypes ((Unit!44005 0))(
  ( (Unit!44006) )
))
(declare-fun lt!595727 () Unit!44005)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!413 ((_ BitVec 64) (_ BitVec 64) V!55169 ListLongMap!22035) Unit!44005)

(assert (=> b!1348004 (= lt!595727 (lemmaInListMapAfterAddingDiffThenInBefore!413 k0!1142 (select (arr!44393 _keys!1571) from!1960) lt!595725 lt!595726))))

(declare-fun lt!595728 () ListLongMap!22035)

(assert (=> b!1348004 (contains!9138 lt!595728 k0!1142)))

(declare-fun lt!595729 () Unit!44005)

(declare-fun zeroValue!1245 () V!55169)

(assert (=> b!1348004 (= lt!595729 (lemmaInListMapAfterAddingDiffThenInBefore!413 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595728))))

(declare-fun +!4880 (ListLongMap!22035 tuple2!24378) ListLongMap!22035)

(assert (=> b!1348004 (= lt!595728 (+!4880 lt!595726 (tuple2!24379 (select (arr!44393 _keys!1571) from!1960) lt!595725)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17876 0))(
  ( (ValueCellFull!17876 (v!21499 V!55169)) (EmptyCell!17876) )
))
(declare-datatypes ((array!91877 0))(
  ( (array!91878 (arr!44394 (Array (_ BitVec 32) ValueCell!17876)) (size!44946 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91877)

(declare-fun get!22439 (ValueCell!17876 V!55169) V!55169)

(declare-fun dynLambda!3810 (Int (_ BitVec 64)) V!55169)

(assert (=> b!1348004 (= lt!595725 (get!22439 (select (arr!44394 _values!1303) from!1960) (dynLambda!3810 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!55169)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6528 (array!91875 array!91877 (_ BitVec 32) (_ BitVec 32) V!55169 V!55169 (_ BitVec 32) Int) ListLongMap!22035)

(assert (=> b!1348004 (= lt!595726 (getCurrentListMapNoExtraKeys!6528 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapIsEmpty!58034 () Bool)

(declare-fun mapRes!58034 () Bool)

(assert (=> mapIsEmpty!58034 mapRes!58034))

(declare-fun b!1348005 () Bool)

(declare-fun res!894442 () Bool)

(assert (=> b!1348005 (=> (not res!894442) (not e!766886))))

(assert (=> b!1348005 (= res!894442 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!894444 () Bool)

(assert (=> start!113556 (=> (not res!894444) (not e!766886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113556 (= res!894444 (validMask!0 mask!1977))))

(assert (=> start!113556 e!766886))

(declare-fun tp_is_empty!37549 () Bool)

(assert (=> start!113556 tp_is_empty!37549))

(assert (=> start!113556 true))

(declare-fun array_inv!33641 (array!91875) Bool)

(assert (=> start!113556 (array_inv!33641 _keys!1571)))

(declare-fun e!766885 () Bool)

(declare-fun array_inv!33642 (array!91877) Bool)

(assert (=> start!113556 (and (array_inv!33642 _values!1303) e!766885)))

(assert (=> start!113556 tp!110457))

(declare-fun b!1348006 () Bool)

(declare-fun res!894436 () Bool)

(assert (=> b!1348006 (=> (not res!894436) (not e!766886))))

(assert (=> b!1348006 (= res!894436 (and (= (size!44946 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44945 _keys!1571) (size!44946 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348007 () Bool)

(declare-fun res!894438 () Bool)

(assert (=> b!1348007 (=> (not res!894438) (not e!766886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91875 (_ BitVec 32)) Bool)

(assert (=> b!1348007 (= res!894438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!58034 () Bool)

(declare-fun tp!110456 () Bool)

(declare-fun e!766889 () Bool)

(assert (=> mapNonEmpty!58034 (= mapRes!58034 (and tp!110456 e!766889))))

(declare-fun mapKey!58034 () (_ BitVec 32))

(declare-fun mapValue!58034 () ValueCell!17876)

(declare-fun mapRest!58034 () (Array (_ BitVec 32) ValueCell!17876))

(assert (=> mapNonEmpty!58034 (= (arr!44394 _values!1303) (store mapRest!58034 mapKey!58034 mapValue!58034))))

(declare-fun b!1348008 () Bool)

(declare-fun res!894437 () Bool)

(assert (=> b!1348008 (=> (not res!894437) (not e!766886))))

(assert (=> b!1348008 (= res!894437 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44945 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348009 () Bool)

(declare-fun e!766887 () Bool)

(assert (=> b!1348009 (= e!766885 (and e!766887 mapRes!58034))))

(declare-fun condMapEmpty!58034 () Bool)

(declare-fun mapDefault!58034 () ValueCell!17876)

(assert (=> b!1348009 (= condMapEmpty!58034 (= (arr!44394 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17876)) mapDefault!58034)))))

(declare-fun b!1348010 () Bool)

(declare-fun res!894439 () Bool)

(assert (=> b!1348010 (=> (not res!894439) (not e!766886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348010 (= res!894439 (validKeyInArray!0 (select (arr!44393 _keys!1571) from!1960)))))

(declare-fun b!1348011 () Bool)

(assert (=> b!1348011 (= e!766889 tp_is_empty!37549)))

(declare-fun b!1348012 () Bool)

(declare-fun res!894440 () Bool)

(assert (=> b!1348012 (=> (not res!894440) (not e!766886))))

(assert (=> b!1348012 (= res!894440 (not (= (select (arr!44393 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348013 () Bool)

(assert (=> b!1348013 (= e!766887 tp_is_empty!37549)))

(declare-fun b!1348014 () Bool)

(declare-fun res!894443 () Bool)

(assert (=> b!1348014 (=> (not res!894443) (not e!766886))))

(declare-fun getCurrentListMap!5865 (array!91875 array!91877 (_ BitVec 32) (_ BitVec 32) V!55169 V!55169 (_ BitVec 32) Int) ListLongMap!22035)

(assert (=> b!1348014 (= res!894443 (contains!9138 (getCurrentListMap!5865 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113556 res!894444) b!1348006))

(assert (= (and b!1348006 res!894436) b!1348007))

(assert (= (and b!1348007 res!894438) b!1348003))

(assert (= (and b!1348003 res!894441) b!1348008))

(assert (= (and b!1348008 res!894437) b!1348014))

(assert (= (and b!1348014 res!894443) b!1348012))

(assert (= (and b!1348012 res!894440) b!1348010))

(assert (= (and b!1348010 res!894439) b!1348005))

(assert (= (and b!1348005 res!894442) b!1348004))

(assert (= (and b!1348009 condMapEmpty!58034) mapIsEmpty!58034))

(assert (= (and b!1348009 (not condMapEmpty!58034)) mapNonEmpty!58034))

(get-info :version)

(assert (= (and mapNonEmpty!58034 ((_ is ValueCellFull!17876) mapValue!58034)) b!1348011))

(assert (= (and b!1348009 ((_ is ValueCellFull!17876) mapDefault!58034)) b!1348013))

(assert (= start!113556 b!1348009))

(declare-fun b_lambda!24613 () Bool)

(assert (=> (not b_lambda!24613) (not b!1348004)))

(declare-fun t!46130 () Bool)

(declare-fun tb!12423 () Bool)

(assert (=> (and start!113556 (= defaultEntry!1306 defaultEntry!1306) t!46130) tb!12423))

(declare-fun result!25947 () Bool)

(assert (=> tb!12423 (= result!25947 tp_is_empty!37549)))

(assert (=> b!1348004 t!46130))

(declare-fun b_and!50871 () Bool)

(assert (= b_and!50869 (and (=> t!46130 result!25947) b_and!50871)))

(declare-fun m!1234577 () Bool)

(assert (=> b!1348012 m!1234577))

(assert (=> b!1348010 m!1234577))

(assert (=> b!1348010 m!1234577))

(declare-fun m!1234579 () Bool)

(assert (=> b!1348010 m!1234579))

(declare-fun m!1234581 () Bool)

(assert (=> start!113556 m!1234581))

(declare-fun m!1234583 () Bool)

(assert (=> start!113556 m!1234583))

(declare-fun m!1234585 () Bool)

(assert (=> start!113556 m!1234585))

(declare-fun m!1234587 () Bool)

(assert (=> b!1348003 m!1234587))

(declare-fun m!1234589 () Bool)

(assert (=> b!1348007 m!1234589))

(declare-fun m!1234591 () Bool)

(assert (=> b!1348004 m!1234591))

(declare-fun m!1234593 () Bool)

(assert (=> b!1348004 m!1234593))

(declare-fun m!1234595 () Bool)

(assert (=> b!1348004 m!1234595))

(declare-fun m!1234597 () Bool)

(assert (=> b!1348004 m!1234597))

(declare-fun m!1234599 () Bool)

(assert (=> b!1348004 m!1234599))

(declare-fun m!1234601 () Bool)

(assert (=> b!1348004 m!1234601))

(assert (=> b!1348004 m!1234595))

(assert (=> b!1348004 m!1234597))

(assert (=> b!1348004 m!1234577))

(declare-fun m!1234603 () Bool)

(assert (=> b!1348004 m!1234603))

(assert (=> b!1348004 m!1234577))

(declare-fun m!1234605 () Bool)

(assert (=> b!1348004 m!1234605))

(declare-fun m!1234607 () Bool)

(assert (=> b!1348004 m!1234607))

(declare-fun m!1234609 () Bool)

(assert (=> mapNonEmpty!58034 m!1234609))

(declare-fun m!1234611 () Bool)

(assert (=> b!1348014 m!1234611))

(assert (=> b!1348014 m!1234611))

(declare-fun m!1234613 () Bool)

(assert (=> b!1348014 m!1234613))

(check-sat (not mapNonEmpty!58034) (not b_next!31549) (not start!113556) (not b!1348010) (not b!1348004) (not b!1348003) (not b!1348007) b_and!50871 (not b_lambda!24613) (not b!1348014) tp_is_empty!37549)
(check-sat b_and!50871 (not b_next!31549))
