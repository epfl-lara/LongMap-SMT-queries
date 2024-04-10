; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100642 () Bool)

(assert start!100642)

(declare-fun b_free!25903 () Bool)

(declare-fun b_next!25903 () Bool)

(assert (=> start!100642 (= b_free!25903 (not b_next!25903))))

(declare-fun tp!90702 () Bool)

(declare-fun b_and!42733 () Bool)

(assert (=> start!100642 (= tp!90702 b_and!42733)))

(declare-fun b!1203879 () Bool)

(declare-fun e!683646 () Bool)

(declare-fun e!683635 () Bool)

(assert (=> b!1203879 (= e!683646 e!683635)))

(declare-fun res!801032 () Bool)

(assert (=> b!1203879 (=> res!801032 e!683635)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77989 0))(
  ( (array!77990 (arr!37638 (Array (_ BitVec 32) (_ BitVec 64))) (size!38174 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77989)

(assert (=> b!1203879 (= res!801032 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38174 _keys!1208))))))

(declare-datatypes ((Unit!39920 0))(
  ( (Unit!39921) )
))
(declare-fun lt!545829 () Unit!39920)

(declare-fun e!683643 () Unit!39920)

(assert (=> b!1203879 (= lt!545829 e!683643)))

(declare-fun c!117964 () Bool)

(declare-fun lt!545826 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1203879 (= c!117964 (and (not lt!545826) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203879 (= lt!545826 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!45937 0))(
  ( (V!45938 (val!15360 Int)) )
))
(declare-fun zeroValue!944 () V!45937)

(declare-fun lt!545824 () array!77989)

(declare-fun bm!58080 () Bool)

(declare-datatypes ((tuple2!19692 0))(
  ( (tuple2!19693 (_1!9857 (_ BitVec 64)) (_2!9857 V!45937)) )
))
(declare-datatypes ((List!26502 0))(
  ( (Nil!26499) (Cons!26498 (h!27707 tuple2!19692) (t!39385 List!26502)) )
))
(declare-datatypes ((ListLongMap!17661 0))(
  ( (ListLongMap!17662 (toList!8846 List!26502)) )
))
(declare-fun call!58089 () ListLongMap!17661)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14594 0))(
  ( (ValueCellFull!14594 (v!18001 V!45937)) (EmptyCell!14594) )
))
(declare-datatypes ((array!77991 0))(
  ( (array!77992 (arr!37639 (Array (_ BitVec 32) ValueCell!14594)) (size!38175 (_ BitVec 32))) )
))
(declare-fun lt!545822 () array!77991)

(declare-fun minValue!944 () V!45937)

(declare-fun getCurrentListMapNoExtraKeys!5282 (array!77989 array!77991 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) Int) ListLongMap!17661)

