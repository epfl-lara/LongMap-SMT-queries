; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77342 () Bool)

(assert start!77342)

(declare-fun b!902044 () Bool)

(declare-fun b_free!16091 () Bool)

(declare-fun b_next!16091 () Bool)

(assert (=> b!902044 (= b_free!16091 (not b_next!16091))))

(declare-fun tp!56378 () Bool)

(declare-fun b_and!26455 () Bool)

(assert (=> b!902044 (= tp!56378 b_and!26455)))

(declare-fun b!902043 () Bool)

(declare-fun e!505089 () Bool)

(declare-fun e!505092 () Bool)

(assert (=> b!902043 (= e!505089 (not e!505092))))

(declare-fun res!608855 () Bool)

(assert (=> b!902043 (=> res!608855 e!505092)))

(declare-datatypes ((SeekEntryResult!8957 0))(
  ( (MissingZero!8957 (index!38199 (_ BitVec 32))) (Found!8957 (index!38200 (_ BitVec 32))) (Intermediate!8957 (undefined!9769 Bool) (index!38201 (_ BitVec 32)) (x!76860 (_ BitVec 32))) (Undefined!8957) (MissingVacant!8957 (index!38202 (_ BitVec 32))) )
))
(declare-fun lt!407773 () SeekEntryResult!8957)

(assert (=> b!902043 (= res!608855 (is-Found!8957 lt!407773))))

(declare-fun e!505096 () Bool)

(assert (=> b!902043 e!505096))

(declare-fun res!608857 () Bool)

(assert (=> b!902043 (=> res!608857 e!505096)))

(assert (=> b!902043 (= res!608857 (not (is-Found!8957 lt!407773)))))

(declare-datatypes ((Unit!30634 0))(
  ( (Unit!30635) )
))
(declare-fun lt!407774 () Unit!30634)

