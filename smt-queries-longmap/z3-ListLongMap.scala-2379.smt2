; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37738 () Bool)

(assert start!37738)

(declare-fun b_free!8841 () Bool)

(declare-fun b_next!8841 () Bool)

(assert (=> start!37738 (= b_free!8841 (not b_next!8841))))

(declare-fun tp!31274 () Bool)

(declare-fun b_and!16083 () Bool)

(assert (=> start!37738 (= tp!31274 b_and!16083)))

(declare-fun b!387104 () Bool)

(declare-fun res!221122 () Bool)

(declare-fun e!234737 () Bool)

(assert (=> b!387104 (=> (not res!221122) (not e!234737))))

(declare-datatypes ((array!22919 0))(
  ( (array!22920 (arr!10928 (Array (_ BitVec 32) (_ BitVec 64))) (size!11280 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22919)

(declare-datatypes ((List!6303 0))(
  ( (Nil!6300) (Cons!6299 (h!7155 (_ BitVec 64)) (t!11453 List!6303)) )
))
(declare-fun arrayNoDuplicates!0 (array!22919 (_ BitVec 32) List!6303) Bool)

(assert (=> b!387104 (= res!221122 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6300))))

(declare-fun b!387105 () Bool)

(declare-fun res!221123 () Bool)

(assert (=> b!387105 (=> (not res!221123) (not e!234737))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22919 (_ BitVec 32)) Bool)

(assert (=> b!387105 (= res!221123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387106 () Bool)

(declare-fun e!234740 () Bool)

(assert (=> b!387106 (= e!234740 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!13789 0))(
  ( (V!13790 (val!4801 Int)) )
))
(declare-fun zeroValue!472 () V!13789)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13789)

(declare-fun lt!181960 () array!22919)

(declare-datatypes ((ValueCell!4413 0))(
  ( (ValueCellFull!4413 (v!6998 V!13789)) (EmptyCell!4413) )
))
(declare-datatypes ((array!22921 0))(
  ( (array!22922 (arr!10929 (Array (_ BitVec 32) ValueCell!4413)) (size!11281 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22921)

(declare-datatypes ((tuple2!6454 0))(
  ( (tuple2!6455 (_1!3238 (_ BitVec 64)) (_2!3238 V!13789)) )
))
(declare-datatypes ((List!6304 0))(
  ( (Nil!6301) (Cons!6300 (h!7156 tuple2!6454) (t!11454 List!6304)) )
))
(declare-datatypes ((ListLongMap!5367 0))(
  ( (ListLongMap!5368 (toList!2699 List!6304)) )
))
(declare-fun lt!181962 () ListLongMap!5367)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13789)

(declare-fun getCurrentListMapNoExtraKeys!928 (array!22919 array!22921 (_ BitVec 32) (_ BitVec 32) V!13789 V!13789 (_ BitVec 32) Int) ListLongMap!5367)

(assert (=> b!387106 (= lt!181962 (getCurrentListMapNoExtraKeys!928 lt!181960 (array!22922 (store (arr!10929 _values!506) i!548 (ValueCellFull!4413 v!373)) (size!11281 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181961 () ListLongMap!5367)

(assert (=> b!387106 (= lt!181961 (getCurrentListMapNoExtraKeys!928 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15834 () Bool)

(declare-fun mapRes!15834 () Bool)

(assert (=> mapIsEmpty!15834 mapRes!15834))

(declare-fun b!387108 () Bool)

(declare-fun res!221124 () Bool)

(assert (=> b!387108 (=> (not res!221124) (not e!234740))))

(assert (=> b!387108 (= res!221124 (arrayNoDuplicates!0 lt!181960 #b00000000000000000000000000000000 Nil!6300))))

(declare-fun b!387109 () Bool)

(declare-fun res!221126 () Bool)

(assert (=> b!387109 (=> (not res!221126) (not e!234737))))

(assert (=> b!387109 (= res!221126 (and (= (size!11281 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11280 _keys!658) (size!11281 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387110 () Bool)

(declare-fun e!234739 () Bool)

(declare-fun tp_is_empty!9513 () Bool)

(assert (=> b!387110 (= e!234739 tp_is_empty!9513)))

(declare-fun b!387111 () Bool)

(declare-fun res!221118 () Bool)

(assert (=> b!387111 (=> (not res!221118) (not e!234737))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387111 (= res!221118 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387112 () Bool)

(declare-fun res!221119 () Bool)

(assert (=> b!387112 (=> (not res!221119) (not e!234737))))

(assert (=> b!387112 (= res!221119 (or (= (select (arr!10928 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10928 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387113 () Bool)

(declare-fun e!234735 () Bool)

(declare-fun e!234736 () Bool)

(assert (=> b!387113 (= e!234735 (and e!234736 mapRes!15834))))

(declare-fun condMapEmpty!15834 () Bool)

(declare-fun mapDefault!15834 () ValueCell!4413)

(assert (=> b!387113 (= condMapEmpty!15834 (= (arr!10929 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4413)) mapDefault!15834)))))

(declare-fun b!387114 () Bool)

(declare-fun res!221117 () Bool)

(assert (=> b!387114 (=> (not res!221117) (not e!234737))))

(assert (=> b!387114 (= res!221117 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11280 _keys!658))))))

(declare-fun b!387115 () Bool)

(assert (=> b!387115 (= e!234736 tp_is_empty!9513)))

(declare-fun res!221121 () Bool)

(assert (=> start!37738 (=> (not res!221121) (not e!234737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37738 (= res!221121 (validMask!0 mask!970))))

(assert (=> start!37738 e!234737))

(declare-fun array_inv!8040 (array!22921) Bool)

(assert (=> start!37738 (and (array_inv!8040 _values!506) e!234735)))

(assert (=> start!37738 tp!31274))

(assert (=> start!37738 true))

(assert (=> start!37738 tp_is_empty!9513))

(declare-fun array_inv!8041 (array!22919) Bool)

(assert (=> start!37738 (array_inv!8041 _keys!658)))

(declare-fun b!387107 () Bool)

(declare-fun res!221120 () Bool)

(assert (=> b!387107 (=> (not res!221120) (not e!234737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387107 (= res!221120 (validKeyInArray!0 k0!778))))

(declare-fun b!387116 () Bool)

(assert (=> b!387116 (= e!234737 e!234740)))

(declare-fun res!221125 () Bool)

(assert (=> b!387116 (=> (not res!221125) (not e!234740))))

(assert (=> b!387116 (= res!221125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181960 mask!970))))

(assert (=> b!387116 (= lt!181960 (array!22920 (store (arr!10928 _keys!658) i!548 k0!778) (size!11280 _keys!658)))))

(declare-fun mapNonEmpty!15834 () Bool)

(declare-fun tp!31275 () Bool)

(assert (=> mapNonEmpty!15834 (= mapRes!15834 (and tp!31275 e!234739))))

(declare-fun mapRest!15834 () (Array (_ BitVec 32) ValueCell!4413))

(declare-fun mapValue!15834 () ValueCell!4413)

(declare-fun mapKey!15834 () (_ BitVec 32))

(assert (=> mapNonEmpty!15834 (= (arr!10929 _values!506) (store mapRest!15834 mapKey!15834 mapValue!15834))))

(assert (= (and start!37738 res!221121) b!387109))

(assert (= (and b!387109 res!221126) b!387105))

(assert (= (and b!387105 res!221123) b!387104))

(assert (= (and b!387104 res!221122) b!387114))

(assert (= (and b!387114 res!221117) b!387107))

(assert (= (and b!387107 res!221120) b!387112))

(assert (= (and b!387112 res!221119) b!387111))

(assert (= (and b!387111 res!221118) b!387116))

(assert (= (and b!387116 res!221125) b!387108))

(assert (= (and b!387108 res!221124) b!387106))

(assert (= (and b!387113 condMapEmpty!15834) mapIsEmpty!15834))

(assert (= (and b!387113 (not condMapEmpty!15834)) mapNonEmpty!15834))

(get-info :version)

(assert (= (and mapNonEmpty!15834 ((_ is ValueCellFull!4413) mapValue!15834)) b!387110))

(assert (= (and b!387113 ((_ is ValueCellFull!4413) mapDefault!15834)) b!387115))

(assert (= start!37738 b!387113))

(declare-fun m!383295 () Bool)

(assert (=> start!37738 m!383295))

(declare-fun m!383297 () Bool)

(assert (=> start!37738 m!383297))

(declare-fun m!383299 () Bool)

(assert (=> start!37738 m!383299))

(declare-fun m!383301 () Bool)

(assert (=> b!387107 m!383301))

(declare-fun m!383303 () Bool)

(assert (=> b!387105 m!383303))

(declare-fun m!383305 () Bool)

(assert (=> b!387111 m!383305))

(declare-fun m!383307 () Bool)

(assert (=> b!387104 m!383307))

(declare-fun m!383309 () Bool)

(assert (=> b!387116 m!383309))

(declare-fun m!383311 () Bool)

(assert (=> b!387116 m!383311))

(declare-fun m!383313 () Bool)

(assert (=> b!387112 m!383313))

(declare-fun m!383315 () Bool)

(assert (=> b!387106 m!383315))

(declare-fun m!383317 () Bool)

(assert (=> b!387106 m!383317))

(declare-fun m!383319 () Bool)

(assert (=> b!387106 m!383319))

(declare-fun m!383321 () Bool)

(assert (=> mapNonEmpty!15834 m!383321))

(declare-fun m!383323 () Bool)

(assert (=> b!387108 m!383323))

(check-sat (not b!387104) (not b!387108) (not start!37738) (not b!387106) (not b_next!8841) (not b!387107) (not b!387116) b_and!16083 (not b!387111) (not mapNonEmpty!15834) tp_is_empty!9513 (not b!387105))
(check-sat b_and!16083 (not b_next!8841))
