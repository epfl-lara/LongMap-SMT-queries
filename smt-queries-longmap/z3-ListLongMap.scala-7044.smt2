; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89278 () Bool)

(assert start!89278)

(declare-fun b!1023729 () Bool)

(declare-fun b_free!20319 () Bool)

(declare-fun b_next!20319 () Bool)

(assert (=> b!1023729 (= b_free!20319 (not b_next!20319))))

(declare-fun tp!71991 () Bool)

(declare-fun b_and!32549 () Bool)

(assert (=> b!1023729 (= tp!71991 b_and!32549)))

(declare-fun res!685567 () Bool)

(declare-fun e!576906 () Bool)

(assert (=> start!89278 (=> (not res!685567) (not e!576906))))

(declare-datatypes ((V!36925 0))(
  ( (V!36926 (val!12070 Int)) )
))
(declare-datatypes ((ValueCell!11316 0))(
  ( (ValueCellFull!11316 (v!14639 V!36925)) (EmptyCell!11316) )
))
(declare-datatypes ((array!64122 0))(
  ( (array!64123 (arr!30873 (Array (_ BitVec 32) (_ BitVec 64))) (size!31384 (_ BitVec 32))) )
))
(declare-datatypes ((array!64124 0))(
  ( (array!64125 (arr!30874 (Array (_ BitVec 32) ValueCell!11316)) (size!31385 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5226 0))(
  ( (LongMapFixedSize!5227 (defaultEntry!5965 Int) (mask!29594 (_ BitVec 32)) (extraKeys!5697 (_ BitVec 32)) (zeroValue!5801 V!36925) (minValue!5801 V!36925) (_size!2668 (_ BitVec 32)) (_keys!11110 array!64122) (_values!5988 array!64124) (_vacant!2668 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5226)

(declare-fun valid!1991 (LongMapFixedSize!5226) Bool)

(assert (=> start!89278 (= res!685567 (valid!1991 thiss!1427))))

(assert (=> start!89278 e!576906))

(declare-fun e!576905 () Bool)

(assert (=> start!89278 e!576905))

(assert (=> start!89278 true))

(declare-fun b!1023727 () Bool)

(declare-fun e!576909 () Bool)

(declare-fun tp_is_empty!24039 () Bool)

(assert (=> b!1023727 (= e!576909 tp_is_empty!24039)))

(declare-fun mapIsEmpty!37476 () Bool)

(declare-fun mapRes!37476 () Bool)

(assert (=> mapIsEmpty!37476 mapRes!37476))

(declare-fun b!1023728 () Bool)

(declare-fun e!576907 () Bool)

(assert (=> b!1023728 (= e!576907 (and e!576909 mapRes!37476))))

(declare-fun condMapEmpty!37476 () Bool)

(declare-fun mapDefault!37476 () ValueCell!11316)

(assert (=> b!1023728 (= condMapEmpty!37476 (= (arr!30874 (_values!5988 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11316)) mapDefault!37476)))))

(declare-fun array_inv!23921 (array!64122) Bool)

(declare-fun array_inv!23922 (array!64124) Bool)

(assert (=> b!1023729 (= e!576905 (and tp!71991 tp_is_empty!24039 (array_inv!23921 (_keys!11110 thiss!1427)) (array_inv!23922 (_values!5988 thiss!1427)) e!576907))))

(declare-fun b!1023730 () Bool)

(declare-fun e!576904 () Bool)

(assert (=> b!1023730 (= e!576904 tp_is_empty!24039)))

(declare-fun mapNonEmpty!37476 () Bool)

(declare-fun tp!71992 () Bool)

(assert (=> mapNonEmpty!37476 (= mapRes!37476 (and tp!71992 e!576904))))

(declare-fun mapValue!37476 () ValueCell!11316)

(declare-fun mapKey!37476 () (_ BitVec 32))

(declare-fun mapRest!37476 () (Array (_ BitVec 32) ValueCell!11316))

(assert (=> mapNonEmpty!37476 (= (arr!30874 (_values!5988 thiss!1427)) (store mapRest!37476 mapKey!37476 mapValue!37476))))

(declare-fun b!1023731 () Bool)

(assert (=> b!1023731 (= e!576906 (not true))))

(declare-fun lt!450472 () Bool)

(declare-fun lt!450473 () V!36925)

(assert (=> b!1023731 (= lt!450472 (valid!1991 (LongMapFixedSize!5227 (defaultEntry!5965 thiss!1427) (mask!29594 thiss!1427) (bvand (extraKeys!5697 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5801 thiss!1427) lt!450473 (_size!2668 thiss!1427) (_keys!11110 thiss!1427) (_values!5988 thiss!1427) (_vacant!2668 thiss!1427))))))

(declare-datatypes ((tuple2!15516 0))(
  ( (tuple2!15517 (_1!7769 (_ BitVec 64)) (_2!7769 V!36925)) )
))
(declare-datatypes ((List!21719 0))(
  ( (Nil!21716) (Cons!21715 (h!22913 tuple2!15516) (t!30767 List!21719)) )
))
(declare-datatypes ((ListLongMap!13657 0))(
  ( (ListLongMap!13658 (toList!6844 List!21719)) )
))
(declare-fun -!471 (ListLongMap!13657 (_ BitVec 64)) ListLongMap!13657)

(declare-fun getCurrentListMap!3892 (array!64122 array!64124 (_ BitVec 32) (_ BitVec 32) V!36925 V!36925 (_ BitVec 32) Int) ListLongMap!13657)

(assert (=> b!1023731 (= (-!471 (getCurrentListMap!3892 (_keys!11110 thiss!1427) (_values!5988 thiss!1427) (mask!29594 thiss!1427) (extraKeys!5697 thiss!1427) (zeroValue!5801 thiss!1427) (minValue!5801 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5965 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3892 (_keys!11110 thiss!1427) (_values!5988 thiss!1427) (mask!29594 thiss!1427) (bvand (extraKeys!5697 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5801 thiss!1427) lt!450473 #b00000000000000000000000000000000 (defaultEntry!5965 thiss!1427)))))

(declare-datatypes ((Unit!33331 0))(
  ( (Unit!33332) )
))
(declare-fun lt!450474 () Unit!33331)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!3 (array!64122 array!64124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36925 V!36925 V!36925 Int) Unit!33331)

(assert (=> b!1023731 (= lt!450474 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!3 (_keys!11110 thiss!1427) (_values!5988 thiss!1427) (mask!29594 thiss!1427) (extraKeys!5697 thiss!1427) (bvand (extraKeys!5697 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5801 thiss!1427) (minValue!5801 thiss!1427) lt!450473 (defaultEntry!5965 thiss!1427)))))

(declare-fun dynLambda!1941 (Int (_ BitVec 64)) V!36925)

(assert (=> b!1023731 (= lt!450473 (dynLambda!1941 (defaultEntry!5965 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1023732 () Bool)

(declare-fun res!685568 () Bool)

(assert (=> b!1023732 (=> (not res!685568) (not e!576906))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023732 (= res!685568 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!89278 res!685567) b!1023732))

(assert (= (and b!1023732 res!685568) b!1023731))

(assert (= (and b!1023728 condMapEmpty!37476) mapIsEmpty!37476))

(assert (= (and b!1023728 (not condMapEmpty!37476)) mapNonEmpty!37476))

(get-info :version)

(assert (= (and mapNonEmpty!37476 ((_ is ValueCellFull!11316) mapValue!37476)) b!1023730))

(assert (= (and b!1023728 ((_ is ValueCellFull!11316) mapDefault!37476)) b!1023727))

(assert (= b!1023729 b!1023728))

(assert (= start!89278 b!1023729))

(declare-fun b_lambda!15703 () Bool)

(assert (=> (not b_lambda!15703) (not b!1023731)))

(declare-fun t!30766 () Bool)

(declare-fun tb!6871 () Bool)

(assert (=> (and b!1023729 (= (defaultEntry!5965 thiss!1427) (defaultEntry!5965 thiss!1427)) t!30766) tb!6871))

(declare-fun result!14051 () Bool)

(assert (=> tb!6871 (= result!14051 tp_is_empty!24039)))

(assert (=> b!1023731 t!30766))

(declare-fun b_and!32551 () Bool)

(assert (= b_and!32549 (and (=> t!30766 result!14051) b_and!32551)))

(declare-fun m!942313 () Bool)

(assert (=> start!89278 m!942313))

(declare-fun m!942315 () Bool)

(assert (=> b!1023729 m!942315))

(declare-fun m!942317 () Bool)

(assert (=> b!1023729 m!942317))

(declare-fun m!942319 () Bool)

(assert (=> mapNonEmpty!37476 m!942319))

(declare-fun m!942321 () Bool)

(assert (=> b!1023731 m!942321))

(declare-fun m!942323 () Bool)

(assert (=> b!1023731 m!942323))

(declare-fun m!942325 () Bool)

(assert (=> b!1023731 m!942325))

(declare-fun m!942327 () Bool)

(assert (=> b!1023731 m!942327))

(declare-fun m!942329 () Bool)

(assert (=> b!1023731 m!942329))

(assert (=> b!1023731 m!942327))

(declare-fun m!942331 () Bool)

(assert (=> b!1023731 m!942331))

(check-sat (not mapNonEmpty!37476) (not b!1023731) tp_is_empty!24039 b_and!32551 (not b_lambda!15703) (not b_next!20319) (not start!89278) (not b!1023729))
(check-sat b_and!32551 (not b_next!20319))
