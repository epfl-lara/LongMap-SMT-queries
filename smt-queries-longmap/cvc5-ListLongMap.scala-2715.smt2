; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40108 () Bool)

(assert start!40108)

(declare-fun b_free!10375 () Bool)

(declare-fun b_next!10375 () Bool)

(assert (=> start!40108 (= b_free!10375 (not b_next!10375))))

(declare-fun tp!36654 () Bool)

(declare-fun b_and!18343 () Bool)

(assert (=> start!40108 (= tp!36654 b_and!18343)))

(declare-fun b!438356 () Bool)

(declare-fun e!258579 () Bool)

(assert (=> b!438356 (= e!258579 (not true))))

(declare-datatypes ((V!16475 0))(
  ( (V!16476 (val!5808 Int)) )
))
(declare-fun minValue!515 () V!16475)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5420 0))(
  ( (ValueCellFull!5420 (v!8055 V!16475)) (EmptyCell!5420) )
))
(declare-datatypes ((array!26871 0))(
  ( (array!26872 (arr!12885 (Array (_ BitVec 32) ValueCell!5420)) (size!13237 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26871)

(declare-datatypes ((array!26873 0))(
  ( (array!26874 (arr!12886 (Array (_ BitVec 32) (_ BitVec 64))) (size!13238 (_ BitVec 32))) )
))
(declare-fun lt!201935 () array!26873)

(declare-fun zeroValue!515 () V!16475)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!201934 () array!26871)

(declare-fun v!412 () V!16475)

(declare-fun _keys!709 () array!26873)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7702 0))(
  ( (tuple2!7703 (_1!3862 (_ BitVec 64)) (_2!3862 V!16475)) )
))
(declare-datatypes ((List!7701 0))(
  ( (Nil!7698) (Cons!7697 (h!8553 tuple2!7702) (t!13457 List!7701)) )
))
(declare-datatypes ((ListLongMap!6615 0))(
  ( (ListLongMap!6616 (toList!3323 List!7701)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1512 (array!26873 array!26871 (_ BitVec 32) (_ BitVec 32) V!16475 V!16475 (_ BitVec 32) Int) ListLongMap!6615)

(declare-fun +!1466 (ListLongMap!6615 tuple2!7702) ListLongMap!6615)

(assert (=> b!438356 (= (getCurrentListMapNoExtraKeys!1512 lt!201935 lt!201934 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1466 (getCurrentListMapNoExtraKeys!1512 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7703 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13036 0))(
  ( (Unit!13037) )
))
(declare-fun lt!201932 () Unit!13036)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!635 (array!26873 array!26871 (_ BitVec 32) (_ BitVec 32) V!16475 V!16475 (_ BitVec 32) (_ BitVec 64) V!16475 (_ BitVec 32) Int) Unit!13036)

(assert (=> b!438356 (= lt!201932 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!635 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438357 () Bool)

(declare-fun res!258812 () Bool)

(declare-fun e!258580 () Bool)

(assert (=> b!438357 (=> (not res!258812) (not e!258580))))

(assert (=> b!438357 (= res!258812 (bvsle from!863 i!563))))

(declare-fun b!438358 () Bool)

(declare-fun res!258810 () Bool)

(declare-fun e!258585 () Bool)

(assert (=> b!438358 (=> (not res!258810) (not e!258585))))

(assert (=> b!438358 (= res!258810 (and (= (size!13237 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13238 _keys!709) (size!13237 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438359 () Bool)

(declare-fun res!258808 () Bool)

(assert (=> b!438359 (=> (not res!258808) (not e!258585))))

(declare-datatypes ((List!7702 0))(
  ( (Nil!7699) (Cons!7698 (h!8554 (_ BitVec 64)) (t!13458 List!7702)) )
))
(declare-fun arrayNoDuplicates!0 (array!26873 (_ BitVec 32) List!7702) Bool)

(assert (=> b!438359 (= res!258808 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7699))))

(declare-fun b!438360 () Bool)

(assert (=> b!438360 (= e!258580 e!258579)))

(declare-fun res!258813 () Bool)

(assert (=> b!438360 (=> (not res!258813) (not e!258579))))

(assert (=> b!438360 (= res!258813 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201931 () ListLongMap!6615)

(assert (=> b!438360 (= lt!201931 (getCurrentListMapNoExtraKeys!1512 lt!201935 lt!201934 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438360 (= lt!201934 (array!26872 (store (arr!12885 _values!549) i!563 (ValueCellFull!5420 v!412)) (size!13237 _values!549)))))

(declare-fun lt!201933 () ListLongMap!6615)

(assert (=> b!438360 (= lt!201933 (getCurrentListMapNoExtraKeys!1512 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!258806 () Bool)

(assert (=> start!40108 (=> (not res!258806) (not e!258585))))

(assert (=> start!40108 (= res!258806 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13238 _keys!709))))))

(assert (=> start!40108 e!258585))

(declare-fun tp_is_empty!11527 () Bool)

(assert (=> start!40108 tp_is_empty!11527))

(assert (=> start!40108 tp!36654))

(assert (=> start!40108 true))

(declare-fun e!258583 () Bool)

(declare-fun array_inv!9358 (array!26871) Bool)

(assert (=> start!40108 (and (array_inv!9358 _values!549) e!258583)))

(declare-fun array_inv!9359 (array!26873) Bool)

(assert (=> start!40108 (array_inv!9359 _keys!709)))

(declare-fun b!438361 () Bool)

(declare-fun res!258809 () Bool)

(assert (=> b!438361 (=> (not res!258809) (not e!258585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438361 (= res!258809 (validMask!0 mask!1025))))

(declare-fun b!438362 () Bool)

(declare-fun e!258584 () Bool)

(declare-fun mapRes!18912 () Bool)

(assert (=> b!438362 (= e!258583 (and e!258584 mapRes!18912))))

(declare-fun condMapEmpty!18912 () Bool)

(declare-fun mapDefault!18912 () ValueCell!5420)

