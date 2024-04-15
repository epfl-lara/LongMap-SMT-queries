; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41048 () Bool)

(assert start!41048)

(declare-fun b_free!10975 () Bool)

(declare-fun b_next!10975 () Bool)

(assert (=> start!41048 (= b_free!10975 (not b_next!10975))))

(declare-fun tp!38754 () Bool)

(declare-fun b_and!19131 () Bool)

(assert (=> start!41048 (= tp!38754 b_and!19131)))

(declare-fun b!457608 () Bool)

(declare-fun res!273355 () Bool)

(declare-fun e!267198 () Bool)

(assert (=> b!457608 (=> (not res!273355) (not e!267198))))

(declare-datatypes ((array!28419 0))(
  ( (array!28420 (arr!13652 (Array (_ BitVec 32) (_ BitVec 64))) (size!14005 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28419)

(declare-datatypes ((List!8261 0))(
  ( (Nil!8258) (Cons!8257 (h!9113 (_ BitVec 64)) (t!14106 List!8261)) )
))
(declare-fun arrayNoDuplicates!0 (array!28419 (_ BitVec 32) List!8261) Bool)

(assert (=> b!457608 (= res!273355 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8258))))

(declare-fun b!457609 () Bool)

(declare-fun res!273354 () Bool)

(assert (=> b!457609 (=> (not res!273354) (not e!267198))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457609 (= res!273354 (validKeyInArray!0 k0!794))))

(declare-fun res!273347 () Bool)

(assert (=> start!41048 (=> (not res!273347) (not e!267198))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41048 (= res!273347 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14005 _keys!709))))))

(assert (=> start!41048 e!267198))

(declare-fun tp_is_empty!12313 () Bool)

(assert (=> start!41048 tp_is_empty!12313))

(assert (=> start!41048 tp!38754))

(assert (=> start!41048 true))

