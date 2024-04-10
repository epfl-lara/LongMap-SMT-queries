; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80036 () Bool)

(assert start!80036)

(declare-fun b!941047 () Bool)

(declare-fun b_free!17891 () Bool)

(declare-fun b_next!17891 () Bool)

(assert (=> b!941047 (= b_free!17891 (not b_next!17891))))

(declare-fun tp!62147 () Bool)

(declare-fun b_and!29303 () Bool)

(assert (=> b!941047 (= tp!62147 b_and!29303)))

(declare-fun b!941046 () Bool)

(declare-fun res!632719 () Bool)

(declare-fun e!528988 () Bool)

(assert (=> b!941046 (=> (not res!632719) (not e!528988))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941046 (= res!632719 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!32163 0))(
  ( (V!32164 (val!10250 Int)) )
))
(declare-datatypes ((ValueCell!9718 0))(
  ( (ValueCellFull!9718 (v!12781 V!32163)) (EmptyCell!9718) )
))
(declare-datatypes ((array!56746 0))(
  ( (array!56747 (arr!27308 (Array (_ BitVec 32) ValueCell!9718)) (size!27769 (_ BitVec 32))) )
))
(declare-datatypes ((array!56748 0))(
  ( (array!56749 (arr!27309 (Array (_ BitVec 32) (_ BitVec 64))) (size!27770 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4586 0))(
  ( (LongMapFixedSize!4587 (defaultEntry!5584 Int) (mask!27137 (_ BitVec 32)) (extraKeys!5316 (_ BitVec 32)) (zeroValue!5420 V!32163) (minValue!5420 V!32163) (_size!2348 (_ BitVec 32)) (_keys!10434 array!56748) (_values!5607 array!56746) (_vacant!2348 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4586)

(declare-fun e!528987 () Bool)

(declare-fun tp_is_empty!20399 () Bool)

(declare-fun e!528981 () Bool)

(declare-fun array_inv!21224 (array!56748) Bool)

(declare-fun array_inv!21225 (array!56746) Bool)

(assert (=> b!941047 (= e!528981 (and tp!62147 tp_is_empty!20399 (array_inv!21224 (_keys!10434 thiss!1141)) (array_inv!21225 (_values!5607 thiss!1141)) e!528987))))

(declare-fun mapIsEmpty!32389 () Bool)

(declare-fun mapRes!32389 () Bool)

(assert (=> mapIsEmpty!32389 mapRes!32389))

(declare-fun b!941048 () Bool)

(declare-fun e!528982 () Bool)

(declare-fun e!528984 () Bool)

(assert (=> b!941048 (= e!528982 (not e!528984))))

(declare-fun res!632716 () Bool)

(assert (=> b!941048 (=> res!632716 e!528984)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941048 (= res!632716 (not (validMask!0 (mask!27137 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941048 (arrayContainsKey!0 (_keys!10434 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9014 0))(
  ( (MissingZero!9014 (index!38427 (_ BitVec 32))) (Found!9014 (index!38428 (_ BitVec 32))) (Intermediate!9014 (undefined!9826 Bool) (index!38429 (_ BitVec 32)) (x!80723 (_ BitVec 32))) (Undefined!9014) (MissingVacant!9014 (index!38430 (_ BitVec 32))) )
))
(declare-fun lt!424892 () SeekEntryResult!9014)

(declare-datatypes ((Unit!31794 0))(
  ( (Unit!31795) )
))
(declare-fun lt!424893 () Unit!31794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56748 (_ BitVec 64) (_ BitVec 32)) Unit!31794)

(assert (=> b!941048 (= lt!424893 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10434 thiss!1141) key!756 (index!38428 lt!424892)))))

(declare-fun mapNonEmpty!32389 () Bool)

(declare-fun tp!62148 () Bool)

(declare-fun e!528983 () Bool)

(assert (=> mapNonEmpty!32389 (= mapRes!32389 (and tp!62148 e!528983))))

(declare-fun mapRest!32389 () (Array (_ BitVec 32) ValueCell!9718))

(declare-fun mapValue!32389 () ValueCell!9718)

(declare-fun mapKey!32389 () (_ BitVec 32))

(assert (=> mapNonEmpty!32389 (= (arr!27308 (_values!5607 thiss!1141)) (store mapRest!32389 mapKey!32389 mapValue!32389))))

(declare-fun b!941049 () Bool)

(assert (=> b!941049 (= e!528984 true)))

(declare-fun lt!424894 () Bool)

(declare-datatypes ((List!19201 0))(
  ( (Nil!19198) (Cons!19197 (h!20343 (_ BitVec 64)) (t!27516 List!19201)) )
))
(declare-fun arrayNoDuplicates!0 (array!56748 (_ BitVec 32) List!19201) Bool)

(assert (=> b!941049 (= lt!424894 (arrayNoDuplicates!0 (_keys!10434 thiss!1141) #b00000000000000000000000000000000 Nil!19198))))

(declare-fun b!941050 () Bool)

(declare-fun res!632715 () Bool)

(assert (=> b!941050 (=> res!632715 e!528984)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56748 (_ BitVec 32)) Bool)

(assert (=> b!941050 (= res!632715 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10434 thiss!1141) (mask!27137 thiss!1141))))))

(declare-fun b!941051 () Bool)

(assert (=> b!941051 (= e!528988 e!528982)))

(declare-fun res!632718 () Bool)

(assert (=> b!941051 (=> (not res!632718) (not e!528982))))

(assert (=> b!941051 (= res!632718 (is-Found!9014 lt!424892))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56748 (_ BitVec 32)) SeekEntryResult!9014)

(assert (=> b!941051 (= lt!424892 (seekEntry!0 key!756 (_keys!10434 thiss!1141) (mask!27137 thiss!1141)))))

(declare-fun b!941052 () Bool)

(declare-fun e!528986 () Bool)

(assert (=> b!941052 (= e!528987 (and e!528986 mapRes!32389))))

(declare-fun condMapEmpty!32389 () Bool)

(declare-fun mapDefault!32389 () ValueCell!9718)

