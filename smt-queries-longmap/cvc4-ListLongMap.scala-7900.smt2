; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98148 () Bool)

(assert start!98148)

(declare-fun b_free!23849 () Bool)

(declare-fun b_next!23849 () Bool)

(assert (=> start!98148 (= b_free!23849 (not b_next!23849))))

(declare-fun tp!84250 () Bool)

(declare-fun b_and!38481 () Bool)

(assert (=> start!98148 (= tp!84250 b_and!38481)))

(declare-fun b!1128371 () Bool)

(declare-fun e!642206 () Bool)

(declare-datatypes ((V!42965 0))(
  ( (V!42966 (val!14246 Int)) )
))
(declare-datatypes ((tuple2!17928 0))(
  ( (tuple2!17929 (_1!8975 (_ BitVec 64)) (_2!8975 V!42965)) )
))
(declare-datatypes ((List!24697 0))(
  ( (Nil!24694) (Cons!24693 (h!25902 tuple2!17928) (t!35538 List!24697)) )
))
(declare-datatypes ((ListLongMap!15897 0))(
  ( (ListLongMap!15898 (toList!7964 List!24697)) )
))
(declare-fun call!47830 () ListLongMap!15897)

(declare-fun call!47829 () ListLongMap!15897)

(assert (=> b!1128371 (= e!642206 (= call!47830 call!47829))))

(declare-fun b!1128372 () Bool)

(declare-fun res!754073 () Bool)

(declare-fun e!642202 () Bool)

(assert (=> b!1128372 (=> (not res!754073) (not e!642202))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128372 (= res!754073 (validMask!0 mask!1564))))

(declare-fun b!1128373 () Bool)

(declare-fun res!754067 () Bool)

(assert (=> b!1128373 (=> (not res!754067) (not e!642202))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73617 0))(
  ( (array!73618 (arr!35461 (Array (_ BitVec 32) (_ BitVec 64))) (size!35997 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73617)

(assert (=> b!1128373 (= res!754067 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35997 _keys!1208))))))

(declare-fun b!1128374 () Bool)

(declare-fun e!642198 () Bool)

(declare-fun e!642203 () Bool)

(assert (=> b!1128374 (= e!642198 (not e!642203))))

(declare-fun res!754076 () Bool)

(assert (=> b!1128374 (=> res!754076 e!642203)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128374 (= res!754076 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128374 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36968 0))(
  ( (Unit!36969) )
))
(declare-fun lt!500939 () Unit!36968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73617 (_ BitVec 64) (_ BitVec 32)) Unit!36968)

(assert (=> b!1128374 (= lt!500939 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1128375 () Bool)

(declare-fun e!642201 () Bool)

(declare-fun e!642207 () Bool)

(assert (=> b!1128375 (= e!642201 e!642207)))

(declare-fun res!754077 () Bool)

(assert (=> b!1128375 (=> res!754077 e!642207)))

(assert (=> b!1128375 (= res!754077 (not (= (select (arr!35461 _keys!1208) from!1455) k!934)))))

(assert (=> b!1128375 e!642206))

(declare-fun c!109764 () Bool)

(assert (=> b!1128375 (= c!109764 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42965)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13480 0))(
  ( (ValueCellFull!13480 (v!16879 V!42965)) (EmptyCell!13480) )
))
(declare-datatypes ((array!73619 0))(
  ( (array!73620 (arr!35462 (Array (_ BitVec 32) ValueCell!13480)) (size!35998 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73619)

(declare-fun minValue!944 () V!42965)

(declare-fun lt!500942 () Unit!36968)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!402 (array!73617 array!73619 (_ BitVec 32) (_ BitVec 32) V!42965 V!42965 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36968)

(assert (=> b!1128375 (= lt!500942 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128376 () Bool)

(declare-fun res!754066 () Bool)

(assert (=> b!1128376 (=> (not res!754066) (not e!642202))))

(assert (=> b!1128376 (= res!754066 (= (select (arr!35461 _keys!1208) i!673) k!934))))

(declare-fun b!1128377 () Bool)

(assert (=> b!1128377 (= e!642207 true)))

(declare-fun lt!500941 () Bool)

(declare-fun contains!6489 (ListLongMap!15897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4451 (array!73617 array!73619 (_ BitVec 32) (_ BitVec 32) V!42965 V!42965 (_ BitVec 32) Int) ListLongMap!15897)

(assert (=> b!1128377 (= lt!500941 (contains!6489 (getCurrentListMapNoExtraKeys!4451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1128378 () Bool)

(declare-fun e!642199 () Bool)

(declare-fun tp_is_empty!28379 () Bool)

(assert (=> b!1128378 (= e!642199 tp_is_empty!28379)))

(declare-fun b!1128379 () Bool)

(declare-fun res!754068 () Bool)

(assert (=> b!1128379 (=> (not res!754068) (not e!642202))))

(declare-datatypes ((List!24698 0))(
  ( (Nil!24695) (Cons!24694 (h!25903 (_ BitVec 64)) (t!35539 List!24698)) )
))
(declare-fun arrayNoDuplicates!0 (array!73617 (_ BitVec 32) List!24698) Bool)

(assert (=> b!1128379 (= res!754068 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24695))))

(declare-fun b!1128380 () Bool)

(declare-fun e!642204 () Bool)

(declare-fun e!642200 () Bool)

(declare-fun mapRes!44386 () Bool)

(assert (=> b!1128380 (= e!642204 (and e!642200 mapRes!44386))))

(declare-fun condMapEmpty!44386 () Bool)

(declare-fun mapDefault!44386 () ValueCell!13480)

