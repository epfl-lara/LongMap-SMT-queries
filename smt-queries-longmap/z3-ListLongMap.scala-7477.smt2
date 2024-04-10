; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94812 () Bool)

(assert start!94812)

(declare-fun b_free!22041 () Bool)

(declare-fun b_next!22041 () Bool)

(assert (=> start!94812 (= b_free!22041 (not b_next!22041))))

(declare-fun tp!77584 () Bool)

(declare-fun b_and!34883 () Bool)

(assert (=> start!94812 (= tp!77584 b_and!34883)))

(declare-fun b!1072050 () Bool)

(declare-fun e!612242 () Bool)

(declare-fun e!612248 () Bool)

(declare-fun mapRes!40486 () Bool)

(assert (=> b!1072050 (= e!612242 (and e!612248 mapRes!40486))))

(declare-fun condMapEmpty!40486 () Bool)

(declare-datatypes ((V!39603 0))(
  ( (V!39604 (val!12976 Int)) )
))
(declare-datatypes ((ValueCell!12222 0))(
  ( (ValueCellFull!12222 (v!15593 V!39603)) (EmptyCell!12222) )
))
(declare-datatypes ((array!68673 0))(
  ( (array!68674 (arr!33031 (Array (_ BitVec 32) ValueCell!12222)) (size!33567 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68673)

(declare-fun mapDefault!40486 () ValueCell!12222)

(assert (=> b!1072050 (= condMapEmpty!40486 (= (arr!33031 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12222)) mapDefault!40486)))))

(declare-fun b!1072051 () Bool)

(declare-fun e!612243 () Bool)

(declare-fun e!612245 () Bool)

(assert (=> b!1072051 (= e!612243 (not e!612245))))

(declare-fun res!715109 () Bool)

(assert (=> b!1072051 (=> res!715109 e!612245)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072051 (= res!715109 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16522 0))(
  ( (tuple2!16523 (_1!8272 (_ BitVec 64)) (_2!8272 V!39603)) )
))
(declare-datatypes ((List!23057 0))(
  ( (Nil!23054) (Cons!23053 (h!24262 tuple2!16522) (t!32392 List!23057)) )
))
(declare-datatypes ((ListLongMap!14491 0))(
  ( (ListLongMap!14492 (toList!7261 List!23057)) )
))
(declare-fun lt!474852 () ListLongMap!14491)

(declare-fun lt!474844 () ListLongMap!14491)

(assert (=> b!1072051 (= lt!474852 lt!474844)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39603)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39603)

(declare-fun minValue!907 () V!39603)

(declare-datatypes ((Unit!35318 0))(
  ( (Unit!35319) )
))
(declare-fun lt!474848 () Unit!35318)

(declare-datatypes ((array!68675 0))(
  ( (array!68676 (arr!33032 (Array (_ BitVec 32) (_ BitVec 64))) (size!33568 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68675)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!864 (array!68675 array!68673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39603 V!39603 V!39603 V!39603 (_ BitVec 32) Int) Unit!35318)

(assert (=> b!1072051 (= lt!474848 (lemmaNoChangeToArrayThenSameMapNoExtras!864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3827 (array!68675 array!68673 (_ BitVec 32) (_ BitVec 32) V!39603 V!39603 (_ BitVec 32) Int) ListLongMap!14491)

(assert (=> b!1072051 (= lt!474844 (getCurrentListMapNoExtraKeys!3827 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072051 (= lt!474852 (getCurrentListMapNoExtraKeys!3827 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474845 () ListLongMap!14491)

(declare-fun lt!474843 () tuple2!16522)

(declare-fun e!612247 () Bool)

(declare-fun b!1072052 () Bool)

(declare-fun +!3196 (ListLongMap!14491 tuple2!16522) ListLongMap!14491)

(assert (=> b!1072052 (= e!612247 (= lt!474845 (+!3196 lt!474844 lt!474843)))))

(declare-fun b!1072053 () Bool)

(assert (=> b!1072053 (= e!612245 true)))

(declare-fun lt!474842 () ListLongMap!14491)

(declare-fun lt!474846 () ListLongMap!14491)

(declare-fun -!692 (ListLongMap!14491 (_ BitVec 64)) ListLongMap!14491)

(assert (=> b!1072053 (= lt!474842 (-!692 lt!474846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474841 () ListLongMap!14491)

(declare-fun lt!474851 () ListLongMap!14491)

(assert (=> b!1072053 (= lt!474841 lt!474851)))

(declare-fun lt!474847 () Unit!35318)

(declare-fun addCommutativeForDiffKeys!737 (ListLongMap!14491 (_ BitVec 64) V!39603 (_ BitVec 64) V!39603) Unit!35318)

(assert (=> b!1072053 (= lt!474847 (addCommutativeForDiffKeys!737 lt!474852 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474850 () ListLongMap!14491)

(assert (=> b!1072053 (= (-!692 lt!474851 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474850)))

(declare-fun lt!474849 () tuple2!16522)

(assert (=> b!1072053 (= lt!474851 (+!3196 lt!474850 lt!474849))))

(declare-fun lt!474840 () Unit!35318)

(declare-fun addThenRemoveForNewKeyIsSame!62 (ListLongMap!14491 (_ BitVec 64) V!39603) Unit!35318)

(assert (=> b!1072053 (= lt!474840 (addThenRemoveForNewKeyIsSame!62 lt!474850 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072053 (= lt!474850 (+!3196 lt!474852 lt!474843))))

(assert (=> b!1072053 e!612247))

(declare-fun res!715113 () Bool)

(assert (=> b!1072053 (=> (not res!715113) (not e!612247))))

(assert (=> b!1072053 (= res!715113 (= lt!474846 lt!474841))))

(assert (=> b!1072053 (= lt!474841 (+!3196 (+!3196 lt!474852 lt!474849) lt!474843))))

(assert (=> b!1072053 (= lt!474843 (tuple2!16523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072053 (= lt!474849 (tuple2!16523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4158 (array!68675 array!68673 (_ BitVec 32) (_ BitVec 32) V!39603 V!39603 (_ BitVec 32) Int) ListLongMap!14491)

(assert (=> b!1072053 (= lt!474845 (getCurrentListMap!4158 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072053 (= lt!474846 (getCurrentListMap!4158 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40486 () Bool)

(assert (=> mapIsEmpty!40486 mapRes!40486))

(declare-fun b!1072054 () Bool)

(declare-fun tp_is_empty!25851 () Bool)

(assert (=> b!1072054 (= e!612248 tp_is_empty!25851)))

(declare-fun b!1072055 () Bool)

(declare-fun res!715111 () Bool)

(assert (=> b!1072055 (=> (not res!715111) (not e!612243))))

(declare-datatypes ((List!23058 0))(
  ( (Nil!23055) (Cons!23054 (h!24263 (_ BitVec 64)) (t!32393 List!23058)) )
))
(declare-fun arrayNoDuplicates!0 (array!68675 (_ BitVec 32) List!23058) Bool)

(assert (=> b!1072055 (= res!715111 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23055))))

(declare-fun b!1072056 () Bool)

(declare-fun res!715114 () Bool)

(assert (=> b!1072056 (=> (not res!715114) (not e!612243))))

(assert (=> b!1072056 (= res!715114 (and (= (size!33567 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33568 _keys!1163) (size!33567 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!715110 () Bool)

(assert (=> start!94812 (=> (not res!715110) (not e!612243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94812 (= res!715110 (validMask!0 mask!1515))))

(assert (=> start!94812 e!612243))

(assert (=> start!94812 true))

(assert (=> start!94812 tp_is_empty!25851))

(declare-fun array_inv!25536 (array!68673) Bool)

(assert (=> start!94812 (and (array_inv!25536 _values!955) e!612242)))

(assert (=> start!94812 tp!77584))

(declare-fun array_inv!25537 (array!68675) Bool)

(assert (=> start!94812 (array_inv!25537 _keys!1163)))

(declare-fun b!1072057 () Bool)

(declare-fun e!612246 () Bool)

(assert (=> b!1072057 (= e!612246 tp_is_empty!25851)))

(declare-fun b!1072058 () Bool)

(declare-fun res!715112 () Bool)

(assert (=> b!1072058 (=> (not res!715112) (not e!612243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68675 (_ BitVec 32)) Bool)

(assert (=> b!1072058 (= res!715112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40486 () Bool)

(declare-fun tp!77585 () Bool)

(assert (=> mapNonEmpty!40486 (= mapRes!40486 (and tp!77585 e!612246))))

(declare-fun mapValue!40486 () ValueCell!12222)

(declare-fun mapKey!40486 () (_ BitVec 32))

(declare-fun mapRest!40486 () (Array (_ BitVec 32) ValueCell!12222))

(assert (=> mapNonEmpty!40486 (= (arr!33031 _values!955) (store mapRest!40486 mapKey!40486 mapValue!40486))))

(assert (= (and start!94812 res!715110) b!1072056))

(assert (= (and b!1072056 res!715114) b!1072058))

(assert (= (and b!1072058 res!715112) b!1072055))

(assert (= (and b!1072055 res!715111) b!1072051))

(assert (= (and b!1072051 (not res!715109)) b!1072053))

(assert (= (and b!1072053 res!715113) b!1072052))

(assert (= (and b!1072050 condMapEmpty!40486) mapIsEmpty!40486))

(assert (= (and b!1072050 (not condMapEmpty!40486)) mapNonEmpty!40486))

(get-info :version)

(assert (= (and mapNonEmpty!40486 ((_ is ValueCellFull!12222) mapValue!40486)) b!1072057))

(assert (= (and b!1072050 ((_ is ValueCellFull!12222) mapDefault!40486)) b!1072054))

(assert (= start!94812 b!1072050))

(declare-fun m!990813 () Bool)

(assert (=> mapNonEmpty!40486 m!990813))

(declare-fun m!990815 () Bool)

(assert (=> start!94812 m!990815))

(declare-fun m!990817 () Bool)

(assert (=> start!94812 m!990817))

(declare-fun m!990819 () Bool)

(assert (=> start!94812 m!990819))

(declare-fun m!990821 () Bool)

(assert (=> b!1072055 m!990821))

(declare-fun m!990823 () Bool)

(assert (=> b!1072053 m!990823))

(declare-fun m!990825 () Bool)

(assert (=> b!1072053 m!990825))

(declare-fun m!990827 () Bool)

(assert (=> b!1072053 m!990827))

(declare-fun m!990829 () Bool)

(assert (=> b!1072053 m!990829))

(declare-fun m!990831 () Bool)

(assert (=> b!1072053 m!990831))

(declare-fun m!990833 () Bool)

(assert (=> b!1072053 m!990833))

(declare-fun m!990835 () Bool)

(assert (=> b!1072053 m!990835))

(declare-fun m!990837 () Bool)

(assert (=> b!1072053 m!990837))

(declare-fun m!990839 () Bool)

(assert (=> b!1072053 m!990839))

(declare-fun m!990841 () Bool)

(assert (=> b!1072053 m!990841))

(assert (=> b!1072053 m!990823))

(declare-fun m!990843 () Bool)

(assert (=> b!1072058 m!990843))

(declare-fun m!990845 () Bool)

(assert (=> b!1072052 m!990845))

(declare-fun m!990847 () Bool)

(assert (=> b!1072051 m!990847))

(declare-fun m!990849 () Bool)

(assert (=> b!1072051 m!990849))

(declare-fun m!990851 () Bool)

(assert (=> b!1072051 m!990851))

(check-sat (not b!1072055) b_and!34883 (not b_next!22041) (not b!1072051) tp_is_empty!25851 (not b!1072053) (not b!1072058) (not mapNonEmpty!40486) (not start!94812) (not b!1072052))
(check-sat b_and!34883 (not b_next!22041))
