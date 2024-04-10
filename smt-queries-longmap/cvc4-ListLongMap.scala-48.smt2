; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!804 () Bool)

(assert start!804)

(declare-fun b_free!197 () Bool)

(declare-fun b_next!197 () Bool)

(assert (=> start!804 (= b_free!197 (not b_next!197))))

(declare-fun tp!821 () Bool)

(declare-fun b_and!343 () Bool)

(assert (=> start!804 (= tp!821 b_and!343)))

(declare-fun b!6012 () Bool)

(declare-fun e!3282 () Bool)

(assert (=> b!6012 (= e!3282 true)))

(declare-fun lt!1091 () (_ BitVec 32))

(declare-datatypes ((array!483 0))(
  ( (array!484 (arr!230 (Array (_ BitVec 32) (_ BitVec 64))) (size!292 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!483)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!483 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6012 (= lt!1091 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6013 () Bool)

(declare-fun res!6563 () Bool)

(declare-fun e!3283 () Bool)

(assert (=> b!6013 (=> (not res!6563) (not e!3283))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!483 (_ BitVec 32)) Bool)

(assert (=> b!6013 (= res!6563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6014 () Bool)

(declare-fun e!3281 () Bool)

(declare-fun arrayContainsKey!0 (array!483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6014 (= e!3281 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6015 () Bool)

(declare-fun e!3278 () Bool)

(declare-fun tp_is_empty!275 () Bool)

(assert (=> b!6015 (= e!3278 tp_is_empty!275)))

(declare-fun b!6016 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6016 (= e!3281 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6017 () Bool)

(declare-fun res!6565 () Bool)

(assert (=> b!6017 (=> (not res!6565) (not e!3283))))

(declare-datatypes ((V!543 0))(
  ( (V!544 (val!143 Int)) )
))
(declare-datatypes ((ValueCell!121 0))(
  ( (ValueCellFull!121 (v!1234 V!543)) (EmptyCell!121) )
))
(declare-datatypes ((array!485 0))(
  ( (array!486 (arr!231 (Array (_ BitVec 32) ValueCell!121)) (size!293 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!485)

(assert (=> b!6017 (= res!6565 (and (= (size!293 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!292 _keys!1806) (size!293 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6018 () Bool)

(declare-fun e!3284 () Bool)

(declare-fun mapRes!383 () Bool)

(assert (=> b!6018 (= e!3284 (and e!3278 mapRes!383))))

(declare-fun condMapEmpty!383 () Bool)

(declare-fun mapDefault!383 () ValueCell!121)

