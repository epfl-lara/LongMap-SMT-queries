; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101734 () Bool)

(assert start!101734)

(declare-fun b_free!26423 () Bool)

(declare-fun b_next!26423 () Bool)

(assert (=> start!101734 (= b_free!26423 (not b_next!26423))))

(declare-fun tp!92315 () Bool)

(declare-fun b_and!44107 () Bool)

(assert (=> start!101734 (= tp!92315 b_and!44107)))

(declare-fun b!1224573 () Bool)

(declare-fun res!813732 () Bool)

(declare-fun e!695509 () Bool)

(assert (=> b!1224573 (=> (not res!813732) (not e!695509))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224573 (= res!813732 (validMask!0 mask!1564))))

(declare-fun b!1224574 () Bool)

(declare-fun res!813730 () Bool)

(assert (=> b!1224574 (=> (not res!813730) (not e!695509))))

(declare-datatypes ((array!79037 0))(
  ( (array!79038 (arr!38145 (Array (_ BitVec 32) (_ BitVec 64))) (size!38681 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79037)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79037 (_ BitVec 32)) Bool)

(assert (=> b!1224574 (= res!813730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224575 () Bool)

(declare-fun res!813739 () Bool)

(assert (=> b!1224575 (=> (not res!813739) (not e!695509))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224575 (= res!813739 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38681 _keys!1208))))))

(declare-fun b!1224576 () Bool)

(declare-fun res!813727 () Bool)

(assert (=> b!1224576 (=> (not res!813727) (not e!695509))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1224576 (= res!813727 (= (select (arr!38145 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!48589 () Bool)

(declare-fun mapRes!48589 () Bool)

(assert (=> mapIsEmpty!48589 mapRes!48589))

(declare-fun b!1224577 () Bool)

(declare-fun res!813726 () Bool)

(declare-fun e!695510 () Bool)

(assert (=> b!1224577 (=> (not res!813726) (not e!695510))))

(declare-fun lt!557613 () array!79037)

(declare-datatypes ((List!26930 0))(
  ( (Nil!26927) (Cons!26926 (h!28135 (_ BitVec 64)) (t!40333 List!26930)) )
))
(declare-fun arrayNoDuplicates!0 (array!79037 (_ BitVec 32) List!26930) Bool)

(assert (=> b!1224577 (= res!813726 (arrayNoDuplicates!0 lt!557613 #b00000000000000000000000000000000 Nil!26927))))

(declare-fun res!813742 () Bool)

(assert (=> start!101734 (=> (not res!813742) (not e!695509))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101734 (= res!813742 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38681 _keys!1208))))))

(assert (=> start!101734 e!695509))

(declare-fun tp_is_empty!31127 () Bool)

(assert (=> start!101734 tp_is_empty!31127))

(declare-fun array_inv!29016 (array!79037) Bool)

(assert (=> start!101734 (array_inv!29016 _keys!1208)))

(assert (=> start!101734 true))

(assert (=> start!101734 tp!92315))

(declare-datatypes ((V!46629 0))(
  ( (V!46630 (val!15620 Int)) )
))
(declare-datatypes ((ValueCell!14854 0))(
  ( (ValueCellFull!14854 (v!18282 V!46629)) (EmptyCell!14854) )
))
(declare-datatypes ((array!79039 0))(
  ( (array!79040 (arr!38146 (Array (_ BitVec 32) ValueCell!14854)) (size!38682 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79039)

(declare-fun e!695506 () Bool)

(declare-fun array_inv!29017 (array!79039) Bool)

(assert (=> start!101734 (and (array_inv!29017 _values!996) e!695506)))

(declare-fun b!1224578 () Bool)

(declare-fun e!695503 () Bool)

(assert (=> b!1224578 (= e!695503 true)))

(declare-fun e!695504 () Bool)

(assert (=> b!1224578 e!695504))

(declare-fun res!813735 () Bool)

(assert (=> b!1224578 (=> (not res!813735) (not e!695504))))

(assert (=> b!1224578 (= res!813735 (not (= (select (arr!38145 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!40576 0))(
  ( (Unit!40577) )
))
(declare-fun lt!557618 () Unit!40576)

(declare-fun e!695501 () Unit!40576)

(assert (=> b!1224578 (= lt!557618 e!695501)))

(declare-fun c!120455 () Bool)

(assert (=> b!1224578 (= c!120455 (= (select (arr!38145 _keys!1208) from!1455) k!934))))

(declare-fun e!695507 () Bool)

(assert (=> b!1224578 e!695507))

(declare-fun res!813734 () Bool)

(assert (=> b!1224578 (=> (not res!813734) (not e!695507))))

(declare-datatypes ((tuple2!20130 0))(
  ( (tuple2!20131 (_1!10076 (_ BitVec 64)) (_2!10076 V!46629)) )
))
(declare-datatypes ((List!26931 0))(
  ( (Nil!26928) (Cons!26927 (h!28136 tuple2!20130) (t!40334 List!26931)) )
))
(declare-datatypes ((ListLongMap!18099 0))(
  ( (ListLongMap!18100 (toList!9065 List!26931)) )
))
(declare-fun lt!557615 () ListLongMap!18099)

(declare-fun lt!557619 () ListLongMap!18099)

(declare-fun lt!557607 () tuple2!20130)

(declare-fun +!4122 (ListLongMap!18099 tuple2!20130) ListLongMap!18099)

(assert (=> b!1224578 (= res!813734 (= lt!557619 (+!4122 lt!557615 lt!557607)))))

(declare-fun lt!557620 () V!46629)

(declare-fun get!19482 (ValueCell!14854 V!46629) V!46629)

(assert (=> b!1224578 (= lt!557607 (tuple2!20131 (select (arr!38145 _keys!1208) from!1455) (get!19482 (select (arr!38146 _values!996) from!1455) lt!557620)))))

(declare-fun b!1224579 () Bool)

(declare-fun Unit!40578 () Unit!40576)

(assert (=> b!1224579 (= e!695501 Unit!40578)))

(declare-fun b!1224580 () Bool)

(declare-fun e!695502 () Bool)

(assert (=> b!1224580 (= e!695506 (and e!695502 mapRes!48589))))

(declare-fun condMapEmpty!48589 () Bool)

(declare-fun mapDefault!48589 () ValueCell!14854)

