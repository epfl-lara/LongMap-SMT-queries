; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34242 () Bool)

(assert start!34242)

(declare-fun b_free!7265 () Bool)

(declare-fun b_next!7265 () Bool)

(assert (=> start!34242 (= b_free!7265 (not b_next!7265))))

(declare-fun tp!25329 () Bool)

(declare-fun b_and!14465 () Bool)

(assert (=> start!34242 (= tp!25329 b_and!14465)))

(declare-fun b!341733 () Bool)

(declare-fun res!188936 () Bool)

(declare-fun e!209562 () Bool)

(assert (=> b!341733 (=> (not res!188936) (not e!209562))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10599 0))(
  ( (V!10600 (val!3653 Int)) )
))
(declare-datatypes ((ValueCell!3265 0))(
  ( (ValueCellFull!3265 (v!5825 V!10599)) (EmptyCell!3265) )
))
(declare-datatypes ((array!18027 0))(
  ( (array!18028 (arr!8534 (Array (_ BitVec 32) ValueCell!3265)) (size!8886 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18027)

(declare-datatypes ((array!18029 0))(
  ( (array!18030 (arr!8535 (Array (_ BitVec 32) (_ BitVec 64))) (size!8887 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18029)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341733 (= res!188936 (and (= (size!8886 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8887 _keys!1895) (size!8886 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341734 () Bool)

(declare-fun e!209568 () Bool)

(declare-fun tp_is_empty!7217 () Bool)

(assert (=> b!341734 (= e!209568 tp_is_empty!7217)))

(declare-fun b!341735 () Bool)

(declare-fun res!188938 () Bool)

(assert (=> b!341735 (=> (not res!188938) (not e!209562))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10599)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10599)

(declare-datatypes ((tuple2!5292 0))(
  ( (tuple2!5293 (_1!2657 (_ BitVec 64)) (_2!2657 V!10599)) )
))
(declare-datatypes ((List!4911 0))(
  ( (Nil!4908) (Cons!4907 (h!5763 tuple2!5292) (t!10019 List!4911)) )
))
(declare-datatypes ((ListLongMap!4205 0))(
  ( (ListLongMap!4206 (toList!2118 List!4911)) )
))
(declare-fun contains!2172 (ListLongMap!4205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1639 (array!18029 array!18027 (_ BitVec 32) (_ BitVec 32) V!10599 V!10599 (_ BitVec 32) Int) ListLongMap!4205)

(assert (=> b!341735 (= res!188938 (not (contains!2172 (getCurrentListMap!1639 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12252 () Bool)

(declare-fun mapRes!12252 () Bool)

(assert (=> mapIsEmpty!12252 mapRes!12252))

(declare-fun res!188941 () Bool)

(assert (=> start!34242 (=> (not res!188941) (not e!209562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34242 (= res!188941 (validMask!0 mask!2385))))

(assert (=> start!34242 e!209562))

(assert (=> start!34242 true))

(assert (=> start!34242 tp_is_empty!7217))

(assert (=> start!34242 tp!25329))

(declare-fun e!209564 () Bool)

(declare-fun array_inv!6316 (array!18027) Bool)

(assert (=> start!34242 (and (array_inv!6316 _values!1525) e!209564)))

(declare-fun array_inv!6317 (array!18029) Bool)

(assert (=> start!34242 (array_inv!6317 _keys!1895)))

(declare-fun b!341736 () Bool)

(assert (=> b!341736 (= e!209564 (and e!209568 mapRes!12252))))

(declare-fun condMapEmpty!12252 () Bool)

(declare-fun mapDefault!12252 () ValueCell!3265)

