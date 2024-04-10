; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77604 () Bool)

(assert start!77604)

(declare-fun b_free!16189 () Bool)

(declare-fun b_next!16189 () Bool)

(assert (=> start!77604 (= b_free!16189 (not b_next!16189))))

(declare-fun tp!56829 () Bool)

(declare-fun b_and!26555 () Bool)

(assert (=> start!77604 (= tp!56829 b_and!26555)))

(declare-fun mapIsEmpty!29623 () Bool)

(declare-fun mapRes!29623 () Bool)

(assert (=> mapIsEmpty!29623 mapRes!29623))

(declare-fun mapNonEmpty!29623 () Bool)

(declare-fun tp!56828 () Bool)

(declare-fun e!506797 () Bool)

(assert (=> mapNonEmpty!29623 (= mapRes!29623 (and tp!56828 e!506797))))

(declare-datatypes ((V!29775 0))(
  ( (V!29776 (val!9354 Int)) )
))
(declare-datatypes ((ValueCell!8822 0))(
  ( (ValueCellFull!8822 (v!11859 V!29775)) (EmptyCell!8822) )
))
(declare-fun mapRest!29623 () (Array (_ BitVec 32) ValueCell!8822))

(declare-fun mapValue!29623 () ValueCell!8822)

(declare-fun mapKey!29623 () (_ BitVec 32))

(declare-datatypes ((array!53258 0))(
  ( (array!53259 (arr!25588 (Array (_ BitVec 32) ValueCell!8822)) (size!26047 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53258)

(assert (=> mapNonEmpty!29623 (= (arr!25588 _values!1152) (store mapRest!29623 mapKey!29623 mapValue!29623))))

(declare-fun b!904443 () Bool)

(declare-fun res!610262 () Bool)

(declare-fun e!506801 () Bool)

(assert (=> b!904443 (=> (not res!610262) (not e!506801))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29775)

(declare-datatypes ((array!53260 0))(
  ( (array!53261 (arr!25589 (Array (_ BitVec 32) (_ BitVec 64))) (size!26048 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53260)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29775)

(declare-datatypes ((tuple2!12152 0))(
  ( (tuple2!12153 (_1!6087 (_ BitVec 64)) (_2!6087 V!29775)) )
))
(declare-datatypes ((List!17970 0))(
  ( (Nil!17967) (Cons!17966 (h!19112 tuple2!12152) (t!25353 List!17970)) )
))
(declare-datatypes ((ListLongMap!10849 0))(
  ( (ListLongMap!10850 (toList!5440 List!17970)) )
))
(declare-fun contains!4488 (ListLongMap!10849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2709 (array!53260 array!53258 (_ BitVec 32) (_ BitVec 32) V!29775 V!29775 (_ BitVec 32) Int) ListLongMap!10849)

(assert (=> b!904443 (= res!610262 (contains!4488 (getCurrentListMap!2709 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904444 () Bool)

(declare-fun e!506799 () Bool)

(declare-fun e!506796 () Bool)

(assert (=> b!904444 (= e!506799 e!506796)))

(declare-fun res!610261 () Bool)

(assert (=> b!904444 (=> res!610261 e!506796)))

(declare-fun lt!408237 () ListLongMap!10849)

(assert (=> b!904444 (= res!610261 (not (contains!4488 lt!408237 k!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904444 (= lt!408237 (getCurrentListMap!2709 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904445 () Bool)

(declare-fun res!610259 () Bool)

(assert (=> b!904445 (=> (not res!610259) (not e!506801))))

(assert (=> b!904445 (= res!610259 (and (= (select (arr!25589 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904446 () Bool)

(declare-fun e!506798 () Bool)

(declare-fun tp_is_empty!18607 () Bool)

(assert (=> b!904446 (= e!506798 tp_is_empty!18607)))

(declare-fun b!904447 () Bool)

(assert (=> b!904447 (= e!506797 tp_is_empty!18607)))

(declare-fun b!904449 () Bool)

(assert (=> b!904449 (= e!506801 (not e!506799))))

(declare-fun res!610254 () Bool)

(assert (=> b!904449 (=> res!610254 e!506799)))

(assert (=> b!904449 (= res!610254 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26048 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904449 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30674 0))(
  ( (Unit!30675) )
))
(declare-fun lt!408235 () Unit!30674)

(declare-fun lemmaKeyInListMapIsInArray!180 (array!53260 array!53258 (_ BitVec 32) (_ BitVec 32) V!29775 V!29775 (_ BitVec 64) Int) Unit!30674)

(assert (=> b!904449 (= lt!408235 (lemmaKeyInListMapIsInArray!180 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904450 () Bool)

(declare-fun e!506800 () Bool)

(assert (=> b!904450 (= e!506800 (and e!506798 mapRes!29623))))

(declare-fun condMapEmpty!29623 () Bool)

(declare-fun mapDefault!29623 () ValueCell!8822)

