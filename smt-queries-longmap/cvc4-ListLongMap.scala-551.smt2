; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14674 () Bool)

(assert start!14674)

(declare-fun b!138797 () Bool)

(declare-fun b_free!3009 () Bool)

(declare-fun b_next!3009 () Bool)

(assert (=> b!138797 (= b_free!3009 (not b_next!3009))))

(declare-fun tp!11493 () Bool)

(declare-fun b_and!8651 () Bool)

(assert (=> b!138797 (= tp!11493 b_and!8651)))

(declare-fun b!138795 () Bool)

(declare-fun b_free!3011 () Bool)

(declare-fun b_next!3011 () Bool)

(assert (=> b!138795 (= b_free!3011 (not b_next!3011))))

(declare-fun tp!11496 () Bool)

(declare-fun b_and!8653 () Bool)

(assert (=> b!138795 (= tp!11496 b_and!8653)))

(declare-fun b!138785 () Bool)

(declare-fun res!66444 () Bool)

(declare-fun e!90495 () Bool)

(assert (=> b!138785 (=> (not res!66444) (not e!90495))))

(declare-datatypes ((V!3541 0))(
  ( (V!3542 (val!1505 Int)) )
))
(declare-datatypes ((array!4875 0))(
  ( (array!4876 (arr!2305 (Array (_ BitVec 32) (_ BitVec 64))) (size!2577 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1117 0))(
  ( (ValueCellFull!1117 (v!3268 V!3541)) (EmptyCell!1117) )
))
(declare-datatypes ((array!4877 0))(
  ( (array!4878 (arr!2306 (Array (_ BitVec 32) ValueCell!1117)) (size!2578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1142 0))(
  ( (LongMapFixedSize!1143 (defaultEntry!2933 Int) (mask!7269 (_ BitVec 32)) (extraKeys!2688 (_ BitVec 32)) (zeroValue!2783 V!3541) (minValue!2783 V!3541) (_size!620 (_ BitVec 32)) (_keys!4692 array!4875) (_values!2916 array!4877) (_vacant!620 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1142)

(declare-fun valid!552 (LongMapFixedSize!1142) Bool)

(assert (=> b!138785 (= res!66444 (valid!552 newMap!16))))

(declare-fun b!138786 () Bool)

(declare-fun res!66447 () Bool)

(assert (=> b!138786 (=> (not res!66447) (not e!90495))))

(declare-datatypes ((Cell!930 0))(
  ( (Cell!931 (v!3269 LongMapFixedSize!1142)) )
))
(declare-datatypes ((LongMap!930 0))(
  ( (LongMap!931 (underlying!476 Cell!930)) )
))
(declare-fun thiss!992 () LongMap!930)

(assert (=> b!138786 (= res!66447 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7269 newMap!16)) (_size!620 (v!3269 (underlying!476 thiss!992)))))))

(declare-fun b!138787 () Bool)

(declare-fun e!90498 () Bool)

(declare-fun tp_is_empty!2921 () Bool)

(assert (=> b!138787 (= e!90498 tp_is_empty!2921)))

(declare-fun b!138788 () Bool)

(declare-fun e!90502 () Bool)

(assert (=> b!138788 (= e!90502 tp_is_empty!2921)))

(declare-fun b!138789 () Bool)

(declare-fun e!90496 () Bool)

(declare-fun e!90506 () Bool)

(assert (=> b!138789 (= e!90496 e!90506)))

(declare-fun mapNonEmpty!4799 () Bool)

(declare-fun mapRes!4799 () Bool)

(declare-fun tp!11495 () Bool)

(declare-fun e!90499 () Bool)

(assert (=> mapNonEmpty!4799 (= mapRes!4799 (and tp!11495 e!90499))))

(declare-fun mapKey!4799 () (_ BitVec 32))

(declare-fun mapRest!4799 () (Array (_ BitVec 32) ValueCell!1117))

(declare-fun mapValue!4800 () ValueCell!1117)

(assert (=> mapNonEmpty!4799 (= (arr!2306 (_values!2916 newMap!16)) (store mapRest!4799 mapKey!4799 mapValue!4800))))

(declare-fun b!138791 () Bool)

(declare-fun e!90494 () Bool)

(assert (=> b!138791 (= e!90494 (and e!90502 mapRes!4799))))

(declare-fun condMapEmpty!4800 () Bool)

(declare-fun mapDefault!4800 () ValueCell!1117)

