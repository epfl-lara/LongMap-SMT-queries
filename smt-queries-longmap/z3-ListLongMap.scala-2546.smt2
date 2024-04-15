; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39080 () Bool)

(assert start!39080)

(declare-fun b_free!9361 () Bool)

(declare-fun b_next!9361 () Bool)

(assert (=> start!39080 (= b_free!9361 (not b_next!9361))))

(declare-fun tp!33612 () Bool)

(declare-fun b_and!16721 () Bool)

(assert (=> start!39080 (= tp!33612 b_and!16721)))

(declare-fun b!410456 () Bool)

(declare-fun res!238001 () Bool)

(declare-fun e!245952 () Bool)

(assert (=> b!410456 (=> (not res!238001) (not e!245952))))

(declare-datatypes ((array!24883 0))(
  ( (array!24884 (arr!11891 (Array (_ BitVec 32) (_ BitVec 64))) (size!12244 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24883)

(declare-datatypes ((V!15123 0))(
  ( (V!15124 (val!5301 Int)) )
))
(declare-datatypes ((ValueCell!4913 0))(
  ( (ValueCellFull!4913 (v!7542 V!15123)) (EmptyCell!4913) )
))
(declare-datatypes ((array!24885 0))(
  ( (array!24886 (arr!11892 (Array (_ BitVec 32) ValueCell!4913)) (size!12245 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24885)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410456 (= res!238001 (and (= (size!12245 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12244 _keys!709) (size!12245 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410457 () Bool)

(declare-fun e!245947 () Bool)

(assert (=> b!410457 (= e!245952 e!245947)))

(declare-fun res!237997 () Bool)

(assert (=> b!410457 (=> (not res!237997) (not e!245947))))

(declare-fun lt!188906 () array!24883)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24883 (_ BitVec 32)) Bool)

(assert (=> b!410457 (= res!237997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188906 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410457 (= lt!188906 (array!24884 (store (arr!11891 _keys!709) i!563 k0!794) (size!12244 _keys!709)))))

(declare-fun b!410458 () Bool)

(declare-fun res!237996 () Bool)

(assert (=> b!410458 (=> (not res!237996) (not e!245952))))

(assert (=> b!410458 (= res!237996 (or (= (select (arr!11891 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11891 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!237994 () Bool)

(assert (=> start!39080 (=> (not res!237994) (not e!245952))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39080 (= res!237994 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12244 _keys!709))))))

(assert (=> start!39080 e!245952))

(declare-fun tp_is_empty!10513 () Bool)

(assert (=> start!39080 tp_is_empty!10513))

(assert (=> start!39080 tp!33612))

(assert (=> start!39080 true))

(declare-fun e!245948 () Bool)

(declare-fun array_inv!8722 (array!24885) Bool)

(assert (=> start!39080 (and (array_inv!8722 _values!549) e!245948)))

(declare-fun array_inv!8723 (array!24883) Bool)

(assert (=> start!39080 (array_inv!8723 _keys!709)))

(declare-fun b!410459 () Bool)

(declare-fun res!238000 () Bool)

(assert (=> b!410459 (=> (not res!238000) (not e!245952))))

(assert (=> b!410459 (= res!238000 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12244 _keys!709))))))

(declare-fun b!410460 () Bool)

(declare-fun res!237993 () Bool)

(assert (=> b!410460 (=> (not res!237993) (not e!245952))))

(declare-fun arrayContainsKey!0 (array!24883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410460 (= res!237993 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410461 () Bool)

(declare-fun res!238002 () Bool)

(assert (=> b!410461 (=> (not res!238002) (not e!245952))))

(declare-datatypes ((List!6873 0))(
  ( (Nil!6870) (Cons!6869 (h!7725 (_ BitVec 64)) (t!12038 List!6873)) )
))
(declare-fun arrayNoDuplicates!0 (array!24883 (_ BitVec 32) List!6873) Bool)

(assert (=> b!410461 (= res!238002 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6870))))

(declare-fun b!410462 () Bool)

(declare-fun res!237991 () Bool)

(assert (=> b!410462 (=> (not res!237991) (not e!245952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410462 (= res!237991 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17391 () Bool)

(declare-fun mapRes!17391 () Bool)

(declare-fun tp!33611 () Bool)

(declare-fun e!245951 () Bool)

(assert (=> mapNonEmpty!17391 (= mapRes!17391 (and tp!33611 e!245951))))

(declare-fun mapKey!17391 () (_ BitVec 32))

(declare-fun mapRest!17391 () (Array (_ BitVec 32) ValueCell!4913))

(declare-fun mapValue!17391 () ValueCell!4913)

(assert (=> mapNonEmpty!17391 (= (arr!11892 _values!549) (store mapRest!17391 mapKey!17391 mapValue!17391))))

(declare-fun b!410463 () Bool)

(assert (=> b!410463 (= e!245951 tp_is_empty!10513)))

(declare-fun b!410464 () Bool)

(declare-fun e!245950 () Bool)

(assert (=> b!410464 (= e!245948 (and e!245950 mapRes!17391))))

(declare-fun condMapEmpty!17391 () Bool)

(declare-fun mapDefault!17391 () ValueCell!4913)

(assert (=> b!410464 (= condMapEmpty!17391 (= (arr!11892 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4913)) mapDefault!17391)))))

(declare-fun b!410465 () Bool)

(assert (=> b!410465 (= e!245947 false)))

(declare-fun minValue!515 () V!15123)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6862 0))(
  ( (tuple2!6863 (_1!3442 (_ BitVec 64)) (_2!3442 V!15123)) )
))
(declare-datatypes ((List!6874 0))(
  ( (Nil!6871) (Cons!6870 (h!7726 tuple2!6862) (t!12039 List!6874)) )
))
(declare-datatypes ((ListLongMap!5765 0))(
  ( (ListLongMap!5766 (toList!2898 List!6874)) )
))
(declare-fun lt!188905 () ListLongMap!5765)

(declare-fun v!412 () V!15123)

(declare-fun zeroValue!515 () V!15123)

(declare-fun getCurrentListMapNoExtraKeys!1112 (array!24883 array!24885 (_ BitVec 32) (_ BitVec 32) V!15123 V!15123 (_ BitVec 32) Int) ListLongMap!5765)

(assert (=> b!410465 (= lt!188905 (getCurrentListMapNoExtraKeys!1112 lt!188906 (array!24886 (store (arr!11892 _values!549) i!563 (ValueCellFull!4913 v!412)) (size!12245 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!188904 () ListLongMap!5765)

(assert (=> b!410465 (= lt!188904 (getCurrentListMapNoExtraKeys!1112 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410466 () Bool)

(declare-fun res!237992 () Bool)

(assert (=> b!410466 (=> (not res!237992) (not e!245952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410466 (= res!237992 (validKeyInArray!0 k0!794))))

(declare-fun b!410467 () Bool)

(assert (=> b!410467 (= e!245950 tp_is_empty!10513)))

(declare-fun b!410468 () Bool)

(declare-fun res!237999 () Bool)

(assert (=> b!410468 (=> (not res!237999) (not e!245947))))

(assert (=> b!410468 (= res!237999 (bvsle from!863 i!563))))

(declare-fun b!410469 () Bool)

(declare-fun res!237995 () Bool)

(assert (=> b!410469 (=> (not res!237995) (not e!245952))))

(assert (=> b!410469 (= res!237995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17391 () Bool)

(assert (=> mapIsEmpty!17391 mapRes!17391))

(declare-fun b!410470 () Bool)

(declare-fun res!237998 () Bool)

(assert (=> b!410470 (=> (not res!237998) (not e!245947))))

(assert (=> b!410470 (= res!237998 (arrayNoDuplicates!0 lt!188906 #b00000000000000000000000000000000 Nil!6870))))

(assert (= (and start!39080 res!237994) b!410462))

(assert (= (and b!410462 res!237991) b!410456))

(assert (= (and b!410456 res!238001) b!410469))

(assert (= (and b!410469 res!237995) b!410461))

(assert (= (and b!410461 res!238002) b!410459))

(assert (= (and b!410459 res!238000) b!410466))

(assert (= (and b!410466 res!237992) b!410458))

(assert (= (and b!410458 res!237996) b!410460))

(assert (= (and b!410460 res!237993) b!410457))

(assert (= (and b!410457 res!237997) b!410470))

(assert (= (and b!410470 res!237998) b!410468))

(assert (= (and b!410468 res!237999) b!410465))

(assert (= (and b!410464 condMapEmpty!17391) mapIsEmpty!17391))

(assert (= (and b!410464 (not condMapEmpty!17391)) mapNonEmpty!17391))

(get-info :version)

(assert (= (and mapNonEmpty!17391 ((_ is ValueCellFull!4913) mapValue!17391)) b!410463))

(assert (= (and b!410464 ((_ is ValueCellFull!4913) mapDefault!17391)) b!410467))

(assert (= start!39080 b!410464))

(declare-fun m!400389 () Bool)

(assert (=> b!410462 m!400389))

(declare-fun m!400391 () Bool)

(assert (=> mapNonEmpty!17391 m!400391))

(declare-fun m!400393 () Bool)

(assert (=> start!39080 m!400393))

(declare-fun m!400395 () Bool)

(assert (=> start!39080 m!400395))

(declare-fun m!400397 () Bool)

(assert (=> b!410470 m!400397))

(declare-fun m!400399 () Bool)

(assert (=> b!410458 m!400399))

(declare-fun m!400401 () Bool)

(assert (=> b!410457 m!400401))

(declare-fun m!400403 () Bool)

(assert (=> b!410457 m!400403))

(declare-fun m!400405 () Bool)

(assert (=> b!410460 m!400405))

(declare-fun m!400407 () Bool)

(assert (=> b!410461 m!400407))

(declare-fun m!400409 () Bool)

(assert (=> b!410466 m!400409))

(declare-fun m!400411 () Bool)

(assert (=> b!410465 m!400411))

(declare-fun m!400413 () Bool)

(assert (=> b!410465 m!400413))

(declare-fun m!400415 () Bool)

(assert (=> b!410465 m!400415))

(declare-fun m!400417 () Bool)

(assert (=> b!410469 m!400417))

(check-sat (not b!410470) tp_is_empty!10513 (not b!410457) (not b!410469) (not b!410460) (not b!410461) (not b_next!9361) (not mapNonEmpty!17391) (not start!39080) (not b!410465) (not b!410466) (not b!410462) b_and!16721)
(check-sat b_and!16721 (not b_next!9361))
