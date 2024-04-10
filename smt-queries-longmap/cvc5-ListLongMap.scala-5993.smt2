; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77810 () Bool)

(assert start!77810)

(declare-fun b_free!16369 () Bool)

(declare-fun b_next!16369 () Bool)

(assert (=> start!77810 (= b_free!16369 (not b_next!16369))))

(declare-fun tp!57371 () Bool)

(declare-fun b_and!26895 () Bool)

(assert (=> start!77810 (= tp!57371 b_and!26895)))

(declare-fun b!908227 () Bool)

(declare-fun res!612988 () Bool)

(declare-fun e!509031 () Bool)

(assert (=> b!908227 (=> (not res!612988) (not e!509031))))

(declare-datatypes ((V!30015 0))(
  ( (V!30016 (val!9444 Int)) )
))
(declare-datatypes ((ValueCell!8912 0))(
  ( (ValueCellFull!8912 (v!11951 V!30015)) (EmptyCell!8912) )
))
(declare-datatypes ((array!53608 0))(
  ( (array!53609 (arr!25762 (Array (_ BitVec 32) ValueCell!8912)) (size!26221 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53608)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53610 0))(
  ( (array!53611 (arr!25763 (Array (_ BitVec 32) (_ BitVec 64))) (size!26222 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53610)

(assert (=> b!908227 (= res!612988 (and (= (size!26221 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26222 _keys!1386) (size!26221 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908228 () Bool)

(declare-fun e!509030 () Bool)

(declare-fun tp_is_empty!18787 () Bool)

(assert (=> b!908228 (= e!509030 tp_is_empty!18787)))

(declare-fun mapIsEmpty!29896 () Bool)

(declare-fun mapRes!29896 () Bool)

(assert (=> mapIsEmpty!29896 mapRes!29896))

(declare-fun b!908229 () Bool)

(declare-fun e!509025 () Bool)

(assert (=> b!908229 (= e!509031 e!509025)))

(declare-fun res!612990 () Bool)

(assert (=> b!908229 (=> (not res!612990) (not e!509025))))

(declare-datatypes ((tuple2!12302 0))(
  ( (tuple2!12303 (_1!6162 (_ BitVec 64)) (_2!6162 V!30015)) )
))
(declare-datatypes ((List!18101 0))(
  ( (Nil!18098) (Cons!18097 (h!19243 tuple2!12302) (t!25642 List!18101)) )
))
(declare-datatypes ((ListLongMap!10999 0))(
  ( (ListLongMap!11000 (toList!5515 List!18101)) )
))
(declare-fun lt!409638 () ListLongMap!10999)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4558 (ListLongMap!10999 (_ BitVec 64)) Bool)

(assert (=> b!908229 (= res!612990 (contains!4558 lt!409638 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30015)

(declare-fun minValue!1094 () V!30015)

(declare-fun getCurrentListMap!2778 (array!53610 array!53608 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 32) Int) ListLongMap!10999)

(assert (=> b!908229 (= lt!409638 (getCurrentListMap!2778 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908230 () Bool)

(declare-fun e!509026 () Bool)

(assert (=> b!908230 (= e!509026 true)))

(declare-fun lt!409640 () V!30015)

(declare-fun apply!499 (ListLongMap!10999 (_ BitVec 64)) V!30015)

(assert (=> b!908230 (= (apply!499 lt!409638 k!1033) lt!409640)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30826 0))(
  ( (Unit!30827) )
))
(declare-fun lt!409636 () Unit!30826)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!51 (array!53610 array!53608 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 64) V!30015 (_ BitVec 32) Int) Unit!30826)

(assert (=> b!908230 (= lt!409636 (lemmaListMapApplyFromThenApplyFromZero!51 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409640 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29896 () Bool)

(declare-fun tp!57372 () Bool)

(declare-fun e!509024 () Bool)

(assert (=> mapNonEmpty!29896 (= mapRes!29896 (and tp!57372 e!509024))))

(declare-fun mapValue!29896 () ValueCell!8912)

(declare-fun mapRest!29896 () (Array (_ BitVec 32) ValueCell!8912))

(declare-fun mapKey!29896 () (_ BitVec 32))

(assert (=> mapNonEmpty!29896 (= (arr!25762 _values!1152) (store mapRest!29896 mapKey!29896 mapValue!29896))))

(declare-fun b!908231 () Bool)

(declare-fun res!612986 () Bool)

(assert (=> b!908231 (=> (not res!612986) (not e!509025))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908231 (= res!612986 (inRange!0 i!717 mask!1756))))

(declare-fun b!908232 () Bool)

(declare-fun res!612984 () Bool)

(assert (=> b!908232 (=> res!612984 e!509026)))

(declare-fun lt!409639 () ListLongMap!10999)

(assert (=> b!908232 (= res!612984 (not (= (apply!499 lt!409639 k!1033) lt!409640)))))

(declare-fun b!908233 () Bool)

(declare-fun e!509028 () Bool)

(assert (=> b!908233 (= e!509025 (not e!509028))))

(declare-fun res!612991 () Bool)

(assert (=> b!908233 (=> res!612991 e!509028)))

(assert (=> b!908233 (= res!612991 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26222 _keys!1386))))))

(declare-fun get!13561 (ValueCell!8912 V!30015) V!30015)

(declare-fun dynLambda!1374 (Int (_ BitVec 64)) V!30015)

(assert (=> b!908233 (= lt!409640 (get!13561 (select (arr!25762 _values!1152) i!717) (dynLambda!1374 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908233 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409637 () Unit!30826)

(declare-fun lemmaKeyInListMapIsInArray!246 (array!53610 array!53608 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 64) Int) Unit!30826)

(assert (=> b!908233 (= lt!409637 (lemmaKeyInListMapIsInArray!246 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun res!612987 () Bool)

(assert (=> start!77810 (=> (not res!612987) (not e!509031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77810 (= res!612987 (validMask!0 mask!1756))))

(assert (=> start!77810 e!509031))

(declare-fun e!509029 () Bool)

(declare-fun array_inv!20172 (array!53608) Bool)

(assert (=> start!77810 (and (array_inv!20172 _values!1152) e!509029)))

(assert (=> start!77810 tp!57371))

(assert (=> start!77810 true))

(assert (=> start!77810 tp_is_empty!18787))

(declare-fun array_inv!20173 (array!53610) Bool)

(assert (=> start!77810 (array_inv!20173 _keys!1386)))

(declare-fun b!908234 () Bool)

(declare-fun res!612993 () Bool)

(assert (=> b!908234 (=> (not res!612993) (not e!509031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53610 (_ BitVec 32)) Bool)

(assert (=> b!908234 (= res!612993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908235 () Bool)

(assert (=> b!908235 (= e!509029 (and e!509030 mapRes!29896))))

(declare-fun condMapEmpty!29896 () Bool)

(declare-fun mapDefault!29896 () ValueCell!8912)

