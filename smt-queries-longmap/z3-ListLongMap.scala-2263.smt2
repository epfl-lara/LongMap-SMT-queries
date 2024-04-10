; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37042 () Bool)

(assert start!37042)

(declare-fun b_free!8169 () Bool)

(declare-fun b_next!8169 () Bool)

(assert (=> start!37042 (= b_free!8169 (not b_next!8169))))

(declare-fun tp!29223 () Bool)

(declare-fun b_and!15411 () Bool)

(assert (=> start!37042 (= tp!29223 b_and!15411)))

(declare-fun mapNonEmpty!14790 () Bool)

(declare-fun mapRes!14790 () Bool)

(declare-fun tp!29222 () Bool)

(declare-fun e!227132 () Bool)

(assert (=> mapNonEmpty!14790 (= mapRes!14790 (and tp!29222 e!227132))))

(declare-datatypes ((V!12861 0))(
  ( (V!12862 (val!4453 Int)) )
))
(declare-datatypes ((ValueCell!4065 0))(
  ( (ValueCellFull!4065 (v!6650 V!12861)) (EmptyCell!4065) )
))
(declare-fun mapRest!14790 () (Array (_ BitVec 32) ValueCell!4065))

(declare-datatypes ((array!21575 0))(
  ( (array!21576 (arr!10256 (Array (_ BitVec 32) ValueCell!4065)) (size!10608 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21575)

(declare-fun mapValue!14790 () ValueCell!4065)

(declare-fun mapKey!14790 () (_ BitVec 32))

(assert (=> mapNonEmpty!14790 (= (arr!10256 _values!506) (store mapRest!14790 mapKey!14790 mapValue!14790))))

(declare-fun b!372335 () Bool)

(declare-fun res!209483 () Bool)

(declare-fun e!227134 () Bool)

(assert (=> b!372335 (=> (not res!209483) (not e!227134))))

(declare-datatypes ((array!21577 0))(
  ( (array!21578 (arr!10257 (Array (_ BitVec 32) (_ BitVec 64))) (size!10609 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21577)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372335 (= res!209483 (or (= (select (arr!10257 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10257 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!209481 () Bool)

(assert (=> start!37042 (=> (not res!209481) (not e!227134))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37042 (= res!209481 (validMask!0 mask!970))))

(assert (=> start!37042 e!227134))

(declare-fun e!227131 () Bool)

(declare-fun array_inv!7566 (array!21575) Bool)

(assert (=> start!37042 (and (array_inv!7566 _values!506) e!227131)))

(assert (=> start!37042 tp!29223))

(assert (=> start!37042 true))

(declare-fun tp_is_empty!8817 () Bool)

(assert (=> start!37042 tp_is_empty!8817))

(declare-fun array_inv!7567 (array!21577) Bool)

(assert (=> start!37042 (array_inv!7567 _keys!658)))

(declare-fun b!372336 () Bool)

(declare-fun e!227135 () Bool)

(assert (=> b!372336 (= e!227134 e!227135)))

(declare-fun res!209486 () Bool)

(assert (=> b!372336 (=> (not res!209486) (not e!227135))))

(declare-fun lt!170700 () array!21577)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21577 (_ BitVec 32)) Bool)

(assert (=> b!372336 (= res!209486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170700 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!372336 (= lt!170700 (array!21578 (store (arr!10257 _keys!658) i!548 k0!778) (size!10609 _keys!658)))))

(declare-fun b!372337 () Bool)

(declare-fun res!209488 () Bool)

(assert (=> b!372337 (=> (not res!209488) (not e!227134))))

(assert (=> b!372337 (= res!209488 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10609 _keys!658))))))

(declare-fun b!372338 () Bool)

(declare-fun res!209489 () Bool)

(assert (=> b!372338 (=> (not res!209489) (not e!227134))))

(declare-datatypes ((List!5750 0))(
  ( (Nil!5747) (Cons!5746 (h!6602 (_ BitVec 64)) (t!10900 List!5750)) )
))
(declare-fun arrayNoDuplicates!0 (array!21577 (_ BitVec 32) List!5750) Bool)

(assert (=> b!372338 (= res!209489 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5747))))

(declare-fun b!372339 () Bool)

(declare-fun res!209480 () Bool)

(assert (=> b!372339 (=> (not res!209480) (not e!227134))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372339 (= res!209480 (and (= (size!10608 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10609 _keys!658) (size!10608 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372340 () Bool)

(declare-fun res!209487 () Bool)

(assert (=> b!372340 (=> (not res!209487) (not e!227134))))

(declare-fun arrayContainsKey!0 (array!21577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372340 (= res!209487 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14790 () Bool)

(assert (=> mapIsEmpty!14790 mapRes!14790))

(declare-fun b!372341 () Bool)

(declare-fun e!227130 () Bool)

(assert (=> b!372341 (= e!227130 tp_is_empty!8817)))

(declare-fun b!372342 () Bool)

(assert (=> b!372342 (= e!227135 (not true))))

(declare-fun lt!170697 () array!21575)

(declare-datatypes ((tuple2!5906 0))(
  ( (tuple2!5907 (_1!2964 (_ BitVec 64)) (_2!2964 V!12861)) )
))
(declare-datatypes ((List!5751 0))(
  ( (Nil!5748) (Cons!5747 (h!6603 tuple2!5906) (t!10901 List!5751)) )
))
(declare-datatypes ((ListLongMap!4819 0))(
  ( (ListLongMap!4820 (toList!2425 List!5751)) )
))
(declare-fun lt!170695 () ListLongMap!4819)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12861)

(declare-fun minValue!472 () V!12861)

(declare-fun getCurrentListMap!1868 (array!21577 array!21575 (_ BitVec 32) (_ BitVec 32) V!12861 V!12861 (_ BitVec 32) Int) ListLongMap!4819)

(assert (=> b!372342 (= lt!170695 (getCurrentListMap!1868 lt!170700 lt!170697 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170696 () ListLongMap!4819)

(declare-fun lt!170698 () ListLongMap!4819)

(assert (=> b!372342 (and (= lt!170696 lt!170698) (= lt!170698 lt!170696))))

(declare-fun lt!170699 () ListLongMap!4819)

(declare-fun v!373 () V!12861)

(declare-fun +!771 (ListLongMap!4819 tuple2!5906) ListLongMap!4819)

(assert (=> b!372342 (= lt!170698 (+!771 lt!170699 (tuple2!5907 k0!778 v!373)))))

(declare-datatypes ((Unit!11448 0))(
  ( (Unit!11449) )
))
(declare-fun lt!170694 () Unit!11448)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!26 (array!21577 array!21575 (_ BitVec 32) (_ BitVec 32) V!12861 V!12861 (_ BitVec 32) (_ BitVec 64) V!12861 (_ BitVec 32) Int) Unit!11448)

(assert (=> b!372342 (= lt!170694 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!26 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!702 (array!21577 array!21575 (_ BitVec 32) (_ BitVec 32) V!12861 V!12861 (_ BitVec 32) Int) ListLongMap!4819)

(assert (=> b!372342 (= lt!170696 (getCurrentListMapNoExtraKeys!702 lt!170700 lt!170697 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372342 (= lt!170697 (array!21576 (store (arr!10256 _values!506) i!548 (ValueCellFull!4065 v!373)) (size!10608 _values!506)))))

(assert (=> b!372342 (= lt!170699 (getCurrentListMapNoExtraKeys!702 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372343 () Bool)

(assert (=> b!372343 (= e!227131 (and e!227130 mapRes!14790))))

(declare-fun condMapEmpty!14790 () Bool)

(declare-fun mapDefault!14790 () ValueCell!4065)

(assert (=> b!372343 (= condMapEmpty!14790 (= (arr!10256 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4065)) mapDefault!14790)))))

(declare-fun b!372344 () Bool)

(declare-fun res!209482 () Bool)

(assert (=> b!372344 (=> (not res!209482) (not e!227134))))

(assert (=> b!372344 (= res!209482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372345 () Bool)

(assert (=> b!372345 (= e!227132 tp_is_empty!8817)))

(declare-fun b!372346 () Bool)

(declare-fun res!209484 () Bool)

(assert (=> b!372346 (=> (not res!209484) (not e!227135))))

(assert (=> b!372346 (= res!209484 (arrayNoDuplicates!0 lt!170700 #b00000000000000000000000000000000 Nil!5747))))

(declare-fun b!372347 () Bool)

(declare-fun res!209485 () Bool)

(assert (=> b!372347 (=> (not res!209485) (not e!227134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372347 (= res!209485 (validKeyInArray!0 k0!778))))

(assert (= (and start!37042 res!209481) b!372339))

(assert (= (and b!372339 res!209480) b!372344))

(assert (= (and b!372344 res!209482) b!372338))

(assert (= (and b!372338 res!209489) b!372337))

(assert (= (and b!372337 res!209488) b!372347))

(assert (= (and b!372347 res!209485) b!372335))

(assert (= (and b!372335 res!209483) b!372340))

(assert (= (and b!372340 res!209487) b!372336))

(assert (= (and b!372336 res!209486) b!372346))

(assert (= (and b!372346 res!209484) b!372342))

(assert (= (and b!372343 condMapEmpty!14790) mapIsEmpty!14790))

(assert (= (and b!372343 (not condMapEmpty!14790)) mapNonEmpty!14790))

(get-info :version)

(assert (= (and mapNonEmpty!14790 ((_ is ValueCellFull!4065) mapValue!14790)) b!372345))

(assert (= (and b!372343 ((_ is ValueCellFull!4065) mapDefault!14790)) b!372341))

(assert (= start!37042 b!372343))

(declare-fun m!368211 () Bool)

(assert (=> b!372347 m!368211))

(declare-fun m!368213 () Bool)

(assert (=> b!372336 m!368213))

(declare-fun m!368215 () Bool)

(assert (=> b!372336 m!368215))

(declare-fun m!368217 () Bool)

(assert (=> b!372344 m!368217))

(declare-fun m!368219 () Bool)

(assert (=> mapNonEmpty!14790 m!368219))

(declare-fun m!368221 () Bool)

(assert (=> b!372335 m!368221))

(declare-fun m!368223 () Bool)

(assert (=> b!372342 m!368223))

(declare-fun m!368225 () Bool)

(assert (=> b!372342 m!368225))

(declare-fun m!368227 () Bool)

(assert (=> b!372342 m!368227))

(declare-fun m!368229 () Bool)

(assert (=> b!372342 m!368229))

(declare-fun m!368231 () Bool)

(assert (=> b!372342 m!368231))

(declare-fun m!368233 () Bool)

(assert (=> b!372342 m!368233))

(declare-fun m!368235 () Bool)

(assert (=> b!372340 m!368235))

(declare-fun m!368237 () Bool)

(assert (=> b!372338 m!368237))

(declare-fun m!368239 () Bool)

(assert (=> b!372346 m!368239))

(declare-fun m!368241 () Bool)

(assert (=> start!37042 m!368241))

(declare-fun m!368243 () Bool)

(assert (=> start!37042 m!368243))

(declare-fun m!368245 () Bool)

(assert (=> start!37042 m!368245))

(check-sat (not start!37042) (not b!372344) tp_is_empty!8817 (not b!372338) (not b!372346) (not b!372342) (not mapNonEmpty!14790) (not b!372340) b_and!15411 (not b_next!8169) (not b!372347) (not b!372336))
(check-sat b_and!15411 (not b_next!8169))
