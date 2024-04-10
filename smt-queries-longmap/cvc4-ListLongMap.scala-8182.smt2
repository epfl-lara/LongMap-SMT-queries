; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99962 () Bool)

(assert start!99962)

(declare-fun b_free!25541 () Bool)

(declare-fun b_next!25541 () Bool)

(assert (=> start!99962 (= b_free!25541 (not b_next!25541))))

(declare-fun tp!89336 () Bool)

(declare-fun b_and!41949 () Bool)

(assert (=> start!99962 (= tp!89336 b_and!41949)))

(declare-fun b!1190387 () Bool)

(declare-fun res!791673 () Bool)

(declare-fun e!676736 () Bool)

(assert (=> b!1190387 (=> (not res!791673) (not e!676736))))

(declare-datatypes ((array!76933 0))(
  ( (array!76934 (arr!37116 (Array (_ BitVec 32) (_ BitVec 64))) (size!37652 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76933)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45221 0))(
  ( (V!45222 (val!15092 Int)) )
))
(declare-datatypes ((ValueCell!14326 0))(
  ( (ValueCellFull!14326 (v!17730 V!45221)) (EmptyCell!14326) )
))
(declare-datatypes ((array!76935 0))(
  ( (array!76936 (arr!37117 (Array (_ BitVec 32) ValueCell!14326)) (size!37653 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76935)

(assert (=> b!1190387 (= res!791673 (and (= (size!37653 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37652 _keys!1208) (size!37653 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190388 () Bool)

(declare-fun res!791675 () Bool)

(declare-fun e!676735 () Bool)

(assert (=> b!1190388 (=> (not res!791675) (not e!676735))))

(declare-fun lt!541434 () array!76933)

(declare-datatypes ((List!26132 0))(
  ( (Nil!26129) (Cons!26128 (h!27337 (_ BitVec 64)) (t!38665 List!26132)) )
))
(declare-fun arrayNoDuplicates!0 (array!76933 (_ BitVec 32) List!26132) Bool)

(assert (=> b!1190388 (= res!791675 (arrayNoDuplicates!0 lt!541434 #b00000000000000000000000000000000 Nil!26129))))

(declare-fun b!1190390 () Bool)

(declare-fun e!676737 () Bool)

(assert (=> b!1190390 (= e!676737 true)))

(declare-fun zeroValue!944 () V!45221)

(declare-fun lt!541429 () array!76935)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45221)

(declare-datatypes ((tuple2!19386 0))(
  ( (tuple2!19387 (_1!9704 (_ BitVec 64)) (_2!9704 V!45221)) )
))
(declare-datatypes ((List!26133 0))(
  ( (Nil!26130) (Cons!26129 (h!27338 tuple2!19386) (t!38666 List!26133)) )
))
(declare-datatypes ((ListLongMap!17355 0))(
  ( (ListLongMap!17356 (toList!8693 List!26133)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5134 (array!76933 array!76935 (_ BitVec 32) (_ BitVec 32) V!45221 V!45221 (_ BitVec 32) Int) ListLongMap!17355)

(declare-fun -!1720 (ListLongMap!17355 (_ BitVec 64)) ListLongMap!17355)

(assert (=> b!1190390 (= (getCurrentListMapNoExtraKeys!5134 lt!541434 lt!541429 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1720 (getCurrentListMapNoExtraKeys!5134 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39482 0))(
  ( (Unit!39483) )
))
(declare-fun lt!541433 () Unit!39482)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!929 (array!76933 array!76935 (_ BitVec 32) (_ BitVec 32) V!45221 V!45221 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39482)

(assert (=> b!1190390 (= lt!541433 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!929 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190391 () Bool)

(declare-fun res!791683 () Bool)

(assert (=> b!1190391 (=> (not res!791683) (not e!676736))))

(assert (=> b!1190391 (= res!791683 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26129))))

(declare-fun b!1190392 () Bool)

(declare-fun e!676734 () Bool)

(assert (=> b!1190392 (= e!676735 (not e!676734))))

(declare-fun res!791677 () Bool)

(assert (=> b!1190392 (=> res!791677 e!676734)))

(assert (=> b!1190392 (= res!791677 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190392 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541431 () Unit!39482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76933 (_ BitVec 64) (_ BitVec 32)) Unit!39482)

(assert (=> b!1190392 (= lt!541431 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190393 () Bool)

(declare-fun res!791678 () Bool)

(assert (=> b!1190393 (=> (not res!791678) (not e!676736))))

(assert (=> b!1190393 (= res!791678 (= (select (arr!37116 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!46934 () Bool)

(declare-fun mapRes!46934 () Bool)

(assert (=> mapIsEmpty!46934 mapRes!46934))

(declare-fun b!1190394 () Bool)

(declare-fun res!791679 () Bool)

(assert (=> b!1190394 (=> (not res!791679) (not e!676736))))

(assert (=> b!1190394 (= res!791679 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37652 _keys!1208))))))

(declare-fun b!1190395 () Bool)

(declare-fun res!791682 () Bool)

(assert (=> b!1190395 (=> (not res!791682) (not e!676736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190395 (= res!791682 (validKeyInArray!0 k!934))))

(declare-fun b!1190396 () Bool)

(assert (=> b!1190396 (= e!676736 e!676735)))

(declare-fun res!791676 () Bool)

(assert (=> b!1190396 (=> (not res!791676) (not e!676735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76933 (_ BitVec 32)) Bool)

(assert (=> b!1190396 (= res!791676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541434 mask!1564))))

(assert (=> b!1190396 (= lt!541434 (array!76934 (store (arr!37116 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37652 _keys!1208)))))

(declare-fun b!1190397 () Bool)

(declare-fun e!676738 () Bool)

(declare-fun tp_is_empty!30071 () Bool)

(assert (=> b!1190397 (= e!676738 tp_is_empty!30071)))

(declare-fun b!1190398 () Bool)

(declare-fun res!791681 () Bool)

(assert (=> b!1190398 (=> (not res!791681) (not e!676736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190398 (= res!791681 (validMask!0 mask!1564))))

(declare-fun b!1190399 () Bool)

(declare-fun e!676733 () Bool)

(assert (=> b!1190399 (= e!676733 tp_is_empty!30071)))

(declare-fun b!1190400 () Bool)

(declare-fun res!791674 () Bool)

(assert (=> b!1190400 (=> (not res!791674) (not e!676736))))

(assert (=> b!1190400 (= res!791674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190389 () Bool)

(declare-fun e!676732 () Bool)

(assert (=> b!1190389 (= e!676732 (and e!676738 mapRes!46934))))

(declare-fun condMapEmpty!46934 () Bool)

(declare-fun mapDefault!46934 () ValueCell!14326)

