; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37440 () Bool)

(assert start!37440)

(declare-fun b_free!8581 () Bool)

(declare-fun b_next!8581 () Bool)

(assert (=> start!37440 (= b_free!8581 (not b_next!8581))))

(declare-fun tp!30458 () Bool)

(declare-fun b_and!15797 () Bool)

(assert (=> start!37440 (= tp!30458 b_and!15797)))

(declare-fun b!381207 () Bool)

(declare-fun res!216642 () Bool)

(declare-fun e!231746 () Bool)

(assert (=> b!381207 (=> (not res!216642) (not e!231746))))

(declare-datatypes ((array!22355 0))(
  ( (array!22356 (arr!10646 (Array (_ BitVec 32) (_ BitVec 64))) (size!10999 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22355)

(declare-datatypes ((List!6055 0))(
  ( (Nil!6052) (Cons!6051 (h!6907 (_ BitVec 64)) (t!11196 List!6055)) )
))
(declare-fun arrayNoDuplicates!0 (array!22355 (_ BitVec 32) List!6055) Bool)

(assert (=> b!381207 (= res!216642 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6052))))

(declare-fun b!381208 () Bool)

(declare-fun res!216646 () Bool)

(assert (=> b!381208 (=> (not res!216646) (not e!231746))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22355 (_ BitVec 32)) Bool)

(assert (=> b!381208 (= res!216646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381209 () Bool)

(declare-fun res!216647 () Bool)

(assert (=> b!381209 (=> (not res!216647) (not e!231746))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381209 (= res!216647 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10999 _keys!658))))))

(declare-fun b!381211 () Bool)

(declare-fun e!231752 () Bool)

(declare-fun e!231748 () Bool)

(declare-fun mapRes!15408 () Bool)

(assert (=> b!381211 (= e!231752 (and e!231748 mapRes!15408))))

(declare-fun condMapEmpty!15408 () Bool)

(declare-datatypes ((V!13411 0))(
  ( (V!13412 (val!4659 Int)) )
))
(declare-datatypes ((ValueCell!4271 0))(
  ( (ValueCellFull!4271 (v!6850 V!13411)) (EmptyCell!4271) )
))
(declare-datatypes ((array!22357 0))(
  ( (array!22358 (arr!10647 (Array (_ BitVec 32) ValueCell!4271)) (size!11000 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22357)

(declare-fun mapDefault!15408 () ValueCell!4271)

(assert (=> b!381211 (= condMapEmpty!15408 (= (arr!10647 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4271)) mapDefault!15408)))))

(declare-fun b!381212 () Bool)

(declare-fun res!216649 () Bool)

(assert (=> b!381212 (=> (not res!216649) (not e!231746))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381212 (= res!216649 (and (= (size!11000 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10999 _keys!658) (size!11000 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381213 () Bool)

(declare-fun res!216641 () Bool)

(assert (=> b!381213 (=> (not res!216641) (not e!231746))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381213 (= res!216641 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381214 () Bool)

(declare-fun e!231747 () Bool)

(assert (=> b!381214 (= e!231746 e!231747)))

(declare-fun res!216644 () Bool)

(assert (=> b!381214 (=> (not res!216644) (not e!231747))))

(declare-fun lt!178577 () array!22355)

(assert (=> b!381214 (= res!216644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178577 mask!970))))

(assert (=> b!381214 (= lt!178577 (array!22356 (store (arr!10646 _keys!658) i!548 k0!778) (size!10999 _keys!658)))))

(declare-fun b!381215 () Bool)

(declare-fun e!231749 () Bool)

(assert (=> b!381215 (= e!231749 true)))

(declare-datatypes ((tuple2!6228 0))(
  ( (tuple2!6229 (_1!3125 (_ BitVec 64)) (_2!3125 V!13411)) )
))
(declare-datatypes ((List!6056 0))(
  ( (Nil!6053) (Cons!6052 (h!6908 tuple2!6228) (t!11197 List!6056)) )
))
(declare-datatypes ((ListLongMap!5131 0))(
  ( (ListLongMap!5132 (toList!2581 List!6056)) )
))
(declare-fun lt!178570 () ListLongMap!5131)

(declare-fun lt!178571 () ListLongMap!5131)

(assert (=> b!381215 (= lt!178570 lt!178571)))

(declare-fun b!381216 () Bool)

(declare-fun e!231751 () Bool)

(declare-fun tp_is_empty!9229 () Bool)

(assert (=> b!381216 (= e!231751 tp_is_empty!9229)))

(declare-fun b!381210 () Bool)

(declare-fun res!216648 () Bool)

(assert (=> b!381210 (=> (not res!216648) (not e!231747))))

(assert (=> b!381210 (= res!216648 (arrayNoDuplicates!0 lt!178577 #b00000000000000000000000000000000 Nil!6052))))

(declare-fun res!216640 () Bool)

(assert (=> start!37440 (=> (not res!216640) (not e!231746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37440 (= res!216640 (validMask!0 mask!970))))

(assert (=> start!37440 e!231746))

(declare-fun array_inv!7840 (array!22357) Bool)

(assert (=> start!37440 (and (array_inv!7840 _values!506) e!231752)))

(assert (=> start!37440 tp!30458))

(assert (=> start!37440 true))

(assert (=> start!37440 tp_is_empty!9229))

(declare-fun array_inv!7841 (array!22355) Bool)

(assert (=> start!37440 (array_inv!7841 _keys!658)))

(declare-fun b!381217 () Bool)

(assert (=> b!381217 (= e!231747 (not e!231749))))

(declare-fun res!216650 () Bool)

(assert (=> b!381217 (=> res!216650 e!231749)))

(declare-fun lt!178572 () Bool)

(assert (=> b!381217 (= res!216650 (or (and (not lt!178572) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178572) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178572)))))

(assert (=> b!381217 (= lt!178572 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13411)

(declare-fun lt!178573 () ListLongMap!5131)

(declare-fun minValue!472 () V!13411)

(declare-fun getCurrentListMap!1971 (array!22355 array!22357 (_ BitVec 32) (_ BitVec 32) V!13411 V!13411 (_ BitVec 32) Int) ListLongMap!5131)

(assert (=> b!381217 (= lt!178573 (getCurrentListMap!1971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178578 () array!22357)

(assert (=> b!381217 (= lt!178570 (getCurrentListMap!1971 lt!178577 lt!178578 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178574 () ListLongMap!5131)

(assert (=> b!381217 (and (= lt!178571 lt!178574) (= lt!178574 lt!178571))))

(declare-fun v!373 () V!13411)

(declare-fun lt!178575 () ListLongMap!5131)

(declare-fun +!945 (ListLongMap!5131 tuple2!6228) ListLongMap!5131)

(assert (=> b!381217 (= lt!178574 (+!945 lt!178575 (tuple2!6229 k0!778 v!373)))))

(declare-datatypes ((Unit!11748 0))(
  ( (Unit!11749) )
))
(declare-fun lt!178576 () Unit!11748)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!164 (array!22355 array!22357 (_ BitVec 32) (_ BitVec 32) V!13411 V!13411 (_ BitVec 32) (_ BitVec 64) V!13411 (_ BitVec 32) Int) Unit!11748)

(assert (=> b!381217 (= lt!178576 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!164 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!836 (array!22355 array!22357 (_ BitVec 32) (_ BitVec 32) V!13411 V!13411 (_ BitVec 32) Int) ListLongMap!5131)

(assert (=> b!381217 (= lt!178571 (getCurrentListMapNoExtraKeys!836 lt!178577 lt!178578 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381217 (= lt!178578 (array!22358 (store (arr!10647 _values!506) i!548 (ValueCellFull!4271 v!373)) (size!11000 _values!506)))))

(assert (=> b!381217 (= lt!178575 (getCurrentListMapNoExtraKeys!836 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381218 () Bool)

(declare-fun res!216643 () Bool)

(assert (=> b!381218 (=> (not res!216643) (not e!231746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381218 (= res!216643 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15408 () Bool)

(declare-fun tp!30459 () Bool)

(assert (=> mapNonEmpty!15408 (= mapRes!15408 (and tp!30459 e!231751))))

(declare-fun mapValue!15408 () ValueCell!4271)

(declare-fun mapRest!15408 () (Array (_ BitVec 32) ValueCell!4271))

(declare-fun mapKey!15408 () (_ BitVec 32))

(assert (=> mapNonEmpty!15408 (= (arr!10647 _values!506) (store mapRest!15408 mapKey!15408 mapValue!15408))))

(declare-fun mapIsEmpty!15408 () Bool)

(assert (=> mapIsEmpty!15408 mapRes!15408))

(declare-fun b!381219 () Bool)

(declare-fun res!216645 () Bool)

(assert (=> b!381219 (=> (not res!216645) (not e!231746))))

(assert (=> b!381219 (= res!216645 (or (= (select (arr!10646 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10646 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381220 () Bool)

(assert (=> b!381220 (= e!231748 tp_is_empty!9229)))

(assert (= (and start!37440 res!216640) b!381212))

(assert (= (and b!381212 res!216649) b!381208))

(assert (= (and b!381208 res!216646) b!381207))

(assert (= (and b!381207 res!216642) b!381209))

(assert (= (and b!381209 res!216647) b!381218))

(assert (= (and b!381218 res!216643) b!381219))

(assert (= (and b!381219 res!216645) b!381213))

(assert (= (and b!381213 res!216641) b!381214))

(assert (= (and b!381214 res!216644) b!381210))

(assert (= (and b!381210 res!216648) b!381217))

(assert (= (and b!381217 (not res!216650)) b!381215))

(assert (= (and b!381211 condMapEmpty!15408) mapIsEmpty!15408))

(assert (= (and b!381211 (not condMapEmpty!15408)) mapNonEmpty!15408))

(get-info :version)

(assert (= (and mapNonEmpty!15408 ((_ is ValueCellFull!4271) mapValue!15408)) b!381216))

(assert (= (and b!381211 ((_ is ValueCellFull!4271) mapDefault!15408)) b!381220))

(assert (= start!37440 b!381211))

(declare-fun m!377669 () Bool)

(assert (=> b!381207 m!377669))

(declare-fun m!377671 () Bool)

(assert (=> b!381208 m!377671))

(declare-fun m!377673 () Bool)

(assert (=> mapNonEmpty!15408 m!377673))

(declare-fun m!377675 () Bool)

(assert (=> b!381210 m!377675))

(declare-fun m!377677 () Bool)

(assert (=> b!381218 m!377677))

(declare-fun m!377679 () Bool)

(assert (=> start!37440 m!377679))

(declare-fun m!377681 () Bool)

(assert (=> start!37440 m!377681))

(declare-fun m!377683 () Bool)

(assert (=> start!37440 m!377683))

(declare-fun m!377685 () Bool)

(assert (=> b!381219 m!377685))

(declare-fun m!377687 () Bool)

(assert (=> b!381214 m!377687))

(declare-fun m!377689 () Bool)

(assert (=> b!381214 m!377689))

(declare-fun m!377691 () Bool)

(assert (=> b!381217 m!377691))

(declare-fun m!377693 () Bool)

(assert (=> b!381217 m!377693))

(declare-fun m!377695 () Bool)

(assert (=> b!381217 m!377695))

(declare-fun m!377697 () Bool)

(assert (=> b!381217 m!377697))

(declare-fun m!377699 () Bool)

(assert (=> b!381217 m!377699))

(declare-fun m!377701 () Bool)

(assert (=> b!381217 m!377701))

(declare-fun m!377703 () Bool)

(assert (=> b!381217 m!377703))

(declare-fun m!377705 () Bool)

(assert (=> b!381213 m!377705))

(check-sat (not mapNonEmpty!15408) (not b!381210) (not b!381218) (not start!37440) (not b!381214) tp_is_empty!9229 (not b!381213) (not b_next!8581) (not b!381207) (not b!381208) (not b!381217) b_and!15797)
(check-sat b_and!15797 (not b_next!8581))
