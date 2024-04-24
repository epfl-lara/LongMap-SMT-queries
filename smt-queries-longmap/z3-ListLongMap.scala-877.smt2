; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20362 () Bool)

(assert start!20362)

(declare-fun b_free!5017 () Bool)

(declare-fun b_next!5017 () Bool)

(assert (=> start!20362 (= b_free!5017 (not b_next!5017))))

(declare-fun tp!18082 () Bool)

(declare-fun b_and!11777 () Bool)

(assert (=> start!20362 (= tp!18082 b_and!11777)))

(declare-fun b!200981 () Bool)

(declare-fun res!95895 () Bool)

(declare-fun e!131755 () Bool)

(assert (=> b!200981 (=> (not res!95895) (not e!131755))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8971 0))(
  ( (array!8972 (arr!4236 (Array (_ BitVec 32) (_ BitVec 64))) (size!4561 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8971)

(assert (=> b!200981 (= res!95895 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4561 _keys!825))))))

(declare-fun b!200982 () Bool)

(declare-fun e!131753 () Bool)

(assert (=> b!200982 (= e!131753 true)))

(declare-datatypes ((V!6145 0))(
  ( (V!6146 (val!2481 Int)) )
))
(declare-datatypes ((tuple2!3690 0))(
  ( (tuple2!3691 (_1!1856 (_ BitVec 64)) (_2!1856 V!6145)) )
))
(declare-datatypes ((List!2605 0))(
  ( (Nil!2602) (Cons!2601 (h!3243 tuple2!3690) (t!7528 List!2605)) )
))
(declare-datatypes ((ListLongMap!2605 0))(
  ( (ListLongMap!2606 (toList!1318 List!2605)) )
))
(declare-fun lt!99768 () ListLongMap!2605)

(declare-fun lt!99767 () ListLongMap!2605)

(declare-fun lt!99766 () tuple2!3690)

(declare-fun lt!99758 () tuple2!3690)

(declare-fun +!372 (ListLongMap!2605 tuple2!3690) ListLongMap!2605)

(assert (=> b!200982 (= (+!372 lt!99767 lt!99758) (+!372 lt!99768 lt!99766))))

(declare-fun minValue!615 () V!6145)

(declare-fun v!520 () V!6145)

(declare-fun lt!99759 () ListLongMap!2605)

(declare-fun k0!843 () (_ BitVec 64))

(declare-datatypes ((Unit!6028 0))(
  ( (Unit!6029) )
))
(declare-fun lt!99763 () Unit!6028)

(declare-fun addCommutativeForDiffKeys!97 (ListLongMap!2605 (_ BitVec 64) V!6145 (_ BitVec 64) V!6145) Unit!6028)

