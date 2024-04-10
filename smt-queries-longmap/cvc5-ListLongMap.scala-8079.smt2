; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99340 () Bool)

(assert start!99340)

(declare-fun b_free!24919 () Bool)

(declare-fun b_next!24919 () Bool)

(assert (=> start!99340 (= b_free!24919 (not b_next!24919))))

(declare-fun tp!87470 () Bool)

(declare-fun b_and!40705 () Bool)

(assert (=> start!99340 (= tp!87470 b_and!40705)))

(declare-fun b!1171311 () Bool)

(declare-fun res!777496 () Bool)

(declare-fun e!665762 () Bool)

(assert (=> b!1171311 (=> (not res!777496) (not e!665762))))

(declare-datatypes ((array!75717 0))(
  ( (array!75718 (arr!36508 (Array (_ BitVec 32) (_ BitVec 64))) (size!37044 (_ BitVec 32))) )
))
(declare-fun lt!527631 () array!75717)

(declare-datatypes ((List!25618 0))(
  ( (Nil!25615) (Cons!25614 (h!26823 (_ BitVec 64)) (t!37529 List!25618)) )
))
(declare-fun arrayNoDuplicates!0 (array!75717 (_ BitVec 32) List!25618) Bool)

(assert (=> b!1171311 (= res!777496 (arrayNoDuplicates!0 lt!527631 #b00000000000000000000000000000000 Nil!25615))))

(declare-fun b!1171312 () Bool)

(declare-fun e!665767 () Bool)

(declare-fun e!665760 () Bool)

(assert (=> b!1171312 (= e!665767 e!665760)))

(declare-fun res!777509 () Bool)

(assert (=> b!1171312 (=> res!777509 e!665760)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171312 (= res!777509 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44393 0))(
  ( (V!44394 (val!14781 Int)) )
))
(declare-fun zeroValue!944 () V!44393)

(declare-datatypes ((tuple2!18882 0))(
  ( (tuple2!18883 (_1!9452 (_ BitVec 64)) (_2!9452 V!44393)) )
))
(declare-datatypes ((List!25619 0))(
  ( (Nil!25616) (Cons!25615 (h!26824 tuple2!18882) (t!37530 List!25619)) )
))
(declare-datatypes ((ListLongMap!16851 0))(
  ( (ListLongMap!16852 (toList!8441 List!25619)) )
))
(declare-fun lt!527634 () ListLongMap!16851)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14015 0))(
  ( (ValueCellFull!14015 (v!17419 V!44393)) (EmptyCell!14015) )
))
(declare-datatypes ((array!75719 0))(
  ( (array!75720 (arr!36509 (Array (_ BitVec 32) ValueCell!14015)) (size!37045 (_ BitVec 32))) )
))
(declare-fun lt!527638 () array!75719)

(declare-fun minValue!944 () V!44393)

(declare-fun getCurrentListMapNoExtraKeys!4905 (array!75717 array!75719 (_ BitVec 32) (_ BitVec 32) V!44393 V!44393 (_ BitVec 32) Int) ListLongMap!16851)

(assert (=> b!1171312 (= lt!527634 (getCurrentListMapNoExtraKeys!4905 lt!527631 lt!527638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527630 () V!44393)

(declare-fun _values!996 () array!75719)

(assert (=> b!1171312 (= lt!527638 (array!75720 (store (arr!36509 _values!996) i!673 (ValueCellFull!14015 lt!527630)) (size!37045 _values!996)))))

(declare-fun dynLambda!2878 (Int (_ BitVec 64)) V!44393)

(assert (=> b!1171312 (= lt!527630 (dynLambda!2878 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75717)

(declare-fun lt!527637 () ListLongMap!16851)

(assert (=> b!1171312 (= lt!527637 (getCurrentListMapNoExtraKeys!4905 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171313 () Bool)

(declare-fun res!777506 () Bool)

(declare-fun e!665759 () Bool)

(assert (=> b!1171313 (=> res!777506 e!665759)))

(declare-fun contains!6846 (List!25618 (_ BitVec 64)) Bool)

(assert (=> b!1171313 (= res!777506 (contains!6846 Nil!25615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171314 () Bool)

(declare-fun res!777502 () Bool)

(declare-fun e!665765 () Bool)

(assert (=> b!1171314 (=> (not res!777502) (not e!665765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171314 (= res!777502 (validMask!0 mask!1564))))

(declare-fun b!1171315 () Bool)

(assert (=> b!1171315 (= e!665759 true)))

(declare-fun lt!527639 () Bool)

(assert (=> b!1171315 (= lt!527639 (contains!6846 Nil!25615 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171316 () Bool)

(declare-fun e!665769 () Bool)

(declare-fun e!665766 () Bool)

(declare-fun mapRes!46001 () Bool)

(assert (=> b!1171316 (= e!665769 (and e!665766 mapRes!46001))))

(declare-fun condMapEmpty!46001 () Bool)

(declare-fun mapDefault!46001 () ValueCell!14015)

