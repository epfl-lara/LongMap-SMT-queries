; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100672 () Bool)

(assert start!100672)

(declare-fun b_free!25909 () Bool)

(declare-fun b_next!25909 () Bool)

(assert (=> start!100672 (= b_free!25909 (not b_next!25909))))

(declare-fun tp!90724 () Bool)

(declare-fun b_and!42743 () Bool)

(assert (=> start!100672 (= tp!90724 b_and!42743)))

(declare-datatypes ((V!45945 0))(
  ( (V!45946 (val!15363 Int)) )
))
(declare-fun zeroValue!944 () V!45945)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!58170 () Bool)

(declare-datatypes ((array!77918 0))(
  ( (array!77919 (arr!37602 (Array (_ BitVec 32) (_ BitVec 64))) (size!38140 (_ BitVec 32))) )
))
(declare-fun lt!545933 () array!77918)

(declare-fun minValue!944 () V!45945)

(declare-datatypes ((ValueCell!14597 0))(
  ( (ValueCellFull!14597 (v!18004 V!45945)) (EmptyCell!14597) )
))
(declare-datatypes ((array!77920 0))(
  ( (array!77921 (arr!37603 (Array (_ BitVec 32) ValueCell!14597)) (size!38141 (_ BitVec 32))) )
))
(declare-fun lt!545941 () array!77920)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19770 0))(
  ( (tuple2!19771 (_1!9896 (_ BitVec 64)) (_2!9896 V!45945)) )
))
(declare-datatypes ((List!26555 0))(
  ( (Nil!26552) (Cons!26551 (h!27760 tuple2!19770) (t!39435 List!26555)) )
))
(declare-datatypes ((ListLongMap!17739 0))(
  ( (ListLongMap!17740 (toList!8885 List!26555)) )
))
(declare-fun call!58175 () ListLongMap!17739)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5331 (array!77918 array!77920 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 32) Int) ListLongMap!17739)

