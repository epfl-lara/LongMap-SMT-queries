; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111406 () Bool)

(assert start!111406)

(declare-fun b_free!30063 () Bool)

(declare-fun b_next!30063 () Bool)

(assert (=> start!111406 (= b_free!30063 (not b_next!30063))))

(declare-fun tp!105664 () Bool)

(declare-fun b_and!48285 () Bool)

(assert (=> start!111406 (= tp!105664 b_and!48285)))

(declare-fun b!1318321 () Bool)

(declare-fun res!874940 () Bool)

(declare-fun e!752310 () Bool)

(assert (=> b!1318321 (=> (not res!874940) (not e!752310))))

(declare-datatypes ((array!88712 0))(
  ( (array!88713 (arr!42830 (Array (_ BitVec 32) (_ BitVec 64))) (size!43380 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88712)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318321 (= res!874940 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43380 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318322 () Bool)

(assert (=> b!1318322 (= e!752310 false)))

(declare-datatypes ((V!52947 0))(
  ( (V!52948 (val!18016 Int)) )
))
(declare-fun zeroValue!1279 () V!52947)

(declare-fun minValue!1279 () V!52947)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17043 0))(
  ( (ValueCellFull!17043 (v!20646 V!52947)) (EmptyCell!17043) )
))
(declare-datatypes ((array!88714 0))(
  ( (array!88715 (arr!42831 (Array (_ BitVec 32) ValueCell!17043)) (size!43381 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88714)

(declare-fun lt!586461 () Bool)

(declare-datatypes ((tuple2!23186 0))(
  ( (tuple2!23187 (_1!11604 (_ BitVec 64)) (_2!11604 V!52947)) )
))
(declare-datatypes ((List!30341 0))(
  ( (Nil!30338) (Cons!30337 (h!31546 tuple2!23186) (t!43953 List!30341)) )
))
(declare-datatypes ((ListLongMap!20843 0))(
  ( (ListLongMap!20844 (toList!10437 List!30341)) )
))
(declare-fun contains!8592 (ListLongMap!20843 (_ BitVec 64)) Bool)

(declare-fun +!4498 (ListLongMap!20843 tuple2!23186) ListLongMap!20843)

(declare-fun getCurrentListMapNoExtraKeys!6133 (array!88712 array!88714 (_ BitVec 32) (_ BitVec 32) V!52947 V!52947 (_ BitVec 32) Int) ListLongMap!20843)

(declare-fun get!21510 (ValueCell!17043 V!52947) V!52947)

(declare-fun dynLambda!3437 (Int (_ BitVec 64)) V!52947)

(assert (=> b!1318322 (= lt!586461 (contains!8592 (+!4498 (+!4498 (+!4498 (getCurrentListMapNoExtraKeys!6133 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23187 (select (arr!42830 _keys!1609) from!2000) (get!21510 (select (arr!42831 _values!1337) from!2000) (dynLambda!3437 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun mapNonEmpty!55472 () Bool)

(declare-fun mapRes!55472 () Bool)

(declare-fun tp!105665 () Bool)

(declare-fun e!752314 () Bool)

(assert (=> mapNonEmpty!55472 (= mapRes!55472 (and tp!105665 e!752314))))

(declare-fun mapRest!55472 () (Array (_ BitVec 32) ValueCell!17043))

(declare-fun mapKey!55472 () (_ BitVec 32))

(declare-fun mapValue!55472 () ValueCell!17043)

(assert (=> mapNonEmpty!55472 (= (arr!42831 _values!1337) (store mapRest!55472 mapKey!55472 mapValue!55472))))

(declare-fun b!1318323 () Bool)

(declare-fun res!874935 () Bool)

(assert (=> b!1318323 (=> (not res!874935) (not e!752310))))

(declare-datatypes ((List!30342 0))(
  ( (Nil!30339) (Cons!30338 (h!31547 (_ BitVec 64)) (t!43954 List!30342)) )
))
(declare-fun arrayNoDuplicates!0 (array!88712 (_ BitVec 32) List!30342) Bool)

(assert (=> b!1318323 (= res!874935 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30339))))

(declare-fun b!1318324 () Bool)

(declare-fun tp_is_empty!35883 () Bool)

(assert (=> b!1318324 (= e!752314 tp_is_empty!35883)))

(declare-fun b!1318325 () Bool)

(declare-fun res!874937 () Bool)

(assert (=> b!1318325 (=> (not res!874937) (not e!752310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318325 (= res!874937 (validKeyInArray!0 (select (arr!42830 _keys!1609) from!2000)))))

(declare-fun b!1318326 () Bool)

(declare-fun res!874939 () Bool)

(assert (=> b!1318326 (=> (not res!874939) (not e!752310))))

(assert (=> b!1318326 (= res!874939 (and (= (size!43381 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43380 _keys!1609) (size!43381 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318327 () Bool)

(declare-fun res!874934 () Bool)

(assert (=> b!1318327 (=> (not res!874934) (not e!752310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88712 (_ BitVec 32)) Bool)

(assert (=> b!1318327 (= res!874934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318328 () Bool)

(declare-fun e!752311 () Bool)

(assert (=> b!1318328 (= e!752311 tp_is_empty!35883)))

(declare-fun b!1318329 () Bool)

(declare-fun e!752313 () Bool)

(assert (=> b!1318329 (= e!752313 (and e!752311 mapRes!55472))))

(declare-fun condMapEmpty!55472 () Bool)

(declare-fun mapDefault!55472 () ValueCell!17043)

(assert (=> b!1318329 (= condMapEmpty!55472 (= (arr!42831 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17043)) mapDefault!55472)))))

(declare-fun b!1318320 () Bool)

(declare-fun res!874933 () Bool)

(assert (=> b!1318320 (=> (not res!874933) (not e!752310))))

(assert (=> b!1318320 (= res!874933 (not (= (select (arr!42830 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!874938 () Bool)

(assert (=> start!111406 (=> (not res!874938) (not e!752310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111406 (= res!874938 (validMask!0 mask!2019))))

(assert (=> start!111406 e!752310))

(declare-fun array_inv!32345 (array!88712) Bool)

(assert (=> start!111406 (array_inv!32345 _keys!1609)))

(assert (=> start!111406 true))

(assert (=> start!111406 tp_is_empty!35883))

(declare-fun array_inv!32346 (array!88714) Bool)

(assert (=> start!111406 (and (array_inv!32346 _values!1337) e!752313)))

(assert (=> start!111406 tp!105664))

(declare-fun mapIsEmpty!55472 () Bool)

(assert (=> mapIsEmpty!55472 mapRes!55472))

(declare-fun b!1318330 () Bool)

(declare-fun res!874936 () Bool)

(assert (=> b!1318330 (=> (not res!874936) (not e!752310))))

(declare-fun getCurrentListMap!5450 (array!88712 array!88714 (_ BitVec 32) (_ BitVec 32) V!52947 V!52947 (_ BitVec 32) Int) ListLongMap!20843)

(assert (=> b!1318330 (= res!874936 (contains!8592 (getCurrentListMap!5450 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111406 res!874938) b!1318326))

(assert (= (and b!1318326 res!874939) b!1318327))

(assert (= (and b!1318327 res!874934) b!1318323))

(assert (= (and b!1318323 res!874935) b!1318321))

(assert (= (and b!1318321 res!874940) b!1318330))

(assert (= (and b!1318330 res!874936) b!1318320))

(assert (= (and b!1318320 res!874933) b!1318325))

(assert (= (and b!1318325 res!874937) b!1318322))

(assert (= (and b!1318329 condMapEmpty!55472) mapIsEmpty!55472))

(assert (= (and b!1318329 (not condMapEmpty!55472)) mapNonEmpty!55472))

(get-info :version)

(assert (= (and mapNonEmpty!55472 ((_ is ValueCellFull!17043) mapValue!55472)) b!1318324))

(assert (= (and b!1318329 ((_ is ValueCellFull!17043) mapDefault!55472)) b!1318328))

(assert (= start!111406 b!1318329))

(declare-fun b_lambda!23389 () Bool)

(assert (=> (not b_lambda!23389) (not b!1318322)))

(declare-fun t!43952 () Bool)

(declare-fun tb!11415 () Bool)

(assert (=> (and start!111406 (= defaultEntry!1340 defaultEntry!1340) t!43952) tb!11415))

(declare-fun result!23885 () Bool)

(assert (=> tb!11415 (= result!23885 tp_is_empty!35883)))

(assert (=> b!1318322 t!43952))

(declare-fun b_and!48287 () Bool)

(assert (= b_and!48285 (and (=> t!43952 result!23885) b_and!48287)))

(declare-fun m!1205883 () Bool)

(assert (=> b!1318323 m!1205883))

(declare-fun m!1205885 () Bool)

(assert (=> b!1318325 m!1205885))

(assert (=> b!1318325 m!1205885))

(declare-fun m!1205887 () Bool)

(assert (=> b!1318325 m!1205887))

(declare-fun m!1205889 () Bool)

(assert (=> b!1318327 m!1205889))

(declare-fun m!1205891 () Bool)

(assert (=> b!1318322 m!1205891))

(declare-fun m!1205893 () Bool)

(assert (=> b!1318322 m!1205893))

(assert (=> b!1318322 m!1205891))

(declare-fun m!1205895 () Bool)

(assert (=> b!1318322 m!1205895))

(declare-fun m!1205897 () Bool)

(assert (=> b!1318322 m!1205897))

(declare-fun m!1205899 () Bool)

(assert (=> b!1318322 m!1205899))

(declare-fun m!1205901 () Bool)

(assert (=> b!1318322 m!1205901))

(assert (=> b!1318322 m!1205895))

(declare-fun m!1205903 () Bool)

(assert (=> b!1318322 m!1205903))

(assert (=> b!1318322 m!1205885))

(assert (=> b!1318322 m!1205903))

(assert (=> b!1318322 m!1205897))

(assert (=> b!1318322 m!1205901))

(assert (=> b!1318322 m!1205893))

(declare-fun m!1205905 () Bool)

(assert (=> b!1318322 m!1205905))

(declare-fun m!1205907 () Bool)

(assert (=> mapNonEmpty!55472 m!1205907))

(declare-fun m!1205909 () Bool)

(assert (=> b!1318330 m!1205909))

(assert (=> b!1318330 m!1205909))

(declare-fun m!1205911 () Bool)

(assert (=> b!1318330 m!1205911))

(declare-fun m!1205913 () Bool)

(assert (=> start!111406 m!1205913))

(declare-fun m!1205915 () Bool)

(assert (=> start!111406 m!1205915))

(declare-fun m!1205917 () Bool)

(assert (=> start!111406 m!1205917))

(assert (=> b!1318320 m!1205885))

(check-sat tp_is_empty!35883 b_and!48287 (not b!1318330) (not b_next!30063) (not mapNonEmpty!55472) (not b!1318325) (not b!1318322) (not b!1318327) (not b!1318323) (not start!111406) (not b_lambda!23389))
(check-sat b_and!48287 (not b_next!30063))
