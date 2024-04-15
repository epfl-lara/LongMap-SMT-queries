; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94888 () Bool)

(assert start!94888)

(declare-fun b_free!22099 () Bool)

(declare-fun b_next!22099 () Bool)

(assert (=> start!94888 (= b_free!22099 (not b_next!22099))))

(declare-fun tp!77762 () Bool)

(declare-fun b_and!34927 () Bool)

(assert (=> start!94888 (= tp!77762 b_and!34927)))

(declare-fun mapNonEmpty!40576 () Bool)

(declare-fun mapRes!40576 () Bool)

(declare-fun tp!77761 () Bool)

(declare-fun e!612841 () Bool)

(assert (=> mapNonEmpty!40576 (= mapRes!40576 (and tp!77761 e!612841))))

(declare-datatypes ((V!39681 0))(
  ( (V!39682 (val!13005 Int)) )
))
(declare-datatypes ((ValueCell!12251 0))(
  ( (ValueCellFull!12251 (v!15622 V!39681)) (EmptyCell!12251) )
))
(declare-fun mapRest!40576 () (Array (_ BitVec 32) ValueCell!12251))

(declare-datatypes ((array!68724 0))(
  ( (array!68725 (arr!33056 (Array (_ BitVec 32) ValueCell!12251)) (size!33594 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68724)

(declare-fun mapValue!40576 () ValueCell!12251)

(declare-fun mapKey!40576 () (_ BitVec 32))

(assert (=> mapNonEmpty!40576 (= (arr!33056 _values!955) (store mapRest!40576 mapKey!40576 mapValue!40576))))

(declare-fun b!1072832 () Bool)

(declare-fun res!715613 () Bool)

(declare-fun e!612844 () Bool)

(assert (=> b!1072832 (=> (not res!715613) (not e!612844))))

(declare-datatypes ((array!68726 0))(
  ( (array!68727 (arr!33057 (Array (_ BitVec 32) (_ BitVec 64))) (size!33595 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68726)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68726 (_ BitVec 32)) Bool)

(assert (=> b!1072832 (= res!715613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072833 () Bool)

(declare-fun res!715612 () Bool)

(assert (=> b!1072833 (=> (not res!715612) (not e!612844))))

(declare-datatypes ((List!23146 0))(
  ( (Nil!23143) (Cons!23142 (h!24351 (_ BitVec 64)) (t!32474 List!23146)) )
))
(declare-fun arrayNoDuplicates!0 (array!68726 (_ BitVec 32) List!23146) Bool)

(assert (=> b!1072833 (= res!715612 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23143))))

(declare-fun mapIsEmpty!40576 () Bool)

(assert (=> mapIsEmpty!40576 mapRes!40576))

(declare-fun b!1072834 () Bool)

(declare-fun res!715615 () Bool)

(assert (=> b!1072834 (=> (not res!715615) (not e!612844))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072834 (= res!715615 (and (= (size!33594 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33595 _keys!1163) (size!33594 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072835 () Bool)

(declare-fun e!612843 () Bool)

(declare-fun e!612842 () Bool)

(assert (=> b!1072835 (= e!612843 (and e!612842 mapRes!40576))))

(declare-fun condMapEmpty!40576 () Bool)

(declare-fun mapDefault!40576 () ValueCell!12251)

(assert (=> b!1072835 (= condMapEmpty!40576 (= (arr!33056 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12251)) mapDefault!40576)))))

(declare-fun b!1072836 () Bool)

(declare-fun tp_is_empty!25909 () Bool)

(assert (=> b!1072836 (= e!612841 tp_is_empty!25909)))

(declare-fun b!1072837 () Bool)

(assert (=> b!1072837 (= e!612844 false)))

(declare-datatypes ((tuple2!16622 0))(
  ( (tuple2!16623 (_1!8322 (_ BitVec 64)) (_2!8322 V!39681)) )
))
(declare-datatypes ((List!23147 0))(
  ( (Nil!23144) (Cons!23143 (h!24352 tuple2!16622) (t!32475 List!23147)) )
))
(declare-datatypes ((ListLongMap!14591 0))(
  ( (ListLongMap!14592 (toList!7311 List!23147)) )
))
(declare-fun lt!475717 () ListLongMap!14591)

(declare-fun minValue!907 () V!39681)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39681)

(declare-fun getCurrentListMapNoExtraKeys!3891 (array!68726 array!68724 (_ BitVec 32) (_ BitVec 32) V!39681 V!39681 (_ BitVec 32) Int) ListLongMap!14591)

(assert (=> b!1072837 (= lt!475717 (getCurrentListMapNoExtraKeys!3891 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39681)

(declare-fun lt!475718 () ListLongMap!14591)

(assert (=> b!1072837 (= lt!475718 (getCurrentListMapNoExtraKeys!3891 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072838 () Bool)

(assert (=> b!1072838 (= e!612842 tp_is_empty!25909)))

(declare-fun res!715614 () Bool)

(assert (=> start!94888 (=> (not res!715614) (not e!612844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94888 (= res!715614 (validMask!0 mask!1515))))

(assert (=> start!94888 e!612844))

(assert (=> start!94888 true))

(assert (=> start!94888 tp_is_empty!25909))

(declare-fun array_inv!25572 (array!68724) Bool)

(assert (=> start!94888 (and (array_inv!25572 _values!955) e!612843)))

(assert (=> start!94888 tp!77762))

(declare-fun array_inv!25573 (array!68726) Bool)

(assert (=> start!94888 (array_inv!25573 _keys!1163)))

(assert (= (and start!94888 res!715614) b!1072834))

(assert (= (and b!1072834 res!715615) b!1072832))

(assert (= (and b!1072832 res!715613) b!1072833))

(assert (= (and b!1072833 res!715612) b!1072837))

(assert (= (and b!1072835 condMapEmpty!40576) mapIsEmpty!40576))

(assert (= (and b!1072835 (not condMapEmpty!40576)) mapNonEmpty!40576))

(get-info :version)

(assert (= (and mapNonEmpty!40576 ((_ is ValueCellFull!12251) mapValue!40576)) b!1072836))

(assert (= (and b!1072835 ((_ is ValueCellFull!12251) mapDefault!40576)) b!1072838))

(assert (= start!94888 b!1072835))

(declare-fun m!991453 () Bool)

(assert (=> mapNonEmpty!40576 m!991453))

(declare-fun m!991455 () Bool)

(assert (=> b!1072832 m!991455))

(declare-fun m!991457 () Bool)

(assert (=> b!1072833 m!991457))

(declare-fun m!991459 () Bool)

(assert (=> start!94888 m!991459))

(declare-fun m!991461 () Bool)

(assert (=> start!94888 m!991461))

(declare-fun m!991463 () Bool)

(assert (=> start!94888 m!991463))

(declare-fun m!991465 () Bool)

(assert (=> b!1072837 m!991465))

(declare-fun m!991467 () Bool)

(assert (=> b!1072837 m!991467))

(check-sat b_and!34927 (not b!1072833) tp_is_empty!25909 (not b!1072832) (not b_next!22099) (not start!94888) (not mapNonEmpty!40576) (not b!1072837))
(check-sat b_and!34927 (not b_next!22099))
