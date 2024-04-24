; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20350 () Bool)

(assert start!20350)

(declare-fun b_free!5005 () Bool)

(declare-fun b_next!5005 () Bool)

(assert (=> start!20350 (= b_free!5005 (not b_next!5005))))

(declare-fun tp!18047 () Bool)

(declare-fun b_and!11765 () Bool)

(assert (=> start!20350 (= tp!18047 b_and!11765)))

(declare-fun b!200765 () Bool)

(declare-fun e!131627 () Bool)

(declare-fun e!131626 () Bool)

(declare-fun mapRes!8360 () Bool)

(assert (=> b!200765 (= e!131627 (and e!131626 mapRes!8360))))

(declare-fun condMapEmpty!8360 () Bool)

(declare-datatypes ((V!6129 0))(
  ( (V!6130 (val!2475 Int)) )
))
(declare-datatypes ((ValueCell!2087 0))(
  ( (ValueCellFull!2087 (v!4446 V!6129)) (EmptyCell!2087) )
))
(declare-datatypes ((array!8947 0))(
  ( (array!8948 (arr!4224 (Array (_ BitVec 32) ValueCell!2087)) (size!4549 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8947)

(declare-fun mapDefault!8360 () ValueCell!2087)

(assert (=> b!200765 (= condMapEmpty!8360 (= (arr!4224 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2087)) mapDefault!8360)))))

(declare-fun res!95736 () Bool)

(declare-fun e!131629 () Bool)

(assert (=> start!20350 (=> (not res!95736) (not e!131629))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20350 (= res!95736 (validMask!0 mask!1149))))

(assert (=> start!20350 e!131629))

(declare-fun array_inv!2755 (array!8947) Bool)

(assert (=> start!20350 (and (array_inv!2755 _values!649) e!131627)))

(assert (=> start!20350 true))

(declare-fun tp_is_empty!4861 () Bool)

(assert (=> start!20350 tp_is_empty!4861))

(declare-datatypes ((array!8949 0))(
  ( (array!8950 (arr!4225 (Array (_ BitVec 32) (_ BitVec 64))) (size!4550 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8949)

(declare-fun array_inv!2756 (array!8949) Bool)

(assert (=> start!20350 (array_inv!2756 _keys!825)))

(assert (=> start!20350 tp!18047))

(declare-fun b!200766 () Bool)

(declare-fun e!131625 () Bool)

(assert (=> b!200766 (= e!131629 (not e!131625))))

(declare-fun res!95738 () Bool)

(assert (=> b!200766 (=> res!95738 e!131625)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200766 (= res!95738 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3678 0))(
  ( (tuple2!3679 (_1!1850 (_ BitVec 64)) (_2!1850 V!6129)) )
))
(declare-datatypes ((List!2595 0))(
  ( (Nil!2592) (Cons!2591 (h!3233 tuple2!3678) (t!7518 List!2595)) )
))
(declare-datatypes ((ListLongMap!2593 0))(
  ( (ListLongMap!2594 (toList!1312 List!2595)) )
))
(declare-fun lt!99472 () ListLongMap!2593)

(declare-fun zeroValue!615 () V!6129)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6129)

(declare-fun getCurrentListMap!907 (array!8949 array!8947 (_ BitVec 32) (_ BitVec 32) V!6129 V!6129 (_ BitVec 32) Int) ListLongMap!2593)

(assert (=> b!200766 (= lt!99472 (getCurrentListMap!907 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99471 () array!8947)

(declare-fun lt!99469 () ListLongMap!2593)

(assert (=> b!200766 (= lt!99469 (getCurrentListMap!907 _keys!825 lt!99471 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99473 () ListLongMap!2593)

(declare-fun lt!99474 () ListLongMap!2593)

(assert (=> b!200766 (and (= lt!99473 lt!99474) (= lt!99474 lt!99473))))

(declare-fun lt!99468 () ListLongMap!2593)

(declare-fun lt!99482 () tuple2!3678)

(declare-fun +!366 (ListLongMap!2593 tuple2!3678) ListLongMap!2593)

(assert (=> b!200766 (= lt!99474 (+!366 lt!99468 lt!99482))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6129)

(assert (=> b!200766 (= lt!99482 (tuple2!3679 k0!843 v!520))))

(declare-datatypes ((Unit!6016 0))(
  ( (Unit!6017) )
))
(declare-fun lt!99470 () Unit!6016)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!43 (array!8949 array!8947 (_ BitVec 32) (_ BitVec 32) V!6129 V!6129 (_ BitVec 32) (_ BitVec 64) V!6129 (_ BitVec 32) Int) Unit!6016)

(assert (=> b!200766 (= lt!99470 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!43 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!300 (array!8949 array!8947 (_ BitVec 32) (_ BitVec 32) V!6129 V!6129 (_ BitVec 32) Int) ListLongMap!2593)

(assert (=> b!200766 (= lt!99473 (getCurrentListMapNoExtraKeys!300 _keys!825 lt!99471 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200766 (= lt!99471 (array!8948 (store (arr!4224 _values!649) i!601 (ValueCellFull!2087 v!520)) (size!4549 _values!649)))))

(assert (=> b!200766 (= lt!99468 (getCurrentListMapNoExtraKeys!300 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200767 () Bool)

(declare-fun res!95732 () Bool)

(assert (=> b!200767 (=> (not res!95732) (not e!131629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200767 (= res!95732 (validKeyInArray!0 k0!843))))

(declare-fun b!200768 () Bool)

(declare-fun res!95734 () Bool)

(assert (=> b!200768 (=> (not res!95734) (not e!131629))))

(declare-datatypes ((List!2596 0))(
  ( (Nil!2593) (Cons!2592 (h!3234 (_ BitVec 64)) (t!7519 List!2596)) )
))
(declare-fun arrayNoDuplicates!0 (array!8949 (_ BitVec 32) List!2596) Bool)

(assert (=> b!200768 (= res!95734 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2593))))

(declare-fun b!200769 () Bool)

(declare-fun res!95735 () Bool)

(assert (=> b!200769 (=> (not res!95735) (not e!131629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8949 (_ BitVec 32)) Bool)

(assert (=> b!200769 (= res!95735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200770 () Bool)

(declare-fun res!95737 () Bool)

(assert (=> b!200770 (=> (not res!95737) (not e!131629))))

(assert (=> b!200770 (= res!95737 (and (= (size!4549 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4550 _keys!825) (size!4549 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200771 () Bool)

(declare-fun res!95733 () Bool)

(assert (=> b!200771 (=> (not res!95733) (not e!131629))))

(assert (=> b!200771 (= res!95733 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4550 _keys!825))))))

(declare-fun b!200772 () Bool)

(assert (=> b!200772 (= e!131626 tp_is_empty!4861)))

(declare-fun b!200773 () Bool)

(declare-fun e!131630 () Bool)

(assert (=> b!200773 (= e!131630 tp_is_empty!4861)))

(declare-fun b!200774 () Bool)

(declare-fun res!95739 () Bool)

(assert (=> b!200774 (=> (not res!95739) (not e!131629))))

(assert (=> b!200774 (= res!95739 (= (select (arr!4225 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8360 () Bool)

(assert (=> mapIsEmpty!8360 mapRes!8360))

(declare-fun mapNonEmpty!8360 () Bool)

(declare-fun tp!18046 () Bool)

(assert (=> mapNonEmpty!8360 (= mapRes!8360 (and tp!18046 e!131630))))

(declare-fun mapRest!8360 () (Array (_ BitVec 32) ValueCell!2087))

(declare-fun mapValue!8360 () ValueCell!2087)

(declare-fun mapKey!8360 () (_ BitVec 32))

(assert (=> mapNonEmpty!8360 (= (arr!4224 _values!649) (store mapRest!8360 mapKey!8360 mapValue!8360))))

(declare-fun b!200775 () Bool)

(declare-fun e!131628 () Bool)

(assert (=> b!200775 (= e!131628 true)))

(declare-fun lt!99467 () ListLongMap!2593)

(declare-fun lt!99476 () tuple2!3678)

(declare-fun lt!99479 () ListLongMap!2593)

(assert (=> b!200775 (= (+!366 lt!99479 lt!99476) (+!366 lt!99467 lt!99482))))

(declare-fun lt!99477 () Unit!6016)

(declare-fun lt!99481 () ListLongMap!2593)

(declare-fun addCommutativeForDiffKeys!92 (ListLongMap!2593 (_ BitVec 64) V!6129 (_ BitVec 64) V!6129) Unit!6016)

(assert (=> b!200775 (= lt!99477 (addCommutativeForDiffKeys!92 lt!99481 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200776 () Bool)

(assert (=> b!200776 (= e!131625 e!131628)))

(declare-fun res!95740 () Bool)

(assert (=> b!200776 (=> res!95740 e!131628)))

(assert (=> b!200776 (= res!95740 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99480 () ListLongMap!2593)

(assert (=> b!200776 (= lt!99480 lt!99479)))

(assert (=> b!200776 (= lt!99479 (+!366 lt!99481 lt!99482))))

(declare-fun lt!99478 () Unit!6016)

(assert (=> b!200776 (= lt!99478 (addCommutativeForDiffKeys!92 lt!99468 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!200776 (= lt!99469 (+!366 lt!99480 lt!99476))))

(declare-fun lt!99475 () tuple2!3678)

(assert (=> b!200776 (= lt!99480 (+!366 lt!99474 lt!99475))))

(assert (=> b!200776 (= lt!99472 lt!99467)))

(assert (=> b!200776 (= lt!99467 (+!366 lt!99481 lt!99476))))

(assert (=> b!200776 (= lt!99481 (+!366 lt!99468 lt!99475))))

(assert (=> b!200776 (= lt!99469 (+!366 (+!366 lt!99473 lt!99475) lt!99476))))

(assert (=> b!200776 (= lt!99476 (tuple2!3679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200776 (= lt!99475 (tuple2!3679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20350 res!95736) b!200770))

(assert (= (and b!200770 res!95737) b!200769))

(assert (= (and b!200769 res!95735) b!200768))

(assert (= (and b!200768 res!95734) b!200771))

(assert (= (and b!200771 res!95733) b!200767))

(assert (= (and b!200767 res!95732) b!200774))

(assert (= (and b!200774 res!95739) b!200766))

(assert (= (and b!200766 (not res!95738)) b!200776))

(assert (= (and b!200776 (not res!95740)) b!200775))

(assert (= (and b!200765 condMapEmpty!8360) mapIsEmpty!8360))

(assert (= (and b!200765 (not condMapEmpty!8360)) mapNonEmpty!8360))

(get-info :version)

(assert (= (and mapNonEmpty!8360 ((_ is ValueCellFull!2087) mapValue!8360)) b!200773))

(assert (= (and b!200765 ((_ is ValueCellFull!2087) mapDefault!8360)) b!200772))

(assert (= start!20350 b!200765))

(declare-fun m!227505 () Bool)

(assert (=> start!20350 m!227505))

(declare-fun m!227507 () Bool)

(assert (=> start!20350 m!227507))

(declare-fun m!227509 () Bool)

(assert (=> start!20350 m!227509))

(declare-fun m!227511 () Bool)

(assert (=> b!200766 m!227511))

(declare-fun m!227513 () Bool)

(assert (=> b!200766 m!227513))

(declare-fun m!227515 () Bool)

(assert (=> b!200766 m!227515))

(declare-fun m!227517 () Bool)

(assert (=> b!200766 m!227517))

(declare-fun m!227519 () Bool)

(assert (=> b!200766 m!227519))

(declare-fun m!227521 () Bool)

(assert (=> b!200766 m!227521))

(declare-fun m!227523 () Bool)

(assert (=> b!200766 m!227523))

(declare-fun m!227525 () Bool)

(assert (=> b!200776 m!227525))

(declare-fun m!227527 () Bool)

(assert (=> b!200776 m!227527))

(declare-fun m!227529 () Bool)

(assert (=> b!200776 m!227529))

(declare-fun m!227531 () Bool)

(assert (=> b!200776 m!227531))

(assert (=> b!200776 m!227529))

(declare-fun m!227533 () Bool)

(assert (=> b!200776 m!227533))

(declare-fun m!227535 () Bool)

(assert (=> b!200776 m!227535))

(declare-fun m!227537 () Bool)

(assert (=> b!200776 m!227537))

(declare-fun m!227539 () Bool)

(assert (=> b!200776 m!227539))

(declare-fun m!227541 () Bool)

(assert (=> b!200768 m!227541))

(declare-fun m!227543 () Bool)

(assert (=> b!200769 m!227543))

(declare-fun m!227545 () Bool)

(assert (=> b!200767 m!227545))

(declare-fun m!227547 () Bool)

(assert (=> b!200775 m!227547))

(declare-fun m!227549 () Bool)

(assert (=> b!200775 m!227549))

(declare-fun m!227551 () Bool)

(assert (=> b!200775 m!227551))

(declare-fun m!227553 () Bool)

(assert (=> b!200774 m!227553))

(declare-fun m!227555 () Bool)

(assert (=> mapNonEmpty!8360 m!227555))

(check-sat (not b!200769) (not b!200776) (not mapNonEmpty!8360) (not b!200766) (not start!20350) (not b!200767) tp_is_empty!4861 (not b_next!5005) (not b!200768) (not b!200775) b_and!11765)
(check-sat b_and!11765 (not b_next!5005))
