; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89424 () Bool)

(assert start!89424)

(declare-fun b!1025360 () Bool)

(declare-fun b_free!20423 () Bool)

(declare-fun b_next!20423 () Bool)

(assert (=> b!1025360 (= b_free!20423 (not b_next!20423))))

(declare-fun tp!72315 () Bool)

(declare-fun b_and!32669 () Bool)

(assert (=> b!1025360 (= tp!72315 b_and!32669)))

(declare-fun mapNonEmpty!37643 () Bool)

(declare-fun mapRes!37643 () Bool)

(declare-fun tp!72314 () Bool)

(declare-fun e!578130 () Bool)

(assert (=> mapNonEmpty!37643 (= mapRes!37643 (and tp!72314 e!578130))))

(declare-datatypes ((V!37063 0))(
  ( (V!37064 (val!12122 Int)) )
))
(declare-datatypes ((ValueCell!11368 0))(
  ( (ValueCellFull!11368 (v!14691 V!37063)) (EmptyCell!11368) )
))
(declare-fun mapRest!37643 () (Array (_ BitVec 32) ValueCell!11368))

(declare-fun mapKey!37643 () (_ BitVec 32))

(declare-fun mapValue!37643 () ValueCell!11368)

(declare-datatypes ((array!64336 0))(
  ( (array!64337 (arr!30977 (Array (_ BitVec 32) (_ BitVec 64))) (size!31490 (_ BitVec 32))) )
))
(declare-datatypes ((array!64338 0))(
  ( (array!64339 (arr!30978 (Array (_ BitVec 32) ValueCell!11368)) (size!31491 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5330 0))(
  ( (LongMapFixedSize!5331 (defaultEntry!6017 Int) (mask!29685 (_ BitVec 32)) (extraKeys!5749 (_ BitVec 32)) (zeroValue!5853 V!37063) (minValue!5853 V!37063) (_size!2720 (_ BitVec 32)) (_keys!11164 array!64336) (_values!6040 array!64338) (_vacant!2720 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5330)

(assert (=> mapNonEmpty!37643 (= (arr!30978 (_values!6040 thiss!1427)) (store mapRest!37643 mapKey!37643 mapValue!37643))))

(declare-fun b!1025353 () Bool)

(declare-fun res!686481 () Bool)

(declare-fun e!578128 () Bool)

(assert (=> b!1025353 (=> (not res!686481) (not e!578128))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025353 (= res!686481 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37643 () Bool)

(assert (=> mapIsEmpty!37643 mapRes!37643))

(declare-fun b!1025355 () Bool)

(declare-fun res!686482 () Bool)

(declare-fun e!578129 () Bool)

(assert (=> b!1025355 (=> res!686482 e!578129)))

(declare-datatypes ((SeekEntryResult!9616 0))(
  ( (MissingZero!9616 (index!40835 (_ BitVec 32))) (Found!9616 (index!40836 (_ BitVec 32))) (Intermediate!9616 (undefined!10428 Bool) (index!40837 (_ BitVec 32)) (x!91174 (_ BitVec 32))) (Undefined!9616) (MissingVacant!9616 (index!40838 (_ BitVec 32))) )
))
(declare-fun lt!450902 () SeekEntryResult!9616)

(assert (=> b!1025355 (= res!686482 (or (not (= (size!31490 (_keys!11164 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29685 thiss!1427)))) (bvslt (index!40836 lt!450902) #b00000000000000000000000000000000) (bvsge (index!40836 lt!450902) (size!31490 (_keys!11164 thiss!1427)))))))

(declare-fun b!1025356 () Bool)

(declare-fun e!578133 () Bool)

(assert (=> b!1025356 (= e!578133 (not e!578129))))

(declare-fun res!686483 () Bool)

(assert (=> b!1025356 (=> res!686483 e!578129)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025356 (= res!686483 (not (validMask!0 (mask!29685 thiss!1427))))))

(declare-fun lt!450901 () array!64336)

(declare-datatypes ((List!21751 0))(
  ( (Nil!21748) (Cons!21747 (h!22945 (_ BitVec 64)) (t!30813 List!21751)) )
))
(declare-fun arrayNoDuplicates!0 (array!64336 (_ BitVec 32) List!21751) Bool)

(assert (=> b!1025356 (arrayNoDuplicates!0 lt!450901 #b00000000000000000000000000000000 Nil!21748)))

(declare-datatypes ((Unit!33387 0))(
  ( (Unit!33388) )
))
(declare-fun lt!450903 () Unit!33387)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64336 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21751) Unit!33387)

(assert (=> b!1025356 (= lt!450903 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11164 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40836 lt!450902) #b00000000000000000000000000000000 Nil!21748))))

(declare-fun arrayCountValidKeys!0 (array!64336 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025356 (= (arrayCountValidKeys!0 lt!450901 #b00000000000000000000000000000000 (size!31490 (_keys!11164 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11164 thiss!1427) #b00000000000000000000000000000000 (size!31490 (_keys!11164 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025356 (= lt!450901 (array!64337 (store (arr!30977 (_keys!11164 thiss!1427)) (index!40836 lt!450902) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31490 (_keys!11164 thiss!1427))))))

(declare-fun lt!450899 () Unit!33387)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64336 (_ BitVec 32) (_ BitVec 64)) Unit!33387)

(assert (=> b!1025356 (= lt!450899 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11164 thiss!1427) (index!40836 lt!450902) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025357 () Bool)

(declare-fun tp_is_empty!24143 () Bool)

(assert (=> b!1025357 (= e!578130 tp_is_empty!24143)))

(declare-fun b!1025358 () Bool)

(declare-fun e!578132 () Bool)

(assert (=> b!1025358 (= e!578132 tp_is_empty!24143)))

(declare-fun b!1025359 () Bool)

(assert (=> b!1025359 (= e!578128 e!578133)))

(declare-fun res!686479 () Bool)

(assert (=> b!1025359 (=> (not res!686479) (not e!578133))))

(assert (=> b!1025359 (= res!686479 (is-Found!9616 lt!450902))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64336 (_ BitVec 32)) SeekEntryResult!9616)

(assert (=> b!1025359 (= lt!450902 (seekEntry!0 key!909 (_keys!11164 thiss!1427) (mask!29685 thiss!1427)))))

(declare-fun e!578127 () Bool)

(declare-fun e!578134 () Bool)

(declare-fun array_inv!23991 (array!64336) Bool)

(declare-fun array_inv!23992 (array!64338) Bool)

(assert (=> b!1025360 (= e!578134 (and tp!72315 tp_is_empty!24143 (array_inv!23991 (_keys!11164 thiss!1427)) (array_inv!23992 (_values!6040 thiss!1427)) e!578127))))

(declare-fun b!1025361 () Bool)

(assert (=> b!1025361 (= e!578129 true)))

(declare-fun lt!450900 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64336 (_ BitVec 32)) Bool)

(assert (=> b!1025361 (= lt!450900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11164 thiss!1427) (mask!29685 thiss!1427)))))

(declare-fun res!686478 () Bool)

(assert (=> start!89424 (=> (not res!686478) (not e!578128))))

(declare-fun valid!2026 (LongMapFixedSize!5330) Bool)

(assert (=> start!89424 (= res!686478 (valid!2026 thiss!1427))))

(assert (=> start!89424 e!578128))

(assert (=> start!89424 e!578134))

(assert (=> start!89424 true))

(declare-fun b!1025354 () Bool)

(declare-fun res!686480 () Bool)

(assert (=> b!1025354 (=> res!686480 e!578129)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025354 (= res!686480 (not (validKeyInArray!0 (select (arr!30977 (_keys!11164 thiss!1427)) (index!40836 lt!450902)))))))

(declare-fun b!1025362 () Bool)

(declare-fun res!686477 () Bool)

(assert (=> b!1025362 (=> res!686477 e!578129)))

(assert (=> b!1025362 (= res!686477 (not (arrayNoDuplicates!0 (_keys!11164 thiss!1427) #b00000000000000000000000000000000 Nil!21748)))))

(declare-fun b!1025363 () Bool)

(assert (=> b!1025363 (= e!578127 (and e!578132 mapRes!37643))))

(declare-fun condMapEmpty!37643 () Bool)

(declare-fun mapDefault!37643 () ValueCell!11368)

