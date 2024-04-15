; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37176 () Bool)

(assert start!37176)

(declare-fun b_free!8317 () Bool)

(declare-fun b_next!8317 () Bool)

(assert (=> start!37176 (= b_free!8317 (not b_next!8317))))

(declare-fun tp!29667 () Bool)

(declare-fun b_and!15533 () Bool)

(assert (=> start!37176 (= tp!29667 b_and!15533)))

(declare-fun b!375296 () Bool)

(declare-fun res!211922 () Bool)

(declare-fun e!228629 () Bool)

(assert (=> b!375296 (=> (not res!211922) (not e!228629))))

(declare-datatypes ((array!21847 0))(
  ( (array!21848 (arr!10392 (Array (_ BitVec 32) (_ BitVec 64))) (size!10745 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21847)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375296 (= res!211922 (or (= (select (arr!10392 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10392 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375297 () Bool)

(declare-fun res!211917 () Bool)

(assert (=> b!375297 (=> (not res!211917) (not e!228629))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375297 (= res!211917 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375298 () Bool)

(declare-fun res!211923 () Bool)

(assert (=> b!375298 (=> (not res!211923) (not e!228629))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13059 0))(
  ( (V!13060 (val!4527 Int)) )
))
(declare-datatypes ((ValueCell!4139 0))(
  ( (ValueCellFull!4139 (v!6718 V!13059)) (EmptyCell!4139) )
))
(declare-datatypes ((array!21849 0))(
  ( (array!21850 (arr!10393 (Array (_ BitVec 32) ValueCell!4139)) (size!10746 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21849)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!375298 (= res!211923 (and (= (size!10746 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10745 _keys!658) (size!10746 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375300 () Bool)

(declare-fun e!228632 () Bool)

(declare-fun tp_is_empty!8965 () Bool)

(assert (=> b!375300 (= e!228632 tp_is_empty!8965)))

(declare-fun b!375301 () Bool)

(declare-fun res!211925 () Bool)

(assert (=> b!375301 (=> (not res!211925) (not e!228629))))

(declare-datatypes ((List!5834 0))(
  ( (Nil!5831) (Cons!5830 (h!6686 (_ BitVec 64)) (t!10975 List!5834)) )
))
(declare-fun arrayNoDuplicates!0 (array!21847 (_ BitVec 32) List!5834) Bool)

(assert (=> b!375301 (= res!211925 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5831))))

(declare-fun b!375302 () Bool)

(declare-fun e!228625 () Bool)

(declare-fun mapRes!15012 () Bool)

(assert (=> b!375302 (= e!228625 (and e!228632 mapRes!15012))))

(declare-fun condMapEmpty!15012 () Bool)

(declare-fun mapDefault!15012 () ValueCell!4139)

(assert (=> b!375302 (= condMapEmpty!15012 (= (arr!10393 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4139)) mapDefault!15012)))))

(declare-fun b!375303 () Bool)

(declare-fun e!228630 () Bool)

(assert (=> b!375303 (= e!228630 (bvsle #b00000000000000000000000000000000 (size!10745 _keys!658)))))

(declare-datatypes ((tuple2!6002 0))(
  ( (tuple2!6003 (_1!3012 (_ BitVec 64)) (_2!3012 V!13059)) )
))
(declare-datatypes ((List!5835 0))(
  ( (Nil!5832) (Cons!5831 (h!6687 tuple2!6002) (t!10976 List!5835)) )
))
(declare-datatypes ((ListLongMap!4905 0))(
  ( (ListLongMap!4906 (toList!2468 List!5835)) )
))
(declare-fun lt!173667 () ListLongMap!4905)

(declare-fun lt!173656 () tuple2!6002)

(declare-fun lt!173666 () tuple2!6002)

(declare-fun lt!173668 () ListLongMap!4905)

(declare-fun +!836 (ListLongMap!4905 tuple2!6002) ListLongMap!4905)

(assert (=> b!375303 (= (+!836 lt!173668 lt!173666) (+!836 lt!173667 lt!173656))))

(declare-fun v!373 () V!13059)

(declare-fun lt!173662 () ListLongMap!4905)

(declare-datatypes ((Unit!11544 0))(
  ( (Unit!11545) )
))
(declare-fun lt!173663 () Unit!11544)

(declare-fun minValue!472 () V!13059)

(declare-fun addCommutativeForDiffKeys!251 (ListLongMap!4905 (_ BitVec 64) V!13059 (_ BitVec 64) V!13059) Unit!11544)

(assert (=> b!375303 (= lt!173663 (addCommutativeForDiffKeys!251 lt!173662 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15012 () Bool)

(assert (=> mapIsEmpty!15012 mapRes!15012))

(declare-fun b!375304 () Bool)

(declare-fun e!228631 () Bool)

(assert (=> b!375304 (= e!228631 e!228630)))

(declare-fun res!211924 () Bool)

(assert (=> b!375304 (=> res!211924 e!228630)))

(assert (=> b!375304 (= res!211924 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173655 () ListLongMap!4905)

(assert (=> b!375304 (= lt!173655 lt!173668)))

(assert (=> b!375304 (= lt!173668 (+!836 lt!173662 lt!173656))))

(declare-fun lt!173665 () Unit!11544)

(declare-fun lt!173659 () ListLongMap!4905)

(declare-fun zeroValue!472 () V!13059)

(assert (=> b!375304 (= lt!173665 (addCommutativeForDiffKeys!251 lt!173659 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173664 () ListLongMap!4905)

(assert (=> b!375304 (= lt!173664 (+!836 lt!173655 lt!173666))))

(declare-fun lt!173669 () ListLongMap!4905)

(declare-fun lt!173654 () tuple2!6002)

(assert (=> b!375304 (= lt!173655 (+!836 lt!173669 lt!173654))))

(declare-fun lt!173660 () ListLongMap!4905)

(assert (=> b!375304 (= lt!173660 lt!173667)))

(assert (=> b!375304 (= lt!173667 (+!836 lt!173662 lt!173666))))

(assert (=> b!375304 (= lt!173662 (+!836 lt!173659 lt!173654))))

(declare-fun lt!173670 () ListLongMap!4905)

(assert (=> b!375304 (= lt!173664 (+!836 (+!836 lt!173670 lt!173654) lt!173666))))

(assert (=> b!375304 (= lt!173666 (tuple2!6003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375304 (= lt!173654 (tuple2!6003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375305 () Bool)

(declare-fun res!211928 () Bool)

(assert (=> b!375305 (=> (not res!211928) (not e!228629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21847 (_ BitVec 32)) Bool)

(assert (=> b!375305 (= res!211928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!211927 () Bool)

(assert (=> start!37176 (=> (not res!211927) (not e!228629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37176 (= res!211927 (validMask!0 mask!970))))

(assert (=> start!37176 e!228629))

(declare-fun array_inv!7668 (array!21849) Bool)

(assert (=> start!37176 (and (array_inv!7668 _values!506) e!228625)))

(assert (=> start!37176 tp!29667))

(assert (=> start!37176 true))

(assert (=> start!37176 tp_is_empty!8965))

(declare-fun array_inv!7669 (array!21847) Bool)

(assert (=> start!37176 (array_inv!7669 _keys!658)))

(declare-fun b!375299 () Bool)

(declare-fun res!211920 () Bool)

(declare-fun e!228626 () Bool)

(assert (=> b!375299 (=> (not res!211920) (not e!228626))))

(declare-fun lt!173658 () array!21847)

(assert (=> b!375299 (= res!211920 (arrayNoDuplicates!0 lt!173658 #b00000000000000000000000000000000 Nil!5831))))

(declare-fun b!375306 () Bool)

(declare-fun res!211921 () Bool)

(assert (=> b!375306 (=> (not res!211921) (not e!228629))))

(assert (=> b!375306 (= res!211921 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10745 _keys!658))))))

(declare-fun mapNonEmpty!15012 () Bool)

(declare-fun tp!29666 () Bool)

(declare-fun e!228628 () Bool)

(assert (=> mapNonEmpty!15012 (= mapRes!15012 (and tp!29666 e!228628))))

(declare-fun mapKey!15012 () (_ BitVec 32))

(declare-fun mapValue!15012 () ValueCell!4139)

(declare-fun mapRest!15012 () (Array (_ BitVec 32) ValueCell!4139))

(assert (=> mapNonEmpty!15012 (= (arr!10393 _values!506) (store mapRest!15012 mapKey!15012 mapValue!15012))))

(declare-fun b!375307 () Bool)

(assert (=> b!375307 (= e!228628 tp_is_empty!8965)))

(declare-fun b!375308 () Bool)

(declare-fun res!211919 () Bool)

(assert (=> b!375308 (=> (not res!211919) (not e!228629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375308 (= res!211919 (validKeyInArray!0 k0!778))))

(declare-fun b!375309 () Bool)

(assert (=> b!375309 (= e!228626 (not e!228631))))

(declare-fun res!211918 () Bool)

(assert (=> b!375309 (=> res!211918 e!228631)))

(assert (=> b!375309 (= res!211918 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1884 (array!21847 array!21849 (_ BitVec 32) (_ BitVec 32) V!13059 V!13059 (_ BitVec 32) Int) ListLongMap!4905)

(assert (=> b!375309 (= lt!173660 (getCurrentListMap!1884 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173661 () array!21849)

(assert (=> b!375309 (= lt!173664 (getCurrentListMap!1884 lt!173658 lt!173661 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375309 (and (= lt!173670 lt!173669) (= lt!173669 lt!173670))))

(assert (=> b!375309 (= lt!173669 (+!836 lt!173659 lt!173656))))

(assert (=> b!375309 (= lt!173656 (tuple2!6003 k0!778 v!373))))

(declare-fun lt!173657 () Unit!11544)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!77 (array!21847 array!21849 (_ BitVec 32) (_ BitVec 32) V!13059 V!13059 (_ BitVec 32) (_ BitVec 64) V!13059 (_ BitVec 32) Int) Unit!11544)

(assert (=> b!375309 (= lt!173657 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!77 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!749 (array!21847 array!21849 (_ BitVec 32) (_ BitVec 32) V!13059 V!13059 (_ BitVec 32) Int) ListLongMap!4905)

(assert (=> b!375309 (= lt!173670 (getCurrentListMapNoExtraKeys!749 lt!173658 lt!173661 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375309 (= lt!173661 (array!21850 (store (arr!10393 _values!506) i!548 (ValueCellFull!4139 v!373)) (size!10746 _values!506)))))

(assert (=> b!375309 (= lt!173659 (getCurrentListMapNoExtraKeys!749 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375310 () Bool)

(assert (=> b!375310 (= e!228629 e!228626)))

(declare-fun res!211926 () Bool)

(assert (=> b!375310 (=> (not res!211926) (not e!228626))))

(assert (=> b!375310 (= res!211926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173658 mask!970))))

(assert (=> b!375310 (= lt!173658 (array!21848 (store (arr!10392 _keys!658) i!548 k0!778) (size!10745 _keys!658)))))

(assert (= (and start!37176 res!211927) b!375298))

(assert (= (and b!375298 res!211923) b!375305))

(assert (= (and b!375305 res!211928) b!375301))

(assert (= (and b!375301 res!211925) b!375306))

(assert (= (and b!375306 res!211921) b!375308))

(assert (= (and b!375308 res!211919) b!375296))

(assert (= (and b!375296 res!211922) b!375297))

(assert (= (and b!375297 res!211917) b!375310))

(assert (= (and b!375310 res!211926) b!375299))

(assert (= (and b!375299 res!211920) b!375309))

(assert (= (and b!375309 (not res!211918)) b!375304))

(assert (= (and b!375304 (not res!211924)) b!375303))

(assert (= (and b!375302 condMapEmpty!15012) mapIsEmpty!15012))

(assert (= (and b!375302 (not condMapEmpty!15012)) mapNonEmpty!15012))

(get-info :version)

(assert (= (and mapNonEmpty!15012 ((_ is ValueCellFull!4139) mapValue!15012)) b!375307))

(assert (= (and b!375302 ((_ is ValueCellFull!4139) mapDefault!15012)) b!375300))

(assert (= start!37176 b!375302))

(declare-fun m!371471 () Bool)

(assert (=> b!375304 m!371471))

(declare-fun m!371473 () Bool)

(assert (=> b!375304 m!371473))

(declare-fun m!371475 () Bool)

(assert (=> b!375304 m!371475))

(declare-fun m!371477 () Bool)

(assert (=> b!375304 m!371477))

(declare-fun m!371479 () Bool)

(assert (=> b!375304 m!371479))

(declare-fun m!371481 () Bool)

(assert (=> b!375304 m!371481))

(declare-fun m!371483 () Bool)

(assert (=> b!375304 m!371483))

(declare-fun m!371485 () Bool)

(assert (=> b!375304 m!371485))

(assert (=> b!375304 m!371473))

(declare-fun m!371487 () Bool)

(assert (=> b!375310 m!371487))

(declare-fun m!371489 () Bool)

(assert (=> b!375310 m!371489))

(declare-fun m!371491 () Bool)

(assert (=> b!375296 m!371491))

(declare-fun m!371493 () Bool)

(assert (=> start!37176 m!371493))

(declare-fun m!371495 () Bool)

(assert (=> start!37176 m!371495))

(declare-fun m!371497 () Bool)

(assert (=> start!37176 m!371497))

(declare-fun m!371499 () Bool)

(assert (=> b!375308 m!371499))

(declare-fun m!371501 () Bool)

(assert (=> b!375309 m!371501))

(declare-fun m!371503 () Bool)

(assert (=> b!375309 m!371503))

(declare-fun m!371505 () Bool)

(assert (=> b!375309 m!371505))

(declare-fun m!371507 () Bool)

(assert (=> b!375309 m!371507))

(declare-fun m!371509 () Bool)

(assert (=> b!375309 m!371509))

(declare-fun m!371511 () Bool)

(assert (=> b!375309 m!371511))

(declare-fun m!371513 () Bool)

(assert (=> b!375309 m!371513))

(declare-fun m!371515 () Bool)

(assert (=> b!375303 m!371515))

(declare-fun m!371517 () Bool)

(assert (=> b!375303 m!371517))

(declare-fun m!371519 () Bool)

(assert (=> b!375303 m!371519))

(declare-fun m!371521 () Bool)

(assert (=> b!375299 m!371521))

(declare-fun m!371523 () Bool)

(assert (=> b!375301 m!371523))

(declare-fun m!371525 () Bool)

(assert (=> mapNonEmpty!15012 m!371525))

(declare-fun m!371527 () Bool)

(assert (=> b!375305 m!371527))

(declare-fun m!371529 () Bool)

(assert (=> b!375297 m!371529))

(check-sat (not b!375301) b_and!15533 (not b!375310) (not b!375303) (not b_next!8317) tp_is_empty!8965 (not start!37176) (not b!375308) (not b!375297) (not b!375305) (not mapNonEmpty!15012) (not b!375304) (not b!375309) (not b!375299))
(check-sat b_and!15533 (not b_next!8317))
