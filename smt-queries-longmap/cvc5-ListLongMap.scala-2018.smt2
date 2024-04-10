; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35184 () Bool)

(assert start!35184)

(declare-fun b_free!7777 () Bool)

(declare-fun b_next!7777 () Bool)

(assert (=> start!35184 (= b_free!7777 (not b_next!7777))))

(declare-fun tp!26922 () Bool)

(declare-fun b_and!15015 () Bool)

(assert (=> start!35184 (= tp!26922 b_and!15015)))

(declare-fun b!352699 () Bool)

(declare-fun res!195572 () Bool)

(declare-fun e!215979 () Bool)

(assert (=> b!352699 (=> (not res!195572) (not e!215979))))

(declare-datatypes ((array!19049 0))(
  ( (array!19050 (arr!9026 (Array (_ BitVec 32) (_ BitVec 64))) (size!9378 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19049)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19049 (_ BitVec 32)) Bool)

(assert (=> b!352699 (= res!195572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352700 () Bool)

(declare-fun e!215982 () Bool)

(declare-fun tp_is_empty!7729 () Bool)

(assert (=> b!352700 (= e!215982 tp_is_empty!7729)))

(declare-fun res!195574 () Bool)

(assert (=> start!35184 (=> (not res!195574) (not e!215979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35184 (= res!195574 (validMask!0 mask!2385))))

(assert (=> start!35184 e!215979))

(assert (=> start!35184 true))

(assert (=> start!35184 tp_is_empty!7729))

(assert (=> start!35184 tp!26922))

(declare-datatypes ((V!11283 0))(
  ( (V!11284 (val!3909 Int)) )
))
(declare-datatypes ((ValueCell!3521 0))(
  ( (ValueCellFull!3521 (v!6100 V!11283)) (EmptyCell!3521) )
))
(declare-datatypes ((array!19051 0))(
  ( (array!19052 (arr!9027 (Array (_ BitVec 32) ValueCell!3521)) (size!9379 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19051)

(declare-fun e!215980 () Bool)

(declare-fun array_inv!6652 (array!19051) Bool)

(assert (=> start!35184 (and (array_inv!6652 _values!1525) e!215980)))

(declare-fun array_inv!6653 (array!19049) Bool)

(assert (=> start!35184 (array_inv!6653 _keys!1895)))

(declare-fun b!352701 () Bool)

(declare-fun res!195571 () Bool)

(assert (=> b!352701 (=> (not res!195571) (not e!215979))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11283)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11283)

(declare-datatypes ((tuple2!5634 0))(
  ( (tuple2!5635 (_1!2828 (_ BitVec 64)) (_2!2828 V!11283)) )
))
(declare-datatypes ((List!5254 0))(
  ( (Nil!5251) (Cons!5250 (h!6106 tuple2!5634) (t!10400 List!5254)) )
))
(declare-datatypes ((ListLongMap!4547 0))(
  ( (ListLongMap!4548 (toList!2289 List!5254)) )
))
(declare-fun contains!2362 (ListLongMap!4547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1810 (array!19049 array!19051 (_ BitVec 32) (_ BitVec 32) V!11283 V!11283 (_ BitVec 32) Int) ListLongMap!4547)

(assert (=> b!352701 (= res!195571 (not (contains!2362 (getCurrentListMap!1810 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!352702 () Bool)

(declare-fun res!195573 () Bool)

(assert (=> b!352702 (=> (not res!195573) (not e!215979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352702 (= res!195573 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!13077 () Bool)

(declare-fun mapRes!13077 () Bool)

(assert (=> mapIsEmpty!13077 mapRes!13077))

(declare-fun b!352703 () Bool)

(declare-fun e!215981 () Bool)

(assert (=> b!352703 (= e!215981 tp_is_empty!7729)))

(declare-fun b!352704 () Bool)

(assert (=> b!352704 (= e!215979 false)))

(declare-datatypes ((SeekEntryResult!3472 0))(
  ( (MissingZero!3472 (index!16067 (_ BitVec 32))) (Found!3472 (index!16068 (_ BitVec 32))) (Intermediate!3472 (undefined!4284 Bool) (index!16069 (_ BitVec 32)) (x!35088 (_ BitVec 32))) (Undefined!3472) (MissingVacant!3472 (index!16070 (_ BitVec 32))) )
))
(declare-fun lt!165331 () SeekEntryResult!3472)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19049 (_ BitVec 32)) SeekEntryResult!3472)

(assert (=> b!352704 (= lt!165331 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!352705 () Bool)

(assert (=> b!352705 (= e!215980 (and e!215981 mapRes!13077))))

(declare-fun condMapEmpty!13077 () Bool)

(declare-fun mapDefault!13077 () ValueCell!3521)

