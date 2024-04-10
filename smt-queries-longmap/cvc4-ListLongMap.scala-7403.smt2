; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94214 () Bool)

(assert start!94214)

(declare-fun b_free!21599 () Bool)

(declare-fun b_next!21599 () Bool)

(assert (=> start!94214 (= b_free!21599 (not b_next!21599))))

(declare-fun tp!76234 () Bool)

(declare-fun b_and!34359 () Bool)

(assert (=> start!94214 (= tp!76234 b_and!34359)))

(declare-fun b!1065441 () Bool)

(declare-fun res!711188 () Bool)

(declare-fun e!607389 () Bool)

(assert (=> b!1065441 (=> (not res!711188) (not e!607389))))

(declare-datatypes ((array!67805 0))(
  ( (array!67806 (arr!32605 (Array (_ BitVec 32) (_ BitVec 64))) (size!33141 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67805)

(declare-datatypes ((List!22734 0))(
  ( (Nil!22731) (Cons!22730 (h!23939 (_ BitVec 64)) (t!32053 List!22734)) )
))
(declare-fun arrayNoDuplicates!0 (array!67805 (_ BitVec 32) List!22734) Bool)

(assert (=> b!1065441 (= res!711188 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22731))))

(declare-fun mapNonEmpty!39799 () Bool)

(declare-fun mapRes!39799 () Bool)

(declare-fun tp!76235 () Bool)

(declare-fun e!607391 () Bool)

(assert (=> mapNonEmpty!39799 (= mapRes!39799 (and tp!76235 e!607391))))

(declare-datatypes ((V!39013 0))(
  ( (V!39014 (val!12755 Int)) )
))
(declare-datatypes ((ValueCell!12001 0))(
  ( (ValueCellFull!12001 (v!15367 V!39013)) (EmptyCell!12001) )
))
(declare-datatypes ((array!67807 0))(
  ( (array!67808 (arr!32606 (Array (_ BitVec 32) ValueCell!12001)) (size!33142 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67807)

(declare-fun mapKey!39799 () (_ BitVec 32))

(declare-fun mapRest!39799 () (Array (_ BitVec 32) ValueCell!12001))

(declare-fun mapValue!39799 () ValueCell!12001)

(assert (=> mapNonEmpty!39799 (= (arr!32606 _values!955) (store mapRest!39799 mapKey!39799 mapValue!39799))))

(declare-fun b!1065442 () Bool)

(declare-fun res!711189 () Bool)

(assert (=> b!1065442 (=> (not res!711189) (not e!607389))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67805 (_ BitVec 32)) Bool)

(assert (=> b!1065442 (= res!711189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065443 () Bool)

(declare-fun res!711185 () Bool)

(assert (=> b!1065443 (=> (not res!711185) (not e!607389))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065443 (= res!711185 (and (= (size!33142 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33141 _keys!1163) (size!33142 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065444 () Bool)

(declare-fun tp_is_empty!25409 () Bool)

(assert (=> b!1065444 (= e!607391 tp_is_empty!25409)))

(declare-fun res!711187 () Bool)

(assert (=> start!94214 (=> (not res!711187) (not e!607389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94214 (= res!711187 (validMask!0 mask!1515))))

(assert (=> start!94214 e!607389))

(assert (=> start!94214 true))

(assert (=> start!94214 tp_is_empty!25409))

(declare-fun e!607388 () Bool)

(declare-fun array_inv!25248 (array!67807) Bool)

(assert (=> start!94214 (and (array_inv!25248 _values!955) e!607388)))

(assert (=> start!94214 tp!76234))

(declare-fun array_inv!25249 (array!67805) Bool)

(assert (=> start!94214 (array_inv!25249 _keys!1163)))

(declare-fun b!1065445 () Bool)

(declare-fun e!607390 () Bool)

(assert (=> b!1065445 (= e!607388 (and e!607390 mapRes!39799))))

(declare-fun condMapEmpty!39799 () Bool)

(declare-fun mapDefault!39799 () ValueCell!12001)

