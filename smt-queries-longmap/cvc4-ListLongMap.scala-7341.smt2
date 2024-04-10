; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93742 () Bool)

(assert start!93742)

(declare-fun b_free!21227 () Bool)

(declare-fun b_next!21227 () Bool)

(assert (=> start!93742 (= b_free!21227 (not b_next!21227))))

(declare-fun tp!75100 () Bool)

(declare-fun b_and!33937 () Bool)

(assert (=> start!93742 (= tp!75100 b_and!33937)))

(declare-fun b!1060372 () Bool)

(declare-fun res!708228 () Bool)

(declare-fun e!603686 () Bool)

(assert (=> b!1060372 (=> (not res!708228) (not e!603686))))

(declare-datatypes ((array!67093 0))(
  ( (array!67094 (arr!32255 (Array (_ BitVec 32) (_ BitVec 64))) (size!32791 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67093)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67093 (_ BitVec 32)) Bool)

(assert (=> b!1060372 (= res!708228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060373 () Bool)

(declare-fun e!603689 () Bool)

(declare-fun tp_is_empty!25037 () Bool)

(assert (=> b!1060373 (= e!603689 tp_is_empty!25037)))

(declare-fun b!1060374 () Bool)

(declare-fun e!603687 () Bool)

(declare-fun mapRes!39223 () Bool)

(assert (=> b!1060374 (= e!603687 (and e!603689 mapRes!39223))))

(declare-fun condMapEmpty!39223 () Bool)

(declare-datatypes ((V!38517 0))(
  ( (V!38518 (val!12569 Int)) )
))
(declare-datatypes ((ValueCell!11815 0))(
  ( (ValueCellFull!11815 (v!15179 V!38517)) (EmptyCell!11815) )
))
(declare-datatypes ((array!67095 0))(
  ( (array!67096 (arr!32256 (Array (_ BitVec 32) ValueCell!11815)) (size!32792 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67095)

(declare-fun mapDefault!39223 () ValueCell!11815)

