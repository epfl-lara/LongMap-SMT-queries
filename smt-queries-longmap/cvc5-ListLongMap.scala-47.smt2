; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!794 () Bool)

(assert start!794)

(declare-fun b_free!187 () Bool)

(declare-fun b_next!187 () Bool)

(assert (=> start!794 (= b_free!187 (not b_next!187))))

(declare-fun tp!790 () Bool)

(declare-fun b_and!333 () Bool)

(assert (=> start!794 (= tp!790 b_and!333)))

(declare-fun b!5832 () Bool)

(declare-fun res!6454 () Bool)

(declare-fun e!3178 () Bool)

(assert (=> b!5832 (=> (not res!6454) (not e!3178))))

(declare-datatypes ((array!465 0))(
  ( (array!466 (arr!221 (Array (_ BitVec 32) (_ BitVec 64))) (size!283 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!465)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!465 (_ BitVec 32)) Bool)

(assert (=> b!5832 (= res!6454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5834 () Bool)

(declare-fun res!6457 () Bool)

(assert (=> b!5834 (=> (not res!6457) (not e!3178))))

(declare-datatypes ((V!531 0))(
  ( (V!532 (val!138 Int)) )
))
(declare-datatypes ((ValueCell!116 0))(
  ( (ValueCellFull!116 (v!1229 V!531)) (EmptyCell!116) )
))
(declare-datatypes ((array!467 0))(
  ( (array!468 (arr!222 (Array (_ BitVec 32) ValueCell!116)) (size!284 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!467)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5834 (= res!6457 (and (= (size!284 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!283 _keys!1806) (size!284 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5835 () Bool)

(declare-fun res!6460 () Bool)

(assert (=> b!5835 (=> (not res!6460) (not e!3178))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5835 (= res!6460 (validKeyInArray!0 k!1278))))

(declare-fun b!5836 () Bool)

(declare-fun e!3179 () Bool)

(declare-fun e!3175 () Bool)

(declare-fun mapRes!368 () Bool)

(assert (=> b!5836 (= e!3179 (and e!3175 mapRes!368))))

(declare-fun condMapEmpty!368 () Bool)

(declare-fun mapDefault!368 () ValueCell!116)

