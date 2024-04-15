; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37844 () Bool)

(assert start!37844)

(declare-fun b_free!8917 () Bool)

(declare-fun b_next!8917 () Bool)

(assert (=> start!37844 (= b_free!8917 (not b_next!8917))))

(declare-fun tp!31508 () Bool)

(declare-fun b_and!16157 () Bool)

(assert (=> start!37844 (= tp!31508 b_and!16157)))

(declare-fun b!388747 () Bool)

(declare-fun e!235534 () Bool)

(declare-fun e!235537 () Bool)

(declare-fun mapRes!15954 () Bool)

(assert (=> b!388747 (= e!235534 (and e!235537 mapRes!15954))))

(declare-fun condMapEmpty!15954 () Bool)

(declare-datatypes ((V!13891 0))(
  ( (V!13892 (val!4839 Int)) )
))
(declare-datatypes ((ValueCell!4451 0))(
  ( (ValueCellFull!4451 (v!7038 V!13891)) (EmptyCell!4451) )
))
(declare-datatypes ((array!23061 0))(
  ( (array!23062 (arr!10997 (Array (_ BitVec 32) ValueCell!4451)) (size!11350 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23061)

(declare-fun mapDefault!15954 () ValueCell!4451)

(assert (=> b!388747 (= condMapEmpty!15954 (= (arr!10997 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4451)) mapDefault!15954)))))

(declare-datatypes ((tuple2!6484 0))(
  ( (tuple2!6485 (_1!3253 (_ BitVec 64)) (_2!3253 V!13891)) )
))
(declare-fun lt!182563 () tuple2!6484)

(declare-fun lt!182561 () tuple2!6484)

(declare-datatypes ((List!6329 0))(
  ( (Nil!6326) (Cons!6325 (h!7181 tuple2!6484) (t!11474 List!6329)) )
))
(declare-datatypes ((ListLongMap!5387 0))(
  ( (ListLongMap!5388 (toList!2709 List!6329)) )
))
(declare-fun lt!182558 () ListLongMap!5387)

(declare-fun e!235535 () Bool)

(declare-fun lt!182555 () ListLongMap!5387)

(declare-fun b!388748 () Bool)

(declare-fun +!1029 (ListLongMap!5387 tuple2!6484) ListLongMap!5387)

(assert (=> b!388748 (= e!235535 (= lt!182555 (+!1029 (+!1029 lt!182558 lt!182563) lt!182561)))))

(declare-fun b!388749 () Bool)

(declare-fun res!222347 () Bool)

(declare-fun e!235531 () Bool)

(assert (=> b!388749 (=> (not res!222347) (not e!235531))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!23063 0))(
  ( (array!23064 (arr!10998 (Array (_ BitVec 32) (_ BitVec 64))) (size!11351 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23063)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!388749 (= res!222347 (and (= (size!11350 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11351 _keys!658) (size!11350 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15954 () Bool)

(assert (=> mapIsEmpty!15954 mapRes!15954))

(declare-fun res!222337 () Bool)

(assert (=> start!37844 (=> (not res!222337) (not e!235531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37844 (= res!222337 (validMask!0 mask!970))))

(assert (=> start!37844 e!235531))

(declare-fun array_inv!8086 (array!23061) Bool)

(assert (=> start!37844 (and (array_inv!8086 _values!506) e!235534)))

(assert (=> start!37844 tp!31508))

(assert (=> start!37844 true))

(declare-fun tp_is_empty!9589 () Bool)

(assert (=> start!37844 tp_is_empty!9589))

(declare-fun array_inv!8087 (array!23063) Bool)

(assert (=> start!37844 (array_inv!8087 _keys!658)))

(declare-fun b!388750 () Bool)

(declare-fun res!222343 () Bool)

(assert (=> b!388750 (=> (not res!222343) (not e!235531))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388750 (= res!222343 (or (= (select (arr!10998 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10998 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388751 () Bool)

(declare-fun e!235532 () Bool)

(declare-fun e!235536 () Bool)

(assert (=> b!388751 (= e!235532 (not e!235536))))

(declare-fun res!222344 () Bool)

(assert (=> b!388751 (=> res!222344 e!235536)))

(assert (=> b!388751 (= res!222344 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13891)

(declare-fun minValue!472 () V!13891)

(declare-fun getCurrentListMap!2038 (array!23063 array!23061 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) Int) ListLongMap!5387)

(assert (=> b!388751 (= lt!182555 (getCurrentListMap!2038 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182557 () ListLongMap!5387)

(declare-fun lt!182554 () array!23061)

(declare-fun lt!182556 () array!23063)

(assert (=> b!388751 (= lt!182557 (getCurrentListMap!2038 lt!182556 lt!182554 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182562 () ListLongMap!5387)

(declare-fun lt!182559 () ListLongMap!5387)

(assert (=> b!388751 (and (= lt!182562 lt!182559) (= lt!182559 lt!182562))))

(declare-fun v!373 () V!13891)

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!388751 (= lt!182559 (+!1029 lt!182558 (tuple2!6485 k0!778 v!373)))))

(declare-datatypes ((Unit!11902 0))(
  ( (Unit!11903) )
))
(declare-fun lt!182560 () Unit!11902)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!239 (array!23063 array!23061 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) (_ BitVec 64) V!13891 (_ BitVec 32) Int) Unit!11902)

(assert (=> b!388751 (= lt!182560 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!239 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!948 (array!23063 array!23061 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) Int) ListLongMap!5387)

(assert (=> b!388751 (= lt!182562 (getCurrentListMapNoExtraKeys!948 lt!182556 lt!182554 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388751 (= lt!182554 (array!23062 (store (arr!10997 _values!506) i!548 (ValueCellFull!4451 v!373)) (size!11350 _values!506)))))

(assert (=> b!388751 (= lt!182558 (getCurrentListMapNoExtraKeys!948 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15954 () Bool)

(declare-fun tp!31509 () Bool)

(declare-fun e!235538 () Bool)

(assert (=> mapNonEmpty!15954 (= mapRes!15954 (and tp!31509 e!235538))))

(declare-fun mapKey!15954 () (_ BitVec 32))

(declare-fun mapValue!15954 () ValueCell!4451)

(declare-fun mapRest!15954 () (Array (_ BitVec 32) ValueCell!4451))

(assert (=> mapNonEmpty!15954 (= (arr!10997 _values!506) (store mapRest!15954 mapKey!15954 mapValue!15954))))

(declare-fun b!388752 () Bool)

(declare-fun res!222341 () Bool)

(assert (=> b!388752 (=> (not res!222341) (not e!235531))))

(declare-datatypes ((List!6330 0))(
  ( (Nil!6327) (Cons!6326 (h!7182 (_ BitVec 64)) (t!11475 List!6330)) )
))
(declare-fun arrayNoDuplicates!0 (array!23063 (_ BitVec 32) List!6330) Bool)

(assert (=> b!388752 (= res!222341 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6327))))

(declare-fun b!388753 () Bool)

(assert (=> b!388753 (= e!235536 (= lt!182557 (+!1029 (+!1029 lt!182559 lt!182563) lt!182561)))))

(assert (=> b!388753 e!235535))

(declare-fun res!222345 () Bool)

(assert (=> b!388753 (=> (not res!222345) (not e!235535))))

(assert (=> b!388753 (= res!222345 (= lt!182557 (+!1029 (+!1029 lt!182562 lt!182563) lt!182561)))))

(assert (=> b!388753 (= lt!182561 (tuple2!6485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!388753 (= lt!182563 (tuple2!6485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!388754 () Bool)

(declare-fun res!222340 () Bool)

(assert (=> b!388754 (=> (not res!222340) (not e!235531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388754 (= res!222340 (validKeyInArray!0 k0!778))))

(declare-fun b!388755 () Bool)

(declare-fun res!222336 () Bool)

(assert (=> b!388755 (=> (not res!222336) (not e!235531))))

(declare-fun arrayContainsKey!0 (array!23063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388755 (= res!222336 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388756 () Bool)

(assert (=> b!388756 (= e!235537 tp_is_empty!9589)))

(declare-fun b!388757 () Bool)

(declare-fun res!222339 () Bool)

(assert (=> b!388757 (=> (not res!222339) (not e!235531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23063 (_ BitVec 32)) Bool)

(assert (=> b!388757 (= res!222339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388758 () Bool)

(declare-fun res!222342 () Bool)

(assert (=> b!388758 (=> (not res!222342) (not e!235532))))

(assert (=> b!388758 (= res!222342 (arrayNoDuplicates!0 lt!182556 #b00000000000000000000000000000000 Nil!6327))))

(declare-fun b!388759 () Bool)

(declare-fun res!222346 () Bool)

(assert (=> b!388759 (=> (not res!222346) (not e!235531))))

(assert (=> b!388759 (= res!222346 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11351 _keys!658))))))

(declare-fun b!388760 () Bool)

(assert (=> b!388760 (= e!235531 e!235532)))

(declare-fun res!222338 () Bool)

(assert (=> b!388760 (=> (not res!222338) (not e!235532))))

(assert (=> b!388760 (= res!222338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182556 mask!970))))

(assert (=> b!388760 (= lt!182556 (array!23064 (store (arr!10998 _keys!658) i!548 k0!778) (size!11351 _keys!658)))))

(declare-fun b!388761 () Bool)

(assert (=> b!388761 (= e!235538 tp_is_empty!9589)))

(assert (= (and start!37844 res!222337) b!388749))

(assert (= (and b!388749 res!222347) b!388757))

(assert (= (and b!388757 res!222339) b!388752))

(assert (= (and b!388752 res!222341) b!388759))

(assert (= (and b!388759 res!222346) b!388754))

(assert (= (and b!388754 res!222340) b!388750))

(assert (= (and b!388750 res!222343) b!388755))

(assert (= (and b!388755 res!222336) b!388760))

(assert (= (and b!388760 res!222338) b!388758))

(assert (= (and b!388758 res!222342) b!388751))

(assert (= (and b!388751 (not res!222344)) b!388753))

(assert (= (and b!388753 res!222345) b!388748))

(assert (= (and b!388747 condMapEmpty!15954) mapIsEmpty!15954))

(assert (= (and b!388747 (not condMapEmpty!15954)) mapNonEmpty!15954))

(get-info :version)

(assert (= (and mapNonEmpty!15954 ((_ is ValueCellFull!4451) mapValue!15954)) b!388761))

(assert (= (and b!388747 ((_ is ValueCellFull!4451) mapDefault!15954)) b!388756))

(assert (= start!37844 b!388747))

(declare-fun m!384295 () Bool)

(assert (=> b!388753 m!384295))

(assert (=> b!388753 m!384295))

(declare-fun m!384297 () Bool)

(assert (=> b!388753 m!384297))

(declare-fun m!384299 () Bool)

(assert (=> b!388753 m!384299))

(assert (=> b!388753 m!384299))

(declare-fun m!384301 () Bool)

(assert (=> b!388753 m!384301))

(declare-fun m!384303 () Bool)

(assert (=> b!388752 m!384303))

(declare-fun m!384305 () Bool)

(assert (=> start!37844 m!384305))

(declare-fun m!384307 () Bool)

(assert (=> start!37844 m!384307))

(declare-fun m!384309 () Bool)

(assert (=> start!37844 m!384309))

(declare-fun m!384311 () Bool)

(assert (=> b!388750 m!384311))

(declare-fun m!384313 () Bool)

(assert (=> b!388751 m!384313))

(declare-fun m!384315 () Bool)

(assert (=> b!388751 m!384315))

(declare-fun m!384317 () Bool)

(assert (=> b!388751 m!384317))

(declare-fun m!384319 () Bool)

(assert (=> b!388751 m!384319))

(declare-fun m!384321 () Bool)

(assert (=> b!388751 m!384321))

(declare-fun m!384323 () Bool)

(assert (=> b!388751 m!384323))

(declare-fun m!384325 () Bool)

(assert (=> b!388751 m!384325))

(declare-fun m!384327 () Bool)

(assert (=> b!388760 m!384327))

(declare-fun m!384329 () Bool)

(assert (=> b!388760 m!384329))

(declare-fun m!384331 () Bool)

(assert (=> b!388758 m!384331))

(declare-fun m!384333 () Bool)

(assert (=> mapNonEmpty!15954 m!384333))

(declare-fun m!384335 () Bool)

(assert (=> b!388757 m!384335))

(declare-fun m!384337 () Bool)

(assert (=> b!388748 m!384337))

(assert (=> b!388748 m!384337))

(declare-fun m!384339 () Bool)

(assert (=> b!388748 m!384339))

(declare-fun m!384341 () Bool)

(assert (=> b!388754 m!384341))

(declare-fun m!384343 () Bool)

(assert (=> b!388755 m!384343))

(check-sat (not b!388760) (not b!388752) (not b!388758) (not b!388755) tp_is_empty!9589 (not b_next!8917) (not b!388753) (not b!388748) (not start!37844) (not b!388757) (not mapNonEmpty!15954) b_and!16157 (not b!388754) (not b!388751))
(check-sat b_and!16157 (not b_next!8917))
