; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38690 () Bool)

(assert start!38690)

(declare-fun b_free!9241 () Bool)

(declare-fun b_next!9241 () Bool)

(assert (=> start!38690 (= b_free!9241 (not b_next!9241))))

(declare-fun tp!32847 () Bool)

(declare-fun b_and!16601 () Bool)

(assert (=> start!38690 (= tp!32847 b_and!16601)))

(declare-datatypes ((V!14603 0))(
  ( (V!14604 (val!5106 Int)) )
))
(declare-datatypes ((tuple2!6766 0))(
  ( (tuple2!6767 (_1!3394 (_ BitVec 64)) (_2!3394 V!14603)) )
))
(declare-datatypes ((List!6669 0))(
  ( (Nil!6666) (Cons!6665 (h!7521 tuple2!6766) (t!11834 List!6669)) )
))
(declare-datatypes ((ListLongMap!5669 0))(
  ( (ListLongMap!5670 (toList!2850 List!6669)) )
))
(declare-fun call!28362 () ListLongMap!5669)

(declare-fun minValue!515 () V!14603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28359 () Bool)

(declare-datatypes ((ValueCell!4718 0))(
  ( (ValueCellFull!4718 (v!7347 V!14603)) (EmptyCell!4718) )
))
(declare-datatypes ((array!24127 0))(
  ( (array!24128 (arr!11513 (Array (_ BitVec 32) ValueCell!4718)) (size!11866 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24127)

(declare-fun zeroValue!515 () V!14603)

(declare-datatypes ((array!24129 0))(
  ( (array!24130 (arr!11514 (Array (_ BitVec 32) (_ BitVec 64))) (size!11867 (_ BitVec 32))) )
))
(declare-fun lt!187715 () array!24129)

(declare-fun v!412 () V!14603)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24129)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54747 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1066 (array!24129 array!24127 (_ BitVec 32) (_ BitVec 32) V!14603 V!14603 (_ BitVec 32) Int) ListLongMap!5669)

(assert (=> bm!28359 (= call!28362 (getCurrentListMapNoExtraKeys!1066 (ite c!54747 _keys!709 lt!187715) (ite c!54747 _values!549 (array!24128 (store (arr!11513 _values!549) i!563 (ValueCellFull!4718 v!412)) (size!11866 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402333 () Bool)

(declare-fun res!231782 () Bool)

(declare-fun e!242362 () Bool)

(assert (=> b!402333 (=> (not res!231782) (not e!242362))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402333 (= res!231782 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402334 () Bool)

(declare-fun res!231787 () Bool)

(declare-fun e!242363 () Bool)

(assert (=> b!402334 (=> (not res!231787) (not e!242363))))

(declare-datatypes ((List!6670 0))(
  ( (Nil!6667) (Cons!6666 (h!7522 (_ BitVec 64)) (t!11835 List!6670)) )
))
(declare-fun arrayNoDuplicates!0 (array!24129 (_ BitVec 32) List!6670) Bool)

(assert (=> b!402334 (= res!231787 (arrayNoDuplicates!0 lt!187715 #b00000000000000000000000000000000 Nil!6667))))

(declare-fun b!402335 () Bool)

(declare-fun e!242360 () Bool)

(declare-fun call!28363 () ListLongMap!5669)

(assert (=> b!402335 (= e!242360 (= call!28362 call!28363))))

(declare-fun b!402336 () Bool)

(declare-fun res!231788 () Bool)

(assert (=> b!402336 (=> (not res!231788) (not e!242362))))

(assert (=> b!402336 (= res!231788 (or (= (select (arr!11514 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11514 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28360 () Bool)

(assert (=> bm!28360 (= call!28363 (getCurrentListMapNoExtraKeys!1066 (ite c!54747 lt!187715 _keys!709) (ite c!54747 (array!24128 (store (arr!11513 _values!549) i!563 (ValueCellFull!4718 v!412)) (size!11866 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402337 () Bool)

(declare-fun res!231783 () Bool)

(assert (=> b!402337 (=> (not res!231783) (not e!242362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402337 (= res!231783 (validMask!0 mask!1025))))

(declare-fun b!402338 () Bool)

(declare-fun res!231784 () Bool)

(assert (=> b!402338 (=> (not res!231784) (not e!242362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24129 (_ BitVec 32)) Bool)

(assert (=> b!402338 (= res!231784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!231790 () Bool)

(assert (=> start!38690 (=> (not res!231790) (not e!242362))))

(assert (=> start!38690 (= res!231790 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11867 _keys!709))))))

(assert (=> start!38690 e!242362))

(declare-fun tp_is_empty!10123 () Bool)

(assert (=> start!38690 tp_is_empty!10123))

(assert (=> start!38690 tp!32847))

(assert (=> start!38690 true))

(declare-fun e!242361 () Bool)

(declare-fun array_inv!8446 (array!24127) Bool)

(assert (=> start!38690 (and (array_inv!8446 _values!549) e!242361)))

(declare-fun array_inv!8447 (array!24129) Bool)

(assert (=> start!38690 (array_inv!8447 _keys!709)))

(declare-fun mapIsEmpty!16806 () Bool)

(declare-fun mapRes!16806 () Bool)

(assert (=> mapIsEmpty!16806 mapRes!16806))

(declare-fun b!402339 () Bool)

(declare-fun e!242359 () Bool)

(assert (=> b!402339 (= e!242361 (and e!242359 mapRes!16806))))

(declare-fun condMapEmpty!16806 () Bool)

(declare-fun mapDefault!16806 () ValueCell!4718)

(assert (=> b!402339 (= condMapEmpty!16806 (= (arr!11513 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4718)) mapDefault!16806)))))

(declare-fun mapNonEmpty!16806 () Bool)

(declare-fun tp!32846 () Bool)

(declare-fun e!242358 () Bool)

(assert (=> mapNonEmpty!16806 (= mapRes!16806 (and tp!32846 e!242358))))

(declare-fun mapRest!16806 () (Array (_ BitVec 32) ValueCell!4718))

(declare-fun mapKey!16806 () (_ BitVec 32))

(declare-fun mapValue!16806 () ValueCell!4718)

(assert (=> mapNonEmpty!16806 (= (arr!11513 _values!549) (store mapRest!16806 mapKey!16806 mapValue!16806))))

(declare-fun b!402340 () Bool)

(declare-fun res!231789 () Bool)

(assert (=> b!402340 (=> (not res!231789) (not e!242362))))

(assert (=> b!402340 (= res!231789 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11867 _keys!709))))))

(declare-fun b!402341 () Bool)

(assert (=> b!402341 (= e!242362 e!242363)))

(declare-fun res!231792 () Bool)

(assert (=> b!402341 (=> (not res!231792) (not e!242363))))

(assert (=> b!402341 (= res!231792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187715 mask!1025))))

(assert (=> b!402341 (= lt!187715 (array!24130 (store (arr!11514 _keys!709) i!563 k0!794) (size!11867 _keys!709)))))

(declare-fun b!402342 () Bool)

(assert (=> b!402342 (= e!242359 tp_is_empty!10123)))

(declare-fun b!402343 () Bool)

(declare-fun +!1154 (ListLongMap!5669 tuple2!6766) ListLongMap!5669)

(assert (=> b!402343 (= e!242360 (= call!28363 (+!1154 call!28362 (tuple2!6767 k0!794 v!412))))))

(declare-fun b!402344 () Bool)

(declare-fun res!231781 () Bool)

(assert (=> b!402344 (=> (not res!231781) (not e!242362))))

(assert (=> b!402344 (= res!231781 (and (= (size!11866 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11867 _keys!709) (size!11866 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402345 () Bool)

(declare-fun res!231791 () Bool)

(assert (=> b!402345 (=> (not res!231791) (not e!242363))))

(assert (=> b!402345 (= res!231791 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11867 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402346 () Bool)

(declare-fun res!231786 () Bool)

(assert (=> b!402346 (=> (not res!231786) (not e!242362))))

(assert (=> b!402346 (= res!231786 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6667))))

(declare-fun b!402347 () Bool)

(assert (=> b!402347 (= e!242358 tp_is_empty!10123)))

(declare-fun b!402348 () Bool)

(declare-fun res!231785 () Bool)

(assert (=> b!402348 (=> (not res!231785) (not e!242362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402348 (= res!231785 (validKeyInArray!0 k0!794))))

(declare-fun b!402349 () Bool)

(assert (=> b!402349 (= e!242363 (not true))))

(assert (=> b!402349 e!242360))

(assert (=> b!402349 (= c!54747 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12156 0))(
  ( (Unit!12157) )
))
(declare-fun lt!187714 () Unit!12156)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!341 (array!24129 array!24127 (_ BitVec 32) (_ BitVec 32) V!14603 V!14603 (_ BitVec 32) (_ BitVec 64) V!14603 (_ BitVec 32) Int) Unit!12156)

(assert (=> b!402349 (= lt!187714 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!341 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38690 res!231790) b!402337))

(assert (= (and b!402337 res!231783) b!402344))

(assert (= (and b!402344 res!231781) b!402338))

(assert (= (and b!402338 res!231784) b!402346))

(assert (= (and b!402346 res!231786) b!402340))

(assert (= (and b!402340 res!231789) b!402348))

(assert (= (and b!402348 res!231785) b!402336))

(assert (= (and b!402336 res!231788) b!402333))

(assert (= (and b!402333 res!231782) b!402341))

(assert (= (and b!402341 res!231792) b!402334))

(assert (= (and b!402334 res!231787) b!402345))

(assert (= (and b!402345 res!231791) b!402349))

(assert (= (and b!402349 c!54747) b!402343))

(assert (= (and b!402349 (not c!54747)) b!402335))

(assert (= (or b!402343 b!402335) bm!28360))

(assert (= (or b!402343 b!402335) bm!28359))

(assert (= (and b!402339 condMapEmpty!16806) mapIsEmpty!16806))

(assert (= (and b!402339 (not condMapEmpty!16806)) mapNonEmpty!16806))

(get-info :version)

(assert (= (and mapNonEmpty!16806 ((_ is ValueCellFull!4718) mapValue!16806)) b!402347))

(assert (= (and b!402339 ((_ is ValueCellFull!4718) mapDefault!16806)) b!402342))

(assert (= start!38690 b!402339))

(declare-fun m!395349 () Bool)

(assert (=> mapNonEmpty!16806 m!395349))

(declare-fun m!395351 () Bool)

(assert (=> b!402349 m!395351))

(declare-fun m!395353 () Bool)

(assert (=> b!402343 m!395353))

(declare-fun m!395355 () Bool)

(assert (=> b!402336 m!395355))

(declare-fun m!395357 () Bool)

(assert (=> start!38690 m!395357))

(declare-fun m!395359 () Bool)

(assert (=> start!38690 m!395359))

(declare-fun m!395361 () Bool)

(assert (=> b!402337 m!395361))

(declare-fun m!395363 () Bool)

(assert (=> b!402346 m!395363))

(declare-fun m!395365 () Bool)

(assert (=> b!402348 m!395365))

(declare-fun m!395367 () Bool)

(assert (=> b!402334 m!395367))

(declare-fun m!395369 () Bool)

(assert (=> b!402333 m!395369))

(declare-fun m!395371 () Bool)

(assert (=> b!402338 m!395371))

(declare-fun m!395373 () Bool)

(assert (=> b!402341 m!395373))

(declare-fun m!395375 () Bool)

(assert (=> b!402341 m!395375))

(declare-fun m!395377 () Bool)

(assert (=> bm!28359 m!395377))

(declare-fun m!395379 () Bool)

(assert (=> bm!28359 m!395379))

(assert (=> bm!28360 m!395377))

(declare-fun m!395381 () Bool)

(assert (=> bm!28360 m!395381))

(check-sat (not b!402341) (not b!402333) (not bm!28360) (not b!402346) (not b!402343) (not b!402349) (not bm!28359) (not b!402334) (not b!402337) (not b!402338) tp_is_empty!10123 (not start!38690) (not b_next!9241) (not mapNonEmpty!16806) (not b!402348) b_and!16601)
(check-sat b_and!16601 (not b_next!9241))
