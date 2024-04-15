; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93938 () Bool)

(assert start!93938)

(declare-fun b_free!21403 () Bool)

(declare-fun b_next!21403 () Bool)

(assert (=> start!93938 (= b_free!21403 (not b_next!21403))))

(declare-fun tp!75635 () Bool)

(declare-fun b_and!34099 () Bool)

(assert (=> start!93938 (= tp!75635 b_and!34099)))

(declare-fun b!1062364 () Bool)

(declare-fun e!605160 () Bool)

(declare-fun e!605155 () Bool)

(assert (=> b!1062364 (= e!605160 (not e!605155))))

(declare-fun res!709413 () Bool)

(assert (=> b!1062364 (=> res!709413 e!605155)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062364 (= res!709413 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38753 0))(
  ( (V!38754 (val!12657 Int)) )
))
(declare-datatypes ((tuple2!16080 0))(
  ( (tuple2!16081 (_1!8051 (_ BitVec 64)) (_2!8051 V!38753)) )
))
(declare-datatypes ((List!22632 0))(
  ( (Nil!22629) (Cons!22628 (h!23837 tuple2!16080) (t!31934 List!22632)) )
))
(declare-datatypes ((ListLongMap!14049 0))(
  ( (ListLongMap!14050 (toList!7040 List!22632)) )
))
(declare-fun lt!467943 () ListLongMap!14049)

(declare-fun lt!467942 () ListLongMap!14049)

(assert (=> b!1062364 (= lt!467943 lt!467942)))

(declare-fun zeroValueBefore!47 () V!38753)

