; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99182 () Bool)

(assert start!99182)

(declare-fun b_free!24787 () Bool)

(declare-fun b_next!24787 () Bool)

(assert (=> start!99182 (= b_free!24787 (not b_next!24787))))

(declare-fun tp!87071 () Bool)

(declare-fun b_and!40423 () Bool)

(assert (=> start!99182 (= tp!87071 b_and!40423)))

(declare-fun mapNonEmpty!45800 () Bool)

(declare-fun mapRes!45800 () Bool)

(declare-fun tp!87072 () Bool)

(declare-fun e!663606 () Bool)

(assert (=> mapNonEmpty!45800 (= mapRes!45800 (and tp!87072 e!663606))))

(declare-datatypes ((V!44217 0))(
  ( (V!44218 (val!14715 Int)) )
))
(declare-datatypes ((ValueCell!13949 0))(
  ( (ValueCellFull!13949 (v!17352 V!44217)) (EmptyCell!13949) )
))
(declare-fun mapValue!45800 () ValueCell!13949)

(declare-datatypes ((array!75461 0))(
  ( (array!75462 (arr!36381 (Array (_ BitVec 32) ValueCell!13949)) (size!36917 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75461)

(declare-fun mapKey!45800 () (_ BitVec 32))

(declare-fun mapRest!45800 () (Array (_ BitVec 32) ValueCell!13949))

(assert (=> mapNonEmpty!45800 (= (arr!36381 _values!996) (store mapRest!45800 mapKey!45800 mapValue!45800))))

(declare-fun mapIsEmpty!45800 () Bool)

(assert (=> mapIsEmpty!45800 mapRes!45800))

(declare-fun b!1167548 () Bool)

(declare-fun e!663609 () Bool)

(declare-fun e!663602 () Bool)

(assert (=> b!1167548 (= e!663609 (and e!663602 mapRes!45800))))

(declare-fun condMapEmpty!45800 () Bool)

(declare-fun mapDefault!45800 () ValueCell!13949)