(assert (=> bm!58080 (= call!58089 (getCurrentListMapNoExtraKeys!5282 lt!545824 lt!545822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203880 () Bool)

(declare-fun res!801037 () Bool)

(declare-fun e!683639 () Bool)

(assert (=> b!1203880 (=> (not res!801037) (not e!683639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203880 (= res!801037 (validMask!0 mask!1564))))

(declare-fun call!58086 () ListLongMap!17661)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1203881 () Bool)

(declare-fun e!683641 () Bool)

(declare-fun -!1812 (ListLongMap!17661 (_ BitVec 64)) ListLongMap!17661)

(assert (=> b!1203881 (= e!683641 (= call!58089 (-!1812 call!58086 k!934)))))

(declare-fun b!1203882 () Bool)

(declare-fun e!683640 () Bool)

(declare-fun e!683648 () Bool)

(assert (=> b!1203882 (= e!683640 e!683648)))

(declare-fun res!801027 () Bool)

(assert (=> b!1203882 (=> res!801027 e!683648)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203882 (= res!801027 (not (= from!1455 i!673)))))

(declare-fun lt!545827 () ListLongMap!17661)

(assert (=> b!1203882 (= lt!545827 (getCurrentListMapNoExtraKeys!5282 lt!545824 lt!545822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77991)

(declare-fun dynLambda!3194 (Int (_ BitVec 64)) V!45937)

(assert (=> b!1203882 (= lt!545822 (array!77992 (store (arr!37639 _values!996) i!673 (ValueCellFull!14594 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38175 _values!996)))))

(declare-fun lt!545833 () ListLongMap!17661)

(assert (=> b!1203882 (= lt!545833 (getCurrentListMapNoExtraKeys!5282 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203883 () Bool)

(declare-fun e!683645 () Unit!39920)

(assert (=> b!1203883 (= e!683643 e!683645)))

(declare-fun c!117962 () Bool)

(assert (=> b!1203883 (= c!117962 (and (not lt!545826) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203884 () Bool)

(declare-fun res!801033 () Bool)

(declare-fun e!683637 () Bool)

(assert (=> b!1203884 (=> (not res!801033) (not e!683637))))

(declare-datatypes ((List!26503 0))(
  ( (Nil!26500) (Cons!26499 (h!27708 (_ BitVec 64)) (t!39386 List!26503)) )
))
(declare-fun arrayNoDuplicates!0 (array!77989 (_ BitVec 32) List!26503) Bool)

(assert (=> b!1203884 (= res!801033 (arrayNoDuplicates!0 lt!545824 #b00000000000000000000000000000000 Nil!26500))))

(declare-fun b!1203885 () Bool)

(declare-fun res!801038 () Bool)

(assert (=> b!1203885 (=> (not res!801038) (not e!683639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77989 (_ BitVec 32)) Bool)

(assert (=> b!1203885 (= res!801038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1203886 () Bool)

(declare-fun lt!545834 () Unit!39920)

(assert (=> b!1203886 (= e!683643 lt!545834)))

(declare-fun lt!545825 () Unit!39920)

(declare-fun call!58088 () Unit!39920)

(assert (=> b!1203886 (= lt!545825 call!58088)))

(declare-fun lt!545835 () ListLongMap!17661)

(declare-fun lt!545830 () ListLongMap!17661)

(declare-fun +!3972 (ListLongMap!17661 tuple2!19692) ListLongMap!17661)

(assert (=> b!1203886 (= lt!545835 (+!3972 lt!545830 (tuple2!19693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!58083 () Bool)

(assert (=> b!1203886 call!58083))

(declare-fun addStillContains!1001 (ListLongMap!17661 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39920)

(assert (=> b!1203886 (= lt!545834 (addStillContains!1001 lt!545835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!58090 () ListLongMap!17661)

(declare-fun contains!6902 (ListLongMap!17661 (_ BitVec 64)) Bool)

(assert (=> b!1203886 (contains!6902 call!58090 k!934)))

(declare-fun b!1203887 () Bool)

(declare-fun e!683644 () Bool)

(assert (=> b!1203887 (= e!683644 e!683646)))

(declare-fun res!801030 () Bool)

(assert (=> b!1203887 (=> res!801030 e!683646)))

(assert (=> b!1203887 (= res!801030 (not (contains!6902 lt!545830 k!934)))))

(assert (=> b!1203887 (= lt!545830 (getCurrentListMapNoExtraKeys!5282 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203888 () Bool)

(declare-fun e!683647 () Bool)

(declare-fun tp_is_empty!30607 () Bool)

(assert (=> b!1203888 (= e!683647 tp_is_empty!30607)))

(declare-fun b!1203889 () Bool)

(assert (=> b!1203889 (= e!683648 e!683644)))

(declare-fun res!801039 () Bool)

(assert (=> b!1203889 (=> res!801039 e!683644)))

(assert (=> b!1203889 (= res!801039 (not (= (select (arr!37638 _keys!1208) from!1455) k!934)))))

(assert (=> b!1203889 e!683641))

(declare-fun c!117965 () Bool)

(assert (=> b!1203889 (= c!117965 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545823 () Unit!39920)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1017 (array!77989 array!77991 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39920)

(assert (=> b!1203889 (= lt!545823 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1017 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203890 () Bool)

(declare-fun e!683638 () Unit!39920)

(declare-fun lt!545832 () Unit!39920)

(assert (=> b!1203890 (= e!683638 lt!545832)))

(declare-fun call!58085 () Unit!39920)

(assert (=> b!1203890 (= lt!545832 call!58085)))

(declare-fun call!58087 () Bool)

(assert (=> b!1203890 call!58087))

(declare-fun b!1203891 () Bool)

(declare-fun e!683636 () Bool)

(declare-fun mapRes!47757 () Bool)

(assert (=> b!1203891 (= e!683636 (and e!683647 mapRes!47757))))

(declare-fun condMapEmpty!47757 () Bool)

(declare-fun mapDefault!47757 () ValueCell!14594)

