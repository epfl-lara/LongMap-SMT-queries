; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20498 () Bool)

(assert start!20498)

(declare-fun b_free!5157 () Bool)

(declare-fun b_next!5157 () Bool)

(assert (=> start!20498 (= b_free!5157 (not b_next!5157))))

(declare-fun tp!18503 () Bool)

(declare-fun b_and!11903 () Bool)

(assert (=> start!20498 (= tp!18503 b_and!11903)))

(declare-fun b!203463 () Bool)

(declare-fun res!97777 () Bool)

(declare-fun e!133202 () Bool)

(assert (=> b!203463 (=> (not res!97777) (not e!133202))))

(declare-datatypes ((array!9249 0))(
  ( (array!9250 (arr!4375 (Array (_ BitVec 32) (_ BitVec 64))) (size!4700 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9249)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6331 0))(
  ( (V!6332 (val!2551 Int)) )
))
(declare-datatypes ((ValueCell!2163 0))(
  ( (ValueCellFull!2163 (v!4521 V!6331)) (EmptyCell!2163) )
))
(declare-datatypes ((array!9251 0))(
  ( (array!9252 (arr!4376 (Array (_ BitVec 32) ValueCell!2163)) (size!4701 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9251)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203463 (= res!97777 (and (= (size!4701 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4700 _keys!825) (size!4701 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203464 () Bool)

(declare-fun res!97775 () Bool)

(assert (=> b!203464 (=> (not res!97775) (not e!133202))))

(declare-datatypes ((List!2773 0))(
  ( (Nil!2770) (Cons!2769 (h!3411 (_ BitVec 64)) (t!7704 List!2773)) )
))
(declare-fun arrayNoDuplicates!0 (array!9249 (_ BitVec 32) List!2773) Bool)

(assert (=> b!203464 (= res!97775 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2770))))

(declare-fun mapNonEmpty!8588 () Bool)

(declare-fun mapRes!8588 () Bool)

(declare-fun tp!18502 () Bool)

(declare-fun e!133199 () Bool)

(assert (=> mapNonEmpty!8588 (= mapRes!8588 (and tp!18502 e!133199))))

(declare-fun mapKey!8588 () (_ BitVec 32))

(declare-fun mapRest!8588 () (Array (_ BitVec 32) ValueCell!2163))

(declare-fun mapValue!8588 () ValueCell!2163)

(assert (=> mapNonEmpty!8588 (= (arr!4376 _values!649) (store mapRest!8588 mapKey!8588 mapValue!8588))))

(declare-fun b!203465 () Bool)

(declare-fun res!97772 () Bool)

(assert (=> b!203465 (=> (not res!97772) (not e!133202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9249 (_ BitVec 32)) Bool)

(assert (=> b!203465 (= res!97772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203466 () Bool)

(declare-fun tp_is_empty!5013 () Bool)

(assert (=> b!203466 (= e!133199 tp_is_empty!5013)))

(declare-fun mapIsEmpty!8588 () Bool)

(assert (=> mapIsEmpty!8588 mapRes!8588))

(declare-fun b!203467 () Bool)

(declare-fun e!133197 () Bool)

(assert (=> b!203467 (= e!133197 tp_is_empty!5013)))

(declare-fun b!203468 () Bool)

(declare-fun res!97773 () Bool)

(assert (=> b!203468 (=> (not res!97773) (not e!133202))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203468 (= res!97773 (= (select (arr!4375 _keys!825) i!601) k0!843))))

(declare-fun b!203469 () Bool)

(declare-fun e!133200 () Bool)

(assert (=> b!203469 (= e!133200 (and e!133197 mapRes!8588))))

(declare-fun condMapEmpty!8588 () Bool)

(declare-fun mapDefault!8588 () ValueCell!2163)

(assert (=> b!203469 (= condMapEmpty!8588 (= (arr!4376 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2163)) mapDefault!8588)))))

(declare-fun b!203470 () Bool)

(declare-fun e!133198 () Bool)

(assert (=> b!203470 (= e!133202 (not e!133198))))

(declare-fun res!97776 () Bool)

(assert (=> b!203470 (=> res!97776 e!133198)))

(assert (=> b!203470 (= res!97776 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3872 0))(
  ( (tuple2!3873 (_1!1947 (_ BitVec 64)) (_2!1947 V!6331)) )
))
(declare-datatypes ((List!2774 0))(
  ( (Nil!2771) (Cons!2770 (h!3412 tuple2!3872) (t!7705 List!2774)) )
))
(declare-datatypes ((ListLongMap!2785 0))(
  ( (ListLongMap!2786 (toList!1408 List!2774)) )
))
(declare-fun lt!102645 () ListLongMap!2785)

(declare-fun zeroValue!615 () V!6331)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6331)

(declare-fun getCurrentListMap!983 (array!9249 array!9251 (_ BitVec 32) (_ BitVec 32) V!6331 V!6331 (_ BitVec 32) Int) ListLongMap!2785)

(assert (=> b!203470 (= lt!102645 (getCurrentListMap!983 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102646 () ListLongMap!2785)

(declare-fun lt!102642 () array!9251)

(assert (=> b!203470 (= lt!102646 (getCurrentListMap!983 _keys!825 lt!102642 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102651 () ListLongMap!2785)

(declare-fun lt!102650 () ListLongMap!2785)

(assert (=> b!203470 (and (= lt!102651 lt!102650) (= lt!102650 lt!102651))))

(declare-fun lt!102648 () ListLongMap!2785)

(declare-fun lt!102644 () tuple2!3872)

(declare-fun +!435 (ListLongMap!2785 tuple2!3872) ListLongMap!2785)

(assert (=> b!203470 (= lt!102650 (+!435 lt!102648 lt!102644))))

(declare-fun v!520 () V!6331)

(assert (=> b!203470 (= lt!102644 (tuple2!3873 k0!843 v!520))))

(declare-datatypes ((Unit!6164 0))(
  ( (Unit!6165) )
))
(declare-fun lt!102641 () Unit!6164)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!96 (array!9249 array!9251 (_ BitVec 32) (_ BitVec 32) V!6331 V!6331 (_ BitVec 32) (_ BitVec 64) V!6331 (_ BitVec 32) Int) Unit!6164)

(assert (=> b!203470 (= lt!102641 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!96 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!357 (array!9249 array!9251 (_ BitVec 32) (_ BitVec 32) V!6331 V!6331 (_ BitVec 32) Int) ListLongMap!2785)

(assert (=> b!203470 (= lt!102651 (getCurrentListMapNoExtraKeys!357 _keys!825 lt!102642 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203470 (= lt!102642 (array!9252 (store (arr!4376 _values!649) i!601 (ValueCellFull!2163 v!520)) (size!4701 _values!649)))))

(assert (=> b!203470 (= lt!102648 (getCurrentListMapNoExtraKeys!357 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203471 () Bool)

(declare-fun e!133201 () Bool)

(assert (=> b!203471 (= e!133201 true)))

(declare-fun lt!102643 () ListLongMap!2785)

(declare-fun lt!102640 () ListLongMap!2785)

(assert (=> b!203471 (= lt!102643 (+!435 lt!102640 lt!102644))))

(declare-fun lt!102647 () Unit!6164)

(declare-fun addCommutativeForDiffKeys!147 (ListLongMap!2785 (_ BitVec 64) V!6331 (_ BitVec 64) V!6331) Unit!6164)

(assert (=> b!203471 (= lt!102647 (addCommutativeForDiffKeys!147 lt!102648 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203473 () Bool)

(declare-fun res!97778 () Bool)

(assert (=> b!203473 (=> (not res!97778) (not e!133202))))

(assert (=> b!203473 (= res!97778 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4700 _keys!825))))))

(declare-fun b!203474 () Bool)

(declare-fun res!97780 () Bool)

(assert (=> b!203474 (=> (not res!97780) (not e!133202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203474 (= res!97780 (validKeyInArray!0 k0!843))))

(declare-fun res!97774 () Bool)

(assert (=> start!20498 (=> (not res!97774) (not e!133202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20498 (= res!97774 (validMask!0 mask!1149))))

(assert (=> start!20498 e!133202))

(declare-fun array_inv!2891 (array!9251) Bool)

(assert (=> start!20498 (and (array_inv!2891 _values!649) e!133200)))

(assert (=> start!20498 true))

(assert (=> start!20498 tp_is_empty!5013))

(declare-fun array_inv!2892 (array!9249) Bool)

(assert (=> start!20498 (array_inv!2892 _keys!825)))

(assert (=> start!20498 tp!18503))

(declare-fun b!203472 () Bool)

(assert (=> b!203472 (= e!133198 e!133201)))

(declare-fun res!97779 () Bool)

(assert (=> b!203472 (=> res!97779 e!133201)))

(assert (=> b!203472 (= res!97779 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203472 (= lt!102646 lt!102643)))

(declare-fun lt!102649 () tuple2!3872)

(assert (=> b!203472 (= lt!102643 (+!435 lt!102650 lt!102649))))

(assert (=> b!203472 (= lt!102645 lt!102640)))

(assert (=> b!203472 (= lt!102640 (+!435 lt!102648 lt!102649))))

(assert (=> b!203472 (= lt!102646 (+!435 lt!102651 lt!102649))))

(assert (=> b!203472 (= lt!102649 (tuple2!3873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20498 res!97774) b!203463))

(assert (= (and b!203463 res!97777) b!203465))

(assert (= (and b!203465 res!97772) b!203464))

(assert (= (and b!203464 res!97775) b!203473))

(assert (= (and b!203473 res!97778) b!203474))

(assert (= (and b!203474 res!97780) b!203468))

(assert (= (and b!203468 res!97773) b!203470))

(assert (= (and b!203470 (not res!97776)) b!203472))

(assert (= (and b!203472 (not res!97779)) b!203471))

(assert (= (and b!203469 condMapEmpty!8588) mapIsEmpty!8588))

(assert (= (and b!203469 (not condMapEmpty!8588)) mapNonEmpty!8588))

(get-info :version)

(assert (= (and mapNonEmpty!8588 ((_ is ValueCellFull!2163) mapValue!8588)) b!203466))

(assert (= (and b!203469 ((_ is ValueCellFull!2163) mapDefault!8588)) b!203467))

(assert (= start!20498 b!203469))

(declare-fun m!230891 () Bool)

(assert (=> b!203464 m!230891))

(declare-fun m!230893 () Bool)

(assert (=> b!203472 m!230893))

(declare-fun m!230895 () Bool)

(assert (=> b!203472 m!230895))

(declare-fun m!230897 () Bool)

(assert (=> b!203472 m!230897))

(declare-fun m!230899 () Bool)

(assert (=> b!203465 m!230899))

(declare-fun m!230901 () Bool)

(assert (=> b!203470 m!230901))

(declare-fun m!230903 () Bool)

(assert (=> b!203470 m!230903))

(declare-fun m!230905 () Bool)

(assert (=> b!203470 m!230905))

(declare-fun m!230907 () Bool)

(assert (=> b!203470 m!230907))

(declare-fun m!230909 () Bool)

(assert (=> b!203470 m!230909))

(declare-fun m!230911 () Bool)

(assert (=> b!203470 m!230911))

(declare-fun m!230913 () Bool)

(assert (=> b!203470 m!230913))

(declare-fun m!230915 () Bool)

(assert (=> b!203468 m!230915))

(declare-fun m!230917 () Bool)

(assert (=> mapNonEmpty!8588 m!230917))

(declare-fun m!230919 () Bool)

(assert (=> b!203471 m!230919))

(declare-fun m!230921 () Bool)

(assert (=> b!203471 m!230921))

(declare-fun m!230923 () Bool)

(assert (=> start!20498 m!230923))

(declare-fun m!230925 () Bool)

(assert (=> start!20498 m!230925))

(declare-fun m!230927 () Bool)

(assert (=> start!20498 m!230927))

(declare-fun m!230929 () Bool)

(assert (=> b!203474 m!230929))

(check-sat (not mapNonEmpty!8588) (not b!203470) (not b!203465) (not b!203472) b_and!11903 (not b!203464) (not b!203471) (not start!20498) (not b!203474) tp_is_empty!5013 (not b_next!5157))
(check-sat b_and!11903 (not b_next!5157))
