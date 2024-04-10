; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94430 () Bool)

(assert start!94430)

(declare-fun b_free!21757 () Bool)

(declare-fun b_next!21757 () Bool)

(assert (=> start!94430 (= b_free!21757 (not b_next!21757))))

(declare-fun tp!76717 () Bool)

(declare-fun b_and!34549 () Bool)

(assert (=> start!94430 (= tp!76717 b_and!34549)))

(declare-fun res!712496 () Bool)

(declare-fun e!609037 () Bool)

(assert (=> start!94430 (=> (not res!712496) (not e!609037))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94430 (= res!712496 (validMask!0 mask!1515))))

(assert (=> start!94430 e!609037))

(assert (=> start!94430 true))

(declare-fun tp_is_empty!25567 () Bool)

(assert (=> start!94430 tp_is_empty!25567))

(declare-datatypes ((V!39225 0))(
  ( (V!39226 (val!12834 Int)) )
))
(declare-datatypes ((ValueCell!12080 0))(
  ( (ValueCellFull!12080 (v!15448 V!39225)) (EmptyCell!12080) )
))
(declare-datatypes ((array!68117 0))(
  ( (array!68118 (arr!32758 (Array (_ BitVec 32) ValueCell!12080)) (size!33294 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68117)

(declare-fun e!609034 () Bool)

(declare-fun array_inv!25360 (array!68117) Bool)

(assert (=> start!94430 (and (array_inv!25360 _values!955) e!609034)))

(assert (=> start!94430 tp!76717))

(declare-datatypes ((array!68119 0))(
  ( (array!68120 (arr!32759 (Array (_ BitVec 32) (_ BitVec 64))) (size!33295 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68119)

(declare-fun array_inv!25361 (array!68119) Bool)

(assert (=> start!94430 (array_inv!25361 _keys!1163)))

(declare-fun b!1067720 () Bool)

(declare-fun e!609032 () Bool)

(assert (=> b!1067720 (= e!609037 (not e!609032))))

(declare-fun res!712495 () Bool)

(assert (=> b!1067720 (=> res!712495 e!609032)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067720 (= res!712495 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16290 0))(
  ( (tuple2!16291 (_1!8156 (_ BitVec 64)) (_2!8156 V!39225)) )
))
(declare-datatypes ((List!22846 0))(
  ( (Nil!22843) (Cons!22842 (h!24051 tuple2!16290) (t!32171 List!22846)) )
))
(declare-datatypes ((ListLongMap!14259 0))(
  ( (ListLongMap!14260 (toList!7145 List!22846)) )
))
(declare-fun lt!471590 () ListLongMap!14259)

(declare-fun lt!471592 () ListLongMap!14259)

(assert (=> b!1067720 (= lt!471590 lt!471592)))

(declare-fun zeroValueBefore!47 () V!39225)

(declare-datatypes ((Unit!35087 0))(
  ( (Unit!35088) )
))
(declare-fun lt!471591 () Unit!35087)

(declare-fun minValue!907 () V!39225)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39225)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!765 (array!68119 array!68117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 V!39225 V!39225 (_ BitVec 32) Int) Unit!35087)

(assert (=> b!1067720 (= lt!471591 (lemmaNoChangeToArrayThenSameMapNoExtras!765 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3728 (array!68119 array!68117 (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 (_ BitVec 32) Int) ListLongMap!14259)

(assert (=> b!1067720 (= lt!471592 (getCurrentListMapNoExtraKeys!3728 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067720 (= lt!471590 (getCurrentListMapNoExtraKeys!3728 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067721 () Bool)

(declare-fun e!609033 () Bool)

(assert (=> b!1067721 (= e!609033 tp_is_empty!25567)))

(declare-fun b!1067722 () Bool)

(declare-fun res!712498 () Bool)

(assert (=> b!1067722 (=> (not res!712498) (not e!609037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68119 (_ BitVec 32)) Bool)

(assert (=> b!1067722 (= res!712498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067723 () Bool)

(declare-fun e!609036 () Bool)

(assert (=> b!1067723 (= e!609032 e!609036)))

(declare-fun res!712497 () Bool)

(assert (=> b!1067723 (=> res!712497 e!609036)))

(declare-fun lt!471589 () ListLongMap!14259)

(declare-fun contains!6281 (ListLongMap!14259 (_ BitVec 64)) Bool)

(assert (=> b!1067723 (= res!712497 (contains!6281 lt!471589 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4078 (array!68119 array!68117 (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 (_ BitVec 32) Int) ListLongMap!14259)

(assert (=> b!1067723 (= lt!471589 (getCurrentListMap!4078 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067724 () Bool)

(declare-fun res!712499 () Bool)

(assert (=> b!1067724 (=> (not res!712499) (not e!609037))))

(declare-datatypes ((List!22847 0))(
  ( (Nil!22844) (Cons!22843 (h!24052 (_ BitVec 64)) (t!32172 List!22847)) )
))
(declare-fun arrayNoDuplicates!0 (array!68119 (_ BitVec 32) List!22847) Bool)

(assert (=> b!1067724 (= res!712499 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22844))))

(declare-fun b!1067725 () Bool)

(declare-fun res!712500 () Bool)

(assert (=> b!1067725 (=> (not res!712500) (not e!609037))))

(assert (=> b!1067725 (= res!712500 (and (= (size!33294 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33295 _keys!1163) (size!33294 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067726 () Bool)

(declare-fun e!609035 () Bool)

(declare-fun mapRes!40045 () Bool)

(assert (=> b!1067726 (= e!609034 (and e!609035 mapRes!40045))))

(declare-fun condMapEmpty!40045 () Bool)

(declare-fun mapDefault!40045 () ValueCell!12080)

