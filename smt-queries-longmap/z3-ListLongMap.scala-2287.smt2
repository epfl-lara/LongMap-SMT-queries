; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37170 () Bool)

(assert start!37170)

(declare-fun b_free!8311 () Bool)

(declare-fun b_next!8311 () Bool)

(assert (=> start!37170 (= b_free!8311 (not b_next!8311))))

(declare-fun tp!29649 () Bool)

(declare-fun b_and!15527 () Bool)

(assert (=> start!37170 (= tp!29649 b_and!15527)))

(declare-fun b!375161 () Bool)

(declare-fun e!228553 () Bool)

(declare-fun e!228555 () Bool)

(assert (=> b!375161 (= e!228553 e!228555)))

(declare-fun res!211814 () Bool)

(assert (=> b!375161 (=> res!211814 e!228555)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!375161 (= res!211814 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13051 0))(
  ( (V!13052 (val!4524 Int)) )
))
(declare-datatypes ((tuple2!5996 0))(
  ( (tuple2!5997 (_1!3009 (_ BitVec 64)) (_2!3009 V!13051)) )
))
(declare-datatypes ((List!5828 0))(
  ( (Nil!5825) (Cons!5824 (h!6680 tuple2!5996) (t!10969 List!5828)) )
))
(declare-datatypes ((ListLongMap!4899 0))(
  ( (ListLongMap!4900 (toList!2465 List!5828)) )
))
(declare-fun lt!173509 () ListLongMap!4899)

(declare-fun lt!173517 () ListLongMap!4899)

(assert (=> b!375161 (= lt!173509 lt!173517)))

(declare-fun lt!173501 () ListLongMap!4899)

(declare-fun lt!173511 () tuple2!5996)

(declare-fun +!833 (ListLongMap!4899 tuple2!5996) ListLongMap!4899)

(assert (=> b!375161 (= lt!173517 (+!833 lt!173501 lt!173511))))

(declare-fun v!373 () V!13051)

(declare-fun zeroValue!472 () V!13051)

(declare-fun lt!173508 () ListLongMap!4899)

(declare-datatypes ((Unit!11538 0))(
  ( (Unit!11539) )
))
(declare-fun lt!173516 () Unit!11538)

(declare-fun addCommutativeForDiffKeys!248 (ListLongMap!4899 (_ BitVec 64) V!13051 (_ BitVec 64) V!13051) Unit!11538)

