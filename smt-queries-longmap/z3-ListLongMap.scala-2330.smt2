; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37444 () Bool)

(assert start!37444)

(declare-fun b_free!8571 () Bool)

(declare-fun b_next!8571 () Bool)

(assert (=> start!37444 (= b_free!8571 (not b_next!8571))))

(declare-fun tp!30428 () Bool)

(declare-fun b_and!15813 () Bool)

(assert (=> start!37444 (= tp!30428 b_and!15813)))

(declare-fun b!381268 () Bool)

(declare-fun e!231815 () Bool)

(assert (=> b!381268 (= e!231815 true)))

(declare-datatypes ((V!13397 0))(
  ( (V!13398 (val!4654 Int)) )
))
(declare-datatypes ((tuple2!6248 0))(
  ( (tuple2!6249 (_1!3135 (_ BitVec 64)) (_2!3135 V!13397)) )
))
(declare-datatypes ((List!6081 0))(
  ( (Nil!6078) (Cons!6077 (h!6933 tuple2!6248) (t!11231 List!6081)) )
))
(declare-datatypes ((ListLongMap!5161 0))(
  ( (ListLongMap!5162 (toList!2596 List!6081)) )
))
(declare-fun lt!178674 () ListLongMap!5161)

(declare-fun lt!178672 () ListLongMap!5161)

(assert (=> b!381268 (= lt!178674 lt!178672)))

(declare-fun b!381269 () Bool)

(declare-fun e!231816 () Bool)

(declare-fun e!231817 () Bool)

(declare-fun mapRes!15393 () Bool)

(assert (=> b!381269 (= e!231816 (and e!231817 mapRes!15393))))

(declare-fun condMapEmpty!15393 () Bool)

