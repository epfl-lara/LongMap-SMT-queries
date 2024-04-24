; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97630 () Bool)

(assert start!97630)

(declare-fun b_free!23365 () Bool)

(declare-fun b_next!23365 () Bool)

(assert (=> start!97630 (= b_free!23365 (not b_next!23365))))

(declare-fun tp!82393 () Bool)

(declare-fun b_and!37573 () Bool)

(assert (=> start!97630 (= tp!82393 b_and!37573)))

(declare-fun b!1111834 () Bool)

(declare-fun res!741611 () Bool)

(declare-fun e!634175 () Bool)

(assert (=> b!1111834 (=> (not res!741611) (not e!634175))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72201 0))(
  ( (array!72202 (arr!34747 (Array (_ BitVec 32) (_ BitVec 64))) (size!35284 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72201)

(assert (=> b!1111834 (= res!741611 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35284 _keys!1208))))))

(declare-fun b!1111835 () Bool)

(declare-fun res!741609 () Bool)

(assert (=> b!1111835 (=> (not res!741609) (not e!634175))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111835 (= res!741609 (validKeyInArray!0 k0!934))))

(declare-fun b!1111836 () Bool)

(declare-fun e!634178 () Bool)

(declare-datatypes ((V!41961 0))(
  ( (V!41962 (val!13869 Int)) )
))
(declare-datatypes ((tuple2!17558 0))(
  ( (tuple2!17559 (_1!8790 (_ BitVec 64)) (_2!8790 V!41961)) )
))
(declare-datatypes ((List!24241 0))(
  ( (Nil!24238) (Cons!24237 (h!25455 tuple2!17558) (t!34644 List!24241)) )
))
(declare-datatypes ((ListLongMap!15535 0))(
  ( (ListLongMap!15536 (toList!7783 List!24241)) )
))
(declare-fun call!46858 () ListLongMap!15535)

(declare-fun call!46859 () ListLongMap!15535)

(assert (=> b!1111836 (= e!634178 (= call!46858 call!46859))))

(declare-fun b!1111837 () Bool)

(declare-fun e!634176 () Bool)

(declare-fun tp_is_empty!27625 () Bool)

(assert (=> b!1111837 (= e!634176 tp_is_empty!27625)))

(declare-fun b!1111838 () Bool)

(declare-fun res!741613 () Bool)

