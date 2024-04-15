; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97316 () Bool)

(assert start!97316)

(declare-fun b_free!23293 () Bool)

(declare-fun b_next!23293 () Bool)

(assert (=> start!97316 (= b_free!23293 (not b_next!23293))))

(declare-fun tp!82178 () Bool)

(declare-fun b_and!37397 () Bool)

(assert (=> start!97316 (= tp!82178 b_and!37397)))

(declare-fun b!1108578 () Bool)

(declare-fun res!739836 () Bool)

(declare-fun e!632378 () Bool)

(assert (=> b!1108578 (=> (not res!739836) (not e!632378))))

(declare-datatypes ((array!71920 0))(
  ( (array!71921 (arr!34613 (Array (_ BitVec 32) (_ BitVec 64))) (size!35151 (_ BitVec 32))) )
))
(declare-fun lt!495655 () array!71920)

(declare-datatypes ((List!24192 0))(
  ( (Nil!24189) (Cons!24188 (h!25397 (_ BitVec 64)) (t!34522 List!24192)) )
))
(declare-fun arrayNoDuplicates!0 (array!71920 (_ BitVec 32) List!24192) Bool)

(assert (=> b!1108578 (= res!739836 (arrayNoDuplicates!0 lt!495655 #b00000000000000000000000000000000 Nil!24189))))

(declare-fun b!1108579 () Bool)

(declare-fun res!739839 () Bool)

(declare-fun e!632380 () Bool)

(assert (=> b!1108579 (=> (not res!739839) (not e!632380))))

(declare-fun _keys!1208 () array!71920)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71920 (_ BitVec 32)) Bool)

(assert (=> b!1108579 (= res!739839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108580 () Bool)

(declare-fun res!739830 () Bool)

(assert (=> b!1108580 (=> (not res!739830) (not e!632380))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41865 0))(
  ( (V!41866 (val!13833 Int)) )
))
(declare-datatypes ((ValueCell!13067 0))(
  ( (ValueCellFull!13067 (v!16465 V!41865)) (EmptyCell!13067) )
))
(declare-datatypes ((array!71922 0))(
  ( (array!71923 (arr!34614 (Array (_ BitVec 32) ValueCell!13067)) (size!35152 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71922)

(assert (=> b!1108580 (= res!739830 (and (= (size!35152 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35151 _keys!1208) (size!35152 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!41865)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46549 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17534 0))(
  ( (tuple2!17535 (_1!8778 (_ BitVec 64)) (_2!8778 V!41865)) )
))
(declare-datatypes ((List!24193 0))(
  ( (Nil!24190) (Cons!24189 (h!25398 tuple2!17534) (t!34523 List!24193)) )
))
(declare-datatypes ((ListLongMap!15503 0))(
  ( (ListLongMap!15504 (toList!7767 List!24193)) )
))
(declare-fun call!46552 () ListLongMap!15503)

(declare-fun minValue!944 () V!41865)

(declare-fun getCurrentListMapNoExtraKeys!4283 (array!71920 array!71922 (_ BitVec 32) (_ BitVec 32) V!41865 V!41865 (_ BitVec 32) Int) ListLongMap!15503)

(assert (=> bm!46549 (= call!46552 (getCurrentListMapNoExtraKeys!4283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108581 () Bool)

(declare-fun e!632376 () Bool)

(assert (=> b!1108581 (= e!632376 true)))

(declare-fun e!632382 () Bool)

(assert (=> b!1108581 e!632382))

(declare-fun c!109098 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108581 (= c!109098 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36195 0))(
  ( (Unit!36196) )
))
(declare-fun lt!495656 () Unit!36195)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!260 (array!71920 array!71922 (_ BitVec 32) (_ BitVec 32) V!41865 V!41865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36195)

(assert (=> b!1108581 (= lt!495656 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!260 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108582 () Bool)

(declare-fun res!739838 () Bool)

(assert (=> b!1108582 (=> (not res!739838) (not e!632380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108582 (= res!739838 (validMask!0 mask!1564))))

(declare-fun b!1108583 () Bool)

(assert (=> b!1108583 (= e!632380 e!632378)))

(declare-fun res!739833 () Bool)

(assert (=> b!1108583 (=> (not res!739833) (not e!632378))))

(assert (=> b!1108583 (= res!739833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495655 mask!1564))))

(assert (=> b!1108583 (= lt!495655 (array!71921 (store (arr!34613 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35151 _keys!1208)))))

(declare-fun b!1108584 () Bool)

(declare-fun res!739837 () Bool)

(assert (=> b!1108584 (=> (not res!739837) (not e!632380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108584 (= res!739837 (validKeyInArray!0 k0!934))))

(declare-fun call!46553 () ListLongMap!15503)

(declare-fun b!1108585 () Bool)

(declare-fun -!989 (ListLongMap!15503 (_ BitVec 64)) ListLongMap!15503)

(assert (=> b!1108585 (= e!632382 (= call!46553 (-!989 call!46552 k0!934)))))

(declare-fun b!1108587 () Bool)

(declare-fun res!739840 () Bool)

(assert (=> b!1108587 (=> (not res!739840) (not e!632380))))

(assert (=> b!1108587 (= res!739840 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35151 _keys!1208))))))

(declare-fun b!1108588 () Bool)

(declare-fun res!739835 () Bool)

(assert (=> b!1108588 (=> (not res!739835) (not e!632380))))

(assert (=> b!1108588 (= res!739835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24189))))

(declare-fun mapNonEmpty!43147 () Bool)

(declare-fun mapRes!43147 () Bool)

(declare-fun tp!82177 () Bool)

(declare-fun e!632379 () Bool)

(assert (=> mapNonEmpty!43147 (= mapRes!43147 (and tp!82177 e!632379))))

(declare-fun mapKey!43147 () (_ BitVec 32))

(declare-fun mapValue!43147 () ValueCell!13067)

(declare-fun mapRest!43147 () (Array (_ BitVec 32) ValueCell!13067))

(assert (=> mapNonEmpty!43147 (= (arr!34614 _values!996) (store mapRest!43147 mapKey!43147 mapValue!43147))))

(declare-fun b!1108589 () Bool)

(assert (=> b!1108589 (= e!632382 (= call!46553 call!46552))))

(declare-fun b!1108590 () Bool)

(assert (=> b!1108590 (= e!632378 (not e!632376))))

(declare-fun res!739831 () Bool)

(assert (=> b!1108590 (=> res!739831 e!632376)))

(assert (=> b!1108590 (= res!739831 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35151 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108590 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495657 () Unit!36195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71920 (_ BitVec 64) (_ BitVec 32)) Unit!36195)

(assert (=> b!1108590 (= lt!495657 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108591 () Bool)

(declare-fun e!632377 () Bool)

(declare-fun e!632381 () Bool)

(assert (=> b!1108591 (= e!632377 (and e!632381 mapRes!43147))))

(declare-fun condMapEmpty!43147 () Bool)

(declare-fun mapDefault!43147 () ValueCell!13067)

(assert (=> b!1108591 (= condMapEmpty!43147 (= (arr!34614 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13067)) mapDefault!43147)))))

(declare-fun b!1108592 () Bool)

(declare-fun tp_is_empty!27553 () Bool)

(assert (=> b!1108592 (= e!632379 tp_is_empty!27553)))

(declare-fun b!1108593 () Bool)

(assert (=> b!1108593 (= e!632381 tp_is_empty!27553)))

(declare-fun mapIsEmpty!43147 () Bool)

(assert (=> mapIsEmpty!43147 mapRes!43147))

(declare-fun bm!46550 () Bool)

(declare-fun dynLambda!2350 (Int (_ BitVec 64)) V!41865)

(assert (=> bm!46550 (= call!46553 (getCurrentListMapNoExtraKeys!4283 lt!495655 (array!71923 (store (arr!34614 _values!996) i!673 (ValueCellFull!13067 (dynLambda!2350 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35152 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!739832 () Bool)

(assert (=> start!97316 (=> (not res!739832) (not e!632380))))

(assert (=> start!97316 (= res!739832 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35151 _keys!1208))))))

(assert (=> start!97316 e!632380))

(assert (=> start!97316 tp_is_empty!27553))

(declare-fun array_inv!26690 (array!71920) Bool)

(assert (=> start!97316 (array_inv!26690 _keys!1208)))

(assert (=> start!97316 true))

(assert (=> start!97316 tp!82178))

(declare-fun array_inv!26691 (array!71922) Bool)

(assert (=> start!97316 (and (array_inv!26691 _values!996) e!632377)))

(declare-fun b!1108586 () Bool)

(declare-fun res!739834 () Bool)

(assert (=> b!1108586 (=> (not res!739834) (not e!632380))))

(assert (=> b!1108586 (= res!739834 (= (select (arr!34613 _keys!1208) i!673) k0!934))))

(assert (= (and start!97316 res!739832) b!1108582))

(assert (= (and b!1108582 res!739838) b!1108580))

(assert (= (and b!1108580 res!739830) b!1108579))

(assert (= (and b!1108579 res!739839) b!1108588))

(assert (= (and b!1108588 res!739835) b!1108587))

(assert (= (and b!1108587 res!739840) b!1108584))

(assert (= (and b!1108584 res!739837) b!1108586))

(assert (= (and b!1108586 res!739834) b!1108583))

(assert (= (and b!1108583 res!739833) b!1108578))

(assert (= (and b!1108578 res!739836) b!1108590))

(assert (= (and b!1108590 (not res!739831)) b!1108581))

(assert (= (and b!1108581 c!109098) b!1108585))

(assert (= (and b!1108581 (not c!109098)) b!1108589))

(assert (= (or b!1108585 b!1108589) bm!46550))

(assert (= (or b!1108585 b!1108589) bm!46549))

(assert (= (and b!1108591 condMapEmpty!43147) mapIsEmpty!43147))

(assert (= (and b!1108591 (not condMapEmpty!43147)) mapNonEmpty!43147))

(get-info :version)

(assert (= (and mapNonEmpty!43147 ((_ is ValueCellFull!13067) mapValue!43147)) b!1108592))

(assert (= (and b!1108591 ((_ is ValueCellFull!13067) mapDefault!43147)) b!1108593))

(assert (= start!97316 b!1108591))

(declare-fun b_lambda!18295 () Bool)

(assert (=> (not b_lambda!18295) (not bm!46550)))

(declare-fun t!34521 () Bool)

(declare-fun tb!8151 () Bool)

(assert (=> (and start!97316 (= defaultEntry!1004 defaultEntry!1004) t!34521) tb!8151))

(declare-fun result!16871 () Bool)

(assert (=> tb!8151 (= result!16871 tp_is_empty!27553)))

(assert (=> bm!46550 t!34521))

(declare-fun b_and!37399 () Bool)

(assert (= b_and!37397 (and (=> t!34521 result!16871) b_and!37399)))

(declare-fun m!1026543 () Bool)

(assert (=> b!1108582 m!1026543))

(declare-fun m!1026545 () Bool)

(assert (=> start!97316 m!1026545))

(declare-fun m!1026547 () Bool)

(assert (=> start!97316 m!1026547))

(declare-fun m!1026549 () Bool)

(assert (=> b!1108584 m!1026549))

(declare-fun m!1026551 () Bool)

(assert (=> b!1108583 m!1026551))

(declare-fun m!1026553 () Bool)

(assert (=> b!1108583 m!1026553))

(declare-fun m!1026555 () Bool)

(assert (=> bm!46549 m!1026555))

(declare-fun m!1026557 () Bool)

(assert (=> b!1108585 m!1026557))

(declare-fun m!1026559 () Bool)

(assert (=> b!1108590 m!1026559))

(declare-fun m!1026561 () Bool)

(assert (=> b!1108590 m!1026561))

(declare-fun m!1026563 () Bool)

(assert (=> bm!46550 m!1026563))

(declare-fun m!1026565 () Bool)

(assert (=> bm!46550 m!1026565))

(declare-fun m!1026567 () Bool)

(assert (=> bm!46550 m!1026567))

(declare-fun m!1026569 () Bool)

(assert (=> mapNonEmpty!43147 m!1026569))

(declare-fun m!1026571 () Bool)

(assert (=> b!1108588 m!1026571))

(declare-fun m!1026573 () Bool)

(assert (=> b!1108579 m!1026573))

(declare-fun m!1026575 () Bool)

(assert (=> b!1108581 m!1026575))

(declare-fun m!1026577 () Bool)

(assert (=> b!1108578 m!1026577))

(declare-fun m!1026579 () Bool)

(assert (=> b!1108586 m!1026579))

(check-sat (not start!97316) b_and!37399 (not b!1108585) (not b!1108582) (not b!1108583) (not b!1108590) (not b!1108578) (not b!1108581) (not mapNonEmpty!43147) (not b!1108588) (not b_lambda!18295) (not bm!46549) (not bm!46550) tp_is_empty!27553 (not b!1108584) (not b_next!23293) (not b!1108579))
(check-sat b_and!37399 (not b_next!23293))