(declare-datatypes ((array!52898 0))(
  ( (array!52899 (arr!25415 (Array (_ BitVec 32) (_ BitVec 64))) (size!25874 (_ BitVec 32))) )
))
(declare-datatypes ((V!29523 0))(
  ( (V!29524 (val!9260 Int)) )
))
(declare-datatypes ((ValueCell!8728 0))(
  ( (ValueCellFull!8728 (v!11763 V!29523)) (EmptyCell!8728) )
))
(declare-datatypes ((array!52900 0))(
  ( (array!52901 (arr!25416 (Array (_ BitVec 32) ValueCell!8728)) (size!25875 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4472 0))(
  ( (LongMapFixedSize!4473 (defaultEntry!5482 Int) (mask!26302 (_ BitVec 32)) (extraKeys!5213 (_ BitVec 32)) (zeroValue!5317 V!29523) (minValue!5317 V!29523) (_size!2291 (_ BitVec 32)) (_keys!10299 array!52898) (_values!5504 array!52900) (_vacant!2291 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4472)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!116 (array!52898 array!52900 (_ BitVec 32) (_ BitVec 32) V!29523 V!29523 (_ BitVec 64)) Unit!30634)

(assert (=> b!902043 (= lt!407774 (lemmaSeekEntryGivesInRangeIndex!116 (_keys!10299 thiss!1181) (_values!5504 thiss!1181) (mask!26302 thiss!1181) (extraKeys!5213 thiss!1181) (zeroValue!5317 thiss!1181) (minValue!5317 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52898 (_ BitVec 32)) SeekEntryResult!8957)

(assert (=> b!902043 (= lt!407773 (seekEntry!0 key!785 (_keys!10299 thiss!1181) (mask!26302 thiss!1181)))))

(declare-fun res!608859 () Bool)

(assert (=> start!77342 (=> (not res!608859) (not e!505089))))

(declare-fun valid!1718 (LongMapFixedSize!4472) Bool)

(assert (=> start!77342 (= res!608859 (valid!1718 thiss!1181))))

(assert (=> start!77342 e!505089))

(declare-fun e!505091 () Bool)

(assert (=> start!77342 e!505091))

(assert (=> start!77342 true))

(declare-fun tp_is_empty!18419 () Bool)

(declare-fun e!505094 () Bool)

(declare-fun array_inv!19932 (array!52898) Bool)

(declare-fun array_inv!19933 (array!52900) Bool)

(assert (=> b!902044 (= e!505091 (and tp!56378 tp_is_empty!18419 (array_inv!19932 (_keys!10299 thiss!1181)) (array_inv!19933 (_values!5504 thiss!1181)) e!505094))))

(declare-fun mapIsEmpty!29320 () Bool)

(declare-fun mapRes!29320 () Bool)

(assert (=> mapIsEmpty!29320 mapRes!29320))

(declare-fun b!902045 () Bool)

(declare-fun e!505095 () Bool)

(assert (=> b!902045 (= e!505095 tp_is_empty!18419)))

(declare-fun b!902046 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!902046 (= e!505096 (inRange!0 (index!38200 lt!407773) (mask!26302 thiss!1181)))))

(declare-fun b!902047 () Bool)

(declare-fun e!505090 () Bool)

(assert (=> b!902047 (= e!505090 tp_is_empty!18419)))

(declare-fun b!902048 () Bool)

(declare-fun res!608858 () Bool)

(assert (=> b!902048 (=> res!608858 e!505092)))

(declare-fun contains!4448 (LongMapFixedSize!4472 (_ BitVec 64)) Bool)

(assert (=> b!902048 (= res!608858 (not (contains!4448 thiss!1181 key!785)))))

(declare-fun b!902049 () Bool)

(declare-fun res!608856 () Bool)

(assert (=> b!902049 (=> (not res!608856) (not e!505089))))

(assert (=> b!902049 (= res!608856 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29320 () Bool)

(declare-fun tp!56379 () Bool)

(assert (=> mapNonEmpty!29320 (= mapRes!29320 (and tp!56379 e!505090))))

(declare-fun mapRest!29320 () (Array (_ BitVec 32) ValueCell!8728))

(declare-fun mapKey!29320 () (_ BitVec 32))

(declare-fun mapValue!29320 () ValueCell!8728)

(assert (=> mapNonEmpty!29320 (= (arr!25416 (_values!5504 thiss!1181)) (store mapRest!29320 mapKey!29320 mapValue!29320))))

(declare-fun b!902050 () Bool)

(declare-fun dynLambda!1318 (Int (_ BitVec 64)) V!29523)

(declare-datatypes ((Option!474 0))(
  ( (Some!473 (v!11764 V!29523)) (None!472) )
))
(declare-fun get!13378 (Option!474) V!29523)

(declare-datatypes ((tuple2!12082 0))(
  ( (tuple2!12083 (_1!6052 (_ BitVec 64)) (_2!6052 V!29523)) )
))
(declare-datatypes ((List!17881 0))(
  ( (Nil!17878) (Cons!17877 (h!19023 tuple2!12082) (t!25264 List!17881)) )
))
(declare-fun getValueByKey!468 (List!17881 (_ BitVec 64)) Option!474)

(declare-datatypes ((ListLongMap!10779 0))(
  ( (ListLongMap!10780 (toList!5405 List!17881)) )
))
(declare-fun map!12302 (LongMapFixedSize!4472) ListLongMap!10779)

(assert (=> b!902050 (= e!505092 (= (dynLambda!1318 (defaultEntry!5482 thiss!1181) key!785) (get!13378 (getValueByKey!468 (toList!5405 (map!12302 thiss!1181)) key!785))))))

(declare-fun b!902051 () Bool)

(assert (=> b!902051 (= e!505094 (and e!505095 mapRes!29320))))

(declare-fun condMapEmpty!29320 () Bool)

(declare-fun mapDefault!29320 () ValueCell!8728)

