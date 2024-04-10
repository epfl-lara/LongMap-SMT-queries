; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37672 () Bool)

(assert start!37672)

(declare-fun b_free!8775 () Bool)

(declare-fun b_next!8775 () Bool)

(assert (=> start!37672 (= b_free!8775 (not b_next!8775))))

(declare-fun tp!31076 () Bool)

(declare-fun b_and!16017 () Bool)

(assert (=> start!37672 (= tp!31076 b_and!16017)))

(declare-fun b!385817 () Bool)

(declare-fun e!234143 () Bool)

(declare-fun tp_is_empty!9447 () Bool)

(assert (=> b!385817 (= e!234143 tp_is_empty!9447)))

(declare-fun b!385818 () Bool)

(declare-fun res!220136 () Bool)

(declare-fun e!234145 () Bool)

(assert (=> b!385818 (=> (not res!220136) (not e!234145))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13701 0))(
  ( (V!13702 (val!4768 Int)) )
))
(declare-datatypes ((ValueCell!4380 0))(
  ( (ValueCellFull!4380 (v!6965 V!13701)) (EmptyCell!4380) )
))
(declare-datatypes ((array!22793 0))(
  ( (array!22794 (arr!10865 (Array (_ BitVec 32) ValueCell!4380)) (size!11217 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22793)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((array!22795 0))(
  ( (array!22796 (arr!10866 (Array (_ BitVec 32) (_ BitVec 64))) (size!11218 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22795)

(assert (=> b!385818 (= res!220136 (and (= (size!11217 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11218 _keys!658) (size!11217 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385819 () Bool)

(declare-fun res!220133 () Bool)

(assert (=> b!385819 (=> (not res!220133) (not e!234145))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385819 (= res!220133 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11218 _keys!658))))))

(declare-fun b!385820 () Bool)

(declare-fun e!234142 () Bool)

(assert (=> b!385820 (= e!234142 (bvsge i!548 (size!11217 _values!506)))))

(declare-datatypes ((tuple2!6410 0))(
  ( (tuple2!6411 (_1!3216 (_ BitVec 64)) (_2!3216 V!13701)) )
))
(declare-datatypes ((List!6256 0))(
  ( (Nil!6253) (Cons!6252 (h!7108 tuple2!6410) (t!11406 List!6256)) )
))
(declare-datatypes ((ListLongMap!5323 0))(
  ( (ListLongMap!5324 (toList!2677 List!6256)) )
))
(declare-fun lt!181667 () ListLongMap!5323)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13701)

(declare-fun minValue!472 () V!13701)

(declare-fun getCurrentListMapNoExtraKeys!906 (array!22795 array!22793 (_ BitVec 32) (_ BitVec 32) V!13701 V!13701 (_ BitVec 32) Int) ListLongMap!5323)

(assert (=> b!385820 (= lt!181667 (getCurrentListMapNoExtraKeys!906 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!220127 () Bool)

(assert (=> start!37672 (=> (not res!220127) (not e!234145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37672 (= res!220127 (validMask!0 mask!970))))

(assert (=> start!37672 e!234145))

(assert (=> start!37672 true))

(declare-fun e!234141 () Bool)

(declare-fun array_inv!7998 (array!22793) Bool)

(assert (=> start!37672 (and (array_inv!7998 _values!506) e!234141)))

(assert (=> start!37672 tp!31076))

(assert (=> start!37672 tp_is_empty!9447))

(declare-fun array_inv!7999 (array!22795) Bool)

(assert (=> start!37672 (array_inv!7999 _keys!658)))

(declare-fun b!385821 () Bool)

(declare-fun res!220128 () Bool)

(assert (=> b!385821 (=> (not res!220128) (not e!234145))))

(assert (=> b!385821 (= res!220128 (or (= (select (arr!10866 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10866 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385822 () Bool)

(declare-fun res!220134 () Bool)

(assert (=> b!385822 (=> (not res!220134) (not e!234145))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385822 (= res!220134 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15735 () Bool)

(declare-fun mapRes!15735 () Bool)

(assert (=> mapIsEmpty!15735 mapRes!15735))

(declare-fun b!385823 () Bool)

(declare-fun res!220129 () Bool)

(assert (=> b!385823 (=> (not res!220129) (not e!234145))))

(declare-datatypes ((List!6257 0))(
  ( (Nil!6254) (Cons!6253 (h!7109 (_ BitVec 64)) (t!11407 List!6257)) )
))
(declare-fun arrayNoDuplicates!0 (array!22795 (_ BitVec 32) List!6257) Bool)

(assert (=> b!385823 (= res!220129 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6254))))

(declare-fun b!385824 () Bool)

(declare-fun res!220135 () Bool)

(assert (=> b!385824 (=> (not res!220135) (not e!234145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22795 (_ BitVec 32)) Bool)

(assert (=> b!385824 (= res!220135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385825 () Bool)

(declare-fun res!220132 () Bool)

(assert (=> b!385825 (=> (not res!220132) (not e!234145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385825 (= res!220132 (validKeyInArray!0 k0!778))))

(declare-fun b!385826 () Bool)

(assert (=> b!385826 (= e!234141 (and e!234143 mapRes!15735))))

(declare-fun condMapEmpty!15735 () Bool)

(declare-fun mapDefault!15735 () ValueCell!4380)

(assert (=> b!385826 (= condMapEmpty!15735 (= (arr!10865 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4380)) mapDefault!15735)))))

(declare-fun mapNonEmpty!15735 () Bool)

(declare-fun tp!31077 () Bool)

(declare-fun e!234144 () Bool)

(assert (=> mapNonEmpty!15735 (= mapRes!15735 (and tp!31077 e!234144))))

(declare-fun mapValue!15735 () ValueCell!4380)

(declare-fun mapKey!15735 () (_ BitVec 32))

(declare-fun mapRest!15735 () (Array (_ BitVec 32) ValueCell!4380))

(assert (=> mapNonEmpty!15735 (= (arr!10865 _values!506) (store mapRest!15735 mapKey!15735 mapValue!15735))))

(declare-fun b!385827 () Bool)

(declare-fun res!220131 () Bool)

(assert (=> b!385827 (=> (not res!220131) (not e!234142))))

(declare-fun lt!181668 () array!22795)

(assert (=> b!385827 (= res!220131 (arrayNoDuplicates!0 lt!181668 #b00000000000000000000000000000000 Nil!6254))))

(declare-fun b!385828 () Bool)

(assert (=> b!385828 (= e!234145 e!234142)))

(declare-fun res!220130 () Bool)

(assert (=> b!385828 (=> (not res!220130) (not e!234142))))

(assert (=> b!385828 (= res!220130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181668 mask!970))))

(assert (=> b!385828 (= lt!181668 (array!22796 (store (arr!10866 _keys!658) i!548 k0!778) (size!11218 _keys!658)))))

(declare-fun b!385829 () Bool)

(assert (=> b!385829 (= e!234144 tp_is_empty!9447)))

(assert (= (and start!37672 res!220127) b!385818))

(assert (= (and b!385818 res!220136) b!385824))

(assert (= (and b!385824 res!220135) b!385823))

(assert (= (and b!385823 res!220129) b!385819))

(assert (= (and b!385819 res!220133) b!385825))

(assert (= (and b!385825 res!220132) b!385821))

(assert (= (and b!385821 res!220128) b!385822))

(assert (= (and b!385822 res!220134) b!385828))

(assert (= (and b!385828 res!220130) b!385827))

(assert (= (and b!385827 res!220131) b!385820))

(assert (= (and b!385826 condMapEmpty!15735) mapIsEmpty!15735))

(assert (= (and b!385826 (not condMapEmpty!15735)) mapNonEmpty!15735))

(get-info :version)

(assert (= (and mapNonEmpty!15735 ((_ is ValueCellFull!4380) mapValue!15735)) b!385829))

(assert (= (and b!385826 ((_ is ValueCellFull!4380) mapDefault!15735)) b!385817))

(assert (= start!37672 b!385826))

(declare-fun m!382313 () Bool)

(assert (=> b!385820 m!382313))

(declare-fun m!382315 () Bool)

(assert (=> b!385821 m!382315))

(declare-fun m!382317 () Bool)

(assert (=> b!385825 m!382317))

(declare-fun m!382319 () Bool)

(assert (=> start!37672 m!382319))

(declare-fun m!382321 () Bool)

(assert (=> start!37672 m!382321))

(declare-fun m!382323 () Bool)

(assert (=> start!37672 m!382323))

(declare-fun m!382325 () Bool)

(assert (=> b!385827 m!382325))

(declare-fun m!382327 () Bool)

(assert (=> b!385824 m!382327))

(declare-fun m!382329 () Bool)

(assert (=> b!385822 m!382329))

(declare-fun m!382331 () Bool)

(assert (=> mapNonEmpty!15735 m!382331))

(declare-fun m!382333 () Bool)

(assert (=> b!385828 m!382333))

(declare-fun m!382335 () Bool)

(assert (=> b!385828 m!382335))

(declare-fun m!382337 () Bool)

(assert (=> b!385823 m!382337))

(check-sat (not b!385820) (not b!385823) (not b_next!8775) tp_is_empty!9447 b_and!16017 (not start!37672) (not b!385825) (not b!385827) (not b!385822) (not b!385824) (not b!385828) (not mapNonEmpty!15735))
(check-sat b_and!16017 (not b_next!8775))
