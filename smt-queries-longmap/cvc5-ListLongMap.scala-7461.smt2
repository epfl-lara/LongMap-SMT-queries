; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94674 () Bool)

(assert start!94674)

(declare-fun b_free!21943 () Bool)

(declare-fun b_next!21943 () Bool)

(assert (=> start!94674 (= b_free!21943 (not b_next!21943))))

(declare-fun tp!77285 () Bool)

(declare-fun b_and!34763 () Bool)

(assert (=> start!94674 (= tp!77285 b_and!34763)))

(declare-fun b!1070421 () Bool)

(declare-fun res!714114 () Bool)

(declare-fun e!611030 () Bool)

(assert (=> b!1070421 (=> (not res!714114) (not e!611030))))

(declare-datatypes ((array!68481 0))(
  ( (array!68482 (arr!32937 (Array (_ BitVec 32) (_ BitVec 64))) (size!33473 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68481)

(declare-datatypes ((List!22980 0))(
  ( (Nil!22977) (Cons!22976 (h!24185 (_ BitVec 64)) (t!32311 List!22980)) )
))
(declare-fun arrayNoDuplicates!0 (array!68481 (_ BitVec 32) List!22980) Bool)

(assert (=> b!1070421 (= res!714114 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22977))))

(declare-fun mapIsEmpty!40333 () Bool)

(declare-fun mapRes!40333 () Bool)

(assert (=> mapIsEmpty!40333 mapRes!40333))

(declare-fun b!1070422 () Bool)

(declare-fun res!714115 () Bool)

(assert (=> b!1070422 (=> (not res!714115) (not e!611030))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68481 (_ BitVec 32)) Bool)

(assert (=> b!1070422 (= res!714115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40333 () Bool)

(declare-fun tp!77284 () Bool)

(declare-fun e!611035 () Bool)

(assert (=> mapNonEmpty!40333 (= mapRes!40333 (and tp!77284 e!611035))))

(declare-fun mapKey!40333 () (_ BitVec 32))

(declare-datatypes ((V!39473 0))(
  ( (V!39474 (val!12927 Int)) )
))
(declare-datatypes ((ValueCell!12173 0))(
  ( (ValueCellFull!12173 (v!15543 V!39473)) (EmptyCell!12173) )
))
(declare-fun mapRest!40333 () (Array (_ BitVec 32) ValueCell!12173))

(declare-datatypes ((array!68483 0))(
  ( (array!68484 (arr!32938 (Array (_ BitVec 32) ValueCell!12173)) (size!33474 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68483)

(declare-fun mapValue!40333 () ValueCell!12173)

(assert (=> mapNonEmpty!40333 (= (arr!32938 _values!955) (store mapRest!40333 mapKey!40333 mapValue!40333))))

(declare-fun res!714113 () Bool)

(assert (=> start!94674 (=> (not res!714113) (not e!611030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94674 (= res!714113 (validMask!0 mask!1515))))

(assert (=> start!94674 e!611030))

(assert (=> start!94674 true))

(declare-fun tp_is_empty!25753 () Bool)

(assert (=> start!94674 tp_is_empty!25753))

(declare-fun e!611034 () Bool)

(declare-fun array_inv!25478 (array!68483) Bool)

(assert (=> start!94674 (and (array_inv!25478 _values!955) e!611034)))

(assert (=> start!94674 tp!77285))

(declare-fun array_inv!25479 (array!68481) Bool)

(assert (=> start!94674 (array_inv!25479 _keys!1163)))

(declare-fun b!1070423 () Bool)

(declare-fun e!611032 () Bool)

(assert (=> b!1070423 (= e!611030 (not e!611032))))

(declare-fun res!714117 () Bool)

(assert (=> b!1070423 (=> res!714117 e!611032)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070423 (= res!714117 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16436 0))(
  ( (tuple2!16437 (_1!8229 (_ BitVec 64)) (_2!8229 V!39473)) )
))
(declare-datatypes ((List!22981 0))(
  ( (Nil!22978) (Cons!22977 (h!24186 tuple2!16436) (t!32312 List!22981)) )
))
(declare-datatypes ((ListLongMap!14405 0))(
  ( (ListLongMap!14406 (toList!7218 List!22981)) )
))
(declare-fun lt!473064 () ListLongMap!14405)

(declare-fun lt!473062 () ListLongMap!14405)

(assert (=> b!1070423 (= lt!473064 lt!473062)))

(declare-fun zeroValueBefore!47 () V!39473)

(declare-datatypes ((Unit!35235 0))(
  ( (Unit!35236) )
))
(declare-fun lt!473063 () Unit!35235)

(declare-fun minValue!907 () V!39473)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39473)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!831 (array!68481 array!68483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 V!39473 V!39473 (_ BitVec 32) Int) Unit!35235)

(assert (=> b!1070423 (= lt!473063 (lemmaNoChangeToArrayThenSameMapNoExtras!831 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3794 (array!68481 array!68483 (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 (_ BitVec 32) Int) ListLongMap!14405)

(assert (=> b!1070423 (= lt!473062 (getCurrentListMapNoExtraKeys!3794 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070423 (= lt!473064 (getCurrentListMapNoExtraKeys!3794 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070424 () Bool)

(assert (=> b!1070424 (= e!611032 true)))

(declare-fun lt!473065 () ListLongMap!14405)

(declare-fun getCurrentListMap!4121 (array!68481 array!68483 (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 (_ BitVec 32) Int) ListLongMap!14405)

(assert (=> b!1070424 (= lt!473065 (getCurrentListMap!4121 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070425 () Bool)

(declare-fun e!611031 () Bool)

(assert (=> b!1070425 (= e!611031 tp_is_empty!25753)))

(declare-fun b!1070426 () Bool)

(assert (=> b!1070426 (= e!611035 tp_is_empty!25753)))

(declare-fun b!1070427 () Bool)

(assert (=> b!1070427 (= e!611034 (and e!611031 mapRes!40333))))

(declare-fun condMapEmpty!40333 () Bool)

(declare-fun mapDefault!40333 () ValueCell!12173)

