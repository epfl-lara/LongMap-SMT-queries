; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36930 () Bool)

(assert start!36930)

(declare-fun b_free!8071 () Bool)

(declare-fun b_next!8071 () Bool)

(assert (=> start!36930 (= b_free!8071 (not b_next!8071))))

(declare-fun tp!28928 () Bool)

(declare-fun b_and!15327 () Bool)

(assert (=> start!36930 (= tp!28928 b_and!15327)))

(declare-fun b!370375 () Bool)

(declare-fun res!208008 () Bool)

(declare-fun e!226219 () Bool)

(assert (=> b!370375 (=> (not res!208008) (not e!226219))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21366 0))(
  ( (array!21367 (arr!10151 (Array (_ BitVec 32) (_ BitVec 64))) (size!10503 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21366)

(assert (=> b!370375 (= res!208008 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10503 _keys!658))))))

(declare-fun b!370376 () Bool)

(declare-fun e!226216 () Bool)

(assert (=> b!370376 (= e!226216 false)))

(declare-datatypes ((V!12731 0))(
  ( (V!12732 (val!4404 Int)) )
))
(declare-datatypes ((ValueCell!4016 0))(
  ( (ValueCellFull!4016 (v!6602 V!12731)) (EmptyCell!4016) )
))
(declare-datatypes ((array!21368 0))(
  ( (array!21369 (arr!10152 (Array (_ BitVec 32) ValueCell!4016)) (size!10504 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21368)

(declare-fun lt!169984 () array!21366)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12731)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12731)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((tuple2!5746 0))(
  ( (tuple2!5747 (_1!2884 (_ BitVec 64)) (_2!2884 V!12731)) )
))
(declare-datatypes ((List!5577 0))(
  ( (Nil!5574) (Cons!5573 (h!6429 tuple2!5746) (t!10719 List!5577)) )
))
(declare-datatypes ((ListLongMap!4661 0))(
  ( (ListLongMap!4662 (toList!2346 List!5577)) )
))
(declare-fun lt!169982 () ListLongMap!4661)

(declare-fun minValue!472 () V!12731)

(declare-fun getCurrentListMapNoExtraKeys!655 (array!21366 array!21368 (_ BitVec 32) (_ BitVec 32) V!12731 V!12731 (_ BitVec 32) Int) ListLongMap!4661)

(assert (=> b!370376 (= lt!169982 (getCurrentListMapNoExtraKeys!655 lt!169984 (array!21369 (store (arr!10152 _values!506) i!548 (ValueCellFull!4016 v!373)) (size!10504 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169983 () ListLongMap!4661)

(assert (=> b!370376 (= lt!169983 (getCurrentListMapNoExtraKeys!655 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370377 () Bool)

(declare-fun res!208013 () Bool)

(assert (=> b!370377 (=> (not res!208013) (not e!226219))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370377 (= res!208013 (validKeyInArray!0 k0!778))))

(declare-fun b!370378 () Bool)

(declare-fun res!208010 () Bool)

(assert (=> b!370378 (=> (not res!208010) (not e!226216))))

(declare-datatypes ((List!5578 0))(
  ( (Nil!5575) (Cons!5574 (h!6430 (_ BitVec 64)) (t!10720 List!5578)) )
))
(declare-fun arrayNoDuplicates!0 (array!21366 (_ BitVec 32) List!5578) Bool)

(assert (=> b!370378 (= res!208010 (arrayNoDuplicates!0 lt!169984 #b00000000000000000000000000000000 Nil!5575))))

(declare-fun b!370379 () Bool)

(declare-fun e!226221 () Bool)

(declare-fun tp_is_empty!8719 () Bool)

(assert (=> b!370379 (= e!226221 tp_is_empty!8719)))

(declare-fun b!370380 () Bool)

(declare-fun res!208007 () Bool)

(assert (=> b!370380 (=> (not res!208007) (not e!226219))))

(assert (=> b!370380 (= res!208007 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5575))))

(declare-fun b!370381 () Bool)

(declare-fun res!208014 () Bool)

(assert (=> b!370381 (=> (not res!208014) (not e!226219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21366 (_ BitVec 32)) Bool)

(assert (=> b!370381 (= res!208014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370382 () Bool)

(declare-fun res!208015 () Bool)

(assert (=> b!370382 (=> (not res!208015) (not e!226219))))

(assert (=> b!370382 (= res!208015 (or (= (select (arr!10151 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10151 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14643 () Bool)

(declare-fun mapRes!14643 () Bool)

(assert (=> mapIsEmpty!14643 mapRes!14643))

(declare-fun mapNonEmpty!14643 () Bool)

(declare-fun tp!28929 () Bool)

(assert (=> mapNonEmpty!14643 (= mapRes!14643 (and tp!28929 e!226221))))

(declare-fun mapValue!14643 () ValueCell!4016)

(declare-fun mapKey!14643 () (_ BitVec 32))

(declare-fun mapRest!14643 () (Array (_ BitVec 32) ValueCell!4016))

(assert (=> mapNonEmpty!14643 (= (arr!10152 _values!506) (store mapRest!14643 mapKey!14643 mapValue!14643))))

(declare-fun res!208011 () Bool)

(assert (=> start!36930 (=> (not res!208011) (not e!226219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36930 (= res!208011 (validMask!0 mask!970))))

(assert (=> start!36930 e!226219))

(declare-fun e!226218 () Bool)

(declare-fun array_inv!7532 (array!21368) Bool)

(assert (=> start!36930 (and (array_inv!7532 _values!506) e!226218)))

(assert (=> start!36930 tp!28928))

(assert (=> start!36930 true))

(assert (=> start!36930 tp_is_empty!8719))

(declare-fun array_inv!7533 (array!21366) Bool)

(assert (=> start!36930 (array_inv!7533 _keys!658)))

(declare-fun b!370383 () Bool)

(assert (=> b!370383 (= e!226219 e!226216)))

(declare-fun res!208016 () Bool)

(assert (=> b!370383 (=> (not res!208016) (not e!226216))))

(assert (=> b!370383 (= res!208016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169984 mask!970))))

(assert (=> b!370383 (= lt!169984 (array!21367 (store (arr!10151 _keys!658) i!548 k0!778) (size!10503 _keys!658)))))

(declare-fun b!370384 () Bool)

(declare-fun e!226217 () Bool)

(assert (=> b!370384 (= e!226218 (and e!226217 mapRes!14643))))

(declare-fun condMapEmpty!14643 () Bool)

(declare-fun mapDefault!14643 () ValueCell!4016)

(assert (=> b!370384 (= condMapEmpty!14643 (= (arr!10152 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4016)) mapDefault!14643)))))

(declare-fun b!370385 () Bool)

(declare-fun res!208009 () Bool)

(assert (=> b!370385 (=> (not res!208009) (not e!226219))))

(declare-fun arrayContainsKey!0 (array!21366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370385 (= res!208009 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370386 () Bool)

(declare-fun res!208012 () Bool)

(assert (=> b!370386 (=> (not res!208012) (not e!226219))))

(assert (=> b!370386 (= res!208012 (and (= (size!10504 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10503 _keys!658) (size!10504 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370387 () Bool)

(assert (=> b!370387 (= e!226217 tp_is_empty!8719)))

(assert (= (and start!36930 res!208011) b!370386))

(assert (= (and b!370386 res!208012) b!370381))

(assert (= (and b!370381 res!208014) b!370380))

(assert (= (and b!370380 res!208007) b!370375))

(assert (= (and b!370375 res!208008) b!370377))

(assert (= (and b!370377 res!208013) b!370382))

(assert (= (and b!370382 res!208015) b!370385))

(assert (= (and b!370385 res!208009) b!370383))

(assert (= (and b!370383 res!208016) b!370378))

(assert (= (and b!370378 res!208010) b!370376))

(assert (= (and b!370384 condMapEmpty!14643) mapIsEmpty!14643))

(assert (= (and b!370384 (not condMapEmpty!14643)) mapNonEmpty!14643))

(get-info :version)

(assert (= (and mapNonEmpty!14643 ((_ is ValueCellFull!4016) mapValue!14643)) b!370379))

(assert (= (and b!370384 ((_ is ValueCellFull!4016) mapDefault!14643)) b!370387))

(assert (= start!36930 b!370384))

(declare-fun m!366803 () Bool)

(assert (=> b!370380 m!366803))

(declare-fun m!366805 () Bool)

(assert (=> b!370377 m!366805))

(declare-fun m!366807 () Bool)

(assert (=> mapNonEmpty!14643 m!366807))

(declare-fun m!366809 () Bool)

(assert (=> start!36930 m!366809))

(declare-fun m!366811 () Bool)

(assert (=> start!36930 m!366811))

(declare-fun m!366813 () Bool)

(assert (=> start!36930 m!366813))

(declare-fun m!366815 () Bool)

(assert (=> b!370385 m!366815))

(declare-fun m!366817 () Bool)

(assert (=> b!370382 m!366817))

(declare-fun m!366819 () Bool)

(assert (=> b!370378 m!366819))

(declare-fun m!366821 () Bool)

(assert (=> b!370381 m!366821))

(declare-fun m!366823 () Bool)

(assert (=> b!370383 m!366823))

(declare-fun m!366825 () Bool)

(assert (=> b!370383 m!366825))

(declare-fun m!366827 () Bool)

(assert (=> b!370376 m!366827))

(declare-fun m!366829 () Bool)

(assert (=> b!370376 m!366829))

(declare-fun m!366831 () Bool)

(assert (=> b!370376 m!366831))

(check-sat (not b!370385) (not b!370377) (not b_next!8071) (not start!36930) (not b!370378) (not b!370376) tp_is_empty!8719 (not b!370383) (not b!370381) (not b!370380) (not mapNonEmpty!14643) b_and!15327)
(check-sat b_and!15327 (not b_next!8071))