(assert (=> b!1111838 (=> (not res!741613) (not e!634175))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13103 0))(
  ( (ValueCellFull!13103 (v!16498 V!41961)) (EmptyCell!13103) )
))
(declare-datatypes ((array!72203 0))(
  ( (array!72204 (arr!34748 (Array (_ BitVec 32) ValueCell!13103)) (size!35285 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72203)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1111838 (= res!741613 (and (= (size!35285 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35284 _keys!1208) (size!35285 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43255 () Bool)

(declare-fun mapRes!43255 () Bool)

(assert (=> mapIsEmpty!43255 mapRes!43255))

(declare-fun zeroValue!944 () V!41961)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41961)

(declare-fun bm!46855 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4315 (array!72201 array!72203 (_ BitVec 32) (_ BitVec 32) V!41961 V!41961 (_ BitVec 32) Int) ListLongMap!15535)

(assert (=> bm!46855 (= call!46859 (getCurrentListMapNoExtraKeys!4315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111839 () Bool)

(declare-fun e!634182 () Bool)

(assert (=> b!1111839 (= e!634182 tp_is_empty!27625)))

(declare-fun b!1111840 () Bool)

(declare-fun e!634177 () Bool)

(assert (=> b!1111840 (= e!634177 (and e!634176 mapRes!43255))))

(declare-fun condMapEmpty!43255 () Bool)

(declare-fun mapDefault!43255 () ValueCell!13103)

(assert (=> b!1111840 (= condMapEmpty!43255 (= (arr!34748 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13103)) mapDefault!43255)))))

(declare-fun res!741612 () Bool)

(assert (=> start!97630 (=> (not res!741612) (not e!634175))))

(assert (=> start!97630 (= res!741612 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35284 _keys!1208))))))

(assert (=> start!97630 e!634175))

(assert (=> start!97630 tp_is_empty!27625))

(declare-fun array_inv!26776 (array!72201) Bool)

(assert (=> start!97630 (array_inv!26776 _keys!1208)))

(assert (=> start!97630 true))

(assert (=> start!97630 tp!82393))

(declare-fun array_inv!26777 (array!72203) Bool)

(assert (=> start!97630 (and (array_inv!26777 _values!996) e!634177)))

(declare-fun b!1111841 () Bool)

(declare-fun res!741618 () Bool)

(declare-fun e!634180 () Bool)

(assert (=> b!1111841 (=> (not res!741618) (not e!634180))))

(declare-fun lt!496694 () array!72201)

(declare-datatypes ((List!24242 0))(
  ( (Nil!24239) (Cons!24238 (h!25456 (_ BitVec 64)) (t!34645 List!24242)) )
))
(declare-fun arrayNoDuplicates!0 (array!72201 (_ BitVec 32) List!24242) Bool)

(assert (=> b!1111841 (= res!741618 (arrayNoDuplicates!0 lt!496694 #b00000000000000000000000000000000 Nil!24239))))

(declare-fun b!1111842 () Bool)

(declare-fun res!741617 () Bool)

(assert (=> b!1111842 (=> (not res!741617) (not e!634175))))

(assert (=> b!1111842 (= res!741617 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24239))))

(declare-fun b!1111843 () Bool)

(declare-fun -!1036 (ListLongMap!15535 (_ BitVec 64)) ListLongMap!15535)

(assert (=> b!1111843 (= e!634178 (= call!46858 (-!1036 call!46859 k0!934)))))

(declare-fun b!1111844 () Bool)

(declare-fun res!741615 () Bool)

(assert (=> b!1111844 (=> (not res!741615) (not e!634175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72201 (_ BitVec 32)) Bool)

(assert (=> b!1111844 (= res!741615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111845 () Bool)

(declare-fun res!741610 () Bool)

(assert (=> b!1111845 (=> (not res!741610) (not e!634175))))

(assert (=> b!1111845 (= res!741610 (= (select (arr!34747 _keys!1208) i!673) k0!934))))

(declare-fun b!1111846 () Bool)

(assert (=> b!1111846 (= e!634175 e!634180)))

(declare-fun res!741614 () Bool)

(assert (=> b!1111846 (=> (not res!741614) (not e!634180))))

(assert (=> b!1111846 (= res!741614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496694 mask!1564))))

(assert (=> b!1111846 (= lt!496694 (array!72202 (store (arr!34747 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35284 _keys!1208)))))

(declare-fun mapNonEmpty!43255 () Bool)

(declare-fun tp!82394 () Bool)

(assert (=> mapNonEmpty!43255 (= mapRes!43255 (and tp!82394 e!634182))))

(declare-fun mapRest!43255 () (Array (_ BitVec 32) ValueCell!13103))

(declare-fun mapKey!43255 () (_ BitVec 32))

(declare-fun mapValue!43255 () ValueCell!13103)

(assert (=> mapNonEmpty!43255 (= (arr!34748 _values!996) (store mapRest!43255 mapKey!43255 mapValue!43255))))

(declare-fun b!1111847 () Bool)

(declare-fun res!741619 () Bool)

(assert (=> b!1111847 (=> (not res!741619) (not e!634175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111847 (= res!741619 (validMask!0 mask!1564))))

(declare-fun bm!46856 () Bool)

(declare-fun dynLambda!2427 (Int (_ BitVec 64)) V!41961)

(assert (=> bm!46856 (= call!46858 (getCurrentListMapNoExtraKeys!4315 lt!496694 (array!72204 (store (arr!34748 _values!996) i!673 (ValueCellFull!13103 (dynLambda!2427 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35285 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111848 () Bool)

(declare-fun e!634179 () Bool)

(assert (=> b!1111848 (= e!634180 (not e!634179))))

(declare-fun res!741616 () Bool)

(assert (=> b!1111848 (=> res!741616 e!634179)))

(assert (=> b!1111848 (= res!741616 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35284 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111848 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36419 0))(
  ( (Unit!36420) )
))
(declare-fun lt!496695 () Unit!36419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72201 (_ BitVec 64) (_ BitVec 32)) Unit!36419)

(assert (=> b!1111848 (= lt!496695 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111849 () Bool)

(assert (=> b!1111849 (= e!634179 true)))

(assert (=> b!1111849 e!634178))

(declare-fun c!109643 () Bool)

(assert (=> b!1111849 (= c!109643 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496696 () Unit!36419)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!302 (array!72201 array!72203 (_ BitVec 32) (_ BitVec 32) V!41961 V!41961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36419)

(assert (=> b!1111849 (= lt!496696 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97630 res!741612) b!1111847))

(assert (= (and b!1111847 res!741619) b!1111838))

(assert (= (and b!1111838 res!741613) b!1111844))

(assert (= (and b!1111844 res!741615) b!1111842))

(assert (= (and b!1111842 res!741617) b!1111834))

(assert (= (and b!1111834 res!741611) b!1111835))

(assert (= (and b!1111835 res!741609) b!1111845))

(assert (= (and b!1111845 res!741610) b!1111846))

(assert (= (and b!1111846 res!741614) b!1111841))

(assert (= (and b!1111841 res!741618) b!1111848))

(assert (= (and b!1111848 (not res!741616)) b!1111849))

(assert (= (and b!1111849 c!109643) b!1111843))

(assert (= (and b!1111849 (not c!109643)) b!1111836))

(assert (= (or b!1111843 b!1111836) bm!46856))

(assert (= (or b!1111843 b!1111836) bm!46855))

(assert (= (and b!1111840 condMapEmpty!43255) mapIsEmpty!43255))

(assert (= (and b!1111840 (not condMapEmpty!43255)) mapNonEmpty!43255))

(get-info :version)

(assert (= (and mapNonEmpty!43255 ((_ is ValueCellFull!13103) mapValue!43255)) b!1111839))

(assert (= (and b!1111840 ((_ is ValueCellFull!13103) mapDefault!43255)) b!1111837))

(assert (= start!97630 b!1111840))

(declare-fun b_lambda!18395 () Bool)

(assert (=> (not b_lambda!18395) (not bm!46856)))

(declare-fun t!34643 () Bool)

(declare-fun tb!8223 () Bool)

(assert (=> (and start!97630 (= defaultEntry!1004 defaultEntry!1004) t!34643) tb!8223))

(declare-fun result!17015 () Bool)

(assert (=> tb!8223 (= result!17015 tp_is_empty!27625)))

(assert (=> bm!46856 t!34643))

(declare-fun b_and!37575 () Bool)

(assert (= b_and!37573 (and (=> t!34643 result!17015) b_and!37575)))

(declare-fun m!1030209 () Bool)

(assert (=> b!1111843 m!1030209))

(declare-fun m!1030211 () Bool)

(assert (=> b!1111842 m!1030211))

(declare-fun m!1030213 () Bool)

(assert (=> start!97630 m!1030213))

(declare-fun m!1030215 () Bool)

(assert (=> start!97630 m!1030215))

(declare-fun m!1030217 () Bool)

(assert (=> b!1111846 m!1030217))

(declare-fun m!1030219 () Bool)

(assert (=> b!1111846 m!1030219))

(declare-fun m!1030221 () Bool)

(assert (=> b!1111841 m!1030221))

(declare-fun m!1030223 () Bool)

(assert (=> b!1111844 m!1030223))

(declare-fun m!1030225 () Bool)

(assert (=> bm!46855 m!1030225))

(declare-fun m!1030227 () Bool)

(assert (=> bm!46856 m!1030227))

(declare-fun m!1030229 () Bool)

(assert (=> bm!46856 m!1030229))

(declare-fun m!1030231 () Bool)

(assert (=> bm!46856 m!1030231))

(declare-fun m!1030233 () Bool)

(assert (=> b!1111845 m!1030233))

(declare-fun m!1030235 () Bool)

(assert (=> b!1111849 m!1030235))

(declare-fun m!1030237 () Bool)

(assert (=> b!1111848 m!1030237))

(declare-fun m!1030239 () Bool)

(assert (=> b!1111848 m!1030239))

(declare-fun m!1030241 () Bool)

(assert (=> b!1111835 m!1030241))

(declare-fun m!1030243 () Bool)

(assert (=> mapNonEmpty!43255 m!1030243))

(declare-fun m!1030245 () Bool)

(assert (=> b!1111847 m!1030245))

(check-sat (not b!1111844) (not b!1111847) b_and!37575 (not b!1111841) (not b!1111848) (not start!97630) (not b!1111849) (not b!1111835) (not b_lambda!18395) (not b_next!23365) tp_is_empty!27625 (not mapNonEmpty!43255) (not bm!46855) (not b!1111843) (not b!1111846) (not bm!46856) (not b!1111842))
(check-sat b_and!37575 (not b_next!23365))
