; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37280 () Bool)

(assert start!37280)

(declare-fun b_free!8407 () Bool)

(declare-fun b_next!8407 () Bool)

(assert (=> start!37280 (= b_free!8407 (not b_next!8407))))

(declare-fun tp!29936 () Bool)

(declare-fun b_and!15649 () Bool)

(assert (=> start!37280 (= tp!29936 b_and!15649)))

(declare-fun b!377601 () Bool)

(declare-fun e!229886 () Bool)

(declare-fun e!229883 () Bool)

(assert (=> b!377601 (= e!229886 (not e!229883))))

(declare-fun res!213680 () Bool)

(assert (=> b!377601 (=> res!213680 e!229883)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377601 (= res!213680 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13179 0))(
  ( (V!13180 (val!4572 Int)) )
))
(declare-datatypes ((ValueCell!4184 0))(
  ( (ValueCellFull!4184 (v!6769 V!13179)) (EmptyCell!4184) )
))
(declare-datatypes ((array!22039 0))(
  ( (array!22040 (arr!10488 (Array (_ BitVec 32) ValueCell!4184)) (size!10840 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22039)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6098 0))(
  ( (tuple2!6099 (_1!3060 (_ BitVec 64)) (_2!3060 V!13179)) )
))
(declare-datatypes ((List!5937 0))(
  ( (Nil!5934) (Cons!5933 (h!6789 tuple2!6098) (t!11087 List!5937)) )
))
(declare-datatypes ((ListLongMap!5011 0))(
  ( (ListLongMap!5012 (toList!2521 List!5937)) )
))
(declare-fun lt!175644 () ListLongMap!5011)

(declare-fun zeroValue!472 () V!13179)

(declare-datatypes ((array!22041 0))(
  ( (array!22042 (arr!10489 (Array (_ BitVec 32) (_ BitVec 64))) (size!10841 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22041)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13179)

(declare-fun getCurrentListMap!1950 (array!22041 array!22039 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) Int) ListLongMap!5011)

(assert (=> b!377601 (= lt!175644 (getCurrentListMap!1950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175636 () ListLongMap!5011)

(declare-fun lt!175640 () array!22039)

(declare-fun lt!175647 () array!22041)

(assert (=> b!377601 (= lt!175636 (getCurrentListMap!1950 lt!175647 lt!175640 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175638 () ListLongMap!5011)

(declare-fun lt!175637 () ListLongMap!5011)

(assert (=> b!377601 (and (= lt!175638 lt!175637) (= lt!175637 lt!175638))))

(declare-fun lt!175642 () ListLongMap!5011)

(declare-fun lt!175641 () tuple2!6098)

(declare-fun +!867 (ListLongMap!5011 tuple2!6098) ListLongMap!5011)

(assert (=> b!377601 (= lt!175637 (+!867 lt!175642 lt!175641))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13179)

(assert (=> b!377601 (= lt!175641 (tuple2!6099 k!778 v!373))))

(declare-datatypes ((Unit!11636 0))(
  ( (Unit!11637) )
))
(declare-fun lt!175646 () Unit!11636)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!108 (array!22041 array!22039 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) (_ BitVec 64) V!13179 (_ BitVec 32) Int) Unit!11636)

(assert (=> b!377601 (= lt!175646 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!108 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!784 (array!22041 array!22039 (_ BitVec 32) (_ BitVec 32) V!13179 V!13179 (_ BitVec 32) Int) ListLongMap!5011)

(assert (=> b!377601 (= lt!175638 (getCurrentListMapNoExtraKeys!784 lt!175647 lt!175640 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377601 (= lt!175640 (array!22040 (store (arr!10488 _values!506) i!548 (ValueCellFull!4184 v!373)) (size!10840 _values!506)))))

(assert (=> b!377601 (= lt!175642 (getCurrentListMapNoExtraKeys!784 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377602 () Bool)

(declare-fun e!229882 () Bool)

(assert (=> b!377602 (= e!229883 e!229882)))

(declare-fun res!213678 () Bool)

(assert (=> b!377602 (=> res!213678 e!229882)))

(assert (=> b!377602 (= res!213678 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175635 () ListLongMap!5011)

(assert (=> b!377602 (= lt!175636 lt!175635)))

(declare-fun lt!175643 () tuple2!6098)

(assert (=> b!377602 (= lt!175635 (+!867 lt!175637 lt!175643))))

(declare-fun lt!175639 () ListLongMap!5011)

(assert (=> b!377602 (= lt!175644 lt!175639)))

(assert (=> b!377602 (= lt!175639 (+!867 lt!175642 lt!175643))))

(assert (=> b!377602 (= lt!175636 (+!867 lt!175638 lt!175643))))

(assert (=> b!377602 (= lt!175643 (tuple2!6099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377603 () Bool)

(declare-fun res!213677 () Bool)

(declare-fun e!229879 () Bool)

(assert (=> b!377603 (=> (not res!213677) (not e!229879))))

(assert (=> b!377603 (= res!213677 (and (= (size!10840 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10841 _keys!658) (size!10840 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15147 () Bool)

(declare-fun mapRes!15147 () Bool)

(assert (=> mapIsEmpty!15147 mapRes!15147))

(declare-fun b!377604 () Bool)

(assert (=> b!377604 (= e!229882 true)))

(assert (=> b!377604 (= lt!175635 (+!867 lt!175639 lt!175641))))

(declare-fun lt!175645 () Unit!11636)

(declare-fun addCommutativeForDiffKeys!275 (ListLongMap!5011 (_ BitVec 64) V!13179 (_ BitVec 64) V!13179) Unit!11636)

(assert (=> b!377604 (= lt!175645 (addCommutativeForDiffKeys!275 lt!175642 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15147 () Bool)

(declare-fun tp!29937 () Bool)

(declare-fun e!229880 () Bool)

(assert (=> mapNonEmpty!15147 (= mapRes!15147 (and tp!29937 e!229880))))

(declare-fun mapValue!15147 () ValueCell!4184)

(declare-fun mapKey!15147 () (_ BitVec 32))

(declare-fun mapRest!15147 () (Array (_ BitVec 32) ValueCell!4184))

(assert (=> mapNonEmpty!15147 (= (arr!10488 _values!506) (store mapRest!15147 mapKey!15147 mapValue!15147))))

(declare-fun b!377605 () Bool)

(declare-fun res!213676 () Bool)

(assert (=> b!377605 (=> (not res!213676) (not e!229879))))

(assert (=> b!377605 (= res!213676 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10841 _keys!658))))))

(declare-fun res!213681 () Bool)

(assert (=> start!37280 (=> (not res!213681) (not e!229879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37280 (= res!213681 (validMask!0 mask!970))))

(assert (=> start!37280 e!229879))

(declare-fun e!229884 () Bool)

(declare-fun array_inv!7726 (array!22039) Bool)

(assert (=> start!37280 (and (array_inv!7726 _values!506) e!229884)))

(assert (=> start!37280 tp!29936))

(assert (=> start!37280 true))

(declare-fun tp_is_empty!9055 () Bool)

(assert (=> start!37280 tp_is_empty!9055))

(declare-fun array_inv!7727 (array!22041) Bool)

(assert (=> start!37280 (array_inv!7727 _keys!658)))

(declare-fun b!377606 () Bool)

(declare-fun e!229885 () Bool)

(assert (=> b!377606 (= e!229885 tp_is_empty!9055)))

(declare-fun b!377607 () Bool)

(declare-fun res!213685 () Bool)

(assert (=> b!377607 (=> (not res!213685) (not e!229879))))

(declare-datatypes ((List!5938 0))(
  ( (Nil!5935) (Cons!5934 (h!6790 (_ BitVec 64)) (t!11088 List!5938)) )
))
(declare-fun arrayNoDuplicates!0 (array!22041 (_ BitVec 32) List!5938) Bool)

(assert (=> b!377607 (= res!213685 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5935))))

(declare-fun b!377608 () Bool)

(declare-fun res!213684 () Bool)

(assert (=> b!377608 (=> (not res!213684) (not e!229879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22041 (_ BitVec 32)) Bool)

(assert (=> b!377608 (= res!213684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377609 () Bool)

(declare-fun res!213679 () Bool)

(assert (=> b!377609 (=> (not res!213679) (not e!229879))))

(assert (=> b!377609 (= res!213679 (or (= (select (arr!10489 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10489 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377610 () Bool)

(assert (=> b!377610 (= e!229880 tp_is_empty!9055)))

(declare-fun b!377611 () Bool)

(declare-fun res!213682 () Bool)

(assert (=> b!377611 (=> (not res!213682) (not e!229879))))

(declare-fun arrayContainsKey!0 (array!22041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377611 (= res!213682 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!377612 () Bool)

(assert (=> b!377612 (= e!229879 e!229886)))

(declare-fun res!213686 () Bool)

(assert (=> b!377612 (=> (not res!213686) (not e!229886))))

(assert (=> b!377612 (= res!213686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175647 mask!970))))

(assert (=> b!377612 (= lt!175647 (array!22042 (store (arr!10489 _keys!658) i!548 k!778) (size!10841 _keys!658)))))

(declare-fun b!377613 () Bool)

(declare-fun res!213683 () Bool)

(assert (=> b!377613 (=> (not res!213683) (not e!229879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377613 (= res!213683 (validKeyInArray!0 k!778))))

(declare-fun b!377614 () Bool)

(declare-fun res!213675 () Bool)

(assert (=> b!377614 (=> (not res!213675) (not e!229886))))

(assert (=> b!377614 (= res!213675 (arrayNoDuplicates!0 lt!175647 #b00000000000000000000000000000000 Nil!5935))))

(declare-fun b!377615 () Bool)

(assert (=> b!377615 (= e!229884 (and e!229885 mapRes!15147))))

(declare-fun condMapEmpty!15147 () Bool)

(declare-fun mapDefault!15147 () ValueCell!4184)

