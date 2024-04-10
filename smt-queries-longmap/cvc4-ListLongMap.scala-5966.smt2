; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77626 () Bool)

(assert start!77626)

(declare-fun b_free!16211 () Bool)

(declare-fun b_next!16211 () Bool)

(assert (=> start!77626 (= b_free!16211 (not b_next!16211))))

(declare-fun tp!56894 () Bool)

(declare-fun b_and!26577 () Bool)

(assert (=> start!77626 (= tp!56894 b_and!26577)))

(declare-fun mapIsEmpty!29656 () Bool)

(declare-fun mapRes!29656 () Bool)

(assert (=> mapIsEmpty!29656 mapRes!29656))

(declare-fun b!904839 () Bool)

(declare-fun e!507029 () Bool)

(declare-fun tp_is_empty!18629 () Bool)

(assert (=> b!904839 (= e!507029 tp_is_empty!18629)))

(declare-fun mapNonEmpty!29656 () Bool)

(declare-fun tp!56895 () Bool)

(declare-fun e!507031 () Bool)

(assert (=> mapNonEmpty!29656 (= mapRes!29656 (and tp!56895 e!507031))))

(declare-datatypes ((V!29803 0))(
  ( (V!29804 (val!9365 Int)) )
))
(declare-datatypes ((ValueCell!8833 0))(
  ( (ValueCellFull!8833 (v!11870 V!29803)) (EmptyCell!8833) )
))
(declare-fun mapValue!29656 () ValueCell!8833)

(declare-datatypes ((array!53302 0))(
  ( (array!53303 (arr!25610 (Array (_ BitVec 32) ValueCell!8833)) (size!26069 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53302)

(declare-fun mapRest!29656 () (Array (_ BitVec 32) ValueCell!8833))

(declare-fun mapKey!29656 () (_ BitVec 32))

(assert (=> mapNonEmpty!29656 (= (arr!25610 _values!1152) (store mapRest!29656 mapKey!29656 mapValue!29656))))

(declare-fun b!904840 () Bool)

(declare-fun res!610555 () Bool)

(declare-fun e!507033 () Bool)

(assert (=> b!904840 (=> (not res!610555) (not e!507033))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904840 (= res!610555 (inRange!0 i!717 mask!1756))))

(declare-fun b!904841 () Bool)

(declare-fun e!507032 () Bool)

(assert (=> b!904841 (= e!507032 true)))

(declare-fun lt!408334 () V!29803)

(declare-datatypes ((tuple2!12172 0))(
  ( (tuple2!12173 (_1!6097 (_ BitVec 64)) (_2!6097 V!29803)) )
))
(declare-datatypes ((List!17985 0))(
  ( (Nil!17982) (Cons!17981 (h!19127 tuple2!12172) (t!25368 List!17985)) )
))
(declare-datatypes ((ListLongMap!10869 0))(
  ( (ListLongMap!10870 (toList!5450 List!17985)) )
))
(declare-fun lt!408336 () ListLongMap!10869)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!442 (ListLongMap!10869 (_ BitVec 64)) V!29803)

(assert (=> b!904841 (= lt!408334 (apply!442 lt!408336 k!1033))))

(declare-fun res!610551 () Bool)

(assert (=> start!77626 (=> (not res!610551) (not e!507033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77626 (= res!610551 (validMask!0 mask!1756))))

(assert (=> start!77626 e!507033))

(declare-fun e!507028 () Bool)

(declare-fun array_inv!20064 (array!53302) Bool)

(assert (=> start!77626 (and (array_inv!20064 _values!1152) e!507028)))

(assert (=> start!77626 tp!56894))

(assert (=> start!77626 true))

(assert (=> start!77626 tp_is_empty!18629))

(declare-datatypes ((array!53304 0))(
  ( (array!53305 (arr!25611 (Array (_ BitVec 32) (_ BitVec 64))) (size!26070 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53304)

(declare-fun array_inv!20065 (array!53304) Bool)

(assert (=> start!77626 (array_inv!20065 _keys!1386)))

(declare-fun b!904842 () Bool)

(declare-fun res!610557 () Bool)

(assert (=> b!904842 (=> (not res!610557) (not e!507033))))

(assert (=> b!904842 (= res!610557 (and (= (select (arr!25611 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904843 () Bool)

(declare-fun res!610556 () Bool)

(assert (=> b!904843 (=> (not res!610556) (not e!507033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53304 (_ BitVec 32)) Bool)

(assert (=> b!904843 (= res!610556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904844 () Bool)

(declare-fun e!507030 () Bool)

(assert (=> b!904844 (= e!507033 (not e!507030))))

(declare-fun res!610552 () Bool)

(assert (=> b!904844 (=> res!610552 e!507030)))

(assert (=> b!904844 (= res!610552 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26070 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904844 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29803)

(declare-datatypes ((Unit!30694 0))(
  ( (Unit!30695) )
))
(declare-fun lt!408335 () Unit!30694)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29803)

(declare-fun lemmaKeyInListMapIsInArray!190 (array!53304 array!53302 (_ BitVec 32) (_ BitVec 32) V!29803 V!29803 (_ BitVec 64) Int) Unit!30694)

(assert (=> b!904844 (= lt!408335 (lemmaKeyInListMapIsInArray!190 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904845 () Bool)

(declare-fun res!610559 () Bool)

(assert (=> b!904845 (=> (not res!610559) (not e!507033))))

(declare-datatypes ((List!17986 0))(
  ( (Nil!17983) (Cons!17982 (h!19128 (_ BitVec 64)) (t!25369 List!17986)) )
))
(declare-fun arrayNoDuplicates!0 (array!53304 (_ BitVec 32) List!17986) Bool)

(assert (=> b!904845 (= res!610559 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17983))))

(declare-fun b!904846 () Bool)

(assert (=> b!904846 (= e!507031 tp_is_empty!18629)))

(declare-fun b!904847 () Bool)

(assert (=> b!904847 (= e!507030 e!507032)))

(declare-fun res!610553 () Bool)

(assert (=> b!904847 (=> res!610553 e!507032)))

(declare-fun contains!4497 (ListLongMap!10869 (_ BitVec 64)) Bool)

(assert (=> b!904847 (= res!610553 (not (contains!4497 lt!408336 k!1033)))))

(declare-fun getCurrentListMap!2718 (array!53304 array!53302 (_ BitVec 32) (_ BitVec 32) V!29803 V!29803 (_ BitVec 32) Int) ListLongMap!10869)

(assert (=> b!904847 (= lt!408336 (getCurrentListMap!2718 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904848 () Bool)

(declare-fun res!610554 () Bool)

(assert (=> b!904848 (=> (not res!610554) (not e!507033))))

(assert (=> b!904848 (= res!610554 (and (= (size!26069 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26070 _keys!1386) (size!26069 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904849 () Bool)

(declare-fun res!610558 () Bool)

(assert (=> b!904849 (=> (not res!610558) (not e!507033))))

(assert (=> b!904849 (= res!610558 (contains!4497 (getCurrentListMap!2718 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904850 () Bool)

(assert (=> b!904850 (= e!507028 (and e!507029 mapRes!29656))))

(declare-fun condMapEmpty!29656 () Bool)

(declare-fun mapDefault!29656 () ValueCell!8833)

