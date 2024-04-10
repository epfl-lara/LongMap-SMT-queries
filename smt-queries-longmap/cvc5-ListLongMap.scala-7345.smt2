; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93774 () Bool)

(assert start!93774)

(declare-fun b_free!21247 () Bool)

(declare-fun b_next!21247 () Bool)

(assert (=> start!93774 (= b_free!21247 (not b_next!21247))))

(declare-fun tp!75164 () Bool)

(declare-fun b_and!33961 () Bool)

(assert (=> start!93774 (= tp!75164 b_and!33961)))

(declare-fun mapIsEmpty!39256 () Bool)

(declare-fun mapRes!39256 () Bool)

(assert (=> mapIsEmpty!39256 mapRes!39256))

(declare-fun mapNonEmpty!39256 () Bool)

(declare-fun tp!75163 () Bool)

(declare-fun e!603888 () Bool)

(assert (=> mapNonEmpty!39256 (= mapRes!39256 (and tp!75163 e!603888))))

(declare-fun mapKey!39256 () (_ BitVec 32))

(declare-datatypes ((V!38545 0))(
  ( (V!38546 (val!12579 Int)) )
))
(declare-datatypes ((ValueCell!11825 0))(
  ( (ValueCellFull!11825 (v!15189 V!38545)) (EmptyCell!11825) )
))
(declare-datatypes ((array!67131 0))(
  ( (array!67132 (arr!32273 (Array (_ BitVec 32) ValueCell!11825)) (size!32809 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67131)

(declare-fun mapRest!39256 () (Array (_ BitVec 32) ValueCell!11825))

(declare-fun mapValue!39256 () ValueCell!11825)

(assert (=> mapNonEmpty!39256 (= (arr!32273 _values!955) (store mapRest!39256 mapKey!39256 mapValue!39256))))

(declare-fun b!1060655 () Bool)

(declare-fun e!603886 () Bool)

(declare-fun e!603884 () Bool)

(assert (=> b!1060655 (= e!603886 (and e!603884 mapRes!39256))))

(declare-fun condMapEmpty!39256 () Bool)

(declare-fun mapDefault!39256 () ValueCell!11825)