(assert (=> b!375161 (= lt!173516 (addCommutativeForDiffKeys!248 lt!173508 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173507 () ListLongMap!4899)

(declare-fun lt!173504 () tuple2!5996)

(assert (=> b!375161 (= lt!173507 (+!833 lt!173509 lt!173504))))

(declare-fun lt!173503 () ListLongMap!4899)

(declare-fun lt!173512 () tuple2!5996)

(assert (=> b!375161 (= lt!173509 (+!833 lt!173503 lt!173512))))

(declare-fun lt!173505 () ListLongMap!4899)

(declare-fun lt!173514 () ListLongMap!4899)

(assert (=> b!375161 (= lt!173505 lt!173514)))

(assert (=> b!375161 (= lt!173514 (+!833 lt!173501 lt!173504))))

(assert (=> b!375161 (= lt!173501 (+!833 lt!173508 lt!173512))))

(declare-fun lt!173513 () ListLongMap!4899)

(assert (=> b!375161 (= lt!173507 (+!833 (+!833 lt!173513 lt!173512) lt!173504))))

(declare-fun minValue!472 () V!13051)

(assert (=> b!375161 (= lt!173504 (tuple2!5997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375161 (= lt!173512 (tuple2!5997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!211809 () Bool)

(declare-fun e!228559 () Bool)

(assert (=> start!37170 (=> (not res!211809) (not e!228559))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37170 (= res!211809 (validMask!0 mask!970))))

(assert (=> start!37170 e!228559))

(declare-datatypes ((ValueCell!4136 0))(
  ( (ValueCellFull!4136 (v!6715 V!13051)) (EmptyCell!4136) )
))
(declare-datatypes ((array!21835 0))(
  ( (array!21836 (arr!10386 (Array (_ BitVec 32) ValueCell!4136)) (size!10739 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21835)

(declare-fun e!228558 () Bool)

(declare-fun array_inv!7664 (array!21835) Bool)

(assert (=> start!37170 (and (array_inv!7664 _values!506) e!228558)))

(assert (=> start!37170 tp!29649))

(assert (=> start!37170 true))

(declare-fun tp_is_empty!8959 () Bool)

(assert (=> start!37170 tp_is_empty!8959))

(declare-datatypes ((array!21837 0))(
  ( (array!21838 (arr!10387 (Array (_ BitVec 32) (_ BitVec 64))) (size!10740 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21837)

(declare-fun array_inv!7665 (array!21837) Bool)

(assert (=> start!37170 (array_inv!7665 _keys!658)))

(declare-fun b!375162 () Bool)

(declare-fun res!211815 () Bool)

(assert (=> b!375162 (=> (not res!211815) (not e!228559))))

(declare-datatypes ((List!5829 0))(
  ( (Nil!5826) (Cons!5825 (h!6681 (_ BitVec 64)) (t!10970 List!5829)) )
))
(declare-fun arrayNoDuplicates!0 (array!21837 (_ BitVec 32) List!5829) Bool)

(assert (=> b!375162 (= res!211815 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5826))))

(declare-fun b!375163 () Bool)

(assert (=> b!375163 (= e!228555 true)))

(assert (=> b!375163 (= (+!833 lt!173517 lt!173504) (+!833 lt!173514 lt!173511))))

(declare-fun lt!173515 () Unit!11538)

(assert (=> b!375163 (= lt!173515 (addCommutativeForDiffKeys!248 lt!173501 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375164 () Bool)

(declare-fun res!211813 () Bool)

(assert (=> b!375164 (=> (not res!211813) (not e!228559))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375164 (= res!211813 (and (= (size!10739 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10740 _keys!658) (size!10739 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15003 () Bool)

(declare-fun mapRes!15003 () Bool)

(assert (=> mapIsEmpty!15003 mapRes!15003))

(declare-fun b!375165 () Bool)

(declare-fun e!228560 () Bool)

(assert (=> b!375165 (= e!228559 e!228560)))

(declare-fun res!211818 () Bool)

(assert (=> b!375165 (=> (not res!211818) (not e!228560))))

(declare-fun lt!173506 () array!21837)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21837 (_ BitVec 32)) Bool)

(assert (=> b!375165 (= res!211818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173506 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375165 (= lt!173506 (array!21838 (store (arr!10387 _keys!658) i!548 k0!778) (size!10740 _keys!658)))))

(declare-fun b!375166 () Bool)

(assert (=> b!375166 (= e!228560 (not e!228553))))

(declare-fun res!211812 () Bool)

(assert (=> b!375166 (=> res!211812 e!228553)))

(assert (=> b!375166 (= res!211812 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1881 (array!21837 array!21835 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) Int) ListLongMap!4899)

(assert (=> b!375166 (= lt!173505 (getCurrentListMap!1881 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173502 () array!21835)

(assert (=> b!375166 (= lt!173507 (getCurrentListMap!1881 lt!173506 lt!173502 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375166 (and (= lt!173513 lt!173503) (= lt!173503 lt!173513))))

(assert (=> b!375166 (= lt!173503 (+!833 lt!173508 lt!173511))))

(assert (=> b!375166 (= lt!173511 (tuple2!5997 k0!778 v!373))))

(declare-fun lt!173510 () Unit!11538)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!74 (array!21837 array!21835 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) (_ BitVec 64) V!13051 (_ BitVec 32) Int) Unit!11538)

(assert (=> b!375166 (= lt!173510 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!74 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!746 (array!21837 array!21835 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) Int) ListLongMap!4899)

(assert (=> b!375166 (= lt!173513 (getCurrentListMapNoExtraKeys!746 lt!173506 lt!173502 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375166 (= lt!173502 (array!21836 (store (arr!10386 _values!506) i!548 (ValueCellFull!4136 v!373)) (size!10739 _values!506)))))

(assert (=> b!375166 (= lt!173508 (getCurrentListMapNoExtraKeys!746 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375167 () Bool)

(declare-fun e!228554 () Bool)

(assert (=> b!375167 (= e!228554 tp_is_empty!8959)))

(declare-fun b!375168 () Bool)

(declare-fun res!211811 () Bool)

(assert (=> b!375168 (=> (not res!211811) (not e!228559))))

(assert (=> b!375168 (= res!211811 (or (= (select (arr!10387 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10387 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375169 () Bool)

(declare-fun e!228557 () Bool)

(assert (=> b!375169 (= e!228557 tp_is_empty!8959)))

(declare-fun b!375170 () Bool)

(declare-fun res!211819 () Bool)

(assert (=> b!375170 (=> (not res!211819) (not e!228559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375170 (= res!211819 (validKeyInArray!0 k0!778))))

(declare-fun b!375171 () Bool)

(declare-fun res!211820 () Bool)

(assert (=> b!375171 (=> (not res!211820) (not e!228560))))

(assert (=> b!375171 (= res!211820 (arrayNoDuplicates!0 lt!173506 #b00000000000000000000000000000000 Nil!5826))))

(declare-fun b!375172 () Bool)

(assert (=> b!375172 (= e!228558 (and e!228557 mapRes!15003))))

(declare-fun condMapEmpty!15003 () Bool)

(declare-fun mapDefault!15003 () ValueCell!4136)

(assert (=> b!375172 (= condMapEmpty!15003 (= (arr!10386 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4136)) mapDefault!15003)))))

(declare-fun b!375173 () Bool)

(declare-fun res!211817 () Bool)

(assert (=> b!375173 (=> (not res!211817) (not e!228559))))

(assert (=> b!375173 (= res!211817 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10740 _keys!658))))))

(declare-fun b!375174 () Bool)

(declare-fun res!211816 () Bool)

(assert (=> b!375174 (=> (not res!211816) (not e!228559))))

(assert (=> b!375174 (= res!211816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375175 () Bool)

(declare-fun res!211810 () Bool)

(assert (=> b!375175 (=> (not res!211810) (not e!228559))))

(declare-fun arrayContainsKey!0 (array!21837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375175 (= res!211810 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15003 () Bool)

(declare-fun tp!29648 () Bool)

(assert (=> mapNonEmpty!15003 (= mapRes!15003 (and tp!29648 e!228554))))

(declare-fun mapValue!15003 () ValueCell!4136)

(declare-fun mapKey!15003 () (_ BitVec 32))

(declare-fun mapRest!15003 () (Array (_ BitVec 32) ValueCell!4136))

(assert (=> mapNonEmpty!15003 (= (arr!10386 _values!506) (store mapRest!15003 mapKey!15003 mapValue!15003))))

(assert (= (and start!37170 res!211809) b!375164))

(assert (= (and b!375164 res!211813) b!375174))

(assert (= (and b!375174 res!211816) b!375162))

(assert (= (and b!375162 res!211815) b!375173))

(assert (= (and b!375173 res!211817) b!375170))

(assert (= (and b!375170 res!211819) b!375168))

(assert (= (and b!375168 res!211811) b!375175))

(assert (= (and b!375175 res!211810) b!375165))

(assert (= (and b!375165 res!211818) b!375171))

(assert (= (and b!375171 res!211820) b!375166))

(assert (= (and b!375166 (not res!211812)) b!375161))

(assert (= (and b!375161 (not res!211814)) b!375163))

(assert (= (and b!375172 condMapEmpty!15003) mapIsEmpty!15003))

(assert (= (and b!375172 (not condMapEmpty!15003)) mapNonEmpty!15003))

(get-info :version)

(assert (= (and mapNonEmpty!15003 ((_ is ValueCellFull!4136) mapValue!15003)) b!375167))

(assert (= (and b!375172 ((_ is ValueCellFull!4136) mapDefault!15003)) b!375169))

(assert (= start!37170 b!375172))

(declare-fun m!371291 () Bool)

(assert (=> b!375165 m!371291))

(declare-fun m!371293 () Bool)

(assert (=> b!375165 m!371293))

(declare-fun m!371295 () Bool)

(assert (=> b!375168 m!371295))

(declare-fun m!371297 () Bool)

(assert (=> b!375162 m!371297))

(declare-fun m!371299 () Bool)

(assert (=> mapNonEmpty!15003 m!371299))

(declare-fun m!371301 () Bool)

(assert (=> b!375170 m!371301))

(declare-fun m!371303 () Bool)

(assert (=> b!375163 m!371303))

(declare-fun m!371305 () Bool)

(assert (=> b!375163 m!371305))

(declare-fun m!371307 () Bool)

(assert (=> b!375163 m!371307))

(declare-fun m!371309 () Bool)

(assert (=> start!37170 m!371309))

(declare-fun m!371311 () Bool)

(assert (=> start!37170 m!371311))

(declare-fun m!371313 () Bool)

(assert (=> start!37170 m!371313))

(declare-fun m!371315 () Bool)

(assert (=> b!375171 m!371315))

(declare-fun m!371317 () Bool)

(assert (=> b!375166 m!371317))

(declare-fun m!371319 () Bool)

(assert (=> b!375166 m!371319))

(declare-fun m!371321 () Bool)

(assert (=> b!375166 m!371321))

(declare-fun m!371323 () Bool)

(assert (=> b!375166 m!371323))

(declare-fun m!371325 () Bool)

(assert (=> b!375166 m!371325))

(declare-fun m!371327 () Bool)

(assert (=> b!375166 m!371327))

(declare-fun m!371329 () Bool)

(assert (=> b!375166 m!371329))

(declare-fun m!371331 () Bool)

(assert (=> b!375175 m!371331))

(declare-fun m!371333 () Bool)

(assert (=> b!375174 m!371333))

(declare-fun m!371335 () Bool)

(assert (=> b!375161 m!371335))

(declare-fun m!371337 () Bool)

(assert (=> b!375161 m!371337))

(declare-fun m!371339 () Bool)

(assert (=> b!375161 m!371339))

(declare-fun m!371341 () Bool)

(assert (=> b!375161 m!371341))

(declare-fun m!371343 () Bool)

(assert (=> b!375161 m!371343))

(declare-fun m!371345 () Bool)

(assert (=> b!375161 m!371345))

(assert (=> b!375161 m!371337))

(declare-fun m!371347 () Bool)

(assert (=> b!375161 m!371347))

(declare-fun m!371349 () Bool)

(assert (=> b!375161 m!371349))

(check-sat (not b!375174) (not b!375170) (not b_next!8311) (not b!375165) (not start!37170) (not b!375171) (not b!375163) b_and!15527 (not b!375175) (not b!375162) (not mapNonEmpty!15003) (not b!375166) (not b!375161) tp_is_empty!8959)
(check-sat b_and!15527 (not b_next!8311))
