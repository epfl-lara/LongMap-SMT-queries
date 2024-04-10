; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41014 () Bool)

(assert start!41014)

(declare-fun b_free!10949 () Bool)

(declare-fun b_next!10949 () Bool)

(assert (=> start!41014 (= b_free!10949 (not b_next!10949))))

(declare-fun tp!38673 () Bool)

(declare-fun b_and!19091 () Bool)

(assert (=> start!41014 (= tp!38673 b_and!19091)))

(declare-fun b!457047 () Bool)

(declare-fun e!266971 () Bool)

(declare-fun e!266965 () Bool)

(assert (=> b!457047 (= e!266971 (not e!266965))))

(declare-fun res!272871 () Bool)

(assert (=> b!457047 (=> res!272871 e!266965)))

(declare-datatypes ((array!28375 0))(
  ( (array!28376 (arr!13631 (Array (_ BitVec 32) (_ BitVec 64))) (size!13983 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28375)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457047 (= res!272871 (not (validKeyInArray!0 (select (arr!13631 _keys!709) from!863))))))

(declare-datatypes ((V!17487 0))(
  ( (V!17488 (val!6188 Int)) )
))
(declare-datatypes ((ValueCell!5800 0))(
  ( (ValueCellFull!5800 (v!8454 V!17487)) (EmptyCell!5800) )
))
(declare-datatypes ((array!28377 0))(
  ( (array!28378 (arr!13632 (Array (_ BitVec 32) ValueCell!5800)) (size!13984 (_ BitVec 32))) )
))
(declare-fun lt!206732 () array!28377)

(declare-fun minValue!515 () V!17487)

(declare-fun defaultEntry!557 () Int)

(declare-fun _values!549 () array!28377)

(declare-fun zeroValue!515 () V!17487)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!206733 () array!28375)

(declare-fun v!412 () V!17487)

(declare-datatypes ((tuple2!8150 0))(
  ( (tuple2!8151 (_1!4086 (_ BitVec 64)) (_2!4086 V!17487)) )
))
(declare-datatypes ((List!8224 0))(
  ( (Nil!8221) (Cons!8220 (h!9076 tuple2!8150) (t!14052 List!8224)) )
))
(declare-datatypes ((ListLongMap!7063 0))(
  ( (ListLongMap!7064 (toList!3547 List!8224)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1730 (array!28375 array!28377 (_ BitVec 32) (_ BitVec 32) V!17487 V!17487 (_ BitVec 32) Int) ListLongMap!7063)

(declare-fun +!1583 (ListLongMap!7063 tuple2!8150) ListLongMap!7063)

(assert (=> b!457047 (= (getCurrentListMapNoExtraKeys!1730 lt!206733 lt!206732 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1583 (getCurrentListMapNoExtraKeys!1730 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8151 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13288 0))(
  ( (Unit!13289) )
))
(declare-fun lt!206735 () Unit!13288)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!743 (array!28375 array!28377 (_ BitVec 32) (_ BitVec 32) V!17487 V!17487 (_ BitVec 32) (_ BitVec 64) V!17487 (_ BitVec 32) Int) Unit!13288)

(assert (=> b!457047 (= lt!206735 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457048 () Bool)

(declare-fun e!266970 () Bool)

(declare-fun tp_is_empty!12287 () Bool)

(assert (=> b!457048 (= e!266970 tp_is_empty!12287)))

(declare-fun b!457049 () Bool)

(assert (=> b!457049 (= e!266965 (bvslt from!863 (size!13984 _values!549)))))

(declare-fun b!457050 () Bool)

(declare-fun res!272867 () Bool)

(declare-fun e!266966 () Bool)

(assert (=> b!457050 (=> (not res!272867) (not e!266966))))

(assert (=> b!457050 (= res!272867 (validKeyInArray!0 k!794))))

(declare-fun b!457051 () Bool)

(declare-fun res!272877 () Bool)

(assert (=> b!457051 (=> (not res!272877) (not e!266966))))

(declare-datatypes ((List!8225 0))(
  ( (Nil!8222) (Cons!8221 (h!9077 (_ BitVec 64)) (t!14053 List!8225)) )
))
(declare-fun arrayNoDuplicates!0 (array!28375 (_ BitVec 32) List!8225) Bool)

(assert (=> b!457051 (= res!272877 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8222))))

(declare-fun b!457052 () Bool)

(declare-fun e!266967 () Bool)

(assert (=> b!457052 (= e!266967 tp_is_empty!12287)))

(declare-fun b!457053 () Bool)

(declare-fun res!272869 () Bool)

(assert (=> b!457053 (=> (not res!272869) (not e!266966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28375 (_ BitVec 32)) Bool)

(assert (=> b!457053 (= res!272869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457054 () Bool)

(declare-fun res!272873 () Bool)

(declare-fun e!266964 () Bool)

(assert (=> b!457054 (=> (not res!272873) (not e!266964))))

(assert (=> b!457054 (= res!272873 (bvsle from!863 i!563))))

(declare-fun b!457055 () Bool)

(assert (=> b!457055 (= e!266964 e!266971)))

(declare-fun res!272870 () Bool)

(assert (=> b!457055 (=> (not res!272870) (not e!266971))))

(assert (=> b!457055 (= res!272870 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206731 () ListLongMap!7063)

(assert (=> b!457055 (= lt!206731 (getCurrentListMapNoExtraKeys!1730 lt!206733 lt!206732 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457055 (= lt!206732 (array!28378 (store (arr!13632 _values!549) i!563 (ValueCellFull!5800 v!412)) (size!13984 _values!549)))))

(declare-fun lt!206734 () ListLongMap!7063)

(assert (=> b!457055 (= lt!206734 (getCurrentListMapNoExtraKeys!1730 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457056 () Bool)

(declare-fun e!266969 () Bool)

(declare-fun mapRes!20071 () Bool)

(assert (=> b!457056 (= e!266969 (and e!266967 mapRes!20071))))

(declare-fun condMapEmpty!20071 () Bool)

(declare-fun mapDefault!20071 () ValueCell!5800)

