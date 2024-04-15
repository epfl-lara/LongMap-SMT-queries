; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100818 () Bool)

(assert start!100818)

(declare-fun b_free!25963 () Bool)

(declare-fun b_next!25963 () Bool)

(assert (=> start!100818 (= b_free!25963 (not b_next!25963))))

(declare-fun tp!90895 () Bool)

(declare-fun b_and!42905 () Bool)

(assert (=> start!100818 (= tp!90895 b_and!42905)))

(declare-fun bm!58879 () Bool)

(declare-datatypes ((V!46017 0))(
  ( (V!46018 (val!15390 Int)) )
))
(declare-datatypes ((tuple2!19822 0))(
  ( (tuple2!19823 (_1!9922 (_ BitVec 64)) (_2!9922 V!46017)) )
))
(declare-datatypes ((List!26604 0))(
  ( (Nil!26601) (Cons!26600 (h!27809 tuple2!19822) (t!39538 List!26604)) )
))
(declare-datatypes ((ListLongMap!17791 0))(
  ( (ListLongMap!17792 (toList!8911 List!26604)) )
))
(declare-fun call!58889 () ListLongMap!17791)

(declare-fun call!58882 () ListLongMap!17791)

(assert (=> bm!58879 (= call!58889 call!58882)))

(declare-fun e!685450 () Bool)

