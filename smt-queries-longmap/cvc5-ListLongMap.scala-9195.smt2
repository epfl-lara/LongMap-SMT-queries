; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110518 () Bool)

(assert start!110518)

(declare-fun b_free!29353 () Bool)

(declare-fun b_next!29353 () Bool)

(assert (=> start!110518 (= b_free!29353 (not b_next!29353))))

(declare-fun tp!103381 () Bool)

(declare-fun b_and!47561 () Bool)

(assert (=> start!110518 (= tp!103381 b_and!47561)))

(declare-fun b!1307375 () Bool)

(declare-fun e!746011 () Bool)

(declare-fun e!746010 () Bool)

(declare-fun mapRes!54253 () Bool)

(assert (=> b!1307375 (= e!746011 (and e!746010 mapRes!54253))))

(declare-fun condMapEmpty!54253 () Bool)

(declare-datatypes ((V!51881 0))(
  ( (V!51882 (val!17616 Int)) )
))
(declare-datatypes ((ValueCell!16643 0))(
  ( (ValueCellFull!16643 (v!20243 V!51881)) (EmptyCell!16643) )
))
(declare-datatypes ((array!87170 0))(
  ( (array!87171 (arr!42065 (Array (_ BitVec 32) ValueCell!16643)) (size!42615 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87170)

(declare-fun mapDefault!54253 () ValueCell!16643)

