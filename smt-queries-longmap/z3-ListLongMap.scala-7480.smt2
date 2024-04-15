; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94822 () Bool)

(assert start!94822)

(declare-fun b_free!22057 () Bool)

(declare-fun b_next!22057 () Bool)

(assert (=> start!94822 (= b_free!22057 (not b_next!22057))))

(declare-fun tp!77633 () Bool)

(declare-fun b_and!34873 () Bool)

(assert (=> start!94822 (= tp!77633 b_and!34873)))

(declare-fun b!1072113 () Bool)

(declare-fun e!612317 () Bool)

(declare-fun e!612321 () Bool)

(assert (=> b!1072113 (= e!612317 (not e!612321))))

(declare-fun res!715186 () Bool)

(assert (=> b!1072113 (=> res!715186 e!612321)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072113 (= res!715186 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39625 0))(
  ( (V!39626 (val!12984 Int)) )
))
(declare-datatypes ((tuple2!16588 0))(
  ( (tuple2!16589 (_1!8305 (_ BitVec 64)) (_2!8305 V!39625)) )
))
(declare-datatypes ((List!23112 0))(
  ( (Nil!23109) (Cons!23108 (h!24317 tuple2!16588) (t!32438 List!23112)) )
))
(declare-datatypes ((ListLongMap!14557 0))(
  ( (ListLongMap!14558 (toList!7294 List!23112)) )
))
(declare-fun lt!474954 () ListLongMap!14557)

(declare-fun lt!474956 () ListLongMap!14557)

