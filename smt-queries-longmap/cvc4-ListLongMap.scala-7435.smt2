; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94464 () Bool)

(assert start!94464)

(declare-fun b_free!21791 () Bool)

(declare-fun b_next!21791 () Bool)

(assert (=> start!94464 (= b_free!21791 (not b_next!21791))))

(declare-fun tp!76820 () Bool)

(declare-fun b_and!34583 () Bool)

(assert (=> start!94464 (= tp!76820 b_and!34583)))

(declare-fun b!1068179 () Bool)

(declare-fun e!609389 () Bool)

(assert (=> b!1068179 (= e!609389 true)))

(declare-datatypes ((V!39269 0))(
  ( (V!39270 (val!12851 Int)) )
))
(declare-datatypes ((tuple2!16322 0))(
  ( (tuple2!16323 (_1!8172 (_ BitVec 64)) (_2!8172 V!39269)) )
))
(declare-datatypes ((List!22874 0))(
  ( (Nil!22871) (Cons!22870 (h!24079 tuple2!16322) (t!32199 List!22874)) )
))
(declare-datatypes ((ListLongMap!14291 0))(
  ( (ListLongMap!14292 (toList!7161 List!22874)) )
))
(declare-fun lt!471843 () ListLongMap!14291)

(declare-fun -!644 (ListLongMap!14291 (_ BitVec 64)) ListLongMap!14291)

(assert (=> b!1068179 (= (-!644 lt!471843 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471843)))

(declare-datatypes ((Unit!35119 0))(
  ( (Unit!35120) )
))
(declare-fun lt!471846 () Unit!35119)

(declare-fun removeNotPresentStillSame!54 (ListLongMap!14291 (_ BitVec 64)) Unit!35119)

(assert (=> b!1068179 (= lt!471846 (removeNotPresentStillSame!54 lt!471843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068180 () Bool)

(declare-fun e!609392 () Bool)

(declare-fun e!609388 () Bool)

(assert (=> b!1068180 (= e!609392 (not e!609388))))

(declare-fun res!712806 () Bool)

(assert (=> b!1068180 (=> res!712806 e!609388)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068180 (= res!712806 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471844 () ListLongMap!14291)

(declare-fun lt!471847 () ListLongMap!14291)

(assert (=> b!1068180 (= lt!471844 lt!471847)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39269)

(declare-datatypes ((ValueCell!12097 0))(
  ( (ValueCellFull!12097 (v!15465 V!39269)) (EmptyCell!12097) )
))
(declare-datatypes ((array!68185 0))(
  ( (array!68186 (arr!32792 (Array (_ BitVec 32) ValueCell!12097)) (size!33328 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68185)

(declare-fun minValue!907 () V!39269)

(declare-fun lt!471845 () Unit!35119)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39269)

(declare-datatypes ((array!68187 0))(
  ( (array!68188 (arr!32793 (Array (_ BitVec 32) (_ BitVec 64))) (size!33329 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68187)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!778 (array!68187 array!68185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39269 V!39269 V!39269 V!39269 (_ BitVec 32) Int) Unit!35119)

(assert (=> b!1068180 (= lt!471845 (lemmaNoChangeToArrayThenSameMapNoExtras!778 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3741 (array!68187 array!68185 (_ BitVec 32) (_ BitVec 32) V!39269 V!39269 (_ BitVec 32) Int) ListLongMap!14291)

(assert (=> b!1068180 (= lt!471847 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068180 (= lt!471844 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40096 () Bool)

(declare-fun mapRes!40096 () Bool)

(assert (=> mapIsEmpty!40096 mapRes!40096))

(declare-fun b!1068181 () Bool)

(declare-fun e!609390 () Bool)

(declare-fun tp_is_empty!25601 () Bool)

(assert (=> b!1068181 (= e!609390 tp_is_empty!25601)))

(declare-fun b!1068182 () Bool)

(declare-fun res!712805 () Bool)

(assert (=> b!1068182 (=> (not res!712805) (not e!609392))))

(declare-datatypes ((List!22875 0))(
  ( (Nil!22872) (Cons!22871 (h!24080 (_ BitVec 64)) (t!32200 List!22875)) )
))
(declare-fun arrayNoDuplicates!0 (array!68187 (_ BitVec 32) List!22875) Bool)

(assert (=> b!1068182 (= res!712805 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22872))))

(declare-fun b!1068183 () Bool)

(declare-fun e!609391 () Bool)

(assert (=> b!1068183 (= e!609391 (and e!609390 mapRes!40096))))

(declare-fun condMapEmpty!40096 () Bool)

(declare-fun mapDefault!40096 () ValueCell!12097)

