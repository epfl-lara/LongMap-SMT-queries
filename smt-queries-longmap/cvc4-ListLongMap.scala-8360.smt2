; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101746 () Bool)

(assert start!101746)

(declare-fun b_free!26435 () Bool)

(declare-fun b_next!26435 () Bool)

(assert (=> start!101746 (= b_free!26435 (not b_next!26435))))

(declare-fun tp!92350 () Bool)

(declare-fun b_and!44131 () Bool)

(assert (=> start!101746 (= tp!92350 b_and!44131)))

(declare-fun b!1224947 () Bool)

(declare-fun res!814009 () Bool)

(declare-fun e!695719 () Bool)

(assert (=> b!1224947 (=> (not res!814009) (not e!695719))))

(declare-datatypes ((array!79061 0))(
  ( (array!79062 (arr!38157 (Array (_ BitVec 32) (_ BitVec 64))) (size!38693 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79061)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46645 0))(
  ( (V!46646 (val!15626 Int)) )
))
(declare-datatypes ((ValueCell!14860 0))(
  ( (ValueCellFull!14860 (v!18288 V!46645)) (EmptyCell!14860) )
))
(declare-datatypes ((array!79063 0))(
  ( (array!79064 (arr!38158 (Array (_ BitVec 32) ValueCell!14860)) (size!38694 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79063)

(assert (=> b!1224947 (= res!814009 (and (= (size!38694 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38693 _keys!1208) (size!38694 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224948 () Bool)

(declare-fun e!695720 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224948 (= e!695720 (bvslt i!673 (size!38694 _values!996)))))

(declare-datatypes ((tuple2!20140 0))(
  ( (tuple2!20141 (_1!10081 (_ BitVec 64)) (_2!10081 V!46645)) )
))
(declare-datatypes ((List!26940 0))(
  ( (Nil!26937) (Cons!26936 (h!28145 tuple2!20140) (t!40355 List!26940)) )
))
(declare-datatypes ((ListLongMap!18109 0))(
  ( (ListLongMap!18110 (toList!9070 List!26940)) )
))
(declare-fun lt!557953 () ListLongMap!18109)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!557952 () ListLongMap!18109)

(declare-fun -!1969 (ListLongMap!18109 (_ BitVec 64)) ListLongMap!18109)

(assert (=> b!1224948 (= (-!1969 lt!557953 k!934) lt!557952)))

(declare-datatypes ((Unit!40595 0))(
  ( (Unit!40596) )
))
(declare-fun lt!557958 () Unit!40595)

(declare-fun lt!557948 () ListLongMap!18109)

(declare-fun lt!557957 () V!46645)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun addRemoveCommutativeForDiffKeys!212 (ListLongMap!18109 (_ BitVec 64) V!46645 (_ BitVec 64)) Unit!40595)

(assert (=> b!1224948 (= lt!557958 (addRemoveCommutativeForDiffKeys!212 lt!557948 (select (arr!38157 _keys!1208) from!1455) lt!557957 k!934))))

(declare-fun lt!557956 () ListLongMap!18109)

(declare-fun lt!557945 () ListLongMap!18109)

(declare-fun lt!557947 () ListLongMap!18109)

(assert (=> b!1224948 (and (= lt!557945 lt!557953) (= lt!557956 lt!557947))))

(declare-fun lt!557949 () tuple2!20140)

(declare-fun +!4125 (ListLongMap!18109 tuple2!20140) ListLongMap!18109)

(assert (=> b!1224948 (= lt!557953 (+!4125 lt!557948 lt!557949))))

(assert (=> b!1224948 (not (= (select (arr!38157 _keys!1208) from!1455) k!934))))

(declare-fun lt!557946 () Unit!40595)

(declare-fun e!695717 () Unit!40595)

(assert (=> b!1224948 (= lt!557946 e!695717)))

(declare-fun c!120473 () Bool)

(assert (=> b!1224948 (= c!120473 (= (select (arr!38157 _keys!1208) from!1455) k!934))))

(declare-fun e!695718 () Bool)

(assert (=> b!1224948 e!695718))

(declare-fun res!814010 () Bool)

(assert (=> b!1224948 (=> (not res!814010) (not e!695718))))

(declare-fun lt!557959 () ListLongMap!18109)

(assert (=> b!1224948 (= res!814010 (= lt!557959 lt!557952))))

(assert (=> b!1224948 (= lt!557952 (+!4125 lt!557956 lt!557949))))

(assert (=> b!1224948 (= lt!557949 (tuple2!20141 (select (arr!38157 _keys!1208) from!1455) lt!557957))))

(declare-fun lt!557954 () V!46645)

(declare-fun get!19489 (ValueCell!14860 V!46645) V!46645)

(assert (=> b!1224948 (= lt!557957 (get!19489 (select (arr!38158 _values!996) from!1455) lt!557954))))

(declare-fun b!1224949 () Bool)

(declare-fun res!814008 () Bool)

(declare-fun e!695725 () Bool)

(assert (=> b!1224949 (=> (not res!814008) (not e!695725))))

(declare-fun lt!557963 () array!79061)

(declare-datatypes ((List!26941 0))(
  ( (Nil!26938) (Cons!26937 (h!28146 (_ BitVec 64)) (t!40356 List!26941)) )
))
(declare-fun arrayNoDuplicates!0 (array!79061 (_ BitVec 32) List!26941) Bool)

(assert (=> b!1224949 (= res!814008 (arrayNoDuplicates!0 lt!557963 #b00000000000000000000000000000000 Nil!26938))))

(declare-fun b!1224950 () Bool)

(declare-fun res!814004 () Bool)

(assert (=> b!1224950 (=> (not res!814004) (not e!695719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224950 (= res!814004 (validMask!0 mask!1564))))

(declare-fun b!1224951 () Bool)

(declare-fun res!814000 () Bool)

(assert (=> b!1224951 (=> (not res!814000) (not e!695719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79061 (_ BitVec 32)) Bool)

(assert (=> b!1224951 (= res!814000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224952 () Bool)

(declare-fun e!695723 () Bool)

(declare-fun e!695728 () Bool)

(declare-fun mapRes!48607 () Bool)

(assert (=> b!1224952 (= e!695723 (and e!695728 mapRes!48607))))

(declare-fun condMapEmpty!48607 () Bool)

(declare-fun mapDefault!48607 () ValueCell!14860)

