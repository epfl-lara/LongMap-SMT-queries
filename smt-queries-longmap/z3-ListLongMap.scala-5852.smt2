; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75810 () Bool)

(assert start!75810)

(declare-fun b!890186 () Bool)

(declare-fun b_free!15613 () Bool)

(declare-fun b_next!15613 () Bool)

(assert (=> b!890186 (= b_free!15613 (not b_next!15613))))

(declare-fun tp!54808 () Bool)

(declare-fun b_and!25863 () Bool)

(assert (=> b!890186 (= tp!54808 b_and!25863)))

(declare-fun b!890185 () Bool)

(declare-fun res!603041 () Bool)

(declare-fun e!496249 () Bool)

(assert (=> b!890185 (=> (not res!603041) (not e!496249))))

(declare-datatypes ((array!51901 0))(
  ( (array!51902 (arr!24952 (Array (_ BitVec 32) (_ BitVec 64))) (size!25397 (_ BitVec 32))) )
))
(declare-datatypes ((V!28887 0))(
  ( (V!28888 (val!9021 Int)) )
))
(declare-datatypes ((ValueCell!8489 0))(
  ( (ValueCellFull!8489 (v!11496 V!28887)) (EmptyCell!8489) )
))
(declare-datatypes ((array!51903 0))(
  ( (array!51904 (arr!24953 (Array (_ BitVec 32) ValueCell!8489)) (size!25398 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3994 0))(
  ( (LongMapFixedSize!3995 (defaultEntry!5194 Int) (mask!25682 (_ BitVec 32)) (extraKeys!4888 (_ BitVec 32)) (zeroValue!4992 V!28887) (minValue!4992 V!28887) (_size!2052 (_ BitVec 32)) (_keys!9905 array!51901) (_values!5179 array!51903) (_vacant!2052 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3994)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51901 (_ BitVec 32)) Bool)

(assert (=> b!890185 (= res!603041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9905 thiss!1181) (mask!25682 thiss!1181)))))

(declare-fun e!496248 () Bool)

(declare-fun tp_is_empty!17941 () Bool)

(declare-fun e!496250 () Bool)

(declare-fun array_inv!19672 (array!51901) Bool)

(declare-fun array_inv!19673 (array!51903) Bool)

(assert (=> b!890186 (= e!496248 (and tp!54808 tp_is_empty!17941 (array_inv!19672 (_keys!9905 thiss!1181)) (array_inv!19673 (_values!5179 thiss!1181)) e!496250))))

(declare-fun b!890187 () Bool)

(declare-fun e!496245 () Bool)

(assert (=> b!890187 (= e!496245 tp_is_empty!17941)))

(declare-fun b!890188 () Bool)

(assert (=> b!890188 (= e!496249 false)))

(declare-fun lt!402358 () Bool)

(declare-datatypes ((List!17651 0))(
  ( (Nil!17648) (Cons!17647 (h!18784 (_ BitVec 64)) (t!24942 List!17651)) )
))
(declare-fun arrayNoDuplicates!0 (array!51901 (_ BitVec 32) List!17651) Bool)

(assert (=> b!890188 (= lt!402358 (arrayNoDuplicates!0 (_keys!9905 thiss!1181) #b00000000000000000000000000000000 Nil!17648))))

(declare-fun res!603042 () Bool)

(declare-fun e!496247 () Bool)

(assert (=> start!75810 (=> (not res!603042) (not e!496247))))

(declare-fun valid!1567 (LongMapFixedSize!3994) Bool)

(assert (=> start!75810 (= res!603042 (valid!1567 thiss!1181))))

(assert (=> start!75810 e!496247))

(assert (=> start!75810 e!496248))

(assert (=> start!75810 true))

(declare-fun b!890189 () Bool)

(declare-fun mapRes!28466 () Bool)

(assert (=> b!890189 (= e!496250 (and e!496245 mapRes!28466))))

(declare-fun condMapEmpty!28466 () Bool)

(declare-fun mapDefault!28466 () ValueCell!8489)

(assert (=> b!890189 (= condMapEmpty!28466 (= (arr!24953 (_values!5179 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8489)) mapDefault!28466)))))

(declare-fun b!890190 () Bool)

(declare-fun res!603039 () Bool)

(assert (=> b!890190 (=> (not res!603039) (not e!496247))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890190 (= res!603039 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890191 () Bool)

(assert (=> b!890191 (= e!496247 e!496249)))

(declare-fun res!603043 () Bool)

(assert (=> b!890191 (=> (not res!603043) (not e!496249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890191 (= res!603043 (validMask!0 (mask!25682 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8722 0))(
  ( (MissingZero!8722 (index!37259 (_ BitVec 32))) (Found!8722 (index!37260 (_ BitVec 32))) (Intermediate!8722 (undefined!9534 Bool) (index!37261 (_ BitVec 32)) (x!75464 (_ BitVec 32))) (Undefined!8722) (MissingVacant!8722 (index!37262 (_ BitVec 32))) )
))
(declare-fun lt!402359 () SeekEntryResult!8722)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51901 (_ BitVec 32)) SeekEntryResult!8722)

(assert (=> b!890191 (= lt!402359 (seekEntry!0 key!785 (_keys!9905 thiss!1181) (mask!25682 thiss!1181)))))

(declare-fun mapIsEmpty!28466 () Bool)

(assert (=> mapIsEmpty!28466 mapRes!28466))

(declare-fun mapNonEmpty!28466 () Bool)

(declare-fun tp!54809 () Bool)

(declare-fun e!496251 () Bool)

(assert (=> mapNonEmpty!28466 (= mapRes!28466 (and tp!54809 e!496251))))

(declare-fun mapKey!28466 () (_ BitVec 32))

(declare-fun mapRest!28466 () (Array (_ BitVec 32) ValueCell!8489))

(declare-fun mapValue!28466 () ValueCell!8489)

(assert (=> mapNonEmpty!28466 (= (arr!24953 (_values!5179 thiss!1181)) (store mapRest!28466 mapKey!28466 mapValue!28466))))

(declare-fun b!890192 () Bool)

(declare-fun res!603040 () Bool)

(assert (=> b!890192 (=> (not res!603040) (not e!496249))))

(assert (=> b!890192 (= res!603040 (and (= (size!25398 (_values!5179 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25682 thiss!1181))) (= (size!25397 (_keys!9905 thiss!1181)) (size!25398 (_values!5179 thiss!1181))) (bvsge (mask!25682 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4888 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4888 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890193 () Bool)

(assert (=> b!890193 (= e!496251 tp_is_empty!17941)))

(assert (= (and start!75810 res!603042) b!890190))

(assert (= (and b!890190 res!603039) b!890191))

(assert (= (and b!890191 res!603043) b!890192))

(assert (= (and b!890192 res!603040) b!890185))

(assert (= (and b!890185 res!603041) b!890188))

(assert (= (and b!890189 condMapEmpty!28466) mapIsEmpty!28466))

(assert (= (and b!890189 (not condMapEmpty!28466)) mapNonEmpty!28466))

(get-info :version)

(assert (= (and mapNonEmpty!28466 ((_ is ValueCellFull!8489) mapValue!28466)) b!890193))

(assert (= (and b!890189 ((_ is ValueCellFull!8489) mapDefault!28466)) b!890187))

(assert (= b!890186 b!890189))

(assert (= start!75810 b!890186))

(declare-fun m!829555 () Bool)

(assert (=> b!890191 m!829555))

(declare-fun m!829557 () Bool)

(assert (=> b!890191 m!829557))

(declare-fun m!829559 () Bool)

(assert (=> b!890186 m!829559))

(declare-fun m!829561 () Bool)

(assert (=> b!890186 m!829561))

(declare-fun m!829563 () Bool)

(assert (=> b!890188 m!829563))

(declare-fun m!829565 () Bool)

(assert (=> start!75810 m!829565))

(declare-fun m!829567 () Bool)

(assert (=> b!890185 m!829567))

(declare-fun m!829569 () Bool)

(assert (=> mapNonEmpty!28466 m!829569))

(check-sat (not b!890191) (not start!75810) (not b!890188) (not b!890186) (not b!890185) (not b_next!15613) tp_is_empty!17941 b_and!25863 (not mapNonEmpty!28466))
(check-sat b_and!25863 (not b_next!15613))
