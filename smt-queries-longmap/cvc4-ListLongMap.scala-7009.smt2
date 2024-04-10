; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89050 () Bool)

(assert start!89050)

(declare-fun b!1021026 () Bool)

(declare-fun b_free!20111 () Bool)

(declare-fun b_next!20111 () Bool)

(assert (=> b!1021026 (= b_free!20111 (not b_next!20111))))

(declare-fun tp!71361 () Bool)

(declare-fun b_and!32299 () Bool)

(assert (=> b!1021026 (= tp!71361 b_and!32299)))

(declare-fun b!1021024 () Bool)

(declare-fun e!574882 () Bool)

(declare-fun e!574880 () Bool)

(assert (=> b!1021024 (= e!574882 e!574880)))

(declare-fun b!1021025 () Bool)

(declare-fun e!574885 () Bool)

(assert (=> b!1021025 (= e!574885 false)))

(declare-fun lt!449970 () Bool)

(declare-datatypes ((V!36647 0))(
  ( (V!36648 (val!11966 Int)) )
))
(declare-datatypes ((array!63702 0))(
  ( (array!63703 (arr!30665 (Array (_ BitVec 32) (_ BitVec 64))) (size!31176 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11212 0))(
  ( (ValueCellFull!11212 (v!14519 V!36647)) (EmptyCell!11212) )
))
(declare-datatypes ((array!63704 0))(
  ( (array!63705 (arr!30666 (Array (_ BitVec 32) ValueCell!11212)) (size!31177 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5018 0))(
  ( (LongMapFixedSize!5019 (defaultEntry!5861 Int) (mask!29420 (_ BitVec 32)) (extraKeys!5593 (_ BitVec 32)) (zeroValue!5697 V!36647) (minValue!5697 V!36647) (_size!2564 (_ BitVec 32)) (_keys!11006 array!63702) (_values!5884 array!63704) (_vacant!2564 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1092 0))(
  ( (Cell!1093 (v!14520 LongMapFixedSize!5018)) )
))
(declare-datatypes ((LongMap!1092 0))(
  ( (LongMap!1093 (underlying!557 Cell!1092)) )
))
(declare-fun thiss!908 () LongMap!1092)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1911 (LongMap!1092) Bool)

(declare-datatypes ((tuple2!15470 0))(
  ( (tuple2!15471 (_1!7746 Bool) (_2!7746 LongMapFixedSize!5018)) )
))
(declare-fun remove!3 (LongMapFixedSize!5018 (_ BitVec 64)) tuple2!15470)

(assert (=> b!1021025 (= lt!449970 (valid!1911 (LongMap!1093 (Cell!1093 (_2!7746 (remove!3 (v!14520 (underlying!557 thiss!908)) key!697))))))))

(declare-fun tp_is_empty!23831 () Bool)

(declare-fun e!574887 () Bool)

(declare-fun array_inv!23787 (array!63702) Bool)

(declare-fun array_inv!23788 (array!63704) Bool)

(assert (=> b!1021026 (= e!574880 (and tp!71361 tp_is_empty!23831 (array_inv!23787 (_keys!11006 (v!14520 (underlying!557 thiss!908)))) (array_inv!23788 (_values!5884 (v!14520 (underlying!557 thiss!908)))) e!574887))))

(declare-fun b!1021027 () Bool)

(declare-fun e!574881 () Bool)

(declare-fun mapRes!37158 () Bool)

(assert (=> b!1021027 (= e!574887 (and e!574881 mapRes!37158))))

(declare-fun condMapEmpty!37158 () Bool)

(declare-fun mapDefault!37158 () ValueCell!11212)

