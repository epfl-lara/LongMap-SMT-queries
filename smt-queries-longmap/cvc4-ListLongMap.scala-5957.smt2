; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77572 () Bool)

(assert start!77572)

(declare-fun b_free!16157 () Bool)

(declare-fun b_next!16157 () Bool)

(assert (=> start!77572 (= b_free!16157 (not b_next!16157))))

(declare-fun tp!56733 () Bool)

(declare-fun b_and!26523 () Bool)

(assert (=> start!77572 (= tp!56733 b_and!26523)))

(declare-fun b!903867 () Bool)

(declare-fun e!506464 () Bool)

(declare-fun e!506465 () Bool)

(assert (=> b!903867 (= e!506464 e!506465)))

(declare-fun res!609830 () Bool)

(assert (=> b!903867 (=> res!609830 e!506465)))

(declare-datatypes ((V!29731 0))(
  ( (V!29732 (val!9338 Int)) )
))
(declare-datatypes ((tuple2!12130 0))(
  ( (tuple2!12131 (_1!6076 (_ BitVec 64)) (_2!6076 V!29731)) )
))
(declare-datatypes ((List!17949 0))(
  ( (Nil!17946) (Cons!17945 (h!19091 tuple2!12130) (t!25332 List!17949)) )
))
(declare-datatypes ((ListLongMap!10827 0))(
  ( (ListLongMap!10828 (toList!5429 List!17949)) )
))
(declare-fun lt!408092 () ListLongMap!10827)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4477 (ListLongMap!10827 (_ BitVec 64)) Bool)

(assert (=> b!903867 (= res!609830 (not (contains!4477 lt!408092 k!1033)))))

(declare-datatypes ((ValueCell!8806 0))(
  ( (ValueCellFull!8806 (v!11843 V!29731)) (EmptyCell!8806) )
))
(declare-datatypes ((array!53202 0))(
  ( (array!53203 (arr!25560 (Array (_ BitVec 32) ValueCell!8806)) (size!26019 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53202)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29731)

(declare-datatypes ((array!53204 0))(
  ( (array!53205 (arr!25561 (Array (_ BitVec 32) (_ BitVec 64))) (size!26020 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53204)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29731)

(declare-fun getCurrentListMap!2698 (array!53204 array!53202 (_ BitVec 32) (_ BitVec 32) V!29731 V!29731 (_ BitVec 32) Int) ListLongMap!10827)

(assert (=> b!903867 (= lt!408092 (getCurrentListMap!2698 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!903868 () Bool)

(declare-fun res!609827 () Bool)

(declare-fun e!506460 () Bool)

(assert (=> b!903868 (=> (not res!609827) (not e!506460))))

(assert (=> b!903868 (= res!609827 (and (= (size!26019 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26020 _keys!1386) (size!26019 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903869 () Bool)

(declare-fun res!609823 () Bool)

(assert (=> b!903869 (=> (not res!609823) (not e!506460))))

(assert (=> b!903869 (= res!609823 (and (= (select (arr!25561 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903870 () Bool)

(declare-fun e!506462 () Bool)

(declare-fun tp_is_empty!18575 () Bool)

(assert (=> b!903870 (= e!506462 tp_is_empty!18575)))

(declare-fun b!903871 () Bool)

(assert (=> b!903871 (= e!506460 (not e!506464))))

(declare-fun res!609826 () Bool)

(assert (=> b!903871 (=> res!609826 e!506464)))

(assert (=> b!903871 (= res!609826 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26020 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903871 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30656 0))(
  ( (Unit!30657) )
))
(declare-fun lt!408091 () Unit!30656)

(declare-fun lemmaKeyInListMapIsInArray!171 (array!53204 array!53202 (_ BitVec 32) (_ BitVec 32) V!29731 V!29731 (_ BitVec 64) Int) Unit!30656)

(assert (=> b!903871 (= lt!408091 (lemmaKeyInListMapIsInArray!171 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!903873 () Bool)

(declare-fun res!609829 () Bool)

(assert (=> b!903873 (=> (not res!609829) (not e!506460))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903873 (= res!609829 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29575 () Bool)

(declare-fun mapRes!29575 () Bool)

(declare-fun tp!56732 () Bool)

(assert (=> mapNonEmpty!29575 (= mapRes!29575 (and tp!56732 e!506462))))

(declare-fun mapRest!29575 () (Array (_ BitVec 32) ValueCell!8806))

(declare-fun mapValue!29575 () ValueCell!8806)

(declare-fun mapKey!29575 () (_ BitVec 32))

(assert (=> mapNonEmpty!29575 (= (arr!25560 _values!1152) (store mapRest!29575 mapKey!29575 mapValue!29575))))

(declare-fun b!903874 () Bool)

(assert (=> b!903874 (= e!506465 true)))

(declare-fun lt!408093 () V!29731)

(declare-fun apply!427 (ListLongMap!10827 (_ BitVec 64)) V!29731)

(assert (=> b!903874 (= lt!408093 (apply!427 lt!408092 k!1033))))

(declare-fun b!903875 () Bool)

(declare-fun res!609825 () Bool)

(assert (=> b!903875 (=> (not res!609825) (not e!506460))))

(declare-datatypes ((List!17950 0))(
  ( (Nil!17947) (Cons!17946 (h!19092 (_ BitVec 64)) (t!25333 List!17950)) )
))
(declare-fun arrayNoDuplicates!0 (array!53204 (_ BitVec 32) List!17950) Bool)

(assert (=> b!903875 (= res!609825 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17947))))

(declare-fun b!903876 () Bool)

(declare-fun res!609824 () Bool)

(assert (=> b!903876 (=> (not res!609824) (not e!506460))))

(assert (=> b!903876 (= res!609824 (contains!4477 (getCurrentListMap!2698 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903877 () Bool)

(declare-fun res!609828 () Bool)

(assert (=> b!903877 (=> (not res!609828) (not e!506460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53204 (_ BitVec 32)) Bool)

(assert (=> b!903877 (= res!609828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903878 () Bool)

(declare-fun e!506466 () Bool)

(declare-fun e!506463 () Bool)

(assert (=> b!903878 (= e!506466 (and e!506463 mapRes!29575))))

(declare-fun condMapEmpty!29575 () Bool)

(declare-fun mapDefault!29575 () ValueCell!8806)

