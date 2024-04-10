; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2994 () Bool)

(assert start!2994)

(declare-fun b!17436 () Bool)

(declare-fun b_free!601 () Bool)

(declare-fun b_next!601 () Bool)

(assert (=> b!17436 (= b_free!601 (not b_next!601))))

(declare-fun tp!2994 () Bool)

(declare-fun b_and!1249 () Bool)

(assert (=> b!17436 (= tp!2994 b_and!1249)))

(declare-fun b!17434 () Bool)

(declare-fun e!10923 () Bool)

(declare-fun e!10926 () Bool)

(assert (=> b!17434 (= e!10923 e!10926)))

(declare-fun b!17435 () Bool)

(declare-fun e!10927 () Bool)

(declare-fun e!10922 () Bool)

(assert (=> b!17435 (= e!10927 e!10922)))

(declare-fun res!12583 () Bool)

(assert (=> b!17435 (=> (not res!12583) (not e!10922))))

(declare-datatypes ((V!979 0))(
  ( (V!980 (val!459 Int)) )
))
(declare-datatypes ((ValueCell!233 0))(
  ( (ValueCellFull!233 (v!1422 V!979)) (EmptyCell!233) )
))
(declare-datatypes ((array!935 0))(
  ( (array!936 (arr!449 (Array (_ BitVec 32) ValueCell!233)) (size!539 (_ BitVec 32))) )
))
(declare-datatypes ((array!937 0))(
  ( (array!938 (arr!450 (Array (_ BitVec 32) (_ BitVec 64))) (size!540 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!52 0))(
  ( (LongMapFixedSize!53 (defaultEntry!1637 Int) (mask!4554 (_ BitVec 32)) (extraKeys!1550 (_ BitVec 32)) (zeroValue!1573 V!979) (minValue!1573 V!979) (_size!58 (_ BitVec 32)) (_keys!3062 array!937) (_values!1634 array!935) (_vacant!58 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!52 0))(
  ( (Cell!53 (v!1423 LongMapFixedSize!52)) )
))
(declare-datatypes ((LongMap!52 0))(
  ( (LongMap!53 (underlying!37 Cell!52)) )
))
(declare-datatypes ((tuple2!732 0))(
  ( (tuple2!733 (_1!367 Bool) (_2!367 LongMap!52)) )
))
(declare-fun lt!4531 () tuple2!732)

(assert (=> b!17435 (= res!12583 (_1!367 lt!4531))))

(declare-fun e!10929 () tuple2!732)

(assert (=> b!17435 (= lt!4531 e!10929)))

(declare-fun c!1750 () Bool)

(declare-fun thiss!848 () LongMap!52)

(declare-fun imbalanced!10 (LongMap!52) Bool)

(assert (=> b!17435 (= c!1750 (imbalanced!10 thiss!848))))

(declare-fun b!17437 () Bool)

(declare-fun e!10920 () Bool)

(assert (=> b!17437 (= e!10922 e!10920)))

(declare-fun res!12584 () Bool)

(assert (=> b!17437 (=> (not res!12584) (not e!10920))))

(declare-fun lt!4534 () LongMap!52)

(declare-fun valid!27 (LongMap!52) Bool)

(assert (=> b!17437 (= res!12584 (valid!27 lt!4534))))

(declare-datatypes ((tuple2!734 0))(
  ( (tuple2!735 (_1!368 Bool) (_2!368 LongMapFixedSize!52)) )
))
(declare-fun lt!4533 () tuple2!734)

(assert (=> b!17437 (= lt!4534 (LongMap!53 (Cell!53 (_2!368 lt!4533))))))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun v!259 () V!979)

(declare-fun update!7 (LongMapFixedSize!52 (_ BitVec 64) V!979) tuple2!734)

(assert (=> b!17437 (= lt!4533 (update!7 (v!1423 (underlying!37 (_2!367 lt!4531))) key!682 v!259))))

(declare-fun mapNonEmpty!732 () Bool)

(declare-fun mapRes!732 () Bool)

(declare-fun tp!2993 () Bool)

(declare-fun e!10924 () Bool)

(assert (=> mapNonEmpty!732 (= mapRes!732 (and tp!2993 e!10924))))

(declare-fun mapValue!732 () ValueCell!233)

(declare-fun mapKey!732 () (_ BitVec 32))

(declare-fun mapRest!732 () (Array (_ BitVec 32) ValueCell!233))

(assert (=> mapNonEmpty!732 (= (arr!449 (_values!1634 (v!1423 (underlying!37 thiss!848)))) (store mapRest!732 mapKey!732 mapValue!732))))

(declare-fun mapIsEmpty!732 () Bool)

(assert (=> mapIsEmpty!732 mapRes!732))

(declare-fun b!17438 () Bool)

(declare-fun e!10928 () Bool)

(assert (=> b!17438 (= e!10928 e!10923)))

(declare-fun b!17439 () Bool)

(declare-fun repack!7 (LongMap!52) tuple2!732)

(assert (=> b!17439 (= e!10929 (repack!7 thiss!848))))

(declare-fun b!17440 () Bool)

(assert (=> b!17440 (= e!10929 (tuple2!733 true thiss!848))))

(declare-fun b!17441 () Bool)

(declare-fun e!10925 () Bool)

(declare-fun tp_is_empty!865 () Bool)

(assert (=> b!17441 (= e!10925 tp_is_empty!865)))

(declare-fun b!17442 () Bool)

(assert (=> b!17442 (= e!10924 tp_is_empty!865)))

(declare-fun b!17443 () Bool)

(declare-fun e!10930 () Bool)

(assert (=> b!17443 (= e!10930 (and e!10925 mapRes!732))))

(declare-fun condMapEmpty!732 () Bool)

(declare-fun mapDefault!732 () ValueCell!233)

