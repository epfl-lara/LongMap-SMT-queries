; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79972 () Bool)

(assert start!79972)

(declare-fun b!940117 () Bool)

(declare-fun b_free!17827 () Bool)

(declare-fun b_next!17827 () Bool)

(assert (=> b!940117 (= b_free!17827 (not b_next!17827))))

(declare-fun tp!61955 () Bool)

(declare-fun b_and!29239 () Bool)

(assert (=> b!940117 (= tp!61955 b_and!29239)))

(declare-fun b!940114 () Bool)

(declare-fun e!528232 () Bool)

(declare-fun tp_is_empty!20335 () Bool)

(assert (=> b!940114 (= e!528232 tp_is_empty!20335)))

(declare-fun mapNonEmpty!32293 () Bool)

(declare-fun mapRes!32293 () Bool)

(declare-fun tp!61956 () Bool)

(declare-fun e!528228 () Bool)

(assert (=> mapNonEmpty!32293 (= mapRes!32293 (and tp!61956 e!528228))))

(declare-fun mapKey!32293 () (_ BitVec 32))

(declare-datatypes ((V!32079 0))(
  ( (V!32080 (val!10218 Int)) )
))
(declare-datatypes ((ValueCell!9686 0))(
  ( (ValueCellFull!9686 (v!12749 V!32079)) (EmptyCell!9686) )
))
(declare-datatypes ((array!56618 0))(
  ( (array!56619 (arr!27244 (Array (_ BitVec 32) ValueCell!9686)) (size!27705 (_ BitVec 32))) )
))
(declare-datatypes ((array!56620 0))(
  ( (array!56621 (arr!27245 (Array (_ BitVec 32) (_ BitVec 64))) (size!27706 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4522 0))(
  ( (LongMapFixedSize!4523 (defaultEntry!5552 Int) (mask!27085 (_ BitVec 32)) (extraKeys!5284 (_ BitVec 32)) (zeroValue!5388 V!32079) (minValue!5388 V!32079) (_size!2316 (_ BitVec 32)) (_keys!10402 array!56620) (_values!5575 array!56618) (_vacant!2316 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4522)

(declare-fun mapRest!32293 () (Array (_ BitVec 32) ValueCell!9686))

(declare-fun mapValue!32293 () ValueCell!9686)

(assert (=> mapNonEmpty!32293 (= (arr!27244 (_values!5575 thiss!1141)) (store mapRest!32293 mapKey!32293 mapValue!32293))))

(declare-fun b!940115 () Bool)

(declare-fun e!528227 () Bool)

(assert (=> b!940115 (= e!528227 false)))

(declare-datatypes ((SeekEntryResult!8990 0))(
  ( (MissingZero!8990 (index!38331 (_ BitVec 32))) (Found!8990 (index!38332 (_ BitVec 32))) (Intermediate!8990 (undefined!9802 Bool) (index!38333 (_ BitVec 32)) (x!80619 (_ BitVec 32))) (Undefined!8990) (MissingVacant!8990 (index!38334 (_ BitVec 32))) )
))
(declare-fun lt!424618 () SeekEntryResult!8990)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56620 (_ BitVec 32)) SeekEntryResult!8990)

(assert (=> b!940115 (= lt!424618 (seekEntry!0 key!756 (_keys!10402 thiss!1141) (mask!27085 thiss!1141)))))

(declare-fun b!940116 () Bool)

(declare-fun e!528229 () Bool)

(assert (=> b!940116 (= e!528229 (and e!528232 mapRes!32293))))

(declare-fun condMapEmpty!32293 () Bool)

(declare-fun mapDefault!32293 () ValueCell!9686)

