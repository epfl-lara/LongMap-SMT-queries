; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40162 () Bool)

(assert start!40162)

(declare-fun b_free!10429 () Bool)

(declare-fun b_next!10429 () Bool)

(assert (=> start!40162 (= b_free!10429 (not b_next!10429))))

(declare-fun tp!36815 () Bool)

(declare-fun b_and!18397 () Bool)

(assert (=> start!40162 (= tp!36815 b_and!18397)))

(declare-fun b!439652 () Bool)

(declare-fun res!259868 () Bool)

(declare-fun e!259147 () Bool)

(assert (=> b!439652 (=> (not res!259868) (not e!259147))))

(declare-datatypes ((array!26979 0))(
  ( (array!26980 (arr!12939 (Array (_ BitVec 32) (_ BitVec 64))) (size!13291 (_ BitVec 32))) )
))
(declare-fun lt!202337 () array!26979)

(declare-datatypes ((List!7747 0))(
  ( (Nil!7744) (Cons!7743 (h!8599 (_ BitVec 64)) (t!13503 List!7747)) )
))
(declare-fun arrayNoDuplicates!0 (array!26979 (_ BitVec 32) List!7747) Bool)

(assert (=> b!439652 (= res!259868 (arrayNoDuplicates!0 lt!202337 #b00000000000000000000000000000000 Nil!7744))))

(declare-fun b!439653 () Bool)

(declare-fun e!259150 () Bool)

(assert (=> b!439653 (= e!259150 e!259147)))

(declare-fun res!259869 () Bool)

(assert (=> b!439653 (=> (not res!259869) (not e!259147))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26979 (_ BitVec 32)) Bool)

(assert (=> b!439653 (= res!259869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202337 mask!1025))))

(declare-fun _keys!709 () array!26979)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439653 (= lt!202337 (array!26980 (store (arr!12939 _keys!709) i!563 k!794) (size!13291 _keys!709)))))

(declare-fun b!439655 () Bool)

(declare-fun res!259858 () Bool)

(assert (=> b!439655 (=> (not res!259858) (not e!259150))))

(assert (=> b!439655 (= res!259858 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13291 _keys!709))))))

(declare-fun b!439656 () Bool)

(declare-fun res!259864 () Bool)

(assert (=> b!439656 (=> (not res!259864) (not e!259150))))

(declare-fun arrayContainsKey!0 (array!26979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439656 (= res!259864 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439657 () Bool)

(declare-fun e!259148 () Bool)

(declare-fun e!259151 () Bool)

(declare-fun mapRes!18993 () Bool)

(assert (=> b!439657 (= e!259148 (and e!259151 mapRes!18993))))

(declare-fun condMapEmpty!18993 () Bool)

(declare-datatypes ((V!16547 0))(
  ( (V!16548 (val!5835 Int)) )
))
(declare-datatypes ((ValueCell!5447 0))(
  ( (ValueCellFull!5447 (v!8082 V!16547)) (EmptyCell!5447) )
))
(declare-datatypes ((array!26981 0))(
  ( (array!26982 (arr!12940 (Array (_ BitVec 32) ValueCell!5447)) (size!13292 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26981)

(declare-fun mapDefault!18993 () ValueCell!5447)

