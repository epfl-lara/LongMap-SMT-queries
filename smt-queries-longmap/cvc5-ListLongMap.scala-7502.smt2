; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95092 () Bool)

(assert start!95092)

(declare-fun b_free!22189 () Bool)

(declare-fun b_next!22189 () Bool)

(assert (=> start!95092 (= b_free!22189 (not b_next!22189))))

(declare-fun tp!78049 () Bool)

(declare-fun b_and!35109 () Bool)

(assert (=> start!95092 (= tp!78049 b_and!35109)))

(declare-fun mapIsEmpty!40729 () Bool)

(declare-fun mapRes!40729 () Bool)

(assert (=> mapIsEmpty!40729 mapRes!40729))

(declare-fun b!1074967 () Bool)

(declare-fun res!716688 () Bool)

(declare-fun e!614300 () Bool)

(assert (=> b!1074967 (=> (not res!716688) (not e!614300))))

(declare-datatypes ((array!68967 0))(
  ( (array!68968 (arr!33171 (Array (_ BitVec 32) (_ BitVec 64))) (size!33707 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68967)

(declare-datatypes ((List!23161 0))(
  ( (Nil!23158) (Cons!23157 (h!24366 (_ BitVec 64)) (t!32510 List!23161)) )
))
(declare-fun arrayNoDuplicates!0 (array!68967 (_ BitVec 32) List!23161) Bool)

(assert (=> b!1074967 (= res!716688 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23158))))

(declare-fun b!1074968 () Bool)

(declare-fun e!614301 () Bool)

(assert (=> b!1074968 (= e!614300 (not e!614301))))

(declare-fun res!716692 () Bool)

(assert (=> b!1074968 (=> res!716692 e!614301)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074968 (= res!716692 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39801 0))(
  ( (V!39802 (val!13050 Int)) )
))
(declare-datatypes ((tuple2!16626 0))(
  ( (tuple2!16627 (_1!8324 (_ BitVec 64)) (_2!8324 V!39801)) )
))
(declare-datatypes ((List!23162 0))(
  ( (Nil!23159) (Cons!23158 (h!24367 tuple2!16626) (t!32511 List!23162)) )
))
(declare-datatypes ((ListLongMap!14595 0))(
  ( (ListLongMap!14596 (toList!7313 List!23162)) )
))
(declare-fun lt!477030 () ListLongMap!14595)

(declare-fun lt!477029 () ListLongMap!14595)

(assert (=> b!1074968 (= lt!477030 lt!477029)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39801)

(declare-datatypes ((ValueCell!12296 0))(
  ( (ValueCellFull!12296 (v!15673 V!39801)) (EmptyCell!12296) )
))
(declare-datatypes ((array!68969 0))(
  ( (array!68970 (arr!33172 (Array (_ BitVec 32) ValueCell!12296)) (size!33708 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68969)

(declare-fun minValue!907 () V!39801)

(declare-datatypes ((Unit!35394 0))(
  ( (Unit!35395) )
))
(declare-fun lt!477033 () Unit!35394)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39801)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!892 (array!68967 array!68969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 V!39801 V!39801 (_ BitVec 32) Int) Unit!35394)

(assert (=> b!1074968 (= lt!477033 (lemmaNoChangeToArrayThenSameMapNoExtras!892 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3876 (array!68967 array!68969 (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 (_ BitVec 32) Int) ListLongMap!14595)

(assert (=> b!1074968 (= lt!477029 (getCurrentListMapNoExtraKeys!3876 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074968 (= lt!477030 (getCurrentListMapNoExtraKeys!3876 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716689 () Bool)

(assert (=> start!95092 (=> (not res!716689) (not e!614300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95092 (= res!716689 (validMask!0 mask!1515))))

(assert (=> start!95092 e!614300))

(assert (=> start!95092 true))

(declare-fun tp_is_empty!25999 () Bool)

(assert (=> start!95092 tp_is_empty!25999))

(declare-fun e!614297 () Bool)

(declare-fun array_inv!25636 (array!68969) Bool)

(assert (=> start!95092 (and (array_inv!25636 _values!955) e!614297)))

(assert (=> start!95092 tp!78049))

(declare-fun array_inv!25637 (array!68967) Bool)

(assert (=> start!95092 (array_inv!25637 _keys!1163)))

(declare-fun b!1074969 () Bool)

(declare-fun e!614299 () Bool)

(assert (=> b!1074969 (= e!614299 tp_is_empty!25999)))

(declare-fun b!1074970 () Bool)

(declare-fun lt!477031 () ListLongMap!14595)

(declare-fun lt!477032 () ListLongMap!14595)

(declare-fun -!709 (ListLongMap!14595 (_ BitVec 64)) ListLongMap!14595)

(assert (=> b!1074970 (= e!614301 (= (-!709 lt!477031 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477032))))

(declare-fun lt!477035 () ListLongMap!14595)

(assert (=> b!1074970 (= (-!709 lt!477035 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477030)))

(declare-fun lt!477034 () Unit!35394)

(declare-fun addThenRemoveForNewKeyIsSame!76 (ListLongMap!14595 (_ BitVec 64) V!39801) Unit!35394)

(assert (=> b!1074970 (= lt!477034 (addThenRemoveForNewKeyIsSame!76 lt!477030 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1074970 (and (= lt!477031 lt!477035) (= lt!477032 lt!477029))))

(declare-fun +!3221 (ListLongMap!14595 tuple2!16626) ListLongMap!14595)

(assert (=> b!1074970 (= lt!477035 (+!3221 lt!477030 (tuple2!16627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4182 (array!68967 array!68969 (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 (_ BitVec 32) Int) ListLongMap!14595)

(assert (=> b!1074970 (= lt!477032 (getCurrentListMap!4182 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074970 (= lt!477031 (getCurrentListMap!4182 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40729 () Bool)

(declare-fun tp!78050 () Bool)

(declare-fun e!614296 () Bool)

(assert (=> mapNonEmpty!40729 (= mapRes!40729 (and tp!78050 e!614296))))

(declare-fun mapKey!40729 () (_ BitVec 32))

(declare-fun mapValue!40729 () ValueCell!12296)

(declare-fun mapRest!40729 () (Array (_ BitVec 32) ValueCell!12296))

(assert (=> mapNonEmpty!40729 (= (arr!33172 _values!955) (store mapRest!40729 mapKey!40729 mapValue!40729))))

(declare-fun b!1074971 () Bool)

(assert (=> b!1074971 (= e!614296 tp_is_empty!25999)))

(declare-fun b!1074972 () Bool)

(declare-fun res!716690 () Bool)

(assert (=> b!1074972 (=> (not res!716690) (not e!614300))))

(assert (=> b!1074972 (= res!716690 (and (= (size!33708 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33707 _keys!1163) (size!33708 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074973 () Bool)

(declare-fun res!716691 () Bool)

(assert (=> b!1074973 (=> (not res!716691) (not e!614300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68967 (_ BitVec 32)) Bool)

(assert (=> b!1074973 (= res!716691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074974 () Bool)

(assert (=> b!1074974 (= e!614297 (and e!614299 mapRes!40729))))

(declare-fun condMapEmpty!40729 () Bool)

(declare-fun mapDefault!40729 () ValueCell!12296)

