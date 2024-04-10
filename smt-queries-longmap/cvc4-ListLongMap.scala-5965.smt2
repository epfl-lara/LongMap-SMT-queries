; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77620 () Bool)

(assert start!77620)

(declare-fun b_free!16205 () Bool)

(declare-fun b_next!16205 () Bool)

(assert (=> start!77620 (= b_free!16205 (not b_next!16205))))

(declare-fun tp!56876 () Bool)

(declare-fun b_and!26571 () Bool)

(assert (=> start!77620 (= tp!56876 b_and!26571)))

(declare-fun b!904731 () Bool)

(declare-fun e!506968 () Bool)

(assert (=> b!904731 (= e!506968 true)))

(declare-datatypes ((V!29795 0))(
  ( (V!29796 (val!9362 Int)) )
))
(declare-fun lt!408309 () V!29795)

(declare-datatypes ((tuple2!12166 0))(
  ( (tuple2!12167 (_1!6094 (_ BitVec 64)) (_2!6094 V!29795)) )
))
(declare-datatypes ((List!17980 0))(
  ( (Nil!17977) (Cons!17976 (h!19122 tuple2!12166) (t!25363 List!17980)) )
))
(declare-datatypes ((ListLongMap!10863 0))(
  ( (ListLongMap!10864 (toList!5447 List!17980)) )
))
(declare-fun lt!408308 () ListLongMap!10863)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!440 (ListLongMap!10863 (_ BitVec 64)) V!29795)

(assert (=> b!904731 (= lt!408309 (apply!440 lt!408308 k!1033))))

(declare-fun b!904732 () Bool)

(declare-fun res!610477 () Bool)

(declare-fun e!506970 () Bool)

(assert (=> b!904732 (=> (not res!610477) (not e!506970))))

(declare-datatypes ((ValueCell!8830 0))(
  ( (ValueCellFull!8830 (v!11867 V!29795)) (EmptyCell!8830) )
))
(declare-datatypes ((array!53290 0))(
  ( (array!53291 (arr!25604 (Array (_ BitVec 32) ValueCell!8830)) (size!26063 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53290)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53292 0))(
  ( (array!53293 (arr!25605 (Array (_ BitVec 32) (_ BitVec 64))) (size!26064 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53292)

(assert (=> b!904732 (= res!610477 (and (= (size!26063 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26064 _keys!1386) (size!26063 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904733 () Bool)

(declare-fun e!506964 () Bool)

(assert (=> b!904733 (= e!506970 (not e!506964))))

(declare-fun res!610476 () Bool)

(assert (=> b!904733 (=> res!610476 e!506964)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904733 (= res!610476 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26064 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904733 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29795)

(declare-datatypes ((Unit!30688 0))(
  ( (Unit!30689) )
))
(declare-fun lt!408307 () Unit!30688)

(declare-fun minValue!1094 () V!29795)

(declare-fun lemmaKeyInListMapIsInArray!187 (array!53292 array!53290 (_ BitVec 32) (_ BitVec 32) V!29795 V!29795 (_ BitVec 64) Int) Unit!30688)

(assert (=> b!904733 (= lt!408307 (lemmaKeyInListMapIsInArray!187 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904734 () Bool)

(declare-fun res!610478 () Bool)

(assert (=> b!904734 (=> (not res!610478) (not e!506970))))

(assert (=> b!904734 (= res!610478 (and (= (select (arr!25605 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!610475 () Bool)

(assert (=> start!77620 (=> (not res!610475) (not e!506970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77620 (= res!610475 (validMask!0 mask!1756))))

(assert (=> start!77620 e!506970))

(declare-fun e!506965 () Bool)

(declare-fun array_inv!20060 (array!53290) Bool)

(assert (=> start!77620 (and (array_inv!20060 _values!1152) e!506965)))

(assert (=> start!77620 tp!56876))

(assert (=> start!77620 true))

(declare-fun tp_is_empty!18623 () Bool)

(assert (=> start!77620 tp_is_empty!18623))

(declare-fun array_inv!20061 (array!53292) Bool)

(assert (=> start!77620 (array_inv!20061 _keys!1386)))

(declare-fun b!904735 () Bool)

(declare-fun res!610470 () Bool)

(assert (=> b!904735 (=> (not res!610470) (not e!506970))))

(declare-fun contains!4494 (ListLongMap!10863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2715 (array!53292 array!53290 (_ BitVec 32) (_ BitVec 32) V!29795 V!29795 (_ BitVec 32) Int) ListLongMap!10863)

(assert (=> b!904735 (= res!610470 (contains!4494 (getCurrentListMap!2715 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!29647 () Bool)

(declare-fun mapRes!29647 () Bool)

(declare-fun tp!56877 () Bool)

(declare-fun e!506967 () Bool)

(assert (=> mapNonEmpty!29647 (= mapRes!29647 (and tp!56877 e!506967))))

(declare-fun mapKey!29647 () (_ BitVec 32))

(declare-fun mapValue!29647 () ValueCell!8830)

(declare-fun mapRest!29647 () (Array (_ BitVec 32) ValueCell!8830))

(assert (=> mapNonEmpty!29647 (= (arr!25604 _values!1152) (store mapRest!29647 mapKey!29647 mapValue!29647))))

(declare-fun b!904736 () Bool)

(declare-fun e!506966 () Bool)

(assert (=> b!904736 (= e!506966 tp_is_empty!18623)))

(declare-fun b!904737 () Bool)

(declare-fun res!610471 () Bool)

(assert (=> b!904737 (=> (not res!610471) (not e!506970))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904737 (= res!610471 (inRange!0 i!717 mask!1756))))

(declare-fun b!904738 () Bool)

(assert (=> b!904738 (= e!506964 e!506968)))

(declare-fun res!610472 () Bool)

(assert (=> b!904738 (=> res!610472 e!506968)))

(assert (=> b!904738 (= res!610472 (not (contains!4494 lt!408308 k!1033)))))

(assert (=> b!904738 (= lt!408308 (getCurrentListMap!2715 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904739 () Bool)

(declare-fun res!610474 () Bool)

(assert (=> b!904739 (=> (not res!610474) (not e!506970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53292 (_ BitVec 32)) Bool)

(assert (=> b!904739 (= res!610474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904740 () Bool)

(assert (=> b!904740 (= e!506965 (and e!506966 mapRes!29647))))

(declare-fun condMapEmpty!29647 () Bool)

(declare-fun mapDefault!29647 () ValueCell!8830)

