; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37722 () Bool)

(assert start!37722)

(declare-fun b_free!8839 () Bool)

(declare-fun b_next!8839 () Bool)

(assert (=> start!37722 (= b_free!8839 (not b_next!8839))))

(declare-fun tp!31269 () Bool)

(declare-fun b_and!16055 () Bool)

(assert (=> start!37722 (= tp!31269 b_and!16055)))

(declare-fun b!386794 () Bool)

(declare-fun res!220958 () Bool)

(declare-fun e!234544 () Bool)

(assert (=> b!386794 (=> (not res!220958) (not e!234544))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22905 0))(
  ( (array!22906 (arr!10921 (Array (_ BitVec 32) (_ BitVec 64))) (size!11274 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22905)

(assert (=> b!386794 (= res!220958 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11274 _keys!658))))))

(declare-fun b!386796 () Bool)

(declare-fun res!220965 () Bool)

(assert (=> b!386796 (=> (not res!220965) (not e!234544))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386796 (= res!220965 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386797 () Bool)

(declare-fun res!220960 () Bool)

(assert (=> b!386797 (=> (not res!220960) (not e!234544))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22905 (_ BitVec 32)) Bool)

(assert (=> b!386797 (= res!220960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386798 () Bool)

(declare-fun e!234547 () Bool)

(assert (=> b!386798 (= e!234547 false)))

(declare-datatypes ((V!13787 0))(
  ( (V!13788 (val!4800 Int)) )
))
(declare-datatypes ((ValueCell!4412 0))(
  ( (ValueCellFull!4412 (v!6991 V!13787)) (EmptyCell!4412) )
))
(declare-datatypes ((array!22907 0))(
  ( (array!22908 (arr!10922 (Array (_ BitVec 32) ValueCell!4412)) (size!11275 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22907)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!181719 () array!22905)

(declare-fun zeroValue!472 () V!13787)

(declare-datatypes ((tuple2!6436 0))(
  ( (tuple2!6437 (_1!3229 (_ BitVec 64)) (_2!3229 V!13787)) )
))
(declare-datatypes ((List!6271 0))(
  ( (Nil!6268) (Cons!6267 (h!7123 tuple2!6436) (t!11412 List!6271)) )
))
(declare-datatypes ((ListLongMap!5339 0))(
  ( (ListLongMap!5340 (toList!2685 List!6271)) )
))
(declare-fun lt!181717 () ListLongMap!5339)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13787)

(declare-fun minValue!472 () V!13787)

(declare-fun getCurrentListMapNoExtraKeys!925 (array!22905 array!22907 (_ BitVec 32) (_ BitVec 32) V!13787 V!13787 (_ BitVec 32) Int) ListLongMap!5339)

(assert (=> b!386798 (= lt!181717 (getCurrentListMapNoExtraKeys!925 lt!181719 (array!22908 (store (arr!10922 _values!506) i!548 (ValueCellFull!4412 v!373)) (size!11275 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181718 () ListLongMap!5339)

(assert (=> b!386798 (= lt!181718 (getCurrentListMapNoExtraKeys!925 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386799 () Bool)

(declare-fun e!234548 () Bool)

(declare-fun tp_is_empty!9511 () Bool)

(assert (=> b!386799 (= e!234548 tp_is_empty!9511)))

(declare-fun b!386800 () Bool)

(declare-fun res!220963 () Bool)

(assert (=> b!386800 (=> (not res!220963) (not e!234544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386800 (= res!220963 (validKeyInArray!0 k0!778))))

(declare-fun b!386801 () Bool)

(declare-fun e!234543 () Bool)

(assert (=> b!386801 (= e!234543 tp_is_empty!9511)))

(declare-fun b!386795 () Bool)

(assert (=> b!386795 (= e!234544 e!234547)))

(declare-fun res!220962 () Bool)

(assert (=> b!386795 (=> (not res!220962) (not e!234547))))

(assert (=> b!386795 (= res!220962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181719 mask!970))))

(assert (=> b!386795 (= lt!181719 (array!22906 (store (arr!10921 _keys!658) i!548 k0!778) (size!11274 _keys!658)))))

(declare-fun res!220959 () Bool)

(assert (=> start!37722 (=> (not res!220959) (not e!234544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37722 (= res!220959 (validMask!0 mask!970))))

(assert (=> start!37722 e!234544))

(declare-fun e!234546 () Bool)

(declare-fun array_inv!8036 (array!22907) Bool)

(assert (=> start!37722 (and (array_inv!8036 _values!506) e!234546)))

(assert (=> start!37722 tp!31269))

(assert (=> start!37722 true))

(assert (=> start!37722 tp_is_empty!9511))

(declare-fun array_inv!8037 (array!22905) Bool)

(assert (=> start!37722 (array_inv!8037 _keys!658)))

(declare-fun b!386802 () Bool)

(declare-fun res!220967 () Bool)

(assert (=> b!386802 (=> (not res!220967) (not e!234544))))

(declare-datatypes ((List!6272 0))(
  ( (Nil!6269) (Cons!6268 (h!7124 (_ BitVec 64)) (t!11413 List!6272)) )
))
(declare-fun arrayNoDuplicates!0 (array!22905 (_ BitVec 32) List!6272) Bool)

(assert (=> b!386802 (= res!220967 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6269))))

(declare-fun b!386803 () Bool)

(declare-fun res!220966 () Bool)

(assert (=> b!386803 (=> (not res!220966) (not e!234544))))

(assert (=> b!386803 (= res!220966 (or (= (select (arr!10921 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10921 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386804 () Bool)

(declare-fun res!220961 () Bool)

(assert (=> b!386804 (=> (not res!220961) (not e!234544))))

(assert (=> b!386804 (= res!220961 (and (= (size!11275 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11274 _keys!658) (size!11275 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15831 () Bool)

(declare-fun mapRes!15831 () Bool)

(assert (=> mapIsEmpty!15831 mapRes!15831))

(declare-fun b!386805 () Bool)

(declare-fun res!220964 () Bool)

(assert (=> b!386805 (=> (not res!220964) (not e!234547))))

(assert (=> b!386805 (= res!220964 (arrayNoDuplicates!0 lt!181719 #b00000000000000000000000000000000 Nil!6269))))

(declare-fun mapNonEmpty!15831 () Bool)

(declare-fun tp!31268 () Bool)

(assert (=> mapNonEmpty!15831 (= mapRes!15831 (and tp!31268 e!234543))))

(declare-fun mapRest!15831 () (Array (_ BitVec 32) ValueCell!4412))

(declare-fun mapKey!15831 () (_ BitVec 32))

(declare-fun mapValue!15831 () ValueCell!4412)

(assert (=> mapNonEmpty!15831 (= (arr!10922 _values!506) (store mapRest!15831 mapKey!15831 mapValue!15831))))

(declare-fun b!386806 () Bool)

(assert (=> b!386806 (= e!234546 (and e!234548 mapRes!15831))))

(declare-fun condMapEmpty!15831 () Bool)

(declare-fun mapDefault!15831 () ValueCell!4412)

(assert (=> b!386806 (= condMapEmpty!15831 (= (arr!10922 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4412)) mapDefault!15831)))))

(assert (= (and start!37722 res!220959) b!386804))

(assert (= (and b!386804 res!220961) b!386797))

(assert (= (and b!386797 res!220960) b!386802))

(assert (= (and b!386802 res!220967) b!386794))

(assert (= (and b!386794 res!220958) b!386800))

(assert (= (and b!386800 res!220963) b!386803))

(assert (= (and b!386803 res!220966) b!386796))

(assert (= (and b!386796 res!220965) b!386795))

(assert (= (and b!386795 res!220962) b!386805))

(assert (= (and b!386805 res!220964) b!386798))

(assert (= (and b!386806 condMapEmpty!15831) mapIsEmpty!15831))

(assert (= (and b!386806 (not condMapEmpty!15831)) mapNonEmpty!15831))

(get-info :version)

(assert (= (and mapNonEmpty!15831 ((_ is ValueCellFull!4412) mapValue!15831)) b!386801))

(assert (= (and b!386806 ((_ is ValueCellFull!4412) mapDefault!15831)) b!386799))

(assert (= start!37722 b!386806))

(declare-fun m!382541 () Bool)

(assert (=> b!386796 m!382541))

(declare-fun m!382543 () Bool)

(assert (=> b!386795 m!382543))

(declare-fun m!382545 () Bool)

(assert (=> b!386795 m!382545))

(declare-fun m!382547 () Bool)

(assert (=> start!37722 m!382547))

(declare-fun m!382549 () Bool)

(assert (=> start!37722 m!382549))

(declare-fun m!382551 () Bool)

(assert (=> start!37722 m!382551))

(declare-fun m!382553 () Bool)

(assert (=> b!386800 m!382553))

(declare-fun m!382555 () Bool)

(assert (=> b!386802 m!382555))

(declare-fun m!382557 () Bool)

(assert (=> b!386805 m!382557))

(declare-fun m!382559 () Bool)

(assert (=> b!386803 m!382559))

(declare-fun m!382561 () Bool)

(assert (=> b!386797 m!382561))

(declare-fun m!382563 () Bool)

(assert (=> b!386798 m!382563))

(declare-fun m!382565 () Bool)

(assert (=> b!386798 m!382565))

(declare-fun m!382567 () Bool)

(assert (=> b!386798 m!382567))

(declare-fun m!382569 () Bool)

(assert (=> mapNonEmpty!15831 m!382569))

(check-sat (not b!386802) (not mapNonEmpty!15831) (not b!386805) (not b!386795) (not b_next!8839) (not b!386796) (not b!386800) tp_is_empty!9511 (not b!386797) (not b!386798) b_and!16055 (not start!37722))
(check-sat b_and!16055 (not b_next!8839))
