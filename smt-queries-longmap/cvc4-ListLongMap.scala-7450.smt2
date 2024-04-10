; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94598 () Bool)

(assert start!94598)

(declare-fun b_free!21881 () Bool)

(declare-fun b_next!21881 () Bool)

(assert (=> start!94598 (= b_free!21881 (not b_next!21881))))

(declare-fun tp!77095 () Bool)

(declare-fun b_and!34693 () Bool)

(assert (=> start!94598 (= tp!77095 b_and!34693)))

(declare-fun mapNonEmpty!40237 () Bool)

(declare-fun mapRes!40237 () Bool)

(declare-fun tp!77096 () Bool)

(declare-fun e!610467 () Bool)

(assert (=> mapNonEmpty!40237 (= mapRes!40237 (and tp!77096 e!610467))))

(declare-fun mapKey!40237 () (_ BitVec 32))

(declare-datatypes ((V!39389 0))(
  ( (V!39390 (val!12896 Int)) )
))
(declare-datatypes ((ValueCell!12142 0))(
  ( (ValueCellFull!12142 (v!15512 V!39389)) (EmptyCell!12142) )
))
(declare-datatypes ((array!68359 0))(
  ( (array!68360 (arr!32877 (Array (_ BitVec 32) ValueCell!12142)) (size!33413 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68359)

(declare-fun mapRest!40237 () (Array (_ BitVec 32) ValueCell!12142))

(declare-fun mapValue!40237 () ValueCell!12142)

(assert (=> mapNonEmpty!40237 (= (arr!32877 _values!955) (store mapRest!40237 mapKey!40237 mapValue!40237))))

(declare-fun b!1069638 () Bool)

(declare-fun res!713666 () Bool)

(declare-fun e!610466 () Bool)

(assert (=> b!1069638 (=> (not res!713666) (not e!610466))))

(declare-datatypes ((array!68361 0))(
  ( (array!68362 (arr!32878 (Array (_ BitVec 32) (_ BitVec 64))) (size!33414 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68361)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68361 (_ BitVec 32)) Bool)

(assert (=> b!1069638 (= res!713666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069639 () Bool)

(assert (=> b!1069639 (= e!610466 (not true))))

(declare-datatypes ((tuple2!16390 0))(
  ( (tuple2!16391 (_1!8206 (_ BitVec 64)) (_2!8206 V!39389)) )
))
(declare-datatypes ((List!22935 0))(
  ( (Nil!22932) (Cons!22931 (h!24140 tuple2!16390) (t!32264 List!22935)) )
))
(declare-datatypes ((ListLongMap!14359 0))(
  ( (ListLongMap!14360 (toList!7195 List!22935)) )
))
(declare-fun lt!472698 () ListLongMap!14359)

(declare-fun lt!472697 () ListLongMap!14359)

(assert (=> b!1069639 (= lt!472698 lt!472697)))

(declare-fun zeroValueBefore!47 () V!39389)

(declare-datatypes ((Unit!35189 0))(
  ( (Unit!35190) )
))
(declare-fun lt!472696 () Unit!35189)

(declare-fun minValue!907 () V!39389)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39389)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!808 (array!68361 array!68359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39389 V!39389 V!39389 V!39389 (_ BitVec 32) Int) Unit!35189)

(assert (=> b!1069639 (= lt!472696 (lemmaNoChangeToArrayThenSameMapNoExtras!808 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3771 (array!68361 array!68359 (_ BitVec 32) (_ BitVec 32) V!39389 V!39389 (_ BitVec 32) Int) ListLongMap!14359)

(assert (=> b!1069639 (= lt!472697 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069639 (= lt!472698 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069640 () Bool)

(declare-fun tp_is_empty!25691 () Bool)

(assert (=> b!1069640 (= e!610467 tp_is_empty!25691)))

(declare-fun b!1069641 () Bool)

(declare-fun e!610464 () Bool)

(declare-fun e!610465 () Bool)

(assert (=> b!1069641 (= e!610464 (and e!610465 mapRes!40237))))

(declare-fun condMapEmpty!40237 () Bool)

(declare-fun mapDefault!40237 () ValueCell!12142)