(assert (=> b!200982 (= lt!99763 (addCommutativeForDiffKeys!97 lt!99759 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200983 () Bool)

(declare-fun e!131754 () Bool)

(declare-fun e!131751 () Bool)

(declare-fun mapRes!8378 () Bool)

(assert (=> b!200983 (= e!131754 (and e!131751 mapRes!8378))))

(declare-fun condMapEmpty!8378 () Bool)

(declare-datatypes ((ValueCell!2093 0))(
  ( (ValueCellFull!2093 (v!4452 V!6145)) (EmptyCell!2093) )
))
(declare-datatypes ((array!8973 0))(
  ( (array!8974 (arr!4237 (Array (_ BitVec 32) ValueCell!2093)) (size!4562 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8973)

(declare-fun mapDefault!8378 () ValueCell!2093)

(assert (=> b!200983 (= condMapEmpty!8378 (= (arr!4237 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2093)) mapDefault!8378)))))

(declare-fun b!200984 () Bool)

(declare-fun e!131752 () Bool)

(assert (=> b!200984 (= e!131755 (not e!131752))))

(declare-fun res!95902 () Bool)

(assert (=> b!200984 (=> res!95902 e!131752)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200984 (= res!95902 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!99770 () ListLongMap!2605)

(declare-fun zeroValue!615 () V!6145)

(declare-fun defaultEntry!657 () Int)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun getCurrentListMap!911 (array!8971 array!8973 (_ BitVec 32) (_ BitVec 32) V!6145 V!6145 (_ BitVec 32) Int) ListLongMap!2605)

(assert (=> b!200984 (= lt!99770 (getCurrentListMap!911 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99760 () ListLongMap!2605)

(declare-fun lt!99756 () array!8973)

(assert (=> b!200984 (= lt!99760 (getCurrentListMap!911 _keys!825 lt!99756 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99755 () ListLongMap!2605)

(declare-fun lt!99764 () ListLongMap!2605)

(assert (=> b!200984 (and (= lt!99755 lt!99764) (= lt!99764 lt!99755))))

(declare-fun lt!99765 () ListLongMap!2605)

(assert (=> b!200984 (= lt!99764 (+!372 lt!99765 lt!99766))))

(assert (=> b!200984 (= lt!99766 (tuple2!3691 k0!843 v!520))))

(declare-fun lt!99757 () Unit!6028)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!47 (array!8971 array!8973 (_ BitVec 32) (_ BitVec 32) V!6145 V!6145 (_ BitVec 32) (_ BitVec 64) V!6145 (_ BitVec 32) Int) Unit!6028)

(assert (=> b!200984 (= lt!99757 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!47 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!304 (array!8971 array!8973 (_ BitVec 32) (_ BitVec 32) V!6145 V!6145 (_ BitVec 32) Int) ListLongMap!2605)

(assert (=> b!200984 (= lt!99755 (getCurrentListMapNoExtraKeys!304 _keys!825 lt!99756 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200984 (= lt!99756 (array!8974 (store (arr!4237 _values!649) i!601 (ValueCellFull!2093 v!520)) (size!4562 _values!649)))))

(assert (=> b!200984 (= lt!99765 (getCurrentListMapNoExtraKeys!304 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200985 () Bool)

(declare-fun e!131750 () Bool)

(declare-fun tp_is_empty!4873 () Bool)

(assert (=> b!200985 (= e!131750 tp_is_empty!4873)))

(declare-fun b!200986 () Bool)

(declare-fun res!95900 () Bool)

(assert (=> b!200986 (=> (not res!95900) (not e!131755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200986 (= res!95900 (validKeyInArray!0 k0!843))))

(declare-fun b!200987 () Bool)

(declare-fun res!95894 () Bool)

(assert (=> b!200987 (=> (not res!95894) (not e!131755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8971 (_ BitVec 32)) Bool)

(assert (=> b!200987 (= res!95894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200988 () Bool)

(declare-fun res!95901 () Bool)

(assert (=> b!200988 (=> (not res!95901) (not e!131755))))

(assert (=> b!200988 (= res!95901 (and (= (size!4562 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4561 _keys!825) (size!4562 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200989 () Bool)

(declare-fun res!95898 () Bool)

(assert (=> b!200989 (=> (not res!95898) (not e!131755))))

(assert (=> b!200989 (= res!95898 (= (select (arr!4236 _keys!825) i!601) k0!843))))

(declare-fun res!95899 () Bool)

(assert (=> start!20362 (=> (not res!95899) (not e!131755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20362 (= res!95899 (validMask!0 mask!1149))))

(assert (=> start!20362 e!131755))

(declare-fun array_inv!2765 (array!8973) Bool)

(assert (=> start!20362 (and (array_inv!2765 _values!649) e!131754)))

(assert (=> start!20362 true))

(assert (=> start!20362 tp_is_empty!4873))

(declare-fun array_inv!2766 (array!8971) Bool)

(assert (=> start!20362 (array_inv!2766 _keys!825)))

(assert (=> start!20362 tp!18082))

(declare-fun mapNonEmpty!8378 () Bool)

(declare-fun tp!18083 () Bool)

(assert (=> mapNonEmpty!8378 (= mapRes!8378 (and tp!18083 e!131750))))

(declare-fun mapRest!8378 () (Array (_ BitVec 32) ValueCell!2093))

(declare-fun mapKey!8378 () (_ BitVec 32))

(declare-fun mapValue!8378 () ValueCell!2093)

(assert (=> mapNonEmpty!8378 (= (arr!4237 _values!649) (store mapRest!8378 mapKey!8378 mapValue!8378))))

(declare-fun mapIsEmpty!8378 () Bool)

(assert (=> mapIsEmpty!8378 mapRes!8378))

(declare-fun b!200990 () Bool)

(assert (=> b!200990 (= e!131751 tp_is_empty!4873)))

(declare-fun b!200991 () Bool)

(assert (=> b!200991 (= e!131752 e!131753)))

(declare-fun res!95897 () Bool)

(assert (=> b!200991 (=> res!95897 e!131753)))

(assert (=> b!200991 (= res!95897 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99761 () ListLongMap!2605)

(assert (=> b!200991 (= lt!99761 lt!99767)))

(assert (=> b!200991 (= lt!99767 (+!372 lt!99759 lt!99766))))

(declare-fun lt!99762 () Unit!6028)

(assert (=> b!200991 (= lt!99762 (addCommutativeForDiffKeys!97 lt!99765 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!200991 (= lt!99760 (+!372 lt!99761 lt!99758))))

(declare-fun lt!99769 () tuple2!3690)

(assert (=> b!200991 (= lt!99761 (+!372 lt!99764 lt!99769))))

(assert (=> b!200991 (= lt!99770 lt!99768)))

(assert (=> b!200991 (= lt!99768 (+!372 lt!99759 lt!99758))))

(assert (=> b!200991 (= lt!99759 (+!372 lt!99765 lt!99769))))

(assert (=> b!200991 (= lt!99760 (+!372 (+!372 lt!99755 lt!99769) lt!99758))))

(assert (=> b!200991 (= lt!99758 (tuple2!3691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200991 (= lt!99769 (tuple2!3691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200992 () Bool)

(declare-fun res!95896 () Bool)

(assert (=> b!200992 (=> (not res!95896) (not e!131755))))

(declare-datatypes ((List!2606 0))(
  ( (Nil!2603) (Cons!2602 (h!3244 (_ BitVec 64)) (t!7529 List!2606)) )
))
(declare-fun arrayNoDuplicates!0 (array!8971 (_ BitVec 32) List!2606) Bool)

(assert (=> b!200992 (= res!95896 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2603))))

(assert (= (and start!20362 res!95899) b!200988))

(assert (= (and b!200988 res!95901) b!200987))

(assert (= (and b!200987 res!95894) b!200992))

(assert (= (and b!200992 res!95896) b!200981))

(assert (= (and b!200981 res!95895) b!200986))

(assert (= (and b!200986 res!95900) b!200989))

(assert (= (and b!200989 res!95898) b!200984))

(assert (= (and b!200984 (not res!95902)) b!200991))

(assert (= (and b!200991 (not res!95897)) b!200982))

(assert (= (and b!200983 condMapEmpty!8378) mapIsEmpty!8378))

(assert (= (and b!200983 (not condMapEmpty!8378)) mapNonEmpty!8378))

(get-info :version)

(assert (= (and mapNonEmpty!8378 ((_ is ValueCellFull!2093) mapValue!8378)) b!200985))

(assert (= (and b!200983 ((_ is ValueCellFull!2093) mapDefault!8378)) b!200990))

(assert (= start!20362 b!200983))

(declare-fun m!227817 () Bool)

(assert (=> start!20362 m!227817))

(declare-fun m!227819 () Bool)

(assert (=> start!20362 m!227819))

(declare-fun m!227821 () Bool)

(assert (=> start!20362 m!227821))

(declare-fun m!227823 () Bool)

(assert (=> b!200989 m!227823))

(declare-fun m!227825 () Bool)

(assert (=> b!200986 m!227825))

(declare-fun m!227827 () Bool)

(assert (=> b!200987 m!227827))

(declare-fun m!227829 () Bool)

(assert (=> mapNonEmpty!8378 m!227829))

(declare-fun m!227831 () Bool)

(assert (=> b!200991 m!227831))

(declare-fun m!227833 () Bool)

(assert (=> b!200991 m!227833))

(declare-fun m!227835 () Bool)

(assert (=> b!200991 m!227835))

(declare-fun m!227837 () Bool)

(assert (=> b!200991 m!227837))

(declare-fun m!227839 () Bool)

(assert (=> b!200991 m!227839))

(declare-fun m!227841 () Bool)

(assert (=> b!200991 m!227841))

(declare-fun m!227843 () Bool)

(assert (=> b!200991 m!227843))

(declare-fun m!227845 () Bool)

(assert (=> b!200991 m!227845))

(assert (=> b!200991 m!227835))

(declare-fun m!227847 () Bool)

(assert (=> b!200992 m!227847))

(declare-fun m!227849 () Bool)

(assert (=> b!200984 m!227849))

(declare-fun m!227851 () Bool)

(assert (=> b!200984 m!227851))

(declare-fun m!227853 () Bool)

(assert (=> b!200984 m!227853))

(declare-fun m!227855 () Bool)

(assert (=> b!200984 m!227855))

(declare-fun m!227857 () Bool)

(assert (=> b!200984 m!227857))

(declare-fun m!227859 () Bool)

(assert (=> b!200984 m!227859))

(declare-fun m!227861 () Bool)

(assert (=> b!200984 m!227861))

(declare-fun m!227863 () Bool)

(assert (=> b!200982 m!227863))

(declare-fun m!227865 () Bool)

(assert (=> b!200982 m!227865))

(declare-fun m!227867 () Bool)

(assert (=> b!200982 m!227867))

(check-sat (not b!200991) (not b!200992) (not start!20362) b_and!11777 (not b!200986) (not b_next!5017) (not mapNonEmpty!8378) tp_is_empty!4873 (not b!200982) (not b!200984) (not b!200987))
(check-sat b_and!11777 (not b_next!5017))
