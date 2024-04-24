; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16558 () Bool)

(assert start!16558)

(declare-fun b!164861 () Bool)

(declare-fun b_free!3859 () Bool)

(declare-fun b_next!3859 () Bool)

(assert (=> b!164861 (= b_free!3859 (not b_next!3859))))

(declare-fun tp!14178 () Bool)

(declare-fun b_and!10287 () Bool)

(assert (=> b!164861 (= tp!14178 b_and!10287)))

(declare-fun b!164857 () Bool)

(declare-fun res!78112 () Bool)

(declare-fun e!108149 () Bool)

(assert (=> b!164857 (=> (not res!78112) (not e!108149))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164857 (= res!78112 (not (= key!828 (bvneg key!828))))))

(declare-fun res!78115 () Bool)

(assert (=> start!16558 (=> (not res!78115) (not e!108149))))

(declare-datatypes ((V!4529 0))(
  ( (V!4530 (val!1875 Int)) )
))
(declare-datatypes ((ValueCell!1487 0))(
  ( (ValueCellFull!1487 (v!3741 V!4529)) (EmptyCell!1487) )
))
(declare-datatypes ((array!6405 0))(
  ( (array!6406 (arr!3038 (Array (_ BitVec 32) (_ BitVec 64))) (size!3326 (_ BitVec 32))) )
))
(declare-datatypes ((array!6407 0))(
  ( (array!6408 (arr!3039 (Array (_ BitVec 32) ValueCell!1487)) (size!3327 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1882 0))(
  ( (LongMapFixedSize!1883 (defaultEntry!3383 Int) (mask!8082 (_ BitVec 32)) (extraKeys!3124 (_ BitVec 32)) (zeroValue!3226 V!4529) (minValue!3226 V!4529) (_size!990 (_ BitVec 32)) (_keys!5208 array!6405) (_values!3366 array!6407) (_vacant!990 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1882)

(declare-fun valid!853 (LongMapFixedSize!1882) Bool)

(assert (=> start!16558 (= res!78115 (valid!853 thiss!1248))))

(assert (=> start!16558 e!108149))

(declare-fun e!108147 () Bool)

(assert (=> start!16558 e!108147))

(assert (=> start!16558 true))

(declare-fun mapIsEmpty!6210 () Bool)

(declare-fun mapRes!6210 () Bool)

(assert (=> mapIsEmpty!6210 mapRes!6210))

(declare-fun b!164858 () Bool)

(declare-fun e!108150 () Bool)

(assert (=> b!164858 (= e!108150 false)))

(declare-fun lt!83015 () Bool)

(declare-datatypes ((List!2016 0))(
  ( (Nil!2013) (Cons!2012 (h!2629 (_ BitVec 64)) (t!6810 List!2016)) )
))
(declare-fun arrayNoDuplicates!0 (array!6405 (_ BitVec 32) List!2016) Bool)

(assert (=> b!164858 (= lt!83015 (arrayNoDuplicates!0 (_keys!5208 thiss!1248) #b00000000000000000000000000000000 Nil!2013))))

(declare-fun b!164859 () Bool)

(declare-fun res!78111 () Bool)

(assert (=> b!164859 (=> (not res!78111) (not e!108150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6405 (_ BitVec 32)) Bool)

(assert (=> b!164859 (= res!78111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5208 thiss!1248) (mask!8082 thiss!1248)))))

(declare-fun b!164860 () Bool)

(declare-fun res!78113 () Bool)

(assert (=> b!164860 (=> (not res!78113) (not e!108150))))

(assert (=> b!164860 (= res!78113 (and (= (size!3327 (_values!3366 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8082 thiss!1248))) (= (size!3326 (_keys!5208 thiss!1248)) (size!3327 (_values!3366 thiss!1248))) (bvsge (mask!8082 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3124 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3124 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!108152 () Bool)

(declare-fun tp_is_empty!3661 () Bool)

(declare-fun array_inv!1947 (array!6405) Bool)

(declare-fun array_inv!1948 (array!6407) Bool)

(assert (=> b!164861 (= e!108147 (and tp!14178 tp_is_empty!3661 (array_inv!1947 (_keys!5208 thiss!1248)) (array_inv!1948 (_values!3366 thiss!1248)) e!108152))))

(declare-fun b!164862 () Bool)

(declare-fun e!108146 () Bool)

(assert (=> b!164862 (= e!108146 tp_is_empty!3661)))

(declare-fun b!164863 () Bool)

(declare-fun res!78116 () Bool)

(assert (=> b!164863 (=> (not res!78116) (not e!108150))))

(declare-datatypes ((tuple2!2996 0))(
  ( (tuple2!2997 (_1!1509 (_ BitVec 64)) (_2!1509 V!4529)) )
))
(declare-datatypes ((List!2017 0))(
  ( (Nil!2014) (Cons!2013 (h!2630 tuple2!2996) (t!6811 List!2017)) )
))
(declare-datatypes ((ListLongMap!1957 0))(
  ( (ListLongMap!1958 (toList!994 List!2017)) )
))
(declare-fun contains!1046 (ListLongMap!1957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!656 (array!6405 array!6407 (_ BitVec 32) (_ BitVec 32) V!4529 V!4529 (_ BitVec 32) Int) ListLongMap!1957)

(assert (=> b!164863 (= res!78116 (contains!1046 (getCurrentListMap!656 (_keys!5208 thiss!1248) (_values!3366 thiss!1248) (mask!8082 thiss!1248) (extraKeys!3124 thiss!1248) (zeroValue!3226 thiss!1248) (minValue!3226 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3383 thiss!1248)) key!828))))

(declare-fun b!164864 () Bool)

(declare-fun e!108148 () Bool)

(assert (=> b!164864 (= e!108152 (and e!108148 mapRes!6210))))

(declare-fun condMapEmpty!6210 () Bool)

(declare-fun mapDefault!6210 () ValueCell!1487)

(assert (=> b!164864 (= condMapEmpty!6210 (= (arr!3039 (_values!3366 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1487)) mapDefault!6210)))))

(declare-fun b!164865 () Bool)

(declare-fun res!78114 () Bool)

(assert (=> b!164865 (=> (not res!78114) (not e!108150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164865 (= res!78114 (validMask!0 (mask!8082 thiss!1248)))))

(declare-fun mapNonEmpty!6210 () Bool)

(declare-fun tp!14177 () Bool)

(assert (=> mapNonEmpty!6210 (= mapRes!6210 (and tp!14177 e!108146))))

(declare-fun mapKey!6210 () (_ BitVec 32))

(declare-fun mapRest!6210 () (Array (_ BitVec 32) ValueCell!1487))

(declare-fun mapValue!6210 () ValueCell!1487)

(assert (=> mapNonEmpty!6210 (= (arr!3039 (_values!3366 thiss!1248)) (store mapRest!6210 mapKey!6210 mapValue!6210))))

(declare-fun b!164866 () Bool)

(assert (=> b!164866 (= e!108148 tp_is_empty!3661)))

(declare-fun b!164867 () Bool)

(assert (=> b!164867 (= e!108149 e!108150)))

(declare-fun res!78117 () Bool)

(assert (=> b!164867 (=> (not res!78117) (not e!108150))))

(declare-datatypes ((SeekEntryResult!419 0))(
  ( (MissingZero!419 (index!3844 (_ BitVec 32))) (Found!419 (index!3845 (_ BitVec 32))) (Intermediate!419 (undefined!1231 Bool) (index!3846 (_ BitVec 32)) (x!18271 (_ BitVec 32))) (Undefined!419) (MissingVacant!419 (index!3847 (_ BitVec 32))) )
))
(declare-fun lt!83016 () SeekEntryResult!419)

(get-info :version)

(assert (=> b!164867 (= res!78117 (and (not ((_ is Undefined!419) lt!83016)) (not ((_ is MissingVacant!419) lt!83016)) (not ((_ is MissingZero!419) lt!83016)) ((_ is Found!419) lt!83016)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6405 (_ BitVec 32)) SeekEntryResult!419)

(assert (=> b!164867 (= lt!83016 (seekEntryOrOpen!0 key!828 (_keys!5208 thiss!1248) (mask!8082 thiss!1248)))))

(assert (= (and start!16558 res!78115) b!164857))

(assert (= (and b!164857 res!78112) b!164867))

(assert (= (and b!164867 res!78117) b!164863))

(assert (= (and b!164863 res!78116) b!164865))

(assert (= (and b!164865 res!78114) b!164860))

(assert (= (and b!164860 res!78113) b!164859))

(assert (= (and b!164859 res!78111) b!164858))

(assert (= (and b!164864 condMapEmpty!6210) mapIsEmpty!6210))

(assert (= (and b!164864 (not condMapEmpty!6210)) mapNonEmpty!6210))

(assert (= (and mapNonEmpty!6210 ((_ is ValueCellFull!1487) mapValue!6210)) b!164862))

(assert (= (and b!164864 ((_ is ValueCellFull!1487) mapDefault!6210)) b!164866))

(assert (= b!164861 b!164864))

(assert (= start!16558 b!164861))

(declare-fun m!195053 () Bool)

(assert (=> start!16558 m!195053))

(declare-fun m!195055 () Bool)

(assert (=> mapNonEmpty!6210 m!195055))

(declare-fun m!195057 () Bool)

(assert (=> b!164863 m!195057))

(assert (=> b!164863 m!195057))

(declare-fun m!195059 () Bool)

(assert (=> b!164863 m!195059))

(declare-fun m!195061 () Bool)

(assert (=> b!164861 m!195061))

(declare-fun m!195063 () Bool)

(assert (=> b!164861 m!195063))

(declare-fun m!195065 () Bool)

(assert (=> b!164858 m!195065))

(declare-fun m!195067 () Bool)

(assert (=> b!164865 m!195067))

(declare-fun m!195069 () Bool)

(assert (=> b!164859 m!195069))

(declare-fun m!195071 () Bool)

(assert (=> b!164867 m!195071))

(check-sat (not b!164863) (not b!164867) b_and!10287 (not start!16558) (not b!164865) (not b!164859) (not b!164858) tp_is_empty!3661 (not b_next!3859) (not b!164861) (not mapNonEmpty!6210))
(check-sat b_and!10287 (not b_next!3859))
