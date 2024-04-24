; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37026 () Bool)

(assert start!37026)

(declare-fun b_free!8167 () Bool)

(declare-fun b_next!8167 () Bool)

(assert (=> start!37026 (= b_free!8167 (not b_next!8167))))

(declare-fun tp!29217 () Bool)

(declare-fun b_and!15423 () Bool)

(assert (=> start!37026 (= tp!29217 b_and!15423)))

(declare-fun b!372247 () Bool)

(declare-fun res!209453 () Bool)

(declare-fun e!227085 () Bool)

(assert (=> b!372247 (=> (not res!209453) (not e!227085))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372247 (= res!209453 (validKeyInArray!0 k0!778))))

(declare-fun b!372248 () Bool)

(declare-fun res!209454 () Bool)

(declare-fun e!227080 () Bool)

(assert (=> b!372248 (=> (not res!209454) (not e!227080))))

(declare-datatypes ((array!21552 0))(
  ( (array!21553 (arr!10244 (Array (_ BitVec 32) (_ BitVec 64))) (size!10596 (_ BitVec 32))) )
))
(declare-fun lt!170697 () array!21552)

(declare-datatypes ((List!5648 0))(
  ( (Nil!5645) (Cons!5644 (h!6500 (_ BitVec 64)) (t!10790 List!5648)) )
))
(declare-fun arrayNoDuplicates!0 (array!21552 (_ BitVec 32) List!5648) Bool)

