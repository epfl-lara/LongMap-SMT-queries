; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3016 () Bool)

(assert start!3016)

(declare-fun b!17778 () Bool)

(declare-fun b_free!623 () Bool)

(declare-fun b_next!623 () Bool)

(assert (=> b!17778 (= b_free!623 (not b_next!623))))

(declare-fun tp!3059 () Bool)

(declare-fun b_and!1271 () Bool)

(assert (=> b!17778 (= tp!3059 b_and!1271)))

(declare-datatypes ((V!1007 0))(
  ( (V!1008 (val!470 Int)) )
))
(declare-datatypes ((ValueCell!244 0))(
  ( (ValueCellFull!244 (v!1444 V!1007)) (EmptyCell!244) )
))
(declare-datatypes ((array!979 0))(
  ( (array!980 (arr!471 (Array (_ BitVec 32) ValueCell!244)) (size!561 (_ BitVec 32))) )
))
(declare-datatypes ((array!981 0))(
  ( (array!982 (arr!472 (Array (_ BitVec 32) (_ BitVec 64))) (size!562 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!74 0))(
  ( (LongMapFixedSize!75 (defaultEntry!1648 Int) (mask!4571 (_ BitVec 32)) (extraKeys!1561 (_ BitVec 32)) (zeroValue!1584 V!1007) (minValue!1584 V!1007) (_size!69 (_ BitVec 32)) (_keys!3073 array!981) (_values!1645 array!979) (_vacant!69 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!74 0))(
  ( (Cell!75 (v!1445 LongMapFixedSize!74)) )
))
(declare-datatypes ((LongMap!74 0))(
  ( (LongMap!75 (underlying!48 Cell!74)) )
))
(declare-fun thiss!848 () LongMap!74)

(declare-fun tp_is_empty!887 () Bool)

(declare-fun e!11264 () Bool)

(declare-fun e!11261 () Bool)

(declare-fun array_inv!327 (array!981) Bool)

(declare-fun array_inv!328 (array!979) Bool)

(assert (=> b!17778 (= e!11264 (and tp!3059 tp_is_empty!887 (array_inv!327 (_keys!3073 (v!1445 (underlying!48 thiss!848)))) (array_inv!328 (_values!1645 (v!1445 (underlying!48 thiss!848)))) e!11261))))

(declare-fun mapIsEmpty!765 () Bool)

(declare-fun mapRes!765 () Bool)

(assert (=> mapIsEmpty!765 mapRes!765))

(declare-fun b!17779 () Bool)

(declare-datatypes ((tuple2!766 0))(
  ( (tuple2!767 (_1!384 Bool) (_2!384 LongMap!74)) )
))
(declare-fun e!11262 () tuple2!766)

(assert (=> b!17779 (= e!11262 (tuple2!767 true thiss!848))))

(declare-fun b!17781 () Bool)

(declare-fun e!11258 () Bool)

(assert (=> b!17781 (= e!11258 e!11264)))

(declare-fun b!17782 () Bool)

(declare-fun e!11257 () Bool)

(declare-fun e!11263 () Bool)

(assert (=> b!17782 (= e!11257 e!11263)))

(declare-fun res!12663 () Bool)

(assert (=> b!17782 (=> (not res!12663) (not e!11263))))

(declare-fun lt!4611 () tuple2!766)

(assert (=> b!17782 (= res!12663 (not (_1!384 lt!4611)))))

(assert (=> b!17782 (= lt!4611 e!11262)))

(declare-fun c!1783 () Bool)

(declare-fun imbalanced!19 (LongMap!74) Bool)

(assert (=> b!17782 (= c!1783 (imbalanced!19 thiss!848))))

(declare-fun b!17783 () Bool)

(declare-fun e!11259 () Bool)

(assert (=> b!17783 (= e!11259 tp_is_empty!887)))

(declare-fun b!17784 () Bool)

(assert (=> b!17784 (= e!11263 false)))

(declare-fun lt!4612 () Bool)

(declare-fun valid!37 (LongMap!74) Bool)

(assert (=> b!17784 (= lt!4612 (valid!37 (_2!384 lt!4611)))))

(declare-fun b!17785 () Bool)

(declare-fun repack!14 (LongMap!74) tuple2!766)

(assert (=> b!17785 (= e!11262 (repack!14 thiss!848))))

(declare-fun b!17786 () Bool)

(declare-fun e!11266 () Bool)

(assert (=> b!17786 (= e!11266 tp_is_empty!887)))

(declare-fun b!17787 () Bool)

(assert (=> b!17787 (= e!11261 (and e!11266 mapRes!765))))

(declare-fun condMapEmpty!765 () Bool)

(declare-fun mapDefault!765 () ValueCell!244)

