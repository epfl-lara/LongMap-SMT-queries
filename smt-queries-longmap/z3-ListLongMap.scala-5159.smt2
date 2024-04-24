; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70094 () Bool)

(assert start!70094)

(declare-fun b_free!12361 () Bool)

(declare-fun b_next!12361 () Bool)

(assert (=> start!70094 (= b_free!12361 (not b_next!12361))))

(declare-fun tp!43795 () Bool)

(declare-fun b_and!21139 () Bool)

(assert (=> start!70094 (= tp!43795 b_and!21139)))

(declare-fun res!555745 () Bool)

(declare-fun e!450920 () Bool)

(assert (=> start!70094 (=> (not res!555745) (not e!450920))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70094 (= res!555745 (validMask!0 mask!1312))))

(assert (=> start!70094 e!450920))

(declare-fun tp_is_empty!14071 () Bool)

(assert (=> start!70094 tp_is_empty!14071))

(declare-datatypes ((array!44363 0))(
  ( (array!44364 (arr!21238 (Array (_ BitVec 32) (_ BitVec 64))) (size!21658 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44363)

(declare-fun array_inv!17067 (array!44363) Bool)

(assert (=> start!70094 (array_inv!17067 _keys!976)))

(assert (=> start!70094 true))

(declare-datatypes ((V!23763 0))(
  ( (V!23764 (val!7083 Int)) )
))
(declare-datatypes ((ValueCell!6620 0))(
  ( (ValueCellFull!6620 (v!9510 V!23763)) (EmptyCell!6620) )
))
(declare-datatypes ((array!44365 0))(
  ( (array!44366 (arr!21239 (Array (_ BitVec 32) ValueCell!6620)) (size!21659 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44365)

(declare-fun e!450922 () Bool)

(declare-fun array_inv!17068 (array!44365) Bool)

(assert (=> start!70094 (and (array_inv!17068 _values!788) e!450922)))

(assert (=> start!70094 tp!43795))

(declare-fun b!813766 () Bool)

(declare-fun e!450923 () Bool)

(declare-fun mapRes!22684 () Bool)

(assert (=> b!813766 (= e!450922 (and e!450923 mapRes!22684))))

(declare-fun condMapEmpty!22684 () Bool)

(declare-fun mapDefault!22684 () ValueCell!6620)

(assert (=> b!813766 (= condMapEmpty!22684 (= (arr!21239 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6620)) mapDefault!22684)))))

(declare-fun b!813767 () Bool)

(declare-fun res!555742 () Bool)

(assert (=> b!813767 (=> (not res!555742) (not e!450920))))

(declare-datatypes ((List!15011 0))(
  ( (Nil!15008) (Cons!15007 (h!16142 (_ BitVec 64)) (t!21318 List!15011)) )
))
(declare-fun arrayNoDuplicates!0 (array!44363 (_ BitVec 32) List!15011) Bool)

(assert (=> b!813767 (= res!555742 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15008))))

(declare-fun mapIsEmpty!22684 () Bool)

(assert (=> mapIsEmpty!22684 mapRes!22684))

(declare-fun b!813768 () Bool)

(declare-fun res!555744 () Bool)

(assert (=> b!813768 (=> (not res!555744) (not e!450920))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813768 (= res!555744 (and (= (size!21659 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21658 _keys!976) (size!21659 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813769 () Bool)

(assert (=> b!813769 (= e!450920 false)))

(declare-fun zeroValueBefore!34 () V!23763)

(declare-fun minValue!754 () V!23763)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9192 0))(
  ( (tuple2!9193 (_1!4607 (_ BitVec 64)) (_2!4607 V!23763)) )
))
(declare-datatypes ((List!15012 0))(
  ( (Nil!15009) (Cons!15008 (h!16143 tuple2!9192) (t!21319 List!15012)) )
))
(declare-datatypes ((ListLongMap!8017 0))(
  ( (ListLongMap!8018 (toList!4024 List!15012)) )
))
(declare-fun lt!364557 () ListLongMap!8017)

(declare-fun getCurrentListMapNoExtraKeys!2131 (array!44363 array!44365 (_ BitVec 32) (_ BitVec 32) V!23763 V!23763 (_ BitVec 32) Int) ListLongMap!8017)

(assert (=> b!813769 (= lt!364557 (getCurrentListMapNoExtraKeys!2131 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813770 () Bool)

(declare-fun res!555743 () Bool)

(assert (=> b!813770 (=> (not res!555743) (not e!450920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44363 (_ BitVec 32)) Bool)

(assert (=> b!813770 (= res!555743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813771 () Bool)

(assert (=> b!813771 (= e!450923 tp_is_empty!14071)))

(declare-fun mapNonEmpty!22684 () Bool)

(declare-fun tp!43794 () Bool)

(declare-fun e!450919 () Bool)

(assert (=> mapNonEmpty!22684 (= mapRes!22684 (and tp!43794 e!450919))))

(declare-fun mapRest!22684 () (Array (_ BitVec 32) ValueCell!6620))

(declare-fun mapValue!22684 () ValueCell!6620)

(declare-fun mapKey!22684 () (_ BitVec 32))

(assert (=> mapNonEmpty!22684 (= (arr!21239 _values!788) (store mapRest!22684 mapKey!22684 mapValue!22684))))

(declare-fun b!813772 () Bool)

(assert (=> b!813772 (= e!450919 tp_is_empty!14071)))

(assert (= (and start!70094 res!555745) b!813768))

(assert (= (and b!813768 res!555744) b!813770))

(assert (= (and b!813770 res!555743) b!813767))

(assert (= (and b!813767 res!555742) b!813769))

(assert (= (and b!813766 condMapEmpty!22684) mapIsEmpty!22684))

(assert (= (and b!813766 (not condMapEmpty!22684)) mapNonEmpty!22684))

(get-info :version)

(assert (= (and mapNonEmpty!22684 ((_ is ValueCellFull!6620) mapValue!22684)) b!813772))

(assert (= (and b!813766 ((_ is ValueCellFull!6620) mapDefault!22684)) b!813771))

(assert (= start!70094 b!813766))

(declare-fun m!756385 () Bool)

(assert (=> b!813767 m!756385))

(declare-fun m!756387 () Bool)

(assert (=> b!813769 m!756387))

(declare-fun m!756389 () Bool)

(assert (=> mapNonEmpty!22684 m!756389))

(declare-fun m!756391 () Bool)

(assert (=> start!70094 m!756391))

(declare-fun m!756393 () Bool)

(assert (=> start!70094 m!756393))

(declare-fun m!756395 () Bool)

(assert (=> start!70094 m!756395))

(declare-fun m!756397 () Bool)

(assert (=> b!813770 m!756397))

(check-sat (not mapNonEmpty!22684) (not b_next!12361) (not start!70094) tp_is_empty!14071 (not b!813767) (not b!813770) b_and!21139 (not b!813769))
(check-sat b_and!21139 (not b_next!12361))
