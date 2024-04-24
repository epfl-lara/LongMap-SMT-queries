; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75942 () Bool)

(assert start!75942)

(declare-fun b!892066 () Bool)

(declare-fun b_free!15745 () Bool)

(declare-fun b_next!15745 () Bool)

(assert (=> b!892066 (= b_free!15745 (not b_next!15745))))

(declare-fun tp!55205 () Bool)

(declare-fun b_and!25995 () Bool)

(assert (=> b!892066 (= tp!55205 b_and!25995)))

(declare-fun b!892061 () Bool)

(declare-fun res!604123 () Bool)

(declare-fun e!497797 () Bool)

(assert (=> b!892061 (=> res!604123 e!497797)))

(declare-datatypes ((array!52165 0))(
  ( (array!52166 (arr!25084 (Array (_ BitVec 32) (_ BitVec 64))) (size!25529 (_ BitVec 32))) )
))
(declare-datatypes ((V!29063 0))(
  ( (V!29064 (val!9087 Int)) )
))
(declare-datatypes ((ValueCell!8555 0))(
  ( (ValueCellFull!8555 (v!11562 V!29063)) (EmptyCell!8555) )
))
(declare-datatypes ((array!52167 0))(
  ( (array!52168 (arr!25085 (Array (_ BitVec 32) ValueCell!8555)) (size!25530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4126 0))(
  ( (LongMapFixedSize!4127 (defaultEntry!5260 Int) (mask!25792 (_ BitVec 32)) (extraKeys!4954 (_ BitVec 32)) (zeroValue!5058 V!29063) (minValue!5058 V!29063) (_size!2118 (_ BitVec 32)) (_keys!9971 array!52165) (_values!5245 array!52167) (_vacant!2118 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4126)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52165 (_ BitVec 32)) Bool)

(assert (=> b!892061 (= res!604123 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9971 thiss!1181) (mask!25792 thiss!1181))))))

(declare-fun b!892062 () Bool)

(assert (=> b!892062 (= e!497797 true)))

(declare-fun lt!402920 () Bool)

(declare-datatypes ((List!17689 0))(
  ( (Nil!17686) (Cons!17685 (h!18822 (_ BitVec 64)) (t!24980 List!17689)) )
))
(declare-fun arrayNoDuplicates!0 (array!52165 (_ BitVec 32) List!17689) Bool)

(assert (=> b!892062 (= lt!402920 (arrayNoDuplicates!0 (_keys!9971 thiss!1181) #b00000000000000000000000000000000 Nil!17686))))

(declare-fun mapNonEmpty!28664 () Bool)

(declare-fun mapRes!28664 () Bool)

(declare-fun tp!55204 () Bool)

(declare-fun e!497798 () Bool)

(assert (=> mapNonEmpty!28664 (= mapRes!28664 (and tp!55204 e!497798))))

(declare-fun mapValue!28664 () ValueCell!8555)

(declare-fun mapKey!28664 () (_ BitVec 32))

(declare-fun mapRest!28664 () (Array (_ BitVec 32) ValueCell!8555))

(assert (=> mapNonEmpty!28664 (= (arr!25085 (_values!5245 thiss!1181)) (store mapRest!28664 mapKey!28664 mapValue!28664))))

(declare-fun b!892063 () Bool)

(declare-fun res!604127 () Bool)

(declare-fun e!497800 () Bool)

(assert (=> b!892063 (=> (not res!604127) (not e!497800))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892063 (= res!604127 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892064 () Bool)

(declare-fun e!497799 () Bool)

(declare-fun tp_is_empty!18073 () Bool)

(assert (=> b!892064 (= e!497799 tp_is_empty!18073)))

(declare-fun b!892065 () Bool)

(declare-fun e!497803 () Bool)

(declare-datatypes ((SeekEntryResult!8775 0))(
  ( (MissingZero!8775 (index!37471 (_ BitVec 32))) (Found!8775 (index!37472 (_ BitVec 32))) (Intermediate!8775 (undefined!9587 Bool) (index!37473 (_ BitVec 32)) (x!75693 (_ BitVec 32))) (Undefined!8775) (MissingVacant!8775 (index!37474 (_ BitVec 32))) )
))
(declare-fun lt!402922 () SeekEntryResult!8775)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892065 (= e!497803 (inRange!0 (index!37472 lt!402922) (mask!25792 thiss!1181)))))

(declare-fun e!497802 () Bool)

(declare-fun e!497805 () Bool)

(declare-fun array_inv!19762 (array!52165) Bool)

(declare-fun array_inv!19763 (array!52167) Bool)

(assert (=> b!892066 (= e!497805 (and tp!55205 tp_is_empty!18073 (array_inv!19762 (_keys!9971 thiss!1181)) (array_inv!19763 (_values!5245 thiss!1181)) e!497802))))

(declare-fun res!604128 () Bool)

(assert (=> start!75942 (=> (not res!604128) (not e!497800))))

(declare-fun valid!1611 (LongMapFixedSize!4126) Bool)

(assert (=> start!75942 (= res!604128 (valid!1611 thiss!1181))))

(assert (=> start!75942 e!497800))

(assert (=> start!75942 e!497805))

(assert (=> start!75942 true))

(declare-fun b!892067 () Bool)

(declare-fun e!497801 () Bool)

(assert (=> b!892067 (= e!497800 (not e!497801))))

(declare-fun res!604125 () Bool)

(assert (=> b!892067 (=> res!604125 e!497801)))

(get-info :version)

(assert (=> b!892067 (= res!604125 (not ((_ is Found!8775) lt!402922)))))

(assert (=> b!892067 e!497803))

(declare-fun res!604126 () Bool)

(assert (=> b!892067 (=> res!604126 e!497803)))

(assert (=> b!892067 (= res!604126 (not ((_ is Found!8775) lt!402922)))))

(declare-datatypes ((Unit!30320 0))(
  ( (Unit!30321) )
))
(declare-fun lt!402923 () Unit!30320)

(declare-fun lemmaSeekEntryGivesInRangeIndex!29 (array!52165 array!52167 (_ BitVec 32) (_ BitVec 32) V!29063 V!29063 (_ BitVec 64)) Unit!30320)

(assert (=> b!892067 (= lt!402923 (lemmaSeekEntryGivesInRangeIndex!29 (_keys!9971 thiss!1181) (_values!5245 thiss!1181) (mask!25792 thiss!1181) (extraKeys!4954 thiss!1181) (zeroValue!5058 thiss!1181) (minValue!5058 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52165 (_ BitVec 32)) SeekEntryResult!8775)

(assert (=> b!892067 (= lt!402922 (seekEntry!0 key!785 (_keys!9971 thiss!1181) (mask!25792 thiss!1181)))))

(declare-fun b!892068 () Bool)

(assert (=> b!892068 (= e!497798 tp_is_empty!18073)))

(declare-fun mapIsEmpty!28664 () Bool)

(assert (=> mapIsEmpty!28664 mapRes!28664))

(declare-fun b!892069 () Bool)

(assert (=> b!892069 (= e!497801 e!497797)))

(declare-fun res!604129 () Bool)

(assert (=> b!892069 (=> res!604129 e!497797)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892069 (= res!604129 (not (validMask!0 (mask!25792 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892069 (arrayContainsKey!0 (_keys!9971 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402921 () Unit!30320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52165 (_ BitVec 64) (_ BitVec 32)) Unit!30320)

(assert (=> b!892069 (= lt!402921 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9971 thiss!1181) key!785 (index!37472 lt!402922)))))

(declare-fun b!892070 () Bool)

(declare-fun res!604124 () Bool)

(assert (=> b!892070 (=> res!604124 e!497797)))

(assert (=> b!892070 (= res!604124 (or (not (= (size!25530 (_values!5245 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25792 thiss!1181)))) (not (= (size!25529 (_keys!9971 thiss!1181)) (size!25530 (_values!5245 thiss!1181)))) (bvslt (mask!25792 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4954 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4954 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892071 () Bool)

(assert (=> b!892071 (= e!497802 (and e!497799 mapRes!28664))))

(declare-fun condMapEmpty!28664 () Bool)

(declare-fun mapDefault!28664 () ValueCell!8555)

(assert (=> b!892071 (= condMapEmpty!28664 (= (arr!25085 (_values!5245 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8555)) mapDefault!28664)))))

(assert (= (and start!75942 res!604128) b!892063))

(assert (= (and b!892063 res!604127) b!892067))

(assert (= (and b!892067 (not res!604126)) b!892065))

(assert (= (and b!892067 (not res!604125)) b!892069))

(assert (= (and b!892069 (not res!604129)) b!892070))

(assert (= (and b!892070 (not res!604124)) b!892061))

(assert (= (and b!892061 (not res!604123)) b!892062))

(assert (= (and b!892071 condMapEmpty!28664) mapIsEmpty!28664))

(assert (= (and b!892071 (not condMapEmpty!28664)) mapNonEmpty!28664))

(assert (= (and mapNonEmpty!28664 ((_ is ValueCellFull!8555) mapValue!28664)) b!892068))

(assert (= (and b!892071 ((_ is ValueCellFull!8555) mapDefault!28664)) b!892064))

(assert (= b!892066 b!892071))

(assert (= start!75942 b!892066))

(declare-fun m!830803 () Bool)

(assert (=> b!892066 m!830803))

(declare-fun m!830805 () Bool)

(assert (=> b!892066 m!830805))

(declare-fun m!830807 () Bool)

(assert (=> b!892067 m!830807))

(declare-fun m!830809 () Bool)

(assert (=> b!892067 m!830809))

(declare-fun m!830811 () Bool)

(assert (=> mapNonEmpty!28664 m!830811))

(declare-fun m!830813 () Bool)

(assert (=> b!892061 m!830813))

(declare-fun m!830815 () Bool)

(assert (=> b!892065 m!830815))

(declare-fun m!830817 () Bool)

(assert (=> b!892069 m!830817))

(declare-fun m!830819 () Bool)

(assert (=> b!892069 m!830819))

(declare-fun m!830821 () Bool)

(assert (=> b!892069 m!830821))

(declare-fun m!830823 () Bool)

(assert (=> start!75942 m!830823))

(declare-fun m!830825 () Bool)

(assert (=> b!892062 m!830825))

(check-sat (not b!892066) (not b_next!15745) tp_is_empty!18073 (not b!892067) (not start!75942) (not b!892065) (not mapNonEmpty!28664) (not b!892062) (not b!892061) b_and!25995 (not b!892069))
(check-sat b_and!25995 (not b_next!15745))
