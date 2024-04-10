; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7384 () Bool)

(assert start!7384)

(declare-fun b!47415 () Bool)

(declare-fun res!27588 () Bool)

(declare-fun e!30354 () Bool)

(assert (=> b!47415 (=> (not res!27588) (not e!30354))))

(declare-datatypes ((List!1259 0))(
  ( (Nil!1256) (Cons!1255 (h!1835 (_ BitVec 64)) (t!4287 List!1259)) )
))
(declare-fun noDuplicate!40 (List!1259) Bool)

(assert (=> b!47415 (= res!27588 (noDuplicate!40 Nil!1256))))

(declare-fun b!47416 () Bool)

(declare-fun res!27590 () Bool)

(assert (=> b!47416 (=> (not res!27590) (not e!30354))))

(declare-datatypes ((array!3129 0))(
  ( (array!3130 (arr!1500 (Array (_ BitVec 32) (_ BitVec 64))) (size!1722 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3129)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((V!2443 0))(
  ( (V!2444 (val!1055 Int)) )
))
(declare-datatypes ((ValueCell!727 0))(
  ( (ValueCellFull!727 (v!2115 V!2443)) (EmptyCell!727) )
))
(declare-datatypes ((array!3131 0))(
  ( (array!3132 (arr!1501 (Array (_ BitVec 32) ValueCell!727)) (size!1723 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3131)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47416 (= res!27590 (and (= (size!1723 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1722 _keys!1940) (size!1723 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2090 () Bool)

(declare-fun mapRes!2090 () Bool)

(assert (=> mapIsEmpty!2090 mapRes!2090))

(declare-fun res!27591 () Bool)

(assert (=> start!7384 (=> (not res!27591) (not e!30354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7384 (= res!27591 (validMask!0 mask!2458))))

(assert (=> start!7384 e!30354))

(assert (=> start!7384 true))

(declare-fun e!30357 () Bool)

(declare-fun array_inv!904 (array!3131) Bool)

(assert (=> start!7384 (and (array_inv!904 _values!1550) e!30357)))

(declare-fun array_inv!905 (array!3129) Bool)

(assert (=> start!7384 (array_inv!905 _keys!1940)))

(declare-fun b!47417 () Bool)

(declare-fun res!27587 () Bool)

(assert (=> b!47417 (=> (not res!27587) (not e!30354))))

(assert (=> b!47417 (= res!27587 (and (bvsle #b00000000000000000000000000000000 (size!1722 _keys!1940)) (bvslt (size!1722 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47418 () Bool)

(declare-fun e!30355 () Bool)

(declare-fun tp_is_empty!2033 () Bool)

(assert (=> b!47418 (= e!30355 tp_is_empty!2033)))

(declare-fun b!47419 () Bool)

(declare-fun e!30359 () Bool)

(declare-fun contains!586 (List!1259 (_ BitVec 64)) Bool)

(assert (=> b!47419 (= e!30359 (contains!586 Nil!1256 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47420 () Bool)

(declare-fun e!30356 () Bool)

(assert (=> b!47420 (= e!30356 tp_is_empty!2033)))

(declare-fun b!47421 () Bool)

(assert (=> b!47421 (= e!30354 e!30359)))

(declare-fun res!27589 () Bool)

(assert (=> b!47421 (=> res!27589 e!30359)))

(assert (=> b!47421 (= res!27589 (contains!586 Nil!1256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!2090 () Bool)

(declare-fun tp!6239 () Bool)

(assert (=> mapNonEmpty!2090 (= mapRes!2090 (and tp!6239 e!30355))))

(declare-fun mapKey!2090 () (_ BitVec 32))

(declare-fun mapRest!2090 () (Array (_ BitVec 32) ValueCell!727))

(declare-fun mapValue!2090 () ValueCell!727)

(assert (=> mapNonEmpty!2090 (= (arr!1501 _values!1550) (store mapRest!2090 mapKey!2090 mapValue!2090))))

(declare-fun b!47422 () Bool)

(assert (=> b!47422 (= e!30357 (and e!30356 mapRes!2090))))

(declare-fun condMapEmpty!2090 () Bool)

(declare-fun mapDefault!2090 () ValueCell!727)

