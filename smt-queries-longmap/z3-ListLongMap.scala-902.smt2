; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20512 () Bool)

(assert start!20512)

(declare-fun b_free!5167 () Bool)

(declare-fun b_next!5167 () Bool)

(assert (=> start!20512 (= b_free!5167 (not b_next!5167))))

(declare-fun tp!18532 () Bool)

(declare-fun b_and!11887 () Bool)

(assert (=> start!20512 (= tp!18532 b_and!11887)))

(declare-fun mapNonEmpty!8603 () Bool)

(declare-fun mapRes!8603 () Bool)

(declare-fun tp!18533 () Bool)

(declare-fun e!133205 () Bool)

(assert (=> mapNonEmpty!8603 (= mapRes!8603 (and tp!18533 e!133205))))

(declare-datatypes ((V!6345 0))(
  ( (V!6346 (val!2556 Int)) )
))
(declare-datatypes ((ValueCell!2168 0))(
  ( (ValueCellFull!2168 (v!4520 V!6345)) (EmptyCell!2168) )
))
(declare-fun mapValue!8603 () ValueCell!2168)

(declare-datatypes ((array!9253 0))(
  ( (array!9254 (arr!4376 (Array (_ BitVec 32) ValueCell!2168)) (size!4702 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9253)

(declare-fun mapRest!8603 () (Array (_ BitVec 32) ValueCell!2168))

(declare-fun mapKey!8603 () (_ BitVec 32))

(assert (=> mapNonEmpty!8603 (= (arr!4376 _values!649) (store mapRest!8603 mapKey!8603 mapValue!8603))))

(declare-fun b!203496 () Bool)

(declare-fun e!133201 () Bool)

(declare-fun e!133200 () Bool)

(assert (=> b!203496 (= e!133201 (not e!133200))))

(declare-fun res!97815 () Bool)

(assert (=> b!203496 (=> res!97815 e!133200)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203496 (= res!97815 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3854 0))(
  ( (tuple2!3855 (_1!1938 (_ BitVec 64)) (_2!1938 V!6345)) )
))
(declare-datatypes ((List!2764 0))(
  ( (Nil!2761) (Cons!2760 (h!3402 tuple2!3854) (t!7686 List!2764)) )
))
(declare-datatypes ((ListLongMap!2757 0))(
  ( (ListLongMap!2758 (toList!1394 List!2764)) )
))
(declare-fun lt!102647 () ListLongMap!2757)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6345)

(declare-datatypes ((array!9255 0))(
  ( (array!9256 (arr!4377 (Array (_ BitVec 32) (_ BitVec 64))) (size!4703 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9255)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6345)

(declare-fun getCurrentListMap!944 (array!9255 array!9253 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) Int) ListLongMap!2757)

(assert (=> b!203496 (= lt!102647 (getCurrentListMap!944 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102648 () array!9253)

(declare-fun lt!102643 () ListLongMap!2757)

(assert (=> b!203496 (= lt!102643 (getCurrentListMap!944 _keys!825 lt!102648 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102650 () ListLongMap!2757)

(declare-fun lt!102641 () ListLongMap!2757)

(assert (=> b!203496 (and (= lt!102650 lt!102641) (= lt!102641 lt!102650))))

(declare-fun lt!102640 () ListLongMap!2757)

(declare-fun lt!102644 () tuple2!3854)

(declare-fun +!443 (ListLongMap!2757 tuple2!3854) ListLongMap!2757)

(assert (=> b!203496 (= lt!102641 (+!443 lt!102640 lt!102644))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6345)

(assert (=> b!203496 (= lt!102644 (tuple2!3855 k0!843 v!520))))

(declare-datatypes ((Unit!6132 0))(
  ( (Unit!6133) )
))
(declare-fun lt!102646 () Unit!6132)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!103 (array!9255 array!9253 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) (_ BitVec 64) V!6345 (_ BitVec 32) Int) Unit!6132)

(assert (=> b!203496 (= lt!102646 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!103 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!354 (array!9255 array!9253 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) Int) ListLongMap!2757)

(assert (=> b!203496 (= lt!102650 (getCurrentListMapNoExtraKeys!354 _keys!825 lt!102648 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203496 (= lt!102648 (array!9254 (store (arr!4376 _values!649) i!601 (ValueCellFull!2168 v!520)) (size!4702 _values!649)))))

(assert (=> b!203496 (= lt!102640 (getCurrentListMapNoExtraKeys!354 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203497 () Bool)

(declare-fun e!133202 () Bool)

(assert (=> b!203497 (= e!133202 true)))

(declare-fun lt!102642 () ListLongMap!2757)

(declare-fun lt!102649 () ListLongMap!2757)

(assert (=> b!203497 (= lt!102642 (+!443 lt!102649 lt!102644))))

(declare-fun lt!102645 () Unit!6132)

(declare-fun addCommutativeForDiffKeys!141 (ListLongMap!2757 (_ BitVec 64) V!6345 (_ BitVec 64) V!6345) Unit!6132)

(assert (=> b!203497 (= lt!102645 (addCommutativeForDiffKeys!141 lt!102640 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203498 () Bool)

(declare-fun res!97814 () Bool)

(assert (=> b!203498 (=> (not res!97814) (not e!133201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203498 (= res!97814 (validKeyInArray!0 k0!843))))

(declare-fun b!203499 () Bool)

(declare-fun e!133203 () Bool)

(declare-fun e!133204 () Bool)

(assert (=> b!203499 (= e!133203 (and e!133204 mapRes!8603))))

(declare-fun condMapEmpty!8603 () Bool)

(declare-fun mapDefault!8603 () ValueCell!2168)

(assert (=> b!203499 (= condMapEmpty!8603 (= (arr!4376 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2168)) mapDefault!8603)))))

(declare-fun b!203500 () Bool)

(declare-fun res!97816 () Bool)

(assert (=> b!203500 (=> (not res!97816) (not e!133201))))

(declare-datatypes ((List!2765 0))(
  ( (Nil!2762) (Cons!2761 (h!3403 (_ BitVec 64)) (t!7687 List!2765)) )
))
(declare-fun arrayNoDuplicates!0 (array!9255 (_ BitVec 32) List!2765) Bool)

(assert (=> b!203500 (= res!97816 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2762))))

(declare-fun b!203501 () Bool)

(declare-fun res!97820 () Bool)

(assert (=> b!203501 (=> (not res!97820) (not e!133201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9255 (_ BitVec 32)) Bool)

(assert (=> b!203501 (= res!97820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203502 () Bool)

(declare-fun res!97812 () Bool)

(assert (=> b!203502 (=> (not res!97812) (not e!133201))))

(assert (=> b!203502 (= res!97812 (= (select (arr!4377 _keys!825) i!601) k0!843))))

(declare-fun b!203503 () Bool)

(declare-fun tp_is_empty!5023 () Bool)

(assert (=> b!203503 (= e!133204 tp_is_empty!5023)))

(declare-fun b!203504 () Bool)

(declare-fun res!97813 () Bool)

(assert (=> b!203504 (=> (not res!97813) (not e!133201))))

(assert (=> b!203504 (= res!97813 (and (= (size!4702 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4703 _keys!825) (size!4702 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203505 () Bool)

(assert (=> b!203505 (= e!133200 e!133202)))

(declare-fun res!97819 () Bool)

(assert (=> b!203505 (=> res!97819 e!133202)))

(assert (=> b!203505 (= res!97819 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203505 (= lt!102643 lt!102642)))

(declare-fun lt!102639 () tuple2!3854)

(assert (=> b!203505 (= lt!102642 (+!443 lt!102641 lt!102639))))

(assert (=> b!203505 (= lt!102647 lt!102649)))

(assert (=> b!203505 (= lt!102649 (+!443 lt!102640 lt!102639))))

(assert (=> b!203505 (= lt!102643 (+!443 lt!102650 lt!102639))))

(assert (=> b!203505 (= lt!102639 (tuple2!3855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8603 () Bool)

(assert (=> mapIsEmpty!8603 mapRes!8603))

(declare-fun res!97818 () Bool)

(assert (=> start!20512 (=> (not res!97818) (not e!133201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20512 (= res!97818 (validMask!0 mask!1149))))

(assert (=> start!20512 e!133201))

(declare-fun array_inv!2869 (array!9253) Bool)

(assert (=> start!20512 (and (array_inv!2869 _values!649) e!133203)))

(assert (=> start!20512 true))

(assert (=> start!20512 tp_is_empty!5023))

(declare-fun array_inv!2870 (array!9255) Bool)

(assert (=> start!20512 (array_inv!2870 _keys!825)))

(assert (=> start!20512 tp!18532))

(declare-fun b!203506 () Bool)

(declare-fun res!97817 () Bool)

(assert (=> b!203506 (=> (not res!97817) (not e!133201))))

(assert (=> b!203506 (= res!97817 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4703 _keys!825))))))

(declare-fun b!203507 () Bool)

(assert (=> b!203507 (= e!133205 tp_is_empty!5023)))

(assert (= (and start!20512 res!97818) b!203504))

(assert (= (and b!203504 res!97813) b!203501))

(assert (= (and b!203501 res!97820) b!203500))

(assert (= (and b!203500 res!97816) b!203506))

(assert (= (and b!203506 res!97817) b!203498))

(assert (= (and b!203498 res!97814) b!203502))

(assert (= (and b!203502 res!97812) b!203496))

(assert (= (and b!203496 (not res!97815)) b!203505))

(assert (= (and b!203505 (not res!97819)) b!203497))

(assert (= (and b!203499 condMapEmpty!8603) mapIsEmpty!8603))

(assert (= (and b!203499 (not condMapEmpty!8603)) mapNonEmpty!8603))

(get-info :version)

(assert (= (and mapNonEmpty!8603 ((_ is ValueCellFull!2168) mapValue!8603)) b!203507))

(assert (= (and b!203499 ((_ is ValueCellFull!2168) mapDefault!8603)) b!203503))

(assert (= start!20512 b!203499))

(declare-fun m!230475 () Bool)

(assert (=> b!203498 m!230475))

(declare-fun m!230477 () Bool)

(assert (=> b!203502 m!230477))

(declare-fun m!230479 () Bool)

(assert (=> start!20512 m!230479))

(declare-fun m!230481 () Bool)

(assert (=> start!20512 m!230481))

(declare-fun m!230483 () Bool)

(assert (=> start!20512 m!230483))

(declare-fun m!230485 () Bool)

(assert (=> b!203497 m!230485))

(declare-fun m!230487 () Bool)

(assert (=> b!203497 m!230487))

(declare-fun m!230489 () Bool)

(assert (=> b!203501 m!230489))

(declare-fun m!230491 () Bool)

(assert (=> mapNonEmpty!8603 m!230491))

(declare-fun m!230493 () Bool)

(assert (=> b!203496 m!230493))

(declare-fun m!230495 () Bool)

(assert (=> b!203496 m!230495))

(declare-fun m!230497 () Bool)

(assert (=> b!203496 m!230497))

(declare-fun m!230499 () Bool)

(assert (=> b!203496 m!230499))

(declare-fun m!230501 () Bool)

(assert (=> b!203496 m!230501))

(declare-fun m!230503 () Bool)

(assert (=> b!203496 m!230503))

(declare-fun m!230505 () Bool)

(assert (=> b!203496 m!230505))

(declare-fun m!230507 () Bool)

(assert (=> b!203505 m!230507))

(declare-fun m!230509 () Bool)

(assert (=> b!203505 m!230509))

(declare-fun m!230511 () Bool)

(assert (=> b!203505 m!230511))

(declare-fun m!230513 () Bool)

(assert (=> b!203500 m!230513))

(check-sat (not b_next!5167) b_and!11887 (not b!203497) tp_is_empty!5023 (not b!203505) (not b!203498) (not b!203501) (not b!203496) (not start!20512) (not b!203500) (not mapNonEmpty!8603))
(check-sat b_and!11887 (not b_next!5167))