(assert (=> b!1072113 (= lt!474954 lt!474956)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((Unit!35165 0))(
  ( (Unit!35166) )
))
(declare-fun lt!474952 () Unit!35165)

(declare-fun zeroValueBefore!47 () V!39625)

(declare-fun minValue!907 () V!39625)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12230 0))(
  ( (ValueCellFull!12230 (v!15600 V!39625)) (EmptyCell!12230) )
))
(declare-datatypes ((array!68642 0))(
  ( (array!68643 (arr!33016 (Array (_ BitVec 32) ValueCell!12230)) (size!33554 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68642)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39625)

(declare-datatypes ((array!68644 0))(
  ( (array!68645 (arr!33017 (Array (_ BitVec 32) (_ BitVec 64))) (size!33555 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68644)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!870 (array!68644 array!68642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 V!39625 V!39625 (_ BitVec 32) Int) Unit!35165)

(assert (=> b!1072113 (= lt!474952 (lemmaNoChangeToArrayThenSameMapNoExtras!870 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3876 (array!68644 array!68642 (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 (_ BitVec 32) Int) ListLongMap!14557)

(assert (=> b!1072113 (= lt!474956 (getCurrentListMapNoExtraKeys!3876 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072113 (= lt!474954 (getCurrentListMapNoExtraKeys!3876 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!715187 () Bool)

(assert (=> start!94822 (=> (not res!715187) (not e!612317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94822 (= res!715187 (validMask!0 mask!1515))))

(assert (=> start!94822 e!612317))

(assert (=> start!94822 true))

(declare-fun tp_is_empty!25867 () Bool)

(assert (=> start!94822 tp_is_empty!25867))

(declare-fun e!612318 () Bool)

(declare-fun array_inv!25546 (array!68642) Bool)

(assert (=> start!94822 (and (array_inv!25546 _values!955) e!612318)))

(assert (=> start!94822 tp!77633))

(declare-fun array_inv!25547 (array!68644) Bool)

(assert (=> start!94822 (array_inv!25547 _keys!1163)))

(declare-fun b!1072114 () Bool)

(assert (=> b!1072114 (= e!612321 true)))

(declare-fun lt!474957 () ListLongMap!14557)

(declare-fun lt!474963 () ListLongMap!14557)

(declare-fun -!683 (ListLongMap!14557 (_ BitVec 64)) ListLongMap!14557)

(assert (=> b!1072114 (= lt!474957 (-!683 lt!474963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474961 () ListLongMap!14557)

(declare-fun lt!474960 () ListLongMap!14557)

(assert (=> b!1072114 (= lt!474961 lt!474960)))

(declare-fun lt!474962 () Unit!35165)

(declare-fun addCommutativeForDiffKeys!741 (ListLongMap!14557 (_ BitVec 64) V!39625 (_ BitVec 64) V!39625) Unit!35165)

(assert (=> b!1072114 (= lt!474962 (addCommutativeForDiffKeys!741 lt!474954 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474959 () ListLongMap!14557)

(assert (=> b!1072114 (= (-!683 lt!474960 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474959)))

(declare-fun lt!474958 () tuple2!16588)

(declare-fun +!3226 (ListLongMap!14557 tuple2!16588) ListLongMap!14557)

(assert (=> b!1072114 (= lt!474960 (+!3226 lt!474959 lt!474958))))

(declare-fun lt!474953 () Unit!35165)

(declare-fun addThenRemoveForNewKeyIsSame!64 (ListLongMap!14557 (_ BitVec 64) V!39625) Unit!35165)

(assert (=> b!1072114 (= lt!474953 (addThenRemoveForNewKeyIsSame!64 lt!474959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474964 () tuple2!16588)

(assert (=> b!1072114 (= lt!474959 (+!3226 lt!474954 lt!474964))))

(declare-fun e!612323 () Bool)

(assert (=> b!1072114 e!612323))

(declare-fun res!715188 () Bool)

(assert (=> b!1072114 (=> (not res!715188) (not e!612323))))

(assert (=> b!1072114 (= res!715188 (= lt!474963 lt!474961))))

(assert (=> b!1072114 (= lt!474961 (+!3226 (+!3226 lt!474954 lt!474958) lt!474964))))

(assert (=> b!1072114 (= lt!474964 (tuple2!16589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072114 (= lt!474958 (tuple2!16589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474955 () ListLongMap!14557)

(declare-fun getCurrentListMap!4096 (array!68644 array!68642 (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 (_ BitVec 32) Int) ListLongMap!14557)

(assert (=> b!1072114 (= lt!474955 (getCurrentListMap!4096 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072114 (= lt!474963 (getCurrentListMap!4096 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072115 () Bool)

(declare-fun e!612320 () Bool)

(assert (=> b!1072115 (= e!612320 tp_is_empty!25867)))

(declare-fun b!1072116 () Bool)

(declare-fun e!612319 () Bool)

(declare-fun mapRes!40510 () Bool)

(assert (=> b!1072116 (= e!612318 (and e!612319 mapRes!40510))))

(declare-fun condMapEmpty!40510 () Bool)

(declare-fun mapDefault!40510 () ValueCell!12230)

(assert (=> b!1072116 (= condMapEmpty!40510 (= (arr!33016 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12230)) mapDefault!40510)))))

(declare-fun mapIsEmpty!40510 () Bool)

(assert (=> mapIsEmpty!40510 mapRes!40510))

(declare-fun b!1072117 () Bool)

(assert (=> b!1072117 (= e!612319 tp_is_empty!25867)))

(declare-fun mapNonEmpty!40510 () Bool)

(declare-fun tp!77632 () Bool)

(assert (=> mapNonEmpty!40510 (= mapRes!40510 (and tp!77632 e!612320))))

(declare-fun mapKey!40510 () (_ BitVec 32))

(declare-fun mapRest!40510 () (Array (_ BitVec 32) ValueCell!12230))

(declare-fun mapValue!40510 () ValueCell!12230)

(assert (=> mapNonEmpty!40510 (= (arr!33016 _values!955) (store mapRest!40510 mapKey!40510 mapValue!40510))))

(declare-fun b!1072118 () Bool)

(declare-fun res!715189 () Bool)

(assert (=> b!1072118 (=> (not res!715189) (not e!612317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68644 (_ BitVec 32)) Bool)

(assert (=> b!1072118 (= res!715189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072119 () Bool)

(assert (=> b!1072119 (= e!612323 (= lt!474955 (+!3226 lt!474956 lt!474964)))))

(declare-fun b!1072120 () Bool)

(declare-fun res!715184 () Bool)

(assert (=> b!1072120 (=> (not res!715184) (not e!612317))))

(declare-datatypes ((List!23113 0))(
  ( (Nil!23110) (Cons!23109 (h!24318 (_ BitVec 64)) (t!32439 List!23113)) )
))
(declare-fun arrayNoDuplicates!0 (array!68644 (_ BitVec 32) List!23113) Bool)

(assert (=> b!1072120 (= res!715184 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23110))))

(declare-fun b!1072121 () Bool)

(declare-fun res!715185 () Bool)

(assert (=> b!1072121 (=> (not res!715185) (not e!612317))))

(assert (=> b!1072121 (= res!715185 (and (= (size!33554 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33555 _keys!1163) (size!33554 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94822 res!715187) b!1072121))

(assert (= (and b!1072121 res!715185) b!1072118))

(assert (= (and b!1072118 res!715189) b!1072120))

(assert (= (and b!1072120 res!715184) b!1072113))

(assert (= (and b!1072113 (not res!715186)) b!1072114))

(assert (= (and b!1072114 res!715188) b!1072119))

(assert (= (and b!1072116 condMapEmpty!40510) mapIsEmpty!40510))

(assert (= (and b!1072116 (not condMapEmpty!40510)) mapNonEmpty!40510))

(get-info :version)

(assert (= (and mapNonEmpty!40510 ((_ is ValueCellFull!12230) mapValue!40510)) b!1072115))

(assert (= (and b!1072116 ((_ is ValueCellFull!12230) mapDefault!40510)) b!1072117))

(assert (= start!94822 b!1072116))

(declare-fun m!990507 () Bool)

(assert (=> start!94822 m!990507))

(declare-fun m!990509 () Bool)

(assert (=> start!94822 m!990509))

(declare-fun m!990511 () Bool)

(assert (=> start!94822 m!990511))

(declare-fun m!990513 () Bool)

(assert (=> b!1072120 m!990513))

(declare-fun m!990515 () Bool)

(assert (=> b!1072114 m!990515))

(declare-fun m!990517 () Bool)

(assert (=> b!1072114 m!990517))

(declare-fun m!990519 () Bool)

(assert (=> b!1072114 m!990519))

(declare-fun m!990521 () Bool)

(assert (=> b!1072114 m!990521))

(declare-fun m!990523 () Bool)

(assert (=> b!1072114 m!990523))

(declare-fun m!990525 () Bool)

(assert (=> b!1072114 m!990525))

(declare-fun m!990527 () Bool)

(assert (=> b!1072114 m!990527))

(declare-fun m!990529 () Bool)

(assert (=> b!1072114 m!990529))

(declare-fun m!990531 () Bool)

(assert (=> b!1072114 m!990531))

(assert (=> b!1072114 m!990527))

(declare-fun m!990533 () Bool)

(assert (=> b!1072114 m!990533))

(declare-fun m!990535 () Bool)

(assert (=> b!1072113 m!990535))

(declare-fun m!990537 () Bool)

(assert (=> b!1072113 m!990537))

(declare-fun m!990539 () Bool)

(assert (=> b!1072113 m!990539))

(declare-fun m!990541 () Bool)

(assert (=> b!1072119 m!990541))

(declare-fun m!990543 () Bool)

(assert (=> mapNonEmpty!40510 m!990543))

(declare-fun m!990545 () Bool)

(assert (=> b!1072118 m!990545))

(check-sat (not b_next!22057) (not start!94822) tp_is_empty!25867 (not b!1072113) (not mapNonEmpty!40510) (not b!1072118) (not b!1072114) b_and!34873 (not b!1072120) (not b!1072119))
(check-sat b_and!34873 (not b_next!22057))
