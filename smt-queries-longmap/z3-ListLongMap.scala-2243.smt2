; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36922 () Bool)

(assert start!36922)

(declare-fun b_free!8049 () Bool)

(declare-fun b_next!8049 () Bool)

(assert (=> start!36922 (= b_free!8049 (not b_next!8049))))

(declare-fun tp!28863 () Bool)

(declare-fun b_and!15291 () Bool)

(assert (=> start!36922 (= tp!28863 b_and!15291)))

(declare-fun b!369995 () Bool)

(declare-fun res!207684 () Bool)

(declare-fun e!226052 () Bool)

(assert (=> b!369995 (=> (not res!207684) (not e!226052))))

(declare-datatypes ((array!21337 0))(
  ( (array!21338 (arr!10137 (Array (_ BitVec 32) (_ BitVec 64))) (size!10489 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21337)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369995 (= res!207684 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!207683 () Bool)

(assert (=> start!36922 (=> (not res!207683) (not e!226052))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36922 (= res!207683 (validMask!0 mask!970))))

(assert (=> start!36922 e!226052))

(declare-datatypes ((V!12701 0))(
  ( (V!12702 (val!4393 Int)) )
))
(declare-datatypes ((ValueCell!4005 0))(
  ( (ValueCellFull!4005 (v!6590 V!12701)) (EmptyCell!4005) )
))
(declare-datatypes ((array!21339 0))(
  ( (array!21340 (arr!10138 (Array (_ BitVec 32) ValueCell!4005)) (size!10490 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21339)

(declare-fun e!226050 () Bool)

(declare-fun array_inv!7490 (array!21339) Bool)

(assert (=> start!36922 (and (array_inv!7490 _values!506) e!226050)))

(assert (=> start!36922 tp!28863))

(assert (=> start!36922 true))

(declare-fun tp_is_empty!8697 () Bool)

(assert (=> start!36922 tp_is_empty!8697))

(declare-fun array_inv!7491 (array!21337) Bool)

(assert (=> start!36922 (array_inv!7491 _keys!658)))

(declare-fun mapIsEmpty!14610 () Bool)

(declare-fun mapRes!14610 () Bool)

(assert (=> mapIsEmpty!14610 mapRes!14610))

(declare-fun b!369996 () Bool)

(declare-fun res!207688 () Bool)

(assert (=> b!369996 (=> (not res!207688) (not e!226052))))

(declare-datatypes ((List!5662 0))(
  ( (Nil!5659) (Cons!5658 (h!6514 (_ BitVec 64)) (t!10812 List!5662)) )
))
(declare-fun arrayNoDuplicates!0 (array!21337 (_ BitVec 32) List!5662) Bool)

(assert (=> b!369996 (= res!207688 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5659))))

(declare-fun b!369997 () Bool)

(declare-fun res!207680 () Bool)

(assert (=> b!369997 (=> (not res!207680) (not e!226052))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369997 (= res!207680 (and (= (size!10490 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10489 _keys!658) (size!10490 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369998 () Bool)

(declare-fun res!207689 () Bool)

(declare-fun e!226051 () Bool)

(assert (=> b!369998 (=> (not res!207689) (not e!226051))))

(declare-fun lt!169866 () array!21337)

(assert (=> b!369998 (= res!207689 (arrayNoDuplicates!0 lt!169866 #b00000000000000000000000000000000 Nil!5659))))

(declare-fun b!369999 () Bool)

(declare-fun e!226055 () Bool)

(assert (=> b!369999 (= e!226055 tp_is_empty!8697)))

(declare-fun b!370000 () Bool)

(declare-fun e!226054 () Bool)

(assert (=> b!370000 (= e!226054 tp_is_empty!8697)))

(declare-fun b!370001 () Bool)

(declare-fun res!207687 () Bool)

(assert (=> b!370001 (=> (not res!207687) (not e!226052))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370001 (= res!207687 (or (= (select (arr!10137 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10137 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370002 () Bool)

(declare-fun res!207682 () Bool)

(assert (=> b!370002 (=> (not res!207682) (not e!226052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21337 (_ BitVec 32)) Bool)

(assert (=> b!370002 (= res!207682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370003 () Bool)

(declare-fun res!207685 () Bool)

(assert (=> b!370003 (=> (not res!207685) (not e!226052))))

(assert (=> b!370003 (= res!207685 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10489 _keys!658))))))

(declare-fun b!370004 () Bool)

(assert (=> b!370004 (= e!226051 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5826 0))(
  ( (tuple2!5827 (_1!2924 (_ BitVec 64)) (_2!2924 V!12701)) )
))
(declare-datatypes ((List!5663 0))(
  ( (Nil!5660) (Cons!5659 (h!6515 tuple2!5826) (t!10813 List!5663)) )
))
(declare-datatypes ((ListLongMap!4739 0))(
  ( (ListLongMap!4740 (toList!2385 List!5663)) )
))
(declare-fun lt!169864 () ListLongMap!4739)

(declare-fun v!373 () V!12701)

(declare-fun zeroValue!472 () V!12701)

(declare-fun minValue!472 () V!12701)

(declare-fun getCurrentListMapNoExtraKeys!662 (array!21337 array!21339 (_ BitVec 32) (_ BitVec 32) V!12701 V!12701 (_ BitVec 32) Int) ListLongMap!4739)

(assert (=> b!370004 (= lt!169864 (getCurrentListMapNoExtraKeys!662 lt!169866 (array!21340 (store (arr!10138 _values!506) i!548 (ValueCellFull!4005 v!373)) (size!10490 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169865 () ListLongMap!4739)

(assert (=> b!370004 (= lt!169865 (getCurrentListMapNoExtraKeys!662 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370005 () Bool)

(assert (=> b!370005 (= e!226050 (and e!226054 mapRes!14610))))

(declare-fun condMapEmpty!14610 () Bool)

(declare-fun mapDefault!14610 () ValueCell!4005)

(assert (=> b!370005 (= condMapEmpty!14610 (= (arr!10138 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4005)) mapDefault!14610)))))

(declare-fun b!370006 () Bool)

(assert (=> b!370006 (= e!226052 e!226051)))

(declare-fun res!207681 () Bool)

(assert (=> b!370006 (=> (not res!207681) (not e!226051))))

(assert (=> b!370006 (= res!207681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169866 mask!970))))

(assert (=> b!370006 (= lt!169866 (array!21338 (store (arr!10137 _keys!658) i!548 k0!778) (size!10489 _keys!658)))))

(declare-fun mapNonEmpty!14610 () Bool)

(declare-fun tp!28862 () Bool)

(assert (=> mapNonEmpty!14610 (= mapRes!14610 (and tp!28862 e!226055))))

(declare-fun mapValue!14610 () ValueCell!4005)

(declare-fun mapKey!14610 () (_ BitVec 32))

(declare-fun mapRest!14610 () (Array (_ BitVec 32) ValueCell!4005))

(assert (=> mapNonEmpty!14610 (= (arr!10138 _values!506) (store mapRest!14610 mapKey!14610 mapValue!14610))))

(declare-fun b!370007 () Bool)

(declare-fun res!207686 () Bool)

(assert (=> b!370007 (=> (not res!207686) (not e!226052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370007 (= res!207686 (validKeyInArray!0 k0!778))))

(assert (= (and start!36922 res!207683) b!369997))

(assert (= (and b!369997 res!207680) b!370002))

(assert (= (and b!370002 res!207682) b!369996))

(assert (= (and b!369996 res!207688) b!370003))

(assert (= (and b!370003 res!207685) b!370007))

(assert (= (and b!370007 res!207686) b!370001))

(assert (= (and b!370001 res!207687) b!369995))

(assert (= (and b!369995 res!207684) b!370006))

(assert (= (and b!370006 res!207681) b!369998))

(assert (= (and b!369998 res!207689) b!370004))

(assert (= (and b!370005 condMapEmpty!14610) mapIsEmpty!14610))

(assert (= (and b!370005 (not condMapEmpty!14610)) mapNonEmpty!14610))

(get-info :version)

(assert (= (and mapNonEmpty!14610 ((_ is ValueCellFull!4005) mapValue!14610)) b!369999))

(assert (= (and b!370005 ((_ is ValueCellFull!4005) mapDefault!14610)) b!370000))

(assert (= start!36922 b!370005))

(declare-fun m!366243 () Bool)

(assert (=> b!369998 m!366243))

(declare-fun m!366245 () Bool)

(assert (=> b!370006 m!366245))

(declare-fun m!366247 () Bool)

(assert (=> b!370006 m!366247))

(declare-fun m!366249 () Bool)

(assert (=> b!369995 m!366249))

(declare-fun m!366251 () Bool)

(assert (=> b!370007 m!366251))

(declare-fun m!366253 () Bool)

(assert (=> b!369996 m!366253))

(declare-fun m!366255 () Bool)

(assert (=> start!36922 m!366255))

(declare-fun m!366257 () Bool)

(assert (=> start!36922 m!366257))

(declare-fun m!366259 () Bool)

(assert (=> start!36922 m!366259))

(declare-fun m!366261 () Bool)

(assert (=> mapNonEmpty!14610 m!366261))

(declare-fun m!366263 () Bool)

(assert (=> b!370004 m!366263))

(declare-fun m!366265 () Bool)

(assert (=> b!370004 m!366265))

(declare-fun m!366267 () Bool)

(assert (=> b!370004 m!366267))

(declare-fun m!366269 () Bool)

(assert (=> b!370002 m!366269))

(declare-fun m!366271 () Bool)

(assert (=> b!370001 m!366271))

(check-sat (not mapNonEmpty!14610) (not b!370002) (not start!36922) (not b!369995) (not b!369996) (not b!370004) tp_is_empty!8697 (not b!370007) b_and!15291 (not b_next!8049) (not b!369998) (not b!370006))
(check-sat b_and!15291 (not b_next!8049))
