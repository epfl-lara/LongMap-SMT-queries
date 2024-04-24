; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94880 () Bool)

(assert start!94880)

(declare-fun b_free!21913 () Bool)

(declare-fun b_next!21913 () Bool)

(assert (=> start!94880 (= b_free!21913 (not b_next!21913))))

(declare-fun tp!77194 () Bool)

(declare-fun b_and!34743 () Bool)

(assert (=> start!94880 (= tp!77194 b_and!34743)))

(declare-fun b!1071388 () Bool)

(declare-fun e!611616 () Bool)

(declare-fun e!611619 () Bool)

(declare-fun mapRes!40288 () Bool)

(assert (=> b!1071388 (= e!611616 (and e!611619 mapRes!40288))))

(declare-fun condMapEmpty!40288 () Bool)

(declare-datatypes ((V!39433 0))(
  ( (V!39434 (val!12912 Int)) )
))
(declare-datatypes ((ValueCell!12158 0))(
  ( (ValueCellFull!12158 (v!15524 V!39433)) (EmptyCell!12158) )
))
(declare-datatypes ((array!68461 0))(
  ( (array!68462 (arr!32921 (Array (_ BitVec 32) ValueCell!12158)) (size!33458 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68461)

(declare-fun mapDefault!40288 () ValueCell!12158)

(assert (=> b!1071388 (= condMapEmpty!40288 (= (arr!32921 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12158)) mapDefault!40288)))))

(declare-fun b!1071389 () Bool)

(declare-fun res!714413 () Bool)

(declare-fun e!611617 () Bool)

(assert (=> b!1071389 (=> (not res!714413) (not e!611617))))

(declare-datatypes ((array!68463 0))(
  ( (array!68464 (arr!32922 (Array (_ BitVec 32) (_ BitVec 64))) (size!33459 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68463)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68463 (_ BitVec 32)) Bool)

(assert (=> b!1071389 (= res!714413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071390 () Bool)

(declare-fun e!611620 () Bool)

(declare-fun tp_is_empty!25723 () Bool)

(assert (=> b!1071390 (= e!611620 tp_is_empty!25723)))

(declare-fun b!1071391 () Bool)

(assert (=> b!1071391 (= e!611619 tp_is_empty!25723)))

(declare-fun b!1071392 () Bool)

(declare-fun e!611615 () Bool)

(assert (=> b!1071392 (= e!611615 true)))

(declare-fun zeroValueBefore!47 () V!39433)

(declare-datatypes ((tuple2!16384 0))(
  ( (tuple2!16385 (_1!8203 (_ BitVec 64)) (_2!8203 V!39433)) )
))
(declare-datatypes ((List!22953 0))(
  ( (Nil!22950) (Cons!22949 (h!24167 tuple2!16384) (t!32276 List!22953)) )
))
(declare-datatypes ((ListLongMap!14361 0))(
  ( (ListLongMap!14362 (toList!7196 List!22953)) )
))
(declare-fun lt!473400 () ListLongMap!14361)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39433)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4100 (array!68463 array!68461 (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 (_ BitVec 32) Int) ListLongMap!14361)

(assert (=> b!1071392 (= lt!473400 (getCurrentListMap!4100 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071393 () Bool)

(declare-fun res!714411 () Bool)

(assert (=> b!1071393 (=> (not res!714411) (not e!611617))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1071393 (= res!714411 (and (= (size!33458 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33459 _keys!1163) (size!33458 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071394 () Bool)

(declare-fun res!714410 () Bool)

(assert (=> b!1071394 (=> (not res!714410) (not e!611617))))

(declare-datatypes ((List!22954 0))(
  ( (Nil!22951) (Cons!22950 (h!24168 (_ BitVec 64)) (t!32277 List!22954)) )
))
(declare-fun arrayNoDuplicates!0 (array!68463 (_ BitVec 32) List!22954) Bool)

(assert (=> b!1071394 (= res!714410 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22951))))

(declare-fun mapNonEmpty!40288 () Bool)

(declare-fun tp!77195 () Bool)

(assert (=> mapNonEmpty!40288 (= mapRes!40288 (and tp!77195 e!611620))))

(declare-fun mapValue!40288 () ValueCell!12158)

(declare-fun mapRest!40288 () (Array (_ BitVec 32) ValueCell!12158))

(declare-fun mapKey!40288 () (_ BitVec 32))

(assert (=> mapNonEmpty!40288 (= (arr!32921 _values!955) (store mapRest!40288 mapKey!40288 mapValue!40288))))

(declare-fun res!714412 () Bool)

(assert (=> start!94880 (=> (not res!714412) (not e!611617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94880 (= res!714412 (validMask!0 mask!1515))))

(assert (=> start!94880 e!611617))

(assert (=> start!94880 true))

(assert (=> start!94880 tp_is_empty!25723))

(declare-fun array_inv!25496 (array!68461) Bool)

(assert (=> start!94880 (and (array_inv!25496 _values!955) e!611616)))

(assert (=> start!94880 tp!77194))

(declare-fun array_inv!25497 (array!68463) Bool)

(assert (=> start!94880 (array_inv!25497 _keys!1163)))

(declare-fun mapIsEmpty!40288 () Bool)

(assert (=> mapIsEmpty!40288 mapRes!40288))

(declare-fun b!1071395 () Bool)

(assert (=> b!1071395 (= e!611617 (not e!611615))))

(declare-fun res!714414 () Bool)

(assert (=> b!1071395 (=> res!714414 e!611615)))

(assert (=> b!1071395 (= res!714414 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473397 () ListLongMap!14361)

(declare-fun lt!473398 () ListLongMap!14361)

(assert (=> b!1071395 (= lt!473397 lt!473398)))

(declare-datatypes ((Unit!35186 0))(
  ( (Unit!35187) )
))
(declare-fun lt!473399 () Unit!35186)

(declare-fun zeroValueAfter!47 () V!39433)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!811 (array!68463 array!68461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 V!39433 V!39433 (_ BitVec 32) Int) Unit!35186)

(assert (=> b!1071395 (= lt!473399 (lemmaNoChangeToArrayThenSameMapNoExtras!811 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3808 (array!68463 array!68461 (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 (_ BitVec 32) Int) ListLongMap!14361)

(assert (=> b!1071395 (= lt!473398 (getCurrentListMapNoExtraKeys!3808 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071395 (= lt!473397 (getCurrentListMapNoExtraKeys!3808 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94880 res!714412) b!1071393))

(assert (= (and b!1071393 res!714411) b!1071389))

(assert (= (and b!1071389 res!714413) b!1071394))

(assert (= (and b!1071394 res!714410) b!1071395))

(assert (= (and b!1071395 (not res!714414)) b!1071392))

(assert (= (and b!1071388 condMapEmpty!40288) mapIsEmpty!40288))

(assert (= (and b!1071388 (not condMapEmpty!40288)) mapNonEmpty!40288))

(get-info :version)

(assert (= (and mapNonEmpty!40288 ((_ is ValueCellFull!12158) mapValue!40288)) b!1071390))

(assert (= (and b!1071388 ((_ is ValueCellFull!12158) mapDefault!40288)) b!1071391))

(assert (= start!94880 b!1071388))

(declare-fun m!990145 () Bool)

(assert (=> start!94880 m!990145))

(declare-fun m!990147 () Bool)

(assert (=> start!94880 m!990147))

(declare-fun m!990149 () Bool)

(assert (=> start!94880 m!990149))

(declare-fun m!990151 () Bool)

(assert (=> b!1071394 m!990151))

(declare-fun m!990153 () Bool)

(assert (=> b!1071392 m!990153))

(declare-fun m!990155 () Bool)

(assert (=> b!1071389 m!990155))

(declare-fun m!990157 () Bool)

(assert (=> mapNonEmpty!40288 m!990157))

(declare-fun m!990159 () Bool)

(assert (=> b!1071395 m!990159))

(declare-fun m!990161 () Bool)

(assert (=> b!1071395 m!990161))

(declare-fun m!990163 () Bool)

(assert (=> b!1071395 m!990163))

(check-sat (not b!1071394) (not start!94880) tp_is_empty!25723 (not b_next!21913) (not mapNonEmpty!40288) (not b!1071392) (not b!1071389) (not b!1071395) b_and!34743)
(check-sat b_and!34743 (not b_next!21913))
