; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40094 () Bool)

(assert start!40094)

(declare-fun b_free!10361 () Bool)

(declare-fun b_next!10361 () Bool)

(assert (=> start!40094 (= b_free!10361 (not b_next!10361))))

(declare-fun tp!36611 () Bool)

(declare-fun b_and!18329 () Bool)

(assert (=> start!40094 (= tp!36611 b_and!18329)))

(declare-fun b!438020 () Bool)

(declare-fun e!258433 () Bool)

(assert (=> b!438020 (= e!258433 (not true))))

(declare-datatypes ((V!16455 0))(
  ( (V!16456 (val!5801 Int)) )
))
(declare-fun minValue!515 () V!16455)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5413 0))(
  ( (ValueCellFull!5413 (v!8048 V!16455)) (EmptyCell!5413) )
))
(declare-datatypes ((array!26843 0))(
  ( (array!26844 (arr!12871 (Array (_ BitVec 32) ValueCell!5413)) (size!13223 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26843)

(declare-fun zeroValue!515 () V!16455)

(declare-fun v!412 () V!16455)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26845 0))(
  ( (array!26846 (arr!12872 (Array (_ BitVec 32) (_ BitVec 64))) (size!13224 (_ BitVec 32))) )
))
(declare-fun lt!201829 () array!26845)

(declare-fun _keys!709 () array!26845)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!201826 () array!26843)

(declare-datatypes ((tuple2!7688 0))(
  ( (tuple2!7689 (_1!3855 (_ BitVec 64)) (_2!3855 V!16455)) )
))
(declare-datatypes ((List!7688 0))(
  ( (Nil!7685) (Cons!7684 (h!8540 tuple2!7688) (t!13444 List!7688)) )
))
(declare-datatypes ((ListLongMap!6601 0))(
  ( (ListLongMap!6602 (toList!3316 List!7688)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1505 (array!26845 array!26843 (_ BitVec 32) (_ BitVec 32) V!16455 V!16455 (_ BitVec 32) Int) ListLongMap!6601)

(declare-fun +!1460 (ListLongMap!6601 tuple2!7688) ListLongMap!6601)

(assert (=> b!438020 (= (getCurrentListMapNoExtraKeys!1505 lt!201829 lt!201826 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1460 (getCurrentListMapNoExtraKeys!1505 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7689 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13024 0))(
  ( (Unit!13025) )
))
(declare-fun lt!201830 () Unit!13024)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!629 (array!26845 array!26843 (_ BitVec 32) (_ BitVec 32) V!16455 V!16455 (_ BitVec 32) (_ BitVec 64) V!16455 (_ BitVec 32) Int) Unit!13024)

(assert (=> b!438020 (= lt!201830 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!629 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438021 () Bool)

(declare-fun res!258543 () Bool)

(declare-fun e!258438 () Bool)

(assert (=> b!438021 (=> (not res!258543) (not e!258438))))

(assert (=> b!438021 (= res!258543 (or (= (select (arr!12872 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12872 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438022 () Bool)

(declare-fun res!258531 () Bool)

(assert (=> b!438022 (=> (not res!258531) (not e!258438))))

(assert (=> b!438022 (= res!258531 (and (= (size!13223 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13224 _keys!709) (size!13223 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438023 () Bool)

(declare-fun e!258437 () Bool)

(assert (=> b!438023 (= e!258438 e!258437)))

(declare-fun res!258538 () Bool)

(assert (=> b!438023 (=> (not res!258538) (not e!258437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26845 (_ BitVec 32)) Bool)

(assert (=> b!438023 (= res!258538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201829 mask!1025))))

(assert (=> b!438023 (= lt!201829 (array!26846 (store (arr!12872 _keys!709) i!563 k!794) (size!13224 _keys!709)))))

(declare-fun b!438025 () Bool)

(declare-fun e!258432 () Bool)

(declare-fun e!258436 () Bool)

(declare-fun mapRes!18891 () Bool)

(assert (=> b!438025 (= e!258432 (and e!258436 mapRes!18891))))

(declare-fun condMapEmpty!18891 () Bool)

(declare-fun mapDefault!18891 () ValueCell!5413)

