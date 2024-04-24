; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37752 () Bool)

(assert start!37752)

(declare-fun b_free!8869 () Bool)

(declare-fun b_next!8869 () Bool)

(assert (=> start!37752 (= b_free!8869 (not b_next!8869))))

(declare-fun tp!31359 () Bool)

(declare-fun b_and!16125 () Bool)

(assert (=> start!37752 (= tp!31359 b_and!16125)))

(declare-fun b!387601 () Bool)

(declare-fun res!221537 () Bool)

(declare-fun e!234957 () Bool)

(assert (=> b!387601 (=> (not res!221537) (not e!234957))))

(declare-datatypes ((array!22962 0))(
  ( (array!22963 (arr!10949 (Array (_ BitVec 32) (_ BitVec 64))) (size!11301 (_ BitVec 32))) )
))
(declare-fun lt!182106 () array!22962)

(declare-datatypes ((List!6185 0))(
  ( (Nil!6182) (Cons!6181 (h!7037 (_ BitVec 64)) (t!11327 List!6185)) )
))
(declare-fun arrayNoDuplicates!0 (array!22962 (_ BitVec 32) List!6185) Bool)

(assert (=> b!387601 (= res!221537 (arrayNoDuplicates!0 lt!182106 #b00000000000000000000000000000000 Nil!6182))))

(declare-fun mapIsEmpty!15876 () Bool)

(declare-fun mapRes!15876 () Bool)

(assert (=> mapIsEmpty!15876 mapRes!15876))

(declare-fun b!387602 () Bool)

(declare-fun res!221539 () Bool)

(declare-fun e!234959 () Bool)

(assert (=> b!387602 (=> (not res!221539) (not e!234959))))

(declare-fun _keys!658 () array!22962)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387602 (= res!221539 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387603 () Bool)

(declare-fun res!221541 () Bool)

(assert (=> b!387603 (=> (not res!221541) (not e!234959))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387603 (= res!221541 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11301 _keys!658))))))

(declare-fun b!387604 () Bool)

(declare-fun e!234960 () Bool)

(declare-fun e!234955 () Bool)

(assert (=> b!387604 (= e!234960 (and e!234955 mapRes!15876))))

(declare-fun condMapEmpty!15876 () Bool)

(declare-datatypes ((V!13827 0))(
  ( (V!13828 (val!4815 Int)) )
))
(declare-datatypes ((ValueCell!4427 0))(
  ( (ValueCellFull!4427 (v!7013 V!13827)) (EmptyCell!4427) )
))
(declare-datatypes ((array!22964 0))(
  ( (array!22965 (arr!10950 (Array (_ BitVec 32) ValueCell!4427)) (size!11302 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22964)

(declare-fun mapDefault!15876 () ValueCell!4427)

(assert (=> b!387604 (= condMapEmpty!15876 (= (arr!10950 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4427)) mapDefault!15876)))))

(declare-fun b!387605 () Bool)

(declare-fun res!221535 () Bool)

(assert (=> b!387605 (=> (not res!221535) (not e!234959))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22962 (_ BitVec 32)) Bool)

(assert (=> b!387605 (= res!221535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387606 () Bool)

(declare-fun res!221534 () Bool)

(assert (=> b!387606 (=> (not res!221534) (not e!234959))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!387606 (= res!221534 (and (= (size!11302 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11301 _keys!658) (size!11302 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387607 () Bool)

(assert (=> b!387607 (= e!234957 false)))

(declare-fun zeroValue!472 () V!13827)

(declare-fun v!373 () V!13827)

(declare-datatypes ((tuple2!6334 0))(
  ( (tuple2!6335 (_1!3178 (_ BitVec 64)) (_2!3178 V!13827)) )
))
(declare-datatypes ((List!6186 0))(
  ( (Nil!6183) (Cons!6182 (h!7038 tuple2!6334) (t!11328 List!6186)) )
))
(declare-datatypes ((ListLongMap!5249 0))(
  ( (ListLongMap!5250 (toList!2640 List!6186)) )
))
(declare-fun lt!182105 () ListLongMap!5249)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13827)

(declare-fun getCurrentListMapNoExtraKeys!915 (array!22962 array!22964 (_ BitVec 32) (_ BitVec 32) V!13827 V!13827 (_ BitVec 32) Int) ListLongMap!5249)

(assert (=> b!387607 (= lt!182105 (getCurrentListMapNoExtraKeys!915 lt!182106 (array!22965 (store (arr!10950 _values!506) i!548 (ValueCellFull!4427 v!373)) (size!11302 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182107 () ListLongMap!5249)

(assert (=> b!387607 (= lt!182107 (getCurrentListMapNoExtraKeys!915 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15876 () Bool)

(declare-fun tp!31358 () Bool)

(declare-fun e!234958 () Bool)

(assert (=> mapNonEmpty!15876 (= mapRes!15876 (and tp!31358 e!234958))))

(declare-fun mapRest!15876 () (Array (_ BitVec 32) ValueCell!4427))

(declare-fun mapValue!15876 () ValueCell!4427)

(declare-fun mapKey!15876 () (_ BitVec 32))

(assert (=> mapNonEmpty!15876 (= (arr!10950 _values!506) (store mapRest!15876 mapKey!15876 mapValue!15876))))

(declare-fun b!387608 () Bool)

(declare-fun tp_is_empty!9541 () Bool)

(assert (=> b!387608 (= e!234958 tp_is_empty!9541)))

(declare-fun b!387609 () Bool)

(assert (=> b!387609 (= e!234959 e!234957)))

(declare-fun res!221536 () Bool)

(assert (=> b!387609 (=> (not res!221536) (not e!234957))))

(assert (=> b!387609 (= res!221536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182106 mask!970))))

(assert (=> b!387609 (= lt!182106 (array!22963 (store (arr!10949 _keys!658) i!548 k0!778) (size!11301 _keys!658)))))

(declare-fun b!387610 () Bool)

(declare-fun res!221542 () Bool)

(assert (=> b!387610 (=> (not res!221542) (not e!234959))))

(assert (=> b!387610 (= res!221542 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6182))))

(declare-fun res!221540 () Bool)

(assert (=> start!37752 (=> (not res!221540) (not e!234959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37752 (= res!221540 (validMask!0 mask!970))))

(assert (=> start!37752 e!234959))

(declare-fun array_inv!8090 (array!22964) Bool)

(assert (=> start!37752 (and (array_inv!8090 _values!506) e!234960)))

(assert (=> start!37752 tp!31359))

(assert (=> start!37752 true))

(assert (=> start!37752 tp_is_empty!9541))

(declare-fun array_inv!8091 (array!22962) Bool)

(assert (=> start!37752 (array_inv!8091 _keys!658)))

(declare-fun b!387611 () Bool)

(declare-fun res!221543 () Bool)

(assert (=> b!387611 (=> (not res!221543) (not e!234959))))

(assert (=> b!387611 (= res!221543 (or (= (select (arr!10949 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10949 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387612 () Bool)

(declare-fun res!221538 () Bool)

(assert (=> b!387612 (=> (not res!221538) (not e!234959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387612 (= res!221538 (validKeyInArray!0 k0!778))))

(declare-fun b!387613 () Bool)

(assert (=> b!387613 (= e!234955 tp_is_empty!9541)))

(assert (= (and start!37752 res!221540) b!387606))

(assert (= (and b!387606 res!221534) b!387605))

(assert (= (and b!387605 res!221535) b!387610))

(assert (= (and b!387610 res!221542) b!387603))

(assert (= (and b!387603 res!221541) b!387612))

(assert (= (and b!387612 res!221538) b!387611))

(assert (= (and b!387611 res!221543) b!387602))

(assert (= (and b!387602 res!221539) b!387609))

(assert (= (and b!387609 res!221536) b!387601))

(assert (= (and b!387601 res!221537) b!387607))

(assert (= (and b!387604 condMapEmpty!15876) mapIsEmpty!15876))

(assert (= (and b!387604 (not condMapEmpty!15876)) mapNonEmpty!15876))

(get-info :version)

(assert (= (and mapNonEmpty!15876 ((_ is ValueCellFull!4427) mapValue!15876)) b!387608))

(assert (= (and b!387604 ((_ is ValueCellFull!4427) mapDefault!15876)) b!387613))

(assert (= start!37752 b!387604))

(declare-fun m!383945 () Bool)

(assert (=> mapNonEmpty!15876 m!383945))

(declare-fun m!383947 () Bool)

(assert (=> b!387602 m!383947))

(declare-fun m!383949 () Bool)

(assert (=> start!37752 m!383949))

(declare-fun m!383951 () Bool)

(assert (=> start!37752 m!383951))

(declare-fun m!383953 () Bool)

(assert (=> start!37752 m!383953))

(declare-fun m!383955 () Bool)

(assert (=> b!387609 m!383955))

(declare-fun m!383957 () Bool)

(assert (=> b!387609 m!383957))

(declare-fun m!383959 () Bool)

(assert (=> b!387610 m!383959))

(declare-fun m!383961 () Bool)

(assert (=> b!387612 m!383961))

(declare-fun m!383963 () Bool)

(assert (=> b!387611 m!383963))

(declare-fun m!383965 () Bool)

(assert (=> b!387601 m!383965))

(declare-fun m!383967 () Bool)

(assert (=> b!387607 m!383967))

(declare-fun m!383969 () Bool)

(assert (=> b!387607 m!383969))

(declare-fun m!383971 () Bool)

(assert (=> b!387607 m!383971))

(declare-fun m!383973 () Bool)

(assert (=> b!387605 m!383973))

(check-sat tp_is_empty!9541 (not mapNonEmpty!15876) (not b_next!8869) (not b!387610) (not b!387601) (not b!387612) (not b!387605) (not b!387607) b_and!16125 (not start!37752) (not b!387609) (not b!387602))
(check-sat b_and!16125 (not b_next!8869))
