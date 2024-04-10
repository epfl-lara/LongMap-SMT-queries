; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33974 () Bool)

(assert start!33974)

(declare-fun b_free!7105 () Bool)

(declare-fun b_next!7105 () Bool)

(assert (=> start!33974 (= b_free!7105 (not b_next!7105))))

(declare-fun tp!24833 () Bool)

(declare-fun b_and!14295 () Bool)

(assert (=> start!33974 (= tp!24833 b_and!14295)))

(declare-fun b!338368 () Bool)

(declare-fun res!186905 () Bool)

(declare-fun e!207616 () Bool)

(assert (=> b!338368 (=> (not res!186905) (not e!207616))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10387 0))(
  ( (V!10388 (val!3573 Int)) )
))
(declare-fun zeroValue!1467 () V!10387)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3185 0))(
  ( (ValueCellFull!3185 (v!5740 V!10387)) (EmptyCell!3185) )
))
(declare-datatypes ((array!17709 0))(
  ( (array!17710 (arr!8380 (Array (_ BitVec 32) ValueCell!3185)) (size!8732 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17709)

(declare-datatypes ((array!17711 0))(
  ( (array!17712 (arr!8381 (Array (_ BitVec 32) (_ BitVec 64))) (size!8733 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17711)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10387)

(declare-datatypes ((tuple2!5190 0))(
  ( (tuple2!5191 (_1!2606 (_ BitVec 64)) (_2!2606 V!10387)) )
))
(declare-datatypes ((List!4806 0))(
  ( (Nil!4803) (Cons!4802 (h!5658 tuple2!5190) (t!9904 List!4806)) )
))
(declare-datatypes ((ListLongMap!4103 0))(
  ( (ListLongMap!4104 (toList!2067 List!4806)) )
))
(declare-fun contains!2116 (ListLongMap!4103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1588 (array!17711 array!17709 (_ BitVec 32) (_ BitVec 32) V!10387 V!10387 (_ BitVec 32) Int) ListLongMap!4103)

(assert (=> b!338368 (= res!186905 (not (contains!2116 (getCurrentListMap!1588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!338369 () Bool)

(declare-fun e!207615 () Bool)

(declare-fun tp_is_empty!7057 () Bool)

(assert (=> b!338369 (= e!207615 tp_is_empty!7057)))

(declare-fun b!338370 () Bool)

(declare-fun e!207621 () Bool)

(declare-fun mapRes!11997 () Bool)

(assert (=> b!338370 (= e!207621 (and e!207615 mapRes!11997))))

(declare-fun condMapEmpty!11997 () Bool)

(declare-fun mapDefault!11997 () ValueCell!3185)

