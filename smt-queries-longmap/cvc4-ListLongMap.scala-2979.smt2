; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42154 () Bool)

(assert start!42154)

(declare-fun b_free!11687 () Bool)

(declare-fun b_next!11687 () Bool)

(assert (=> start!42154 (= b_free!11687 (not b_next!11687))))

(declare-fun tp!41082 () Bool)

(declare-fun b_and!20109 () Bool)

(assert (=> start!42154 (= tp!41082 b_and!20109)))

(declare-fun b!470594 () Bool)

(declare-fun e!275708 () Bool)

(declare-fun e!275709 () Bool)

(declare-fun mapRes!21373 () Bool)

(assert (=> b!470594 (= e!275708 (and e!275709 mapRes!21373))))

(declare-fun condMapEmpty!21373 () Bool)

(declare-datatypes ((V!18591 0))(
  ( (V!18592 (val!6602 Int)) )
))
(declare-datatypes ((ValueCell!6214 0))(
  ( (ValueCellFull!6214 (v!8893 V!18591)) (EmptyCell!6214) )
))
(declare-datatypes ((array!29999 0))(
  ( (array!30000 (arr!14423 (Array (_ BitVec 32) ValueCell!6214)) (size!14775 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29999)

(declare-fun mapDefault!21373 () ValueCell!6214)

