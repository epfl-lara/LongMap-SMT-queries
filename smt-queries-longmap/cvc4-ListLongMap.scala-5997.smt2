; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77838 () Bool)

(assert start!77838)

(declare-fun b_free!16397 () Bool)

(declare-fun b_next!16397 () Bool)

(assert (=> start!77838 (= b_free!16397 (not b_next!16397))))

(declare-fun tp!57455 () Bool)

(declare-fun b_and!26951 () Bool)

(assert (=> start!77838 (= tp!57455 b_and!26951)))

(declare-fun b!908801 () Bool)

(declare-fun res!613407 () Bool)

(declare-fun e!509367 () Bool)

(assert (=> b!908801 (=> (not res!613407) (not e!509367))))

(declare-datatypes ((array!53658 0))(
  ( (array!53659 (arr!25787 (Array (_ BitVec 32) (_ BitVec 64))) (size!26246 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53658)

(declare-datatypes ((List!18118 0))(
  ( (Nil!18115) (Cons!18114 (h!19260 (_ BitVec 64)) (t!25687 List!18118)) )
))
(declare-fun arrayNoDuplicates!0 (array!53658 (_ BitVec 32) List!18118) Bool)

(assert (=> b!908801 (= res!613407 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18115))))

(declare-fun b!908802 () Bool)

(declare-fun e!509360 () Bool)

(declare-fun e!509365 () Bool)

(assert (=> b!908802 (= e!509360 (not e!509365))))

(declare-fun res!613413 () Bool)

(assert (=> b!908802 (=> res!613413 e!509365)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!908802 (= res!613413 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26246 _keys!1386))))))

(declare-datatypes ((V!30051 0))(
  ( (V!30052 (val!9458 Int)) )
))
(declare-datatypes ((ValueCell!8926 0))(
  ( (ValueCellFull!8926 (v!11965 V!30051)) (EmptyCell!8926) )
))
(declare-datatypes ((array!53660 0))(
  ( (array!53661 (arr!25788 (Array (_ BitVec 32) ValueCell!8926)) (size!26247 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53660)

(declare-fun lt!409849 () V!30051)

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13577 (ValueCell!8926 V!30051) V!30051)

(declare-fun dynLambda!1382 (Int (_ BitVec 64)) V!30051)

(assert (=> b!908802 (= lt!409849 (get!13577 (select (arr!25788 _values!1152) i!717) (dynLambda!1382 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908802 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30051)

(declare-datatypes ((Unit!30844 0))(
  ( (Unit!30845) )
))
(declare-fun lt!409848 () Unit!30844)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30051)

(declare-fun lemmaKeyInListMapIsInArray!254 (array!53658 array!53660 (_ BitVec 32) (_ BitVec 32) V!30051 V!30051 (_ BitVec 64) Int) Unit!30844)

(assert (=> b!908802 (= lt!409848 (lemmaKeyInListMapIsInArray!254 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!908803 () Bool)

(declare-fun res!613408 () Bool)

(assert (=> b!908803 (=> (not res!613408) (not e!509367))))

(assert (=> b!908803 (= res!613408 (and (= (size!26247 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26246 _keys!1386) (size!26247 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908804 () Bool)

(declare-fun e!509362 () Bool)

(assert (=> b!908804 (= e!509362 true)))

(declare-datatypes ((tuple2!12324 0))(
  ( (tuple2!12325 (_1!6173 (_ BitVec 64)) (_2!6173 V!30051)) )
))
(declare-datatypes ((List!18119 0))(
  ( (Nil!18116) (Cons!18115 (h!19261 tuple2!12324) (t!25688 List!18119)) )
))
(declare-datatypes ((ListLongMap!11021 0))(
  ( (ListLongMap!11022 (toList!5526 List!18119)) )
))
(declare-fun lt!409846 () ListLongMap!11021)

(declare-fun apply!506 (ListLongMap!11021 (_ BitVec 64)) V!30051)

(assert (=> b!908804 (= (apply!506 lt!409846 k!1033) lt!409849)))

(declare-fun lt!409847 () Unit!30844)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!58 (array!53658 array!53660 (_ BitVec 32) (_ BitVec 32) V!30051 V!30051 (_ BitVec 64) V!30051 (_ BitVec 32) Int) Unit!30844)

(assert (=> b!908804 (= lt!409847 (lemmaListMapApplyFromThenApplyFromZero!58 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409849 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29938 () Bool)

(declare-fun mapRes!29938 () Bool)

(assert (=> mapIsEmpty!29938 mapRes!29938))

(declare-fun b!908805 () Bool)

(declare-fun res!613406 () Bool)

(assert (=> b!908805 (=> (not res!613406) (not e!509367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53658 (_ BitVec 32)) Bool)

(assert (=> b!908805 (= res!613406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908806 () Bool)

(declare-fun e!509366 () Bool)

(declare-fun tp_is_empty!18815 () Bool)

(assert (=> b!908806 (= e!509366 tp_is_empty!18815)))

(declare-fun b!908807 () Bool)

(declare-fun res!613410 () Bool)

(assert (=> b!908807 (=> (not res!613410) (not e!509360))))

(assert (=> b!908807 (= res!613410 (and (= (select (arr!25787 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908808 () Bool)

(declare-fun e!509363 () Bool)

(declare-fun e!509364 () Bool)

(assert (=> b!908808 (= e!509363 (and e!509364 mapRes!29938))))

(declare-fun condMapEmpty!29938 () Bool)

(declare-fun mapDefault!29938 () ValueCell!8926)

