; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38932 () Bool)

(assert start!38932)

(declare-fun b!407366 () Bool)

(declare-fun res!235494 () Bool)

(declare-fun e!244668 () Bool)

(assert (=> b!407366 (=> (not res!235494) (not e!244668))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24583 0))(
  ( (array!24584 (arr!11741 (Array (_ BitVec 32) (_ BitVec 64))) (size!12093 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24583)

(assert (=> b!407366 (= res!235494 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12093 _keys!709))))))

(declare-fun b!407367 () Bool)

(declare-fun res!235490 () Bool)

(assert (=> b!407367 (=> (not res!235490) (not e!244668))))

(assert (=> b!407367 (= res!235490 (or (= (select (arr!11741 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11741 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17148 () Bool)

(declare-fun mapRes!17148 () Bool)

(assert (=> mapIsEmpty!17148 mapRes!17148))

(declare-fun mapNonEmpty!17148 () Bool)

(declare-fun tp!33267 () Bool)

(declare-fun e!244666 () Bool)

(assert (=> mapNonEmpty!17148 (= mapRes!17148 (and tp!33267 e!244666))))

(declare-datatypes ((V!14907 0))(
  ( (V!14908 (val!5220 Int)) )
))
(declare-datatypes ((ValueCell!4832 0))(
  ( (ValueCellFull!4832 (v!7467 V!14907)) (EmptyCell!4832) )
))
(declare-fun mapValue!17148 () ValueCell!4832)

(declare-datatypes ((array!24585 0))(
  ( (array!24586 (arr!11742 (Array (_ BitVec 32) ValueCell!4832)) (size!12094 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24585)

(declare-fun mapKey!17148 () (_ BitVec 32))

(declare-fun mapRest!17148 () (Array (_ BitVec 32) ValueCell!4832))

(assert (=> mapNonEmpty!17148 (= (arr!11742 _values!549) (store mapRest!17148 mapKey!17148 mapValue!17148))))

(declare-fun b!407368 () Bool)

(declare-fun e!244663 () Bool)

(declare-fun tp_is_empty!10351 () Bool)

(assert (=> b!407368 (= e!244663 tp_is_empty!10351)))

(declare-fun b!407369 () Bool)

(declare-fun res!235489 () Bool)

(assert (=> b!407369 (=> (not res!235489) (not e!244668))))

(declare-datatypes ((List!6812 0))(
  ( (Nil!6809) (Cons!6808 (h!7664 (_ BitVec 64)) (t!11986 List!6812)) )
))
(declare-fun arrayNoDuplicates!0 (array!24583 (_ BitVec 32) List!6812) Bool)

(assert (=> b!407369 (= res!235489 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6809))))

(declare-fun res!235492 () Bool)

(assert (=> start!38932 (=> (not res!235492) (not e!244668))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38932 (= res!235492 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12093 _keys!709))))))

(assert (=> start!38932 e!244668))

(assert (=> start!38932 true))

(declare-fun e!244665 () Bool)

(declare-fun array_inv!8566 (array!24585) Bool)

(assert (=> start!38932 (and (array_inv!8566 _values!549) e!244665)))

(declare-fun array_inv!8567 (array!24583) Bool)

(assert (=> start!38932 (array_inv!8567 _keys!709)))

(declare-fun b!407370 () Bool)

(declare-fun res!235488 () Bool)

(assert (=> b!407370 (=> (not res!235488) (not e!244668))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407370 (= res!235488 (validMask!0 mask!1025))))

(declare-fun b!407371 () Bool)

(assert (=> b!407371 (= e!244665 (and e!244663 mapRes!17148))))

(declare-fun condMapEmpty!17148 () Bool)

(declare-fun mapDefault!17148 () ValueCell!4832)

