; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81322 () Bool)

(assert start!81322)

(declare-fun b!951112 () Bool)

(declare-fun b_free!18259 () Bool)

(declare-fun b_next!18259 () Bool)

(assert (=> b!951112 (= b_free!18259 (not b_next!18259))))

(declare-fun tp!63383 () Bool)

(declare-fun b_and!29725 () Bool)

(assert (=> b!951112 (= tp!63383 b_and!29725)))

(declare-fun b!951110 () Bool)

(declare-fun e!535547 () Bool)

(declare-fun e!535543 () Bool)

(assert (=> b!951110 (= e!535547 (not e!535543))))

(declare-fun res!637490 () Bool)

(assert (=> b!951110 (=> res!637490 e!535543)))

(declare-datatypes ((V!32655 0))(
  ( (V!32656 (val!10434 Int)) )
))
(declare-datatypes ((ValueCell!9902 0))(
  ( (ValueCellFull!9902 (v!12980 V!32655)) (EmptyCell!9902) )
))
(declare-datatypes ((array!57558 0))(
  ( (array!57559 (arr!27676 (Array (_ BitVec 32) ValueCell!9902)) (size!28154 (_ BitVec 32))) )
))
(declare-datatypes ((array!57560 0))(
  ( (array!57561 (arr!27677 (Array (_ BitVec 32) (_ BitVec 64))) (size!28155 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4954 0))(
  ( (LongMapFixedSize!4955 (defaultEntry!5796 Int) (mask!27612 (_ BitVec 32)) (extraKeys!5528 (_ BitVec 32)) (zeroValue!5632 V!32655) (minValue!5632 V!32655) (_size!2532 (_ BitVec 32)) (_keys!10738 array!57560) (_values!5819 array!57558) (_vacant!2532 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4954)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951110 (= res!637490 (not (validMask!0 (mask!27612 thiss!1141))))))

(declare-fun lt!428396 () (_ BitVec 32))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57560 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951110 (= lt!428396 (arrayScanForKey!0 (_keys!10738 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951110 (arrayContainsKey!0 (_keys!10738 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!32007 0))(
  ( (Unit!32008) )
))
(declare-fun lt!428397 () Unit!32007)

(declare-fun lemmaKeyInListMapIsInArray!323 (array!57560 array!57558 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 64) Int) Unit!32007)

(assert (=> b!951110 (= lt!428397 (lemmaKeyInListMapIsInArray!323 (_keys!10738 thiss!1141) (_values!5819 thiss!1141) (mask!27612 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) key!756 (defaultEntry!5796 thiss!1141)))))

(declare-fun b!951111 () Bool)

(declare-fun res!637491 () Bool)

(assert (=> b!951111 (=> (not res!637491) (not e!535547))))

(declare-datatypes ((tuple2!13560 0))(
  ( (tuple2!13561 (_1!6791 (_ BitVec 64)) (_2!6791 V!32655)) )
))
(declare-datatypes ((List!19348 0))(
  ( (Nil!19345) (Cons!19344 (h!20505 tuple2!13560) (t!27693 List!19348)) )
))
(declare-datatypes ((ListLongMap!12257 0))(
  ( (ListLongMap!12258 (toList!6144 List!19348)) )
))
(declare-fun contains!5237 (ListLongMap!12257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3377 (array!57560 array!57558 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 32) Int) ListLongMap!12257)

(assert (=> b!951111 (= res!637491 (contains!5237 (getCurrentListMap!3377 (_keys!10738 thiss!1141) (_values!5819 thiss!1141) (mask!27612 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)) key!756))))

(declare-fun res!637493 () Bool)

(assert (=> start!81322 (=> (not res!637493) (not e!535547))))

(declare-fun valid!1884 (LongMapFixedSize!4954) Bool)

(assert (=> start!81322 (= res!637493 (valid!1884 thiss!1141))))

(assert (=> start!81322 e!535547))

(declare-fun e!535541 () Bool)

(assert (=> start!81322 e!535541))

(assert (=> start!81322 true))

(declare-fun tp_is_empty!20767 () Bool)

(declare-fun e!535545 () Bool)

(declare-fun array_inv!21482 (array!57560) Bool)

(declare-fun array_inv!21483 (array!57558) Bool)

(assert (=> b!951112 (= e!535541 (and tp!63383 tp_is_empty!20767 (array_inv!21482 (_keys!10738 thiss!1141)) (array_inv!21483 (_values!5819 thiss!1141)) e!535545))))

(declare-fun b!951113 () Bool)

(declare-fun res!637489 () Bool)

(assert (=> b!951113 (=> (not res!637489) (not e!535547))))

(declare-datatypes ((SeekEntryResult!9148 0))(
  ( (MissingZero!9148 (index!38963 (_ BitVec 32))) (Found!9148 (index!38964 (_ BitVec 32))) (Intermediate!9148 (undefined!9960 Bool) (index!38965 (_ BitVec 32)) (x!81828 (_ BitVec 32))) (Undefined!9148) (MissingVacant!9148 (index!38966 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57560 (_ BitVec 32)) SeekEntryResult!9148)

(assert (=> b!951113 (= res!637489 (not (is-Found!9148 (seekEntry!0 key!756 (_keys!10738 thiss!1141) (mask!27612 thiss!1141)))))))

(declare-fun mapIsEmpty!33072 () Bool)

(declare-fun mapRes!33072 () Bool)

(assert (=> mapIsEmpty!33072 mapRes!33072))

(declare-fun b!951114 () Bool)

(assert (=> b!951114 (= e!535543 (or (not (= (size!28155 (_keys!10738 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27612 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28155 (_keys!10738 thiss!1141))) (and (bvsge lt!428396 #b00000000000000000000000000000000) (bvsle lt!428396 (size!28155 (_keys!10738 thiss!1141))))))))

(declare-fun b!951115 () Bool)

(declare-fun e!535546 () Bool)

(assert (=> b!951115 (= e!535545 (and e!535546 mapRes!33072))))

(declare-fun condMapEmpty!33072 () Bool)

(declare-fun mapDefault!33072 () ValueCell!9902)

