; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37038 () Bool)

(assert start!37038)

(declare-fun b_free!8179 () Bool)

(declare-fun b_next!8179 () Bool)

(assert (=> start!37038 (= b_free!8179 (not b_next!8179))))

(declare-fun tp!29252 () Bool)

(declare-fun b_and!15395 () Bool)

(assert (=> start!37038 (= tp!29252 b_and!15395)))

(declare-fun b!372259 () Bool)

(declare-fun res!209510 () Bool)

(declare-fun e!227051 () Bool)

(assert (=> b!372259 (=> (not res!209510) (not e!227051))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12875 0))(
  ( (V!12876 (val!4458 Int)) )
))
(declare-datatypes ((ValueCell!4070 0))(
  ( (ValueCellFull!4070 (v!6649 V!12875)) (EmptyCell!4070) )
))
(declare-datatypes ((array!21577 0))(
  ( (array!21578 (arr!10257 (Array (_ BitVec 32) ValueCell!4070)) (size!10610 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21577)

(declare-datatypes ((array!21579 0))(
  ( (array!21580 (arr!10258 (Array (_ BitVec 32) (_ BitVec 64))) (size!10611 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21579)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!372259 (= res!209510 (and (= (size!10610 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10611 _keys!658) (size!10610 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372260 () Bool)

(declare-fun res!209501 () Bool)

(assert (=> b!372260 (=> (not res!209501) (not e!227051))))

(declare-datatypes ((List!5724 0))(
  ( (Nil!5721) (Cons!5720 (h!6576 (_ BitVec 64)) (t!10865 List!5724)) )
))
(declare-fun arrayNoDuplicates!0 (array!21579 (_ BitVec 32) List!5724) Bool)

(assert (=> b!372260 (= res!209501 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5721))))

(declare-fun b!372261 () Bool)

(declare-fun res!209502 () Bool)

(assert (=> b!372261 (=> (not res!209502) (not e!227051))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372261 (= res!209502 (or (= (select (arr!10258 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10258 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372262 () Bool)

(declare-fun e!227049 () Bool)

(declare-fun e!227046 () Bool)

(declare-fun mapRes!14805 () Bool)

(assert (=> b!372262 (= e!227049 (and e!227046 mapRes!14805))))

(declare-fun condMapEmpty!14805 () Bool)

(declare-fun mapDefault!14805 () ValueCell!4070)

(assert (=> b!372262 (= condMapEmpty!14805 (= (arr!10257 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4070)) mapDefault!14805)))))

(declare-fun b!372263 () Bool)

(declare-fun res!209507 () Bool)

(assert (=> b!372263 (=> (not res!209507) (not e!227051))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372263 (= res!209507 (validKeyInArray!0 k0!778))))

(declare-fun b!372264 () Bool)

(declare-fun res!209509 () Bool)

(assert (=> b!372264 (=> (not res!209509) (not e!227051))))

(declare-fun arrayContainsKey!0 (array!21579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372264 (= res!209509 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372265 () Bool)

(declare-fun e!227050 () Bool)

(assert (=> b!372265 (= e!227050 (not true))))

(declare-fun lt!170567 () array!21577)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170570 () array!21579)

(declare-fun zeroValue!472 () V!12875)

(declare-datatypes ((tuple2!5886 0))(
  ( (tuple2!5887 (_1!2954 (_ BitVec 64)) (_2!2954 V!12875)) )
))
(declare-datatypes ((List!5725 0))(
  ( (Nil!5722) (Cons!5721 (h!6577 tuple2!5886) (t!10866 List!5725)) )
))
(declare-datatypes ((ListLongMap!4789 0))(
  ( (ListLongMap!4790 (toList!2410 List!5725)) )
))
(declare-fun lt!170571 () ListLongMap!4789)

(declare-fun minValue!472 () V!12875)

(declare-fun getCurrentListMap!1836 (array!21579 array!21577 (_ BitVec 32) (_ BitVec 32) V!12875 V!12875 (_ BitVec 32) Int) ListLongMap!4789)

(assert (=> b!372265 (= lt!170571 (getCurrentListMap!1836 lt!170570 lt!170567 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170568 () ListLongMap!4789)

(declare-fun lt!170569 () ListLongMap!4789)

(assert (=> b!372265 (and (= lt!170568 lt!170569) (= lt!170569 lt!170568))))

(declare-fun lt!170566 () ListLongMap!4789)

(declare-fun v!373 () V!12875)

(declare-fun +!778 (ListLongMap!4789 tuple2!5886) ListLongMap!4789)

(assert (=> b!372265 (= lt!170569 (+!778 lt!170566 (tuple2!5887 k0!778 v!373)))))

(declare-datatypes ((Unit!11432 0))(
  ( (Unit!11433) )
))
(declare-fun lt!170565 () Unit!11432)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!29 (array!21579 array!21577 (_ BitVec 32) (_ BitVec 32) V!12875 V!12875 (_ BitVec 32) (_ BitVec 64) V!12875 (_ BitVec 32) Int) Unit!11432)

(assert (=> b!372265 (= lt!170565 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!29 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!701 (array!21579 array!21577 (_ BitVec 32) (_ BitVec 32) V!12875 V!12875 (_ BitVec 32) Int) ListLongMap!4789)

(assert (=> b!372265 (= lt!170568 (getCurrentListMapNoExtraKeys!701 lt!170570 lt!170567 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372265 (= lt!170567 (array!21578 (store (arr!10257 _values!506) i!548 (ValueCellFull!4070 v!373)) (size!10610 _values!506)))))

(assert (=> b!372265 (= lt!170566 (getCurrentListMapNoExtraKeys!701 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372266 () Bool)

(assert (=> b!372266 (= e!227051 e!227050)))

(declare-fun res!209504 () Bool)

(assert (=> b!372266 (=> (not res!209504) (not e!227050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21579 (_ BitVec 32)) Bool)

(assert (=> b!372266 (= res!209504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170570 mask!970))))

(assert (=> b!372266 (= lt!170570 (array!21580 (store (arr!10258 _keys!658) i!548 k0!778) (size!10611 _keys!658)))))

(declare-fun b!372267 () Bool)

(declare-fun res!209505 () Bool)

(assert (=> b!372267 (=> (not res!209505) (not e!227050))))

(assert (=> b!372267 (= res!209505 (arrayNoDuplicates!0 lt!170570 #b00000000000000000000000000000000 Nil!5721))))

(declare-fun b!372268 () Bool)

(declare-fun tp_is_empty!8827 () Bool)

(assert (=> b!372268 (= e!227046 tp_is_empty!8827)))

(declare-fun b!372270 () Bool)

(declare-fun res!209503 () Bool)

(assert (=> b!372270 (=> (not res!209503) (not e!227051))))

(assert (=> b!372270 (= res!209503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14805 () Bool)

(declare-fun tp!29253 () Bool)

(declare-fun e!227048 () Bool)

(assert (=> mapNonEmpty!14805 (= mapRes!14805 (and tp!29253 e!227048))))

(declare-fun mapValue!14805 () ValueCell!4070)

(declare-fun mapKey!14805 () (_ BitVec 32))

(declare-fun mapRest!14805 () (Array (_ BitVec 32) ValueCell!4070))

(assert (=> mapNonEmpty!14805 (= (arr!10257 _values!506) (store mapRest!14805 mapKey!14805 mapValue!14805))))

(declare-fun b!372271 () Bool)

(declare-fun res!209508 () Bool)

(assert (=> b!372271 (=> (not res!209508) (not e!227051))))

(assert (=> b!372271 (= res!209508 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10611 _keys!658))))))

(declare-fun mapIsEmpty!14805 () Bool)

(assert (=> mapIsEmpty!14805 mapRes!14805))

(declare-fun b!372269 () Bool)

(assert (=> b!372269 (= e!227048 tp_is_empty!8827)))

(declare-fun res!209506 () Bool)

(assert (=> start!37038 (=> (not res!209506) (not e!227051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37038 (= res!209506 (validMask!0 mask!970))))

(assert (=> start!37038 e!227051))

(declare-fun array_inv!7576 (array!21577) Bool)

(assert (=> start!37038 (and (array_inv!7576 _values!506) e!227049)))

(assert (=> start!37038 tp!29252))

(assert (=> start!37038 true))

(assert (=> start!37038 tp_is_empty!8827))

(declare-fun array_inv!7577 (array!21579) Bool)

(assert (=> start!37038 (array_inv!7577 _keys!658)))

(assert (= (and start!37038 res!209506) b!372259))

(assert (= (and b!372259 res!209510) b!372270))

(assert (= (and b!372270 res!209503) b!372260))

(assert (= (and b!372260 res!209501) b!372271))

(assert (= (and b!372271 res!209508) b!372263))

(assert (= (and b!372263 res!209507) b!372261))

(assert (= (and b!372261 res!209502) b!372264))

(assert (= (and b!372264 res!209509) b!372266))

(assert (= (and b!372266 res!209504) b!372267))

(assert (= (and b!372267 res!209505) b!372265))

(assert (= (and b!372262 condMapEmpty!14805) mapIsEmpty!14805))

(assert (= (and b!372262 (not condMapEmpty!14805)) mapNonEmpty!14805))

(get-info :version)

(assert (= (and mapNonEmpty!14805 ((_ is ValueCellFull!4070) mapValue!14805)) b!372269))

(assert (= (and b!372262 ((_ is ValueCellFull!4070) mapDefault!14805)) b!372268))

(assert (= start!37038 b!372262))

(declare-fun m!367667 () Bool)

(assert (=> mapNonEmpty!14805 m!367667))

(declare-fun m!367669 () Bool)

(assert (=> b!372264 m!367669))

(declare-fun m!367671 () Bool)

(assert (=> b!372263 m!367671))

(declare-fun m!367673 () Bool)

(assert (=> b!372261 m!367673))

(declare-fun m!367675 () Bool)

(assert (=> b!372265 m!367675))

(declare-fun m!367677 () Bool)

(assert (=> b!372265 m!367677))

(declare-fun m!367679 () Bool)

(assert (=> b!372265 m!367679))

(declare-fun m!367681 () Bool)

(assert (=> b!372265 m!367681))

(declare-fun m!367683 () Bool)

(assert (=> b!372265 m!367683))

(declare-fun m!367685 () Bool)

(assert (=> b!372265 m!367685))

(declare-fun m!367687 () Bool)

(assert (=> b!372270 m!367687))

(declare-fun m!367689 () Bool)

(assert (=> b!372266 m!367689))

(declare-fun m!367691 () Bool)

(assert (=> b!372266 m!367691))

(declare-fun m!367693 () Bool)

(assert (=> start!37038 m!367693))

(declare-fun m!367695 () Bool)

(assert (=> start!37038 m!367695))

(declare-fun m!367697 () Bool)

(assert (=> start!37038 m!367697))

(declare-fun m!367699 () Bool)

(assert (=> b!372260 m!367699))

(declare-fun m!367701 () Bool)

(assert (=> b!372267 m!367701))

(check-sat (not b!372265) (not b!372270) (not b!372260) (not b!372266) (not start!37038) (not mapNonEmpty!14805) (not b_next!8179) b_and!15395 (not b!372264) (not b!372263) (not b!372267) tp_is_empty!8827)
(check-sat b_and!15395 (not b_next!8179))
