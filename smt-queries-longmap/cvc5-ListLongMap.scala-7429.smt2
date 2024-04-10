; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94424 () Bool)

(assert start!94424)

(declare-fun b_free!21751 () Bool)

(declare-fun b_next!21751 () Bool)

(assert (=> start!94424 (= b_free!21751 (not b_next!21751))))

(declare-fun tp!76700 () Bool)

(declare-fun b_and!34543 () Bool)

(assert (=> start!94424 (= tp!76700 b_and!34543)))

(declare-fun b!1067639 () Bool)

(declare-fun res!712446 () Bool)

(declare-fun e!608973 () Bool)

(assert (=> b!1067639 (=> (not res!712446) (not e!608973))))

(declare-datatypes ((array!68105 0))(
  ( (array!68106 (arr!32752 (Array (_ BitVec 32) (_ BitVec 64))) (size!33288 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68105)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68105 (_ BitVec 32)) Bool)

(assert (=> b!1067639 (= res!712446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40036 () Bool)

(declare-fun mapRes!40036 () Bool)

(assert (=> mapIsEmpty!40036 mapRes!40036))

(declare-fun b!1067640 () Bool)

(declare-fun e!608970 () Bool)

(assert (=> b!1067640 (= e!608970 true)))

(declare-datatypes ((V!39217 0))(
  ( (V!39218 (val!12831 Int)) )
))
(declare-datatypes ((tuple2!16284 0))(
  ( (tuple2!16285 (_1!8153 (_ BitVec 64)) (_2!8153 V!39217)) )
))
(declare-datatypes ((List!22842 0))(
  ( (Nil!22839) (Cons!22838 (h!24047 tuple2!16284) (t!32167 List!22842)) )
))
(declare-datatypes ((ListLongMap!14253 0))(
  ( (ListLongMap!14254 (toList!7142 List!22842)) )
))
(declare-fun lt!471546 () ListLongMap!14253)

(declare-fun -!629 (ListLongMap!14253 (_ BitVec 64)) ListLongMap!14253)

(assert (=> b!1067640 (= (-!629 lt!471546 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471546)))

(declare-datatypes ((Unit!35081 0))(
  ( (Unit!35082) )
))
(declare-fun lt!471543 () Unit!35081)

(declare-fun removeNotPresentStillSame!39 (ListLongMap!14253 (_ BitVec 64)) Unit!35081)

(assert (=> b!1067640 (= lt!471543 (removeNotPresentStillSame!39 lt!471546 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!712443 () Bool)

(assert (=> start!94424 (=> (not res!712443) (not e!608973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94424 (= res!712443 (validMask!0 mask!1515))))

(assert (=> start!94424 e!608973))

(assert (=> start!94424 true))

(declare-fun tp_is_empty!25561 () Bool)

(assert (=> start!94424 tp_is_empty!25561))

(declare-datatypes ((ValueCell!12077 0))(
  ( (ValueCellFull!12077 (v!15445 V!39217)) (EmptyCell!12077) )
))
(declare-datatypes ((array!68107 0))(
  ( (array!68108 (arr!32753 (Array (_ BitVec 32) ValueCell!12077)) (size!33289 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68107)

(declare-fun e!608969 () Bool)

(declare-fun array_inv!25356 (array!68107) Bool)

(assert (=> start!94424 (and (array_inv!25356 _values!955) e!608969)))

(assert (=> start!94424 tp!76700))

(declare-fun array_inv!25357 (array!68105) Bool)

(assert (=> start!94424 (array_inv!25357 _keys!1163)))

(declare-fun b!1067641 () Bool)

(declare-fun e!608968 () Bool)

(assert (=> b!1067641 (= e!608968 e!608970)))

(declare-fun res!712442 () Bool)

(assert (=> b!1067641 (=> res!712442 e!608970)))

(declare-fun contains!6279 (ListLongMap!14253 (_ BitVec 64)) Bool)

(assert (=> b!1067641 (= res!712442 (contains!6279 lt!471546 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39217)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39217)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4076 (array!68105 array!68107 (_ BitVec 32) (_ BitVec 32) V!39217 V!39217 (_ BitVec 32) Int) ListLongMap!14253)

(assert (=> b!1067641 (= lt!471546 (getCurrentListMap!4076 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067642 () Bool)

(declare-fun e!608971 () Bool)

(assert (=> b!1067642 (= e!608971 tp_is_empty!25561)))

(declare-fun b!1067643 () Bool)

(declare-fun e!608974 () Bool)

(assert (=> b!1067643 (= e!608969 (and e!608974 mapRes!40036))))

(declare-fun condMapEmpty!40036 () Bool)

(declare-fun mapDefault!40036 () ValueCell!12077)

