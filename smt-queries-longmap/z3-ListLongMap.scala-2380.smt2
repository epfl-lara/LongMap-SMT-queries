; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37728 () Bool)

(assert start!37728)

(declare-fun b_free!8845 () Bool)

(declare-fun b_next!8845 () Bool)

(assert (=> start!37728 (= b_free!8845 (not b_next!8845))))

(declare-fun tp!31286 () Bool)

(declare-fun b_and!16101 () Bool)

(assert (=> start!37728 (= tp!31286 b_and!16101)))

(declare-fun b!387133 () Bool)

(declare-fun e!234741 () Bool)

(declare-fun e!234739 () Bool)

(declare-fun mapRes!15840 () Bool)

(assert (=> b!387133 (= e!234741 (and e!234739 mapRes!15840))))

(declare-fun condMapEmpty!15840 () Bool)

(declare-datatypes ((V!13795 0))(
  ( (V!13796 (val!4803 Int)) )
))
(declare-datatypes ((ValueCell!4415 0))(
  ( (ValueCellFull!4415 (v!7001 V!13795)) (EmptyCell!4415) )
))
(declare-datatypes ((array!22918 0))(
  ( (array!22919 (arr!10927 (Array (_ BitVec 32) ValueCell!4415)) (size!11279 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22918)

(declare-fun mapDefault!15840 () ValueCell!4415)

(assert (=> b!387133 (= condMapEmpty!15840 (= (arr!10927 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4415)) mapDefault!15840)))))

(declare-fun b!387134 () Bool)

(declare-fun res!221179 () Bool)

(declare-fun e!234740 () Bool)

(assert (=> b!387134 (=> (not res!221179) (not e!234740))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387134 (= res!221179 (validKeyInArray!0 k0!778))))

(declare-fun b!387135 () Bool)

(declare-fun e!234743 () Bool)

(declare-fun tp_is_empty!9517 () Bool)

(assert (=> b!387135 (= e!234743 tp_is_empty!9517)))

(declare-fun res!221181 () Bool)

(assert (=> start!37728 (=> (not res!221181) (not e!234740))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37728 (= res!221181 (validMask!0 mask!970))))

(assert (=> start!37728 e!234740))

(declare-fun array_inv!8076 (array!22918) Bool)

(assert (=> start!37728 (and (array_inv!8076 _values!506) e!234741)))

(assert (=> start!37728 tp!31286))

(assert (=> start!37728 true))

(assert (=> start!37728 tp_is_empty!9517))

(declare-datatypes ((array!22920 0))(
  ( (array!22921 (arr!10928 (Array (_ BitVec 32) (_ BitVec 64))) (size!11280 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22920)

(declare-fun array_inv!8077 (array!22920) Bool)

(assert (=> start!37728 (array_inv!8077 _keys!658)))

(declare-fun b!387136 () Bool)

(declare-fun res!221176 () Bool)

(assert (=> b!387136 (=> (not res!221176) (not e!234740))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!387136 (= res!221176 (and (= (size!11279 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11280 _keys!658) (size!11279 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387137 () Bool)

(declare-fun res!221175 () Bool)

(assert (=> b!387137 (=> (not res!221175) (not e!234740))))

(declare-fun arrayContainsKey!0 (array!22920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387137 (= res!221175 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387138 () Bool)

(declare-fun res!221178 () Bool)

(assert (=> b!387138 (=> (not res!221178) (not e!234740))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387138 (= res!221178 (or (= (select (arr!10928 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10928 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387139 () Bool)

(declare-fun res!221174 () Bool)

(declare-fun e!234744 () Bool)

(assert (=> b!387139 (=> (not res!221174) (not e!234744))))

(declare-fun lt!181998 () array!22920)

(declare-datatypes ((List!6170 0))(
  ( (Nil!6167) (Cons!6166 (h!7022 (_ BitVec 64)) (t!11312 List!6170)) )
))
(declare-fun arrayNoDuplicates!0 (array!22920 (_ BitVec 32) List!6170) Bool)

(assert (=> b!387139 (= res!221174 (arrayNoDuplicates!0 lt!181998 #b00000000000000000000000000000000 Nil!6167))))

(declare-fun mapIsEmpty!15840 () Bool)

(assert (=> mapIsEmpty!15840 mapRes!15840))

(declare-fun b!387140 () Bool)

(declare-fun res!221180 () Bool)

(assert (=> b!387140 (=> (not res!221180) (not e!234740))))

(assert (=> b!387140 (= res!221180 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6167))))

(declare-fun b!387141 () Bool)

(declare-fun res!221177 () Bool)

(assert (=> b!387141 (=> (not res!221177) (not e!234740))))

(assert (=> b!387141 (= res!221177 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11280 _keys!658))))))

(declare-fun b!387142 () Bool)

(assert (=> b!387142 (= e!234744 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6322 0))(
  ( (tuple2!6323 (_1!3172 (_ BitVec 64)) (_2!3172 V!13795)) )
))
(declare-datatypes ((List!6171 0))(
  ( (Nil!6168) (Cons!6167 (h!7023 tuple2!6322) (t!11313 List!6171)) )
))
(declare-datatypes ((ListLongMap!5237 0))(
  ( (ListLongMap!5238 (toList!2634 List!6171)) )
))
(declare-fun lt!181999 () ListLongMap!5237)

(declare-fun zeroValue!472 () V!13795)

(declare-fun v!373 () V!13795)

(declare-fun minValue!472 () V!13795)

(declare-fun getCurrentListMapNoExtraKeys!909 (array!22920 array!22918 (_ BitVec 32) (_ BitVec 32) V!13795 V!13795 (_ BitVec 32) Int) ListLongMap!5237)

(assert (=> b!387142 (= lt!181999 (getCurrentListMapNoExtraKeys!909 lt!181998 (array!22919 (store (arr!10927 _values!506) i!548 (ValueCellFull!4415 v!373)) (size!11279 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181997 () ListLongMap!5237)

(assert (=> b!387142 (= lt!181997 (getCurrentListMapNoExtraKeys!909 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387143 () Bool)

(assert (=> b!387143 (= e!234740 e!234744)))

(declare-fun res!221183 () Bool)

(assert (=> b!387143 (=> (not res!221183) (not e!234744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22920 (_ BitVec 32)) Bool)

(assert (=> b!387143 (= res!221183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181998 mask!970))))

(assert (=> b!387143 (= lt!181998 (array!22921 (store (arr!10928 _keys!658) i!548 k0!778) (size!11280 _keys!658)))))

(declare-fun mapNonEmpty!15840 () Bool)

(declare-fun tp!31287 () Bool)

(assert (=> mapNonEmpty!15840 (= mapRes!15840 (and tp!31287 e!234743))))

(declare-fun mapRest!15840 () (Array (_ BitVec 32) ValueCell!4415))

(declare-fun mapKey!15840 () (_ BitVec 32))

(declare-fun mapValue!15840 () ValueCell!4415)

(assert (=> mapNonEmpty!15840 (= (arr!10927 _values!506) (store mapRest!15840 mapKey!15840 mapValue!15840))))

(declare-fun b!387144 () Bool)

(declare-fun res!221182 () Bool)

(assert (=> b!387144 (=> (not res!221182) (not e!234740))))

(assert (=> b!387144 (= res!221182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387145 () Bool)

(assert (=> b!387145 (= e!234739 tp_is_empty!9517)))

(assert (= (and start!37728 res!221181) b!387136))

(assert (= (and b!387136 res!221176) b!387144))

(assert (= (and b!387144 res!221182) b!387140))

(assert (= (and b!387140 res!221180) b!387141))

(assert (= (and b!387141 res!221177) b!387134))

(assert (= (and b!387134 res!221179) b!387138))

(assert (= (and b!387138 res!221178) b!387137))

(assert (= (and b!387137 res!221175) b!387143))

(assert (= (and b!387143 res!221183) b!387139))

(assert (= (and b!387139 res!221174) b!387142))

(assert (= (and b!387133 condMapEmpty!15840) mapIsEmpty!15840))

(assert (= (and b!387133 (not condMapEmpty!15840)) mapNonEmpty!15840))

(get-info :version)

(assert (= (and mapNonEmpty!15840 ((_ is ValueCellFull!4415) mapValue!15840)) b!387135))

(assert (= (and b!387133 ((_ is ValueCellFull!4415) mapDefault!15840)) b!387145))

(assert (= start!37728 b!387133))

(declare-fun m!383585 () Bool)

(assert (=> mapNonEmpty!15840 m!383585))

(declare-fun m!383587 () Bool)

(assert (=> b!387138 m!383587))

(declare-fun m!383589 () Bool)

(assert (=> b!387137 m!383589))

(declare-fun m!383591 () Bool)

(assert (=> start!37728 m!383591))

(declare-fun m!383593 () Bool)

(assert (=> start!37728 m!383593))

(declare-fun m!383595 () Bool)

(assert (=> start!37728 m!383595))

(declare-fun m!383597 () Bool)

(assert (=> b!387144 m!383597))

(declare-fun m!383599 () Bool)

(assert (=> b!387142 m!383599))

(declare-fun m!383601 () Bool)

(assert (=> b!387142 m!383601))

(declare-fun m!383603 () Bool)

(assert (=> b!387142 m!383603))

(declare-fun m!383605 () Bool)

(assert (=> b!387140 m!383605))

(declare-fun m!383607 () Bool)

(assert (=> b!387143 m!383607))

(declare-fun m!383609 () Bool)

(assert (=> b!387143 m!383609))

(declare-fun m!383611 () Bool)

(assert (=> b!387139 m!383611))

(declare-fun m!383613 () Bool)

(assert (=> b!387134 m!383613))

(check-sat (not b!387143) (not b_next!8845) (not start!37728) (not b!387144) (not b!387140) (not mapNonEmpty!15840) (not b!387134) b_and!16101 tp_is_empty!9517 (not b!387142) (not b!387139) (not b!387137))
(check-sat b_and!16101 (not b_next!8845))
