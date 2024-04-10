; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77846 () Bool)

(assert start!77846)

(declare-fun b_free!16405 () Bool)

(declare-fun b_next!16405 () Bool)

(assert (=> start!77846 (= b_free!16405 (not b_next!16405))))

(declare-fun tp!57480 () Bool)

(declare-fun b_and!26967 () Bool)

(assert (=> start!77846 (= tp!57480 b_and!26967)))

(declare-fun b!908965 () Bool)

(declare-fun res!613527 () Bool)

(declare-fun e!509462 () Bool)

(assert (=> b!908965 (=> (not res!613527) (not e!509462))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53674 0))(
  ( (array!53675 (arr!25795 (Array (_ BitVec 32) (_ BitVec 64))) (size!26254 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53674)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!908965 (= res!613527 (and (= (select (arr!25795 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908966 () Bool)

(declare-fun res!613533 () Bool)

(declare-fun e!509460 () Bool)

(assert (=> b!908966 (=> res!613533 e!509460)))

(declare-datatypes ((V!30063 0))(
  ( (V!30064 (val!9462 Int)) )
))
(declare-fun lt!409908 () V!30063)

(declare-datatypes ((tuple2!12330 0))(
  ( (tuple2!12331 (_1!6176 (_ BitVec 64)) (_2!6176 V!30063)) )
))
(declare-datatypes ((List!18123 0))(
  ( (Nil!18120) (Cons!18119 (h!19265 tuple2!12330) (t!25700 List!18123)) )
))
(declare-datatypes ((ListLongMap!11027 0))(
  ( (ListLongMap!11028 (toList!5529 List!18123)) )
))
(declare-fun lt!409907 () ListLongMap!11027)

(declare-fun apply!509 (ListLongMap!11027 (_ BitVec 64)) V!30063)

(assert (=> b!908966 (= res!613533 (not (= (apply!509 lt!409907 k!1033) lt!409908)))))

(declare-fun b!908967 () Bool)

(declare-fun e!509456 () Bool)

(declare-fun tp_is_empty!18823 () Bool)

(assert (=> b!908967 (= e!509456 tp_is_empty!18823)))

(declare-fun b!908968 () Bool)

(declare-fun res!613532 () Bool)

(assert (=> b!908968 (=> (not res!613532) (not e!509462))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908968 (= res!613532 (inRange!0 i!717 mask!1756))))

(declare-fun b!908969 () Bool)

(declare-fun e!509459 () Bool)

(assert (=> b!908969 (= e!509459 e!509460)))

(declare-fun res!613529 () Bool)

(assert (=> b!908969 (=> res!613529 e!509460)))

(declare-fun contains!4571 (ListLongMap!11027 (_ BitVec 64)) Bool)

(assert (=> b!908969 (= res!613529 (not (contains!4571 lt!409907 k!1033)))))

(declare-datatypes ((ValueCell!8930 0))(
  ( (ValueCellFull!8930 (v!11969 V!30063)) (EmptyCell!8930) )
))
(declare-datatypes ((array!53676 0))(
  ( (array!53677 (arr!25796 (Array (_ BitVec 32) ValueCell!8930)) (size!26255 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53676)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30063)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30063)

(declare-fun getCurrentListMap!2791 (array!53674 array!53676 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 32) Int) ListLongMap!11027)

(assert (=> b!908969 (= lt!409907 (getCurrentListMap!2791 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29950 () Bool)

(declare-fun mapRes!29950 () Bool)

(declare-fun tp!57479 () Bool)

(assert (=> mapNonEmpty!29950 (= mapRes!29950 (and tp!57479 e!509456))))

(declare-fun mapValue!29950 () ValueCell!8930)

(declare-fun mapRest!29950 () (Array (_ BitVec 32) ValueCell!8930))

(declare-fun mapKey!29950 () (_ BitVec 32))

(assert (=> mapNonEmpty!29950 (= (arr!25796 _values!1152) (store mapRest!29950 mapKey!29950 mapValue!29950))))

(declare-fun b!908970 () Bool)

(declare-fun e!509458 () Bool)

(assert (=> b!908970 (= e!509458 e!509462)))

(declare-fun res!613528 () Bool)

(assert (=> b!908970 (=> (not res!613528) (not e!509462))))

(declare-fun lt!409909 () ListLongMap!11027)

(assert (=> b!908970 (= res!613528 (contains!4571 lt!409909 k!1033))))

(assert (=> b!908970 (= lt!409909 (getCurrentListMap!2791 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908971 () Bool)

(declare-fun res!613524 () Bool)

(assert (=> b!908971 (=> (not res!613524) (not e!509458))))

(assert (=> b!908971 (= res!613524 (and (= (size!26255 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26254 _keys!1386) (size!26255 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29950 () Bool)

(assert (=> mapIsEmpty!29950 mapRes!29950))

(declare-fun res!613525 () Bool)

(assert (=> start!77846 (=> (not res!613525) (not e!509458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77846 (= res!613525 (validMask!0 mask!1756))))

(assert (=> start!77846 e!509458))

(declare-fun e!509463 () Bool)

(declare-fun array_inv!20190 (array!53676) Bool)

(assert (=> start!77846 (and (array_inv!20190 _values!1152) e!509463)))

(assert (=> start!77846 tp!57480))

(assert (=> start!77846 true))

(assert (=> start!77846 tp_is_empty!18823))

(declare-fun array_inv!20191 (array!53674) Bool)

(assert (=> start!77846 (array_inv!20191 _keys!1386)))

(declare-fun b!908972 () Bool)

(assert (=> b!908972 (= e!509460 true)))

(assert (=> b!908972 (= (apply!509 lt!409909 k!1033) lt!409908)))

(declare-datatypes ((Unit!30850 0))(
  ( (Unit!30851) )
))
(declare-fun lt!409906 () Unit!30850)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!60 (array!53674 array!53676 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 64) V!30063 (_ BitVec 32) Int) Unit!30850)

(assert (=> b!908972 (= lt!409906 (lemmaListMapApplyFromThenApplyFromZero!60 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409908 i!717 defaultEntry!1160))))

(declare-fun b!908973 () Bool)

(declare-fun res!613526 () Bool)

(assert (=> b!908973 (=> (not res!613526) (not e!509458))))

(declare-datatypes ((List!18124 0))(
  ( (Nil!18121) (Cons!18120 (h!19266 (_ BitVec 64)) (t!25701 List!18124)) )
))
(declare-fun arrayNoDuplicates!0 (array!53674 (_ BitVec 32) List!18124) Bool)

(assert (=> b!908973 (= res!613526 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18121))))

(declare-fun b!908974 () Bool)

(assert (=> b!908974 (= e!509462 (not e!509459))))

(declare-fun res!613531 () Bool)

(assert (=> b!908974 (=> res!613531 e!509459)))

(assert (=> b!908974 (= res!613531 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26254 _keys!1386))))))

(declare-fun get!13584 (ValueCell!8930 V!30063) V!30063)

(declare-fun dynLambda!1385 (Int (_ BitVec 64)) V!30063)

(assert (=> b!908974 (= lt!409908 (get!13584 (select (arr!25796 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908974 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409910 () Unit!30850)

(declare-fun lemmaKeyInListMapIsInArray!257 (array!53674 array!53676 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 64) Int) Unit!30850)

(assert (=> b!908974 (= lt!409910 (lemmaKeyInListMapIsInArray!257 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!908975 () Bool)

(declare-fun e!509461 () Bool)

(assert (=> b!908975 (= e!509463 (and e!509461 mapRes!29950))))

(declare-fun condMapEmpty!29950 () Bool)

(declare-fun mapDefault!29950 () ValueCell!8930)

