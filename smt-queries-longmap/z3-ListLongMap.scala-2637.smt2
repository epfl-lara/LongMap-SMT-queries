; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39626 () Bool)

(assert start!39626)

(declare-fun b_free!9907 () Bool)

(declare-fun b_next!9907 () Bool)

(assert (=> start!39626 (= b_free!9907 (not b_next!9907))))

(declare-fun tp!35250 () Bool)

(declare-fun b_and!17537 () Bool)

(assert (=> start!39626 (= tp!35250 b_and!17537)))

(declare-fun mapIsEmpty!18210 () Bool)

(declare-fun mapRes!18210 () Bool)

(assert (=> mapIsEmpty!18210 mapRes!18210))

(declare-fun b!424912 () Bool)

(declare-fun res!248753 () Bool)

(declare-fun e!252280 () Bool)

(assert (=> b!424912 (=> (not res!248753) (not e!252280))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424912 (= res!248753 (validMask!0 mask!1025))))

(declare-fun b!424913 () Bool)

(declare-fun res!248751 () Bool)

(assert (=> b!424913 (=> (not res!248751) (not e!252280))))

(declare-datatypes ((array!25947 0))(
  ( (array!25948 (arr!12423 (Array (_ BitVec 32) (_ BitVec 64))) (size!12776 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25947)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424913 (= res!248751 (or (= (select (arr!12423 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12423 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424914 () Bool)

(declare-fun res!248755 () Bool)

(assert (=> b!424914 (=> (not res!248755) (not e!252280))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15851 0))(
  ( (V!15852 (val!5574 Int)) )
))
(declare-datatypes ((ValueCell!5186 0))(
  ( (ValueCellFull!5186 (v!7815 V!15851)) (EmptyCell!5186) )
))
(declare-datatypes ((array!25949 0))(
  ( (array!25950 (arr!12424 (Array (_ BitVec 32) ValueCell!5186)) (size!12777 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25949)

(assert (=> b!424914 (= res!248755 (and (= (size!12777 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12776 _keys!709) (size!12777 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424915 () Bool)

(declare-fun res!248748 () Bool)

(assert (=> b!424915 (=> (not res!248748) (not e!252280))))

(declare-datatypes ((List!7310 0))(
  ( (Nil!7307) (Cons!7306 (h!8162 (_ BitVec 64)) (t!12745 List!7310)) )
))
(declare-fun arrayNoDuplicates!0 (array!25947 (_ BitVec 32) List!7310) Bool)

(assert (=> b!424915 (= res!248748 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7307))))

(declare-fun b!424916 () Bool)

(declare-fun e!252279 () Bool)

(declare-fun tp_is_empty!11059 () Bool)

(assert (=> b!424916 (= e!252279 tp_is_empty!11059)))

(declare-fun b!424917 () Bool)

(declare-fun e!252276 () Bool)

(assert (=> b!424917 (= e!252276 (and e!252279 mapRes!18210))))

(declare-fun condMapEmpty!18210 () Bool)

(declare-fun mapDefault!18210 () ValueCell!5186)

(assert (=> b!424917 (= condMapEmpty!18210 (= (arr!12424 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5186)) mapDefault!18210)))))

(declare-fun res!248760 () Bool)

(assert (=> start!39626 (=> (not res!248760) (not e!252280))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39626 (= res!248760 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12776 _keys!709))))))

(assert (=> start!39626 e!252280))

(assert (=> start!39626 tp_is_empty!11059))

(assert (=> start!39626 tp!35250))

(assert (=> start!39626 true))

(declare-fun array_inv!9086 (array!25949) Bool)

(assert (=> start!39626 (and (array_inv!9086 _values!549) e!252276)))

(declare-fun array_inv!9087 (array!25947) Bool)

(assert (=> start!39626 (array_inv!9087 _keys!709)))

(declare-fun b!424918 () Bool)

(declare-fun e!252277 () Bool)

(declare-fun e!252282 () Bool)

(assert (=> b!424918 (= e!252277 e!252282)))

(declare-fun res!248758 () Bool)

(assert (=> b!424918 (=> (not res!248758) (not e!252282))))

(assert (=> b!424918 (= res!248758 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15851)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15851)

(declare-fun lt!194338 () array!25947)

(declare-datatypes ((tuple2!7310 0))(
  ( (tuple2!7311 (_1!3666 (_ BitVec 64)) (_2!3666 V!15851)) )
))
(declare-datatypes ((List!7311 0))(
  ( (Nil!7308) (Cons!7307 (h!8163 tuple2!7310) (t!12746 List!7311)) )
))
(declare-datatypes ((ListLongMap!6213 0))(
  ( (ListLongMap!6214 (toList!3122 List!7311)) )
))
(declare-fun lt!194339 () ListLongMap!6213)

(declare-fun lt!194336 () array!25949)

(declare-fun getCurrentListMapNoExtraKeys!1330 (array!25947 array!25949 (_ BitVec 32) (_ BitVec 32) V!15851 V!15851 (_ BitVec 32) Int) ListLongMap!6213)

(assert (=> b!424918 (= lt!194339 (getCurrentListMapNoExtraKeys!1330 lt!194338 lt!194336 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15851)

(assert (=> b!424918 (= lt!194336 (array!25950 (store (arr!12424 _values!549) i!563 (ValueCellFull!5186 v!412)) (size!12777 _values!549)))))

(declare-fun lt!194335 () ListLongMap!6213)

(assert (=> b!424918 (= lt!194335 (getCurrentListMapNoExtraKeys!1330 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424919 () Bool)

(declare-fun e!252278 () Bool)

(assert (=> b!424919 (= e!252278 tp_is_empty!11059)))

(declare-fun b!424920 () Bool)

(declare-fun res!248754 () Bool)

(assert (=> b!424920 (=> (not res!248754) (not e!252277))))

(assert (=> b!424920 (= res!248754 (bvsle from!863 i!563))))

(declare-fun b!424921 () Bool)

(declare-fun res!248756 () Bool)

(assert (=> b!424921 (=> (not res!248756) (not e!252280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25947 (_ BitVec 32)) Bool)

(assert (=> b!424921 (= res!248756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424922 () Bool)

(assert (=> b!424922 (= e!252280 e!252277)))

(declare-fun res!248759 () Bool)

(assert (=> b!424922 (=> (not res!248759) (not e!252277))))

(assert (=> b!424922 (= res!248759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194338 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!424922 (= lt!194338 (array!25948 (store (arr!12423 _keys!709) i!563 k0!794) (size!12776 _keys!709)))))

(declare-fun b!424923 () Bool)

(declare-fun res!248749 () Bool)

(assert (=> b!424923 (=> (not res!248749) (not e!252277))))

(assert (=> b!424923 (= res!248749 (arrayNoDuplicates!0 lt!194338 #b00000000000000000000000000000000 Nil!7307))))

(declare-fun b!424924 () Bool)

(declare-fun res!248752 () Bool)

(assert (=> b!424924 (=> (not res!248752) (not e!252280))))

(assert (=> b!424924 (= res!248752 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12776 _keys!709))))))

(declare-fun b!424925 () Bool)

(declare-fun res!248757 () Bool)

(assert (=> b!424925 (=> (not res!248757) (not e!252280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424925 (= res!248757 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18210 () Bool)

(declare-fun tp!35249 () Bool)

(assert (=> mapNonEmpty!18210 (= mapRes!18210 (and tp!35249 e!252278))))

(declare-fun mapKey!18210 () (_ BitVec 32))

(declare-fun mapValue!18210 () ValueCell!5186)

(declare-fun mapRest!18210 () (Array (_ BitVec 32) ValueCell!5186))

(assert (=> mapNonEmpty!18210 (= (arr!12424 _values!549) (store mapRest!18210 mapKey!18210 mapValue!18210))))

(declare-fun b!424926 () Bool)

(assert (=> b!424926 (= e!252282 (not true))))

(declare-fun +!1305 (ListLongMap!6213 tuple2!7310) ListLongMap!6213)

(assert (=> b!424926 (= (getCurrentListMapNoExtraKeys!1330 lt!194338 lt!194336 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1305 (getCurrentListMapNoExtraKeys!1330 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7311 k0!794 v!412)))))

(declare-datatypes ((Unit!12456 0))(
  ( (Unit!12457) )
))
(declare-fun lt!194337 () Unit!12456)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!476 (array!25947 array!25949 (_ BitVec 32) (_ BitVec 32) V!15851 V!15851 (_ BitVec 32) (_ BitVec 64) V!15851 (_ BitVec 32) Int) Unit!12456)

(assert (=> b!424926 (= lt!194337 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!476 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424927 () Bool)

(declare-fun res!248750 () Bool)

(assert (=> b!424927 (=> (not res!248750) (not e!252280))))

(declare-fun arrayContainsKey!0 (array!25947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424927 (= res!248750 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39626 res!248760) b!424912))

(assert (= (and b!424912 res!248753) b!424914))

(assert (= (and b!424914 res!248755) b!424921))

(assert (= (and b!424921 res!248756) b!424915))

(assert (= (and b!424915 res!248748) b!424924))

(assert (= (and b!424924 res!248752) b!424925))

(assert (= (and b!424925 res!248757) b!424913))

(assert (= (and b!424913 res!248751) b!424927))

(assert (= (and b!424927 res!248750) b!424922))

(assert (= (and b!424922 res!248759) b!424923))

(assert (= (and b!424923 res!248749) b!424920))

(assert (= (and b!424920 res!248754) b!424918))

(assert (= (and b!424918 res!248758) b!424926))

(assert (= (and b!424917 condMapEmpty!18210) mapIsEmpty!18210))

(assert (= (and b!424917 (not condMapEmpty!18210)) mapNonEmpty!18210))

(get-info :version)

(assert (= (and mapNonEmpty!18210 ((_ is ValueCellFull!5186) mapValue!18210)) b!424919))

(assert (= (and b!424917 ((_ is ValueCellFull!5186) mapDefault!18210)) b!424916))

(assert (= start!39626 b!424917))

(declare-fun m!413403 () Bool)

(assert (=> b!424918 m!413403))

(declare-fun m!413405 () Bool)

(assert (=> b!424918 m!413405))

(declare-fun m!413407 () Bool)

(assert (=> b!424918 m!413407))

(declare-fun m!413409 () Bool)

(assert (=> start!39626 m!413409))

(declare-fun m!413411 () Bool)

(assert (=> start!39626 m!413411))

(declare-fun m!413413 () Bool)

(assert (=> b!424926 m!413413))

(declare-fun m!413415 () Bool)

(assert (=> b!424926 m!413415))

(assert (=> b!424926 m!413415))

(declare-fun m!413417 () Bool)

(assert (=> b!424926 m!413417))

(declare-fun m!413419 () Bool)

(assert (=> b!424926 m!413419))

(declare-fun m!413421 () Bool)

(assert (=> b!424915 m!413421))

(declare-fun m!413423 () Bool)

(assert (=> mapNonEmpty!18210 m!413423))

(declare-fun m!413425 () Bool)

(assert (=> b!424912 m!413425))

(declare-fun m!413427 () Bool)

(assert (=> b!424923 m!413427))

(declare-fun m!413429 () Bool)

(assert (=> b!424921 m!413429))

(declare-fun m!413431 () Bool)

(assert (=> b!424925 m!413431))

(declare-fun m!413433 () Bool)

(assert (=> b!424927 m!413433))

(declare-fun m!413435 () Bool)

(assert (=> b!424913 m!413435))

(declare-fun m!413437 () Bool)

(assert (=> b!424922 m!413437))

(declare-fun m!413439 () Bool)

(assert (=> b!424922 m!413439))

(check-sat b_and!17537 (not b_next!9907) (not b!424925) (not b!424918) (not mapNonEmpty!18210) (not start!39626) (not b!424923) (not b!424922) tp_is_empty!11059 (not b!424912) (not b!424926) (not b!424927) (not b!424921) (not b!424915))
(check-sat b_and!17537 (not b_next!9907))
