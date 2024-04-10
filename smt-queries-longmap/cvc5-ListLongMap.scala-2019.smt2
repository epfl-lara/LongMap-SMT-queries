; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35190 () Bool)

(assert start!35190)

(declare-fun b_free!7783 () Bool)

(declare-fun b_next!7783 () Bool)

(assert (=> start!35190 (= b_free!7783 (not b_next!7783))))

(declare-fun tp!26940 () Bool)

(declare-fun b_and!15021 () Bool)

(assert (=> start!35190 (= tp!26940 b_and!15021)))

(declare-fun mapNonEmpty!13086 () Bool)

(declare-fun mapRes!13086 () Bool)

(declare-fun tp!26939 () Bool)

(declare-fun e!216025 () Bool)

(assert (=> mapNonEmpty!13086 (= mapRes!13086 (and tp!26939 e!216025))))

(declare-datatypes ((V!11291 0))(
  ( (V!11292 (val!3912 Int)) )
))
(declare-datatypes ((ValueCell!3524 0))(
  ( (ValueCellFull!3524 (v!6103 V!11291)) (EmptyCell!3524) )
))
(declare-fun mapRest!13086 () (Array (_ BitVec 32) ValueCell!3524))

(declare-datatypes ((array!19059 0))(
  ( (array!19060 (arr!9031 (Array (_ BitVec 32) ValueCell!3524)) (size!9383 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19059)

(declare-fun mapKey!13086 () (_ BitVec 32))

(declare-fun mapValue!13086 () ValueCell!3524)

(assert (=> mapNonEmpty!13086 (= (arr!9031 _values!1525) (store mapRest!13086 mapKey!13086 mapValue!13086))))

(declare-fun b!352780 () Bool)

(declare-fun e!216024 () Bool)

(declare-datatypes ((SeekEntryResult!3474 0))(
  ( (MissingZero!3474 (index!16075 (_ BitVec 32))) (Found!3474 (index!16076 (_ BitVec 32))) (Intermediate!3474 (undefined!4286 Bool) (index!16077 (_ BitVec 32)) (x!35098 (_ BitVec 32))) (Undefined!3474) (MissingVacant!3474 (index!16078 (_ BitVec 32))) )
))
(declare-fun lt!165340 () SeekEntryResult!3474)

(assert (=> b!352780 (= e!216024 (and (not (is-Found!3474 lt!165340)) (not (is-MissingZero!3474 lt!165340)) (not (is-MissingVacant!3474 lt!165340)) (is-Undefined!3474 lt!165340) (not (is-Undefined!3474 lt!165340))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!19061 0))(
  ( (array!19062 (arr!9032 (Array (_ BitVec 32) (_ BitVec 64))) (size!9384 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19061)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19061 (_ BitVec 32)) SeekEntryResult!3474)

(assert (=> b!352780 (= lt!165340 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!352781 () Bool)

(declare-fun res!195627 () Bool)

(assert (=> b!352781 (=> (not res!195627) (not e!216024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19061 (_ BitVec 32)) Bool)

(assert (=> b!352781 (= res!195627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13086 () Bool)

(assert (=> mapIsEmpty!13086 mapRes!13086))

(declare-fun b!352782 () Bool)

(declare-fun e!216026 () Bool)

(declare-fun tp_is_empty!7735 () Bool)

(assert (=> b!352782 (= e!216026 tp_is_empty!7735)))

(declare-fun b!352783 () Bool)

(declare-fun res!195629 () Bool)

(assert (=> b!352783 (=> (not res!195629) (not e!216024))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352783 (= res!195629 (and (= (size!9383 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9384 _keys!1895) (size!9383 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352784 () Bool)

(declare-fun res!195626 () Bool)

(assert (=> b!352784 (=> (not res!195626) (not e!216024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352784 (= res!195626 (validKeyInArray!0 k!1348))))

(declare-fun res!195624 () Bool)

(assert (=> start!35190 (=> (not res!195624) (not e!216024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35190 (= res!195624 (validMask!0 mask!2385))))

(assert (=> start!35190 e!216024))

(assert (=> start!35190 true))

(assert (=> start!35190 tp_is_empty!7735))

(assert (=> start!35190 tp!26940))

(declare-fun e!216027 () Bool)

(declare-fun array_inv!6656 (array!19059) Bool)

(assert (=> start!35190 (and (array_inv!6656 _values!1525) e!216027)))

(declare-fun array_inv!6657 (array!19061) Bool)

(assert (=> start!35190 (array_inv!6657 _keys!1895)))

(declare-fun b!352785 () Bool)

(assert (=> b!352785 (= e!216027 (and e!216026 mapRes!13086))))

(declare-fun condMapEmpty!13086 () Bool)

(declare-fun mapDefault!13086 () ValueCell!3524)

