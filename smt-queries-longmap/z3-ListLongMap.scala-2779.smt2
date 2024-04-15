; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40548 () Bool)

(assert start!40548)

(declare-fun b_free!10573 () Bool)

(declare-fun b_next!10573 () Bool)

(assert (=> start!40548 (= b_free!10573 (not b_next!10573))))

(declare-fun tp!37539 () Bool)

(declare-fun b_and!18555 () Bool)

(assert (=> start!40548 (= tp!37539 b_and!18555)))

(declare-fun b!446791 () Bool)

(declare-fun res!265313 () Bool)

(declare-fun e!262403 () Bool)

(assert (=> b!446791 (=> (not res!265313) (not e!262403))))

(declare-datatypes ((array!27633 0))(
  ( (array!27634 (arr!13262 (Array (_ BitVec 32) (_ BitVec 64))) (size!13615 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27633)

(declare-datatypes ((List!7939 0))(
  ( (Nil!7936) (Cons!7935 (h!8791 (_ BitVec 64)) (t!13692 List!7939)) )
))
(declare-fun arrayNoDuplicates!0 (array!27633 (_ BitVec 32) List!7939) Bool)

(assert (=> b!446791 (= res!265313 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7936))))

(declare-fun mapIsEmpty!19500 () Bool)

(declare-fun mapRes!19500 () Bool)

(assert (=> mapIsEmpty!19500 mapRes!19500))

(declare-fun b!446792 () Bool)

(declare-fun res!265310 () Bool)

(declare-fun e!262402 () Bool)

(assert (=> b!446792 (=> (not res!265310) (not e!262402))))

(declare-fun lt!203672 () array!27633)

(assert (=> b!446792 (= res!265310 (arrayNoDuplicates!0 lt!203672 #b00000000000000000000000000000000 Nil!7936))))

(declare-fun b!446794 () Bool)

(declare-fun e!262404 () Bool)

(declare-fun tp_is_empty!11911 () Bool)

(assert (=> b!446794 (= e!262404 tp_is_empty!11911)))

(declare-fun b!446795 () Bool)

(declare-fun res!265309 () Bool)

(assert (=> b!446795 (=> (not res!265309) (not e!262403))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446795 (= res!265309 (validKeyInArray!0 k0!794))))

(declare-fun b!446796 () Bool)

(declare-fun res!265305 () Bool)

(assert (=> b!446796 (=> (not res!265305) (not e!262403))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16987 0))(
  ( (V!16988 (val!6000 Int)) )
))
(declare-datatypes ((ValueCell!5612 0))(
  ( (ValueCellFull!5612 (v!8249 V!16987)) (EmptyCell!5612) )
))
(declare-datatypes ((array!27635 0))(
  ( (array!27636 (arr!13263 (Array (_ BitVec 32) ValueCell!5612)) (size!13616 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27635)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!446796 (= res!265305 (and (= (size!13616 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13615 _keys!709) (size!13616 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19500 () Bool)

(declare-fun tp!37538 () Bool)

(assert (=> mapNonEmpty!19500 (= mapRes!19500 (and tp!37538 e!262404))))

(declare-fun mapKey!19500 () (_ BitVec 32))

(declare-fun mapRest!19500 () (Array (_ BitVec 32) ValueCell!5612))

(declare-fun mapValue!19500 () ValueCell!5612)

(assert (=> mapNonEmpty!19500 (= (arr!13263 _values!549) (store mapRest!19500 mapKey!19500 mapValue!19500))))

(declare-fun b!446797 () Bool)

(assert (=> b!446797 (= e!262403 e!262402)))

(declare-fun res!265306 () Bool)

(assert (=> b!446797 (=> (not res!265306) (not e!262402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27633 (_ BitVec 32)) Bool)

(assert (=> b!446797 (= res!265306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203672 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446797 (= lt!203672 (array!27634 (store (arr!13262 _keys!709) i!563 k0!794) (size!13615 _keys!709)))))

(declare-fun b!446798 () Bool)

(declare-fun res!265311 () Bool)

(assert (=> b!446798 (=> (not res!265311) (not e!262403))))

(assert (=> b!446798 (= res!265311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446799 () Bool)

(declare-fun e!262406 () Bool)

(declare-fun e!262401 () Bool)

(assert (=> b!446799 (= e!262406 (and e!262401 mapRes!19500))))

(declare-fun condMapEmpty!19500 () Bool)

(declare-fun mapDefault!19500 () ValueCell!5612)

(assert (=> b!446799 (= condMapEmpty!19500 (= (arr!13263 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5612)) mapDefault!19500)))))

(declare-fun b!446800 () Bool)

(declare-fun res!265304 () Bool)

(assert (=> b!446800 (=> (not res!265304) (not e!262403))))

(assert (=> b!446800 (= res!265304 (or (= (select (arr!13262 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13262 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446801 () Bool)

(declare-fun res!265312 () Bool)

(assert (=> b!446801 (=> (not res!265312) (not e!262402))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!446801 (= res!265312 (bvsle from!863 i!563))))

(declare-fun b!446802 () Bool)

(declare-fun res!265308 () Bool)

(assert (=> b!446802 (=> (not res!265308) (not e!262403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446802 (= res!265308 (validMask!0 mask!1025))))

(declare-fun b!446803 () Bool)

(assert (=> b!446803 (= e!262401 tp_is_empty!11911)))

(declare-fun b!446793 () Bool)

(declare-fun res!265303 () Bool)

(assert (=> b!446793 (=> (not res!265303) (not e!262403))))

(declare-fun arrayContainsKey!0 (array!27633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446793 (= res!265303 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!265314 () Bool)

(assert (=> start!40548 (=> (not res!265314) (not e!262403))))

(assert (=> start!40548 (= res!265314 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13615 _keys!709))))))

(assert (=> start!40548 e!262403))

(assert (=> start!40548 tp_is_empty!11911))

(assert (=> start!40548 tp!37539))

(assert (=> start!40548 true))

(declare-fun array_inv!9666 (array!27635) Bool)

(assert (=> start!40548 (and (array_inv!9666 _values!549) e!262406)))

(declare-fun array_inv!9667 (array!27633) Bool)

(assert (=> start!40548 (array_inv!9667 _keys!709)))

(declare-fun b!446804 () Bool)

(declare-fun res!265307 () Bool)

(assert (=> b!446804 (=> (not res!265307) (not e!262403))))

(assert (=> b!446804 (= res!265307 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13615 _keys!709))))))

(declare-fun b!446805 () Bool)

(assert (=> b!446805 (= e!262402 false)))

(declare-fun minValue!515 () V!16987)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16987)

(declare-datatypes ((tuple2!7880 0))(
  ( (tuple2!7881 (_1!3951 (_ BitVec 64)) (_2!3951 V!16987)) )
))
(declare-datatypes ((List!7940 0))(
  ( (Nil!7937) (Cons!7936 (h!8792 tuple2!7880) (t!13693 List!7940)) )
))
(declare-datatypes ((ListLongMap!6783 0))(
  ( (ListLongMap!6784 (toList!3407 List!7940)) )
))
(declare-fun lt!203673 () ListLongMap!6783)

(declare-fun getCurrentListMapNoExtraKeys!1605 (array!27633 array!27635 (_ BitVec 32) (_ BitVec 32) V!16987 V!16987 (_ BitVec 32) Int) ListLongMap!6783)

(assert (=> b!446805 (= lt!203673 (getCurrentListMapNoExtraKeys!1605 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40548 res!265314) b!446802))

(assert (= (and b!446802 res!265308) b!446796))

(assert (= (and b!446796 res!265305) b!446798))

(assert (= (and b!446798 res!265311) b!446791))

(assert (= (and b!446791 res!265313) b!446804))

(assert (= (and b!446804 res!265307) b!446795))

(assert (= (and b!446795 res!265309) b!446800))

(assert (= (and b!446800 res!265304) b!446793))

(assert (= (and b!446793 res!265303) b!446797))

(assert (= (and b!446797 res!265306) b!446792))

(assert (= (and b!446792 res!265310) b!446801))

(assert (= (and b!446801 res!265312) b!446805))

(assert (= (and b!446799 condMapEmpty!19500) mapIsEmpty!19500))

(assert (= (and b!446799 (not condMapEmpty!19500)) mapNonEmpty!19500))

(get-info :version)

(assert (= (and mapNonEmpty!19500 ((_ is ValueCellFull!5612) mapValue!19500)) b!446794))

(assert (= (and b!446799 ((_ is ValueCellFull!5612) mapDefault!19500)) b!446803))

(assert (= start!40548 b!446799))

(declare-fun m!431365 () Bool)

(assert (=> start!40548 m!431365))

(declare-fun m!431367 () Bool)

(assert (=> start!40548 m!431367))

(declare-fun m!431369 () Bool)

(assert (=> b!446795 m!431369))

(declare-fun m!431371 () Bool)

(assert (=> b!446792 m!431371))

(declare-fun m!431373 () Bool)

(assert (=> mapNonEmpty!19500 m!431373))

(declare-fun m!431375 () Bool)

(assert (=> b!446798 m!431375))

(declare-fun m!431377 () Bool)

(assert (=> b!446800 m!431377))

(declare-fun m!431379 () Bool)

(assert (=> b!446805 m!431379))

(declare-fun m!431381 () Bool)

(assert (=> b!446797 m!431381))

(declare-fun m!431383 () Bool)

(assert (=> b!446797 m!431383))

(declare-fun m!431385 () Bool)

(assert (=> b!446802 m!431385))

(declare-fun m!431387 () Bool)

(assert (=> b!446791 m!431387))

(declare-fun m!431389 () Bool)

(assert (=> b!446793 m!431389))

(check-sat (not b!446805) (not b!446792) (not b_next!10573) b_and!18555 (not b!446795) (not b!446791) (not b!446797) (not b!446798) (not b!446802) (not start!40548) (not mapNonEmpty!19500) tp_is_empty!11911 (not b!446793))
(check-sat b_and!18555 (not b_next!10573))
