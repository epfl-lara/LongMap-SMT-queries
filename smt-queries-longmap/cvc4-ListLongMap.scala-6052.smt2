; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78236 () Bool)

(assert start!78236)

(declare-fun b_free!16727 () Bool)

(declare-fun b_next!16727 () Bool)

(assert (=> start!78236 (= b_free!16727 (not b_next!16727))))

(declare-fun tp!58457 () Bool)

(declare-fun b_and!27303 () Bool)

(assert (=> start!78236 (= tp!58457 b_and!27303)))

(declare-fun b!913163 () Bool)

(declare-fun res!616005 () Bool)

(declare-fun e!512189 () Bool)

(assert (=> b!913163 (=> (not res!616005) (not e!512189))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54280 0))(
  ( (array!54281 (arr!26094 (Array (_ BitVec 32) (_ BitVec 64))) (size!26553 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54280)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!913163 (= res!616005 (and (= (select (arr!26094 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913164 () Bool)

(declare-fun res!616008 () Bool)

(assert (=> b!913164 (=> (not res!616008) (not e!512189))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913164 (= res!616008 (inRange!0 i!717 mask!1756))))

(declare-fun b!913165 () Bool)

(declare-fun res!616010 () Bool)

(assert (=> b!913165 (=> (not res!616010) (not e!512189))))

(declare-datatypes ((V!30491 0))(
  ( (V!30492 (val!9623 Int)) )
))
(declare-datatypes ((ValueCell!9091 0))(
  ( (ValueCellFull!9091 (v!12134 V!30491)) (EmptyCell!9091) )
))
(declare-datatypes ((array!54282 0))(
  ( (array!54283 (arr!26095 (Array (_ BitVec 32) ValueCell!9091)) (size!26554 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54282)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30491)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30491)

(declare-datatypes ((tuple2!12542 0))(
  ( (tuple2!12543 (_1!6282 (_ BitVec 64)) (_2!6282 V!30491)) )
))
(declare-datatypes ((List!18330 0))(
  ( (Nil!18327) (Cons!18326 (h!19472 tuple2!12542) (t!25919 List!18330)) )
))
(declare-datatypes ((ListLongMap!11239 0))(
  ( (ListLongMap!11240 (toList!5635 List!18330)) )
))
(declare-fun contains!4681 (ListLongMap!11239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2897 (array!54280 array!54282 (_ BitVec 32) (_ BitVec 32) V!30491 V!30491 (_ BitVec 32) Int) ListLongMap!11239)

(assert (=> b!913165 (= res!616010 (contains!4681 (getCurrentListMap!2897 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!913166 () Bool)

(assert (=> b!913166 (= e!512189 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26553 _keys!1386)))))))

(declare-fun arrayContainsKey!0 (array!54280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913166 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30912 0))(
  ( (Unit!30913) )
))
(declare-fun lt!410741 () Unit!30912)

(declare-fun lemmaKeyInListMapIsInArray!281 (array!54280 array!54282 (_ BitVec 32) (_ BitVec 32) V!30491 V!30491 (_ BitVec 64) Int) Unit!30912)

(assert (=> b!913166 (= lt!410741 (lemmaKeyInListMapIsInArray!281 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!913168 () Bool)

(declare-fun res!616007 () Bool)

(assert (=> b!913168 (=> (not res!616007) (not e!512189))))

(declare-datatypes ((List!18331 0))(
  ( (Nil!18328) (Cons!18327 (h!19473 (_ BitVec 64)) (t!25920 List!18331)) )
))
(declare-fun arrayNoDuplicates!0 (array!54280 (_ BitVec 32) List!18331) Bool)

(assert (=> b!913168 (= res!616007 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18328))))

(declare-fun b!913169 () Bool)

(declare-fun res!616011 () Bool)

(assert (=> b!913169 (=> (not res!616011) (not e!512189))))

(assert (=> b!913169 (= res!616011 (and (= (size!26554 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26553 _keys!1386) (size!26554 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913170 () Bool)

(declare-fun res!616006 () Bool)

(assert (=> b!913170 (=> (not res!616006) (not e!512189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54280 (_ BitVec 32)) Bool)

(assert (=> b!913170 (= res!616006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913171 () Bool)

(declare-fun e!512192 () Bool)

(declare-fun tp_is_empty!19145 () Bool)

(assert (=> b!913171 (= e!512192 tp_is_empty!19145)))

(declare-fun mapNonEmpty!30445 () Bool)

(declare-fun mapRes!30445 () Bool)

(declare-fun tp!58458 () Bool)

(assert (=> mapNonEmpty!30445 (= mapRes!30445 (and tp!58458 e!512192))))

(declare-fun mapValue!30445 () ValueCell!9091)

(declare-fun mapKey!30445 () (_ BitVec 32))

(declare-fun mapRest!30445 () (Array (_ BitVec 32) ValueCell!9091))

(assert (=> mapNonEmpty!30445 (= (arr!26095 _values!1152) (store mapRest!30445 mapKey!30445 mapValue!30445))))

(declare-fun b!913172 () Bool)

(declare-fun e!512191 () Bool)

(assert (=> b!913172 (= e!512191 tp_is_empty!19145)))

(declare-fun mapIsEmpty!30445 () Bool)

(assert (=> mapIsEmpty!30445 mapRes!30445))

(declare-fun b!913167 () Bool)

(declare-fun e!512193 () Bool)

(assert (=> b!913167 (= e!512193 (and e!512191 mapRes!30445))))

(declare-fun condMapEmpty!30445 () Bool)

(declare-fun mapDefault!30445 () ValueCell!9091)

