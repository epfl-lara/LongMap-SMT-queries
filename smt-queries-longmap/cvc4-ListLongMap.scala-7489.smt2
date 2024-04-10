; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94910 () Bool)

(assert start!94910)

(declare-fun b_free!22115 () Bool)

(declare-fun b_next!22115 () Bool)

(assert (=> start!94910 (= b_free!22115 (not b_next!22115))))

(declare-fun tp!77810 () Bool)

(declare-fun b_and!34969 () Bool)

(assert (=> start!94910 (= tp!77810 b_and!34969)))

(declare-fun mapIsEmpty!40600 () Bool)

(declare-fun mapRes!40600 () Bool)

(assert (=> mapIsEmpty!40600 mapRes!40600))

(declare-fun b!1073153 () Bool)

(declare-fun res!715777 () Bool)

(declare-fun e!613056 () Bool)

(assert (=> b!1073153 (=> (not res!715777) (not e!613056))))

(declare-datatypes ((array!68813 0))(
  ( (array!68814 (arr!33100 (Array (_ BitVec 32) (_ BitVec 64))) (size!33636 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68813)

(declare-datatypes ((List!23107 0))(
  ( (Nil!23104) (Cons!23103 (h!24312 (_ BitVec 64)) (t!32444 List!23107)) )
))
(declare-fun arrayNoDuplicates!0 (array!68813 (_ BitVec 32) List!23107) Bool)

(assert (=> b!1073153 (= res!715777 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23104))))

(declare-fun b!1073154 () Bool)

(declare-fun res!715778 () Bool)

(assert (=> b!1073154 (=> (not res!715778) (not e!613056))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68813 (_ BitVec 32)) Bool)

(assert (=> b!1073154 (= res!715778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073155 () Bool)

(assert (=> b!1073155 (= e!613056 false)))

(declare-datatypes ((V!39701 0))(
  ( (V!39702 (val!13013 Int)) )
))
(declare-datatypes ((tuple2!16572 0))(
  ( (tuple2!16573 (_1!8297 (_ BitVec 64)) (_2!8297 V!39701)) )
))
(declare-datatypes ((List!23108 0))(
  ( (Nil!23105) (Cons!23104 (h!24313 tuple2!16572) (t!32445 List!23108)) )
))
(declare-datatypes ((ListLongMap!14541 0))(
  ( (ListLongMap!14542 (toList!7286 List!23108)) )
))
(declare-fun lt!475965 () ListLongMap!14541)

(declare-datatypes ((ValueCell!12259 0))(
  ( (ValueCellFull!12259 (v!15631 V!39701)) (EmptyCell!12259) )
))
(declare-datatypes ((array!68815 0))(
  ( (array!68816 (arr!33101 (Array (_ BitVec 32) ValueCell!12259)) (size!33637 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68815)

(declare-fun minValue!907 () V!39701)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39701)

(declare-fun getCurrentListMapNoExtraKeys!3850 (array!68813 array!68815 (_ BitVec 32) (_ BitVec 32) V!39701 V!39701 (_ BitVec 32) Int) ListLongMap!14541)

(assert (=> b!1073155 (= lt!475965 (getCurrentListMapNoExtraKeys!3850 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39701)

(declare-fun lt!475966 () ListLongMap!14541)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073155 (= lt!475966 (getCurrentListMapNoExtraKeys!3850 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!715780 () Bool)

(assert (=> start!94910 (=> (not res!715780) (not e!613056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94910 (= res!715780 (validMask!0 mask!1515))))

(assert (=> start!94910 e!613056))

(assert (=> start!94910 true))

(declare-fun tp_is_empty!25925 () Bool)

(assert (=> start!94910 tp_is_empty!25925))

(declare-fun e!613057 () Bool)

(declare-fun array_inv!25588 (array!68815) Bool)

(assert (=> start!94910 (and (array_inv!25588 _values!955) e!613057)))

(assert (=> start!94910 tp!77810))

(declare-fun array_inv!25589 (array!68813) Bool)

(assert (=> start!94910 (array_inv!25589 _keys!1163)))

(declare-fun b!1073156 () Bool)

(declare-fun e!613054 () Bool)

(assert (=> b!1073156 (= e!613054 tp_is_empty!25925)))

(declare-fun b!1073157 () Bool)

(assert (=> b!1073157 (= e!613057 (and e!613054 mapRes!40600))))

(declare-fun condMapEmpty!40600 () Bool)

(declare-fun mapDefault!40600 () ValueCell!12259)

