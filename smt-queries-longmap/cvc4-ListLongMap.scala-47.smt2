; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!798 () Bool)

(assert start!798)

(declare-fun b_free!191 () Bool)

(declare-fun b_next!191 () Bool)

(assert (=> start!798 (= b_free!191 (not b_next!191))))

(declare-fun tp!802 () Bool)

(declare-fun b_and!337 () Bool)

(assert (=> start!798 (= tp!802 b_and!337)))

(declare-fun b!5904 () Bool)

(declare-fun res!6499 () Bool)

(declare-fun e!3218 () Bool)

(assert (=> b!5904 (=> (not res!6499) (not e!3218))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!535 0))(
  ( (V!536 (val!140 Int)) )
))
(declare-datatypes ((ValueCell!118 0))(
  ( (ValueCellFull!118 (v!1231 V!535)) (EmptyCell!118) )
))
(declare-datatypes ((array!473 0))(
  ( (array!474 (arr!225 (Array (_ BitVec 32) ValueCell!118)) (size!287 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!473)

(declare-fun minValue!1434 () V!535)

(declare-datatypes ((array!475 0))(
  ( (array!476 (arr!226 (Array (_ BitVec 32) (_ BitVec 64))) (size!288 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!475)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!535)

(declare-datatypes ((tuple2!140 0))(
  ( (tuple2!141 (_1!70 (_ BitVec 64)) (_2!70 V!535)) )
))
(declare-datatypes ((List!152 0))(
  ( (Nil!149) (Cons!148 (h!714 tuple2!140) (t!2287 List!152)) )
))
(declare-datatypes ((ListLongMap!145 0))(
  ( (ListLongMap!146 (toList!88 List!152)) )
))
(declare-fun contains!62 (ListLongMap!145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!47 (array!475 array!473 (_ BitVec 32) (_ BitVec 32) V!535 V!535 (_ BitVec 32) Int) ListLongMap!145)

(assert (=> b!5904 (= res!6499 (contains!62 (getCurrentListMap!47 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!5905 () Bool)

(declare-fun res!6500 () Bool)

(assert (=> b!5905 (=> (not res!6500) (not e!3218))))

(assert (=> b!5905 (= res!6500 (and (= (size!287 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!288 _keys!1806) (size!287 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5906 () Bool)

(declare-fun e!3221 () Bool)

(declare-fun tp_is_empty!269 () Bool)

(assert (=> b!5906 (= e!3221 tp_is_empty!269)))

(declare-fun b!5907 () Bool)

(declare-fun e!3220 () Bool)

(assert (=> b!5907 (= e!3218 (not e!3220))))

(declare-fun res!6501 () Bool)

(assert (=> b!5907 (=> res!6501 e!3220)))

(declare-fun arrayContainsKey!0 (array!475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5907 (= res!6501 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3217 () Bool)

(assert (=> b!5907 e!3217))

(declare-fun c!419 () Bool)

(assert (=> b!5907 (= c!419 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!89 0))(
  ( (Unit!90) )
))
(declare-fun lt!1073 () Unit!89)

(declare-fun lemmaKeyInListMapIsInArray!30 (array!475 array!473 (_ BitVec 32) (_ BitVec 32) V!535 V!535 (_ BitVec 64) Int) Unit!89)

(assert (=> b!5907 (= lt!1073 (lemmaKeyInListMapIsInArray!30 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!374 () Bool)

(declare-fun mapRes!374 () Bool)

(declare-fun tp!803 () Bool)

(assert (=> mapNonEmpty!374 (= mapRes!374 (and tp!803 e!3221))))

(declare-fun mapKey!374 () (_ BitVec 32))

(declare-fun mapValue!374 () ValueCell!118)

(declare-fun mapRest!374 () (Array (_ BitVec 32) ValueCell!118))

(assert (=> mapNonEmpty!374 (= (arr!225 _values!1492) (store mapRest!374 mapKey!374 mapValue!374))))

(declare-fun b!5908 () Bool)

(declare-fun res!6497 () Bool)

(assert (=> b!5908 (=> (not res!6497) (not e!3218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5908 (= res!6497 (validKeyInArray!0 k!1278))))

(declare-fun res!6498 () Bool)

(assert (=> start!798 (=> (not res!6498) (not e!3218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!798 (= res!6498 (validMask!0 mask!2250))))

(assert (=> start!798 e!3218))

(assert (=> start!798 tp!802))

(assert (=> start!798 true))

(declare-fun e!3215 () Bool)

(declare-fun array_inv!165 (array!473) Bool)

(assert (=> start!798 (and (array_inv!165 _values!1492) e!3215)))

(assert (=> start!798 tp_is_empty!269))

(declare-fun array_inv!166 (array!475) Bool)

(assert (=> start!798 (array_inv!166 _keys!1806)))

(declare-fun b!5909 () Bool)

(declare-fun e!3219 () Bool)

(assert (=> b!5909 (= e!3215 (and e!3219 mapRes!374))))

(declare-fun condMapEmpty!374 () Bool)

(declare-fun mapDefault!374 () ValueCell!118)

