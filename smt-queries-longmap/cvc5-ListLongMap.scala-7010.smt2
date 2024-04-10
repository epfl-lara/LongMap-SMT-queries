; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89052 () Bool)

(assert start!89052)

(declare-fun b!1021046 () Bool)

(declare-fun b_free!20113 () Bool)

(declare-fun b_next!20113 () Bool)

(assert (=> b!1021046 (= b_free!20113 (not b_next!20113))))

(declare-fun tp!71367 () Bool)

(declare-fun b_and!32301 () Bool)

(assert (=> b!1021046 (= tp!71367 b_and!32301)))

(declare-fun mapIsEmpty!37161 () Bool)

(declare-fun mapRes!37161 () Bool)

(assert (=> mapIsEmpty!37161 mapRes!37161))

(declare-fun res!684323 () Bool)

(declare-fun e!574910 () Bool)

(assert (=> start!89052 (=> (not res!684323) (not e!574910))))

(declare-datatypes ((V!36651 0))(
  ( (V!36652 (val!11967 Int)) )
))
(declare-datatypes ((array!63706 0))(
  ( (array!63707 (arr!30667 (Array (_ BitVec 32) (_ BitVec 64))) (size!31178 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11213 0))(
  ( (ValueCellFull!11213 (v!14521 V!36651)) (EmptyCell!11213) )
))
(declare-datatypes ((array!63708 0))(
  ( (array!63709 (arr!30668 (Array (_ BitVec 32) ValueCell!11213)) (size!31179 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5020 0))(
  ( (LongMapFixedSize!5021 (defaultEntry!5862 Int) (mask!29423 (_ BitVec 32)) (extraKeys!5594 (_ BitVec 32)) (zeroValue!5698 V!36651) (minValue!5698 V!36651) (_size!2565 (_ BitVec 32)) (_keys!11007 array!63706) (_values!5885 array!63708) (_vacant!2565 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1094 0))(
  ( (Cell!1095 (v!14522 LongMapFixedSize!5020)) )
))
(declare-datatypes ((LongMap!1094 0))(
  ( (LongMap!1095 (underlying!558 Cell!1094)) )
))
(declare-fun thiss!908 () LongMap!1094)

(declare-fun valid!1912 (LongMap!1094) Bool)

(assert (=> start!89052 (= res!684323 (valid!1912 thiss!908))))

(assert (=> start!89052 e!574910))

(declare-fun e!574908 () Bool)

(assert (=> start!89052 e!574908))

(assert (=> start!89052 true))

(declare-fun b!1021045 () Bool)

(assert (=> b!1021045 (= e!574910 false)))

(declare-fun lt!449973 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15472 0))(
  ( (tuple2!15473 (_1!7747 Bool) (_2!7747 LongMapFixedSize!5020)) )
))
(declare-fun remove!4 (LongMapFixedSize!5020 (_ BitVec 64)) tuple2!15472)

(assert (=> b!1021045 (= lt!449973 (valid!1912 (LongMap!1095 (Cell!1095 (_2!7747 (remove!4 (v!14522 (underlying!558 thiss!908)) key!697))))))))

(declare-fun e!574906 () Bool)

(declare-fun tp_is_empty!23833 () Bool)

(declare-fun e!574904 () Bool)

(declare-fun array_inv!23789 (array!63706) Bool)

(declare-fun array_inv!23790 (array!63708) Bool)

(assert (=> b!1021046 (= e!574904 (and tp!71367 tp_is_empty!23833 (array_inv!23789 (_keys!11007 (v!14522 (underlying!558 thiss!908)))) (array_inv!23790 (_values!5885 (v!14522 (underlying!558 thiss!908)))) e!574906))))

(declare-fun b!1021047 () Bool)

(declare-fun e!574911 () Bool)

(assert (=> b!1021047 (= e!574911 tp_is_empty!23833)))

(declare-fun b!1021048 () Bool)

(declare-fun e!574909 () Bool)

(assert (=> b!1021048 (= e!574909 tp_is_empty!23833)))

(declare-fun b!1021049 () Bool)

(assert (=> b!1021049 (= e!574906 (and e!574911 mapRes!37161))))

(declare-fun condMapEmpty!37161 () Bool)

(declare-fun mapDefault!37161 () ValueCell!11213)

