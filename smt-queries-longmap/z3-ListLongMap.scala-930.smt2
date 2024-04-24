; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20680 () Bool)

(assert start!20680)

(declare-fun b_free!5335 () Bool)

(declare-fun b_next!5335 () Bool)

(assert (=> start!20680 (= b_free!5335 (not b_next!5335))))

(declare-fun tp!19036 () Bool)

(declare-fun b_and!12095 () Bool)

(assert (=> start!20680 (= tp!19036 b_and!12095)))

(declare-fun b!206683 () Bool)

(declare-fun res!100171 () Bool)

(declare-fun e!135050 () Bool)

(assert (=> b!206683 (=> (not res!100171) (not e!135050))))

(declare-datatypes ((array!9587 0))(
  ( (array!9588 (arr!4544 (Array (_ BitVec 32) (_ BitVec 64))) (size!4869 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9587)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6569 0))(
  ( (V!6570 (val!2640 Int)) )
))
(declare-datatypes ((ValueCell!2252 0))(
  ( (ValueCellFull!2252 (v!4611 V!6569)) (EmptyCell!2252) )
))
(declare-datatypes ((array!9589 0))(
  ( (array!9590 (arr!4545 (Array (_ BitVec 32) ValueCell!2252)) (size!4870 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9589)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206683 (= res!100171 (and (= (size!4870 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4869 _keys!825) (size!4870 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206684 () Bool)

(declare-fun res!100169 () Bool)

(assert (=> b!206684 (=> (not res!100169) (not e!135050))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206684 (= res!100169 (validKeyInArray!0 k0!843))))

(declare-fun b!206685 () Bool)

(assert (=> b!206685 (= e!135050 (not true))))

(declare-datatypes ((tuple2!3960 0))(
  ( (tuple2!3961 (_1!1991 (_ BitVec 64)) (_2!1991 V!6569)) )
))
(declare-datatypes ((List!2847 0))(
  ( (Nil!2844) (Cons!2843 (h!3485 tuple2!3960) (t!7770 List!2847)) )
))
(declare-datatypes ((ListLongMap!2875 0))(
  ( (ListLongMap!2876 (toList!1453 List!2847)) )
))
(declare-fun lt!105773 () ListLongMap!2875)

(declare-fun zeroValue!615 () V!6569)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6569)

(declare-fun getCurrentListMap!1023 (array!9587 array!9589 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) Int) ListLongMap!2875)

(assert (=> b!206685 (= lt!105773 (getCurrentListMap!1023 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105769 () ListLongMap!2875)

(declare-fun lt!105768 () array!9589)

(assert (=> b!206685 (= lt!105769 (getCurrentListMap!1023 _keys!825 lt!105768 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105767 () ListLongMap!2875)

(declare-fun lt!105772 () ListLongMap!2875)

(assert (=> b!206685 (and (= lt!105767 lt!105772) (= lt!105772 lt!105767))))

(declare-fun v!520 () V!6569)

(declare-fun lt!105771 () ListLongMap!2875)

(declare-fun +!507 (ListLongMap!2875 tuple2!3960) ListLongMap!2875)

(assert (=> b!206685 (= lt!105772 (+!507 lt!105771 (tuple2!3961 k0!843 v!520)))))

(declare-datatypes ((Unit!6290 0))(
  ( (Unit!6291) )
))
(declare-fun lt!105770 () Unit!6290)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!159 (array!9587 array!9589 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) (_ BitVec 64) V!6569 (_ BitVec 32) Int) Unit!6290)

(assert (=> b!206685 (= lt!105770 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!159 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!416 (array!9587 array!9589 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) Int) ListLongMap!2875)

(assert (=> b!206685 (= lt!105767 (getCurrentListMapNoExtraKeys!416 _keys!825 lt!105768 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206685 (= lt!105768 (array!9590 (store (arr!4545 _values!649) i!601 (ValueCellFull!2252 v!520)) (size!4870 _values!649)))))

(assert (=> b!206685 (= lt!105771 (getCurrentListMapNoExtraKeys!416 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8855 () Bool)

(declare-fun mapRes!8855 () Bool)

(assert (=> mapIsEmpty!8855 mapRes!8855))

(declare-fun b!206686 () Bool)

(declare-fun e!135049 () Bool)

(declare-fun tp_is_empty!5191 () Bool)

(assert (=> b!206686 (= e!135049 tp_is_empty!5191)))

(declare-fun b!206687 () Bool)

(declare-fun e!135053 () Bool)

(assert (=> b!206687 (= e!135053 (and e!135049 mapRes!8855))))

(declare-fun condMapEmpty!8855 () Bool)

(declare-fun mapDefault!8855 () ValueCell!2252)

(assert (=> b!206687 (= condMapEmpty!8855 (= (arr!4545 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2252)) mapDefault!8855)))))

(declare-fun b!206688 () Bool)

(declare-fun res!100166 () Bool)

(assert (=> b!206688 (=> (not res!100166) (not e!135050))))

(declare-datatypes ((List!2848 0))(
  ( (Nil!2845) (Cons!2844 (h!3486 (_ BitVec 64)) (t!7771 List!2848)) )
))
(declare-fun arrayNoDuplicates!0 (array!9587 (_ BitVec 32) List!2848) Bool)

(assert (=> b!206688 (= res!100166 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2845))))

(declare-fun res!100167 () Bool)

(assert (=> start!20680 (=> (not res!100167) (not e!135050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20680 (= res!100167 (validMask!0 mask!1149))))

(assert (=> start!20680 e!135050))

(declare-fun array_inv!2977 (array!9589) Bool)

(assert (=> start!20680 (and (array_inv!2977 _values!649) e!135053)))

(assert (=> start!20680 true))

(assert (=> start!20680 tp_is_empty!5191))

(declare-fun array_inv!2978 (array!9587) Bool)

(assert (=> start!20680 (array_inv!2978 _keys!825)))

(assert (=> start!20680 tp!19036))

(declare-fun b!206689 () Bool)

(declare-fun res!100168 () Bool)

(assert (=> b!206689 (=> (not res!100168) (not e!135050))))

(assert (=> b!206689 (= res!100168 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4869 _keys!825))))))

(declare-fun b!206690 () Bool)

(declare-fun res!100165 () Bool)

(assert (=> b!206690 (=> (not res!100165) (not e!135050))))

(assert (=> b!206690 (= res!100165 (= (select (arr!4544 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8855 () Bool)

(declare-fun tp!19037 () Bool)

(declare-fun e!135051 () Bool)

(assert (=> mapNonEmpty!8855 (= mapRes!8855 (and tp!19037 e!135051))))

(declare-fun mapRest!8855 () (Array (_ BitVec 32) ValueCell!2252))

(declare-fun mapValue!8855 () ValueCell!2252)

(declare-fun mapKey!8855 () (_ BitVec 32))

(assert (=> mapNonEmpty!8855 (= (arr!4545 _values!649) (store mapRest!8855 mapKey!8855 mapValue!8855))))

(declare-fun b!206691 () Bool)

(assert (=> b!206691 (= e!135051 tp_is_empty!5191)))

(declare-fun b!206692 () Bool)

(declare-fun res!100170 () Bool)

(assert (=> b!206692 (=> (not res!100170) (not e!135050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9587 (_ BitVec 32)) Bool)

(assert (=> b!206692 (= res!100170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20680 res!100167) b!206683))

(assert (= (and b!206683 res!100171) b!206692))

(assert (= (and b!206692 res!100170) b!206688))

(assert (= (and b!206688 res!100166) b!206689))

(assert (= (and b!206689 res!100168) b!206684))

(assert (= (and b!206684 res!100169) b!206690))

(assert (= (and b!206690 res!100165) b!206685))

(assert (= (and b!206687 condMapEmpty!8855) mapIsEmpty!8855))

(assert (= (and b!206687 (not condMapEmpty!8855)) mapNonEmpty!8855))

(get-info :version)

(assert (= (and mapNonEmpty!8855 ((_ is ValueCellFull!2252) mapValue!8855)) b!206691))

(assert (= (and b!206687 ((_ is ValueCellFull!2252) mapDefault!8855)) b!206686))

(assert (= start!20680 b!206687))

(declare-fun m!234561 () Bool)

(assert (=> b!206684 m!234561))

(declare-fun m!234563 () Bool)

(assert (=> mapNonEmpty!8855 m!234563))

(declare-fun m!234565 () Bool)

(assert (=> start!20680 m!234565))

(declare-fun m!234567 () Bool)

(assert (=> start!20680 m!234567))

(declare-fun m!234569 () Bool)

(assert (=> start!20680 m!234569))

(declare-fun m!234571 () Bool)

(assert (=> b!206690 m!234571))

(declare-fun m!234573 () Bool)

(assert (=> b!206688 m!234573))

(declare-fun m!234575 () Bool)

(assert (=> b!206692 m!234575))

(declare-fun m!234577 () Bool)

(assert (=> b!206685 m!234577))

(declare-fun m!234579 () Bool)

(assert (=> b!206685 m!234579))

(declare-fun m!234581 () Bool)

(assert (=> b!206685 m!234581))

(declare-fun m!234583 () Bool)

(assert (=> b!206685 m!234583))

(declare-fun m!234585 () Bool)

(assert (=> b!206685 m!234585))

(declare-fun m!234587 () Bool)

(assert (=> b!206685 m!234587))

(declare-fun m!234589 () Bool)

(assert (=> b!206685 m!234589))

(check-sat b_and!12095 (not b!206685) (not b!206684) tp_is_empty!5191 (not b!206688) (not start!20680) (not b!206692) (not b_next!5335) (not mapNonEmpty!8855))
(check-sat b_and!12095 (not b_next!5335))
