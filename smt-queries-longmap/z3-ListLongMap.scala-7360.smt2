; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94100 () Bool)

(assert start!94100)

(declare-fun b_free!21337 () Bool)

(declare-fun b_next!21337 () Bool)

(assert (=> start!94100 (= b_free!21337 (not b_next!21337))))

(declare-fun tp!75433 () Bool)

(declare-fun b_and!34061 () Bool)

(assert (=> start!94100 (= tp!75433 b_and!34061)))

(declare-fun mapIsEmpty!39391 () Bool)

(declare-fun mapRes!39391 () Bool)

(assert (=> mapIsEmpty!39391 mapRes!39391))

(declare-fun b!1062927 () Bool)

(declare-fun e!605414 () Bool)

(declare-fun e!605417 () Bool)

(assert (=> b!1062927 (= e!605414 (and e!605417 mapRes!39391))))

(declare-fun condMapEmpty!39391 () Bool)

(declare-datatypes ((V!38665 0))(
  ( (V!38666 (val!12624 Int)) )
))
(declare-datatypes ((ValueCell!11870 0))(
  ( (ValueCellFull!11870 (v!15230 V!38665)) (EmptyCell!11870) )
))
(declare-datatypes ((array!67345 0))(
  ( (array!67346 (arr!32374 (Array (_ BitVec 32) ValueCell!11870)) (size!32911 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67345)

(declare-fun mapDefault!39391 () ValueCell!11870)

(assert (=> b!1062927 (= condMapEmpty!39391 (= (arr!32374 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11870)) mapDefault!39391)))))

(declare-fun b!1062928 () Bool)

(declare-fun tp_is_empty!25147 () Bool)

(assert (=> b!1062928 (= e!605417 tp_is_empty!25147)))

(declare-fun b!1062929 () Bool)

(declare-fun res!709437 () Bool)

(declare-fun e!605418 () Bool)

(assert (=> b!1062929 (=> (not res!709437) (not e!605418))))

(declare-datatypes ((array!67347 0))(
  ( (array!67348 (arr!32375 (Array (_ BitVec 32) (_ BitVec 64))) (size!32912 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67347)

(declare-datatypes ((List!22531 0))(
  ( (Nil!22528) (Cons!22527 (h!23745 (_ BitVec 64)) (t!31832 List!22531)) )
))
(declare-fun arrayNoDuplicates!0 (array!67347 (_ BitVec 32) List!22531) Bool)

(assert (=> b!1062929 (= res!709437 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22528))))

(declare-fun mapNonEmpty!39391 () Bool)

(declare-fun tp!75434 () Bool)

(declare-fun e!605416 () Bool)

(assert (=> mapNonEmpty!39391 (= mapRes!39391 (and tp!75434 e!605416))))

(declare-fun mapKey!39391 () (_ BitVec 32))

(declare-fun mapValue!39391 () ValueCell!11870)

(declare-fun mapRest!39391 () (Array (_ BitVec 32) ValueCell!11870))

(assert (=> mapNonEmpty!39391 (= (arr!32374 _values!955) (store mapRest!39391 mapKey!39391 mapValue!39391))))

(declare-fun b!1062931 () Bool)

(declare-fun res!709438 () Bool)

(assert (=> b!1062931 (=> (not res!709438) (not e!605418))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67347 (_ BitVec 32)) Bool)

(assert (=> b!1062931 (= res!709438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!709436 () Bool)

(assert (=> start!94100 (=> (not res!709436) (not e!605418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94100 (= res!709436 (validMask!0 mask!1515))))

(assert (=> start!94100 e!605418))

(assert (=> start!94100 true))

(assert (=> start!94100 tp_is_empty!25147))

(declare-fun array_inv!25102 (array!67345) Bool)

(assert (=> start!94100 (and (array_inv!25102 _values!955) e!605414)))

(assert (=> start!94100 tp!75433))

(declare-fun array_inv!25103 (array!67347) Bool)

(assert (=> start!94100 (array_inv!25103 _keys!1163)))

(declare-fun b!1062930 () Bool)

(assert (=> b!1062930 (= e!605416 tp_is_empty!25147)))

(declare-fun b!1062932 () Bool)

(assert (=> b!1062932 (= e!605418 (not true))))

(declare-datatypes ((tuple2!15944 0))(
  ( (tuple2!15945 (_1!7983 (_ BitVec 64)) (_2!7983 V!38665)) )
))
(declare-datatypes ((List!22532 0))(
  ( (Nil!22529) (Cons!22528 (h!23746 tuple2!15944) (t!31833 List!22532)) )
))
(declare-datatypes ((ListLongMap!13921 0))(
  ( (ListLongMap!13922 (toList!6976 List!22532)) )
))
(declare-fun lt!468181 () ListLongMap!13921)

(declare-fun lt!468182 () ListLongMap!13921)

(assert (=> b!1062932 (= lt!468181 lt!468182)))

(declare-fun zeroValueBefore!47 () V!38665)

(declare-fun minValue!907 () V!38665)

(declare-datatypes ((Unit!34757 0))(
  ( (Unit!34758) )
))
(declare-fun lt!468183 () Unit!34757)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38665)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!627 (array!67347 array!67345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38665 V!38665 V!38665 V!38665 (_ BitVec 32) Int) Unit!34757)

(assert (=> b!1062932 (= lt!468183 (lemmaNoChangeToArrayThenSameMapNoExtras!627 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3624 (array!67347 array!67345 (_ BitVec 32) (_ BitVec 32) V!38665 V!38665 (_ BitVec 32) Int) ListLongMap!13921)

(assert (=> b!1062932 (= lt!468182 (getCurrentListMapNoExtraKeys!3624 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062932 (= lt!468181 (getCurrentListMapNoExtraKeys!3624 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062933 () Bool)

(declare-fun res!709435 () Bool)

(assert (=> b!1062933 (=> (not res!709435) (not e!605418))))

(assert (=> b!1062933 (= res!709435 (and (= (size!32911 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32912 _keys!1163) (size!32911 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94100 res!709436) b!1062933))

(assert (= (and b!1062933 res!709435) b!1062931))

(assert (= (and b!1062931 res!709438) b!1062929))

(assert (= (and b!1062929 res!709437) b!1062932))

(assert (= (and b!1062927 condMapEmpty!39391) mapIsEmpty!39391))

(assert (= (and b!1062927 (not condMapEmpty!39391)) mapNonEmpty!39391))

(get-info :version)

(assert (= (and mapNonEmpty!39391 ((_ is ValueCellFull!11870) mapValue!39391)) b!1062930))

(assert (= (and b!1062927 ((_ is ValueCellFull!11870) mapDefault!39391)) b!1062928))

(assert (= start!94100 b!1062927))

(declare-fun m!982099 () Bool)

(assert (=> b!1062932 m!982099))

(declare-fun m!982101 () Bool)

(assert (=> b!1062932 m!982101))

(declare-fun m!982103 () Bool)

(assert (=> b!1062932 m!982103))

(declare-fun m!982105 () Bool)

(assert (=> b!1062931 m!982105))

(declare-fun m!982107 () Bool)

(assert (=> b!1062929 m!982107))

(declare-fun m!982109 () Bool)

(assert (=> mapNonEmpty!39391 m!982109))

(declare-fun m!982111 () Bool)

(assert (=> start!94100 m!982111))

(declare-fun m!982113 () Bool)

(assert (=> start!94100 m!982113))

(declare-fun m!982115 () Bool)

(assert (=> start!94100 m!982115))

(check-sat (not b!1062932) (not b!1062931) (not b_next!21337) tp_is_empty!25147 (not b!1062929) (not start!94100) (not mapNonEmpty!39391) b_and!34061)
(check-sat b_and!34061 (not b_next!21337))
