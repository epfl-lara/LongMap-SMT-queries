; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36950 () Bool)

(assert start!36950)

(declare-fun b_free!8077 () Bool)

(declare-fun b_next!8077 () Bool)

(assert (=> start!36950 (= b_free!8077 (not b_next!8077))))

(declare-fun tp!28947 () Bool)

(declare-fun b_and!15319 () Bool)

(assert (=> start!36950 (= tp!28947 b_and!15319)))

(declare-fun b!370541 () Bool)

(declare-fun e!226306 () Bool)

(declare-fun tp_is_empty!8725 () Bool)

(assert (=> b!370541 (= e!226306 tp_is_empty!8725)))

(declare-fun mapIsEmpty!14652 () Bool)

(declare-fun mapRes!14652 () Bool)

(assert (=> mapIsEmpty!14652 mapRes!14652))

(declare-fun b!370542 () Bool)

(declare-fun res!208103 () Bool)

(declare-fun e!226307 () Bool)

(assert (=> b!370542 (=> (not res!208103) (not e!226307))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21393 0))(
  ( (array!21394 (arr!10165 (Array (_ BitVec 32) (_ BitVec 64))) (size!10517 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21393)

(assert (=> b!370542 (= res!208103 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10517 _keys!658))))))

(declare-fun b!370543 () Bool)

(declare-fun res!208100 () Bool)

(assert (=> b!370543 (=> (not res!208100) (not e!226307))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12739 0))(
  ( (V!12740 (val!4407 Int)) )
))
(declare-datatypes ((ValueCell!4019 0))(
  ( (ValueCellFull!4019 (v!6604 V!12739)) (EmptyCell!4019) )
))
(declare-datatypes ((array!21395 0))(
  ( (array!21396 (arr!10166 (Array (_ BitVec 32) ValueCell!4019)) (size!10518 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21395)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370543 (= res!208100 (and (= (size!10518 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10517 _keys!658) (size!10518 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14652 () Bool)

(declare-fun tp!28946 () Bool)

(assert (=> mapNonEmpty!14652 (= mapRes!14652 (and tp!28946 e!226306))))

(declare-fun mapRest!14652 () (Array (_ BitVec 32) ValueCell!4019))

(declare-fun mapKey!14652 () (_ BitVec 32))

(declare-fun mapValue!14652 () ValueCell!4019)

(assert (=> mapNonEmpty!14652 (= (arr!10166 _values!506) (store mapRest!14652 mapKey!14652 mapValue!14652))))

(declare-fun b!370544 () Bool)

(declare-fun e!226304 () Bool)

(assert (=> b!370544 (= e!226304 tp_is_empty!8725)))

(declare-fun b!370545 () Bool)

(declare-fun res!208105 () Bool)

(assert (=> b!370545 (=> (not res!208105) (not e!226307))))

(assert (=> b!370545 (= res!208105 (or (= (select (arr!10165 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10165 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!208109 () Bool)

(assert (=> start!36950 (=> (not res!208109) (not e!226307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36950 (= res!208109 (validMask!0 mask!970))))

(assert (=> start!36950 e!226307))

(declare-fun e!226302 () Bool)

(declare-fun array_inv!7508 (array!21395) Bool)

(assert (=> start!36950 (and (array_inv!7508 _values!506) e!226302)))

(assert (=> start!36950 tp!28947))

(assert (=> start!36950 true))

(assert (=> start!36950 tp_is_empty!8725))

(declare-fun array_inv!7509 (array!21393) Bool)

(assert (=> start!36950 (array_inv!7509 _keys!658)))

(declare-fun b!370546 () Bool)

(assert (=> b!370546 (= e!226302 (and e!226304 mapRes!14652))))

(declare-fun condMapEmpty!14652 () Bool)

(declare-fun mapDefault!14652 () ValueCell!4019)

