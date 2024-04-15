; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37710 () Bool)

(assert start!37710)

(declare-fun b_free!8827 () Bool)

(declare-fun b_next!8827 () Bool)

(assert (=> start!37710 (= b_free!8827 (not b_next!8827))))

(declare-fun tp!31232 () Bool)

(declare-fun b_and!16043 () Bool)

(assert (=> start!37710 (= tp!31232 b_and!16043)))

(declare-fun b!386560 () Bool)

(declare-fun res!220779 () Bool)

(declare-fun e!234438 () Bool)

(assert (=> b!386560 (=> (not res!220779) (not e!234438))))

(declare-datatypes ((array!22881 0))(
  ( (array!22882 (arr!10909 (Array (_ BitVec 32) (_ BitVec 64))) (size!11262 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22881)

(declare-datatypes ((List!6264 0))(
  ( (Nil!6261) (Cons!6260 (h!7116 (_ BitVec 64)) (t!11405 List!6264)) )
))
(declare-fun arrayNoDuplicates!0 (array!22881 (_ BitVec 32) List!6264) Bool)

(assert (=> b!386560 (= res!220779 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6261))))

(declare-fun b!386561 () Bool)

(declare-fun res!220781 () Bool)

(assert (=> b!386561 (=> (not res!220781) (not e!234438))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386561 (= res!220781 (or (= (select (arr!10909 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10909 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386562 () Bool)

(declare-fun e!234437 () Bool)

(assert (=> b!386562 (= e!234437 false)))

(declare-datatypes ((V!13771 0))(
  ( (V!13772 (val!4794 Int)) )
))
(declare-datatypes ((ValueCell!4406 0))(
  ( (ValueCellFull!4406 (v!6985 V!13771)) (EmptyCell!4406) )
))
(declare-datatypes ((array!22883 0))(
  ( (array!22884 (arr!10910 (Array (_ BitVec 32) ValueCell!4406)) (size!11263 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22883)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6430 0))(
  ( (tuple2!6431 (_1!3226 (_ BitVec 64)) (_2!3226 V!13771)) )
))
(declare-datatypes ((List!6265 0))(
  ( (Nil!6262) (Cons!6261 (h!7117 tuple2!6430) (t!11406 List!6265)) )
))
(declare-datatypes ((ListLongMap!5333 0))(
  ( (ListLongMap!5334 (toList!2682 List!6265)) )
))
(declare-fun lt!181665 () ListLongMap!5333)

(declare-fun zeroValue!472 () V!13771)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13771)

(declare-fun lt!181664 () array!22881)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13771)

(declare-fun getCurrentListMapNoExtraKeys!922 (array!22881 array!22883 (_ BitVec 32) (_ BitVec 32) V!13771 V!13771 (_ BitVec 32) Int) ListLongMap!5333)

(assert (=> b!386562 (= lt!181665 (getCurrentListMapNoExtraKeys!922 lt!181664 (array!22884 (store (arr!10910 _values!506) i!548 (ValueCellFull!4406 v!373)) (size!11263 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181663 () ListLongMap!5333)

(assert (=> b!386562 (= lt!181663 (getCurrentListMapNoExtraKeys!922 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386563 () Bool)

(declare-fun res!220778 () Bool)

(assert (=> b!386563 (=> (not res!220778) (not e!234437))))

(assert (=> b!386563 (= res!220778 (arrayNoDuplicates!0 lt!181664 #b00000000000000000000000000000000 Nil!6261))))

(declare-fun b!386564 () Bool)

(declare-fun res!220780 () Bool)

(assert (=> b!386564 (=> (not res!220780) (not e!234438))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386564 (= res!220780 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386565 () Bool)

(assert (=> b!386565 (= e!234438 e!234437)))

(declare-fun res!220787 () Bool)

(assert (=> b!386565 (=> (not res!220787) (not e!234437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22881 (_ BitVec 32)) Bool)

(assert (=> b!386565 (= res!220787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181664 mask!970))))

(assert (=> b!386565 (= lt!181664 (array!22882 (store (arr!10909 _keys!658) i!548 k0!778) (size!11262 _keys!658)))))

(declare-fun mapNonEmpty!15813 () Bool)

(declare-fun mapRes!15813 () Bool)

(declare-fun tp!31233 () Bool)

(declare-fun e!234439 () Bool)

(assert (=> mapNonEmpty!15813 (= mapRes!15813 (and tp!31233 e!234439))))

(declare-fun mapValue!15813 () ValueCell!4406)

(declare-fun mapRest!15813 () (Array (_ BitVec 32) ValueCell!4406))

(declare-fun mapKey!15813 () (_ BitVec 32))

(assert (=> mapNonEmpty!15813 (= (arr!10910 _values!506) (store mapRest!15813 mapKey!15813 mapValue!15813))))

(declare-fun b!386566 () Bool)

(declare-fun res!220784 () Bool)

(assert (=> b!386566 (=> (not res!220784) (not e!234438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386566 (= res!220784 (validKeyInArray!0 k0!778))))

(declare-fun res!220783 () Bool)

(assert (=> start!37710 (=> (not res!220783) (not e!234438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37710 (= res!220783 (validMask!0 mask!970))))

(assert (=> start!37710 e!234438))

(declare-fun e!234436 () Bool)

(declare-fun array_inv!8028 (array!22883) Bool)

(assert (=> start!37710 (and (array_inv!8028 _values!506) e!234436)))

(assert (=> start!37710 tp!31232))

(assert (=> start!37710 true))

(declare-fun tp_is_empty!9499 () Bool)

(assert (=> start!37710 tp_is_empty!9499))

(declare-fun array_inv!8029 (array!22881) Bool)

(assert (=> start!37710 (array_inv!8029 _keys!658)))

(declare-fun b!386567 () Bool)

(declare-fun res!220782 () Bool)

(assert (=> b!386567 (=> (not res!220782) (not e!234438))))

(assert (=> b!386567 (= res!220782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386568 () Bool)

(declare-fun e!234435 () Bool)

(assert (=> b!386568 (= e!234436 (and e!234435 mapRes!15813))))

(declare-fun condMapEmpty!15813 () Bool)

(declare-fun mapDefault!15813 () ValueCell!4406)

(assert (=> b!386568 (= condMapEmpty!15813 (= (arr!10910 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4406)) mapDefault!15813)))))

(declare-fun b!386569 () Bool)

(assert (=> b!386569 (= e!234435 tp_is_empty!9499)))

(declare-fun b!386570 () Bool)

(declare-fun res!220785 () Bool)

(assert (=> b!386570 (=> (not res!220785) (not e!234438))))

(assert (=> b!386570 (= res!220785 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11262 _keys!658))))))

(declare-fun mapIsEmpty!15813 () Bool)

(assert (=> mapIsEmpty!15813 mapRes!15813))

(declare-fun b!386571 () Bool)

(declare-fun res!220786 () Bool)

(assert (=> b!386571 (=> (not res!220786) (not e!234438))))

(assert (=> b!386571 (= res!220786 (and (= (size!11263 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11262 _keys!658) (size!11263 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386572 () Bool)

(assert (=> b!386572 (= e!234439 tp_is_empty!9499)))

(assert (= (and start!37710 res!220783) b!386571))

(assert (= (and b!386571 res!220786) b!386567))

(assert (= (and b!386567 res!220782) b!386560))

(assert (= (and b!386560 res!220779) b!386570))

(assert (= (and b!386570 res!220785) b!386566))

(assert (= (and b!386566 res!220784) b!386561))

(assert (= (and b!386561 res!220781) b!386564))

(assert (= (and b!386564 res!220780) b!386565))

(assert (= (and b!386565 res!220787) b!386563))

(assert (= (and b!386563 res!220778) b!386562))

(assert (= (and b!386568 condMapEmpty!15813) mapIsEmpty!15813))

(assert (= (and b!386568 (not condMapEmpty!15813)) mapNonEmpty!15813))

(get-info :version)

(assert (= (and mapNonEmpty!15813 ((_ is ValueCellFull!4406) mapValue!15813)) b!386572))

(assert (= (and b!386568 ((_ is ValueCellFull!4406) mapDefault!15813)) b!386569))

(assert (= start!37710 b!386568))

(declare-fun m!382361 () Bool)

(assert (=> b!386565 m!382361))

(declare-fun m!382363 () Bool)

(assert (=> b!386565 m!382363))

(declare-fun m!382365 () Bool)

(assert (=> b!386567 m!382365))

(declare-fun m!382367 () Bool)

(assert (=> mapNonEmpty!15813 m!382367))

(declare-fun m!382369 () Bool)

(assert (=> start!37710 m!382369))

(declare-fun m!382371 () Bool)

(assert (=> start!37710 m!382371))

(declare-fun m!382373 () Bool)

(assert (=> start!37710 m!382373))

(declare-fun m!382375 () Bool)

(assert (=> b!386563 m!382375))

(declare-fun m!382377 () Bool)

(assert (=> b!386566 m!382377))

(declare-fun m!382379 () Bool)

(assert (=> b!386560 m!382379))

(declare-fun m!382381 () Bool)

(assert (=> b!386564 m!382381))

(declare-fun m!382383 () Bool)

(assert (=> b!386561 m!382383))

(declare-fun m!382385 () Bool)

(assert (=> b!386562 m!382385))

(declare-fun m!382387 () Bool)

(assert (=> b!386562 m!382387))

(declare-fun m!382389 () Bool)

(assert (=> b!386562 m!382389))

(check-sat (not b!386567) (not b!386562) tp_is_empty!9499 (not b!386566) (not b!386564) (not b_next!8827) b_and!16043 (not start!37710) (not mapNonEmpty!15813) (not b!386565) (not b!386560) (not b!386563))
(check-sat b_and!16043 (not b_next!8827))
