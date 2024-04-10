; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37234 () Bool)

(assert start!37234)

(declare-fun b_free!8361 () Bool)

(declare-fun b_next!8361 () Bool)

(assert (=> start!37234 (= b_free!8361 (not b_next!8361))))

(declare-fun tp!29798 () Bool)

(declare-fun b_and!15603 () Bool)

(assert (=> start!37234 (= tp!29798 b_and!15603)))

(declare-fun b!376566 () Bool)

(declare-fun res!212855 () Bool)

(declare-fun e!229327 () Bool)

(assert (=> b!376566 (=> (not res!212855) (not e!229327))))

(declare-datatypes ((array!21947 0))(
  ( (array!21948 (arr!10442 (Array (_ BitVec 32) (_ BitVec 64))) (size!10794 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21947)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376566 (= res!212855 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15078 () Bool)

(declare-fun mapRes!15078 () Bool)

(declare-fun tp!29799 () Bool)

(declare-fun e!229332 () Bool)

(assert (=> mapNonEmpty!15078 (= mapRes!15078 (and tp!29799 e!229332))))

(declare-datatypes ((V!13117 0))(
  ( (V!13118 (val!4549 Int)) )
))
(declare-datatypes ((ValueCell!4161 0))(
  ( (ValueCellFull!4161 (v!6746 V!13117)) (EmptyCell!4161) )
))
(declare-datatypes ((array!21949 0))(
  ( (array!21950 (arr!10443 (Array (_ BitVec 32) ValueCell!4161)) (size!10795 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21949)

(declare-fun mapValue!15078 () ValueCell!4161)

(declare-fun mapKey!15078 () (_ BitVec 32))

(declare-fun mapRest!15078 () (Array (_ BitVec 32) ValueCell!4161))

(assert (=> mapNonEmpty!15078 (= (arr!10443 _values!506) (store mapRest!15078 mapKey!15078 mapValue!15078))))

(declare-fun b!376567 () Bool)

(declare-fun res!212851 () Bool)

(assert (=> b!376567 (=> (not res!212851) (not e!229327))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!376567 (= res!212851 (and (= (size!10795 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10794 _keys!658) (size!10795 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376568 () Bool)

(declare-fun res!212850 () Bool)

(assert (=> b!376568 (=> (not res!212850) (not e!229327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376568 (= res!212850 (validKeyInArray!0 k0!778))))

(declare-fun b!376569 () Bool)

(declare-fun res!212853 () Bool)

(assert (=> b!376569 (=> (not res!212853) (not e!229327))))

(declare-datatypes ((List!5898 0))(
  ( (Nil!5895) (Cons!5894 (h!6750 (_ BitVec 64)) (t!11048 List!5898)) )
))
(declare-fun arrayNoDuplicates!0 (array!21947 (_ BitVec 32) List!5898) Bool)

(assert (=> b!376569 (= res!212853 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5895))))

(declare-fun b!376570 () Bool)

(declare-fun res!212852 () Bool)

(assert (=> b!376570 (=> (not res!212852) (not e!229327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21947 (_ BitVec 32)) Bool)

(assert (=> b!376570 (= res!212852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376571 () Bool)

(declare-fun tp_is_empty!9009 () Bool)

(assert (=> b!376571 (= e!229332 tp_is_empty!9009)))

(declare-fun b!376572 () Bool)

(declare-fun e!229331 () Bool)

(assert (=> b!376572 (= e!229331 true)))

(declare-datatypes ((tuple2!6056 0))(
  ( (tuple2!6057 (_1!3039 (_ BitVec 64)) (_2!3039 V!13117)) )
))
(declare-datatypes ((List!5899 0))(
  ( (Nil!5896) (Cons!5895 (h!6751 tuple2!6056) (t!11049 List!5899)) )
))
(declare-datatypes ((ListLongMap!4969 0))(
  ( (ListLongMap!4970 (toList!2500 List!5899)) )
))
(declare-fun lt!174739 () ListLongMap!4969)

(declare-fun lt!174749 () ListLongMap!4969)

(declare-fun lt!174744 () tuple2!6056)

(declare-fun +!846 (ListLongMap!4969 tuple2!6056) ListLongMap!4969)

(assert (=> b!376572 (= lt!174739 (+!846 lt!174749 lt!174744))))

(declare-fun v!373 () V!13117)

(declare-datatypes ((Unit!11598 0))(
  ( (Unit!11599) )
))
(declare-fun lt!174748 () Unit!11598)

(declare-fun zeroValue!472 () V!13117)

(declare-fun lt!174747 () ListLongMap!4969)

(declare-fun addCommutativeForDiffKeys!260 (ListLongMap!4969 (_ BitVec 64) V!13117 (_ BitVec 64) V!13117) Unit!11598)

(assert (=> b!376572 (= lt!174748 (addCommutativeForDiffKeys!260 lt!174747 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376573 () Bool)

(declare-fun e!229333 () Bool)

(assert (=> b!376573 (= e!229333 e!229331)))

(declare-fun res!212856 () Bool)

(assert (=> b!376573 (=> res!212856 e!229331)))

(assert (=> b!376573 (= res!212856 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174742 () ListLongMap!4969)

(assert (=> b!376573 (= lt!174742 lt!174739)))

(declare-fun lt!174740 () ListLongMap!4969)

(declare-fun lt!174746 () tuple2!6056)

(assert (=> b!376573 (= lt!174739 (+!846 lt!174740 lt!174746))))

(declare-fun lt!174745 () ListLongMap!4969)

(assert (=> b!376573 (= lt!174745 lt!174749)))

(assert (=> b!376573 (= lt!174749 (+!846 lt!174747 lt!174746))))

(declare-fun lt!174738 () ListLongMap!4969)

(assert (=> b!376573 (= lt!174742 (+!846 lt!174738 lt!174746))))

(assert (=> b!376573 (= lt!174746 (tuple2!6057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!212854 () Bool)

(assert (=> start!37234 (=> (not res!212854) (not e!229327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37234 (= res!212854 (validMask!0 mask!970))))

(assert (=> start!37234 e!229327))

(declare-fun e!229329 () Bool)

(declare-fun array_inv!7696 (array!21949) Bool)

(assert (=> start!37234 (and (array_inv!7696 _values!506) e!229329)))

(assert (=> start!37234 tp!29798))

(assert (=> start!37234 true))

(assert (=> start!37234 tp_is_empty!9009))

(declare-fun array_inv!7697 (array!21947) Bool)

(assert (=> start!37234 (array_inv!7697 _keys!658)))

(declare-fun b!376574 () Bool)

(declare-fun res!212848 () Bool)

(assert (=> b!376574 (=> (not res!212848) (not e!229327))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376574 (= res!212848 (or (= (select (arr!10442 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10442 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376575 () Bool)

(declare-fun e!229328 () Bool)

(assert (=> b!376575 (= e!229327 e!229328)))

(declare-fun res!212849 () Bool)

(assert (=> b!376575 (=> (not res!212849) (not e!229328))))

(declare-fun lt!174750 () array!21947)

(assert (=> b!376575 (= res!212849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174750 mask!970))))

(assert (=> b!376575 (= lt!174750 (array!21948 (store (arr!10442 _keys!658) i!548 k0!778) (size!10794 _keys!658)))))

(declare-fun b!376576 () Bool)

(assert (=> b!376576 (= e!229328 (not e!229333))))

(declare-fun res!212857 () Bool)

(assert (=> b!376576 (=> res!212857 e!229333)))

(assert (=> b!376576 (= res!212857 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13117)

(declare-fun getCurrentListMap!1934 (array!21947 array!21949 (_ BitVec 32) (_ BitVec 32) V!13117 V!13117 (_ BitVec 32) Int) ListLongMap!4969)

(assert (=> b!376576 (= lt!174745 (getCurrentListMap!1934 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174743 () array!21949)

(assert (=> b!376576 (= lt!174742 (getCurrentListMap!1934 lt!174750 lt!174743 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376576 (and (= lt!174738 lt!174740) (= lt!174740 lt!174738))))

(assert (=> b!376576 (= lt!174740 (+!846 lt!174747 lt!174744))))

(assert (=> b!376576 (= lt!174744 (tuple2!6057 k0!778 v!373))))

(declare-fun lt!174741 () Unit!11598)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!92 (array!21947 array!21949 (_ BitVec 32) (_ BitVec 32) V!13117 V!13117 (_ BitVec 32) (_ BitVec 64) V!13117 (_ BitVec 32) Int) Unit!11598)

(assert (=> b!376576 (= lt!174741 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!92 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!768 (array!21947 array!21949 (_ BitVec 32) (_ BitVec 32) V!13117 V!13117 (_ BitVec 32) Int) ListLongMap!4969)

(assert (=> b!376576 (= lt!174738 (getCurrentListMapNoExtraKeys!768 lt!174750 lt!174743 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376576 (= lt!174743 (array!21950 (store (arr!10443 _values!506) i!548 (ValueCellFull!4161 v!373)) (size!10795 _values!506)))))

(assert (=> b!376576 (= lt!174747 (getCurrentListMapNoExtraKeys!768 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15078 () Bool)

(assert (=> mapIsEmpty!15078 mapRes!15078))

(declare-fun b!376577 () Bool)

(declare-fun res!212858 () Bool)

(assert (=> b!376577 (=> (not res!212858) (not e!229327))))

(assert (=> b!376577 (= res!212858 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10794 _keys!658))))))

(declare-fun b!376578 () Bool)

(declare-fun res!212847 () Bool)

(assert (=> b!376578 (=> (not res!212847) (not e!229328))))

(assert (=> b!376578 (= res!212847 (arrayNoDuplicates!0 lt!174750 #b00000000000000000000000000000000 Nil!5895))))

(declare-fun b!376579 () Bool)

(declare-fun e!229334 () Bool)

(assert (=> b!376579 (= e!229329 (and e!229334 mapRes!15078))))

(declare-fun condMapEmpty!15078 () Bool)

(declare-fun mapDefault!15078 () ValueCell!4161)

(assert (=> b!376579 (= condMapEmpty!15078 (= (arr!10443 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4161)) mapDefault!15078)))))

(declare-fun b!376580 () Bool)

(assert (=> b!376580 (= e!229334 tp_is_empty!9009)))

(assert (= (and start!37234 res!212854) b!376567))

(assert (= (and b!376567 res!212851) b!376570))

(assert (= (and b!376570 res!212852) b!376569))

(assert (= (and b!376569 res!212853) b!376577))

(assert (= (and b!376577 res!212858) b!376568))

(assert (= (and b!376568 res!212850) b!376574))

(assert (= (and b!376574 res!212848) b!376566))

(assert (= (and b!376566 res!212855) b!376575))

(assert (= (and b!376575 res!212849) b!376578))

(assert (= (and b!376578 res!212847) b!376576))

(assert (= (and b!376576 (not res!212857)) b!376573))

(assert (= (and b!376573 (not res!212856)) b!376572))

(assert (= (and b!376579 condMapEmpty!15078) mapIsEmpty!15078))

(assert (= (and b!376579 (not condMapEmpty!15078)) mapNonEmpty!15078))

(get-info :version)

(assert (= (and mapNonEmpty!15078 ((_ is ValueCellFull!4161) mapValue!15078)) b!376571))

(assert (= (and b!376579 ((_ is ValueCellFull!4161) mapDefault!15078)) b!376580))

(assert (= start!37234 b!376579))

(declare-fun m!373275 () Bool)

(assert (=> b!376569 m!373275))

(declare-fun m!373277 () Bool)

(assert (=> b!376573 m!373277))

(declare-fun m!373279 () Bool)

(assert (=> b!376573 m!373279))

(declare-fun m!373281 () Bool)

(assert (=> b!376573 m!373281))

(declare-fun m!373283 () Bool)

(assert (=> mapNonEmpty!15078 m!373283))

(declare-fun m!373285 () Bool)

(assert (=> b!376572 m!373285))

(declare-fun m!373287 () Bool)

(assert (=> b!376572 m!373287))

(declare-fun m!373289 () Bool)

(assert (=> start!37234 m!373289))

(declare-fun m!373291 () Bool)

(assert (=> start!37234 m!373291))

(declare-fun m!373293 () Bool)

(assert (=> start!37234 m!373293))

(declare-fun m!373295 () Bool)

(assert (=> b!376576 m!373295))

(declare-fun m!373297 () Bool)

(assert (=> b!376576 m!373297))

(declare-fun m!373299 () Bool)

(assert (=> b!376576 m!373299))

(declare-fun m!373301 () Bool)

(assert (=> b!376576 m!373301))

(declare-fun m!373303 () Bool)

(assert (=> b!376576 m!373303))

(declare-fun m!373305 () Bool)

(assert (=> b!376576 m!373305))

(declare-fun m!373307 () Bool)

(assert (=> b!376576 m!373307))

(declare-fun m!373309 () Bool)

(assert (=> b!376575 m!373309))

(declare-fun m!373311 () Bool)

(assert (=> b!376575 m!373311))

(declare-fun m!373313 () Bool)

(assert (=> b!376570 m!373313))

(declare-fun m!373315 () Bool)

(assert (=> b!376568 m!373315))

(declare-fun m!373317 () Bool)

(assert (=> b!376566 m!373317))

(declare-fun m!373319 () Bool)

(assert (=> b!376578 m!373319))

(declare-fun m!373321 () Bool)

(assert (=> b!376574 m!373321))

(check-sat (not start!37234) (not b!376575) (not mapNonEmpty!15078) (not b!376569) (not b!376566) b_and!15603 (not b!376570) (not b!376578) (not b!376576) (not b_next!8361) (not b!376573) tp_is_empty!9009 (not b!376572) (not b!376568))
(check-sat b_and!15603 (not b_next!8361))
