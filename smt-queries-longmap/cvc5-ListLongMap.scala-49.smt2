; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!806 () Bool)

(assert start!806)

(declare-fun b_free!199 () Bool)

(declare-fun b_next!199 () Bool)

(assert (=> start!806 (= b_free!199 (not b_next!199))))

(declare-fun tp!827 () Bool)

(declare-fun b_and!345 () Bool)

(assert (=> start!806 (= tp!827 b_and!345)))

(declare-fun b!6048 () Bool)

(declare-fun res!6583 () Bool)

(declare-fun e!3304 () Bool)

(assert (=> b!6048 (=> (not res!6583) (not e!3304))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!547 0))(
  ( (V!548 (val!144 Int)) )
))
(declare-datatypes ((ValueCell!122 0))(
  ( (ValueCellFull!122 (v!1235 V!547)) (EmptyCell!122) )
))
(declare-datatypes ((array!487 0))(
  ( (array!488 (arr!232 (Array (_ BitVec 32) ValueCell!122)) (size!294 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!487)

(declare-datatypes ((array!489 0))(
  ( (array!490 (arr!233 (Array (_ BitVec 32) (_ BitVec 64))) (size!295 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!489)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!547)

(declare-fun minValue!1434 () V!547)

(declare-datatypes ((tuple2!144 0))(
  ( (tuple2!145 (_1!72 (_ BitVec 64)) (_2!72 V!547)) )
))
(declare-datatypes ((List!155 0))(
  ( (Nil!152) (Cons!151 (h!717 tuple2!144) (t!2290 List!155)) )
))
(declare-datatypes ((ListLongMap!149 0))(
  ( (ListLongMap!150 (toList!90 List!155)) )
))
(declare-fun contains!64 (ListLongMap!149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!49 (array!489 array!487 (_ BitVec 32) (_ BitVec 32) V!547 V!547 (_ BitVec 32) Int) ListLongMap!149)

(assert (=> b!6048 (= res!6583 (contains!64 (getCurrentListMap!49 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6049 () Bool)

(declare-fun res!6581 () Bool)

(assert (=> b!6049 (=> (not res!6581) (not e!3304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6049 (= res!6581 (validKeyInArray!0 k!1278))))

(declare-fun mapNonEmpty!386 () Bool)

(declare-fun mapRes!386 () Bool)

(declare-fun tp!826 () Bool)

(declare-fun e!3301 () Bool)

(assert (=> mapNonEmpty!386 (= mapRes!386 (and tp!826 e!3301))))

(declare-fun mapValue!386 () ValueCell!122)

(declare-fun mapKey!386 () (_ BitVec 32))

(declare-fun mapRest!386 () (Array (_ BitVec 32) ValueCell!122))

(assert (=> mapNonEmpty!386 (= (arr!232 _values!1492) (store mapRest!386 mapKey!386 mapValue!386))))

(declare-fun b!6050 () Bool)

(declare-fun e!3305 () Bool)

(assert (=> b!6050 (= e!3305 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6051 () Bool)

(declare-fun e!3299 () Bool)

(declare-fun e!3300 () Bool)

(assert (=> b!6051 (= e!3299 (and e!3300 mapRes!386))))

(declare-fun condMapEmpty!386 () Bool)

(declare-fun mapDefault!386 () ValueCell!122)

