; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34488 () Bool)

(assert start!34488)

(declare-fun b_free!7411 () Bool)

(declare-fun b_next!7411 () Bool)

(assert (=> start!34488 (= b_free!7411 (not b_next!7411))))

(declare-fun tp!25779 () Bool)

(declare-fun b_and!14619 () Bool)

(assert (=> start!34488 (= tp!25779 b_and!14619)))

(declare-fun b!344596 () Bool)

(declare-fun e!211239 () Bool)

(declare-fun tp_is_empty!7363 () Bool)

(assert (=> b!344596 (= e!211239 tp_is_empty!7363)))

(declare-fun mapIsEmpty!12483 () Bool)

(declare-fun mapRes!12483 () Bool)

(assert (=> mapIsEmpty!12483 mapRes!12483))

(declare-fun b!344597 () Bool)

(declare-fun res!190592 () Bool)

(declare-fun e!211236 () Bool)

(assert (=> b!344597 (=> (not res!190592) (not e!211236))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10795 0))(
  ( (V!10796 (val!3726 Int)) )
))
(declare-fun zeroValue!1467 () V!10795)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18313 0))(
  ( (array!18314 (arr!8673 (Array (_ BitVec 32) (_ BitVec 64))) (size!9025 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18313)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10795)

(declare-datatypes ((ValueCell!3338 0))(
  ( (ValueCellFull!3338 (v!5902 V!10795)) (EmptyCell!3338) )
))
(declare-datatypes ((array!18315 0))(
  ( (array!18316 (arr!8674 (Array (_ BitVec 32) ValueCell!3338)) (size!9026 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18315)

(declare-datatypes ((tuple2!5394 0))(
  ( (tuple2!5395 (_1!2708 (_ BitVec 64)) (_2!2708 V!10795)) )
))
(declare-datatypes ((List!5016 0))(
  ( (Nil!5013) (Cons!5012 (h!5868 tuple2!5394) (t!10132 List!5016)) )
))
(declare-datatypes ((ListLongMap!4307 0))(
  ( (ListLongMap!4308 (toList!2169 List!5016)) )
))
(declare-fun contains!2227 (ListLongMap!4307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1690 (array!18313 array!18315 (_ BitVec 32) (_ BitVec 32) V!10795 V!10795 (_ BitVec 32) Int) ListLongMap!4307)

(assert (=> b!344597 (= res!190592 (not (contains!2227 (getCurrentListMap!1690 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344598 () Bool)

(declare-fun res!190595 () Bool)

(assert (=> b!344598 (=> (not res!190595) (not e!211236))))

(assert (=> b!344598 (= res!190595 (and (= (size!9026 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9025 _keys!1895) (size!9026 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344599 () Bool)

(declare-fun e!211238 () Bool)

(declare-fun e!211237 () Bool)

(assert (=> b!344599 (= e!211238 (and e!211237 mapRes!12483))))

(declare-fun condMapEmpty!12483 () Bool)

(declare-fun mapDefault!12483 () ValueCell!3338)

