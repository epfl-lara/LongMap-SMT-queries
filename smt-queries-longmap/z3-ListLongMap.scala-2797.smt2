; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40656 () Bool)

(assert start!40656)

(declare-fun b_free!10681 () Bool)

(declare-fun b_next!10681 () Bool)

(assert (=> start!40656 (= b_free!10681 (not b_next!10681))))

(declare-fun tp!37863 () Bool)

(declare-fun b_and!18703 () Bool)

(assert (=> start!40656 (= tp!37863 b_and!18703)))

(declare-fun b!449443 () Bool)

(declare-fun res!267376 () Bool)

(declare-fun e!263516 () Bool)

(assert (=> b!449443 (=> (not res!267376) (not e!263516))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449443 (= res!267376 (validKeyInArray!0 k0!794))))

(declare-fun b!449444 () Bool)

(declare-fun e!263520 () Bool)

(declare-fun tp_is_empty!12019 () Bool)

(assert (=> b!449444 (= e!263520 tp_is_empty!12019)))

(declare-fun b!449445 () Bool)

(declare-fun res!267381 () Bool)

(declare-fun e!263518 () Bool)

(assert (=> b!449445 (=> (not res!267381) (not e!263518))))

(declare-datatypes ((array!27840 0))(
  ( (array!27841 (arr!13365 (Array (_ BitVec 32) (_ BitVec 64))) (size!13717 (_ BitVec 32))) )
))
(declare-fun lt!204397 () array!27840)

(declare-datatypes ((List!7926 0))(
  ( (Nil!7923) (Cons!7922 (h!8778 (_ BitVec 64)) (t!13680 List!7926)) )
))
(declare-fun arrayNoDuplicates!0 (array!27840 (_ BitVec 32) List!7926) Bool)

