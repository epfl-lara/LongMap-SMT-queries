; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34328 () Bool)

(assert start!34328)

(declare-fun b_free!7303 () Bool)

(declare-fun b_next!7303 () Bool)

(assert (=> start!34328 (= b_free!7303 (not b_next!7303))))

(declare-fun tp!25449 () Bool)

(declare-fun b_and!14507 () Bool)

(assert (=> start!34328 (= tp!25449 b_and!14507)))

(declare-fun b!342695 () Bool)

(declare-fun res!189443 () Bool)

(declare-fun e!210142 () Bool)

(assert (=> b!342695 (=> (not res!189443) (not e!210142))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10651 0))(
  ( (V!10652 (val!3672 Int)) )
))
(declare-fun zeroValue!1467 () V!10651)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3284 0))(
  ( (ValueCellFull!3284 (v!5846 V!10651)) (EmptyCell!3284) )
))
(declare-datatypes ((array!18103 0))(
  ( (array!18104 (arr!8570 (Array (_ BitVec 32) ValueCell!3284)) (size!8922 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18103)

(declare-datatypes ((array!18105 0))(
  ( (array!18106 (arr!8571 (Array (_ BitVec 32) (_ BitVec 64))) (size!8923 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18105)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10651)

(declare-datatypes ((tuple2!5322 0))(
  ( (tuple2!5323 (_1!2672 (_ BitVec 64)) (_2!2672 V!10651)) )
))
(declare-datatypes ((List!4941 0))(
  ( (Nil!4938) (Cons!4937 (h!5793 tuple2!5322) (t!10053 List!4941)) )
))
(declare-datatypes ((ListLongMap!4235 0))(
  ( (ListLongMap!4236 (toList!2133 List!4941)) )
))
(declare-fun contains!2189 (ListLongMap!4235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1654 (array!18105 array!18103 (_ BitVec 32) (_ BitVec 32) V!10651 V!10651 (_ BitVec 32) Int) ListLongMap!4235)

(assert (=> b!342695 (= res!189443 (not (contains!2189 (getCurrentListMap!1654 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12315 () Bool)

(declare-fun mapRes!12315 () Bool)

(assert (=> mapIsEmpty!12315 mapRes!12315))

(declare-fun res!189442 () Bool)

(assert (=> start!34328 (=> (not res!189442) (not e!210142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34328 (= res!189442 (validMask!0 mask!2385))))

(assert (=> start!34328 e!210142))

(assert (=> start!34328 true))

(declare-fun tp_is_empty!7255 () Bool)

(assert (=> start!34328 tp_is_empty!7255))

(assert (=> start!34328 tp!25449))

(declare-fun e!210146 () Bool)

(declare-fun array_inv!6346 (array!18103) Bool)

(assert (=> start!34328 (and (array_inv!6346 _values!1525) e!210146)))

(declare-fun array_inv!6347 (array!18105) Bool)

(assert (=> start!34328 (array_inv!6347 _keys!1895)))

(declare-fun b!342696 () Bool)

(declare-fun res!189440 () Bool)

(assert (=> b!342696 (=> (not res!189440) (not e!210142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342696 (= res!189440 (validKeyInArray!0 k!1348))))

(declare-fun b!342697 () Bool)

(declare-fun res!189438 () Bool)

(assert (=> b!342697 (=> (not res!189438) (not e!210142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18105 (_ BitVec 32)) Bool)

(assert (=> b!342697 (= res!189438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342698 () Bool)

(declare-fun e!210147 () Bool)

(assert (=> b!342698 (= e!210146 (and e!210147 mapRes!12315))))

(declare-fun condMapEmpty!12315 () Bool)

(declare-fun mapDefault!12315 () ValueCell!3284)

