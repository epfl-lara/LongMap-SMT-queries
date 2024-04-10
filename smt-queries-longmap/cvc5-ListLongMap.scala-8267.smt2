; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100550 () Bool)

(assert start!100550)

(declare-fun b_free!25873 () Bool)

(declare-fun b_next!25873 () Bool)

(assert (=> start!100550 (= b_free!25873 (not b_next!25873))))

(declare-fun tp!90608 () Bool)

(declare-fun b_and!42633 () Bool)

(assert (=> start!100550 (= tp!90608 b_and!42633)))

(declare-fun b!1202215 () Bool)

(declare-datatypes ((Unit!39858 0))(
  ( (Unit!39859) )
))
(declare-fun e!682693 () Unit!39858)

(declare-fun lt!544882 () Unit!39858)

(assert (=> b!1202215 (= e!682693 lt!544882)))

(declare-fun lt!544886 () Unit!39858)

(declare-fun call!57682 () Unit!39858)

(assert (=> b!1202215 (= lt!544886 call!57682)))

(declare-datatypes ((V!45897 0))(
  ( (V!45898 (val!15345 Int)) )
))
(declare-datatypes ((tuple2!19662 0))(
  ( (tuple2!19663 (_1!9842 (_ BitVec 64)) (_2!9842 V!45897)) )
))
(declare-datatypes ((List!26476 0))(
  ( (Nil!26473) (Cons!26472 (h!27681 tuple2!19662) (t!39329 List!26476)) )
))
(declare-datatypes ((ListLongMap!17631 0))(
  ( (ListLongMap!17632 (toList!8831 List!26476)) )
))
(declare-fun lt!544881 () ListLongMap!17631)

(declare-fun lt!544883 () ListLongMap!17631)

(declare-fun zeroValue!944 () V!45897)

(declare-fun +!3960 (ListLongMap!17631 tuple2!19662) ListLongMap!17631)

(assert (=> b!1202215 (= lt!544881 (+!3960 lt!544883 (tuple2!19663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!57676 () Bool)

(assert (=> b!1202215 call!57676))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!45897)

(declare-fun addStillContains!988 (ListLongMap!17631 (_ BitVec 64) V!45897 (_ BitVec 64)) Unit!39858)

(assert (=> b!1202215 (= lt!544882 (addStillContains!988 lt!544881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!57678 () ListLongMap!17631)

(declare-fun contains!6887 (ListLongMap!17631 (_ BitVec 64)) Bool)

(assert (=> b!1202215 (contains!6887 call!57678 k!934)))

(declare-fun b!1202216 () Bool)

(declare-fun e!682681 () Bool)

(declare-fun e!682690 () Bool)

(assert (=> b!1202216 (= e!682681 e!682690)))

(declare-fun res!800203 () Bool)

(assert (=> b!1202216 (=> (not res!800203) (not e!682690))))

(declare-datatypes ((array!77927 0))(
  ( (array!77928 (arr!37608 (Array (_ BitVec 32) (_ BitVec 64))) (size!38144 (_ BitVec 32))) )
))
(declare-fun lt!544887 () array!77927)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77927 (_ BitVec 32)) Bool)

(assert (=> b!1202216 (= res!800203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544887 mask!1564))))

(declare-fun _keys!1208 () array!77927)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202216 (= lt!544887 (array!77928 (store (arr!37608 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38144 _keys!1208)))))

(declare-fun b!1202217 () Bool)

(declare-fun res!800200 () Bool)

(assert (=> b!1202217 (=> (not res!800200) (not e!682681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202217 (= res!800200 (validMask!0 mask!1564))))

(declare-fun b!1202218 () Bool)

(declare-fun res!800197 () Bool)

(assert (=> b!1202218 (=> (not res!800197) (not e!682681))))

(assert (=> b!1202218 (= res!800197 (= (select (arr!37608 _keys!1208) i!673) k!934))))

(declare-fun b!1202219 () Bool)

(declare-fun e!682688 () Bool)

(declare-fun tp_is_empty!30577 () Bool)

(assert (=> b!1202219 (= e!682688 tp_is_empty!30577)))

(declare-fun b!1202220 () Bool)

(declare-fun e!682680 () Bool)

(assert (=> b!1202220 (= e!682690 (not e!682680))))

(declare-fun res!800207 () Bool)

(assert (=> b!1202220 (=> res!800207 e!682680)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1202220 (= res!800207 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202220 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!544877 () Unit!39858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77927 (_ BitVec 64) (_ BitVec 32)) Unit!39858)

(assert (=> b!1202220 (= lt!544877 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1202221 () Bool)

(declare-fun res!800202 () Bool)

(assert (=> b!1202221 (=> (not res!800202) (not e!682681))))

(assert (=> b!1202221 (= res!800202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57674 () Bool)

(declare-fun c!117637 () Bool)

(declare-fun c!117636 () Bool)

(assert (=> bm!57674 (= call!57678 (+!3960 (ite c!117636 lt!544881 lt!544883) (ite c!117636 (tuple2!19663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117637 (tuple2!19663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202222 () Bool)

(declare-fun e!682684 () Bool)

(declare-fun call!57677 () ListLongMap!17631)

(declare-fun call!57681 () ListLongMap!17631)

(assert (=> b!1202222 (= e!682684 (= call!57677 call!57681))))

(declare-fun b!1202223 () Bool)

(declare-fun e!682692 () Bool)

(declare-fun e!682685 () Bool)

(declare-fun mapRes!47708 () Bool)

(assert (=> b!1202223 (= e!682692 (and e!682685 mapRes!47708))))

(declare-fun condMapEmpty!47708 () Bool)

(declare-datatypes ((ValueCell!14579 0))(
  ( (ValueCellFull!14579 (v!17983 V!45897)) (EmptyCell!14579) )
))
(declare-datatypes ((array!77929 0))(
  ( (array!77930 (arr!37609 (Array (_ BitVec 32) ValueCell!14579)) (size!38145 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77929)

(declare-fun mapDefault!47708 () ValueCell!14579)