(assert (=> b!449445 (= res!267381 (arrayNoDuplicates!0 lt!204397 #b00000000000000000000000000000000 Nil!7923))))

(declare-fun b!449446 () Bool)

(declare-fun res!267373 () Bool)

(assert (=> b!449446 (=> (not res!267373) (not e!263516))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27840)

(assert (=> b!449446 (= res!267373 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13717 _keys!709))))))

(declare-fun b!449447 () Bool)

(declare-fun res!267384 () Bool)

(assert (=> b!449447 (=> (not res!267384) (not e!263516))))

(assert (=> b!449447 (= res!267384 (or (= (select (arr!13365 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13365 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449448 () Bool)

(declare-fun e!263517 () Bool)

(declare-fun e!263515 () Bool)

(declare-fun mapRes!19662 () Bool)

(assert (=> b!449448 (= e!263517 (and e!263515 mapRes!19662))))

(declare-fun condMapEmpty!19662 () Bool)

(declare-datatypes ((V!17131 0))(
  ( (V!17132 (val!6054 Int)) )
))
(declare-datatypes ((ValueCell!5666 0))(
  ( (ValueCellFull!5666 (v!8310 V!17131)) (EmptyCell!5666) )
))
(declare-datatypes ((array!27842 0))(
  ( (array!27843 (arr!13366 (Array (_ BitVec 32) ValueCell!5666)) (size!13718 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27842)

(declare-fun mapDefault!19662 () ValueCell!5666)

(assert (=> b!449448 (= condMapEmpty!19662 (= (arr!13366 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5666)) mapDefault!19662)))))

(declare-fun res!267375 () Bool)

(assert (=> start!40656 (=> (not res!267375) (not e!263516))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40656 (= res!267375 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13717 _keys!709))))))

(assert (=> start!40656 e!263516))

(assert (=> start!40656 tp_is_empty!12019))

(assert (=> start!40656 tp!37863))

(assert (=> start!40656 true))

(declare-fun array_inv!9764 (array!27842) Bool)

(assert (=> start!40656 (and (array_inv!9764 _values!549) e!263517)))

(declare-fun array_inv!9765 (array!27840) Bool)

(assert (=> start!40656 (array_inv!9765 _keys!709)))

(declare-fun b!449449 () Bool)

(declare-fun res!267382 () Bool)

(assert (=> b!449449 (=> (not res!267382) (not e!263516))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449449 (= res!267382 (validMask!0 mask!1025))))

(declare-fun b!449450 () Bool)

(declare-fun res!267380 () Bool)

(assert (=> b!449450 (=> (not res!267380) (not e!263516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27840 (_ BitVec 32)) Bool)

(assert (=> b!449450 (= res!267380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449451 () Bool)

(assert (=> b!449451 (= e!263515 tp_is_empty!12019)))

(declare-fun mapIsEmpty!19662 () Bool)

(assert (=> mapIsEmpty!19662 mapRes!19662))

(declare-fun b!449452 () Bool)

(declare-fun res!267383 () Bool)

(assert (=> b!449452 (=> (not res!267383) (not e!263516))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449452 (= res!267383 (and (= (size!13718 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13717 _keys!709) (size!13718 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449453 () Bool)

(declare-fun res!267377 () Bool)

(assert (=> b!449453 (=> (not res!267377) (not e!263516))))

(assert (=> b!449453 (= res!267377 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7923))))

(declare-fun b!449454 () Bool)

(assert (=> b!449454 (= e!263516 e!263518)))

(declare-fun res!267379 () Bool)

(assert (=> b!449454 (=> (not res!267379) (not e!263518))))

(assert (=> b!449454 (= res!267379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204397 mask!1025))))

(assert (=> b!449454 (= lt!204397 (array!27841 (store (arr!13365 _keys!709) i!563 k0!794) (size!13717 _keys!709)))))

(declare-fun b!449455 () Bool)

(declare-fun res!267378 () Bool)

(assert (=> b!449455 (=> (not res!267378) (not e!263518))))

(assert (=> b!449455 (= res!267378 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19662 () Bool)

(declare-fun tp!37862 () Bool)

(assert (=> mapNonEmpty!19662 (= mapRes!19662 (and tp!37862 e!263520))))

(declare-fun mapKey!19662 () (_ BitVec 32))

(declare-fun mapRest!19662 () (Array (_ BitVec 32) ValueCell!5666))

(declare-fun mapValue!19662 () ValueCell!5666)

(assert (=> mapNonEmpty!19662 (= (arr!13366 _values!549) (store mapRest!19662 mapKey!19662 mapValue!19662))))

(declare-fun b!449456 () Bool)

(assert (=> b!449456 (= e!263518 false)))

(declare-fun minValue!515 () V!17131)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7856 0))(
  ( (tuple2!7857 (_1!3939 (_ BitVec 64)) (_2!3939 V!17131)) )
))
(declare-datatypes ((List!7927 0))(
  ( (Nil!7924) (Cons!7923 (h!8779 tuple2!7856) (t!13681 List!7927)) )
))
(declare-datatypes ((ListLongMap!6771 0))(
  ( (ListLongMap!6772 (toList!3401 List!7927)) )
))
(declare-fun lt!204395 () ListLongMap!6771)

(declare-fun zeroValue!515 () V!17131)

(declare-fun v!412 () V!17131)

(declare-fun getCurrentListMapNoExtraKeys!1631 (array!27840 array!27842 (_ BitVec 32) (_ BitVec 32) V!17131 V!17131 (_ BitVec 32) Int) ListLongMap!6771)

(assert (=> b!449456 (= lt!204395 (getCurrentListMapNoExtraKeys!1631 lt!204397 (array!27843 (store (arr!13366 _values!549) i!563 (ValueCellFull!5666 v!412)) (size!13718 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204396 () ListLongMap!6771)

(assert (=> b!449456 (= lt!204396 (getCurrentListMapNoExtraKeys!1631 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449457 () Bool)

(declare-fun res!267374 () Bool)

(assert (=> b!449457 (=> (not res!267374) (not e!263516))))

(declare-fun arrayContainsKey!0 (array!27840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449457 (= res!267374 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40656 res!267375) b!449449))

(assert (= (and b!449449 res!267382) b!449452))

(assert (= (and b!449452 res!267383) b!449450))

(assert (= (and b!449450 res!267380) b!449453))

(assert (= (and b!449453 res!267377) b!449446))

(assert (= (and b!449446 res!267373) b!449443))

(assert (= (and b!449443 res!267376) b!449447))

(assert (= (and b!449447 res!267384) b!449457))

(assert (= (and b!449457 res!267374) b!449454))

(assert (= (and b!449454 res!267379) b!449445))

(assert (= (and b!449445 res!267381) b!449455))

(assert (= (and b!449455 res!267378) b!449456))

(assert (= (and b!449448 condMapEmpty!19662) mapIsEmpty!19662))

(assert (= (and b!449448 (not condMapEmpty!19662)) mapNonEmpty!19662))

(get-info :version)

(assert (= (and mapNonEmpty!19662 ((_ is ValueCellFull!5666) mapValue!19662)) b!449444))

(assert (= (and b!449448 ((_ is ValueCellFull!5666) mapDefault!19662)) b!449451))

(assert (= start!40656 b!449448))

(declare-fun m!433911 () Bool)

(assert (=> b!449450 m!433911))

(declare-fun m!433913 () Bool)

(assert (=> b!449453 m!433913))

(declare-fun m!433915 () Bool)

(assert (=> b!449449 m!433915))

(declare-fun m!433917 () Bool)

(assert (=> start!40656 m!433917))

(declare-fun m!433919 () Bool)

(assert (=> start!40656 m!433919))

(declare-fun m!433921 () Bool)

(assert (=> b!449445 m!433921))

(declare-fun m!433923 () Bool)

(assert (=> b!449454 m!433923))

(declare-fun m!433925 () Bool)

(assert (=> b!449454 m!433925))

(declare-fun m!433927 () Bool)

(assert (=> b!449447 m!433927))

(declare-fun m!433929 () Bool)

(assert (=> b!449456 m!433929))

(declare-fun m!433931 () Bool)

(assert (=> b!449456 m!433931))

(declare-fun m!433933 () Bool)

(assert (=> b!449456 m!433933))

(declare-fun m!433935 () Bool)

(assert (=> b!449457 m!433935))

(declare-fun m!433937 () Bool)

(assert (=> b!449443 m!433937))

(declare-fun m!433939 () Bool)

(assert (=> mapNonEmpty!19662 m!433939))

(check-sat (not b!449443) (not b!449445) (not b!449450) tp_is_empty!12019 (not b!449449) (not b_next!10681) (not start!40656) (not b!449454) b_and!18703 (not b!449456) (not mapNonEmpty!19662) (not b!449457) (not b!449453))
(check-sat b_and!18703 (not b_next!10681))
