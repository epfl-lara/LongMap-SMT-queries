; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16804 () Bool)

(assert start!16804)

(declare-fun b!169083 () Bool)

(declare-fun b_free!4111 () Bool)

(declare-fun b_next!4111 () Bool)

(assert (=> b!169083 (= b_free!4111 (not b_next!4111))))

(declare-fun tp!14940 () Bool)

(declare-fun b_and!10499 () Bool)

(assert (=> b!169083 (= tp!14940 b_and!10499)))

(declare-fun b!169084 () Bool)

(declare-fun b_free!4113 () Bool)

(declare-fun b_next!4113 () Bool)

(assert (=> b!169084 (= b_free!4113 (not b_next!4113))))

(declare-fun tp!14937 () Bool)

(declare-fun b_and!10501 () Bool)

(assert (=> b!169084 (= tp!14937 b_and!10501)))

(declare-fun mapNonEmpty!6590 () Bool)

(declare-fun mapRes!6590 () Bool)

(declare-fun tp!14939 () Bool)

(declare-fun e!111343 () Bool)

(assert (=> mapNonEmpty!6590 (= mapRes!6590 (and tp!14939 e!111343))))

(declare-fun mapKey!6590 () (_ BitVec 32))

(declare-datatypes ((V!4857 0))(
  ( (V!4858 (val!1998 Int)) )
))
(declare-datatypes ((ValueCell!1610 0))(
  ( (ValueCellFull!1610 (v!3857 V!4857)) (EmptyCell!1610) )
))
(declare-fun mapRest!6590 () (Array (_ BitVec 32) ValueCell!1610))

