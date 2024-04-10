; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75908 () Bool)

(assert start!75908)

(declare-fun b!893124 () Bool)

(declare-fun b_free!15843 () Bool)

(declare-fun b_next!15843 () Bool)

(assert (=> b!893124 (= b_free!15843 (not b_next!15843))))

(declare-fun tp!55501 () Bool)

(declare-fun b_and!26105 () Bool)

(assert (=> b!893124 (= tp!55501 b_and!26105)))

(declare-fun b!893119 () Bool)

(declare-fun e!498720 () Bool)

(declare-datatypes ((SeekEntryResult!8859 0))(
  ( (MissingZero!8859 (index!37807 (_ BitVec 32))) (Found!8859 (index!37808 (_ BitVec 32))) (Intermediate!8859 (undefined!9671 Bool) (index!37809 (_ BitVec 32)) (x!75919 (_ BitVec 32))) (Undefined!8859) (MissingVacant!8859 (index!37810 (_ BitVec 32))) )
))
(declare-fun lt!403536 () SeekEntryResult!8859)

(declare-datatypes ((array!52324 0))(
  ( (array!52325 (arr!25167 (Array (_ BitVec 32) (_ BitVec 64))) (size!25611 (_ BitVec 32))) )
))
(declare-datatypes ((V!29193 0))(
  ( (V!29194 (val!9136 Int)) )
))
(declare-datatypes ((ValueCell!8604 0))(
  ( (ValueCellFull!8604 (v!11615 V!29193)) (EmptyCell!8604) )
))
(declare-datatypes ((array!52326 0))(
  ( (array!52327 (arr!25168 (Array (_ BitVec 32) ValueCell!8604)) (size!25612 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4224 0))(
  ( (LongMapFixedSize!4225 (defaultEntry!5312 Int) (mask!25836 (_ BitVec 32)) (extraKeys!5007 (_ BitVec 32)) (zeroValue!5111 V!29193) (minValue!5111 V!29193) (_size!2167 (_ BitVec 32)) (_keys!9997 array!52324) (_values!5298 array!52326) (_vacant!2167 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4224)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893119 (= e!498720 (inRange!0 (index!37808 lt!403536) (mask!25836 thiss!1181)))))

(declare-fun b!893120 () Bool)

(declare-fun e!498726 () Bool)

(declare-fun tp_is_empty!18171 () Bool)

(assert (=> b!893120 (= e!498726 tp_is_empty!18171)))

(declare-fun mapNonEmpty!28814 () Bool)

(declare-fun mapRes!28814 () Bool)

(declare-fun tp!55500 () Bool)

(assert (=> mapNonEmpty!28814 (= mapRes!28814 (and tp!55500 e!498726))))

(declare-fun mapValue!28814 () ValueCell!8604)

(declare-fun mapKey!28814 () (_ BitVec 32))

(declare-fun mapRest!28814 () (Array (_ BitVec 32) ValueCell!8604))

(assert (=> mapNonEmpty!28814 (= (arr!25168 (_values!5298 thiss!1181)) (store mapRest!28814 mapKey!28814 mapValue!28814))))

(declare-fun b!893122 () Bool)

(declare-fun e!498721 () Bool)

(declare-fun e!498722 () Bool)

(assert (=> b!893122 (= e!498721 (not e!498722))))

(declare-fun res!604898 () Bool)

(assert (=> b!893122 (=> res!604898 e!498722)))

(get-info :version)

(assert (=> b!893122 (= res!604898 ((_ is Found!8859) lt!403536))))

(assert (=> b!893122 e!498720))

(declare-fun res!604901 () Bool)

(assert (=> b!893122 (=> res!604901 e!498720)))

(assert (=> b!893122 (= res!604901 (not ((_ is Found!8859) lt!403536)))))

(declare-datatypes ((Unit!30416 0))(
  ( (Unit!30417) )
))
(declare-fun lt!403535 () Unit!30416)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!58 (array!52324 array!52326 (_ BitVec 32) (_ BitVec 32) V!29193 V!29193 (_ BitVec 64)) Unit!30416)

(assert (=> b!893122 (= lt!403535 (lemmaSeekEntryGivesInRangeIndex!58 (_keys!9997 thiss!1181) (_values!5298 thiss!1181) (mask!25836 thiss!1181) (extraKeys!5007 thiss!1181) (zeroValue!5111 thiss!1181) (minValue!5111 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52324 (_ BitVec 32)) SeekEntryResult!8859)

(assert (=> b!893122 (= lt!403536 (seekEntry!0 key!785 (_keys!9997 thiss!1181) (mask!25836 thiss!1181)))))

(declare-fun mapIsEmpty!28814 () Bool)

(assert (=> mapIsEmpty!28814 mapRes!28814))

(declare-fun b!893123 () Bool)

(declare-fun e!498724 () Bool)

(assert (=> b!893123 (= e!498724 tp_is_empty!18171)))

(declare-fun e!498719 () Bool)

(declare-fun e!498725 () Bool)

(declare-fun array_inv!19766 (array!52324) Bool)

(declare-fun array_inv!19767 (array!52326) Bool)

(assert (=> b!893124 (= e!498719 (and tp!55501 tp_is_empty!18171 (array_inv!19766 (_keys!9997 thiss!1181)) (array_inv!19767 (_values!5298 thiss!1181)) e!498725))))

(declare-fun b!893121 () Bool)

(assert (=> b!893121 (= e!498722 true)))

(declare-fun lt!403537 () Bool)

(declare-fun contains!4376 (LongMapFixedSize!4224 (_ BitVec 64)) Bool)

(assert (=> b!893121 (= lt!403537 (contains!4376 thiss!1181 key!785))))

(declare-fun res!604899 () Bool)

(assert (=> start!75908 (=> (not res!604899) (not e!498721))))

(declare-fun valid!1633 (LongMapFixedSize!4224) Bool)

(assert (=> start!75908 (= res!604899 (valid!1633 thiss!1181))))

(assert (=> start!75908 e!498721))

(assert (=> start!75908 e!498719))

(assert (=> start!75908 true))

(declare-fun b!893125 () Bool)

(declare-fun res!604900 () Bool)

(assert (=> b!893125 (=> (not res!604900) (not e!498721))))

(assert (=> b!893125 (= res!604900 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893126 () Bool)

(assert (=> b!893126 (= e!498725 (and e!498724 mapRes!28814))))

(declare-fun condMapEmpty!28814 () Bool)

(declare-fun mapDefault!28814 () ValueCell!8604)

(assert (=> b!893126 (= condMapEmpty!28814 (= (arr!25168 (_values!5298 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8604)) mapDefault!28814)))))

(assert (= (and start!75908 res!604899) b!893125))

(assert (= (and b!893125 res!604900) b!893122))

(assert (= (and b!893122 (not res!604901)) b!893119))

(assert (= (and b!893122 (not res!604898)) b!893121))

(assert (= (and b!893126 condMapEmpty!28814) mapIsEmpty!28814))

(assert (= (and b!893126 (not condMapEmpty!28814)) mapNonEmpty!28814))

(assert (= (and mapNonEmpty!28814 ((_ is ValueCellFull!8604) mapValue!28814)) b!893120))

(assert (= (and b!893126 ((_ is ValueCellFull!8604) mapDefault!28814)) b!893123))

(assert (= b!893124 b!893126))

(assert (= start!75908 b!893124))

(declare-fun m!831249 () Bool)

(assert (=> b!893122 m!831249))

(declare-fun m!831251 () Bool)

(assert (=> b!893122 m!831251))

(declare-fun m!831253 () Bool)

(assert (=> start!75908 m!831253))

(declare-fun m!831255 () Bool)

(assert (=> b!893124 m!831255))

(declare-fun m!831257 () Bool)

(assert (=> b!893124 m!831257))

(declare-fun m!831259 () Bool)

(assert (=> mapNonEmpty!28814 m!831259))

(declare-fun m!831261 () Bool)

(assert (=> b!893119 m!831261))

(declare-fun m!831263 () Bool)

(assert (=> b!893121 m!831263))

(check-sat (not b_next!15843) tp_is_empty!18171 (not b!893124) (not b!893119) (not b!893122) (not b!893121) b_and!26105 (not mapNonEmpty!28814) (not start!75908))
(check-sat b_and!26105 (not b_next!15843))
