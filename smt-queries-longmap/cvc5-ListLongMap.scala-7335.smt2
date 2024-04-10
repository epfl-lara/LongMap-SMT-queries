; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93702 () Bool)

(assert start!93702)

(declare-fun b_free!21187 () Bool)

(declare-fun b_next!21187 () Bool)

(assert (=> start!93702 (= b_free!21187 (not b_next!21187))))

(declare-fun tp!74980 () Bool)

(declare-fun b_and!33897 () Bool)

(assert (=> start!93702 (= tp!74980 b_and!33897)))

(declare-fun b!1059952 () Bool)

(declare-fun e!603386 () Bool)

(declare-fun tp_is_empty!24997 () Bool)

(assert (=> b!1059952 (= e!603386 tp_is_empty!24997)))

(declare-fun b!1059953 () Bool)

(declare-fun res!707987 () Bool)

(declare-fun e!603390 () Bool)

(assert (=> b!1059953 (=> (not res!707987) (not e!603390))))

(declare-datatypes ((array!67019 0))(
  ( (array!67020 (arr!32218 (Array (_ BitVec 32) (_ BitVec 64))) (size!32754 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67019)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67019 (_ BitVec 32)) Bool)

(assert (=> b!1059953 (= res!707987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059954 () Bool)

(assert (=> b!1059954 (= e!603390 false)))

(declare-datatypes ((V!38465 0))(
  ( (V!38466 (val!12549 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38465)

(declare-datatypes ((tuple2!15862 0))(
  ( (tuple2!15863 (_1!7942 (_ BitVec 64)) (_2!7942 V!38465)) )
))
(declare-datatypes ((List!22450 0))(
  ( (Nil!22447) (Cons!22446 (h!23655 tuple2!15862) (t!31757 List!22450)) )
))
(declare-datatypes ((ListLongMap!13831 0))(
  ( (ListLongMap!13832 (toList!6931 List!22450)) )
))
(declare-fun lt!467200 () ListLongMap!13831)

(declare-datatypes ((ValueCell!11795 0))(
  ( (ValueCellFull!11795 (v!15159 V!38465)) (EmptyCell!11795) )
))
(declare-datatypes ((array!67021 0))(
  ( (array!67022 (arr!32219 (Array (_ BitVec 32) ValueCell!11795)) (size!32755 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67021)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38465)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3533 (array!67019 array!67021 (_ BitVec 32) (_ BitVec 32) V!38465 V!38465 (_ BitVec 32) Int) ListLongMap!13831)

(assert (=> b!1059954 (= lt!467200 (getCurrentListMapNoExtraKeys!3533 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059955 () Bool)

(declare-fun res!707989 () Bool)

(assert (=> b!1059955 (=> (not res!707989) (not e!603390))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059955 (= res!707989 (and (= (size!32755 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32754 _keys!1163) (size!32755 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!707988 () Bool)

(assert (=> start!93702 (=> (not res!707988) (not e!603390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93702 (= res!707988 (validMask!0 mask!1515))))

(assert (=> start!93702 e!603390))

(assert (=> start!93702 true))

(assert (=> start!93702 tp_is_empty!24997))

(declare-fun e!603389 () Bool)

(declare-fun array_inv!24970 (array!67021) Bool)

(assert (=> start!93702 (and (array_inv!24970 _values!955) e!603389)))

(assert (=> start!93702 tp!74980))

(declare-fun array_inv!24971 (array!67019) Bool)

(assert (=> start!93702 (array_inv!24971 _keys!1163)))

(declare-fun b!1059956 () Bool)

(declare-fun e!603387 () Bool)

(declare-fun mapRes!39163 () Bool)

(assert (=> b!1059956 (= e!603389 (and e!603387 mapRes!39163))))

(declare-fun condMapEmpty!39163 () Bool)

(declare-fun mapDefault!39163 () ValueCell!11795)

