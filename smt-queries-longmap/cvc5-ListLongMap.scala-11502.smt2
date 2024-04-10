; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133858 () Bool)

(assert start!133858)

(declare-fun b_free!32119 () Bool)

(declare-fun b_next!32119 () Bool)

(assert (=> start!133858 (= b_free!32119 (not b_next!32119))))

(declare-fun tp!113653 () Bool)

(declare-fun b_and!51689 () Bool)

(assert (=> start!133858 (= tp!113653 b_and!51689)))

(declare-fun b!1564917 () Bool)

(declare-fun e!872260 () Bool)

(declare-fun e!872259 () Bool)

(declare-fun mapRes!59725 () Bool)

(assert (=> b!1564917 (= e!872260 (and e!872259 mapRes!59725))))

(declare-fun condMapEmpty!59725 () Bool)

(declare-datatypes ((V!60065 0))(
  ( (V!60066 (val!19530 Int)) )
))
(declare-datatypes ((ValueCell!18416 0))(
  ( (ValueCellFull!18416 (v!22284 V!60065)) (EmptyCell!18416) )
))
(declare-datatypes ((array!104476 0))(
  ( (array!104477 (arr!50427 (Array (_ BitVec 32) ValueCell!18416)) (size!50977 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104476)

(declare-fun mapDefault!59725 () ValueCell!18416)

