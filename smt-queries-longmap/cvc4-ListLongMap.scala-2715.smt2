; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40112 () Bool)

(assert start!40112)

(declare-fun b_free!10379 () Bool)

(declare-fun b_next!10379 () Bool)

(assert (=> start!40112 (= b_free!10379 (not b_next!10379))))

(declare-fun tp!36666 () Bool)

(declare-fun b_and!18347 () Bool)

(assert (=> start!40112 (= tp!36666 b_and!18347)))

(declare-fun b!438452 () Bool)

(declare-fun e!258622 () Bool)

(declare-fun tp_is_empty!11531 () Bool)

(assert (=> b!438452 (= e!258622 tp_is_empty!11531)))

(declare-fun b!438453 () Bool)

(declare-fun e!258621 () Bool)

(declare-fun e!258623 () Bool)

(assert (=> b!438453 (= e!258621 e!258623)))

(declare-fun res!258888 () Bool)

(assert (=> b!438453 (=> (not res!258888) (not e!258623))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438453 (= res!258888 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16479 0))(
  ( (V!16480 (val!5810 Int)) )
))
(declare-fun minValue!515 () V!16479)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16479)

(declare-datatypes ((tuple2!7706 0))(
  ( (tuple2!7707 (_1!3864 (_ BitVec 64)) (_2!3864 V!16479)) )
))
(declare-datatypes ((List!7705 0))(
  ( (Nil!7702) (Cons!7701 (h!8557 tuple2!7706) (t!13461 List!7705)) )
))
(declare-datatypes ((ListLongMap!6619 0))(
  ( (ListLongMap!6620 (toList!3325 List!7705)) )
))
(declare-fun lt!201963 () ListLongMap!6619)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5422 0))(
  ( (ValueCellFull!5422 (v!8057 V!16479)) (EmptyCell!5422) )
))
(declare-datatypes ((array!26879 0))(
  ( (array!26880 (arr!12889 (Array (_ BitVec 32) ValueCell!5422)) (size!13241 (_ BitVec 32))) )
))
(declare-fun lt!201962 () array!26879)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26881 0))(
  ( (array!26882 (arr!12890 (Array (_ BitVec 32) (_ BitVec 64))) (size!13242 (_ BitVec 32))) )
))
(declare-fun lt!201964 () array!26881)

(declare-fun getCurrentListMapNoExtraKeys!1514 (array!26881 array!26879 (_ BitVec 32) (_ BitVec 32) V!16479 V!16479 (_ BitVec 32) Int) ListLongMap!6619)

(assert (=> b!438453 (= lt!201963 (getCurrentListMapNoExtraKeys!1514 lt!201964 lt!201962 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16479)

(declare-fun _values!549 () array!26879)

(assert (=> b!438453 (= lt!201962 (array!26880 (store (arr!12889 _values!549) i!563 (ValueCellFull!5422 v!412)) (size!13241 _values!549)))))

(declare-fun _keys!709 () array!26881)

(declare-fun lt!201961 () ListLongMap!6619)

(assert (=> b!438453 (= lt!201961 (getCurrentListMapNoExtraKeys!1514 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438454 () Bool)

(assert (=> b!438454 (= e!258623 (not true))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1468 (ListLongMap!6619 tuple2!7706) ListLongMap!6619)

(assert (=> b!438454 (= (getCurrentListMapNoExtraKeys!1514 lt!201964 lt!201962 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1468 (getCurrentListMapNoExtraKeys!1514 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7707 k!794 v!412)))))

(declare-datatypes ((Unit!13040 0))(
  ( (Unit!13041) )
))
(declare-fun lt!201965 () Unit!13040)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!637 (array!26881 array!26879 (_ BitVec 32) (_ BitVec 32) V!16479 V!16479 (_ BitVec 32) (_ BitVec 64) V!16479 (_ BitVec 32) Int) Unit!13040)

(assert (=> b!438454 (= lt!201965 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!637 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438455 () Bool)

(declare-fun e!258626 () Bool)

(assert (=> b!438455 (= e!258626 tp_is_empty!11531)))

(declare-fun b!438456 () Bool)

(declare-fun res!258892 () Bool)

(declare-fun e!258624 () Bool)

(assert (=> b!438456 (=> (not res!258892) (not e!258624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438456 (= res!258892 (validMask!0 mask!1025))))

(declare-fun b!438457 () Bool)

(declare-fun res!258890 () Bool)

(assert (=> b!438457 (=> (not res!258890) (not e!258624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26881 (_ BitVec 32)) Bool)

(assert (=> b!438457 (= res!258890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438458 () Bool)

(declare-fun res!258882 () Bool)

(assert (=> b!438458 (=> (not res!258882) (not e!258624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438458 (= res!258882 (validKeyInArray!0 k!794))))

(declare-fun b!438459 () Bool)

(declare-fun e!258627 () Bool)

(declare-fun mapRes!18918 () Bool)

(assert (=> b!438459 (= e!258627 (and e!258626 mapRes!18918))))

(declare-fun condMapEmpty!18918 () Bool)

(declare-fun mapDefault!18918 () ValueCell!5422)

