; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77568 () Bool)

(assert start!77568)

(declare-fun b_free!16153 () Bool)

(declare-fun b_next!16153 () Bool)

(assert (=> start!77568 (= b_free!16153 (not b_next!16153))))

(declare-fun tp!56721 () Bool)

(declare-fun b_and!26519 () Bool)

(assert (=> start!77568 (= tp!56721 b_and!26519)))

(declare-fun b!903795 () Bool)

(declare-fun res!609775 () Bool)

(declare-fun e!506419 () Bool)

(assert (=> b!903795 (=> (not res!609775) (not e!506419))))

(declare-datatypes ((array!53194 0))(
  ( (array!53195 (arr!25556 (Array (_ BitVec 32) (_ BitVec 64))) (size!26015 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53194)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53194 (_ BitVec 32)) Bool)

(assert (=> b!903795 (= res!609775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903796 () Bool)

(declare-fun res!609771 () Bool)

(assert (=> b!903796 (=> (not res!609771) (not e!506419))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((V!29727 0))(
  ( (V!29728 (val!9336 Int)) )
))
(declare-datatypes ((ValueCell!8804 0))(
  ( (ValueCellFull!8804 (v!11841 V!29727)) (EmptyCell!8804) )
))
(declare-datatypes ((array!53196 0))(
  ( (array!53197 (arr!25557 (Array (_ BitVec 32) ValueCell!8804)) (size!26016 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53196)

(assert (=> b!903796 (= res!609771 (and (= (size!26016 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26015 _keys!1386) (size!26016 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29569 () Bool)

(declare-fun mapRes!29569 () Bool)

(declare-fun tp!56720 () Bool)

(declare-fun e!506418 () Bool)

(assert (=> mapNonEmpty!29569 (= mapRes!29569 (and tp!56720 e!506418))))

(declare-fun mapKey!29569 () (_ BitVec 32))

(declare-fun mapRest!29569 () (Array (_ BitVec 32) ValueCell!8804))

(declare-fun mapValue!29569 () ValueCell!8804)

(assert (=> mapNonEmpty!29569 (= (arr!25557 _values!1152) (store mapRest!29569 mapKey!29569 mapValue!29569))))

(declare-fun b!903797 () Bool)

(declare-fun res!609773 () Bool)

(assert (=> b!903797 (=> (not res!609773) (not e!506419))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29727)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29727)

(declare-datatypes ((tuple2!12126 0))(
  ( (tuple2!12127 (_1!6074 (_ BitVec 64)) (_2!6074 V!29727)) )
))
(declare-datatypes ((List!17945 0))(
  ( (Nil!17942) (Cons!17941 (h!19087 tuple2!12126) (t!25328 List!17945)) )
))
(declare-datatypes ((ListLongMap!10823 0))(
  ( (ListLongMap!10824 (toList!5427 List!17945)) )
))
(declare-fun contains!4475 (ListLongMap!10823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2696 (array!53194 array!53196 (_ BitVec 32) (_ BitVec 32) V!29727 V!29727 (_ BitVec 32) Int) ListLongMap!10823)

(assert (=> b!903797 (= res!609773 (contains!4475 (getCurrentListMap!2696 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903798 () Bool)

(declare-fun res!609770 () Bool)

(assert (=> b!903798 (=> (not res!609770) (not e!506419))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!903798 (= res!609770 (and (= (select (arr!25556 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903799 () Bool)

(declare-fun e!506423 () Bool)

(declare-fun tp_is_empty!18571 () Bool)

(assert (=> b!903799 (= e!506423 tp_is_empty!18571)))

(declare-fun mapIsEmpty!29569 () Bool)

(assert (=> mapIsEmpty!29569 mapRes!29569))

(declare-fun b!903801 () Bool)

(declare-fun e!506422 () Bool)

(assert (=> b!903801 (= e!506419 (not e!506422))))

(declare-fun res!609769 () Bool)

(assert (=> b!903801 (=> res!609769 e!506422)))

(assert (=> b!903801 (= res!609769 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26015 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903801 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30652 0))(
  ( (Unit!30653) )
))
(declare-fun lt!408074 () Unit!30652)

(declare-fun lemmaKeyInListMapIsInArray!169 (array!53194 array!53196 (_ BitVec 32) (_ BitVec 32) V!29727 V!29727 (_ BitVec 64) Int) Unit!30652)

(assert (=> b!903801 (= lt!408074 (lemmaKeyInListMapIsInArray!169 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!903802 () Bool)

(declare-fun res!609774 () Bool)

(assert (=> b!903802 (=> (not res!609774) (not e!506419))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903802 (= res!609774 (inRange!0 i!717 mask!1756))))

(declare-fun b!903803 () Bool)

(declare-fun e!506421 () Bool)

(assert (=> b!903803 (= e!506421 true)))

(declare-fun lt!408075 () V!29727)

(declare-fun lt!408073 () ListLongMap!10823)

(declare-fun apply!425 (ListLongMap!10823 (_ BitVec 64)) V!29727)

(assert (=> b!903803 (= lt!408075 (apply!425 lt!408073 k!1033))))

(declare-fun b!903804 () Bool)

(assert (=> b!903804 (= e!506422 e!506421)))

(declare-fun res!609772 () Bool)

(assert (=> b!903804 (=> res!609772 e!506421)))

(assert (=> b!903804 (= res!609772 (not (contains!4475 lt!408073 k!1033)))))

(assert (=> b!903804 (= lt!408073 (getCurrentListMap!2696 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!903800 () Bool)

(declare-fun res!609776 () Bool)

(assert (=> b!903800 (=> (not res!609776) (not e!506419))))

(declare-datatypes ((List!17946 0))(
  ( (Nil!17943) (Cons!17942 (h!19088 (_ BitVec 64)) (t!25329 List!17946)) )
))
(declare-fun arrayNoDuplicates!0 (array!53194 (_ BitVec 32) List!17946) Bool)

(assert (=> b!903800 (= res!609776 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17943))))

(declare-fun res!609768 () Bool)

(assert (=> start!77568 (=> (not res!609768) (not e!506419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77568 (= res!609768 (validMask!0 mask!1756))))

(assert (=> start!77568 e!506419))

(declare-fun e!506424 () Bool)

(declare-fun array_inv!20024 (array!53196) Bool)

(assert (=> start!77568 (and (array_inv!20024 _values!1152) e!506424)))

(assert (=> start!77568 tp!56721))

(assert (=> start!77568 true))

(assert (=> start!77568 tp_is_empty!18571))

(declare-fun array_inv!20025 (array!53194) Bool)

(assert (=> start!77568 (array_inv!20025 _keys!1386)))

(declare-fun b!903805 () Bool)

(assert (=> b!903805 (= e!506424 (and e!506423 mapRes!29569))))

(declare-fun condMapEmpty!29569 () Bool)

(declare-fun mapDefault!29569 () ValueCell!8804)

