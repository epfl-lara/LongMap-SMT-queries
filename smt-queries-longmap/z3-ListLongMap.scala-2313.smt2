; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37326 () Bool)

(assert start!37326)

(declare-fun b_free!8467 () Bool)

(declare-fun b_next!8467 () Bool)

(assert (=> start!37326 (= b_free!8467 (not b_next!8467))))

(declare-fun tp!30117 () Bool)

(declare-fun b_and!15683 () Bool)

(assert (=> start!37326 (= tp!30117 b_and!15683)))

(declare-fun b!378689 () Bool)

(declare-fun res!214646 () Bool)

(declare-fun e!230425 () Bool)

(assert (=> b!378689 (=> (not res!214646) (not e!230425))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13259 0))(
  ( (V!13260 (val!4602 Int)) )
))
(declare-datatypes ((ValueCell!4214 0))(
  ( (ValueCellFull!4214 (v!6793 V!13259)) (EmptyCell!4214) )
))
(declare-datatypes ((array!22137 0))(
  ( (array!22138 (arr!10537 (Array (_ BitVec 32) ValueCell!4214)) (size!10890 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22137)

(declare-datatypes ((array!22139 0))(
  ( (array!22140 (arr!10538 (Array (_ BitVec 32) (_ BitVec 64))) (size!10891 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22139)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!378689 (= res!214646 (and (= (size!10890 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10891 _keys!658) (size!10890 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15237 () Bool)

(declare-fun mapRes!15237 () Bool)

(declare-fun tp!30116 () Bool)

(declare-fun e!230428 () Bool)

(assert (=> mapNonEmpty!15237 (= mapRes!15237 (and tp!30116 e!230428))))

(declare-fun mapValue!15237 () ValueCell!4214)

(declare-fun mapKey!15237 () (_ BitVec 32))

(declare-fun mapRest!15237 () (Array (_ BitVec 32) ValueCell!4214))

(assert (=> mapNonEmpty!15237 (= (arr!10537 _values!506) (store mapRest!15237 mapKey!15237 mapValue!15237))))

(declare-fun b!378690 () Bool)

(declare-fun tp_is_empty!9115 () Bool)

(assert (=> b!378690 (= e!230428 tp_is_empty!9115)))

(declare-fun b!378691 () Bool)

(declare-fun res!214636 () Bool)

(assert (=> b!378691 (=> (not res!214636) (not e!230425))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378691 (= res!214636 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10891 _keys!658))))))

(declare-fun b!378692 () Bool)

(declare-fun e!230427 () Bool)

(assert (=> b!378692 (= e!230427 tp_is_empty!9115)))

(declare-fun b!378693 () Bool)

(declare-fun e!230432 () Bool)

(assert (=> b!378693 (= e!230432 true)))

(declare-datatypes ((tuple2!6128 0))(
  ( (tuple2!6129 (_1!3075 (_ BitVec 64)) (_2!3075 V!13259)) )
))
(declare-datatypes ((List!5957 0))(
  ( (Nil!5954) (Cons!5953 (h!6809 tuple2!6128) (t!11098 List!5957)) )
))
(declare-datatypes ((ListLongMap!5031 0))(
  ( (ListLongMap!5032 (toList!2531 List!5957)) )
))
(declare-fun lt!176541 () ListLongMap!5031)

(declare-fun lt!176547 () ListLongMap!5031)

(declare-fun lt!176545 () tuple2!6128)

(declare-fun +!899 (ListLongMap!5031 tuple2!6128) ListLongMap!5031)

(assert (=> b!378693 (= lt!176541 (+!899 lt!176547 lt!176545))))

(declare-fun v!373 () V!13259)

(declare-datatypes ((Unit!11662 0))(
  ( (Unit!11663) )
))
(declare-fun lt!176540 () Unit!11662)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!176544 () ListLongMap!5031)

(declare-fun minValue!472 () V!13259)

(declare-fun addCommutativeForDiffKeys!298 (ListLongMap!5031 (_ BitVec 64) V!13259 (_ BitVec 64) V!13259) Unit!11662)

(assert (=> b!378693 (= lt!176540 (addCommutativeForDiffKeys!298 lt!176544 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378694 () Bool)

(declare-fun res!214637 () Bool)

(assert (=> b!378694 (=> (not res!214637) (not e!230425))))

(declare-fun arrayContainsKey!0 (array!22139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378694 (= res!214637 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378695 () Bool)

(declare-fun e!230429 () Bool)

(assert (=> b!378695 (= e!230429 (and e!230427 mapRes!15237))))

(declare-fun condMapEmpty!15237 () Bool)

(declare-fun mapDefault!15237 () ValueCell!4214)

(assert (=> b!378695 (= condMapEmpty!15237 (= (arr!10537 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4214)) mapDefault!15237)))))

(declare-fun b!378696 () Bool)

(declare-fun e!230430 () Bool)

(declare-fun e!230426 () Bool)

(assert (=> b!378696 (= e!230430 (not e!230426))))

(declare-fun res!214640 () Bool)

(assert (=> b!378696 (=> res!214640 e!230426)))

(assert (=> b!378696 (= res!214640 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13259)

(declare-fun lt!176536 () ListLongMap!5031)

(declare-fun getCurrentListMap!1933 (array!22139 array!22137 (_ BitVec 32) (_ BitVec 32) V!13259 V!13259 (_ BitVec 32) Int) ListLongMap!5031)

(assert (=> b!378696 (= lt!176536 (getCurrentListMap!1933 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176537 () ListLongMap!5031)

(declare-fun lt!176539 () array!22139)

(declare-fun lt!176535 () array!22137)

(assert (=> b!378696 (= lt!176537 (getCurrentListMap!1933 lt!176539 lt!176535 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176538 () ListLongMap!5031)

(declare-fun lt!176542 () ListLongMap!5031)

(assert (=> b!378696 (and (= lt!176538 lt!176542) (= lt!176542 lt!176538))))

(assert (=> b!378696 (= lt!176542 (+!899 lt!176544 lt!176545))))

(assert (=> b!378696 (= lt!176545 (tuple2!6129 k0!778 v!373))))

(declare-fun lt!176546 () Unit!11662)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!126 (array!22139 array!22137 (_ BitVec 32) (_ BitVec 32) V!13259 V!13259 (_ BitVec 32) (_ BitVec 64) V!13259 (_ BitVec 32) Int) Unit!11662)

(assert (=> b!378696 (= lt!176546 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!126 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!798 (array!22139 array!22137 (_ BitVec 32) (_ BitVec 32) V!13259 V!13259 (_ BitVec 32) Int) ListLongMap!5031)

(assert (=> b!378696 (= lt!176538 (getCurrentListMapNoExtraKeys!798 lt!176539 lt!176535 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378696 (= lt!176535 (array!22138 (store (arr!10537 _values!506) i!548 (ValueCellFull!4214 v!373)) (size!10890 _values!506)))))

(assert (=> b!378696 (= lt!176544 (getCurrentListMapNoExtraKeys!798 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378697 () Bool)

(declare-fun res!214641 () Bool)

(assert (=> b!378697 (=> (not res!214641) (not e!230425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22139 (_ BitVec 32)) Bool)

(assert (=> b!378697 (= res!214641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378698 () Bool)

(declare-fun res!214638 () Bool)

(assert (=> b!378698 (=> (not res!214638) (not e!230425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378698 (= res!214638 (validKeyInArray!0 k0!778))))

(declare-fun b!378699 () Bool)

(declare-fun res!214643 () Bool)

(assert (=> b!378699 (=> (not res!214643) (not e!230430))))

(declare-datatypes ((List!5958 0))(
  ( (Nil!5955) (Cons!5954 (h!6810 (_ BitVec 64)) (t!11099 List!5958)) )
))
(declare-fun arrayNoDuplicates!0 (array!22139 (_ BitVec 32) List!5958) Bool)

(assert (=> b!378699 (= res!214643 (arrayNoDuplicates!0 lt!176539 #b00000000000000000000000000000000 Nil!5955))))

(declare-fun res!214639 () Bool)

(assert (=> start!37326 (=> (not res!214639) (not e!230425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37326 (= res!214639 (validMask!0 mask!970))))

(assert (=> start!37326 e!230425))

(declare-fun array_inv!7766 (array!22137) Bool)

(assert (=> start!37326 (and (array_inv!7766 _values!506) e!230429)))

(assert (=> start!37326 tp!30117))

(assert (=> start!37326 true))

(assert (=> start!37326 tp_is_empty!9115))

(declare-fun array_inv!7767 (array!22139) Bool)

(assert (=> start!37326 (array_inv!7767 _keys!658)))

(declare-fun b!378700 () Bool)

(assert (=> b!378700 (= e!230425 e!230430)))

(declare-fun res!214645 () Bool)

(assert (=> b!378700 (=> (not res!214645) (not e!230430))))

(assert (=> b!378700 (= res!214645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176539 mask!970))))

(assert (=> b!378700 (= lt!176539 (array!22140 (store (arr!10538 _keys!658) i!548 k0!778) (size!10891 _keys!658)))))

(declare-fun mapIsEmpty!15237 () Bool)

(assert (=> mapIsEmpty!15237 mapRes!15237))

(declare-fun b!378701 () Bool)

(assert (=> b!378701 (= e!230426 e!230432)))

(declare-fun res!214644 () Bool)

(assert (=> b!378701 (=> res!214644 e!230432)))

(assert (=> b!378701 (= res!214644 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!378701 (= lt!176536 lt!176547)))

(declare-fun lt!176543 () tuple2!6128)

(assert (=> b!378701 (= lt!176547 (+!899 lt!176544 lt!176543))))

(assert (=> b!378701 (= lt!176537 lt!176541)))

(assert (=> b!378701 (= lt!176541 (+!899 lt!176542 lt!176543))))

(assert (=> b!378701 (= lt!176537 (+!899 lt!176538 lt!176543))))

(assert (=> b!378701 (= lt!176543 (tuple2!6129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378702 () Bool)

(declare-fun res!214635 () Bool)

(assert (=> b!378702 (=> (not res!214635) (not e!230425))))

(assert (=> b!378702 (= res!214635 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5955))))

(declare-fun b!378703 () Bool)

(declare-fun res!214642 () Bool)

(assert (=> b!378703 (=> (not res!214642) (not e!230425))))

(assert (=> b!378703 (= res!214642 (or (= (select (arr!10538 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10538 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37326 res!214639) b!378689))

(assert (= (and b!378689 res!214646) b!378697))

(assert (= (and b!378697 res!214641) b!378702))

(assert (= (and b!378702 res!214635) b!378691))

(assert (= (and b!378691 res!214636) b!378698))

(assert (= (and b!378698 res!214638) b!378703))

(assert (= (and b!378703 res!214642) b!378694))

(assert (= (and b!378694 res!214637) b!378700))

(assert (= (and b!378700 res!214645) b!378699))

(assert (= (and b!378699 res!214643) b!378696))

(assert (= (and b!378696 (not res!214640)) b!378701))

(assert (= (and b!378701 (not res!214644)) b!378693))

(assert (= (and b!378695 condMapEmpty!15237) mapIsEmpty!15237))

(assert (= (and b!378695 (not condMapEmpty!15237)) mapNonEmpty!15237))

(get-info :version)

(assert (= (and mapNonEmpty!15237 ((_ is ValueCellFull!4214) mapValue!15237)) b!378690))

(assert (= (and b!378695 ((_ is ValueCellFull!4214) mapDefault!15237)) b!378692))

(assert (= start!37326 b!378695))

(declare-fun m!375083 () Bool)

(assert (=> mapNonEmpty!15237 m!375083))

(declare-fun m!375085 () Bool)

(assert (=> b!378697 m!375085))

(declare-fun m!375087 () Bool)

(assert (=> b!378696 m!375087))

(declare-fun m!375089 () Bool)

(assert (=> b!378696 m!375089))

(declare-fun m!375091 () Bool)

(assert (=> b!378696 m!375091))

(declare-fun m!375093 () Bool)

(assert (=> b!378696 m!375093))

(declare-fun m!375095 () Bool)

(assert (=> b!378696 m!375095))

(declare-fun m!375097 () Bool)

(assert (=> b!378696 m!375097))

(declare-fun m!375099 () Bool)

(assert (=> b!378696 m!375099))

(declare-fun m!375101 () Bool)

(assert (=> b!378699 m!375101))

(declare-fun m!375103 () Bool)

(assert (=> start!37326 m!375103))

(declare-fun m!375105 () Bool)

(assert (=> start!37326 m!375105))

(declare-fun m!375107 () Bool)

(assert (=> start!37326 m!375107))

(declare-fun m!375109 () Bool)

(assert (=> b!378693 m!375109))

(declare-fun m!375111 () Bool)

(assert (=> b!378693 m!375111))

(declare-fun m!375113 () Bool)

(assert (=> b!378701 m!375113))

(declare-fun m!375115 () Bool)

(assert (=> b!378701 m!375115))

(declare-fun m!375117 () Bool)

(assert (=> b!378701 m!375117))

(declare-fun m!375119 () Bool)

(assert (=> b!378698 m!375119))

(declare-fun m!375121 () Bool)

(assert (=> b!378700 m!375121))

(declare-fun m!375123 () Bool)

(assert (=> b!378700 m!375123))

(declare-fun m!375125 () Bool)

(assert (=> b!378703 m!375125))

(declare-fun m!375127 () Bool)

(assert (=> b!378694 m!375127))

(declare-fun m!375129 () Bool)

(assert (=> b!378702 m!375129))

(check-sat (not b!378702) b_and!15683 (not b!378701) (not b!378697) (not b!378698) (not mapNonEmpty!15237) (not start!37326) (not b!378696) (not b!378693) tp_is_empty!9115 (not b!378694) (not b!378700) (not b_next!8467) (not b!378699))
(check-sat b_and!15683 (not b_next!8467))
