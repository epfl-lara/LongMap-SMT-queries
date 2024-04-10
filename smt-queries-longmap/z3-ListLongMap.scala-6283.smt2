; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80378 () Bool)

(assert start!80378)

(declare-fun b!944003 () Bool)

(declare-fun b_free!18021 () Bool)

(declare-fun b_next!18021 () Bool)

(assert (=> b!944003 (= b_free!18021 (not b_next!18021))))

(declare-fun tp!62573 () Bool)

(declare-fun b_and!29439 () Bool)

(assert (=> b!944003 (= tp!62573 b_and!29439)))

(declare-fun b!943995 () Bool)

(declare-fun res!634184 () Bool)

(declare-fun e!530799 () Bool)

(assert (=> b!943995 (=> (not res!634184) (not e!530799))))

(declare-datatypes ((V!32337 0))(
  ( (V!32338 (val!10315 Int)) )
))
(declare-datatypes ((ValueCell!9783 0))(
  ( (ValueCellFull!9783 (v!12847 V!32337)) (EmptyCell!9783) )
))
(declare-datatypes ((array!57026 0))(
  ( (array!57027 (arr!27438 (Array (_ BitVec 32) ValueCell!9783)) (size!27904 (_ BitVec 32))) )
))
(declare-datatypes ((array!57028 0))(
  ( (array!57029 (arr!27439 (Array (_ BitVec 32) (_ BitVec 64))) (size!27905 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4716 0))(
  ( (LongMapFixedSize!4717 (defaultEntry!5653 Int) (mask!27293 (_ BitVec 32)) (extraKeys!5385 (_ BitVec 32)) (zeroValue!5489 V!32337) (minValue!5489 V!32337) (_size!2413 (_ BitVec 32)) (_keys!10531 array!57028) (_values!5676 array!57026) (_vacant!2413 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4716)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13456 0))(
  ( (tuple2!13457 (_1!6739 (_ BitVec 64)) (_2!6739 V!32337)) )
))
(declare-datatypes ((List!19262 0))(
  ( (Nil!19259) (Cons!19258 (h!20409 tuple2!13456) (t!27579 List!19262)) )
))
(declare-datatypes ((ListLongMap!12153 0))(
  ( (ListLongMap!12154 (toList!6092 List!19262)) )
))
(declare-fun contains!5164 (ListLongMap!12153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3326 (array!57028 array!57026 (_ BitVec 32) (_ BitVec 32) V!32337 V!32337 (_ BitVec 32) Int) ListLongMap!12153)

(assert (=> b!943995 (= res!634184 (contains!5164 (getCurrentListMap!3326 (_keys!10531 thiss!1141) (_values!5676 thiss!1141) (mask!27293 thiss!1141) (extraKeys!5385 thiss!1141) (zeroValue!5489 thiss!1141) (minValue!5489 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5653 thiss!1141)) key!756))))

(declare-fun b!943996 () Bool)

(declare-fun e!530803 () Bool)

(declare-fun tp_is_empty!20529 () Bool)

(assert (=> b!943996 (= e!530803 tp_is_empty!20529)))

(declare-fun b!943997 () Bool)

(declare-fun res!634181 () Bool)

(assert (=> b!943997 (=> (not res!634181) (not e!530799))))

(assert (=> b!943997 (= res!634181 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!634182 () Bool)

(assert (=> start!80378 (=> (not res!634182) (not e!530799))))

(declare-fun valid!1802 (LongMapFixedSize!4716) Bool)

(assert (=> start!80378 (= res!634182 (valid!1802 thiss!1141))))

(assert (=> start!80378 e!530799))

(declare-fun e!530801 () Bool)

(assert (=> start!80378 e!530801))

(assert (=> start!80378 true))

(declare-fun b!943998 () Bool)

(declare-fun e!530797 () Bool)

(assert (=> b!943998 (= e!530797 tp_is_empty!20529)))

(declare-fun mapIsEmpty!32619 () Bool)

(declare-fun mapRes!32619 () Bool)

(assert (=> mapIsEmpty!32619 mapRes!32619))

(declare-fun b!943999 () Bool)

(declare-fun e!530800 () Bool)

(assert (=> b!943999 (= e!530800 (and e!530797 mapRes!32619))))

(declare-fun condMapEmpty!32619 () Bool)

(declare-fun mapDefault!32619 () ValueCell!9783)

(assert (=> b!943999 (= condMapEmpty!32619 (= (arr!27438 (_values!5676 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9783)) mapDefault!32619)))))

(declare-fun b!944000 () Bool)

(declare-fun res!634183 () Bool)

(assert (=> b!944000 (=> (not res!634183) (not e!530799))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9057 0))(
  ( (MissingZero!9057 (index!38599 (_ BitVec 32))) (Found!9057 (index!38600 (_ BitVec 32))) (Intermediate!9057 (undefined!9869 Bool) (index!38601 (_ BitVec 32)) (x!81068 (_ BitVec 32))) (Undefined!9057) (MissingVacant!9057 (index!38602 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57028 (_ BitVec 32)) SeekEntryResult!9057)

(assert (=> b!944000 (= res!634183 (not ((_ is Found!9057) (seekEntry!0 key!756 (_keys!10531 thiss!1141) (mask!27293 thiss!1141)))))))

(declare-fun mapNonEmpty!32619 () Bool)

(declare-fun tp!62572 () Bool)

(assert (=> mapNonEmpty!32619 (= mapRes!32619 (and tp!62572 e!530803))))

(declare-fun mapRest!32619 () (Array (_ BitVec 32) ValueCell!9783))

(declare-fun mapValue!32619 () ValueCell!9783)

(declare-fun mapKey!32619 () (_ BitVec 32))

(assert (=> mapNonEmpty!32619 (= (arr!27438 (_values!5676 thiss!1141)) (store mapRest!32619 mapKey!32619 mapValue!32619))))

(declare-fun b!944001 () Bool)

(declare-fun e!530802 () Bool)

(assert (=> b!944001 (= e!530799 (not e!530802))))

(declare-fun res!634185 () Bool)

(assert (=> b!944001 (=> res!634185 e!530802)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944001 (= res!634185 (not (validMask!0 (mask!27293 thiss!1141))))))

(declare-fun lt!425496 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57028 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944001 (= lt!425496 (arrayScanForKey!0 (_keys!10531 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944001 (arrayContainsKey!0 (_keys!10531 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31830 0))(
  ( (Unit!31831) )
))
(declare-fun lt!425495 () Unit!31830)

(declare-fun lemmaKeyInListMapIsInArray!295 (array!57028 array!57026 (_ BitVec 32) (_ BitVec 32) V!32337 V!32337 (_ BitVec 64) Int) Unit!31830)

(assert (=> b!944001 (= lt!425495 (lemmaKeyInListMapIsInArray!295 (_keys!10531 thiss!1141) (_values!5676 thiss!1141) (mask!27293 thiss!1141) (extraKeys!5385 thiss!1141) (zeroValue!5489 thiss!1141) (minValue!5489 thiss!1141) key!756 (defaultEntry!5653 thiss!1141)))))

(declare-fun b!944002 () Bool)

(declare-fun res!634180 () Bool)

(assert (=> b!944002 (=> res!634180 e!530802)))

(assert (=> b!944002 (= res!634180 (or (not (= (size!27905 (_keys!10531 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27293 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27905 (_keys!10531 thiss!1141))) (bvslt lt!425496 #b00000000000000000000000000000000) (bvsgt lt!425496 (size!27905 (_keys!10531 thiss!1141)))))))

(declare-fun array_inv!21320 (array!57028) Bool)

(declare-fun array_inv!21321 (array!57026) Bool)

(assert (=> b!944003 (= e!530801 (and tp!62573 tp_is_empty!20529 (array_inv!21320 (_keys!10531 thiss!1141)) (array_inv!21321 (_values!5676 thiss!1141)) e!530800))))

(declare-fun b!944004 () Bool)

(assert (=> b!944004 (= e!530802 true)))

(declare-fun lt!425494 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57028 (_ BitVec 32)) Bool)

(assert (=> b!944004 (= lt!425494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10531 thiss!1141) (mask!27293 thiss!1141)))))

(assert (= (and start!80378 res!634182) b!943997))

(assert (= (and b!943997 res!634181) b!944000))

(assert (= (and b!944000 res!634183) b!943995))

(assert (= (and b!943995 res!634184) b!944001))

(assert (= (and b!944001 (not res!634185)) b!944002))

(assert (= (and b!944002 (not res!634180)) b!944004))

(assert (= (and b!943999 condMapEmpty!32619) mapIsEmpty!32619))

(assert (= (and b!943999 (not condMapEmpty!32619)) mapNonEmpty!32619))

(assert (= (and mapNonEmpty!32619 ((_ is ValueCellFull!9783) mapValue!32619)) b!943996))

(assert (= (and b!943999 ((_ is ValueCellFull!9783) mapDefault!32619)) b!943998))

(assert (= b!944003 b!943999))

(assert (= start!80378 b!944003))

(declare-fun m!878085 () Bool)

(assert (=> b!944001 m!878085))

(declare-fun m!878087 () Bool)

(assert (=> b!944001 m!878087))

(declare-fun m!878089 () Bool)

(assert (=> b!944001 m!878089))

(declare-fun m!878091 () Bool)

(assert (=> b!944001 m!878091))

(declare-fun m!878093 () Bool)

(assert (=> b!943995 m!878093))

(assert (=> b!943995 m!878093))

(declare-fun m!878095 () Bool)

(assert (=> b!943995 m!878095))

(declare-fun m!878097 () Bool)

(assert (=> b!944003 m!878097))

(declare-fun m!878099 () Bool)

(assert (=> b!944003 m!878099))

(declare-fun m!878101 () Bool)

(assert (=> mapNonEmpty!32619 m!878101))

(declare-fun m!878103 () Bool)

(assert (=> start!80378 m!878103))

(declare-fun m!878105 () Bool)

(assert (=> b!944004 m!878105))

(declare-fun m!878107 () Bool)

(assert (=> b!944000 m!878107))

(check-sat (not b!944004) (not b!944000) (not b!944003) (not b!944001) (not b_next!18021) (not start!80378) b_and!29439 (not b!943995) tp_is_empty!20529 (not mapNonEmpty!32619))
(check-sat b_and!29439 (not b_next!18021))
