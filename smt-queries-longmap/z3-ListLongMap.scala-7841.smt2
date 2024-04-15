; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97784 () Bool)

(assert start!97784)

(declare-fun b_free!23491 () Bool)

(declare-fun b_next!23491 () Bool)

(assert (=> start!97784 (= b_free!23491 (not b_next!23491))))

(declare-fun tp!83177 () Bool)

(declare-fun b_and!37743 () Bool)

(assert (=> start!97784 (= tp!83177 b_and!37743)))

(declare-fun b!1118597 () Bool)

(declare-fun e!637115 () Bool)

(declare-fun e!637116 () Bool)

(assert (=> b!1118597 (= e!637115 (not e!637116))))

(declare-fun res!747150 () Bool)

(assert (=> b!1118597 (=> res!747150 e!637116)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118597 (= res!747150 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72836 0))(
  ( (array!72837 (arr!35071 (Array (_ BitVec 32) (_ BitVec 64))) (size!35609 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72836)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118597 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36537 0))(
  ( (Unit!36538) )
))
(declare-fun lt!497361 () Unit!36537)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72836 (_ BitVec 64) (_ BitVec 32)) Unit!36537)

(assert (=> b!1118597 (= lt!497361 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118598 () Bool)

(declare-fun res!747151 () Bool)

(declare-fun e!637114 () Bool)

(assert (=> b!1118598 (=> (not res!747151) (not e!637114))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118598 (= res!747151 (validMask!0 mask!1564))))

(declare-fun b!1118599 () Bool)

(assert (=> b!1118599 (= e!637114 e!637115)))

(declare-fun res!747155 () Bool)

(assert (=> b!1118599 (=> (not res!747155) (not e!637115))))

(declare-fun lt!497360 () array!72836)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72836 (_ BitVec 32)) Bool)

(assert (=> b!1118599 (= res!747155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497360 mask!1564))))

(assert (=> b!1118599 (= lt!497360 (array!72837 (store (arr!35071 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35609 _keys!1208)))))

(declare-fun b!1118600 () Bool)

(assert (=> b!1118600 (= e!637116 true)))

(declare-datatypes ((V!42489 0))(
  ( (V!42490 (val!14067 Int)) )
))
(declare-fun zeroValue!944 () V!42489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17708 0))(
  ( (tuple2!17709 (_1!8865 (_ BitVec 64)) (_2!8865 V!42489)) )
))
(declare-datatypes ((List!24473 0))(
  ( (Nil!24470) (Cons!24469 (h!25678 tuple2!17708) (t!34947 List!24473)) )
))
(declare-datatypes ((ListLongMap!15677 0))(
  ( (ListLongMap!15678 (toList!7854 List!24473)) )
))
(declare-fun lt!497359 () ListLongMap!15677)

