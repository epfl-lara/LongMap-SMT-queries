; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16228 () Bool)

(assert start!16228)

(declare-fun b!161877 () Bool)

(declare-fun b_free!3685 () Bool)

(declare-fun b_next!3685 () Bool)

(assert (=> b!161877 (= b_free!3685 (not b_next!3685))))

(declare-fun tp!13624 () Bool)

(declare-fun b_and!10113 () Bool)

(assert (=> b!161877 (= tp!13624 b_and!10113)))

(declare-fun b!161871 () Bool)

(declare-fun e!105886 () Bool)

(assert (=> b!161871 (= e!105886 false)))

(declare-fun lt!82346 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4297 0))(
  ( (V!4298 (val!1788 Int)) )
))
(declare-fun v!309 () V!4297)

(declare-datatypes ((ValueCell!1400 0))(
  ( (ValueCellFull!1400 (v!3654 V!4297)) (EmptyCell!1400) )
))
(declare-datatypes ((array!6039 0))(
  ( (array!6040 (arr!2864 (Array (_ BitVec 32) (_ BitVec 64))) (size!3148 (_ BitVec 32))) )
))
(declare-datatypes ((array!6041 0))(
  ( (array!6042 (arr!2865 (Array (_ BitVec 32) ValueCell!1400)) (size!3149 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1708 0))(
  ( (LongMapFixedSize!1709 (defaultEntry!3296 Int) (mask!7900 (_ BitVec 32)) (extraKeys!3037 (_ BitVec 32)) (zeroValue!3139 V!4297) (minValue!3139 V!4297) (_size!903 (_ BitVec 32)) (_keys!5097 array!6039) (_values!3279 array!6041) (_vacant!903 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1708)

(declare-datatypes ((SeekEntryResult!360 0))(
  ( (MissingZero!360 (index!3608 (_ BitVec 32))) (Found!360 (index!3609 (_ BitVec 32))) (Intermediate!360 (undefined!1172 Bool) (index!3610 (_ BitVec 32)) (x!17872 (_ BitVec 32))) (Undefined!360) (MissingVacant!360 (index!3611 (_ BitVec 32))) )
))
(declare-fun lt!82347 () SeekEntryResult!360)

(declare-fun valid!798 (LongMapFixedSize!1708) Bool)

(declare-datatypes ((tuple2!2924 0))(
  ( (tuple2!2925 (_1!1473 Bool) (_2!1473 LongMapFixedSize!1708)) )
))
(declare-fun updateHelperNewKey!72 (LongMapFixedSize!1708 (_ BitVec 64) V!4297 (_ BitVec 32)) tuple2!2924)

(assert (=> b!161871 (= lt!82346 (valid!798 (_2!1473 (updateHelperNewKey!72 thiss!1248 key!828 v!309 (index!3611 lt!82347)))))))

(declare-fun b!161872 () Bool)

(declare-fun e!105887 () Bool)

(assert (=> b!161872 (= e!105887 e!105886)))

(declare-fun res!76677 () Bool)

(assert (=> b!161872 (=> (not res!76677) (not e!105886))))

(get-info :version)

(assert (=> b!161872 (= res!76677 (and (not ((_ is Undefined!360) lt!82347)) ((_ is MissingVacant!360) lt!82347)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6039 (_ BitVec 32)) SeekEntryResult!360)

(assert (=> b!161872 (= lt!82347 (seekEntryOrOpen!0 key!828 (_keys!5097 thiss!1248) (mask!7900 thiss!1248)))))

(declare-fun b!161873 () Bool)

(declare-fun e!105888 () Bool)

(declare-fun tp_is_empty!3487 () Bool)

(assert (=> b!161873 (= e!105888 tp_is_empty!3487)))

(declare-fun b!161874 () Bool)

(declare-fun res!76679 () Bool)

(assert (=> b!161874 (=> (not res!76679) (not e!105887))))

(assert (=> b!161874 (= res!76679 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5918 () Bool)

(declare-fun mapRes!5918 () Bool)

(declare-fun tp!13625 () Bool)

(declare-fun e!105882 () Bool)

(assert (=> mapNonEmpty!5918 (= mapRes!5918 (and tp!13625 e!105882))))

(declare-fun mapKey!5918 () (_ BitVec 32))

(declare-fun mapValue!5918 () ValueCell!1400)

(declare-fun mapRest!5918 () (Array (_ BitVec 32) ValueCell!1400))

(assert (=> mapNonEmpty!5918 (= (arr!2865 (_values!3279 thiss!1248)) (store mapRest!5918 mapKey!5918 mapValue!5918))))

(declare-fun b!161875 () Bool)

(declare-fun e!105883 () Bool)

(assert (=> b!161875 (= e!105883 (and e!105888 mapRes!5918))))

(declare-fun condMapEmpty!5918 () Bool)

(declare-fun mapDefault!5918 () ValueCell!1400)

(assert (=> b!161875 (= condMapEmpty!5918 (= (arr!2865 (_values!3279 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1400)) mapDefault!5918)))))

(declare-fun res!76678 () Bool)

(assert (=> start!16228 (=> (not res!76678) (not e!105887))))

(assert (=> start!16228 (= res!76678 (valid!798 thiss!1248))))

(assert (=> start!16228 e!105887))

(declare-fun e!105884 () Bool)

(assert (=> start!16228 e!105884))

(assert (=> start!16228 true))

(assert (=> start!16228 tp_is_empty!3487))

(declare-fun mapIsEmpty!5918 () Bool)

(assert (=> mapIsEmpty!5918 mapRes!5918))

(declare-fun b!161876 () Bool)

(assert (=> b!161876 (= e!105882 tp_is_empty!3487)))

(declare-fun array_inv!1837 (array!6039) Bool)

(declare-fun array_inv!1838 (array!6041) Bool)

(assert (=> b!161877 (= e!105884 (and tp!13624 tp_is_empty!3487 (array_inv!1837 (_keys!5097 thiss!1248)) (array_inv!1838 (_values!3279 thiss!1248)) e!105883))))

(assert (= (and start!16228 res!76678) b!161874))

(assert (= (and b!161874 res!76679) b!161872))

(assert (= (and b!161872 res!76677) b!161871))

(assert (= (and b!161875 condMapEmpty!5918) mapIsEmpty!5918))

(assert (= (and b!161875 (not condMapEmpty!5918)) mapNonEmpty!5918))

(assert (= (and mapNonEmpty!5918 ((_ is ValueCellFull!1400) mapValue!5918)) b!161876))

(assert (= (and b!161875 ((_ is ValueCellFull!1400) mapDefault!5918)) b!161873))

(assert (= b!161877 b!161875))

(assert (= start!16228 b!161877))

(declare-fun m!193349 () Bool)

(assert (=> b!161877 m!193349))

(declare-fun m!193351 () Bool)

(assert (=> b!161877 m!193351))

(declare-fun m!193353 () Bool)

(assert (=> start!16228 m!193353))

(declare-fun m!193355 () Bool)

(assert (=> mapNonEmpty!5918 m!193355))

(declare-fun m!193357 () Bool)

(assert (=> b!161872 m!193357))

(declare-fun m!193359 () Bool)

(assert (=> b!161871 m!193359))

(declare-fun m!193361 () Bool)

(assert (=> b!161871 m!193361))

(check-sat (not b!161877) (not b!161871) (not mapNonEmpty!5918) b_and!10113 (not start!16228) (not b!161872) (not b_next!3685) tp_is_empty!3487)
(check-sat b_and!10113 (not b_next!3685))
