; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16232 () Bool)

(assert start!16232)

(declare-fun b!161926 () Bool)

(declare-fun b_free!3693 () Bool)

(declare-fun b_next!3693 () Bool)

(assert (=> b!161926 (= b_free!3693 (not b_next!3693))))

(declare-fun tp!13648 () Bool)

(declare-fun b_and!10107 () Bool)

(assert (=> b!161926 (= tp!13648 b_and!10107)))

(declare-fun b!161918 () Bool)

(declare-fun e!105950 () Bool)

(declare-fun e!105949 () Bool)

(declare-fun mapRes!5930 () Bool)

(assert (=> b!161918 (= e!105950 (and e!105949 mapRes!5930))))

(declare-fun condMapEmpty!5930 () Bool)

(declare-datatypes ((V!4307 0))(
  ( (V!4308 (val!1792 Int)) )
))
(declare-datatypes ((ValueCell!1404 0))(
  ( (ValueCellFull!1404 (v!3657 V!4307)) (EmptyCell!1404) )
))
(declare-datatypes ((array!6069 0))(
  ( (array!6070 (arr!2879 (Array (_ BitVec 32) (_ BitVec 64))) (size!3163 (_ BitVec 32))) )
))
(declare-datatypes ((array!6071 0))(
  ( (array!6072 (arr!2880 (Array (_ BitVec 32) ValueCell!1404)) (size!3164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1716 0))(
  ( (LongMapFixedSize!1717 (defaultEntry!3300 Int) (mask!7906 (_ BitVec 32)) (extraKeys!3041 (_ BitVec 32)) (zeroValue!3143 V!4307) (minValue!3143 V!4307) (_size!907 (_ BitVec 32)) (_keys!5101 array!6069) (_values!3283 array!6071) (_vacant!907 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1716)

(declare-fun mapDefault!5930 () ValueCell!1404)

(assert (=> b!161918 (= condMapEmpty!5930 (= (arr!2880 (_values!3283 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1404)) mapDefault!5930)))))

(declare-fun res!76706 () Bool)

(declare-fun e!105948 () Bool)

(assert (=> start!16232 (=> (not res!76706) (not e!105948))))

(declare-fun valid!780 (LongMapFixedSize!1716) Bool)

(assert (=> start!16232 (= res!76706 (valid!780 thiss!1248))))

(assert (=> start!16232 e!105948))

(declare-fun e!105954 () Bool)

(assert (=> start!16232 e!105954))

(assert (=> start!16232 true))

(declare-fun tp_is_empty!3495 () Bool)

(assert (=> start!16232 tp_is_empty!3495))

(declare-fun mapNonEmpty!5930 () Bool)

(declare-fun tp!13649 () Bool)

(declare-fun e!105951 () Bool)

(assert (=> mapNonEmpty!5930 (= mapRes!5930 (and tp!13649 e!105951))))

(declare-fun mapKey!5930 () (_ BitVec 32))

(declare-fun mapValue!5930 () ValueCell!1404)

(declare-fun mapRest!5930 () (Array (_ BitVec 32) ValueCell!1404))

(assert (=> mapNonEmpty!5930 (= (arr!2880 (_values!3283 thiss!1248)) (store mapRest!5930 mapKey!5930 mapValue!5930))))

(declare-fun mapIsEmpty!5930 () Bool)

(assert (=> mapIsEmpty!5930 mapRes!5930))

(declare-fun b!161919 () Bool)

(assert (=> b!161919 (= e!105949 tp_is_empty!3495)))

(declare-fun b!161920 () Bool)

(declare-fun e!105947 () Bool)

(declare-fun e!105953 () Bool)

(assert (=> b!161920 (= e!105947 e!105953)))

(declare-fun res!76705 () Bool)

(assert (=> b!161920 (=> (not res!76705) (not e!105953))))

(declare-datatypes ((tuple2!2972 0))(
  ( (tuple2!2973 (_1!1497 Bool) (_2!1497 LongMapFixedSize!1716)) )
))
(declare-fun lt!82317 () tuple2!2972)

(assert (=> b!161920 (= res!76705 (valid!780 (_2!1497 lt!82317)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4307)

(declare-datatypes ((SeekEntryResult!365 0))(
  ( (MissingZero!365 (index!3628 (_ BitVec 32))) (Found!365 (index!3629 (_ BitVec 32))) (Intermediate!365 (undefined!1177 Bool) (index!3630 (_ BitVec 32)) (x!17885 (_ BitVec 32))) (Undefined!365) (MissingVacant!365 (index!3631 (_ BitVec 32))) )
))
(declare-fun lt!82316 () SeekEntryResult!365)

(declare-fun updateHelperNewKey!73 (LongMapFixedSize!1716 (_ BitVec 64) V!4307 (_ BitVec 32)) tuple2!2972)

(assert (=> b!161920 (= lt!82317 (updateHelperNewKey!73 thiss!1248 key!828 v!309 (index!3631 lt!82316)))))

(declare-fun b!161921 () Bool)

(declare-fun res!76703 () Bool)

(assert (=> b!161921 (=> (not res!76703) (not e!105953))))

(assert (=> b!161921 (= res!76703 (_1!1497 lt!82317))))

(declare-fun b!161922 () Bool)

(declare-fun res!76704 () Bool)

(assert (=> b!161922 (=> (not res!76704) (not e!105948))))

(assert (=> b!161922 (= res!76704 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161923 () Bool)

(assert (=> b!161923 (= e!105951 tp_is_empty!3495)))

(declare-fun b!161924 () Bool)

(assert (=> b!161924 (= e!105953 false)))

(declare-fun lt!82318 () Bool)

(declare-datatypes ((tuple2!2974 0))(
  ( (tuple2!2975 (_1!1498 (_ BitVec 64)) (_2!1498 V!4307)) )
))
(declare-datatypes ((List!1981 0))(
  ( (Nil!1978) (Cons!1977 (h!2590 tuple2!2974) (t!6783 List!1981)) )
))
(declare-datatypes ((ListLongMap!1957 0))(
  ( (ListLongMap!1958 (toList!994 List!1981)) )
))
(declare-fun contains!1030 (ListLongMap!1957 (_ BitVec 64)) Bool)

(declare-fun map!1666 (LongMapFixedSize!1716) ListLongMap!1957)

(assert (=> b!161924 (= lt!82318 (contains!1030 (map!1666 (_2!1497 lt!82317)) key!828))))

(declare-fun b!161925 () Bool)

(assert (=> b!161925 (= e!105948 e!105947)))

(declare-fun res!76702 () Bool)

(assert (=> b!161925 (=> (not res!76702) (not e!105947))))

(get-info :version)

(assert (=> b!161925 (= res!76702 (and (not ((_ is Undefined!365) lt!82316)) ((_ is MissingVacant!365) lt!82316)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6069 (_ BitVec 32)) SeekEntryResult!365)

(assert (=> b!161925 (= lt!82316 (seekEntryOrOpen!0 key!828 (_keys!5101 thiss!1248) (mask!7906 thiss!1248)))))

(declare-fun array_inv!1841 (array!6069) Bool)

(declare-fun array_inv!1842 (array!6071) Bool)

(assert (=> b!161926 (= e!105954 (and tp!13648 tp_is_empty!3495 (array_inv!1841 (_keys!5101 thiss!1248)) (array_inv!1842 (_values!3283 thiss!1248)) e!105950))))

(assert (= (and start!16232 res!76706) b!161922))

(assert (= (and b!161922 res!76704) b!161925))

(assert (= (and b!161925 res!76702) b!161920))

(assert (= (and b!161920 res!76705) b!161921))

(assert (= (and b!161921 res!76703) b!161924))

(assert (= (and b!161918 condMapEmpty!5930) mapIsEmpty!5930))

(assert (= (and b!161918 (not condMapEmpty!5930)) mapNonEmpty!5930))

(assert (= (and mapNonEmpty!5930 ((_ is ValueCellFull!1404) mapValue!5930)) b!161923))

(assert (= (and b!161918 ((_ is ValueCellFull!1404) mapDefault!5930)) b!161919))

(assert (= b!161926 b!161918))

(assert (= start!16232 b!161926))

(declare-fun m!193227 () Bool)

(assert (=> b!161924 m!193227))

(assert (=> b!161924 m!193227))

(declare-fun m!193229 () Bool)

(assert (=> b!161924 m!193229))

(declare-fun m!193231 () Bool)

(assert (=> mapNonEmpty!5930 m!193231))

(declare-fun m!193233 () Bool)

(assert (=> b!161925 m!193233))

(declare-fun m!193235 () Bool)

(assert (=> start!16232 m!193235))

(declare-fun m!193237 () Bool)

(assert (=> b!161926 m!193237))

(declare-fun m!193239 () Bool)

(assert (=> b!161926 m!193239))

(declare-fun m!193241 () Bool)

(assert (=> b!161920 m!193241))

(declare-fun m!193243 () Bool)

(assert (=> b!161920 m!193243))

(check-sat (not start!16232) tp_is_empty!3495 b_and!10107 (not b!161925) (not b!161920) (not b!161924) (not mapNonEmpty!5930) (not b!161926) (not b_next!3693))
(check-sat b_and!10107 (not b_next!3693))
