; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77192 () Bool)

(assert start!77192)

(declare-fun b!900795 () Bool)

(declare-fun b_free!16061 () Bool)

(declare-fun b_next!16061 () Bool)

(assert (=> b!900795 (= b_free!16061 (not b_next!16061))))

(declare-fun tp!56276 () Bool)

(declare-fun b_and!26385 () Bool)

(assert (=> b!900795 (= tp!56276 b_and!26385)))

(declare-fun e!504226 () Bool)

(declare-datatypes ((array!52830 0))(
  ( (array!52831 (arr!25385 (Array (_ BitVec 32) (_ BitVec 64))) (size!25844 (_ BitVec 32))) )
))
(declare-datatypes ((V!29483 0))(
  ( (V!29484 (val!9245 Int)) )
))
(declare-datatypes ((ValueCell!8713 0))(
  ( (ValueCellFull!8713 (v!11743 V!29483)) (EmptyCell!8713) )
))
(declare-datatypes ((array!52832 0))(
  ( (array!52833 (arr!25386 (Array (_ BitVec 32) ValueCell!8713)) (size!25845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4442 0))(
  ( (LongMapFixedSize!4443 (defaultEntry!5457 Int) (mask!26251 (_ BitVec 32)) (extraKeys!5184 (_ BitVec 32)) (zeroValue!5288 V!29483) (minValue!5288 V!29483) (_size!2276 (_ BitVec 32)) (_keys!10264 array!52830) (_values!5475 array!52832) (_vacant!2276 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4442)

(declare-fun e!504234 () Bool)

(declare-fun tp_is_empty!18389 () Bool)

(declare-fun array_inv!19912 (array!52830) Bool)

(declare-fun array_inv!19913 (array!52832) Bool)

(assert (=> b!900795 (= e!504234 (and tp!56276 tp_is_empty!18389 (array_inv!19912 (_keys!10264 thiss!1181)) (array_inv!19913 (_values!5475 thiss!1181)) e!504226))))

(declare-fun b!900796 () Bool)

(declare-fun e!504231 () Bool)

(declare-fun e!504227 () Bool)

(assert (=> b!900796 (= e!504231 (not e!504227))))

(declare-fun res!608278 () Bool)

(assert (=> b!900796 (=> res!608278 e!504227)))

(declare-datatypes ((SeekEntryResult!8944 0))(
  ( (MissingZero!8944 (index!38147 (_ BitVec 32))) (Found!8944 (index!38148 (_ BitVec 32))) (Intermediate!8944 (undefined!9756 Bool) (index!38149 (_ BitVec 32)) (x!76749 (_ BitVec 32))) (Undefined!8944) (MissingVacant!8944 (index!38150 (_ BitVec 32))) )
))
(declare-fun lt!407064 () SeekEntryResult!8944)

(assert (=> b!900796 (= res!608278 (not (is-Found!8944 lt!407064)))))

(declare-fun e!504232 () Bool)

(assert (=> b!900796 e!504232))

(declare-fun res!608281 () Bool)

(assert (=> b!900796 (=> res!608281 e!504232)))

(assert (=> b!900796 (= res!608281 (not (is-Found!8944 lt!407064)))))

(declare-datatypes ((Unit!30598 0))(
  ( (Unit!30599) )
))
(declare-fun lt!407063 () Unit!30598)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!105 (array!52830 array!52832 (_ BitVec 32) (_ BitVec 32) V!29483 V!29483 (_ BitVec 64)) Unit!30598)

(assert (=> b!900796 (= lt!407063 (lemmaSeekEntryGivesInRangeIndex!105 (_keys!10264 thiss!1181) (_values!5475 thiss!1181) (mask!26251 thiss!1181) (extraKeys!5184 thiss!1181) (zeroValue!5288 thiss!1181) (minValue!5288 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52830 (_ BitVec 32)) SeekEntryResult!8944)

(assert (=> b!900796 (= lt!407064 (seekEntry!0 key!785 (_keys!10264 thiss!1181) (mask!26251 thiss!1181)))))

(declare-fun b!900797 () Bool)

(declare-fun res!608274 () Bool)

(declare-fun e!504230 () Bool)

(assert (=> b!900797 (=> res!608274 e!504230)))

(assert (=> b!900797 (= res!608274 (or (not (= (size!25845 (_values!5475 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26251 thiss!1181)))) (not (= (size!25844 (_keys!10264 thiss!1181)) (size!25845 (_values!5475 thiss!1181)))) (bvslt (mask!26251 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5184 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5184 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!900798 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900798 (= e!504232 (inRange!0 (index!38148 lt!407064) (mask!26251 thiss!1181)))))

(declare-fun b!900799 () Bool)

(declare-fun res!608277 () Bool)

(assert (=> b!900799 (=> (not res!608277) (not e!504231))))

(assert (=> b!900799 (= res!608277 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29263 () Bool)

(declare-fun mapRes!29263 () Bool)

(assert (=> mapIsEmpty!29263 mapRes!29263))

(declare-fun b!900800 () Bool)

(declare-fun res!608276 () Bool)

(assert (=> b!900800 (=> res!608276 e!504230)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52830 (_ BitVec 32)) Bool)

(assert (=> b!900800 (= res!608276 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10264 thiss!1181) (mask!26251 thiss!1181))))))

(declare-fun mapNonEmpty!29263 () Bool)

(declare-fun tp!56277 () Bool)

(declare-fun e!504233 () Bool)

(assert (=> mapNonEmpty!29263 (= mapRes!29263 (and tp!56277 e!504233))))

(declare-fun mapValue!29263 () ValueCell!8713)

(declare-fun mapKey!29263 () (_ BitVec 32))

(declare-fun mapRest!29263 () (Array (_ BitVec 32) ValueCell!8713))

(assert (=> mapNonEmpty!29263 (= (arr!25386 (_values!5475 thiss!1181)) (store mapRest!29263 mapKey!29263 mapValue!29263))))

(declare-fun b!900801 () Bool)

(declare-fun e!504229 () Bool)

(assert (=> b!900801 (= e!504229 tp_is_empty!18389)))

(declare-fun res!608280 () Bool)

(assert (=> start!77192 (=> (not res!608280) (not e!504231))))

(declare-fun valid!1704 (LongMapFixedSize!4442) Bool)

(assert (=> start!77192 (= res!608280 (valid!1704 thiss!1181))))

(assert (=> start!77192 e!504231))

(assert (=> start!77192 e!504234))

(assert (=> start!77192 true))

(declare-fun b!900794 () Bool)

(assert (=> b!900794 (= e!504233 tp_is_empty!18389)))

(declare-fun b!900802 () Bool)

(declare-fun res!608279 () Bool)

(assert (=> b!900802 (=> res!608279 e!504230)))

(declare-datatypes ((List!17862 0))(
  ( (Nil!17859) (Cons!17858 (h!19004 (_ BitVec 64)) (t!25217 List!17862)) )
))
(declare-fun arrayNoDuplicates!0 (array!52830 (_ BitVec 32) List!17862) Bool)

(assert (=> b!900802 (= res!608279 (not (arrayNoDuplicates!0 (_keys!10264 thiss!1181) #b00000000000000000000000000000000 Nil!17859)))))

(declare-fun b!900803 () Bool)

(assert (=> b!900803 (= e!504226 (and e!504229 mapRes!29263))))

(declare-fun condMapEmpty!29263 () Bool)

(declare-fun mapDefault!29263 () ValueCell!8713)

