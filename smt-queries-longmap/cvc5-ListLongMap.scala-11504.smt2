; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133870 () Bool)

(assert start!133870)

(declare-fun b_free!32131 () Bool)

(declare-fun b_next!32131 () Bool)

(assert (=> start!133870 (= b_free!32131 (not b_next!32131))))

(declare-fun tp!113689 () Bool)

(declare-fun b_and!51701 () Bool)

(assert (=> start!133870 (= tp!113689 b_and!51701)))

(declare-fun b!1565081 () Bool)

(declare-fun e!872348 () Bool)

(declare-fun e!872350 () Bool)

(declare-fun mapRes!59743 () Bool)

(assert (=> b!1565081 (= e!872348 (and e!872350 mapRes!59743))))

(declare-fun condMapEmpty!59743 () Bool)

(declare-datatypes ((V!60081 0))(
  ( (V!60082 (val!19536 Int)) )
))
(declare-datatypes ((ValueCell!18422 0))(
  ( (ValueCellFull!18422 (v!22290 V!60081)) (EmptyCell!18422) )
))
(declare-datatypes ((array!104498 0))(
  ( (array!104499 (arr!50438 (Array (_ BitVec 32) ValueCell!18422)) (size!50988 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104498)

(declare-fun mapDefault!59743 () ValueCell!18422)

