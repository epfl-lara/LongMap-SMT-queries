; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101728 () Bool)

(assert start!101728)

(declare-fun b_free!26417 () Bool)

(declare-fun b_next!26417 () Bool)

(assert (=> start!101728 (= b_free!26417 (not b_next!26417))))

(declare-fun tp!92297 () Bool)

(declare-fun b_and!44095 () Bool)

(assert (=> start!101728 (= tp!92297 b_and!44095)))

(declare-fun b!1224369 () Bool)

(declare-fun res!813582 () Bool)

(declare-fun e!695387 () Bool)

(assert (=> b!1224369 (=> (not res!813582) (not e!695387))))

(declare-datatypes ((array!79025 0))(
  ( (array!79026 (arr!38139 (Array (_ BitVec 32) (_ BitVec 64))) (size!38675 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79025)

(declare-datatypes ((List!26926 0))(
  ( (Nil!26923) (Cons!26922 (h!28131 (_ BitVec 64)) (t!40323 List!26926)) )
))
(declare-fun arrayNoDuplicates!0 (array!79025 (_ BitVec 32) List!26926) Bool)

(assert (=> b!1224369 (= res!813582 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26923))))

(declare-fun mapNonEmpty!48580 () Bool)

(declare-fun mapRes!48580 () Bool)

(declare-fun tp!92296 () Bool)

(declare-fun e!695384 () Bool)

(assert (=> mapNonEmpty!48580 (= mapRes!48580 (and tp!92296 e!695384))))

(declare-fun mapKey!48580 () (_ BitVec 32))

(declare-datatypes ((V!46621 0))(
  ( (V!46622 (val!15617 Int)) )
))
(declare-datatypes ((ValueCell!14851 0))(
  ( (ValueCellFull!14851 (v!18279 V!46621)) (EmptyCell!14851) )
))
(declare-fun mapValue!48580 () ValueCell!14851)

(declare-fun mapRest!48580 () (Array (_ BitVec 32) ValueCell!14851))

(declare-datatypes ((array!79027 0))(
  ( (array!79028 (arr!38140 (Array (_ BitVec 32) ValueCell!14851)) (size!38676 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79027)

(assert (=> mapNonEmpty!48580 (= (arr!38140 _values!996) (store mapRest!48580 mapKey!48580 mapValue!48580))))

(declare-fun mapIsEmpty!48580 () Bool)

(assert (=> mapIsEmpty!48580 mapRes!48580))

(declare-fun b!1224370 () Bool)

(declare-fun res!813577 () Bool)

(assert (=> b!1224370 (=> (not res!813577) (not e!695387))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224370 (= res!813577 (validMask!0 mask!1564))))

(declare-fun b!1224371 () Bool)

(declare-fun res!813574 () Bool)

(declare-fun e!695388 () Bool)

(assert (=> b!1224371 (=> (not res!813574) (not e!695388))))

(declare-fun lt!557476 () array!79025)

(assert (=> b!1224371 (= res!813574 (arrayNoDuplicates!0 lt!557476 #b00000000000000000000000000000000 Nil!26923))))

(declare-fun b!1224372 () Bool)

(declare-fun res!813573 () Bool)

(declare-fun e!695395 () Bool)

(assert (=> b!1224372 (=> (not res!813573) (not e!695395))))

(declare-datatypes ((tuple2!20126 0))(
  ( (tuple2!20127 (_1!10074 (_ BitVec 64)) (_2!10074 V!46621)) )
))
(declare-datatypes ((List!26927 0))(
  ( (Nil!26924) (Cons!26923 (h!28132 tuple2!20126) (t!40324 List!26927)) )
))
(declare-datatypes ((ListLongMap!18095 0))(
  ( (ListLongMap!18096 (toList!9063 List!26927)) )
))
(declare-fun lt!557480 () ListLongMap!18095)

(declare-fun lt!557481 () ListLongMap!18095)

(declare-fun lt!557485 () tuple2!20126)

(declare-fun +!4120 (ListLongMap!18095 tuple2!20126) ListLongMap!18095)

(assert (=> b!1224372 (= res!813573 (= lt!557480 (+!4120 lt!557481 lt!557485)))))

(declare-fun res!813585 () Bool)

(assert (=> start!101728 (=> (not res!813585) (not e!695387))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101728 (= res!813585 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38675 _keys!1208))))))

(assert (=> start!101728 e!695387))

(declare-fun tp_is_empty!31121 () Bool)

(assert (=> start!101728 tp_is_empty!31121))

(declare-fun array_inv!29012 (array!79025) Bool)

(assert (=> start!101728 (array_inv!29012 _keys!1208)))

(assert (=> start!101728 true))

(assert (=> start!101728 tp!92297))

(declare-fun e!695392 () Bool)

(declare-fun array_inv!29013 (array!79027) Bool)

(assert (=> start!101728 (and (array_inv!29013 _values!996) e!695392)))

(declare-fun b!1224373 () Bool)

(declare-fun e!695391 () Bool)

(assert (=> b!1224373 (= e!695392 (and e!695391 mapRes!48580))))

(declare-fun condMapEmpty!48580 () Bool)

(declare-fun mapDefault!48580 () ValueCell!14851)

