; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37920 () Bool)

(assert start!37920)

(declare-fun b_free!8947 () Bool)

(declare-fun b_next!8947 () Bool)

(assert (=> start!37920 (= b_free!8947 (not b_next!8947))))

(declare-fun tp!31605 () Bool)

(declare-fun b_and!16211 () Bool)

(assert (=> start!37920 (= tp!31605 b_and!16211)))

(declare-fun b!389847 () Bool)

(declare-fun res!223085 () Bool)

(declare-fun e!236159 () Bool)

(assert (=> b!389847 (=> (not res!223085) (not e!236159))))

(declare-datatypes ((array!23121 0))(
  ( (array!23122 (arr!11025 (Array (_ BitVec 32) (_ BitVec 64))) (size!11378 (_ BitVec 32))) )
))
(declare-fun lt!183532 () array!23121)

(declare-datatypes ((List!6349 0))(
  ( (Nil!6346) (Cons!6345 (h!7201 (_ BitVec 64)) (t!11498 List!6349)) )
))
(declare-fun arrayNoDuplicates!0 (array!23121 (_ BitVec 32) List!6349) Bool)

(assert (=> b!389847 (= res!223085 (arrayNoDuplicates!0 lt!183532 #b00000000000000000000000000000000 Nil!6346))))

(declare-fun b!389848 () Bool)

(declare-fun res!223079 () Bool)

(declare-fun e!236154 () Bool)

(assert (=> b!389848 (=> (not res!223079) (not e!236154))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!23121)

(assert (=> b!389848 (= res!223079 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11378 _keys!658))))))

(declare-fun b!389849 () Bool)

(declare-fun res!223087 () Bool)

(assert (=> b!389849 (=> (not res!223087) (not e!236154))))

(assert (=> b!389849 (= res!223087 (or (= (select (arr!11025 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11025 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389850 () Bool)

(declare-fun res!223084 () Bool)

(assert (=> b!389850 (=> (not res!223084) (not e!236154))))

(assert (=> b!389850 (= res!223084 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6346))))

(declare-fun b!389851 () Bool)

(assert (=> b!389851 (= e!236154 e!236159)))

(declare-fun res!223082 () Bool)

(assert (=> b!389851 (=> (not res!223082) (not e!236159))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23121 (_ BitVec 32)) Bool)

(assert (=> b!389851 (= res!223082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183532 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!389851 (= lt!183532 (array!23122 (store (arr!11025 _keys!658) i!548 k0!778) (size!11378 _keys!658)))))

(declare-fun b!389852 () Bool)

(declare-fun res!223076 () Bool)

(assert (=> b!389852 (=> (not res!223076) (not e!236154))))

(assert (=> b!389852 (= res!223076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389853 () Bool)

(declare-fun res!223083 () Bool)

(assert (=> b!389853 (=> (not res!223083) (not e!236154))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13931 0))(
  ( (V!13932 (val!4854 Int)) )
))
(declare-datatypes ((ValueCell!4466 0))(
  ( (ValueCellFull!4466 (v!7061 V!13931)) (EmptyCell!4466) )
))
(declare-datatypes ((array!23123 0))(
  ( (array!23124 (arr!11026 (Array (_ BitVec 32) ValueCell!4466)) (size!11379 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23123)

(assert (=> b!389853 (= res!223083 (and (= (size!11379 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11378 _keys!658) (size!11379 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!6504 0))(
  ( (tuple2!6505 (_1!3263 (_ BitVec 64)) (_2!3263 V!13931)) )
))
(declare-datatypes ((List!6350 0))(
  ( (Nil!6347) (Cons!6346 (h!7202 tuple2!6504) (t!11499 List!6350)) )
))
(declare-datatypes ((ListLongMap!5407 0))(
  ( (ListLongMap!5408 (toList!2719 List!6350)) )
))
(declare-fun lt!183526 () ListLongMap!5407)

(declare-fun lt!183524 () tuple2!6504)

(declare-fun lt!183528 () ListLongMap!5407)

(declare-fun e!236160 () Bool)

(declare-fun b!389854 () Bool)

(declare-fun +!1039 (ListLongMap!5407 tuple2!6504) ListLongMap!5407)

(assert (=> b!389854 (= e!236160 (= (+!1039 lt!183528 lt!183524) lt!183526))))

(declare-fun lt!183536 () ListLongMap!5407)

(declare-fun lt!183530 () tuple2!6504)

(declare-fun lt!183521 () ListLongMap!5407)

(assert (=> b!389854 (= (+!1039 lt!183536 lt!183530) (+!1039 lt!183521 lt!183524))))

(declare-fun v!373 () V!13931)

(declare-datatypes ((Unit!11922 0))(
  ( (Unit!11923) )
))
(declare-fun lt!183531 () Unit!11922)

(declare-fun lt!183534 () ListLongMap!5407)

(declare-fun minValue!472 () V!13931)

(declare-fun addCommutativeForDiffKeys!329 (ListLongMap!5407 (_ BitVec 64) V!13931 (_ BitVec 64) V!13931) Unit!11922)

(assert (=> b!389854 (= lt!183531 (addCommutativeForDiffKeys!329 lt!183534 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!389855 () Bool)

(declare-fun e!236157 () Bool)

(declare-fun tp_is_empty!9619 () Bool)

(assert (=> b!389855 (= e!236157 tp_is_empty!9619)))

(declare-fun b!389856 () Bool)

(declare-fun res!223078 () Bool)

(assert (=> b!389856 (=> (not res!223078) (not e!236154))))

(declare-fun arrayContainsKey!0 (array!23121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389856 (= res!223078 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389857 () Bool)

(declare-fun e!236158 () Bool)

(assert (=> b!389857 (= e!236158 tp_is_empty!9619)))

(declare-fun b!389858 () Bool)

(declare-fun res!223081 () Bool)

(assert (=> b!389858 (=> (not res!223081) (not e!236154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389858 (= res!223081 (validKeyInArray!0 k0!778))))

(declare-fun res!223086 () Bool)

(assert (=> start!37920 (=> (not res!223086) (not e!236154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37920 (= res!223086 (validMask!0 mask!970))))

(assert (=> start!37920 e!236154))

(declare-fun e!236155 () Bool)

(declare-fun array_inv!8102 (array!23123) Bool)

(assert (=> start!37920 (and (array_inv!8102 _values!506) e!236155)))

(assert (=> start!37920 tp!31605))

(assert (=> start!37920 true))

(assert (=> start!37920 tp_is_empty!9619))

(declare-fun array_inv!8103 (array!23121) Bool)

(assert (=> start!37920 (array_inv!8103 _keys!658)))

(declare-fun b!389846 () Bool)

(declare-fun e!236156 () Bool)

(assert (=> b!389846 (= e!236156 e!236160)))

(declare-fun res!223077 () Bool)

(assert (=> b!389846 (=> res!223077 e!236160)))

(assert (=> b!389846 (= res!223077 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183523 () ListLongMap!5407)

(assert (=> b!389846 (= lt!183523 lt!183536)))

(assert (=> b!389846 (= lt!183536 (+!1039 lt!183534 lt!183524))))

(declare-fun zeroValue!472 () V!13931)

(declare-fun lt!183529 () ListLongMap!5407)

(declare-fun lt!183533 () Unit!11922)

(assert (=> b!389846 (= lt!183533 (addCommutativeForDiffKeys!329 lt!183529 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!389846 (= lt!183526 (+!1039 lt!183523 lt!183530))))

(declare-fun lt!183527 () ListLongMap!5407)

(declare-fun lt!183525 () tuple2!6504)

(assert (=> b!389846 (= lt!183523 (+!1039 lt!183527 lt!183525))))

(assert (=> b!389846 (= lt!183528 lt!183521)))

(assert (=> b!389846 (= lt!183521 (+!1039 lt!183534 lt!183530))))

(assert (=> b!389846 (= lt!183534 (+!1039 lt!183529 lt!183525))))

(declare-fun lt!183522 () ListLongMap!5407)

(assert (=> b!389846 (= lt!183526 (+!1039 (+!1039 lt!183522 lt!183525) lt!183530))))

(assert (=> b!389846 (= lt!183530 (tuple2!6505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389846 (= lt!183525 (tuple2!6505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!16005 () Bool)

(declare-fun mapRes!16005 () Bool)

(assert (=> mapIsEmpty!16005 mapRes!16005))

(declare-fun mapNonEmpty!16005 () Bool)

(declare-fun tp!31604 () Bool)

(assert (=> mapNonEmpty!16005 (= mapRes!16005 (and tp!31604 e!236157))))

(declare-fun mapValue!16005 () ValueCell!4466)

(declare-fun mapRest!16005 () (Array (_ BitVec 32) ValueCell!4466))

(declare-fun mapKey!16005 () (_ BitVec 32))

(assert (=> mapNonEmpty!16005 (= (arr!11026 _values!506) (store mapRest!16005 mapKey!16005 mapValue!16005))))

(declare-fun b!389859 () Bool)

(assert (=> b!389859 (= e!236155 (and e!236158 mapRes!16005))))

(declare-fun condMapEmpty!16005 () Bool)

(declare-fun mapDefault!16005 () ValueCell!4466)

(assert (=> b!389859 (= condMapEmpty!16005 (= (arr!11026 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4466)) mapDefault!16005)))))

(declare-fun b!389860 () Bool)

(assert (=> b!389860 (= e!236159 (not e!236156))))

(declare-fun res!223080 () Bool)

(assert (=> b!389860 (=> res!223080 e!236156)))

(assert (=> b!389860 (= res!223080 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2045 (array!23121 array!23123 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) Int) ListLongMap!5407)

(assert (=> b!389860 (= lt!183528 (getCurrentListMap!2045 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183535 () array!23123)

(assert (=> b!389860 (= lt!183526 (getCurrentListMap!2045 lt!183532 lt!183535 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389860 (and (= lt!183522 lt!183527) (= lt!183527 lt!183522))))

(assert (=> b!389860 (= lt!183527 (+!1039 lt!183529 lt!183524))))

(assert (=> b!389860 (= lt!183524 (tuple2!6505 k0!778 v!373))))

(declare-fun lt!183537 () Unit!11922)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!246 (array!23121 array!23123 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) (_ BitVec 64) V!13931 (_ BitVec 32) Int) Unit!11922)

(assert (=> b!389860 (= lt!183537 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!246 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!955 (array!23121 array!23123 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) Int) ListLongMap!5407)

(assert (=> b!389860 (= lt!183522 (getCurrentListMapNoExtraKeys!955 lt!183532 lt!183535 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389860 (= lt!183535 (array!23124 (store (arr!11026 _values!506) i!548 (ValueCellFull!4466 v!373)) (size!11379 _values!506)))))

(assert (=> b!389860 (= lt!183529 (getCurrentListMapNoExtraKeys!955 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37920 res!223086) b!389853))

(assert (= (and b!389853 res!223083) b!389852))

(assert (= (and b!389852 res!223076) b!389850))

(assert (= (and b!389850 res!223084) b!389848))

(assert (= (and b!389848 res!223079) b!389858))

(assert (= (and b!389858 res!223081) b!389849))

(assert (= (and b!389849 res!223087) b!389856))

(assert (= (and b!389856 res!223078) b!389851))

(assert (= (and b!389851 res!223082) b!389847))

(assert (= (and b!389847 res!223085) b!389860))

(assert (= (and b!389860 (not res!223080)) b!389846))

(assert (= (and b!389846 (not res!223077)) b!389854))

(assert (= (and b!389859 condMapEmpty!16005) mapIsEmpty!16005))

(assert (= (and b!389859 (not condMapEmpty!16005)) mapNonEmpty!16005))

(get-info :version)

(assert (= (and mapNonEmpty!16005 ((_ is ValueCellFull!4466) mapValue!16005)) b!389855))

(assert (= (and b!389859 ((_ is ValueCellFull!4466) mapDefault!16005)) b!389857))

(assert (= start!37920 b!389859))

(declare-fun m!385675 () Bool)

(assert (=> b!389849 m!385675))

(declare-fun m!385677 () Bool)

(assert (=> b!389852 m!385677))

(declare-fun m!385679 () Bool)

(assert (=> b!389851 m!385679))

(declare-fun m!385681 () Bool)

(assert (=> b!389851 m!385681))

(declare-fun m!385683 () Bool)

(assert (=> b!389850 m!385683))

(declare-fun m!385685 () Bool)

(assert (=> b!389860 m!385685))

(declare-fun m!385687 () Bool)

(assert (=> b!389860 m!385687))

(declare-fun m!385689 () Bool)

(assert (=> b!389860 m!385689))

(declare-fun m!385691 () Bool)

(assert (=> b!389860 m!385691))

(declare-fun m!385693 () Bool)

(assert (=> b!389860 m!385693))

(declare-fun m!385695 () Bool)

(assert (=> b!389860 m!385695))

(declare-fun m!385697 () Bool)

(assert (=> b!389860 m!385697))

(declare-fun m!385699 () Bool)

(assert (=> b!389856 m!385699))

(declare-fun m!385701 () Bool)

(assert (=> b!389854 m!385701))

(declare-fun m!385703 () Bool)

(assert (=> b!389854 m!385703))

(declare-fun m!385705 () Bool)

(assert (=> b!389854 m!385705))

(declare-fun m!385707 () Bool)

(assert (=> b!389854 m!385707))

(declare-fun m!385709 () Bool)

(assert (=> b!389847 m!385709))

(declare-fun m!385711 () Bool)

(assert (=> b!389858 m!385711))

(declare-fun m!385713 () Bool)

(assert (=> start!37920 m!385713))

(declare-fun m!385715 () Bool)

(assert (=> start!37920 m!385715))

(declare-fun m!385717 () Bool)

(assert (=> start!37920 m!385717))

(declare-fun m!385719 () Bool)

(assert (=> b!389846 m!385719))

(declare-fun m!385721 () Bool)

(assert (=> b!389846 m!385721))

(declare-fun m!385723 () Bool)

(assert (=> b!389846 m!385723))

(declare-fun m!385725 () Bool)

(assert (=> b!389846 m!385725))

(assert (=> b!389846 m!385723))

(declare-fun m!385727 () Bool)

(assert (=> b!389846 m!385727))

(declare-fun m!385729 () Bool)

(assert (=> b!389846 m!385729))

(declare-fun m!385731 () Bool)

(assert (=> b!389846 m!385731))

(declare-fun m!385733 () Bool)

(assert (=> b!389846 m!385733))

(declare-fun m!385735 () Bool)

(assert (=> mapNonEmpty!16005 m!385735))

(check-sat b_and!16211 (not b!389850) (not b!389852) (not b!389847) (not b_next!8947) (not b!389856) (not b!389854) (not mapNonEmpty!16005) tp_is_empty!9619 (not b!389851) (not b!389860) (not b!389858) (not b!389846) (not start!37920))
(check-sat b_and!16211 (not b_next!8947))
