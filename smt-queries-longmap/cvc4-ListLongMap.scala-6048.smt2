; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78212 () Bool)

(assert start!78212)

(declare-fun b_free!16703 () Bool)

(declare-fun b_next!16703 () Bool)

(assert (=> start!78212 (= b_free!16703 (not b_next!16703))))

(declare-fun tp!58386 () Bool)

(declare-fun b_and!27279 () Bool)

(assert (=> start!78212 (= tp!58386 b_and!27279)))

(declare-fun b!912803 () Bool)

(declare-fun e!512012 () Bool)

(assert (=> b!912803 (= e!512012 (not true))))

(declare-datatypes ((array!54236 0))(
  ( (array!54237 (arr!26072 (Array (_ BitVec 32) (_ BitVec 64))) (size!26531 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54236)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912803 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30459 0))(
  ( (V!30460 (val!9611 Int)) )
))
(declare-datatypes ((ValueCell!9079 0))(
  ( (ValueCellFull!9079 (v!12122 V!30459)) (EmptyCell!9079) )
))
(declare-datatypes ((array!54238 0))(
  ( (array!54239 (arr!26073 (Array (_ BitVec 32) ValueCell!9079)) (size!26532 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54238)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30459)

(declare-datatypes ((Unit!30894 0))(
  ( (Unit!30895) )
))
(declare-fun lt!410705 () Unit!30894)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30459)

(declare-fun lemmaKeyInListMapIsInArray!272 (array!54236 array!54238 (_ BitVec 32) (_ BitVec 32) V!30459 V!30459 (_ BitVec 64) Int) Unit!30894)

(assert (=> b!912803 (= lt!410705 (lemmaKeyInListMapIsInArray!272 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912804 () Bool)

(declare-fun res!615753 () Bool)

(assert (=> b!912804 (=> (not res!615753) (not e!512012))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912804 (= res!615753 (inRange!0 i!717 mask!1756))))

(declare-fun res!615759 () Bool)

(assert (=> start!78212 (=> (not res!615759) (not e!512012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78212 (= res!615759 (validMask!0 mask!1756))))

(assert (=> start!78212 e!512012))

(declare-fun e!512011 () Bool)

(declare-fun array_inv!20366 (array!54238) Bool)

(assert (=> start!78212 (and (array_inv!20366 _values!1152) e!512011)))

(assert (=> start!78212 tp!58386))

(assert (=> start!78212 true))

(declare-fun tp_is_empty!19121 () Bool)

(assert (=> start!78212 tp_is_empty!19121))

(declare-fun array_inv!20367 (array!54236) Bool)

(assert (=> start!78212 (array_inv!20367 _keys!1386)))

(declare-fun b!912805 () Bool)

(declare-fun res!615758 () Bool)

(assert (=> b!912805 (=> (not res!615758) (not e!512012))))

(assert (=> b!912805 (= res!615758 (and (= (size!26532 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26531 _keys!1386) (size!26532 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912806 () Bool)

(declare-fun res!615755 () Bool)

(assert (=> b!912806 (=> (not res!615755) (not e!512012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54236 (_ BitVec 32)) Bool)

(assert (=> b!912806 (= res!615755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30409 () Bool)

(declare-fun mapRes!30409 () Bool)

(assert (=> mapIsEmpty!30409 mapRes!30409))

(declare-fun b!912807 () Bool)

(declare-fun e!512010 () Bool)

(assert (=> b!912807 (= e!512010 tp_is_empty!19121)))

(declare-fun b!912808 () Bool)

(declare-fun res!615757 () Bool)

(assert (=> b!912808 (=> (not res!615757) (not e!512012))))

(declare-datatypes ((List!18312 0))(
  ( (Nil!18309) (Cons!18308 (h!19454 (_ BitVec 64)) (t!25901 List!18312)) )
))
(declare-fun arrayNoDuplicates!0 (array!54236 (_ BitVec 32) List!18312) Bool)

(assert (=> b!912808 (= res!615757 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18309))))

(declare-fun b!912809 () Bool)

(declare-fun res!615756 () Bool)

(assert (=> b!912809 (=> (not res!615756) (not e!512012))))

(declare-datatypes ((tuple2!12522 0))(
  ( (tuple2!12523 (_1!6272 (_ BitVec 64)) (_2!6272 V!30459)) )
))
(declare-datatypes ((List!18313 0))(
  ( (Nil!18310) (Cons!18309 (h!19455 tuple2!12522) (t!25902 List!18313)) )
))
(declare-datatypes ((ListLongMap!11219 0))(
  ( (ListLongMap!11220 (toList!5625 List!18313)) )
))
(declare-fun contains!4671 (ListLongMap!11219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2887 (array!54236 array!54238 (_ BitVec 32) (_ BitVec 32) V!30459 V!30459 (_ BitVec 32) Int) ListLongMap!11219)

(assert (=> b!912809 (= res!615756 (contains!4671 (getCurrentListMap!2887 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!30409 () Bool)

(declare-fun tp!58385 () Bool)

(declare-fun e!512009 () Bool)

(assert (=> mapNonEmpty!30409 (= mapRes!30409 (and tp!58385 e!512009))))

(declare-fun mapValue!30409 () ValueCell!9079)

(declare-fun mapKey!30409 () (_ BitVec 32))

(declare-fun mapRest!30409 () (Array (_ BitVec 32) ValueCell!9079))

(assert (=> mapNonEmpty!30409 (= (arr!26073 _values!1152) (store mapRest!30409 mapKey!30409 mapValue!30409))))

(declare-fun b!912810 () Bool)

(declare-fun res!615754 () Bool)

(assert (=> b!912810 (=> (not res!615754) (not e!512012))))

(assert (=> b!912810 (= res!615754 (and (= (select (arr!26072 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912811 () Bool)

(assert (=> b!912811 (= e!512009 tp_is_empty!19121)))

(declare-fun b!912812 () Bool)

(assert (=> b!912812 (= e!512011 (and e!512010 mapRes!30409))))

(declare-fun condMapEmpty!30409 () Bool)

(declare-fun mapDefault!30409 () ValueCell!9079)

