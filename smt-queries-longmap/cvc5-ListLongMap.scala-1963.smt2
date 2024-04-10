; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34524 () Bool)

(assert start!34524)

(declare-fun b_free!7447 () Bool)

(declare-fun b_next!7447 () Bool)

(assert (=> start!34524 (= b_free!7447 (not b_next!7447))))

(declare-fun tp!25887 () Bool)

(declare-fun b_and!14655 () Bool)

(assert (=> start!34524 (= tp!25887 b_and!14655)))

(declare-fun b!345082 () Bool)

(declare-fun e!211506 () Bool)

(declare-fun tp_is_empty!7399 () Bool)

(assert (=> b!345082 (= e!211506 tp_is_empty!7399)))

(declare-fun b!345083 () Bool)

(declare-fun res!190917 () Bool)

(declare-fun e!211509 () Bool)

(assert (=> b!345083 (=> (not res!190917) (not e!211509))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10843 0))(
  ( (V!10844 (val!3744 Int)) )
))
(declare-fun zeroValue!1467 () V!10843)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3356 0))(
  ( (ValueCellFull!3356 (v!5920 V!10843)) (EmptyCell!3356) )
))
(declare-datatypes ((array!18381 0))(
  ( (array!18382 (arr!8707 (Array (_ BitVec 32) ValueCell!3356)) (size!9059 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18381)

(declare-datatypes ((array!18383 0))(
  ( (array!18384 (arr!8708 (Array (_ BitVec 32) (_ BitVec 64))) (size!9060 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18383)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10843)

(declare-datatypes ((tuple2!5412 0))(
  ( (tuple2!5413 (_1!2717 (_ BitVec 64)) (_2!2717 V!10843)) )
))
(declare-datatypes ((List!5036 0))(
  ( (Nil!5033) (Cons!5032 (h!5888 tuple2!5412) (t!10152 List!5036)) )
))
(declare-datatypes ((ListLongMap!4325 0))(
  ( (ListLongMap!4326 (toList!2178 List!5036)) )
))
(declare-fun contains!2236 (ListLongMap!4325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1699 (array!18383 array!18381 (_ BitVec 32) (_ BitVec 32) V!10843 V!10843 (_ BitVec 32) Int) ListLongMap!4325)

(assert (=> b!345083 (= res!190917 (not (contains!2236 (getCurrentListMap!1699 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!345084 () Bool)

(declare-fun res!190915 () Bool)

(assert (=> b!345084 (=> (not res!190915) (not e!211509))))

(assert (=> b!345084 (= res!190915 (and (= (size!9059 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9060 _keys!1895) (size!9059 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12537 () Bool)

(declare-fun mapRes!12537 () Bool)

(assert (=> mapIsEmpty!12537 mapRes!12537))

(declare-fun b!345085 () Bool)

(declare-fun e!211508 () Bool)

(assert (=> b!345085 (= e!211508 (and e!211506 mapRes!12537))))

(declare-fun condMapEmpty!12537 () Bool)

(declare-fun mapDefault!12537 () ValueCell!3356)

