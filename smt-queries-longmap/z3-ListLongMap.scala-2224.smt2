; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36808 () Bool)

(assert start!36808)

(declare-fun b_free!7935 () Bool)

(declare-fun b_next!7935 () Bool)

(assert (=> start!36808 (= b_free!7935 (not b_next!7935))))

(declare-fun tp!28521 () Bool)

(declare-fun b_and!15177 () Bool)

(assert (=> start!36808 (= tp!28521 b_and!15177)))

(declare-fun b!367772 () Bool)

(declare-fun res!205975 () Bool)

(declare-fun e!225025 () Bool)

(assert (=> b!367772 (=> (not res!205975) (not e!225025))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367772 (= res!205975 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14439 () Bool)

(declare-fun mapRes!14439 () Bool)

(declare-fun tp!28520 () Bool)

(declare-fun e!225029 () Bool)

(assert (=> mapNonEmpty!14439 (= mapRes!14439 (and tp!28520 e!225029))))

(declare-fun mapKey!14439 () (_ BitVec 32))

(declare-datatypes ((V!12549 0))(
  ( (V!12550 (val!4336 Int)) )
))
(declare-datatypes ((ValueCell!3948 0))(
  ( (ValueCellFull!3948 (v!6533 V!12549)) (EmptyCell!3948) )
))
(declare-fun mapRest!14439 () (Array (_ BitVec 32) ValueCell!3948))

(declare-fun mapValue!14439 () ValueCell!3948)

(declare-datatypes ((array!21125 0))(
  ( (array!21126 (arr!10031 (Array (_ BitVec 32) ValueCell!3948)) (size!10383 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21125)

(assert (=> mapNonEmpty!14439 (= (arr!10031 _values!506) (store mapRest!14439 mapKey!14439 mapValue!14439))))

(declare-fun b!367773 () Bool)

(declare-fun e!225024 () Bool)

(declare-fun tp_is_empty!8583 () Bool)

(assert (=> b!367773 (= e!225024 tp_is_empty!8583)))

(declare-fun b!367774 () Bool)

(declare-fun e!225028 () Bool)

(assert (=> b!367774 (= e!225025 e!225028)))

(declare-fun res!205978 () Bool)

(assert (=> b!367774 (=> (not res!205978) (not e!225028))))

(declare-datatypes ((array!21127 0))(
  ( (array!21128 (arr!10032 (Array (_ BitVec 32) (_ BitVec 64))) (size!10384 (_ BitVec 32))) )
))
(declare-fun lt!169428 () array!21127)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21127 (_ BitVec 32)) Bool)

(assert (=> b!367774 (= res!205978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169428 mask!970))))

(declare-fun _keys!658 () array!21127)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367774 (= lt!169428 (array!21128 (store (arr!10032 _keys!658) i!548 k0!778) (size!10384 _keys!658)))))

(declare-fun b!367775 () Bool)

(declare-fun res!205973 () Bool)

(assert (=> b!367775 (=> (not res!205973) (not e!225025))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367775 (= res!205973 (and (= (size!10383 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10384 _keys!658) (size!10383 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367776 () Bool)

(declare-fun res!205970 () Bool)

(assert (=> b!367776 (=> (not res!205970) (not e!225025))))

(assert (=> b!367776 (= res!205970 (or (= (select (arr!10032 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10032 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367777 () Bool)

(declare-fun res!205976 () Bool)

(assert (=> b!367777 (=> (not res!205976) (not e!225025))))

(declare-fun arrayContainsKey!0 (array!21127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367777 (= res!205976 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367778 () Bool)

(assert (=> b!367778 (= e!225028 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5740 0))(
  ( (tuple2!5741 (_1!2881 (_ BitVec 64)) (_2!2881 V!12549)) )
))
(declare-datatypes ((List!5572 0))(
  ( (Nil!5569) (Cons!5568 (h!6424 tuple2!5740) (t!10722 List!5572)) )
))
(declare-datatypes ((ListLongMap!4653 0))(
  ( (ListLongMap!4654 (toList!2342 List!5572)) )
))
(declare-fun lt!169427 () ListLongMap!4653)

(declare-fun zeroValue!472 () V!12549)

(declare-fun minValue!472 () V!12549)

(declare-fun getCurrentListMapNoExtraKeys!619 (array!21127 array!21125 (_ BitVec 32) (_ BitVec 32) V!12549 V!12549 (_ BitVec 32) Int) ListLongMap!4653)

(assert (=> b!367778 (= lt!169427 (getCurrentListMapNoExtraKeys!619 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367779 () Bool)

(declare-fun res!205974 () Bool)

(assert (=> b!367779 (=> (not res!205974) (not e!225025))))

(assert (=> b!367779 (= res!205974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367780 () Bool)

(declare-fun e!225026 () Bool)

(assert (=> b!367780 (= e!225026 (and e!225024 mapRes!14439))))

(declare-fun condMapEmpty!14439 () Bool)

(declare-fun mapDefault!14439 () ValueCell!3948)

(assert (=> b!367780 (= condMapEmpty!14439 (= (arr!10031 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3948)) mapDefault!14439)))))

(declare-fun mapIsEmpty!14439 () Bool)

(assert (=> mapIsEmpty!14439 mapRes!14439))

(declare-fun res!205972 () Bool)

(assert (=> start!36808 (=> (not res!205972) (not e!225025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36808 (= res!205972 (validMask!0 mask!970))))

(assert (=> start!36808 e!225025))

(assert (=> start!36808 true))

(declare-fun array_inv!7420 (array!21125) Bool)

(assert (=> start!36808 (and (array_inv!7420 _values!506) e!225026)))

(assert (=> start!36808 tp!28521))

(assert (=> start!36808 tp_is_empty!8583))

(declare-fun array_inv!7421 (array!21127) Bool)

(assert (=> start!36808 (array_inv!7421 _keys!658)))

(declare-fun b!367781 () Bool)

(declare-fun res!205977 () Bool)

(assert (=> b!367781 (=> (not res!205977) (not e!225025))))

(assert (=> b!367781 (= res!205977 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10384 _keys!658))))))

(declare-fun b!367782 () Bool)

(declare-fun res!205971 () Bool)

(assert (=> b!367782 (=> (not res!205971) (not e!225025))))

(declare-datatypes ((List!5573 0))(
  ( (Nil!5570) (Cons!5569 (h!6425 (_ BitVec 64)) (t!10723 List!5573)) )
))
(declare-fun arrayNoDuplicates!0 (array!21127 (_ BitVec 32) List!5573) Bool)

(assert (=> b!367782 (= res!205971 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5570))))

(declare-fun b!367783 () Bool)

(assert (=> b!367783 (= e!225029 tp_is_empty!8583)))

(declare-fun b!367784 () Bool)

(declare-fun res!205979 () Bool)

(assert (=> b!367784 (=> (not res!205979) (not e!225028))))

(assert (=> b!367784 (= res!205979 (arrayNoDuplicates!0 lt!169428 #b00000000000000000000000000000000 Nil!5570))))

(assert (= (and start!36808 res!205972) b!367775))

(assert (= (and b!367775 res!205973) b!367779))

(assert (= (and b!367779 res!205974) b!367782))

(assert (= (and b!367782 res!205971) b!367781))

(assert (= (and b!367781 res!205977) b!367772))

(assert (= (and b!367772 res!205975) b!367776))

(assert (= (and b!367776 res!205970) b!367777))

(assert (= (and b!367777 res!205976) b!367774))

(assert (= (and b!367774 res!205978) b!367784))

(assert (= (and b!367784 res!205979) b!367778))

(assert (= (and b!367780 condMapEmpty!14439) mapIsEmpty!14439))

(assert (= (and b!367780 (not condMapEmpty!14439)) mapNonEmpty!14439))

(get-info :version)

(assert (= (and mapNonEmpty!14439 ((_ is ValueCellFull!3948) mapValue!14439)) b!367783))

(assert (= (and b!367780 ((_ is ValueCellFull!3948) mapDefault!14439)) b!367773))

(assert (= start!36808 b!367780))

(declare-fun m!364637 () Bool)

(assert (=> b!367778 m!364637))

(declare-fun m!364639 () Bool)

(assert (=> start!36808 m!364639))

(declare-fun m!364641 () Bool)

(assert (=> start!36808 m!364641))

(declare-fun m!364643 () Bool)

(assert (=> start!36808 m!364643))

(declare-fun m!364645 () Bool)

(assert (=> b!367772 m!364645))

(declare-fun m!364647 () Bool)

(assert (=> b!367779 m!364647))

(declare-fun m!364649 () Bool)

(assert (=> b!367782 m!364649))

(declare-fun m!364651 () Bool)

(assert (=> b!367777 m!364651))

(declare-fun m!364653 () Bool)

(assert (=> mapNonEmpty!14439 m!364653))

(declare-fun m!364655 () Bool)

(assert (=> b!367774 m!364655))

(declare-fun m!364657 () Bool)

(assert (=> b!367774 m!364657))

(declare-fun m!364659 () Bool)

(assert (=> b!367784 m!364659))

(declare-fun m!364661 () Bool)

(assert (=> b!367776 m!364661))

(check-sat (not b!367774) tp_is_empty!8583 (not mapNonEmpty!14439) (not b!367777) (not b!367784) (not b!367782) (not b_next!7935) (not b!367772) b_and!15177 (not start!36808) (not b!367779) (not b!367778))
(check-sat b_and!15177 (not b_next!7935))
