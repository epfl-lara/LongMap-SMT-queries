; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4206 () Bool)

(assert start!4206)

(declare-fun b_free!1111 () Bool)

(declare-fun b_next!1111 () Bool)

(assert (=> start!4206 (= b_free!1111 (not b_next!1111))))

(declare-fun tp!4752 () Bool)

(declare-fun b_and!1921 () Bool)

(assert (=> start!4206 (= tp!4752 b_and!1921)))

(declare-fun b!32037 () Bool)

(declare-fun e!20397 () Bool)

(declare-fun e!20396 () Bool)

(declare-fun mapRes!1726 () Bool)

(assert (=> b!32037 (= e!20397 (and e!20396 mapRes!1726))))

(declare-fun condMapEmpty!1726 () Bool)

(declare-datatypes ((V!1779 0))(
  ( (V!1780 (val!759 Int)) )
))
(declare-datatypes ((ValueCell!533 0))(
  ( (ValueCellFull!533 (v!1848 V!1779)) (EmptyCell!533) )
))
(declare-datatypes ((array!2143 0))(
  ( (array!2144 (arr!1025 (Array (_ BitVec 32) ValueCell!533)) (size!1126 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2143)

(declare-fun mapDefault!1726 () ValueCell!533)

