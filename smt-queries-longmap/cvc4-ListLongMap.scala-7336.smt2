; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93712 () Bool)

(assert start!93712)

(declare-fun b_free!21197 () Bool)

(declare-fun b_next!21197 () Bool)

(assert (=> start!93712 (= b_free!21197 (not b_next!21197))))

(declare-fun tp!75010 () Bool)

(declare-fun b_and!33907 () Bool)

(assert (=> start!93712 (= tp!75010 b_and!33907)))

(declare-fun res!708048 () Bool)

(declare-fun e!603464 () Bool)

(assert (=> start!93712 (=> (not res!708048) (not e!603464))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93712 (= res!708048 (validMask!0 mask!1515))))

(assert (=> start!93712 e!603464))

(assert (=> start!93712 true))

(declare-fun tp_is_empty!25007 () Bool)

(assert (=> start!93712 tp_is_empty!25007))

(declare-datatypes ((V!38477 0))(
  ( (V!38478 (val!12554 Int)) )
))
(declare-datatypes ((ValueCell!11800 0))(
  ( (ValueCellFull!11800 (v!15164 V!38477)) (EmptyCell!11800) )
))
(declare-datatypes ((array!67037 0))(
  ( (array!67038 (arr!32227 (Array (_ BitVec 32) ValueCell!11800)) (size!32763 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67037)

(declare-fun e!603465 () Bool)

(declare-fun array_inv!24976 (array!67037) Bool)

(assert (=> start!93712 (and (array_inv!24976 _values!955) e!603465)))

(assert (=> start!93712 tp!75010))

(declare-datatypes ((array!67039 0))(
  ( (array!67040 (arr!32228 (Array (_ BitVec 32) (_ BitVec 64))) (size!32764 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67039)

(declare-fun array_inv!24977 (array!67039) Bool)

(assert (=> start!93712 (array_inv!24977 _keys!1163)))

(declare-fun mapIsEmpty!39178 () Bool)

(declare-fun mapRes!39178 () Bool)

(assert (=> mapIsEmpty!39178 mapRes!39178))

(declare-fun b!1060057 () Bool)

(declare-fun res!708049 () Bool)

(assert (=> b!1060057 (=> (not res!708049) (not e!603464))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060057 (= res!708049 (and (= (size!32763 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32764 _keys!1163) (size!32763 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060058 () Bool)

(declare-fun e!603463 () Bool)

(assert (=> b!1060058 (= e!603463 tp_is_empty!25007)))

(declare-fun b!1060059 () Bool)

(declare-fun res!708047 () Bool)

(assert (=> b!1060059 (=> (not res!708047) (not e!603464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67039 (_ BitVec 32)) Bool)

(assert (=> b!1060059 (= res!708047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060060 () Bool)

(assert (=> b!1060060 (= e!603465 (and e!603463 mapRes!39178))))

(declare-fun condMapEmpty!39178 () Bool)

(declare-fun mapDefault!39178 () ValueCell!11800)

