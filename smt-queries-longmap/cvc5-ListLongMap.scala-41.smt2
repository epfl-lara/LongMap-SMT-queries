; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!718 () Bool)

(assert start!718)

(declare-fun b_free!151 () Bool)

(declare-fun b_next!151 () Bool)

(assert (=> start!718 (= b_free!151 (not b_next!151))))

(declare-fun tp!676 () Bool)

(declare-fun b_and!293 () Bool)

(assert (=> start!718 (= tp!676 b_and!293)))

(declare-fun b!4958 () Bool)

(declare-fun res!5994 () Bool)

(declare-fun e!2654 () Bool)

(assert (=> b!4958 (=> (not res!5994) (not e!2654))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!483 0))(
  ( (V!484 (val!120 Int)) )
))
(declare-datatypes ((ValueCell!98 0))(
  ( (ValueCellFull!98 (v!1209 V!483)) (EmptyCell!98) )
))
(declare-datatypes ((array!391 0))(
  ( (array!392 (arr!186 (Array (_ BitVec 32) ValueCell!98)) (size!248 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!391)

(declare-datatypes ((array!393 0))(
  ( (array!394 (arr!187 (Array (_ BitVec 32) (_ BitVec 64))) (size!249 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!393)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4958 (= res!5994 (and (= (size!248 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!249 _keys!1806) (size!248 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!308 () Bool)

(declare-fun mapRes!308 () Bool)

(declare-fun tp!677 () Bool)

(declare-fun e!2649 () Bool)

(assert (=> mapNonEmpty!308 (= mapRes!308 (and tp!677 e!2649))))

(declare-fun mapKey!308 () (_ BitVec 32))

(declare-fun mapValue!308 () ValueCell!98)

(declare-fun mapRest!308 () (Array (_ BitVec 32) ValueCell!98))

(assert (=> mapNonEmpty!308 (= (arr!186 _values!1492) (store mapRest!308 mapKey!308 mapValue!308))))

(declare-fun b!4959 () Bool)

(declare-fun res!5992 () Bool)

(assert (=> b!4959 (=> (not res!5992) (not e!2654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!393 (_ BitVec 32)) Bool)

(assert (=> b!4959 (= res!5992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!308 () Bool)

(assert (=> mapIsEmpty!308 mapRes!308))

(declare-fun b!4960 () Bool)

(declare-fun e!2651 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(assert (=> b!4960 (= e!2651 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4961 () Bool)

(declare-fun tp_is_empty!229 () Bool)

(assert (=> b!4961 (= e!2649 tp_is_empty!229)))

(declare-fun b!4962 () Bool)

(declare-fun e!2650 () Bool)

(assert (=> b!4962 (= e!2650 tp_is_empty!229)))

(declare-fun b!4963 () Bool)

(declare-fun res!5995 () Bool)

(assert (=> b!4963 (=> (not res!5995) (not e!2654))))

(declare-datatypes ((List!122 0))(
  ( (Nil!119) (Cons!118 (h!684 (_ BitVec 64)) (t!2253 List!122)) )
))
(declare-fun arrayNoDuplicates!0 (array!393 (_ BitVec 32) List!122) Bool)

(assert (=> b!4963 (= res!5995 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!119))))

(declare-fun res!5993 () Bool)

(assert (=> start!718 (=> (not res!5993) (not e!2654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!718 (= res!5993 (validMask!0 mask!2250))))

(assert (=> start!718 e!2654))

(assert (=> start!718 tp!676))

(assert (=> start!718 true))

(declare-fun e!2653 () Bool)

(declare-fun array_inv!137 (array!391) Bool)

(assert (=> start!718 (and (array_inv!137 _values!1492) e!2653)))

(assert (=> start!718 tp_is_empty!229))

(declare-fun array_inv!138 (array!393) Bool)

(assert (=> start!718 (array_inv!138 _keys!1806)))

(declare-fun b!4964 () Bool)

(assert (=> b!4964 (= e!2653 (and e!2650 mapRes!308))))

(declare-fun condMapEmpty!308 () Bool)

(declare-fun mapDefault!308 () ValueCell!98)

