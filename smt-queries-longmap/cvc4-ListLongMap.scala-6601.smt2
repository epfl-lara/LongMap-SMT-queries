; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83494 () Bool)

(assert start!83494)

(declare-fun b_free!19481 () Bool)

(declare-fun b_next!19481 () Bool)

(assert (=> start!83494 (= b_free!19481 (not b_next!19481))))

(declare-fun tp!67730 () Bool)

(declare-fun b_and!31083 () Bool)

(assert (=> start!83494 (= tp!67730 b_and!31083)))

(declare-fun b!975367 () Bool)

(declare-fun res!652929 () Bool)

(declare-fun e!549715 () Bool)

(assert (=> b!975367 (=> (not res!652929) (not e!549715))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34829 0))(
  ( (V!34830 (val!11243 Int)) )
))
(declare-datatypes ((ValueCell!10711 0))(
  ( (ValueCellFull!10711 (v!13802 V!34829)) (EmptyCell!10711) )
))
(declare-datatypes ((array!60801 0))(
  ( (array!60802 (arr!29264 (Array (_ BitVec 32) ValueCell!10711)) (size!29743 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60801)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60803 0))(
  ( (array!60804 (arr!29265 (Array (_ BitVec 32) (_ BitVec 64))) (size!29744 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60803)

(assert (=> b!975367 (= res!652929 (and (= (size!29743 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29744 _keys!1717) (size!29743 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975368 () Bool)

(declare-fun res!652933 () Bool)

(assert (=> b!975368 (=> (not res!652933) (not e!549715))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975368 (= res!652933 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29744 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29744 _keys!1717))))))

(declare-fun res!652934 () Bool)

(assert (=> start!83494 (=> (not res!652934) (not e!549715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83494 (= res!652934 (validMask!0 mask!2147))))

(assert (=> start!83494 e!549715))

(assert (=> start!83494 true))

(declare-fun e!549711 () Bool)

(declare-fun array_inv!22631 (array!60801) Bool)

(assert (=> start!83494 (and (array_inv!22631 _values!1425) e!549711)))

(declare-fun tp_is_empty!22385 () Bool)

(assert (=> start!83494 tp_is_empty!22385))

(assert (=> start!83494 tp!67730))

(declare-fun array_inv!22632 (array!60803) Bool)

(assert (=> start!83494 (array_inv!22632 _keys!1717)))

(declare-fun b!975369 () Bool)

(declare-fun e!549713 () Bool)

(assert (=> b!975369 (= e!549713 tp_is_empty!22385)))

(declare-fun b!975370 () Bool)

(declare-fun e!549712 () Bool)

(declare-fun mapRes!35587 () Bool)

(assert (=> b!975370 (= e!549711 (and e!549712 mapRes!35587))))

(declare-fun condMapEmpty!35587 () Bool)

(declare-fun mapDefault!35587 () ValueCell!10711)