(declare-datatypes ((V!17523 0))(
  ( (V!17524 (val!6201 Int)) )
))
(declare-datatypes ((ValueCell!5813 0))(
  ( (ValueCellFull!5813 (v!8465 V!17523)) (EmptyCell!5813) )
))
(declare-datatypes ((array!28421 0))(
  ( (array!28422 (arr!13653 (Array (_ BitVec 32) ValueCell!5813)) (size!14006 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28421)

(declare-fun e!267201 () Bool)

(declare-fun array_inv!9946 (array!28421) Bool)

(assert (=> start!41048 (and (array_inv!9946 _values!549) e!267201)))

(declare-fun array_inv!9947 (array!28419) Bool)

(assert (=> start!41048 (array_inv!9947 _keys!709)))

(declare-fun b!457610 () Bool)

(declare-fun e!267204 () Bool)

(declare-fun mapRes!20113 () Bool)

(assert (=> b!457610 (= e!267201 (and e!267204 mapRes!20113))))

(declare-fun condMapEmpty!20113 () Bool)

(declare-fun mapDefault!20113 () ValueCell!5813)

(assert (=> b!457610 (= condMapEmpty!20113 (= (arr!13653 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5813)) mapDefault!20113)))))

(declare-fun b!457611 () Bool)

(declare-fun e!267200 () Bool)

(declare-fun e!267197 () Bool)

(assert (=> b!457611 (= e!267200 e!267197)))

(declare-fun res!273350 () Bool)

(assert (=> b!457611 (=> (not res!273350) (not e!267197))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457611 (= res!273350 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17523)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!206884 () array!28419)

(declare-fun lt!206880 () array!28421)

(declare-fun zeroValue!515 () V!17523)

(declare-datatypes ((tuple2!8198 0))(
  ( (tuple2!8199 (_1!4110 (_ BitVec 64)) (_2!4110 V!17523)) )
))
(declare-datatypes ((List!8262 0))(
  ( (Nil!8259) (Cons!8258 (h!9114 tuple2!8198) (t!14107 List!8262)) )
))
(declare-datatypes ((ListLongMap!7101 0))(
  ( (ListLongMap!7102 (toList!3566 List!8262)) )
))
(declare-fun lt!206886 () ListLongMap!7101)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1760 (array!28419 array!28421 (_ BitVec 32) (_ BitVec 32) V!17523 V!17523 (_ BitVec 32) Int) ListLongMap!7101)

(assert (=> b!457611 (= lt!206886 (getCurrentListMapNoExtraKeys!1760 lt!206884 lt!206880 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17523)

(assert (=> b!457611 (= lt!206880 (array!28422 (store (arr!13653 _values!549) i!563 (ValueCellFull!5813 v!412)) (size!14006 _values!549)))))

(declare-fun lt!206883 () ListLongMap!7101)

(assert (=> b!457611 (= lt!206883 (getCurrentListMapNoExtraKeys!1760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457612 () Bool)

(assert (=> b!457612 (= e!267198 e!267200)))

(declare-fun res!273349 () Bool)

(assert (=> b!457612 (=> (not res!273349) (not e!267200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28419 (_ BitVec 32)) Bool)

(assert (=> b!457612 (= res!273349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206884 mask!1025))))

(assert (=> b!457612 (= lt!206884 (array!28420 (store (arr!13652 _keys!709) i!563 k0!794) (size!14005 _keys!709)))))

(declare-fun b!457613 () Bool)

(declare-fun res!273344 () Bool)

(assert (=> b!457613 (=> (not res!273344) (not e!267198))))

(assert (=> b!457613 (= res!273344 (or (= (select (arr!13652 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13652 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457614 () Bool)

(declare-fun e!267202 () Bool)

(assert (=> b!457614 (= e!267202 tp_is_empty!12313)))

(declare-fun b!457615 () Bool)

(declare-fun res!273346 () Bool)

(assert (=> b!457615 (=> (not res!273346) (not e!267200))))

(assert (=> b!457615 (= res!273346 (arrayNoDuplicates!0 lt!206884 #b00000000000000000000000000000000 Nil!8258))))

(declare-fun mapIsEmpty!20113 () Bool)

(assert (=> mapIsEmpty!20113 mapRes!20113))

(declare-fun b!457616 () Bool)

(declare-fun res!273352 () Bool)

(assert (=> b!457616 (=> (not res!273352) (not e!267198))))

(declare-fun arrayContainsKey!0 (array!28419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457616 (= res!273352 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457617 () Bool)

(declare-fun e!267203 () Bool)

(assert (=> b!457617 (= e!267203 true)))

(declare-fun lt!206879 () ListLongMap!7101)

(declare-fun +!1620 (ListLongMap!7101 tuple2!8198) ListLongMap!7101)

(declare-fun get!6726 (ValueCell!5813 V!17523) V!17523)

(declare-fun dynLambda!881 (Int (_ BitVec 64)) V!17523)

(assert (=> b!457617 (= lt!206886 (+!1620 lt!206879 (tuple2!8199 (select (arr!13652 _keys!709) from!863) (get!6726 (select (arr!13653 _values!549) from!863) (dynLambda!881 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457618 () Bool)

(declare-fun res!273357 () Bool)

(assert (=> b!457618 (=> (not res!273357) (not e!267198))))

(assert (=> b!457618 (= res!273357 (and (= (size!14006 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14005 _keys!709) (size!14006 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457619 () Bool)

(declare-fun res!273356 () Bool)

(assert (=> b!457619 (=> (not res!273356) (not e!267200))))

(assert (=> b!457619 (= res!273356 (bvsle from!863 i!563))))

(declare-fun b!457620 () Bool)

(declare-fun res!273353 () Bool)

(assert (=> b!457620 (=> (not res!273353) (not e!267198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457620 (= res!273353 (validMask!0 mask!1025))))

(declare-fun b!457621 () Bool)

(assert (=> b!457621 (= e!267197 (not e!267203))))

(declare-fun res!273348 () Bool)

(assert (=> b!457621 (=> res!273348 e!267203)))

(assert (=> b!457621 (= res!273348 (not (validKeyInArray!0 (select (arr!13652 _keys!709) from!863))))))

(declare-fun lt!206882 () ListLongMap!7101)

(assert (=> b!457621 (= lt!206882 lt!206879)))

(declare-fun lt!206881 () ListLongMap!7101)

(assert (=> b!457621 (= lt!206879 (+!1620 lt!206881 (tuple2!8199 k0!794 v!412)))))

(assert (=> b!457621 (= lt!206882 (getCurrentListMapNoExtraKeys!1760 lt!206884 lt!206880 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457621 (= lt!206881 (getCurrentListMapNoExtraKeys!1760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13285 0))(
  ( (Unit!13286) )
))
(declare-fun lt!206885 () Unit!13285)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!755 (array!28419 array!28421 (_ BitVec 32) (_ BitVec 32) V!17523 V!17523 (_ BitVec 32) (_ BitVec 64) V!17523 (_ BitVec 32) Int) Unit!13285)

(assert (=> b!457621 (= lt!206885 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457622 () Bool)

(declare-fun res!273345 () Bool)

(assert (=> b!457622 (=> (not res!273345) (not e!267198))))

(assert (=> b!457622 (= res!273345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457623 () Bool)

(declare-fun res!273351 () Bool)

(assert (=> b!457623 (=> (not res!273351) (not e!267198))))

(assert (=> b!457623 (= res!273351 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14005 _keys!709))))))

(declare-fun b!457624 () Bool)

(assert (=> b!457624 (= e!267204 tp_is_empty!12313)))

(declare-fun mapNonEmpty!20113 () Bool)

(declare-fun tp!38755 () Bool)

(assert (=> mapNonEmpty!20113 (= mapRes!20113 (and tp!38755 e!267202))))

(declare-fun mapKey!20113 () (_ BitVec 32))

(declare-fun mapRest!20113 () (Array (_ BitVec 32) ValueCell!5813))

(declare-fun mapValue!20113 () ValueCell!5813)

(assert (=> mapNonEmpty!20113 (= (arr!13653 _values!549) (store mapRest!20113 mapKey!20113 mapValue!20113))))

(assert (= (and start!41048 res!273347) b!457620))

(assert (= (and b!457620 res!273353) b!457618))

(assert (= (and b!457618 res!273357) b!457622))

(assert (= (and b!457622 res!273345) b!457608))

(assert (= (and b!457608 res!273355) b!457623))

(assert (= (and b!457623 res!273351) b!457609))

(assert (= (and b!457609 res!273354) b!457613))

(assert (= (and b!457613 res!273344) b!457616))

(assert (= (and b!457616 res!273352) b!457612))

(assert (= (and b!457612 res!273349) b!457615))

(assert (= (and b!457615 res!273346) b!457619))

(assert (= (and b!457619 res!273356) b!457611))

(assert (= (and b!457611 res!273350) b!457621))

(assert (= (and b!457621 (not res!273348)) b!457617))

(assert (= (and b!457610 condMapEmpty!20113) mapIsEmpty!20113))

(assert (= (and b!457610 (not condMapEmpty!20113)) mapNonEmpty!20113))

(get-info :version)

(assert (= (and mapNonEmpty!20113 ((_ is ValueCellFull!5813) mapValue!20113)) b!457614))

(assert (= (and b!457610 ((_ is ValueCellFull!5813) mapDefault!20113)) b!457624))

(assert (= start!41048 b!457610))

(declare-fun b_lambda!9723 () Bool)

(assert (=> (not b_lambda!9723) (not b!457617)))

(declare-fun t!14105 () Bool)

(declare-fun tb!3803 () Bool)

(assert (=> (and start!41048 (= defaultEntry!557 defaultEntry!557) t!14105) tb!3803))

(declare-fun result!7155 () Bool)

(assert (=> tb!3803 (= result!7155 tp_is_empty!12313)))

(assert (=> b!457617 t!14105))

(declare-fun b_and!19133 () Bool)

(assert (= b_and!19131 (and (=> t!14105 result!7155) b_and!19133)))

(declare-fun m!440477 () Bool)

(assert (=> b!457609 m!440477))

(declare-fun m!440479 () Bool)

(assert (=> b!457617 m!440479))

(declare-fun m!440481 () Bool)

(assert (=> b!457617 m!440481))

(declare-fun m!440483 () Bool)

(assert (=> b!457617 m!440483))

(declare-fun m!440485 () Bool)

(assert (=> b!457617 m!440485))

(assert (=> b!457617 m!440483))

(assert (=> b!457617 m!440481))

(declare-fun m!440487 () Bool)

(assert (=> b!457617 m!440487))

(declare-fun m!440489 () Bool)

(assert (=> b!457616 m!440489))

(declare-fun m!440491 () Bool)

(assert (=> start!41048 m!440491))

(declare-fun m!440493 () Bool)

(assert (=> start!41048 m!440493))

(declare-fun m!440495 () Bool)

(assert (=> b!457612 m!440495))

(declare-fun m!440497 () Bool)

(assert (=> b!457612 m!440497))

(assert (=> b!457621 m!440479))

(declare-fun m!440499 () Bool)

(assert (=> b!457621 m!440499))

(declare-fun m!440501 () Bool)

(assert (=> b!457621 m!440501))

(declare-fun m!440503 () Bool)

(assert (=> b!457621 m!440503))

(assert (=> b!457621 m!440479))

(declare-fun m!440505 () Bool)

(assert (=> b!457621 m!440505))

(declare-fun m!440507 () Bool)

(assert (=> b!457621 m!440507))

(declare-fun m!440509 () Bool)

(assert (=> b!457613 m!440509))

(declare-fun m!440511 () Bool)

(assert (=> b!457608 m!440511))

(declare-fun m!440513 () Bool)

(assert (=> b!457620 m!440513))

(declare-fun m!440515 () Bool)

(assert (=> mapNonEmpty!20113 m!440515))

(declare-fun m!440517 () Bool)

(assert (=> b!457611 m!440517))

(declare-fun m!440519 () Bool)

(assert (=> b!457611 m!440519))

(declare-fun m!440521 () Bool)

(assert (=> b!457611 m!440521))

(declare-fun m!440523 () Bool)

(assert (=> b!457622 m!440523))

(declare-fun m!440525 () Bool)

(assert (=> b!457615 m!440525))

(check-sat (not b_lambda!9723) (not b!457609) (not start!41048) (not b!457615) (not b!457622) (not b!457611) b_and!19133 (not b!457621) (not b!457616) (not b_next!10975) (not mapNonEmpty!20113) (not b!457620) (not b!457617) tp_is_empty!12313 (not b!457608) (not b!457612))
(check-sat b_and!19133 (not b_next!10975))
