; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76426 () Bool)

(assert start!76426)

(declare-fun b!896288 () Bool)

(declare-fun b_free!15943 () Bool)

(declare-fun b_next!15943 () Bool)

(assert (=> b!896288 (= b_free!15943 (not b_next!15943))))

(declare-fun tp!55858 () Bool)

(declare-fun b_and!26235 () Bool)

(assert (=> b!896288 (= tp!55858 b_and!26235)))

(declare-fun mapIsEmpty!29021 () Bool)

(declare-fun mapRes!29021 () Bool)

(assert (=> mapIsEmpty!29021 mapRes!29021))

(declare-fun b!896285 () Bool)

(declare-fun e!500938 () Bool)

(declare-fun e!500933 () Bool)

(assert (=> b!896285 (= e!500938 (not e!500933))))

(declare-fun res!606078 () Bool)

(assert (=> b!896285 (=> res!606078 e!500933)))

(declare-datatypes ((SeekEntryResult!8893 0))(
  ( (MissingZero!8893 (index!37943 (_ BitVec 32))) (Found!8893 (index!37944 (_ BitVec 32))) (Intermediate!8893 (undefined!9705 Bool) (index!37945 (_ BitVec 32)) (x!76310 (_ BitVec 32))) (Undefined!8893) (MissingVacant!8893 (index!37946 (_ BitVec 32))) )
))
(declare-fun lt!404766 () SeekEntryResult!8893)

(declare-datatypes ((array!52556 0))(
  ( (array!52557 (arr!25267 (Array (_ BitVec 32) (_ BitVec 64))) (size!25718 (_ BitVec 32))) )
))
(declare-datatypes ((V!29327 0))(
  ( (V!29328 (val!9186 Int)) )
))
(declare-datatypes ((ValueCell!8654 0))(
  ( (ValueCellFull!8654 (v!11676 V!29327)) (EmptyCell!8654) )
))
(declare-datatypes ((array!52558 0))(
  ( (array!52559 (arr!25268 (Array (_ BitVec 32) ValueCell!8654)) (size!25719 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4324 0))(
  ( (LongMapFixedSize!4325 (defaultEntry!5374 Int) (mask!26009 (_ BitVec 32)) (extraKeys!5074 (_ BitVec 32)) (zeroValue!5178 V!29327) (minValue!5178 V!29327) (_size!2217 (_ BitVec 32)) (_keys!10105 array!52556) (_values!5365 array!52558) (_vacant!2217 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4324)

(assert (=> b!896285 (= res!606078 (or (not (is-Found!8893 lt!404766)) (bvslt (index!37944 lt!404766) #b00000000000000000000000000000000) (bvsge (index!37944 lt!404766) (size!25718 (_keys!10105 thiss!1181))) (bvsge (size!25718 (_keys!10105 thiss!1181)) #b01111111111111111111111111111111)))))

(declare-fun e!500936 () Bool)

(assert (=> b!896285 e!500936))

(declare-fun res!606075 () Bool)

(assert (=> b!896285 (=> res!606075 e!500936)))

(assert (=> b!896285 (= res!606075 (not (is-Found!8893 lt!404766)))))

(declare-datatypes ((Unit!30478 0))(
  ( (Unit!30479) )
))
(declare-fun lt!404767 () Unit!30478)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!67 (array!52556 array!52558 (_ BitVec 32) (_ BitVec 32) V!29327 V!29327 (_ BitVec 64)) Unit!30478)

(assert (=> b!896285 (= lt!404767 (lemmaSeekEntryGivesInRangeIndex!67 (_keys!10105 thiss!1181) (_values!5365 thiss!1181) (mask!26009 thiss!1181) (extraKeys!5074 thiss!1181) (zeroValue!5178 thiss!1181) (minValue!5178 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52556 (_ BitVec 32)) SeekEntryResult!8893)

(assert (=> b!896285 (= lt!404766 (seekEntry!0 key!785 (_keys!10105 thiss!1181) (mask!26009 thiss!1181)))))

(declare-fun res!606077 () Bool)

(assert (=> start!76426 (=> (not res!606077) (not e!500938))))

(declare-fun valid!1668 (LongMapFixedSize!4324) Bool)

(assert (=> start!76426 (= res!606077 (valid!1668 thiss!1181))))

(assert (=> start!76426 e!500938))

(declare-fun e!500937 () Bool)

(assert (=> start!76426 e!500937))

(assert (=> start!76426 true))

(declare-fun b!896286 () Bool)

(declare-fun e!500932 () Bool)

(declare-fun tp_is_empty!18271 () Bool)

(assert (=> b!896286 (= e!500932 tp_is_empty!18271)))

(declare-fun b!896287 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896287 (= e!500936 (inRange!0 (index!37944 lt!404766) (mask!26009 thiss!1181)))))

(declare-fun mapNonEmpty!29021 () Bool)

(declare-fun tp!55857 () Bool)

(declare-fun e!500931 () Bool)

(assert (=> mapNonEmpty!29021 (= mapRes!29021 (and tp!55857 e!500931))))

(declare-fun mapRest!29021 () (Array (_ BitVec 32) ValueCell!8654))

(declare-fun mapKey!29021 () (_ BitVec 32))

(declare-fun mapValue!29021 () ValueCell!8654)

(assert (=> mapNonEmpty!29021 (= (arr!25268 (_values!5365 thiss!1181)) (store mapRest!29021 mapKey!29021 mapValue!29021))))

(declare-fun e!500935 () Bool)

(declare-fun array_inv!19836 (array!52556) Bool)

(declare-fun array_inv!19837 (array!52558) Bool)

(assert (=> b!896288 (= e!500937 (and tp!55858 tp_is_empty!18271 (array_inv!19836 (_keys!10105 thiss!1181)) (array_inv!19837 (_values!5365 thiss!1181)) e!500935))))

(declare-fun b!896289 () Bool)

(assert (=> b!896289 (= e!500935 (and e!500932 mapRes!29021))))

(declare-fun condMapEmpty!29021 () Bool)

(declare-fun mapDefault!29021 () ValueCell!8654)

