; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79876 () Bool)

(assert start!79876)

(declare-fun b_free!17773 () Bool)

(declare-fun b_next!17773 () Bool)

(assert (=> start!79876 (= b_free!17773 (not b_next!17773))))

(declare-fun tp!61782 () Bool)

(declare-fun b_and!29185 () Bool)

(assert (=> start!79876 (= tp!61782 b_and!29185)))

(declare-fun b!939438 () Bool)

(declare-fun e!527667 () Bool)

(declare-fun e!527661 () Bool)

(declare-fun mapRes!32201 () Bool)

(assert (=> b!939438 (= e!527667 (and e!527661 mapRes!32201))))

(declare-fun condMapEmpty!32201 () Bool)

(declare-datatypes ((V!32007 0))(
  ( (V!32008 (val!10191 Int)) )
))
(declare-datatypes ((ValueCell!9659 0))(
  ( (ValueCellFull!9659 (v!12722 V!32007)) (EmptyCell!9659) )
))
(declare-datatypes ((array!56506 0))(
  ( (array!56507 (arr!27191 (Array (_ BitVec 32) ValueCell!9659)) (size!27650 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56506)

(declare-fun mapDefault!32201 () ValueCell!9659)

