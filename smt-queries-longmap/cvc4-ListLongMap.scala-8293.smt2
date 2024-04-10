; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101072 () Bool)

(assert start!101072)

(declare-fun b_free!26033 () Bool)

(declare-fun b_next!26033 () Bool)

(assert (=> start!101072 (= b_free!26033 (not b_next!26033))))

(declare-fun tp!91118 () Bool)

(declare-fun b_and!43165 () Bool)

(assert (=> start!101072 (= tp!91118 b_and!43165)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!687962 () Bool)

(declare-fun b!1211377 () Bool)

(declare-datatypes ((V!46109 0))(
  ( (V!46110 (val!15425 Int)) )
))
(declare-datatypes ((tuple2!19814 0))(
  ( (tuple2!19815 (_1!9918 (_ BitVec 64)) (_2!9918 V!46109)) )
))
(declare-datatypes ((List!26615 0))(
  ( (Nil!26612) (Cons!26611 (h!27820 tuple2!19814) (t!39628 List!26615)) )
))
(declare-datatypes ((ListLongMap!17783 0))(
  ( (ListLongMap!17784 (toList!8907 List!26615)) )
))
(declare-fun call!59860 () ListLongMap!17783)

(declare-fun call!59861 () ListLongMap!17783)

(declare-fun -!1856 (ListLongMap!17783 (_ BitVec 64)) ListLongMap!17783)

(assert (=> b!1211377 (= e!687962 (= call!59860 (-!1856 call!59861 k!934)))))

(declare-fun b!1211378 () Bool)

(declare-fun e!687970 () Bool)

(declare-fun tp_is_empty!30737 () Bool)

(assert (=> b!1211378 (= e!687970 tp_is_empty!30737)))

(declare-fun bm!59855 () Bool)

(declare-fun call!59858 () ListLongMap!17783)

(declare-fun call!59862 () ListLongMap!17783)

(assert (=> bm!59855 (= call!59858 call!59862)))

(declare-fun mapIsEmpty!47977 () Bool)

(declare-fun mapRes!47977 () Bool)

(assert (=> mapIsEmpty!47977 mapRes!47977))

(declare-fun b!1211379 () Bool)

(declare-fun res!804755 () Bool)

(declare-fun e!687963 () Bool)

(assert (=> b!1211379 (=> (not res!804755) (not e!687963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211379 (= res!804755 (validKeyInArray!0 k!934))))

(declare-datatypes ((array!78261 0))(
  ( (array!78262 (arr!37766 (Array (_ BitVec 32) (_ BitVec 64))) (size!38302 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78261)

(declare-fun e!687967 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1211380 () Bool)

(declare-fun arrayContainsKey!0 (array!78261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211380 (= e!687967 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211381 () Bool)

(declare-datatypes ((Unit!40166 0))(
  ( (Unit!40167) )
))
(declare-fun e!687973 () Unit!40166)

(declare-fun e!687964 () Unit!40166)

(assert (=> b!1211381 (= e!687973 e!687964)))

(declare-fun c!119459 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!550212 () Bool)

(assert (=> b!1211381 (= c!119459 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550212))))

(declare-fun b!1211382 () Bool)

(declare-fun c!119457 () Bool)

(assert (=> b!1211382 (= c!119457 (and (not lt!550212) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687976 () Unit!40166)

(assert (=> b!1211382 (= e!687976 e!687973)))

(declare-fun b!1211383 () Bool)

(declare-fun e!687974 () Bool)

(assert (=> b!1211383 (= e!687974 tp_is_empty!30737)))

(declare-fun mapNonEmpty!47977 () Bool)

(declare-fun tp!91117 () Bool)

(assert (=> mapNonEmpty!47977 (= mapRes!47977 (and tp!91117 e!687970))))

(declare-datatypes ((ValueCell!14659 0))(
  ( (ValueCellFull!14659 (v!18077 V!46109)) (EmptyCell!14659) )
))
(declare-datatypes ((array!78263 0))(
  ( (array!78264 (arr!37767 (Array (_ BitVec 32) ValueCell!14659)) (size!38303 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78263)

(declare-fun mapRest!47977 () (Array (_ BitVec 32) ValueCell!14659))

(declare-fun mapValue!47977 () ValueCell!14659)

(declare-fun mapKey!47977 () (_ BitVec 32))

(assert (=> mapNonEmpty!47977 (= (arr!37767 _values!996) (store mapRest!47977 mapKey!47977 mapValue!47977))))

(declare-fun b!1211384 () Bool)

(assert (=> b!1211384 (= e!687967 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550212) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!59863 () Bool)

(declare-fun bm!59856 () Bool)

(declare-fun lt!550219 () ListLongMap!17783)

(declare-fun c!119461 () Bool)

(declare-fun contains!6980 (ListLongMap!17783 (_ BitVec 64)) Bool)

(assert (=> bm!59856 (= call!59863 (contains!6980 (ite c!119461 lt!550219 call!59858) k!934))))

(declare-fun zeroValue!944 () V!46109)

(declare-fun lt!550213 () ListLongMap!17783)

(declare-fun bm!59857 () Bool)

(declare-fun minValue!944 () V!46109)

(declare-fun +!4025 (ListLongMap!17783 tuple2!19814) ListLongMap!17783)

(assert (=> bm!59857 (= call!59862 (+!4025 (ite c!119461 lt!550219 lt!550213) (ite c!119461 (tuple2!19815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119457 (tuple2!19815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1211385 () Bool)

(declare-fun res!804753 () Bool)

(declare-fun e!687965 () Bool)

(assert (=> b!1211385 (=> (not res!804753) (not e!687965))))

(declare-fun lt!550208 () array!78261)

(declare-datatypes ((List!26616 0))(
  ( (Nil!26613) (Cons!26612 (h!27821 (_ BitVec 64)) (t!39629 List!26616)) )
))
(declare-fun arrayNoDuplicates!0 (array!78261 (_ BitVec 32) List!26616) Bool)

(assert (=> b!1211385 (= res!804753 (arrayNoDuplicates!0 lt!550208 #b00000000000000000000000000000000 Nil!26613))))

(declare-fun b!1211386 () Bool)

(declare-fun call!59864 () Bool)

(assert (=> b!1211386 call!59864))

(declare-fun lt!550216 () Unit!40166)

(declare-fun call!59865 () Unit!40166)

(assert (=> b!1211386 (= lt!550216 call!59865)))

(assert (=> b!1211386 (= e!687964 lt!550216)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!59858 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5339 (array!78261 array!78263 (_ BitVec 32) (_ BitVec 32) V!46109 V!46109 (_ BitVec 32) Int) ListLongMap!17783)

(assert (=> bm!59858 (= call!59861 (getCurrentListMapNoExtraKeys!5339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59859 () Bool)

(declare-fun call!59859 () Unit!40166)

(assert (=> bm!59859 (= call!59865 call!59859)))

(declare-fun b!1211387 () Bool)

(declare-fun res!804748 () Bool)

(assert (=> b!1211387 (=> (not res!804748) (not e!687963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78261 (_ BitVec 32)) Bool)

(assert (=> b!1211387 (= res!804748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!687966 () Bool)

(declare-fun b!1211388 () Bool)

(assert (=> b!1211388 (= e!687966 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211389 () Bool)

(declare-fun e!687975 () Bool)

(assert (=> b!1211389 (= e!687975 (and e!687974 mapRes!47977))))

(declare-fun condMapEmpty!47977 () Bool)

(declare-fun mapDefault!47977 () ValueCell!14659)

