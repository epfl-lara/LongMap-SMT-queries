; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36802 () Bool)

(assert start!36802)

(declare-fun b!367655 () Bool)

(declare-fun res!205884 () Bool)

(declare-fun e!224975 () Bool)

(assert (=> b!367655 (=> (not res!205884) (not e!224975))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21113 0))(
  ( (array!21114 (arr!10025 (Array (_ BitVec 32) (_ BitVec 64))) (size!10377 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21113)

(assert (=> b!367655 (= res!205884 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10377 _keys!658))))))

(declare-fun b!367656 () Bool)

(declare-fun res!205880 () Bool)

(assert (=> b!367656 (=> (not res!205880) (not e!224975))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367656 (= res!205880 (validKeyInArray!0 k0!778))))

(declare-fun b!367657 () Bool)

(declare-fun res!205886 () Bool)

(assert (=> b!367657 (=> (not res!205886) (not e!224975))))

(declare-datatypes ((V!12541 0))(
  ( (V!12542 (val!4333 Int)) )
))
(declare-datatypes ((ValueCell!3945 0))(
  ( (ValueCellFull!3945 (v!6530 V!12541)) (EmptyCell!3945) )
))
(declare-datatypes ((array!21115 0))(
  ( (array!21116 (arr!10026 (Array (_ BitVec 32) ValueCell!3945)) (size!10378 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21115)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367657 (= res!205886 (and (= (size!10378 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10377 _keys!658) (size!10378 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367658 () Bool)

(declare-fun res!205889 () Bool)

(assert (=> b!367658 (=> (not res!205889) (not e!224975))))

(declare-fun arrayContainsKey!0 (array!21113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367658 (= res!205889 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367659 () Bool)

(declare-fun e!224970 () Bool)

(declare-fun tp_is_empty!8577 () Bool)

(assert (=> b!367659 (= e!224970 tp_is_empty!8577)))

(declare-fun b!367660 () Bool)

(declare-fun e!224973 () Bool)

(assert (=> b!367660 (= e!224973 tp_is_empty!8577)))

(declare-fun res!205888 () Bool)

(assert (=> start!36802 (=> (not res!205888) (not e!224975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36802 (= res!205888 (validMask!0 mask!970))))

(assert (=> start!36802 e!224975))

(assert (=> start!36802 true))

(declare-fun e!224972 () Bool)

(declare-fun array_inv!7414 (array!21115) Bool)

(assert (=> start!36802 (and (array_inv!7414 _values!506) e!224972)))

(declare-fun array_inv!7415 (array!21113) Bool)

(assert (=> start!36802 (array_inv!7415 _keys!658)))

(declare-fun mapNonEmpty!14430 () Bool)

(declare-fun mapRes!14430 () Bool)

(declare-fun tp!28506 () Bool)

(assert (=> mapNonEmpty!14430 (= mapRes!14430 (and tp!28506 e!224973))))

(declare-fun mapValue!14430 () ValueCell!3945)

(declare-fun mapKey!14430 () (_ BitVec 32))

(declare-fun mapRest!14430 () (Array (_ BitVec 32) ValueCell!3945))

(assert (=> mapNonEmpty!14430 (= (arr!10026 _values!506) (store mapRest!14430 mapKey!14430 mapValue!14430))))

(declare-fun b!367661 () Bool)

(assert (=> b!367661 (= e!224972 (and e!224970 mapRes!14430))))

(declare-fun condMapEmpty!14430 () Bool)

(declare-fun mapDefault!14430 () ValueCell!3945)

(assert (=> b!367661 (= condMapEmpty!14430 (= (arr!10026 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3945)) mapDefault!14430)))))

(declare-fun mapIsEmpty!14430 () Bool)

(assert (=> mapIsEmpty!14430 mapRes!14430))

(declare-fun b!367662 () Bool)

(declare-fun res!205887 () Bool)

(declare-fun e!224971 () Bool)

(assert (=> b!367662 (=> (not res!205887) (not e!224971))))

(declare-fun lt!169413 () array!21113)

(declare-datatypes ((List!5571 0))(
  ( (Nil!5568) (Cons!5567 (h!6423 (_ BitVec 64)) (t!10721 List!5571)) )
))
(declare-fun arrayNoDuplicates!0 (array!21113 (_ BitVec 32) List!5571) Bool)

(assert (=> b!367662 (= res!205887 (arrayNoDuplicates!0 lt!169413 #b00000000000000000000000000000000 Nil!5568))))

(declare-fun b!367663 () Bool)

(declare-fun res!205882 () Bool)

(assert (=> b!367663 (=> (not res!205882) (not e!224975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21113 (_ BitVec 32)) Bool)

(assert (=> b!367663 (= res!205882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367664 () Bool)

(assert (=> b!367664 (= e!224975 e!224971)))

(declare-fun res!205885 () Bool)

(assert (=> b!367664 (=> (not res!205885) (not e!224971))))

(assert (=> b!367664 (= res!205885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169413 mask!970))))

(assert (=> b!367664 (= lt!169413 (array!21114 (store (arr!10025 _keys!658) i!548 k0!778) (size!10377 _keys!658)))))

(declare-fun b!367665 () Bool)

(declare-fun res!205881 () Bool)

(assert (=> b!367665 (=> (not res!205881) (not e!224975))))

(assert (=> b!367665 (= res!205881 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5568))))

(declare-fun b!367666 () Bool)

(declare-fun res!205883 () Bool)

(assert (=> b!367666 (=> (not res!205883) (not e!224975))))

(assert (=> b!367666 (= res!205883 (or (= (select (arr!10025 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10025 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367667 () Bool)

(assert (=> b!367667 (= e!224971 (bvsgt #b00000000000000000000000000000000 (size!10377 _keys!658)))))

(assert (= (and start!36802 res!205888) b!367657))

(assert (= (and b!367657 res!205886) b!367663))

(assert (= (and b!367663 res!205882) b!367665))

(assert (= (and b!367665 res!205881) b!367655))

(assert (= (and b!367655 res!205884) b!367656))

(assert (= (and b!367656 res!205880) b!367666))

(assert (= (and b!367666 res!205883) b!367658))

(assert (= (and b!367658 res!205889) b!367664))

(assert (= (and b!367664 res!205885) b!367662))

(assert (= (and b!367662 res!205887) b!367667))

(assert (= (and b!367661 condMapEmpty!14430) mapIsEmpty!14430))

(assert (= (and b!367661 (not condMapEmpty!14430)) mapNonEmpty!14430))

(get-info :version)

(assert (= (and mapNonEmpty!14430 ((_ is ValueCellFull!3945) mapValue!14430)) b!367660))

(assert (= (and b!367661 ((_ is ValueCellFull!3945) mapDefault!14430)) b!367659))

(assert (= start!36802 b!367661))

(declare-fun m!364563 () Bool)

(assert (=> b!367665 m!364563))

(declare-fun m!364565 () Bool)

(assert (=> start!36802 m!364565))

(declare-fun m!364567 () Bool)

(assert (=> start!36802 m!364567))

(declare-fun m!364569 () Bool)

(assert (=> start!36802 m!364569))

(declare-fun m!364571 () Bool)

(assert (=> b!367658 m!364571))

(declare-fun m!364573 () Bool)

(assert (=> b!367662 m!364573))

(declare-fun m!364575 () Bool)

(assert (=> mapNonEmpty!14430 m!364575))

(declare-fun m!364577 () Bool)

(assert (=> b!367664 m!364577))

(declare-fun m!364579 () Bool)

(assert (=> b!367664 m!364579))

(declare-fun m!364581 () Bool)

(assert (=> b!367663 m!364581))

(declare-fun m!364583 () Bool)

(assert (=> b!367666 m!364583))

(declare-fun m!364585 () Bool)

(assert (=> b!367656 m!364585))

(check-sat tp_is_empty!8577 (not b!367663) (not b!367662) (not b!367665) (not b!367664) (not start!36802) (not b!367656) (not mapNonEmpty!14430) (not b!367658))
(check-sat)