; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94904 () Bool)

(assert start!94904)

(declare-fun b_free!22109 () Bool)

(declare-fun b_next!22109 () Bool)

(assert (=> start!94904 (= b_free!22109 (not b_next!22109))))

(declare-fun tp!77791 () Bool)

(declare-fun b_and!34963 () Bool)

(assert (=> start!94904 (= tp!77791 b_and!34963)))

(declare-fun mapNonEmpty!40591 () Bool)

(declare-fun mapRes!40591 () Bool)

(declare-fun tp!77792 () Bool)

(declare-fun e!613013 () Bool)

(assert (=> mapNonEmpty!40591 (= mapRes!40591 (and tp!77792 e!613013))))

(declare-datatypes ((V!39693 0))(
  ( (V!39694 (val!13010 Int)) )
))
(declare-datatypes ((ValueCell!12256 0))(
  ( (ValueCellFull!12256 (v!15628 V!39693)) (EmptyCell!12256) )
))
(declare-fun mapRest!40591 () (Array (_ BitVec 32) ValueCell!12256))

(declare-datatypes ((array!68801 0))(
  ( (array!68802 (arr!33094 (Array (_ BitVec 32) ValueCell!12256)) (size!33630 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68801)

(declare-fun mapKey!40591 () (_ BitVec 32))

(declare-fun mapValue!40591 () ValueCell!12256)

(assert (=> mapNonEmpty!40591 (= (arr!33094 _values!955) (store mapRest!40591 mapKey!40591 mapValue!40591))))

(declare-fun b!1073090 () Bool)

(declare-fun res!715742 () Bool)

(declare-fun e!613012 () Bool)

(assert (=> b!1073090 (=> (not res!715742) (not e!613012))))

(declare-datatypes ((array!68803 0))(
  ( (array!68804 (arr!33095 (Array (_ BitVec 32) (_ BitVec 64))) (size!33631 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68803)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68803 (_ BitVec 32)) Bool)

(assert (=> b!1073090 (= res!715742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073091 () Bool)

(assert (=> b!1073091 (= e!613012 false)))

(declare-datatypes ((tuple2!16568 0))(
  ( (tuple2!16569 (_1!8295 (_ BitVec 64)) (_2!8295 V!39693)) )
))
(declare-datatypes ((List!23102 0))(
  ( (Nil!23099) (Cons!23098 (h!24307 tuple2!16568) (t!32439 List!23102)) )
))
(declare-datatypes ((ListLongMap!14537 0))(
  ( (ListLongMap!14538 (toList!7284 List!23102)) )
))
(declare-fun lt!475948 () ListLongMap!14537)

(declare-fun minValue!907 () V!39693)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39693)

(declare-fun getCurrentListMapNoExtraKeys!3848 (array!68803 array!68801 (_ BitVec 32) (_ BitVec 32) V!39693 V!39693 (_ BitVec 32) Int) ListLongMap!14537)

(assert (=> b!1073091 (= lt!475948 (getCurrentListMapNoExtraKeys!3848 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39693)

(declare-fun lt!475947 () ListLongMap!14537)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073091 (= lt!475947 (getCurrentListMapNoExtraKeys!3848 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073092 () Bool)

(declare-fun res!715741 () Bool)

(assert (=> b!1073092 (=> (not res!715741) (not e!613012))))

(declare-datatypes ((List!23103 0))(
  ( (Nil!23100) (Cons!23099 (h!24308 (_ BitVec 64)) (t!32440 List!23103)) )
))
(declare-fun arrayNoDuplicates!0 (array!68803 (_ BitVec 32) List!23103) Bool)

(assert (=> b!1073092 (= res!715741 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23100))))

(declare-fun res!715744 () Bool)

(assert (=> start!94904 (=> (not res!715744) (not e!613012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94904 (= res!715744 (validMask!0 mask!1515))))

(assert (=> start!94904 e!613012))

(assert (=> start!94904 true))

(declare-fun tp_is_empty!25919 () Bool)

(assert (=> start!94904 tp_is_empty!25919))

(declare-fun e!613011 () Bool)

(declare-fun array_inv!25582 (array!68801) Bool)

(assert (=> start!94904 (and (array_inv!25582 _values!955) e!613011)))

(assert (=> start!94904 tp!77791))

(declare-fun array_inv!25583 (array!68803) Bool)

(assert (=> start!94904 (array_inv!25583 _keys!1163)))

(declare-fun b!1073093 () Bool)

(assert (=> b!1073093 (= e!613013 tp_is_empty!25919)))

(declare-fun mapIsEmpty!40591 () Bool)

(assert (=> mapIsEmpty!40591 mapRes!40591))

(declare-fun b!1073094 () Bool)

(declare-fun e!613009 () Bool)

(assert (=> b!1073094 (= e!613009 tp_is_empty!25919)))

(declare-fun b!1073095 () Bool)

(assert (=> b!1073095 (= e!613011 (and e!613009 mapRes!40591))))

(declare-fun condMapEmpty!40591 () Bool)

(declare-fun mapDefault!40591 () ValueCell!12256)

