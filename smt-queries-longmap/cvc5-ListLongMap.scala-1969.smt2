; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34656 () Bool)

(assert start!34656)

(declare-fun b_free!7483 () Bool)

(declare-fun b_next!7483 () Bool)

(assert (=> start!34656 (= b_free!7483 (not b_next!7483))))

(declare-fun tp!26009 () Bool)

(declare-fun b_and!14701 () Bool)

(assert (=> start!34656 (= tp!26009 b_and!14701)))

(declare-fun b!346270 () Bool)

(declare-fun e!212229 () Bool)

(declare-fun tp_is_empty!7435 () Bool)

(assert (=> b!346270 (= e!212229 tp_is_empty!7435)))

(declare-fun mapNonEmpty!12606 () Bool)

(declare-fun mapRes!12606 () Bool)

(declare-fun tp!26010 () Bool)

(declare-fun e!212227 () Bool)

(assert (=> mapNonEmpty!12606 (= mapRes!12606 (and tp!26010 e!212227))))

(declare-datatypes ((V!10891 0))(
  ( (V!10892 (val!3762 Int)) )
))
(declare-datatypes ((ValueCell!3374 0))(
  ( (ValueCellFull!3374 (v!5943 V!10891)) (EmptyCell!3374) )
))
(declare-fun mapRest!12606 () (Array (_ BitVec 32) ValueCell!3374))

(declare-datatypes ((array!18461 0))(
  ( (array!18462 (arr!8742 (Array (_ BitVec 32) ValueCell!3374)) (size!9094 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18461)

(declare-fun mapKey!12606 () (_ BitVec 32))

(declare-fun mapValue!12606 () ValueCell!3374)

(assert (=> mapNonEmpty!12606 (= (arr!8742 _values!1525) (store mapRest!12606 mapKey!12606 mapValue!12606))))

(declare-fun b!346271 () Bool)

(declare-fun e!212231 () Bool)

(declare-datatypes ((SeekEntryResult!3370 0))(
  ( (MissingZero!3370 (index!15659 (_ BitVec 32))) (Found!3370 (index!15660 (_ BitVec 32))) (Intermediate!3370 (undefined!4182 Bool) (index!15661 (_ BitVec 32)) (x!34494 (_ BitVec 32))) (Undefined!3370) (MissingVacant!3370 (index!15662 (_ BitVec 32))) )
))
(declare-fun lt!163279 () SeekEntryResult!3370)

(declare-datatypes ((array!18463 0))(
  ( (array!18464 (arr!8743 (Array (_ BitVec 32) (_ BitVec 64))) (size!9095 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18463)

(assert (=> b!346271 (= e!212231 (and (bvsge (index!15660 lt!163279) #b00000000000000000000000000000000) (bvslt (index!15660 lt!163279) (size!9095 _keys!1895)) (bvsge (size!9095 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun res!191537 () Bool)

(declare-fun e!212230 () Bool)

(assert (=> start!34656 (=> (not res!191537) (not e!212230))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34656 (= res!191537 (validMask!0 mask!2385))))

(assert (=> start!34656 e!212230))

(assert (=> start!34656 true))

(assert (=> start!34656 tp_is_empty!7435))

(assert (=> start!34656 tp!26009))

(declare-fun e!212232 () Bool)

(declare-fun array_inv!6470 (array!18461) Bool)

(assert (=> start!34656 (and (array_inv!6470 _values!1525) e!212232)))

(declare-fun array_inv!6471 (array!18463) Bool)

(assert (=> start!34656 (array_inv!6471 _keys!1895)))

(declare-fun b!346272 () Bool)

(assert (=> b!346272 (= e!212230 e!212231)))

(declare-fun res!191536 () Bool)

(assert (=> b!346272 (=> (not res!191536) (not e!212231))))

(declare-fun k!1348 () (_ BitVec 64))

(assert (=> b!346272 (= res!191536 (and (is-Found!3370 lt!163279) (= (select (arr!8743 _keys!1895) (index!15660 lt!163279)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18463 (_ BitVec 32)) SeekEntryResult!3370)

(assert (=> b!346272 (= lt!163279 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346273 () Bool)

(declare-fun res!191532 () Bool)

(assert (=> b!346273 (=> (not res!191532) (not e!212230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18463 (_ BitVec 32)) Bool)

(assert (=> b!346273 (= res!191532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12606 () Bool)

(assert (=> mapIsEmpty!12606 mapRes!12606))

(declare-fun b!346274 () Bool)

(declare-fun res!191534 () Bool)

(assert (=> b!346274 (=> (not res!191534) (not e!212230))))

(declare-fun zeroValue!1467 () V!10891)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10891)

(declare-datatypes ((tuple2!5440 0))(
  ( (tuple2!5441 (_1!2731 (_ BitVec 64)) (_2!2731 V!10891)) )
))
(declare-datatypes ((List!5063 0))(
  ( (Nil!5060) (Cons!5059 (h!5915 tuple2!5440) (t!10189 List!5063)) )
))
(declare-datatypes ((ListLongMap!4353 0))(
  ( (ListLongMap!4354 (toList!2192 List!5063)) )
))
(declare-fun contains!2255 (ListLongMap!4353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1713 (array!18463 array!18461 (_ BitVec 32) (_ BitVec 32) V!10891 V!10891 (_ BitVec 32) Int) ListLongMap!4353)

(assert (=> b!346274 (= res!191534 (not (contains!2255 (getCurrentListMap!1713 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346275 () Bool)

(assert (=> b!346275 (= e!212227 tp_is_empty!7435)))

(declare-fun b!346276 () Bool)

(assert (=> b!346276 (= e!212232 (and e!212229 mapRes!12606))))

(declare-fun condMapEmpty!12606 () Bool)

(declare-fun mapDefault!12606 () ValueCell!3374)

