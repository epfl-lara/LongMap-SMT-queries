; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98786 () Bool)

(assert start!98786)

(declare-fun b_free!24391 () Bool)

(declare-fun b_next!24391 () Bool)

(assert (=> start!98786 (= b_free!24391 (not b_next!24391))))

(declare-fun tp!85884 () Bool)

(declare-fun b_and!39631 () Bool)

(assert (=> start!98786 (= tp!85884 b_and!39631)))

(declare-fun b!1152998 () Bool)

(declare-fun e!655766 () Bool)

(declare-fun tp_is_empty!28921 () Bool)

(assert (=> b!1152998 (= e!655766 tp_is_empty!28921)))

(declare-fun b!1152999 () Bool)

(declare-datatypes ((Unit!37946 0))(
  ( (Unit!37947) )
))
(declare-fun e!655761 () Unit!37946)

(declare-fun Unit!37948 () Unit!37946)

(assert (=> b!1152999 (= e!655761 Unit!37948)))

(declare-fun b!1153000 () Bool)

(declare-fun c!114380 () Bool)

(declare-fun lt!516647 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1153000 (= c!114380 (and (not lt!516647) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655756 () Unit!37946)

(declare-fun e!655765 () Unit!37946)

(assert (=> b!1153000 (= e!655756 e!655765)))

(declare-datatypes ((array!74689 0))(
  ( (array!74690 (arr!35995 (Array (_ BitVec 32) (_ BitVec 64))) (size!36531 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74689)

(declare-fun b!1153001 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!655763 () Bool)

(declare-fun arrayContainsKey!0 (array!74689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153001 (= e!655763 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153002 () Bool)

(declare-fun e!655764 () Bool)

(declare-fun e!655767 () Bool)

(assert (=> b!1153002 (= e!655764 e!655767)))

(declare-fun res!766471 () Bool)

(assert (=> b!1153002 (=> res!766471 e!655767)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153002 (= res!766471 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43689 0))(
  ( (V!43690 (val!14517 Int)) )
))
(declare-fun zeroValue!944 () V!43689)

(declare-datatypes ((ValueCell!13751 0))(
  ( (ValueCellFull!13751 (v!17154 V!43689)) (EmptyCell!13751) )
))
(declare-datatypes ((array!74691 0))(
  ( (array!74692 (arr!35996 (Array (_ BitVec 32) ValueCell!13751)) (size!36532 (_ BitVec 32))) )
))
(declare-fun lt!516642 () array!74691)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18442 0))(
  ( (tuple2!18443 (_1!9232 (_ BitVec 64)) (_2!9232 V!43689)) )
))
(declare-datatypes ((List!25189 0))(
  ( (Nil!25186) (Cons!25185 (h!26394 tuple2!18442) (t!36572 List!25189)) )
))
(declare-datatypes ((ListLongMap!16411 0))(
  ( (ListLongMap!16412 (toList!8221 List!25189)) )
))
(declare-fun lt!516643 () ListLongMap!16411)

(declare-fun minValue!944 () V!43689)

(declare-fun lt!516654 () array!74689)

(declare-fun getCurrentListMapNoExtraKeys!4691 (array!74689 array!74691 (_ BitVec 32) (_ BitVec 32) V!43689 V!43689 (_ BitVec 32) Int) ListLongMap!16411)

(assert (=> b!1153002 (= lt!516643 (getCurrentListMapNoExtraKeys!4691 lt!516654 lt!516642 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516653 () V!43689)

(declare-fun _values!996 () array!74691)

(assert (=> b!1153002 (= lt!516642 (array!74692 (store (arr!35996 _values!996) i!673 (ValueCellFull!13751 lt!516653)) (size!36532 _values!996)))))

(declare-fun dynLambda!2710 (Int (_ BitVec 64)) V!43689)

(assert (=> b!1153002 (= lt!516653 (dynLambda!2710 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516639 () ListLongMap!16411)

(assert (=> b!1153002 (= lt!516639 (getCurrentListMapNoExtraKeys!4691 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153003 () Bool)

(declare-fun res!766476 () Bool)

(declare-fun e!655770 () Bool)

(assert (=> b!1153003 (=> (not res!766476) (not e!655770))))

(declare-datatypes ((List!25190 0))(
  ( (Nil!25187) (Cons!25186 (h!26395 (_ BitVec 64)) (t!36573 List!25190)) )
))
(declare-fun arrayNoDuplicates!0 (array!74689 (_ BitVec 32) List!25190) Bool)

(assert (=> b!1153003 (= res!766476 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25187))))

(declare-fun call!54241 () ListLongMap!16411)

(declare-fun bm!54231 () Bool)

(assert (=> bm!54231 (= call!54241 (getCurrentListMapNoExtraKeys!4691 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153004 () Bool)

(declare-fun e!655768 () Bool)

(assert (=> b!1153004 (= e!655768 (not e!655764))))

(declare-fun res!766477 () Bool)

(assert (=> b!1153004 (=> res!766477 e!655764)))

(assert (=> b!1153004 (= res!766477 (bvsgt from!1455 i!673))))

(assert (=> b!1153004 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!516648 () Unit!37946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74689 (_ BitVec 64) (_ BitVec 32)) Unit!37946)

(assert (=> b!1153004 (= lt!516648 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!54232 () Bool)

(declare-fun call!54239 () ListLongMap!16411)

(declare-fun c!114381 () Bool)

(declare-fun lt!516656 () ListLongMap!16411)

(declare-fun +!3637 (ListLongMap!16411 tuple2!18442) ListLongMap!16411)

(assert (=> bm!54232 (= call!54239 (+!3637 lt!516656 (ite (or c!114381 c!114380) (tuple2!18443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1153005 () Bool)

(declare-fun res!766478 () Bool)

(assert (=> b!1153005 (=> (not res!766478) (not e!655770))))

(assert (=> b!1153005 (= res!766478 (and (= (size!36532 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36531 _keys!1208) (size!36532 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153006 () Bool)

(assert (=> b!1153006 (= e!655770 e!655768)))

(declare-fun res!766472 () Bool)

(assert (=> b!1153006 (=> (not res!766472) (not e!655768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74689 (_ BitVec 32)) Bool)

(assert (=> b!1153006 (= res!766472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516654 mask!1564))))

(assert (=> b!1153006 (= lt!516654 (array!74690 (store (arr!35995 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36531 _keys!1208)))))

(declare-fun mapIsEmpty!45206 () Bool)

(declare-fun mapRes!45206 () Bool)

(assert (=> mapIsEmpty!45206 mapRes!45206))

(declare-fun b!1153007 () Bool)

(declare-fun lt!516644 () Unit!37946)

(assert (=> b!1153007 (= e!655765 lt!516644)))

(declare-fun call!54235 () Unit!37946)

(assert (=> b!1153007 (= lt!516644 call!54235)))

(declare-fun call!54240 () Bool)

(assert (=> b!1153007 call!54240))

(declare-fun b!1153008 () Bool)

(declare-fun e!655755 () Bool)

(declare-fun call!54234 () ListLongMap!16411)

(assert (=> b!1153008 (= e!655755 (= call!54234 call!54241))))

(declare-fun b!1153009 () Bool)

(declare-fun e!655754 () Bool)

(assert (=> b!1153009 (= e!655754 (and e!655766 mapRes!45206))))

(declare-fun condMapEmpty!45206 () Bool)

(declare-fun mapDefault!45206 () ValueCell!13751)

