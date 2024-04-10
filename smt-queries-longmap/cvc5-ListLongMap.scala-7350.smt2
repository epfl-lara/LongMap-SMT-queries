; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93804 () Bool)

(assert start!93804)

(declare-fun b_free!21277 () Bool)

(declare-fun b_next!21277 () Bool)

(assert (=> start!93804 (= b_free!21277 (not b_next!21277))))

(declare-fun tp!75253 () Bool)

(declare-fun b_and!33991 () Bool)

(assert (=> start!93804 (= tp!75253 b_and!33991)))

(declare-fun mapNonEmpty!39301 () Bool)

(declare-fun mapRes!39301 () Bool)

(declare-fun tp!75254 () Bool)

(declare-fun e!604109 () Bool)

(assert (=> mapNonEmpty!39301 (= mapRes!39301 (and tp!75254 e!604109))))

(declare-fun mapKey!39301 () (_ BitVec 32))

(declare-datatypes ((V!38585 0))(
  ( (V!38586 (val!12594 Int)) )
))
(declare-datatypes ((ValueCell!11840 0))(
  ( (ValueCellFull!11840 (v!15204 V!38585)) (EmptyCell!11840) )
))
(declare-datatypes ((array!67183 0))(
  ( (array!67184 (arr!32299 (Array (_ BitVec 32) ValueCell!11840)) (size!32835 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67183)

(declare-fun mapRest!39301 () (Array (_ BitVec 32) ValueCell!11840))

(declare-fun mapValue!39301 () ValueCell!11840)

(assert (=> mapNonEmpty!39301 (= (arr!32299 _values!955) (store mapRest!39301 mapKey!39301 mapValue!39301))))

(declare-fun res!708553 () Bool)

(declare-fun e!604113 () Bool)

(assert (=> start!93804 (=> (not res!708553) (not e!604113))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93804 (= res!708553 (validMask!0 mask!1515))))

(assert (=> start!93804 e!604113))

(assert (=> start!93804 true))

(declare-fun tp_is_empty!25087 () Bool)

(assert (=> start!93804 tp_is_empty!25087))

(declare-fun e!604111 () Bool)

(declare-fun array_inv!25030 (array!67183) Bool)

(assert (=> start!93804 (and (array_inv!25030 _values!955) e!604111)))

(assert (=> start!93804 tp!75253))

(declare-datatypes ((array!67185 0))(
  ( (array!67186 (arr!32300 (Array (_ BitVec 32) (_ BitVec 64))) (size!32836 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67185)

(declare-fun array_inv!25031 (array!67185) Bool)

(assert (=> start!93804 (array_inv!25031 _keys!1163)))

(declare-fun mapIsEmpty!39301 () Bool)

(assert (=> mapIsEmpty!39301 mapRes!39301))

(declare-fun b!1060970 () Bool)

(declare-fun res!708555 () Bool)

(assert (=> b!1060970 (=> (not res!708555) (not e!604113))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060970 (= res!708555 (and (= (size!32835 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32836 _keys!1163) (size!32835 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060971 () Bool)

(declare-fun res!708554 () Bool)

(assert (=> b!1060971 (=> (not res!708554) (not e!604113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67185 (_ BitVec 32)) Bool)

(assert (=> b!1060971 (= res!708554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060972 () Bool)

(declare-fun e!604110 () Bool)

(assert (=> b!1060972 (= e!604110 tp_is_empty!25087)))

(declare-fun b!1060973 () Bool)

(assert (=> b!1060973 (= e!604113 false)))

(declare-fun minValue!907 () V!38585)

(declare-datatypes ((tuple2!15912 0))(
  ( (tuple2!15913 (_1!7967 (_ BitVec 64)) (_2!7967 V!38585)) )
))
(declare-datatypes ((List!22499 0))(
  ( (Nil!22496) (Cons!22495 (h!23704 tuple2!15912) (t!31808 List!22499)) )
))
(declare-datatypes ((ListLongMap!13881 0))(
  ( (ListLongMap!13882 (toList!6956 List!22499)) )
))
(declare-fun lt!467431 () ListLongMap!13881)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38585)

(declare-fun getCurrentListMapNoExtraKeys!3558 (array!67185 array!67183 (_ BitVec 32) (_ BitVec 32) V!38585 V!38585 (_ BitVec 32) Int) ListLongMap!13881)

(assert (=> b!1060973 (= lt!467431 (getCurrentListMapNoExtraKeys!3558 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38585)

(declare-fun lt!467430 () ListLongMap!13881)

(assert (=> b!1060973 (= lt!467430 (getCurrentListMapNoExtraKeys!3558 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060974 () Bool)

(declare-fun res!708556 () Bool)

(assert (=> b!1060974 (=> (not res!708556) (not e!604113))))

(declare-datatypes ((List!22500 0))(
  ( (Nil!22497) (Cons!22496 (h!23705 (_ BitVec 64)) (t!31809 List!22500)) )
))
(declare-fun arrayNoDuplicates!0 (array!67185 (_ BitVec 32) List!22500) Bool)

(assert (=> b!1060974 (= res!708556 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22497))))

(declare-fun b!1060975 () Bool)

(assert (=> b!1060975 (= e!604111 (and e!604110 mapRes!39301))))

(declare-fun condMapEmpty!39301 () Bool)

(declare-fun mapDefault!39301 () ValueCell!11840)