(declare-datatypes ((ValueCell!11903 0))(
  ( (ValueCellFull!11903 (v!15266 V!38753)) (EmptyCell!11903) )
))
(declare-datatypes ((array!67374 0))(
  ( (array!67375 (arr!32394 (Array (_ BitVec 32) ValueCell!11903)) (size!32932 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67374)

(declare-fun minValue!907 () V!38753)

(declare-datatypes ((Unit!34671 0))(
  ( (Unit!34672) )
))
(declare-fun lt!467945 () Unit!34671)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38753)

(declare-datatypes ((array!67376 0))(
  ( (array!67377 (arr!32395 (Array (_ BitVec 32) (_ BitVec 64))) (size!32933 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67376)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!645 (array!67376 array!67374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38753 V!38753 V!38753 V!38753 (_ BitVec 32) Int) Unit!34671)

(assert (=> b!1062364 (= lt!467945 (lemmaNoChangeToArrayThenSameMapNoExtras!645 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3651 (array!67376 array!67374 (_ BitVec 32) (_ BitVec 32) V!38753 V!38753 (_ BitVec 32) Int) ListLongMap!14049)

(assert (=> b!1062364 (= lt!467942 (getCurrentListMapNoExtraKeys!3651 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062364 (= lt!467943 (getCurrentListMapNoExtraKeys!3651 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709412 () Bool)

(assert (=> start!93938 (=> (not res!709412) (not e!605160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93938 (= res!709412 (validMask!0 mask!1515))))

(assert (=> start!93938 e!605160))

(assert (=> start!93938 true))

(declare-fun tp_is_empty!25213 () Bool)

(assert (=> start!93938 tp_is_empty!25213))

(declare-fun e!605156 () Bool)

(declare-fun array_inv!25098 (array!67374) Bool)

(assert (=> start!93938 (and (array_inv!25098 _values!955) e!605156)))

(assert (=> start!93938 tp!75635))

(declare-fun array_inv!25099 (array!67376) Bool)

(assert (=> start!93938 (array_inv!25099 _keys!1163)))

(declare-fun b!1062365 () Bool)

(declare-fun res!709411 () Bool)

(assert (=> b!1062365 (=> (not res!709411) (not e!605160))))

(assert (=> b!1062365 (= res!709411 (and (= (size!32932 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32933 _keys!1163) (size!32932 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39493 () Bool)

(declare-fun mapRes!39493 () Bool)

(assert (=> mapIsEmpty!39493 mapRes!39493))

(declare-fun b!1062366 () Bool)

(declare-fun res!709410 () Bool)

(assert (=> b!1062366 (=> (not res!709410) (not e!605160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67376 (_ BitVec 32)) Bool)

(assert (=> b!1062366 (= res!709410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062367 () Bool)

(declare-fun e!605158 () Bool)

(assert (=> b!1062367 (= e!605156 (and e!605158 mapRes!39493))))

(declare-fun condMapEmpty!39493 () Bool)

(declare-fun mapDefault!39493 () ValueCell!11903)

(assert (=> b!1062367 (= condMapEmpty!39493 (= (arr!32394 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11903)) mapDefault!39493)))))

(declare-fun b!1062368 () Bool)

(declare-fun e!605161 () Bool)

(assert (=> b!1062368 (= e!605161 true)))

(declare-fun lt!467946 () ListLongMap!14049)

(declare-fun -!560 (ListLongMap!14049 (_ BitVec 64)) ListLongMap!14049)

(assert (=> b!1062368 (= (-!560 lt!467946 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467946)))

(declare-fun lt!467944 () Unit!34671)

(declare-fun removeNotPresentStillSame!12 (ListLongMap!14049 (_ BitVec 64)) Unit!34671)

(assert (=> b!1062368 (= lt!467944 (removeNotPresentStillSame!12 lt!467946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062369 () Bool)

(assert (=> b!1062369 (= e!605158 tp_is_empty!25213)))

(declare-fun b!1062370 () Bool)

(declare-fun res!709415 () Bool)

(assert (=> b!1062370 (=> (not res!709415) (not e!605160))))

(declare-datatypes ((List!22633 0))(
  ( (Nil!22630) (Cons!22629 (h!23838 (_ BitVec 64)) (t!31935 List!22633)) )
))
(declare-fun arrayNoDuplicates!0 (array!67376 (_ BitVec 32) List!22633) Bool)

(assert (=> b!1062370 (= res!709415 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22630))))

(declare-fun mapNonEmpty!39493 () Bool)

(declare-fun tp!75634 () Bool)

(declare-fun e!605159 () Bool)

(assert (=> mapNonEmpty!39493 (= mapRes!39493 (and tp!75634 e!605159))))

(declare-fun mapKey!39493 () (_ BitVec 32))

(declare-fun mapValue!39493 () ValueCell!11903)

(declare-fun mapRest!39493 () (Array (_ BitVec 32) ValueCell!11903))

(assert (=> mapNonEmpty!39493 (= (arr!32394 _values!955) (store mapRest!39493 mapKey!39493 mapValue!39493))))

(declare-fun b!1062371 () Bool)

(assert (=> b!1062371 (= e!605159 tp_is_empty!25213)))

(declare-fun b!1062372 () Bool)

(assert (=> b!1062372 (= e!605155 e!605161)))

(declare-fun res!709414 () Bool)

(assert (=> b!1062372 (=> res!709414 e!605161)))

(declare-fun contains!6208 (ListLongMap!14049 (_ BitVec 64)) Bool)

(assert (=> b!1062372 (= res!709414 (contains!6208 lt!467946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3940 (array!67376 array!67374 (_ BitVec 32) (_ BitVec 32) V!38753 V!38753 (_ BitVec 32) Int) ListLongMap!14049)

(assert (=> b!1062372 (= lt!467946 (getCurrentListMap!3940 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93938 res!709412) b!1062365))

(assert (= (and b!1062365 res!709411) b!1062366))

(assert (= (and b!1062366 res!709410) b!1062370))

(assert (= (and b!1062370 res!709415) b!1062364))

(assert (= (and b!1062364 (not res!709413)) b!1062372))

(assert (= (and b!1062372 (not res!709414)) b!1062368))

(assert (= (and b!1062367 condMapEmpty!39493) mapIsEmpty!39493))

(assert (= (and b!1062367 (not condMapEmpty!39493)) mapNonEmpty!39493))

(get-info :version)

(assert (= (and mapNonEmpty!39493 ((_ is ValueCellFull!11903) mapValue!39493)) b!1062371))

(assert (= (and b!1062367 ((_ is ValueCellFull!11903) mapDefault!39493)) b!1062369))

(assert (= start!93938 b!1062367))

(declare-fun m!980641 () Bool)

(assert (=> b!1062370 m!980641))

(declare-fun m!980643 () Bool)

(assert (=> b!1062372 m!980643))

(declare-fun m!980645 () Bool)

(assert (=> b!1062372 m!980645))

(declare-fun m!980647 () Bool)

(assert (=> b!1062364 m!980647))

(declare-fun m!980649 () Bool)

(assert (=> b!1062364 m!980649))

(declare-fun m!980651 () Bool)

(assert (=> b!1062364 m!980651))

(declare-fun m!980653 () Bool)

(assert (=> b!1062366 m!980653))

(declare-fun m!980655 () Bool)

(assert (=> b!1062368 m!980655))

(declare-fun m!980657 () Bool)

(assert (=> b!1062368 m!980657))

(declare-fun m!980659 () Bool)

(assert (=> mapNonEmpty!39493 m!980659))

(declare-fun m!980661 () Bool)

(assert (=> start!93938 m!980661))

(declare-fun m!980663 () Bool)

(assert (=> start!93938 m!980663))

(declare-fun m!980665 () Bool)

(assert (=> start!93938 m!980665))

(check-sat (not b!1062370) b_and!34099 (not b!1062364) (not b!1062368) (not b_next!21403) tp_is_empty!25213 (not start!93938) (not b!1062366) (not b!1062372) (not mapNonEmpty!39493))
(check-sat b_and!34099 (not b_next!21403))
