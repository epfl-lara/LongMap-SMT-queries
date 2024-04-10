; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112586 () Bool)

(assert start!112586)

(declare-fun b_free!30981 () Bool)

(declare-fun b_next!30981 () Bool)

(assert (=> start!112586 (= b_free!30981 (not b_next!30981))))

(declare-fun tp!108579 () Bool)

(declare-fun b_and!49889 () Bool)

(assert (=> start!112586 (= tp!108579 b_and!49889)))

(declare-fun b!1335569 () Bool)

(declare-fun res!886402 () Bool)

(declare-fun e!760641 () Bool)

(assert (=> b!1335569 (=> (not res!886402) (not e!760641))))

(declare-datatypes ((array!90640 0))(
  ( (array!90641 (arr!43786 (Array (_ BitVec 32) (_ BitVec 64))) (size!44336 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90640)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335569 (= res!886402 (validKeyInArray!0 (select (arr!43786 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!57010 () Bool)

(declare-fun mapRes!57010 () Bool)

(declare-fun tp!108580 () Bool)

(declare-fun e!760639 () Bool)

(assert (=> mapNonEmpty!57010 (= mapRes!57010 (and tp!108580 e!760639))))

(declare-datatypes ((V!54291 0))(
  ( (V!54292 (val!18520 Int)) )
))
(declare-datatypes ((ValueCell!17547 0))(
  ( (ValueCellFull!17547 (v!21157 V!54291)) (EmptyCell!17547) )
))
(declare-datatypes ((array!90642 0))(
  ( (array!90643 (arr!43787 (Array (_ BitVec 32) ValueCell!17547)) (size!44337 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90642)

(declare-fun mapRest!57010 () (Array (_ BitVec 32) ValueCell!17547))

(declare-fun mapValue!57010 () ValueCell!17547)

(declare-fun mapKey!57010 () (_ BitVec 32))

(assert (=> mapNonEmpty!57010 (= (arr!43787 _values!1320) (store mapRest!57010 mapKey!57010 mapValue!57010))))

(declare-fun b!1335570 () Bool)

(declare-fun e!760638 () Bool)

(declare-fun e!760642 () Bool)

(assert (=> b!1335570 (= e!760638 (and e!760642 mapRes!57010))))

(declare-fun condMapEmpty!57010 () Bool)

(declare-fun mapDefault!57010 () ValueCell!17547)

(assert (=> b!1335570 (= condMapEmpty!57010 (= (arr!43787 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17547)) mapDefault!57010)))))

(declare-fun b!1335572 () Bool)

(declare-fun res!886403 () Bool)

(assert (=> b!1335572 (=> (not res!886403) (not e!760641))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90640 (_ BitVec 32)) Bool)

(assert (=> b!1335572 (= res!886403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335573 () Bool)

(declare-fun tp_is_empty!36891 () Bool)

(assert (=> b!1335573 (= e!760642 tp_is_empty!36891)))

(declare-fun b!1335574 () Bool)

(declare-fun res!886400 () Bool)

(assert (=> b!1335574 (=> (not res!886400) (not e!760641))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335574 (= res!886400 (not (= (select (arr!43786 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335575 () Bool)

(declare-fun res!886398 () Bool)

(assert (=> b!1335575 (=> (not res!886398) (not e!760641))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54291)

(declare-fun zeroValue!1262 () V!54291)

(declare-datatypes ((tuple2!23882 0))(
  ( (tuple2!23883 (_1!11952 (_ BitVec 64)) (_2!11952 V!54291)) )
))
(declare-datatypes ((List!31023 0))(
  ( (Nil!31020) (Cons!31019 (h!32228 tuple2!23882) (t!45287 List!31023)) )
))
(declare-datatypes ((ListLongMap!21539 0))(
  ( (ListLongMap!21540 (toList!10785 List!31023)) )
))
(declare-fun contains!8948 (ListLongMap!21539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5758 (array!90640 array!90642 (_ BitVec 32) (_ BitVec 32) V!54291 V!54291 (_ BitVec 32) Int) ListLongMap!21539)

(assert (=> b!1335575 (= res!886398 (contains!8948 (getCurrentListMap!5758 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335576 () Bool)

(declare-fun res!886396 () Bool)

(assert (=> b!1335576 (=> (not res!886396) (not e!760641))))

(assert (=> b!1335576 (= res!886396 (and (= (size!44337 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44336 _keys!1590) (size!44337 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335577 () Bool)

(declare-fun res!886397 () Bool)

(assert (=> b!1335577 (=> (not res!886397) (not e!760641))))

(assert (=> b!1335577 (= res!886397 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44336 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335578 () Bool)

(assert (=> b!1335578 (= e!760639 tp_is_empty!36891)))

(declare-fun b!1335579 () Bool)

(declare-fun res!886404 () Bool)

(assert (=> b!1335579 (=> (not res!886404) (not e!760641))))

(assert (=> b!1335579 (= res!886404 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57010 () Bool)

(assert (=> mapIsEmpty!57010 mapRes!57010))

(declare-fun b!1335580 () Bool)

(assert (=> b!1335580 (= e!760641 (bvsge from!1980 (size!44337 _values!1320)))))

(declare-fun lt!592468 () ListLongMap!21539)

(declare-fun getCurrentListMapNoExtraKeys!6371 (array!90640 array!90642 (_ BitVec 32) (_ BitVec 32) V!54291 V!54291 (_ BitVec 32) Int) ListLongMap!21539)

(assert (=> b!1335580 (= lt!592468 (getCurrentListMapNoExtraKeys!6371 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!886399 () Bool)

(assert (=> start!112586 (=> (not res!886399) (not e!760641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112586 (= res!886399 (validMask!0 mask!1998))))

(assert (=> start!112586 e!760641))

(declare-fun array_inv!33021 (array!90642) Bool)

(assert (=> start!112586 (and (array_inv!33021 _values!1320) e!760638)))

(assert (=> start!112586 true))

(declare-fun array_inv!33022 (array!90640) Bool)

(assert (=> start!112586 (array_inv!33022 _keys!1590)))

(assert (=> start!112586 tp!108579))

(assert (=> start!112586 tp_is_empty!36891))

(declare-fun b!1335571 () Bool)

(declare-fun res!886401 () Bool)

(assert (=> b!1335571 (=> (not res!886401) (not e!760641))))

(declare-datatypes ((List!31024 0))(
  ( (Nil!31021) (Cons!31020 (h!32229 (_ BitVec 64)) (t!45288 List!31024)) )
))
(declare-fun arrayNoDuplicates!0 (array!90640 (_ BitVec 32) List!31024) Bool)

(assert (=> b!1335571 (= res!886401 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31021))))

(assert (= (and start!112586 res!886399) b!1335576))

(assert (= (and b!1335576 res!886396) b!1335572))

(assert (= (and b!1335572 res!886403) b!1335571))

(assert (= (and b!1335571 res!886401) b!1335577))

(assert (= (and b!1335577 res!886397) b!1335575))

(assert (= (and b!1335575 res!886398) b!1335574))

(assert (= (and b!1335574 res!886400) b!1335569))

(assert (= (and b!1335569 res!886402) b!1335579))

(assert (= (and b!1335579 res!886404) b!1335580))

(assert (= (and b!1335570 condMapEmpty!57010) mapIsEmpty!57010))

(assert (= (and b!1335570 (not condMapEmpty!57010)) mapNonEmpty!57010))

(get-info :version)

(assert (= (and mapNonEmpty!57010 ((_ is ValueCellFull!17547) mapValue!57010)) b!1335578))

(assert (= (and b!1335570 ((_ is ValueCellFull!17547) mapDefault!57010)) b!1335573))

(assert (= start!112586 b!1335570))

(declare-fun m!1223575 () Bool)

(assert (=> b!1335572 m!1223575))

(declare-fun m!1223577 () Bool)

(assert (=> b!1335569 m!1223577))

(assert (=> b!1335569 m!1223577))

(declare-fun m!1223579 () Bool)

(assert (=> b!1335569 m!1223579))

(declare-fun m!1223581 () Bool)

(assert (=> b!1335580 m!1223581))

(assert (=> b!1335574 m!1223577))

(declare-fun m!1223583 () Bool)

(assert (=> b!1335575 m!1223583))

(assert (=> b!1335575 m!1223583))

(declare-fun m!1223585 () Bool)

(assert (=> b!1335575 m!1223585))

(declare-fun m!1223587 () Bool)

(assert (=> start!112586 m!1223587))

(declare-fun m!1223589 () Bool)

(assert (=> start!112586 m!1223589))

(declare-fun m!1223591 () Bool)

(assert (=> start!112586 m!1223591))

(declare-fun m!1223593 () Bool)

(assert (=> b!1335571 m!1223593))

(declare-fun m!1223595 () Bool)

(assert (=> mapNonEmpty!57010 m!1223595))

(check-sat b_and!49889 (not b_next!30981) (not b!1335572) (not b!1335575) (not b!1335571) (not mapNonEmpty!57010) (not start!112586) tp_is_empty!36891 (not b!1335569) (not b!1335580))
(check-sat b_and!49889 (not b_next!30981))
