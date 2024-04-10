; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34172 () Bool)

(assert start!34172)

(declare-fun b_free!7195 () Bool)

(declare-fun b_next!7195 () Bool)

(assert (=> start!34172 (= b_free!7195 (not b_next!7195))))

(declare-fun tp!25118 () Bool)

(declare-fun b_and!14395 () Bool)

(assert (=> start!34172 (= tp!25118 b_and!14395)))

(declare-fun b!340561 () Bool)

(declare-fun res!188120 () Bool)

(declare-fun e!208920 () Bool)

(assert (=> b!340561 (=> (not res!188120) (not e!208920))))

(declare-datatypes ((array!17897 0))(
  ( (array!17898 (arr!8469 (Array (_ BitVec 32) (_ BitVec 64))) (size!8821 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17897)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340561 (= res!188120 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340562 () Bool)

(declare-fun res!188114 () Bool)

(declare-fun e!208916 () Bool)

(assert (=> b!340562 (=> (not res!188114) (not e!208916))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10507 0))(
  ( (V!10508 (val!3618 Int)) )
))
(declare-fun zeroValue!1467 () V!10507)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3230 0))(
  ( (ValueCellFull!3230 (v!5790 V!10507)) (EmptyCell!3230) )
))
(declare-datatypes ((array!17899 0))(
  ( (array!17900 (arr!8470 (Array (_ BitVec 32) ValueCell!3230)) (size!8822 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17899)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10507)

(declare-datatypes ((tuple2!5252 0))(
  ( (tuple2!5253 (_1!2637 (_ BitVec 64)) (_2!2637 V!10507)) )
))
(declare-datatypes ((List!4870 0))(
  ( (Nil!4867) (Cons!4866 (h!5722 tuple2!5252) (t!9978 List!4870)) )
))
(declare-datatypes ((ListLongMap!4165 0))(
  ( (ListLongMap!4166 (toList!2098 List!4870)) )
))
(declare-fun contains!2152 (ListLongMap!4165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1619 (array!17897 array!17899 (_ BitVec 32) (_ BitVec 32) V!10507 V!10507 (_ BitVec 32) Int) ListLongMap!4165)

(assert (=> b!340562 (= res!188114 (not (contains!2152 (getCurrentListMap!1619 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!340563 () Bool)

(declare-fun res!188116 () Bool)

(assert (=> b!340563 (=> (not res!188116) (not e!208916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17897 (_ BitVec 32)) Bool)

(assert (=> b!340563 (= res!188116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340564 () Bool)

(assert (=> b!340564 (= e!208916 e!208920)))

(declare-fun res!188119 () Bool)

(assert (=> b!340564 (=> (not res!188119) (not e!208920))))

(declare-datatypes ((SeekEntryResult!3273 0))(
  ( (MissingZero!3273 (index!15271 (_ BitVec 32))) (Found!3273 (index!15272 (_ BitVec 32))) (Intermediate!3273 (undefined!4085 Bool) (index!15273 (_ BitVec 32)) (x!33923 (_ BitVec 32))) (Undefined!3273) (MissingVacant!3273 (index!15274 (_ BitVec 32))) )
))
(declare-fun lt!161611 () SeekEntryResult!3273)

(assert (=> b!340564 (= res!188119 (and (not (is-Found!3273 lt!161611)) (not (is-MissingZero!3273 lt!161611)) (is-MissingVacant!3273 lt!161611)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17897 (_ BitVec 32)) SeekEntryResult!3273)

(assert (=> b!340564 (= lt!161611 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340565 () Bool)

(declare-fun e!208917 () Bool)

(declare-fun tp_is_empty!7147 () Bool)

(assert (=> b!340565 (= e!208917 tp_is_empty!7147)))

(declare-fun mapNonEmpty!12147 () Bool)

(declare-fun mapRes!12147 () Bool)

(declare-fun tp!25119 () Bool)

(assert (=> mapNonEmpty!12147 (= mapRes!12147 (and tp!25119 e!208917))))

(declare-fun mapValue!12147 () ValueCell!3230)

(declare-fun mapRest!12147 () (Array (_ BitVec 32) ValueCell!3230))

(declare-fun mapKey!12147 () (_ BitVec 32))

(assert (=> mapNonEmpty!12147 (= (arr!8470 _values!1525) (store mapRest!12147 mapKey!12147 mapValue!12147))))

(declare-fun mapIsEmpty!12147 () Bool)

(assert (=> mapIsEmpty!12147 mapRes!12147))

(declare-fun b!340567 () Bool)

(declare-fun res!188118 () Bool)

(assert (=> b!340567 (=> (not res!188118) (not e!208916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340567 (= res!188118 (validKeyInArray!0 k!1348))))

(declare-fun b!340568 () Bool)

(declare-fun res!188115 () Bool)

(assert (=> b!340568 (=> (not res!188115) (not e!208916))))

(assert (=> b!340568 (= res!188115 (and (= (size!8822 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8821 _keys!1895) (size!8822 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340569 () Bool)

(declare-fun res!188113 () Bool)

(assert (=> b!340569 (=> (not res!188113) (not e!208916))))

(declare-datatypes ((List!4871 0))(
  ( (Nil!4868) (Cons!4867 (h!5723 (_ BitVec 64)) (t!9979 List!4871)) )
))
(declare-fun arrayNoDuplicates!0 (array!17897 (_ BitVec 32) List!4871) Bool)

(assert (=> b!340569 (= res!188113 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4868))))

(declare-fun b!340570 () Bool)

(declare-fun e!208918 () Bool)

(assert (=> b!340570 (= e!208918 tp_is_empty!7147)))

(declare-fun b!340571 () Bool)

(declare-fun e!208919 () Bool)

(assert (=> b!340571 (= e!208919 (and e!208918 mapRes!12147))))

(declare-fun condMapEmpty!12147 () Bool)

(declare-fun mapDefault!12147 () ValueCell!3230)

