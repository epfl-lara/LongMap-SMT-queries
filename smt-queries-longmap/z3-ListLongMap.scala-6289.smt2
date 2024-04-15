; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80394 () Bool)

(assert start!80394)

(declare-fun b!944288 () Bool)

(declare-fun b_free!18055 () Bool)

(declare-fun b_next!18055 () Bool)

(assert (=> b!944288 (= b_free!18055 (not b_next!18055))))

(declare-fun tp!62675 () Bool)

(declare-fun b_and!29447 () Bool)

(assert (=> b!944288 (= tp!62675 b_and!29447)))

(declare-fun tp_is_empty!20563 () Bool)

(declare-datatypes ((V!32383 0))(
  ( (V!32384 (val!10332 Int)) )
))
(declare-datatypes ((ValueCell!9800 0))(
  ( (ValueCellFull!9800 (v!12863 V!32383)) (EmptyCell!9800) )
))
(declare-datatypes ((array!57059 0))(
  ( (array!57060 (arr!27455 (Array (_ BitVec 32) ValueCell!9800)) (size!27923 (_ BitVec 32))) )
))
(declare-datatypes ((array!57061 0))(
  ( (array!57062 (arr!27456 (Array (_ BitVec 32) (_ BitVec 64))) (size!27924 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4750 0))(
  ( (LongMapFixedSize!4751 (defaultEntry!5670 Int) (mask!27315 (_ BitVec 32)) (extraKeys!5402 (_ BitVec 32)) (zeroValue!5506 V!32383) (minValue!5506 V!32383) (_size!2430 (_ BitVec 32)) (_keys!10543 array!57061) (_values!5693 array!57059) (_vacant!2430 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4750)

(declare-fun e!531007 () Bool)

(declare-fun e!531008 () Bool)

(declare-fun array_inv!21384 (array!57061) Bool)

(declare-fun array_inv!21385 (array!57059) Bool)

(assert (=> b!944288 (= e!531008 (and tp!62675 tp_is_empty!20563 (array_inv!21384 (_keys!10543 thiss!1141)) (array_inv!21385 (_values!5693 thiss!1141)) e!531007))))

(declare-fun mapNonEmpty!32670 () Bool)

(declare-fun mapRes!32670 () Bool)

(declare-fun tp!62676 () Bool)

(declare-fun e!531012 () Bool)

(assert (=> mapNonEmpty!32670 (= mapRes!32670 (and tp!62676 e!531012))))

(declare-fun mapValue!32670 () ValueCell!9800)

(declare-fun mapRest!32670 () (Array (_ BitVec 32) ValueCell!9800))

(declare-fun mapKey!32670 () (_ BitVec 32))

(assert (=> mapNonEmpty!32670 (= (arr!27455 (_values!5693 thiss!1141)) (store mapRest!32670 mapKey!32670 mapValue!32670))))

(declare-fun b!944289 () Bool)

(assert (=> b!944289 (= e!531012 tp_is_empty!20563)))

(declare-fun res!634400 () Bool)

(declare-fun e!531006 () Bool)

(assert (=> start!80394 (=> (not res!634400) (not e!531006))))

(declare-fun valid!1816 (LongMapFixedSize!4750) Bool)

(assert (=> start!80394 (= res!634400 (valid!1816 thiss!1141))))

(assert (=> start!80394 e!531006))

(assert (=> start!80394 e!531008))

(assert (=> start!80394 true))

(declare-fun b!944290 () Bool)

(declare-fun e!531009 () Bool)

(assert (=> b!944290 (= e!531006 (not e!531009))))

(declare-fun res!634403 () Bool)

(assert (=> b!944290 (=> res!634403 e!531009)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944290 (= res!634403 (not (validMask!0 (mask!27315 thiss!1141))))))

(declare-fun lt!425424 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57061 (_ BitVec 32)) Bool)

(assert (=> b!944290 (arrayForallSeekEntryOrOpenFound!0 lt!425424 (_keys!10543 thiss!1141) (mask!27315 thiss!1141))))

(declare-datatypes ((Unit!31735 0))(
  ( (Unit!31736) )
))
(declare-fun lt!425422 () Unit!31735)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31735)

(assert (=> b!944290 (= lt!425422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10543 thiss!1141) (mask!27315 thiss!1141) #b00000000000000000000000000000000 lt!425424))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57061 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944290 (= lt!425424 (arrayScanForKey!0 (_keys!10543 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944290 (arrayContainsKey!0 (_keys!10543 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425423 () Unit!31735)

(declare-fun lemmaKeyInListMapIsInArray!296 (array!57061 array!57059 (_ BitVec 32) (_ BitVec 32) V!32383 V!32383 (_ BitVec 64) Int) Unit!31735)

(assert (=> b!944290 (= lt!425423 (lemmaKeyInListMapIsInArray!296 (_keys!10543 thiss!1141) (_values!5693 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5402 thiss!1141) (zeroValue!5506 thiss!1141) (minValue!5506 thiss!1141) key!756 (defaultEntry!5670 thiss!1141)))))

(declare-fun mapIsEmpty!32670 () Bool)

(assert (=> mapIsEmpty!32670 mapRes!32670))

(declare-fun b!944291 () Bool)

(assert (=> b!944291 (= e!531009 true)))

(declare-datatypes ((SeekEntryResult!9068 0))(
  ( (MissingZero!9068 (index!38643 (_ BitVec 32))) (Found!9068 (index!38644 (_ BitVec 32))) (Intermediate!9068 (undefined!9880 Bool) (index!38645 (_ BitVec 32)) (x!81122 (_ BitVec 32))) (Undefined!9068) (MissingVacant!9068 (index!38646 (_ BitVec 32))) )
))
(declare-fun lt!425425 () SeekEntryResult!9068)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57061 (_ BitVec 32)) SeekEntryResult!9068)

(assert (=> b!944291 (= lt!425425 (seekEntryOrOpen!0 key!756 (_keys!10543 thiss!1141) (mask!27315 thiss!1141)))))

(declare-fun b!944292 () Bool)

(declare-fun res!634405 () Bool)

(assert (=> b!944292 (=> res!634405 e!531009)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944292 (= res!634405 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944293 () Bool)

(declare-fun res!634398 () Bool)

(assert (=> b!944293 (=> (not res!634398) (not e!531006))))

(assert (=> b!944293 (= res!634398 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944294 () Bool)

(declare-fun res!634401 () Bool)

(assert (=> b!944294 (=> (not res!634401) (not e!531006))))

(declare-datatypes ((tuple2!13532 0))(
  ( (tuple2!13533 (_1!6777 (_ BitVec 64)) (_2!6777 V!32383)) )
))
(declare-datatypes ((List!19281 0))(
  ( (Nil!19278) (Cons!19277 (h!20428 tuple2!13532) (t!27589 List!19281)) )
))
(declare-datatypes ((ListLongMap!12219 0))(
  ( (ListLongMap!12220 (toList!6125 List!19281)) )
))
(declare-fun contains!5140 (ListLongMap!12219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3288 (array!57061 array!57059 (_ BitVec 32) (_ BitVec 32) V!32383 V!32383 (_ BitVec 32) Int) ListLongMap!12219)

(assert (=> b!944294 (= res!634401 (contains!5140 (getCurrentListMap!3288 (_keys!10543 thiss!1141) (_values!5693 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5402 thiss!1141) (zeroValue!5506 thiss!1141) (minValue!5506 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5670 thiss!1141)) key!756))))

(declare-fun b!944295 () Bool)

(declare-fun e!531010 () Bool)

(assert (=> b!944295 (= e!531010 tp_is_empty!20563)))

(declare-fun b!944296 () Bool)

(assert (=> b!944296 (= e!531007 (and e!531010 mapRes!32670))))

(declare-fun condMapEmpty!32670 () Bool)

(declare-fun mapDefault!32670 () ValueCell!9800)

(assert (=> b!944296 (= condMapEmpty!32670 (= (arr!27455 (_values!5693 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9800)) mapDefault!32670)))))

(declare-fun b!944297 () Bool)

(declare-fun res!634399 () Bool)

(assert (=> b!944297 (=> res!634399 e!531009)))

(assert (=> b!944297 (= res!634399 (not (= (size!27924 (_keys!10543 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27315 thiss!1141)))))))

(declare-fun b!944298 () Bool)

(declare-fun res!634404 () Bool)

(assert (=> b!944298 (=> (not res!634404) (not e!531006))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57061 (_ BitVec 32)) SeekEntryResult!9068)

(assert (=> b!944298 (= res!634404 (not ((_ is Found!9068) (seekEntry!0 key!756 (_keys!10543 thiss!1141) (mask!27315 thiss!1141)))))))

(declare-fun b!944299 () Bool)

(declare-fun res!634402 () Bool)

(assert (=> b!944299 (=> res!634402 e!531009)))

(assert (=> b!944299 (= res!634402 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10543 thiss!1141) (mask!27315 thiss!1141))))))

(assert (= (and start!80394 res!634400) b!944293))

(assert (= (and b!944293 res!634398) b!944298))

(assert (= (and b!944298 res!634404) b!944294))

(assert (= (and b!944294 res!634401) b!944290))

(assert (= (and b!944290 (not res!634403)) b!944297))

(assert (= (and b!944297 (not res!634399)) b!944299))

(assert (= (and b!944299 (not res!634402)) b!944292))

(assert (= (and b!944292 (not res!634405)) b!944291))

(assert (= (and b!944296 condMapEmpty!32670) mapIsEmpty!32670))

(assert (= (and b!944296 (not condMapEmpty!32670)) mapNonEmpty!32670))

(assert (= (and mapNonEmpty!32670 ((_ is ValueCellFull!9800) mapValue!32670)) b!944289))

(assert (= (and b!944296 ((_ is ValueCellFull!9800) mapDefault!32670)) b!944295))

(assert (= b!944288 b!944296))

(assert (= start!80394 b!944288))

(declare-fun m!877759 () Bool)

(assert (=> b!944298 m!877759))

(declare-fun m!877761 () Bool)

(assert (=> b!944294 m!877761))

(assert (=> b!944294 m!877761))

(declare-fun m!877763 () Bool)

(assert (=> b!944294 m!877763))

(declare-fun m!877765 () Bool)

(assert (=> start!80394 m!877765))

(declare-fun m!877767 () Bool)

(assert (=> b!944288 m!877767))

(declare-fun m!877769 () Bool)

(assert (=> b!944288 m!877769))

(declare-fun m!877771 () Bool)

(assert (=> b!944292 m!877771))

(declare-fun m!877773 () Bool)

(assert (=> b!944291 m!877773))

(declare-fun m!877775 () Bool)

(assert (=> b!944299 m!877775))

(declare-fun m!877777 () Bool)

(assert (=> mapNonEmpty!32670 m!877777))

(declare-fun m!877779 () Bool)

(assert (=> b!944290 m!877779))

(declare-fun m!877781 () Bool)

(assert (=> b!944290 m!877781))

(declare-fun m!877783 () Bool)

(assert (=> b!944290 m!877783))

(declare-fun m!877785 () Bool)

(assert (=> b!944290 m!877785))

(declare-fun m!877787 () Bool)

(assert (=> b!944290 m!877787))

(declare-fun m!877789 () Bool)

(assert (=> b!944290 m!877789))

(check-sat (not b!944290) (not mapNonEmpty!32670) tp_is_empty!20563 (not b!944294) (not b!944291) b_and!29447 (not b!944288) (not b_next!18055) (not b!944299) (not b!944292) (not start!80394) (not b!944298))
(check-sat b_and!29447 (not b_next!18055))
