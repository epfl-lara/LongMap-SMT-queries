; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78056 () Bool)

(assert start!78056)

(declare-fun b_free!16583 () Bool)

(declare-fun b_next!16583 () Bool)

(assert (=> start!78056 (= b_free!16583 (not b_next!16583))))

(declare-fun tp!58020 () Bool)

(declare-fun b_and!27155 () Bool)

(assert (=> start!78056 (= tp!58020 b_and!27155)))

(declare-fun b!911136 () Bool)

(declare-fun e!510959 () Bool)

(declare-fun tp_is_empty!19001 () Bool)

(assert (=> b!911136 (= e!510959 tp_is_empty!19001)))

(declare-fun b!911137 () Bool)

(declare-fun res!614760 () Bool)

(declare-fun e!510956 () Bool)

(assert (=> b!911137 (=> (not res!614760) (not e!510956))))

(declare-datatypes ((V!30299 0))(
  ( (V!30300 (val!9551 Int)) )
))
(declare-datatypes ((ValueCell!9019 0))(
  ( (ValueCellFull!9019 (v!12060 V!30299)) (EmptyCell!9019) )
))
(declare-datatypes ((array!54006 0))(
  ( (array!54007 (arr!25959 (Array (_ BitVec 32) ValueCell!9019)) (size!26418 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54006)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54008 0))(
  ( (array!54009 (arr!25960 (Array (_ BitVec 32) (_ BitVec 64))) (size!26419 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54008)

(assert (=> b!911137 (= res!614760 (and (= (size!26418 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26419 _keys!1386) (size!26418 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911138 () Bool)

(declare-fun res!614762 () Bool)

(assert (=> b!911138 (=> (not res!614762) (not e!510956))))

(declare-datatypes ((List!18234 0))(
  ( (Nil!18231) (Cons!18230 (h!19376 (_ BitVec 64)) (t!25819 List!18234)) )
))
(declare-fun arrayNoDuplicates!0 (array!54008 (_ BitVec 32) List!18234) Bool)

(assert (=> b!911138 (= res!614762 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18231))))

(declare-fun res!614763 () Bool)

(assert (=> start!78056 (=> (not res!614763) (not e!510956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78056 (= res!614763 (validMask!0 mask!1756))))

(assert (=> start!78056 e!510956))

(declare-fun e!510958 () Bool)

(declare-fun array_inv!20294 (array!54006) Bool)

(assert (=> start!78056 (and (array_inv!20294 _values!1152) e!510958)))

(assert (=> start!78056 tp!58020))

(assert (=> start!78056 true))

(assert (=> start!78056 tp_is_empty!19001))

(declare-fun array_inv!20295 (array!54008) Bool)

(assert (=> start!78056 (array_inv!20295 _keys!1386)))

(declare-fun b!911139 () Bool)

(declare-fun e!510960 () Bool)

(assert (=> b!911139 (= e!510960 tp_is_empty!19001)))

(declare-fun mapNonEmpty!30223 () Bool)

(declare-fun mapRes!30223 () Bool)

(declare-fun tp!58019 () Bool)

(assert (=> mapNonEmpty!30223 (= mapRes!30223 (and tp!58019 e!510959))))

(declare-fun mapRest!30223 () (Array (_ BitVec 32) ValueCell!9019))

(declare-fun mapValue!30223 () ValueCell!9019)

(declare-fun mapKey!30223 () (_ BitVec 32))

(assert (=> mapNonEmpty!30223 (= (arr!25959 _values!1152) (store mapRest!30223 mapKey!30223 mapValue!30223))))

(declare-fun mapIsEmpty!30223 () Bool)

(assert (=> mapIsEmpty!30223 mapRes!30223))

(declare-fun b!911140 () Bool)

(assert (=> b!911140 (= e!510956 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30299)

(declare-fun lt!410357 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30299)

(declare-datatypes ((tuple2!12444 0))(
  ( (tuple2!12445 (_1!6233 (_ BitVec 64)) (_2!6233 V!30299)) )
))
(declare-datatypes ((List!18235 0))(
  ( (Nil!18232) (Cons!18231 (h!19377 tuple2!12444) (t!25820 List!18235)) )
))
(declare-datatypes ((ListLongMap!11141 0))(
  ( (ListLongMap!11142 (toList!5586 List!18235)) )
))
(declare-fun contains!4630 (ListLongMap!11141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2848 (array!54008 array!54006 (_ BitVec 32) (_ BitVec 32) V!30299 V!30299 (_ BitVec 32) Int) ListLongMap!11141)

(assert (=> b!911140 (= lt!410357 (contains!4630 (getCurrentListMap!2848 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911141 () Bool)

(declare-fun res!614761 () Bool)

(assert (=> b!911141 (=> (not res!614761) (not e!510956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54008 (_ BitVec 32)) Bool)

(assert (=> b!911141 (= res!614761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911142 () Bool)

(assert (=> b!911142 (= e!510958 (and e!510960 mapRes!30223))))

(declare-fun condMapEmpty!30223 () Bool)

(declare-fun mapDefault!30223 () ValueCell!9019)