(declare-datatypes ((array!6891 0))(
  ( (array!6892 (arr!3280 (Array (_ BitVec 32) (_ BitVec 64))) (size!3569 (_ BitVec 32))) )
))
(declare-datatypes ((array!6893 0))(
  ( (array!6894 (arr!3281 (Array (_ BitVec 32) ValueCell!1610)) (size!3570 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2128 0))(
  ( (LongMapFixedSize!2129 (defaultEntry!3506 Int) (mask!8286 (_ BitVec 32)) (extraKeys!3247 (_ BitVec 32)) (zeroValue!3349 V!4857) (minValue!3349 V!4857) (_size!1113 (_ BitVec 32)) (_keys!5330 array!6891) (_values!3489 array!6893) (_vacant!1113 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2128)

(declare-fun mapValue!6591 () ValueCell!1610)

(assert (=> mapNonEmpty!6590 (= (arr!3281 (_values!3489 thiss!1248)) (store mapRest!6590 mapKey!6590 mapValue!6591))))

(declare-fun b!169077 () Bool)

(declare-fun e!111339 () Bool)

(declare-fun e!111347 () Bool)

(declare-fun mapRes!6591 () Bool)

(assert (=> b!169077 (= e!111339 (and e!111347 mapRes!6591))))

(declare-fun condMapEmpty!6591 () Bool)

(declare-datatypes ((tuple2!3206 0))(
  ( (tuple2!3207 (_1!1614 Bool) (_2!1614 LongMapFixedSize!2128)) )
))
(declare-fun err!51 () tuple2!3206)

(declare-fun mapDefault!6590 () ValueCell!1610)

(assert (=> b!169077 (= condMapEmpty!6591 (= (arr!3281 (_values!3489 (_2!1614 err!51))) ((as const (Array (_ BitVec 32) ValueCell!1610)) mapDefault!6590)))))

(declare-fun b!169078 () Bool)

(declare-fun res!80423 () Bool)

(declare-fun e!111346 () Bool)

(assert (=> b!169078 (=> (not res!80423) (not e!111346))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169078 (= res!80423 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6590 () Bool)

(assert (=> mapIsEmpty!6590 mapRes!6591))

(declare-fun b!169079 () Bool)

(declare-fun tp_is_empty!3907 () Bool)

(assert (=> b!169079 (= e!111343 tp_is_empty!3907)))

(declare-fun b!169080 () Bool)

(declare-fun e!111336 () Bool)

(assert (=> b!169080 (= e!111336 tp_is_empty!3907)))

(declare-fun b!169081 () Bool)

(declare-fun e!111337 () Bool)

(declare-fun e!111344 () Bool)

(assert (=> b!169081 (= e!111337 (and e!111344 mapRes!6590))))

(declare-fun condMapEmpty!6590 () Bool)

(declare-fun mapDefault!6591 () ValueCell!1610)

(assert (=> b!169081 (= condMapEmpty!6590 (= (arr!3281 (_values!3489 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1610)) mapDefault!6591)))))

(declare-fun b!169082 () Bool)

(declare-fun e!111338 () Bool)

(assert (=> b!169082 (= e!111346 e!111338)))

(declare-fun res!80422 () Bool)

(assert (=> b!169082 (=> (not res!80422) (not e!111338))))

(declare-datatypes ((SeekEntryResult!534 0))(
  ( (MissingZero!534 (index!4304 (_ BitVec 32))) (Found!534 (index!4305 (_ BitVec 32))) (Intermediate!534 (undefined!1346 Bool) (index!4306 (_ BitVec 32)) (x!18713 (_ BitVec 32))) (Undefined!534) (MissingVacant!534 (index!4307 (_ BitVec 32))) )
))
(declare-fun lt!84686 () SeekEntryResult!534)

(get-info :version)

(assert (=> b!169082 (= res!80422 (and (not ((_ is Undefined!534) lt!84686)) (not ((_ is MissingVacant!534) lt!84686)) (not ((_ is MissingZero!534) lt!84686)) (not ((_ is Found!534) lt!84686))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6891 (_ BitVec 32)) SeekEntryResult!534)

(assert (=> b!169082 (= lt!84686 (seekEntryOrOpen!0 key!828 (_keys!5330 thiss!1248) (mask!8286 thiss!1248)))))

(declare-fun e!111342 () Bool)

(declare-fun array_inv!2109 (array!6891) Bool)

(declare-fun array_inv!2110 (array!6893) Bool)

(assert (=> b!169083 (= e!111342 (and tp!14940 tp_is_empty!3907 (array_inv!2109 (_keys!5330 (_2!1614 err!51))) (array_inv!2110 (_values!3489 (_2!1614 err!51))) e!111339))))

(declare-fun mapIsEmpty!6591 () Bool)

(assert (=> mapIsEmpty!6591 mapRes!6590))

(declare-fun e!111348 () Bool)

(assert (=> b!169084 (= e!111348 (and tp!14937 tp_is_empty!3907 (array_inv!2109 (_keys!5330 thiss!1248)) (array_inv!2110 (_values!3489 thiss!1248)) e!111337))))

(declare-fun b!169086 () Bool)

(declare-fun res!80425 () Bool)

(declare-fun e!111340 () Bool)

(assert (=> b!169086 (=> (not res!80425) (not e!111340))))

(declare-fun lt!84687 () tuple2!3206)

(assert (=> b!169086 (= res!80425 (_1!1614 lt!84687))))

(declare-fun b!169087 () Bool)

(assert (=> b!169087 (= e!111347 tp_is_empty!3907)))

(declare-fun b!169085 () Bool)

(assert (=> b!169085 (= e!111340 false)))

(declare-fun lt!84685 () Bool)

(declare-datatypes ((tuple2!3208 0))(
  ( (tuple2!3209 (_1!1615 (_ BitVec 64)) (_2!1615 V!4857)) )
))
(declare-datatypes ((List!2190 0))(
  ( (Nil!2187) (Cons!2186 (h!2803 tuple2!3208) (t!6983 List!2190)) )
))
(declare-datatypes ((ListLongMap!2143 0))(
  ( (ListLongMap!2144 (toList!1087 List!2190)) )
))
(declare-fun contains!1132 (ListLongMap!2143 (_ BitVec 64)) Bool)

(declare-fun map!1798 (LongMapFixedSize!2128) ListLongMap!2143)

(assert (=> b!169085 (= lt!84685 (contains!1132 (map!1798 (_2!1614 lt!84687)) key!828))))

(declare-fun res!80424 () Bool)

(assert (=> start!16804 (=> (not res!80424) (not e!111346))))

(declare-fun valid!933 (LongMapFixedSize!2128) Bool)

(assert (=> start!16804 (= res!80424 (valid!933 thiss!1248))))

(assert (=> start!16804 e!111346))

(assert (=> start!16804 e!111348))

(assert (=> start!16804 true))

(declare-fun b!169088 () Bool)

(assert (=> b!169088 (= e!111344 tp_is_empty!3907)))

(declare-fun mapNonEmpty!6591 () Bool)

(declare-fun tp!14938 () Bool)

(assert (=> mapNonEmpty!6591 (= mapRes!6591 (and tp!14938 e!111336))))

(declare-fun mapValue!6590 () ValueCell!1610)

(declare-fun mapRest!6591 () (Array (_ BitVec 32) ValueCell!1610))

(declare-fun mapKey!6591 () (_ BitVec 32))

(assert (=> mapNonEmpty!6591 (= (arr!3281 (_values!3489 (_2!1614 err!51))) (store mapRest!6591 mapKey!6591 mapValue!6590))))

(declare-fun b!169089 () Bool)

(assert (=> b!169089 (= e!111338 e!111340)))

(declare-fun res!80421 () Bool)

(assert (=> b!169089 (=> (not res!80421) (not e!111340))))

(assert (=> b!169089 (= res!80421 (valid!933 (_2!1614 lt!84687)))))

(assert (=> b!169089 (= lt!84687 err!51)))

(assert (=> b!169089 true))

(assert (=> b!169089 e!111342))

(assert (= (and start!16804 res!80424) b!169078))

(assert (= (and b!169078 res!80423) b!169082))

(assert (= (and b!169082 res!80422) b!169089))

(assert (= (and b!169077 condMapEmpty!6591) mapIsEmpty!6590))

(assert (= (and b!169077 (not condMapEmpty!6591)) mapNonEmpty!6591))

(assert (= (and mapNonEmpty!6591 ((_ is ValueCellFull!1610) mapValue!6590)) b!169080))

(assert (= (and b!169077 ((_ is ValueCellFull!1610) mapDefault!6590)) b!169087))

(assert (= b!169083 b!169077))

(assert (= b!169089 b!169083))

(assert (= (and b!169089 res!80421) b!169086))

(assert (= (and b!169086 res!80425) b!169085))

(assert (= (and b!169081 condMapEmpty!6590) mapIsEmpty!6591))

(assert (= (and b!169081 (not condMapEmpty!6590)) mapNonEmpty!6590))

(assert (= (and mapNonEmpty!6590 ((_ is ValueCellFull!1610) mapValue!6591)) b!169079))

(assert (= (and b!169081 ((_ is ValueCellFull!1610) mapDefault!6591)) b!169088))

(assert (= b!169084 b!169081))

(assert (= start!16804 b!169084))

(declare-fun m!197713 () Bool)

(assert (=> b!169084 m!197713))

(declare-fun m!197715 () Bool)

(assert (=> b!169084 m!197715))

(declare-fun m!197717 () Bool)

(assert (=> b!169083 m!197717))

(declare-fun m!197719 () Bool)

(assert (=> b!169083 m!197719))

(declare-fun m!197721 () Bool)

(assert (=> mapNonEmpty!6591 m!197721))

(declare-fun m!197723 () Bool)

(assert (=> b!169089 m!197723))

(declare-fun m!197725 () Bool)

(assert (=> start!16804 m!197725))

(declare-fun m!197727 () Bool)

(assert (=> b!169085 m!197727))

(assert (=> b!169085 m!197727))

(declare-fun m!197729 () Bool)

(assert (=> b!169085 m!197729))

(declare-fun m!197731 () Bool)

(assert (=> b!169082 m!197731))

(declare-fun m!197733 () Bool)

(assert (=> mapNonEmpty!6590 m!197733))

(check-sat (not b_next!4113) (not start!16804) (not mapNonEmpty!6591) (not b!169084) (not b!169089) (not mapNonEmpty!6590) b_and!10501 (not b!169085) (not b!169083) (not b!169082) tp_is_empty!3907 (not b_next!4111) b_and!10499)
(check-sat b_and!10499 b_and!10501 (not b_next!4113) (not b_next!4111))
