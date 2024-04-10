; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93700 () Bool)

(assert start!93700)

(declare-fun b_free!21185 () Bool)

(declare-fun b_next!21185 () Bool)

(assert (=> start!93700 (= b_free!21185 (not b_next!21185))))

(declare-fun tp!74974 () Bool)

(declare-fun b_and!33895 () Bool)

(assert (=> start!93700 (= tp!74974 b_and!33895)))

(declare-fun mapNonEmpty!39160 () Bool)

(declare-fun mapRes!39160 () Bool)

(declare-fun tp!74975 () Bool)

(declare-fun e!603375 () Bool)

(assert (=> mapNonEmpty!39160 (= mapRes!39160 (and tp!74975 e!603375))))

(declare-datatypes ((V!38461 0))(
  ( (V!38462 (val!12548 Int)) )
))
(declare-datatypes ((ValueCell!11794 0))(
  ( (ValueCellFull!11794 (v!15158 V!38461)) (EmptyCell!11794) )
))
(declare-fun mapValue!39160 () ValueCell!11794)

(declare-datatypes ((array!67015 0))(
  ( (array!67016 (arr!32216 (Array (_ BitVec 32) ValueCell!11794)) (size!32752 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67015)

(declare-fun mapRest!39160 () (Array (_ BitVec 32) ValueCell!11794))

(declare-fun mapKey!39160 () (_ BitVec 32))

(assert (=> mapNonEmpty!39160 (= (arr!32216 _values!955) (store mapRest!39160 mapKey!39160 mapValue!39160))))

(declare-fun b!1059931 () Bool)

(declare-fun res!707976 () Bool)

(declare-fun e!603374 () Bool)

(assert (=> b!1059931 (=> (not res!707976) (not e!603374))))

(declare-datatypes ((array!67017 0))(
  ( (array!67018 (arr!32217 (Array (_ BitVec 32) (_ BitVec 64))) (size!32753 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67017)

(declare-datatypes ((List!22449 0))(
  ( (Nil!22446) (Cons!22445 (h!23654 (_ BitVec 64)) (t!31756 List!22449)) )
))
(declare-fun arrayNoDuplicates!0 (array!67017 (_ BitVec 32) List!22449) Bool)

(assert (=> b!1059931 (= res!707976 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22446))))

(declare-fun b!1059932 () Bool)

(declare-fun e!603372 () Bool)

(declare-fun e!603371 () Bool)

(assert (=> b!1059932 (= e!603372 (and e!603371 mapRes!39160))))

(declare-fun condMapEmpty!39160 () Bool)

(declare-fun mapDefault!39160 () ValueCell!11794)

