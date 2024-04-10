; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94900 () Bool)

(assert start!94900)

(declare-fun b_free!22105 () Bool)

(declare-fun b_next!22105 () Bool)

(assert (=> start!94900 (= b_free!22105 (not b_next!22105))))

(declare-fun tp!77779 () Bool)

(declare-fun b_and!34959 () Bool)

(assert (=> start!94900 (= tp!77779 b_and!34959)))

(declare-fun mapIsEmpty!40585 () Bool)

(declare-fun mapRes!40585 () Bool)

(assert (=> mapIsEmpty!40585 mapRes!40585))

(declare-fun b!1073048 () Bool)

(declare-fun res!715717 () Bool)

(declare-fun e!612983 () Bool)

(assert (=> b!1073048 (=> (not res!715717) (not e!612983))))

(declare-datatypes ((array!68793 0))(
  ( (array!68794 (arr!33090 (Array (_ BitVec 32) (_ BitVec 64))) (size!33626 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68793)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68793 (_ BitVec 32)) Bool)

(assert (=> b!1073048 (= res!715717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073049 () Bool)

(declare-fun e!612979 () Bool)

(declare-fun tp_is_empty!25915 () Bool)

(assert (=> b!1073049 (= e!612979 tp_is_empty!25915)))

(declare-fun mapNonEmpty!40585 () Bool)

(declare-fun tp!77780 () Bool)

(declare-fun e!612982 () Bool)

(assert (=> mapNonEmpty!40585 (= mapRes!40585 (and tp!77780 e!612982))))

(declare-datatypes ((V!39689 0))(
  ( (V!39690 (val!13008 Int)) )
))
(declare-datatypes ((ValueCell!12254 0))(
  ( (ValueCellFull!12254 (v!15626 V!39689)) (EmptyCell!12254) )
))
(declare-fun mapValue!40585 () ValueCell!12254)

(declare-datatypes ((array!68795 0))(
  ( (array!68796 (arr!33091 (Array (_ BitVec 32) ValueCell!12254)) (size!33627 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68795)

(declare-fun mapRest!40585 () (Array (_ BitVec 32) ValueCell!12254))

(declare-fun mapKey!40585 () (_ BitVec 32))

(assert (=> mapNonEmpty!40585 (= (arr!33091 _values!955) (store mapRest!40585 mapKey!40585 mapValue!40585))))

(declare-fun res!715720 () Bool)

(assert (=> start!94900 (=> (not res!715720) (not e!612983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94900 (= res!715720 (validMask!0 mask!1515))))

(assert (=> start!94900 e!612983))

(assert (=> start!94900 true))

(assert (=> start!94900 tp_is_empty!25915))

(declare-fun e!612981 () Bool)

(declare-fun array_inv!25578 (array!68795) Bool)

(assert (=> start!94900 (and (array_inv!25578 _values!955) e!612981)))

(assert (=> start!94900 tp!77779))

(declare-fun array_inv!25579 (array!68793) Bool)

(assert (=> start!94900 (array_inv!25579 _keys!1163)))

(declare-fun b!1073050 () Bool)

(assert (=> b!1073050 (= e!612983 false)))

(declare-datatypes ((tuple2!16564 0))(
  ( (tuple2!16565 (_1!8293 (_ BitVec 64)) (_2!8293 V!39689)) )
))
(declare-datatypes ((List!23099 0))(
  ( (Nil!23096) (Cons!23095 (h!24304 tuple2!16564) (t!32436 List!23099)) )
))
(declare-datatypes ((ListLongMap!14533 0))(
  ( (ListLongMap!14534 (toList!7282 List!23099)) )
))
(declare-fun lt!475935 () ListLongMap!14533)

(declare-fun minValue!907 () V!39689)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39689)

(declare-fun getCurrentListMapNoExtraKeys!3846 (array!68793 array!68795 (_ BitVec 32) (_ BitVec 32) V!39689 V!39689 (_ BitVec 32) Int) ListLongMap!14533)

(assert (=> b!1073050 (= lt!475935 (getCurrentListMapNoExtraKeys!3846 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39689)

(declare-fun lt!475936 () ListLongMap!14533)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073050 (= lt!475936 (getCurrentListMapNoExtraKeys!3846 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073051 () Bool)

(assert (=> b!1073051 (= e!612981 (and e!612979 mapRes!40585))))

(declare-fun condMapEmpty!40585 () Bool)

(declare-fun mapDefault!40585 () ValueCell!12254)

