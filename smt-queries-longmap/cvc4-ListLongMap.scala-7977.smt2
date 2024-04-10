; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98706 () Bool)

(assert start!98706)

(declare-fun b_free!24311 () Bool)

(declare-fun b_next!24311 () Bool)

(assert (=> start!98706 (= b_free!24311 (not b_next!24311))))

(declare-fun tp!85643 () Bool)

(declare-fun b_and!39471 () Bool)

(assert (=> start!98706 (= tp!85643 b_and!39471)))

(declare-datatypes ((V!43581 0))(
  ( (V!43582 (val!14477 Int)) )
))
(declare-fun zeroValue!944 () V!43581)

(declare-fun c!113661 () Bool)

(declare-fun c!113659 () Bool)

(declare-datatypes ((Unit!37782 0))(
  ( (Unit!37783) )
))
(declare-fun call!53279 () Unit!37782)

(declare-datatypes ((tuple2!18366 0))(
  ( (tuple2!18367 (_1!9194 (_ BitVec 64)) (_2!9194 V!43581)) )
))
(declare-datatypes ((List!25117 0))(
  ( (Nil!25114) (Cons!25113 (h!26322 tuple2!18366) (t!36420 List!25117)) )
))
(declare-datatypes ((ListLongMap!16335 0))(
  ( (ListLongMap!16336 (toList!8183 List!25117)) )
))
(declare-fun lt!514000 () ListLongMap!16335)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!53271 () Bool)

(declare-fun minValue!944 () V!43581)

(declare-fun addStillContains!855 (ListLongMap!16335 (_ BitVec 64) V!43581 (_ BitVec 64)) Unit!37782)

(assert (=> bm!53271 (= call!53279 (addStillContains!855 lt!514000 (ite (or c!113659 c!113661) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113659 c!113661) zeroValue!944 minValue!944) k!934))))

(declare-fun call!53274 () ListLongMap!16335)

(declare-fun e!653726 () Bool)

(declare-fun call!53275 () ListLongMap!16335)

(declare-fun b!1149318 () Bool)

(declare-fun -!1318 (ListLongMap!16335 (_ BitVec 64)) ListLongMap!16335)

(assert (=> b!1149318 (= e!653726 (= call!53274 (-!1318 call!53275 k!934)))))

(declare-fun bm!53272 () Bool)

(declare-fun call!53281 () Unit!37782)

(assert (=> bm!53272 (= call!53281 call!53279)))

(declare-fun b!1149319 () Bool)

(declare-fun res!764672 () Bool)

(declare-fun e!653725 () Bool)

(assert (=> b!1149319 (=> (not res!764672) (not e!653725))))

(declare-datatypes ((array!74529 0))(
  ( (array!74530 (arr!35915 (Array (_ BitVec 32) (_ BitVec 64))) (size!36451 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74529)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149319 (= res!764672 (= (select (arr!35915 _keys!1208) i!673) k!934))))

(declare-fun lt!514007 () ListLongMap!16335)

(declare-fun bm!53273 () Bool)

(declare-fun call!53278 () ListLongMap!16335)

(declare-fun +!3605 (ListLongMap!16335 tuple2!18366) ListLongMap!16335)

(assert (=> bm!53273 (= call!53278 (+!3605 (ite c!113659 lt!514007 lt!514000) (ite c!113659 (tuple2!18367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113661 (tuple2!18367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!53274 () Bool)

(declare-fun call!53277 () Bool)

(declare-fun call!53280 () Bool)

(assert (=> bm!53274 (= call!53277 call!53280)))

(declare-fun mapIsEmpty!45086 () Bool)

(declare-fun mapRes!45086 () Bool)

(assert (=> mapIsEmpty!45086 mapRes!45086))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!653714 () Bool)

(declare-fun b!1149321 () Bool)

(declare-fun arrayContainsKey!0 (array!74529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149321 (= e!653714 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149322 () Bool)

(declare-fun e!653727 () Bool)

(assert (=> b!1149322 (= e!653727 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45086 () Bool)

(declare-fun tp!85644 () Bool)

(declare-fun e!653722 () Bool)

(assert (=> mapNonEmpty!45086 (= mapRes!45086 (and tp!85644 e!653722))))

(declare-fun mapKey!45086 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13711 0))(
  ( (ValueCellFull!13711 (v!17114 V!43581)) (EmptyCell!13711) )
))
(declare-fun mapRest!45086 () (Array (_ BitVec 32) ValueCell!13711))

(declare-fun mapValue!45086 () ValueCell!13711)

(declare-datatypes ((array!74531 0))(
  ( (array!74532 (arr!35916 (Array (_ BitVec 32) ValueCell!13711)) (size!36452 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74531)

(assert (=> mapNonEmpty!45086 (= (arr!35916 _values!996) (store mapRest!45086 mapKey!45086 mapValue!45086))))

(declare-fun b!1149323 () Bool)

(declare-fun e!653720 () Unit!37782)

(declare-fun Unit!37784 () Unit!37782)

(assert (=> b!1149323 (= e!653720 Unit!37784)))

(declare-fun b!1149324 () Bool)

(assert (=> b!1149324 call!53277))

(declare-fun lt!514006 () Unit!37782)

(assert (=> b!1149324 (= lt!514006 call!53281)))

(declare-fun e!653730 () Unit!37782)

(assert (=> b!1149324 (= e!653730 lt!514006)))

(declare-fun b!1149325 () Bool)

(declare-fun res!764669 () Bool)

(assert (=> b!1149325 (=> (not res!764669) (not e!653725))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1149325 (= res!764669 (and (= (size!36452 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36451 _keys!1208) (size!36452 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149326 () Bool)

(assert (=> b!1149326 (= e!653726 (= call!53274 call!53275))))

(declare-fun lt!513998 () ListLongMap!16335)

(declare-fun lt!513996 () array!74529)

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1149327 () Bool)

(declare-fun lt!513999 () array!74531)

(declare-fun e!653729 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4656 (array!74529 array!74531 (_ BitVec 32) (_ BitVec 32) V!43581 V!43581 (_ BitVec 32) Int) ListLongMap!16335)

(assert (=> b!1149327 (= e!653729 (= lt!513998 (getCurrentListMapNoExtraKeys!4656 lt!513996 lt!513999 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1149328 () Bool)

(declare-fun res!764671 () Bool)

(assert (=> b!1149328 (=> (not res!764671) (not e!653725))))

(assert (=> b!1149328 (= res!764671 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36451 _keys!1208))))))

(declare-fun b!1149329 () Bool)

(declare-fun tp_is_empty!28841 () Bool)

(assert (=> b!1149329 (= e!653722 tp_is_empty!28841)))

(declare-fun b!1149330 () Bool)

(declare-fun e!653717 () Bool)

(declare-fun e!653715 () Bool)

(assert (=> b!1149330 (= e!653717 (and e!653715 mapRes!45086))))

(declare-fun condMapEmpty!45086 () Bool)

(declare-fun mapDefault!45086 () ValueCell!13711)

