; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94934 () Bool)

(assert start!94934)

(declare-fun b_free!22139 () Bool)

(declare-fun b_next!22139 () Bool)

(assert (=> start!94934 (= b_free!22139 (not b_next!22139))))

(declare-fun tp!77881 () Bool)

(declare-fun b_and!34993 () Bool)

(assert (=> start!94934 (= tp!77881 b_and!34993)))

(declare-fun b!1073405 () Bool)

(declare-fun res!715923 () Bool)

(declare-fun e!613237 () Bool)

(assert (=> b!1073405 (=> (not res!715923) (not e!613237))))

(declare-datatypes ((array!68859 0))(
  ( (array!68860 (arr!33123 (Array (_ BitVec 32) (_ BitVec 64))) (size!33659 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68859)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68859 (_ BitVec 32)) Bool)

(assert (=> b!1073405 (= res!715923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715921 () Bool)

(assert (=> start!94934 (=> (not res!715921) (not e!613237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94934 (= res!715921 (validMask!0 mask!1515))))

(assert (=> start!94934 e!613237))

(assert (=> start!94934 true))

(declare-fun tp_is_empty!25949 () Bool)

(assert (=> start!94934 tp_is_empty!25949))

(declare-datatypes ((V!39733 0))(
  ( (V!39734 (val!13025 Int)) )
))
(declare-datatypes ((ValueCell!12271 0))(
  ( (ValueCellFull!12271 (v!15643 V!39733)) (EmptyCell!12271) )
))
(declare-datatypes ((array!68861 0))(
  ( (array!68862 (arr!33124 (Array (_ BitVec 32) ValueCell!12271)) (size!33660 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68861)

(declare-fun e!613235 () Bool)

(declare-fun array_inv!25600 (array!68861) Bool)

(assert (=> start!94934 (and (array_inv!25600 _values!955) e!613235)))

(assert (=> start!94934 tp!77881))

(declare-fun array_inv!25601 (array!68859) Bool)

(assert (=> start!94934 (array_inv!25601 _keys!1163)))

(declare-fun mapIsEmpty!40636 () Bool)

(declare-fun mapRes!40636 () Bool)

(assert (=> mapIsEmpty!40636 mapRes!40636))

(declare-fun b!1073406 () Bool)

(declare-fun e!613238 () Bool)

(assert (=> b!1073406 (= e!613238 tp_is_empty!25949)))

(declare-fun b!1073407 () Bool)

(declare-fun res!715924 () Bool)

(assert (=> b!1073407 (=> (not res!715924) (not e!613237))))

(declare-datatypes ((List!23122 0))(
  ( (Nil!23119) (Cons!23118 (h!24327 (_ BitVec 64)) (t!32459 List!23122)) )
))
(declare-fun arrayNoDuplicates!0 (array!68859 (_ BitVec 32) List!23122) Bool)

(assert (=> b!1073407 (= res!715924 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23119))))

(declare-fun b!1073408 () Bool)

(declare-fun e!613234 () Bool)

(assert (=> b!1073408 (= e!613234 tp_is_empty!25949)))

(declare-fun b!1073409 () Bool)

(declare-fun res!715922 () Bool)

(assert (=> b!1073409 (=> (not res!715922) (not e!613237))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073409 (= res!715922 (and (= (size!33660 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33659 _keys!1163) (size!33660 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073410 () Bool)

(assert (=> b!1073410 (= e!613235 (and e!613234 mapRes!40636))))

(declare-fun condMapEmpty!40636 () Bool)

(declare-fun mapDefault!40636 () ValueCell!12271)

