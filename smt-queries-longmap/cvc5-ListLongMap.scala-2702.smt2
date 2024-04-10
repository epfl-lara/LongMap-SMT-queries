; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40030 () Bool)

(assert start!40030)

(declare-fun b_free!10297 () Bool)

(declare-fun b_next!10297 () Bool)

(assert (=> start!40030 (= b_free!10297 (not b_next!10297))))

(declare-fun tp!36420 () Bool)

(declare-fun b_and!18253 () Bool)

(assert (=> start!40030 (= tp!36420 b_and!18253)))

(declare-fun b!436408 () Bool)

(declare-fun res!257265 () Bool)

(declare-fun e!257718 () Bool)

(assert (=> b!436408 (=> (not res!257265) (not e!257718))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436408 (= res!257265 (validMask!0 mask!1025))))

(declare-fun b!436409 () Bool)

(declare-fun e!257720 () Bool)

(declare-fun e!257713 () Bool)

(assert (=> b!436409 (= e!257720 e!257713)))

(declare-fun res!257262 () Bool)

(assert (=> b!436409 (=> (not res!257262) (not e!257713))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436409 (= res!257262 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((array!26723 0))(
  ( (array!26724 (arr!12811 (Array (_ BitVec 32) (_ BitVec 64))) (size!13163 (_ BitVec 32))) )
))
(declare-fun lt!201197 () array!26723)

(declare-datatypes ((V!16371 0))(
  ( (V!16372 (val!5769 Int)) )
))
(declare-fun minValue!515 () V!16371)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7644 0))(
  ( (tuple2!7645 (_1!3833 (_ BitVec 64)) (_2!3833 V!16371)) )
))
(declare-datatypes ((List!7644 0))(
  ( (Nil!7641) (Cons!7640 (h!8496 tuple2!7644) (t!13390 List!7644)) )
))
(declare-datatypes ((ListLongMap!6557 0))(
  ( (ListLongMap!6558 (toList!3294 List!7644)) )
))
(declare-fun lt!201186 () ListLongMap!6557)

(declare-datatypes ((ValueCell!5381 0))(
  ( (ValueCellFull!5381 (v!8016 V!16371)) (EmptyCell!5381) )
))
(declare-datatypes ((array!26725 0))(
  ( (array!26726 (arr!12812 (Array (_ BitVec 32) ValueCell!5381)) (size!13164 (_ BitVec 32))) )
))
(declare-fun lt!201188 () array!26725)

(declare-fun zeroValue!515 () V!16371)

(declare-fun getCurrentListMapNoExtraKeys!1484 (array!26723 array!26725 (_ BitVec 32) (_ BitVec 32) V!16371 V!16371 (_ BitVec 32) Int) ListLongMap!6557)

(assert (=> b!436409 (= lt!201186 (getCurrentListMapNoExtraKeys!1484 lt!201197 lt!201188 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26725)

(declare-fun v!412 () V!16371)

(assert (=> b!436409 (= lt!201188 (array!26726 (store (arr!12812 _values!549) i!563 (ValueCellFull!5381 v!412)) (size!13164 _values!549)))))

(declare-fun lt!201187 () ListLongMap!6557)

(declare-fun _keys!709 () array!26723)

(assert (=> b!436409 (= lt!201187 (getCurrentListMapNoExtraKeys!1484 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436410 () Bool)

(declare-fun res!257254 () Bool)

(assert (=> b!436410 (=> (not res!257254) (not e!257718))))

(assert (=> b!436410 (= res!257254 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13163 _keys!709))))))

(declare-fun b!436412 () Bool)

(declare-datatypes ((Unit!12979 0))(
  ( (Unit!12980) )
))
(declare-fun e!257719 () Unit!12979)

(declare-fun Unit!12981 () Unit!12979)

(assert (=> b!436412 (= e!257719 Unit!12981)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!201194 () Unit!12979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26723 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12979)

(assert (=> b!436412 (= lt!201194 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436412 false))

(declare-fun mapIsEmpty!18795 () Bool)

(declare-fun mapRes!18795 () Bool)

(assert (=> mapIsEmpty!18795 mapRes!18795))

(declare-fun b!436413 () Bool)

(declare-fun e!257721 () Bool)

(declare-fun e!257716 () Bool)

(assert (=> b!436413 (= e!257721 (and e!257716 mapRes!18795))))

(declare-fun condMapEmpty!18795 () Bool)

(declare-fun mapDefault!18795 () ValueCell!5381)

