; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82230 () Bool)

(assert start!82230)

(declare-fun b_free!18503 () Bool)

(declare-fun b_next!18503 () Bool)

(assert (=> start!82230 (= b_free!18503 (not b_next!18503))))

(declare-fun tp!64470 () Bool)

(declare-fun b_and!29991 () Bool)

(assert (=> start!82230 (= tp!64470 b_and!29991)))

(declare-fun mapIsEmpty!33793 () Bool)

(declare-fun mapRes!33793 () Bool)

(assert (=> mapIsEmpty!33793 mapRes!33793))

(declare-fun b!958469 () Bool)

(declare-fun e!540343 () Bool)

(declare-fun tp_is_empty!21209 () Bool)

(assert (=> b!958469 (= e!540343 tp_is_empty!21209)))

(declare-fun b!958470 () Bool)

(declare-fun e!540344 () Bool)

(assert (=> b!958470 (= e!540344 (and e!540343 mapRes!33793))))

(declare-fun condMapEmpty!33793 () Bool)

(declare-datatypes ((V!33261 0))(
  ( (V!33262 (val!10655 Int)) )
))
(declare-datatypes ((ValueCell!10123 0))(
  ( (ValueCellFull!10123 (v!13212 V!33261)) (EmptyCell!10123) )
))
(declare-datatypes ((array!58519 0))(
  ( (array!58520 (arr!28133 (Array (_ BitVec 32) ValueCell!10123)) (size!28612 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58519)

(declare-fun mapDefault!33793 () ValueCell!10123)

