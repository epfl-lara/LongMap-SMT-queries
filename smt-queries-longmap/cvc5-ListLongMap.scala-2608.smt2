; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39466 () Bool)

(assert start!39466)

(declare-fun b_free!9733 () Bool)

(declare-fun b_next!9733 () Bool)

(assert (=> start!39466 (= b_free!9733 (not b_next!9733))))

(declare-fun tp!34728 () Bool)

(declare-fun b_and!17341 () Bool)

(assert (=> start!39466 (= tp!34728 b_and!17341)))

(declare-fun b!420911 () Bool)

(declare-fun e!250651 () Bool)

(declare-fun e!250650 () Bool)

(assert (=> b!420911 (= e!250651 e!250650)))

(declare-fun res!245586 () Bool)

(assert (=> b!420911 (=> (not res!245586) (not e!250650))))

(declare-datatypes ((array!25619 0))(
  ( (array!25620 (arr!12259 (Array (_ BitVec 32) (_ BitVec 64))) (size!12611 (_ BitVec 32))) )
))
(declare-fun lt!193170 () array!25619)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25619 (_ BitVec 32)) Bool)

(assert (=> b!420911 (= res!245586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193170 mask!1025))))

(declare-fun _keys!709 () array!25619)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420911 (= lt!193170 (array!25620 (store (arr!12259 _keys!709) i!563 k!794) (size!12611 _keys!709)))))

(declare-fun b!420912 () Bool)

(declare-fun e!250653 () Bool)

(assert (=> b!420912 (= e!250650 e!250653)))

(declare-fun res!245584 () Bool)

(assert (=> b!420912 (=> (not res!245584) (not e!250653))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!420912 (= res!245584 (= from!863 i!563))))

(declare-datatypes ((V!15619 0))(
  ( (V!15620 (val!5487 Int)) )
))
(declare-fun minValue!515 () V!15619)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15619)

(declare-datatypes ((ValueCell!5099 0))(
  ( (ValueCellFull!5099 (v!7734 V!15619)) (EmptyCell!5099) )
))
(declare-datatypes ((array!25621 0))(
  ( (array!25622 (arr!12260 (Array (_ BitVec 32) ValueCell!5099)) (size!12612 (_ BitVec 32))) )
))
(declare-fun lt!193171 () array!25621)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7194 0))(
  ( (tuple2!7195 (_1!3608 (_ BitVec 64)) (_2!3608 V!15619)) )
))
(declare-datatypes ((List!7202 0))(
  ( (Nil!7199) (Cons!7198 (h!8054 tuple2!7194) (t!12600 List!7202)) )
))
(declare-datatypes ((ListLongMap!6107 0))(
  ( (ListLongMap!6108 (toList!3069 List!7202)) )
))
(declare-fun lt!193176 () ListLongMap!6107)

(declare-fun getCurrentListMapNoExtraKeys!1273 (array!25619 array!25621 (_ BitVec 32) (_ BitVec 32) V!15619 V!15619 (_ BitVec 32) Int) ListLongMap!6107)

(assert (=> b!420912 (= lt!193176 (getCurrentListMapNoExtraKeys!1273 lt!193170 lt!193171 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25621)

(declare-fun v!412 () V!15619)

(assert (=> b!420912 (= lt!193171 (array!25622 (store (arr!12260 _values!549) i!563 (ValueCellFull!5099 v!412)) (size!12612 _values!549)))))

(declare-fun lt!193175 () ListLongMap!6107)

(assert (=> b!420912 (= lt!193175 (getCurrentListMapNoExtraKeys!1273 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420913 () Bool)

(declare-fun res!245588 () Bool)

(assert (=> b!420913 (=> (not res!245588) (not e!250651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420913 (= res!245588 (validKeyInArray!0 k!794))))

(declare-fun b!420915 () Bool)

(declare-fun e!250648 () Bool)

(declare-fun e!250647 () Bool)

(declare-fun mapRes!17949 () Bool)

(assert (=> b!420915 (= e!250648 (and e!250647 mapRes!17949))))

(declare-fun condMapEmpty!17949 () Bool)

(declare-fun mapDefault!17949 () ValueCell!5099)

