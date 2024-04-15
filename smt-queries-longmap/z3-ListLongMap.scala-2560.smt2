; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39164 () Bool)

(assert start!39164)

(declare-fun b_free!9445 () Bool)

(declare-fun b_next!9445 () Bool)

(assert (=> start!39164 (= b_free!9445 (not b_next!9445))))

(declare-fun tp!33864 () Bool)

(declare-fun b_and!16805 () Bool)

(assert (=> start!39164 (= tp!33864 b_and!16805)))

(declare-fun mapIsEmpty!17517 () Bool)

(declare-fun mapRes!17517 () Bool)

(assert (=> mapIsEmpty!17517 mapRes!17517))

(declare-fun b!412346 () Bool)

(declare-fun e!246707 () Bool)

(declare-fun tp_is_empty!10597 () Bool)

(assert (=> b!412346 (= e!246707 tp_is_empty!10597)))

(declare-fun b!412347 () Bool)

(declare-fun res!239512 () Bool)

(declare-fun e!246704 () Bool)

(assert (=> b!412347 (=> (not res!239512) (not e!246704))))

(declare-datatypes ((array!25045 0))(
  ( (array!25046 (arr!11972 (Array (_ BitVec 32) (_ BitVec 64))) (size!12325 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25045)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15235 0))(
  ( (V!15236 (val!5343 Int)) )
))
(declare-datatypes ((ValueCell!4955 0))(
  ( (ValueCellFull!4955 (v!7584 V!15235)) (EmptyCell!4955) )
))
(declare-datatypes ((array!25047 0))(
  ( (array!25048 (arr!11973 (Array (_ BitVec 32) ValueCell!4955)) (size!12326 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25047)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!412347 (= res!239512 (and (= (size!12326 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12325 _keys!709) (size!12326 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412348 () Bool)

(declare-fun res!239508 () Bool)

(declare-fun e!246706 () Bool)

(assert (=> b!412348 (=> (not res!239508) (not e!246706))))

(declare-fun lt!189282 () array!25045)

(declare-datatypes ((List!6932 0))(
  ( (Nil!6929) (Cons!6928 (h!7784 (_ BitVec 64)) (t!12097 List!6932)) )
))
(declare-fun arrayNoDuplicates!0 (array!25045 (_ BitVec 32) List!6932) Bool)

(assert (=> b!412348 (= res!239508 (arrayNoDuplicates!0 lt!189282 #b00000000000000000000000000000000 Nil!6929))))

(declare-fun res!239513 () Bool)

(assert (=> start!39164 (=> (not res!239513) (not e!246704))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39164 (= res!239513 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12325 _keys!709))))))

(assert (=> start!39164 e!246704))

(assert (=> start!39164 tp_is_empty!10597))

(assert (=> start!39164 tp!33864))

(assert (=> start!39164 true))

(declare-fun e!246703 () Bool)

(declare-fun array_inv!8782 (array!25047) Bool)

(assert (=> start!39164 (and (array_inv!8782 _values!549) e!246703)))

(declare-fun array_inv!8783 (array!25045) Bool)

(assert (=> start!39164 (array_inv!8783 _keys!709)))

(declare-fun mapNonEmpty!17517 () Bool)

(declare-fun tp!33863 () Bool)

(assert (=> mapNonEmpty!17517 (= mapRes!17517 (and tp!33863 e!246707))))

(declare-fun mapKey!17517 () (_ BitVec 32))

(declare-fun mapValue!17517 () ValueCell!4955)

(declare-fun mapRest!17517 () (Array (_ BitVec 32) ValueCell!4955))

(assert (=> mapNonEmpty!17517 (= (arr!11973 _values!549) (store mapRest!17517 mapKey!17517 mapValue!17517))))

(declare-fun b!412349 () Bool)

(declare-fun res!239509 () Bool)

(assert (=> b!412349 (=> (not res!239509) (not e!246706))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412349 (= res!239509 (bvsle from!863 i!563))))

(declare-fun b!412350 () Bool)

(declare-fun e!246705 () Bool)

(assert (=> b!412350 (= e!246703 (and e!246705 mapRes!17517))))

(declare-fun condMapEmpty!17517 () Bool)

(declare-fun mapDefault!17517 () ValueCell!4955)

(assert (=> b!412350 (= condMapEmpty!17517 (= (arr!11973 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4955)) mapDefault!17517)))))

(declare-fun b!412351 () Bool)

(assert (=> b!412351 (= e!246706 false)))

(declare-fun minValue!515 () V!15235)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15235)

(declare-datatypes ((tuple2!6914 0))(
  ( (tuple2!6915 (_1!3468 (_ BitVec 64)) (_2!3468 V!15235)) )
))
(declare-datatypes ((List!6933 0))(
  ( (Nil!6930) (Cons!6929 (h!7785 tuple2!6914) (t!12098 List!6933)) )
))
(declare-datatypes ((ListLongMap!5817 0))(
  ( (ListLongMap!5818 (toList!2924 List!6933)) )
))
(declare-fun lt!189284 () ListLongMap!5817)

(declare-fun v!412 () V!15235)

(declare-fun getCurrentListMapNoExtraKeys!1138 (array!25045 array!25047 (_ BitVec 32) (_ BitVec 32) V!15235 V!15235 (_ BitVec 32) Int) ListLongMap!5817)

(assert (=> b!412351 (= lt!189284 (getCurrentListMapNoExtraKeys!1138 lt!189282 (array!25048 (store (arr!11973 _values!549) i!563 (ValueCellFull!4955 v!412)) (size!12326 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189283 () ListLongMap!5817)

(assert (=> b!412351 (= lt!189283 (getCurrentListMapNoExtraKeys!1138 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412352 () Bool)

(declare-fun res!239506 () Bool)

(assert (=> b!412352 (=> (not res!239506) (not e!246704))))

(assert (=> b!412352 (= res!239506 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12325 _keys!709))))))

(declare-fun b!412353 () Bool)

(declare-fun res!239510 () Bool)

(assert (=> b!412353 (=> (not res!239510) (not e!246704))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412353 (= res!239510 (validKeyInArray!0 k0!794))))

(declare-fun b!412354 () Bool)

(assert (=> b!412354 (= e!246704 e!246706)))

(declare-fun res!239514 () Bool)

(assert (=> b!412354 (=> (not res!239514) (not e!246706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25045 (_ BitVec 32)) Bool)

(assert (=> b!412354 (= res!239514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189282 mask!1025))))

(assert (=> b!412354 (= lt!189282 (array!25046 (store (arr!11972 _keys!709) i!563 k0!794) (size!12325 _keys!709)))))

(declare-fun b!412355 () Bool)

(declare-fun res!239505 () Bool)

(assert (=> b!412355 (=> (not res!239505) (not e!246704))))

(assert (=> b!412355 (= res!239505 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6929))))

(declare-fun b!412356 () Bool)

(declare-fun res!239503 () Bool)

(assert (=> b!412356 (=> (not res!239503) (not e!246704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412356 (= res!239503 (validMask!0 mask!1025))))

(declare-fun b!412357 () Bool)

(declare-fun res!239507 () Bool)

(assert (=> b!412357 (=> (not res!239507) (not e!246704))))

(assert (=> b!412357 (= res!239507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412358 () Bool)

(declare-fun res!239511 () Bool)

(assert (=> b!412358 (=> (not res!239511) (not e!246704))))

(declare-fun arrayContainsKey!0 (array!25045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412358 (= res!239511 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412359 () Bool)

(declare-fun res!239504 () Bool)

(assert (=> b!412359 (=> (not res!239504) (not e!246704))))

(assert (=> b!412359 (= res!239504 (or (= (select (arr!11972 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11972 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412360 () Bool)

(assert (=> b!412360 (= e!246705 tp_is_empty!10597)))

(assert (= (and start!39164 res!239513) b!412356))

(assert (= (and b!412356 res!239503) b!412347))

(assert (= (and b!412347 res!239512) b!412357))

(assert (= (and b!412357 res!239507) b!412355))

(assert (= (and b!412355 res!239505) b!412352))

(assert (= (and b!412352 res!239506) b!412353))

(assert (= (and b!412353 res!239510) b!412359))

(assert (= (and b!412359 res!239504) b!412358))

(assert (= (and b!412358 res!239511) b!412354))

(assert (= (and b!412354 res!239514) b!412348))

(assert (= (and b!412348 res!239508) b!412349))

(assert (= (and b!412349 res!239509) b!412351))

(assert (= (and b!412350 condMapEmpty!17517) mapIsEmpty!17517))

(assert (= (and b!412350 (not condMapEmpty!17517)) mapNonEmpty!17517))

(get-info :version)

(assert (= (and mapNonEmpty!17517 ((_ is ValueCellFull!4955) mapValue!17517)) b!412346))

(assert (= (and b!412350 ((_ is ValueCellFull!4955) mapDefault!17517)) b!412360))

(assert (= start!39164 b!412350))

(declare-fun m!401649 () Bool)

(assert (=> mapNonEmpty!17517 m!401649))

(declare-fun m!401651 () Bool)

(assert (=> b!412353 m!401651))

(declare-fun m!401653 () Bool)

(assert (=> b!412358 m!401653))

(declare-fun m!401655 () Bool)

(assert (=> b!412351 m!401655))

(declare-fun m!401657 () Bool)

(assert (=> b!412351 m!401657))

(declare-fun m!401659 () Bool)

(assert (=> b!412351 m!401659))

(declare-fun m!401661 () Bool)

(assert (=> b!412357 m!401661))

(declare-fun m!401663 () Bool)

(assert (=> b!412359 m!401663))

(declare-fun m!401665 () Bool)

(assert (=> b!412356 m!401665))

(declare-fun m!401667 () Bool)

(assert (=> start!39164 m!401667))

(declare-fun m!401669 () Bool)

(assert (=> start!39164 m!401669))

(declare-fun m!401671 () Bool)

(assert (=> b!412354 m!401671))

(declare-fun m!401673 () Bool)

(assert (=> b!412354 m!401673))

(declare-fun m!401675 () Bool)

(assert (=> b!412355 m!401675))

(declare-fun m!401677 () Bool)

(assert (=> b!412348 m!401677))

(check-sat (not b!412351) (not b!412356) (not b!412355) (not b!412348) (not mapNonEmpty!17517) (not b!412353) (not b!412357) tp_is_empty!10597 (not b_next!9445) (not start!39164) (not b!412358) b_and!16805 (not b!412354))
(check-sat b_and!16805 (not b_next!9445))
