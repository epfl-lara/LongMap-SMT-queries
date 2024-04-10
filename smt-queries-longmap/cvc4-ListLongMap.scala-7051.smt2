; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89364 () Bool)

(assert start!89364)

(declare-fun b!1024368 () Bool)

(declare-fun b_free!20363 () Bool)

(declare-fun b_next!20363 () Bool)

(assert (=> b!1024368 (= b_free!20363 (not b_next!20363))))

(declare-fun tp!72134 () Bool)

(declare-fun b_and!32609 () Bool)

(assert (=> b!1024368 (= tp!72134 b_and!32609)))

(declare-fun res!685848 () Bool)

(declare-fun e!577414 () Bool)

(assert (=> start!89364 (=> (not res!685848) (not e!577414))))

(declare-datatypes ((V!36983 0))(
  ( (V!36984 (val!12092 Int)) )
))
(declare-datatypes ((ValueCell!11338 0))(
  ( (ValueCellFull!11338 (v!14661 V!36983)) (EmptyCell!11338) )
))
(declare-datatypes ((array!64216 0))(
  ( (array!64217 (arr!30917 (Array (_ BitVec 32) (_ BitVec 64))) (size!31430 (_ BitVec 32))) )
))
(declare-datatypes ((array!64218 0))(
  ( (array!64219 (arr!30918 (Array (_ BitVec 32) ValueCell!11338)) (size!31431 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5270 0))(
  ( (LongMapFixedSize!5271 (defaultEntry!5987 Int) (mask!29635 (_ BitVec 32)) (extraKeys!5719 (_ BitVec 32)) (zeroValue!5823 V!36983) (minValue!5823 V!36983) (_size!2690 (_ BitVec 32)) (_keys!11134 array!64216) (_values!6010 array!64218) (_vacant!2690 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5270)

(declare-fun valid!2006 (LongMapFixedSize!5270) Bool)

(assert (=> start!89364 (= res!685848 (valid!2006 thiss!1427))))

(assert (=> start!89364 e!577414))

(declare-fun e!577411 () Bool)

(assert (=> start!89364 e!577411))

(assert (=> start!89364 true))

(declare-fun b!1024363 () Bool)

(declare-fun e!577408 () Bool)

(declare-fun tp_is_empty!24083 () Bool)

(assert (=> b!1024363 (= e!577408 tp_is_empty!24083)))

(declare-fun b!1024364 () Bool)

(declare-fun e!577407 () Bool)

(declare-fun e!577412 () Bool)

(assert (=> b!1024364 (= e!577407 (not e!577412))))

(declare-fun res!685853 () Bool)

(assert (=> b!1024364 (=> res!685853 e!577412)))

(assert (=> b!1024364 (= res!685853 (or (bvsge (size!31430 (_keys!11134 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31430 (_keys!11134 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9593 0))(
  ( (MissingZero!9593 (index!40743 (_ BitVec 32))) (Found!9593 (index!40744 (_ BitVec 32))) (Intermediate!9593 (undefined!10405 Bool) (index!40745 (_ BitVec 32)) (x!91071 (_ BitVec 32))) (Undefined!9593) (MissingVacant!9593 (index!40746 (_ BitVec 32))) )
))
(declare-fun lt!450595 () SeekEntryResult!9593)

(declare-fun arrayCountValidKeys!0 (array!64216 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024364 (= (arrayCountValidKeys!0 (array!64217 (store (arr!30917 (_keys!11134 thiss!1427)) (index!40744 lt!450595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31430 (_keys!11134 thiss!1427))) #b00000000000000000000000000000000 (size!31430 (_keys!11134 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11134 thiss!1427) #b00000000000000000000000000000000 (size!31430 (_keys!11134 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33347 0))(
  ( (Unit!33348) )
))
(declare-fun lt!450597 () Unit!33347)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64216 (_ BitVec 32) (_ BitVec 64)) Unit!33347)

(assert (=> b!1024364 (= lt!450597 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11134 thiss!1427) (index!40744 lt!450595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024365 () Bool)

(declare-fun res!685849 () Bool)

(assert (=> b!1024365 (=> res!685849 e!577412)))

(declare-datatypes ((List!21728 0))(
  ( (Nil!21725) (Cons!21724 (h!22922 (_ BitVec 64)) (t!30790 List!21728)) )
))
(declare-fun contains!5944 (List!21728 (_ BitVec 64)) Bool)

(assert (=> b!1024365 (= res!685849 (contains!5944 Nil!21725 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024366 () Bool)

(declare-fun e!577409 () Bool)

(assert (=> b!1024366 (= e!577409 tp_is_empty!24083)))

(declare-fun b!1024367 () Bool)

(declare-fun res!685851 () Bool)

(assert (=> b!1024367 (=> res!685851 e!577412)))

(declare-fun noDuplicate!1461 (List!21728) Bool)

(assert (=> b!1024367 (= res!685851 (not (noDuplicate!1461 Nil!21725)))))

(declare-fun e!577410 () Bool)

(declare-fun array_inv!23951 (array!64216) Bool)

(declare-fun array_inv!23952 (array!64218) Bool)

(assert (=> b!1024368 (= e!577411 (and tp!72134 tp_is_empty!24083 (array_inv!23951 (_keys!11134 thiss!1427)) (array_inv!23952 (_values!6010 thiss!1427)) e!577410))))

(declare-fun b!1024369 () Bool)

(declare-fun res!685850 () Bool)

(assert (=> b!1024369 (=> res!685850 e!577412)))

(assert (=> b!1024369 (= res!685850 (contains!5944 Nil!21725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37553 () Bool)

(declare-fun mapRes!37553 () Bool)

(assert (=> mapIsEmpty!37553 mapRes!37553))

(declare-fun b!1024370 () Bool)

(assert (=> b!1024370 (= e!577410 (and e!577408 mapRes!37553))))

(declare-fun condMapEmpty!37553 () Bool)

(declare-fun mapDefault!37553 () ValueCell!11338)

