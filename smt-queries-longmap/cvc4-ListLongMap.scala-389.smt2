; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7340 () Bool)

(assert start!7340)

(declare-fun mapNonEmpty!2054 () Bool)

(declare-fun mapRes!2054 () Bool)

(declare-fun tp!6203 () Bool)

(declare-fun e!30162 () Bool)

(assert (=> mapNonEmpty!2054 (= mapRes!2054 (and tp!6203 e!30162))))

(declare-fun mapKey!2054 () (_ BitVec 32))

(declare-datatypes ((V!2419 0))(
  ( (V!2420 (val!1046 Int)) )
))
(declare-datatypes ((ValueCell!718 0))(
  ( (ValueCellFull!718 (v!2106 V!2419)) (EmptyCell!718) )
))
(declare-fun mapRest!2054 () (Array (_ BitVec 32) ValueCell!718))

(declare-datatypes ((array!3089 0))(
  ( (array!3090 (arr!1483 (Array (_ BitVec 32) ValueCell!718)) (size!1705 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3089)

(declare-fun mapValue!2054 () ValueCell!718)

(assert (=> mapNonEmpty!2054 (= (arr!1483 _values!1550) (store mapRest!2054 mapKey!2054 mapValue!2054))))

(declare-fun b!47154 () Bool)

(declare-fun res!27449 () Bool)

(declare-fun e!30163 () Bool)

(assert (=> b!47154 (=> (not res!27449) (not e!30163))))

(declare-datatypes ((array!3091 0))(
  ( (array!3092 (arr!1484 (Array (_ BitVec 32) (_ BitVec 64))) (size!1706 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3091)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(assert (=> b!47154 (= res!27449 (and (= (size!1705 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1706 _keys!1940) (size!1705 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun res!27448 () Bool)

(assert (=> start!7340 (=> (not res!27448) (not e!30163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7340 (= res!27448 (validMask!0 mask!2458))))

(assert (=> start!7340 e!30163))

(assert (=> start!7340 true))

(declare-fun e!30164 () Bool)

(declare-fun array_inv!890 (array!3089) Bool)

(assert (=> start!7340 (and (array_inv!890 _values!1550) e!30164)))

(declare-fun array_inv!891 (array!3091) Bool)

(assert (=> start!7340 (array_inv!891 _keys!1940)))

(declare-fun mapIsEmpty!2054 () Bool)

(assert (=> mapIsEmpty!2054 mapRes!2054))

(declare-fun b!47155 () Bool)

(declare-fun e!30160 () Bool)

(declare-fun tp_is_empty!2015 () Bool)

(assert (=> b!47155 (= e!30160 tp_is_empty!2015)))

(declare-fun b!47156 () Bool)

(assert (=> b!47156 (= e!30163 (bvsgt #b00000000000000000000000000000000 (size!1706 _keys!1940)))))

(declare-fun b!47157 () Bool)

(assert (=> b!47157 (= e!30162 tp_is_empty!2015)))

(declare-fun b!47158 () Bool)

(declare-fun res!27450 () Bool)

(assert (=> b!47158 (=> (not res!27450) (not e!30163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3091 (_ BitVec 32)) Bool)

(assert (=> b!47158 (= res!27450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47159 () Bool)

(assert (=> b!47159 (= e!30164 (and e!30160 mapRes!2054))))

(declare-fun condMapEmpty!2054 () Bool)

(declare-fun mapDefault!2054 () ValueCell!718)

