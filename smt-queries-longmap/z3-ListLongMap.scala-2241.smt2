; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36894 () Bool)

(assert start!36894)

(declare-fun b_free!8035 () Bool)

(declare-fun b_next!8035 () Bool)

(assert (=> start!36894 (= b_free!8035 (not b_next!8035))))

(declare-fun tp!28821 () Bool)

(declare-fun b_and!15251 () Bool)

(assert (=> start!36894 (= tp!28821 b_and!15251)))

(declare-fun b!369451 () Bool)

(declare-fun res!207350 () Bool)

(declare-fun e!225754 () Bool)

(assert (=> b!369451 (=> (not res!207350) (not e!225754))))

(declare-datatypes ((array!21301 0))(
  ( (array!21302 (arr!10119 (Array (_ BitVec 32) (_ BitVec 64))) (size!10472 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21301)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21301 (_ BitVec 32)) Bool)

(assert (=> b!369451 (= res!207350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369452 () Bool)

(declare-fun res!207349 () Bool)

(assert (=> b!369452 (=> (not res!207349) (not e!225754))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369452 (= res!207349 (or (= (select (arr!10119 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10119 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369453 () Bool)

(declare-fun res!207344 () Bool)

(assert (=> b!369453 (=> (not res!207344) (not e!225754))))

(assert (=> b!369453 (= res!207344 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10472 _keys!658))))))

(declare-fun b!369454 () Bool)

(declare-fun res!207342 () Bool)

(assert (=> b!369454 (=> (not res!207342) (not e!225754))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369454 (= res!207342 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369455 () Bool)

(declare-fun e!225750 () Bool)

(declare-fun tp_is_empty!8683 () Bool)

(assert (=> b!369455 (= e!225750 tp_is_empty!8683)))

(declare-fun mapIsEmpty!14589 () Bool)

(declare-fun mapRes!14589 () Bool)

(assert (=> mapIsEmpty!14589 mapRes!14589))

(declare-fun res!207345 () Bool)

(assert (=> start!36894 (=> (not res!207345) (not e!225754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36894 (= res!207345 (validMask!0 mask!970))))

(assert (=> start!36894 e!225754))

(declare-datatypes ((V!12683 0))(
  ( (V!12684 (val!4386 Int)) )
))
(declare-datatypes ((ValueCell!3998 0))(
  ( (ValueCellFull!3998 (v!6577 V!12683)) (EmptyCell!3998) )
))
(declare-datatypes ((array!21303 0))(
  ( (array!21304 (arr!10120 (Array (_ BitVec 32) ValueCell!3998)) (size!10473 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21303)

(declare-fun e!225751 () Bool)

(declare-fun array_inv!7490 (array!21303) Bool)

(assert (=> start!36894 (and (array_inv!7490 _values!506) e!225751)))

(assert (=> start!36894 tp!28821))

(assert (=> start!36894 true))

(assert (=> start!36894 tp_is_empty!8683))

(declare-fun array_inv!7491 (array!21301) Bool)

(assert (=> start!36894 (array_inv!7491 _keys!658)))

(declare-fun b!369456 () Bool)

(declare-fun res!207341 () Bool)

(assert (=> b!369456 (=> (not res!207341) (not e!225754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369456 (= res!207341 (validKeyInArray!0 k0!778))))

(declare-fun b!369457 () Bool)

(declare-fun e!225755 () Bool)

(assert (=> b!369457 (= e!225751 (and e!225755 mapRes!14589))))

(declare-fun condMapEmpty!14589 () Bool)

(declare-fun mapDefault!14589 () ValueCell!3998)

(assert (=> b!369457 (= condMapEmpty!14589 (= (arr!10120 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3998)) mapDefault!14589)))))

(declare-fun b!369458 () Bool)

(declare-fun e!225752 () Bool)

(assert (=> b!369458 (= e!225752 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12683)

(declare-datatypes ((tuple2!5790 0))(
  ( (tuple2!5791 (_1!2906 (_ BitVec 64)) (_2!2906 V!12683)) )
))
(declare-datatypes ((List!5620 0))(
  ( (Nil!5617) (Cons!5616 (h!6472 tuple2!5790) (t!10761 List!5620)) )
))
(declare-datatypes ((ListLongMap!4693 0))(
  ( (ListLongMap!4694 (toList!2362 List!5620)) )
))
(declare-fun lt!169568 () ListLongMap!4693)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12683)

(declare-fun lt!169567 () array!21301)

(declare-fun minValue!472 () V!12683)

(declare-fun getCurrentListMapNoExtraKeys!653 (array!21301 array!21303 (_ BitVec 32) (_ BitVec 32) V!12683 V!12683 (_ BitVec 32) Int) ListLongMap!4693)

(assert (=> b!369458 (= lt!169568 (getCurrentListMapNoExtraKeys!653 lt!169567 (array!21304 (store (arr!10120 _values!506) i!548 (ValueCellFull!3998 v!373)) (size!10473 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169569 () ListLongMap!4693)

(assert (=> b!369458 (= lt!169569 (getCurrentListMapNoExtraKeys!653 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14589 () Bool)

(declare-fun tp!28820 () Bool)

(assert (=> mapNonEmpty!14589 (= mapRes!14589 (and tp!28820 e!225750))))

(declare-fun mapValue!14589 () ValueCell!3998)

(declare-fun mapKey!14589 () (_ BitVec 32))

(declare-fun mapRest!14589 () (Array (_ BitVec 32) ValueCell!3998))

(assert (=> mapNonEmpty!14589 (= (arr!10120 _values!506) (store mapRest!14589 mapKey!14589 mapValue!14589))))

(declare-fun b!369459 () Bool)

(declare-fun res!207348 () Bool)

(assert (=> b!369459 (=> (not res!207348) (not e!225752))))

(declare-datatypes ((List!5621 0))(
  ( (Nil!5618) (Cons!5617 (h!6473 (_ BitVec 64)) (t!10762 List!5621)) )
))
(declare-fun arrayNoDuplicates!0 (array!21301 (_ BitVec 32) List!5621) Bool)

(assert (=> b!369459 (= res!207348 (arrayNoDuplicates!0 lt!169567 #b00000000000000000000000000000000 Nil!5618))))

(declare-fun b!369460 () Bool)

(assert (=> b!369460 (= e!225754 e!225752)))

(declare-fun res!207347 () Bool)

(assert (=> b!369460 (=> (not res!207347) (not e!225752))))

(assert (=> b!369460 (= res!207347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169567 mask!970))))

(assert (=> b!369460 (= lt!169567 (array!21302 (store (arr!10119 _keys!658) i!548 k0!778) (size!10472 _keys!658)))))

(declare-fun b!369461 () Bool)

(declare-fun res!207343 () Bool)

(assert (=> b!369461 (=> (not res!207343) (not e!225754))))

(assert (=> b!369461 (= res!207343 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5618))))

(declare-fun b!369462 () Bool)

(declare-fun res!207346 () Bool)

(assert (=> b!369462 (=> (not res!207346) (not e!225754))))

(assert (=> b!369462 (= res!207346 (and (= (size!10473 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10472 _keys!658) (size!10473 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369463 () Bool)

(assert (=> b!369463 (= e!225755 tp_is_empty!8683)))

(assert (= (and start!36894 res!207345) b!369462))

(assert (= (and b!369462 res!207346) b!369451))

(assert (= (and b!369451 res!207350) b!369461))

(assert (= (and b!369461 res!207343) b!369453))

(assert (= (and b!369453 res!207344) b!369456))

(assert (= (and b!369456 res!207341) b!369452))

(assert (= (and b!369452 res!207349) b!369454))

(assert (= (and b!369454 res!207342) b!369460))

(assert (= (and b!369460 res!207347) b!369459))

(assert (= (and b!369459 res!207348) b!369458))

(assert (= (and b!369457 condMapEmpty!14589) mapIsEmpty!14589))

(assert (= (and b!369457 (not condMapEmpty!14589)) mapNonEmpty!14589))

(get-info :version)

(assert (= (and mapNonEmpty!14589 ((_ is ValueCellFull!3998) mapValue!14589)) b!369455))

(assert (= (and b!369457 ((_ is ValueCellFull!3998) mapDefault!14589)) b!369463))

(assert (= start!36894 b!369457))

(declare-fun m!365309 () Bool)

(assert (=> b!369461 m!365309))

(declare-fun m!365311 () Bool)

(assert (=> start!36894 m!365311))

(declare-fun m!365313 () Bool)

(assert (=> start!36894 m!365313))

(declare-fun m!365315 () Bool)

(assert (=> start!36894 m!365315))

(declare-fun m!365317 () Bool)

(assert (=> b!369451 m!365317))

(declare-fun m!365319 () Bool)

(assert (=> b!369456 m!365319))

(declare-fun m!365321 () Bool)

(assert (=> mapNonEmpty!14589 m!365321))

(declare-fun m!365323 () Bool)

(assert (=> b!369458 m!365323))

(declare-fun m!365325 () Bool)

(assert (=> b!369458 m!365325))

(declare-fun m!365327 () Bool)

(assert (=> b!369458 m!365327))

(declare-fun m!365329 () Bool)

(assert (=> b!369454 m!365329))

(declare-fun m!365331 () Bool)

(assert (=> b!369459 m!365331))

(declare-fun m!365333 () Bool)

(assert (=> b!369460 m!365333))

(declare-fun m!365335 () Bool)

(assert (=> b!369460 m!365335))

(declare-fun m!365337 () Bool)

(assert (=> b!369452 m!365337))

(check-sat (not b!369451) (not b!369454) tp_is_empty!8683 (not b!369456) (not start!36894) (not b!369459) (not b!369461) (not mapNonEmpty!14589) (not b!369458) b_and!15251 (not b!369460) (not b_next!8035))
(check-sat b_and!15251 (not b_next!8035))
