; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94678 () Bool)

(assert start!94678)

(declare-fun b_free!21947 () Bool)

(declare-fun b_next!21947 () Bool)

(assert (=> start!94678 (= b_free!21947 (not b_next!21947))))

(declare-fun tp!77297 () Bool)

(declare-fun b_and!34767 () Bool)

(assert (=> start!94678 (= tp!77297 b_and!34767)))

(declare-fun b!1070469 () Bool)

(declare-fun e!611070 () Bool)

(declare-fun tp_is_empty!25757 () Bool)

(assert (=> b!1070469 (= e!611070 tp_is_empty!25757)))

(declare-fun b!1070470 () Bool)

(declare-fun e!611067 () Bool)

(declare-fun e!611071 () Bool)

(assert (=> b!1070470 (= e!611067 (not e!611071))))

(declare-fun res!714145 () Bool)

(assert (=> b!1070470 (=> res!714145 e!611071)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070470 (= res!714145 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39477 0))(
  ( (V!39478 (val!12929 Int)) )
))
(declare-datatypes ((tuple2!16440 0))(
  ( (tuple2!16441 (_1!8231 (_ BitVec 64)) (_2!8231 V!39477)) )
))
(declare-datatypes ((List!22984 0))(
  ( (Nil!22981) (Cons!22980 (h!24189 tuple2!16440) (t!32315 List!22984)) )
))
(declare-datatypes ((ListLongMap!14409 0))(
  ( (ListLongMap!14410 (toList!7220 List!22984)) )
))
(declare-fun lt!473088 () ListLongMap!14409)

(declare-fun lt!473089 () ListLongMap!14409)

(assert (=> b!1070470 (= lt!473088 lt!473089)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39477)

(declare-datatypes ((ValueCell!12175 0))(
  ( (ValueCellFull!12175 (v!15545 V!39477)) (EmptyCell!12175) )
))
(declare-datatypes ((array!68489 0))(
  ( (array!68490 (arr!32941 (Array (_ BitVec 32) ValueCell!12175)) (size!33477 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68489)

(declare-fun minValue!907 () V!39477)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35239 0))(
  ( (Unit!35240) )
))
(declare-fun lt!473087 () Unit!35239)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39477)

(declare-datatypes ((array!68491 0))(
  ( (array!68492 (arr!32942 (Array (_ BitVec 32) (_ BitVec 64))) (size!33478 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68491)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!833 (array!68491 array!68489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39477 V!39477 V!39477 V!39477 (_ BitVec 32) Int) Unit!35239)

(assert (=> b!1070470 (= lt!473087 (lemmaNoChangeToArrayThenSameMapNoExtras!833 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3796 (array!68491 array!68489 (_ BitVec 32) (_ BitVec 32) V!39477 V!39477 (_ BitVec 32) Int) ListLongMap!14409)

(assert (=> b!1070470 (= lt!473089 (getCurrentListMapNoExtraKeys!3796 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070470 (= lt!473088 (getCurrentListMapNoExtraKeys!3796 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070471 () Bool)

(declare-fun res!714147 () Bool)

(assert (=> b!1070471 (=> (not res!714147) (not e!611067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68491 (_ BitVec 32)) Bool)

(assert (=> b!1070471 (= res!714147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070472 () Bool)

(assert (=> b!1070472 (= e!611071 true)))

(declare-fun lt!473086 () ListLongMap!14409)

(declare-fun getCurrentListMap!4123 (array!68491 array!68489 (_ BitVec 32) (_ BitVec 32) V!39477 V!39477 (_ BitVec 32) Int) ListLongMap!14409)

(assert (=> b!1070472 (= lt!473086 (getCurrentListMap!4123 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070473 () Bool)

(declare-fun res!714143 () Bool)

(assert (=> b!1070473 (=> (not res!714143) (not e!611067))))

(declare-datatypes ((List!22985 0))(
  ( (Nil!22982) (Cons!22981 (h!24190 (_ BitVec 64)) (t!32316 List!22985)) )
))
(declare-fun arrayNoDuplicates!0 (array!68491 (_ BitVec 32) List!22985) Bool)

(assert (=> b!1070473 (= res!714143 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22982))))

(declare-fun mapNonEmpty!40339 () Bool)

(declare-fun mapRes!40339 () Bool)

(declare-fun tp!77296 () Bool)

(assert (=> mapNonEmpty!40339 (= mapRes!40339 (and tp!77296 e!611070))))

(declare-fun mapKey!40339 () (_ BitVec 32))

(declare-fun mapValue!40339 () ValueCell!12175)

(declare-fun mapRest!40339 () (Array (_ BitVec 32) ValueCell!12175))

(assert (=> mapNonEmpty!40339 (= (arr!32941 _values!955) (store mapRest!40339 mapKey!40339 mapValue!40339))))

(declare-fun b!1070475 () Bool)

(declare-fun res!714144 () Bool)

(assert (=> b!1070475 (=> (not res!714144) (not e!611067))))

(assert (=> b!1070475 (= res!714144 (and (= (size!33477 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33478 _keys!1163) (size!33477 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40339 () Bool)

(assert (=> mapIsEmpty!40339 mapRes!40339))

(declare-fun b!1070476 () Bool)

(declare-fun e!611069 () Bool)

(assert (=> b!1070476 (= e!611069 tp_is_empty!25757)))

(declare-fun b!1070474 () Bool)

(declare-fun e!611066 () Bool)

(assert (=> b!1070474 (= e!611066 (and e!611069 mapRes!40339))))

(declare-fun condMapEmpty!40339 () Bool)

(declare-fun mapDefault!40339 () ValueCell!12175)

