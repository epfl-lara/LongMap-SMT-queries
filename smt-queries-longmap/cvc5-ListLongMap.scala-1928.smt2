; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34214 () Bool)

(assert start!34214)

(declare-fun b_free!7237 () Bool)

(declare-fun b_next!7237 () Bool)

(assert (=> start!34214 (= b_free!7237 (not b_next!7237))))

(declare-fun tp!25244 () Bool)

(declare-fun b_and!14437 () Bool)

(assert (=> start!34214 (= tp!25244 b_and!14437)))

(declare-fun mapIsEmpty!12210 () Bool)

(declare-fun mapRes!12210 () Bool)

(assert (=> mapIsEmpty!12210 mapRes!12210))

(declare-fun b!341254 () Bool)

(declare-fun e!209298 () Bool)

(declare-fun tp_is_empty!7189 () Bool)

(assert (=> b!341254 (= e!209298 tp_is_empty!7189)))

(declare-fun b!341255 () Bool)

(declare-fun res!188622 () Bool)

(declare-fun e!209295 () Bool)

(assert (=> b!341255 (=> (not res!188622) (not e!209295))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10563 0))(
  ( (V!10564 (val!3639 Int)) )
))
(declare-fun zeroValue!1467 () V!10563)

(declare-datatypes ((ValueCell!3251 0))(
  ( (ValueCellFull!3251 (v!5811 V!10563)) (EmptyCell!3251) )
))
(declare-datatypes ((array!17973 0))(
  ( (array!17974 (arr!8507 (Array (_ BitVec 32) ValueCell!3251)) (size!8859 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17973)

(declare-datatypes ((array!17975 0))(
  ( (array!17976 (arr!8508 (Array (_ BitVec 32) (_ BitVec 64))) (size!8860 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17975)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10563)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5278 0))(
  ( (tuple2!5279 (_1!2650 (_ BitVec 64)) (_2!2650 V!10563)) )
))
(declare-datatypes ((List!4895 0))(
  ( (Nil!4892) (Cons!4891 (h!5747 tuple2!5278) (t!10003 List!4895)) )
))
(declare-datatypes ((ListLongMap!4191 0))(
  ( (ListLongMap!4192 (toList!2111 List!4895)) )
))
(declare-fun contains!2165 (ListLongMap!4191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1632 (array!17975 array!17973 (_ BitVec 32) (_ BitVec 32) V!10563 V!10563 (_ BitVec 32) Int) ListLongMap!4191)

(assert (=> b!341255 (= res!188622 (not (contains!2165 (getCurrentListMap!1632 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!341256 () Bool)

(declare-fun e!209296 () Bool)

(assert (=> b!341256 (= e!209296 (and e!209298 mapRes!12210))))

(declare-fun condMapEmpty!12210 () Bool)

(declare-fun mapDefault!12210 () ValueCell!3251)

