; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35236 () Bool)

(assert start!35236)

(declare-fun b_free!7811 () Bool)

(declare-fun b_next!7811 () Bool)

(assert (=> start!35236 (= b_free!7811 (not b_next!7811))))

(declare-fun tp!27027 () Bool)

(declare-fun b_and!15051 () Bool)

(assert (=> start!35236 (= tp!27027 b_and!15051)))

(declare-fun b!353285 () Bool)

(declare-fun res!195922 () Bool)

(declare-fun e!216314 () Bool)

(assert (=> b!353285 (=> (not res!195922) (not e!216314))))

(declare-datatypes ((array!19117 0))(
  ( (array!19118 (arr!9059 (Array (_ BitVec 32) (_ BitVec 64))) (size!9411 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19117)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19117 (_ BitVec 32)) Bool)

(assert (=> b!353285 (= res!195922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!13131 () Bool)

(declare-fun mapRes!13131 () Bool)

(declare-fun tp!27026 () Bool)

(declare-fun e!216318 () Bool)

(assert (=> mapNonEmpty!13131 (= mapRes!13131 (and tp!27026 e!216318))))

(declare-datatypes ((V!11327 0))(
  ( (V!11328 (val!3926 Int)) )
))
(declare-datatypes ((ValueCell!3538 0))(
  ( (ValueCellFull!3538 (v!6118 V!11327)) (EmptyCell!3538) )
))
(declare-datatypes ((array!19119 0))(
  ( (array!19120 (arr!9060 (Array (_ BitVec 32) ValueCell!3538)) (size!9412 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19119)

(declare-fun mapKey!13131 () (_ BitVec 32))

(declare-fun mapRest!13131 () (Array (_ BitVec 32) ValueCell!3538))

(declare-fun mapValue!13131 () ValueCell!3538)

(assert (=> mapNonEmpty!13131 (= (arr!9060 _values!1525) (store mapRest!13131 mapKey!13131 mapValue!13131))))

(declare-fun b!353286 () Bool)

(declare-fun res!195921 () Bool)

(assert (=> b!353286 (=> (not res!195921) (not e!216314))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!353286 (= res!195921 (and (= (size!9412 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9411 _keys!1895) (size!9412 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!353287 () Bool)

(declare-fun res!195923 () Bool)

(assert (=> b!353287 (=> (not res!195923) (not e!216314))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353287 (= res!195923 (validKeyInArray!0 k!1348))))

(declare-fun b!353288 () Bool)

(declare-datatypes ((SeekEntryResult!3485 0))(
  ( (MissingZero!3485 (index!16119 (_ BitVec 32))) (Found!3485 (index!16120 (_ BitVec 32))) (Intermediate!3485 (undefined!4297 Bool) (index!16121 (_ BitVec 32)) (x!35151 (_ BitVec 32))) (Undefined!3485) (MissingVacant!3485 (index!16122 (_ BitVec 32))) )
))
(declare-fun lt!165478 () SeekEntryResult!3485)

(assert (=> b!353288 (= e!216314 (and (not (is-Found!3485 lt!165478)) (not (is-MissingZero!3485 lt!165478)) (not (is-MissingVacant!3485 lt!165478)) (not (is-Undefined!3485 lt!165478))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19117 (_ BitVec 32)) SeekEntryResult!3485)

(assert (=> b!353288 (= lt!165478 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!353289 () Bool)

(declare-fun tp_is_empty!7763 () Bool)

(assert (=> b!353289 (= e!216318 tp_is_empty!7763)))

(declare-fun b!353290 () Bool)

(declare-fun res!195925 () Bool)

(assert (=> b!353290 (=> (not res!195925) (not e!216314))))

(declare-datatypes ((List!5278 0))(
  ( (Nil!5275) (Cons!5274 (h!6130 (_ BitVec 64)) (t!10426 List!5278)) )
))
(declare-fun arrayNoDuplicates!0 (array!19117 (_ BitVec 32) List!5278) Bool)

(assert (=> b!353290 (= res!195925 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5275))))

(declare-fun b!353291 () Bool)

(declare-fun e!216315 () Bool)

(declare-fun e!216317 () Bool)

(assert (=> b!353291 (= e!216315 (and e!216317 mapRes!13131))))

(declare-fun condMapEmpty!13131 () Bool)

(declare-fun mapDefault!13131 () ValueCell!3538)

