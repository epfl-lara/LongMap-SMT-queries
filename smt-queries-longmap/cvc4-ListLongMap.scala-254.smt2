; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4210 () Bool)

(assert start!4210)

(declare-fun b_free!1115 () Bool)

(declare-fun b_next!1115 () Bool)

(assert (=> start!4210 (= b_free!1115 (not b_next!1115))))

(declare-fun tp!4765 () Bool)

(declare-fun b_and!1925 () Bool)

(assert (=> start!4210 (= tp!4765 b_and!1925)))

(declare-fun b!32097 () Bool)

(declare-fun e!20427 () Bool)

(declare-fun e!20428 () Bool)

(declare-fun mapRes!1732 () Bool)

(assert (=> b!32097 (= e!20427 (and e!20428 mapRes!1732))))

(declare-fun condMapEmpty!1732 () Bool)

(declare-datatypes ((V!1783 0))(
  ( (V!1784 (val!761 Int)) )
))
(declare-datatypes ((ValueCell!535 0))(
  ( (ValueCellFull!535 (v!1850 V!1783)) (EmptyCell!535) )
))
(declare-datatypes ((array!2149 0))(
  ( (array!2150 (arr!1028 (Array (_ BitVec 32) ValueCell!535)) (size!1129 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2149)

(declare-fun mapDefault!1732 () ValueCell!535)

