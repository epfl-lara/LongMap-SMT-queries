; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93744 () Bool)

(assert start!93744)

(declare-fun b_free!21229 () Bool)

(declare-fun b_next!21229 () Bool)

(assert (=> start!93744 (= b_free!21229 (not b_next!21229))))

(declare-fun tp!75107 () Bool)

(declare-fun b_and!33939 () Bool)

(assert (=> start!93744 (= tp!75107 b_and!33939)))

(declare-fun b!1060393 () Bool)

(declare-fun res!708240 () Bool)

(declare-fun e!603705 () Bool)

(assert (=> b!1060393 (=> (not res!708240) (not e!603705))))

(declare-datatypes ((array!67097 0))(
  ( (array!67098 (arr!32257 (Array (_ BitVec 32) (_ BitVec 64))) (size!32793 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67097)

(declare-datatypes ((List!22472 0))(
  ( (Nil!22469) (Cons!22468 (h!23677 (_ BitVec 64)) (t!31779 List!22472)) )
))
(declare-fun arrayNoDuplicates!0 (array!67097 (_ BitVec 32) List!22472) Bool)

(assert (=> b!1060393 (= res!708240 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22469))))

(declare-fun b!1060394 () Bool)

(declare-fun e!603702 () Bool)

(declare-fun tp_is_empty!25039 () Bool)

(assert (=> b!1060394 (= e!603702 tp_is_empty!25039)))

(declare-fun b!1060395 () Bool)

(declare-fun res!708238 () Bool)

(assert (=> b!1060395 (=> (not res!708238) (not e!603705))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67097 (_ BitVec 32)) Bool)

(assert (=> b!1060395 (= res!708238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060396 () Bool)

(declare-fun e!603701 () Bool)

(assert (=> b!1060396 (= e!603701 tp_is_empty!25039)))

(declare-fun res!708241 () Bool)

(assert (=> start!93744 (=> (not res!708241) (not e!603705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93744 (= res!708241 (validMask!0 mask!1515))))

(assert (=> start!93744 e!603705))

(assert (=> start!93744 true))

(assert (=> start!93744 tp_is_empty!25039))

(declare-datatypes ((V!38521 0))(
  ( (V!38522 (val!12570 Int)) )
))
(declare-datatypes ((ValueCell!11816 0))(
  ( (ValueCellFull!11816 (v!15180 V!38521)) (EmptyCell!11816) )
))
(declare-datatypes ((array!67099 0))(
  ( (array!67100 (arr!32258 (Array (_ BitVec 32) ValueCell!11816)) (size!32794 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67099)

(declare-fun e!603703 () Bool)

(declare-fun array_inv!24996 (array!67099) Bool)

(assert (=> start!93744 (and (array_inv!24996 _values!955) e!603703)))

(assert (=> start!93744 tp!75107))

(declare-fun array_inv!24997 (array!67097) Bool)

(assert (=> start!93744 (array_inv!24997 _keys!1163)))

(declare-fun mapNonEmpty!39226 () Bool)

(declare-fun mapRes!39226 () Bool)

(declare-fun tp!75106 () Bool)

(assert (=> mapNonEmpty!39226 (= mapRes!39226 (and tp!75106 e!603701))))

(declare-fun mapKey!39226 () (_ BitVec 32))

(declare-fun mapRest!39226 () (Array (_ BitVec 32) ValueCell!11816))

(declare-fun mapValue!39226 () ValueCell!11816)

(assert (=> mapNonEmpty!39226 (= (arr!32258 _values!955) (store mapRest!39226 mapKey!39226 mapValue!39226))))

(declare-fun mapIsEmpty!39226 () Bool)

(assert (=> mapIsEmpty!39226 mapRes!39226))

(declare-fun b!1060397 () Bool)

(assert (=> b!1060397 (= e!603705 (bvsgt #b00000000000000000000000000000000 (size!32793 _keys!1163)))))

(declare-fun zeroValueBefore!47 () V!38521)

(declare-datatypes ((tuple2!15886 0))(
  ( (tuple2!15887 (_1!7954 (_ BitVec 64)) (_2!7954 V!38521)) )
))
(declare-datatypes ((List!22473 0))(
  ( (Nil!22470) (Cons!22469 (h!23678 tuple2!15886) (t!31780 List!22473)) )
))
(declare-datatypes ((ListLongMap!13855 0))(
  ( (ListLongMap!13856 (toList!6943 List!22473)) )
))
(declare-fun lt!467263 () ListLongMap!13855)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38521)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3545 (array!67097 array!67099 (_ BitVec 32) (_ BitVec 32) V!38521 V!38521 (_ BitVec 32) Int) ListLongMap!13855)

(assert (=> b!1060397 (= lt!467263 (getCurrentListMapNoExtraKeys!3545 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060398 () Bool)

(declare-fun res!708239 () Bool)

(assert (=> b!1060398 (=> (not res!708239) (not e!603705))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060398 (= res!708239 (and (= (size!32794 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32793 _keys!1163) (size!32794 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060399 () Bool)

(assert (=> b!1060399 (= e!603703 (and e!603702 mapRes!39226))))

(declare-fun condMapEmpty!39226 () Bool)

(declare-fun mapDefault!39226 () ValueCell!11816)

