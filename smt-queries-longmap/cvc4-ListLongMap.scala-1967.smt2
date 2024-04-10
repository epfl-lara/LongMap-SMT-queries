; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34608 () Bool)

(assert start!34608)

(declare-fun b_free!7475 () Bool)

(declare-fun b_next!7475 () Bool)

(assert (=> start!34608 (= b_free!7475 (not b_next!7475))))

(declare-fun tp!25980 () Bool)

(declare-fun b_and!14689 () Bool)

(assert (=> start!34608 (= tp!25980 b_and!14689)))

(declare-fun mapNonEmpty!12588 () Bool)

(declare-fun mapRes!12588 () Bool)

(declare-fun tp!25979 () Bool)

(declare-fun e!211981 () Bool)

(assert (=> mapNonEmpty!12588 (= mapRes!12588 (and tp!25979 e!211981))))

(declare-fun mapKey!12588 () (_ BitVec 32))

(declare-datatypes ((V!10879 0))(
  ( (V!10880 (val!3758 Int)) )
))
(declare-datatypes ((ValueCell!3370 0))(
  ( (ValueCellFull!3370 (v!5937 V!10879)) (EmptyCell!3370) )
))
(declare-fun mapRest!12588 () (Array (_ BitVec 32) ValueCell!3370))

(declare-datatypes ((array!18441 0))(
  ( (array!18442 (arr!8734 (Array (_ BitVec 32) ValueCell!3370)) (size!9086 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18441)

(declare-fun mapValue!12588 () ValueCell!3370)

(assert (=> mapNonEmpty!12588 (= (arr!8734 _values!1525) (store mapRest!12588 mapKey!12588 mapValue!12588))))

(declare-fun b!345872 () Bool)

(declare-fun e!211984 () Bool)

(declare-fun tp_is_empty!7427 () Bool)

(assert (=> b!345872 (= e!211984 tp_is_empty!7427)))

(declare-fun b!345873 () Bool)

(declare-fun res!191339 () Bool)

(declare-fun e!211983 () Bool)

(assert (=> b!345873 (=> (not res!191339) (not e!211983))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10879)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10879)

(declare-datatypes ((array!18443 0))(
  ( (array!18444 (arr!8735 (Array (_ BitVec 32) (_ BitVec 64))) (size!9087 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18443)

(declare-datatypes ((tuple2!5434 0))(
  ( (tuple2!5435 (_1!2728 (_ BitVec 64)) (_2!2728 V!10879)) )
))
(declare-datatypes ((List!5058 0))(
  ( (Nil!5055) (Cons!5054 (h!5910 tuple2!5434) (t!10180 List!5058)) )
))
(declare-datatypes ((ListLongMap!4347 0))(
  ( (ListLongMap!4348 (toList!2189 List!5058)) )
))
(declare-fun contains!2250 (ListLongMap!4347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1710 (array!18443 array!18441 (_ BitVec 32) (_ BitVec 32) V!10879 V!10879 (_ BitVec 32) Int) ListLongMap!4347)

(assert (=> b!345873 (= res!191339 (not (contains!2250 (getCurrentListMap!1710 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!345874 () Bool)

(declare-fun e!211985 () Bool)

(assert (=> b!345874 (= e!211985 (and e!211984 mapRes!12588))))

(declare-fun condMapEmpty!12588 () Bool)

(declare-fun mapDefault!12588 () ValueCell!3370)

