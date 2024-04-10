; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33942 () Bool)

(assert start!33942)

(declare-fun b_free!7097 () Bool)

(declare-fun b_next!7097 () Bool)

(assert (=> start!33942 (= b_free!7097 (not b_next!7097))))

(declare-fun tp!24806 () Bool)

(declare-fun b_and!14285 () Bool)

(assert (=> start!33942 (= tp!24806 b_and!14285)))

(declare-fun b!338085 () Bool)

(declare-datatypes ((Unit!10491 0))(
  ( (Unit!10492) )
))
(declare-fun e!207443 () Unit!10491)

(declare-fun Unit!10493 () Unit!10491)

(assert (=> b!338085 (= e!207443 Unit!10493)))

(declare-fun b!338086 () Bool)

(declare-fun res!186772 () Bool)

(declare-fun e!207444 () Bool)

(assert (=> b!338086 (=> (not res!186772) (not e!207444))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17691 0))(
  ( (array!17692 (arr!8372 (Array (_ BitVec 32) (_ BitVec 64))) (size!8724 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17691)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10375 0))(
  ( (V!10376 (val!3569 Int)) )
))
(declare-datatypes ((ValueCell!3181 0))(
  ( (ValueCellFull!3181 (v!5735 V!10375)) (EmptyCell!3181) )
))
(declare-datatypes ((array!17693 0))(
  ( (array!17694 (arr!8373 (Array (_ BitVec 32) ValueCell!3181)) (size!8725 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17693)

(assert (=> b!338086 (= res!186772 (and (= (size!8725 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8724 _keys!1895) (size!8725 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338087 () Bool)

(declare-fun e!207441 () Bool)

(assert (=> b!338087 (= e!207441 (and (bvslt #b00000000000000000000000000000000 (size!8724 _keys!1895)) (bvsge (size!8724 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun lt!160649 () Unit!10491)

(assert (=> b!338087 (= lt!160649 e!207443)))

(declare-fun c!52368 () Bool)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338087 (= c!52368 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!338088 () Bool)

(declare-fun Unit!10494 () Unit!10491)

(assert (=> b!338088 (= e!207443 Unit!10494)))

(declare-fun zeroValue!1467 () V!10375)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10375)

(declare-fun lt!160650 () Unit!10491)

(declare-fun lemmaArrayContainsKeyThenInListMap!269 (array!17691 array!17693 (_ BitVec 32) (_ BitVec 32) V!10375 V!10375 (_ BitVec 64) (_ BitVec 32) Int) Unit!10491)

(declare-fun arrayScanForKey!0 (array!17691 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338088 (= lt!160650 (lemmaArrayContainsKeyThenInListMap!269 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338088 false))

(declare-fun b!338089 () Bool)

(assert (=> b!338089 (= e!207444 e!207441)))

(declare-fun res!186774 () Bool)

(assert (=> b!338089 (=> (not res!186774) (not e!207441))))

(declare-datatypes ((SeekEntryResult!3233 0))(
  ( (MissingZero!3233 (index!15111 (_ BitVec 32))) (Found!3233 (index!15112 (_ BitVec 32))) (Intermediate!3233 (undefined!4045 Bool) (index!15113 (_ BitVec 32)) (x!33687 (_ BitVec 32))) (Undefined!3233) (MissingVacant!3233 (index!15114 (_ BitVec 32))) )
))
(declare-fun lt!160651 () SeekEntryResult!3233)

(assert (=> b!338089 (= res!186774 (and (not (is-Found!3233 lt!160651)) (is-MissingZero!3233 lt!160651)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17691 (_ BitVec 32)) SeekEntryResult!3233)

(assert (=> b!338089 (= lt!160651 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338090 () Bool)

(declare-fun e!207447 () Bool)

(declare-fun tp_is_empty!7049 () Bool)

(assert (=> b!338090 (= e!207447 tp_is_empty!7049)))

(declare-fun res!186771 () Bool)

(assert (=> start!33942 (=> (not res!186771) (not e!207444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33942 (= res!186771 (validMask!0 mask!2385))))

(assert (=> start!33942 e!207444))

(assert (=> start!33942 true))

(assert (=> start!33942 tp_is_empty!7049))

(assert (=> start!33942 tp!24806))

(declare-fun e!207446 () Bool)

(declare-fun array_inv!6214 (array!17693) Bool)

(assert (=> start!33942 (and (array_inv!6214 _values!1525) e!207446)))

(declare-fun array_inv!6215 (array!17691) Bool)

(assert (=> start!33942 (array_inv!6215 _keys!1895)))

(declare-fun b!338091 () Bool)

(declare-fun res!186776 () Bool)

(assert (=> b!338091 (=> (not res!186776) (not e!207444))))

(declare-datatypes ((List!4798 0))(
  ( (Nil!4795) (Cons!4794 (h!5650 (_ BitVec 64)) (t!9894 List!4798)) )
))
(declare-fun arrayNoDuplicates!0 (array!17691 (_ BitVec 32) List!4798) Bool)

(assert (=> b!338091 (= res!186776 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4795))))

(declare-fun mapNonEmpty!11982 () Bool)

(declare-fun mapRes!11982 () Bool)

(declare-fun tp!24807 () Bool)

(assert (=> mapNonEmpty!11982 (= mapRes!11982 (and tp!24807 e!207447))))

(declare-fun mapKey!11982 () (_ BitVec 32))

(declare-fun mapValue!11982 () ValueCell!3181)

(declare-fun mapRest!11982 () (Array (_ BitVec 32) ValueCell!3181))

(assert (=> mapNonEmpty!11982 (= (arr!8373 _values!1525) (store mapRest!11982 mapKey!11982 mapValue!11982))))

(declare-fun b!338092 () Bool)

(declare-fun res!186775 () Bool)

(assert (=> b!338092 (=> (not res!186775) (not e!207444))))

(declare-datatypes ((tuple2!5182 0))(
  ( (tuple2!5183 (_1!2602 (_ BitVec 64)) (_2!2602 V!10375)) )
))
(declare-datatypes ((List!4799 0))(
  ( (Nil!4796) (Cons!4795 (h!5651 tuple2!5182) (t!9895 List!4799)) )
))
(declare-datatypes ((ListLongMap!4095 0))(
  ( (ListLongMap!4096 (toList!2063 List!4799)) )
))
(declare-fun contains!2111 (ListLongMap!4095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1584 (array!17691 array!17693 (_ BitVec 32) (_ BitVec 32) V!10375 V!10375 (_ BitVec 32) Int) ListLongMap!4095)

(assert (=> b!338092 (= res!186775 (not (contains!2111 (getCurrentListMap!1584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!338093 () Bool)

(declare-fun e!207442 () Bool)

(assert (=> b!338093 (= e!207442 tp_is_empty!7049)))

(declare-fun b!338094 () Bool)

(assert (=> b!338094 (= e!207446 (and e!207442 mapRes!11982))))

(declare-fun condMapEmpty!11982 () Bool)

(declare-fun mapDefault!11982 () ValueCell!3181)

