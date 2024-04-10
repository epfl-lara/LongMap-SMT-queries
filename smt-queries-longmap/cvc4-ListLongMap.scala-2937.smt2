; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41832 () Bool)

(assert start!41832)

(declare-fun b_free!11435 () Bool)

(declare-fun b_next!11435 () Bool)

(assert (=> start!41832 (= b_free!11435 (not b_next!11435))))

(declare-fun tp!40314 () Bool)

(declare-fun b_and!19815 () Bool)

(assert (=> start!41832 (= tp!40314 b_and!19815)))

(declare-fun mapNonEmpty!20983 () Bool)

(declare-fun mapRes!20983 () Bool)

(declare-fun tp!40315 () Bool)

(declare-fun e!273200 () Bool)

(assert (=> mapNonEmpty!20983 (= mapRes!20983 (and tp!40315 e!273200))))

(declare-datatypes ((V!18255 0))(
  ( (V!18256 (val!6476 Int)) )
))
(declare-datatypes ((ValueCell!6088 0))(
  ( (ValueCellFull!6088 (v!8765 V!18255)) (EmptyCell!6088) )
))
(declare-fun mapRest!20983 () (Array (_ BitVec 32) ValueCell!6088))

(declare-fun mapValue!20983 () ValueCell!6088)

(declare-datatypes ((array!29509 0))(
  ( (array!29510 (arr!14182 (Array (_ BitVec 32) ValueCell!6088)) (size!14534 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29509)

(declare-fun mapKey!20983 () (_ BitVec 32))

(assert (=> mapNonEmpty!20983 (= (arr!14182 _values!833) (store mapRest!20983 mapKey!20983 mapValue!20983))))

(declare-fun b!467114 () Bool)

(declare-fun e!273202 () Bool)

(declare-fun e!273203 () Bool)

(assert (=> b!467114 (= e!273202 (and e!273203 mapRes!20983))))

(declare-fun condMapEmpty!20983 () Bool)

(declare-fun mapDefault!20983 () ValueCell!6088)

