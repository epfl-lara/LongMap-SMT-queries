; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36776 () Bool)

(assert start!36776)

(declare-fun mapIsEmpty!14391 () Bool)

(declare-fun mapRes!14391 () Bool)

(assert (=> mapIsEmpty!14391 mapRes!14391))

(declare-fun mapNonEmpty!14391 () Bool)

(declare-fun tp!28467 () Bool)

(declare-fun e!224741 () Bool)

(assert (=> mapNonEmpty!14391 (= mapRes!14391 (and tp!28467 e!224741))))

(declare-datatypes ((V!12507 0))(
  ( (V!12508 (val!4320 Int)) )
))
(declare-datatypes ((ValueCell!3932 0))(
  ( (ValueCellFull!3932 (v!6517 V!12507)) (EmptyCell!3932) )
))
(declare-datatypes ((array!21061 0))(
  ( (array!21062 (arr!9999 (Array (_ BitVec 32) ValueCell!3932)) (size!10351 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21061)

(declare-fun mapRest!14391 () (Array (_ BitVec 32) ValueCell!3932))

(declare-fun mapKey!14391 () (_ BitVec 32))

(declare-fun mapValue!14391 () ValueCell!3932)

(assert (=> mapNonEmpty!14391 (= (arr!9999 _values!506) (store mapRest!14391 mapKey!14391 mapValue!14391))))

(declare-fun b!367182 () Bool)

(declare-fun res!205528 () Bool)

(declare-fun e!224740 () Bool)

(assert (=> b!367182 (=> (not res!205528) (not e!224740))))

(declare-datatypes ((array!21063 0))(
  ( (array!21064 (arr!10000 (Array (_ BitVec 32) (_ BitVec 64))) (size!10352 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21063)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367182 (= res!205528 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!367183 () Bool)

(declare-fun e!224739 () Bool)

(assert (=> b!367183 (= e!224740 e!224739)))

(declare-fun res!205530 () Bool)

(assert (=> b!367183 (=> (not res!205530) (not e!224739))))

(declare-fun lt!169341 () array!21063)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21063 (_ BitVec 32)) Bool)

(assert (=> b!367183 (= res!205530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169341 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367183 (= lt!169341 (array!21064 (store (arr!10000 _keys!658) i!548 k!778) (size!10352 _keys!658)))))

(declare-fun b!367184 () Bool)

(declare-fun res!205532 () Bool)

(assert (=> b!367184 (=> (not res!205532) (not e!224740))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367184 (= res!205532 (and (= (size!10351 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10352 _keys!658) (size!10351 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367186 () Bool)

(declare-fun res!205526 () Bool)

(assert (=> b!367186 (=> (not res!205526) (not e!224740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367186 (= res!205526 (validKeyInArray!0 k!778))))

(declare-fun b!367187 () Bool)

(declare-fun e!224738 () Bool)

(declare-fun e!224736 () Bool)

(assert (=> b!367187 (= e!224738 (and e!224736 mapRes!14391))))

(declare-fun condMapEmpty!14391 () Bool)

(declare-fun mapDefault!14391 () ValueCell!3932)

