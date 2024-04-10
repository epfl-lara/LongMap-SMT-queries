; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!890 () Bool)

(assert start!890)

(declare-fun b_free!263 () Bool)

(declare-fun b_next!263 () Bool)

(assert (=> start!890 (= b_free!263 (not b_next!263))))

(declare-fun tp!1022 () Bool)

(declare-fun b_and!411 () Bool)

(assert (=> start!890 (= tp!1022 b_and!411)))

(declare-fun mapNonEmpty!485 () Bool)

(declare-fun mapRes!485 () Bool)

(declare-fun tp!1021 () Bool)

(declare-fun e!4107 () Bool)

(assert (=> mapNonEmpty!485 (= mapRes!485 (and tp!1021 e!4107))))

(declare-datatypes ((V!631 0))(
  ( (V!632 (val!176 Int)) )
))
(declare-datatypes ((ValueCell!154 0))(
  ( (ValueCellFull!154 (v!1268 V!631)) (EmptyCell!154) )
))
(declare-fun mapRest!485 () (Array (_ BitVec 32) ValueCell!154))

(declare-datatypes ((array!615 0))(
  ( (array!616 (arr!295 (Array (_ BitVec 32) ValueCell!154)) (size!357 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!615)

(declare-fun mapValue!485 () ValueCell!154)

(declare-fun mapKey!485 () (_ BitVec 32))

(assert (=> mapNonEmpty!485 (= (arr!295 _values!1492) (store mapRest!485 mapKey!485 mapValue!485))))

(declare-fun b!7403 () Bool)

(declare-fun e!4109 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7403 (= e!4109 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!7385 () Bool)

(declare-fun e!4112 () Bool)

(assert (=> start!890 (=> (not res!7385) (not e!4112))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!890 (= res!7385 (validMask!0 mask!2250))))

(assert (=> start!890 e!4112))

(assert (=> start!890 tp!1022))

(assert (=> start!890 true))

(declare-fun e!4110 () Bool)

(declare-fun array_inv!219 (array!615) Bool)

(assert (=> start!890 (and (array_inv!219 _values!1492) e!4110)))

(declare-fun tp_is_empty!341 () Bool)

(assert (=> start!890 tp_is_empty!341))

(declare-datatypes ((array!617 0))(
  ( (array!618 (arr!296 (Array (_ BitVec 32) (_ BitVec 64))) (size!358 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!617)

(declare-fun array_inv!220 (array!617) Bool)

(assert (=> start!890 (array_inv!220 _keys!1806)))

(declare-fun b!7404 () Bool)

(declare-fun res!7390 () Bool)

(assert (=> b!7404 (=> (not res!7390) (not e!4112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!617 (_ BitVec 32)) Bool)

(assert (=> b!7404 (= res!7390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7405 () Bool)

(declare-fun e!4111 () Bool)

(assert (=> b!7405 (= e!4111 tp_is_empty!341)))

(declare-fun b!7406 () Bool)

(assert (=> b!7406 (= e!4112 (not true))))

(assert (=> b!7406 e!4109))

(declare-fun c!557 () Bool)

(assert (=> b!7406 (= c!557 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!631)

(declare-datatypes ((Unit!147 0))(
  ( (Unit!148) )
))
(declare-fun lt!1533 () Unit!147)

(declare-fun zeroValue!1434 () V!631)

(declare-fun lemmaKeyInListMapIsInArray!54 (array!617 array!615 (_ BitVec 32) (_ BitVec 32) V!631 V!631 (_ BitVec 64) Int) Unit!147)

(assert (=> b!7406 (= lt!1533 (lemmaKeyInListMapIsInArray!54 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!7407 () Bool)

(declare-fun arrayContainsKey!0 (array!617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7407 (= e!4109 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!7408 () Bool)

(assert (=> b!7408 (= e!4107 tp_is_empty!341)))

(declare-fun b!7409 () Bool)

(assert (=> b!7409 (= e!4110 (and e!4111 mapRes!485))))

(declare-fun condMapEmpty!485 () Bool)

(declare-fun mapDefault!485 () ValueCell!154)

