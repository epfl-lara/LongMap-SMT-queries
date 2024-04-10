; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111496 () Bool)

(assert start!111496)

(declare-fun b_free!30153 () Bool)

(declare-fun b_next!30153 () Bool)

(assert (=> start!111496 (= b_free!30153 (not b_next!30153))))

(declare-fun tp!105935 () Bool)

(declare-fun b_and!48465 () Bool)

(assert (=> start!111496 (= tp!105935 b_and!48465)))

(declare-fun b!1319895 () Bool)

(declare-fun res!876014 () Bool)

(declare-fun e!752985 () Bool)

(assert (=> b!1319895 (=> (not res!876014) (not e!752985))))

(declare-datatypes ((array!88882 0))(
  ( (array!88883 (arr!42915 (Array (_ BitVec 32) (_ BitVec 64))) (size!43465 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88882)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319895 (= res!876014 (not (= (select (arr!42915 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319896 () Bool)

(declare-fun e!752986 () Bool)

(declare-fun tp_is_empty!35973 () Bool)

(assert (=> b!1319896 (= e!752986 tp_is_empty!35973)))

(declare-fun b!1319897 () Bool)

(declare-fun e!752987 () Bool)

(declare-fun mapRes!55607 () Bool)

(assert (=> b!1319897 (= e!752987 (and e!752986 mapRes!55607))))

(declare-fun condMapEmpty!55607 () Bool)

(declare-datatypes ((V!53067 0))(
  ( (V!53068 (val!18061 Int)) )
))
(declare-datatypes ((ValueCell!17088 0))(
  ( (ValueCellFull!17088 (v!20691 V!53067)) (EmptyCell!17088) )
))
(declare-datatypes ((array!88884 0))(
  ( (array!88885 (arr!42916 (Array (_ BitVec 32) ValueCell!17088)) (size!43466 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88884)

(declare-fun mapDefault!55607 () ValueCell!17088)

(assert (=> b!1319897 (= condMapEmpty!55607 (= (arr!42916 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17088)) mapDefault!55607)))))

(declare-fun b!1319898 () Bool)

(declare-fun res!876013 () Bool)

(assert (=> b!1319898 (=> (not res!876013) (not e!752985))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1319898 (= res!876013 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43465 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55607 () Bool)

(assert (=> mapIsEmpty!55607 mapRes!55607))

(declare-fun b!1319899 () Bool)

(declare-fun res!876015 () Bool)

(assert (=> b!1319899 (=> (not res!876015) (not e!752985))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88882 (_ BitVec 32)) Bool)

(assert (=> b!1319899 (= res!876015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!876018 () Bool)

(assert (=> start!111496 (=> (not res!876018) (not e!752985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111496 (= res!876018 (validMask!0 mask!2019))))

(assert (=> start!111496 e!752985))

(declare-fun array_inv!32403 (array!88882) Bool)

(assert (=> start!111496 (array_inv!32403 _keys!1609)))

(assert (=> start!111496 true))

(assert (=> start!111496 tp_is_empty!35973))

(declare-fun array_inv!32404 (array!88884) Bool)

(assert (=> start!111496 (and (array_inv!32404 _values!1337) e!752987)))

(assert (=> start!111496 tp!105935))

(declare-fun b!1319900 () Bool)

(declare-fun res!876019 () Bool)

(assert (=> b!1319900 (=> (not res!876019) (not e!752985))))

(declare-datatypes ((List!30404 0))(
  ( (Nil!30401) (Cons!30400 (h!31609 (_ BitVec 64)) (t!44106 List!30404)) )
))
(declare-fun arrayNoDuplicates!0 (array!88882 (_ BitVec 32) List!30404) Bool)

(assert (=> b!1319900 (= res!876019 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30401))))

(declare-fun b!1319901 () Bool)

(declare-fun e!752988 () Bool)

(assert (=> b!1319901 (= e!752988 tp_is_empty!35973)))

(declare-fun b!1319902 () Bool)

(declare-fun res!876016 () Bool)

(assert (=> b!1319902 (=> (not res!876016) (not e!752985))))

(declare-fun zeroValue!1279 () V!53067)

(declare-fun minValue!1279 () V!53067)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23252 0))(
  ( (tuple2!23253 (_1!11637 (_ BitVec 64)) (_2!11637 V!53067)) )
))
(declare-datatypes ((List!30405 0))(
  ( (Nil!30402) (Cons!30401 (h!31610 tuple2!23252) (t!44107 List!30405)) )
))
(declare-datatypes ((ListLongMap!20909 0))(
  ( (ListLongMap!20910 (toList!10470 List!30405)) )
))
(declare-fun contains!8625 (ListLongMap!20909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5478 (array!88882 array!88884 (_ BitVec 32) (_ BitVec 32) V!53067 V!53067 (_ BitVec 32) Int) ListLongMap!20909)

(assert (=> b!1319902 (= res!876016 (contains!8625 (getCurrentListMap!5478 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55607 () Bool)

(declare-fun tp!105934 () Bool)

(assert (=> mapNonEmpty!55607 (= mapRes!55607 (and tp!105934 e!752988))))

(declare-fun mapKey!55607 () (_ BitVec 32))

(declare-fun mapRest!55607 () (Array (_ BitVec 32) ValueCell!17088))

(declare-fun mapValue!55607 () ValueCell!17088)

(assert (=> mapNonEmpty!55607 (= (arr!42916 _values!1337) (store mapRest!55607 mapKey!55607 mapValue!55607))))

(declare-fun b!1319903 () Bool)

(declare-fun res!876020 () Bool)

(assert (=> b!1319903 (=> (not res!876020) (not e!752985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319903 (= res!876020 (validKeyInArray!0 (select (arr!42915 _keys!1609) from!2000)))))

(declare-fun b!1319904 () Bool)

(declare-fun res!876017 () Bool)

(assert (=> b!1319904 (=> (not res!876017) (not e!752985))))

(assert (=> b!1319904 (= res!876017 (and (= (size!43466 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43465 _keys!1609) (size!43466 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319905 () Bool)

(assert (=> b!1319905 (= e!752985 (not true))))

(declare-fun lt!586764 () ListLongMap!20909)

(assert (=> b!1319905 (contains!8625 lt!586764 k0!1164)))

(declare-datatypes ((Unit!43478 0))(
  ( (Unit!43479) )
))
(declare-fun lt!586765 () Unit!43478)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!125 ((_ BitVec 64) (_ BitVec 64) V!53067 ListLongMap!20909) Unit!43478)

(assert (=> b!1319905 (= lt!586765 (lemmaInListMapAfterAddingDiffThenInBefore!125 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586764))))

(declare-fun lt!586767 () ListLongMap!20909)

(assert (=> b!1319905 (contains!8625 lt!586767 k0!1164)))

(declare-fun lt!586766 () Unit!43478)

(assert (=> b!1319905 (= lt!586766 (lemmaInListMapAfterAddingDiffThenInBefore!125 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586767))))

(declare-fun +!4529 (ListLongMap!20909 tuple2!23252) ListLongMap!20909)

(assert (=> b!1319905 (= lt!586767 (+!4529 lt!586764 (tuple2!23253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6164 (array!88882 array!88884 (_ BitVec 32) (_ BitVec 32) V!53067 V!53067 (_ BitVec 32) Int) ListLongMap!20909)

(declare-fun get!21571 (ValueCell!17088 V!53067) V!53067)

(declare-fun dynLambda!3468 (Int (_ BitVec 64)) V!53067)

(assert (=> b!1319905 (= lt!586764 (+!4529 (getCurrentListMapNoExtraKeys!6164 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23253 (select (arr!42915 _keys!1609) from!2000) (get!21571 (select (arr!42916 _values!1337) from!2000) (dynLambda!3468 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!111496 res!876018) b!1319904))

(assert (= (and b!1319904 res!876017) b!1319899))

(assert (= (and b!1319899 res!876015) b!1319900))

(assert (= (and b!1319900 res!876019) b!1319898))

(assert (= (and b!1319898 res!876013) b!1319902))

(assert (= (and b!1319902 res!876016) b!1319895))

(assert (= (and b!1319895 res!876014) b!1319903))

(assert (= (and b!1319903 res!876020) b!1319905))

(assert (= (and b!1319897 condMapEmpty!55607) mapIsEmpty!55607))

(assert (= (and b!1319897 (not condMapEmpty!55607)) mapNonEmpty!55607))

(get-info :version)

(assert (= (and mapNonEmpty!55607 ((_ is ValueCellFull!17088) mapValue!55607)) b!1319901))

(assert (= (and b!1319897 ((_ is ValueCellFull!17088) mapDefault!55607)) b!1319896))

(assert (= start!111496 b!1319897))

(declare-fun b_lambda!23479 () Bool)

(assert (=> (not b_lambda!23479) (not b!1319905)))

(declare-fun t!44105 () Bool)

(declare-fun tb!11505 () Bool)

(assert (=> (and start!111496 (= defaultEntry!1340 defaultEntry!1340) t!44105) tb!11505))

(declare-fun result!24065 () Bool)

(assert (=> tb!11505 (= result!24065 tp_is_empty!35973)))

(assert (=> b!1319905 t!44105))

(declare-fun b_and!48467 () Bool)

(assert (= b_and!48465 (and (=> t!44105 result!24065) b_and!48467)))

(declare-fun m!1207531 () Bool)

(assert (=> b!1319902 m!1207531))

(assert (=> b!1319902 m!1207531))

(declare-fun m!1207533 () Bool)

(assert (=> b!1319902 m!1207533))

(declare-fun m!1207535 () Bool)

(assert (=> b!1319895 m!1207535))

(declare-fun m!1207537 () Bool)

(assert (=> b!1319905 m!1207537))

(assert (=> b!1319905 m!1207537))

(declare-fun m!1207539 () Bool)

(assert (=> b!1319905 m!1207539))

(declare-fun m!1207541 () Bool)

(assert (=> b!1319905 m!1207541))

(declare-fun m!1207543 () Bool)

(assert (=> b!1319905 m!1207543))

(declare-fun m!1207545 () Bool)

(assert (=> b!1319905 m!1207545))

(declare-fun m!1207547 () Bool)

(assert (=> b!1319905 m!1207547))

(declare-fun m!1207549 () Bool)

(assert (=> b!1319905 m!1207549))

(assert (=> b!1319905 m!1207547))

(declare-fun m!1207551 () Bool)

(assert (=> b!1319905 m!1207551))

(assert (=> b!1319905 m!1207545))

(declare-fun m!1207553 () Bool)

(assert (=> b!1319905 m!1207553))

(declare-fun m!1207555 () Bool)

(assert (=> b!1319905 m!1207555))

(assert (=> b!1319905 m!1207535))

(declare-fun m!1207557 () Bool)

(assert (=> b!1319900 m!1207557))

(declare-fun m!1207559 () Bool)

(assert (=> start!111496 m!1207559))

(declare-fun m!1207561 () Bool)

(assert (=> start!111496 m!1207561))

(declare-fun m!1207563 () Bool)

(assert (=> start!111496 m!1207563))

(declare-fun m!1207565 () Bool)

(assert (=> mapNonEmpty!55607 m!1207565))

(declare-fun m!1207567 () Bool)

(assert (=> b!1319899 m!1207567))

(assert (=> b!1319903 m!1207535))

(assert (=> b!1319903 m!1207535))

(declare-fun m!1207569 () Bool)

(assert (=> b!1319903 m!1207569))

(check-sat (not start!111496) b_and!48467 (not mapNonEmpty!55607) (not b!1319900) tp_is_empty!35973 (not b_lambda!23479) (not b!1319905) (not b_next!30153) (not b!1319903) (not b!1319902) (not b!1319899))
(check-sat b_and!48467 (not b_next!30153))