(declare-datatypes ((array!78028 0))(
  ( (array!78029 (arr!37654 (Array (_ BitVec 32) (_ BitVec 64))) (size!38192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78028)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1207027 () Bool)

(declare-fun arrayContainsKey!0 (array!78028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207027 (= e!685450 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58880 () Bool)

(declare-datatypes ((Unit!39849 0))(
  ( (Unit!39850) )
))
(declare-fun call!58884 () Unit!39849)

(declare-fun call!58885 () Unit!39849)

(assert (=> bm!58880 (= call!58884 call!58885)))

(declare-fun b!1207028 () Bool)

(declare-fun e!685459 () Unit!39849)

(declare-fun Unit!39851 () Unit!39849)

(assert (=> b!1207028 (= e!685459 Unit!39851)))

(declare-fun b!1207029 () Bool)

(declare-fun res!802606 () Bool)

(declare-fun e!685451 () Bool)

(assert (=> b!1207029 (=> (not res!802606) (not e!685451))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1207029 (= res!802606 (validMask!0 mask!1564))))

(declare-fun b!1207030 () Bool)

(declare-fun res!802603 () Bool)

(assert (=> b!1207030 (=> (not res!802603) (not e!685451))))

(declare-datatypes ((List!26605 0))(
  ( (Nil!26602) (Cons!26601 (h!27810 (_ BitVec 64)) (t!39539 List!26605)) )
))
(declare-fun arrayNoDuplicates!0 (array!78028 (_ BitVec 32) List!26605) Bool)

(assert (=> b!1207030 (= res!802603 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26602))))

(declare-fun b!1207031 () Bool)

(declare-fun c!118568 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!547505 () Bool)

(assert (=> b!1207031 (= c!118568 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547505))))

(declare-fun e!685463 () Unit!39849)

(assert (=> b!1207031 (= e!685463 e!685459)))

(declare-fun b!1207032 () Bool)

(declare-fun res!802610 () Bool)

(assert (=> b!1207032 (=> (not res!802610) (not e!685451))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207032 (= res!802610 (= (select (arr!37654 _keys!1208) i!673) k0!934))))

(declare-fun b!1207033 () Bool)

(declare-fun e!685455 () Bool)

(declare-fun e!685458 () Bool)

(assert (=> b!1207033 (= e!685455 e!685458)))

(declare-fun res!802607 () Bool)

(assert (=> b!1207033 (=> res!802607 e!685458)))

(assert (=> b!1207033 (= res!802607 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46017)

(declare-fun lt!547511 () array!78028)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14624 0))(
  ( (ValueCellFull!14624 (v!18034 V!46017)) (EmptyCell!14624) )
))
(declare-datatypes ((array!78030 0))(
  ( (array!78031 (arr!37655 (Array (_ BitVec 32) ValueCell!14624)) (size!38193 (_ BitVec 32))) )
))
(declare-fun lt!547510 () array!78030)

(declare-fun minValue!944 () V!46017)

(declare-fun lt!547502 () ListLongMap!17791)

(declare-fun getCurrentListMapNoExtraKeys!5354 (array!78028 array!78030 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 32) Int) ListLongMap!17791)

(assert (=> b!1207033 (= lt!547502 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78030)

(declare-fun dynLambda!3219 (Int (_ BitVec 64)) V!46017)

(assert (=> b!1207033 (= lt!547510 (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)))))

(declare-fun lt!547506 () ListLongMap!17791)

(assert (=> b!1207033 (= lt!547506 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!802615 () Bool)

(assert (=> start!100818 (=> (not res!802615) (not e!685451))))

(assert (=> start!100818 (= res!802615 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38192 _keys!1208))))))

(assert (=> start!100818 e!685451))

(declare-fun tp_is_empty!30667 () Bool)

(assert (=> start!100818 tp_is_empty!30667))

(declare-fun array_inv!28794 (array!78028) Bool)

(assert (=> start!100818 (array_inv!28794 _keys!1208)))

(assert (=> start!100818 true))

(assert (=> start!100818 tp!90895))

(declare-fun e!685448 () Bool)

(declare-fun array_inv!28795 (array!78030) Bool)

(assert (=> start!100818 (and (array_inv!28795 _values!996) e!685448)))

(declare-fun b!1207034 () Bool)

(declare-fun res!802611 () Bool)

(assert (=> b!1207034 (=> (not res!802611) (not e!685451))))

(assert (=> b!1207034 (= res!802611 (and (= (size!38193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38192 _keys!1208) (size!38193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!58883 () ListLongMap!17791)

(declare-fun bm!58881 () Bool)

(assert (=> bm!58881 (= call!58883 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207035 () Bool)

(declare-fun lt!547504 () Unit!39849)

(assert (=> b!1207035 (= e!685459 lt!547504)))

(assert (=> b!1207035 (= lt!547504 call!58884)))

(declare-fun call!58887 () Bool)

(assert (=> b!1207035 call!58887))

(declare-fun b!1207036 () Bool)

(declare-fun e!685460 () Bool)

(assert (=> b!1207036 (= e!685460 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547505) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1207037 () Bool)

(declare-fun res!802614 () Bool)

(assert (=> b!1207037 (=> (not res!802614) (not e!685451))))

(assert (=> b!1207037 (= res!802614 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38192 _keys!1208))))))

(declare-fun b!1207038 () Bool)

(declare-fun call!58888 () ListLongMap!17791)

(declare-fun e!685454 () Bool)

(declare-fun -!1796 (ListLongMap!17791 (_ BitVec 64)) ListLongMap!17791)

(assert (=> b!1207038 (= e!685454 (= call!58883 (-!1796 call!58888 k0!934)))))

(declare-fun b!1207039 () Bool)

(declare-fun e!685453 () Unit!39849)

(assert (=> b!1207039 (= e!685453 e!685463)))

(declare-fun c!118571 () Bool)

(assert (=> b!1207039 (= c!118571 (and (not lt!547505) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1207040 () Bool)

(declare-fun e!685457 () Bool)

(declare-fun mapRes!47859 () Bool)

(assert (=> b!1207040 (= e!685448 (and e!685457 mapRes!47859))))

(declare-fun condMapEmpty!47859 () Bool)

(declare-fun mapDefault!47859 () ValueCell!14624)

(assert (=> b!1207040 (= condMapEmpty!47859 (= (arr!37655 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14624)) mapDefault!47859)))))

(declare-fun b!1207041 () Bool)

(declare-fun res!802613 () Bool)

(assert (=> b!1207041 (=> (not res!802613) (not e!685451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207041 (= res!802613 (validKeyInArray!0 k0!934))))

(declare-fun b!1207042 () Bool)

(assert (=> b!1207042 (= e!685454 (= call!58883 call!58888))))

(declare-fun b!1207043 () Bool)

(declare-fun e!685449 () Bool)

(assert (=> b!1207043 (= e!685458 e!685449)))

(declare-fun res!802616 () Bool)

(assert (=> b!1207043 (=> res!802616 e!685449)))

(assert (=> b!1207043 (= res!802616 (not (= (select (arr!37654 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1207043 e!685454))

(declare-fun c!118572 () Bool)

(assert (=> b!1207043 (= c!118572 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547500 () Unit!39849)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 (array!78028 array!78030 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39849)

(assert (=> b!1207043 (= lt!547500 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207044 () Bool)

(assert (=> b!1207044 (= e!685457 tp_is_empty!30667)))

(declare-fun bm!58882 () Bool)

(assert (=> bm!58882 (= call!58888 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!118569 () Bool)

(declare-fun lt!547509 () ListLongMap!17791)

(declare-fun lt!547503 () ListLongMap!17791)

(declare-fun bm!58883 () Bool)

(declare-fun +!4038 (ListLongMap!17791 tuple2!19822) ListLongMap!17791)

(assert (=> bm!58883 (= call!58882 (+!4038 (ite c!118569 lt!547509 lt!547503) (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207045 () Bool)

(declare-fun e!685461 () Bool)

(assert (=> b!1207045 (= e!685449 e!685461)))

(declare-fun res!802608 () Bool)

(assert (=> b!1207045 (=> res!802608 e!685461)))

(declare-fun contains!6910 (ListLongMap!17791 (_ BitVec 64)) Bool)

(assert (=> b!1207045 (= res!802608 (not (contains!6910 lt!547503 k0!934)))))

(assert (=> b!1207045 (= lt!547503 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58884 () Bool)

(declare-fun call!58886 () Bool)

(assert (=> bm!58884 (= call!58886 (contains!6910 (ite c!118569 lt!547509 call!58889) k0!934))))

(declare-fun b!1207046 () Bool)

(declare-fun e!685452 () Bool)

(assert (=> b!1207046 (= e!685452 (not e!685455))))

(declare-fun res!802612 () Bool)

(assert (=> b!1207046 (=> res!802612 e!685455)))

(assert (=> b!1207046 (= res!802612 (bvsgt from!1455 i!673))))

(assert (=> b!1207046 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547497 () Unit!39849)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78028 (_ BitVec 64) (_ BitVec 32)) Unit!39849)

(assert (=> b!1207046 (= lt!547497 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1207047 () Bool)

(declare-fun res!802617 () Bool)

(assert (=> b!1207047 (=> (not res!802617) (not e!685452))))

(assert (=> b!1207047 (= res!802617 (arrayNoDuplicates!0 lt!547511 #b00000000000000000000000000000000 Nil!26602))))

(declare-fun bm!58885 () Bool)

(assert (=> bm!58885 (= call!58887 call!58886)))

(declare-fun b!1207048 () Bool)

(assert (=> b!1207048 (= e!685451 e!685452)))

(declare-fun res!802604 () Bool)

(assert (=> b!1207048 (=> (not res!802604) (not e!685452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78028 (_ BitVec 32)) Bool)

(assert (=> b!1207048 (= res!802604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547511 mask!1564))))

(assert (=> b!1207048 (= lt!547511 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))

(declare-fun b!1207049 () Bool)

(declare-fun res!802605 () Bool)

(assert (=> b!1207049 (=> (not res!802605) (not e!685451))))

(assert (=> b!1207049 (= res!802605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!58886 () Bool)

(declare-fun addStillContains!1022 (ListLongMap!17791 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39849)

(assert (=> bm!58886 (= call!58885 (addStillContains!1022 (ite c!118569 lt!547509 lt!547503) (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!47859 () Bool)

(declare-fun tp!90894 () Bool)

(declare-fun e!685462 () Bool)

(assert (=> mapNonEmpty!47859 (= mapRes!47859 (and tp!90894 e!685462))))

(declare-fun mapRest!47859 () (Array (_ BitVec 32) ValueCell!14624))

(declare-fun mapValue!47859 () ValueCell!14624)

(declare-fun mapKey!47859 () (_ BitVec 32))

(assert (=> mapNonEmpty!47859 (= (arr!37655 _values!996) (store mapRest!47859 mapKey!47859 mapValue!47859))))

(declare-fun b!1207050 () Bool)

(assert (=> b!1207050 (= e!685462 tp_is_empty!30667)))

(declare-fun b!1207051 () Bool)

(assert (=> b!1207051 (= e!685461 (or (bvsge (size!38192 _keys!1208) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208))))))

(assert (=> b!1207051 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26602)))

(declare-fun lt!547498 () Unit!39849)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78028 (_ BitVec 32) (_ BitVec 32)) Unit!39849)

(assert (=> b!1207051 (= lt!547498 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1207051 e!685450))

(declare-fun res!802609 () Bool)

(assert (=> b!1207051 (=> (not res!802609) (not e!685450))))

(assert (=> b!1207051 (= res!802609 e!685460)))

(declare-fun c!118570 () Bool)

(assert (=> b!1207051 (= c!118570 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547508 () Unit!39849)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!570 (array!78028 array!78030 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 64) (_ BitVec 32) Int) Unit!39849)

(assert (=> b!1207051 (= lt!547508 (lemmaListMapContainsThenArrayContainsFrom!570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547507 () Unit!39849)

(assert (=> b!1207051 (= lt!547507 e!685453)))

(assert (=> b!1207051 (= c!118569 (and (not lt!547505) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207051 (= lt!547505 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1207052 () Bool)

(assert (=> b!1207052 (= e!685460 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207053 () Bool)

(assert (=> b!1207053 call!58887))

(declare-fun lt!547501 () Unit!39849)

(assert (=> b!1207053 (= lt!547501 call!58884)))

(assert (=> b!1207053 (= e!685463 lt!547501)))

(declare-fun b!1207054 () Bool)

(declare-fun lt!547499 () Unit!39849)

(assert (=> b!1207054 (= e!685453 lt!547499)))

(declare-fun lt!547496 () Unit!39849)

(assert (=> b!1207054 (= lt!547496 (addStillContains!1022 lt!547503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1207054 (= lt!547509 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1207054 call!58886))

(assert (=> b!1207054 (= lt!547499 call!58885)))

(assert (=> b!1207054 (contains!6910 call!58882 k0!934)))

(declare-fun mapIsEmpty!47859 () Bool)

(assert (=> mapIsEmpty!47859 mapRes!47859))

(assert (= (and start!100818 res!802615) b!1207029))

(assert (= (and b!1207029 res!802606) b!1207034))

(assert (= (and b!1207034 res!802611) b!1207049))

(assert (= (and b!1207049 res!802605) b!1207030))

(assert (= (and b!1207030 res!802603) b!1207037))

(assert (= (and b!1207037 res!802614) b!1207041))

(assert (= (and b!1207041 res!802613) b!1207032))

(assert (= (and b!1207032 res!802610) b!1207048))

(assert (= (and b!1207048 res!802604) b!1207047))

(assert (= (and b!1207047 res!802617) b!1207046))

(assert (= (and b!1207046 (not res!802612)) b!1207033))

(assert (= (and b!1207033 (not res!802607)) b!1207043))

(assert (= (and b!1207043 c!118572) b!1207038))

(assert (= (and b!1207043 (not c!118572)) b!1207042))

(assert (= (or b!1207038 b!1207042) bm!58881))

(assert (= (or b!1207038 b!1207042) bm!58882))

(assert (= (and b!1207043 (not res!802616)) b!1207045))

(assert (= (and b!1207045 (not res!802608)) b!1207051))

(assert (= (and b!1207051 c!118569) b!1207054))

(assert (= (and b!1207051 (not c!118569)) b!1207039))

(assert (= (and b!1207039 c!118571) b!1207053))

(assert (= (and b!1207039 (not c!118571)) b!1207031))

(assert (= (and b!1207031 c!118568) b!1207035))

(assert (= (and b!1207031 (not c!118568)) b!1207028))

(assert (= (or b!1207053 b!1207035) bm!58880))

(assert (= (or b!1207053 b!1207035) bm!58879))

(assert (= (or b!1207053 b!1207035) bm!58885))

(assert (= (or b!1207054 bm!58885) bm!58884))

(assert (= (or b!1207054 bm!58880) bm!58886))

(assert (= (or b!1207054 bm!58879) bm!58883))

(assert (= (and b!1207051 c!118570) b!1207052))

(assert (= (and b!1207051 (not c!118570)) b!1207036))

(assert (= (and b!1207051 res!802609) b!1207027))

(assert (= (and b!1207040 condMapEmpty!47859) mapIsEmpty!47859))

(assert (= (and b!1207040 (not condMapEmpty!47859)) mapNonEmpty!47859))

(get-info :version)

(assert (= (and mapNonEmpty!47859 ((_ is ValueCellFull!14624) mapValue!47859)) b!1207050))

(assert (= (and b!1207040 ((_ is ValueCellFull!14624) mapDefault!47859)) b!1207044))

(assert (= start!100818 b!1207040))

(declare-fun b_lambda!21379 () Bool)

(assert (=> (not b_lambda!21379) (not b!1207033)))

(declare-fun t!39537 () Bool)

(declare-fun tb!10755 () Bool)

(assert (=> (and start!100818 (= defaultEntry!1004 defaultEntry!1004) t!39537) tb!10755))

(declare-fun result!22105 () Bool)

(assert (=> tb!10755 (= result!22105 tp_is_empty!30667)))

(assert (=> b!1207033 t!39537))

(declare-fun b_and!42907 () Bool)

(assert (= b_and!42905 (and (=> t!39537 result!22105) b_and!42907)))

(declare-fun m!1112109 () Bool)

(assert (=> b!1207041 m!1112109))

(declare-fun m!1112111 () Bool)

(assert (=> bm!58886 m!1112111))

(declare-fun m!1112113 () Bool)

(assert (=> bm!58883 m!1112113))

(declare-fun m!1112115 () Bool)

(assert (=> b!1207032 m!1112115))

(declare-fun m!1112117 () Bool)

(assert (=> start!100818 m!1112117))

(declare-fun m!1112119 () Bool)

(assert (=> start!100818 m!1112119))

(declare-fun m!1112121 () Bool)

(assert (=> b!1207038 m!1112121))

(declare-fun m!1112123 () Bool)

(assert (=> b!1207027 m!1112123))

(declare-fun m!1112125 () Bool)

(assert (=> bm!58884 m!1112125))

(declare-fun m!1112127 () Bool)

(assert (=> b!1207029 m!1112127))

(declare-fun m!1112129 () Bool)

(assert (=> bm!58882 m!1112129))

(declare-fun m!1112131 () Bool)

(assert (=> b!1207054 m!1112131))

(declare-fun m!1112133 () Bool)

(assert (=> b!1207054 m!1112133))

(declare-fun m!1112135 () Bool)

(assert (=> b!1207054 m!1112135))

(declare-fun m!1112137 () Bool)

(assert (=> b!1207047 m!1112137))

(assert (=> b!1207052 m!1112123))

(declare-fun m!1112139 () Bool)

(assert (=> bm!58881 m!1112139))

(declare-fun m!1112141 () Bool)

(assert (=> b!1207045 m!1112141))

(assert (=> b!1207045 m!1112129))

(declare-fun m!1112143 () Bool)

(assert (=> mapNonEmpty!47859 m!1112143))

(declare-fun m!1112145 () Bool)

(assert (=> b!1207048 m!1112145))

(declare-fun m!1112147 () Bool)

(assert (=> b!1207048 m!1112147))

(declare-fun m!1112149 () Bool)

(assert (=> b!1207030 m!1112149))

(declare-fun m!1112151 () Bool)

(assert (=> b!1207049 m!1112151))

(declare-fun m!1112153 () Bool)

(assert (=> b!1207033 m!1112153))

(declare-fun m!1112155 () Bool)

(assert (=> b!1207033 m!1112155))

(declare-fun m!1112157 () Bool)

(assert (=> b!1207033 m!1112157))

(declare-fun m!1112159 () Bool)

(assert (=> b!1207033 m!1112159))

(declare-fun m!1112161 () Bool)

(assert (=> b!1207051 m!1112161))

(declare-fun m!1112163 () Bool)

(assert (=> b!1207051 m!1112163))

(declare-fun m!1112165 () Bool)

(assert (=> b!1207051 m!1112165))

(declare-fun m!1112167 () Bool)

(assert (=> b!1207046 m!1112167))

(declare-fun m!1112169 () Bool)

(assert (=> b!1207046 m!1112169))

(declare-fun m!1112171 () Bool)

(assert (=> b!1207043 m!1112171))

(declare-fun m!1112173 () Bool)

(assert (=> b!1207043 m!1112173))

(check-sat (not b!1207048) (not b!1207043) (not b!1207045) (not bm!58883) (not start!100818) (not b!1207030) (not b!1207046) b_and!42907 (not b!1207041) (not b!1207054) (not bm!58882) (not b!1207033) (not b!1207052) (not mapNonEmpty!47859) (not b!1207051) (not b_next!25963) (not b!1207029) (not b_lambda!21379) (not b!1207027) (not b!1207047) (not bm!58884) (not bm!58881) tp_is_empty!30667 (not b!1207049) (not b!1207038) (not bm!58886))
(check-sat b_and!42907 (not b_next!25963))
(get-model)

(declare-fun b_lambda!21385 () Bool)

(assert (= b_lambda!21379 (or (and start!100818 b_free!25963) b_lambda!21385)))

(check-sat (not b!1207048) (not b!1207027) (not b!1207045) (not bm!58883) (not start!100818) (not b!1207030) (not b!1207046) b_and!42907 (not b!1207041) (not b!1207054) (not bm!58882) (not b!1207033) (not b!1207052) (not mapNonEmpty!47859) (not b!1207043) (not b_lambda!21385) (not b!1207051) (not b_next!25963) (not b!1207029) (not b!1207047) (not bm!58884) (not bm!58881) tp_is_empty!30667 (not b!1207049) (not b!1207038) (not bm!58886))
(check-sat b_and!42907 (not b_next!25963))
(get-model)

(declare-fun d!132803 () Bool)

(assert (=> d!132803 (= (array_inv!28794 _keys!1208) (bvsge (size!38192 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100818 d!132803))

(declare-fun d!132805 () Bool)

(assert (=> d!132805 (= (array_inv!28795 _values!996) (bvsge (size!38193 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100818 d!132805))

(declare-fun d!132807 () Bool)

(declare-fun res!802714 () Bool)

(declare-fun e!685570 () Bool)

(assert (=> d!132807 (=> res!802714 e!685570)))

(assert (=> d!132807 (= res!802714 (bvsge #b00000000000000000000000000000000 (size!38192 _keys!1208)))))

(assert (=> d!132807 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26602) e!685570)))

(declare-fun bm!58937 () Bool)

(declare-fun call!58940 () Bool)

(declare-fun c!118605 () Bool)

(assert (=> bm!58937 (= call!58940 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118605 (Cons!26601 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) Nil!26602) Nil!26602)))))

(declare-fun b!1207239 () Bool)

(declare-fun e!685569 () Bool)

(assert (=> b!1207239 (= e!685569 call!58940)))

(declare-fun b!1207240 () Bool)

(assert (=> b!1207240 (= e!685569 call!58940)))

(declare-fun b!1207241 () Bool)

(declare-fun e!685571 () Bool)

(assert (=> b!1207241 (= e!685571 e!685569)))

(assert (=> b!1207241 (= c!118605 (validKeyInArray!0 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207242 () Bool)

(assert (=> b!1207242 (= e!685570 e!685571)))

(declare-fun res!802716 () Bool)

(assert (=> b!1207242 (=> (not res!802716) (not e!685571))))

(declare-fun e!685568 () Bool)

(assert (=> b!1207242 (= res!802716 (not e!685568))))

(declare-fun res!802715 () Bool)

(assert (=> b!1207242 (=> (not res!802715) (not e!685568))))

(assert (=> b!1207242 (= res!802715 (validKeyInArray!0 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207243 () Bool)

(declare-fun contains!6913 (List!26605 (_ BitVec 64)) Bool)

(assert (=> b!1207243 (= e!685568 (contains!6913 Nil!26602 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132807 (not res!802714)) b!1207242))

(assert (= (and b!1207242 res!802715) b!1207243))

(assert (= (and b!1207242 res!802716) b!1207241))

(assert (= (and b!1207241 c!118605) b!1207240))

(assert (= (and b!1207241 (not c!118605)) b!1207239))

(assert (= (or b!1207240 b!1207239) bm!58937))

(declare-fun m!1112307 () Bool)

(assert (=> bm!58937 m!1112307))

(declare-fun m!1112309 () Bool)

(assert (=> bm!58937 m!1112309))

(assert (=> b!1207241 m!1112307))

(assert (=> b!1207241 m!1112307))

(declare-fun m!1112311 () Bool)

(assert (=> b!1207241 m!1112311))

(assert (=> b!1207242 m!1112307))

(assert (=> b!1207242 m!1112307))

(assert (=> b!1207242 m!1112311))

(assert (=> b!1207243 m!1112307))

(assert (=> b!1207243 m!1112307))

(declare-fun m!1112313 () Bool)

(assert (=> b!1207243 m!1112313))

(assert (=> b!1207030 d!132807))

(declare-fun d!132809 () Bool)

(declare-fun res!802722 () Bool)

(declare-fun e!685578 () Bool)

(assert (=> d!132809 (=> res!802722 e!685578)))

(assert (=> d!132809 (= res!802722 (bvsge #b00000000000000000000000000000000 (size!38192 lt!547511)))))

(assert (=> d!132809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547511 mask!1564) e!685578)))

(declare-fun b!1207252 () Bool)

(declare-fun e!685579 () Bool)

(declare-fun call!58943 () Bool)

(assert (=> b!1207252 (= e!685579 call!58943)))

(declare-fun b!1207253 () Bool)

(declare-fun e!685580 () Bool)

(assert (=> b!1207253 (= e!685578 e!685580)))

(declare-fun c!118608 () Bool)

(assert (=> b!1207253 (= c!118608 (validKeyInArray!0 (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(declare-fun b!1207254 () Bool)

(assert (=> b!1207254 (= e!685580 e!685579)))

(declare-fun lt!547614 () (_ BitVec 64))

(assert (=> b!1207254 (= lt!547614 (select (arr!37654 lt!547511) #b00000000000000000000000000000000))))

(declare-fun lt!547616 () Unit!39849)

(assert (=> b!1207254 (= lt!547616 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547511 lt!547614 #b00000000000000000000000000000000))))

(assert (=> b!1207254 (arrayContainsKey!0 lt!547511 lt!547614 #b00000000000000000000000000000000)))

(declare-fun lt!547615 () Unit!39849)

(assert (=> b!1207254 (= lt!547615 lt!547616)))

(declare-fun res!802721 () Bool)

(declare-datatypes ((SeekEntryResult!9937 0))(
  ( (MissingZero!9937 (index!42119 (_ BitVec 32))) (Found!9937 (index!42120 (_ BitVec 32))) (Intermediate!9937 (undefined!10749 Bool) (index!42121 (_ BitVec 32)) (x!106576 (_ BitVec 32))) (Undefined!9937) (MissingVacant!9937 (index!42122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78028 (_ BitVec 32)) SeekEntryResult!9937)

(assert (=> b!1207254 (= res!802721 (= (seekEntryOrOpen!0 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) lt!547511 mask!1564) (Found!9937 #b00000000000000000000000000000000)))))

(assert (=> b!1207254 (=> (not res!802721) (not e!685579))))

(declare-fun bm!58940 () Bool)

(assert (=> bm!58940 (= call!58943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!547511 mask!1564))))

(declare-fun b!1207255 () Bool)

(assert (=> b!1207255 (= e!685580 call!58943)))

(assert (= (and d!132809 (not res!802722)) b!1207253))

(assert (= (and b!1207253 c!118608) b!1207254))

(assert (= (and b!1207253 (not c!118608)) b!1207255))

(assert (= (and b!1207254 res!802721) b!1207252))

(assert (= (or b!1207252 b!1207255) bm!58940))

(declare-fun m!1112315 () Bool)

(assert (=> b!1207253 m!1112315))

(assert (=> b!1207253 m!1112315))

(declare-fun m!1112317 () Bool)

(assert (=> b!1207253 m!1112317))

(assert (=> b!1207254 m!1112315))

(declare-fun m!1112319 () Bool)

(assert (=> b!1207254 m!1112319))

(declare-fun m!1112321 () Bool)

(assert (=> b!1207254 m!1112321))

(assert (=> b!1207254 m!1112315))

(declare-fun m!1112323 () Bool)

(assert (=> b!1207254 m!1112323))

(declare-fun m!1112325 () Bool)

(assert (=> bm!58940 m!1112325))

(assert (=> b!1207048 d!132809))

(declare-fun d!132811 () Bool)

(assert (=> d!132811 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207041 d!132811))

(declare-fun call!58946 () ListLongMap!17791)

(declare-fun bm!58943 () Bool)

(assert (=> bm!58943 (= call!58946 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun e!685599 () Bool)

(declare-fun lt!547635 () ListLongMap!17791)

(declare-fun b!1207280 () Bool)

(assert (=> b!1207280 (= e!685599 (= lt!547635 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207281 () Bool)

(declare-fun e!685597 () ListLongMap!17791)

(declare-fun e!685601 () ListLongMap!17791)

(assert (=> b!1207281 (= e!685597 e!685601)))

(declare-fun c!118620 () Bool)

(assert (=> b!1207281 (= c!118620 (validKeyInArray!0 (select (arr!37654 lt!547511) from!1455)))))

(declare-fun b!1207282 () Bool)

(declare-fun e!685598 () Bool)

(assert (=> b!1207282 (= e!685598 e!685599)))

(declare-fun c!118619 () Bool)

(assert (=> b!1207282 (= c!118619 (bvslt from!1455 (size!38192 lt!547511)))))

(declare-fun b!1207283 () Bool)

(declare-fun e!685600 () Bool)

(assert (=> b!1207283 (= e!685600 (validKeyInArray!0 (select (arr!37654 lt!547511) from!1455)))))

(assert (=> b!1207283 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1207284 () Bool)

(assert (=> b!1207284 (= e!685601 call!58946)))

(declare-fun b!1207285 () Bool)

(declare-fun e!685595 () Bool)

(assert (=> b!1207285 (= e!685595 e!685598)))

(declare-fun c!118618 () Bool)

(assert (=> b!1207285 (= c!118618 e!685600)))

(declare-fun res!802733 () Bool)

(assert (=> b!1207285 (=> (not res!802733) (not e!685600))))

(assert (=> b!1207285 (= res!802733 (bvslt from!1455 (size!38192 lt!547511)))))

(declare-fun b!1207286 () Bool)

(declare-fun isEmpty!992 (ListLongMap!17791) Bool)

(assert (=> b!1207286 (= e!685599 (isEmpty!992 lt!547635))))

(declare-fun b!1207287 () Bool)

(declare-fun lt!547634 () Unit!39849)

(declare-fun lt!547631 () Unit!39849)

(assert (=> b!1207287 (= lt!547634 lt!547631)))

(declare-fun lt!547637 () (_ BitVec 64))

(declare-fun lt!547633 () V!46017)

(declare-fun lt!547632 () ListLongMap!17791)

(declare-fun lt!547636 () (_ BitVec 64))

(assert (=> b!1207287 (not (contains!6910 (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633)) lt!547636))))

(declare-fun addStillNotContains!294 (ListLongMap!17791 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39849)

(assert (=> b!1207287 (= lt!547631 (addStillNotContains!294 lt!547632 lt!547637 lt!547633 lt!547636))))

(assert (=> b!1207287 (= lt!547636 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19207 (ValueCell!14624 V!46017) V!46017)

(assert (=> b!1207287 (= lt!547633 (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207287 (= lt!547637 (select (arr!37654 lt!547511) from!1455))))

(assert (=> b!1207287 (= lt!547632 call!58946)))

(assert (=> b!1207287 (= e!685601 (+!4038 call!58946 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207288 () Bool)

(declare-fun e!685596 () Bool)

(assert (=> b!1207288 (= e!685598 e!685596)))

(assert (=> b!1207288 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 lt!547511)))))

(declare-fun res!802732 () Bool)

(assert (=> b!1207288 (= res!802732 (contains!6910 lt!547635 (select (arr!37654 lt!547511) from!1455)))))

(assert (=> b!1207288 (=> (not res!802732) (not e!685596))))

(declare-fun b!1207289 () Bool)

(declare-fun res!802734 () Bool)

(assert (=> b!1207289 (=> (not res!802734) (not e!685595))))

(assert (=> b!1207289 (= res!802734 (not (contains!6910 lt!547635 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207290 () Bool)

(assert (=> b!1207290 (= e!685597 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207291 () Bool)

(assert (=> b!1207291 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 lt!547511)))))

(assert (=> b!1207291 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38193 lt!547510)))))

(declare-fun apply!958 (ListLongMap!17791 (_ BitVec 64)) V!46017)

(assert (=> b!1207291 (= e!685596 (= (apply!958 lt!547635 (select (arr!37654 lt!547511) from!1455)) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132813 () Bool)

(assert (=> d!132813 e!685595))

(declare-fun res!802731 () Bool)

(assert (=> d!132813 (=> (not res!802731) (not e!685595))))

(assert (=> d!132813 (= res!802731 (not (contains!6910 lt!547635 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132813 (= lt!547635 e!685597)))

(declare-fun c!118617 () Bool)

(assert (=> d!132813 (= c!118617 (bvsge from!1455 (size!38192 lt!547511)))))

(assert (=> d!132813 (validMask!0 mask!1564)))

(assert (=> d!132813 (= (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547635)))

(assert (= (and d!132813 c!118617) b!1207290))

(assert (= (and d!132813 (not c!118617)) b!1207281))

(assert (= (and b!1207281 c!118620) b!1207287))

(assert (= (and b!1207281 (not c!118620)) b!1207284))

(assert (= (or b!1207287 b!1207284) bm!58943))

(assert (= (and d!132813 res!802731) b!1207289))

(assert (= (and b!1207289 res!802734) b!1207285))

(assert (= (and b!1207285 res!802733) b!1207283))

(assert (= (and b!1207285 c!118618) b!1207288))

(assert (= (and b!1207285 (not c!118618)) b!1207282))

(assert (= (and b!1207288 res!802732) b!1207291))

(assert (= (and b!1207282 c!118619) b!1207280))

(assert (= (and b!1207282 (not c!118619)) b!1207286))

(declare-fun b_lambda!21387 () Bool)

(assert (=> (not b_lambda!21387) (not b!1207287)))

(assert (=> b!1207287 t!39537))

(declare-fun b_and!42917 () Bool)

(assert (= b_and!42907 (and (=> t!39537 result!22105) b_and!42917)))

(declare-fun b_lambda!21389 () Bool)

(assert (=> (not b_lambda!21389) (not b!1207291)))

(assert (=> b!1207291 t!39537))

(declare-fun b_and!42919 () Bool)

(assert (= b_and!42917 (and (=> t!39537 result!22105) b_and!42919)))

(declare-fun m!1112327 () Bool)

(assert (=> b!1207288 m!1112327))

(assert (=> b!1207288 m!1112327))

(declare-fun m!1112329 () Bool)

(assert (=> b!1207288 m!1112329))

(declare-fun m!1112331 () Bool)

(assert (=> b!1207280 m!1112331))

(declare-fun m!1112333 () Bool)

(assert (=> b!1207286 m!1112333))

(assert (=> bm!58943 m!1112331))

(assert (=> b!1207283 m!1112327))

(assert (=> b!1207283 m!1112327))

(declare-fun m!1112335 () Bool)

(assert (=> b!1207283 m!1112335))

(assert (=> b!1207291 m!1112155))

(assert (=> b!1207291 m!1112327))

(declare-fun m!1112337 () Bool)

(assert (=> b!1207291 m!1112337))

(declare-fun m!1112339 () Bool)

(assert (=> b!1207291 m!1112339))

(assert (=> b!1207291 m!1112327))

(assert (=> b!1207291 m!1112339))

(assert (=> b!1207291 m!1112155))

(declare-fun m!1112341 () Bool)

(assert (=> b!1207291 m!1112341))

(declare-fun m!1112343 () Bool)

(assert (=> d!132813 m!1112343))

(assert (=> d!132813 m!1112127))

(declare-fun m!1112345 () Bool)

(assert (=> b!1207289 m!1112345))

(assert (=> b!1207281 m!1112327))

(assert (=> b!1207281 m!1112327))

(assert (=> b!1207281 m!1112335))

(assert (=> b!1207287 m!1112155))

(declare-fun m!1112347 () Bool)

(assert (=> b!1207287 m!1112347))

(declare-fun m!1112349 () Bool)

(assert (=> b!1207287 m!1112349))

(assert (=> b!1207287 m!1112339))

(assert (=> b!1207287 m!1112327))

(assert (=> b!1207287 m!1112339))

(assert (=> b!1207287 m!1112155))

(assert (=> b!1207287 m!1112341))

(declare-fun m!1112351 () Bool)

(assert (=> b!1207287 m!1112351))

(declare-fun m!1112353 () Bool)

(assert (=> b!1207287 m!1112353))

(assert (=> b!1207287 m!1112351))

(assert (=> b!1207033 d!132813))

(declare-fun bm!58944 () Bool)

(declare-fun call!58947 () ListLongMap!17791)

(assert (=> bm!58944 (= call!58947 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun e!685606 () Bool)

(declare-fun lt!547642 () ListLongMap!17791)

(declare-fun b!1207292 () Bool)

(assert (=> b!1207292 (= e!685606 (= lt!547642 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207293 () Bool)

(declare-fun e!685604 () ListLongMap!17791)

(declare-fun e!685608 () ListLongMap!17791)

(assert (=> b!1207293 (= e!685604 e!685608)))

(declare-fun c!118624 () Bool)

(assert (=> b!1207293 (= c!118624 (validKeyInArray!0 (select (arr!37654 _keys!1208) from!1455)))))

(declare-fun b!1207294 () Bool)

(declare-fun e!685605 () Bool)

(assert (=> b!1207294 (= e!685605 e!685606)))

(declare-fun c!118623 () Bool)

(assert (=> b!1207294 (= c!118623 (bvslt from!1455 (size!38192 _keys!1208)))))

(declare-fun b!1207295 () Bool)

(declare-fun e!685607 () Bool)

(assert (=> b!1207295 (= e!685607 (validKeyInArray!0 (select (arr!37654 _keys!1208) from!1455)))))

(assert (=> b!1207295 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1207296 () Bool)

(assert (=> b!1207296 (= e!685608 call!58947)))

(declare-fun b!1207297 () Bool)

(declare-fun e!685602 () Bool)

(assert (=> b!1207297 (= e!685602 e!685605)))

(declare-fun c!118622 () Bool)

(assert (=> b!1207297 (= c!118622 e!685607)))

(declare-fun res!802737 () Bool)

(assert (=> b!1207297 (=> (not res!802737) (not e!685607))))

(assert (=> b!1207297 (= res!802737 (bvslt from!1455 (size!38192 _keys!1208)))))

(declare-fun b!1207298 () Bool)

(assert (=> b!1207298 (= e!685606 (isEmpty!992 lt!547642))))

(declare-fun b!1207299 () Bool)

(declare-fun lt!547641 () Unit!39849)

(declare-fun lt!547638 () Unit!39849)

(assert (=> b!1207299 (= lt!547641 lt!547638)))

(declare-fun lt!547643 () (_ BitVec 64))

(declare-fun lt!547640 () V!46017)

(declare-fun lt!547644 () (_ BitVec 64))

(declare-fun lt!547639 () ListLongMap!17791)

(assert (=> b!1207299 (not (contains!6910 (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640)) lt!547643))))

(assert (=> b!1207299 (= lt!547638 (addStillNotContains!294 lt!547639 lt!547644 lt!547640 lt!547643))))

(assert (=> b!1207299 (= lt!547643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207299 (= lt!547640 (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207299 (= lt!547644 (select (arr!37654 _keys!1208) from!1455))))

(assert (=> b!1207299 (= lt!547639 call!58947)))

(assert (=> b!1207299 (= e!685608 (+!4038 call!58947 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207300 () Bool)

(declare-fun e!685603 () Bool)

(assert (=> b!1207300 (= e!685605 e!685603)))

(assert (=> b!1207300 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 _keys!1208)))))

(declare-fun res!802736 () Bool)

(assert (=> b!1207300 (= res!802736 (contains!6910 lt!547642 (select (arr!37654 _keys!1208) from!1455)))))

(assert (=> b!1207300 (=> (not res!802736) (not e!685603))))

(declare-fun b!1207301 () Bool)

(declare-fun res!802738 () Bool)

(assert (=> b!1207301 (=> (not res!802738) (not e!685602))))

(assert (=> b!1207301 (= res!802738 (not (contains!6910 lt!547642 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207302 () Bool)

(assert (=> b!1207302 (= e!685604 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207303 () Bool)

(assert (=> b!1207303 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 _keys!1208)))))

(assert (=> b!1207303 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38193 _values!996)))))

(assert (=> b!1207303 (= e!685603 (= (apply!958 lt!547642 (select (arr!37654 _keys!1208) from!1455)) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132815 () Bool)

(assert (=> d!132815 e!685602))

(declare-fun res!802735 () Bool)

(assert (=> d!132815 (=> (not res!802735) (not e!685602))))

(assert (=> d!132815 (= res!802735 (not (contains!6910 lt!547642 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132815 (= lt!547642 e!685604)))

(declare-fun c!118621 () Bool)

(assert (=> d!132815 (= c!118621 (bvsge from!1455 (size!38192 _keys!1208)))))

(assert (=> d!132815 (validMask!0 mask!1564)))

(assert (=> d!132815 (= (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547642)))

(assert (= (and d!132815 c!118621) b!1207302))

(assert (= (and d!132815 (not c!118621)) b!1207293))

(assert (= (and b!1207293 c!118624) b!1207299))

(assert (= (and b!1207293 (not c!118624)) b!1207296))

(assert (= (or b!1207299 b!1207296) bm!58944))

(assert (= (and d!132815 res!802735) b!1207301))

(assert (= (and b!1207301 res!802738) b!1207297))

(assert (= (and b!1207297 res!802737) b!1207295))

(assert (= (and b!1207297 c!118622) b!1207300))

(assert (= (and b!1207297 (not c!118622)) b!1207294))

(assert (= (and b!1207300 res!802736) b!1207303))

(assert (= (and b!1207294 c!118623) b!1207292))

(assert (= (and b!1207294 (not c!118623)) b!1207298))

(declare-fun b_lambda!21391 () Bool)

(assert (=> (not b_lambda!21391) (not b!1207299)))

(assert (=> b!1207299 t!39537))

(declare-fun b_and!42921 () Bool)

(assert (= b_and!42919 (and (=> t!39537 result!22105) b_and!42921)))

(declare-fun b_lambda!21393 () Bool)

(assert (=> (not b_lambda!21393) (not b!1207303)))

(assert (=> b!1207303 t!39537))

(declare-fun b_and!42923 () Bool)

(assert (= b_and!42921 (and (=> t!39537 result!22105) b_and!42923)))

(assert (=> b!1207300 m!1112171))

(assert (=> b!1207300 m!1112171))

(declare-fun m!1112355 () Bool)

(assert (=> b!1207300 m!1112355))

(declare-fun m!1112357 () Bool)

(assert (=> b!1207292 m!1112357))

(declare-fun m!1112359 () Bool)

(assert (=> b!1207298 m!1112359))

(assert (=> bm!58944 m!1112357))

(assert (=> b!1207295 m!1112171))

(assert (=> b!1207295 m!1112171))

(declare-fun m!1112361 () Bool)

(assert (=> b!1207295 m!1112361))

(assert (=> b!1207303 m!1112155))

(assert (=> b!1207303 m!1112171))

(declare-fun m!1112363 () Bool)

(assert (=> b!1207303 m!1112363))

(declare-fun m!1112365 () Bool)

(assert (=> b!1207303 m!1112365))

(assert (=> b!1207303 m!1112171))

(assert (=> b!1207303 m!1112365))

(assert (=> b!1207303 m!1112155))

(declare-fun m!1112367 () Bool)

(assert (=> b!1207303 m!1112367))

(declare-fun m!1112369 () Bool)

(assert (=> d!132815 m!1112369))

(assert (=> d!132815 m!1112127))

(declare-fun m!1112371 () Bool)

(assert (=> b!1207301 m!1112371))

(assert (=> b!1207293 m!1112171))

(assert (=> b!1207293 m!1112171))

(assert (=> b!1207293 m!1112361))

(assert (=> b!1207299 m!1112155))

(declare-fun m!1112373 () Bool)

(assert (=> b!1207299 m!1112373))

(declare-fun m!1112375 () Bool)

(assert (=> b!1207299 m!1112375))

(assert (=> b!1207299 m!1112365))

(assert (=> b!1207299 m!1112171))

(assert (=> b!1207299 m!1112365))

(assert (=> b!1207299 m!1112155))

(assert (=> b!1207299 m!1112367))

(declare-fun m!1112377 () Bool)

(assert (=> b!1207299 m!1112377))

(declare-fun m!1112379 () Bool)

(assert (=> b!1207299 m!1112379))

(assert (=> b!1207299 m!1112377))

(assert (=> b!1207033 d!132815))

(declare-fun d!132817 () Bool)

(declare-fun res!802740 () Bool)

(declare-fun e!685609 () Bool)

(assert (=> d!132817 (=> res!802740 e!685609)))

(assert (=> d!132817 (= res!802740 (bvsge #b00000000000000000000000000000000 (size!38192 _keys!1208)))))

(assert (=> d!132817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!685609)))

(declare-fun b!1207304 () Bool)

(declare-fun e!685610 () Bool)

(declare-fun call!58948 () Bool)

(assert (=> b!1207304 (= e!685610 call!58948)))

(declare-fun b!1207305 () Bool)

(declare-fun e!685611 () Bool)

(assert (=> b!1207305 (= e!685609 e!685611)))

(declare-fun c!118625 () Bool)

(assert (=> b!1207305 (= c!118625 (validKeyInArray!0 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207306 () Bool)

(assert (=> b!1207306 (= e!685611 e!685610)))

(declare-fun lt!547645 () (_ BitVec 64))

(assert (=> b!1207306 (= lt!547645 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!547647 () Unit!39849)

(assert (=> b!1207306 (= lt!547647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547645 #b00000000000000000000000000000000))))

(assert (=> b!1207306 (arrayContainsKey!0 _keys!1208 lt!547645 #b00000000000000000000000000000000)))

(declare-fun lt!547646 () Unit!39849)

(assert (=> b!1207306 (= lt!547646 lt!547647)))

(declare-fun res!802739 () Bool)

(assert (=> b!1207306 (= res!802739 (= (seekEntryOrOpen!0 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9937 #b00000000000000000000000000000000)))))

(assert (=> b!1207306 (=> (not res!802739) (not e!685610))))

(declare-fun bm!58945 () Bool)

(assert (=> bm!58945 (= call!58948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1207307 () Bool)

(assert (=> b!1207307 (= e!685611 call!58948)))

(assert (= (and d!132817 (not res!802740)) b!1207305))

(assert (= (and b!1207305 c!118625) b!1207306))

(assert (= (and b!1207305 (not c!118625)) b!1207307))

(assert (= (and b!1207306 res!802739) b!1207304))

(assert (= (or b!1207304 b!1207307) bm!58945))

(assert (=> b!1207305 m!1112307))

(assert (=> b!1207305 m!1112307))

(assert (=> b!1207305 m!1112311))

(assert (=> b!1207306 m!1112307))

(declare-fun m!1112381 () Bool)

(assert (=> b!1207306 m!1112381))

(declare-fun m!1112383 () Bool)

(assert (=> b!1207306 m!1112383))

(assert (=> b!1207306 m!1112307))

(declare-fun m!1112385 () Bool)

(assert (=> b!1207306 m!1112385))

(declare-fun m!1112387 () Bool)

(assert (=> bm!58945 m!1112387))

(assert (=> b!1207049 d!132817))

(declare-fun d!132819 () Bool)

(assert (=> d!132819 (contains!6910 (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!547650 () Unit!39849)

(declare-fun choose!1809 (ListLongMap!17791 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39849)

(assert (=> d!132819 (= lt!547650 (choose!1809 (ite c!118569 lt!547509 lt!547503) (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!132819 (contains!6910 (ite c!118569 lt!547509 lt!547503) k0!934)))

(assert (=> d!132819 (= (addStillContains!1022 (ite c!118569 lt!547509 lt!547503) (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)) k0!934) lt!547650)))

(declare-fun bs!34100 () Bool)

(assert (= bs!34100 d!132819))

(declare-fun m!1112389 () Bool)

(assert (=> bs!34100 m!1112389))

(assert (=> bs!34100 m!1112389))

(declare-fun m!1112391 () Bool)

(assert (=> bs!34100 m!1112391))

(declare-fun m!1112393 () Bool)

(assert (=> bs!34100 m!1112393))

(declare-fun m!1112395 () Bool)

(assert (=> bs!34100 m!1112395))

(assert (=> bm!58886 d!132819))

(declare-fun call!58954 () ListLongMap!17791)

(declare-fun bm!58950 () Bool)

(assert (=> bm!58950 (= call!58954 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!58953 () ListLongMap!17791)

(declare-fun e!685617 () Bool)

(declare-fun b!1207315 () Bool)

(assert (=> b!1207315 (= e!685617 (= call!58953 (-!1796 call!58954 k0!934)))))

(assert (=> b!1207315 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38193 _values!996)))))

(declare-fun d!132821 () Bool)

(declare-fun e!685616 () Bool)

(assert (=> d!132821 e!685616))

(declare-fun res!802743 () Bool)

(assert (=> d!132821 (=> (not res!802743) (not e!685616))))

(assert (=> d!132821 (= res!802743 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38192 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38192 _keys!1208))))))))

(declare-fun lt!547653 () Unit!39849)

(declare-fun choose!1810 (array!78028 array!78030 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39849)

(assert (=> d!132821 (= lt!547653 (choose!1810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132821 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(assert (=> d!132821 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547653)))

(declare-fun b!1207316 () Bool)

(assert (=> b!1207316 (= e!685617 (= call!58953 call!58954))))

(assert (=> b!1207316 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38193 _values!996)))))

(declare-fun bm!58951 () Bool)

(assert (=> bm!58951 (= call!58953 (getCurrentListMapNoExtraKeys!5354 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)) (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207317 () Bool)

(assert (=> b!1207317 (= e!685616 e!685617)))

(declare-fun c!118628 () Bool)

(assert (=> b!1207317 (= c!118628 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!132821 res!802743) b!1207317))

(assert (= (and b!1207317 c!118628) b!1207315))

(assert (= (and b!1207317 (not c!118628)) b!1207316))

(assert (= (or b!1207315 b!1207316) bm!58950))

(assert (= (or b!1207315 b!1207316) bm!58951))

(declare-fun b_lambda!21395 () Bool)

(assert (=> (not b_lambda!21395) (not bm!58951)))

(assert (=> bm!58951 t!39537))

(declare-fun b_and!42925 () Bool)

(assert (= b_and!42923 (and (=> t!39537 result!22105) b_and!42925)))

(assert (=> bm!58950 m!1112129))

(declare-fun m!1112397 () Bool)

(assert (=> b!1207315 m!1112397))

(declare-fun m!1112399 () Bool)

(assert (=> d!132821 m!1112399))

(assert (=> bm!58951 m!1112147))

(assert (=> bm!58951 m!1112155))

(assert (=> bm!58951 m!1112157))

(declare-fun m!1112401 () Bool)

(assert (=> bm!58951 m!1112401))

(assert (=> b!1207043 d!132821))

(declare-fun bm!58952 () Bool)

(declare-fun call!58955 () ListLongMap!17791)

(assert (=> bm!58952 (= call!58955 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207318 () Bool)

(declare-fun e!685622 () Bool)

(declare-fun lt!547658 () ListLongMap!17791)

(assert (=> b!1207318 (= e!685622 (= lt!547658 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207319 () Bool)

(declare-fun e!685620 () ListLongMap!17791)

(declare-fun e!685624 () ListLongMap!17791)

(assert (=> b!1207319 (= e!685620 e!685624)))

(declare-fun c!118632 () Bool)

(assert (=> b!1207319 (= c!118632 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207320 () Bool)

(declare-fun e!685621 () Bool)

(assert (=> b!1207320 (= e!685621 e!685622)))

(declare-fun c!118631 () Bool)

(assert (=> b!1207320 (= c!118631 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 lt!547511)))))

(declare-fun b!1207321 () Bool)

(declare-fun e!685623 () Bool)

(assert (=> b!1207321 (= e!685623 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207321 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1207322 () Bool)

(assert (=> b!1207322 (= e!685624 call!58955)))

(declare-fun b!1207323 () Bool)

(declare-fun e!685618 () Bool)

(assert (=> b!1207323 (= e!685618 e!685621)))

(declare-fun c!118630 () Bool)

(assert (=> b!1207323 (= c!118630 e!685623)))

(declare-fun res!802746 () Bool)

(assert (=> b!1207323 (=> (not res!802746) (not e!685623))))

(assert (=> b!1207323 (= res!802746 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 lt!547511)))))

(declare-fun b!1207324 () Bool)

(assert (=> b!1207324 (= e!685622 (isEmpty!992 lt!547658))))

(declare-fun b!1207325 () Bool)

(declare-fun lt!547657 () Unit!39849)

(declare-fun lt!547654 () Unit!39849)

(assert (=> b!1207325 (= lt!547657 lt!547654)))

(declare-fun lt!547659 () (_ BitVec 64))

(declare-fun lt!547656 () V!46017)

(declare-fun lt!547660 () (_ BitVec 64))

(declare-fun lt!547655 () ListLongMap!17791)

(assert (=> b!1207325 (not (contains!6910 (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656)) lt!547659))))

(assert (=> b!1207325 (= lt!547654 (addStillNotContains!294 lt!547655 lt!547660 lt!547656 lt!547659))))

(assert (=> b!1207325 (= lt!547659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207325 (= lt!547656 (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207325 (= lt!547660 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1207325 (= lt!547655 call!58955)))

(assert (=> b!1207325 (= e!685624 (+!4038 call!58955 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207326 () Bool)

(declare-fun e!685619 () Bool)

(assert (=> b!1207326 (= e!685621 e!685619)))

(assert (=> b!1207326 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 lt!547511)))))

(declare-fun res!802745 () Bool)

(assert (=> b!1207326 (= res!802745 (contains!6910 lt!547658 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207326 (=> (not res!802745) (not e!685619))))

(declare-fun b!1207327 () Bool)

(declare-fun res!802747 () Bool)

(assert (=> b!1207327 (=> (not res!802747) (not e!685618))))

(assert (=> b!1207327 (= res!802747 (not (contains!6910 lt!547658 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207328 () Bool)

(assert (=> b!1207328 (= e!685620 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207329 () Bool)

(assert (=> b!1207329 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 lt!547511)))))

(assert (=> b!1207329 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38193 lt!547510)))))

(assert (=> b!1207329 (= e!685619 (= (apply!958 lt!547658 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132823 () Bool)

(assert (=> d!132823 e!685618))

(declare-fun res!802744 () Bool)

(assert (=> d!132823 (=> (not res!802744) (not e!685618))))

(assert (=> d!132823 (= res!802744 (not (contains!6910 lt!547658 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132823 (= lt!547658 e!685620)))

(declare-fun c!118629 () Bool)

(assert (=> d!132823 (= c!118629 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 lt!547511)))))

(assert (=> d!132823 (validMask!0 mask!1564)))

(assert (=> d!132823 (= (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547658)))

(assert (= (and d!132823 c!118629) b!1207328))

(assert (= (and d!132823 (not c!118629)) b!1207319))

(assert (= (and b!1207319 c!118632) b!1207325))

(assert (= (and b!1207319 (not c!118632)) b!1207322))

(assert (= (or b!1207325 b!1207322) bm!58952))

(assert (= (and d!132823 res!802744) b!1207327))

(assert (= (and b!1207327 res!802747) b!1207323))

(assert (= (and b!1207323 res!802746) b!1207321))

(assert (= (and b!1207323 c!118630) b!1207326))

(assert (= (and b!1207323 (not c!118630)) b!1207320))

(assert (= (and b!1207326 res!802745) b!1207329))

(assert (= (and b!1207320 c!118631) b!1207318))

(assert (= (and b!1207320 (not c!118631)) b!1207324))

(declare-fun b_lambda!21397 () Bool)

(assert (=> (not b_lambda!21397) (not b!1207325)))

(assert (=> b!1207325 t!39537))

(declare-fun b_and!42927 () Bool)

(assert (= b_and!42925 (and (=> t!39537 result!22105) b_and!42927)))

(declare-fun b_lambda!21399 () Bool)

(assert (=> (not b_lambda!21399) (not b!1207329)))

(assert (=> b!1207329 t!39537))

(declare-fun b_and!42929 () Bool)

(assert (= b_and!42927 (and (=> t!39537 result!22105) b_and!42929)))

(declare-fun m!1112403 () Bool)

(assert (=> b!1207326 m!1112403))

(assert (=> b!1207326 m!1112403))

(declare-fun m!1112405 () Bool)

(assert (=> b!1207326 m!1112405))

(declare-fun m!1112407 () Bool)

(assert (=> b!1207318 m!1112407))

(declare-fun m!1112409 () Bool)

(assert (=> b!1207324 m!1112409))

(assert (=> bm!58952 m!1112407))

(assert (=> b!1207321 m!1112403))

(assert (=> b!1207321 m!1112403))

(declare-fun m!1112411 () Bool)

(assert (=> b!1207321 m!1112411))

(assert (=> b!1207329 m!1112155))

(assert (=> b!1207329 m!1112403))

(declare-fun m!1112413 () Bool)

(assert (=> b!1207329 m!1112413))

(declare-fun m!1112415 () Bool)

(assert (=> b!1207329 m!1112415))

(assert (=> b!1207329 m!1112403))

(assert (=> b!1207329 m!1112415))

(assert (=> b!1207329 m!1112155))

(declare-fun m!1112417 () Bool)

(assert (=> b!1207329 m!1112417))

(declare-fun m!1112419 () Bool)

(assert (=> d!132823 m!1112419))

(assert (=> d!132823 m!1112127))

(declare-fun m!1112421 () Bool)

(assert (=> b!1207327 m!1112421))

(assert (=> b!1207319 m!1112403))

(assert (=> b!1207319 m!1112403))

(assert (=> b!1207319 m!1112411))

(assert (=> b!1207325 m!1112155))

(declare-fun m!1112423 () Bool)

(assert (=> b!1207325 m!1112423))

(declare-fun m!1112425 () Bool)

(assert (=> b!1207325 m!1112425))

(assert (=> b!1207325 m!1112415))

(assert (=> b!1207325 m!1112403))

(assert (=> b!1207325 m!1112415))

(assert (=> b!1207325 m!1112155))

(assert (=> b!1207325 m!1112417))

(declare-fun m!1112427 () Bool)

(assert (=> b!1207325 m!1112427))

(declare-fun m!1112429 () Bool)

(assert (=> b!1207325 m!1112429))

(assert (=> b!1207325 m!1112427))

(assert (=> bm!58881 d!132823))

(declare-fun bm!58953 () Bool)

(declare-fun call!58956 () ListLongMap!17791)

(assert (=> bm!58953 (= call!58956 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207330 () Bool)

(declare-fun lt!547665 () ListLongMap!17791)

(declare-fun e!685629 () Bool)

(assert (=> b!1207330 (= e!685629 (= lt!547665 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207331 () Bool)

(declare-fun e!685627 () ListLongMap!17791)

(declare-fun e!685631 () ListLongMap!17791)

(assert (=> b!1207331 (= e!685627 e!685631)))

(declare-fun c!118636 () Bool)

(assert (=> b!1207331 (= c!118636 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207332 () Bool)

(declare-fun e!685628 () Bool)

(assert (=> b!1207332 (= e!685628 e!685629)))

(declare-fun c!118635 () Bool)

(assert (=> b!1207332 (= c!118635 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(declare-fun b!1207333 () Bool)

(declare-fun e!685630 () Bool)

(assert (=> b!1207333 (= e!685630 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207333 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1207334 () Bool)

(assert (=> b!1207334 (= e!685631 call!58956)))

(declare-fun b!1207335 () Bool)

(declare-fun e!685625 () Bool)

(assert (=> b!1207335 (= e!685625 e!685628)))

(declare-fun c!118634 () Bool)

(assert (=> b!1207335 (= c!118634 e!685630)))

(declare-fun res!802750 () Bool)

(assert (=> b!1207335 (=> (not res!802750) (not e!685630))))

(assert (=> b!1207335 (= res!802750 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(declare-fun b!1207336 () Bool)

(assert (=> b!1207336 (= e!685629 (isEmpty!992 lt!547665))))

(declare-fun b!1207337 () Bool)

(declare-fun lt!547664 () Unit!39849)

(declare-fun lt!547661 () Unit!39849)

(assert (=> b!1207337 (= lt!547664 lt!547661)))

(declare-fun lt!547663 () V!46017)

(declare-fun lt!547666 () (_ BitVec 64))

(declare-fun lt!547667 () (_ BitVec 64))

(declare-fun lt!547662 () ListLongMap!17791)

(assert (=> b!1207337 (not (contains!6910 (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663)) lt!547666))))

(assert (=> b!1207337 (= lt!547661 (addStillNotContains!294 lt!547662 lt!547667 lt!547663 lt!547666))))

(assert (=> b!1207337 (= lt!547666 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207337 (= lt!547663 (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207337 (= lt!547667 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1207337 (= lt!547662 call!58956)))

(assert (=> b!1207337 (= e!685631 (+!4038 call!58956 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207338 () Bool)

(declare-fun e!685626 () Bool)

(assert (=> b!1207338 (= e!685628 e!685626)))

(assert (=> b!1207338 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(declare-fun res!802749 () Bool)

(assert (=> b!1207338 (= res!802749 (contains!6910 lt!547665 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207338 (=> (not res!802749) (not e!685626))))

(declare-fun b!1207339 () Bool)

(declare-fun res!802751 () Bool)

(assert (=> b!1207339 (=> (not res!802751) (not e!685625))))

(assert (=> b!1207339 (= res!802751 (not (contains!6910 lt!547665 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207340 () Bool)

(assert (=> b!1207340 (= e!685627 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207341 () Bool)

(assert (=> b!1207341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(assert (=> b!1207341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38193 _values!996)))))

(assert (=> b!1207341 (= e!685626 (= (apply!958 lt!547665 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132825 () Bool)

(assert (=> d!132825 e!685625))

(declare-fun res!802748 () Bool)

(assert (=> d!132825 (=> (not res!802748) (not e!685625))))

(assert (=> d!132825 (= res!802748 (not (contains!6910 lt!547665 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132825 (= lt!547665 e!685627)))

(declare-fun c!118633 () Bool)

(assert (=> d!132825 (= c!118633 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(assert (=> d!132825 (validMask!0 mask!1564)))

(assert (=> d!132825 (= (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547665)))

(assert (= (and d!132825 c!118633) b!1207340))

(assert (= (and d!132825 (not c!118633)) b!1207331))

(assert (= (and b!1207331 c!118636) b!1207337))

(assert (= (and b!1207331 (not c!118636)) b!1207334))

(assert (= (or b!1207337 b!1207334) bm!58953))

(assert (= (and d!132825 res!802748) b!1207339))

(assert (= (and b!1207339 res!802751) b!1207335))

(assert (= (and b!1207335 res!802750) b!1207333))

(assert (= (and b!1207335 c!118634) b!1207338))

(assert (= (and b!1207335 (not c!118634)) b!1207332))

(assert (= (and b!1207338 res!802749) b!1207341))

(assert (= (and b!1207332 c!118635) b!1207330))

(assert (= (and b!1207332 (not c!118635)) b!1207336))

(declare-fun b_lambda!21401 () Bool)

(assert (=> (not b_lambda!21401) (not b!1207337)))

(assert (=> b!1207337 t!39537))

(declare-fun b_and!42931 () Bool)

(assert (= b_and!42929 (and (=> t!39537 result!22105) b_and!42931)))

(declare-fun b_lambda!21403 () Bool)

(assert (=> (not b_lambda!21403) (not b!1207341)))

(assert (=> b!1207341 t!39537))

(declare-fun b_and!42933 () Bool)

(assert (= b_and!42931 (and (=> t!39537 result!22105) b_and!42933)))

(declare-fun m!1112431 () Bool)

(assert (=> b!1207338 m!1112431))

(assert (=> b!1207338 m!1112431))

(declare-fun m!1112433 () Bool)

(assert (=> b!1207338 m!1112433))

(declare-fun m!1112435 () Bool)

(assert (=> b!1207330 m!1112435))

(declare-fun m!1112437 () Bool)

(assert (=> b!1207336 m!1112437))

(assert (=> bm!58953 m!1112435))

(assert (=> b!1207333 m!1112431))

(assert (=> b!1207333 m!1112431))

(declare-fun m!1112439 () Bool)

(assert (=> b!1207333 m!1112439))

(assert (=> b!1207341 m!1112155))

(assert (=> b!1207341 m!1112431))

(declare-fun m!1112441 () Bool)

(assert (=> b!1207341 m!1112441))

(declare-fun m!1112443 () Bool)

(assert (=> b!1207341 m!1112443))

(assert (=> b!1207341 m!1112431))

(assert (=> b!1207341 m!1112443))

(assert (=> b!1207341 m!1112155))

(declare-fun m!1112445 () Bool)

(assert (=> b!1207341 m!1112445))

(declare-fun m!1112447 () Bool)

(assert (=> d!132825 m!1112447))

(assert (=> d!132825 m!1112127))

(declare-fun m!1112449 () Bool)

(assert (=> b!1207339 m!1112449))

(assert (=> b!1207331 m!1112431))

(assert (=> b!1207331 m!1112431))

(assert (=> b!1207331 m!1112439))

(assert (=> b!1207337 m!1112155))

(declare-fun m!1112451 () Bool)

(assert (=> b!1207337 m!1112451))

(declare-fun m!1112453 () Bool)

(assert (=> b!1207337 m!1112453))

(assert (=> b!1207337 m!1112443))

(assert (=> b!1207337 m!1112431))

(assert (=> b!1207337 m!1112443))

(assert (=> b!1207337 m!1112155))

(assert (=> b!1207337 m!1112445))

(declare-fun m!1112455 () Bool)

(assert (=> b!1207337 m!1112455))

(declare-fun m!1112457 () Bool)

(assert (=> b!1207337 m!1112457))

(assert (=> b!1207337 m!1112455))

(assert (=> bm!58882 d!132825))

(declare-fun d!132827 () Bool)

(declare-fun e!685634 () Bool)

(assert (=> d!132827 e!685634))

(declare-fun res!802756 () Bool)

(assert (=> d!132827 (=> (not res!802756) (not e!685634))))

(declare-fun lt!547676 () ListLongMap!17791)

(assert (=> d!132827 (= res!802756 (contains!6910 lt!547676 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!547677 () List!26604)

(assert (=> d!132827 (= lt!547676 (ListLongMap!17792 lt!547677))))

(declare-fun lt!547678 () Unit!39849)

(declare-fun lt!547679 () Unit!39849)

(assert (=> d!132827 (= lt!547678 lt!547679)))

(declare-datatypes ((Option!689 0))(
  ( (Some!688 (v!18037 V!46017)) (None!687) )
))
(declare-fun getValueByKey!638 (List!26604 (_ BitVec 64)) Option!689)

(assert (=> d!132827 (= (getValueByKey!638 lt!547677 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!688 (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!314 (List!26604 (_ BitVec 64) V!46017) Unit!39849)

(assert (=> d!132827 (= lt!547679 (lemmaContainsTupThenGetReturnValue!314 lt!547677 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun insertStrictlySorted!407 (List!26604 (_ BitVec 64) V!46017) List!26604)

(assert (=> d!132827 (= lt!547677 (insertStrictlySorted!407 (toList!8911 (ite c!118569 lt!547509 lt!547503)) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132827 (= (+!4038 (ite c!118569 lt!547509 lt!547503) (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!547676)))

(declare-fun b!1207346 () Bool)

(declare-fun res!802757 () Bool)

(assert (=> b!1207346 (=> (not res!802757) (not e!685634))))

(assert (=> b!1207346 (= res!802757 (= (getValueByKey!638 (toList!8911 lt!547676) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!688 (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1207347 () Bool)

(declare-fun contains!6914 (List!26604 tuple2!19822) Bool)

(assert (=> b!1207347 (= e!685634 (contains!6914 (toList!8911 lt!547676) (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132827 res!802756) b!1207346))

(assert (= (and b!1207346 res!802757) b!1207347))

(declare-fun m!1112459 () Bool)

(assert (=> d!132827 m!1112459))

(declare-fun m!1112461 () Bool)

(assert (=> d!132827 m!1112461))

(declare-fun m!1112463 () Bool)

(assert (=> d!132827 m!1112463))

(declare-fun m!1112465 () Bool)

(assert (=> d!132827 m!1112465))

(declare-fun m!1112467 () Bool)

(assert (=> b!1207346 m!1112467))

(declare-fun m!1112469 () Bool)

(assert (=> b!1207347 m!1112469))

(assert (=> bm!58883 d!132827))

(declare-fun d!132829 () Bool)

(declare-fun res!802762 () Bool)

(declare-fun e!685639 () Bool)

(assert (=> d!132829 (=> res!802762 e!685639)))

(assert (=> d!132829 (= res!802762 (= (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132829 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!685639)))

(declare-fun b!1207352 () Bool)

(declare-fun e!685640 () Bool)

(assert (=> b!1207352 (= e!685639 e!685640)))

(declare-fun res!802763 () Bool)

(assert (=> b!1207352 (=> (not res!802763) (not e!685640))))

(assert (=> b!1207352 (= res!802763 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207353 () Bool)

(assert (=> b!1207353 (= e!685640 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132829 (not res!802762)) b!1207352))

(assert (= (and b!1207352 res!802763) b!1207353))

(assert (=> d!132829 m!1112431))

(declare-fun m!1112471 () Bool)

(assert (=> b!1207353 m!1112471))

(assert (=> b!1207027 d!132829))

(declare-fun d!132831 () Bool)

(declare-fun res!802764 () Bool)

(declare-fun e!685643 () Bool)

(assert (=> d!132831 (=> res!802764 e!685643)))

(assert (=> d!132831 (= res!802764 (bvsge from!1455 (size!38192 _keys!1208)))))

(assert (=> d!132831 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26602) e!685643)))

(declare-fun c!118637 () Bool)

(declare-fun bm!58954 () Bool)

(declare-fun call!58957 () Bool)

(assert (=> bm!58954 (= call!58957 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118637 (Cons!26601 (select (arr!37654 _keys!1208) from!1455) Nil!26602) Nil!26602)))))

(declare-fun b!1207354 () Bool)

(declare-fun e!685642 () Bool)

(assert (=> b!1207354 (= e!685642 call!58957)))

(declare-fun b!1207355 () Bool)

(assert (=> b!1207355 (= e!685642 call!58957)))

(declare-fun b!1207356 () Bool)

(declare-fun e!685644 () Bool)

(assert (=> b!1207356 (= e!685644 e!685642)))

(assert (=> b!1207356 (= c!118637 (validKeyInArray!0 (select (arr!37654 _keys!1208) from!1455)))))

(declare-fun b!1207357 () Bool)

(assert (=> b!1207357 (= e!685643 e!685644)))

(declare-fun res!802766 () Bool)

(assert (=> b!1207357 (=> (not res!802766) (not e!685644))))

(declare-fun e!685641 () Bool)

(assert (=> b!1207357 (= res!802766 (not e!685641))))

(declare-fun res!802765 () Bool)

(assert (=> b!1207357 (=> (not res!802765) (not e!685641))))

(assert (=> b!1207357 (= res!802765 (validKeyInArray!0 (select (arr!37654 _keys!1208) from!1455)))))

(declare-fun b!1207358 () Bool)

(assert (=> b!1207358 (= e!685641 (contains!6913 Nil!26602 (select (arr!37654 _keys!1208) from!1455)))))

(assert (= (and d!132831 (not res!802764)) b!1207357))

(assert (= (and b!1207357 res!802765) b!1207358))

(assert (= (and b!1207357 res!802766) b!1207356))

(assert (= (and b!1207356 c!118637) b!1207355))

(assert (= (and b!1207356 (not c!118637)) b!1207354))

(assert (= (or b!1207355 b!1207354) bm!58954))

(assert (=> bm!58954 m!1112171))

(declare-fun m!1112473 () Bool)

(assert (=> bm!58954 m!1112473))

(assert (=> b!1207356 m!1112171))

(assert (=> b!1207356 m!1112171))

(assert (=> b!1207356 m!1112361))

(assert (=> b!1207357 m!1112171))

(assert (=> b!1207357 m!1112171))

(assert (=> b!1207357 m!1112361))

(assert (=> b!1207358 m!1112171))

(assert (=> b!1207358 m!1112171))

(declare-fun m!1112475 () Bool)

(assert (=> b!1207358 m!1112475))

(assert (=> b!1207051 d!132831))

(declare-fun d!132833 () Bool)

(assert (=> d!132833 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26602)))

(declare-fun lt!547682 () Unit!39849)

(declare-fun choose!39 (array!78028 (_ BitVec 32) (_ BitVec 32)) Unit!39849)

(assert (=> d!132833 (= lt!547682 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!132833 (bvslt (size!38192 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!132833 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!547682)))

(declare-fun bs!34101 () Bool)

(assert (= bs!34101 d!132833))

(assert (=> bs!34101 m!1112161))

(declare-fun m!1112477 () Bool)

(assert (=> bs!34101 m!1112477))

(assert (=> b!1207051 d!132833))

(declare-fun d!132835 () Bool)

(declare-fun e!685647 () Bool)

(assert (=> d!132835 e!685647))

(declare-fun c!118640 () Bool)

(assert (=> d!132835 (= c!118640 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547685 () Unit!39849)

(declare-fun choose!1811 (array!78028 array!78030 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 64) (_ BitVec 32) Int) Unit!39849)

(assert (=> d!132835 (= lt!547685 (choose!1811 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132835 (validMask!0 mask!1564)))

(assert (=> d!132835 (= (lemmaListMapContainsThenArrayContainsFrom!570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547685)))

(declare-fun b!1207363 () Bool)

(assert (=> b!1207363 (= e!685647 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207364 () Bool)

(assert (=> b!1207364 (= e!685647 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132835 c!118640) b!1207363))

(assert (= (and d!132835 (not c!118640)) b!1207364))

(declare-fun m!1112479 () Bool)

(assert (=> d!132835 m!1112479))

(assert (=> d!132835 m!1112127))

(assert (=> b!1207363 m!1112123))

(assert (=> b!1207051 d!132835))

(assert (=> b!1207052 d!132829))

(declare-fun d!132837 () Bool)

(declare-fun e!685653 () Bool)

(assert (=> d!132837 e!685653))

(declare-fun res!802769 () Bool)

(assert (=> d!132837 (=> res!802769 e!685653)))

(declare-fun lt!547695 () Bool)

(assert (=> d!132837 (= res!802769 (not lt!547695))))

(declare-fun lt!547696 () Bool)

(assert (=> d!132837 (= lt!547695 lt!547696)))

(declare-fun lt!547694 () Unit!39849)

(declare-fun e!685652 () Unit!39849)

(assert (=> d!132837 (= lt!547694 e!685652)))

(declare-fun c!118643 () Bool)

(assert (=> d!132837 (= c!118643 lt!547696)))

(declare-fun containsKey!592 (List!26604 (_ BitVec 64)) Bool)

(assert (=> d!132837 (= lt!547696 (containsKey!592 (toList!8911 lt!547503) k0!934))))

(assert (=> d!132837 (= (contains!6910 lt!547503 k0!934) lt!547695)))

(declare-fun b!1207371 () Bool)

(declare-fun lt!547697 () Unit!39849)

(assert (=> b!1207371 (= e!685652 lt!547697)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!421 (List!26604 (_ BitVec 64)) Unit!39849)

(assert (=> b!1207371 (= lt!547697 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547503) k0!934))))

(declare-fun isDefined!464 (Option!689) Bool)

(assert (=> b!1207371 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547503) k0!934))))

(declare-fun b!1207372 () Bool)

(declare-fun Unit!39857 () Unit!39849)

(assert (=> b!1207372 (= e!685652 Unit!39857)))

(declare-fun b!1207373 () Bool)

(assert (=> b!1207373 (= e!685653 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547503) k0!934)))))

(assert (= (and d!132837 c!118643) b!1207371))

(assert (= (and d!132837 (not c!118643)) b!1207372))

(assert (= (and d!132837 (not res!802769)) b!1207373))

(declare-fun m!1112481 () Bool)

(assert (=> d!132837 m!1112481))

(declare-fun m!1112483 () Bool)

(assert (=> b!1207371 m!1112483))

(declare-fun m!1112485 () Bool)

(assert (=> b!1207371 m!1112485))

(assert (=> b!1207371 m!1112485))

(declare-fun m!1112487 () Bool)

(assert (=> b!1207371 m!1112487))

(assert (=> b!1207373 m!1112485))

(assert (=> b!1207373 m!1112485))

(assert (=> b!1207373 m!1112487))

(assert (=> b!1207045 d!132837))

(assert (=> b!1207045 d!132825))

(declare-fun d!132839 () Bool)

(declare-fun e!685655 () Bool)

(assert (=> d!132839 e!685655))

(declare-fun res!802770 () Bool)

(assert (=> d!132839 (=> res!802770 e!685655)))

(declare-fun lt!547699 () Bool)

(assert (=> d!132839 (= res!802770 (not lt!547699))))

(declare-fun lt!547700 () Bool)

(assert (=> d!132839 (= lt!547699 lt!547700)))

(declare-fun lt!547698 () Unit!39849)

(declare-fun e!685654 () Unit!39849)

(assert (=> d!132839 (= lt!547698 e!685654)))

(declare-fun c!118644 () Bool)

(assert (=> d!132839 (= c!118644 lt!547700)))

(assert (=> d!132839 (= lt!547700 (containsKey!592 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934))))

(assert (=> d!132839 (= (contains!6910 (ite c!118569 lt!547509 call!58889) k0!934) lt!547699)))

(declare-fun b!1207374 () Bool)

(declare-fun lt!547701 () Unit!39849)

(assert (=> b!1207374 (= e!685654 lt!547701)))

(assert (=> b!1207374 (= lt!547701 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934))))

(assert (=> b!1207374 (isDefined!464 (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934))))

(declare-fun b!1207375 () Bool)

(declare-fun Unit!39858 () Unit!39849)

(assert (=> b!1207375 (= e!685654 Unit!39858)))

(declare-fun b!1207376 () Bool)

(assert (=> b!1207376 (= e!685655 (isDefined!464 (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934)))))

(assert (= (and d!132839 c!118644) b!1207374))

(assert (= (and d!132839 (not c!118644)) b!1207375))

(assert (= (and d!132839 (not res!802770)) b!1207376))

(declare-fun m!1112489 () Bool)

(assert (=> d!132839 m!1112489))

(declare-fun m!1112491 () Bool)

(assert (=> b!1207374 m!1112491))

(declare-fun m!1112493 () Bool)

(assert (=> b!1207374 m!1112493))

(assert (=> b!1207374 m!1112493))

(declare-fun m!1112495 () Bool)

(assert (=> b!1207374 m!1112495))

(assert (=> b!1207376 m!1112493))

(assert (=> b!1207376 m!1112493))

(assert (=> b!1207376 m!1112495))

(assert (=> bm!58884 d!132839))

(declare-fun d!132841 () Bool)

(declare-fun lt!547704 () ListLongMap!17791)

(assert (=> d!132841 (not (contains!6910 lt!547704 k0!934))))

(declare-fun removeStrictlySorted!98 (List!26604 (_ BitVec 64)) List!26604)

(assert (=> d!132841 (= lt!547704 (ListLongMap!17792 (removeStrictlySorted!98 (toList!8911 call!58888) k0!934)))))

(assert (=> d!132841 (= (-!1796 call!58888 k0!934) lt!547704)))

(declare-fun bs!34102 () Bool)

(assert (= bs!34102 d!132841))

(declare-fun m!1112497 () Bool)

(assert (=> bs!34102 m!1112497))

(declare-fun m!1112499 () Bool)

(assert (=> bs!34102 m!1112499))

(assert (=> b!1207038 d!132841))

(declare-fun d!132843 () Bool)

(assert (=> d!132843 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1207029 d!132843))

(declare-fun d!132845 () Bool)

(assert (=> d!132845 (contains!6910 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!547705 () Unit!39849)

(assert (=> d!132845 (= lt!547705 (choose!1809 lt!547503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!132845 (contains!6910 lt!547503 k0!934)))

(assert (=> d!132845 (= (addStillContains!1022 lt!547503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!547705)))

(declare-fun bs!34103 () Bool)

(assert (= bs!34103 d!132845))

(assert (=> bs!34103 m!1112133))

(assert (=> bs!34103 m!1112133))

(declare-fun m!1112501 () Bool)

(assert (=> bs!34103 m!1112501))

(declare-fun m!1112503 () Bool)

(assert (=> bs!34103 m!1112503))

(assert (=> bs!34103 m!1112141))

(assert (=> b!1207054 d!132845))

(declare-fun d!132847 () Bool)

(declare-fun e!685656 () Bool)

(assert (=> d!132847 e!685656))

(declare-fun res!802771 () Bool)

(assert (=> d!132847 (=> (not res!802771) (not e!685656))))

(declare-fun lt!547706 () ListLongMap!17791)

(assert (=> d!132847 (= res!802771 (contains!6910 lt!547706 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!547707 () List!26604)

(assert (=> d!132847 (= lt!547706 (ListLongMap!17792 lt!547707))))

(declare-fun lt!547708 () Unit!39849)

(declare-fun lt!547709 () Unit!39849)

(assert (=> d!132847 (= lt!547708 lt!547709)))

(assert (=> d!132847 (= (getValueByKey!638 lt!547707 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!688 (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132847 (= lt!547709 (lemmaContainsTupThenGetReturnValue!314 lt!547707 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132847 (= lt!547707 (insertStrictlySorted!407 (toList!8911 lt!547503) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132847 (= (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!547706)))

(declare-fun b!1207377 () Bool)

(declare-fun res!802772 () Bool)

(assert (=> b!1207377 (=> (not res!802772) (not e!685656))))

(assert (=> b!1207377 (= res!802772 (= (getValueByKey!638 (toList!8911 lt!547706) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!688 (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1207378 () Bool)

(assert (=> b!1207378 (= e!685656 (contains!6914 (toList!8911 lt!547706) (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132847 res!802771) b!1207377))

(assert (= (and b!1207377 res!802772) b!1207378))

(declare-fun m!1112505 () Bool)

(assert (=> d!132847 m!1112505))

(declare-fun m!1112507 () Bool)

(assert (=> d!132847 m!1112507))

(declare-fun m!1112509 () Bool)

(assert (=> d!132847 m!1112509))

(declare-fun m!1112511 () Bool)

(assert (=> d!132847 m!1112511))

(declare-fun m!1112513 () Bool)

(assert (=> b!1207377 m!1112513))

(declare-fun m!1112515 () Bool)

(assert (=> b!1207378 m!1112515))

(assert (=> b!1207054 d!132847))

(declare-fun d!132849 () Bool)

(declare-fun e!685658 () Bool)

(assert (=> d!132849 e!685658))

(declare-fun res!802773 () Bool)

(assert (=> d!132849 (=> res!802773 e!685658)))

(declare-fun lt!547711 () Bool)

(assert (=> d!132849 (= res!802773 (not lt!547711))))

(declare-fun lt!547712 () Bool)

(assert (=> d!132849 (= lt!547711 lt!547712)))

(declare-fun lt!547710 () Unit!39849)

(declare-fun e!685657 () Unit!39849)

(assert (=> d!132849 (= lt!547710 e!685657)))

(declare-fun c!118645 () Bool)

(assert (=> d!132849 (= c!118645 lt!547712)))

(assert (=> d!132849 (= lt!547712 (containsKey!592 (toList!8911 call!58882) k0!934))))

(assert (=> d!132849 (= (contains!6910 call!58882 k0!934) lt!547711)))

(declare-fun b!1207379 () Bool)

(declare-fun lt!547713 () Unit!39849)

(assert (=> b!1207379 (= e!685657 lt!547713)))

(assert (=> b!1207379 (= lt!547713 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 call!58882) k0!934))))

(assert (=> b!1207379 (isDefined!464 (getValueByKey!638 (toList!8911 call!58882) k0!934))))

(declare-fun b!1207380 () Bool)

(declare-fun Unit!39859 () Unit!39849)

(assert (=> b!1207380 (= e!685657 Unit!39859)))

(declare-fun b!1207381 () Bool)

(assert (=> b!1207381 (= e!685658 (isDefined!464 (getValueByKey!638 (toList!8911 call!58882) k0!934)))))

(assert (= (and d!132849 c!118645) b!1207379))

(assert (= (and d!132849 (not c!118645)) b!1207380))

(assert (= (and d!132849 (not res!802773)) b!1207381))

(declare-fun m!1112517 () Bool)

(assert (=> d!132849 m!1112517))

(declare-fun m!1112519 () Bool)

(assert (=> b!1207379 m!1112519))

(declare-fun m!1112521 () Bool)

(assert (=> b!1207379 m!1112521))

(assert (=> b!1207379 m!1112521))

(declare-fun m!1112523 () Bool)

(assert (=> b!1207379 m!1112523))

(assert (=> b!1207381 m!1112521))

(assert (=> b!1207381 m!1112521))

(assert (=> b!1207381 m!1112523))

(assert (=> b!1207054 d!132849))

(declare-fun d!132851 () Bool)

(declare-fun res!802774 () Bool)

(declare-fun e!685659 () Bool)

(assert (=> d!132851 (=> res!802774 e!685659)))

(assert (=> d!132851 (= res!802774 (= (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132851 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!685659)))

(declare-fun b!1207382 () Bool)

(declare-fun e!685660 () Bool)

(assert (=> b!1207382 (= e!685659 e!685660)))

(declare-fun res!802775 () Bool)

(assert (=> b!1207382 (=> (not res!802775) (not e!685660))))

(assert (=> b!1207382 (= res!802775 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207383 () Bool)

(assert (=> b!1207383 (= e!685660 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132851 (not res!802774)) b!1207382))

(assert (= (and b!1207382 res!802775) b!1207383))

(assert (=> d!132851 m!1112307))

(declare-fun m!1112525 () Bool)

(assert (=> b!1207383 m!1112525))

(assert (=> b!1207046 d!132851))

(declare-fun d!132853 () Bool)

(assert (=> d!132853 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547716 () Unit!39849)

(declare-fun choose!13 (array!78028 (_ BitVec 64) (_ BitVec 32)) Unit!39849)

(assert (=> d!132853 (= lt!547716 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132853 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132853 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!547716)))

(declare-fun bs!34104 () Bool)

(assert (= bs!34104 d!132853))

(assert (=> bs!34104 m!1112167))

(declare-fun m!1112527 () Bool)

(assert (=> bs!34104 m!1112527))

(assert (=> b!1207046 d!132853))

(declare-fun d!132855 () Bool)

(declare-fun res!802776 () Bool)

(declare-fun e!685663 () Bool)

(assert (=> d!132855 (=> res!802776 e!685663)))

(assert (=> d!132855 (= res!802776 (bvsge #b00000000000000000000000000000000 (size!38192 lt!547511)))))

(assert (=> d!132855 (= (arrayNoDuplicates!0 lt!547511 #b00000000000000000000000000000000 Nil!26602) e!685663)))

(declare-fun bm!58955 () Bool)

(declare-fun call!58958 () Bool)

(declare-fun c!118646 () Bool)

(assert (=> bm!58955 (= call!58958 (arrayNoDuplicates!0 lt!547511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118646 (Cons!26601 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) Nil!26602) Nil!26602)))))

(declare-fun b!1207384 () Bool)

(declare-fun e!685662 () Bool)

(assert (=> b!1207384 (= e!685662 call!58958)))

(declare-fun b!1207385 () Bool)

(assert (=> b!1207385 (= e!685662 call!58958)))

(declare-fun b!1207386 () Bool)

(declare-fun e!685664 () Bool)

(assert (=> b!1207386 (= e!685664 e!685662)))

(assert (=> b!1207386 (= c!118646 (validKeyInArray!0 (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(declare-fun b!1207387 () Bool)

(assert (=> b!1207387 (= e!685663 e!685664)))

(declare-fun res!802778 () Bool)

(assert (=> b!1207387 (=> (not res!802778) (not e!685664))))

(declare-fun e!685661 () Bool)

(assert (=> b!1207387 (= res!802778 (not e!685661))))

(declare-fun res!802777 () Bool)

(assert (=> b!1207387 (=> (not res!802777) (not e!685661))))

(assert (=> b!1207387 (= res!802777 (validKeyInArray!0 (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(declare-fun b!1207388 () Bool)

(assert (=> b!1207388 (= e!685661 (contains!6913 Nil!26602 (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(assert (= (and d!132855 (not res!802776)) b!1207387))

(assert (= (and b!1207387 res!802777) b!1207388))

(assert (= (and b!1207387 res!802778) b!1207386))

(assert (= (and b!1207386 c!118646) b!1207385))

(assert (= (and b!1207386 (not c!118646)) b!1207384))

(assert (= (or b!1207385 b!1207384) bm!58955))

(assert (=> bm!58955 m!1112315))

(declare-fun m!1112529 () Bool)

(assert (=> bm!58955 m!1112529))

(assert (=> b!1207386 m!1112315))

(assert (=> b!1207386 m!1112315))

(assert (=> b!1207386 m!1112317))

(assert (=> b!1207387 m!1112315))

(assert (=> b!1207387 m!1112315))

(assert (=> b!1207387 m!1112317))

(assert (=> b!1207388 m!1112315))

(assert (=> b!1207388 m!1112315))

(declare-fun m!1112531 () Bool)

(assert (=> b!1207388 m!1112531))

(assert (=> b!1207047 d!132855))

(declare-fun condMapEmpty!47868 () Bool)

(declare-fun mapDefault!47868 () ValueCell!14624)

(assert (=> mapNonEmpty!47859 (= condMapEmpty!47868 (= mapRest!47859 ((as const (Array (_ BitVec 32) ValueCell!14624)) mapDefault!47868)))))

(declare-fun e!685669 () Bool)

(declare-fun mapRes!47868 () Bool)

(assert (=> mapNonEmpty!47859 (= tp!90894 (and e!685669 mapRes!47868))))

(declare-fun b!1207396 () Bool)

(assert (=> b!1207396 (= e!685669 tp_is_empty!30667)))

(declare-fun mapIsEmpty!47868 () Bool)

(assert (=> mapIsEmpty!47868 mapRes!47868))

(declare-fun mapNonEmpty!47868 () Bool)

(declare-fun tp!90910 () Bool)

(declare-fun e!685670 () Bool)

(assert (=> mapNonEmpty!47868 (= mapRes!47868 (and tp!90910 e!685670))))

(declare-fun mapValue!47868 () ValueCell!14624)

(declare-fun mapKey!47868 () (_ BitVec 32))

(declare-fun mapRest!47868 () (Array (_ BitVec 32) ValueCell!14624))

(assert (=> mapNonEmpty!47868 (= mapRest!47859 (store mapRest!47868 mapKey!47868 mapValue!47868))))

(declare-fun b!1207395 () Bool)

(assert (=> b!1207395 (= e!685670 tp_is_empty!30667)))

(assert (= (and mapNonEmpty!47859 condMapEmpty!47868) mapIsEmpty!47868))

(assert (= (and mapNonEmpty!47859 (not condMapEmpty!47868)) mapNonEmpty!47868))

(assert (= (and mapNonEmpty!47868 ((_ is ValueCellFull!14624) mapValue!47868)) b!1207395))

(assert (= (and mapNonEmpty!47859 ((_ is ValueCellFull!14624) mapDefault!47868)) b!1207396))

(declare-fun m!1112533 () Bool)

(assert (=> mapNonEmpty!47868 m!1112533))

(declare-fun b_lambda!21405 () Bool)

(assert (= b_lambda!21391 (or (and start!100818 b_free!25963) b_lambda!21405)))

(declare-fun b_lambda!21407 () Bool)

(assert (= b_lambda!21389 (or (and start!100818 b_free!25963) b_lambda!21407)))

(declare-fun b_lambda!21409 () Bool)

(assert (= b_lambda!21387 (or (and start!100818 b_free!25963) b_lambda!21409)))

(declare-fun b_lambda!21411 () Bool)

(assert (= b_lambda!21397 (or (and start!100818 b_free!25963) b_lambda!21411)))

(declare-fun b_lambda!21413 () Bool)

(assert (= b_lambda!21403 (or (and start!100818 b_free!25963) b_lambda!21413)))

(declare-fun b_lambda!21415 () Bool)

(assert (= b_lambda!21401 (or (and start!100818 b_free!25963) b_lambda!21415)))

(declare-fun b_lambda!21417 () Bool)

(assert (= b_lambda!21393 (or (and start!100818 b_free!25963) b_lambda!21417)))

(declare-fun b_lambda!21419 () Bool)

(assert (= b_lambda!21399 (or (and start!100818 b_free!25963) b_lambda!21419)))

(declare-fun b_lambda!21421 () Bool)

(assert (= b_lambda!21395 (or (and start!100818 b_free!25963) b_lambda!21421)))

(check-sat (not b!1207374) (not b!1207353) (not b!1207288) (not b!1207358) (not bm!58944) (not b!1207253) (not b_lambda!21405) (not b!1207381) (not b!1207286) (not bm!58943) (not d!132837) (not b!1207287) (not bm!58950) (not b_lambda!21411) (not b!1207341) (not bm!58937) (not b!1207357) (not b!1207242) (not b!1207301) (not b!1207327) (not d!132825) (not d!132821) (not d!132815) (not bm!58953) (not b!1207388) (not b!1207339) (not bm!58951) (not d!132827) (not b_lambda!21421) (not b_lambda!21385) (not b!1207303) (not b_next!25963) (not b!1207347) (not d!132833) (not b_lambda!21415) (not b!1207319) (not bm!58940) (not d!132853) (not d!132823) (not b_lambda!21413) (not b!1207356) (not b!1207333) (not d!132819) (not b!1207338) (not b!1207315) (not b!1207386) (not d!132813) (not d!132835) (not b!1207371) (not b!1207306) (not b!1207241) (not b!1207292) (not bm!58955) (not b!1207300) (not b!1207243) (not bm!58945) (not b!1207330) (not b!1207324) (not d!132839) (not d!132849) (not bm!58952) (not d!132845) (not b!1207336) (not d!132841) (not b!1207377) (not b_lambda!21419) (not b!1207337) (not b!1207318) (not b!1207254) (not b!1207326) (not b_lambda!21409) (not b!1207325) (not b!1207321) (not b!1207293) (not b_lambda!21417) (not b!1207387) (not b!1207295) (not b!1207363) (not b!1207299) (not b!1207383) (not d!132847) (not b!1207373) (not b!1207376) (not b!1207280) (not b!1207379) (not b!1207291) (not b_lambda!21407) b_and!42933 (not b!1207305) (not b!1207329) tp_is_empty!30667 (not b!1207298) (not b!1207378) (not b!1207281) (not mapNonEmpty!47868) (not b!1207346) (not b!1207289) (not bm!58954) (not b!1207331) (not b!1207283))
(check-sat b_and!42933 (not b_next!25963))
(get-model)

(declare-fun d!132857 () Bool)

(assert (=> d!132857 (= (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207331 d!132857))

(declare-fun d!132859 () Bool)

(declare-fun e!685672 () Bool)

(assert (=> d!132859 e!685672))

(declare-fun res!802779 () Bool)

(assert (=> d!132859 (=> res!802779 e!685672)))

(declare-fun lt!547718 () Bool)

(assert (=> d!132859 (= res!802779 (not lt!547718))))

(declare-fun lt!547719 () Bool)

(assert (=> d!132859 (= lt!547718 lt!547719)))

(declare-fun lt!547717 () Unit!39849)

(declare-fun e!685671 () Unit!39849)

(assert (=> d!132859 (= lt!547717 e!685671)))

(declare-fun c!118647 () Bool)

(assert (=> d!132859 (= c!118647 lt!547719)))

(assert (=> d!132859 (= lt!547719 (containsKey!592 (toList!8911 lt!547635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132859 (= (contains!6910 lt!547635 #b1000000000000000000000000000000000000000000000000000000000000000) lt!547718)))

(declare-fun b!1207397 () Bool)

(declare-fun lt!547720 () Unit!39849)

(assert (=> b!1207397 (= e!685671 lt!547720)))

(assert (=> b!1207397 (= lt!547720 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207397 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207398 () Bool)

(declare-fun Unit!39860 () Unit!39849)

(assert (=> b!1207398 (= e!685671 Unit!39860)))

(declare-fun b!1207399 () Bool)

(assert (=> b!1207399 (= e!685672 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547635) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132859 c!118647) b!1207397))

(assert (= (and d!132859 (not c!118647)) b!1207398))

(assert (= (and d!132859 (not res!802779)) b!1207399))

(declare-fun m!1112535 () Bool)

(assert (=> d!132859 m!1112535))

(declare-fun m!1112537 () Bool)

(assert (=> b!1207397 m!1112537))

(declare-fun m!1112539 () Bool)

(assert (=> b!1207397 m!1112539))

(assert (=> b!1207397 m!1112539))

(declare-fun m!1112541 () Bool)

(assert (=> b!1207397 m!1112541))

(assert (=> b!1207399 m!1112539))

(assert (=> b!1207399 m!1112539))

(assert (=> b!1207399 m!1112541))

(assert (=> b!1207289 d!132859))

(declare-fun d!132861 () Bool)

(declare-fun lt!547723 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!542 (List!26605) (InoxSet (_ BitVec 64)))

(assert (=> d!132861 (= lt!547723 (select (content!542 Nil!26602) (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(declare-fun e!685678 () Bool)

(assert (=> d!132861 (= lt!547723 e!685678)))

(declare-fun res!802785 () Bool)

(assert (=> d!132861 (=> (not res!802785) (not e!685678))))

(assert (=> d!132861 (= res!802785 ((_ is Cons!26601) Nil!26602))))

(assert (=> d!132861 (= (contains!6913 Nil!26602 (select (arr!37654 lt!547511) #b00000000000000000000000000000000)) lt!547723)))

(declare-fun b!1207404 () Bool)

(declare-fun e!685677 () Bool)

(assert (=> b!1207404 (= e!685678 e!685677)))

(declare-fun res!802784 () Bool)

(assert (=> b!1207404 (=> res!802784 e!685677)))

(assert (=> b!1207404 (= res!802784 (= (h!27810 Nil!26602) (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(declare-fun b!1207405 () Bool)

(assert (=> b!1207405 (= e!685677 (contains!6913 (t!39539 Nil!26602) (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(assert (= (and d!132861 res!802785) b!1207404))

(assert (= (and b!1207404 (not res!802784)) b!1207405))

(declare-fun m!1112543 () Bool)

(assert (=> d!132861 m!1112543))

(assert (=> d!132861 m!1112315))

(declare-fun m!1112545 () Bool)

(assert (=> d!132861 m!1112545))

(assert (=> b!1207405 m!1112315))

(declare-fun m!1112547 () Bool)

(assert (=> b!1207405 m!1112547))

(assert (=> b!1207388 d!132861))

(declare-fun call!58959 () ListLongMap!17791)

(declare-fun bm!58956 () Bool)

(assert (=> bm!58956 (= call!58959 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun e!685683 () Bool)

(declare-fun lt!547728 () ListLongMap!17791)

(declare-fun b!1207406 () Bool)

(assert (=> b!1207406 (= e!685683 (= lt!547728 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207407 () Bool)

(declare-fun e!685681 () ListLongMap!17791)

(declare-fun e!685685 () ListLongMap!17791)

(assert (=> b!1207407 (= e!685681 e!685685)))

(declare-fun c!118651 () Bool)

(assert (=> b!1207407 (= c!118651 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207408 () Bool)

(declare-fun e!685682 () Bool)

(assert (=> b!1207408 (= e!685682 e!685683)))

(declare-fun c!118650 () Bool)

(assert (=> b!1207408 (= c!118650 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207409 () Bool)

(declare-fun e!685684 () Bool)

(assert (=> b!1207409 (= e!685684 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207409 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207410 () Bool)

(assert (=> b!1207410 (= e!685685 call!58959)))

(declare-fun b!1207411 () Bool)

(declare-fun e!685679 () Bool)

(assert (=> b!1207411 (= e!685679 e!685682)))

(declare-fun c!118649 () Bool)

(assert (=> b!1207411 (= c!118649 e!685684)))

(declare-fun res!802788 () Bool)

(assert (=> b!1207411 (=> (not res!802788) (not e!685684))))

(assert (=> b!1207411 (= res!802788 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207412 () Bool)

(assert (=> b!1207412 (= e!685683 (isEmpty!992 lt!547728))))

(declare-fun b!1207413 () Bool)

(declare-fun lt!547727 () Unit!39849)

(declare-fun lt!547724 () Unit!39849)

(assert (=> b!1207413 (= lt!547727 lt!547724)))

(declare-fun lt!547726 () V!46017)

(declare-fun lt!547730 () (_ BitVec 64))

(declare-fun lt!547725 () ListLongMap!17791)

(declare-fun lt!547729 () (_ BitVec 64))

(assert (=> b!1207413 (not (contains!6910 (+!4038 lt!547725 (tuple2!19823 lt!547730 lt!547726)) lt!547729))))

(assert (=> b!1207413 (= lt!547724 (addStillNotContains!294 lt!547725 lt!547730 lt!547726 lt!547729))))

(assert (=> b!1207413 (= lt!547729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207413 (= lt!547726 (get!19207 (select (arr!37655 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207413 (= lt!547730 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1207413 (= lt!547725 call!58959)))

(assert (=> b!1207413 (= e!685685 (+!4038 call!58959 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19207 (select (arr!37655 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207414 () Bool)

(declare-fun e!685680 () Bool)

(assert (=> b!1207414 (= e!685682 e!685680)))

(assert (=> b!1207414 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun res!802787 () Bool)

(assert (=> b!1207414 (= res!802787 (contains!6910 lt!547728 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207414 (=> (not res!802787) (not e!685680))))

(declare-fun b!1207415 () Bool)

(declare-fun res!802789 () Bool)

(assert (=> b!1207415 (=> (not res!802789) (not e!685679))))

(assert (=> b!1207415 (= res!802789 (not (contains!6910 lt!547728 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207416 () Bool)

(assert (=> b!1207416 (= e!685681 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207417 () Bool)

(assert (=> b!1207417 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(assert (=> b!1207417 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38193 _values!996)))))

(assert (=> b!1207417 (= e!685680 (= (apply!958 lt!547728 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19207 (select (arr!37655 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132863 () Bool)

(assert (=> d!132863 e!685679))

(declare-fun res!802786 () Bool)

(assert (=> d!132863 (=> (not res!802786) (not e!685679))))

(assert (=> d!132863 (= res!802786 (not (contains!6910 lt!547728 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132863 (= lt!547728 e!685681)))

(declare-fun c!118648 () Bool)

(assert (=> d!132863 (= c!118648 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(assert (=> d!132863 (validMask!0 mask!1564)))

(assert (=> d!132863 (= (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547728)))

(assert (= (and d!132863 c!118648) b!1207416))

(assert (= (and d!132863 (not c!118648)) b!1207407))

(assert (= (and b!1207407 c!118651) b!1207413))

(assert (= (and b!1207407 (not c!118651)) b!1207410))

(assert (= (or b!1207413 b!1207410) bm!58956))

(assert (= (and d!132863 res!802786) b!1207415))

(assert (= (and b!1207415 res!802789) b!1207411))

(assert (= (and b!1207411 res!802788) b!1207409))

(assert (= (and b!1207411 c!118649) b!1207414))

(assert (= (and b!1207411 (not c!118649)) b!1207408))

(assert (= (and b!1207414 res!802787) b!1207417))

(assert (= (and b!1207408 c!118650) b!1207406))

(assert (= (and b!1207408 (not c!118650)) b!1207412))

(declare-fun b_lambda!21423 () Bool)

(assert (=> (not b_lambda!21423) (not b!1207413)))

(assert (=> b!1207413 t!39537))

(declare-fun b_and!42935 () Bool)

(assert (= b_and!42933 (and (=> t!39537 result!22105) b_and!42935)))

(declare-fun b_lambda!21425 () Bool)

(assert (=> (not b_lambda!21425) (not b!1207417)))

(assert (=> b!1207417 t!39537))

(declare-fun b_and!42937 () Bool)

(assert (= b_and!42935 (and (=> t!39537 result!22105) b_and!42937)))

(declare-fun m!1112549 () Bool)

(assert (=> b!1207414 m!1112549))

(assert (=> b!1207414 m!1112549))

(declare-fun m!1112551 () Bool)

(assert (=> b!1207414 m!1112551))

(declare-fun m!1112553 () Bool)

(assert (=> b!1207406 m!1112553))

(declare-fun m!1112555 () Bool)

(assert (=> b!1207412 m!1112555))

(assert (=> bm!58956 m!1112553))

(assert (=> b!1207409 m!1112549))

(assert (=> b!1207409 m!1112549))

(declare-fun m!1112557 () Bool)

(assert (=> b!1207409 m!1112557))

(assert (=> b!1207417 m!1112155))

(assert (=> b!1207417 m!1112549))

(declare-fun m!1112559 () Bool)

(assert (=> b!1207417 m!1112559))

(declare-fun m!1112561 () Bool)

(assert (=> b!1207417 m!1112561))

(assert (=> b!1207417 m!1112549))

(assert (=> b!1207417 m!1112561))

(assert (=> b!1207417 m!1112155))

(declare-fun m!1112563 () Bool)

(assert (=> b!1207417 m!1112563))

(declare-fun m!1112565 () Bool)

(assert (=> d!132863 m!1112565))

(assert (=> d!132863 m!1112127))

(declare-fun m!1112567 () Bool)

(assert (=> b!1207415 m!1112567))

(assert (=> b!1207407 m!1112549))

(assert (=> b!1207407 m!1112549))

(assert (=> b!1207407 m!1112557))

(assert (=> b!1207413 m!1112155))

(declare-fun m!1112569 () Bool)

(assert (=> b!1207413 m!1112569))

(declare-fun m!1112571 () Bool)

(assert (=> b!1207413 m!1112571))

(assert (=> b!1207413 m!1112561))

(assert (=> b!1207413 m!1112549))

(assert (=> b!1207413 m!1112561))

(assert (=> b!1207413 m!1112155))

(assert (=> b!1207413 m!1112563))

(declare-fun m!1112573 () Bool)

(assert (=> b!1207413 m!1112573))

(declare-fun m!1112575 () Bool)

(assert (=> b!1207413 m!1112575))

(assert (=> b!1207413 m!1112573))

(assert (=> b!1207292 d!132863))

(assert (=> b!1207333 d!132857))

(declare-fun d!132865 () Bool)

(declare-fun res!802790 () Bool)

(declare-fun e!685688 () Bool)

(assert (=> d!132865 (=> res!802790 e!685688)))

(assert (=> d!132865 (= res!802790 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(assert (=> d!132865 (= (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118637 (Cons!26601 (select (arr!37654 _keys!1208) from!1455) Nil!26602) Nil!26602)) e!685688)))

(declare-fun call!58960 () Bool)

(declare-fun c!118652 () Bool)

(declare-fun bm!58957 () Bool)

(assert (=> bm!58957 (= call!58960 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118652 (Cons!26601 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (ite c!118637 (Cons!26601 (select (arr!37654 _keys!1208) from!1455) Nil!26602) Nil!26602)) (ite c!118637 (Cons!26601 (select (arr!37654 _keys!1208) from!1455) Nil!26602) Nil!26602))))))

(declare-fun b!1207418 () Bool)

(declare-fun e!685687 () Bool)

(assert (=> b!1207418 (= e!685687 call!58960)))

(declare-fun b!1207419 () Bool)

(assert (=> b!1207419 (= e!685687 call!58960)))

(declare-fun b!1207420 () Bool)

(declare-fun e!685689 () Bool)

(assert (=> b!1207420 (= e!685689 e!685687)))

(assert (=> b!1207420 (= c!118652 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207421 () Bool)

(assert (=> b!1207421 (= e!685688 e!685689)))

(declare-fun res!802792 () Bool)

(assert (=> b!1207421 (=> (not res!802792) (not e!685689))))

(declare-fun e!685686 () Bool)

(assert (=> b!1207421 (= res!802792 (not e!685686))))

(declare-fun res!802791 () Bool)

(assert (=> b!1207421 (=> (not res!802791) (not e!685686))))

(assert (=> b!1207421 (= res!802791 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207422 () Bool)

(assert (=> b!1207422 (= e!685686 (contains!6913 (ite c!118637 (Cons!26601 (select (arr!37654 _keys!1208) from!1455) Nil!26602) Nil!26602) (select (arr!37654 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (= (and d!132865 (not res!802790)) b!1207421))

(assert (= (and b!1207421 res!802791) b!1207422))

(assert (= (and b!1207421 res!802792) b!1207420))

(assert (= (and b!1207420 c!118652) b!1207419))

(assert (= (and b!1207420 (not c!118652)) b!1207418))

(assert (= (or b!1207419 b!1207418) bm!58957))

(assert (=> bm!58957 m!1112549))

(declare-fun m!1112577 () Bool)

(assert (=> bm!58957 m!1112577))

(assert (=> b!1207420 m!1112549))

(assert (=> b!1207420 m!1112549))

(assert (=> b!1207420 m!1112557))

(assert (=> b!1207421 m!1112549))

(assert (=> b!1207421 m!1112549))

(assert (=> b!1207421 m!1112557))

(assert (=> b!1207422 m!1112549))

(assert (=> b!1207422 m!1112549))

(declare-fun m!1112579 () Bool)

(assert (=> b!1207422 m!1112579))

(assert (=> bm!58954 d!132865))

(declare-fun d!132867 () Bool)

(declare-fun get!19208 (Option!689) V!46017)

(assert (=> d!132867 (= (apply!958 lt!547635 (select (arr!37654 lt!547511) from!1455)) (get!19208 (getValueByKey!638 (toList!8911 lt!547635) (select (arr!37654 lt!547511) from!1455))))))

(declare-fun bs!34105 () Bool)

(assert (= bs!34105 d!132867))

(assert (=> bs!34105 m!1112327))

(declare-fun m!1112581 () Bool)

(assert (=> bs!34105 m!1112581))

(assert (=> bs!34105 m!1112581))

(declare-fun m!1112583 () Bool)

(assert (=> bs!34105 m!1112583))

(assert (=> b!1207291 d!132867))

(declare-fun d!132869 () Bool)

(declare-fun c!118655 () Bool)

(assert (=> d!132869 (= c!118655 ((_ is ValueCellFull!14624) (select (arr!37655 lt!547510) from!1455)))))

(declare-fun e!685692 () V!46017)

(assert (=> d!132869 (= (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685692)))

(declare-fun b!1207427 () Bool)

(declare-fun get!19209 (ValueCell!14624 V!46017) V!46017)

(assert (=> b!1207427 (= e!685692 (get!19209 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207428 () Bool)

(declare-fun get!19210 (ValueCell!14624 V!46017) V!46017)

(assert (=> b!1207428 (= e!685692 (get!19210 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132869 c!118655) b!1207427))

(assert (= (and d!132869 (not c!118655)) b!1207428))

(assert (=> b!1207427 m!1112339))

(assert (=> b!1207427 m!1112155))

(declare-fun m!1112585 () Bool)

(assert (=> b!1207427 m!1112585))

(assert (=> b!1207428 m!1112339))

(assert (=> b!1207428 m!1112155))

(declare-fun m!1112587 () Bool)

(assert (=> b!1207428 m!1112587))

(assert (=> b!1207291 d!132869))

(declare-fun d!132871 () Bool)

(declare-fun res!802797 () Bool)

(declare-fun e!685697 () Bool)

(assert (=> d!132871 (=> res!802797 e!685697)))

(assert (=> d!132871 (= res!802797 (and ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 call!58889))) (= (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 call!58889)))) k0!934)))))

(assert (=> d!132871 (= (containsKey!592 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934) e!685697)))

(declare-fun b!1207433 () Bool)

(declare-fun e!685698 () Bool)

(assert (=> b!1207433 (= e!685697 e!685698)))

(declare-fun res!802798 () Bool)

(assert (=> b!1207433 (=> (not res!802798) (not e!685698))))

(assert (=> b!1207433 (= res!802798 (and (or (not ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 call!58889)))) (bvsle (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 call!58889)))) k0!934)) ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 call!58889))) (bvslt (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 call!58889)))) k0!934)))))

(declare-fun b!1207434 () Bool)

(assert (=> b!1207434 (= e!685698 (containsKey!592 (t!39538 (toList!8911 (ite c!118569 lt!547509 call!58889))) k0!934))))

(assert (= (and d!132871 (not res!802797)) b!1207433))

(assert (= (and b!1207433 res!802798) b!1207434))

(declare-fun m!1112589 () Bool)

(assert (=> b!1207434 m!1112589))

(assert (=> d!132839 d!132871))

(declare-fun d!132873 () Bool)

(assert (=> d!132873 (= (validKeyInArray!0 (select (arr!37654 lt!547511) #b00000000000000000000000000000000)) (and (not (= (select (arr!37654 lt!547511) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37654 lt!547511) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207386 d!132873))

(declare-fun d!132875 () Bool)

(declare-fun e!685700 () Bool)

(assert (=> d!132875 e!685700))

(declare-fun res!802799 () Bool)

(assert (=> d!132875 (=> res!802799 e!685700)))

(declare-fun lt!547732 () Bool)

(assert (=> d!132875 (= res!802799 (not lt!547732))))

(declare-fun lt!547733 () Bool)

(assert (=> d!132875 (= lt!547732 lt!547733)))

(declare-fun lt!547731 () Unit!39849)

(declare-fun e!685699 () Unit!39849)

(assert (=> d!132875 (= lt!547731 e!685699)))

(declare-fun c!118656 () Bool)

(assert (=> d!132875 (= c!118656 lt!547733)))

(assert (=> d!132875 (= lt!547733 (containsKey!592 (toList!8911 lt!547704) k0!934))))

(assert (=> d!132875 (= (contains!6910 lt!547704 k0!934) lt!547732)))

(declare-fun b!1207435 () Bool)

(declare-fun lt!547734 () Unit!39849)

(assert (=> b!1207435 (= e!685699 lt!547734)))

(assert (=> b!1207435 (= lt!547734 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547704) k0!934))))

(assert (=> b!1207435 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547704) k0!934))))

(declare-fun b!1207436 () Bool)

(declare-fun Unit!39861 () Unit!39849)

(assert (=> b!1207436 (= e!685699 Unit!39861)))

(declare-fun b!1207437 () Bool)

(assert (=> b!1207437 (= e!685700 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547704) k0!934)))))

(assert (= (and d!132875 c!118656) b!1207435))

(assert (= (and d!132875 (not c!118656)) b!1207436))

(assert (= (and d!132875 (not res!802799)) b!1207437))

(declare-fun m!1112591 () Bool)

(assert (=> d!132875 m!1112591))

(declare-fun m!1112593 () Bool)

(assert (=> b!1207435 m!1112593))

(declare-fun m!1112595 () Bool)

(assert (=> b!1207435 m!1112595))

(assert (=> b!1207435 m!1112595))

(declare-fun m!1112597 () Bool)

(assert (=> b!1207435 m!1112597))

(assert (=> b!1207437 m!1112595))

(assert (=> b!1207437 m!1112595))

(assert (=> b!1207437 m!1112597))

(assert (=> d!132841 d!132875))

(declare-fun b!1207448 () Bool)

(declare-fun e!685707 () List!26604)

(assert (=> b!1207448 (= e!685707 Nil!26601)))

(declare-fun d!132877 () Bool)

(declare-fun e!685709 () Bool)

(assert (=> d!132877 e!685709))

(declare-fun res!802802 () Bool)

(assert (=> d!132877 (=> (not res!802802) (not e!685709))))

(declare-fun lt!547737 () List!26604)

(declare-fun isStrictlySorted!725 (List!26604) Bool)

(assert (=> d!132877 (= res!802802 (isStrictlySorted!725 lt!547737))))

(declare-fun e!685708 () List!26604)

(assert (=> d!132877 (= lt!547737 e!685708)))

(declare-fun c!118661 () Bool)

(assert (=> d!132877 (= c!118661 (and ((_ is Cons!26600) (toList!8911 call!58888)) (= (_1!9922 (h!27809 (toList!8911 call!58888))) k0!934)))))

(assert (=> d!132877 (isStrictlySorted!725 (toList!8911 call!58888))))

(assert (=> d!132877 (= (removeStrictlySorted!98 (toList!8911 call!58888) k0!934) lt!547737)))

(declare-fun b!1207449 () Bool)

(assert (=> b!1207449 (= e!685709 (not (containsKey!592 lt!547737 k0!934)))))

(declare-fun b!1207450 () Bool)

(declare-fun $colon$colon!612 (List!26604 tuple2!19822) List!26604)

(assert (=> b!1207450 (= e!685707 ($colon$colon!612 (removeStrictlySorted!98 (t!39538 (toList!8911 call!58888)) k0!934) (h!27809 (toList!8911 call!58888))))))

(declare-fun b!1207451 () Bool)

(assert (=> b!1207451 (= e!685708 e!685707)))

(declare-fun c!118662 () Bool)

(assert (=> b!1207451 (= c!118662 (and ((_ is Cons!26600) (toList!8911 call!58888)) (not (= (_1!9922 (h!27809 (toList!8911 call!58888))) k0!934))))))

(declare-fun b!1207452 () Bool)

(assert (=> b!1207452 (= e!685708 (t!39538 (toList!8911 call!58888)))))

(assert (= (and d!132877 c!118661) b!1207452))

(assert (= (and d!132877 (not c!118661)) b!1207451))

(assert (= (and b!1207451 c!118662) b!1207450))

(assert (= (and b!1207451 (not c!118662)) b!1207448))

(assert (= (and d!132877 res!802802) b!1207449))

(declare-fun m!1112599 () Bool)

(assert (=> d!132877 m!1112599))

(declare-fun m!1112601 () Bool)

(assert (=> d!132877 m!1112601))

(declare-fun m!1112603 () Bool)

(assert (=> b!1207449 m!1112603))

(declare-fun m!1112605 () Bool)

(assert (=> b!1207450 m!1112605))

(assert (=> b!1207450 m!1112605))

(declare-fun m!1112607 () Bool)

(assert (=> b!1207450 m!1112607))

(assert (=> d!132841 d!132877))

(declare-fun d!132879 () Bool)

(declare-fun e!685711 () Bool)

(assert (=> d!132879 e!685711))

(declare-fun res!802803 () Bool)

(assert (=> d!132879 (=> res!802803 e!685711)))

(declare-fun lt!547739 () Bool)

(assert (=> d!132879 (= res!802803 (not lt!547739))))

(declare-fun lt!547740 () Bool)

(assert (=> d!132879 (= lt!547739 lt!547740)))

(declare-fun lt!547738 () Unit!39849)

(declare-fun e!685710 () Unit!39849)

(assert (=> d!132879 (= lt!547738 e!685710)))

(declare-fun c!118663 () Bool)

(assert (=> d!132879 (= c!118663 lt!547740)))

(assert (=> d!132879 (= lt!547740 (containsKey!592 (toList!8911 lt!547676) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132879 (= (contains!6910 lt!547676 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!547739)))

(declare-fun b!1207453 () Bool)

(declare-fun lt!547741 () Unit!39849)

(assert (=> b!1207453 (= e!685710 lt!547741)))

(assert (=> b!1207453 (= lt!547741 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547676) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> b!1207453 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547676) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207454 () Bool)

(declare-fun Unit!39862 () Unit!39849)

(assert (=> b!1207454 (= e!685710 Unit!39862)))

(declare-fun b!1207455 () Bool)

(assert (=> b!1207455 (= e!685711 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547676) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!132879 c!118663) b!1207453))

(assert (= (and d!132879 (not c!118663)) b!1207454))

(assert (= (and d!132879 (not res!802803)) b!1207455))

(declare-fun m!1112609 () Bool)

(assert (=> d!132879 m!1112609))

(declare-fun m!1112611 () Bool)

(assert (=> b!1207453 m!1112611))

(assert (=> b!1207453 m!1112467))

(assert (=> b!1207453 m!1112467))

(declare-fun m!1112613 () Bool)

(assert (=> b!1207453 m!1112613))

(assert (=> b!1207455 m!1112467))

(assert (=> b!1207455 m!1112467))

(assert (=> b!1207455 m!1112613))

(assert (=> d!132827 d!132879))

(declare-fun b!1207467 () Bool)

(declare-fun e!685717 () Option!689)

(assert (=> b!1207467 (= e!685717 None!687)))

(declare-fun b!1207464 () Bool)

(declare-fun e!685716 () Option!689)

(assert (=> b!1207464 (= e!685716 (Some!688 (_2!9922 (h!27809 lt!547677))))))

(declare-fun d!132881 () Bool)

(declare-fun c!118668 () Bool)

(assert (=> d!132881 (= c!118668 (and ((_ is Cons!26600) lt!547677) (= (_1!9922 (h!27809 lt!547677)) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!132881 (= (getValueByKey!638 lt!547677 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) e!685716)))

(declare-fun b!1207466 () Bool)

(assert (=> b!1207466 (= e!685717 (getValueByKey!638 (t!39538 lt!547677) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207465 () Bool)

(assert (=> b!1207465 (= e!685716 e!685717)))

(declare-fun c!118669 () Bool)

(assert (=> b!1207465 (= c!118669 (and ((_ is Cons!26600) lt!547677) (not (= (_1!9922 (h!27809 lt!547677)) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(assert (= (and d!132881 c!118668) b!1207464))

(assert (= (and d!132881 (not c!118668)) b!1207465))

(assert (= (and b!1207465 c!118669) b!1207466))

(assert (= (and b!1207465 (not c!118669)) b!1207467))

(declare-fun m!1112615 () Bool)

(assert (=> b!1207466 m!1112615))

(assert (=> d!132827 d!132881))

(declare-fun d!132883 () Bool)

(assert (=> d!132883 (= (getValueByKey!638 lt!547677 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!688 (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!547744 () Unit!39849)

(declare-fun choose!1812 (List!26604 (_ BitVec 64) V!46017) Unit!39849)

(assert (=> d!132883 (= lt!547744 (choose!1812 lt!547677 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!685720 () Bool)

(assert (=> d!132883 e!685720))

(declare-fun res!802808 () Bool)

(assert (=> d!132883 (=> (not res!802808) (not e!685720))))

(assert (=> d!132883 (= res!802808 (isStrictlySorted!725 lt!547677))))

(assert (=> d!132883 (= (lemmaContainsTupThenGetReturnValue!314 lt!547677 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!547744)))

(declare-fun b!1207472 () Bool)

(declare-fun res!802809 () Bool)

(assert (=> b!1207472 (=> (not res!802809) (not e!685720))))

(assert (=> b!1207472 (= res!802809 (containsKey!592 lt!547677 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207473 () Bool)

(assert (=> b!1207473 (= e!685720 (contains!6914 lt!547677 (tuple2!19823 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!132883 res!802808) b!1207472))

(assert (= (and b!1207472 res!802809) b!1207473))

(assert (=> d!132883 m!1112461))

(declare-fun m!1112617 () Bool)

(assert (=> d!132883 m!1112617))

(declare-fun m!1112619 () Bool)

(assert (=> d!132883 m!1112619))

(declare-fun m!1112621 () Bool)

(assert (=> b!1207472 m!1112621))

(declare-fun m!1112623 () Bool)

(assert (=> b!1207473 m!1112623))

(assert (=> d!132827 d!132883))

(declare-fun b!1207494 () Bool)

(declare-fun e!685735 () List!26604)

(declare-fun e!685734 () List!26604)

(assert (=> b!1207494 (= e!685735 e!685734)))

(declare-fun c!118680 () Bool)

(assert (=> b!1207494 (= c!118680 (and ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 lt!547503))) (= (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 lt!547503)))) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1207495 () Bool)

(declare-fun call!58969 () List!26604)

(assert (=> b!1207495 (= e!685735 call!58969)))

(declare-fun bm!58964 () Bool)

(declare-fun call!58968 () List!26604)

(declare-fun call!58967 () List!26604)

(assert (=> bm!58964 (= call!58968 call!58967)))

(declare-fun b!1207496 () Bool)

(declare-fun res!802814 () Bool)

(declare-fun e!685733 () Bool)

(assert (=> b!1207496 (=> (not res!802814) (not e!685733))))

(declare-fun lt!547747 () List!26604)

(assert (=> b!1207496 (= res!802814 (containsKey!592 lt!547747 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!118679 () Bool)

(declare-fun b!1207497 () Bool)

(assert (=> b!1207497 (= c!118679 (and ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 lt!547503))) (bvsgt (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 lt!547503)))) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun e!685731 () List!26604)

(assert (=> b!1207497 (= e!685734 e!685731)))

(declare-fun bm!58965 () Bool)

(assert (=> bm!58965 (= call!58967 call!58969)))

(declare-fun b!1207498 () Bool)

(assert (=> b!1207498 (= e!685734 call!58967)))

(declare-fun bm!58966 () Bool)

(declare-fun c!118681 () Bool)

(declare-fun e!685732 () List!26604)

(assert (=> bm!58966 (= call!58969 ($colon$colon!612 e!685732 (ite c!118681 (h!27809 (toList!8911 (ite c!118569 lt!547509 lt!547503))) (tuple2!19823 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(declare-fun c!118678 () Bool)

(assert (=> bm!58966 (= c!118678 c!118681)))

(declare-fun b!1207499 () Bool)

(assert (=> b!1207499 (= e!685731 call!58968)))

(declare-fun d!132885 () Bool)

(assert (=> d!132885 e!685733))

(declare-fun res!802815 () Bool)

(assert (=> d!132885 (=> (not res!802815) (not e!685733))))

(assert (=> d!132885 (= res!802815 (isStrictlySorted!725 lt!547747))))

(assert (=> d!132885 (= lt!547747 e!685735)))

(assert (=> d!132885 (= c!118681 (and ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 lt!547503))) (bvslt (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 lt!547503)))) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!132885 (isStrictlySorted!725 (toList!8911 (ite c!118569 lt!547509 lt!547503)))))

(assert (=> d!132885 (= (insertStrictlySorted!407 (toList!8911 (ite c!118569 lt!547509 lt!547503)) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!547747)))

(declare-fun b!1207500 () Bool)

(assert (=> b!1207500 (= e!685732 (insertStrictlySorted!407 (t!39538 (toList!8911 (ite c!118569 lt!547509 lt!547503))) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207501 () Bool)

(assert (=> b!1207501 (= e!685733 (contains!6914 lt!547747 (tuple2!19823 (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1207502 () Bool)

(assert (=> b!1207502 (= e!685732 (ite c!118680 (t!39538 (toList!8911 (ite c!118569 lt!547509 lt!547503))) (ite c!118679 (Cons!26600 (h!27809 (toList!8911 (ite c!118569 lt!547509 lt!547503))) (t!39538 (toList!8911 (ite c!118569 lt!547509 lt!547503)))) Nil!26601)))))

(declare-fun b!1207503 () Bool)

(assert (=> b!1207503 (= e!685731 call!58968)))

(assert (= (and d!132885 c!118681) b!1207495))

(assert (= (and d!132885 (not c!118681)) b!1207494))

(assert (= (and b!1207494 c!118680) b!1207498))

(assert (= (and b!1207494 (not c!118680)) b!1207497))

(assert (= (and b!1207497 c!118679) b!1207499))

(assert (= (and b!1207497 (not c!118679)) b!1207503))

(assert (= (or b!1207499 b!1207503) bm!58964))

(assert (= (or b!1207498 bm!58964) bm!58965))

(assert (= (or b!1207495 bm!58965) bm!58966))

(assert (= (and bm!58966 c!118678) b!1207500))

(assert (= (and bm!58966 (not c!118678)) b!1207502))

(assert (= (and d!132885 res!802815) b!1207496))

(assert (= (and b!1207496 res!802814) b!1207501))

(declare-fun m!1112625 () Bool)

(assert (=> b!1207501 m!1112625))

(declare-fun m!1112627 () Bool)

(assert (=> d!132885 m!1112627))

(declare-fun m!1112629 () Bool)

(assert (=> d!132885 m!1112629))

(declare-fun m!1112631 () Bool)

(assert (=> bm!58966 m!1112631))

(declare-fun m!1112633 () Bool)

(assert (=> b!1207500 m!1112633))

(declare-fun m!1112635 () Bool)

(assert (=> b!1207496 m!1112635))

(assert (=> d!132827 d!132885))

(declare-fun d!132887 () Bool)

(declare-fun e!685736 () Bool)

(assert (=> d!132887 e!685736))

(declare-fun res!802816 () Bool)

(assert (=> d!132887 (=> (not res!802816) (not e!685736))))

(declare-fun lt!547748 () ListLongMap!17791)

(assert (=> d!132887 (= res!802816 (contains!6910 lt!547748 (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!547749 () List!26604)

(assert (=> d!132887 (= lt!547748 (ListLongMap!17792 lt!547749))))

(declare-fun lt!547750 () Unit!39849)

(declare-fun lt!547751 () Unit!39849)

(assert (=> d!132887 (= lt!547750 lt!547751)))

(assert (=> d!132887 (= (getValueByKey!638 lt!547749 (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132887 (= lt!547751 (lemmaContainsTupThenGetReturnValue!314 lt!547749 (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132887 (= lt!547749 (insertStrictlySorted!407 (toList!8911 call!58956) (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132887 (= (+!4038 call!58956 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!547748)))

(declare-fun b!1207504 () Bool)

(declare-fun res!802817 () Bool)

(assert (=> b!1207504 (=> (not res!802817) (not e!685736))))

(assert (=> b!1207504 (= res!802817 (= (getValueByKey!638 (toList!8911 lt!547748) (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207505 () Bool)

(assert (=> b!1207505 (= e!685736 (contains!6914 (toList!8911 lt!547748) (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132887 res!802816) b!1207504))

(assert (= (and b!1207504 res!802817) b!1207505))

(declare-fun m!1112637 () Bool)

(assert (=> d!132887 m!1112637))

(declare-fun m!1112639 () Bool)

(assert (=> d!132887 m!1112639))

(declare-fun m!1112641 () Bool)

(assert (=> d!132887 m!1112641))

(declare-fun m!1112643 () Bool)

(assert (=> d!132887 m!1112643))

(declare-fun m!1112645 () Bool)

(assert (=> b!1207504 m!1112645))

(declare-fun m!1112647 () Bool)

(assert (=> b!1207505 m!1112647))

(assert (=> b!1207337 d!132887))

(declare-fun d!132889 () Bool)

(assert (=> d!132889 (not (contains!6910 (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663)) lt!547666))))

(declare-fun lt!547754 () Unit!39849)

(declare-fun choose!1813 (ListLongMap!17791 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39849)

(assert (=> d!132889 (= lt!547754 (choose!1813 lt!547662 lt!547667 lt!547663 lt!547666))))

(declare-fun e!685739 () Bool)

(assert (=> d!132889 e!685739))

(declare-fun res!802820 () Bool)

(assert (=> d!132889 (=> (not res!802820) (not e!685739))))

(assert (=> d!132889 (= res!802820 (not (contains!6910 lt!547662 lt!547666)))))

(assert (=> d!132889 (= (addStillNotContains!294 lt!547662 lt!547667 lt!547663 lt!547666) lt!547754)))

(declare-fun b!1207509 () Bool)

(assert (=> b!1207509 (= e!685739 (not (= lt!547667 lt!547666)))))

(assert (= (and d!132889 res!802820) b!1207509))

(assert (=> d!132889 m!1112455))

(assert (=> d!132889 m!1112455))

(assert (=> d!132889 m!1112457))

(declare-fun m!1112649 () Bool)

(assert (=> d!132889 m!1112649))

(declare-fun m!1112651 () Bool)

(assert (=> d!132889 m!1112651))

(assert (=> b!1207337 d!132889))

(declare-fun d!132891 () Bool)

(declare-fun e!685740 () Bool)

(assert (=> d!132891 e!685740))

(declare-fun res!802821 () Bool)

(assert (=> d!132891 (=> (not res!802821) (not e!685740))))

(declare-fun lt!547755 () ListLongMap!17791)

(assert (=> d!132891 (= res!802821 (contains!6910 lt!547755 (_1!9922 (tuple2!19823 lt!547667 lt!547663))))))

(declare-fun lt!547756 () List!26604)

(assert (=> d!132891 (= lt!547755 (ListLongMap!17792 lt!547756))))

(declare-fun lt!547757 () Unit!39849)

(declare-fun lt!547758 () Unit!39849)

(assert (=> d!132891 (= lt!547757 lt!547758)))

(assert (=> d!132891 (= (getValueByKey!638 lt!547756 (_1!9922 (tuple2!19823 lt!547667 lt!547663))) (Some!688 (_2!9922 (tuple2!19823 lt!547667 lt!547663))))))

(assert (=> d!132891 (= lt!547758 (lemmaContainsTupThenGetReturnValue!314 lt!547756 (_1!9922 (tuple2!19823 lt!547667 lt!547663)) (_2!9922 (tuple2!19823 lt!547667 lt!547663))))))

(assert (=> d!132891 (= lt!547756 (insertStrictlySorted!407 (toList!8911 lt!547662) (_1!9922 (tuple2!19823 lt!547667 lt!547663)) (_2!9922 (tuple2!19823 lt!547667 lt!547663))))))

(assert (=> d!132891 (= (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663)) lt!547755)))

(declare-fun b!1207510 () Bool)

(declare-fun res!802822 () Bool)

(assert (=> b!1207510 (=> (not res!802822) (not e!685740))))

(assert (=> b!1207510 (= res!802822 (= (getValueByKey!638 (toList!8911 lt!547755) (_1!9922 (tuple2!19823 lt!547667 lt!547663))) (Some!688 (_2!9922 (tuple2!19823 lt!547667 lt!547663)))))))

(declare-fun b!1207511 () Bool)

(assert (=> b!1207511 (= e!685740 (contains!6914 (toList!8911 lt!547755) (tuple2!19823 lt!547667 lt!547663)))))

(assert (= (and d!132891 res!802821) b!1207510))

(assert (= (and b!1207510 res!802822) b!1207511))

(declare-fun m!1112653 () Bool)

(assert (=> d!132891 m!1112653))

(declare-fun m!1112655 () Bool)

(assert (=> d!132891 m!1112655))

(declare-fun m!1112657 () Bool)

(assert (=> d!132891 m!1112657))

(declare-fun m!1112659 () Bool)

(assert (=> d!132891 m!1112659))

(declare-fun m!1112661 () Bool)

(assert (=> b!1207510 m!1112661))

(declare-fun m!1112663 () Bool)

(assert (=> b!1207511 m!1112663))

(assert (=> b!1207337 d!132891))

(declare-fun d!132893 () Bool)

(declare-fun e!685742 () Bool)

(assert (=> d!132893 e!685742))

(declare-fun res!802823 () Bool)

(assert (=> d!132893 (=> res!802823 e!685742)))

(declare-fun lt!547760 () Bool)

(assert (=> d!132893 (= res!802823 (not lt!547760))))

(declare-fun lt!547761 () Bool)

(assert (=> d!132893 (= lt!547760 lt!547761)))

(declare-fun lt!547759 () Unit!39849)

(declare-fun e!685741 () Unit!39849)

(assert (=> d!132893 (= lt!547759 e!685741)))

(declare-fun c!118682 () Bool)

(assert (=> d!132893 (= c!118682 lt!547761)))

(assert (=> d!132893 (= lt!547761 (containsKey!592 (toList!8911 (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663))) lt!547666))))

(assert (=> d!132893 (= (contains!6910 (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663)) lt!547666) lt!547760)))

(declare-fun b!1207512 () Bool)

(declare-fun lt!547762 () Unit!39849)

(assert (=> b!1207512 (= e!685741 lt!547762)))

(assert (=> b!1207512 (= lt!547762 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663))) lt!547666))))

(assert (=> b!1207512 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663))) lt!547666))))

(declare-fun b!1207513 () Bool)

(declare-fun Unit!39863 () Unit!39849)

(assert (=> b!1207513 (= e!685741 Unit!39863)))

(declare-fun b!1207514 () Bool)

(assert (=> b!1207514 (= e!685742 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547662 (tuple2!19823 lt!547667 lt!547663))) lt!547666)))))

(assert (= (and d!132893 c!118682) b!1207512))

(assert (= (and d!132893 (not c!118682)) b!1207513))

(assert (= (and d!132893 (not res!802823)) b!1207514))

(declare-fun m!1112665 () Bool)

(assert (=> d!132893 m!1112665))

(declare-fun m!1112667 () Bool)

(assert (=> b!1207512 m!1112667))

(declare-fun m!1112669 () Bool)

(assert (=> b!1207512 m!1112669))

(assert (=> b!1207512 m!1112669))

(declare-fun m!1112671 () Bool)

(assert (=> b!1207512 m!1112671))

(assert (=> b!1207514 m!1112669))

(assert (=> b!1207514 m!1112669))

(assert (=> b!1207514 m!1112671))

(assert (=> b!1207337 d!132893))

(declare-fun d!132895 () Bool)

(declare-fun c!118683 () Bool)

(assert (=> d!132895 (= c!118683 ((_ is ValueCellFull!14624) (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!685743 () V!46017)

(assert (=> d!132895 (= (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685743)))

(declare-fun b!1207515 () Bool)

(assert (=> b!1207515 (= e!685743 (get!19209 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207516 () Bool)

(assert (=> b!1207516 (= e!685743 (get!19210 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132895 c!118683) b!1207515))

(assert (= (and d!132895 (not c!118683)) b!1207516))

(assert (=> b!1207515 m!1112443))

(assert (=> b!1207515 m!1112155))

(declare-fun m!1112673 () Bool)

(assert (=> b!1207515 m!1112673))

(assert (=> b!1207516 m!1112443))

(assert (=> b!1207516 m!1112155))

(declare-fun m!1112675 () Bool)

(assert (=> b!1207516 m!1112675))

(assert (=> b!1207337 d!132895))

(declare-fun d!132897 () Bool)

(assert (=> d!132897 (= (validKeyInArray!0 (select (arr!37654 _keys!1208) from!1455)) (and (not (= (select (arr!37654 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37654 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207357 d!132897))

(declare-fun d!132899 () Bool)

(declare-fun e!685745 () Bool)

(assert (=> d!132899 e!685745))

(declare-fun res!802824 () Bool)

(assert (=> d!132899 (=> res!802824 e!685745)))

(declare-fun lt!547764 () Bool)

(assert (=> d!132899 (= res!802824 (not lt!547764))))

(declare-fun lt!547765 () Bool)

(assert (=> d!132899 (= lt!547764 lt!547765)))

(declare-fun lt!547763 () Unit!39849)

(declare-fun e!685744 () Unit!39849)

(assert (=> d!132899 (= lt!547763 e!685744)))

(declare-fun c!118684 () Bool)

(assert (=> d!132899 (= c!118684 lt!547765)))

(assert (=> d!132899 (= lt!547765 (containsKey!592 (toList!8911 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> d!132899 (= (contains!6910 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934) lt!547764)))

(declare-fun b!1207517 () Bool)

(declare-fun lt!547766 () Unit!39849)

(assert (=> b!1207517 (= e!685744 lt!547766)))

(assert (=> b!1207517 (= lt!547766 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> b!1207517 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(declare-fun b!1207518 () Bool)

(declare-fun Unit!39864 () Unit!39849)

(assert (=> b!1207518 (= e!685744 Unit!39864)))

(declare-fun b!1207519 () Bool)

(assert (=> b!1207519 (= e!685745 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934)))))

(assert (= (and d!132899 c!118684) b!1207517))

(assert (= (and d!132899 (not c!118684)) b!1207518))

(assert (= (and d!132899 (not res!802824)) b!1207519))

(declare-fun m!1112677 () Bool)

(assert (=> d!132899 m!1112677))

(declare-fun m!1112679 () Bool)

(assert (=> b!1207517 m!1112679))

(declare-fun m!1112681 () Bool)

(assert (=> b!1207517 m!1112681))

(assert (=> b!1207517 m!1112681))

(declare-fun m!1112683 () Bool)

(assert (=> b!1207517 m!1112683))

(assert (=> b!1207519 m!1112681))

(assert (=> b!1207519 m!1112681))

(assert (=> b!1207519 m!1112683))

(assert (=> d!132845 d!132899))

(assert (=> d!132845 d!132847))

(declare-fun d!132901 () Bool)

(assert (=> d!132901 (contains!6910 (+!4038 lt!547503 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(assert (=> d!132901 true))

(declare-fun _$35!459 () Unit!39849)

(assert (=> d!132901 (= (choose!1809 lt!547503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) _$35!459)))

(declare-fun bs!34106 () Bool)

(assert (= bs!34106 d!132901))

(assert (=> bs!34106 m!1112133))

(assert (=> bs!34106 m!1112133))

(assert (=> bs!34106 m!1112501))

(assert (=> d!132845 d!132901))

(assert (=> d!132845 d!132837))

(declare-fun d!132903 () Bool)

(declare-fun isEmpty!993 (Option!689) Bool)

(assert (=> d!132903 (= (isDefined!464 (getValueByKey!638 (toList!8911 call!58882) k0!934)) (not (isEmpty!993 (getValueByKey!638 (toList!8911 call!58882) k0!934))))))

(declare-fun bs!34107 () Bool)

(assert (= bs!34107 d!132903))

(assert (=> bs!34107 m!1112521))

(declare-fun m!1112685 () Bool)

(assert (=> bs!34107 m!1112685))

(assert (=> b!1207381 d!132903))

(declare-fun b!1207524 () Bool)

(declare-fun e!685747 () Option!689)

(assert (=> b!1207524 (= e!685747 None!687)))

(declare-fun b!1207521 () Bool)

(declare-fun e!685746 () Option!689)

(assert (=> b!1207521 (= e!685746 (Some!688 (_2!9922 (h!27809 (toList!8911 call!58882)))))))

(declare-fun d!132905 () Bool)

(declare-fun c!118685 () Bool)

(assert (=> d!132905 (= c!118685 (and ((_ is Cons!26600) (toList!8911 call!58882)) (= (_1!9922 (h!27809 (toList!8911 call!58882))) k0!934)))))

(assert (=> d!132905 (= (getValueByKey!638 (toList!8911 call!58882) k0!934) e!685746)))

(declare-fun b!1207523 () Bool)

(assert (=> b!1207523 (= e!685747 (getValueByKey!638 (t!39538 (toList!8911 call!58882)) k0!934))))

(declare-fun b!1207522 () Bool)

(assert (=> b!1207522 (= e!685746 e!685747)))

(declare-fun c!118686 () Bool)

(assert (=> b!1207522 (= c!118686 (and ((_ is Cons!26600) (toList!8911 call!58882)) (not (= (_1!9922 (h!27809 (toList!8911 call!58882))) k0!934))))))

(assert (= (and d!132905 c!118685) b!1207521))

(assert (= (and d!132905 (not c!118685)) b!1207522))

(assert (= (and b!1207522 c!118686) b!1207523))

(assert (= (and b!1207522 (not c!118686)) b!1207524))

(declare-fun m!1112687 () Bool)

(assert (=> b!1207523 m!1112687))

(assert (=> b!1207381 d!132905))

(declare-fun d!132907 () Bool)

(declare-fun isEmpty!994 (List!26604) Bool)

(assert (=> d!132907 (= (isEmpty!992 lt!547642) (isEmpty!994 (toList!8911 lt!547642)))))

(declare-fun bs!34108 () Bool)

(assert (= bs!34108 d!132907))

(declare-fun m!1112689 () Bool)

(assert (=> bs!34108 m!1112689))

(assert (=> b!1207298 d!132907))

(declare-fun d!132909 () Bool)

(declare-fun e!685749 () Bool)

(assert (=> d!132909 e!685749))

(declare-fun res!802825 () Bool)

(assert (=> d!132909 (=> res!802825 e!685749)))

(declare-fun lt!547768 () Bool)

(assert (=> d!132909 (= res!802825 (not lt!547768))))

(declare-fun lt!547769 () Bool)

(assert (=> d!132909 (= lt!547768 lt!547769)))

(declare-fun lt!547767 () Unit!39849)

(declare-fun e!685748 () Unit!39849)

(assert (=> d!132909 (= lt!547767 e!685748)))

(declare-fun c!118687 () Bool)

(assert (=> d!132909 (= c!118687 lt!547769)))

(assert (=> d!132909 (= lt!547769 (containsKey!592 (toList!8911 lt!547665) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132909 (= (contains!6910 lt!547665 #b1000000000000000000000000000000000000000000000000000000000000000) lt!547768)))

(declare-fun b!1207525 () Bool)

(declare-fun lt!547770 () Unit!39849)

(assert (=> b!1207525 (= e!685748 lt!547770)))

(assert (=> b!1207525 (= lt!547770 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547665) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207525 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547665) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207526 () Bool)

(declare-fun Unit!39865 () Unit!39849)

(assert (=> b!1207526 (= e!685748 Unit!39865)))

(declare-fun b!1207527 () Bool)

(assert (=> b!1207527 (= e!685749 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547665) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132909 c!118687) b!1207525))

(assert (= (and d!132909 (not c!118687)) b!1207526))

(assert (= (and d!132909 (not res!802825)) b!1207527))

(declare-fun m!1112691 () Bool)

(assert (=> d!132909 m!1112691))

(declare-fun m!1112693 () Bool)

(assert (=> b!1207525 m!1112693))

(declare-fun m!1112695 () Bool)

(assert (=> b!1207525 m!1112695))

(assert (=> b!1207525 m!1112695))

(declare-fun m!1112697 () Bool)

(assert (=> b!1207525 m!1112697))

(assert (=> b!1207527 m!1112695))

(assert (=> b!1207527 m!1112695))

(assert (=> b!1207527 m!1112697))

(assert (=> b!1207339 d!132909))

(declare-fun bm!58972 () Bool)

(declare-fun call!58975 () ListLongMap!17791)

(assert (=> bm!58972 (= call!58975 (getCurrentListMapNoExtraKeys!5354 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)) (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!132911 () Bool)

(declare-fun e!685752 () Bool)

(assert (=> d!132911 e!685752))

(declare-fun c!118690 () Bool)

(assert (=> d!132911 (= c!118690 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!132911 true))

(declare-fun _$12!468 () Unit!39849)

(assert (=> d!132911 (= (choose!1810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!468)))

(declare-fun b!1207533 () Bool)

(declare-fun call!58974 () ListLongMap!17791)

(assert (=> b!1207533 (= e!685752 (= call!58975 call!58974))))

(declare-fun bm!58971 () Bool)

(assert (=> bm!58971 (= call!58974 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207532 () Bool)

(assert (=> b!1207532 (= e!685752 (= call!58975 (-!1796 call!58974 k0!934)))))

(assert (= (and d!132911 c!118690) b!1207532))

(assert (= (and d!132911 (not c!118690)) b!1207533))

(assert (= (or b!1207532 b!1207533) bm!58971))

(assert (= (or b!1207532 b!1207533) bm!58972))

(declare-fun b_lambda!21427 () Bool)

(assert (=> (not b_lambda!21427) (not bm!58972)))

(assert (=> bm!58972 t!39537))

(declare-fun b_and!42939 () Bool)

(assert (= b_and!42937 (and (=> t!39537 result!22105) b_and!42939)))

(assert (=> bm!58972 m!1112147))

(assert (=> bm!58972 m!1112155))

(assert (=> bm!58972 m!1112157))

(assert (=> bm!58972 m!1112401))

(assert (=> bm!58971 m!1112129))

(declare-fun m!1112699 () Bool)

(assert (=> b!1207532 m!1112699))

(assert (=> d!132821 d!132911))

(declare-fun d!132913 () Bool)

(assert (=> d!132913 (isDefined!464 (getValueByKey!638 (toList!8911 call!58882) k0!934))))

(declare-fun lt!547773 () Unit!39849)

(declare-fun choose!1814 (List!26604 (_ BitVec 64)) Unit!39849)

(assert (=> d!132913 (= lt!547773 (choose!1814 (toList!8911 call!58882) k0!934))))

(declare-fun e!685755 () Bool)

(assert (=> d!132913 e!685755))

(declare-fun res!802828 () Bool)

(assert (=> d!132913 (=> (not res!802828) (not e!685755))))

(assert (=> d!132913 (= res!802828 (isStrictlySorted!725 (toList!8911 call!58882)))))

(assert (=> d!132913 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 call!58882) k0!934) lt!547773)))

(declare-fun b!1207536 () Bool)

(assert (=> b!1207536 (= e!685755 (containsKey!592 (toList!8911 call!58882) k0!934))))

(assert (= (and d!132913 res!802828) b!1207536))

(assert (=> d!132913 m!1112521))

(assert (=> d!132913 m!1112521))

(assert (=> d!132913 m!1112523))

(declare-fun m!1112701 () Bool)

(assert (=> d!132913 m!1112701))

(declare-fun m!1112703 () Bool)

(assert (=> d!132913 m!1112703))

(assert (=> b!1207536 m!1112517))

(assert (=> b!1207379 d!132913))

(assert (=> b!1207379 d!132903))

(assert (=> b!1207379 d!132905))

(declare-fun bm!58973 () Bool)

(declare-fun call!58976 () ListLongMap!17791)

(assert (=> bm!58973 (= call!58976 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207537 () Bool)

(declare-fun lt!547778 () ListLongMap!17791)

(declare-fun e!685760 () Bool)

(assert (=> b!1207537 (= e!685760 (= lt!547778 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207538 () Bool)

(declare-fun e!685758 () ListLongMap!17791)

(declare-fun e!685762 () ListLongMap!17791)

(assert (=> b!1207538 (= e!685758 e!685762)))

(declare-fun c!118694 () Bool)

(assert (=> b!1207538 (= c!118694 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207539 () Bool)

(declare-fun e!685759 () Bool)

(assert (=> b!1207539 (= e!685759 e!685760)))

(declare-fun c!118693 () Bool)

(assert (=> b!1207539 (= c!118693 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(declare-fun b!1207540 () Bool)

(declare-fun e!685761 () Bool)

(assert (=> b!1207540 (= e!685761 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207540 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207541 () Bool)

(assert (=> b!1207541 (= e!685762 call!58976)))

(declare-fun b!1207542 () Bool)

(declare-fun e!685756 () Bool)

(assert (=> b!1207542 (= e!685756 e!685759)))

(declare-fun c!118692 () Bool)

(assert (=> b!1207542 (= c!118692 e!685761)))

(declare-fun res!802831 () Bool)

(assert (=> b!1207542 (=> (not res!802831) (not e!685761))))

(assert (=> b!1207542 (= res!802831 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(declare-fun b!1207543 () Bool)

(assert (=> b!1207543 (= e!685760 (isEmpty!992 lt!547778))))

(declare-fun b!1207544 () Bool)

(declare-fun lt!547777 () Unit!39849)

(declare-fun lt!547774 () Unit!39849)

(assert (=> b!1207544 (= lt!547777 lt!547774)))

(declare-fun lt!547775 () ListLongMap!17791)

(declare-fun lt!547776 () V!46017)

(declare-fun lt!547780 () (_ BitVec 64))

(declare-fun lt!547779 () (_ BitVec 64))

(assert (=> b!1207544 (not (contains!6910 (+!4038 lt!547775 (tuple2!19823 lt!547780 lt!547776)) lt!547779))))

(assert (=> b!1207544 (= lt!547774 (addStillNotContains!294 lt!547775 lt!547780 lt!547776 lt!547779))))

(assert (=> b!1207544 (= lt!547779 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207544 (= lt!547776 (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207544 (= lt!547780 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1207544 (= lt!547775 call!58976)))

(assert (=> b!1207544 (= e!685762 (+!4038 call!58976 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207545 () Bool)

(declare-fun e!685757 () Bool)

(assert (=> b!1207545 (= e!685759 e!685757)))

(assert (=> b!1207545 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(declare-fun res!802830 () Bool)

(assert (=> b!1207545 (= res!802830 (contains!6910 lt!547778 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207545 (=> (not res!802830) (not e!685757))))

(declare-fun b!1207546 () Bool)

(declare-fun res!802832 () Bool)

(assert (=> b!1207546 (=> (not res!802832) (not e!685756))))

(assert (=> b!1207546 (= res!802832 (not (contains!6910 lt!547778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207547 () Bool)

(assert (=> b!1207547 (= e!685758 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207548 () Bool)

(assert (=> b!1207548 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(assert (=> b!1207548 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38193 lt!547510)))))

(assert (=> b!1207548 (= e!685757 (= (apply!958 lt!547778 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132915 () Bool)

(assert (=> d!132915 e!685756))

(declare-fun res!802829 () Bool)

(assert (=> d!132915 (=> (not res!802829) (not e!685756))))

(assert (=> d!132915 (= res!802829 (not (contains!6910 lt!547778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132915 (= lt!547778 e!685758)))

(declare-fun c!118691 () Bool)

(assert (=> d!132915 (= c!118691 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(assert (=> d!132915 (validMask!0 mask!1564)))

(assert (=> d!132915 (= (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547778)))

(assert (= (and d!132915 c!118691) b!1207547))

(assert (= (and d!132915 (not c!118691)) b!1207538))

(assert (= (and b!1207538 c!118694) b!1207544))

(assert (= (and b!1207538 (not c!118694)) b!1207541))

(assert (= (or b!1207544 b!1207541) bm!58973))

(assert (= (and d!132915 res!802829) b!1207546))

(assert (= (and b!1207546 res!802832) b!1207542))

(assert (= (and b!1207542 res!802831) b!1207540))

(assert (= (and b!1207542 c!118692) b!1207545))

(assert (= (and b!1207542 (not c!118692)) b!1207539))

(assert (= (and b!1207545 res!802830) b!1207548))

(assert (= (and b!1207539 c!118693) b!1207537))

(assert (= (and b!1207539 (not c!118693)) b!1207543))

(declare-fun b_lambda!21429 () Bool)

(assert (=> (not b_lambda!21429) (not b!1207544)))

(assert (=> b!1207544 t!39537))

(declare-fun b_and!42941 () Bool)

(assert (= b_and!42939 (and (=> t!39537 result!22105) b_and!42941)))

(declare-fun b_lambda!21431 () Bool)

(assert (=> (not b_lambda!21431) (not b!1207548)))

(assert (=> b!1207548 t!39537))

(declare-fun b_and!42943 () Bool)

(assert (= b_and!42941 (and (=> t!39537 result!22105) b_and!42943)))

(declare-fun m!1112705 () Bool)

(assert (=> b!1207545 m!1112705))

(assert (=> b!1207545 m!1112705))

(declare-fun m!1112707 () Bool)

(assert (=> b!1207545 m!1112707))

(declare-fun m!1112709 () Bool)

(assert (=> b!1207537 m!1112709))

(declare-fun m!1112711 () Bool)

(assert (=> b!1207543 m!1112711))

(assert (=> bm!58973 m!1112709))

(assert (=> b!1207540 m!1112705))

(assert (=> b!1207540 m!1112705))

(declare-fun m!1112713 () Bool)

(assert (=> b!1207540 m!1112713))

(assert (=> b!1207548 m!1112155))

(assert (=> b!1207548 m!1112705))

(declare-fun m!1112715 () Bool)

(assert (=> b!1207548 m!1112715))

(declare-fun m!1112717 () Bool)

(assert (=> b!1207548 m!1112717))

(assert (=> b!1207548 m!1112705))

(assert (=> b!1207548 m!1112717))

(assert (=> b!1207548 m!1112155))

(declare-fun m!1112719 () Bool)

(assert (=> b!1207548 m!1112719))

(declare-fun m!1112721 () Bool)

(assert (=> d!132915 m!1112721))

(assert (=> d!132915 m!1112127))

(declare-fun m!1112723 () Bool)

(assert (=> b!1207546 m!1112723))

(assert (=> b!1207538 m!1112705))

(assert (=> b!1207538 m!1112705))

(assert (=> b!1207538 m!1112713))

(assert (=> b!1207544 m!1112155))

(declare-fun m!1112725 () Bool)

(assert (=> b!1207544 m!1112725))

(declare-fun m!1112727 () Bool)

(assert (=> b!1207544 m!1112727))

(assert (=> b!1207544 m!1112717))

(assert (=> b!1207544 m!1112705))

(assert (=> b!1207544 m!1112717))

(assert (=> b!1207544 m!1112155))

(assert (=> b!1207544 m!1112719))

(declare-fun m!1112729 () Bool)

(assert (=> b!1207544 m!1112729))

(declare-fun m!1112731 () Bool)

(assert (=> b!1207544 m!1112731))

(assert (=> b!1207544 m!1112729))

(assert (=> bm!58952 d!132915))

(declare-fun d!132917 () Bool)

(declare-fun e!685764 () Bool)

(assert (=> d!132917 e!685764))

(declare-fun res!802833 () Bool)

(assert (=> d!132917 (=> res!802833 e!685764)))

(declare-fun lt!547782 () Bool)

(assert (=> d!132917 (= res!802833 (not lt!547782))))

(declare-fun lt!547783 () Bool)

(assert (=> d!132917 (= lt!547782 lt!547783)))

(declare-fun lt!547781 () Unit!39849)

(declare-fun e!685763 () Unit!39849)

(assert (=> d!132917 (= lt!547781 e!685763)))

(declare-fun c!118695 () Bool)

(assert (=> d!132917 (= c!118695 lt!547783)))

(assert (=> d!132917 (= lt!547783 (containsKey!592 (toList!8911 lt!547642) (select (arr!37654 _keys!1208) from!1455)))))

(assert (=> d!132917 (= (contains!6910 lt!547642 (select (arr!37654 _keys!1208) from!1455)) lt!547782)))

(declare-fun b!1207549 () Bool)

(declare-fun lt!547784 () Unit!39849)

(assert (=> b!1207549 (= e!685763 lt!547784)))

(assert (=> b!1207549 (= lt!547784 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547642) (select (arr!37654 _keys!1208) from!1455)))))

(assert (=> b!1207549 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547642) (select (arr!37654 _keys!1208) from!1455)))))

(declare-fun b!1207550 () Bool)

(declare-fun Unit!39866 () Unit!39849)

(assert (=> b!1207550 (= e!685763 Unit!39866)))

(declare-fun b!1207551 () Bool)

(assert (=> b!1207551 (= e!685764 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547642) (select (arr!37654 _keys!1208) from!1455))))))

(assert (= (and d!132917 c!118695) b!1207549))

(assert (= (and d!132917 (not c!118695)) b!1207550))

(assert (= (and d!132917 (not res!802833)) b!1207551))

(assert (=> d!132917 m!1112171))

(declare-fun m!1112733 () Bool)

(assert (=> d!132917 m!1112733))

(assert (=> b!1207549 m!1112171))

(declare-fun m!1112735 () Bool)

(assert (=> b!1207549 m!1112735))

(assert (=> b!1207549 m!1112171))

(declare-fun m!1112737 () Bool)

(assert (=> b!1207549 m!1112737))

(assert (=> b!1207549 m!1112737))

(declare-fun m!1112739 () Bool)

(assert (=> b!1207549 m!1112739))

(assert (=> b!1207551 m!1112171))

(assert (=> b!1207551 m!1112737))

(assert (=> b!1207551 m!1112737))

(assert (=> b!1207551 m!1112739))

(assert (=> b!1207300 d!132917))

(declare-fun d!132919 () Bool)

(assert (=> d!132919 (= (apply!958 lt!547665 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19208 (getValueByKey!638 (toList!8911 lt!547665) (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34109 () Bool)

(assert (= bs!34109 d!132919))

(assert (=> bs!34109 m!1112431))

(declare-fun m!1112741 () Bool)

(assert (=> bs!34109 m!1112741))

(assert (=> bs!34109 m!1112741))

(declare-fun m!1112743 () Bool)

(assert (=> bs!34109 m!1112743))

(assert (=> b!1207341 d!132919))

(assert (=> b!1207341 d!132895))

(declare-fun d!132921 () Bool)

(declare-fun lt!547787 () Bool)

(declare-fun content!543 (List!26604) (InoxSet tuple2!19822))

(assert (=> d!132921 (= lt!547787 (select (content!543 (toList!8911 lt!547706)) (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun e!685769 () Bool)

(assert (=> d!132921 (= lt!547787 e!685769)))

(declare-fun res!802839 () Bool)

(assert (=> d!132921 (=> (not res!802839) (not e!685769))))

(assert (=> d!132921 (= res!802839 ((_ is Cons!26600) (toList!8911 lt!547706)))))

(assert (=> d!132921 (= (contains!6914 (toList!8911 lt!547706) (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!547787)))

(declare-fun b!1207556 () Bool)

(declare-fun e!685770 () Bool)

(assert (=> b!1207556 (= e!685769 e!685770)))

(declare-fun res!802838 () Bool)

(assert (=> b!1207556 (=> res!802838 e!685770)))

(assert (=> b!1207556 (= res!802838 (= (h!27809 (toList!8911 lt!547706)) (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun b!1207557 () Bool)

(assert (=> b!1207557 (= e!685770 (contains!6914 (t!39538 (toList!8911 lt!547706)) (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132921 res!802839) b!1207556))

(assert (= (and b!1207556 (not res!802838)) b!1207557))

(declare-fun m!1112745 () Bool)

(assert (=> d!132921 m!1112745))

(declare-fun m!1112747 () Bool)

(assert (=> d!132921 m!1112747))

(declare-fun m!1112749 () Bool)

(assert (=> b!1207557 m!1112749))

(assert (=> b!1207378 d!132921))

(declare-fun d!132923 () Bool)

(declare-fun e!685772 () Bool)

(assert (=> d!132923 e!685772))

(declare-fun res!802840 () Bool)

(assert (=> d!132923 (=> res!802840 e!685772)))

(declare-fun lt!547789 () Bool)

(assert (=> d!132923 (= res!802840 (not lt!547789))))

(declare-fun lt!547790 () Bool)

(assert (=> d!132923 (= lt!547789 lt!547790)))

(declare-fun lt!547788 () Unit!39849)

(declare-fun e!685771 () Unit!39849)

(assert (=> d!132923 (= lt!547788 e!685771)))

(declare-fun c!118696 () Bool)

(assert (=> d!132923 (= c!118696 lt!547790)))

(assert (=> d!132923 (= lt!547790 (containsKey!592 (toList!8911 lt!547642) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132923 (= (contains!6910 lt!547642 #b1000000000000000000000000000000000000000000000000000000000000000) lt!547789)))

(declare-fun b!1207558 () Bool)

(declare-fun lt!547791 () Unit!39849)

(assert (=> b!1207558 (= e!685771 lt!547791)))

(assert (=> b!1207558 (= lt!547791 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547642) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207558 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547642) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207559 () Bool)

(declare-fun Unit!39867 () Unit!39849)

(assert (=> b!1207559 (= e!685771 Unit!39867)))

(declare-fun b!1207560 () Bool)

(assert (=> b!1207560 (= e!685772 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132923 c!118696) b!1207558))

(assert (= (and d!132923 (not c!118696)) b!1207559))

(assert (= (and d!132923 (not res!802840)) b!1207560))

(declare-fun m!1112751 () Bool)

(assert (=> d!132923 m!1112751))

(declare-fun m!1112753 () Bool)

(assert (=> b!1207558 m!1112753))

(declare-fun m!1112755 () Bool)

(assert (=> b!1207558 m!1112755))

(assert (=> b!1207558 m!1112755))

(declare-fun m!1112757 () Bool)

(assert (=> b!1207558 m!1112757))

(assert (=> b!1207560 m!1112755))

(assert (=> b!1207560 m!1112755))

(assert (=> b!1207560 m!1112757))

(assert (=> b!1207301 d!132923))

(declare-fun b!1207564 () Bool)

(declare-fun e!685774 () Option!689)

(assert (=> b!1207564 (= e!685774 None!687)))

(declare-fun b!1207561 () Bool)

(declare-fun e!685773 () Option!689)

(assert (=> b!1207561 (= e!685773 (Some!688 (_2!9922 (h!27809 (toList!8911 lt!547706)))))))

(declare-fun d!132925 () Bool)

(declare-fun c!118697 () Bool)

(assert (=> d!132925 (= c!118697 (and ((_ is Cons!26600) (toList!8911 lt!547706)) (= (_1!9922 (h!27809 (toList!8911 lt!547706))) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!132925 (= (getValueByKey!638 (toList!8911 lt!547706) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) e!685773)))

(declare-fun b!1207563 () Bool)

(assert (=> b!1207563 (= e!685774 (getValueByKey!638 (t!39538 (toList!8911 lt!547706)) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1207562 () Bool)

(assert (=> b!1207562 (= e!685773 e!685774)))

(declare-fun c!118698 () Bool)

(assert (=> b!1207562 (= c!118698 (and ((_ is Cons!26600) (toList!8911 lt!547706)) (not (= (_1!9922 (h!27809 (toList!8911 lt!547706))) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(assert (= (and d!132925 c!118697) b!1207561))

(assert (= (and d!132925 (not c!118697)) b!1207562))

(assert (= (and b!1207562 c!118698) b!1207563))

(assert (= (and b!1207562 (not c!118698)) b!1207564))

(declare-fun m!1112759 () Bool)

(assert (=> b!1207563 m!1112759))

(assert (=> b!1207377 d!132925))

(declare-fun d!132927 () Bool)

(declare-fun e!685776 () Bool)

(assert (=> d!132927 e!685776))

(declare-fun res!802841 () Bool)

(assert (=> d!132927 (=> res!802841 e!685776)))

(declare-fun lt!547793 () Bool)

(assert (=> d!132927 (= res!802841 (not lt!547793))))

(declare-fun lt!547794 () Bool)

(assert (=> d!132927 (= lt!547793 lt!547794)))

(declare-fun lt!547792 () Unit!39849)

(declare-fun e!685775 () Unit!39849)

(assert (=> d!132927 (= lt!547792 e!685775)))

(declare-fun c!118699 () Bool)

(assert (=> d!132927 (= c!118699 lt!547794)))

(assert (=> d!132927 (= lt!547794 (containsKey!592 (toList!8911 lt!547635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132927 (= (contains!6910 lt!547635 #b0000000000000000000000000000000000000000000000000000000000000000) lt!547793)))

(declare-fun b!1207565 () Bool)

(declare-fun lt!547795 () Unit!39849)

(assert (=> b!1207565 (= e!685775 lt!547795)))

(assert (=> b!1207565 (= lt!547795 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207565 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207566 () Bool)

(declare-fun Unit!39868 () Unit!39849)

(assert (=> b!1207566 (= e!685775 Unit!39868)))

(declare-fun b!1207567 () Bool)

(assert (=> b!1207567 (= e!685776 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132927 c!118699) b!1207565))

(assert (= (and d!132927 (not c!118699)) b!1207566))

(assert (= (and d!132927 (not res!802841)) b!1207567))

(declare-fun m!1112761 () Bool)

(assert (=> d!132927 m!1112761))

(declare-fun m!1112763 () Bool)

(assert (=> b!1207565 m!1112763))

(declare-fun m!1112765 () Bool)

(assert (=> b!1207565 m!1112765))

(assert (=> b!1207565 m!1112765))

(declare-fun m!1112767 () Bool)

(assert (=> b!1207565 m!1112767))

(assert (=> b!1207567 m!1112765))

(assert (=> b!1207567 m!1112765))

(assert (=> b!1207567 m!1112767))

(assert (=> d!132813 d!132927))

(assert (=> d!132813 d!132843))

(declare-fun d!132929 () Bool)

(declare-fun res!802842 () Bool)

(declare-fun e!685777 () Bool)

(assert (=> d!132929 (=> res!802842 e!685777)))

(assert (=> d!132929 (= res!802842 (= (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!132929 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!685777)))

(declare-fun b!1207568 () Bool)

(declare-fun e!685778 () Bool)

(assert (=> b!1207568 (= e!685777 e!685778)))

(declare-fun res!802843 () Bool)

(assert (=> b!1207568 (=> (not res!802843) (not e!685778))))

(assert (=> b!1207568 (= res!802843 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207569 () Bool)

(assert (=> b!1207569 (= e!685778 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!132929 (not res!802842)) b!1207568))

(assert (= (and b!1207568 res!802843) b!1207569))

(declare-fun m!1112769 () Bool)

(assert (=> d!132929 m!1112769))

(declare-fun m!1112771 () Bool)

(assert (=> b!1207569 m!1112771))

(assert (=> b!1207383 d!132929))

(declare-fun d!132931 () Bool)

(assert (=> d!132931 (arrayContainsKey!0 lt!547511 lt!547614 #b00000000000000000000000000000000)))

(declare-fun lt!547796 () Unit!39849)

(assert (=> d!132931 (= lt!547796 (choose!13 lt!547511 lt!547614 #b00000000000000000000000000000000))))

(assert (=> d!132931 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!132931 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547511 lt!547614 #b00000000000000000000000000000000) lt!547796)))

(declare-fun bs!34110 () Bool)

(assert (= bs!34110 d!132931))

(assert (=> bs!34110 m!1112321))

(declare-fun m!1112773 () Bool)

(assert (=> bs!34110 m!1112773))

(assert (=> b!1207254 d!132931))

(declare-fun d!132933 () Bool)

(declare-fun res!802844 () Bool)

(declare-fun e!685779 () Bool)

(assert (=> d!132933 (=> res!802844 e!685779)))

(assert (=> d!132933 (= res!802844 (= (select (arr!37654 lt!547511) #b00000000000000000000000000000000) lt!547614))))

(assert (=> d!132933 (= (arrayContainsKey!0 lt!547511 lt!547614 #b00000000000000000000000000000000) e!685779)))

(declare-fun b!1207570 () Bool)

(declare-fun e!685780 () Bool)

(assert (=> b!1207570 (= e!685779 e!685780)))

(declare-fun res!802845 () Bool)

(assert (=> b!1207570 (=> (not res!802845) (not e!685780))))

(assert (=> b!1207570 (= res!802845 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(declare-fun b!1207571 () Bool)

(assert (=> b!1207571 (= e!685780 (arrayContainsKey!0 lt!547511 lt!547614 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132933 (not res!802844)) b!1207570))

(assert (= (and b!1207570 res!802845) b!1207571))

(assert (=> d!132933 m!1112315))

(declare-fun m!1112775 () Bool)

(assert (=> b!1207571 m!1112775))

(assert (=> b!1207254 d!132933))

(declare-fun b!1207584 () Bool)

(declare-fun e!685787 () SeekEntryResult!9937)

(declare-fun lt!547804 () SeekEntryResult!9937)

(assert (=> b!1207584 (= e!685787 (MissingZero!9937 (index!42121 lt!547804)))))

(declare-fun b!1207585 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78028 (_ BitVec 32)) SeekEntryResult!9937)

(assert (=> b!1207585 (= e!685787 (seekKeyOrZeroReturnVacant!0 (x!106576 lt!547804) (index!42121 lt!547804) (index!42121 lt!547804) (select (arr!37654 lt!547511) #b00000000000000000000000000000000) lt!547511 mask!1564))))

(declare-fun b!1207586 () Bool)

(declare-fun e!685788 () SeekEntryResult!9937)

(assert (=> b!1207586 (= e!685788 (Found!9937 (index!42121 lt!547804)))))

(declare-fun b!1207587 () Bool)

(declare-fun e!685789 () SeekEntryResult!9937)

(assert (=> b!1207587 (= e!685789 Undefined!9937)))

(declare-fun b!1207588 () Bool)

(declare-fun c!118708 () Bool)

(declare-fun lt!547805 () (_ BitVec 64))

(assert (=> b!1207588 (= c!118708 (= lt!547805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207588 (= e!685788 e!685787)))

(declare-fun b!1207589 () Bool)

(assert (=> b!1207589 (= e!685789 e!685788)))

(assert (=> b!1207589 (= lt!547805 (select (arr!37654 lt!547511) (index!42121 lt!547804)))))

(declare-fun c!118706 () Bool)

(assert (=> b!1207589 (= c!118706 (= lt!547805 (select (arr!37654 lt!547511) #b00000000000000000000000000000000)))))

(declare-fun d!132935 () Bool)

(declare-fun lt!547803 () SeekEntryResult!9937)

(assert (=> d!132935 (and (or ((_ is Undefined!9937) lt!547803) (not ((_ is Found!9937) lt!547803)) (and (bvsge (index!42120 lt!547803) #b00000000000000000000000000000000) (bvslt (index!42120 lt!547803) (size!38192 lt!547511)))) (or ((_ is Undefined!9937) lt!547803) ((_ is Found!9937) lt!547803) (not ((_ is MissingZero!9937) lt!547803)) (and (bvsge (index!42119 lt!547803) #b00000000000000000000000000000000) (bvslt (index!42119 lt!547803) (size!38192 lt!547511)))) (or ((_ is Undefined!9937) lt!547803) ((_ is Found!9937) lt!547803) ((_ is MissingZero!9937) lt!547803) (not ((_ is MissingVacant!9937) lt!547803)) (and (bvsge (index!42122 lt!547803) #b00000000000000000000000000000000) (bvslt (index!42122 lt!547803) (size!38192 lt!547511)))) (or ((_ is Undefined!9937) lt!547803) (ite ((_ is Found!9937) lt!547803) (= (select (arr!37654 lt!547511) (index!42120 lt!547803)) (select (arr!37654 lt!547511) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9937) lt!547803) (= (select (arr!37654 lt!547511) (index!42119 lt!547803)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9937) lt!547803) (= (select (arr!37654 lt!547511) (index!42122 lt!547803)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132935 (= lt!547803 e!685789)))

(declare-fun c!118707 () Bool)

(assert (=> d!132935 (= c!118707 (and ((_ is Intermediate!9937) lt!547804) (undefined!10749 lt!547804)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78028 (_ BitVec 32)) SeekEntryResult!9937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!132935 (= lt!547804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) mask!1564) (select (arr!37654 lt!547511) #b00000000000000000000000000000000) lt!547511 mask!1564))))

(assert (=> d!132935 (validMask!0 mask!1564)))

(assert (=> d!132935 (= (seekEntryOrOpen!0 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) lt!547511 mask!1564) lt!547803)))

(assert (= (and d!132935 c!118707) b!1207587))

(assert (= (and d!132935 (not c!118707)) b!1207589))

(assert (= (and b!1207589 c!118706) b!1207586))

(assert (= (and b!1207589 (not c!118706)) b!1207588))

(assert (= (and b!1207588 c!118708) b!1207584))

(assert (= (and b!1207588 (not c!118708)) b!1207585))

(assert (=> b!1207585 m!1112315))

(declare-fun m!1112777 () Bool)

(assert (=> b!1207585 m!1112777))

(declare-fun m!1112779 () Bool)

(assert (=> b!1207589 m!1112779))

(declare-fun m!1112781 () Bool)

(assert (=> d!132935 m!1112781))

(assert (=> d!132935 m!1112315))

(declare-fun m!1112783 () Bool)

(assert (=> d!132935 m!1112783))

(declare-fun m!1112785 () Bool)

(assert (=> d!132935 m!1112785))

(declare-fun m!1112787 () Bool)

(assert (=> d!132935 m!1112787))

(assert (=> d!132935 m!1112315))

(assert (=> d!132935 m!1112781))

(assert (=> d!132935 m!1112127))

(declare-fun m!1112789 () Bool)

(assert (=> d!132935 m!1112789))

(assert (=> b!1207254 d!132935))

(declare-fun bm!58974 () Bool)

(declare-fun call!58977 () ListLongMap!17791)

(assert (=> bm!58974 (= call!58977 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun lt!547810 () ListLongMap!17791)

(declare-fun e!685794 () Bool)

(declare-fun b!1207590 () Bool)

(assert (=> b!1207590 (= e!685794 (= lt!547810 (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207591 () Bool)

(declare-fun e!685792 () ListLongMap!17791)

(declare-fun e!685796 () ListLongMap!17791)

(assert (=> b!1207591 (= e!685792 e!685796)))

(declare-fun c!118712 () Bool)

(assert (=> b!1207591 (= c!118712 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207592 () Bool)

(declare-fun e!685793 () Bool)

(assert (=> b!1207592 (= e!685793 e!685794)))

(declare-fun c!118711 () Bool)

(assert (=> b!1207592 (= c!118711 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(declare-fun b!1207593 () Bool)

(declare-fun e!685795 () Bool)

(assert (=> b!1207593 (= e!685795 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207593 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207594 () Bool)

(assert (=> b!1207594 (= e!685796 call!58977)))

(declare-fun b!1207595 () Bool)

(declare-fun e!685790 () Bool)

(assert (=> b!1207595 (= e!685790 e!685793)))

(declare-fun c!118710 () Bool)

(assert (=> b!1207595 (= c!118710 e!685795)))

(declare-fun res!802848 () Bool)

(assert (=> b!1207595 (=> (not res!802848) (not e!685795))))

(assert (=> b!1207595 (= res!802848 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(declare-fun b!1207596 () Bool)

(assert (=> b!1207596 (= e!685794 (isEmpty!992 lt!547810))))

(declare-fun b!1207597 () Bool)

(declare-fun lt!547809 () Unit!39849)

(declare-fun lt!547806 () Unit!39849)

(assert (=> b!1207597 (= lt!547809 lt!547806)))

(declare-fun lt!547808 () V!46017)

(declare-fun lt!547812 () (_ BitVec 64))

(declare-fun lt!547811 () (_ BitVec 64))

(declare-fun lt!547807 () ListLongMap!17791)

(assert (=> b!1207597 (not (contains!6910 (+!4038 lt!547807 (tuple2!19823 lt!547812 lt!547808)) lt!547811))))

(assert (=> b!1207597 (= lt!547806 (addStillNotContains!294 lt!547807 lt!547812 lt!547808 lt!547811))))

(assert (=> b!1207597 (= lt!547811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207597 (= lt!547808 (get!19207 (select (arr!37655 lt!547510) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207597 (= lt!547812 (select (arr!37654 lt!547511) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1207597 (= lt!547807 call!58977)))

(assert (=> b!1207597 (= e!685796 (+!4038 call!58977 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19207 (select (arr!37655 lt!547510) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207598 () Bool)

(declare-fun e!685791 () Bool)

(assert (=> b!1207598 (= e!685793 e!685791)))

(assert (=> b!1207598 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(declare-fun res!802847 () Bool)

(assert (=> b!1207598 (= res!802847 (contains!6910 lt!547810 (select (arr!37654 lt!547511) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207598 (=> (not res!802847) (not e!685791))))

(declare-fun b!1207599 () Bool)

(declare-fun res!802849 () Bool)

(assert (=> b!1207599 (=> (not res!802849) (not e!685790))))

(assert (=> b!1207599 (= res!802849 (not (contains!6910 lt!547810 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207600 () Bool)

(assert (=> b!1207600 (= e!685792 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207601 () Bool)

(assert (=> b!1207601 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(assert (=> b!1207601 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38193 lt!547510)))))

(assert (=> b!1207601 (= e!685791 (= (apply!958 lt!547810 (select (arr!37654 lt!547511) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19207 (select (arr!37655 lt!547510) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132937 () Bool)

(assert (=> d!132937 e!685790))

(declare-fun res!802846 () Bool)

(assert (=> d!132937 (=> (not res!802846) (not e!685790))))

(assert (=> d!132937 (= res!802846 (not (contains!6910 lt!547810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132937 (= lt!547810 e!685792)))

(declare-fun c!118709 () Bool)

(assert (=> d!132937 (= c!118709 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(assert (=> d!132937 (validMask!0 mask!1564)))

(assert (=> d!132937 (= (getCurrentListMapNoExtraKeys!5354 lt!547511 lt!547510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547810)))

(assert (= (and d!132937 c!118709) b!1207600))

(assert (= (and d!132937 (not c!118709)) b!1207591))

(assert (= (and b!1207591 c!118712) b!1207597))

(assert (= (and b!1207591 (not c!118712)) b!1207594))

(assert (= (or b!1207597 b!1207594) bm!58974))

(assert (= (and d!132937 res!802846) b!1207599))

(assert (= (and b!1207599 res!802849) b!1207595))

(assert (= (and b!1207595 res!802848) b!1207593))

(assert (= (and b!1207595 c!118710) b!1207598))

(assert (= (and b!1207595 (not c!118710)) b!1207592))

(assert (= (and b!1207598 res!802847) b!1207601))

(assert (= (and b!1207592 c!118711) b!1207590))

(assert (= (and b!1207592 (not c!118711)) b!1207596))

(declare-fun b_lambda!21433 () Bool)

(assert (=> (not b_lambda!21433) (not b!1207597)))

(assert (=> b!1207597 t!39537))

(declare-fun b_and!42945 () Bool)

(assert (= b_and!42943 (and (=> t!39537 result!22105) b_and!42945)))

(declare-fun b_lambda!21435 () Bool)

(assert (=> (not b_lambda!21435) (not b!1207601)))

(assert (=> b!1207601 t!39537))

(declare-fun b_and!42947 () Bool)

(assert (= b_and!42945 (and (=> t!39537 result!22105) b_and!42947)))

(declare-fun m!1112791 () Bool)

(assert (=> b!1207598 m!1112791))

(assert (=> b!1207598 m!1112791))

(declare-fun m!1112793 () Bool)

(assert (=> b!1207598 m!1112793))

(declare-fun m!1112795 () Bool)

(assert (=> b!1207590 m!1112795))

(declare-fun m!1112797 () Bool)

(assert (=> b!1207596 m!1112797))

(assert (=> bm!58974 m!1112795))

(assert (=> b!1207593 m!1112791))

(assert (=> b!1207593 m!1112791))

(declare-fun m!1112799 () Bool)

(assert (=> b!1207593 m!1112799))

(assert (=> b!1207601 m!1112155))

(assert (=> b!1207601 m!1112791))

(declare-fun m!1112801 () Bool)

(assert (=> b!1207601 m!1112801))

(declare-fun m!1112803 () Bool)

(assert (=> b!1207601 m!1112803))

(assert (=> b!1207601 m!1112791))

(assert (=> b!1207601 m!1112803))

(assert (=> b!1207601 m!1112155))

(declare-fun m!1112805 () Bool)

(assert (=> b!1207601 m!1112805))

(declare-fun m!1112807 () Bool)

(assert (=> d!132937 m!1112807))

(assert (=> d!132937 m!1112127))

(declare-fun m!1112809 () Bool)

(assert (=> b!1207599 m!1112809))

(assert (=> b!1207591 m!1112791))

(assert (=> b!1207591 m!1112791))

(assert (=> b!1207591 m!1112799))

(assert (=> b!1207597 m!1112155))

(declare-fun m!1112811 () Bool)

(assert (=> b!1207597 m!1112811))

(declare-fun m!1112813 () Bool)

(assert (=> b!1207597 m!1112813))

(assert (=> b!1207597 m!1112803))

(assert (=> b!1207597 m!1112791))

(assert (=> b!1207597 m!1112803))

(assert (=> b!1207597 m!1112155))

(assert (=> b!1207597 m!1112805))

(declare-fun m!1112815 () Bool)

(assert (=> b!1207597 m!1112815))

(declare-fun m!1112817 () Bool)

(assert (=> b!1207597 m!1112817))

(assert (=> b!1207597 m!1112815))

(assert (=> bm!58943 d!132937))

(declare-fun d!132939 () Bool)

(assert (=> d!132939 (= (apply!958 lt!547642 (select (arr!37654 _keys!1208) from!1455)) (get!19208 (getValueByKey!638 (toList!8911 lt!547642) (select (arr!37654 _keys!1208) from!1455))))))

(declare-fun bs!34111 () Bool)

(assert (= bs!34111 d!132939))

(assert (=> bs!34111 m!1112171))

(assert (=> bs!34111 m!1112737))

(assert (=> bs!34111 m!1112737))

(declare-fun m!1112819 () Bool)

(assert (=> bs!34111 m!1112819))

(assert (=> b!1207303 d!132939))

(declare-fun d!132941 () Bool)

(declare-fun c!118713 () Bool)

(assert (=> d!132941 (= c!118713 ((_ is ValueCellFull!14624) (select (arr!37655 _values!996) from!1455)))))

(declare-fun e!685797 () V!46017)

(assert (=> d!132941 (= (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685797)))

(declare-fun b!1207602 () Bool)

(assert (=> b!1207602 (= e!685797 (get!19209 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207603 () Bool)

(assert (=> b!1207603 (= e!685797 (get!19210 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132941 c!118713) b!1207602))

(assert (= (and d!132941 (not c!118713)) b!1207603))

(assert (=> b!1207602 m!1112365))

(assert (=> b!1207602 m!1112155))

(declare-fun m!1112821 () Bool)

(assert (=> b!1207602 m!1112821))

(assert (=> b!1207603 m!1112365))

(assert (=> b!1207603 m!1112155))

(declare-fun m!1112823 () Bool)

(assert (=> b!1207603 m!1112823))

(assert (=> b!1207303 d!132941))

(declare-fun d!132943 () Bool)

(declare-fun lt!547813 () ListLongMap!17791)

(assert (=> d!132943 (not (contains!6910 lt!547813 k0!934))))

(assert (=> d!132943 (= lt!547813 (ListLongMap!17792 (removeStrictlySorted!98 (toList!8911 call!58954) k0!934)))))

(assert (=> d!132943 (= (-!1796 call!58954 k0!934) lt!547813)))

(declare-fun bs!34112 () Bool)

(assert (= bs!34112 d!132943))

(declare-fun m!1112825 () Bool)

(assert (=> bs!34112 m!1112825))

(declare-fun m!1112827 () Bool)

(assert (=> bs!34112 m!1112827))

(assert (=> b!1207315 d!132943))

(assert (=> d!132833 d!132831))

(declare-fun d!132945 () Bool)

(assert (=> d!132945 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26602)))

(assert (=> d!132945 true))

(declare-fun _$71!186 () Unit!39849)

(assert (=> d!132945 (= (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455) _$71!186)))

(declare-fun bs!34113 () Bool)

(assert (= bs!34113 d!132945))

(assert (=> bs!34113 m!1112161))

(assert (=> d!132833 d!132945))

(declare-fun d!132947 () Bool)

(declare-fun res!802850 () Bool)

(declare-fun e!685800 () Bool)

(assert (=> d!132947 (=> res!802850 e!685800)))

(assert (=> d!132947 (= res!802850 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(assert (=> d!132947 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118605 (Cons!26601 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) Nil!26602) Nil!26602)) e!685800)))

(declare-fun call!58978 () Bool)

(declare-fun c!118714 () Bool)

(declare-fun bm!58975 () Bool)

(assert (=> bm!58975 (= call!58978 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118714 (Cons!26601 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!118605 (Cons!26601 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) Nil!26602) Nil!26602)) (ite c!118605 (Cons!26601 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) Nil!26602) Nil!26602))))))

(declare-fun b!1207604 () Bool)

(declare-fun e!685799 () Bool)

(assert (=> b!1207604 (= e!685799 call!58978)))

(declare-fun b!1207605 () Bool)

(assert (=> b!1207605 (= e!685799 call!58978)))

(declare-fun b!1207606 () Bool)

(declare-fun e!685801 () Bool)

(assert (=> b!1207606 (= e!685801 e!685799)))

(assert (=> b!1207606 (= c!118714 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207607 () Bool)

(assert (=> b!1207607 (= e!685800 e!685801)))

(declare-fun res!802852 () Bool)

(assert (=> b!1207607 (=> (not res!802852) (not e!685801))))

(declare-fun e!685798 () Bool)

(assert (=> b!1207607 (= res!802852 (not e!685798))))

(declare-fun res!802851 () Bool)

(assert (=> b!1207607 (=> (not res!802851) (not e!685798))))

(assert (=> b!1207607 (= res!802851 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207608 () Bool)

(assert (=> b!1207608 (= e!685798 (contains!6913 (ite c!118605 (Cons!26601 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) Nil!26602) Nil!26602) (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!132947 (not res!802850)) b!1207607))

(assert (= (and b!1207607 res!802851) b!1207608))

(assert (= (and b!1207607 res!802852) b!1207606))

(assert (= (and b!1207606 c!118714) b!1207605))

(assert (= (and b!1207606 (not c!118714)) b!1207604))

(assert (= (or b!1207605 b!1207604) bm!58975))

(assert (=> bm!58975 m!1112769))

(declare-fun m!1112829 () Bool)

(assert (=> bm!58975 m!1112829))

(assert (=> b!1207606 m!1112769))

(assert (=> b!1207606 m!1112769))

(declare-fun m!1112831 () Bool)

(assert (=> b!1207606 m!1112831))

(assert (=> b!1207607 m!1112769))

(assert (=> b!1207607 m!1112769))

(assert (=> b!1207607 m!1112831))

(assert (=> b!1207608 m!1112769))

(assert (=> b!1207608 m!1112769))

(declare-fun m!1112833 () Bool)

(assert (=> b!1207608 m!1112833))

(assert (=> bm!58937 d!132947))

(declare-fun b!1207612 () Bool)

(declare-fun e!685803 () Option!689)

(assert (=> b!1207612 (= e!685803 None!687)))

(declare-fun b!1207609 () Bool)

(declare-fun e!685802 () Option!689)

(assert (=> b!1207609 (= e!685802 (Some!688 (_2!9922 (h!27809 (toList!8911 lt!547676)))))))

(declare-fun d!132949 () Bool)

(declare-fun c!118715 () Bool)

(assert (=> d!132949 (= c!118715 (and ((_ is Cons!26600) (toList!8911 lt!547676)) (= (_1!9922 (h!27809 (toList!8911 lt!547676))) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!132949 (= (getValueByKey!638 (toList!8911 lt!547676) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) e!685802)))

(declare-fun b!1207611 () Bool)

(assert (=> b!1207611 (= e!685803 (getValueByKey!638 (t!39538 (toList!8911 lt!547676)) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207610 () Bool)

(assert (=> b!1207610 (= e!685802 e!685803)))

(declare-fun c!118716 () Bool)

(assert (=> b!1207610 (= c!118716 (and ((_ is Cons!26600) (toList!8911 lt!547676)) (not (= (_1!9922 (h!27809 (toList!8911 lt!547676))) (_1!9922 (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(assert (= (and d!132949 c!118715) b!1207609))

(assert (= (and d!132949 (not c!118715)) b!1207610))

(assert (= (and b!1207610 c!118716) b!1207611))

(assert (= (and b!1207610 (not c!118716)) b!1207612))

(declare-fun m!1112835 () Bool)

(assert (=> b!1207611 m!1112835))

(assert (=> b!1207346 d!132949))

(declare-fun d!132951 () Bool)

(assert (=> d!132951 (= (validKeyInArray!0 (select (arr!37654 lt!547511) from!1455)) (and (not (= (select (arr!37654 lt!547511) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37654 lt!547511) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207281 d!132951))

(declare-fun call!58979 () ListLongMap!17791)

(declare-fun bm!58976 () Bool)

(assert (=> bm!58976 (= call!58979 (getCurrentListMapNoExtraKeys!5354 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)) (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207613 () Bool)

(declare-fun e!685808 () Bool)

(declare-fun lt!547818 () ListLongMap!17791)

(assert (=> b!1207613 (= e!685808 (= lt!547818 (getCurrentListMapNoExtraKeys!5354 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)) (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207614 () Bool)

(declare-fun e!685806 () ListLongMap!17791)

(declare-fun e!685810 () ListLongMap!17791)

(assert (=> b!1207614 (= e!685806 e!685810)))

(declare-fun c!118720 () Bool)

(assert (=> b!1207614 (= c!118720 (validKeyInArray!0 (select (arr!37654 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207615 () Bool)

(declare-fun e!685807 () Bool)

(assert (=> b!1207615 (= e!685807 e!685808)))

(declare-fun c!118719 () Bool)

(assert (=> b!1207615 (= c!118719 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))))

(declare-fun b!1207616 () Bool)

(declare-fun e!685809 () Bool)

(assert (=> b!1207616 (= e!685809 (validKeyInArray!0 (select (arr!37654 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207616 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1207617 () Bool)

(assert (=> b!1207617 (= e!685810 call!58979)))

(declare-fun b!1207618 () Bool)

(declare-fun e!685804 () Bool)

(assert (=> b!1207618 (= e!685804 e!685807)))

(declare-fun c!118718 () Bool)

(assert (=> b!1207618 (= c!118718 e!685809)))

(declare-fun res!802855 () Bool)

(assert (=> b!1207618 (=> (not res!802855) (not e!685809))))

(assert (=> b!1207618 (= res!802855 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))))

(declare-fun b!1207619 () Bool)

(assert (=> b!1207619 (= e!685808 (isEmpty!992 lt!547818))))

(declare-fun b!1207620 () Bool)

(declare-fun lt!547817 () Unit!39849)

(declare-fun lt!547814 () Unit!39849)

(assert (=> b!1207620 (= lt!547817 lt!547814)))

(declare-fun lt!547819 () (_ BitVec 64))

(declare-fun lt!547816 () V!46017)

(declare-fun lt!547820 () (_ BitVec 64))

(declare-fun lt!547815 () ListLongMap!17791)

(assert (=> b!1207620 (not (contains!6910 (+!4038 lt!547815 (tuple2!19823 lt!547820 lt!547816)) lt!547819))))

(assert (=> b!1207620 (= lt!547814 (addStillNotContains!294 lt!547815 lt!547820 lt!547816 lt!547819))))

(assert (=> b!1207620 (= lt!547819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207620 (= lt!547816 (get!19207 (select (arr!37655 (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207620 (= lt!547820 (select (arr!37654 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1207620 (= lt!547815 call!58979)))

(assert (=> b!1207620 (= e!685810 (+!4038 call!58979 (tuple2!19823 (select (arr!37654 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207621 () Bool)

(declare-fun e!685805 () Bool)

(assert (=> b!1207621 (= e!685807 e!685805)))

(assert (=> b!1207621 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))))

(declare-fun res!802854 () Bool)

(assert (=> b!1207621 (= res!802854 (contains!6910 lt!547818 (select (arr!37654 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207621 (=> (not res!802854) (not e!685805))))

(declare-fun b!1207622 () Bool)

(declare-fun res!802856 () Bool)

(assert (=> b!1207622 (=> (not res!802856) (not e!685804))))

(assert (=> b!1207622 (= res!802856 (not (contains!6910 lt!547818 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207623 () Bool)

(assert (=> b!1207623 (= e!685806 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207624 () Bool)

(assert (=> b!1207624 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))))

(assert (=> b!1207624 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38193 (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)))))))

(assert (=> b!1207624 (= e!685805 (= (apply!958 lt!547818 (select (arr!37654 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19207 (select (arr!37655 (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132953 () Bool)

(assert (=> d!132953 e!685804))

(declare-fun res!802853 () Bool)

(assert (=> d!132953 (=> (not res!802853) (not e!685804))))

(assert (=> d!132953 (= res!802853 (not (contains!6910 lt!547818 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132953 (= lt!547818 e!685806)))

(declare-fun c!118717 () Bool)

(assert (=> d!132953 (= c!118717 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))))

(assert (=> d!132953 (validMask!0 mask!1564)))

(assert (=> d!132953 (= (getCurrentListMapNoExtraKeys!5354 (array!78029 (store (arr!37654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)) (array!78031 (store (arr!37655 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547818)))

(assert (= (and d!132953 c!118717) b!1207623))

(assert (= (and d!132953 (not c!118717)) b!1207614))

(assert (= (and b!1207614 c!118720) b!1207620))

(assert (= (and b!1207614 (not c!118720)) b!1207617))

(assert (= (or b!1207620 b!1207617) bm!58976))

(assert (= (and d!132953 res!802853) b!1207622))

(assert (= (and b!1207622 res!802856) b!1207618))

(assert (= (and b!1207618 res!802855) b!1207616))

(assert (= (and b!1207618 c!118718) b!1207621))

(assert (= (and b!1207618 (not c!118718)) b!1207615))

(assert (= (and b!1207621 res!802854) b!1207624))

(assert (= (and b!1207615 c!118719) b!1207613))

(assert (= (and b!1207615 (not c!118719)) b!1207619))

(declare-fun b_lambda!21437 () Bool)

(assert (=> (not b_lambda!21437) (not b!1207620)))

(assert (=> b!1207620 t!39537))

(declare-fun b_and!42949 () Bool)

(assert (= b_and!42947 (and (=> t!39537 result!22105) b_and!42949)))

(declare-fun b_lambda!21439 () Bool)

(assert (=> (not b_lambda!21439) (not b!1207624)))

(assert (=> b!1207624 t!39537))

(declare-fun b_and!42951 () Bool)

(assert (= b_and!42949 (and (=> t!39537 result!22105) b_and!42951)))

(declare-fun m!1112837 () Bool)

(assert (=> b!1207621 m!1112837))

(assert (=> b!1207621 m!1112837))

(declare-fun m!1112839 () Bool)

(assert (=> b!1207621 m!1112839))

(declare-fun m!1112841 () Bool)

(assert (=> b!1207613 m!1112841))

(declare-fun m!1112843 () Bool)

(assert (=> b!1207619 m!1112843))

(assert (=> bm!58976 m!1112841))

(assert (=> b!1207616 m!1112837))

(assert (=> b!1207616 m!1112837))

(declare-fun m!1112845 () Bool)

(assert (=> b!1207616 m!1112845))

(assert (=> b!1207624 m!1112155))

(assert (=> b!1207624 m!1112837))

(declare-fun m!1112847 () Bool)

(assert (=> b!1207624 m!1112847))

(declare-fun m!1112849 () Bool)

(assert (=> b!1207624 m!1112849))

(assert (=> b!1207624 m!1112837))

(assert (=> b!1207624 m!1112849))

(assert (=> b!1207624 m!1112155))

(declare-fun m!1112851 () Bool)

(assert (=> b!1207624 m!1112851))

(declare-fun m!1112853 () Bool)

(assert (=> d!132953 m!1112853))

(assert (=> d!132953 m!1112127))

(declare-fun m!1112855 () Bool)

(assert (=> b!1207622 m!1112855))

(assert (=> b!1207614 m!1112837))

(assert (=> b!1207614 m!1112837))

(assert (=> b!1207614 m!1112845))

(assert (=> b!1207620 m!1112155))

(declare-fun m!1112857 () Bool)

(assert (=> b!1207620 m!1112857))

(declare-fun m!1112859 () Bool)

(assert (=> b!1207620 m!1112859))

(assert (=> b!1207620 m!1112849))

(assert (=> b!1207620 m!1112837))

(assert (=> b!1207620 m!1112849))

(assert (=> b!1207620 m!1112155))

(assert (=> b!1207620 m!1112851))

(declare-fun m!1112861 () Bool)

(assert (=> b!1207620 m!1112861))

(declare-fun m!1112863 () Bool)

(assert (=> b!1207620 m!1112863))

(assert (=> b!1207620 m!1112861))

(assert (=> bm!58951 d!132953))

(assert (=> b!1207283 d!132951))

(declare-fun d!132955 () Bool)

(assert (=> d!132955 (= (isEmpty!992 lt!547658) (isEmpty!994 (toList!8911 lt!547658)))))

(declare-fun bs!34114 () Bool)

(assert (= bs!34114 d!132955))

(declare-fun m!1112865 () Bool)

(assert (=> bs!34114 m!1112865))

(assert (=> b!1207324 d!132955))

(declare-fun d!132957 () Bool)

(assert (=> d!132957 (= (validKeyInArray!0 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207242 d!132957))

(declare-fun d!132959 () Bool)

(declare-fun res!802857 () Bool)

(declare-fun e!685811 () Bool)

(assert (=> d!132959 (=> res!802857 e!685811)))

(assert (=> d!132959 (= res!802857 (and ((_ is Cons!26600) (toList!8911 call!58882)) (= (_1!9922 (h!27809 (toList!8911 call!58882))) k0!934)))))

(assert (=> d!132959 (= (containsKey!592 (toList!8911 call!58882) k0!934) e!685811)))

(declare-fun b!1207625 () Bool)

(declare-fun e!685812 () Bool)

(assert (=> b!1207625 (= e!685811 e!685812)))

(declare-fun res!802858 () Bool)

(assert (=> b!1207625 (=> (not res!802858) (not e!685812))))

(assert (=> b!1207625 (= res!802858 (and (or (not ((_ is Cons!26600) (toList!8911 call!58882))) (bvsle (_1!9922 (h!27809 (toList!8911 call!58882))) k0!934)) ((_ is Cons!26600) (toList!8911 call!58882)) (bvslt (_1!9922 (h!27809 (toList!8911 call!58882))) k0!934)))))

(declare-fun b!1207626 () Bool)

(assert (=> b!1207626 (= e!685812 (containsKey!592 (t!39538 (toList!8911 call!58882)) k0!934))))

(assert (= (and d!132959 (not res!802857)) b!1207625))

(assert (= (and b!1207625 res!802858) b!1207626))

(declare-fun m!1112867 () Bool)

(assert (=> b!1207626 m!1112867))

(assert (=> d!132849 d!132959))

(assert (=> b!1207305 d!132957))

(declare-fun d!132961 () Bool)

(declare-fun e!685814 () Bool)

(assert (=> d!132961 e!685814))

(declare-fun res!802859 () Bool)

(assert (=> d!132961 (=> res!802859 e!685814)))

(declare-fun lt!547822 () Bool)

(assert (=> d!132961 (= res!802859 (not lt!547822))))

(declare-fun lt!547823 () Bool)

(assert (=> d!132961 (= lt!547822 lt!547823)))

(declare-fun lt!547821 () Unit!39849)

(declare-fun e!685813 () Unit!39849)

(assert (=> d!132961 (= lt!547821 e!685813)))

(declare-fun c!118721 () Bool)

(assert (=> d!132961 (= c!118721 lt!547823)))

(assert (=> d!132961 (= lt!547823 (containsKey!592 (toList!8911 lt!547658) (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132961 (= (contains!6910 lt!547658 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))) lt!547822)))

(declare-fun b!1207627 () Bool)

(declare-fun lt!547824 () Unit!39849)

(assert (=> b!1207627 (= e!685813 lt!547824)))

(assert (=> b!1207627 (= lt!547824 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547658) (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207627 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547658) (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207628 () Bool)

(declare-fun Unit!39869 () Unit!39849)

(assert (=> b!1207628 (= e!685813 Unit!39869)))

(declare-fun b!1207629 () Bool)

(assert (=> b!1207629 (= e!685814 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547658) (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132961 c!118721) b!1207627))

(assert (= (and d!132961 (not c!118721)) b!1207628))

(assert (= (and d!132961 (not res!802859)) b!1207629))

(assert (=> d!132961 m!1112403))

(declare-fun m!1112869 () Bool)

(assert (=> d!132961 m!1112869))

(assert (=> b!1207627 m!1112403))

(declare-fun m!1112871 () Bool)

(assert (=> b!1207627 m!1112871))

(assert (=> b!1207627 m!1112403))

(declare-fun m!1112873 () Bool)

(assert (=> b!1207627 m!1112873))

(assert (=> b!1207627 m!1112873))

(declare-fun m!1112875 () Bool)

(assert (=> b!1207627 m!1112875))

(assert (=> b!1207629 m!1112403))

(assert (=> b!1207629 m!1112873))

(assert (=> b!1207629 m!1112873))

(assert (=> b!1207629 m!1112875))

(assert (=> b!1207326 d!132961))

(declare-fun bm!58977 () Bool)

(declare-fun call!58980 () ListLongMap!17791)

(assert (=> bm!58977 (= call!58980 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun lt!547829 () ListLongMap!17791)

(declare-fun b!1207630 () Bool)

(declare-fun e!685819 () Bool)

(assert (=> b!1207630 (= e!685819 (= lt!547829 (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207631 () Bool)

(declare-fun e!685817 () ListLongMap!17791)

(declare-fun e!685821 () ListLongMap!17791)

(assert (=> b!1207631 (= e!685817 e!685821)))

(declare-fun c!118725 () Bool)

(assert (=> b!1207631 (= c!118725 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1207632 () Bool)

(declare-fun e!685818 () Bool)

(assert (=> b!1207632 (= e!685818 e!685819)))

(declare-fun c!118724 () Bool)

(assert (=> b!1207632 (= c!118724 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207633 () Bool)

(declare-fun e!685820 () Bool)

(assert (=> b!1207633 (= e!685820 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207633 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1207634 () Bool)

(assert (=> b!1207634 (= e!685821 call!58980)))

(declare-fun b!1207635 () Bool)

(declare-fun e!685815 () Bool)

(assert (=> b!1207635 (= e!685815 e!685818)))

(declare-fun c!118723 () Bool)

(assert (=> b!1207635 (= c!118723 e!685820)))

(declare-fun res!802862 () Bool)

(assert (=> b!1207635 (=> (not res!802862) (not e!685820))))

(assert (=> b!1207635 (= res!802862 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207636 () Bool)

(assert (=> b!1207636 (= e!685819 (isEmpty!992 lt!547829))))

(declare-fun b!1207637 () Bool)

(declare-fun lt!547828 () Unit!39849)

(declare-fun lt!547825 () Unit!39849)

(assert (=> b!1207637 (= lt!547828 lt!547825)))

(declare-fun lt!547830 () (_ BitVec 64))

(declare-fun lt!547826 () ListLongMap!17791)

(declare-fun lt!547831 () (_ BitVec 64))

(declare-fun lt!547827 () V!46017)

(assert (=> b!1207637 (not (contains!6910 (+!4038 lt!547826 (tuple2!19823 lt!547831 lt!547827)) lt!547830))))

(assert (=> b!1207637 (= lt!547825 (addStillNotContains!294 lt!547826 lt!547831 lt!547827 lt!547830))))

(assert (=> b!1207637 (= lt!547830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207637 (= lt!547827 (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207637 (= lt!547831 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1207637 (= lt!547826 call!58980)))

(assert (=> b!1207637 (= e!685821 (+!4038 call!58980 (tuple2!19823 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207638 () Bool)

(declare-fun e!685816 () Bool)

(assert (=> b!1207638 (= e!685818 e!685816)))

(assert (=> b!1207638 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun res!802861 () Bool)

(assert (=> b!1207638 (= res!802861 (contains!6910 lt!547829 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1207638 (=> (not res!802861) (not e!685816))))

(declare-fun b!1207639 () Bool)

(declare-fun res!802863 () Bool)

(assert (=> b!1207639 (=> (not res!802863) (not e!685815))))

(assert (=> b!1207639 (= res!802863 (not (contains!6910 lt!547829 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207640 () Bool)

(assert (=> b!1207640 (= e!685817 (ListLongMap!17792 Nil!26601))))

(declare-fun b!1207641 () Bool)

(assert (=> b!1207641 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(assert (=> b!1207641 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38193 _values!996)))))

(assert (=> b!1207641 (= e!685816 (= (apply!958 lt!547829 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19207 (select (arr!37655 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132963 () Bool)

(assert (=> d!132963 e!685815))

(declare-fun res!802860 () Bool)

(assert (=> d!132963 (=> (not res!802860) (not e!685815))))

(assert (=> d!132963 (= res!802860 (not (contains!6910 lt!547829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132963 (= lt!547829 e!685817)))

(declare-fun c!118722 () Bool)

(assert (=> d!132963 (= c!118722 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(assert (=> d!132963 (validMask!0 mask!1564)))

(assert (=> d!132963 (= (getCurrentListMapNoExtraKeys!5354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!547829)))

(assert (= (and d!132963 c!118722) b!1207640))

(assert (= (and d!132963 (not c!118722)) b!1207631))

(assert (= (and b!1207631 c!118725) b!1207637))

(assert (= (and b!1207631 (not c!118725)) b!1207634))

(assert (= (or b!1207637 b!1207634) bm!58977))

(assert (= (and d!132963 res!802860) b!1207639))

(assert (= (and b!1207639 res!802863) b!1207635))

(assert (= (and b!1207635 res!802862) b!1207633))

(assert (= (and b!1207635 c!118723) b!1207638))

(assert (= (and b!1207635 (not c!118723)) b!1207632))

(assert (= (and b!1207638 res!802861) b!1207641))

(assert (= (and b!1207632 c!118724) b!1207630))

(assert (= (and b!1207632 (not c!118724)) b!1207636))

(declare-fun b_lambda!21441 () Bool)

(assert (=> (not b_lambda!21441) (not b!1207637)))

(assert (=> b!1207637 t!39537))

(declare-fun b_and!42953 () Bool)

(assert (= b_and!42951 (and (=> t!39537 result!22105) b_and!42953)))

(declare-fun b_lambda!21443 () Bool)

(assert (=> (not b_lambda!21443) (not b!1207641)))

(assert (=> b!1207641 t!39537))

(declare-fun b_and!42955 () Bool)

(assert (= b_and!42953 (and (=> t!39537 result!22105) b_and!42955)))

(declare-fun m!1112877 () Bool)

(assert (=> b!1207638 m!1112877))

(assert (=> b!1207638 m!1112877))

(declare-fun m!1112879 () Bool)

(assert (=> b!1207638 m!1112879))

(declare-fun m!1112881 () Bool)

(assert (=> b!1207630 m!1112881))

(declare-fun m!1112883 () Bool)

(assert (=> b!1207636 m!1112883))

(assert (=> bm!58977 m!1112881))

(assert (=> b!1207633 m!1112877))

(assert (=> b!1207633 m!1112877))

(declare-fun m!1112885 () Bool)

(assert (=> b!1207633 m!1112885))

(assert (=> b!1207641 m!1112155))

(assert (=> b!1207641 m!1112877))

(declare-fun m!1112887 () Bool)

(assert (=> b!1207641 m!1112887))

(declare-fun m!1112889 () Bool)

(assert (=> b!1207641 m!1112889))

(assert (=> b!1207641 m!1112877))

(assert (=> b!1207641 m!1112889))

(assert (=> b!1207641 m!1112155))

(declare-fun m!1112891 () Bool)

(assert (=> b!1207641 m!1112891))

(declare-fun m!1112893 () Bool)

(assert (=> d!132963 m!1112893))

(assert (=> d!132963 m!1112127))

(declare-fun m!1112895 () Bool)

(assert (=> b!1207639 m!1112895))

(assert (=> b!1207631 m!1112877))

(assert (=> b!1207631 m!1112877))

(assert (=> b!1207631 m!1112885))

(assert (=> b!1207637 m!1112155))

(declare-fun m!1112897 () Bool)

(assert (=> b!1207637 m!1112897))

(declare-fun m!1112899 () Bool)

(assert (=> b!1207637 m!1112899))

(assert (=> b!1207637 m!1112889))

(assert (=> b!1207637 m!1112877))

(assert (=> b!1207637 m!1112889))

(assert (=> b!1207637 m!1112155))

(assert (=> b!1207637 m!1112891))

(declare-fun m!1112901 () Bool)

(assert (=> b!1207637 m!1112901))

(declare-fun m!1112903 () Bool)

(assert (=> b!1207637 m!1112903))

(assert (=> b!1207637 m!1112901))

(assert (=> bm!58953 d!132963))

(declare-fun d!132965 () Bool)

(declare-fun e!685823 () Bool)

(assert (=> d!132965 e!685823))

(declare-fun res!802864 () Bool)

(assert (=> d!132965 (=> res!802864 e!685823)))

(declare-fun lt!547833 () Bool)

(assert (=> d!132965 (= res!802864 (not lt!547833))))

(declare-fun lt!547834 () Bool)

(assert (=> d!132965 (= lt!547833 lt!547834)))

(declare-fun lt!547832 () Unit!39849)

(declare-fun e!685822 () Unit!39849)

(assert (=> d!132965 (= lt!547832 e!685822)))

(declare-fun c!118726 () Bool)

(assert (=> d!132965 (= c!118726 lt!547834)))

(assert (=> d!132965 (= lt!547834 (containsKey!592 (toList!8911 lt!547706) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132965 (= (contains!6910 lt!547706 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!547833)))

(declare-fun b!1207642 () Bool)

(declare-fun lt!547835 () Unit!39849)

(assert (=> b!1207642 (= e!685822 lt!547835)))

(assert (=> b!1207642 (= lt!547835 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547706) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> b!1207642 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547706) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1207643 () Bool)

(declare-fun Unit!39870 () Unit!39849)

(assert (=> b!1207643 (= e!685822 Unit!39870)))

(declare-fun b!1207644 () Bool)

(assert (=> b!1207644 (= e!685823 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547706) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (= (and d!132965 c!118726) b!1207642))

(assert (= (and d!132965 (not c!118726)) b!1207643))

(assert (= (and d!132965 (not res!802864)) b!1207644))

(declare-fun m!1112905 () Bool)

(assert (=> d!132965 m!1112905))

(declare-fun m!1112907 () Bool)

(assert (=> b!1207642 m!1112907))

(assert (=> b!1207642 m!1112513))

(assert (=> b!1207642 m!1112513))

(declare-fun m!1112909 () Bool)

(assert (=> b!1207642 m!1112909))

(assert (=> b!1207644 m!1112513))

(assert (=> b!1207644 m!1112513))

(assert (=> b!1207644 m!1112909))

(assert (=> d!132847 d!132965))

(declare-fun b!1207648 () Bool)

(declare-fun e!685825 () Option!689)

(assert (=> b!1207648 (= e!685825 None!687)))

(declare-fun b!1207645 () Bool)

(declare-fun e!685824 () Option!689)

(assert (=> b!1207645 (= e!685824 (Some!688 (_2!9922 (h!27809 lt!547707))))))

(declare-fun d!132967 () Bool)

(declare-fun c!118727 () Bool)

(assert (=> d!132967 (= c!118727 (and ((_ is Cons!26600) lt!547707) (= (_1!9922 (h!27809 lt!547707)) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!132967 (= (getValueByKey!638 lt!547707 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) e!685824)))

(declare-fun b!1207647 () Bool)

(assert (=> b!1207647 (= e!685825 (getValueByKey!638 (t!39538 lt!547707) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1207646 () Bool)

(assert (=> b!1207646 (= e!685824 e!685825)))

(declare-fun c!118728 () Bool)

(assert (=> b!1207646 (= c!118728 (and ((_ is Cons!26600) lt!547707) (not (= (_1!9922 (h!27809 lt!547707)) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(assert (= (and d!132967 c!118727) b!1207645))

(assert (= (and d!132967 (not c!118727)) b!1207646))

(assert (= (and b!1207646 c!118728) b!1207647))

(assert (= (and b!1207646 (not c!118728)) b!1207648))

(declare-fun m!1112911 () Bool)

(assert (=> b!1207647 m!1112911))

(assert (=> d!132847 d!132967))

(declare-fun d!132969 () Bool)

(assert (=> d!132969 (= (getValueByKey!638 lt!547707 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!688 (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!547836 () Unit!39849)

(assert (=> d!132969 (= lt!547836 (choose!1812 lt!547707 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun e!685826 () Bool)

(assert (=> d!132969 e!685826))

(declare-fun res!802865 () Bool)

(assert (=> d!132969 (=> (not res!802865) (not e!685826))))

(assert (=> d!132969 (= res!802865 (isStrictlySorted!725 lt!547707))))

(assert (=> d!132969 (= (lemmaContainsTupThenGetReturnValue!314 lt!547707 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!547836)))

(declare-fun b!1207649 () Bool)

(declare-fun res!802866 () Bool)

(assert (=> b!1207649 (=> (not res!802866) (not e!685826))))

(assert (=> b!1207649 (= res!802866 (containsKey!592 lt!547707 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1207650 () Bool)

(assert (=> b!1207650 (= e!685826 (contains!6914 lt!547707 (tuple2!19823 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (= (and d!132969 res!802865) b!1207649))

(assert (= (and b!1207649 res!802866) b!1207650))

(assert (=> d!132969 m!1112507))

(declare-fun m!1112913 () Bool)

(assert (=> d!132969 m!1112913))

(declare-fun m!1112915 () Bool)

(assert (=> d!132969 m!1112915))

(declare-fun m!1112917 () Bool)

(assert (=> b!1207649 m!1112917))

(declare-fun m!1112919 () Bool)

(assert (=> b!1207650 m!1112919))

(assert (=> d!132847 d!132969))

(declare-fun b!1207651 () Bool)

(declare-fun e!685831 () List!26604)

(declare-fun e!685830 () List!26604)

(assert (=> b!1207651 (= e!685831 e!685830)))

(declare-fun c!118731 () Bool)

(assert (=> b!1207651 (= c!118731 (and ((_ is Cons!26600) (toList!8911 lt!547503)) (= (_1!9922 (h!27809 (toList!8911 lt!547503))) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1207652 () Bool)

(declare-fun call!58983 () List!26604)

(assert (=> b!1207652 (= e!685831 call!58983)))

(declare-fun bm!58978 () Bool)

(declare-fun call!58982 () List!26604)

(declare-fun call!58981 () List!26604)

(assert (=> bm!58978 (= call!58982 call!58981)))

(declare-fun b!1207653 () Bool)

(declare-fun res!802867 () Bool)

(declare-fun e!685829 () Bool)

(assert (=> b!1207653 (=> (not res!802867) (not e!685829))))

(declare-fun lt!547837 () List!26604)

(assert (=> b!1207653 (= res!802867 (containsKey!592 lt!547837 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1207654 () Bool)

(declare-fun c!118730 () Bool)

(assert (=> b!1207654 (= c!118730 (and ((_ is Cons!26600) (toList!8911 lt!547503)) (bvsgt (_1!9922 (h!27809 (toList!8911 lt!547503))) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun e!685827 () List!26604)

(assert (=> b!1207654 (= e!685830 e!685827)))

(declare-fun bm!58979 () Bool)

(assert (=> bm!58979 (= call!58981 call!58983)))

(declare-fun b!1207655 () Bool)

(assert (=> b!1207655 (= e!685830 call!58981)))

(declare-fun bm!58980 () Bool)

(declare-fun c!118732 () Bool)

(declare-fun e!685828 () List!26604)

(assert (=> bm!58980 (= call!58983 ($colon$colon!612 e!685828 (ite c!118732 (h!27809 (toList!8911 lt!547503)) (tuple2!19823 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(declare-fun c!118729 () Bool)

(assert (=> bm!58980 (= c!118729 c!118732)))

(declare-fun b!1207656 () Bool)

(assert (=> b!1207656 (= e!685827 call!58982)))

(declare-fun d!132971 () Bool)

(assert (=> d!132971 e!685829))

(declare-fun res!802868 () Bool)

(assert (=> d!132971 (=> (not res!802868) (not e!685829))))

(assert (=> d!132971 (= res!802868 (isStrictlySorted!725 lt!547837))))

(assert (=> d!132971 (= lt!547837 e!685831)))

(assert (=> d!132971 (= c!118732 (and ((_ is Cons!26600) (toList!8911 lt!547503)) (bvslt (_1!9922 (h!27809 (toList!8911 lt!547503))) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!132971 (isStrictlySorted!725 (toList!8911 lt!547503))))

(assert (=> d!132971 (= (insertStrictlySorted!407 (toList!8911 lt!547503) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!547837)))

(declare-fun b!1207657 () Bool)

(assert (=> b!1207657 (= e!685828 (insertStrictlySorted!407 (t!39538 (toList!8911 lt!547503)) (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1207658 () Bool)

(assert (=> b!1207658 (= e!685829 (contains!6914 lt!547837 (tuple2!19823 (_1!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9922 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1207659 () Bool)

(assert (=> b!1207659 (= e!685828 (ite c!118731 (t!39538 (toList!8911 lt!547503)) (ite c!118730 (Cons!26600 (h!27809 (toList!8911 lt!547503)) (t!39538 (toList!8911 lt!547503))) Nil!26601)))))

(declare-fun b!1207660 () Bool)

(assert (=> b!1207660 (= e!685827 call!58982)))

(assert (= (and d!132971 c!118732) b!1207652))

(assert (= (and d!132971 (not c!118732)) b!1207651))

(assert (= (and b!1207651 c!118731) b!1207655))

(assert (= (and b!1207651 (not c!118731)) b!1207654))

(assert (= (and b!1207654 c!118730) b!1207656))

(assert (= (and b!1207654 (not c!118730)) b!1207660))

(assert (= (or b!1207656 b!1207660) bm!58978))

(assert (= (or b!1207655 bm!58978) bm!58979))

(assert (= (or b!1207652 bm!58979) bm!58980))

(assert (= (and bm!58980 c!118729) b!1207657))

(assert (= (and bm!58980 (not c!118729)) b!1207659))

(assert (= (and d!132971 res!802868) b!1207653))

(assert (= (and b!1207653 res!802867) b!1207658))

(declare-fun m!1112921 () Bool)

(assert (=> b!1207658 m!1112921))

(declare-fun m!1112923 () Bool)

(assert (=> d!132971 m!1112923))

(declare-fun m!1112925 () Bool)

(assert (=> d!132971 m!1112925))

(declare-fun m!1112927 () Bool)

(assert (=> bm!58980 m!1112927))

(declare-fun m!1112929 () Bool)

(assert (=> b!1207657 m!1112929))

(declare-fun m!1112931 () Bool)

(assert (=> b!1207653 m!1112931))

(assert (=> d!132847 d!132971))

(declare-fun d!132973 () Bool)

(declare-fun e!685833 () Bool)

(assert (=> d!132973 e!685833))

(declare-fun res!802869 () Bool)

(assert (=> d!132973 (=> res!802869 e!685833)))

(declare-fun lt!547839 () Bool)

(assert (=> d!132973 (= res!802869 (not lt!547839))))

(declare-fun lt!547840 () Bool)

(assert (=> d!132973 (= lt!547839 lt!547840)))

(declare-fun lt!547838 () Unit!39849)

(declare-fun e!685832 () Unit!39849)

(assert (=> d!132973 (= lt!547838 e!685832)))

(declare-fun c!118733 () Bool)

(assert (=> d!132973 (= c!118733 lt!547840)))

(assert (=> d!132973 (= lt!547840 (containsKey!592 (toList!8911 lt!547642) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132973 (= (contains!6910 lt!547642 #b0000000000000000000000000000000000000000000000000000000000000000) lt!547839)))

(declare-fun b!1207661 () Bool)

(declare-fun lt!547841 () Unit!39849)

(assert (=> b!1207661 (= e!685832 lt!547841)))

(assert (=> b!1207661 (= lt!547841 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547642) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207661 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547642) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207662 () Bool)

(declare-fun Unit!39871 () Unit!39849)

(assert (=> b!1207662 (= e!685832 Unit!39871)))

(declare-fun b!1207663 () Bool)

(assert (=> b!1207663 (= e!685833 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547642) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132973 c!118733) b!1207661))

(assert (= (and d!132973 (not c!118733)) b!1207662))

(assert (= (and d!132973 (not res!802869)) b!1207663))

(declare-fun m!1112933 () Bool)

(assert (=> d!132973 m!1112933))

(declare-fun m!1112935 () Bool)

(assert (=> b!1207661 m!1112935))

(declare-fun m!1112937 () Bool)

(assert (=> b!1207661 m!1112937))

(assert (=> b!1207661 m!1112937))

(declare-fun m!1112939 () Bool)

(assert (=> b!1207661 m!1112939))

(assert (=> b!1207663 m!1112937))

(assert (=> b!1207663 m!1112937))

(assert (=> b!1207663 m!1112939))

(assert (=> d!132815 d!132973))

(assert (=> d!132815 d!132843))

(declare-fun d!132975 () Bool)

(declare-fun e!685834 () Bool)

(assert (=> d!132975 e!685834))

(declare-fun res!802870 () Bool)

(assert (=> d!132975 (=> (not res!802870) (not e!685834))))

(declare-fun lt!547842 () ListLongMap!17791)

(assert (=> d!132975 (= res!802870 (contains!6910 lt!547842 (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!547843 () List!26604)

(assert (=> d!132975 (= lt!547842 (ListLongMap!17792 lt!547843))))

(declare-fun lt!547844 () Unit!39849)

(declare-fun lt!547845 () Unit!39849)

(assert (=> d!132975 (= lt!547844 lt!547845)))

(assert (=> d!132975 (= (getValueByKey!638 lt!547843 (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132975 (= lt!547845 (lemmaContainsTupThenGetReturnValue!314 lt!547843 (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132975 (= lt!547843 (insertStrictlySorted!407 (toList!8911 call!58946) (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132975 (= (+!4038 call!58946 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!547842)))

(declare-fun b!1207664 () Bool)

(declare-fun res!802871 () Bool)

(assert (=> b!1207664 (=> (not res!802871) (not e!685834))))

(assert (=> b!1207664 (= res!802871 (= (getValueByKey!638 (toList!8911 lt!547842) (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207665 () Bool)

(assert (=> b!1207665 (= e!685834 (contains!6914 (toList!8911 lt!547842) (tuple2!19823 (select (arr!37654 lt!547511) from!1455) (get!19207 (select (arr!37655 lt!547510) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132975 res!802870) b!1207664))

(assert (= (and b!1207664 res!802871) b!1207665))

(declare-fun m!1112941 () Bool)

(assert (=> d!132975 m!1112941))

(declare-fun m!1112943 () Bool)

(assert (=> d!132975 m!1112943))

(declare-fun m!1112945 () Bool)

(assert (=> d!132975 m!1112945))

(declare-fun m!1112947 () Bool)

(assert (=> d!132975 m!1112947))

(declare-fun m!1112949 () Bool)

(assert (=> b!1207664 m!1112949))

(declare-fun m!1112951 () Bool)

(assert (=> b!1207665 m!1112951))

(assert (=> b!1207287 d!132975))

(declare-fun d!132977 () Bool)

(assert (=> d!132977 (not (contains!6910 (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633)) lt!547636))))

(declare-fun lt!547846 () Unit!39849)

(assert (=> d!132977 (= lt!547846 (choose!1813 lt!547632 lt!547637 lt!547633 lt!547636))))

(declare-fun e!685835 () Bool)

(assert (=> d!132977 e!685835))

(declare-fun res!802872 () Bool)

(assert (=> d!132977 (=> (not res!802872) (not e!685835))))

(assert (=> d!132977 (= res!802872 (not (contains!6910 lt!547632 lt!547636)))))

(assert (=> d!132977 (= (addStillNotContains!294 lt!547632 lt!547637 lt!547633 lt!547636) lt!547846)))

(declare-fun b!1207666 () Bool)

(assert (=> b!1207666 (= e!685835 (not (= lt!547637 lt!547636)))))

(assert (= (and d!132977 res!802872) b!1207666))

(assert (=> d!132977 m!1112351))

(assert (=> d!132977 m!1112351))

(assert (=> d!132977 m!1112353))

(declare-fun m!1112953 () Bool)

(assert (=> d!132977 m!1112953))

(declare-fun m!1112955 () Bool)

(assert (=> d!132977 m!1112955))

(assert (=> b!1207287 d!132977))

(declare-fun d!132979 () Bool)

(declare-fun e!685837 () Bool)

(assert (=> d!132979 e!685837))

(declare-fun res!802873 () Bool)

(assert (=> d!132979 (=> res!802873 e!685837)))

(declare-fun lt!547848 () Bool)

(assert (=> d!132979 (= res!802873 (not lt!547848))))

(declare-fun lt!547849 () Bool)

(assert (=> d!132979 (= lt!547848 lt!547849)))

(declare-fun lt!547847 () Unit!39849)

(declare-fun e!685836 () Unit!39849)

(assert (=> d!132979 (= lt!547847 e!685836)))

(declare-fun c!118734 () Bool)

(assert (=> d!132979 (= c!118734 lt!547849)))

(assert (=> d!132979 (= lt!547849 (containsKey!592 (toList!8911 (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633))) lt!547636))))

(assert (=> d!132979 (= (contains!6910 (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633)) lt!547636) lt!547848)))

(declare-fun b!1207667 () Bool)

(declare-fun lt!547850 () Unit!39849)

(assert (=> b!1207667 (= e!685836 lt!547850)))

(assert (=> b!1207667 (= lt!547850 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633))) lt!547636))))

(assert (=> b!1207667 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633))) lt!547636))))

(declare-fun b!1207668 () Bool)

(declare-fun Unit!39872 () Unit!39849)

(assert (=> b!1207668 (= e!685836 Unit!39872)))

(declare-fun b!1207669 () Bool)

(assert (=> b!1207669 (= e!685837 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633))) lt!547636)))))

(assert (= (and d!132979 c!118734) b!1207667))

(assert (= (and d!132979 (not c!118734)) b!1207668))

(assert (= (and d!132979 (not res!802873)) b!1207669))

(declare-fun m!1112957 () Bool)

(assert (=> d!132979 m!1112957))

(declare-fun m!1112959 () Bool)

(assert (=> b!1207667 m!1112959))

(declare-fun m!1112961 () Bool)

(assert (=> b!1207667 m!1112961))

(assert (=> b!1207667 m!1112961))

(declare-fun m!1112963 () Bool)

(assert (=> b!1207667 m!1112963))

(assert (=> b!1207669 m!1112961))

(assert (=> b!1207669 m!1112961))

(assert (=> b!1207669 m!1112963))

(assert (=> b!1207287 d!132979))

(declare-fun d!132981 () Bool)

(declare-fun e!685838 () Bool)

(assert (=> d!132981 e!685838))

(declare-fun res!802874 () Bool)

(assert (=> d!132981 (=> (not res!802874) (not e!685838))))

(declare-fun lt!547851 () ListLongMap!17791)

(assert (=> d!132981 (= res!802874 (contains!6910 lt!547851 (_1!9922 (tuple2!19823 lt!547637 lt!547633))))))

(declare-fun lt!547852 () List!26604)

(assert (=> d!132981 (= lt!547851 (ListLongMap!17792 lt!547852))))

(declare-fun lt!547853 () Unit!39849)

(declare-fun lt!547854 () Unit!39849)

(assert (=> d!132981 (= lt!547853 lt!547854)))

(assert (=> d!132981 (= (getValueByKey!638 lt!547852 (_1!9922 (tuple2!19823 lt!547637 lt!547633))) (Some!688 (_2!9922 (tuple2!19823 lt!547637 lt!547633))))))

(assert (=> d!132981 (= lt!547854 (lemmaContainsTupThenGetReturnValue!314 lt!547852 (_1!9922 (tuple2!19823 lt!547637 lt!547633)) (_2!9922 (tuple2!19823 lt!547637 lt!547633))))))

(assert (=> d!132981 (= lt!547852 (insertStrictlySorted!407 (toList!8911 lt!547632) (_1!9922 (tuple2!19823 lt!547637 lt!547633)) (_2!9922 (tuple2!19823 lt!547637 lt!547633))))))

(assert (=> d!132981 (= (+!4038 lt!547632 (tuple2!19823 lt!547637 lt!547633)) lt!547851)))

(declare-fun b!1207670 () Bool)

(declare-fun res!802875 () Bool)

(assert (=> b!1207670 (=> (not res!802875) (not e!685838))))

(assert (=> b!1207670 (= res!802875 (= (getValueByKey!638 (toList!8911 lt!547851) (_1!9922 (tuple2!19823 lt!547637 lt!547633))) (Some!688 (_2!9922 (tuple2!19823 lt!547637 lt!547633)))))))

(declare-fun b!1207671 () Bool)

(assert (=> b!1207671 (= e!685838 (contains!6914 (toList!8911 lt!547851) (tuple2!19823 lt!547637 lt!547633)))))

(assert (= (and d!132981 res!802874) b!1207670))

(assert (= (and b!1207670 res!802875) b!1207671))

(declare-fun m!1112965 () Bool)

(assert (=> d!132981 m!1112965))

(declare-fun m!1112967 () Bool)

(assert (=> d!132981 m!1112967))

(declare-fun m!1112969 () Bool)

(assert (=> d!132981 m!1112969))

(declare-fun m!1112971 () Bool)

(assert (=> d!132981 m!1112971))

(declare-fun m!1112973 () Bool)

(assert (=> b!1207670 m!1112973))

(declare-fun m!1112975 () Bool)

(assert (=> b!1207671 m!1112975))

(assert (=> b!1207287 d!132981))

(assert (=> b!1207287 d!132869))

(declare-fun d!132983 () Bool)

(declare-fun res!802877 () Bool)

(declare-fun e!685839 () Bool)

(assert (=> d!132983 (=> res!802877 e!685839)))

(assert (=> d!132983 (= res!802877 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(assert (=> d!132983 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!685839)))

(declare-fun b!1207672 () Bool)

(declare-fun e!685840 () Bool)

(declare-fun call!58984 () Bool)

(assert (=> b!1207672 (= e!685840 call!58984)))

(declare-fun b!1207673 () Bool)

(declare-fun e!685841 () Bool)

(assert (=> b!1207673 (= e!685839 e!685841)))

(declare-fun c!118735 () Bool)

(assert (=> b!1207673 (= c!118735 (validKeyInArray!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207674 () Bool)

(assert (=> b!1207674 (= e!685841 e!685840)))

(declare-fun lt!547855 () (_ BitVec 64))

(assert (=> b!1207674 (= lt!547855 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!547857 () Unit!39849)

(assert (=> b!1207674 (= lt!547857 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547855 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1207674 (arrayContainsKey!0 _keys!1208 lt!547855 #b00000000000000000000000000000000)))

(declare-fun lt!547856 () Unit!39849)

(assert (=> b!1207674 (= lt!547856 lt!547857)))

(declare-fun res!802876 () Bool)

(assert (=> b!1207674 (= res!802876 (= (seekEntryOrOpen!0 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9937 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1207674 (=> (not res!802876) (not e!685840))))

(declare-fun bm!58981 () Bool)

(assert (=> bm!58981 (= call!58984 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1207675 () Bool)

(assert (=> b!1207675 (= e!685841 call!58984)))

(assert (= (and d!132983 (not res!802877)) b!1207673))

(assert (= (and b!1207673 c!118735) b!1207674))

(assert (= (and b!1207673 (not c!118735)) b!1207675))

(assert (= (and b!1207674 res!802876) b!1207672))

(assert (= (or b!1207672 b!1207675) bm!58981))

(assert (=> b!1207673 m!1112769))

(assert (=> b!1207673 m!1112769))

(assert (=> b!1207673 m!1112831))

(assert (=> b!1207674 m!1112769))

(declare-fun m!1112977 () Bool)

(assert (=> b!1207674 m!1112977))

(declare-fun m!1112979 () Bool)

(assert (=> b!1207674 m!1112979))

(assert (=> b!1207674 m!1112769))

(declare-fun m!1112981 () Bool)

(assert (=> b!1207674 m!1112981))

(declare-fun m!1112983 () Bool)

(assert (=> bm!58981 m!1112983))

(assert (=> bm!58945 d!132983))

(declare-fun d!132985 () Bool)

(declare-fun e!685843 () Bool)

(assert (=> d!132985 e!685843))

(declare-fun res!802878 () Bool)

(assert (=> d!132985 (=> res!802878 e!685843)))

(declare-fun lt!547859 () Bool)

(assert (=> d!132985 (= res!802878 (not lt!547859))))

(declare-fun lt!547860 () Bool)

(assert (=> d!132985 (= lt!547859 lt!547860)))

(declare-fun lt!547858 () Unit!39849)

(declare-fun e!685842 () Unit!39849)

(assert (=> d!132985 (= lt!547858 e!685842)))

(declare-fun c!118736 () Bool)

(assert (=> d!132985 (= c!118736 lt!547860)))

(assert (=> d!132985 (= lt!547860 (containsKey!592 (toList!8911 lt!547635) (select (arr!37654 lt!547511) from!1455)))))

(assert (=> d!132985 (= (contains!6910 lt!547635 (select (arr!37654 lt!547511) from!1455)) lt!547859)))

(declare-fun b!1207676 () Bool)

(declare-fun lt!547861 () Unit!39849)

(assert (=> b!1207676 (= e!685842 lt!547861)))

(assert (=> b!1207676 (= lt!547861 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547635) (select (arr!37654 lt!547511) from!1455)))))

(assert (=> b!1207676 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547635) (select (arr!37654 lt!547511) from!1455)))))

(declare-fun b!1207677 () Bool)

(declare-fun Unit!39873 () Unit!39849)

(assert (=> b!1207677 (= e!685842 Unit!39873)))

(declare-fun b!1207678 () Bool)

(assert (=> b!1207678 (= e!685843 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547635) (select (arr!37654 lt!547511) from!1455))))))

(assert (= (and d!132985 c!118736) b!1207676))

(assert (= (and d!132985 (not c!118736)) b!1207677))

(assert (= (and d!132985 (not res!802878)) b!1207678))

(assert (=> d!132985 m!1112327))

(declare-fun m!1112985 () Bool)

(assert (=> d!132985 m!1112985))

(assert (=> b!1207676 m!1112327))

(declare-fun m!1112987 () Bool)

(assert (=> b!1207676 m!1112987))

(assert (=> b!1207676 m!1112327))

(assert (=> b!1207676 m!1112581))

(assert (=> b!1207676 m!1112581))

(declare-fun m!1112989 () Bool)

(assert (=> b!1207676 m!1112989))

(assert (=> b!1207678 m!1112327))

(assert (=> b!1207678 m!1112581))

(assert (=> b!1207678 m!1112581))

(assert (=> b!1207678 m!1112989))

(assert (=> b!1207288 d!132985))

(declare-fun d!132987 () Bool)

(assert (=> d!132987 (= (apply!958 lt!547658 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19208 (getValueByKey!638 (toList!8911 lt!547658) (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34115 () Bool)

(assert (= bs!34115 d!132987))

(assert (=> bs!34115 m!1112403))

(assert (=> bs!34115 m!1112873))

(assert (=> bs!34115 m!1112873))

(declare-fun m!1112991 () Bool)

(assert (=> bs!34115 m!1112991))

(assert (=> b!1207329 d!132987))

(declare-fun d!132989 () Bool)

(declare-fun c!118737 () Bool)

(assert (=> d!132989 (= c!118737 ((_ is ValueCellFull!14624) (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!685844 () V!46017)

(assert (=> d!132989 (= (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!685844)))

(declare-fun b!1207679 () Bool)

(assert (=> b!1207679 (= e!685844 (get!19209 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1207680 () Bool)

(assert (=> b!1207680 (= e!685844 (get!19210 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132989 c!118737) b!1207679))

(assert (= (and d!132989 (not c!118737)) b!1207680))

(assert (=> b!1207679 m!1112415))

(assert (=> b!1207679 m!1112155))

(declare-fun m!1112993 () Bool)

(assert (=> b!1207679 m!1112993))

(assert (=> b!1207680 m!1112415))

(assert (=> b!1207680 m!1112155))

(declare-fun m!1112995 () Bool)

(assert (=> b!1207680 m!1112995))

(assert (=> b!1207329 d!132989))

(assert (=> bm!58944 d!132863))

(assert (=> b!1207387 d!132873))

(assert (=> b!1207293 d!132897))

(declare-fun d!132991 () Bool)

(declare-fun e!685847 () Bool)

(assert (=> d!132991 e!685847))

(declare-fun c!118740 () Bool)

(assert (=> d!132991 (= c!118740 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!132991 true))

(declare-fun _$29!189 () Unit!39849)

(assert (=> d!132991 (= (choose!1811 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$29!189)))

(declare-fun b!1207685 () Bool)

(assert (=> b!1207685 (= e!685847 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207686 () Bool)

(assert (=> b!1207686 (= e!685847 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132991 c!118740) b!1207685))

(assert (= (and d!132991 (not c!118740)) b!1207686))

(assert (=> b!1207685 m!1112123))

(assert (=> d!132835 d!132991))

(assert (=> d!132835 d!132843))

(assert (=> b!1207295 d!132897))

(declare-fun d!132993 () Bool)

(assert (=> d!132993 (= (isEmpty!992 lt!547665) (isEmpty!994 (toList!8911 lt!547665)))))

(declare-fun bs!34116 () Bool)

(assert (= bs!34116 d!132993))

(declare-fun m!1112997 () Bool)

(assert (=> bs!34116 m!1112997))

(assert (=> b!1207336 d!132993))

(assert (=> b!1207356 d!132897))

(declare-fun d!132995 () Bool)

(declare-fun res!802879 () Bool)

(declare-fun e!685850 () Bool)

(assert (=> d!132995 (=> res!802879 e!685850)))

(assert (=> d!132995 (= res!802879 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(assert (=> d!132995 (= (arrayNoDuplicates!0 lt!547511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118646 (Cons!26601 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) Nil!26602) Nil!26602)) e!685850)))

(declare-fun call!58985 () Bool)

(declare-fun c!118741 () Bool)

(declare-fun bm!58982 () Bool)

(assert (=> bm!58982 (= call!58985 (arrayNoDuplicates!0 lt!547511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118741 (Cons!26601 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!118646 (Cons!26601 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) Nil!26602) Nil!26602)) (ite c!118646 (Cons!26601 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) Nil!26602) Nil!26602))))))

(declare-fun b!1207687 () Bool)

(declare-fun e!685849 () Bool)

(assert (=> b!1207687 (= e!685849 call!58985)))

(declare-fun b!1207688 () Bool)

(assert (=> b!1207688 (= e!685849 call!58985)))

(declare-fun b!1207689 () Bool)

(declare-fun e!685851 () Bool)

(assert (=> b!1207689 (= e!685851 e!685849)))

(assert (=> b!1207689 (= c!118741 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207690 () Bool)

(assert (=> b!1207690 (= e!685850 e!685851)))

(declare-fun res!802881 () Bool)

(assert (=> b!1207690 (=> (not res!802881) (not e!685851))))

(declare-fun e!685848 () Bool)

(assert (=> b!1207690 (= res!802881 (not e!685848))))

(declare-fun res!802880 () Bool)

(assert (=> b!1207690 (=> (not res!802880) (not e!685848))))

(assert (=> b!1207690 (= res!802880 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207691 () Bool)

(assert (=> b!1207691 (= e!685848 (contains!6913 (ite c!118646 (Cons!26601 (select (arr!37654 lt!547511) #b00000000000000000000000000000000) Nil!26602) Nil!26602) (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!132995 (not res!802879)) b!1207690))

(assert (= (and b!1207690 res!802880) b!1207691))

(assert (= (and b!1207690 res!802881) b!1207689))

(assert (= (and b!1207689 c!118741) b!1207688))

(assert (= (and b!1207689 (not c!118741)) b!1207687))

(assert (= (or b!1207688 b!1207687) bm!58982))

(declare-fun m!1112999 () Bool)

(assert (=> bm!58982 m!1112999))

(declare-fun m!1113001 () Bool)

(assert (=> bm!58982 m!1113001))

(assert (=> b!1207689 m!1112999))

(assert (=> b!1207689 m!1112999))

(declare-fun m!1113003 () Bool)

(assert (=> b!1207689 m!1113003))

(assert (=> b!1207690 m!1112999))

(assert (=> b!1207690 m!1112999))

(assert (=> b!1207690 m!1113003))

(assert (=> b!1207691 m!1112999))

(assert (=> b!1207691 m!1112999))

(declare-fun m!1113005 () Bool)

(assert (=> b!1207691 m!1113005))

(assert (=> bm!58955 d!132995))

(declare-fun d!132997 () Bool)

(declare-fun e!685853 () Bool)

(assert (=> d!132997 e!685853))

(declare-fun res!802882 () Bool)

(assert (=> d!132997 (=> res!802882 e!685853)))

(declare-fun lt!547863 () Bool)

(assert (=> d!132997 (= res!802882 (not lt!547863))))

(declare-fun lt!547864 () Bool)

(assert (=> d!132997 (= lt!547863 lt!547864)))

(declare-fun lt!547862 () Unit!39849)

(declare-fun e!685852 () Unit!39849)

(assert (=> d!132997 (= lt!547862 e!685852)))

(declare-fun c!118742 () Bool)

(assert (=> d!132997 (= c!118742 lt!547864)))

(assert (=> d!132997 (= lt!547864 (containsKey!592 (toList!8911 lt!547658) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132997 (= (contains!6910 lt!547658 #b0000000000000000000000000000000000000000000000000000000000000000) lt!547863)))

(declare-fun b!1207692 () Bool)

(declare-fun lt!547865 () Unit!39849)

(assert (=> b!1207692 (= e!685852 lt!547865)))

(assert (=> b!1207692 (= lt!547865 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547658) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207692 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547658) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207693 () Bool)

(declare-fun Unit!39874 () Unit!39849)

(assert (=> b!1207693 (= e!685852 Unit!39874)))

(declare-fun b!1207694 () Bool)

(assert (=> b!1207694 (= e!685853 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132997 c!118742) b!1207692))

(assert (= (and d!132997 (not c!118742)) b!1207693))

(assert (= (and d!132997 (not res!802882)) b!1207694))

(declare-fun m!1113007 () Bool)

(assert (=> d!132997 m!1113007))

(declare-fun m!1113009 () Bool)

(assert (=> b!1207692 m!1113009))

(declare-fun m!1113011 () Bool)

(assert (=> b!1207692 m!1113011))

(assert (=> b!1207692 m!1113011))

(declare-fun m!1113013 () Bool)

(assert (=> b!1207692 m!1113013))

(assert (=> b!1207694 m!1113011))

(assert (=> b!1207694 m!1113011))

(assert (=> b!1207694 m!1113013))

(assert (=> d!132823 d!132997))

(assert (=> d!132823 d!132843))

(declare-fun d!132999 () Bool)

(declare-fun e!685855 () Bool)

(assert (=> d!132999 e!685855))

(declare-fun res!802883 () Bool)

(assert (=> d!132999 (=> res!802883 e!685855)))

(declare-fun lt!547867 () Bool)

(assert (=> d!132999 (= res!802883 (not lt!547867))))

(declare-fun lt!547868 () Bool)

(assert (=> d!132999 (= lt!547867 lt!547868)))

(declare-fun lt!547866 () Unit!39849)

(declare-fun e!685854 () Unit!39849)

(assert (=> d!132999 (= lt!547866 e!685854)))

(declare-fun c!118743 () Bool)

(assert (=> d!132999 (= c!118743 lt!547868)))

(assert (=> d!132999 (= lt!547868 (containsKey!592 (toList!8911 lt!547665) (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132999 (= (contains!6910 lt!547665 (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!547867)))

(declare-fun b!1207695 () Bool)

(declare-fun lt!547869 () Unit!39849)

(assert (=> b!1207695 (= e!685854 lt!547869)))

(assert (=> b!1207695 (= lt!547869 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547665) (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207695 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547665) (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207696 () Bool)

(declare-fun Unit!39875 () Unit!39849)

(assert (=> b!1207696 (= e!685854 Unit!39875)))

(declare-fun b!1207697 () Bool)

(assert (=> b!1207697 (= e!685855 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547665) (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132999 c!118743) b!1207695))

(assert (= (and d!132999 (not c!118743)) b!1207696))

(assert (= (and d!132999 (not res!802883)) b!1207697))

(assert (=> d!132999 m!1112431))

(declare-fun m!1113015 () Bool)

(assert (=> d!132999 m!1113015))

(assert (=> b!1207695 m!1112431))

(declare-fun m!1113017 () Bool)

(assert (=> b!1207695 m!1113017))

(assert (=> b!1207695 m!1112431))

(assert (=> b!1207695 m!1112741))

(assert (=> b!1207695 m!1112741))

(declare-fun m!1113019 () Bool)

(assert (=> b!1207695 m!1113019))

(assert (=> b!1207697 m!1112431))

(assert (=> b!1207697 m!1112741))

(assert (=> b!1207697 m!1112741))

(assert (=> b!1207697 m!1113019))

(assert (=> b!1207338 d!132999))

(declare-fun d!133001 () Bool)

(declare-fun lt!547870 () Bool)

(assert (=> d!133001 (= lt!547870 (select (content!542 Nil!26602) (select (arr!37654 _keys!1208) from!1455)))))

(declare-fun e!685857 () Bool)

(assert (=> d!133001 (= lt!547870 e!685857)))

(declare-fun res!802885 () Bool)

(assert (=> d!133001 (=> (not res!802885) (not e!685857))))

(assert (=> d!133001 (= res!802885 ((_ is Cons!26601) Nil!26602))))

(assert (=> d!133001 (= (contains!6913 Nil!26602 (select (arr!37654 _keys!1208) from!1455)) lt!547870)))

(declare-fun b!1207698 () Bool)

(declare-fun e!685856 () Bool)

(assert (=> b!1207698 (= e!685857 e!685856)))

(declare-fun res!802884 () Bool)

(assert (=> b!1207698 (=> res!802884 e!685856)))

(assert (=> b!1207698 (= res!802884 (= (h!27810 Nil!26602) (select (arr!37654 _keys!1208) from!1455)))))

(declare-fun b!1207699 () Bool)

(assert (=> b!1207699 (= e!685856 (contains!6913 (t!39539 Nil!26602) (select (arr!37654 _keys!1208) from!1455)))))

(assert (= (and d!133001 res!802885) b!1207698))

(assert (= (and b!1207698 (not res!802884)) b!1207699))

(assert (=> d!133001 m!1112543))

(assert (=> d!133001 m!1112171))

(declare-fun m!1113021 () Bool)

(assert (=> d!133001 m!1113021))

(assert (=> b!1207699 m!1112171))

(declare-fun m!1113023 () Bool)

(assert (=> b!1207699 m!1113023))

(assert (=> b!1207358 d!133001))

(declare-fun d!133003 () Bool)

(declare-fun res!802886 () Bool)

(declare-fun e!685858 () Bool)

(assert (=> d!133003 (=> res!802886 e!685858)))

(assert (=> d!133003 (= res!802886 (and ((_ is Cons!26600) (toList!8911 lt!547503)) (= (_1!9922 (h!27809 (toList!8911 lt!547503))) k0!934)))))

(assert (=> d!133003 (= (containsKey!592 (toList!8911 lt!547503) k0!934) e!685858)))

(declare-fun b!1207700 () Bool)

(declare-fun e!685859 () Bool)

(assert (=> b!1207700 (= e!685858 e!685859)))

(declare-fun res!802887 () Bool)

(assert (=> b!1207700 (=> (not res!802887) (not e!685859))))

(assert (=> b!1207700 (= res!802887 (and (or (not ((_ is Cons!26600) (toList!8911 lt!547503))) (bvsle (_1!9922 (h!27809 (toList!8911 lt!547503))) k0!934)) ((_ is Cons!26600) (toList!8911 lt!547503)) (bvslt (_1!9922 (h!27809 (toList!8911 lt!547503))) k0!934)))))

(declare-fun b!1207701 () Bool)

(assert (=> b!1207701 (= e!685859 (containsKey!592 (t!39538 (toList!8911 lt!547503)) k0!934))))

(assert (= (and d!133003 (not res!802886)) b!1207700))

(assert (= (and b!1207700 res!802887) b!1207701))

(declare-fun m!1113025 () Bool)

(assert (=> b!1207701 m!1113025))

(assert (=> d!132837 d!133003))

(assert (=> d!132853 d!132851))

(declare-fun d!133005 () Bool)

(assert (=> d!133005 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!133005 true))

(declare-fun _$60!448 () Unit!39849)

(assert (=> d!133005 (= (choose!13 _keys!1208 k0!934 i!673) _$60!448)))

(declare-fun bs!34117 () Bool)

(assert (= bs!34117 d!133005))

(assert (=> bs!34117 m!1112167))

(assert (=> d!132853 d!133005))

(declare-fun d!133007 () Bool)

(declare-fun e!685860 () Bool)

(assert (=> d!133007 e!685860))

(declare-fun res!802888 () Bool)

(assert (=> d!133007 (=> (not res!802888) (not e!685860))))

(declare-fun lt!547871 () ListLongMap!17791)

(assert (=> d!133007 (= res!802888 (contains!6910 lt!547871 (_1!9922 (tuple2!19823 lt!547644 lt!547640))))))

(declare-fun lt!547872 () List!26604)

(assert (=> d!133007 (= lt!547871 (ListLongMap!17792 lt!547872))))

(declare-fun lt!547873 () Unit!39849)

(declare-fun lt!547874 () Unit!39849)

(assert (=> d!133007 (= lt!547873 lt!547874)))

(assert (=> d!133007 (= (getValueByKey!638 lt!547872 (_1!9922 (tuple2!19823 lt!547644 lt!547640))) (Some!688 (_2!9922 (tuple2!19823 lt!547644 lt!547640))))))

(assert (=> d!133007 (= lt!547874 (lemmaContainsTupThenGetReturnValue!314 lt!547872 (_1!9922 (tuple2!19823 lt!547644 lt!547640)) (_2!9922 (tuple2!19823 lt!547644 lt!547640))))))

(assert (=> d!133007 (= lt!547872 (insertStrictlySorted!407 (toList!8911 lt!547639) (_1!9922 (tuple2!19823 lt!547644 lt!547640)) (_2!9922 (tuple2!19823 lt!547644 lt!547640))))))

(assert (=> d!133007 (= (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640)) lt!547871)))

(declare-fun b!1207702 () Bool)

(declare-fun res!802889 () Bool)

(assert (=> b!1207702 (=> (not res!802889) (not e!685860))))

(assert (=> b!1207702 (= res!802889 (= (getValueByKey!638 (toList!8911 lt!547871) (_1!9922 (tuple2!19823 lt!547644 lt!547640))) (Some!688 (_2!9922 (tuple2!19823 lt!547644 lt!547640)))))))

(declare-fun b!1207703 () Bool)

(assert (=> b!1207703 (= e!685860 (contains!6914 (toList!8911 lt!547871) (tuple2!19823 lt!547644 lt!547640)))))

(assert (= (and d!133007 res!802888) b!1207702))

(assert (= (and b!1207702 res!802889) b!1207703))

(declare-fun m!1113027 () Bool)

(assert (=> d!133007 m!1113027))

(declare-fun m!1113029 () Bool)

(assert (=> d!133007 m!1113029))

(declare-fun m!1113031 () Bool)

(assert (=> d!133007 m!1113031))

(declare-fun m!1113033 () Bool)

(assert (=> d!133007 m!1113033))

(declare-fun m!1113035 () Bool)

(assert (=> b!1207702 m!1113035))

(declare-fun m!1113037 () Bool)

(assert (=> b!1207703 m!1113037))

(assert (=> b!1207299 d!133007))

(declare-fun d!133009 () Bool)

(declare-fun e!685861 () Bool)

(assert (=> d!133009 e!685861))

(declare-fun res!802890 () Bool)

(assert (=> d!133009 (=> (not res!802890) (not e!685861))))

(declare-fun lt!547875 () ListLongMap!17791)

(assert (=> d!133009 (= res!802890 (contains!6910 lt!547875 (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!547876 () List!26604)

(assert (=> d!133009 (= lt!547875 (ListLongMap!17792 lt!547876))))

(declare-fun lt!547877 () Unit!39849)

(declare-fun lt!547878 () Unit!39849)

(assert (=> d!133009 (= lt!547877 lt!547878)))

(assert (=> d!133009 (= (getValueByKey!638 lt!547876 (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133009 (= lt!547878 (lemmaContainsTupThenGetReturnValue!314 lt!547876 (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133009 (= lt!547876 (insertStrictlySorted!407 (toList!8911 call!58947) (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133009 (= (+!4038 call!58947 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!547875)))

(declare-fun b!1207704 () Bool)

(declare-fun res!802891 () Bool)

(assert (=> b!1207704 (=> (not res!802891) (not e!685861))))

(assert (=> b!1207704 (= res!802891 (= (getValueByKey!638 (toList!8911 lt!547875) (_1!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207705 () Bool)

(assert (=> b!1207705 (= e!685861 (contains!6914 (toList!8911 lt!547875) (tuple2!19823 (select (arr!37654 _keys!1208) from!1455) (get!19207 (select (arr!37655 _values!996) from!1455) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133009 res!802890) b!1207704))

(assert (= (and b!1207704 res!802891) b!1207705))

(declare-fun m!1113039 () Bool)

(assert (=> d!133009 m!1113039))

(declare-fun m!1113041 () Bool)

(assert (=> d!133009 m!1113041))

(declare-fun m!1113043 () Bool)

(assert (=> d!133009 m!1113043))

(declare-fun m!1113045 () Bool)

(assert (=> d!133009 m!1113045))

(declare-fun m!1113047 () Bool)

(assert (=> b!1207704 m!1113047))

(declare-fun m!1113049 () Bool)

(assert (=> b!1207705 m!1113049))

(assert (=> b!1207299 d!133009))

(assert (=> b!1207299 d!132941))

(declare-fun d!133011 () Bool)

(declare-fun e!685863 () Bool)

(assert (=> d!133011 e!685863))

(declare-fun res!802892 () Bool)

(assert (=> d!133011 (=> res!802892 e!685863)))

(declare-fun lt!547880 () Bool)

(assert (=> d!133011 (= res!802892 (not lt!547880))))

(declare-fun lt!547881 () Bool)

(assert (=> d!133011 (= lt!547880 lt!547881)))

(declare-fun lt!547879 () Unit!39849)

(declare-fun e!685862 () Unit!39849)

(assert (=> d!133011 (= lt!547879 e!685862)))

(declare-fun c!118744 () Bool)

(assert (=> d!133011 (= c!118744 lt!547881)))

(assert (=> d!133011 (= lt!547881 (containsKey!592 (toList!8911 (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640))) lt!547643))))

(assert (=> d!133011 (= (contains!6910 (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640)) lt!547643) lt!547880)))

(declare-fun b!1207706 () Bool)

(declare-fun lt!547882 () Unit!39849)

(assert (=> b!1207706 (= e!685862 lt!547882)))

(assert (=> b!1207706 (= lt!547882 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640))) lt!547643))))

(assert (=> b!1207706 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640))) lt!547643))))

(declare-fun b!1207707 () Bool)

(declare-fun Unit!39876 () Unit!39849)

(assert (=> b!1207707 (= e!685862 Unit!39876)))

(declare-fun b!1207708 () Bool)

(assert (=> b!1207708 (= e!685863 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640))) lt!547643)))))

(assert (= (and d!133011 c!118744) b!1207706))

(assert (= (and d!133011 (not c!118744)) b!1207707))

(assert (= (and d!133011 (not res!802892)) b!1207708))

(declare-fun m!1113051 () Bool)

(assert (=> d!133011 m!1113051))

(declare-fun m!1113053 () Bool)

(assert (=> b!1207706 m!1113053))

(declare-fun m!1113055 () Bool)

(assert (=> b!1207706 m!1113055))

(assert (=> b!1207706 m!1113055))

(declare-fun m!1113057 () Bool)

(assert (=> b!1207706 m!1113057))

(assert (=> b!1207708 m!1113055))

(assert (=> b!1207708 m!1113055))

(assert (=> b!1207708 m!1113057))

(assert (=> b!1207299 d!133011))

(declare-fun d!133013 () Bool)

(assert (=> d!133013 (not (contains!6910 (+!4038 lt!547639 (tuple2!19823 lt!547644 lt!547640)) lt!547643))))

(declare-fun lt!547883 () Unit!39849)

(assert (=> d!133013 (= lt!547883 (choose!1813 lt!547639 lt!547644 lt!547640 lt!547643))))

(declare-fun e!685864 () Bool)

(assert (=> d!133013 e!685864))

(declare-fun res!802893 () Bool)

(assert (=> d!133013 (=> (not res!802893) (not e!685864))))

(assert (=> d!133013 (= res!802893 (not (contains!6910 lt!547639 lt!547643)))))

(assert (=> d!133013 (= (addStillNotContains!294 lt!547639 lt!547644 lt!547640 lt!547643) lt!547883)))

(declare-fun b!1207709 () Bool)

(assert (=> b!1207709 (= e!685864 (not (= lt!547644 lt!547643)))))

(assert (= (and d!133013 res!802893) b!1207709))

(assert (=> d!133013 m!1112377))

(assert (=> d!133013 m!1112377))

(assert (=> d!133013 m!1112379))

(declare-fun m!1113059 () Bool)

(assert (=> d!133013 m!1113059))

(declare-fun m!1113061 () Bool)

(assert (=> d!133013 m!1113061))

(assert (=> b!1207299 d!133013))

(declare-fun d!133015 () Bool)

(declare-fun res!802894 () Bool)

(declare-fun e!685865 () Bool)

(assert (=> d!133015 (=> res!802894 e!685865)))

(assert (=> d!133015 (= res!802894 (= (select (arr!37654 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!133015 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) e!685865)))

(declare-fun b!1207710 () Bool)

(declare-fun e!685866 () Bool)

(assert (=> b!1207710 (= e!685865 e!685866)))

(declare-fun res!802895 () Bool)

(assert (=> b!1207710 (=> (not res!802895) (not e!685866))))

(assert (=> b!1207710 (= res!802895 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207711 () Bool)

(assert (=> b!1207711 (= e!685866 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!133015 (not res!802894)) b!1207710))

(assert (= (and b!1207710 res!802895) b!1207711))

(assert (=> d!133015 m!1112877))

(declare-fun m!1113063 () Bool)

(assert (=> b!1207711 m!1113063))

(assert (=> b!1207353 d!133015))

(declare-fun d!133017 () Bool)

(declare-fun e!685868 () Bool)

(assert (=> d!133017 e!685868))

(declare-fun res!802896 () Bool)

(assert (=> d!133017 (=> res!802896 e!685868)))

(declare-fun lt!547885 () Bool)

(assert (=> d!133017 (= res!802896 (not lt!547885))))

(declare-fun lt!547886 () Bool)

(assert (=> d!133017 (= lt!547885 lt!547886)))

(declare-fun lt!547884 () Unit!39849)

(declare-fun e!685867 () Unit!39849)

(assert (=> d!133017 (= lt!547884 e!685867)))

(declare-fun c!118745 () Bool)

(assert (=> d!133017 (= c!118745 lt!547886)))

(assert (=> d!133017 (= lt!547886 (containsKey!592 (toList!8911 (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> d!133017 (= (contains!6910 (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))) k0!934) lt!547885)))

(declare-fun b!1207712 () Bool)

(declare-fun lt!547887 () Unit!39849)

(assert (=> b!1207712 (= e!685867 lt!547887)))

(assert (=> b!1207712 (= lt!547887 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> b!1207712 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))) k0!934))))

(declare-fun b!1207713 () Bool)

(declare-fun Unit!39877 () Unit!39849)

(assert (=> b!1207713 (= e!685867 Unit!39877)))

(declare-fun b!1207714 () Bool)

(assert (=> b!1207714 (= e!685868 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))) k0!934)))))

(assert (= (and d!133017 c!118745) b!1207712))

(assert (= (and d!133017 (not c!118745)) b!1207713))

(assert (= (and d!133017 (not res!802896)) b!1207714))

(declare-fun m!1113065 () Bool)

(assert (=> d!133017 m!1113065))

(declare-fun m!1113067 () Bool)

(assert (=> b!1207712 m!1113067))

(declare-fun m!1113069 () Bool)

(assert (=> b!1207712 m!1113069))

(assert (=> b!1207712 m!1113069))

(declare-fun m!1113071 () Bool)

(assert (=> b!1207712 m!1113071))

(assert (=> b!1207714 m!1113069))

(assert (=> b!1207714 m!1113069))

(assert (=> b!1207714 m!1113071))

(assert (=> d!132819 d!133017))

(declare-fun d!133019 () Bool)

(declare-fun e!685869 () Bool)

(assert (=> d!133019 e!685869))

(declare-fun res!802897 () Bool)

(assert (=> d!133019 (=> (not res!802897) (not e!685869))))

(declare-fun lt!547888 () ListLongMap!17791)

(assert (=> d!133019 (= res!802897 (contains!6910 lt!547888 (_1!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))))))

(declare-fun lt!547889 () List!26604)

(assert (=> d!133019 (= lt!547888 (ListLongMap!17792 lt!547889))))

(declare-fun lt!547890 () Unit!39849)

(declare-fun lt!547891 () Unit!39849)

(assert (=> d!133019 (= lt!547890 lt!547891)))

(assert (=> d!133019 (= (getValueByKey!638 lt!547889 (_1!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))) (Some!688 (_2!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))))))

(assert (=> d!133019 (= lt!547891 (lemmaContainsTupThenGetReturnValue!314 lt!547889 (_1!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))) (_2!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))))))

(assert (=> d!133019 (= lt!547889 (insertStrictlySorted!407 (toList!8911 (ite c!118569 lt!547509 lt!547503)) (_1!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))) (_2!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))))))

(assert (=> d!133019 (= (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))) lt!547888)))

(declare-fun b!1207715 () Bool)

(declare-fun res!802898 () Bool)

(assert (=> b!1207715 (=> (not res!802898) (not e!685869))))

(assert (=> b!1207715 (= res!802898 (= (getValueByKey!638 (toList!8911 lt!547888) (_1!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944))))) (Some!688 (_2!9922 (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))))))))

(declare-fun b!1207716 () Bool)

(assert (=> b!1207716 (= e!685869 (contains!6914 (toList!8911 lt!547888) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))))))

(assert (= (and d!133019 res!802897) b!1207715))

(assert (= (and b!1207715 res!802898) b!1207716))

(declare-fun m!1113073 () Bool)

(assert (=> d!133019 m!1113073))

(declare-fun m!1113075 () Bool)

(assert (=> d!133019 m!1113075))

(declare-fun m!1113077 () Bool)

(assert (=> d!133019 m!1113077))

(declare-fun m!1113079 () Bool)

(assert (=> d!133019 m!1113079))

(declare-fun m!1113081 () Bool)

(assert (=> b!1207715 m!1113081))

(declare-fun m!1113083 () Bool)

(assert (=> b!1207716 m!1113083))

(assert (=> d!132819 d!133019))

(declare-fun d!133021 () Bool)

(assert (=> d!133021 (contains!6910 (+!4038 (ite c!118569 lt!547509 lt!547503) (tuple2!19823 (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)))) k0!934)))

(assert (=> d!133021 true))

(declare-fun _$35!460 () Unit!39849)

(assert (=> d!133021 (= (choose!1809 (ite c!118569 lt!547509 lt!547503) (ite c!118569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118571 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118569 minValue!944 (ite c!118571 zeroValue!944 minValue!944)) k0!934) _$35!460)))

(declare-fun bs!34118 () Bool)

(assert (= bs!34118 d!133021))

(assert (=> bs!34118 m!1112389))

(assert (=> bs!34118 m!1112389))

(assert (=> bs!34118 m!1112391))

(assert (=> d!132819 d!133021))

(declare-fun d!133023 () Bool)

(declare-fun e!685871 () Bool)

(assert (=> d!133023 e!685871))

(declare-fun res!802899 () Bool)

(assert (=> d!133023 (=> res!802899 e!685871)))

(declare-fun lt!547893 () Bool)

(assert (=> d!133023 (= res!802899 (not lt!547893))))

(declare-fun lt!547894 () Bool)

(assert (=> d!133023 (= lt!547893 lt!547894)))

(declare-fun lt!547892 () Unit!39849)

(declare-fun e!685870 () Unit!39849)

(assert (=> d!133023 (= lt!547892 e!685870)))

(declare-fun c!118746 () Bool)

(assert (=> d!133023 (= c!118746 lt!547894)))

(assert (=> d!133023 (= lt!547894 (containsKey!592 (toList!8911 (ite c!118569 lt!547509 lt!547503)) k0!934))))

(assert (=> d!133023 (= (contains!6910 (ite c!118569 lt!547509 lt!547503) k0!934) lt!547893)))

(declare-fun b!1207717 () Bool)

(declare-fun lt!547895 () Unit!39849)

(assert (=> b!1207717 (= e!685870 lt!547895)))

(assert (=> b!1207717 (= lt!547895 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (ite c!118569 lt!547509 lt!547503)) k0!934))))

(assert (=> b!1207717 (isDefined!464 (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 lt!547503)) k0!934))))

(declare-fun b!1207718 () Bool)

(declare-fun Unit!39878 () Unit!39849)

(assert (=> b!1207718 (= e!685870 Unit!39878)))

(declare-fun b!1207719 () Bool)

(assert (=> b!1207719 (= e!685871 (isDefined!464 (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 lt!547503)) k0!934)))))

(assert (= (and d!133023 c!118746) b!1207717))

(assert (= (and d!133023 (not c!118746)) b!1207718))

(assert (= (and d!133023 (not res!802899)) b!1207719))

(declare-fun m!1113085 () Bool)

(assert (=> d!133023 m!1113085))

(declare-fun m!1113087 () Bool)

(assert (=> b!1207717 m!1113087))

(declare-fun m!1113089 () Bool)

(assert (=> b!1207717 m!1113089))

(assert (=> b!1207717 m!1113089))

(declare-fun m!1113091 () Bool)

(assert (=> b!1207717 m!1113091))

(assert (=> b!1207719 m!1113089))

(assert (=> b!1207719 m!1113089))

(assert (=> b!1207719 m!1113091))

(assert (=> d!132819 d!133023))

(assert (=> b!1207318 d!132915))

(assert (=> b!1207253 d!132873))

(declare-fun d!133025 () Bool)

(assert (=> d!133025 (= (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207319 d!133025))

(assert (=> bm!58950 d!132825))

(assert (=> b!1207363 d!132829))

(declare-fun d!133027 () Bool)

(declare-fun res!802901 () Bool)

(declare-fun e!685872 () Bool)

(assert (=> d!133027 (=> res!802901 e!685872)))

(assert (=> d!133027 (= res!802901 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 lt!547511)))))

(assert (=> d!133027 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!547511 mask!1564) e!685872)))

(declare-fun b!1207720 () Bool)

(declare-fun e!685873 () Bool)

(declare-fun call!58986 () Bool)

(assert (=> b!1207720 (= e!685873 call!58986)))

(declare-fun b!1207721 () Bool)

(declare-fun e!685874 () Bool)

(assert (=> b!1207721 (= e!685872 e!685874)))

(declare-fun c!118747 () Bool)

(assert (=> b!1207721 (= c!118747 (validKeyInArray!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1207722 () Bool)

(assert (=> b!1207722 (= e!685874 e!685873)))

(declare-fun lt!547896 () (_ BitVec 64))

(assert (=> b!1207722 (= lt!547896 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!547898 () Unit!39849)

(assert (=> b!1207722 (= lt!547898 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547511 lt!547896 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1207722 (arrayContainsKey!0 lt!547511 lt!547896 #b00000000000000000000000000000000)))

(declare-fun lt!547897 () Unit!39849)

(assert (=> b!1207722 (= lt!547897 lt!547898)))

(declare-fun res!802900 () Bool)

(assert (=> b!1207722 (= res!802900 (= (seekEntryOrOpen!0 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!547511 mask!1564) (Found!9937 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1207722 (=> (not res!802900) (not e!685873))))

(declare-fun bm!58983 () Bool)

(assert (=> bm!58983 (= call!58986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!547511 mask!1564))))

(declare-fun b!1207723 () Bool)

(assert (=> b!1207723 (= e!685874 call!58986)))

(assert (= (and d!133027 (not res!802901)) b!1207721))

(assert (= (and b!1207721 c!118747) b!1207722))

(assert (= (and b!1207721 (not c!118747)) b!1207723))

(assert (= (and b!1207722 res!802900) b!1207720))

(assert (= (or b!1207720 b!1207723) bm!58983))

(assert (=> b!1207721 m!1112999))

(assert (=> b!1207721 m!1112999))

(assert (=> b!1207721 m!1113003))

(assert (=> b!1207722 m!1112999))

(declare-fun m!1113093 () Bool)

(assert (=> b!1207722 m!1113093))

(declare-fun m!1113095 () Bool)

(assert (=> b!1207722 m!1113095))

(assert (=> b!1207722 m!1112999))

(declare-fun m!1113097 () Bool)

(assert (=> b!1207722 m!1113097))

(declare-fun m!1113099 () Bool)

(assert (=> bm!58983 m!1113099))

(assert (=> bm!58940 d!133027))

(assert (=> b!1207280 d!132937))

(assert (=> b!1207321 d!133025))

(declare-fun d!133029 () Bool)

(assert (=> d!133029 (= (isDefined!464 (getValueByKey!638 (toList!8911 lt!547503) k0!934)) (not (isEmpty!993 (getValueByKey!638 (toList!8911 lt!547503) k0!934))))))

(declare-fun bs!34119 () Bool)

(assert (= bs!34119 d!133029))

(assert (=> bs!34119 m!1112485))

(declare-fun m!1113101 () Bool)

(assert (=> bs!34119 m!1113101))

(assert (=> b!1207373 d!133029))

(declare-fun b!1207727 () Bool)

(declare-fun e!685876 () Option!689)

(assert (=> b!1207727 (= e!685876 None!687)))

(declare-fun b!1207724 () Bool)

(declare-fun e!685875 () Option!689)

(assert (=> b!1207724 (= e!685875 (Some!688 (_2!9922 (h!27809 (toList!8911 lt!547503)))))))

(declare-fun d!133031 () Bool)

(declare-fun c!118748 () Bool)

(assert (=> d!133031 (= c!118748 (and ((_ is Cons!26600) (toList!8911 lt!547503)) (= (_1!9922 (h!27809 (toList!8911 lt!547503))) k0!934)))))

(assert (=> d!133031 (= (getValueByKey!638 (toList!8911 lt!547503) k0!934) e!685875)))

(declare-fun b!1207726 () Bool)

(assert (=> b!1207726 (= e!685876 (getValueByKey!638 (t!39538 (toList!8911 lt!547503)) k0!934))))

(declare-fun b!1207725 () Bool)

(assert (=> b!1207725 (= e!685875 e!685876)))

(declare-fun c!118749 () Bool)

(assert (=> b!1207725 (= c!118749 (and ((_ is Cons!26600) (toList!8911 lt!547503)) (not (= (_1!9922 (h!27809 (toList!8911 lt!547503))) k0!934))))))

(assert (= (and d!133031 c!118748) b!1207724))

(assert (= (and d!133031 (not c!118748)) b!1207725))

(assert (= (and b!1207725 c!118749) b!1207726))

(assert (= (and b!1207725 (not c!118749)) b!1207727))

(declare-fun m!1113103 () Bool)

(assert (=> b!1207726 m!1113103))

(assert (=> b!1207373 d!133031))

(declare-fun d!133033 () Bool)

(assert (=> d!133033 (= (isDefined!464 (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934)) (not (isEmpty!993 (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934))))))

(declare-fun bs!34120 () Bool)

(assert (= bs!34120 d!133033))

(assert (=> bs!34120 m!1112493))

(declare-fun m!1113105 () Bool)

(assert (=> bs!34120 m!1113105))

(assert (=> b!1207376 d!133033))

(declare-fun b!1207731 () Bool)

(declare-fun e!685878 () Option!689)

(assert (=> b!1207731 (= e!685878 None!687)))

(declare-fun b!1207728 () Bool)

(declare-fun e!685877 () Option!689)

(assert (=> b!1207728 (= e!685877 (Some!688 (_2!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 call!58889))))))))

(declare-fun d!133035 () Bool)

(declare-fun c!118750 () Bool)

(assert (=> d!133035 (= c!118750 (and ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 call!58889))) (= (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 call!58889)))) k0!934)))))

(assert (=> d!133035 (= (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934) e!685877)))

(declare-fun b!1207730 () Bool)

(assert (=> b!1207730 (= e!685878 (getValueByKey!638 (t!39538 (toList!8911 (ite c!118569 lt!547509 call!58889))) k0!934))))

(declare-fun b!1207729 () Bool)

(assert (=> b!1207729 (= e!685877 e!685878)))

(declare-fun c!118751 () Bool)

(assert (=> b!1207729 (= c!118751 (and ((_ is Cons!26600) (toList!8911 (ite c!118569 lt!547509 call!58889))) (not (= (_1!9922 (h!27809 (toList!8911 (ite c!118569 lt!547509 call!58889)))) k0!934))))))

(assert (= (and d!133035 c!118750) b!1207728))

(assert (= (and d!133035 (not c!118750)) b!1207729))

(assert (= (and b!1207729 c!118751) b!1207730))

(assert (= (and b!1207729 (not c!118751)) b!1207731))

(declare-fun m!1113107 () Bool)

(assert (=> b!1207730 m!1113107))

(assert (=> b!1207376 d!133035))

(declare-fun lt!547899 () Bool)

(declare-fun d!133037 () Bool)

(assert (=> d!133037 (= lt!547899 (select (content!543 (toList!8911 lt!547676)) (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!685879 () Bool)

(assert (=> d!133037 (= lt!547899 e!685879)))

(declare-fun res!802903 () Bool)

(assert (=> d!133037 (=> (not res!802903) (not e!685879))))

(assert (=> d!133037 (= res!802903 ((_ is Cons!26600) (toList!8911 lt!547676)))))

(assert (=> d!133037 (= (contains!6914 (toList!8911 lt!547676) (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!547899)))

(declare-fun b!1207732 () Bool)

(declare-fun e!685880 () Bool)

(assert (=> b!1207732 (= e!685879 e!685880)))

(declare-fun res!802902 () Bool)

(assert (=> b!1207732 (=> res!802902 e!685880)))

(assert (=> b!1207732 (= res!802902 (= (h!27809 (toList!8911 lt!547676)) (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207733 () Bool)

(assert (=> b!1207733 (= e!685880 (contains!6914 (t!39538 (toList!8911 lt!547676)) (ite c!118569 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118571 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133037 res!802903) b!1207732))

(assert (= (and b!1207732 (not res!802902)) b!1207733))

(declare-fun m!1113109 () Bool)

(assert (=> d!133037 m!1113109))

(declare-fun m!1113111 () Bool)

(assert (=> d!133037 m!1113111))

(declare-fun m!1113113 () Bool)

(assert (=> b!1207733 m!1113113))

(assert (=> b!1207347 d!133037))

(declare-fun d!133039 () Bool)

(assert (=> d!133039 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547503) k0!934))))

(declare-fun lt!547900 () Unit!39849)

(assert (=> d!133039 (= lt!547900 (choose!1814 (toList!8911 lt!547503) k0!934))))

(declare-fun e!685881 () Bool)

(assert (=> d!133039 e!685881))

(declare-fun res!802904 () Bool)

(assert (=> d!133039 (=> (not res!802904) (not e!685881))))

(assert (=> d!133039 (= res!802904 (isStrictlySorted!725 (toList!8911 lt!547503)))))

(assert (=> d!133039 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547503) k0!934) lt!547900)))

(declare-fun b!1207734 () Bool)

(assert (=> b!1207734 (= e!685881 (containsKey!592 (toList!8911 lt!547503) k0!934))))

(assert (= (and d!133039 res!802904) b!1207734))

(assert (=> d!133039 m!1112485))

(assert (=> d!133039 m!1112485))

(assert (=> d!133039 m!1112487))

(declare-fun m!1113115 () Bool)

(assert (=> d!133039 m!1113115))

(assert (=> d!133039 m!1112925))

(assert (=> b!1207734 m!1112481))

(assert (=> b!1207371 d!133039))

(assert (=> b!1207371 d!133029))

(assert (=> b!1207371 d!133031))

(declare-fun d!133041 () Bool)

(assert (=> d!133041 (isDefined!464 (getValueByKey!638 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934))))

(declare-fun lt!547901 () Unit!39849)

(assert (=> d!133041 (= lt!547901 (choose!1814 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934))))

(declare-fun e!685882 () Bool)

(assert (=> d!133041 e!685882))

(declare-fun res!802905 () Bool)

(assert (=> d!133041 (=> (not res!802905) (not e!685882))))

(assert (=> d!133041 (= res!802905 (isStrictlySorted!725 (toList!8911 (ite c!118569 lt!547509 call!58889))))))

(assert (=> d!133041 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934) lt!547901)))

(declare-fun b!1207735 () Bool)

(assert (=> b!1207735 (= e!685882 (containsKey!592 (toList!8911 (ite c!118569 lt!547509 call!58889)) k0!934))))

(assert (= (and d!133041 res!802905) b!1207735))

(assert (=> d!133041 m!1112493))

(assert (=> d!133041 m!1112493))

(assert (=> d!133041 m!1112495))

(declare-fun m!1113117 () Bool)

(assert (=> d!133041 m!1113117))

(declare-fun m!1113119 () Bool)

(assert (=> d!133041 m!1113119))

(assert (=> b!1207735 m!1112489))

(assert (=> b!1207374 d!133041))

(assert (=> b!1207374 d!133033))

(assert (=> b!1207374 d!133035))

(assert (=> b!1207241 d!132957))

(declare-fun d!133043 () Bool)

(declare-fun e!685884 () Bool)

(assert (=> d!133043 e!685884))

(declare-fun res!802906 () Bool)

(assert (=> d!133043 (=> res!802906 e!685884)))

(declare-fun lt!547903 () Bool)

(assert (=> d!133043 (= res!802906 (not lt!547903))))

(declare-fun lt!547904 () Bool)

(assert (=> d!133043 (= lt!547903 lt!547904)))

(declare-fun lt!547902 () Unit!39849)

(declare-fun e!685883 () Unit!39849)

(assert (=> d!133043 (= lt!547902 e!685883)))

(declare-fun c!118752 () Bool)

(assert (=> d!133043 (= c!118752 lt!547904)))

(assert (=> d!133043 (= lt!547904 (containsKey!592 (toList!8911 lt!547665) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133043 (= (contains!6910 lt!547665 #b0000000000000000000000000000000000000000000000000000000000000000) lt!547903)))

(declare-fun b!1207736 () Bool)

(declare-fun lt!547905 () Unit!39849)

(assert (=> b!1207736 (= e!685883 lt!547905)))

(assert (=> b!1207736 (= lt!547905 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547665) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207736 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547665) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207737 () Bool)

(declare-fun Unit!39879 () Unit!39849)

(assert (=> b!1207737 (= e!685883 Unit!39879)))

(declare-fun b!1207738 () Bool)

(assert (=> b!1207738 (= e!685884 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547665) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133043 c!118752) b!1207736))

(assert (= (and d!133043 (not c!118752)) b!1207737))

(assert (= (and d!133043 (not res!802906)) b!1207738))

(declare-fun m!1113121 () Bool)

(assert (=> d!133043 m!1113121))

(declare-fun m!1113123 () Bool)

(assert (=> b!1207736 m!1113123))

(declare-fun m!1113125 () Bool)

(assert (=> b!1207736 m!1113125))

(assert (=> b!1207736 m!1113125))

(declare-fun m!1113127 () Bool)

(assert (=> b!1207736 m!1113127))

(assert (=> b!1207738 m!1113125))

(assert (=> b!1207738 m!1113125))

(assert (=> b!1207738 m!1113127))

(assert (=> d!132825 d!133043))

(assert (=> d!132825 d!132843))

(declare-fun d!133045 () Bool)

(declare-fun e!685885 () Bool)

(assert (=> d!133045 e!685885))

(declare-fun res!802907 () Bool)

(assert (=> d!133045 (=> (not res!802907) (not e!685885))))

(declare-fun lt!547906 () ListLongMap!17791)

(assert (=> d!133045 (= res!802907 (contains!6910 lt!547906 (_1!9922 (tuple2!19823 lt!547660 lt!547656))))))

(declare-fun lt!547907 () List!26604)

(assert (=> d!133045 (= lt!547906 (ListLongMap!17792 lt!547907))))

(declare-fun lt!547908 () Unit!39849)

(declare-fun lt!547909 () Unit!39849)

(assert (=> d!133045 (= lt!547908 lt!547909)))

(assert (=> d!133045 (= (getValueByKey!638 lt!547907 (_1!9922 (tuple2!19823 lt!547660 lt!547656))) (Some!688 (_2!9922 (tuple2!19823 lt!547660 lt!547656))))))

(assert (=> d!133045 (= lt!547909 (lemmaContainsTupThenGetReturnValue!314 lt!547907 (_1!9922 (tuple2!19823 lt!547660 lt!547656)) (_2!9922 (tuple2!19823 lt!547660 lt!547656))))))

(assert (=> d!133045 (= lt!547907 (insertStrictlySorted!407 (toList!8911 lt!547655) (_1!9922 (tuple2!19823 lt!547660 lt!547656)) (_2!9922 (tuple2!19823 lt!547660 lt!547656))))))

(assert (=> d!133045 (= (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656)) lt!547906)))

(declare-fun b!1207739 () Bool)

(declare-fun res!802908 () Bool)

(assert (=> b!1207739 (=> (not res!802908) (not e!685885))))

(assert (=> b!1207739 (= res!802908 (= (getValueByKey!638 (toList!8911 lt!547906) (_1!9922 (tuple2!19823 lt!547660 lt!547656))) (Some!688 (_2!9922 (tuple2!19823 lt!547660 lt!547656)))))))

(declare-fun b!1207740 () Bool)

(assert (=> b!1207740 (= e!685885 (contains!6914 (toList!8911 lt!547906) (tuple2!19823 lt!547660 lt!547656)))))

(assert (= (and d!133045 res!802907) b!1207739))

(assert (= (and b!1207739 res!802908) b!1207740))

(declare-fun m!1113129 () Bool)

(assert (=> d!133045 m!1113129))

(declare-fun m!1113131 () Bool)

(assert (=> d!133045 m!1113131))

(declare-fun m!1113133 () Bool)

(assert (=> d!133045 m!1113133))

(declare-fun m!1113135 () Bool)

(assert (=> d!133045 m!1113135))

(declare-fun m!1113137 () Bool)

(assert (=> b!1207739 m!1113137))

(declare-fun m!1113139 () Bool)

(assert (=> b!1207740 m!1113139))

(assert (=> b!1207325 d!133045))

(assert (=> b!1207325 d!132989))

(declare-fun d!133047 () Bool)

(assert (=> d!133047 (not (contains!6910 (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656)) lt!547659))))

(declare-fun lt!547910 () Unit!39849)

(assert (=> d!133047 (= lt!547910 (choose!1813 lt!547655 lt!547660 lt!547656 lt!547659))))

(declare-fun e!685886 () Bool)

(assert (=> d!133047 e!685886))

(declare-fun res!802909 () Bool)

(assert (=> d!133047 (=> (not res!802909) (not e!685886))))

(assert (=> d!133047 (= res!802909 (not (contains!6910 lt!547655 lt!547659)))))

(assert (=> d!133047 (= (addStillNotContains!294 lt!547655 lt!547660 lt!547656 lt!547659) lt!547910)))

(declare-fun b!1207741 () Bool)

(assert (=> b!1207741 (= e!685886 (not (= lt!547660 lt!547659)))))

(assert (= (and d!133047 res!802909) b!1207741))

(assert (=> d!133047 m!1112427))

(assert (=> d!133047 m!1112427))

(assert (=> d!133047 m!1112429))

(declare-fun m!1113141 () Bool)

(assert (=> d!133047 m!1113141))

(declare-fun m!1113143 () Bool)

(assert (=> d!133047 m!1113143))

(assert (=> b!1207325 d!133047))

(declare-fun d!133049 () Bool)

(declare-fun e!685887 () Bool)

(assert (=> d!133049 e!685887))

(declare-fun res!802910 () Bool)

(assert (=> d!133049 (=> (not res!802910) (not e!685887))))

(declare-fun lt!547911 () ListLongMap!17791)

(assert (=> d!133049 (= res!802910 (contains!6910 lt!547911 (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!547912 () List!26604)

(assert (=> d!133049 (= lt!547911 (ListLongMap!17792 lt!547912))))

(declare-fun lt!547913 () Unit!39849)

(declare-fun lt!547914 () Unit!39849)

(assert (=> d!133049 (= lt!547913 lt!547914)))

(assert (=> d!133049 (= (getValueByKey!638 lt!547912 (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133049 (= lt!547914 (lemmaContainsTupThenGetReturnValue!314 lt!547912 (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133049 (= lt!547912 (insertStrictlySorted!407 (toList!8911 call!58955) (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133049 (= (+!4038 call!58955 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!547911)))

(declare-fun b!1207742 () Bool)

(declare-fun res!802911 () Bool)

(assert (=> b!1207742 (=> (not res!802911) (not e!685887))))

(assert (=> b!1207742 (= res!802911 (= (getValueByKey!638 (toList!8911 lt!547911) (_1!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!688 (_2!9922 (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1207743 () Bool)

(assert (=> b!1207743 (= e!685887 (contains!6914 (toList!8911 lt!547911) (tuple2!19823 (select (arr!37654 lt!547511) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19207 (select (arr!37655 lt!547510) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133049 res!802910) b!1207742))

(assert (= (and b!1207742 res!802911) b!1207743))

(declare-fun m!1113145 () Bool)

(assert (=> d!133049 m!1113145))

(declare-fun m!1113147 () Bool)

(assert (=> d!133049 m!1113147))

(declare-fun m!1113149 () Bool)

(assert (=> d!133049 m!1113149))

(declare-fun m!1113151 () Bool)

(assert (=> d!133049 m!1113151))

(declare-fun m!1113153 () Bool)

(assert (=> b!1207742 m!1113153))

(declare-fun m!1113155 () Bool)

(assert (=> b!1207743 m!1113155))

(assert (=> b!1207325 d!133049))

(declare-fun d!133051 () Bool)

(declare-fun e!685889 () Bool)

(assert (=> d!133051 e!685889))

(declare-fun res!802912 () Bool)

(assert (=> d!133051 (=> res!802912 e!685889)))

(declare-fun lt!547916 () Bool)

(assert (=> d!133051 (= res!802912 (not lt!547916))))

(declare-fun lt!547917 () Bool)

(assert (=> d!133051 (= lt!547916 lt!547917)))

(declare-fun lt!547915 () Unit!39849)

(declare-fun e!685888 () Unit!39849)

(assert (=> d!133051 (= lt!547915 e!685888)))

(declare-fun c!118753 () Bool)

(assert (=> d!133051 (= c!118753 lt!547917)))

(assert (=> d!133051 (= lt!547917 (containsKey!592 (toList!8911 (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656))) lt!547659))))

(assert (=> d!133051 (= (contains!6910 (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656)) lt!547659) lt!547916)))

(declare-fun b!1207744 () Bool)

(declare-fun lt!547918 () Unit!39849)

(assert (=> b!1207744 (= e!685888 lt!547918)))

(assert (=> b!1207744 (= lt!547918 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656))) lt!547659))))

(assert (=> b!1207744 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656))) lt!547659))))

(declare-fun b!1207745 () Bool)

(declare-fun Unit!39880 () Unit!39849)

(assert (=> b!1207745 (= e!685888 Unit!39880)))

(declare-fun b!1207746 () Bool)

(assert (=> b!1207746 (= e!685889 (isDefined!464 (getValueByKey!638 (toList!8911 (+!4038 lt!547655 (tuple2!19823 lt!547660 lt!547656))) lt!547659)))))

(assert (= (and d!133051 c!118753) b!1207744))

(assert (= (and d!133051 (not c!118753)) b!1207745))

(assert (= (and d!133051 (not res!802912)) b!1207746))

(declare-fun m!1113157 () Bool)

(assert (=> d!133051 m!1113157))

(declare-fun m!1113159 () Bool)

(assert (=> b!1207744 m!1113159))

(declare-fun m!1113161 () Bool)

(assert (=> b!1207744 m!1113161))

(assert (=> b!1207744 m!1113161))

(declare-fun m!1113163 () Bool)

(assert (=> b!1207744 m!1113163))

(assert (=> b!1207746 m!1113161))

(assert (=> b!1207746 m!1113161))

(assert (=> b!1207746 m!1113163))

(assert (=> b!1207325 d!133051))

(declare-fun d!133053 () Bool)

(declare-fun lt!547919 () Bool)

(assert (=> d!133053 (= lt!547919 (select (content!542 Nil!26602) (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!685891 () Bool)

(assert (=> d!133053 (= lt!547919 e!685891)))

(declare-fun res!802914 () Bool)

(assert (=> d!133053 (=> (not res!802914) (not e!685891))))

(assert (=> d!133053 (= res!802914 ((_ is Cons!26601) Nil!26602))))

(assert (=> d!133053 (= (contains!6913 Nil!26602 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)) lt!547919)))

(declare-fun b!1207747 () Bool)

(declare-fun e!685890 () Bool)

(assert (=> b!1207747 (= e!685891 e!685890)))

(declare-fun res!802913 () Bool)

(assert (=> b!1207747 (=> res!802913 e!685890)))

(assert (=> b!1207747 (= res!802913 (= (h!27810 Nil!26602) (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207748 () Bool)

(assert (=> b!1207748 (= e!685890 (contains!6913 (t!39539 Nil!26602) (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133053 res!802914) b!1207747))

(assert (= (and b!1207747 (not res!802913)) b!1207748))

(assert (=> d!133053 m!1112543))

(assert (=> d!133053 m!1112307))

(declare-fun m!1113165 () Bool)

(assert (=> d!133053 m!1113165))

(assert (=> b!1207748 m!1112307))

(declare-fun m!1113167 () Bool)

(assert (=> b!1207748 m!1113167))

(assert (=> b!1207243 d!133053))

(declare-fun d!133055 () Bool)

(assert (=> d!133055 (= (isEmpty!992 lt!547635) (isEmpty!994 (toList!8911 lt!547635)))))

(declare-fun bs!34121 () Bool)

(assert (= bs!34121 d!133055))

(declare-fun m!1113169 () Bool)

(assert (=> bs!34121 m!1113169))

(assert (=> b!1207286 d!133055))

(declare-fun d!133057 () Bool)

(assert (=> d!133057 (arrayContainsKey!0 _keys!1208 lt!547645 #b00000000000000000000000000000000)))

(declare-fun lt!547920 () Unit!39849)

(assert (=> d!133057 (= lt!547920 (choose!13 _keys!1208 lt!547645 #b00000000000000000000000000000000))))

(assert (=> d!133057 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!133057 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547645 #b00000000000000000000000000000000) lt!547920)))

(declare-fun bs!34122 () Bool)

(assert (= bs!34122 d!133057))

(assert (=> bs!34122 m!1112383))

(declare-fun m!1113171 () Bool)

(assert (=> bs!34122 m!1113171))

(assert (=> b!1207306 d!133057))

(declare-fun d!133059 () Bool)

(declare-fun res!802915 () Bool)

(declare-fun e!685892 () Bool)

(assert (=> d!133059 (=> res!802915 e!685892)))

(assert (=> d!133059 (= res!802915 (= (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) lt!547645))))

(assert (=> d!133059 (= (arrayContainsKey!0 _keys!1208 lt!547645 #b00000000000000000000000000000000) e!685892)))

(declare-fun b!1207749 () Bool)

(declare-fun e!685893 () Bool)

(assert (=> b!1207749 (= e!685892 e!685893)))

(declare-fun res!802916 () Bool)

(assert (=> b!1207749 (=> (not res!802916) (not e!685893))))

(assert (=> b!1207749 (= res!802916 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1207750 () Bool)

(assert (=> b!1207750 (= e!685893 (arrayContainsKey!0 _keys!1208 lt!547645 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133059 (not res!802915)) b!1207749))

(assert (= (and b!1207749 res!802916) b!1207750))

(assert (=> d!133059 m!1112307))

(declare-fun m!1113173 () Bool)

(assert (=> b!1207750 m!1113173))

(assert (=> b!1207306 d!133059))

(declare-fun b!1207751 () Bool)

(declare-fun e!685894 () SeekEntryResult!9937)

(declare-fun lt!547922 () SeekEntryResult!9937)

(assert (=> b!1207751 (= e!685894 (MissingZero!9937 (index!42121 lt!547922)))))

(declare-fun b!1207752 () Bool)

(assert (=> b!1207752 (= e!685894 (seekKeyOrZeroReturnVacant!0 (x!106576 lt!547922) (index!42121 lt!547922) (index!42121 lt!547922) (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(declare-fun b!1207753 () Bool)

(declare-fun e!685895 () SeekEntryResult!9937)

(assert (=> b!1207753 (= e!685895 (Found!9937 (index!42121 lt!547922)))))

(declare-fun b!1207754 () Bool)

(declare-fun e!685896 () SeekEntryResult!9937)

(assert (=> b!1207754 (= e!685896 Undefined!9937)))

(declare-fun b!1207755 () Bool)

(declare-fun c!118756 () Bool)

(declare-fun lt!547923 () (_ BitVec 64))

(assert (=> b!1207755 (= c!118756 (= lt!547923 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207755 (= e!685895 e!685894)))

(declare-fun b!1207756 () Bool)

(assert (=> b!1207756 (= e!685896 e!685895)))

(assert (=> b!1207756 (= lt!547923 (select (arr!37654 _keys!1208) (index!42121 lt!547922)))))

(declare-fun c!118754 () Bool)

(assert (=> b!1207756 (= c!118754 (= lt!547923 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133061 () Bool)

(declare-fun lt!547921 () SeekEntryResult!9937)

(assert (=> d!133061 (and (or ((_ is Undefined!9937) lt!547921) (not ((_ is Found!9937) lt!547921)) (and (bvsge (index!42120 lt!547921) #b00000000000000000000000000000000) (bvslt (index!42120 lt!547921) (size!38192 _keys!1208)))) (or ((_ is Undefined!9937) lt!547921) ((_ is Found!9937) lt!547921) (not ((_ is MissingZero!9937) lt!547921)) (and (bvsge (index!42119 lt!547921) #b00000000000000000000000000000000) (bvslt (index!42119 lt!547921) (size!38192 _keys!1208)))) (or ((_ is Undefined!9937) lt!547921) ((_ is Found!9937) lt!547921) ((_ is MissingZero!9937) lt!547921) (not ((_ is MissingVacant!9937) lt!547921)) (and (bvsge (index!42122 lt!547921) #b00000000000000000000000000000000) (bvslt (index!42122 lt!547921) (size!38192 _keys!1208)))) (or ((_ is Undefined!9937) lt!547921) (ite ((_ is Found!9937) lt!547921) (= (select (arr!37654 _keys!1208) (index!42120 lt!547921)) (select (arr!37654 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9937) lt!547921) (= (select (arr!37654 _keys!1208) (index!42119 lt!547921)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9937) lt!547921) (= (select (arr!37654 _keys!1208) (index!42122 lt!547921)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133061 (= lt!547921 e!685896)))

(declare-fun c!118755 () Bool)

(assert (=> d!133061 (= c!118755 (and ((_ is Intermediate!9937) lt!547922) (undefined!10749 lt!547922)))))

(assert (=> d!133061 (= lt!547922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!133061 (validMask!0 mask!1564)))

(assert (=> d!133061 (= (seekEntryOrOpen!0 (select (arr!37654 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!547921)))

(assert (= (and d!133061 c!118755) b!1207754))

(assert (= (and d!133061 (not c!118755)) b!1207756))

(assert (= (and b!1207756 c!118754) b!1207753))

(assert (= (and b!1207756 (not c!118754)) b!1207755))

(assert (= (and b!1207755 c!118756) b!1207751))

(assert (= (and b!1207755 (not c!118756)) b!1207752))

(assert (=> b!1207752 m!1112307))

(declare-fun m!1113175 () Bool)

(assert (=> b!1207752 m!1113175))

(declare-fun m!1113177 () Bool)

(assert (=> b!1207756 m!1113177))

(declare-fun m!1113179 () Bool)

(assert (=> d!133061 m!1113179))

(assert (=> d!133061 m!1112307))

(declare-fun m!1113181 () Bool)

(assert (=> d!133061 m!1113181))

(declare-fun m!1113183 () Bool)

(assert (=> d!133061 m!1113183))

(declare-fun m!1113185 () Bool)

(assert (=> d!133061 m!1113185))

(assert (=> d!133061 m!1112307))

(assert (=> d!133061 m!1113179))

(assert (=> d!133061 m!1112127))

(declare-fun m!1113187 () Bool)

(assert (=> d!133061 m!1113187))

(assert (=> b!1207306 d!133061))

(declare-fun d!133063 () Bool)

(declare-fun e!685898 () Bool)

(assert (=> d!133063 e!685898))

(declare-fun res!802917 () Bool)

(assert (=> d!133063 (=> res!802917 e!685898)))

(declare-fun lt!547925 () Bool)

(assert (=> d!133063 (= res!802917 (not lt!547925))))

(declare-fun lt!547926 () Bool)

(assert (=> d!133063 (= lt!547925 lt!547926)))

(declare-fun lt!547924 () Unit!39849)

(declare-fun e!685897 () Unit!39849)

(assert (=> d!133063 (= lt!547924 e!685897)))

(declare-fun c!118757 () Bool)

(assert (=> d!133063 (= c!118757 lt!547926)))

(assert (=> d!133063 (= lt!547926 (containsKey!592 (toList!8911 lt!547658) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133063 (= (contains!6910 lt!547658 #b1000000000000000000000000000000000000000000000000000000000000000) lt!547925)))

(declare-fun b!1207757 () Bool)

(declare-fun lt!547927 () Unit!39849)

(assert (=> b!1207757 (= e!685897 lt!547927)))

(assert (=> b!1207757 (= lt!547927 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8911 lt!547658) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1207757 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547658) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1207758 () Bool)

(declare-fun Unit!39881 () Unit!39849)

(assert (=> b!1207758 (= e!685897 Unit!39881)))

(declare-fun b!1207759 () Bool)

(assert (=> b!1207759 (= e!685898 (isDefined!464 (getValueByKey!638 (toList!8911 lt!547658) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133063 c!118757) b!1207757))

(assert (= (and d!133063 (not c!118757)) b!1207758))

(assert (= (and d!133063 (not res!802917)) b!1207759))

(declare-fun m!1113189 () Bool)

(assert (=> d!133063 m!1113189))

(declare-fun m!1113191 () Bool)

(assert (=> b!1207757 m!1113191))

(declare-fun m!1113193 () Bool)

(assert (=> b!1207757 m!1113193))

(assert (=> b!1207757 m!1113193))

(declare-fun m!1113195 () Bool)

(assert (=> b!1207757 m!1113195))

(assert (=> b!1207759 m!1113193))

(assert (=> b!1207759 m!1113193))

(assert (=> b!1207759 m!1113195))

(assert (=> b!1207327 d!133063))

(assert (=> b!1207330 d!132963))

(declare-fun condMapEmpty!47869 () Bool)

(declare-fun mapDefault!47869 () ValueCell!14624)

(assert (=> mapNonEmpty!47868 (= condMapEmpty!47869 (= mapRest!47868 ((as const (Array (_ BitVec 32) ValueCell!14624)) mapDefault!47869)))))

(declare-fun e!685899 () Bool)

(declare-fun mapRes!47869 () Bool)

(assert (=> mapNonEmpty!47868 (= tp!90910 (and e!685899 mapRes!47869))))

(declare-fun b!1207761 () Bool)

(assert (=> b!1207761 (= e!685899 tp_is_empty!30667)))

(declare-fun mapIsEmpty!47869 () Bool)

(assert (=> mapIsEmpty!47869 mapRes!47869))

(declare-fun mapNonEmpty!47869 () Bool)

(declare-fun tp!90911 () Bool)

(declare-fun e!685900 () Bool)

(assert (=> mapNonEmpty!47869 (= mapRes!47869 (and tp!90911 e!685900))))

(declare-fun mapValue!47869 () ValueCell!14624)

(declare-fun mapKey!47869 () (_ BitVec 32))

(declare-fun mapRest!47869 () (Array (_ BitVec 32) ValueCell!14624))

(assert (=> mapNonEmpty!47869 (= mapRest!47868 (store mapRest!47869 mapKey!47869 mapValue!47869))))

(declare-fun b!1207760 () Bool)

(assert (=> b!1207760 (= e!685900 tp_is_empty!30667)))

(assert (= (and mapNonEmpty!47868 condMapEmpty!47869) mapIsEmpty!47869))

(assert (= (and mapNonEmpty!47868 (not condMapEmpty!47869)) mapNonEmpty!47869))

(assert (= (and mapNonEmpty!47869 ((_ is ValueCellFull!14624) mapValue!47869)) b!1207760))

(assert (= (and mapNonEmpty!47868 ((_ is ValueCellFull!14624) mapDefault!47869)) b!1207761))

(declare-fun m!1113197 () Bool)

(assert (=> mapNonEmpty!47869 m!1113197))

(declare-fun b_lambda!21445 () Bool)

(assert (= b_lambda!21427 (or (and start!100818 b_free!25963) b_lambda!21445)))

(declare-fun b_lambda!21447 () Bool)

(assert (= b_lambda!21423 (or (and start!100818 b_free!25963) b_lambda!21447)))

(declare-fun b_lambda!21449 () Bool)

(assert (= b_lambda!21435 (or (and start!100818 b_free!25963) b_lambda!21449)))

(declare-fun b_lambda!21451 () Bool)

(assert (= b_lambda!21429 (or (and start!100818 b_free!25963) b_lambda!21451)))

(declare-fun b_lambda!21453 () Bool)

(assert (= b_lambda!21441 (or (and start!100818 b_free!25963) b_lambda!21453)))

(declare-fun b_lambda!21455 () Bool)

(assert (= b_lambda!21437 (or (and start!100818 b_free!25963) b_lambda!21455)))

(declare-fun b_lambda!21457 () Bool)

(assert (= b_lambda!21433 (or (and start!100818 b_free!25963) b_lambda!21457)))

(declare-fun b_lambda!21459 () Bool)

(assert (= b_lambda!21425 (or (and start!100818 b_free!25963) b_lambda!21459)))

(declare-fun b_lambda!21461 () Bool)

(assert (= b_lambda!21443 (or (and start!100818 b_free!25963) b_lambda!21461)))

(declare-fun b_lambda!21463 () Bool)

(assert (= b_lambda!21431 (or (and start!100818 b_free!25963) b_lambda!21463)))

(declare-fun b_lambda!21465 () Bool)

(assert (= b_lambda!21439 (or (and start!100818 b_free!25963) b_lambda!21465)))

(check-sat (not b!1207630) (not d!132955) (not b_lambda!21405) (not d!132945) (not b!1207642) (not b!1207670) (not d!132977) (not b!1207667) (not d!132913) (not b!1207399) (not b!1207638) (not b!1207455) (not b!1207679) (not b!1207633) (not d!132915) (not b!1207558) (not d!132883) (not d!133051) (not b!1207516) (not b_lambda!21457) (not b!1207453) (not d!132997) (not d!133049) (not d!133041) (not d!132875) (not bm!58973) (not b!1207752) (not d!132985) (not b!1207397) (not b!1207519) (not b_lambda!21411) (not b!1207606) (not d!132901) (not d!133019) (not b!1207695) (not d!132863) (not b!1207557) (not d!132943) (not d!132859) (not b!1207548) (not b!1207694) (not d!132877) (not b!1207671) (not b!1207472) (not d!132917) (not bm!58956) (not d!133009) (not b!1207759) (not b!1207510) (not b!1207637) (not d!132999) (not b_lambda!21463) (not b_lambda!21451) (not d!133037) (not b!1207527) (not b!1207511) (not b!1207421) (not d!133007) (not b!1207650) (not b!1207414) (not b!1207537) (not b!1207722) (not b_lambda!21421) (not d!133023) (not b!1207473) (not b_lambda!21385) (not d!133017) (not bm!58982) (not b!1207631) (not mapNonEmpty!47869) (not d!132939) (not b!1207685) (not d!132963) (not b!1207607) (not b!1207644) (not b!1207565) (not b!1207532) (not d!133029) (not b!1207406) (not d!132919) (not d!133021) (not b!1207717) (not b_next!25963) (not b!1207673) (not b!1207689) (not b_lambda!21415) (not d!132887) (not b!1207428) (not b!1207739) (not b!1207569) (not b!1207504) (not b!1207697) (not d!132891) (not b_lambda!21413) (not b!1207704) (not b!1207525) (not b_lambda!21447) (not b!1207649) (not b!1207711) (not b!1207571) (not b!1207437) (not b_lambda!21461) (not d!132889) (not b!1207538) (not bm!58981) (not d!132893) (not b!1207560) (not b_lambda!21459) (not b!1207701) (not b!1207705) (not d!133011) (not b!1207715) (not b!1207658) (not b!1207678) (not bm!58972) (not b!1207621) (not b!1207405) (not b!1207567) (not b!1207619) (not b!1207422) (not d!132993) (not d!132961) (not b!1207614) (not b!1207450) (not d!133057) (not b!1207750) (not b!1207608) (not b!1207703) (not b!1207602) (not b!1207603) (not b!1207691) (not d!132931) (not b!1207591) (not b!1207590) (not b!1207699) (not b!1207733) (not b!1207536) (not d!133001) (not bm!58971) (not d!132885) (not b!1207420) (not b!1207726) (not b!1207512) (not d!132903) (not b!1207417) (not d!132937) b_and!42955 (not d!133039) (not b!1207409) (not b!1207407) (not b!1207496) (not d!132899) (not b!1207653) (not b!1207639) (not b!1207517) (not d!132909) (not d!132979) (not d!132971) (not d!133055) (not bm!58974) (not d!132927) (not b!1207676) (not d!132975) (not bm!58980) (not b!1207735) (not b!1207730) (not b!1207601) (not d!133013) (not bm!58957) (not b!1207412) (not b!1207501) (not d!132969) (not bm!58983) (not b!1207719) (not b_lambda!21419) (not d!132879) (not b!1207661) (not b!1207413) (not b!1207523) (not b!1207641) (not b_lambda!21455) (not b!1207712) (not b!1207626) (not b_lambda!21409) (not b!1207738) (not d!132935) (not bm!58976) (not b!1207744) (not d!132907) (not bm!58975) (not d!132987) (not b!1207743) (not b!1207543) (not b!1207708) (not b!1207611) (not b!1207598) (not b!1207636) (not b_lambda!21449) (not b!1207585) (not b!1207680) (not b_lambda!21445) (not b!1207616) (not b!1207714) (not bm!58966) (not b!1207435) (not b!1207736) (not b_lambda!21417) (not bm!58977) (not b!1207657) (not d!132923) (not b!1207500) (not b!1207716) (not b!1207622) (not d!133047) (not b!1207599) (not b!1207540) (not d!132953) (not b!1207593) (not b!1207545) (not b!1207449) (not b!1207663) (not b!1207664) (not b!1207757) (not d!133005) (not b!1207515) (not b!1207740) (not b!1207692) (not d!132973) (not d!133043) (not b_lambda!21465) (not b!1207613) (not d!133033) (not b!1207721) (not b!1207551) (not b!1207748) (not b!1207505) (not b!1207627) (not b!1207734) (not b!1207665) (not b_lambda!21407) (not b!1207434) (not b!1207647) (not d!133045) (not d!133053) (not b!1207624) (not b!1207620) (not b!1207702) tp_is_empty!30667 (not b!1207669) (not b!1207706) (not b!1207674) (not b!1207690) (not d!132921) (not b!1207746) (not b!1207549) (not b!1207544) (not b!1207563) (not b!1207415) (not b_lambda!21453) (not b!1207629) (not d!133063) (not b!1207742) (not b!1207596) (not b!1207466) (not d!132965) (not d!133061) (not d!132861) (not b!1207597) (not d!132981) (not b!1207427) (not b!1207546) (not d!132867) (not b!1207514))
(check-sat b_and!42955 (not b_next!25963))
