; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36958 () Bool)

(assert start!36958)

(declare-fun b_free!8085 () Bool)

(declare-fun b_next!8085 () Bool)

(assert (=> start!36958 (= b_free!8085 (not b_next!8085))))

(declare-fun tp!28970 () Bool)

(declare-fun b_and!15327 () Bool)

(assert (=> start!36958 (= tp!28970 b_and!15327)))

(declare-fun b!370697 () Bool)

(declare-fun res!208223 () Bool)

(declare-fun e!226377 () Bool)

(assert (=> b!370697 (=> (not res!208223) (not e!226377))))

(declare-datatypes ((array!21409 0))(
  ( (array!21410 (arr!10173 (Array (_ BitVec 32) (_ BitVec 64))) (size!10525 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21409)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370697 (= res!208223 (or (= (select (arr!10173 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10173 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370698 () Bool)

(declare-fun res!208224 () Bool)

(assert (=> b!370698 (=> (not res!208224) (not e!226377))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12749 0))(
  ( (V!12750 (val!4411 Int)) )
))
(declare-datatypes ((ValueCell!4023 0))(
  ( (ValueCellFull!4023 (v!6608 V!12749)) (EmptyCell!4023) )
))
(declare-datatypes ((array!21411 0))(
  ( (array!21412 (arr!10174 (Array (_ BitVec 32) ValueCell!4023)) (size!10526 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21411)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370698 (= res!208224 (and (= (size!10526 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10525 _keys!658) (size!10526 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370699 () Bool)

(declare-fun e!226374 () Bool)

(declare-fun e!226375 () Bool)

(declare-fun mapRes!14664 () Bool)

(assert (=> b!370699 (= e!226374 (and e!226375 mapRes!14664))))

(declare-fun condMapEmpty!14664 () Bool)

(declare-fun mapDefault!14664 () ValueCell!4023)

(assert (=> b!370699 (= condMapEmpty!14664 (= (arr!10174 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4023)) mapDefault!14664)))))

(declare-fun b!370700 () Bool)

(declare-fun e!226376 () Bool)

(assert (=> b!370700 (= e!226376 false)))

(declare-fun zeroValue!472 () V!12749)

(declare-fun v!373 () V!12749)

(declare-fun lt!170027 () array!21409)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5850 0))(
  ( (tuple2!5851 (_1!2936 (_ BitVec 64)) (_2!2936 V!12749)) )
))
(declare-datatypes ((List!5688 0))(
  ( (Nil!5685) (Cons!5684 (h!6540 tuple2!5850) (t!10838 List!5688)) )
))
(declare-datatypes ((ListLongMap!4763 0))(
  ( (ListLongMap!4764 (toList!2397 List!5688)) )
))
(declare-fun lt!170028 () ListLongMap!4763)

(declare-fun minValue!472 () V!12749)

(declare-fun getCurrentListMapNoExtraKeys!674 (array!21409 array!21411 (_ BitVec 32) (_ BitVec 32) V!12749 V!12749 (_ BitVec 32) Int) ListLongMap!4763)

(assert (=> b!370700 (= lt!170028 (getCurrentListMapNoExtraKeys!674 lt!170027 (array!21412 (store (arr!10174 _values!506) i!548 (ValueCellFull!4023 v!373)) (size!10526 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170026 () ListLongMap!4763)

(assert (=> b!370700 (= lt!170026 (getCurrentListMapNoExtraKeys!674 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370701 () Bool)

(declare-fun res!208225 () Bool)

(assert (=> b!370701 (=> (not res!208225) (not e!226377))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370701 (= res!208225 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370702 () Bool)

(declare-fun res!208229 () Bool)

(assert (=> b!370702 (=> (not res!208229) (not e!226377))))

(assert (=> b!370702 (= res!208229 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10525 _keys!658))))))

(declare-fun b!370703 () Bool)

(declare-fun res!208228 () Bool)

(assert (=> b!370703 (=> (not res!208228) (not e!226377))))

(declare-datatypes ((List!5689 0))(
  ( (Nil!5686) (Cons!5685 (h!6541 (_ BitVec 64)) (t!10839 List!5689)) )
))
(declare-fun arrayNoDuplicates!0 (array!21409 (_ BitVec 32) List!5689) Bool)

(assert (=> b!370703 (= res!208228 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5686))))

(declare-fun b!370704 () Bool)

(declare-fun res!208220 () Bool)

(assert (=> b!370704 (=> (not res!208220) (not e!226377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21409 (_ BitVec 32)) Bool)

(assert (=> b!370704 (= res!208220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370705 () Bool)

(declare-fun tp_is_empty!8733 () Bool)

(assert (=> b!370705 (= e!226375 tp_is_empty!8733)))

(declare-fun b!370706 () Bool)

(declare-fun e!226378 () Bool)

(assert (=> b!370706 (= e!226378 tp_is_empty!8733)))

(declare-fun res!208222 () Bool)

(assert (=> start!36958 (=> (not res!208222) (not e!226377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36958 (= res!208222 (validMask!0 mask!970))))

(assert (=> start!36958 e!226377))

(declare-fun array_inv!7512 (array!21411) Bool)

(assert (=> start!36958 (and (array_inv!7512 _values!506) e!226374)))

(assert (=> start!36958 tp!28970))

(assert (=> start!36958 true))

(assert (=> start!36958 tp_is_empty!8733))

(declare-fun array_inv!7513 (array!21409) Bool)

(assert (=> start!36958 (array_inv!7513 _keys!658)))

(declare-fun mapNonEmpty!14664 () Bool)

(declare-fun tp!28971 () Bool)

(assert (=> mapNonEmpty!14664 (= mapRes!14664 (and tp!28971 e!226378))))

(declare-fun mapValue!14664 () ValueCell!4023)

(declare-fun mapRest!14664 () (Array (_ BitVec 32) ValueCell!4023))

(declare-fun mapKey!14664 () (_ BitVec 32))

(assert (=> mapNonEmpty!14664 (= (arr!10174 _values!506) (store mapRest!14664 mapKey!14664 mapValue!14664))))

(declare-fun b!370707 () Bool)

(declare-fun res!208221 () Bool)

(assert (=> b!370707 (=> (not res!208221) (not e!226376))))

(assert (=> b!370707 (= res!208221 (arrayNoDuplicates!0 lt!170027 #b00000000000000000000000000000000 Nil!5686))))

(declare-fun b!370708 () Bool)

(assert (=> b!370708 (= e!226377 e!226376)))

(declare-fun res!208227 () Bool)

(assert (=> b!370708 (=> (not res!208227) (not e!226376))))

(assert (=> b!370708 (= res!208227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170027 mask!970))))

(assert (=> b!370708 (= lt!170027 (array!21410 (store (arr!10173 _keys!658) i!548 k0!778) (size!10525 _keys!658)))))

(declare-fun mapIsEmpty!14664 () Bool)

(assert (=> mapIsEmpty!14664 mapRes!14664))

(declare-fun b!370709 () Bool)

(declare-fun res!208226 () Bool)

(assert (=> b!370709 (=> (not res!208226) (not e!226377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370709 (= res!208226 (validKeyInArray!0 k0!778))))

(assert (= (and start!36958 res!208222) b!370698))

(assert (= (and b!370698 res!208224) b!370704))

(assert (= (and b!370704 res!208220) b!370703))

(assert (= (and b!370703 res!208228) b!370702))

(assert (= (and b!370702 res!208229) b!370709))

(assert (= (and b!370709 res!208226) b!370697))

(assert (= (and b!370697 res!208223) b!370701))

(assert (= (and b!370701 res!208225) b!370708))

(assert (= (and b!370708 res!208227) b!370707))

(assert (= (and b!370707 res!208221) b!370700))

(assert (= (and b!370699 condMapEmpty!14664) mapIsEmpty!14664))

(assert (= (and b!370699 (not condMapEmpty!14664)) mapNonEmpty!14664))

(get-info :version)

(assert (= (and mapNonEmpty!14664 ((_ is ValueCellFull!4023) mapValue!14664)) b!370706))

(assert (= (and b!370699 ((_ is ValueCellFull!4023) mapDefault!14664)) b!370705))

(assert (= start!36958 b!370699))

(declare-fun m!366783 () Bool)

(assert (=> b!370708 m!366783))

(declare-fun m!366785 () Bool)

(assert (=> b!370708 m!366785))

(declare-fun m!366787 () Bool)

(assert (=> b!370707 m!366787))

(declare-fun m!366789 () Bool)

(assert (=> b!370704 m!366789))

(declare-fun m!366791 () Bool)

(assert (=> mapNonEmpty!14664 m!366791))

(declare-fun m!366793 () Bool)

(assert (=> b!370697 m!366793))

(declare-fun m!366795 () Bool)

(assert (=> start!36958 m!366795))

(declare-fun m!366797 () Bool)

(assert (=> start!36958 m!366797))

(declare-fun m!366799 () Bool)

(assert (=> start!36958 m!366799))

(declare-fun m!366801 () Bool)

(assert (=> b!370701 m!366801))

(declare-fun m!366803 () Bool)

(assert (=> b!370700 m!366803))

(declare-fun m!366805 () Bool)

(assert (=> b!370700 m!366805))

(declare-fun m!366807 () Bool)

(assert (=> b!370700 m!366807))

(declare-fun m!366809 () Bool)

(assert (=> b!370709 m!366809))

(declare-fun m!366811 () Bool)

(assert (=> b!370703 m!366811))

(check-sat (not mapNonEmpty!14664) (not b_next!8085) b_and!15327 (not b!370701) (not b!370707) (not b!370704) (not b!370700) (not start!36958) (not b!370703) tp_is_empty!8733 (not b!370709) (not b!370708))
(check-sat b_and!15327 (not b_next!8085))
