; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38926 () Bool)

(assert start!38926)

(declare-fun b!407249 () Bool)

(declare-fun e!244614 () Bool)

(assert (=> b!407249 (= e!244614 false)))

(declare-fun lt!188615 () Bool)

(declare-datatypes ((array!24573 0))(
  ( (array!24574 (arr!11736 (Array (_ BitVec 32) (_ BitVec 64))) (size!12088 (_ BitVec 32))) )
))
(declare-fun lt!188614 () array!24573)

(declare-datatypes ((List!6810 0))(
  ( (Nil!6807) (Cons!6806 (h!7662 (_ BitVec 64)) (t!11984 List!6810)) )
))
(declare-fun arrayNoDuplicates!0 (array!24573 (_ BitVec 32) List!6810) Bool)

(assert (=> b!407249 (= lt!188615 (arrayNoDuplicates!0 lt!188614 #b00000000000000000000000000000000 Nil!6807))))

(declare-fun b!407250 () Bool)

(declare-fun res!235406 () Bool)

(declare-fun e!244613 () Bool)

(assert (=> b!407250 (=> (not res!235406) (not e!244613))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24573)

(assert (=> b!407250 (= res!235406 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12088 _keys!709))))))

(declare-fun b!407251 () Bool)

(declare-fun res!235407 () Bool)

(assert (=> b!407251 (=> (not res!235407) (not e!244613))))

(assert (=> b!407251 (= res!235407 (or (= (select (arr!11736 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11736 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407252 () Bool)

(declare-fun e!244609 () Bool)

(declare-fun e!244612 () Bool)

(declare-fun mapRes!17139 () Bool)

(assert (=> b!407252 (= e!244609 (and e!244612 mapRes!17139))))

(declare-fun condMapEmpty!17139 () Bool)

(declare-datatypes ((V!14899 0))(
  ( (V!14900 (val!5217 Int)) )
))
(declare-datatypes ((ValueCell!4829 0))(
  ( (ValueCellFull!4829 (v!7464 V!14899)) (EmptyCell!4829) )
))
(declare-datatypes ((array!24575 0))(
  ( (array!24576 (arr!11737 (Array (_ BitVec 32) ValueCell!4829)) (size!12089 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24575)

(declare-fun mapDefault!17139 () ValueCell!4829)

