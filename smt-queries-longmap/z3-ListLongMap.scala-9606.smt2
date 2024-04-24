; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113780 () Bool)

(assert start!113780)

(declare-fun b_free!31549 () Bool)

(declare-fun b_next!31549 () Bool)

(assert (=> start!113780 (= b_free!31549 (not b_next!31549))))

(declare-fun tp!110456 () Bool)

(declare-fun b_and!50889 () Bool)

(assert (=> start!113780 (= tp!110456 b_and!50889)))

(declare-fun b!1349372 () Bool)

(declare-fun e!767762 () Bool)

(assert (=> b!1349372 (= e!767762 (not true))))

(declare-datatypes ((V!55169 0))(
  ( (V!55170 (val!18849 Int)) )
))
(declare-datatypes ((tuple2!24354 0))(
  ( (tuple2!24355 (_1!12188 (_ BitVec 64)) (_2!12188 V!55169)) )
))
(declare-datatypes ((List!31491 0))(
  ( (Nil!31488) (Cons!31487 (h!32705 tuple2!24354) (t!46111 List!31491)) )
))
(declare-datatypes ((ListLongMap!22019 0))(
  ( (ListLongMap!22020 (toList!11025 List!31491)) )
))
(declare-fun lt!596391 () ListLongMap!22019)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9214 (ListLongMap!22019 (_ BitVec 64)) Bool)

(assert (=> b!1349372 (contains!9214 lt!596391 k0!1142)))