(declare-datatypes ((ValueCell!4266 0))(
  ( (ValueCellFull!4266 (v!6851 V!13397)) (EmptyCell!4266) )
))
(declare-datatypes ((array!22353 0))(
  ( (array!22354 (arr!10645 (Array (_ BitVec 32) ValueCell!4266)) (size!10997 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22353)

(declare-fun mapDefault!15393 () ValueCell!4266)

(assert (=> b!381269 (= condMapEmpty!15393 (= (arr!10645 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4266)) mapDefault!15393)))))

(declare-fun b!381270 () Bool)

(declare-fun res!216609 () Bool)

(declare-fun e!231820 () Bool)

(assert (=> b!381270 (=> (not res!216609) (not e!231820))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381270 (= res!216609 (validKeyInArray!0 k0!778))))

(declare-fun b!381271 () Bool)

(declare-fun res!216610 () Bool)

(assert (=> b!381271 (=> (not res!216610) (not e!231820))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22355 0))(
  ( (array!22356 (arr!10646 (Array (_ BitVec 32) (_ BitVec 64))) (size!10998 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22355)

(assert (=> b!381271 (= res!216610 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10998 _keys!658))))))

(declare-fun b!381272 () Bool)

(declare-fun res!216607 () Bool)

(assert (=> b!381272 (=> (not res!216607) (not e!231820))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381272 (= res!216607 (and (= (size!10997 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10998 _keys!658) (size!10997 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381273 () Bool)

(declare-fun e!231819 () Bool)

(assert (=> b!381273 (= e!231820 e!231819)))

(declare-fun res!216611 () Bool)

(assert (=> b!381273 (=> (not res!216611) (not e!231819))))

(declare-fun lt!178671 () array!22355)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22355 (_ BitVec 32)) Bool)

(assert (=> b!381273 (= res!216611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178671 mask!970))))

(assert (=> b!381273 (= lt!178671 (array!22356 (store (arr!10646 _keys!658) i!548 k0!778) (size!10998 _keys!658)))))

(declare-fun b!381274 () Bool)

(declare-fun res!216612 () Bool)

(assert (=> b!381274 (=> (not res!216612) (not e!231820))))

(declare-fun arrayContainsKey!0 (array!22355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381274 (= res!216612 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381275 () Bool)

(declare-fun tp_is_empty!9219 () Bool)

(assert (=> b!381275 (= e!231817 tp_is_empty!9219)))

(declare-fun res!216606 () Bool)

(assert (=> start!37444 (=> (not res!216606) (not e!231820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37444 (= res!216606 (validMask!0 mask!970))))

(assert (=> start!37444 e!231820))

(declare-fun array_inv!7838 (array!22353) Bool)

(assert (=> start!37444 (and (array_inv!7838 _values!506) e!231816)))

(assert (=> start!37444 tp!30428))

(assert (=> start!37444 true))

(assert (=> start!37444 tp_is_empty!9219))

(declare-fun array_inv!7839 (array!22355) Bool)

(assert (=> start!37444 (array_inv!7839 _keys!658)))

(declare-fun b!381276 () Bool)

(declare-fun res!216608 () Bool)

(assert (=> b!381276 (=> (not res!216608) (not e!231820))))

(assert (=> b!381276 (= res!216608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381277 () Bool)

(assert (=> b!381277 (= e!231819 (not e!231815))))

(declare-fun res!216614 () Bool)

(assert (=> b!381277 (=> res!216614 e!231815)))

(declare-fun lt!178675 () Bool)

(assert (=> b!381277 (= res!216614 (or (and (not lt!178675) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178675) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178675)))))

(assert (=> b!381277 (= lt!178675 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13397)

(declare-fun lt!178670 () ListLongMap!5161)

(declare-fun minValue!472 () V!13397)

(declare-fun getCurrentListMap!2010 (array!22355 array!22353 (_ BitVec 32) (_ BitVec 32) V!13397 V!13397 (_ BitVec 32) Int) ListLongMap!5161)

(assert (=> b!381277 (= lt!178670 (getCurrentListMap!2010 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178677 () array!22353)

(assert (=> b!381277 (= lt!178674 (getCurrentListMap!2010 lt!178671 lt!178677 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178676 () ListLongMap!5161)

(assert (=> b!381277 (and (= lt!178672 lt!178676) (= lt!178676 lt!178672))))

(declare-fun v!373 () V!13397)

(declare-fun lt!178669 () ListLongMap!5161)

(declare-fun +!940 (ListLongMap!5161 tuple2!6248) ListLongMap!5161)

(assert (=> b!381277 (= lt!178676 (+!940 lt!178669 (tuple2!6249 k0!778 v!373)))))

(declare-datatypes ((Unit!11774 0))(
  ( (Unit!11775) )
))
(declare-fun lt!178673 () Unit!11774)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!168 (array!22355 array!22353 (_ BitVec 32) (_ BitVec 32) V!13397 V!13397 (_ BitVec 32) (_ BitVec 64) V!13397 (_ BitVec 32) Int) Unit!11774)

(assert (=> b!381277 (= lt!178673 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!168 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!844 (array!22355 array!22353 (_ BitVec 32) (_ BitVec 32) V!13397 V!13397 (_ BitVec 32) Int) ListLongMap!5161)

(assert (=> b!381277 (= lt!178672 (getCurrentListMapNoExtraKeys!844 lt!178671 lt!178677 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381277 (= lt!178677 (array!22354 (store (arr!10645 _values!506) i!548 (ValueCellFull!4266 v!373)) (size!10997 _values!506)))))

(assert (=> b!381277 (= lt!178669 (getCurrentListMapNoExtraKeys!844 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381278 () Bool)

(declare-fun res!216613 () Bool)

(assert (=> b!381278 (=> (not res!216613) (not e!231820))))

(declare-datatypes ((List!6082 0))(
  ( (Nil!6079) (Cons!6078 (h!6934 (_ BitVec 64)) (t!11232 List!6082)) )
))
(declare-fun arrayNoDuplicates!0 (array!22355 (_ BitVec 32) List!6082) Bool)

(assert (=> b!381278 (= res!216613 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6079))))

(declare-fun mapNonEmpty!15393 () Bool)

(declare-fun tp!30429 () Bool)

(declare-fun e!231821 () Bool)

(assert (=> mapNonEmpty!15393 (= mapRes!15393 (and tp!30429 e!231821))))

(declare-fun mapRest!15393 () (Array (_ BitVec 32) ValueCell!4266))

(declare-fun mapValue!15393 () ValueCell!4266)

(declare-fun mapKey!15393 () (_ BitVec 32))

(assert (=> mapNonEmpty!15393 (= (arr!10645 _values!506) (store mapRest!15393 mapKey!15393 mapValue!15393))))

(declare-fun b!381279 () Bool)

(assert (=> b!381279 (= e!231821 tp_is_empty!9219)))

(declare-fun b!381280 () Bool)

(declare-fun res!216604 () Bool)

(assert (=> b!381280 (=> (not res!216604) (not e!231820))))

(assert (=> b!381280 (= res!216604 (or (= (select (arr!10646 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10646 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15393 () Bool)

(assert (=> mapIsEmpty!15393 mapRes!15393))

(declare-fun b!381281 () Bool)

(declare-fun res!216605 () Bool)

(assert (=> b!381281 (=> (not res!216605) (not e!231819))))

(assert (=> b!381281 (= res!216605 (arrayNoDuplicates!0 lt!178671 #b00000000000000000000000000000000 Nil!6079))))

(assert (= (and start!37444 res!216606) b!381272))

(assert (= (and b!381272 res!216607) b!381276))

(assert (= (and b!381276 res!216608) b!381278))

(assert (= (and b!381278 res!216613) b!381271))

(assert (= (and b!381271 res!216610) b!381270))

(assert (= (and b!381270 res!216609) b!381280))

(assert (= (and b!381280 res!216604) b!381274))

(assert (= (and b!381274 res!216612) b!381273))

(assert (= (and b!381273 res!216611) b!381281))

(assert (= (and b!381281 res!216605) b!381277))

(assert (= (and b!381277 (not res!216614)) b!381268))

(assert (= (and b!381269 condMapEmpty!15393) mapIsEmpty!15393))

(assert (= (and b!381269 (not condMapEmpty!15393)) mapNonEmpty!15393))

(get-info :version)

(assert (= (and mapNonEmpty!15393 ((_ is ValueCellFull!4266) mapValue!15393)) b!381279))

(assert (= (and b!381269 ((_ is ValueCellFull!4266) mapDefault!15393)) b!381275))

(assert (= start!37444 b!381269))

(declare-fun m!378203 () Bool)

(assert (=> b!381280 m!378203))

(declare-fun m!378205 () Bool)

(assert (=> mapNonEmpty!15393 m!378205))

(declare-fun m!378207 () Bool)

(assert (=> b!381281 m!378207))

(declare-fun m!378209 () Bool)

(assert (=> b!381274 m!378209))

(declare-fun m!378211 () Bool)

(assert (=> b!381278 m!378211))

(declare-fun m!378213 () Bool)

(assert (=> start!37444 m!378213))

(declare-fun m!378215 () Bool)

(assert (=> start!37444 m!378215))

(declare-fun m!378217 () Bool)

(assert (=> start!37444 m!378217))

(declare-fun m!378219 () Bool)

(assert (=> b!381270 m!378219))

(declare-fun m!378221 () Bool)

(assert (=> b!381276 m!378221))

(declare-fun m!378223 () Bool)

(assert (=> b!381273 m!378223))

(declare-fun m!378225 () Bool)

(assert (=> b!381273 m!378225))

(declare-fun m!378227 () Bool)

(assert (=> b!381277 m!378227))

(declare-fun m!378229 () Bool)

(assert (=> b!381277 m!378229))

(declare-fun m!378231 () Bool)

(assert (=> b!381277 m!378231))

(declare-fun m!378233 () Bool)

(assert (=> b!381277 m!378233))

(declare-fun m!378235 () Bool)

(assert (=> b!381277 m!378235))

(declare-fun m!378237 () Bool)

(assert (=> b!381277 m!378237))

(declare-fun m!378239 () Bool)

(assert (=> b!381277 m!378239))

(check-sat (not b!381274) (not mapNonEmpty!15393) tp_is_empty!9219 (not b!381276) (not start!37444) b_and!15813 (not b!381270) (not b!381273) (not b!381281) (not b!381277) (not b_next!8571) (not b!381278))
(check-sat b_and!15813 (not b_next!8571))
