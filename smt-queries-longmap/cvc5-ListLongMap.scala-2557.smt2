; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39160 () Bool)

(assert start!39160)

(declare-fun b_free!9427 () Bool)

(declare-fun b_next!9427 () Bool)

(assert (=> start!39160 (= b_free!9427 (not b_next!9427))))

(declare-fun tp!33809 () Bool)

(declare-fun b_and!16813 () Bool)

(assert (=> start!39160 (= tp!33809 b_and!16813)))

(declare-fun b!412212 () Bool)

(declare-fun res!239311 () Bool)

(declare-fun e!246719 () Bool)

(assert (=> b!412212 (=> (not res!239311) (not e!246719))))

(declare-datatypes ((array!25019 0))(
  ( (array!25020 (arr!11959 (Array (_ BitVec 32) (_ BitVec 64))) (size!12311 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25019)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25019 (_ BitVec 32)) Bool)

(assert (=> b!412212 (= res!239311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412213 () Bool)

(declare-fun res!239316 () Bool)

(declare-fun e!246716 () Bool)

(assert (=> b!412213 (=> (not res!239316) (not e!246716))))

(declare-fun lt!189436 () array!25019)

(declare-datatypes ((List!6944 0))(
  ( (Nil!6941) (Cons!6940 (h!7796 (_ BitVec 64)) (t!12118 List!6944)) )
))
(declare-fun arrayNoDuplicates!0 (array!25019 (_ BitVec 32) List!6944) Bool)

(assert (=> b!412213 (= res!239316 (arrayNoDuplicates!0 lt!189436 #b00000000000000000000000000000000 Nil!6941))))

(declare-fun b!412214 () Bool)

(assert (=> b!412214 (= e!246716 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15211 0))(
  ( (V!15212 (val!5334 Int)) )
))
(declare-fun minValue!515 () V!15211)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6918 0))(
  ( (tuple2!6919 (_1!3470 (_ BitVec 64)) (_2!3470 V!15211)) )
))
(declare-datatypes ((List!6945 0))(
  ( (Nil!6942) (Cons!6941 (h!7797 tuple2!6918) (t!12119 List!6945)) )
))
(declare-datatypes ((ListLongMap!5831 0))(
  ( (ListLongMap!5832 (toList!2931 List!6945)) )
))
(declare-fun lt!189437 () ListLongMap!5831)

(declare-datatypes ((ValueCell!4946 0))(
  ( (ValueCellFull!4946 (v!7581 V!15211)) (EmptyCell!4946) )
))
(declare-datatypes ((array!25021 0))(
  ( (array!25022 (arr!11960 (Array (_ BitVec 32) ValueCell!4946)) (size!12312 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25021)

(declare-fun zeroValue!515 () V!15211)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15211)

(declare-fun getCurrentListMapNoExtraKeys!1139 (array!25019 array!25021 (_ BitVec 32) (_ BitVec 32) V!15211 V!15211 (_ BitVec 32) Int) ListLongMap!5831)

(assert (=> b!412214 (= lt!189437 (getCurrentListMapNoExtraKeys!1139 lt!189436 (array!25022 (store (arr!11960 _values!549) i!563 (ValueCellFull!4946 v!412)) (size!12312 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189435 () ListLongMap!5831)

(assert (=> b!412214 (= lt!189435 (getCurrentListMapNoExtraKeys!1139 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412215 () Bool)

(declare-fun res!239319 () Bool)

(assert (=> b!412215 (=> (not res!239319) (not e!246719))))

(assert (=> b!412215 (= res!239319 (or (= (select (arr!11959 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11959 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412216 () Bool)

(declare-fun res!239308 () Bool)

(assert (=> b!412216 (=> (not res!239308) (not e!246719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412216 (= res!239308 (validMask!0 mask!1025))))

(declare-fun b!412217 () Bool)

(declare-fun res!239312 () Bool)

(assert (=> b!412217 (=> (not res!239312) (not e!246719))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412217 (= res!239312 (validKeyInArray!0 k!794))))

(declare-fun b!412218 () Bool)

(declare-fun e!246720 () Bool)

(declare-fun e!246717 () Bool)

(declare-fun mapRes!17490 () Bool)

(assert (=> b!412218 (= e!246720 (and e!246717 mapRes!17490))))

(declare-fun condMapEmpty!17490 () Bool)

(declare-fun mapDefault!17490 () ValueCell!4946)

