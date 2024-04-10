; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89454 () Bool)

(assert start!89454)

(declare-fun b!1025852 () Bool)

(declare-fun b_free!20453 () Bool)

(declare-fun b_next!20453 () Bool)

(assert (=> b!1025852 (= b_free!20453 (not b_next!20453))))

(declare-fun tp!72404 () Bool)

(declare-fun b_and!32699 () Bool)

(assert (=> b!1025852 (= tp!72404 b_and!32699)))

(declare-fun b!1025848 () Bool)

(declare-fun e!578492 () Bool)

(declare-fun tp_is_empty!24173 () Bool)

(assert (=> b!1025848 (= e!578492 tp_is_empty!24173)))

(declare-fun b!1025849 () Bool)

(declare-fun e!578494 () Bool)

(declare-fun e!578490 () Bool)

(assert (=> b!1025849 (= e!578494 (not e!578490))))

(declare-fun res!686793 () Bool)

(assert (=> b!1025849 (=> res!686793 e!578490)))

(declare-datatypes ((V!37103 0))(
  ( (V!37104 (val!12137 Int)) )
))
(declare-datatypes ((ValueCell!11383 0))(
  ( (ValueCellFull!11383 (v!14706 V!37103)) (EmptyCell!11383) )
))
(declare-datatypes ((array!64396 0))(
  ( (array!64397 (arr!31007 (Array (_ BitVec 32) (_ BitVec 64))) (size!31520 (_ BitVec 32))) )
))
(declare-datatypes ((array!64398 0))(
  ( (array!64399 (arr!31008 (Array (_ BitVec 32) ValueCell!11383)) (size!31521 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5360 0))(
  ( (LongMapFixedSize!5361 (defaultEntry!6032 Int) (mask!29710 (_ BitVec 32)) (extraKeys!5764 (_ BitVec 32)) (zeroValue!5868 V!37103) (minValue!5868 V!37103) (_size!2735 (_ BitVec 32)) (_keys!11179 array!64396) (_values!6055 array!64398) (_vacant!2735 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5360)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025849 (= res!686793 (not (validMask!0 (mask!29710 thiss!1427))))))

(declare-fun lt!451125 () array!64396)

(declare-datatypes ((List!21762 0))(
  ( (Nil!21759) (Cons!21758 (h!22956 (_ BitVec 64)) (t!30824 List!21762)) )
))
(declare-fun arrayNoDuplicates!0 (array!64396 (_ BitVec 32) List!21762) Bool)

(assert (=> b!1025849 (arrayNoDuplicates!0 lt!451125 #b00000000000000000000000000000000 Nil!21759)))

(declare-datatypes ((Unit!33409 0))(
  ( (Unit!33410) )
))
(declare-fun lt!451128 () Unit!33409)

(declare-datatypes ((SeekEntryResult!9631 0))(
  ( (MissingZero!9631 (index!40895 (_ BitVec 32))) (Found!9631 (index!40896 (_ BitVec 32))) (Intermediate!9631 (undefined!10443 Bool) (index!40897 (_ BitVec 32)) (x!91229 (_ BitVec 32))) (Undefined!9631) (MissingVacant!9631 (index!40898 (_ BitVec 32))) )
))
(declare-fun lt!451127 () SeekEntryResult!9631)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64396 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21762) Unit!33409)

(assert (=> b!1025849 (= lt!451128 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11179 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40896 lt!451127) #b00000000000000000000000000000000 Nil!21759))))

(declare-fun arrayCountValidKeys!0 (array!64396 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025849 (= (arrayCountValidKeys!0 lt!451125 #b00000000000000000000000000000000 (size!31520 (_keys!11179 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11179 thiss!1427) #b00000000000000000000000000000000 (size!31520 (_keys!11179 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025849 (= lt!451125 (array!64397 (store (arr!31007 (_keys!11179 thiss!1427)) (index!40896 lt!451127) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31520 (_keys!11179 thiss!1427))))))

(declare-fun lt!451126 () Unit!33409)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64396 (_ BitVec 32) (_ BitVec 64)) Unit!33409)

(assert (=> b!1025849 (= lt!451126 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11179 thiss!1427) (index!40896 lt!451127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686798 () Bool)

(declare-fun e!578488 () Bool)

(assert (=> start!89454 (=> (not res!686798) (not e!578488))))

(declare-fun valid!2038 (LongMapFixedSize!5360) Bool)

(assert (=> start!89454 (= res!686798 (valid!2038 thiss!1427))))

(assert (=> start!89454 e!578488))

(declare-fun e!578493 () Bool)

(assert (=> start!89454 e!578493))

(assert (=> start!89454 true))

(declare-fun b!1025850 () Bool)

(assert (=> b!1025850 (= e!578490 true)))

(declare-fun lt!451124 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64396 (_ BitVec 32)) Bool)

(assert (=> b!1025850 (= lt!451124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11179 thiss!1427) (mask!29710 thiss!1427)))))

(declare-fun b!1025851 () Bool)

(assert (=> b!1025851 (= e!578488 e!578494)))

(declare-fun res!686795 () Bool)

(assert (=> b!1025851 (=> (not res!686795) (not e!578494))))

(assert (=> b!1025851 (= res!686795 (is-Found!9631 lt!451127))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64396 (_ BitVec 32)) SeekEntryResult!9631)

(assert (=> b!1025851 (= lt!451127 (seekEntry!0 key!909 (_keys!11179 thiss!1427) (mask!29710 thiss!1427)))))

(declare-fun mapIsEmpty!37688 () Bool)

(declare-fun mapRes!37688 () Bool)

(assert (=> mapIsEmpty!37688 mapRes!37688))

(declare-fun e!578489 () Bool)

(declare-fun array_inv!24015 (array!64396) Bool)

(declare-fun array_inv!24016 (array!64398) Bool)

(assert (=> b!1025852 (= e!578493 (and tp!72404 tp_is_empty!24173 (array_inv!24015 (_keys!11179 thiss!1427)) (array_inv!24016 (_values!6055 thiss!1427)) e!578489))))

(declare-fun b!1025853 () Bool)

(declare-fun res!686796 () Bool)

(assert (=> b!1025853 (=> (not res!686796) (not e!578488))))

(assert (=> b!1025853 (= res!686796 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025854 () Bool)

(declare-fun e!578491 () Bool)

(assert (=> b!1025854 (= e!578491 tp_is_empty!24173)))

(declare-fun b!1025855 () Bool)

(declare-fun res!686794 () Bool)

(assert (=> b!1025855 (=> res!686794 e!578490)))

(assert (=> b!1025855 (= res!686794 (not (arrayNoDuplicates!0 (_keys!11179 thiss!1427) #b00000000000000000000000000000000 Nil!21759)))))

(declare-fun b!1025856 () Bool)

(declare-fun res!686792 () Bool)

(assert (=> b!1025856 (=> res!686792 e!578490)))

(assert (=> b!1025856 (= res!686792 (or (not (= (size!31520 (_keys!11179 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29710 thiss!1427)))) (bvslt (index!40896 lt!451127) #b00000000000000000000000000000000) (bvsge (index!40896 lt!451127) (size!31520 (_keys!11179 thiss!1427)))))))

(declare-fun b!1025857 () Bool)

(assert (=> b!1025857 (= e!578489 (and e!578492 mapRes!37688))))

(declare-fun condMapEmpty!37688 () Bool)

(declare-fun mapDefault!37688 () ValueCell!11383)

