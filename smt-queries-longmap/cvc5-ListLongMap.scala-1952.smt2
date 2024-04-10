; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34458 () Bool)

(assert start!34458)

(declare-fun b_free!7381 () Bool)

(declare-fun b_next!7381 () Bool)

(assert (=> start!34458 (= b_free!7381 (not b_next!7381))))

(declare-fun tp!25689 () Bool)

(declare-fun b_and!14589 () Bool)

(assert (=> start!34458 (= tp!25689 b_and!14589)))

(declare-fun b!344191 () Bool)

(declare-fun res!190320 () Bool)

(declare-fun e!211013 () Bool)

(assert (=> b!344191 (=> (not res!190320) (not e!211013))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344191 (= res!190320 (validKeyInArray!0 k!1348))))

(declare-fun b!344192 () Bool)

(declare-fun e!211010 () Bool)

(declare-fun tp_is_empty!7333 () Bool)

(assert (=> b!344192 (= e!211010 tp_is_empty!7333)))

(declare-fun mapNonEmpty!12438 () Bool)

(declare-fun mapRes!12438 () Bool)

(declare-fun tp!25688 () Bool)

(declare-fun e!211011 () Bool)

(assert (=> mapNonEmpty!12438 (= mapRes!12438 (and tp!25688 e!211011))))

(declare-datatypes ((V!10755 0))(
  ( (V!10756 (val!3711 Int)) )
))
(declare-datatypes ((ValueCell!3323 0))(
  ( (ValueCellFull!3323 (v!5887 V!10755)) (EmptyCell!3323) )
))
(declare-fun mapRest!12438 () (Array (_ BitVec 32) ValueCell!3323))

(declare-fun mapValue!12438 () ValueCell!3323)

(declare-fun mapKey!12438 () (_ BitVec 32))

(declare-datatypes ((array!18257 0))(
  ( (array!18258 (arr!8645 (Array (_ BitVec 32) ValueCell!3323)) (size!8997 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18257)

(assert (=> mapNonEmpty!12438 (= (arr!8645 _values!1525) (store mapRest!12438 mapKey!12438 mapValue!12438))))

(declare-fun b!344194 () Bool)

(declare-fun res!190323 () Bool)

(assert (=> b!344194 (=> (not res!190323) (not e!211013))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10755)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18259 0))(
  ( (array!18260 (arr!8646 (Array (_ BitVec 32) (_ BitVec 64))) (size!8998 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18259)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10755)

(declare-datatypes ((tuple2!5372 0))(
  ( (tuple2!5373 (_1!2697 (_ BitVec 64)) (_2!2697 V!10755)) )
))
(declare-datatypes ((List!4993 0))(
  ( (Nil!4990) (Cons!4989 (h!5845 tuple2!5372) (t!10109 List!4993)) )
))
(declare-datatypes ((ListLongMap!4285 0))(
  ( (ListLongMap!4286 (toList!2158 List!4993)) )
))
(declare-fun contains!2216 (ListLongMap!4285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1679 (array!18259 array!18257 (_ BitVec 32) (_ BitVec 32) V!10755 V!10755 (_ BitVec 32) Int) ListLongMap!4285)

(assert (=> b!344194 (= res!190323 (not (contains!2216 (getCurrentListMap!1679 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344195 () Bool)

(assert (=> b!344195 (= e!211011 tp_is_empty!7333)))

(declare-fun b!344196 () Bool)

(declare-fun e!211014 () Bool)

(assert (=> b!344196 (= e!211014 (and e!211010 mapRes!12438))))

(declare-fun condMapEmpty!12438 () Bool)

(declare-fun mapDefault!12438 () ValueCell!3323)

