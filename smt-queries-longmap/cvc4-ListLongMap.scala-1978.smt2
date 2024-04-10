; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34734 () Bool)

(assert start!34734)

(declare-fun b_free!7541 () Bool)

(declare-fun b_next!7541 () Bool)

(assert (=> start!34734 (= b_free!7541 (not b_next!7541))))

(declare-fun tp!26186 () Bool)

(declare-fun b_and!14761 () Bool)

(assert (=> start!34734 (= tp!26186 b_and!14761)))

(declare-fun b!347342 () Bool)

(declare-fun res!192261 () Bool)

(declare-fun e!212827 () Bool)

(assert (=> b!347342 (=> (not res!192261) (not e!212827))))

(declare-datatypes ((array!18577 0))(
  ( (array!18578 (arr!8799 (Array (_ BitVec 32) (_ BitVec 64))) (size!9151 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18577)

(declare-datatypes ((List!5109 0))(
  ( (Nil!5106) (Cons!5105 (h!5961 (_ BitVec 64)) (t!10237 List!5109)) )
))
(declare-fun arrayNoDuplicates!0 (array!18577 (_ BitVec 32) List!5109) Bool)

(assert (=> b!347342 (= res!192261 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5106))))

(declare-fun b!347343 () Bool)

(declare-fun res!192262 () Bool)

(assert (=> b!347343 (=> (not res!192262) (not e!212827))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10967 0))(
  ( (V!10968 (val!3791 Int)) )
))
(declare-fun zeroValue!1467 () V!10967)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3403 0))(
  ( (ValueCellFull!3403 (v!5973 V!10967)) (EmptyCell!3403) )
))
(declare-datatypes ((array!18579 0))(
  ( (array!18580 (arr!8800 (Array (_ BitVec 32) ValueCell!3403)) (size!9152 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18579)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10967)

(declare-datatypes ((tuple2!5488 0))(
  ( (tuple2!5489 (_1!2755 (_ BitVec 64)) (_2!2755 V!10967)) )
))
(declare-datatypes ((List!5110 0))(
  ( (Nil!5107) (Cons!5106 (h!5962 tuple2!5488) (t!10238 List!5110)) )
))
(declare-datatypes ((ListLongMap!4401 0))(
  ( (ListLongMap!4402 (toList!2216 List!5110)) )
))
(declare-fun contains!2280 (ListLongMap!4401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1737 (array!18577 array!18579 (_ BitVec 32) (_ BitVec 32) V!10967 V!10967 (_ BitVec 32) Int) ListLongMap!4401)

(assert (=> b!347343 (= res!192262 (not (contains!2280 (getCurrentListMap!1737 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!347344 () Bool)

(declare-fun e!212831 () Bool)

(assert (=> b!347344 (= e!212831 (not true))))

(declare-fun arrayContainsKey!0 (array!18577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347344 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10785 0))(
  ( (Unit!10786) )
))
(declare-fun lt!163534 () Unit!10785)

(declare-datatypes ((SeekEntryResult!3395 0))(
  ( (MissingZero!3395 (index!15759 (_ BitVec 32))) (Found!3395 (index!15760 (_ BitVec 32))) (Intermediate!3395 (undefined!4207 Bool) (index!15761 (_ BitVec 32)) (x!34601 (_ BitVec 32))) (Undefined!3395) (MissingVacant!3395 (index!15762 (_ BitVec 32))) )
))
(declare-fun lt!163533 () SeekEntryResult!3395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18577 (_ BitVec 64) (_ BitVec 32)) Unit!10785)

(assert (=> b!347344 (= lt!163534 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15760 lt!163533)))))

(declare-fun b!347345 () Bool)

(assert (=> b!347345 (= e!212827 e!212831)))

(declare-fun res!192265 () Bool)

(assert (=> b!347345 (=> (not res!192265) (not e!212831))))

(assert (=> b!347345 (= res!192265 (and (is-Found!3395 lt!163533) (= (select (arr!8799 _keys!1895) (index!15760 lt!163533)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18577 (_ BitVec 32)) SeekEntryResult!3395)

(assert (=> b!347345 (= lt!163533 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!192263 () Bool)

(assert (=> start!34734 (=> (not res!192263) (not e!212827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34734 (= res!192263 (validMask!0 mask!2385))))

(assert (=> start!34734 e!212827))

(assert (=> start!34734 true))

(declare-fun tp_is_empty!7493 () Bool)

(assert (=> start!34734 tp_is_empty!7493))

(assert (=> start!34734 tp!26186))

(declare-fun e!212829 () Bool)

(declare-fun array_inv!6516 (array!18579) Bool)

(assert (=> start!34734 (and (array_inv!6516 _values!1525) e!212829)))

(declare-fun array_inv!6517 (array!18577) Bool)

(assert (=> start!34734 (array_inv!6517 _keys!1895)))

(declare-fun mapIsEmpty!12696 () Bool)

(declare-fun mapRes!12696 () Bool)

(assert (=> mapIsEmpty!12696 mapRes!12696))

(declare-fun b!347346 () Bool)

(declare-fun res!192264 () Bool)

(assert (=> b!347346 (=> (not res!192264) (not e!212831))))

(assert (=> b!347346 (= res!192264 (arrayContainsKey!0 _keys!1895 k!1348 (index!15760 lt!163533)))))

(declare-fun b!347347 () Bool)

(declare-fun res!192266 () Bool)

(assert (=> b!347347 (=> (not res!192266) (not e!212827))))

(assert (=> b!347347 (= res!192266 (and (= (size!9152 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9151 _keys!1895) (size!9152 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347348 () Bool)

(declare-fun res!192259 () Bool)

(assert (=> b!347348 (=> (not res!192259) (not e!212827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18577 (_ BitVec 32)) Bool)

(assert (=> b!347348 (= res!192259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12696 () Bool)

(declare-fun tp!26187 () Bool)

(declare-fun e!212830 () Bool)

(assert (=> mapNonEmpty!12696 (= mapRes!12696 (and tp!26187 e!212830))))

(declare-fun mapRest!12696 () (Array (_ BitVec 32) ValueCell!3403))

(declare-fun mapKey!12696 () (_ BitVec 32))

(declare-fun mapValue!12696 () ValueCell!3403)

(assert (=> mapNonEmpty!12696 (= (arr!8800 _values!1525) (store mapRest!12696 mapKey!12696 mapValue!12696))))

(declare-fun b!347349 () Bool)

(declare-fun e!212828 () Bool)

(assert (=> b!347349 (= e!212828 tp_is_empty!7493)))

(declare-fun b!347350 () Bool)

(assert (=> b!347350 (= e!212830 tp_is_empty!7493)))

(declare-fun b!347351 () Bool)

(assert (=> b!347351 (= e!212829 (and e!212828 mapRes!12696))))

(declare-fun condMapEmpty!12696 () Bool)

(declare-fun mapDefault!12696 () ValueCell!3403)

