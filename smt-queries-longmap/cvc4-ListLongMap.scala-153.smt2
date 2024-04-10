; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2992 () Bool)

(assert start!2992)

(declare-fun b!17402 () Bool)

(declare-fun b_free!599 () Bool)

(declare-fun b_next!599 () Bool)

(assert (=> b!17402 (= b_free!599 (not b_next!599))))

(declare-fun tp!2988 () Bool)

(declare-fun b_and!1247 () Bool)

(assert (=> b!17402 (= tp!2988 b_and!1247)))

(declare-fun b!17398 () Bool)

(declare-fun e!10894 () Bool)

(declare-fun tp_is_empty!863 () Bool)

(assert (=> b!17398 (= e!10894 tp_is_empty!863)))

(declare-fun b!17399 () Bool)

(declare-fun e!10887 () Bool)

(declare-fun e!10893 () Bool)

(assert (=> b!17399 (= e!10887 e!10893)))

(declare-fun res!12571 () Bool)

(assert (=> b!17399 (=> (not res!12571) (not e!10893))))

(declare-datatypes ((V!975 0))(
  ( (V!976 (val!458 Int)) )
))
(declare-datatypes ((ValueCell!232 0))(
  ( (ValueCellFull!232 (v!1420 V!975)) (EmptyCell!232) )
))
(declare-datatypes ((array!931 0))(
  ( (array!932 (arr!447 (Array (_ BitVec 32) ValueCell!232)) (size!537 (_ BitVec 32))) )
))
(declare-datatypes ((array!933 0))(
  ( (array!934 (arr!448 (Array (_ BitVec 32) (_ BitVec 64))) (size!538 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!50 0))(
  ( (LongMapFixedSize!51 (defaultEntry!1636 Int) (mask!4551 (_ BitVec 32)) (extraKeys!1549 (_ BitVec 32)) (zeroValue!1572 V!975) (minValue!1572 V!975) (_size!57 (_ BitVec 32)) (_keys!3061 array!933) (_values!1633 array!931) (_vacant!57 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!50 0))(
  ( (Cell!51 (v!1421 LongMapFixedSize!50)) )
))
(declare-datatypes ((LongMap!50 0))(
  ( (LongMap!51 (underlying!36 Cell!50)) )
))
(declare-fun lt!4520 () LongMap!50)

(declare-fun valid!26 (LongMap!50) Bool)

(assert (=> b!17399 (= res!12571 (valid!26 lt!4520))))

(declare-datatypes ((tuple2!726 0))(
  ( (tuple2!727 (_1!364 Bool) (_2!364 LongMapFixedSize!50)) )
))
(declare-fun lt!4522 () tuple2!726)

(assert (=> b!17399 (= lt!4520 (LongMap!51 (Cell!51 (_2!364 lt!4522))))))

(declare-fun key!682 () (_ BitVec 64))

(declare-datatypes ((tuple2!728 0))(
  ( (tuple2!729 (_1!365 Bool) (_2!365 LongMap!50)) )
))
(declare-fun lt!4519 () tuple2!728)

(declare-fun v!259 () V!975)

(declare-fun update!6 (LongMapFixedSize!50 (_ BitVec 64) V!975) tuple2!726)

(assert (=> b!17399 (= lt!4522 (update!6 (v!1421 (underlying!36 (_2!365 lt!4519))) key!682 v!259))))

(declare-fun b!17400 () Bool)

(declare-fun e!10897 () tuple2!728)

(declare-fun thiss!848 () LongMap!50)

(declare-fun repack!6 (LongMap!50) tuple2!728)

(assert (=> b!17400 (= e!10897 (repack!6 thiss!848))))

(declare-fun b!17401 () Bool)

(declare-fun e!10896 () Bool)

(assert (=> b!17401 (= e!10896 e!10887)))

(declare-fun res!12572 () Bool)

(assert (=> b!17401 (=> (not res!12572) (not e!10887))))

(assert (=> b!17401 (= res!12572 (_1!365 lt!4519))))

(assert (=> b!17401 (= lt!4519 e!10897)))

(declare-fun c!1747 () Bool)

(declare-fun imbalanced!9 (LongMap!50) Bool)

(assert (=> b!17401 (= c!1747 (imbalanced!9 thiss!848))))

(declare-fun b!17403 () Bool)

(assert (=> b!17403 (= e!10893 false)))

(declare-fun lt!4521 () Bool)

(declare-datatypes ((tuple2!730 0))(
  ( (tuple2!731 (_1!366 (_ BitVec 64)) (_2!366 V!975)) )
))
(declare-datatypes ((List!536 0))(
  ( (Nil!533) (Cons!532 (h!1098 tuple2!730) (t!3175 List!536)) )
))
(declare-datatypes ((ListLongMap!531 0))(
  ( (ListLongMap!532 (toList!281 List!536)) )
))
(declare-fun contains!213 (ListLongMap!531 (_ BitVec 64)) Bool)

(declare-fun map!334 (LongMap!50) ListLongMap!531)

(assert (=> b!17403 (= lt!4521 (contains!213 (map!334 lt!4520) key!682))))

(declare-fun b!17404 () Bool)

(declare-fun e!10892 () Bool)

(declare-fun e!10889 () Bool)

(declare-fun mapRes!729 () Bool)

(assert (=> b!17404 (= e!10892 (and e!10889 mapRes!729))))

(declare-fun condMapEmpty!729 () Bool)

(declare-fun mapDefault!729 () ValueCell!232)

