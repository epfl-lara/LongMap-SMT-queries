; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!944 () Bool)

(assert start!944)

(declare-fun b_free!317 () Bool)

(declare-fun b_next!317 () Bool)

(assert (=> start!944 (= b_free!317 (not b_next!317))))

(declare-fun tp!1183 () Bool)

(declare-fun b_and!465 () Bool)

(assert (=> start!944 (= tp!1183 b_and!465)))

(declare-fun b!7974 () Bool)

(declare-fun res!7713 () Bool)

(declare-fun e!4514 () Bool)

(assert (=> b!7974 (=> (not res!7713) (not e!4514))))

(declare-datatypes ((array!721 0))(
  ( (array!722 (arr!348 (Array (_ BitVec 32) (_ BitVec 64))) (size!410 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!721)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!721 (_ BitVec 32)) Bool)

(assert (=> b!7974 (= res!7713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!7712 () Bool)

(assert (=> start!944 (=> (not res!7712) (not e!4514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!944 (= res!7712 (validMask!0 mask!2250))))

(assert (=> start!944 e!4514))

(assert (=> start!944 tp!1183))

(assert (=> start!944 true))

(declare-datatypes ((V!703 0))(
  ( (V!704 (val!203 Int)) )
))
(declare-datatypes ((ValueCell!181 0))(
  ( (ValueCellFull!181 (v!1295 V!703)) (EmptyCell!181) )
))
(declare-datatypes ((array!723 0))(
  ( (array!724 (arr!349 (Array (_ BitVec 32) ValueCell!181)) (size!411 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!723)

(declare-fun e!4516 () Bool)

(declare-fun array_inv!255 (array!723) Bool)

(assert (=> start!944 (and (array_inv!255 _values!1492) e!4516)))

(declare-fun tp_is_empty!395 () Bool)

(assert (=> start!944 tp_is_empty!395))

(declare-fun array_inv!256 (array!721) Bool)

(assert (=> start!944 (array_inv!256 _keys!1806)))

(declare-fun b!7975 () Bool)

(declare-fun e!4513 () Bool)

(assert (=> b!7975 (= e!4513 tp_is_empty!395)))

(declare-fun b!7976 () Bool)

(declare-fun res!7714 () Bool)

(assert (=> b!7976 (=> (not res!7714) (not e!4514))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7976 (= res!7714 (and (= (size!411 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!410 _keys!1806) (size!411 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7977 () Bool)

(declare-fun res!7711 () Bool)

(assert (=> b!7977 (=> (not res!7711) (not e!4514))))

(declare-datatypes ((List!237 0))(
  ( (Nil!234) (Cons!233 (h!799 (_ BitVec 64)) (t!2374 List!237)) )
))
(declare-fun arrayNoDuplicates!0 (array!721 (_ BitVec 32) List!237) Bool)

(assert (=> b!7977 (= res!7711 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!234))))

(declare-fun b!7978 () Bool)

(declare-fun e!4517 () Bool)

(declare-fun mapRes!566 () Bool)

(assert (=> b!7978 (= e!4516 (and e!4517 mapRes!566))))

(declare-fun condMapEmpty!566 () Bool)

(declare-fun mapDefault!566 () ValueCell!181)

