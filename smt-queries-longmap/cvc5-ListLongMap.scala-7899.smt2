; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98138 () Bool)

(assert start!98138)

(declare-fun b_free!23839 () Bool)

(declare-fun b_next!23839 () Bool)

(assert (=> start!98138 (= b_free!23839 (not b_next!23839))))

(declare-fun tp!84221 () Bool)

(declare-fun b_and!38461 () Bool)

(assert (=> start!98138 (= tp!84221 b_and!38461)))

(declare-fun b!1128091 () Bool)

(declare-fun res!753875 () Bool)

(declare-fun e!642050 () Bool)

(assert (=> b!1128091 (=> (not res!753875) (not e!642050))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128091 (= res!753875 (validKeyInArray!0 k!934))))

(declare-fun b!1128092 () Bool)

(declare-fun res!753882 () Bool)

(assert (=> b!1128092 (=> (not res!753882) (not e!642050))))

(declare-datatypes ((array!73597 0))(
  ( (array!73598 (arr!35451 (Array (_ BitVec 32) (_ BitVec 64))) (size!35987 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73597)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73597 (_ BitVec 32)) Bool)

(assert (=> b!1128092 (= res!753882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128093 () Bool)

(declare-fun e!642053 () Bool)

(assert (=> b!1128093 (= e!642053 true)))

(declare-datatypes ((V!42953 0))(
  ( (V!42954 (val!14241 Int)) )
))
(declare-fun zeroValue!944 () V!42953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!500831 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13475 0))(
  ( (ValueCellFull!13475 (v!16874 V!42953)) (EmptyCell!13475) )
))
(declare-datatypes ((array!73599 0))(
  ( (array!73600 (arr!35452 (Array (_ BitVec 32) ValueCell!13475)) (size!35988 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73599)

(declare-fun minValue!944 () V!42953)

(declare-datatypes ((tuple2!17918 0))(
  ( (tuple2!17919 (_1!8970 (_ BitVec 64)) (_2!8970 V!42953)) )
))
(declare-datatypes ((List!24689 0))(
  ( (Nil!24686) (Cons!24685 (h!25894 tuple2!17918) (t!35520 List!24689)) )
))
(declare-datatypes ((ListLongMap!15887 0))(
  ( (ListLongMap!15888 (toList!7959 List!24689)) )
))
(declare-fun contains!6486 (ListLongMap!15887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4446 (array!73597 array!73599 (_ BitVec 32) (_ BitVec 32) V!42953 V!42953 (_ BitVec 32) Int) ListLongMap!15887)

(assert (=> b!1128093 (= lt!500831 (contains!6486 (getCurrentListMapNoExtraKeys!4446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1128094 () Bool)

(declare-fun res!753879 () Bool)

(assert (=> b!1128094 (=> (not res!753879) (not e!642050))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128094 (= res!753879 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35987 _keys!1208))))))

(declare-fun b!1128095 () Bool)

(declare-fun res!753883 () Bool)

(declare-fun e!642051 () Bool)

(assert (=> b!1128095 (=> (not res!753883) (not e!642051))))

(declare-fun lt!500833 () array!73597)

(declare-datatypes ((List!24690 0))(
  ( (Nil!24687) (Cons!24686 (h!25895 (_ BitVec 64)) (t!35521 List!24690)) )
))
(declare-fun arrayNoDuplicates!0 (array!73597 (_ BitVec 32) List!24690) Bool)

(assert (=> b!1128095 (= res!753883 (arrayNoDuplicates!0 lt!500833 #b00000000000000000000000000000000 Nil!24687))))

(declare-fun b!1128096 () Bool)

(declare-fun e!642054 () Bool)

(declare-fun tp_is_empty!28369 () Bool)

(assert (=> b!1128096 (= e!642054 tp_is_empty!28369)))

(declare-fun b!1128097 () Bool)

(declare-fun e!642052 () Bool)

(declare-fun call!47800 () ListLongMap!15887)

(declare-fun call!47799 () ListLongMap!15887)

(assert (=> b!1128097 (= e!642052 (= call!47800 call!47799))))

(declare-fun b!1128098 () Bool)

(declare-fun res!753873 () Bool)

(assert (=> b!1128098 (=> (not res!753873) (not e!642050))))

(assert (=> b!1128098 (= res!753873 (= (select (arr!35451 _keys!1208) i!673) k!934))))

(declare-fun b!1128099 () Bool)

(declare-fun res!753878 () Bool)

(assert (=> b!1128099 (=> (not res!753878) (not e!642050))))

(assert (=> b!1128099 (= res!753878 (and (= (size!35988 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35987 _keys!1208) (size!35988 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128100 () Bool)

(declare-fun e!642049 () Bool)

(declare-fun mapRes!44371 () Bool)

(assert (=> b!1128100 (= e!642049 (and e!642054 mapRes!44371))))

(declare-fun condMapEmpty!44371 () Bool)

(declare-fun mapDefault!44371 () ValueCell!13475)

