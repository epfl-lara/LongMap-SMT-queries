; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36732 () Bool)

(assert start!36732)

(declare-fun mapNonEmpty!14349 () Bool)

(declare-fun mapRes!14349 () Bool)

(declare-fun tp!28425 () Bool)

(declare-fun e!224455 () Bool)

(assert (=> mapNonEmpty!14349 (= mapRes!14349 (and tp!28425 e!224455))))

(declare-datatypes ((V!12471 0))(
  ( (V!12472 (val!4307 Int)) )
))
(declare-datatypes ((ValueCell!3919 0))(
  ( (ValueCellFull!3919 (v!6503 V!12471)) (EmptyCell!3919) )
))
(declare-fun mapRest!14349 () (Array (_ BitVec 32) ValueCell!3919))

(declare-datatypes ((array!21007 0))(
  ( (array!21008 (arr!9973 (Array (_ BitVec 32) ValueCell!3919)) (size!10325 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21007)

(declare-fun mapKey!14349 () (_ BitVec 32))

(declare-fun mapValue!14349 () ValueCell!3919)

(assert (=> mapNonEmpty!14349 (= (arr!9973 _values!506) (store mapRest!14349 mapKey!14349 mapValue!14349))))

(declare-fun b!366652 () Bool)

(declare-fun res!205140 () Bool)

(declare-fun e!224453 () Bool)

(assert (=> b!366652 (=> (not res!205140) (not e!224453))))

(declare-fun k!778 () (_ BitVec 64))

(declare-datatypes ((array!21009 0))(
  ( (array!21010 (arr!9974 (Array (_ BitVec 32) (_ BitVec 64))) (size!10326 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21009)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21009 (_ BitVec 32)) Bool)

(assert (=> b!366652 (= res!205140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!21010 (store (arr!9974 _keys!658) i!548 k!778) (size!10326 _keys!658)) mask!970))))

(declare-fun b!366653 () Bool)

(declare-fun res!205141 () Bool)

(assert (=> b!366653 (=> (not res!205141) (not e!224453))))

(assert (=> b!366653 (= res!205141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366654 () Bool)

(declare-fun res!205133 () Bool)

(assert (=> b!366654 (=> (not res!205133) (not e!224453))))

(declare-datatypes ((List!5552 0))(
  ( (Nil!5549) (Cons!5548 (h!6404 (_ BitVec 64)) (t!10702 List!5552)) )
))
(declare-fun noDuplicate!192 (List!5552) Bool)

(assert (=> b!366654 (= res!205133 (noDuplicate!192 Nil!5549))))

(declare-fun b!366655 () Bool)

(declare-fun tp_is_empty!8525 () Bool)

(assert (=> b!366655 (= e!224455 tp_is_empty!8525)))

(declare-fun b!366657 () Bool)

(declare-fun res!205138 () Bool)

(assert (=> b!366657 (=> (not res!205138) (not e!224453))))

(assert (=> b!366657 (= res!205138 (or (= (select (arr!9974 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9974 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366658 () Bool)

(declare-fun e!224456 () Bool)

(assert (=> b!366658 (= e!224453 e!224456)))

(declare-fun res!205139 () Bool)

(assert (=> b!366658 (=> res!205139 e!224456)))

(declare-fun contains!2439 (List!5552 (_ BitVec 64)) Bool)

(assert (=> b!366658 (= res!205139 (contains!2439 Nil!5549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366659 () Bool)

(declare-fun res!205137 () Bool)

(assert (=> b!366659 (=> (not res!205137) (not e!224453))))

(declare-fun arrayNoDuplicates!0 (array!21009 (_ BitVec 32) List!5552) Bool)

(assert (=> b!366659 (= res!205137 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5549))))

(declare-fun b!366660 () Bool)

(declare-fun res!205143 () Bool)

(assert (=> b!366660 (=> (not res!205143) (not e!224453))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366660 (= res!205143 (and (= (size!10325 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10326 _keys!658) (size!10325 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366661 () Bool)

(assert (=> b!366661 (= e!224456 (contains!2439 Nil!5549 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366662 () Bool)

(declare-fun res!205136 () Bool)

(assert (=> b!366662 (=> (not res!205136) (not e!224453))))

(assert (=> b!366662 (= res!205136 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10326 _keys!658))))))

(declare-fun b!366663 () Bool)

(declare-fun res!205135 () Bool)

(assert (=> b!366663 (=> (not res!205135) (not e!224453))))

(declare-fun arrayContainsKey!0 (array!21009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366663 (= res!205135 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366664 () Bool)

(declare-fun e!224452 () Bool)

(assert (=> b!366664 (= e!224452 tp_is_empty!8525)))

(declare-fun b!366665 () Bool)

(declare-fun res!205142 () Bool)

(assert (=> b!366665 (=> (not res!205142) (not e!224453))))

(assert (=> b!366665 (= res!205142 (and (bvsle #b00000000000000000000000000000000 (size!10326 _keys!658)) (bvslt (size!10326 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun res!205134 () Bool)

(assert (=> start!36732 (=> (not res!205134) (not e!224453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36732 (= res!205134 (validMask!0 mask!970))))

(assert (=> start!36732 e!224453))

(assert (=> start!36732 true))

(declare-fun e!224457 () Bool)

(declare-fun array_inv!7378 (array!21007) Bool)

(assert (=> start!36732 (and (array_inv!7378 _values!506) e!224457)))

(declare-fun array_inv!7379 (array!21009) Bool)

(assert (=> start!36732 (array_inv!7379 _keys!658)))

(declare-fun b!366656 () Bool)

(assert (=> b!366656 (= e!224457 (and e!224452 mapRes!14349))))

(declare-fun condMapEmpty!14349 () Bool)

(declare-fun mapDefault!14349 () ValueCell!3919)

