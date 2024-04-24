; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37218 () Bool)

(assert start!37218)

(declare-fun b_free!8359 () Bool)

(declare-fun b_next!8359 () Bool)

(assert (=> start!37218 (= b_free!8359 (not b_next!8359))))

(declare-fun tp!29792 () Bool)

(declare-fun b_and!15615 () Bool)

(assert (=> start!37218 (= tp!29792 b_and!15615)))

(declare-fun b!376472 () Bool)

(declare-fun res!212817 () Bool)

(declare-fun e!229273 () Bool)

(assert (=> b!376472 (=> (not res!212817) (not e!229273))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21932 0))(
  ( (array!21933 (arr!10434 (Array (_ BitVec 32) (_ BitVec 64))) (size!10786 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21932)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13115 0))(
  ( (V!13116 (val!4548 Int)) )
))
(declare-datatypes ((ValueCell!4160 0))(
  ( (ValueCellFull!4160 (v!6746 V!13115)) (EmptyCell!4160) )
))
(declare-datatypes ((array!21934 0))(
  ( (array!21935 (arr!10435 (Array (_ BitVec 32) ValueCell!4160)) (size!10787 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21934)

(assert (=> b!376472 (= res!212817 (and (= (size!10787 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10786 _keys!658) (size!10787 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!212813 () Bool)

(assert (=> start!37218 (=> (not res!212813) (not e!229273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37218 (= res!212813 (validMask!0 mask!970))))

(assert (=> start!37218 e!229273))

(declare-fun e!229278 () Bool)

(declare-fun array_inv!7744 (array!21934) Bool)

(assert (=> start!37218 (and (array_inv!7744 _values!506) e!229278)))

(assert (=> start!37218 tp!29792))

(assert (=> start!37218 true))

(declare-fun tp_is_empty!9007 () Bool)

(assert (=> start!37218 tp_is_empty!9007))

(declare-fun array_inv!7745 (array!21932) Bool)

(assert (=> start!37218 (array_inv!7745 _keys!658)))

(declare-fun b!376473 () Bool)

(declare-fun res!212815 () Bool)

(declare-fun e!229275 () Bool)

(assert (=> b!376473 (=> (not res!212815) (not e!229275))))

(declare-fun lt!174727 () array!21932)

(declare-datatypes ((List!5808 0))(
  ( (Nil!5805) (Cons!5804 (h!6660 (_ BitVec 64)) (t!10950 List!5808)) )
))
(declare-fun arrayNoDuplicates!0 (array!21932 (_ BitVec 32) List!5808) Bool)

(assert (=> b!376473 (= res!212815 (arrayNoDuplicates!0 lt!174727 #b00000000000000000000000000000000 Nil!5805))))

(declare-fun b!376474 () Bool)

(assert (=> b!376474 (= e!229273 e!229275)))

(declare-fun res!212809 () Bool)

(assert (=> b!376474 (=> (not res!212809) (not e!229275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21932 (_ BitVec 32)) Bool)

(assert (=> b!376474 (= res!212809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174727 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376474 (= lt!174727 (array!21933 (store (arr!10434 _keys!658) i!548 k0!778) (size!10786 _keys!658)))))

(declare-fun b!376475 () Bool)

(declare-fun e!229277 () Bool)

(assert (=> b!376475 (= e!229277 tp_is_empty!9007)))

(declare-fun b!376476 () Bool)

(declare-fun e!229272 () Bool)

(assert (=> b!376476 (= e!229272 tp_is_empty!9007)))

(declare-fun b!376477 () Bool)

(declare-fun res!212808 () Bool)

(assert (=> b!376477 (=> (not res!212808) (not e!229273))))

(assert (=> b!376477 (= res!212808 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5805))))

(declare-fun b!376478 () Bool)

(declare-fun e!229271 () Bool)

(declare-fun e!229274 () Bool)

(assert (=> b!376478 (= e!229271 e!229274)))

(declare-fun res!212819 () Bool)

(assert (=> b!376478 (=> res!212819 e!229274)))

(assert (=> b!376478 (= res!212819 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5966 0))(
  ( (tuple2!5967 (_1!2994 (_ BitVec 64)) (_2!2994 V!13115)) )
))
(declare-datatypes ((List!5809 0))(
  ( (Nil!5806) (Cons!5805 (h!6661 tuple2!5966) (t!10951 List!5809)) )
))
(declare-datatypes ((ListLongMap!4881 0))(
  ( (ListLongMap!4882 (toList!2456 List!5809)) )
))
(declare-fun lt!174729 () ListLongMap!4881)

(declare-fun lt!174718 () ListLongMap!4881)

(assert (=> b!376478 (= lt!174729 lt!174718)))

(declare-fun lt!174721 () ListLongMap!4881)

(declare-fun lt!174719 () tuple2!5966)

(declare-fun +!852 (ListLongMap!4881 tuple2!5966) ListLongMap!4881)

(assert (=> b!376478 (= lt!174718 (+!852 lt!174721 lt!174719))))

(declare-fun lt!174723 () ListLongMap!4881)

(declare-fun lt!174725 () ListLongMap!4881)

(assert (=> b!376478 (= lt!174723 lt!174725)))

(declare-fun lt!174728 () ListLongMap!4881)

(assert (=> b!376478 (= lt!174725 (+!852 lt!174728 lt!174719))))

(declare-fun lt!174722 () ListLongMap!4881)

(assert (=> b!376478 (= lt!174729 (+!852 lt!174722 lt!174719))))

(declare-fun zeroValue!472 () V!13115)

(assert (=> b!376478 (= lt!174719 (tuple2!5967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376479 () Bool)

(declare-fun res!212811 () Bool)

(assert (=> b!376479 (=> (not res!212811) (not e!229273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376479 (= res!212811 (validKeyInArray!0 k0!778))))

(declare-fun b!376480 () Bool)

(assert (=> b!376480 (= e!229274 true)))

(declare-fun lt!174724 () tuple2!5966)

(assert (=> b!376480 (= lt!174718 (+!852 lt!174725 lt!174724))))

(declare-fun v!373 () V!13115)

(declare-datatypes ((Unit!11591 0))(
  ( (Unit!11592) )
))
(declare-fun lt!174726 () Unit!11591)

(declare-fun addCommutativeForDiffKeys!273 (ListLongMap!4881 (_ BitVec 64) V!13115 (_ BitVec 64) V!13115) Unit!11591)

(assert (=> b!376480 (= lt!174726 (addCommutativeForDiffKeys!273 lt!174728 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376481 () Bool)

(declare-fun res!212818 () Bool)

(assert (=> b!376481 (=> (not res!212818) (not e!229273))))

(assert (=> b!376481 (= res!212818 (or (= (select (arr!10434 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10434 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15075 () Bool)

(declare-fun mapRes!15075 () Bool)

(declare-fun tp!29793 () Bool)

(assert (=> mapNonEmpty!15075 (= mapRes!15075 (and tp!29793 e!229272))))

(declare-fun mapKey!15075 () (_ BitVec 32))

(declare-fun mapValue!15075 () ValueCell!4160)

(declare-fun mapRest!15075 () (Array (_ BitVec 32) ValueCell!4160))

(assert (=> mapNonEmpty!15075 (= (arr!10435 _values!506) (store mapRest!15075 mapKey!15075 mapValue!15075))))

(declare-fun b!376482 () Bool)

(declare-fun res!212812 () Bool)

(assert (=> b!376482 (=> (not res!212812) (not e!229273))))

(assert (=> b!376482 (= res!212812 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10786 _keys!658))))))

(declare-fun mapIsEmpty!15075 () Bool)

(assert (=> mapIsEmpty!15075 mapRes!15075))

(declare-fun b!376483 () Bool)

(assert (=> b!376483 (= e!229275 (not e!229271))))

(declare-fun res!212814 () Bool)

(assert (=> b!376483 (=> res!212814 e!229271)))

(assert (=> b!376483 (= res!212814 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13115)

(declare-fun getCurrentListMap!1906 (array!21932 array!21934 (_ BitVec 32) (_ BitVec 32) V!13115 V!13115 (_ BitVec 32) Int) ListLongMap!4881)

(assert (=> b!376483 (= lt!174723 (getCurrentListMap!1906 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174730 () array!21934)

(assert (=> b!376483 (= lt!174729 (getCurrentListMap!1906 lt!174727 lt!174730 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376483 (and (= lt!174722 lt!174721) (= lt!174721 lt!174722))))

(assert (=> b!376483 (= lt!174721 (+!852 lt!174728 lt!174724))))

(assert (=> b!376483 (= lt!174724 (tuple2!5967 k0!778 v!373))))

(declare-fun lt!174720 () Unit!11591)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!93 (array!21932 array!21934 (_ BitVec 32) (_ BitVec 32) V!13115 V!13115 (_ BitVec 32) (_ BitVec 64) V!13115 (_ BitVec 32) Int) Unit!11591)

(assert (=> b!376483 (= lt!174720 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!93 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!753 (array!21932 array!21934 (_ BitVec 32) (_ BitVec 32) V!13115 V!13115 (_ BitVec 32) Int) ListLongMap!4881)

(assert (=> b!376483 (= lt!174722 (getCurrentListMapNoExtraKeys!753 lt!174727 lt!174730 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376483 (= lt!174730 (array!21935 (store (arr!10435 _values!506) i!548 (ValueCellFull!4160 v!373)) (size!10787 _values!506)))))

(assert (=> b!376483 (= lt!174728 (getCurrentListMapNoExtraKeys!753 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376484 () Bool)

(declare-fun res!212810 () Bool)

(assert (=> b!376484 (=> (not res!212810) (not e!229273))))

(assert (=> b!376484 (= res!212810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376485 () Bool)

(declare-fun res!212816 () Bool)

(assert (=> b!376485 (=> (not res!212816) (not e!229273))))

(declare-fun arrayContainsKey!0 (array!21932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376485 (= res!212816 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376486 () Bool)

(assert (=> b!376486 (= e!229278 (and e!229277 mapRes!15075))))

(declare-fun condMapEmpty!15075 () Bool)

(declare-fun mapDefault!15075 () ValueCell!4160)

(assert (=> b!376486 (= condMapEmpty!15075 (= (arr!10435 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4160)) mapDefault!15075)))))

(assert (= (and start!37218 res!212813) b!376472))

(assert (= (and b!376472 res!212817) b!376484))

(assert (= (and b!376484 res!212810) b!376477))

(assert (= (and b!376477 res!212808) b!376482))

(assert (= (and b!376482 res!212812) b!376479))

(assert (= (and b!376479 res!212811) b!376481))

(assert (= (and b!376481 res!212818) b!376485))

(assert (= (and b!376485 res!212816) b!376474))

(assert (= (and b!376474 res!212809) b!376473))

(assert (= (and b!376473 res!212815) b!376483))

(assert (= (and b!376483 (not res!212814)) b!376478))

(assert (= (and b!376478 (not res!212819)) b!376480))

(assert (= (and b!376486 condMapEmpty!15075) mapIsEmpty!15075))

(assert (= (and b!376486 (not condMapEmpty!15075)) mapNonEmpty!15075))

(get-info :version)

(assert (= (and mapNonEmpty!15075 ((_ is ValueCellFull!4160) mapValue!15075)) b!376476))

(assert (= (and b!376486 ((_ is ValueCellFull!4160) mapDefault!15075)) b!376475))

(assert (= start!37218 b!376486))

(declare-fun m!373457 () Bool)

(assert (=> b!376478 m!373457))

(declare-fun m!373459 () Bool)

(assert (=> b!376478 m!373459))

(declare-fun m!373461 () Bool)

(assert (=> b!376478 m!373461))

(declare-fun m!373463 () Bool)

(assert (=> b!376477 m!373463))

(declare-fun m!373465 () Bool)

(assert (=> start!37218 m!373465))

(declare-fun m!373467 () Bool)

(assert (=> start!37218 m!373467))

(declare-fun m!373469 () Bool)

(assert (=> start!37218 m!373469))

(declare-fun m!373471 () Bool)

(assert (=> b!376474 m!373471))

(declare-fun m!373473 () Bool)

(assert (=> b!376474 m!373473))

(declare-fun m!373475 () Bool)

(assert (=> b!376480 m!373475))

(declare-fun m!373477 () Bool)

(assert (=> b!376480 m!373477))

(declare-fun m!373479 () Bool)

(assert (=> b!376483 m!373479))

(declare-fun m!373481 () Bool)

(assert (=> b!376483 m!373481))

(declare-fun m!373483 () Bool)

(assert (=> b!376483 m!373483))

(declare-fun m!373485 () Bool)

(assert (=> b!376483 m!373485))

(declare-fun m!373487 () Bool)

(assert (=> b!376483 m!373487))

(declare-fun m!373489 () Bool)

(assert (=> b!376483 m!373489))

(declare-fun m!373491 () Bool)

(assert (=> b!376483 m!373491))

(declare-fun m!373493 () Bool)

(assert (=> b!376485 m!373493))

(declare-fun m!373495 () Bool)

(assert (=> b!376473 m!373495))

(declare-fun m!373497 () Bool)

(assert (=> mapNonEmpty!15075 m!373497))

(declare-fun m!373499 () Bool)

(assert (=> b!376479 m!373499))

(declare-fun m!373501 () Bool)

(assert (=> b!376481 m!373501))

(declare-fun m!373503 () Bool)

(assert (=> b!376484 m!373503))

(check-sat (not b!376479) (not mapNonEmpty!15075) (not b!376474) (not b!376478) tp_is_empty!9007 (not b!376485) (not b!376483) (not b!376473) (not b!376480) (not b_next!8359) b_and!15615 (not start!37218) (not b!376477) (not b!376484))
(check-sat b_and!15615 (not b_next!8359))
