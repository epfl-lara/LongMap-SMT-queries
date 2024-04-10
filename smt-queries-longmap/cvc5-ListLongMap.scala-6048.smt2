; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78208 () Bool)

(assert start!78208)

(declare-fun b_free!16699 () Bool)

(declare-fun b_next!16699 () Bool)

(assert (=> start!78208 (= b_free!16699 (not b_next!16699))))

(declare-fun tp!58374 () Bool)

(declare-fun b_and!27275 () Bool)

(assert (=> start!78208 (= tp!58374 b_and!27275)))

(declare-fun res!615711 () Bool)

(declare-fun e!511981 () Bool)

(assert (=> start!78208 (=> (not res!615711) (not e!511981))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78208 (= res!615711 (validMask!0 mask!1756))))

(assert (=> start!78208 e!511981))

(declare-datatypes ((V!30455 0))(
  ( (V!30456 (val!9609 Int)) )
))
(declare-datatypes ((ValueCell!9077 0))(
  ( (ValueCellFull!9077 (v!12120 V!30455)) (EmptyCell!9077) )
))
(declare-datatypes ((array!54228 0))(
  ( (array!54229 (arr!26068 (Array (_ BitVec 32) ValueCell!9077)) (size!26527 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54228)

(declare-fun e!511980 () Bool)

(declare-fun array_inv!20362 (array!54228) Bool)

(assert (=> start!78208 (and (array_inv!20362 _values!1152) e!511980)))

(assert (=> start!78208 tp!58374))

(assert (=> start!78208 true))

(declare-fun tp_is_empty!19117 () Bool)

(assert (=> start!78208 tp_is_empty!19117))

(declare-datatypes ((array!54230 0))(
  ( (array!54231 (arr!26069 (Array (_ BitVec 32) (_ BitVec 64))) (size!26528 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54230)

(declare-fun array_inv!20363 (array!54230) Bool)

(assert (=> start!78208 (array_inv!20363 _keys!1386)))

(declare-fun b!912743 () Bool)

(declare-fun res!615712 () Bool)

(assert (=> b!912743 (=> (not res!615712) (not e!511981))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912743 (= res!615712 (inRange!0 i!717 mask!1756))))

(declare-fun b!912744 () Bool)

(declare-fun e!511982 () Bool)

(assert (=> b!912744 (= e!511982 tp_is_empty!19117)))

(declare-fun b!912745 () Bool)

(declare-fun res!615716 () Bool)

(assert (=> b!912745 (=> (not res!615716) (not e!511981))))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!912745 (= res!615716 (and (= (select (arr!26069 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912746 () Bool)

(declare-fun res!615714 () Bool)

(assert (=> b!912746 (=> (not res!615714) (not e!511981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54230 (_ BitVec 32)) Bool)

(assert (=> b!912746 (= res!615714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912747 () Bool)

(declare-fun e!511979 () Bool)

(assert (=> b!912747 (= e!511979 tp_is_empty!19117)))

(declare-fun mapIsEmpty!30403 () Bool)

(declare-fun mapRes!30403 () Bool)

(assert (=> mapIsEmpty!30403 mapRes!30403))

(declare-fun b!912748 () Bool)

(declare-fun res!615715 () Bool)

(assert (=> b!912748 (=> (not res!615715) (not e!511981))))

(declare-datatypes ((List!18308 0))(
  ( (Nil!18305) (Cons!18304 (h!19450 (_ BitVec 64)) (t!25897 List!18308)) )
))
(declare-fun arrayNoDuplicates!0 (array!54230 (_ BitVec 32) List!18308) Bool)

(assert (=> b!912748 (= res!615715 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18305))))

(declare-fun b!912749 () Bool)

(declare-fun res!615713 () Bool)

(assert (=> b!912749 (=> (not res!615713) (not e!511981))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30455)

(declare-fun zeroValue!1094 () V!30455)

(declare-datatypes ((tuple2!12518 0))(
  ( (tuple2!12519 (_1!6270 (_ BitVec 64)) (_2!6270 V!30455)) )
))
(declare-datatypes ((List!18309 0))(
  ( (Nil!18306) (Cons!18305 (h!19451 tuple2!12518) (t!25898 List!18309)) )
))
(declare-datatypes ((ListLongMap!11215 0))(
  ( (ListLongMap!11216 (toList!5623 List!18309)) )
))
(declare-fun contains!4669 (ListLongMap!11215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2885 (array!54230 array!54228 (_ BitVec 32) (_ BitVec 32) V!30455 V!30455 (_ BitVec 32) Int) ListLongMap!11215)

(assert (=> b!912749 (= res!615713 (contains!4669 (getCurrentListMap!2885 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!30403 () Bool)

(declare-fun tp!58373 () Bool)

(assert (=> mapNonEmpty!30403 (= mapRes!30403 (and tp!58373 e!511982))))

(declare-fun mapKey!30403 () (_ BitVec 32))

(declare-fun mapRest!30403 () (Array (_ BitVec 32) ValueCell!9077))

(declare-fun mapValue!30403 () ValueCell!9077)

(assert (=> mapNonEmpty!30403 (= (arr!26068 _values!1152) (store mapRest!30403 mapKey!30403 mapValue!30403))))

(declare-fun b!912750 () Bool)

(assert (=> b!912750 (= e!511981 (not true))))

(declare-fun arrayContainsKey!0 (array!54230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912750 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30890 0))(
  ( (Unit!30891) )
))
(declare-fun lt!410699 () Unit!30890)

(declare-fun lemmaKeyInListMapIsInArray!270 (array!54230 array!54228 (_ BitVec 32) (_ BitVec 32) V!30455 V!30455 (_ BitVec 64) Int) Unit!30890)

(assert (=> b!912750 (= lt!410699 (lemmaKeyInListMapIsInArray!270 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912751 () Bool)

(assert (=> b!912751 (= e!511980 (and e!511979 mapRes!30403))))

(declare-fun condMapEmpty!30403 () Bool)

(declare-fun mapDefault!30403 () ValueCell!9077)

