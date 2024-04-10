; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94892 () Bool)

(assert start!94892)

(declare-fun b_free!22097 () Bool)

(declare-fun b_next!22097 () Bool)

(assert (=> start!94892 (= b_free!22097 (not b_next!22097))))

(declare-fun tp!77756 () Bool)

(declare-fun b_and!34951 () Bool)

(assert (=> start!94892 (= tp!77756 b_and!34951)))

(declare-fun mapNonEmpty!40573 () Bool)

(declare-fun mapRes!40573 () Bool)

(declare-fun tp!77755 () Bool)

(declare-fun e!612919 () Bool)

(assert (=> mapNonEmpty!40573 (= mapRes!40573 (and tp!77755 e!612919))))

(declare-datatypes ((V!39677 0))(
  ( (V!39678 (val!13004 Int)) )
))
(declare-datatypes ((ValueCell!12250 0))(
  ( (ValueCellFull!12250 (v!15622 V!39677)) (EmptyCell!12250) )
))
(declare-fun mapValue!40573 () ValueCell!12250)

(declare-fun mapKey!40573 () (_ BitVec 32))

(declare-fun mapRest!40573 () (Array (_ BitVec 32) ValueCell!12250))

(declare-datatypes ((array!68779 0))(
  ( (array!68780 (arr!33083 (Array (_ BitVec 32) ValueCell!12250)) (size!33619 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68779)

(assert (=> mapNonEmpty!40573 (= (arr!33083 _values!955) (store mapRest!40573 mapKey!40573 mapValue!40573))))

(declare-fun b!1072964 () Bool)

(declare-fun e!612923 () Bool)

(assert (=> b!1072964 (= e!612923 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((tuple2!16560 0))(
  ( (tuple2!16561 (_1!8291 (_ BitVec 64)) (_2!8291 V!39677)) )
))
(declare-datatypes ((List!23096 0))(
  ( (Nil!23093) (Cons!23092 (h!24301 tuple2!16560) (t!32433 List!23096)) )
))
(declare-datatypes ((ListLongMap!14529 0))(
  ( (ListLongMap!14530 (toList!7280 List!23096)) )
))
(declare-fun lt!475911 () ListLongMap!14529)

(declare-fun minValue!907 () V!39677)

(declare-datatypes ((array!68781 0))(
  ( (array!68782 (arr!33084 (Array (_ BitVec 32) (_ BitVec 64))) (size!33620 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68781)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39677)

(declare-fun getCurrentListMapNoExtraKeys!3844 (array!68781 array!68779 (_ BitVec 32) (_ BitVec 32) V!39677 V!39677 (_ BitVec 32) Int) ListLongMap!14529)

(assert (=> b!1072964 (= lt!475911 (getCurrentListMapNoExtraKeys!3844 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39677)

(declare-fun lt!475912 () ListLongMap!14529)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072964 (= lt!475912 (getCurrentListMapNoExtraKeys!3844 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072965 () Bool)

(declare-fun tp_is_empty!25907 () Bool)

(assert (=> b!1072965 (= e!612919 tp_is_empty!25907)))

(declare-fun res!715670 () Bool)

(assert (=> start!94892 (=> (not res!715670) (not e!612923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94892 (= res!715670 (validMask!0 mask!1515))))

(assert (=> start!94892 e!612923))

(assert (=> start!94892 true))

(assert (=> start!94892 tp_is_empty!25907))

(declare-fun e!612921 () Bool)

(declare-fun array_inv!25572 (array!68779) Bool)

(assert (=> start!94892 (and (array_inv!25572 _values!955) e!612921)))

(assert (=> start!94892 tp!77756))

(declare-fun array_inv!25573 (array!68781) Bool)

(assert (=> start!94892 (array_inv!25573 _keys!1163)))

(declare-fun b!1072966 () Bool)

(declare-fun e!612920 () Bool)

(assert (=> b!1072966 (= e!612921 (and e!612920 mapRes!40573))))

(declare-fun condMapEmpty!40573 () Bool)

(declare-fun mapDefault!40573 () ValueCell!12250)

