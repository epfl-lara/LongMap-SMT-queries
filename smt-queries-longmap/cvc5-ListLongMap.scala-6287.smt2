; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80400 () Bool)

(assert start!80400)

(declare-fun b!944330 () Bool)

(declare-fun b_free!18043 () Bool)

(declare-fun b_next!18043 () Bool)

(assert (=> b!944330 (= b_free!18043 (not b_next!18043))))

(declare-fun tp!62638 () Bool)

(declare-fun b_and!29461 () Bool)

(assert (=> b!944330 (= tp!62638 b_and!29461)))

(declare-fun b!944325 () Bool)

(declare-fun res!634381 () Bool)

(declare-fun e!531031 () Bool)

(assert (=> b!944325 (=> (not res!634381) (not e!531031))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944325 (= res!634381 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944326 () Bool)

(declare-fun res!634382 () Bool)

(assert (=> b!944326 (=> (not res!634382) (not e!531031))))

(declare-datatypes ((V!32367 0))(
  ( (V!32368 (val!10326 Int)) )
))
(declare-datatypes ((ValueCell!9794 0))(
  ( (ValueCellFull!9794 (v!12858 V!32367)) (EmptyCell!9794) )
))
(declare-datatypes ((array!57070 0))(
  ( (array!57071 (arr!27460 (Array (_ BitVec 32) ValueCell!9794)) (size!27926 (_ BitVec 32))) )
))
(declare-datatypes ((array!57072 0))(
  ( (array!57073 (arr!27461 (Array (_ BitVec 32) (_ BitVec 64))) (size!27927 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4738 0))(
  ( (LongMapFixedSize!4739 (defaultEntry!5664 Int) (mask!27312 (_ BitVec 32)) (extraKeys!5396 (_ BitVec 32)) (zeroValue!5500 V!32367) (minValue!5500 V!32367) (_size!2424 (_ BitVec 32)) (_keys!10542 array!57072) (_values!5687 array!57070) (_vacant!2424 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4738)

(declare-datatypes ((SeekEntryResult!9064 0))(
  ( (MissingZero!9064 (index!38627 (_ BitVec 32))) (Found!9064 (index!38628 (_ BitVec 32))) (Intermediate!9064 (undefined!9876 Bool) (index!38629 (_ BitVec 32)) (x!81107 (_ BitVec 32))) (Undefined!9064) (MissingVacant!9064 (index!38630 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57072 (_ BitVec 32)) SeekEntryResult!9064)

(assert (=> b!944326 (= res!634382 (not (is-Found!9064 (seekEntry!0 key!756 (_keys!10542 thiss!1141) (mask!27312 thiss!1141)))))))

(declare-fun b!944327 () Bool)

(declare-fun e!531033 () Bool)

(assert (=> b!944327 (= e!531033 true)))

(declare-fun lt!425593 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57072 (_ BitVec 32)) Bool)

(assert (=> b!944327 (= lt!425593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10542 thiss!1141) (mask!27312 thiss!1141)))))

(declare-fun b!944328 () Bool)

(declare-fun e!531030 () Bool)

(declare-fun tp_is_empty!20551 () Bool)

(assert (=> b!944328 (= e!531030 tp_is_empty!20551)))

(declare-fun res!634380 () Bool)

(assert (=> start!80400 (=> (not res!634380) (not e!531031))))

(declare-fun valid!1812 (LongMapFixedSize!4738) Bool)

(assert (=> start!80400 (= res!634380 (valid!1812 thiss!1141))))

(assert (=> start!80400 e!531031))

(declare-fun e!531032 () Bool)

(assert (=> start!80400 e!531032))

(assert (=> start!80400 true))

(declare-fun b!944329 () Bool)

(declare-fun e!531028 () Bool)

(assert (=> b!944329 (= e!531028 tp_is_empty!20551)))

(declare-fun e!531029 () Bool)

(declare-fun array_inv!21334 (array!57072) Bool)

(declare-fun array_inv!21335 (array!57070) Bool)

(assert (=> b!944330 (= e!531032 (and tp!62638 tp_is_empty!20551 (array_inv!21334 (_keys!10542 thiss!1141)) (array_inv!21335 (_values!5687 thiss!1141)) e!531029))))

(declare-fun mapNonEmpty!32652 () Bool)

(declare-fun mapRes!32652 () Bool)

(declare-fun tp!62639 () Bool)

(assert (=> mapNonEmpty!32652 (= mapRes!32652 (and tp!62639 e!531028))))

(declare-fun mapRest!32652 () (Array (_ BitVec 32) ValueCell!9794))

(declare-fun mapValue!32652 () ValueCell!9794)

(declare-fun mapKey!32652 () (_ BitVec 32))

(assert (=> mapNonEmpty!32652 (= (arr!27460 (_values!5687 thiss!1141)) (store mapRest!32652 mapKey!32652 mapValue!32652))))

(declare-fun b!944331 () Bool)

(declare-fun res!634379 () Bool)

(assert (=> b!944331 (=> (not res!634379) (not e!531031))))

(declare-datatypes ((tuple2!13472 0))(
  ( (tuple2!13473 (_1!6747 (_ BitVec 64)) (_2!6747 V!32367)) )
))
(declare-datatypes ((List!19270 0))(
  ( (Nil!19267) (Cons!19266 (h!20417 tuple2!13472) (t!27587 List!19270)) )
))
(declare-datatypes ((ListLongMap!12169 0))(
  ( (ListLongMap!12170 (toList!6100 List!19270)) )
))
(declare-fun contains!5172 (ListLongMap!12169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3334 (array!57072 array!57070 (_ BitVec 32) (_ BitVec 32) V!32367 V!32367 (_ BitVec 32) Int) ListLongMap!12169)

(assert (=> b!944331 (= res!634379 (contains!5172 (getCurrentListMap!3334 (_keys!10542 thiss!1141) (_values!5687 thiss!1141) (mask!27312 thiss!1141) (extraKeys!5396 thiss!1141) (zeroValue!5500 thiss!1141) (minValue!5500 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5664 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32652 () Bool)

(assert (=> mapIsEmpty!32652 mapRes!32652))

(declare-fun b!944332 () Bool)

(declare-fun res!634383 () Bool)

(assert (=> b!944332 (=> res!634383 e!531033)))

(declare-fun lt!425595 () (_ BitVec 32))

(assert (=> b!944332 (= res!634383 (or (not (= (size!27927 (_keys!10542 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27312 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27927 (_keys!10542 thiss!1141))) (bvslt lt!425595 #b00000000000000000000000000000000) (bvsgt lt!425595 (size!27927 (_keys!10542 thiss!1141)))))))

(declare-fun b!944333 () Bool)

(assert (=> b!944333 (= e!531031 (not e!531033))))

(declare-fun res!634378 () Bool)

(assert (=> b!944333 (=> res!634378 e!531033)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944333 (= res!634378 (not (validMask!0 (mask!27312 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!57072 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944333 (= lt!425595 (arrayScanForKey!0 (_keys!10542 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944333 (arrayContainsKey!0 (_keys!10542 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31844 0))(
  ( (Unit!31845) )
))
(declare-fun lt!425594 () Unit!31844)

(declare-fun lemmaKeyInListMapIsInArray!302 (array!57072 array!57070 (_ BitVec 32) (_ BitVec 32) V!32367 V!32367 (_ BitVec 64) Int) Unit!31844)

(assert (=> b!944333 (= lt!425594 (lemmaKeyInListMapIsInArray!302 (_keys!10542 thiss!1141) (_values!5687 thiss!1141) (mask!27312 thiss!1141) (extraKeys!5396 thiss!1141) (zeroValue!5500 thiss!1141) (minValue!5500 thiss!1141) key!756 (defaultEntry!5664 thiss!1141)))))

(declare-fun b!944334 () Bool)

(assert (=> b!944334 (= e!531029 (and e!531030 mapRes!32652))))

(declare-fun condMapEmpty!32652 () Bool)

(declare-fun mapDefault!32652 () ValueCell!9794)