(assert (=> b!372248 (= res!209454 (arrayNoDuplicates!0 lt!170697 #b00000000000000000000000000000000 Nil!5645))))

(declare-fun b!372249 () Bool)

(declare-fun res!209450 () Bool)

(assert (=> b!372249 (=> (not res!209450) (not e!227085))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!21552)

(assert (=> b!372249 (= res!209450 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10596 _keys!658))))))

(declare-fun b!372250 () Bool)

(declare-fun e!227081 () Bool)

(declare-fun e!227082 () Bool)

(declare-fun mapRes!14787 () Bool)

(assert (=> b!372250 (= e!227081 (and e!227082 mapRes!14787))))

(declare-fun condMapEmpty!14787 () Bool)

(declare-datatypes ((V!12859 0))(
  ( (V!12860 (val!4452 Int)) )
))
(declare-datatypes ((ValueCell!4064 0))(
  ( (ValueCellFull!4064 (v!6650 V!12859)) (EmptyCell!4064) )
))
(declare-datatypes ((array!21554 0))(
  ( (array!21555 (arr!10245 (Array (_ BitVec 32) ValueCell!4064)) (size!10597 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21554)

(declare-fun mapDefault!14787 () ValueCell!4064)

(assert (=> b!372250 (= condMapEmpty!14787 (= (arr!10245 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4064)) mapDefault!14787)))))

(declare-fun b!372251 () Bool)

(declare-fun res!209456 () Bool)

(assert (=> b!372251 (=> (not res!209456) (not e!227085))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21552 (_ BitVec 32)) Bool)

(assert (=> b!372251 (= res!209456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14787 () Bool)

(assert (=> mapIsEmpty!14787 mapRes!14787))

(declare-fun b!372252 () Bool)

(assert (=> b!372252 (= e!227080 (not true))))

(declare-fun lt!170696 () array!21554)

(declare-datatypes ((tuple2!5806 0))(
  ( (tuple2!5807 (_1!2914 (_ BitVec 64)) (_2!2914 V!12859)) )
))
(declare-datatypes ((List!5649 0))(
  ( (Nil!5646) (Cons!5645 (h!6501 tuple2!5806) (t!10791 List!5649)) )
))
(declare-datatypes ((ListLongMap!4721 0))(
  ( (ListLongMap!4722 (toList!2376 List!5649)) )
))
(declare-fun lt!170695 () ListLongMap!4721)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12859)

(declare-fun minValue!472 () V!12859)

(declare-fun getCurrentListMap!1838 (array!21552 array!21554 (_ BitVec 32) (_ BitVec 32) V!12859 V!12859 (_ BitVec 32) Int) ListLongMap!4721)

(assert (=> b!372252 (= lt!170695 (getCurrentListMap!1838 lt!170697 lt!170696 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170692 () ListLongMap!4721)

(declare-fun lt!170694 () ListLongMap!4721)

(assert (=> b!372252 (and (= lt!170692 lt!170694) (= lt!170694 lt!170692))))

(declare-fun lt!170693 () ListLongMap!4721)

(declare-fun v!373 () V!12859)

(declare-fun +!772 (ListLongMap!4721 tuple2!5806) ListLongMap!4721)

(assert (=> b!372252 (= lt!170694 (+!772 lt!170693 (tuple2!5807 k0!778 v!373)))))

(declare-datatypes ((Unit!11435 0))(
  ( (Unit!11436) )
))
(declare-fun lt!170698 () Unit!11435)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!25 (array!21552 array!21554 (_ BitVec 32) (_ BitVec 32) V!12859 V!12859 (_ BitVec 32) (_ BitVec 64) V!12859 (_ BitVec 32) Int) Unit!11435)

(assert (=> b!372252 (= lt!170698 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!25 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!685 (array!21552 array!21554 (_ BitVec 32) (_ BitVec 32) V!12859 V!12859 (_ BitVec 32) Int) ListLongMap!4721)

(assert (=> b!372252 (= lt!170692 (getCurrentListMapNoExtraKeys!685 lt!170697 lt!170696 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372252 (= lt!170696 (array!21555 (store (arr!10245 _values!506) i!548 (ValueCellFull!4064 v!373)) (size!10597 _values!506)))))

(assert (=> b!372252 (= lt!170693 (getCurrentListMapNoExtraKeys!685 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14787 () Bool)

(declare-fun tp!29216 () Bool)

(declare-fun e!227083 () Bool)

(assert (=> mapNonEmpty!14787 (= mapRes!14787 (and tp!29216 e!227083))))

(declare-fun mapKey!14787 () (_ BitVec 32))

(declare-fun mapRest!14787 () (Array (_ BitVec 32) ValueCell!4064))

(declare-fun mapValue!14787 () ValueCell!4064)

(assert (=> mapNonEmpty!14787 (= (arr!10245 _values!506) (store mapRest!14787 mapKey!14787 mapValue!14787))))

(declare-fun b!372253 () Bool)

(declare-fun res!209452 () Bool)

(assert (=> b!372253 (=> (not res!209452) (not e!227085))))

(declare-fun arrayContainsKey!0 (array!21552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372253 (= res!209452 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372254 () Bool)

(declare-fun tp_is_empty!8815 () Bool)

(assert (=> b!372254 (= e!227082 tp_is_empty!8815)))

(declare-fun res!209448 () Bool)

(assert (=> start!37026 (=> (not res!209448) (not e!227085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37026 (= res!209448 (validMask!0 mask!970))))

(assert (=> start!37026 e!227085))

(declare-fun array_inv!7594 (array!21554) Bool)

(assert (=> start!37026 (and (array_inv!7594 _values!506) e!227081)))

(assert (=> start!37026 tp!29217))

(assert (=> start!37026 true))

(assert (=> start!37026 tp_is_empty!8815))

(declare-fun array_inv!7595 (array!21552) Bool)

(assert (=> start!37026 (array_inv!7595 _keys!658)))

(declare-fun b!372255 () Bool)

(declare-fun res!209449 () Bool)

(assert (=> b!372255 (=> (not res!209449) (not e!227085))))

(assert (=> b!372255 (= res!209449 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5645))))

(declare-fun b!372256 () Bool)

(declare-fun res!209455 () Bool)

(assert (=> b!372256 (=> (not res!209455) (not e!227085))))

(assert (=> b!372256 (= res!209455 (or (= (select (arr!10244 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10244 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372257 () Bool)

(assert (=> b!372257 (= e!227083 tp_is_empty!8815)))

(declare-fun b!372258 () Bool)

(assert (=> b!372258 (= e!227085 e!227080)))

(declare-fun res!209447 () Bool)

(assert (=> b!372258 (=> (not res!209447) (not e!227080))))

(assert (=> b!372258 (= res!209447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170697 mask!970))))

(assert (=> b!372258 (= lt!170697 (array!21553 (store (arr!10244 _keys!658) i!548 k0!778) (size!10596 _keys!658)))))

(declare-fun b!372259 () Bool)

(declare-fun res!209451 () Bool)

(assert (=> b!372259 (=> (not res!209451) (not e!227085))))

(assert (=> b!372259 (= res!209451 (and (= (size!10597 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10596 _keys!658) (size!10597 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37026 res!209448) b!372259))

(assert (= (and b!372259 res!209451) b!372251))

(assert (= (and b!372251 res!209456) b!372255))

(assert (= (and b!372255 res!209449) b!372249))

(assert (= (and b!372249 res!209450) b!372247))

(assert (= (and b!372247 res!209453) b!372256))

(assert (= (and b!372256 res!209455) b!372253))

(assert (= (and b!372253 res!209452) b!372258))

(assert (= (and b!372258 res!209447) b!372248))

(assert (= (and b!372248 res!209454) b!372252))

(assert (= (and b!372250 condMapEmpty!14787) mapIsEmpty!14787))

(assert (= (and b!372250 (not condMapEmpty!14787)) mapNonEmpty!14787))

(get-info :version)

(assert (= (and mapNonEmpty!14787 ((_ is ValueCellFull!4064) mapValue!14787)) b!372257))

(assert (= (and b!372250 ((_ is ValueCellFull!4064) mapDefault!14787)) b!372254))

(assert (= start!37026 b!372250))

(declare-fun m!368405 () Bool)

(assert (=> mapNonEmpty!14787 m!368405))

(declare-fun m!368407 () Bool)

(assert (=> b!372252 m!368407))

(declare-fun m!368409 () Bool)

(assert (=> b!372252 m!368409))

(declare-fun m!368411 () Bool)

(assert (=> b!372252 m!368411))

(declare-fun m!368413 () Bool)

(assert (=> b!372252 m!368413))

(declare-fun m!368415 () Bool)

(assert (=> b!372252 m!368415))

(declare-fun m!368417 () Bool)

(assert (=> b!372252 m!368417))

(declare-fun m!368419 () Bool)

(assert (=> b!372247 m!368419))

(declare-fun m!368421 () Bool)

(assert (=> b!372253 m!368421))

(declare-fun m!368423 () Bool)

(assert (=> start!37026 m!368423))

(declare-fun m!368425 () Bool)

(assert (=> start!37026 m!368425))

(declare-fun m!368427 () Bool)

(assert (=> start!37026 m!368427))

(declare-fun m!368429 () Bool)

(assert (=> b!372256 m!368429))

(declare-fun m!368431 () Bool)

(assert (=> b!372248 m!368431))

(declare-fun m!368433 () Bool)

(assert (=> b!372255 m!368433))

(declare-fun m!368435 () Bool)

(assert (=> b!372258 m!368435))

(declare-fun m!368437 () Bool)

(assert (=> b!372258 m!368437))

(declare-fun m!368439 () Bool)

(assert (=> b!372251 m!368439))

(check-sat (not start!37026) (not b!372252) (not b_next!8167) (not b!372253) b_and!15423 (not mapNonEmpty!14787) (not b!372251) (not b!372247) tp_is_empty!8815 (not b!372255) (not b!372258) (not b!372248))
(check-sat b_and!15423 (not b_next!8167))