(assert (=> bm!58170 (= call!58175 (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58171 () Bool)

(declare-fun call!58173 () Bool)

(declare-fun call!58176 () Bool)

(assert (=> bm!58171 (= call!58173 call!58176)))

(declare-fun bm!58172 () Bool)

(declare-fun _keys!1208 () array!77918)

(declare-fun _values!996 () array!77920)

(declare-fun call!58180 () ListLongMap!17739)

(assert (=> bm!58172 (= call!58180 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!683835 () Bool)

(declare-fun b!1204218 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1778 (ListLongMap!17739 (_ BitVec 64)) ListLongMap!17739)

(assert (=> b!1204218 (= e!683835 (= call!58175 (-!1778 call!58180 k0!934)))))

(declare-fun b!1204219 () Bool)

(declare-fun res!801191 () Bool)

(declare-fun e!683837 () Bool)

(assert (=> b!1204219 (=> (not res!801191) (not e!683837))))

(declare-datatypes ((List!26556 0))(
  ( (Nil!26553) (Cons!26552 (h!27761 (_ BitVec 64)) (t!39436 List!26556)) )
))
(declare-fun arrayNoDuplicates!0 (array!77918 (_ BitVec 32) List!26556) Bool)

(assert (=> b!1204219 (= res!801191 (arrayNoDuplicates!0 lt!545933 #b00000000000000000000000000000000 Nil!26553))))

(declare-fun e!683836 () Bool)

(declare-fun b!1204220 () Bool)

(declare-fun arrayContainsKey!0 (array!77918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204220 (= e!683836 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!801196 () Bool)

(declare-fun e!683846 () Bool)

(assert (=> start!100672 (=> (not res!801196) (not e!683846))))

(assert (=> start!100672 (= res!801196 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38140 _keys!1208))))))

(assert (=> start!100672 e!683846))

(declare-fun tp_is_empty!30613 () Bool)

(assert (=> start!100672 tp_is_empty!30613))

(declare-fun array_inv!28758 (array!77918) Bool)

(assert (=> start!100672 (array_inv!28758 _keys!1208)))

(assert (=> start!100672 true))

(assert (=> start!100672 tp!90724))

(declare-fun e!683843 () Bool)

(declare-fun array_inv!28759 (array!77920) Bool)

(assert (=> start!100672 (and (array_inv!28759 _values!996) e!683843)))

(declare-fun b!1204221 () Bool)

(declare-datatypes ((Unit!39778 0))(
  ( (Unit!39779) )
))
(declare-fun e!683838 () Unit!39778)

(declare-fun lt!545945 () Unit!39778)

(assert (=> b!1204221 (= e!683838 lt!545945)))

(declare-fun lt!545943 () Unit!39778)

(declare-fun call!58177 () Unit!39778)

(assert (=> b!1204221 (= lt!545943 call!58177)))

(declare-fun lt!545940 () ListLongMap!17739)

(declare-fun call!58178 () ListLongMap!17739)

(assert (=> b!1204221 (= lt!545940 call!58178)))

(assert (=> b!1204221 call!58176))

(declare-fun addStillContains!1001 (ListLongMap!17739 (_ BitVec 64) V!45945 (_ BitVec 64)) Unit!39778)

(assert (=> b!1204221 (= lt!545945 (addStillContains!1001 lt!545940 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6883 (ListLongMap!17739 (_ BitVec 64)) Bool)

(declare-fun +!4017 (ListLongMap!17739 tuple2!19770) ListLongMap!17739)

(assert (=> b!1204221 (contains!6883 (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1204222 () Bool)

(declare-fun e!683847 () Bool)

(assert (=> b!1204222 (= e!683847 tp_is_empty!30613)))

(declare-fun b!1204223 () Bool)

(declare-fun res!801195 () Bool)

(assert (=> b!1204223 (=> (not res!801195) (not e!683846))))

(assert (=> b!1204223 (= res!801195 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26553))))

(declare-fun bm!58173 () Bool)

(declare-fun call!58174 () Unit!39778)

(assert (=> bm!58173 (= call!58174 call!58177)))

(declare-fun b!1204224 () Bool)

(declare-fun e!683840 () Bool)

(declare-fun mapRes!47769 () Bool)

(assert (=> b!1204224 (= e!683843 (and e!683840 mapRes!47769))))

(declare-fun condMapEmpty!47769 () Bool)

(declare-fun mapDefault!47769 () ValueCell!14597)

(assert (=> b!1204224 (= condMapEmpty!47769 (= (arr!37603 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14597)) mapDefault!47769)))))

(declare-fun b!1204225 () Bool)

(assert (=> b!1204225 (= e!683846 e!683837)))

(declare-fun res!801192 () Bool)

(assert (=> b!1204225 (=> (not res!801192) (not e!683837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77918 (_ BitVec 32)) Bool)

(assert (=> b!1204225 (= res!801192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545933 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204225 (= lt!545933 (array!77919 (store (arr!37602 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38140 _keys!1208)))))

(declare-fun b!1204226 () Bool)

(declare-fun res!801194 () Bool)

(assert (=> b!1204226 (=> (not res!801194) (not e!683846))))

(assert (=> b!1204226 (= res!801194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1204227 () Bool)

(declare-fun e!683845 () Unit!39778)

(assert (=> b!1204227 (= e!683838 e!683845)))

(declare-fun c!118034 () Bool)

(declare-fun lt!545939 () Bool)

(assert (=> b!1204227 (= c!118034 (and (not lt!545939) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204228 () Bool)

(declare-fun e!683848 () Bool)

(assert (=> b!1204228 (= e!683837 (not e!683848))))

(declare-fun res!801189 () Bool)

(assert (=> b!1204228 (=> res!801189 e!683848)))

(assert (=> b!1204228 (= res!801189 (bvsgt from!1455 i!673))))

(assert (=> b!1204228 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545936 () Unit!39778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77918 (_ BitVec 64) (_ BitVec 32)) Unit!39778)

(assert (=> b!1204228 (= lt!545936 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1204229 () Bool)

(declare-fun res!801199 () Bool)

(assert (=> b!1204229 (=> (not res!801199) (not e!683846))))

(assert (=> b!1204229 (= res!801199 (and (= (size!38141 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38140 _keys!1208) (size!38141 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1204230 () Bool)

(assert (=> b!1204230 (= e!683836 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!545939) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!47769 () Bool)

(assert (=> mapIsEmpty!47769 mapRes!47769))

(declare-fun b!1204231 () Bool)

(assert (=> b!1204231 call!58173))

(declare-fun lt!545932 () Unit!39778)

(assert (=> b!1204231 (= lt!545932 call!58174)))

(assert (=> b!1204231 (= e!683845 lt!545932)))

(declare-fun b!1204232 () Bool)

(declare-fun e!683834 () Unit!39778)

(declare-fun lt!545937 () Unit!39778)

(assert (=> b!1204232 (= e!683834 lt!545937)))

(assert (=> b!1204232 (= lt!545937 call!58174)))

(assert (=> b!1204232 call!58173))

(declare-fun bm!58174 () Bool)

(declare-fun lt!545934 () ListLongMap!17739)

(declare-fun c!118036 () Bool)

(assert (=> bm!58174 (= call!58177 (addStillContains!1001 lt!545934 (ite (or c!118036 c!118034) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118036 c!118034) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1204233 () Bool)

(declare-fun e!683839 () Bool)

(declare-fun e!683841 () Bool)

(assert (=> b!1204233 (= e!683839 e!683841)))

(declare-fun res!801197 () Bool)

(assert (=> b!1204233 (=> res!801197 e!683841)))

(assert (=> b!1204233 (= res!801197 (not (contains!6883 lt!545934 k0!934)))))

(assert (=> b!1204233 (= lt!545934 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204234 () Bool)

(declare-fun res!801193 () Bool)

(assert (=> b!1204234 (=> (not res!801193) (not e!683846))))

(assert (=> b!1204234 (= res!801193 (= (select (arr!37602 _keys!1208) i!673) k0!934))))

(declare-fun b!1204235 () Bool)

(declare-fun e!683844 () Bool)

(assert (=> b!1204235 (= e!683844 e!683839)))

(declare-fun res!801200 () Bool)

(assert (=> b!1204235 (=> res!801200 e!683839)))

(assert (=> b!1204235 (= res!801200 (not (= (select (arr!37602 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1204235 e!683835))

(declare-fun c!118037 () Bool)

(assert (=> b!1204235 (= c!118037 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545938 () Unit!39778)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1026 (array!77918 array!77920 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39778)

(assert (=> b!1204235 (= lt!545938 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204236 () Bool)

(assert (=> b!1204236 (= e!683841 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1204236 e!683836))

(declare-fun c!118033 () Bool)

(assert (=> b!1204236 (= c!118033 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!545942 () Unit!39778)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!555 (array!77918 array!77920 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 64) (_ BitVec 32) Int) Unit!39778)

(assert (=> b!1204236 (= lt!545942 (lemmaListMapContainsThenArrayContainsFrom!555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545931 () Unit!39778)

(assert (=> b!1204236 (= lt!545931 e!683838)))

(assert (=> b!1204236 (= c!118036 (and (not lt!545939) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204236 (= lt!545939 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1204237 () Bool)

(declare-fun c!118035 () Bool)

(assert (=> b!1204237 (= c!118035 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545939))))

(assert (=> b!1204237 (= e!683845 e!683834)))

(declare-fun b!1204238 () Bool)

(declare-fun res!801198 () Bool)

(assert (=> b!1204238 (=> (not res!801198) (not e!683846))))

(assert (=> b!1204238 (= res!801198 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38140 _keys!1208))))))

(declare-fun bm!58175 () Bool)

(declare-fun call!58179 () ListLongMap!17739)

(assert (=> bm!58175 (= call!58176 (contains!6883 (ite c!118036 lt!545940 call!58179) k0!934))))

(declare-fun bm!58176 () Bool)

(assert (=> bm!58176 (= call!58178 (+!4017 lt!545934 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204239 () Bool)

(assert (=> b!1204239 (= e!683840 tp_is_empty!30613)))

(declare-fun b!1204240 () Bool)

(declare-fun Unit!39780 () Unit!39778)

(assert (=> b!1204240 (= e!683834 Unit!39780)))

(declare-fun b!1204241 () Bool)

(assert (=> b!1204241 (= e!683848 e!683844)))

(declare-fun res!801190 () Bool)

(assert (=> b!1204241 (=> res!801190 e!683844)))

(assert (=> b!1204241 (= res!801190 (not (= from!1455 i!673)))))

(declare-fun lt!545935 () ListLongMap!17739)

(assert (=> b!1204241 (= lt!545935 (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3203 (Int (_ BitVec 64)) V!45945)

(assert (=> b!1204241 (= lt!545941 (array!77921 (store (arr!37603 _values!996) i!673 (ValueCellFull!14597 (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38141 _values!996)))))

(declare-fun lt!545944 () ListLongMap!17739)

(assert (=> b!1204241 (= lt!545944 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1204242 () Bool)

(assert (=> b!1204242 (= e!683835 (= call!58175 call!58180))))

(declare-fun mapNonEmpty!47769 () Bool)

(declare-fun tp!90723 () Bool)

(assert (=> mapNonEmpty!47769 (= mapRes!47769 (and tp!90723 e!683847))))

(declare-fun mapValue!47769 () ValueCell!14597)

(declare-fun mapRest!47769 () (Array (_ BitVec 32) ValueCell!14597))

(declare-fun mapKey!47769 () (_ BitVec 32))

(assert (=> mapNonEmpty!47769 (= (arr!37603 _values!996) (store mapRest!47769 mapKey!47769 mapValue!47769))))

(declare-fun b!1204243 () Bool)

(declare-fun res!801188 () Bool)

(assert (=> b!1204243 (=> (not res!801188) (not e!683846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204243 (= res!801188 (validKeyInArray!0 k0!934))))

(declare-fun b!1204244 () Bool)

(declare-fun res!801201 () Bool)

(assert (=> b!1204244 (=> (not res!801201) (not e!683846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204244 (= res!801201 (validMask!0 mask!1564))))

(declare-fun bm!58177 () Bool)

(assert (=> bm!58177 (= call!58179 call!58178)))

(assert (= (and start!100672 res!801196) b!1204244))

(assert (= (and b!1204244 res!801201) b!1204229))

(assert (= (and b!1204229 res!801199) b!1204226))

(assert (= (and b!1204226 res!801194) b!1204223))

(assert (= (and b!1204223 res!801195) b!1204238))

(assert (= (and b!1204238 res!801198) b!1204243))

(assert (= (and b!1204243 res!801188) b!1204234))

(assert (= (and b!1204234 res!801193) b!1204225))

(assert (= (and b!1204225 res!801192) b!1204219))

(assert (= (and b!1204219 res!801191) b!1204228))

(assert (= (and b!1204228 (not res!801189)) b!1204241))

(assert (= (and b!1204241 (not res!801190)) b!1204235))

(assert (= (and b!1204235 c!118037) b!1204218))

(assert (= (and b!1204235 (not c!118037)) b!1204242))

(assert (= (or b!1204218 b!1204242) bm!58170))

(assert (= (or b!1204218 b!1204242) bm!58172))

(assert (= (and b!1204235 (not res!801200)) b!1204233))

(assert (= (and b!1204233 (not res!801197)) b!1204236))

(assert (= (and b!1204236 c!118036) b!1204221))

(assert (= (and b!1204236 (not c!118036)) b!1204227))

(assert (= (and b!1204227 c!118034) b!1204231))

(assert (= (and b!1204227 (not c!118034)) b!1204237))

(assert (= (and b!1204237 c!118035) b!1204232))

(assert (= (and b!1204237 (not c!118035)) b!1204240))

(assert (= (or b!1204231 b!1204232) bm!58173))

(assert (= (or b!1204231 b!1204232) bm!58177))

(assert (= (or b!1204231 b!1204232) bm!58171))

(assert (= (or b!1204221 bm!58171) bm!58175))

(assert (= (or b!1204221 bm!58173) bm!58174))

(assert (= (or b!1204221 bm!58177) bm!58176))

(assert (= (and b!1204236 c!118033) b!1204220))

(assert (= (and b!1204236 (not c!118033)) b!1204230))

(assert (= (and b!1204224 condMapEmpty!47769) mapIsEmpty!47769))

(assert (= (and b!1204224 (not condMapEmpty!47769)) mapNonEmpty!47769))

(get-info :version)

(assert (= (and mapNonEmpty!47769 ((_ is ValueCellFull!14597) mapValue!47769)) b!1204222))

(assert (= (and b!1204224 ((_ is ValueCellFull!14597) mapDefault!47769)) b!1204239))

(assert (= start!100672 b!1204224))

(declare-fun b_lambda!21211 () Bool)

(assert (=> (not b_lambda!21211) (not b!1204241)))

(declare-fun t!39434 () Bool)

(declare-fun tb!10701 () Bool)

(assert (=> (and start!100672 (= defaultEntry!1004 defaultEntry!1004) t!39434) tb!10701))

(declare-fun result!21991 () Bool)

(assert (=> tb!10701 (= result!21991 tp_is_empty!30613)))

(assert (=> b!1204241 t!39434))

(declare-fun b_and!42745 () Bool)

(assert (= b_and!42743 (and (=> t!39434 result!21991) b_and!42745)))

(declare-fun m!1109731 () Bool)

(assert (=> b!1204219 m!1109731))

(declare-fun m!1109733 () Bool)

(assert (=> b!1204218 m!1109733))

(declare-fun m!1109735 () Bool)

(assert (=> bm!58172 m!1109735))

(declare-fun m!1109737 () Bool)

(assert (=> bm!58175 m!1109737))

(declare-fun m!1109739 () Bool)

(assert (=> bm!58176 m!1109739))

(declare-fun m!1109741 () Bool)

(assert (=> b!1204235 m!1109741))

(declare-fun m!1109743 () Bool)

(assert (=> b!1204235 m!1109743))

(declare-fun m!1109745 () Bool)

(assert (=> bm!58174 m!1109745))

(declare-fun m!1109747 () Bool)

(assert (=> bm!58170 m!1109747))

(declare-fun m!1109749 () Bool)

(assert (=> b!1204226 m!1109749))

(declare-fun m!1109751 () Bool)

(assert (=> b!1204234 m!1109751))

(declare-fun m!1109753 () Bool)

(assert (=> b!1204225 m!1109753))

(declare-fun m!1109755 () Bool)

(assert (=> b!1204225 m!1109755))

(declare-fun m!1109757 () Bool)

(assert (=> mapNonEmpty!47769 m!1109757))

(declare-fun m!1109759 () Bool)

(assert (=> b!1204228 m!1109759))

(declare-fun m!1109761 () Bool)

(assert (=> b!1204228 m!1109761))

(declare-fun m!1109763 () Bool)

(assert (=> b!1204221 m!1109763))

(declare-fun m!1109765 () Bool)

(assert (=> b!1204221 m!1109765))

(assert (=> b!1204221 m!1109765))

(declare-fun m!1109767 () Bool)

(assert (=> b!1204221 m!1109767))

(declare-fun m!1109769 () Bool)

(assert (=> start!100672 m!1109769))

(declare-fun m!1109771 () Bool)

(assert (=> start!100672 m!1109771))

(declare-fun m!1109773 () Bool)

(assert (=> b!1204236 m!1109773))

(declare-fun m!1109775 () Bool)

(assert (=> b!1204236 m!1109775))

(declare-fun m!1109777 () Bool)

(assert (=> b!1204241 m!1109777))

(declare-fun m!1109779 () Bool)

(assert (=> b!1204241 m!1109779))

(declare-fun m!1109781 () Bool)

(assert (=> b!1204241 m!1109781))

(declare-fun m!1109783 () Bool)

(assert (=> b!1204241 m!1109783))

(assert (=> b!1204220 m!1109773))

(declare-fun m!1109785 () Bool)

(assert (=> b!1204233 m!1109785))

(assert (=> b!1204233 m!1109735))

(declare-fun m!1109787 () Bool)

(assert (=> b!1204223 m!1109787))

(declare-fun m!1109789 () Bool)

(assert (=> b!1204244 m!1109789))

(declare-fun m!1109791 () Bool)

(assert (=> b!1204243 m!1109791))

(check-sat (not b!1204244) tp_is_empty!30613 (not start!100672) (not b!1204221) (not b!1204236) (not b!1204225) (not b_next!25909) (not b!1204228) (not bm!58175) (not bm!58176) (not bm!58170) (not b_lambda!21211) b_and!42745 (not b!1204243) (not mapNonEmpty!47769) (not b!1204220) (not b!1204219) (not bm!58172) (not b!1204233) (not b!1204235) (not bm!58174) (not b!1204223) (not b!1204226) (not b!1204218) (not b!1204241))
(check-sat b_and!42745 (not b_next!25909))
(get-model)

(declare-fun b_lambda!21217 () Bool)

(assert (= b_lambda!21211 (or (and start!100672 b_free!25909) b_lambda!21217)))

(check-sat (not bm!58170) (not b!1204244) tp_is_empty!30613 (not start!100672) (not b!1204221) (not b!1204225) (not b_next!25909) (not b!1204228) (not bm!58175) (not bm!58176) b_and!42745 (not b!1204243) (not mapNonEmpty!47769) (not b!1204220) (not b!1204219) (not bm!58172) (not b_lambda!21217) (not b!1204236) (not b!1204233) (not b!1204235) (not bm!58174) (not b!1204223) (not b!1204226) (not b!1204218) (not b!1204241))
(check-sat b_and!42745 (not b_next!25909))
(get-model)

(declare-fun b!1204423 () Bool)

(declare-fun e!683947 () Bool)

(declare-fun call!58231 () Bool)

(assert (=> b!1204423 (= e!683947 call!58231)))

(declare-fun bm!58228 () Bool)

(declare-fun c!118070 () Bool)

(assert (=> bm!58228 (= call!58231 (arrayNoDuplicates!0 lt!545933 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118070 (Cons!26552 (select (arr!37602 lt!545933) #b00000000000000000000000000000000) Nil!26553) Nil!26553)))))

(declare-fun b!1204424 () Bool)

(declare-fun e!683950 () Bool)

(declare-fun e!683949 () Bool)

(assert (=> b!1204424 (= e!683950 e!683949)))

(declare-fun res!801294 () Bool)

(assert (=> b!1204424 (=> (not res!801294) (not e!683949))))

(declare-fun e!683948 () Bool)

(assert (=> b!1204424 (= res!801294 (not e!683948))))

(declare-fun res!801292 () Bool)

(assert (=> b!1204424 (=> (not res!801292) (not e!683948))))

(assert (=> b!1204424 (= res!801292 (validKeyInArray!0 (select (arr!37602 lt!545933) #b00000000000000000000000000000000)))))

(declare-fun b!1204425 () Bool)

(assert (=> b!1204425 (= e!683947 call!58231)))

(declare-fun d!132631 () Bool)

(declare-fun res!801293 () Bool)

(assert (=> d!132631 (=> res!801293 e!683950)))

(assert (=> d!132631 (= res!801293 (bvsge #b00000000000000000000000000000000 (size!38140 lt!545933)))))

(assert (=> d!132631 (= (arrayNoDuplicates!0 lt!545933 #b00000000000000000000000000000000 Nil!26553) e!683950)))

(declare-fun b!1204426 () Bool)

(assert (=> b!1204426 (= e!683949 e!683947)))

(assert (=> b!1204426 (= c!118070 (validKeyInArray!0 (select (arr!37602 lt!545933) #b00000000000000000000000000000000)))))

(declare-fun b!1204427 () Bool)

(declare-fun contains!6886 (List!26556 (_ BitVec 64)) Bool)

(assert (=> b!1204427 (= e!683948 (contains!6886 Nil!26553 (select (arr!37602 lt!545933) #b00000000000000000000000000000000)))))

(assert (= (and d!132631 (not res!801293)) b!1204424))

(assert (= (and b!1204424 res!801292) b!1204427))

(assert (= (and b!1204424 res!801294) b!1204426))

(assert (= (and b!1204426 c!118070) b!1204425))

(assert (= (and b!1204426 (not c!118070)) b!1204423))

(assert (= (or b!1204425 b!1204423) bm!58228))

(declare-fun m!1109917 () Bool)

(assert (=> bm!58228 m!1109917))

(declare-fun m!1109919 () Bool)

(assert (=> bm!58228 m!1109919))

(assert (=> b!1204424 m!1109917))

(assert (=> b!1204424 m!1109917))

(declare-fun m!1109921 () Bool)

(assert (=> b!1204424 m!1109921))

(assert (=> b!1204426 m!1109917))

(assert (=> b!1204426 m!1109917))

(assert (=> b!1204426 m!1109921))

(assert (=> b!1204427 m!1109917))

(assert (=> b!1204427 m!1109917))

(declare-fun m!1109923 () Bool)

(assert (=> b!1204427 m!1109923))

(assert (=> b!1204219 d!132631))

(declare-fun d!132633 () Bool)

(declare-fun res!801299 () Bool)

(declare-fun e!683955 () Bool)

(assert (=> d!132633 (=> res!801299 e!683955)))

(assert (=> d!132633 (= res!801299 (= (select (arr!37602 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132633 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!683955)))

(declare-fun b!1204432 () Bool)

(declare-fun e!683956 () Bool)

(assert (=> b!1204432 (= e!683955 e!683956)))

(declare-fun res!801300 () Bool)

(assert (=> b!1204432 (=> (not res!801300) (not e!683956))))

(assert (=> b!1204432 (= res!801300 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38140 _keys!1208)))))

(declare-fun b!1204433 () Bool)

(assert (=> b!1204433 (= e!683956 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132633 (not res!801299)) b!1204432))

(assert (= (and b!1204432 res!801300) b!1204433))

(declare-fun m!1109925 () Bool)

(assert (=> d!132633 m!1109925))

(declare-fun m!1109927 () Bool)

(assert (=> b!1204433 m!1109927))

(assert (=> b!1204220 d!132633))

(declare-fun d!132635 () Bool)

(declare-fun e!683962 () Bool)

(assert (=> d!132635 e!683962))

(declare-fun res!801303 () Bool)

(assert (=> d!132635 (=> res!801303 e!683962)))

(declare-fun lt!546047 () Bool)

(assert (=> d!132635 (= res!801303 (not lt!546047))))

(declare-fun lt!546046 () Bool)

(assert (=> d!132635 (= lt!546047 lt!546046)))

(declare-fun lt!546045 () Unit!39778)

(declare-fun e!683961 () Unit!39778)

(assert (=> d!132635 (= lt!546045 e!683961)))

(declare-fun c!118073 () Bool)

(assert (=> d!132635 (= c!118073 lt!546046)))

(declare-fun containsKey!589 (List!26555 (_ BitVec 64)) Bool)

(assert (=> d!132635 (= lt!546046 (containsKey!589 (toList!8885 (ite c!118036 lt!545940 call!58179)) k0!934))))

(assert (=> d!132635 (= (contains!6883 (ite c!118036 lt!545940 call!58179) k0!934) lt!546047)))

(declare-fun b!1204440 () Bool)

(declare-fun lt!546044 () Unit!39778)

(assert (=> b!1204440 (= e!683961 lt!546044)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!418 (List!26555 (_ BitVec 64)) Unit!39778)

(assert (=> b!1204440 (= lt!546044 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8885 (ite c!118036 lt!545940 call!58179)) k0!934))))

(declare-datatypes ((Option!686 0))(
  ( (Some!685 (v!18007 V!45945)) (None!684) )
))
(declare-fun isDefined!461 (Option!686) Bool)

(declare-fun getValueByKey!635 (List!26555 (_ BitVec 64)) Option!686)

(assert (=> b!1204440 (isDefined!461 (getValueByKey!635 (toList!8885 (ite c!118036 lt!545940 call!58179)) k0!934))))

(declare-fun b!1204441 () Bool)

(declare-fun Unit!39786 () Unit!39778)

(assert (=> b!1204441 (= e!683961 Unit!39786)))

(declare-fun b!1204442 () Bool)

(assert (=> b!1204442 (= e!683962 (isDefined!461 (getValueByKey!635 (toList!8885 (ite c!118036 lt!545940 call!58179)) k0!934)))))

(assert (= (and d!132635 c!118073) b!1204440))

(assert (= (and d!132635 (not c!118073)) b!1204441))

(assert (= (and d!132635 (not res!801303)) b!1204442))

(declare-fun m!1109929 () Bool)

(assert (=> d!132635 m!1109929))

(declare-fun m!1109931 () Bool)

(assert (=> b!1204440 m!1109931))

(declare-fun m!1109933 () Bool)

(assert (=> b!1204440 m!1109933))

(assert (=> b!1204440 m!1109933))

(declare-fun m!1109935 () Bool)

(assert (=> b!1204440 m!1109935))

(assert (=> b!1204442 m!1109933))

(assert (=> b!1204442 m!1109933))

(assert (=> b!1204442 m!1109935))

(assert (=> bm!58175 d!132635))

(declare-fun d!132637 () Bool)

(assert (=> d!132637 (= (array_inv!28758 _keys!1208) (bvsge (size!38140 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100672 d!132637))

(declare-fun d!132639 () Bool)

(assert (=> d!132639 (= (array_inv!28759 _values!996) (bvsge (size!38141 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100672 d!132639))

(declare-fun d!132641 () Bool)

(assert (=> d!132641 (contains!6883 (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!546050 () Unit!39778)

(declare-fun choose!1800 (ListLongMap!17739 (_ BitVec 64) V!45945 (_ BitVec 64)) Unit!39778)

(assert (=> d!132641 (= lt!546050 (choose!1800 lt!545940 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132641 (contains!6883 lt!545940 k0!934)))

(assert (=> d!132641 (= (addStillContains!1001 lt!545940 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!546050)))

(declare-fun bs!34060 () Bool)

(assert (= bs!34060 d!132641))

(assert (=> bs!34060 m!1109765))

(assert (=> bs!34060 m!1109765))

(assert (=> bs!34060 m!1109767))

(declare-fun m!1109937 () Bool)

(assert (=> bs!34060 m!1109937))

(declare-fun m!1109939 () Bool)

(assert (=> bs!34060 m!1109939))

(assert (=> b!1204221 d!132641))

(declare-fun d!132643 () Bool)

(declare-fun e!683964 () Bool)

(assert (=> d!132643 e!683964))

(declare-fun res!801304 () Bool)

(assert (=> d!132643 (=> res!801304 e!683964)))

(declare-fun lt!546054 () Bool)

(assert (=> d!132643 (= res!801304 (not lt!546054))))

(declare-fun lt!546053 () Bool)

(assert (=> d!132643 (= lt!546054 lt!546053)))

(declare-fun lt!546052 () Unit!39778)

(declare-fun e!683963 () Unit!39778)

(assert (=> d!132643 (= lt!546052 e!683963)))

(declare-fun c!118074 () Bool)

(assert (=> d!132643 (= c!118074 lt!546053)))

(assert (=> d!132643 (= lt!546053 (containsKey!589 (toList!8885 (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132643 (= (contains!6883 (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!546054)))

(declare-fun b!1204444 () Bool)

(declare-fun lt!546051 () Unit!39778)

(assert (=> b!1204444 (= e!683963 lt!546051)))

(assert (=> b!1204444 (= lt!546051 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8885 (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1204444 (isDefined!461 (getValueByKey!635 (toList!8885 (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1204445 () Bool)

(declare-fun Unit!39787 () Unit!39778)

(assert (=> b!1204445 (= e!683963 Unit!39787)))

(declare-fun b!1204446 () Bool)

(assert (=> b!1204446 (= e!683964 (isDefined!461 (getValueByKey!635 (toList!8885 (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132643 c!118074) b!1204444))

(assert (= (and d!132643 (not c!118074)) b!1204445))

(assert (= (and d!132643 (not res!801304)) b!1204446))

(declare-fun m!1109941 () Bool)

(assert (=> d!132643 m!1109941))

(declare-fun m!1109943 () Bool)

(assert (=> b!1204444 m!1109943))

(declare-fun m!1109945 () Bool)

(assert (=> b!1204444 m!1109945))

(assert (=> b!1204444 m!1109945))

(declare-fun m!1109947 () Bool)

(assert (=> b!1204444 m!1109947))

(assert (=> b!1204446 m!1109945))

(assert (=> b!1204446 m!1109945))

(assert (=> b!1204446 m!1109947))

(assert (=> b!1204221 d!132643))

(declare-fun d!132645 () Bool)

(declare-fun e!683967 () Bool)

(assert (=> d!132645 e!683967))

(declare-fun res!801310 () Bool)

(assert (=> d!132645 (=> (not res!801310) (not e!683967))))

(declare-fun lt!546063 () ListLongMap!17739)

(assert (=> d!132645 (= res!801310 (contains!6883 lt!546063 (_1!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!546065 () List!26555)

(assert (=> d!132645 (= lt!546063 (ListLongMap!17740 lt!546065))))

(declare-fun lt!546066 () Unit!39778)

(declare-fun lt!546064 () Unit!39778)

(assert (=> d!132645 (= lt!546066 lt!546064)))

(assert (=> d!132645 (= (getValueByKey!635 lt!546065 (_1!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!685 (_2!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!311 (List!26555 (_ BitVec 64) V!45945) Unit!39778)

(assert (=> d!132645 (= lt!546064 (lemmaContainsTupThenGetReturnValue!311 lt!546065 (_1!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!404 (List!26555 (_ BitVec 64) V!45945) List!26555)

(assert (=> d!132645 (= lt!546065 (insertStrictlySorted!404 (toList!8885 lt!545940) (_1!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132645 (= (+!4017 lt!545940 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!546063)))

(declare-fun b!1204451 () Bool)

(declare-fun res!801309 () Bool)

(assert (=> b!1204451 (=> (not res!801309) (not e!683967))))

(assert (=> b!1204451 (= res!801309 (= (getValueByKey!635 (toList!8885 lt!546063) (_1!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!685 (_2!9896 (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1204452 () Bool)

(declare-fun contains!6887 (List!26555 tuple2!19770) Bool)

(assert (=> b!1204452 (= e!683967 (contains!6887 (toList!8885 lt!546063) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132645 res!801310) b!1204451))

(assert (= (and b!1204451 res!801309) b!1204452))

(declare-fun m!1109949 () Bool)

(assert (=> d!132645 m!1109949))

(declare-fun m!1109951 () Bool)

(assert (=> d!132645 m!1109951))

(declare-fun m!1109953 () Bool)

(assert (=> d!132645 m!1109953))

(declare-fun m!1109955 () Bool)

(assert (=> d!132645 m!1109955))

(declare-fun m!1109957 () Bool)

(assert (=> b!1204451 m!1109957))

(declare-fun m!1109959 () Bool)

(assert (=> b!1204452 m!1109959))

(assert (=> b!1204221 d!132645))

(declare-fun d!132647 () Bool)

(declare-fun e!683968 () Bool)

(assert (=> d!132647 e!683968))

(declare-fun res!801312 () Bool)

(assert (=> d!132647 (=> (not res!801312) (not e!683968))))

(declare-fun lt!546067 () ListLongMap!17739)

(assert (=> d!132647 (= res!801312 (contains!6883 lt!546067 (_1!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!546069 () List!26555)

(assert (=> d!132647 (= lt!546067 (ListLongMap!17740 lt!546069))))

(declare-fun lt!546070 () Unit!39778)

(declare-fun lt!546068 () Unit!39778)

(assert (=> d!132647 (= lt!546070 lt!546068)))

(assert (=> d!132647 (= (getValueByKey!635 lt!546069 (_1!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!685 (_2!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132647 (= lt!546068 (lemmaContainsTupThenGetReturnValue!311 lt!546069 (_1!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132647 (= lt!546069 (insertStrictlySorted!404 (toList!8885 lt!545934) (_1!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132647 (= (+!4017 lt!545934 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!546067)))

(declare-fun b!1204453 () Bool)

(declare-fun res!801311 () Bool)

(assert (=> b!1204453 (=> (not res!801311) (not e!683968))))

(assert (=> b!1204453 (= res!801311 (= (getValueByKey!635 (toList!8885 lt!546067) (_1!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!685 (_2!9896 (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204454 () Bool)

(assert (=> b!1204454 (= e!683968 (contains!6887 (toList!8885 lt!546067) (ite (or c!118036 c!118034) (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132647 res!801312) b!1204453))

(assert (= (and b!1204453 res!801311) b!1204454))

(declare-fun m!1109961 () Bool)

(assert (=> d!132647 m!1109961))

(declare-fun m!1109963 () Bool)

(assert (=> d!132647 m!1109963))

(declare-fun m!1109965 () Bool)

(assert (=> d!132647 m!1109965))

(declare-fun m!1109967 () Bool)

(assert (=> d!132647 m!1109967))

(declare-fun m!1109969 () Bool)

(assert (=> b!1204453 m!1109969))

(declare-fun m!1109971 () Bool)

(assert (=> b!1204454 m!1109971))

(assert (=> bm!58176 d!132647))

(declare-fun b!1204455 () Bool)

(declare-fun e!683969 () Bool)

(declare-fun call!58232 () Bool)

(assert (=> b!1204455 (= e!683969 call!58232)))

(declare-fun bm!58229 () Bool)

(declare-fun c!118075 () Bool)

(assert (=> bm!58229 (= call!58232 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118075 (Cons!26552 (select (arr!37602 _keys!1208) #b00000000000000000000000000000000) Nil!26553) Nil!26553)))))

(declare-fun b!1204456 () Bool)

(declare-fun e!683972 () Bool)

(declare-fun e!683971 () Bool)

(assert (=> b!1204456 (= e!683972 e!683971)))

(declare-fun res!801315 () Bool)

(assert (=> b!1204456 (=> (not res!801315) (not e!683971))))

(declare-fun e!683970 () Bool)

(assert (=> b!1204456 (= res!801315 (not e!683970))))

(declare-fun res!801313 () Bool)

(assert (=> b!1204456 (=> (not res!801313) (not e!683970))))

(assert (=> b!1204456 (= res!801313 (validKeyInArray!0 (select (arr!37602 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204457 () Bool)

(assert (=> b!1204457 (= e!683969 call!58232)))

(declare-fun d!132649 () Bool)

(declare-fun res!801314 () Bool)

(assert (=> d!132649 (=> res!801314 e!683972)))

(assert (=> d!132649 (= res!801314 (bvsge #b00000000000000000000000000000000 (size!38140 _keys!1208)))))

(assert (=> d!132649 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26553) e!683972)))

(declare-fun b!1204458 () Bool)

(assert (=> b!1204458 (= e!683971 e!683969)))

(assert (=> b!1204458 (= c!118075 (validKeyInArray!0 (select (arr!37602 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204459 () Bool)

(assert (=> b!1204459 (= e!683970 (contains!6886 Nil!26553 (select (arr!37602 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132649 (not res!801314)) b!1204456))

(assert (= (and b!1204456 res!801313) b!1204459))

(assert (= (and b!1204456 res!801315) b!1204458))

(assert (= (and b!1204458 c!118075) b!1204457))

(assert (= (and b!1204458 (not c!118075)) b!1204455))

(assert (= (or b!1204457 b!1204455) bm!58229))

(declare-fun m!1109973 () Bool)

(assert (=> bm!58229 m!1109973))

(declare-fun m!1109975 () Bool)

(assert (=> bm!58229 m!1109975))

(assert (=> b!1204456 m!1109973))

(assert (=> b!1204456 m!1109973))

(declare-fun m!1109977 () Bool)

(assert (=> b!1204456 m!1109977))

(assert (=> b!1204458 m!1109973))

(assert (=> b!1204458 m!1109973))

(assert (=> b!1204458 m!1109977))

(assert (=> b!1204459 m!1109973))

(assert (=> b!1204459 m!1109973))

(declare-fun m!1109979 () Bool)

(assert (=> b!1204459 m!1109979))

(assert (=> b!1204223 d!132649))

(declare-fun b!1204484 () Bool)

(declare-fun e!683988 () Bool)

(declare-fun lt!546089 () ListLongMap!17739)

(assert (=> b!1204484 (= e!683988 (= lt!546089 (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204485 () Bool)

(assert (=> b!1204485 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38140 lt!545933)))))

(assert (=> b!1204485 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38141 lt!545941)))))

(declare-fun e!683992 () Bool)

(declare-fun apply!955 (ListLongMap!17739 (_ BitVec 64)) V!45945)

(declare-fun get!19186 (ValueCell!14597 V!45945) V!45945)

(assert (=> b!1204485 (= e!683992 (= (apply!955 lt!546089 (select (arr!37602 lt!545933) from!1455)) (get!19186 (select (arr!37603 lt!545941) from!1455) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204486 () Bool)

(declare-fun isEmpty!989 (ListLongMap!17739) Bool)

(assert (=> b!1204486 (= e!683988 (isEmpty!989 lt!546089))))

(declare-fun b!1204487 () Bool)

(declare-fun e!683989 () Bool)

(declare-fun e!683991 () Bool)

(assert (=> b!1204487 (= e!683989 e!683991)))

(declare-fun c!118087 () Bool)

(declare-fun e!683987 () Bool)

(assert (=> b!1204487 (= c!118087 e!683987)))

(declare-fun res!801327 () Bool)

(assert (=> b!1204487 (=> (not res!801327) (not e!683987))))

(assert (=> b!1204487 (= res!801327 (bvslt from!1455 (size!38140 lt!545933)))))

(declare-fun b!1204488 () Bool)

(declare-fun lt!546088 () Unit!39778)

(declare-fun lt!546086 () Unit!39778)

(assert (=> b!1204488 (= lt!546088 lt!546086)))

(declare-fun lt!546085 () (_ BitVec 64))

(declare-fun lt!546087 () V!45945)

(declare-fun lt!546090 () (_ BitVec 64))

(declare-fun lt!546091 () ListLongMap!17739)

(assert (=> b!1204488 (not (contains!6883 (+!4017 lt!546091 (tuple2!19771 lt!546090 lt!546087)) lt!546085))))

(declare-fun addStillNotContains!291 (ListLongMap!17739 (_ BitVec 64) V!45945 (_ BitVec 64)) Unit!39778)

(assert (=> b!1204488 (= lt!546086 (addStillNotContains!291 lt!546091 lt!546090 lt!546087 lt!546085))))

(assert (=> b!1204488 (= lt!546085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204488 (= lt!546087 (get!19186 (select (arr!37603 lt!545941) from!1455) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204488 (= lt!546090 (select (arr!37602 lt!545933) from!1455))))

(declare-fun call!58235 () ListLongMap!17739)

(assert (=> b!1204488 (= lt!546091 call!58235)))

(declare-fun e!683990 () ListLongMap!17739)

(assert (=> b!1204488 (= e!683990 (+!4017 call!58235 (tuple2!19771 (select (arr!37602 lt!545933) from!1455) (get!19186 (select (arr!37603 lt!545941) from!1455) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132651 () Bool)

(assert (=> d!132651 e!683989))

(declare-fun res!801324 () Bool)

(assert (=> d!132651 (=> (not res!801324) (not e!683989))))

(assert (=> d!132651 (= res!801324 (not (contains!6883 lt!546089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!683993 () ListLongMap!17739)

(assert (=> d!132651 (= lt!546089 e!683993)))

(declare-fun c!118086 () Bool)

(assert (=> d!132651 (= c!118086 (bvsge from!1455 (size!38140 lt!545933)))))

(assert (=> d!132651 (validMask!0 mask!1564)))

(assert (=> d!132651 (= (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546089)))

(declare-fun bm!58232 () Bool)

(assert (=> bm!58232 (= call!58235 (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204489 () Bool)

(assert (=> b!1204489 (= e!683991 e!683992)))

(assert (=> b!1204489 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38140 lt!545933)))))

(declare-fun res!801326 () Bool)

(assert (=> b!1204489 (= res!801326 (contains!6883 lt!546089 (select (arr!37602 lt!545933) from!1455)))))

(assert (=> b!1204489 (=> (not res!801326) (not e!683992))))

(declare-fun b!1204490 () Bool)

(assert (=> b!1204490 (= e!683991 e!683988)))

(declare-fun c!118084 () Bool)

(assert (=> b!1204490 (= c!118084 (bvslt from!1455 (size!38140 lt!545933)))))

(declare-fun b!1204491 () Bool)

(declare-fun res!801325 () Bool)

(assert (=> b!1204491 (=> (not res!801325) (not e!683989))))

(assert (=> b!1204491 (= res!801325 (not (contains!6883 lt!546089 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204492 () Bool)

(assert (=> b!1204492 (= e!683987 (validKeyInArray!0 (select (arr!37602 lt!545933) from!1455)))))

(assert (=> b!1204492 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204493 () Bool)

(assert (=> b!1204493 (= e!683990 call!58235)))

(declare-fun b!1204494 () Bool)

(assert (=> b!1204494 (= e!683993 (ListLongMap!17740 Nil!26552))))

(declare-fun b!1204495 () Bool)

(assert (=> b!1204495 (= e!683993 e!683990)))

(declare-fun c!118085 () Bool)

(assert (=> b!1204495 (= c!118085 (validKeyInArray!0 (select (arr!37602 lt!545933) from!1455)))))

(assert (= (and d!132651 c!118086) b!1204494))

(assert (= (and d!132651 (not c!118086)) b!1204495))

(assert (= (and b!1204495 c!118085) b!1204488))

(assert (= (and b!1204495 (not c!118085)) b!1204493))

(assert (= (or b!1204488 b!1204493) bm!58232))

(assert (= (and d!132651 res!801324) b!1204491))

(assert (= (and b!1204491 res!801325) b!1204487))

(assert (= (and b!1204487 res!801327) b!1204492))

(assert (= (and b!1204487 c!118087) b!1204489))

(assert (= (and b!1204487 (not c!118087)) b!1204490))

(assert (= (and b!1204489 res!801326) b!1204485))

(assert (= (and b!1204490 c!118084) b!1204484))

(assert (= (and b!1204490 (not c!118084)) b!1204486))

(declare-fun b_lambda!21219 () Bool)

(assert (=> (not b_lambda!21219) (not b!1204485)))

(assert (=> b!1204485 t!39434))

(declare-fun b_and!42755 () Bool)

(assert (= b_and!42745 (and (=> t!39434 result!21991) b_and!42755)))

(declare-fun b_lambda!21221 () Bool)

(assert (=> (not b_lambda!21221) (not b!1204488)))

(assert (=> b!1204488 t!39434))

(declare-fun b_and!42757 () Bool)

(assert (= b_and!42755 (and (=> t!39434 result!21991) b_and!42757)))

(declare-fun m!1109981 () Bool)

(assert (=> b!1204486 m!1109981))

(declare-fun m!1109983 () Bool)

(assert (=> b!1204488 m!1109983))

(declare-fun m!1109985 () Bool)

(assert (=> b!1204488 m!1109985))

(assert (=> b!1204488 m!1109985))

(declare-fun m!1109987 () Bool)

(assert (=> b!1204488 m!1109987))

(assert (=> b!1204488 m!1109983))

(assert (=> b!1204488 m!1109779))

(declare-fun m!1109989 () Bool)

(assert (=> b!1204488 m!1109989))

(declare-fun m!1109991 () Bool)

(assert (=> b!1204488 m!1109991))

(assert (=> b!1204488 m!1109779))

(declare-fun m!1109993 () Bool)

(assert (=> b!1204488 m!1109993))

(declare-fun m!1109995 () Bool)

(assert (=> b!1204488 m!1109995))

(assert (=> b!1204489 m!1109993))

(assert (=> b!1204489 m!1109993))

(declare-fun m!1109997 () Bool)

(assert (=> b!1204489 m!1109997))

(declare-fun m!1109999 () Bool)

(assert (=> bm!58232 m!1109999))

(assert (=> b!1204485 m!1109983))

(assert (=> b!1204485 m!1109993))

(declare-fun m!1110001 () Bool)

(assert (=> b!1204485 m!1110001))

(assert (=> b!1204485 m!1109983))

(assert (=> b!1204485 m!1109779))

(assert (=> b!1204485 m!1109989))

(assert (=> b!1204485 m!1109779))

(assert (=> b!1204485 m!1109993))

(declare-fun m!1110003 () Bool)

(assert (=> b!1204491 m!1110003))

(assert (=> b!1204495 m!1109993))

(assert (=> b!1204495 m!1109993))

(declare-fun m!1110005 () Bool)

(assert (=> b!1204495 m!1110005))

(assert (=> b!1204492 m!1109993))

(assert (=> b!1204492 m!1109993))

(assert (=> b!1204492 m!1110005))

(declare-fun m!1110007 () Bool)

(assert (=> d!132651 m!1110007))

(assert (=> d!132651 m!1109789))

(assert (=> b!1204484 m!1109999))

(assert (=> b!1204241 d!132651))

(declare-fun b!1204496 () Bool)

(declare-fun e!683995 () Bool)

(declare-fun lt!546096 () ListLongMap!17739)

(assert (=> b!1204496 (= e!683995 (= lt!546096 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204497 () Bool)

(assert (=> b!1204497 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38140 _keys!1208)))))

(assert (=> b!1204497 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38141 _values!996)))))

(declare-fun e!683999 () Bool)

(assert (=> b!1204497 (= e!683999 (= (apply!955 lt!546096 (select (arr!37602 _keys!1208) from!1455)) (get!19186 (select (arr!37603 _values!996) from!1455) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204498 () Bool)

(assert (=> b!1204498 (= e!683995 (isEmpty!989 lt!546096))))

(declare-fun b!1204499 () Bool)

(declare-fun e!683996 () Bool)

(declare-fun e!683998 () Bool)

(assert (=> b!1204499 (= e!683996 e!683998)))

(declare-fun c!118091 () Bool)

(declare-fun e!683994 () Bool)

(assert (=> b!1204499 (= c!118091 e!683994)))

(declare-fun res!801331 () Bool)

(assert (=> b!1204499 (=> (not res!801331) (not e!683994))))

(assert (=> b!1204499 (= res!801331 (bvslt from!1455 (size!38140 _keys!1208)))))

(declare-fun b!1204500 () Bool)

(declare-fun lt!546095 () Unit!39778)

(declare-fun lt!546093 () Unit!39778)

(assert (=> b!1204500 (= lt!546095 lt!546093)))

(declare-fun lt!546097 () (_ BitVec 64))

(declare-fun lt!546098 () ListLongMap!17739)

(declare-fun lt!546092 () (_ BitVec 64))

(declare-fun lt!546094 () V!45945)

(assert (=> b!1204500 (not (contains!6883 (+!4017 lt!546098 (tuple2!19771 lt!546097 lt!546094)) lt!546092))))

(assert (=> b!1204500 (= lt!546093 (addStillNotContains!291 lt!546098 lt!546097 lt!546094 lt!546092))))

(assert (=> b!1204500 (= lt!546092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204500 (= lt!546094 (get!19186 (select (arr!37603 _values!996) from!1455) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204500 (= lt!546097 (select (arr!37602 _keys!1208) from!1455))))

(declare-fun call!58236 () ListLongMap!17739)

(assert (=> b!1204500 (= lt!546098 call!58236)))

(declare-fun e!683997 () ListLongMap!17739)

(assert (=> b!1204500 (= e!683997 (+!4017 call!58236 (tuple2!19771 (select (arr!37602 _keys!1208) from!1455) (get!19186 (select (arr!37603 _values!996) from!1455) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132653 () Bool)

(assert (=> d!132653 e!683996))

(declare-fun res!801328 () Bool)

(assert (=> d!132653 (=> (not res!801328) (not e!683996))))

(assert (=> d!132653 (= res!801328 (not (contains!6883 lt!546096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684000 () ListLongMap!17739)

(assert (=> d!132653 (= lt!546096 e!684000)))

(declare-fun c!118090 () Bool)

(assert (=> d!132653 (= c!118090 (bvsge from!1455 (size!38140 _keys!1208)))))

(assert (=> d!132653 (validMask!0 mask!1564)))

(assert (=> d!132653 (= (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546096)))

(declare-fun bm!58233 () Bool)

(assert (=> bm!58233 (= call!58236 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204501 () Bool)

(assert (=> b!1204501 (= e!683998 e!683999)))

(assert (=> b!1204501 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38140 _keys!1208)))))

(declare-fun res!801330 () Bool)

(assert (=> b!1204501 (= res!801330 (contains!6883 lt!546096 (select (arr!37602 _keys!1208) from!1455)))))

(assert (=> b!1204501 (=> (not res!801330) (not e!683999))))

(declare-fun b!1204502 () Bool)

(assert (=> b!1204502 (= e!683998 e!683995)))

(declare-fun c!118088 () Bool)

(assert (=> b!1204502 (= c!118088 (bvslt from!1455 (size!38140 _keys!1208)))))

(declare-fun b!1204503 () Bool)

(declare-fun res!801329 () Bool)

(assert (=> b!1204503 (=> (not res!801329) (not e!683996))))

(assert (=> b!1204503 (= res!801329 (not (contains!6883 lt!546096 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204504 () Bool)

(assert (=> b!1204504 (= e!683994 (validKeyInArray!0 (select (arr!37602 _keys!1208) from!1455)))))

(assert (=> b!1204504 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204505 () Bool)

(assert (=> b!1204505 (= e!683997 call!58236)))

(declare-fun b!1204506 () Bool)

(assert (=> b!1204506 (= e!684000 (ListLongMap!17740 Nil!26552))))

(declare-fun b!1204507 () Bool)

(assert (=> b!1204507 (= e!684000 e!683997)))

(declare-fun c!118089 () Bool)

(assert (=> b!1204507 (= c!118089 (validKeyInArray!0 (select (arr!37602 _keys!1208) from!1455)))))

(assert (= (and d!132653 c!118090) b!1204506))

(assert (= (and d!132653 (not c!118090)) b!1204507))

(assert (= (and b!1204507 c!118089) b!1204500))

(assert (= (and b!1204507 (not c!118089)) b!1204505))

(assert (= (or b!1204500 b!1204505) bm!58233))

(assert (= (and d!132653 res!801328) b!1204503))

(assert (= (and b!1204503 res!801329) b!1204499))

(assert (= (and b!1204499 res!801331) b!1204504))

(assert (= (and b!1204499 c!118091) b!1204501))

(assert (= (and b!1204499 (not c!118091)) b!1204502))

(assert (= (and b!1204501 res!801330) b!1204497))

(assert (= (and b!1204502 c!118088) b!1204496))

(assert (= (and b!1204502 (not c!118088)) b!1204498))

(declare-fun b_lambda!21223 () Bool)

(assert (=> (not b_lambda!21223) (not b!1204497)))

(assert (=> b!1204497 t!39434))

(declare-fun b_and!42759 () Bool)

(assert (= b_and!42757 (and (=> t!39434 result!21991) b_and!42759)))

(declare-fun b_lambda!21225 () Bool)

(assert (=> (not b_lambda!21225) (not b!1204500)))

(assert (=> b!1204500 t!39434))

(declare-fun b_and!42761 () Bool)

(assert (= b_and!42759 (and (=> t!39434 result!21991) b_and!42761)))

(declare-fun m!1110009 () Bool)

(assert (=> b!1204498 m!1110009))

(declare-fun m!1110011 () Bool)

(assert (=> b!1204500 m!1110011))

(declare-fun m!1110013 () Bool)

(assert (=> b!1204500 m!1110013))

(assert (=> b!1204500 m!1110013))

(declare-fun m!1110015 () Bool)

(assert (=> b!1204500 m!1110015))

(assert (=> b!1204500 m!1110011))

(assert (=> b!1204500 m!1109779))

(declare-fun m!1110017 () Bool)

(assert (=> b!1204500 m!1110017))

(declare-fun m!1110019 () Bool)

(assert (=> b!1204500 m!1110019))

(assert (=> b!1204500 m!1109779))

(assert (=> b!1204500 m!1109741))

(declare-fun m!1110021 () Bool)

(assert (=> b!1204500 m!1110021))

(assert (=> b!1204501 m!1109741))

(assert (=> b!1204501 m!1109741))

(declare-fun m!1110023 () Bool)

(assert (=> b!1204501 m!1110023))

(declare-fun m!1110025 () Bool)

(assert (=> bm!58233 m!1110025))

(assert (=> b!1204497 m!1110011))

(assert (=> b!1204497 m!1109741))

(declare-fun m!1110027 () Bool)

(assert (=> b!1204497 m!1110027))

(assert (=> b!1204497 m!1110011))

(assert (=> b!1204497 m!1109779))

(assert (=> b!1204497 m!1110017))

(assert (=> b!1204497 m!1109779))

(assert (=> b!1204497 m!1109741))

(declare-fun m!1110029 () Bool)

(assert (=> b!1204503 m!1110029))

(assert (=> b!1204507 m!1109741))

(assert (=> b!1204507 m!1109741))

(declare-fun m!1110031 () Bool)

(assert (=> b!1204507 m!1110031))

(assert (=> b!1204504 m!1109741))

(assert (=> b!1204504 m!1109741))

(assert (=> b!1204504 m!1110031))

(declare-fun m!1110033 () Bool)

(assert (=> d!132653 m!1110033))

(assert (=> d!132653 m!1109789))

(assert (=> b!1204496 m!1110025))

(assert (=> b!1204241 d!132653))

(declare-fun d!132655 () Bool)

(assert (=> d!132655 (contains!6883 (+!4017 lt!545934 (tuple2!19771 (ite (or c!118036 c!118034) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118036 c!118034) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!546099 () Unit!39778)

(assert (=> d!132655 (= lt!546099 (choose!1800 lt!545934 (ite (or c!118036 c!118034) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118036 c!118034) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!132655 (contains!6883 lt!545934 k0!934)))

(assert (=> d!132655 (= (addStillContains!1001 lt!545934 (ite (or c!118036 c!118034) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118036 c!118034) zeroValue!944 minValue!944) k0!934) lt!546099)))

(declare-fun bs!34061 () Bool)

(assert (= bs!34061 d!132655))

(declare-fun m!1110035 () Bool)

(assert (=> bs!34061 m!1110035))

(assert (=> bs!34061 m!1110035))

(declare-fun m!1110037 () Bool)

(assert (=> bs!34061 m!1110037))

(declare-fun m!1110039 () Bool)

(assert (=> bs!34061 m!1110039))

(assert (=> bs!34061 m!1109785))

(assert (=> bm!58174 d!132655))

(declare-fun d!132657 () Bool)

(declare-fun e!684002 () Bool)

(assert (=> d!132657 e!684002))

(declare-fun res!801332 () Bool)

(assert (=> d!132657 (=> res!801332 e!684002)))

(declare-fun lt!546103 () Bool)

(assert (=> d!132657 (= res!801332 (not lt!546103))))

(declare-fun lt!546102 () Bool)

(assert (=> d!132657 (= lt!546103 lt!546102)))

(declare-fun lt!546101 () Unit!39778)

(declare-fun e!684001 () Unit!39778)

(assert (=> d!132657 (= lt!546101 e!684001)))

(declare-fun c!118092 () Bool)

(assert (=> d!132657 (= c!118092 lt!546102)))

(assert (=> d!132657 (= lt!546102 (containsKey!589 (toList!8885 lt!545934) k0!934))))

(assert (=> d!132657 (= (contains!6883 lt!545934 k0!934) lt!546103)))

(declare-fun b!1204508 () Bool)

(declare-fun lt!546100 () Unit!39778)

(assert (=> b!1204508 (= e!684001 lt!546100)))

(assert (=> b!1204508 (= lt!546100 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8885 lt!545934) k0!934))))

(assert (=> b!1204508 (isDefined!461 (getValueByKey!635 (toList!8885 lt!545934) k0!934))))

(declare-fun b!1204509 () Bool)

(declare-fun Unit!39788 () Unit!39778)

(assert (=> b!1204509 (= e!684001 Unit!39788)))

(declare-fun b!1204510 () Bool)

(assert (=> b!1204510 (= e!684002 (isDefined!461 (getValueByKey!635 (toList!8885 lt!545934) k0!934)))))

(assert (= (and d!132657 c!118092) b!1204508))

(assert (= (and d!132657 (not c!118092)) b!1204509))

(assert (= (and d!132657 (not res!801332)) b!1204510))

(declare-fun m!1110041 () Bool)

(assert (=> d!132657 m!1110041))

(declare-fun m!1110043 () Bool)

(assert (=> b!1204508 m!1110043))

(declare-fun m!1110045 () Bool)

(assert (=> b!1204508 m!1110045))

(assert (=> b!1204508 m!1110045))

(declare-fun m!1110047 () Bool)

(assert (=> b!1204508 m!1110047))

(assert (=> b!1204510 m!1110045))

(assert (=> b!1204510 m!1110045))

(assert (=> b!1204510 m!1110047))

(assert (=> b!1204233 d!132657))

(declare-fun e!684004 () Bool)

(declare-fun b!1204511 () Bool)

(declare-fun lt!546108 () ListLongMap!17739)

(assert (=> b!1204511 (= e!684004 (= lt!546108 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204512 () Bool)

(assert (=> b!1204512 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 _keys!1208)))))

(assert (=> b!1204512 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38141 _values!996)))))

(declare-fun e!684008 () Bool)

(assert (=> b!1204512 (= e!684008 (= (apply!955 lt!546108 (select (arr!37602 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19186 (select (arr!37603 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204513 () Bool)

(assert (=> b!1204513 (= e!684004 (isEmpty!989 lt!546108))))

(declare-fun b!1204514 () Bool)

(declare-fun e!684005 () Bool)

(declare-fun e!684007 () Bool)

(assert (=> b!1204514 (= e!684005 e!684007)))

(declare-fun c!118096 () Bool)

(declare-fun e!684003 () Bool)

(assert (=> b!1204514 (= c!118096 e!684003)))

(declare-fun res!801336 () Bool)

(assert (=> b!1204514 (=> (not res!801336) (not e!684003))))

(assert (=> b!1204514 (= res!801336 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 _keys!1208)))))

(declare-fun b!1204515 () Bool)

(declare-fun lt!546107 () Unit!39778)

(declare-fun lt!546105 () Unit!39778)

(assert (=> b!1204515 (= lt!546107 lt!546105)))

(declare-fun lt!546110 () ListLongMap!17739)

(declare-fun lt!546106 () V!45945)

(declare-fun lt!546109 () (_ BitVec 64))

(declare-fun lt!546104 () (_ BitVec 64))

(assert (=> b!1204515 (not (contains!6883 (+!4017 lt!546110 (tuple2!19771 lt!546109 lt!546106)) lt!546104))))

(assert (=> b!1204515 (= lt!546105 (addStillNotContains!291 lt!546110 lt!546109 lt!546106 lt!546104))))

(assert (=> b!1204515 (= lt!546104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204515 (= lt!546106 (get!19186 (select (arr!37603 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204515 (= lt!546109 (select (arr!37602 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58237 () ListLongMap!17739)

(assert (=> b!1204515 (= lt!546110 call!58237)))

(declare-fun e!684006 () ListLongMap!17739)

(assert (=> b!1204515 (= e!684006 (+!4017 call!58237 (tuple2!19771 (select (arr!37602 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19186 (select (arr!37603 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132659 () Bool)

(assert (=> d!132659 e!684005))

(declare-fun res!801333 () Bool)

(assert (=> d!132659 (=> (not res!801333) (not e!684005))))

(assert (=> d!132659 (= res!801333 (not (contains!6883 lt!546108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684009 () ListLongMap!17739)

(assert (=> d!132659 (= lt!546108 e!684009)))

(declare-fun c!118095 () Bool)

(assert (=> d!132659 (= c!118095 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 _keys!1208)))))

(assert (=> d!132659 (validMask!0 mask!1564)))

(assert (=> d!132659 (= (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546108)))

(declare-fun bm!58234 () Bool)

(assert (=> bm!58234 (= call!58237 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204516 () Bool)

(assert (=> b!1204516 (= e!684007 e!684008)))

(assert (=> b!1204516 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 _keys!1208)))))

(declare-fun res!801335 () Bool)

(assert (=> b!1204516 (= res!801335 (contains!6883 lt!546108 (select (arr!37602 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204516 (=> (not res!801335) (not e!684008))))

(declare-fun b!1204517 () Bool)

(assert (=> b!1204517 (= e!684007 e!684004)))

(declare-fun c!118093 () Bool)

(assert (=> b!1204517 (= c!118093 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 _keys!1208)))))

(declare-fun b!1204518 () Bool)

(declare-fun res!801334 () Bool)

(assert (=> b!1204518 (=> (not res!801334) (not e!684005))))

(assert (=> b!1204518 (= res!801334 (not (contains!6883 lt!546108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204519 () Bool)

(assert (=> b!1204519 (= e!684003 (validKeyInArray!0 (select (arr!37602 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204519 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204520 () Bool)

(assert (=> b!1204520 (= e!684006 call!58237)))

(declare-fun b!1204521 () Bool)

(assert (=> b!1204521 (= e!684009 (ListLongMap!17740 Nil!26552))))

(declare-fun b!1204522 () Bool)

(assert (=> b!1204522 (= e!684009 e!684006)))

(declare-fun c!118094 () Bool)

(assert (=> b!1204522 (= c!118094 (validKeyInArray!0 (select (arr!37602 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!132659 c!118095) b!1204521))

(assert (= (and d!132659 (not c!118095)) b!1204522))

(assert (= (and b!1204522 c!118094) b!1204515))

(assert (= (and b!1204522 (not c!118094)) b!1204520))

(assert (= (or b!1204515 b!1204520) bm!58234))

(assert (= (and d!132659 res!801333) b!1204518))

(assert (= (and b!1204518 res!801334) b!1204514))

(assert (= (and b!1204514 res!801336) b!1204519))

(assert (= (and b!1204514 c!118096) b!1204516))

(assert (= (and b!1204514 (not c!118096)) b!1204517))

(assert (= (and b!1204516 res!801335) b!1204512))

(assert (= (and b!1204517 c!118093) b!1204511))

(assert (= (and b!1204517 (not c!118093)) b!1204513))

(declare-fun b_lambda!21227 () Bool)

(assert (=> (not b_lambda!21227) (not b!1204512)))

(assert (=> b!1204512 t!39434))

(declare-fun b_and!42763 () Bool)

(assert (= b_and!42761 (and (=> t!39434 result!21991) b_and!42763)))

(declare-fun b_lambda!21229 () Bool)

(assert (=> (not b_lambda!21229) (not b!1204515)))

(assert (=> b!1204515 t!39434))

(declare-fun b_and!42765 () Bool)

(assert (= b_and!42763 (and (=> t!39434 result!21991) b_and!42765)))

(declare-fun m!1110049 () Bool)

(assert (=> b!1204513 m!1110049))

(declare-fun m!1110051 () Bool)

(assert (=> b!1204515 m!1110051))

(declare-fun m!1110053 () Bool)

(assert (=> b!1204515 m!1110053))

(assert (=> b!1204515 m!1110053))

(declare-fun m!1110055 () Bool)

(assert (=> b!1204515 m!1110055))

(assert (=> b!1204515 m!1110051))

(assert (=> b!1204515 m!1109779))

(declare-fun m!1110057 () Bool)

(assert (=> b!1204515 m!1110057))

(declare-fun m!1110059 () Bool)

(assert (=> b!1204515 m!1110059))

(assert (=> b!1204515 m!1109779))

(assert (=> b!1204515 m!1109925))

(declare-fun m!1110061 () Bool)

(assert (=> b!1204515 m!1110061))

(assert (=> b!1204516 m!1109925))

(assert (=> b!1204516 m!1109925))

(declare-fun m!1110063 () Bool)

(assert (=> b!1204516 m!1110063))

(declare-fun m!1110065 () Bool)

(assert (=> bm!58234 m!1110065))

(assert (=> b!1204512 m!1110051))

(assert (=> b!1204512 m!1109925))

(declare-fun m!1110067 () Bool)

(assert (=> b!1204512 m!1110067))

(assert (=> b!1204512 m!1110051))

(assert (=> b!1204512 m!1109779))

(assert (=> b!1204512 m!1110057))

(assert (=> b!1204512 m!1109779))

(assert (=> b!1204512 m!1109925))

(declare-fun m!1110069 () Bool)

(assert (=> b!1204518 m!1110069))

(assert (=> b!1204522 m!1109925))

(assert (=> b!1204522 m!1109925))

(declare-fun m!1110071 () Bool)

(assert (=> b!1204522 m!1110071))

(assert (=> b!1204519 m!1109925))

(assert (=> b!1204519 m!1109925))

(assert (=> b!1204519 m!1110071))

(declare-fun m!1110073 () Bool)

(assert (=> d!132659 m!1110073))

(assert (=> d!132659 m!1109789))

(assert (=> b!1204511 m!1110065))

(assert (=> b!1204233 d!132659))

(declare-fun bm!58237 () Bool)

(declare-fun call!58240 () Bool)

(assert (=> bm!58237 (= call!58240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545933 mask!1564))))

(declare-fun b!1204531 () Bool)

(declare-fun e!684016 () Bool)

(assert (=> b!1204531 (= e!684016 call!58240)))

(declare-fun b!1204532 () Bool)

(declare-fun e!684018 () Bool)

(assert (=> b!1204532 (= e!684018 e!684016)))

(declare-fun lt!546119 () (_ BitVec 64))

(assert (=> b!1204532 (= lt!546119 (select (arr!37602 lt!545933) #b00000000000000000000000000000000))))

(declare-fun lt!546118 () Unit!39778)

(assert (=> b!1204532 (= lt!546118 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545933 lt!546119 #b00000000000000000000000000000000))))

(assert (=> b!1204532 (arrayContainsKey!0 lt!545933 lt!546119 #b00000000000000000000000000000000)))

(declare-fun lt!546117 () Unit!39778)

(assert (=> b!1204532 (= lt!546117 lt!546118)))

(declare-fun res!801341 () Bool)

(declare-datatypes ((SeekEntryResult!9934 0))(
  ( (MissingZero!9934 (index!42107 (_ BitVec 32))) (Found!9934 (index!42108 (_ BitVec 32))) (Intermediate!9934 (undefined!10746 Bool) (index!42109 (_ BitVec 32)) (x!106414 (_ BitVec 32))) (Undefined!9934) (MissingVacant!9934 (index!42110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77918 (_ BitVec 32)) SeekEntryResult!9934)

(assert (=> b!1204532 (= res!801341 (= (seekEntryOrOpen!0 (select (arr!37602 lt!545933) #b00000000000000000000000000000000) lt!545933 mask!1564) (Found!9934 #b00000000000000000000000000000000)))))

(assert (=> b!1204532 (=> (not res!801341) (not e!684016))))

(declare-fun b!1204533 () Bool)

(assert (=> b!1204533 (= e!684018 call!58240)))

(declare-fun d!132661 () Bool)

(declare-fun res!801342 () Bool)

(declare-fun e!684017 () Bool)

(assert (=> d!132661 (=> res!801342 e!684017)))

(assert (=> d!132661 (= res!801342 (bvsge #b00000000000000000000000000000000 (size!38140 lt!545933)))))

(assert (=> d!132661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545933 mask!1564) e!684017)))

(declare-fun b!1204534 () Bool)

(assert (=> b!1204534 (= e!684017 e!684018)))

(declare-fun c!118099 () Bool)

(assert (=> b!1204534 (= c!118099 (validKeyInArray!0 (select (arr!37602 lt!545933) #b00000000000000000000000000000000)))))

(assert (= (and d!132661 (not res!801342)) b!1204534))

(assert (= (and b!1204534 c!118099) b!1204532))

(assert (= (and b!1204534 (not c!118099)) b!1204533))

(assert (= (and b!1204532 res!801341) b!1204531))

(assert (= (or b!1204531 b!1204533) bm!58237))

(declare-fun m!1110075 () Bool)

(assert (=> bm!58237 m!1110075))

(assert (=> b!1204532 m!1109917))

(declare-fun m!1110077 () Bool)

(assert (=> b!1204532 m!1110077))

(declare-fun m!1110079 () Bool)

(assert (=> b!1204532 m!1110079))

(assert (=> b!1204532 m!1109917))

(declare-fun m!1110081 () Bool)

(assert (=> b!1204532 m!1110081))

(assert (=> b!1204534 m!1109917))

(assert (=> b!1204534 m!1109917))

(assert (=> b!1204534 m!1109921))

(assert (=> b!1204225 d!132661))

(declare-fun e!684020 () Bool)

(declare-fun lt!546124 () ListLongMap!17739)

(declare-fun b!1204535 () Bool)

(assert (=> b!1204535 (= e!684020 (= lt!546124 (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204536 () Bool)

(assert (=> b!1204536 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 lt!545933)))))

(assert (=> b!1204536 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38141 lt!545941)))))

(declare-fun e!684024 () Bool)

(assert (=> b!1204536 (= e!684024 (= (apply!955 lt!546124 (select (arr!37602 lt!545933) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19186 (select (arr!37603 lt!545941) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204537 () Bool)

(assert (=> b!1204537 (= e!684020 (isEmpty!989 lt!546124))))

(declare-fun b!1204538 () Bool)

(declare-fun e!684021 () Bool)

(declare-fun e!684023 () Bool)

(assert (=> b!1204538 (= e!684021 e!684023)))

(declare-fun c!118103 () Bool)

(declare-fun e!684019 () Bool)

(assert (=> b!1204538 (= c!118103 e!684019)))

(declare-fun res!801346 () Bool)

(assert (=> b!1204538 (=> (not res!801346) (not e!684019))))

(assert (=> b!1204538 (= res!801346 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 lt!545933)))))

(declare-fun b!1204539 () Bool)

(declare-fun lt!546123 () Unit!39778)

(declare-fun lt!546121 () Unit!39778)

(assert (=> b!1204539 (= lt!546123 lt!546121)))

(declare-fun lt!546125 () (_ BitVec 64))

(declare-fun lt!546120 () (_ BitVec 64))

(declare-fun lt!546126 () ListLongMap!17739)

(declare-fun lt!546122 () V!45945)

(assert (=> b!1204539 (not (contains!6883 (+!4017 lt!546126 (tuple2!19771 lt!546125 lt!546122)) lt!546120))))

(assert (=> b!1204539 (= lt!546121 (addStillNotContains!291 lt!546126 lt!546125 lt!546122 lt!546120))))

(assert (=> b!1204539 (= lt!546120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204539 (= lt!546122 (get!19186 (select (arr!37603 lt!545941) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204539 (= lt!546125 (select (arr!37602 lt!545933) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58241 () ListLongMap!17739)

(assert (=> b!1204539 (= lt!546126 call!58241)))

(declare-fun e!684022 () ListLongMap!17739)

(assert (=> b!1204539 (= e!684022 (+!4017 call!58241 (tuple2!19771 (select (arr!37602 lt!545933) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19186 (select (arr!37603 lt!545941) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132663 () Bool)

(assert (=> d!132663 e!684021))

(declare-fun res!801343 () Bool)

(assert (=> d!132663 (=> (not res!801343) (not e!684021))))

(assert (=> d!132663 (= res!801343 (not (contains!6883 lt!546124 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684025 () ListLongMap!17739)

(assert (=> d!132663 (= lt!546124 e!684025)))

(declare-fun c!118102 () Bool)

(assert (=> d!132663 (= c!118102 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 lt!545933)))))

(assert (=> d!132663 (validMask!0 mask!1564)))

(assert (=> d!132663 (= (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546124)))

(declare-fun bm!58238 () Bool)

(assert (=> bm!58238 (= call!58241 (getCurrentListMapNoExtraKeys!5331 lt!545933 lt!545941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204540 () Bool)

(assert (=> b!1204540 (= e!684023 e!684024)))

(assert (=> b!1204540 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 lt!545933)))))

(declare-fun res!801345 () Bool)

(assert (=> b!1204540 (= res!801345 (contains!6883 lt!546124 (select (arr!37602 lt!545933) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204540 (=> (not res!801345) (not e!684024))))

(declare-fun b!1204541 () Bool)

(assert (=> b!1204541 (= e!684023 e!684020)))

(declare-fun c!118100 () Bool)

(assert (=> b!1204541 (= c!118100 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 lt!545933)))))

(declare-fun b!1204542 () Bool)

(declare-fun res!801344 () Bool)

(assert (=> b!1204542 (=> (not res!801344) (not e!684021))))

(assert (=> b!1204542 (= res!801344 (not (contains!6883 lt!546124 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204543 () Bool)

(assert (=> b!1204543 (= e!684019 (validKeyInArray!0 (select (arr!37602 lt!545933) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204543 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204544 () Bool)

(assert (=> b!1204544 (= e!684022 call!58241)))

(declare-fun b!1204545 () Bool)

(assert (=> b!1204545 (= e!684025 (ListLongMap!17740 Nil!26552))))

(declare-fun b!1204546 () Bool)

(assert (=> b!1204546 (= e!684025 e!684022)))

(declare-fun c!118101 () Bool)

(assert (=> b!1204546 (= c!118101 (validKeyInArray!0 (select (arr!37602 lt!545933) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!132663 c!118102) b!1204545))

(assert (= (and d!132663 (not c!118102)) b!1204546))

(assert (= (and b!1204546 c!118101) b!1204539))

(assert (= (and b!1204546 (not c!118101)) b!1204544))

(assert (= (or b!1204539 b!1204544) bm!58238))

(assert (= (and d!132663 res!801343) b!1204542))

(assert (= (and b!1204542 res!801344) b!1204538))

(assert (= (and b!1204538 res!801346) b!1204543))

(assert (= (and b!1204538 c!118103) b!1204540))

(assert (= (and b!1204538 (not c!118103)) b!1204541))

(assert (= (and b!1204540 res!801345) b!1204536))

(assert (= (and b!1204541 c!118100) b!1204535))

(assert (= (and b!1204541 (not c!118100)) b!1204537))

(declare-fun b_lambda!21231 () Bool)

(assert (=> (not b_lambda!21231) (not b!1204536)))

(assert (=> b!1204536 t!39434))

(declare-fun b_and!42767 () Bool)

(assert (= b_and!42765 (and (=> t!39434 result!21991) b_and!42767)))

(declare-fun b_lambda!21233 () Bool)

(assert (=> (not b_lambda!21233) (not b!1204539)))

(assert (=> b!1204539 t!39434))

(declare-fun b_and!42769 () Bool)

(assert (= b_and!42767 (and (=> t!39434 result!21991) b_and!42769)))

(declare-fun m!1110083 () Bool)

(assert (=> b!1204537 m!1110083))

(declare-fun m!1110085 () Bool)

(assert (=> b!1204539 m!1110085))

(declare-fun m!1110087 () Bool)

(assert (=> b!1204539 m!1110087))

(assert (=> b!1204539 m!1110087))

(declare-fun m!1110089 () Bool)

(assert (=> b!1204539 m!1110089))

(assert (=> b!1204539 m!1110085))

(assert (=> b!1204539 m!1109779))

(declare-fun m!1110091 () Bool)

(assert (=> b!1204539 m!1110091))

(declare-fun m!1110093 () Bool)

(assert (=> b!1204539 m!1110093))

(assert (=> b!1204539 m!1109779))

(declare-fun m!1110095 () Bool)

(assert (=> b!1204539 m!1110095))

(declare-fun m!1110097 () Bool)

(assert (=> b!1204539 m!1110097))

(assert (=> b!1204540 m!1110095))

(assert (=> b!1204540 m!1110095))

(declare-fun m!1110099 () Bool)

(assert (=> b!1204540 m!1110099))

(declare-fun m!1110101 () Bool)

(assert (=> bm!58238 m!1110101))

(assert (=> b!1204536 m!1110085))

(assert (=> b!1204536 m!1110095))

(declare-fun m!1110103 () Bool)

(assert (=> b!1204536 m!1110103))

(assert (=> b!1204536 m!1110085))

(assert (=> b!1204536 m!1109779))

(assert (=> b!1204536 m!1110091))

(assert (=> b!1204536 m!1109779))

(assert (=> b!1204536 m!1110095))

(declare-fun m!1110105 () Bool)

(assert (=> b!1204542 m!1110105))

(assert (=> b!1204546 m!1110095))

(assert (=> b!1204546 m!1110095))

(declare-fun m!1110107 () Bool)

(assert (=> b!1204546 m!1110107))

(assert (=> b!1204543 m!1110095))

(assert (=> b!1204543 m!1110095))

(assert (=> b!1204543 m!1110107))

(declare-fun m!1110109 () Bool)

(assert (=> d!132663 m!1110109))

(assert (=> d!132663 m!1109789))

(assert (=> b!1204535 m!1110101))

(assert (=> bm!58170 d!132663))

(declare-fun d!132665 () Bool)

(declare-fun e!684031 () Bool)

(assert (=> d!132665 e!684031))

(declare-fun res!801349 () Bool)

(assert (=> d!132665 (=> (not res!801349) (not e!684031))))

(assert (=> d!132665 (= res!801349 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38140 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38140 _keys!1208))))))))

(declare-fun lt!546129 () Unit!39778)

(declare-fun choose!1801 (array!77918 array!77920 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39778)

(assert (=> d!132665 (= lt!546129 (choose!1801 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132665 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38140 _keys!1208)))))

(assert (=> d!132665 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546129)))

(declare-fun bm!58243 () Bool)

(declare-fun call!58246 () ListLongMap!17739)

(assert (=> bm!58243 (= call!58246 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204553 () Bool)

(declare-fun e!684030 () Bool)

(declare-fun call!58247 () ListLongMap!17739)

(assert (=> b!1204553 (= e!684030 (= call!58247 call!58246))))

(assert (=> b!1204553 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38141 _values!996)))))

(declare-fun b!1204554 () Bool)

(assert (=> b!1204554 (= e!684031 e!684030)))

(declare-fun c!118106 () Bool)

(assert (=> b!1204554 (= c!118106 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1204555 () Bool)

(assert (=> b!1204555 (= e!684030 (= call!58247 (-!1778 call!58246 k0!934)))))

(assert (=> b!1204555 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38141 _values!996)))))

(declare-fun bm!58244 () Bool)

(assert (=> bm!58244 (= call!58247 (getCurrentListMapNoExtraKeys!5331 (array!77919 (store (arr!37602 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38140 _keys!1208)) (array!77921 (store (arr!37603 _values!996) i!673 (ValueCellFull!14597 (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38141 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!132665 res!801349) b!1204554))

(assert (= (and b!1204554 c!118106) b!1204555))

(assert (= (and b!1204554 (not c!118106)) b!1204553))

(assert (= (or b!1204555 b!1204553) bm!58243))

(assert (= (or b!1204555 b!1204553) bm!58244))

(declare-fun b_lambda!21235 () Bool)

(assert (=> (not b_lambda!21235) (not bm!58244)))

(assert (=> bm!58244 t!39434))

(declare-fun b_and!42771 () Bool)

(assert (= b_and!42769 (and (=> t!39434 result!21991) b_and!42771)))

(declare-fun m!1110111 () Bool)

(assert (=> d!132665 m!1110111))

(assert (=> bm!58243 m!1109735))

(declare-fun m!1110113 () Bool)

(assert (=> b!1204555 m!1110113))

(assert (=> bm!58244 m!1109755))

(assert (=> bm!58244 m!1109779))

(assert (=> bm!58244 m!1109781))

(declare-fun m!1110115 () Bool)

(assert (=> bm!58244 m!1110115))

(assert (=> b!1204235 d!132665))

(declare-fun bm!58245 () Bool)

(declare-fun call!58248 () Bool)

(assert (=> bm!58245 (= call!58248 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1204556 () Bool)

(declare-fun e!684032 () Bool)

(assert (=> b!1204556 (= e!684032 call!58248)))

(declare-fun b!1204557 () Bool)

(declare-fun e!684034 () Bool)

(assert (=> b!1204557 (= e!684034 e!684032)))

(declare-fun lt!546132 () (_ BitVec 64))

(assert (=> b!1204557 (= lt!546132 (select (arr!37602 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546131 () Unit!39778)

(assert (=> b!1204557 (= lt!546131 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546132 #b00000000000000000000000000000000))))

(assert (=> b!1204557 (arrayContainsKey!0 _keys!1208 lt!546132 #b00000000000000000000000000000000)))

(declare-fun lt!546130 () Unit!39778)

(assert (=> b!1204557 (= lt!546130 lt!546131)))

(declare-fun res!801350 () Bool)

(assert (=> b!1204557 (= res!801350 (= (seekEntryOrOpen!0 (select (arr!37602 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9934 #b00000000000000000000000000000000)))))

(assert (=> b!1204557 (=> (not res!801350) (not e!684032))))

(declare-fun b!1204558 () Bool)

(assert (=> b!1204558 (= e!684034 call!58248)))

(declare-fun d!132667 () Bool)

(declare-fun res!801351 () Bool)

(declare-fun e!684033 () Bool)

(assert (=> d!132667 (=> res!801351 e!684033)))

(assert (=> d!132667 (= res!801351 (bvsge #b00000000000000000000000000000000 (size!38140 _keys!1208)))))

(assert (=> d!132667 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!684033)))

(declare-fun b!1204559 () Bool)

(assert (=> b!1204559 (= e!684033 e!684034)))

(declare-fun c!118107 () Bool)

(assert (=> b!1204559 (= c!118107 (validKeyInArray!0 (select (arr!37602 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132667 (not res!801351)) b!1204559))

(assert (= (and b!1204559 c!118107) b!1204557))

(assert (= (and b!1204559 (not c!118107)) b!1204558))

(assert (= (and b!1204557 res!801350) b!1204556))

(assert (= (or b!1204556 b!1204558) bm!58245))

(declare-fun m!1110117 () Bool)

(assert (=> bm!58245 m!1110117))

(assert (=> b!1204557 m!1109973))

(declare-fun m!1110119 () Bool)

(assert (=> b!1204557 m!1110119))

(declare-fun m!1110121 () Bool)

(assert (=> b!1204557 m!1110121))

(assert (=> b!1204557 m!1109973))

(declare-fun m!1110123 () Bool)

(assert (=> b!1204557 m!1110123))

(assert (=> b!1204559 m!1109973))

(assert (=> b!1204559 m!1109973))

(assert (=> b!1204559 m!1109977))

(assert (=> b!1204226 d!132667))

(assert (=> bm!58172 d!132659))

(declare-fun d!132669 () Bool)

(assert (=> d!132669 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204243 d!132669))

(declare-fun d!132671 () Bool)

(declare-fun lt!546135 () ListLongMap!17739)

(assert (=> d!132671 (not (contains!6883 lt!546135 k0!934))))

(declare-fun removeStrictlySorted!95 (List!26555 (_ BitVec 64)) List!26555)

(assert (=> d!132671 (= lt!546135 (ListLongMap!17740 (removeStrictlySorted!95 (toList!8885 call!58180) k0!934)))))

(assert (=> d!132671 (= (-!1778 call!58180 k0!934) lt!546135)))

(declare-fun bs!34062 () Bool)

(assert (= bs!34062 d!132671))

(declare-fun m!1110125 () Bool)

(assert (=> bs!34062 m!1110125))

(declare-fun m!1110127 () Bool)

(assert (=> bs!34062 m!1110127))

(assert (=> b!1204218 d!132671))

(declare-fun d!132673 () Bool)

(assert (=> d!132673 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1204244 d!132673))

(assert (=> b!1204236 d!132633))

(declare-fun d!132675 () Bool)

(declare-fun e!684037 () Bool)

(assert (=> d!132675 e!684037))

(declare-fun c!118110 () Bool)

(assert (=> d!132675 (= c!118110 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546138 () Unit!39778)

(declare-fun choose!1802 (array!77918 array!77920 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 64) (_ BitVec 32) Int) Unit!39778)

(assert (=> d!132675 (= lt!546138 (choose!1802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132675 (validMask!0 mask!1564)))

(assert (=> d!132675 (= (lemmaListMapContainsThenArrayContainsFrom!555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546138)))

(declare-fun b!1204564 () Bool)

(assert (=> b!1204564 (= e!684037 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204565 () Bool)

(assert (=> b!1204565 (= e!684037 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132675 c!118110) b!1204564))

(assert (= (and d!132675 (not c!118110)) b!1204565))

(declare-fun m!1110129 () Bool)

(assert (=> d!132675 m!1110129))

(assert (=> d!132675 m!1109789))

(assert (=> b!1204564 m!1109773))

(assert (=> b!1204236 d!132675))

(declare-fun d!132677 () Bool)

(declare-fun res!801352 () Bool)

(declare-fun e!684038 () Bool)

(assert (=> d!132677 (=> res!801352 e!684038)))

(assert (=> d!132677 (= res!801352 (= (select (arr!37602 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132677 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!684038)))

(declare-fun b!1204566 () Bool)

(declare-fun e!684039 () Bool)

(assert (=> b!1204566 (= e!684038 e!684039)))

(declare-fun res!801353 () Bool)

(assert (=> b!1204566 (=> (not res!801353) (not e!684039))))

(assert (=> b!1204566 (= res!801353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38140 _keys!1208)))))

(declare-fun b!1204567 () Bool)

(assert (=> b!1204567 (= e!684039 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132677 (not res!801352)) b!1204566))

(assert (= (and b!1204566 res!801353) b!1204567))

(assert (=> d!132677 m!1109973))

(declare-fun m!1110131 () Bool)

(assert (=> b!1204567 m!1110131))

(assert (=> b!1204228 d!132677))

(declare-fun d!132679 () Bool)

(assert (=> d!132679 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546141 () Unit!39778)

(declare-fun choose!13 (array!77918 (_ BitVec 64) (_ BitVec 32)) Unit!39778)

(assert (=> d!132679 (= lt!546141 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132679 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132679 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546141)))

(declare-fun bs!34063 () Bool)

(assert (= bs!34063 d!132679))

(assert (=> bs!34063 m!1109759))

(declare-fun m!1110133 () Bool)

(assert (=> bs!34063 m!1110133))

(assert (=> b!1204228 d!132679))

(declare-fun mapNonEmpty!47778 () Bool)

(declare-fun mapRes!47778 () Bool)

(declare-fun tp!90739 () Bool)

(declare-fun e!684045 () Bool)

(assert (=> mapNonEmpty!47778 (= mapRes!47778 (and tp!90739 e!684045))))

(declare-fun mapRest!47778 () (Array (_ BitVec 32) ValueCell!14597))

(declare-fun mapValue!47778 () ValueCell!14597)

(declare-fun mapKey!47778 () (_ BitVec 32))

(assert (=> mapNonEmpty!47778 (= mapRest!47769 (store mapRest!47778 mapKey!47778 mapValue!47778))))

(declare-fun mapIsEmpty!47778 () Bool)

(assert (=> mapIsEmpty!47778 mapRes!47778))

(declare-fun b!1204575 () Bool)

(declare-fun e!684044 () Bool)

(assert (=> b!1204575 (= e!684044 tp_is_empty!30613)))

(declare-fun condMapEmpty!47778 () Bool)

(declare-fun mapDefault!47778 () ValueCell!14597)

(assert (=> mapNonEmpty!47769 (= condMapEmpty!47778 (= mapRest!47769 ((as const (Array (_ BitVec 32) ValueCell!14597)) mapDefault!47778)))))

(assert (=> mapNonEmpty!47769 (= tp!90723 (and e!684044 mapRes!47778))))

(declare-fun b!1204574 () Bool)

(assert (=> b!1204574 (= e!684045 tp_is_empty!30613)))

(assert (= (and mapNonEmpty!47769 condMapEmpty!47778) mapIsEmpty!47778))

(assert (= (and mapNonEmpty!47769 (not condMapEmpty!47778)) mapNonEmpty!47778))

(assert (= (and mapNonEmpty!47778 ((_ is ValueCellFull!14597) mapValue!47778)) b!1204574))

(assert (= (and mapNonEmpty!47769 ((_ is ValueCellFull!14597) mapDefault!47778)) b!1204575))

(declare-fun m!1110135 () Bool)

(assert (=> mapNonEmpty!47778 m!1110135))

(declare-fun b_lambda!21237 () Bool)

(assert (= b_lambda!21227 (or (and start!100672 b_free!25909) b_lambda!21237)))

(declare-fun b_lambda!21239 () Bool)

(assert (= b_lambda!21225 (or (and start!100672 b_free!25909) b_lambda!21239)))

(declare-fun b_lambda!21241 () Bool)

(assert (= b_lambda!21219 (or (and start!100672 b_free!25909) b_lambda!21241)))

(declare-fun b_lambda!21243 () Bool)

(assert (= b_lambda!21229 (or (and start!100672 b_free!25909) b_lambda!21243)))

(declare-fun b_lambda!21245 () Bool)

(assert (= b_lambda!21235 (or (and start!100672 b_free!25909) b_lambda!21245)))

(declare-fun b_lambda!21247 () Bool)

(assert (= b_lambda!21233 (or (and start!100672 b_free!25909) b_lambda!21247)))

(declare-fun b_lambda!21249 () Bool)

(assert (= b_lambda!21231 (or (and start!100672 b_free!25909) b_lambda!21249)))

(declare-fun b_lambda!21251 () Bool)

(assert (= b_lambda!21221 (or (and start!100672 b_free!25909) b_lambda!21251)))

(declare-fun b_lambda!21253 () Bool)

(assert (= b_lambda!21223 (or (and start!100672 b_free!25909) b_lambda!21253)))

(check-sat (not b!1204456) (not b!1204543) (not bm!58228) (not b!1204427) (not b!1204537) (not b_lambda!21237) (not b_next!25909) (not b!1204433) (not b_lambda!21241) (not d!132663) (not b!1204508) (not d!132641) (not b!1204489) (not b!1204488) (not b!1204424) (not b!1204485) (not bm!58229) (not b!1204498) (not b!1204497) (not b_lambda!21239) (not b!1204440) (not b!1204511) (not b!1204504) (not b!1204522) (not b!1204446) (not b!1204454) (not b!1204567) (not d!132647) (not bm!58238) (not b_lambda!21249) (not b!1204453) (not b!1204459) (not b_lambda!21247) tp_is_empty!30613 (not d!132643) (not b!1204515) (not b!1204534) (not bm!58245) (not b!1204426) (not d!132671) (not d!132665) (not b!1204555) (not d!132659) (not b!1204503) (not d!132635) (not b!1204535) (not bm!58244) (not d!132679) (not b!1204564) (not b!1204516) (not d!132645) (not bm!58232) (not b!1204546) (not b!1204501) (not d!132675) (not bm!58234) (not b!1204540) b_and!42771 (not b!1204507) (not b!1204532) (not b!1204442) (not b!1204539) (not b!1204513) (not d!132655) (not d!132653) (not b!1204486) (not b!1204496) (not bm!58237) (not b!1204536) (not b_lambda!21217) (not mapNonEmpty!47778) (not b!1204518) (not b!1204519) (not b!1204542) (not b!1204500) (not b!1204557) (not bm!58243) (not b!1204492) (not b!1204512) (not d!132651) (not b_lambda!21245) (not b!1204451) (not b!1204495) (not b!1204491) (not b!1204484) (not d!132657) (not b!1204510) (not b_lambda!21253) (not b!1204458) (not b_lambda!21251) (not b_lambda!21243) (not b!1204559) (not bm!58233) (not b!1204452) (not b!1204444))
(check-sat b_and!42771 (not b_next!25909))
