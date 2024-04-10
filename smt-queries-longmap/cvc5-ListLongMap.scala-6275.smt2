; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80272 () Bool)

(assert start!80272)

(declare-fun b!942911 () Bool)

(declare-fun b_free!17971 () Bool)

(declare-fun b_next!17971 () Bool)

(assert (=> b!942911 (= b_free!17971 (not b_next!17971))))

(declare-fun tp!62418 () Bool)

(declare-fun b_and!29383 () Bool)

(assert (=> b!942911 (= tp!62418 b_and!29383)))

(declare-fun b!942904 () Bool)

(declare-fun res!633586 () Bool)

(declare-fun e!530151 () Bool)

(assert (=> b!942904 (=> (not res!633586) (not e!530151))))

(declare-datatypes ((V!32271 0))(
  ( (V!32272 (val!10290 Int)) )
))
(declare-datatypes ((ValueCell!9758 0))(
  ( (ValueCellFull!9758 (v!12821 V!32271)) (EmptyCell!9758) )
))
(declare-datatypes ((array!56924 0))(
  ( (array!56925 (arr!27388 (Array (_ BitVec 32) ValueCell!9758)) (size!27853 (_ BitVec 32))) )
))
(declare-datatypes ((array!56926 0))(
  ( (array!56927 (arr!27389 (Array (_ BitVec 32) (_ BitVec 64))) (size!27854 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4666 0))(
  ( (LongMapFixedSize!4667 (defaultEntry!5624 Int) (mask!27242 (_ BitVec 32)) (extraKeys!5356 (_ BitVec 32)) (zeroValue!5460 V!32271) (minValue!5460 V!32271) (_size!2388 (_ BitVec 32)) (_keys!10498 array!56926) (_values!5647 array!56924) (_vacant!2388 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4666)

(assert (=> b!942904 (= res!633586 (and (= (size!27853 (_values!5647 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27242 thiss!1141))) (= (size!27854 (_keys!10498 thiss!1141)) (size!27853 (_values!5647 thiss!1141))) (bvsge (mask!27242 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5356 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5356 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942905 () Bool)

(declare-fun res!633585 () Bool)

(assert (=> b!942905 (=> (not res!633585) (not e!530151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942905 (= res!633585 (validMask!0 (mask!27242 thiss!1141)))))

(declare-fun b!942906 () Bool)

(declare-fun e!530149 () Bool)

(declare-fun tp_is_empty!20479 () Bool)

(assert (=> b!942906 (= e!530149 tp_is_empty!20479)))

(declare-fun mapNonEmpty!32540 () Bool)

(declare-fun mapRes!32540 () Bool)

(declare-fun tp!62419 () Bool)

(assert (=> mapNonEmpty!32540 (= mapRes!32540 (and tp!62419 e!530149))))

(declare-fun mapKey!32540 () (_ BitVec 32))

(declare-fun mapRest!32540 () (Array (_ BitVec 32) ValueCell!9758))

(declare-fun mapValue!32540 () ValueCell!9758)

(assert (=> mapNonEmpty!32540 (= (arr!27388 (_values!5647 thiss!1141)) (store mapRest!32540 mapKey!32540 mapValue!32540))))

(declare-fun b!942907 () Bool)

(declare-fun e!530150 () Bool)

(assert (=> b!942907 (= e!530150 tp_is_empty!20479)))

(declare-fun b!942908 () Bool)

(declare-fun res!633584 () Bool)

(assert (=> b!942908 (=> (not res!633584) (not e!530151))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942908 (= res!633584 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!633589 () Bool)

(assert (=> start!80272 (=> (not res!633589) (not e!530151))))

(declare-fun valid!1785 (LongMapFixedSize!4666) Bool)

(assert (=> start!80272 (= res!633589 (valid!1785 thiss!1141))))

(assert (=> start!80272 e!530151))

(declare-fun e!530153 () Bool)

(assert (=> start!80272 e!530153))

(assert (=> start!80272 true))

(declare-fun mapIsEmpty!32540 () Bool)

(assert (=> mapIsEmpty!32540 mapRes!32540))

(declare-fun b!942909 () Bool)

(declare-fun res!633587 () Bool)

(assert (=> b!942909 (=> (not res!633587) (not e!530151))))

(declare-datatypes ((tuple2!13420 0))(
  ( (tuple2!13421 (_1!6721 (_ BitVec 64)) (_2!6721 V!32271)) )
))
(declare-datatypes ((List!19230 0))(
  ( (Nil!19227) (Cons!19226 (h!20376 tuple2!13420) (t!27545 List!19230)) )
))
(declare-datatypes ((ListLongMap!12117 0))(
  ( (ListLongMap!12118 (toList!6074 List!19230)) )
))
(declare-fun contains!5144 (ListLongMap!12117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3308 (array!56926 array!56924 (_ BitVec 32) (_ BitVec 32) V!32271 V!32271 (_ BitVec 32) Int) ListLongMap!12117)

(assert (=> b!942909 (= res!633587 (contains!5144 (getCurrentListMap!3308 (_keys!10498 thiss!1141) (_values!5647 thiss!1141) (mask!27242 thiss!1141) (extraKeys!5356 thiss!1141) (zeroValue!5460 thiss!1141) (minValue!5460 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5624 thiss!1141)) key!756))))

(declare-fun b!942910 () Bool)

(declare-fun res!633590 () Bool)

(assert (=> b!942910 (=> (not res!633590) (not e!530151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56926 (_ BitVec 32)) Bool)

(assert (=> b!942910 (= res!633590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10498 thiss!1141) (mask!27242 thiss!1141)))))

(declare-fun e!530152 () Bool)

(declare-fun array_inv!21278 (array!56926) Bool)

(declare-fun array_inv!21279 (array!56924) Bool)

(assert (=> b!942911 (= e!530153 (and tp!62418 tp_is_empty!20479 (array_inv!21278 (_keys!10498 thiss!1141)) (array_inv!21279 (_values!5647 thiss!1141)) e!530152))))

(declare-fun b!942912 () Bool)

(declare-fun res!633588 () Bool)

(assert (=> b!942912 (=> (not res!633588) (not e!530151))))

(declare-datatypes ((SeekEntryResult!9041 0))(
  ( (MissingZero!9041 (index!38535 (_ BitVec 32))) (Found!9041 (index!38536 (_ BitVec 32))) (Intermediate!9041 (undefined!9853 Bool) (index!38537 (_ BitVec 32)) (x!80970 (_ BitVec 32))) (Undefined!9041) (MissingVacant!9041 (index!38538 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56926 (_ BitVec 32)) SeekEntryResult!9041)

(assert (=> b!942912 (= res!633588 (not (is-Found!9041 (seekEntry!0 key!756 (_keys!10498 thiss!1141) (mask!27242 thiss!1141)))))))

(declare-fun b!942913 () Bool)

(assert (=> b!942913 (= e!530151 false)))

(declare-fun lt!425206 () Bool)

(declare-datatypes ((List!19231 0))(
  ( (Nil!19228) (Cons!19227 (h!20377 (_ BitVec 64)) (t!27546 List!19231)) )
))
(declare-fun arrayNoDuplicates!0 (array!56926 (_ BitVec 32) List!19231) Bool)

(assert (=> b!942913 (= lt!425206 (arrayNoDuplicates!0 (_keys!10498 thiss!1141) #b00000000000000000000000000000000 Nil!19228))))

(declare-fun b!942914 () Bool)

(assert (=> b!942914 (= e!530152 (and e!530150 mapRes!32540))))

(declare-fun condMapEmpty!32540 () Bool)

(declare-fun mapDefault!32540 () ValueCell!9758)

