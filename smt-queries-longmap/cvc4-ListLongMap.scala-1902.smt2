; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33906 () Bool)

(assert start!33906)

(declare-fun b_free!7085 () Bool)

(declare-fun b_next!7085 () Bool)

(assert (=> start!33906 (= b_free!7085 (not b_next!7085))))

(declare-fun tp!24767 () Bool)

(declare-fun b_and!14271 () Bool)

(assert (=> start!33906 (= tp!24767 b_and!14271)))

(declare-fun b!337730 () Bool)

(declare-fun res!186599 () Bool)

(declare-fun e!207227 () Bool)

(assert (=> b!337730 (=> (not res!186599) (not e!207227))))

(declare-datatypes ((array!17667 0))(
  ( (array!17668 (arr!8361 (Array (_ BitVec 32) (_ BitVec 64))) (size!8713 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17667)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17667 (_ BitVec 32)) Bool)

(assert (=> b!337730 (= res!186599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337731 () Bool)

(declare-fun res!186597 () Bool)

(assert (=> b!337731 (=> (not res!186597) (not e!207227))))

(declare-datatypes ((List!4790 0))(
  ( (Nil!4787) (Cons!4786 (h!5642 (_ BitVec 64)) (t!9884 List!4790)) )
))
(declare-fun arrayNoDuplicates!0 (array!17667 (_ BitVec 32) List!4790) Bool)

(assert (=> b!337731 (= res!186597 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4787))))

(declare-fun b!337732 () Bool)

(declare-fun res!186595 () Bool)

(assert (=> b!337732 (=> (not res!186595) (not e!207227))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10359 0))(
  ( (V!10360 (val!3563 Int)) )
))
(declare-fun zeroValue!1467 () V!10359)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3175 0))(
  ( (ValueCellFull!3175 (v!5728 V!10359)) (EmptyCell!3175) )
))
(declare-datatypes ((array!17669 0))(
  ( (array!17670 (arr!8362 (Array (_ BitVec 32) ValueCell!3175)) (size!8714 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17669)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10359)

(declare-datatypes ((tuple2!5174 0))(
  ( (tuple2!5175 (_1!2598 (_ BitVec 64)) (_2!2598 V!10359)) )
))
(declare-datatypes ((List!4791 0))(
  ( (Nil!4788) (Cons!4787 (h!5643 tuple2!5174) (t!9885 List!4791)) )
))
(declare-datatypes ((ListLongMap!4087 0))(
  ( (ListLongMap!4088 (toList!2059 List!4791)) )
))
(declare-fun contains!2106 (ListLongMap!4087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1580 (array!17667 array!17669 (_ BitVec 32) (_ BitVec 32) V!10359 V!10359 (_ BitVec 32) Int) ListLongMap!4087)

(assert (=> b!337732 (= res!186595 (not (contains!2106 (getCurrentListMap!1580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337733 () Bool)

(declare-datatypes ((Unit!10471 0))(
  ( (Unit!10472) )
))
(declare-fun e!207226 () Unit!10471)

(declare-fun Unit!10473 () Unit!10471)

(assert (=> b!337733 (= e!207226 Unit!10473)))

(declare-fun lt!160494 () Unit!10471)

(declare-fun lemmaArrayContainsKeyThenInListMap!264 (array!17667 array!17669 (_ BitVec 32) (_ BitVec 32) V!10359 V!10359 (_ BitVec 64) (_ BitVec 32) Int) Unit!10471)

(declare-fun arrayScanForKey!0 (array!17667 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337733 (= lt!160494 (lemmaArrayContainsKeyThenInListMap!264 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337733 false))

(declare-fun b!337734 () Bool)

(declare-fun res!186594 () Bool)

(assert (=> b!337734 (=> (not res!186594) (not e!207227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337734 (= res!186594 (validKeyInArray!0 k!1348))))

(declare-fun b!337735 () Bool)

(declare-fun e!207229 () Bool)

(assert (=> b!337735 (= e!207229 false)))

(declare-fun lt!160493 () Unit!10471)

(assert (=> b!337735 (= lt!160493 e!207226)))

(declare-fun c!52311 () Bool)

(declare-fun arrayContainsKey!0 (array!17667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337735 (= c!52311 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11961 () Bool)

(declare-fun mapRes!11961 () Bool)

(declare-fun tp!24768 () Bool)

(declare-fun e!207228 () Bool)

(assert (=> mapNonEmpty!11961 (= mapRes!11961 (and tp!24768 e!207228))))

(declare-fun mapRest!11961 () (Array (_ BitVec 32) ValueCell!3175))

(declare-fun mapKey!11961 () (_ BitVec 32))

(declare-fun mapValue!11961 () ValueCell!3175)

(assert (=> mapNonEmpty!11961 (= (arr!8362 _values!1525) (store mapRest!11961 mapKey!11961 mapValue!11961))))

(declare-fun b!337737 () Bool)

(declare-fun e!207231 () Bool)

(declare-fun e!207225 () Bool)

(assert (=> b!337737 (= e!207231 (and e!207225 mapRes!11961))))

(declare-fun condMapEmpty!11961 () Bool)

(declare-fun mapDefault!11961 () ValueCell!3175)

