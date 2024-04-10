; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81944 () Bool)

(assert start!81944)

(declare-fun b!955879 () Bool)

(declare-fun e!538479 () Bool)

(declare-fun e!538483 () Bool)

(declare-fun mapRes!33436 () Bool)

(assert (=> b!955879 (= e!538479 (and e!538483 mapRes!33436))))

(declare-fun condMapEmpty!33436 () Bool)

(declare-datatypes ((V!32961 0))(
  ( (V!32962 (val!10542 Int)) )
))
(declare-datatypes ((ValueCell!10010 0))(
  ( (ValueCellFull!10010 (v!13097 V!32961)) (EmptyCell!10010) )
))
(declare-datatypes ((array!58069 0))(
  ( (array!58070 (arr!27914 (Array (_ BitVec 32) ValueCell!10010)) (size!28393 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58069)

(declare-fun mapDefault!33436 () ValueCell!10010)