(declare-datatypes ((array!92039 0))(
  ( (array!92040 (arr!44470 (Array (_ BitVec 32) (_ BitVec 64))) (size!45021 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92039)

(declare-fun lt!596387 () V!55169)

(declare-datatypes ((Unit!44105 0))(
  ( (Unit!44106) )
))
(declare-fun lt!596388 () Unit!44105)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!401 ((_ BitVec 64) (_ BitVec 64) V!55169 ListLongMap!22019) Unit!44105)

(assert (=> b!1349372 (= lt!596388 (lemmaInListMapAfterAddingDiffThenInBefore!401 k0!1142 (select (arr!44470 _keys!1571) from!1960) lt!596387 lt!596391))))

(declare-fun lt!596389 () ListLongMap!22019)

(assert (=> b!1349372 (contains!9214 lt!596389 k0!1142)))

(declare-fun zeroValue!1245 () V!55169)

(declare-fun lt!596390 () Unit!44105)

(assert (=> b!1349372 (= lt!596390 (lemmaInListMapAfterAddingDiffThenInBefore!401 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596389))))

(declare-fun +!4885 (ListLongMap!22019 tuple2!24354) ListLongMap!22019)

(assert (=> b!1349372 (= lt!596389 (+!4885 lt!596391 (tuple2!24355 (select (arr!44470 _keys!1571) from!1960) lt!596387)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17876 0))(
  ( (ValueCellFull!17876 (v!21495 V!55169)) (EmptyCell!17876) )
))
(declare-datatypes ((array!92041 0))(
  ( (array!92042 (arr!44471 (Array (_ BitVec 32) ValueCell!17876)) (size!45022 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92041)

(declare-fun get!22480 (ValueCell!17876 V!55169) V!55169)

(declare-fun dynLambda!3839 (Int (_ BitVec 64)) V!55169)

(assert (=> b!1349372 (= lt!596387 (get!22480 (select (arr!44471 _values!1303) from!1960) (dynLambda!3839 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!55169)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6538 (array!92039 array!92041 (_ BitVec 32) (_ BitVec 32) V!55169 V!55169 (_ BitVec 32) Int) ListLongMap!22019)

(assert (=> b!1349372 (= lt!596391 (getCurrentListMapNoExtraKeys!6538 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1349373 () Bool)

(declare-fun res!894985 () Bool)

(assert (=> b!1349373 (=> (not res!894985) (not e!767762))))

(declare-datatypes ((List!31492 0))(
  ( (Nil!31489) (Cons!31488 (h!32706 (_ BitVec 64)) (t!46112 List!31492)) )
))
(declare-fun arrayNoDuplicates!0 (array!92039 (_ BitVec 32) List!31492) Bool)

(assert (=> b!1349373 (= res!894985 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31489))))

(declare-fun b!1349374 () Bool)

(declare-fun e!767764 () Bool)

(declare-fun tp_is_empty!37549 () Bool)

(assert (=> b!1349374 (= e!767764 tp_is_empty!37549)))

(declare-fun b!1349375 () Bool)

(declare-fun res!894986 () Bool)

(assert (=> b!1349375 (=> (not res!894986) (not e!767762))))

(assert (=> b!1349375 (= res!894986 (and (= (size!45022 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45021 _keys!1571) (size!45022 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349376 () Bool)

(declare-fun e!767763 () Bool)

(declare-fun mapRes!58034 () Bool)

(assert (=> b!1349376 (= e!767763 (and e!767764 mapRes!58034))))

(declare-fun condMapEmpty!58034 () Bool)

(declare-fun mapDefault!58034 () ValueCell!17876)

(assert (=> b!1349376 (= condMapEmpty!58034 (= (arr!44471 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17876)) mapDefault!58034)))))

(declare-fun res!894989 () Bool)

(assert (=> start!113780 (=> (not res!894989) (not e!767762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113780 (= res!894989 (validMask!0 mask!1977))))

(assert (=> start!113780 e!767762))

(assert (=> start!113780 tp_is_empty!37549))

(assert (=> start!113780 true))

(declare-fun array_inv!33761 (array!92039) Bool)

(assert (=> start!113780 (array_inv!33761 _keys!1571)))

(declare-fun array_inv!33762 (array!92041) Bool)

(assert (=> start!113780 (and (array_inv!33762 _values!1303) e!767763)))

(assert (=> start!113780 tp!110456))

(declare-fun b!1349377 () Bool)

(declare-fun res!894984 () Bool)

(assert (=> b!1349377 (=> (not res!894984) (not e!767762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92039 (_ BitVec 32)) Bool)

(assert (=> b!1349377 (= res!894984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349378 () Bool)

(declare-fun res!894983 () Bool)

(assert (=> b!1349378 (=> (not res!894983) (not e!767762))))

(assert (=> b!1349378 (= res!894983 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349379 () Bool)

(declare-fun res!894988 () Bool)

(assert (=> b!1349379 (=> (not res!894988) (not e!767762))))

(assert (=> b!1349379 (= res!894988 (not (= (select (arr!44470 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!58034 () Bool)

(assert (=> mapIsEmpty!58034 mapRes!58034))

(declare-fun b!1349380 () Bool)

(declare-fun res!894987 () Bool)

(assert (=> b!1349380 (=> (not res!894987) (not e!767762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349380 (= res!894987 (validKeyInArray!0 (select (arr!44470 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!58034 () Bool)

(declare-fun tp!110455 () Bool)

(declare-fun e!767761 () Bool)

(assert (=> mapNonEmpty!58034 (= mapRes!58034 (and tp!110455 e!767761))))

(declare-fun mapRest!58034 () (Array (_ BitVec 32) ValueCell!17876))

(declare-fun mapValue!58034 () ValueCell!17876)

(declare-fun mapKey!58034 () (_ BitVec 32))

(assert (=> mapNonEmpty!58034 (= (arr!44471 _values!1303) (store mapRest!58034 mapKey!58034 mapValue!58034))))

(declare-fun b!1349381 () Bool)

(assert (=> b!1349381 (= e!767761 tp_is_empty!37549)))

(declare-fun b!1349382 () Bool)

(declare-fun res!894991 () Bool)

(assert (=> b!1349382 (=> (not res!894991) (not e!767762))))

(assert (=> b!1349382 (= res!894991 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45021 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349383 () Bool)

(declare-fun res!894990 () Bool)

(assert (=> b!1349383 (=> (not res!894990) (not e!767762))))

(declare-fun getCurrentListMap!5963 (array!92039 array!92041 (_ BitVec 32) (_ BitVec 32) V!55169 V!55169 (_ BitVec 32) Int) ListLongMap!22019)

(assert (=> b!1349383 (= res!894990 (contains!9214 (getCurrentListMap!5963 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113780 res!894989) b!1349375))

(assert (= (and b!1349375 res!894986) b!1349377))

(assert (= (and b!1349377 res!894984) b!1349373))

(assert (= (and b!1349373 res!894985) b!1349382))

(assert (= (and b!1349382 res!894991) b!1349383))

(assert (= (and b!1349383 res!894990) b!1349379))

(assert (= (and b!1349379 res!894988) b!1349380))

(assert (= (and b!1349380 res!894987) b!1349378))

(assert (= (and b!1349378 res!894983) b!1349372))

(assert (= (and b!1349376 condMapEmpty!58034) mapIsEmpty!58034))

(assert (= (and b!1349376 (not condMapEmpty!58034)) mapNonEmpty!58034))

(get-info :version)

(assert (= (and mapNonEmpty!58034 ((_ is ValueCellFull!17876) mapValue!58034)) b!1349381))

(assert (= (and b!1349376 ((_ is ValueCellFull!17876) mapDefault!58034)) b!1349374))

(assert (= start!113780 b!1349376))

(declare-fun b_lambda!24617 () Bool)

(assert (=> (not b_lambda!24617) (not b!1349372)))

(declare-fun t!46110 () Bool)

(declare-fun tb!12423 () Bool)

(assert (=> (and start!113780 (= defaultEntry!1306 defaultEntry!1306) t!46110) tb!12423))

(declare-fun result!25947 () Bool)

(assert (=> tb!12423 (= result!25947 tp_is_empty!37549)))

(assert (=> b!1349372 t!46110))

(declare-fun b_and!50891 () Bool)

(assert (= b_and!50889 (and (=> t!46110 result!25947) b_and!50891)))

(declare-fun m!1236691 () Bool)

(assert (=> b!1349383 m!1236691))

(assert (=> b!1349383 m!1236691))

(declare-fun m!1236693 () Bool)

(assert (=> b!1349383 m!1236693))

(declare-fun m!1236695 () Bool)

(assert (=> b!1349377 m!1236695))

(declare-fun m!1236697 () Bool)

(assert (=> mapNonEmpty!58034 m!1236697))

(declare-fun m!1236699 () Bool)

(assert (=> b!1349373 m!1236699))

(declare-fun m!1236701 () Bool)

(assert (=> b!1349379 m!1236701))

(declare-fun m!1236703 () Bool)

(assert (=> start!113780 m!1236703))

(declare-fun m!1236705 () Bool)

(assert (=> start!113780 m!1236705))

(declare-fun m!1236707 () Bool)

(assert (=> start!113780 m!1236707))

(assert (=> b!1349380 m!1236701))

(assert (=> b!1349380 m!1236701))

(declare-fun m!1236709 () Bool)

(assert (=> b!1349380 m!1236709))

(declare-fun m!1236711 () Bool)

(assert (=> b!1349372 m!1236711))

(declare-fun m!1236713 () Bool)

(assert (=> b!1349372 m!1236713))

(declare-fun m!1236715 () Bool)

(assert (=> b!1349372 m!1236715))

(declare-fun m!1236717 () Bool)

(assert (=> b!1349372 m!1236717))

(declare-fun m!1236719 () Bool)

(assert (=> b!1349372 m!1236719))

(assert (=> b!1349372 m!1236717))

(assert (=> b!1349372 m!1236701))

(declare-fun m!1236721 () Bool)

(assert (=> b!1349372 m!1236721))

(assert (=> b!1349372 m!1236715))

(declare-fun m!1236723 () Bool)

(assert (=> b!1349372 m!1236723))

(assert (=> b!1349372 m!1236701))

(declare-fun m!1236725 () Bool)

(assert (=> b!1349372 m!1236725))

(declare-fun m!1236727 () Bool)

(assert (=> b!1349372 m!1236727))

(check-sat (not b_next!31549) (not b!1349372) (not b!1349377) (not b!1349380) tp_is_empty!37549 (not start!113780) (not b_lambda!24617) (not mapNonEmpty!58034) (not b!1349383) (not b!1349373) b_and!50891)
(check-sat b_and!50891 (not b_next!31549))
