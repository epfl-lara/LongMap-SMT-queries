; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37696 () Bool)

(assert start!37696)

(declare-fun b_free!8799 () Bool)

(declare-fun b_next!8799 () Bool)

(assert (=> start!37696 (= b_free!8799 (not b_next!8799))))

(declare-fun tp!31149 () Bool)

(declare-fun b_and!16041 () Bool)

(assert (=> start!37696 (= tp!31149 b_and!16041)))

(declare-fun b!386285 () Bool)

(declare-fun res!220494 () Bool)

(declare-fun e!234357 () Bool)

(assert (=> b!386285 (=> (not res!220494) (not e!234357))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386285 (= res!220494 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15771 () Bool)

(declare-fun mapRes!15771 () Bool)

(assert (=> mapIsEmpty!15771 mapRes!15771))

(declare-fun b!386286 () Bool)

(declare-fun e!234361 () Bool)

(declare-fun tp_is_empty!9471 () Bool)

(assert (=> b!386286 (= e!234361 tp_is_empty!9471)))

(declare-fun res!220490 () Bool)

(assert (=> start!37696 (=> (not res!220490) (not e!234357))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37696 (= res!220490 (validMask!0 mask!970))))

(assert (=> start!37696 e!234357))

(declare-datatypes ((V!13733 0))(
  ( (V!13734 (val!4780 Int)) )
))
(declare-datatypes ((ValueCell!4392 0))(
  ( (ValueCellFull!4392 (v!6977 V!13733)) (EmptyCell!4392) )
))
(declare-datatypes ((array!22839 0))(
  ( (array!22840 (arr!10888 (Array (_ BitVec 32) ValueCell!4392)) (size!11240 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22839)

(declare-fun e!234359 () Bool)

(declare-fun array_inv!8010 (array!22839) Bool)

(assert (=> start!37696 (and (array_inv!8010 _values!506) e!234359)))

(assert (=> start!37696 tp!31149))

(assert (=> start!37696 true))

(assert (=> start!37696 tp_is_empty!9471))

(declare-datatypes ((array!22841 0))(
  ( (array!22842 (arr!10889 (Array (_ BitVec 32) (_ BitVec 64))) (size!11241 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22841)

(declare-fun array_inv!8011 (array!22841) Bool)

(assert (=> start!37696 (array_inv!8011 _keys!658)))

(declare-fun b!386287 () Bool)

(declare-fun e!234360 () Bool)

(assert (=> b!386287 (= e!234357 e!234360)))

(declare-fun res!220491 () Bool)

(assert (=> b!386287 (=> (not res!220491) (not e!234360))))

(declare-fun lt!181772 () array!22841)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22841 (_ BitVec 32)) Bool)

(assert (=> b!386287 (= res!220491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181772 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386287 (= lt!181772 (array!22842 (store (arr!10889 _keys!658) i!548 k0!778) (size!11241 _keys!658)))))

(declare-fun b!386288 () Bool)

(declare-fun e!234362 () Bool)

(assert (=> b!386288 (= e!234362 tp_is_empty!9471)))

(declare-fun b!386289 () Bool)

(declare-fun res!220493 () Bool)

(assert (=> b!386289 (=> (not res!220493) (not e!234357))))

(assert (=> b!386289 (= res!220493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386290 () Bool)

(declare-fun res!220496 () Bool)

(assert (=> b!386290 (=> (not res!220496) (not e!234357))))

(assert (=> b!386290 (= res!220496 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11241 _keys!658))))))

(declare-fun b!386291 () Bool)

(declare-fun res!220492 () Bool)

(assert (=> b!386291 (=> (not res!220492) (not e!234360))))

(declare-datatypes ((List!6272 0))(
  ( (Nil!6269) (Cons!6268 (h!7124 (_ BitVec 64)) (t!11422 List!6272)) )
))
(declare-fun arrayNoDuplicates!0 (array!22841 (_ BitVec 32) List!6272) Bool)

(assert (=> b!386291 (= res!220492 (arrayNoDuplicates!0 lt!181772 #b00000000000000000000000000000000 Nil!6269))))

(declare-fun mapNonEmpty!15771 () Bool)

(declare-fun tp!31148 () Bool)

(assert (=> mapNonEmpty!15771 (= mapRes!15771 (and tp!31148 e!234361))))

(declare-fun mapValue!15771 () ValueCell!4392)

(declare-fun mapRest!15771 () (Array (_ BitVec 32) ValueCell!4392))

(declare-fun mapKey!15771 () (_ BitVec 32))

(assert (=> mapNonEmpty!15771 (= (arr!10888 _values!506) (store mapRest!15771 mapKey!15771 mapValue!15771))))

(declare-fun b!386292 () Bool)

(assert (=> b!386292 (= e!234359 (and e!234362 mapRes!15771))))

(declare-fun condMapEmpty!15771 () Bool)

(declare-fun mapDefault!15771 () ValueCell!4392)

(assert (=> b!386292 (= condMapEmpty!15771 (= (arr!10888 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4392)) mapDefault!15771)))))

(declare-fun b!386293 () Bool)

(assert (=> b!386293 (= e!234360 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13733)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13733)

(declare-datatypes ((tuple2!6426 0))(
  ( (tuple2!6427 (_1!3224 (_ BitVec 64)) (_2!3224 V!13733)) )
))
(declare-datatypes ((List!6273 0))(
  ( (Nil!6270) (Cons!6269 (h!7125 tuple2!6426) (t!11423 List!6273)) )
))
(declare-datatypes ((ListLongMap!5339 0))(
  ( (ListLongMap!5340 (toList!2685 List!6273)) )
))
(declare-fun lt!181771 () ListLongMap!5339)

(declare-fun minValue!472 () V!13733)

(declare-fun getCurrentListMapNoExtraKeys!914 (array!22841 array!22839 (_ BitVec 32) (_ BitVec 32) V!13733 V!13733 (_ BitVec 32) Int) ListLongMap!5339)

(assert (=> b!386293 (= lt!181771 (getCurrentListMapNoExtraKeys!914 lt!181772 (array!22840 (store (arr!10888 _values!506) i!548 (ValueCellFull!4392 v!373)) (size!11240 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181773 () ListLongMap!5339)

(assert (=> b!386293 (= lt!181773 (getCurrentListMapNoExtraKeys!914 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386294 () Bool)

(declare-fun res!220495 () Bool)

(assert (=> b!386294 (=> (not res!220495) (not e!234357))))

(assert (=> b!386294 (= res!220495 (and (= (size!11240 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11241 _keys!658) (size!11240 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386295 () Bool)

(declare-fun res!220489 () Bool)

(assert (=> b!386295 (=> (not res!220489) (not e!234357))))

(assert (=> b!386295 (= res!220489 (or (= (select (arr!10889 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10889 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386296 () Bool)

(declare-fun res!220487 () Bool)

(assert (=> b!386296 (=> (not res!220487) (not e!234357))))

(assert (=> b!386296 (= res!220487 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6269))))

(declare-fun b!386297 () Bool)

(declare-fun res!220488 () Bool)

(assert (=> b!386297 (=> (not res!220488) (not e!234357))))

(declare-fun arrayContainsKey!0 (array!22841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386297 (= res!220488 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37696 res!220490) b!386294))

(assert (= (and b!386294 res!220495) b!386289))

(assert (= (and b!386289 res!220493) b!386296))

(assert (= (and b!386296 res!220487) b!386290))

(assert (= (and b!386290 res!220496) b!386285))

(assert (= (and b!386285 res!220494) b!386295))

(assert (= (and b!386295 res!220489) b!386297))

(assert (= (and b!386297 res!220488) b!386287))

(assert (= (and b!386287 res!220491) b!386291))

(assert (= (and b!386291 res!220492) b!386293))

(assert (= (and b!386292 condMapEmpty!15771) mapIsEmpty!15771))

(assert (= (and b!386292 (not condMapEmpty!15771)) mapNonEmpty!15771))

(get-info :version)

(assert (= (and mapNonEmpty!15771 ((_ is ValueCellFull!4392) mapValue!15771)) b!386286))

(assert (= (and b!386292 ((_ is ValueCellFull!4392) mapDefault!15771)) b!386288))

(assert (= start!37696 b!386292))

(declare-fun m!382665 () Bool)

(assert (=> start!37696 m!382665))

(declare-fun m!382667 () Bool)

(assert (=> start!37696 m!382667))

(declare-fun m!382669 () Bool)

(assert (=> start!37696 m!382669))

(declare-fun m!382671 () Bool)

(assert (=> b!386295 m!382671))

(declare-fun m!382673 () Bool)

(assert (=> b!386297 m!382673))

(declare-fun m!382675 () Bool)

(assert (=> mapNonEmpty!15771 m!382675))

(declare-fun m!382677 () Bool)

(assert (=> b!386289 m!382677))

(declare-fun m!382679 () Bool)

(assert (=> b!386293 m!382679))

(declare-fun m!382681 () Bool)

(assert (=> b!386293 m!382681))

(declare-fun m!382683 () Bool)

(assert (=> b!386293 m!382683))

(declare-fun m!382685 () Bool)

(assert (=> b!386296 m!382685))

(declare-fun m!382687 () Bool)

(assert (=> b!386287 m!382687))

(declare-fun m!382689 () Bool)

(assert (=> b!386287 m!382689))

(declare-fun m!382691 () Bool)

(assert (=> b!386291 m!382691))

(declare-fun m!382693 () Bool)

(assert (=> b!386285 m!382693))

(check-sat (not b!386291) tp_is_empty!9471 (not start!37696) (not b!386297) (not b!386289) (not mapNonEmpty!15771) (not b!386293) b_and!16041 (not b_next!8799) (not b!386285) (not b!386296) (not b!386287))
(check-sat b_and!16041 (not b_next!8799))
