; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37328 () Bool)

(assert start!37328)

(declare-fun b_free!8455 () Bool)

(declare-fun b_next!8455 () Bool)

(assert (=> start!37328 (= b_free!8455 (not b_next!8455))))

(declare-fun tp!30081 () Bool)

(declare-fun b_and!15697 () Bool)

(assert (=> start!37328 (= tp!30081 b_and!15697)))

(declare-fun mapNonEmpty!15219 () Bool)

(declare-fun mapRes!15219 () Bool)

(declare-fun tp!30080 () Bool)

(declare-fun e!230456 () Bool)

(assert (=> mapNonEmpty!15219 (= mapRes!15219 (and tp!30080 e!230456))))

(declare-datatypes ((V!13243 0))(
  ( (V!13244 (val!4596 Int)) )
))
(declare-datatypes ((ValueCell!4208 0))(
  ( (ValueCellFull!4208 (v!6793 V!13243)) (EmptyCell!4208) )
))
(declare-fun mapValue!15219 () ValueCell!4208)

(declare-fun mapRest!15219 () (Array (_ BitVec 32) ValueCell!4208))

(declare-fun mapKey!15219 () (_ BitVec 32))

(declare-datatypes ((array!22131 0))(
  ( (array!22132 (arr!10534 (Array (_ BitVec 32) ValueCell!4208)) (size!10886 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22131)

(assert (=> mapNonEmpty!15219 (= (arr!10534 _values!506) (store mapRest!15219 mapKey!15219 mapValue!15219))))

(declare-fun b!378690 () Bool)

(declare-fun res!214548 () Bool)

(declare-fun e!230460 () Bool)

(assert (=> b!378690 (=> (not res!214548) (not e!230460))))

(declare-datatypes ((array!22133 0))(
  ( (array!22134 (arr!10535 (Array (_ BitVec 32) (_ BitVec 64))) (size!10887 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22133)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378690 (= res!214548 (or (= (select (arr!10535 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10535 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15219 () Bool)

(assert (=> mapIsEmpty!15219 mapRes!15219))

(declare-fun res!214555 () Bool)

(assert (=> start!37328 (=> (not res!214555) (not e!230460))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37328 (= res!214555 (validMask!0 mask!970))))

(assert (=> start!37328 e!230460))

(declare-fun e!230458 () Bool)

(declare-fun array_inv!7758 (array!22131) Bool)

(assert (=> start!37328 (and (array_inv!7758 _values!506) e!230458)))

(assert (=> start!37328 tp!30081))

(assert (=> start!37328 true))

(declare-fun tp_is_empty!9103 () Bool)

(assert (=> start!37328 tp_is_empty!9103))

(declare-fun array_inv!7759 (array!22133) Bool)

(assert (=> start!37328 (array_inv!7759 _keys!658)))

(declare-fun b!378691 () Bool)

(declare-fun e!230457 () Bool)

(assert (=> b!378691 (= e!230457 tp_is_empty!9103)))

(declare-fun b!378692 () Bool)

(declare-fun res!214557 () Bool)

(assert (=> b!378692 (=> (not res!214557) (not e!230460))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378692 (= res!214557 (validKeyInArray!0 k!778))))

(declare-fun b!378693 () Bool)

(declare-fun res!214552 () Bool)

(assert (=> b!378693 (=> (not res!214552) (not e!230460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22133 (_ BitVec 32)) Bool)

(assert (=> b!378693 (= res!214552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378694 () Bool)

(declare-fun e!230462 () Bool)

(assert (=> b!378694 (= e!230462 true)))

(declare-datatypes ((tuple2!6140 0))(
  ( (tuple2!6141 (_1!3081 (_ BitVec 64)) (_2!3081 V!13243)) )
))
(declare-datatypes ((List!5977 0))(
  ( (Nil!5974) (Cons!5973 (h!6829 tuple2!6140) (t!11127 List!5977)) )
))
(declare-datatypes ((ListLongMap!5053 0))(
  ( (ListLongMap!5054 (toList!2542 List!5977)) )
))
(declare-fun lt!176544 () ListLongMap!5053)

(declare-fun lt!176535 () ListLongMap!5053)

(declare-fun lt!176546 () tuple2!6140)

(declare-fun +!888 (ListLongMap!5053 tuple2!6140) ListLongMap!5053)

(assert (=> b!378694 (= lt!176544 (+!888 lt!176535 lt!176546))))

(declare-fun lt!176547 () ListLongMap!5053)

(declare-fun v!373 () V!13243)

(declare-fun minValue!472 () V!13243)

(declare-datatypes ((Unit!11676 0))(
  ( (Unit!11677) )
))
(declare-fun lt!176543 () Unit!11676)

(declare-fun addCommutativeForDiffKeys!290 (ListLongMap!5053 (_ BitVec 64) V!13243 (_ BitVec 64) V!13243) Unit!11676)

(assert (=> b!378694 (= lt!176543 (addCommutativeForDiffKeys!290 lt!176547 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378695 () Bool)

(declare-fun res!214558 () Bool)

(assert (=> b!378695 (=> (not res!214558) (not e!230460))))

(declare-fun arrayContainsKey!0 (array!22133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378695 (= res!214558 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!378696 () Bool)

(declare-fun e!230461 () Bool)

(assert (=> b!378696 (= e!230461 e!230462)))

(declare-fun res!214553 () Bool)

(assert (=> b!378696 (=> res!214553 e!230462)))

(assert (=> b!378696 (= res!214553 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176537 () ListLongMap!5053)

(assert (=> b!378696 (= lt!176537 lt!176535)))

(declare-fun lt!176542 () tuple2!6140)

(assert (=> b!378696 (= lt!176535 (+!888 lt!176547 lt!176542))))

(declare-fun lt!176540 () ListLongMap!5053)

(assert (=> b!378696 (= lt!176540 lt!176544)))

(declare-fun lt!176541 () ListLongMap!5053)

(assert (=> b!378696 (= lt!176544 (+!888 lt!176541 lt!176542))))

(declare-fun lt!176539 () ListLongMap!5053)

(assert (=> b!378696 (= lt!176540 (+!888 lt!176539 lt!176542))))

(assert (=> b!378696 (= lt!176542 (tuple2!6141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378697 () Bool)

(declare-fun res!214559 () Bool)

(assert (=> b!378697 (=> (not res!214559) (not e!230460))))

(assert (=> b!378697 (= res!214559 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10887 _keys!658))))))

(declare-fun b!378698 () Bool)

(declare-fun e!230455 () Bool)

(assert (=> b!378698 (= e!230455 (not e!230461))))

(declare-fun res!214549 () Bool)

(assert (=> b!378698 (=> res!214549 e!230461)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378698 (= res!214549 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13243)

(declare-fun getCurrentListMap!1967 (array!22133 array!22131 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) Int) ListLongMap!5053)

(assert (=> b!378698 (= lt!176537 (getCurrentListMap!1967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176545 () array!22133)

(declare-fun lt!176538 () array!22131)

(assert (=> b!378698 (= lt!176540 (getCurrentListMap!1967 lt!176545 lt!176538 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378698 (and (= lt!176539 lt!176541) (= lt!176541 lt!176539))))

(assert (=> b!378698 (= lt!176541 (+!888 lt!176547 lt!176546))))

(assert (=> b!378698 (= lt!176546 (tuple2!6141 k!778 v!373))))

(declare-fun lt!176536 () Unit!11676)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!125 (array!22133 array!22131 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) (_ BitVec 64) V!13243 (_ BitVec 32) Int) Unit!11676)

(assert (=> b!378698 (= lt!176536 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!125 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!801 (array!22133 array!22131 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) Int) ListLongMap!5053)

(assert (=> b!378698 (= lt!176539 (getCurrentListMapNoExtraKeys!801 lt!176545 lt!176538 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378698 (= lt!176538 (array!22132 (store (arr!10534 _values!506) i!548 (ValueCellFull!4208 v!373)) (size!10886 _values!506)))))

(assert (=> b!378698 (= lt!176547 (getCurrentListMapNoExtraKeys!801 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378699 () Bool)

(declare-fun res!214550 () Bool)

(assert (=> b!378699 (=> (not res!214550) (not e!230455))))

(declare-datatypes ((List!5978 0))(
  ( (Nil!5975) (Cons!5974 (h!6830 (_ BitVec 64)) (t!11128 List!5978)) )
))
(declare-fun arrayNoDuplicates!0 (array!22133 (_ BitVec 32) List!5978) Bool)

(assert (=> b!378699 (= res!214550 (arrayNoDuplicates!0 lt!176545 #b00000000000000000000000000000000 Nil!5975))))

(declare-fun b!378700 () Bool)

(assert (=> b!378700 (= e!230458 (and e!230457 mapRes!15219))))

(declare-fun condMapEmpty!15219 () Bool)

(declare-fun mapDefault!15219 () ValueCell!4208)

