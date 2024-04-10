; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20390 () Bool)

(assert start!20390)

(declare-fun b_free!5049 () Bool)

(declare-fun b_next!5049 () Bool)

(assert (=> start!20390 (= b_free!5049 (not b_next!5049))))

(declare-fun tp!18179 () Bool)

(declare-fun b_and!11795 () Bool)

(assert (=> start!20390 (= tp!18179 b_and!11795)))

(declare-fun b!201510 () Bool)

(declare-fun res!96310 () Bool)

(declare-fun e!132066 () Bool)

(assert (=> b!201510 (=> (not res!96310) (not e!132066))))

(declare-datatypes ((array!9039 0))(
  ( (array!9040 (arr!4270 (Array (_ BitVec 32) (_ BitVec 64))) (size!4595 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9039)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201510 (= res!96310 (= (select (arr!4270 _keys!825) i!601) k0!843))))

(declare-fun b!201511 () Bool)

(declare-fun e!132068 () Bool)

(declare-fun e!132063 () Bool)

(assert (=> b!201511 (= e!132068 e!132063)))

(declare-fun res!96305 () Bool)

(assert (=> b!201511 (=> res!96305 e!132063)))

(assert (=> b!201511 (= res!96305 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6187 0))(
  ( (V!6188 (val!2497 Int)) )
))
(declare-datatypes ((tuple2!3780 0))(
  ( (tuple2!3781 (_1!1901 (_ BitVec 64)) (_2!1901 V!6187)) )
))
(declare-datatypes ((List!2692 0))(
  ( (Nil!2689) (Cons!2688 (h!3330 tuple2!3780) (t!7623 List!2692)) )
))
(declare-datatypes ((ListLongMap!2693 0))(
  ( (ListLongMap!2694 (toList!1362 List!2692)) )
))
(declare-fun lt!100465 () ListLongMap!2693)

(declare-fun lt!100469 () ListLongMap!2693)

(assert (=> b!201511 (= lt!100465 lt!100469)))

(declare-fun lt!100474 () ListLongMap!2693)

(declare-fun lt!100476 () tuple2!3780)

(declare-fun +!389 (ListLongMap!2693 tuple2!3780) ListLongMap!2693)

(assert (=> b!201511 (= lt!100469 (+!389 lt!100474 lt!100476))))

(declare-datatypes ((Unit!6078 0))(
  ( (Unit!6079) )
))
(declare-fun lt!100470 () Unit!6078)

(declare-fun lt!100475 () ListLongMap!2693)

(declare-fun v!520 () V!6187)

(declare-fun zeroValue!615 () V!6187)

(declare-fun addCommutativeForDiffKeys!110 (ListLongMap!2693 (_ BitVec 64) V!6187 (_ BitVec 64) V!6187) Unit!6078)

(assert (=> b!201511 (= lt!100470 (addCommutativeForDiffKeys!110 lt!100475 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100473 () ListLongMap!2693)

(declare-fun lt!100479 () tuple2!3780)

(assert (=> b!201511 (= lt!100473 (+!389 lt!100465 lt!100479))))

(declare-fun lt!100477 () ListLongMap!2693)

(declare-fun lt!100467 () tuple2!3780)

(assert (=> b!201511 (= lt!100465 (+!389 lt!100477 lt!100467))))

(declare-fun lt!100478 () ListLongMap!2693)

(declare-fun lt!100468 () ListLongMap!2693)

(assert (=> b!201511 (= lt!100478 lt!100468)))

(assert (=> b!201511 (= lt!100468 (+!389 lt!100474 lt!100479))))

(assert (=> b!201511 (= lt!100474 (+!389 lt!100475 lt!100467))))

(declare-fun lt!100466 () ListLongMap!2693)

(assert (=> b!201511 (= lt!100473 (+!389 (+!389 lt!100466 lt!100467) lt!100479))))

(declare-fun minValue!615 () V!6187)

(assert (=> b!201511 (= lt!100479 (tuple2!3781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201511 (= lt!100467 (tuple2!3781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201512 () Bool)

(assert (=> b!201512 (= e!132063 true)))

(assert (=> b!201512 (= (+!389 lt!100469 lt!100479) (+!389 lt!100468 lt!100476))))

(declare-fun lt!100464 () Unit!6078)

(assert (=> b!201512 (= lt!100464 (addCommutativeForDiffKeys!110 lt!100474 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201513 () Bool)

(assert (=> b!201513 (= e!132066 (not e!132068))))

(declare-fun res!96308 () Bool)

(assert (=> b!201513 (=> res!96308 e!132068)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201513 (= res!96308 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2109 0))(
  ( (ValueCellFull!2109 (v!4467 V!6187)) (EmptyCell!2109) )
))
(declare-datatypes ((array!9041 0))(
  ( (array!9042 (arr!4271 (Array (_ BitVec 32) ValueCell!2109)) (size!4596 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9041)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!950 (array!9039 array!9041 (_ BitVec 32) (_ BitVec 32) V!6187 V!6187 (_ BitVec 32) Int) ListLongMap!2693)

(assert (=> b!201513 (= lt!100478 (getCurrentListMap!950 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100472 () array!9041)

(assert (=> b!201513 (= lt!100473 (getCurrentListMap!950 _keys!825 lt!100472 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201513 (and (= lt!100466 lt!100477) (= lt!100477 lt!100466))))

(assert (=> b!201513 (= lt!100477 (+!389 lt!100475 lt!100476))))

(assert (=> b!201513 (= lt!100476 (tuple2!3781 k0!843 v!520))))

(declare-fun lt!100471 () Unit!6078)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!63 (array!9039 array!9041 (_ BitVec 32) (_ BitVec 32) V!6187 V!6187 (_ BitVec 32) (_ BitVec 64) V!6187 (_ BitVec 32) Int) Unit!6078)

(assert (=> b!201513 (= lt!100471 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!63 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!324 (array!9039 array!9041 (_ BitVec 32) (_ BitVec 32) V!6187 V!6187 (_ BitVec 32) Int) ListLongMap!2693)

(assert (=> b!201513 (= lt!100466 (getCurrentListMapNoExtraKeys!324 _keys!825 lt!100472 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201513 (= lt!100472 (array!9042 (store (arr!4271 _values!649) i!601 (ValueCellFull!2109 v!520)) (size!4596 _values!649)))))

(assert (=> b!201513 (= lt!100475 (getCurrentListMapNoExtraKeys!324 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201514 () Bool)

(declare-fun res!96309 () Bool)

(assert (=> b!201514 (=> (not res!96309) (not e!132066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201514 (= res!96309 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8426 () Bool)

(declare-fun mapRes!8426 () Bool)

(declare-fun tp!18178 () Bool)

(declare-fun e!132062 () Bool)

(assert (=> mapNonEmpty!8426 (= mapRes!8426 (and tp!18178 e!132062))))

(declare-fun mapKey!8426 () (_ BitVec 32))

(declare-fun mapRest!8426 () (Array (_ BitVec 32) ValueCell!2109))

(declare-fun mapValue!8426 () ValueCell!2109)

(assert (=> mapNonEmpty!8426 (= (arr!4271 _values!649) (store mapRest!8426 mapKey!8426 mapValue!8426))))

(declare-fun res!96311 () Bool)

(assert (=> start!20390 (=> (not res!96311) (not e!132066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20390 (= res!96311 (validMask!0 mask!1149))))

(assert (=> start!20390 e!132066))

(declare-fun e!132067 () Bool)

(declare-fun array_inv!2817 (array!9041) Bool)

(assert (=> start!20390 (and (array_inv!2817 _values!649) e!132067)))

(assert (=> start!20390 true))

(declare-fun tp_is_empty!4905 () Bool)

(assert (=> start!20390 tp_is_empty!4905))

(declare-fun array_inv!2818 (array!9039) Bool)

(assert (=> start!20390 (array_inv!2818 _keys!825)))

(assert (=> start!20390 tp!18179))

(declare-fun b!201515 () Bool)

(declare-fun res!96307 () Bool)

(assert (=> b!201515 (=> (not res!96307) (not e!132066))))

(assert (=> b!201515 (= res!96307 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4595 _keys!825))))))

(declare-fun mapIsEmpty!8426 () Bool)

(assert (=> mapIsEmpty!8426 mapRes!8426))

(declare-fun b!201516 () Bool)

(declare-fun res!96306 () Bool)

(assert (=> b!201516 (=> (not res!96306) (not e!132066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9039 (_ BitVec 32)) Bool)

(assert (=> b!201516 (= res!96306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201517 () Bool)

(declare-fun e!132064 () Bool)

(assert (=> b!201517 (= e!132064 tp_is_empty!4905)))

(declare-fun b!201518 () Bool)

(assert (=> b!201518 (= e!132067 (and e!132064 mapRes!8426))))

(declare-fun condMapEmpty!8426 () Bool)

(declare-fun mapDefault!8426 () ValueCell!2109)

(assert (=> b!201518 (= condMapEmpty!8426 (= (arr!4271 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2109)) mapDefault!8426)))))

(declare-fun b!201519 () Bool)

(declare-fun res!96312 () Bool)

(assert (=> b!201519 (=> (not res!96312) (not e!132066))))

(assert (=> b!201519 (= res!96312 (and (= (size!4596 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4595 _keys!825) (size!4596 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201520 () Bool)

(assert (=> b!201520 (= e!132062 tp_is_empty!4905)))

(declare-fun b!201521 () Bool)

(declare-fun res!96313 () Bool)

(assert (=> b!201521 (=> (not res!96313) (not e!132066))))

(declare-datatypes ((List!2693 0))(
  ( (Nil!2690) (Cons!2689 (h!3331 (_ BitVec 64)) (t!7624 List!2693)) )
))
(declare-fun arrayNoDuplicates!0 (array!9039 (_ BitVec 32) List!2693) Bool)

(assert (=> b!201521 (= res!96313 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2690))))

(assert (= (and start!20390 res!96311) b!201519))

(assert (= (and b!201519 res!96312) b!201516))

(assert (= (and b!201516 res!96306) b!201521))

(assert (= (and b!201521 res!96313) b!201515))

(assert (= (and b!201515 res!96307) b!201514))

(assert (= (and b!201514 res!96309) b!201510))

(assert (= (and b!201510 res!96310) b!201513))

(assert (= (and b!201513 (not res!96308)) b!201511))

(assert (= (and b!201511 (not res!96305)) b!201512))

(assert (= (and b!201518 condMapEmpty!8426) mapIsEmpty!8426))

(assert (= (and b!201518 (not condMapEmpty!8426)) mapNonEmpty!8426))

(get-info :version)

(assert (= (and mapNonEmpty!8426 ((_ is ValueCellFull!2109) mapValue!8426)) b!201520))

(assert (= (and b!201518 ((_ is ValueCellFull!2109) mapDefault!8426)) b!201517))

(assert (= start!20390 b!201518))

(declare-fun m!228467 () Bool)

(assert (=> b!201512 m!228467))

(declare-fun m!228469 () Bool)

(assert (=> b!201512 m!228469))

(declare-fun m!228471 () Bool)

(assert (=> b!201512 m!228471))

(declare-fun m!228473 () Bool)

(assert (=> b!201511 m!228473))

(declare-fun m!228475 () Bool)

(assert (=> b!201511 m!228475))

(declare-fun m!228477 () Bool)

(assert (=> b!201511 m!228477))

(assert (=> b!201511 m!228473))

(declare-fun m!228479 () Bool)

(assert (=> b!201511 m!228479))

(declare-fun m!228481 () Bool)

(assert (=> b!201511 m!228481))

(declare-fun m!228483 () Bool)

(assert (=> b!201511 m!228483))

(declare-fun m!228485 () Bool)

(assert (=> b!201511 m!228485))

(declare-fun m!228487 () Bool)

(assert (=> b!201511 m!228487))

(declare-fun m!228489 () Bool)

(assert (=> start!20390 m!228489))

(declare-fun m!228491 () Bool)

(assert (=> start!20390 m!228491))

(declare-fun m!228493 () Bool)

(assert (=> start!20390 m!228493))

(declare-fun m!228495 () Bool)

(assert (=> b!201510 m!228495))

(declare-fun m!228497 () Bool)

(assert (=> b!201514 m!228497))

(declare-fun m!228499 () Bool)

(assert (=> b!201521 m!228499))

(declare-fun m!228501 () Bool)

(assert (=> mapNonEmpty!8426 m!228501))

(declare-fun m!228503 () Bool)

(assert (=> b!201516 m!228503))

(declare-fun m!228505 () Bool)

(assert (=> b!201513 m!228505))

(declare-fun m!228507 () Bool)

(assert (=> b!201513 m!228507))

(declare-fun m!228509 () Bool)

(assert (=> b!201513 m!228509))

(declare-fun m!228511 () Bool)

(assert (=> b!201513 m!228511))

(declare-fun m!228513 () Bool)

(assert (=> b!201513 m!228513))

(declare-fun m!228515 () Bool)

(assert (=> b!201513 m!228515))

(declare-fun m!228517 () Bool)

(assert (=> b!201513 m!228517))

(check-sat (not b!201514) (not b!201512) (not mapNonEmpty!8426) (not b!201511) (not b!201513) b_and!11795 tp_is_empty!4905 (not b!201516) (not start!20390) (not b!201521) (not b_next!5049))
(check-sat b_and!11795 (not b_next!5049))
