; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105910 () Bool)

(assert start!105910)

(declare-fun b_free!27271 () Bool)

(declare-fun b_next!27271 () Bool)

(assert (=> start!105910 (= b_free!27271 (not b_next!27271))))

(declare-fun tp!95339 () Bool)

(declare-fun b_and!45157 () Bool)

(assert (=> start!105910 (= tp!95339 b_and!45157)))

(declare-fun b!1260184 () Bool)

(declare-fun e!716894 () Bool)

(declare-fun e!716899 () Bool)

(declare-fun mapRes!50056 () Bool)

(assert (=> b!1260184 (= e!716894 (and e!716899 mapRes!50056))))

(declare-fun condMapEmpty!50056 () Bool)

(declare-datatypes ((V!48263 0))(
  ( (V!48264 (val!16149 Int)) )
))
(declare-datatypes ((ValueCell!15323 0))(
  ( (ValueCellFull!15323 (v!18847 V!48263)) (EmptyCell!15323) )
))
(declare-datatypes ((array!82021 0))(
  ( (array!82022 (arr!39561 (Array (_ BitVec 32) ValueCell!15323)) (size!40098 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82021)

(declare-fun mapDefault!50056 () ValueCell!15323)

(assert (=> b!1260184 (= condMapEmpty!50056 (= (arr!39561 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15323)) mapDefault!50056)))))

(declare-fun b!1260185 () Bool)

(declare-fun res!839530 () Bool)

(declare-fun e!716893 () Bool)

(assert (=> b!1260185 (=> (not res!839530) (not e!716893))))

(declare-datatypes ((array!82023 0))(
  ( (array!82024 (arr!39562 (Array (_ BitVec 32) (_ BitVec 64))) (size!40099 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82023)

(declare-datatypes ((List!28118 0))(
  ( (Nil!28115) (Cons!28114 (h!29332 (_ BitVec 64)) (t!41605 List!28118)) )
))
(declare-fun arrayNoDuplicates!0 (array!82023 (_ BitVec 32) List!28118) Bool)

(assert (=> b!1260185 (= res!839530 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28115))))

(declare-fun b!1260186 () Bool)

(declare-fun e!716895 () Bool)

(declare-fun tp_is_empty!32173 () Bool)

(assert (=> b!1260186 (= e!716895 tp_is_empty!32173)))

(declare-fun res!839533 () Bool)

(assert (=> start!105910 (=> (not res!839533) (not e!716893))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105910 (= res!839533 (validMask!0 mask!1466))))

(assert (=> start!105910 e!716893))

(assert (=> start!105910 true))

(assert (=> start!105910 tp!95339))

(assert (=> start!105910 tp_is_empty!32173))

(declare-fun array_inv!30269 (array!82023) Bool)

(assert (=> start!105910 (array_inv!30269 _keys!1118)))

(declare-fun array_inv!30270 (array!82021) Bool)

(assert (=> start!105910 (and (array_inv!30270 _values!914) e!716894)))

(declare-fun b!1260187 () Bool)

(declare-fun e!716898 () Bool)

(assert (=> b!1260187 (= e!716898 true)))

(declare-fun lt!569947 () Bool)

(declare-datatypes ((tuple2!20890 0))(
  ( (tuple2!20891 (_1!10456 (_ BitVec 64)) (_2!10456 V!48263)) )
))
(declare-datatypes ((List!28119 0))(
  ( (Nil!28116) (Cons!28115 (h!29333 tuple2!20890) (t!41606 List!28119)) )
))
(declare-datatypes ((ListLongMap!18771 0))(
  ( (ListLongMap!18772 (toList!9401 List!28119)) )
))
(declare-fun lt!569950 () ListLongMap!18771)

(declare-fun contains!7598 (ListLongMap!18771 (_ BitVec 64)) Bool)

(assert (=> b!1260187 (= lt!569947 (contains!7598 lt!569950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!716896 () Bool)

(assert (=> b!1260187 e!716896))

(declare-fun res!839528 () Bool)

(assert (=> b!1260187 (=> (not res!839528) (not e!716896))))

(declare-fun lt!569945 () ListLongMap!18771)

(declare-fun minValueBefore!43 () V!48263)

(declare-fun +!4242 (ListLongMap!18771 tuple2!20890) ListLongMap!18771)

(assert (=> b!1260187 (= res!839528 (= lt!569945 (+!4242 lt!569950 (tuple2!20891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!569948 () ListLongMap!18771)

(declare-fun lt!569949 () tuple2!20890)

(assert (=> b!1260187 (= lt!569950 (+!4242 lt!569948 lt!569949))))

(declare-fun zeroValue!871 () V!48263)

(assert (=> b!1260187 (= lt!569949 (tuple2!20891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48263)

(declare-fun lt!569951 () ListLongMap!18771)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4586 (array!82023 array!82021 (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 (_ BitVec 32) Int) ListLongMap!18771)

(assert (=> b!1260187 (= lt!569951 (getCurrentListMap!4586 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260187 (= lt!569945 (getCurrentListMap!4586 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569952 () ListLongMap!18771)

(declare-fun b!1260188 () Bool)

(assert (=> b!1260188 (= e!716896 (= lt!569951 (+!4242 lt!569952 lt!569949)))))

(declare-fun b!1260189 () Bool)

(assert (=> b!1260189 (= e!716893 (not e!716898))))

(declare-fun res!839532 () Bool)

(assert (=> b!1260189 (=> res!839532 e!716898)))

(assert (=> b!1260189 (= res!839532 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260189 (= lt!569948 lt!569952)))

(declare-datatypes ((Unit!41942 0))(
  ( (Unit!41943) )
))
(declare-fun lt!569946 () Unit!41942)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1129 (array!82023 array!82021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 V!48263 V!48263 (_ BitVec 32) Int) Unit!41942)

(assert (=> b!1260189 (= lt!569946 (lemmaNoChangeToArrayThenSameMapNoExtras!1129 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5815 (array!82023 array!82021 (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 (_ BitVec 32) Int) ListLongMap!18771)

(assert (=> b!1260189 (= lt!569952 (getCurrentListMapNoExtraKeys!5815 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260189 (= lt!569948 (getCurrentListMapNoExtraKeys!5815 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260190 () Bool)

(assert (=> b!1260190 (= e!716899 tp_is_empty!32173)))

(declare-fun mapNonEmpty!50056 () Bool)

(declare-fun tp!95338 () Bool)

(assert (=> mapNonEmpty!50056 (= mapRes!50056 (and tp!95338 e!716895))))

(declare-fun mapRest!50056 () (Array (_ BitVec 32) ValueCell!15323))

(declare-fun mapValue!50056 () ValueCell!15323)

(declare-fun mapKey!50056 () (_ BitVec 32))

(assert (=> mapNonEmpty!50056 (= (arr!39561 _values!914) (store mapRest!50056 mapKey!50056 mapValue!50056))))

(declare-fun b!1260191 () Bool)

(declare-fun res!839529 () Bool)

(assert (=> b!1260191 (=> (not res!839529) (not e!716893))))

(assert (=> b!1260191 (= res!839529 (and (= (size!40098 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40099 _keys!1118) (size!40098 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50056 () Bool)

(assert (=> mapIsEmpty!50056 mapRes!50056))

(declare-fun b!1260192 () Bool)

(declare-fun res!839531 () Bool)

(assert (=> b!1260192 (=> (not res!839531) (not e!716893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82023 (_ BitVec 32)) Bool)

(assert (=> b!1260192 (= res!839531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105910 res!839533) b!1260191))

(assert (= (and b!1260191 res!839529) b!1260192))

(assert (= (and b!1260192 res!839531) b!1260185))

(assert (= (and b!1260185 res!839530) b!1260189))

(assert (= (and b!1260189 (not res!839532)) b!1260187))

(assert (= (and b!1260187 res!839528) b!1260188))

(assert (= (and b!1260184 condMapEmpty!50056) mapIsEmpty!50056))

(assert (= (and b!1260184 (not condMapEmpty!50056)) mapNonEmpty!50056))

(get-info :version)

(assert (= (and mapNonEmpty!50056 ((_ is ValueCellFull!15323) mapValue!50056)) b!1260186))

(assert (= (and b!1260184 ((_ is ValueCellFull!15323) mapDefault!50056)) b!1260190))

(assert (= start!105910 b!1260184))

(declare-fun m!1160833 () Bool)

(assert (=> mapNonEmpty!50056 m!1160833))

(declare-fun m!1160835 () Bool)

(assert (=> b!1260185 m!1160835))

(declare-fun m!1160837 () Bool)

(assert (=> b!1260189 m!1160837))

(declare-fun m!1160839 () Bool)

(assert (=> b!1260189 m!1160839))

(declare-fun m!1160841 () Bool)

(assert (=> b!1260189 m!1160841))

(declare-fun m!1160843 () Bool)

(assert (=> start!105910 m!1160843))

(declare-fun m!1160845 () Bool)

(assert (=> start!105910 m!1160845))

(declare-fun m!1160847 () Bool)

(assert (=> start!105910 m!1160847))

(declare-fun m!1160849 () Bool)

(assert (=> b!1260187 m!1160849))

(declare-fun m!1160851 () Bool)

(assert (=> b!1260187 m!1160851))

(declare-fun m!1160853 () Bool)

(assert (=> b!1260187 m!1160853))

(declare-fun m!1160855 () Bool)

(assert (=> b!1260187 m!1160855))

(declare-fun m!1160857 () Bool)

(assert (=> b!1260187 m!1160857))

(declare-fun m!1160859 () Bool)

(assert (=> b!1260188 m!1160859))

(declare-fun m!1160861 () Bool)

(assert (=> b!1260192 m!1160861))

(check-sat (not b!1260185) (not b!1260192) (not b!1260189) (not b!1260188) (not mapNonEmpty!50056) b_and!45157 (not start!105910) (not b_next!27271) tp_is_empty!32173 (not b!1260187))
(check-sat b_and!45157 (not b_next!27271))