(declare-datatypes ((ValueCell!13301 0))(
  ( (ValueCellFull!13301 (v!16699 V!42489)) (EmptyCell!13301) )
))
(declare-datatypes ((array!72838 0))(
  ( (array!72839 (arr!35072 (Array (_ BitVec 32) ValueCell!13301)) (size!35610 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72838)

(declare-fun minValue!944 () V!42489)

(declare-fun getCurrentListMapNoExtraKeys!4363 (array!72836 array!72838 (_ BitVec 32) (_ BitVec 32) V!42489 V!42489 (_ BitVec 32) Int) ListLongMap!15677)

(declare-fun dynLambda!2406 (Int (_ BitVec 64)) V!42489)

(assert (=> b!1118600 (= lt!497359 (getCurrentListMapNoExtraKeys!4363 lt!497360 (array!72839 (store (arr!35072 _values!996) i!673 (ValueCellFull!13301 (dynLambda!2406 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35610 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497358 () ListLongMap!15677)

(assert (=> b!1118600 (= lt!497358 (getCurrentListMapNoExtraKeys!4363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118601 () Bool)

(declare-fun e!637110 () Bool)

(declare-fun e!637111 () Bool)

(declare-fun mapRes!43849 () Bool)

(assert (=> b!1118601 (= e!637110 (and e!637111 mapRes!43849))))

(declare-fun condMapEmpty!43849 () Bool)

(declare-fun mapDefault!43849 () ValueCell!13301)

(assert (=> b!1118601 (= condMapEmpty!43849 (= (arr!35072 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13301)) mapDefault!43849)))))

(declare-fun mapNonEmpty!43849 () Bool)

(declare-fun tp!83176 () Bool)

(declare-fun e!637112 () Bool)

(assert (=> mapNonEmpty!43849 (= mapRes!43849 (and tp!83176 e!637112))))

(declare-fun mapRest!43849 () (Array (_ BitVec 32) ValueCell!13301))

(declare-fun mapKey!43849 () (_ BitVec 32))

(declare-fun mapValue!43849 () ValueCell!13301)

(assert (=> mapNonEmpty!43849 (= (arr!35072 _values!996) (store mapRest!43849 mapKey!43849 mapValue!43849))))

(declare-fun b!1118602 () Bool)

(declare-fun res!747152 () Bool)

(assert (=> b!1118602 (=> (not res!747152) (not e!637114))))

(declare-datatypes ((List!24474 0))(
  ( (Nil!24471) (Cons!24470 (h!25679 (_ BitVec 64)) (t!34948 List!24474)) )
))
(declare-fun arrayNoDuplicates!0 (array!72836 (_ BitVec 32) List!24474) Bool)

(assert (=> b!1118602 (= res!747152 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24471))))

(declare-fun b!1118603 () Bool)

(declare-fun res!747154 () Bool)

(assert (=> b!1118603 (=> (not res!747154) (not e!637114))))

(assert (=> b!1118603 (= res!747154 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35609 _keys!1208))))))

(declare-fun b!1118604 () Bool)

(declare-fun res!747156 () Bool)

(assert (=> b!1118604 (=> (not res!747156) (not e!637114))))

(assert (=> b!1118604 (= res!747156 (= (select (arr!35071 _keys!1208) i!673) k0!934))))

(declare-fun b!1118605 () Bool)

(declare-fun tp_is_empty!28021 () Bool)

(assert (=> b!1118605 (= e!637111 tp_is_empty!28021)))

(declare-fun mapIsEmpty!43849 () Bool)

(assert (=> mapIsEmpty!43849 mapRes!43849))

(declare-fun b!1118606 () Bool)

(declare-fun res!747149 () Bool)

(assert (=> b!1118606 (=> (not res!747149) (not e!637114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118606 (= res!747149 (validKeyInArray!0 k0!934))))

(declare-fun res!747147 () Bool)

(assert (=> start!97784 (=> (not res!747147) (not e!637114))))

(assert (=> start!97784 (= res!747147 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35609 _keys!1208))))))

(assert (=> start!97784 e!637114))

(assert (=> start!97784 tp_is_empty!28021))

(declare-fun array_inv!27010 (array!72836) Bool)

(assert (=> start!97784 (array_inv!27010 _keys!1208)))

(assert (=> start!97784 true))

(assert (=> start!97784 tp!83177))

(declare-fun array_inv!27011 (array!72838) Bool)

(assert (=> start!97784 (and (array_inv!27011 _values!996) e!637110)))

(declare-fun b!1118607 () Bool)

(assert (=> b!1118607 (= e!637112 tp_is_empty!28021)))

(declare-fun b!1118608 () Bool)

(declare-fun res!747148 () Bool)

(assert (=> b!1118608 (=> (not res!747148) (not e!637114))))

(assert (=> b!1118608 (= res!747148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118609 () Bool)

(declare-fun res!747153 () Bool)

(assert (=> b!1118609 (=> (not res!747153) (not e!637115))))

(assert (=> b!1118609 (= res!747153 (arrayNoDuplicates!0 lt!497360 #b00000000000000000000000000000000 Nil!24471))))

(declare-fun b!1118610 () Bool)

(declare-fun res!747157 () Bool)

(assert (=> b!1118610 (=> (not res!747157) (not e!637114))))

(assert (=> b!1118610 (= res!747157 (and (= (size!35610 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35609 _keys!1208) (size!35610 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97784 res!747147) b!1118598))

(assert (= (and b!1118598 res!747151) b!1118610))

(assert (= (and b!1118610 res!747157) b!1118608))

(assert (= (and b!1118608 res!747148) b!1118602))

(assert (= (and b!1118602 res!747152) b!1118603))

(assert (= (and b!1118603 res!747154) b!1118606))

(assert (= (and b!1118606 res!747149) b!1118604))

(assert (= (and b!1118604 res!747156) b!1118599))

(assert (= (and b!1118599 res!747155) b!1118609))

(assert (= (and b!1118609 res!747153) b!1118597))

(assert (= (and b!1118597 (not res!747150)) b!1118600))

(assert (= (and b!1118601 condMapEmpty!43849) mapIsEmpty!43849))

(assert (= (and b!1118601 (not condMapEmpty!43849)) mapNonEmpty!43849))

(get-info :version)

(assert (= (and mapNonEmpty!43849 ((_ is ValueCellFull!13301) mapValue!43849)) b!1118607))

(assert (= (and b!1118601 ((_ is ValueCellFull!13301) mapDefault!43849)) b!1118605))

(assert (= start!97784 b!1118601))

(declare-fun b_lambda!18443 () Bool)

(assert (=> (not b_lambda!18443) (not b!1118600)))

(declare-fun t!34946 () Bool)

(declare-fun tb!8295 () Bool)

(assert (=> (and start!97784 (= defaultEntry!1004 defaultEntry!1004) t!34946) tb!8295))

(declare-fun result!17159 () Bool)

(assert (=> tb!8295 (= result!17159 tp_is_empty!28021)))

(assert (=> b!1118600 t!34946))

(declare-fun b_and!37745 () Bool)

(assert (= b_and!37743 (and (=> t!34946 result!17159) b_and!37745)))

(declare-fun m!1033545 () Bool)

(assert (=> b!1118602 m!1033545))

(declare-fun m!1033547 () Bool)

(assert (=> b!1118599 m!1033547))

(declare-fun m!1033549 () Bool)

(assert (=> b!1118599 m!1033549))

(declare-fun m!1033551 () Bool)

(assert (=> mapNonEmpty!43849 m!1033551))

(declare-fun m!1033553 () Bool)

(assert (=> b!1118609 m!1033553))

(declare-fun m!1033555 () Bool)

(assert (=> b!1118608 m!1033555))

(declare-fun m!1033557 () Bool)

(assert (=> b!1118598 m!1033557))

(declare-fun m!1033559 () Bool)

(assert (=> start!97784 m!1033559))

(declare-fun m!1033561 () Bool)

(assert (=> start!97784 m!1033561))

(declare-fun m!1033563 () Bool)

(assert (=> b!1118597 m!1033563))

(declare-fun m!1033565 () Bool)

(assert (=> b!1118597 m!1033565))

(declare-fun m!1033567 () Bool)

(assert (=> b!1118604 m!1033567))

(declare-fun m!1033569 () Bool)

(assert (=> b!1118606 m!1033569))

(declare-fun m!1033571 () Bool)

(assert (=> b!1118600 m!1033571))

(declare-fun m!1033573 () Bool)

(assert (=> b!1118600 m!1033573))

(declare-fun m!1033575 () Bool)

(assert (=> b!1118600 m!1033575))

(declare-fun m!1033577 () Bool)

(assert (=> b!1118600 m!1033577))

(check-sat tp_is_empty!28021 (not mapNonEmpty!43849) b_and!37745 (not b_next!23491) (not b!1118608) (not b!1118600) (not b!1118599) (not b!1118609) (not b!1118597) (not b_lambda!18443) (not b!1118602) (not b!1118606) (not b!1118598) (not start!97784))
(check-sat b_and!37745 (not b_next!23491))
