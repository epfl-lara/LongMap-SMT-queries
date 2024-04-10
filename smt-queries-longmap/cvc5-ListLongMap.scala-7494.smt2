; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94936 () Bool)

(assert start!94936)

(declare-fun b_free!22141 () Bool)

(declare-fun b_next!22141 () Bool)

(assert (=> start!94936 (= b_free!22141 (not b_next!22141))))

(declare-fun tp!77888 () Bool)

(declare-fun b_and!34995 () Bool)

(assert (=> start!94936 (= tp!77888 b_and!34995)))

(declare-fun b!1073426 () Bool)

(declare-fun e!613251 () Bool)

(declare-fun tp_is_empty!25951 () Bool)

(assert (=> b!1073426 (= e!613251 tp_is_empty!25951)))

(declare-fun b!1073427 () Bool)

(declare-fun e!613252 () Bool)

(assert (=> b!1073427 (= e!613252 tp_is_empty!25951)))

(declare-fun res!715935 () Bool)

(declare-fun e!613250 () Bool)

(assert (=> start!94936 (=> (not res!715935) (not e!613250))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94936 (= res!715935 (validMask!0 mask!1515))))

(assert (=> start!94936 e!613250))

(assert (=> start!94936 true))

(assert (=> start!94936 tp_is_empty!25951))

(declare-datatypes ((V!39737 0))(
  ( (V!39738 (val!13026 Int)) )
))
(declare-datatypes ((ValueCell!12272 0))(
  ( (ValueCellFull!12272 (v!15644 V!39737)) (EmptyCell!12272) )
))
(declare-datatypes ((array!68863 0))(
  ( (array!68864 (arr!33125 (Array (_ BitVec 32) ValueCell!12272)) (size!33661 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68863)

(declare-fun e!613249 () Bool)

(declare-fun array_inv!25602 (array!68863) Bool)

(assert (=> start!94936 (and (array_inv!25602 _values!955) e!613249)))

(assert (=> start!94936 tp!77888))

(declare-datatypes ((array!68865 0))(
  ( (array!68866 (arr!33126 (Array (_ BitVec 32) (_ BitVec 64))) (size!33662 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68865)

(declare-fun array_inv!25603 (array!68865) Bool)

(assert (=> start!94936 (array_inv!25603 _keys!1163)))

(declare-fun b!1073428 () Bool)

(declare-fun res!715934 () Bool)

(assert (=> b!1073428 (=> (not res!715934) (not e!613250))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073428 (= res!715934 (and (= (size!33661 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33662 _keys!1163) (size!33661 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40639 () Bool)

(declare-fun mapRes!40639 () Bool)

(assert (=> mapIsEmpty!40639 mapRes!40639))

(declare-fun b!1073429 () Bool)

(declare-fun res!715936 () Bool)

(assert (=> b!1073429 (=> (not res!715936) (not e!613250))))

(declare-datatypes ((List!23123 0))(
  ( (Nil!23120) (Cons!23119 (h!24328 (_ BitVec 64)) (t!32460 List!23123)) )
))
(declare-fun arrayNoDuplicates!0 (array!68865 (_ BitVec 32) List!23123) Bool)

(assert (=> b!1073429 (= res!715936 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23120))))

(declare-fun mapNonEmpty!40639 () Bool)

(declare-fun tp!77887 () Bool)

(assert (=> mapNonEmpty!40639 (= mapRes!40639 (and tp!77887 e!613252))))

(declare-fun mapValue!40639 () ValueCell!12272)

(declare-fun mapKey!40639 () (_ BitVec 32))

(declare-fun mapRest!40639 () (Array (_ BitVec 32) ValueCell!12272))

(assert (=> mapNonEmpty!40639 (= (arr!33125 _values!955) (store mapRest!40639 mapKey!40639 mapValue!40639))))

(declare-fun b!1073430 () Bool)

(assert (=> b!1073430 (= e!613250 false)))

(declare-datatypes ((tuple2!16584 0))(
  ( (tuple2!16585 (_1!8303 (_ BitVec 64)) (_2!8303 V!39737)) )
))
(declare-datatypes ((List!23124 0))(
  ( (Nil!23121) (Cons!23120 (h!24329 tuple2!16584) (t!32461 List!23124)) )
))
(declare-datatypes ((ListLongMap!14553 0))(
  ( (ListLongMap!14554 (toList!7292 List!23124)) )
))
(declare-fun lt!476044 () ListLongMap!14553)

(declare-fun minValue!907 () V!39737)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39737)

(declare-fun getCurrentListMapNoExtraKeys!3856 (array!68865 array!68863 (_ BitVec 32) (_ BitVec 32) V!39737 V!39737 (_ BitVec 32) Int) ListLongMap!14553)

(assert (=> b!1073430 (= lt!476044 (getCurrentListMapNoExtraKeys!3856 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39737)

(declare-fun lt!476043 () ListLongMap!14553)

(assert (=> b!1073430 (= lt!476043 (getCurrentListMapNoExtraKeys!3856 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073431 () Bool)

(assert (=> b!1073431 (= e!613249 (and e!613251 mapRes!40639))))

(declare-fun condMapEmpty!40639 () Bool)

(declare-fun mapDefault!40639 () ValueCell!12272)

