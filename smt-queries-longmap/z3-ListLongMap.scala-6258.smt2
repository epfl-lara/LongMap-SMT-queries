; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80182 () Bool)

(assert start!80182)

(declare-fun b!941627 () Bool)

(declare-fun b_free!17869 () Bool)

(declare-fun b_next!17869 () Bool)

(assert (=> b!941627 (= b_free!17869 (not b_next!17869))))

(declare-fun tp!62083 () Bool)

(declare-fun b_and!29291 () Bool)

(assert (=> b!941627 (= tp!62083 b_and!29291)))

(declare-fun b!941619 () Bool)

(declare-fun res!632861 () Bool)

(declare-fun e!529302 () Bool)

(assert (=> b!941619 (=> res!632861 e!529302)))

(declare-datatypes ((V!32135 0))(
  ( (V!32136 (val!10239 Int)) )
))
(declare-datatypes ((ValueCell!9707 0))(
  ( (ValueCellFull!9707 (v!12767 V!32135)) (EmptyCell!9707) )
))
(declare-datatypes ((array!56753 0))(
  ( (array!56754 (arr!27307 (Array (_ BitVec 32) ValueCell!9707)) (size!27769 (_ BitVec 32))) )
))
(declare-datatypes ((array!56755 0))(
  ( (array!56756 (arr!27308 (Array (_ BitVec 32) (_ BitVec 64))) (size!27770 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4564 0))(
  ( (LongMapFixedSize!4565 (defaultEntry!5573 Int) (mask!27163 (_ BitVec 32)) (extraKeys!5305 (_ BitVec 32)) (zeroValue!5409 V!32135) (minValue!5409 V!32135) (_size!2337 (_ BitVec 32)) (_keys!10451 array!56755) (_values!5596 array!56753) (_vacant!2337 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4564)

(assert (=> b!941619 (= res!632861 (or (not (= (size!27769 (_values!5596 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27163 thiss!1141)))) (not (= (size!27770 (_keys!10451 thiss!1141)) (size!27769 (_values!5596 thiss!1141)))) (bvslt (mask!27163 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5305 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5305 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!941620 () Bool)

(declare-fun res!632862 () Bool)

(declare-fun e!529299 () Bool)

(assert (=> b!941620 (=> (not res!632862) (not e!529299))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941620 (= res!632862 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941621 () Bool)

(declare-fun res!632860 () Bool)

(assert (=> b!941621 (=> res!632860 e!529302)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56755 (_ BitVec 32)) Bool)

(assert (=> b!941621 (= res!632860 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10451 thiss!1141) (mask!27163 thiss!1141))))))

(declare-fun res!632864 () Bool)

(assert (=> start!80182 (=> (not res!632864) (not e!529299))))

(declare-fun valid!1757 (LongMapFixedSize!4564) Bool)

(assert (=> start!80182 (= res!632864 (valid!1757 thiss!1141))))

(assert (=> start!80182 e!529299))

(declare-fun e!529303 () Bool)

(assert (=> start!80182 e!529303))

(assert (=> start!80182 true))

(declare-fun b!941622 () Bool)

(declare-fun e!529305 () Bool)

(declare-fun e!529301 () Bool)

(declare-fun mapRes!32356 () Bool)

(assert (=> b!941622 (= e!529305 (and e!529301 mapRes!32356))))

(declare-fun condMapEmpty!32356 () Bool)

(declare-fun mapDefault!32356 () ValueCell!9707)

(assert (=> b!941622 (= condMapEmpty!32356 (= (arr!27307 (_values!5596 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9707)) mapDefault!32356)))))

(declare-fun b!941623 () Bool)

(declare-fun e!529304 () Bool)

(assert (=> b!941623 (= e!529304 (not e!529302))))

(declare-fun res!632863 () Bool)

(assert (=> b!941623 (=> res!632863 e!529302)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941623 (= res!632863 (not (validMask!0 (mask!27163 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941623 (arrayContainsKey!0 (_keys!10451 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8961 0))(
  ( (MissingZero!8961 (index!38215 (_ BitVec 32))) (Found!8961 (index!38216 (_ BitVec 32))) (Intermediate!8961 (undefined!9773 Bool) (index!38217 (_ BitVec 32)) (x!80660 (_ BitVec 32))) (Undefined!8961) (MissingVacant!8961 (index!38218 (_ BitVec 32))) )
))
(declare-fun lt!425155 () SeekEntryResult!8961)

(declare-datatypes ((Unit!31758 0))(
  ( (Unit!31759) )
))
(declare-fun lt!425154 () Unit!31758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56755 (_ BitVec 64) (_ BitVec 32)) Unit!31758)

(assert (=> b!941623 (= lt!425154 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10451 thiss!1141) key!756 (index!38216 lt!425155)))))

(declare-fun b!941624 () Bool)

(assert (=> b!941624 (= e!529302 true)))

(declare-fun lt!425156 () Bool)

(declare-datatypes ((List!19180 0))(
  ( (Nil!19177) (Cons!19176 (h!20328 (_ BitVec 64)) (t!27487 List!19180)) )
))
(declare-fun arrayNoDuplicates!0 (array!56755 (_ BitVec 32) List!19180) Bool)

(assert (=> b!941624 (= lt!425156 (arrayNoDuplicates!0 (_keys!10451 thiss!1141) #b00000000000000000000000000000000 Nil!19177))))

(declare-fun b!941625 () Bool)

(declare-fun tp_is_empty!20377 () Bool)

(assert (=> b!941625 (= e!529301 tp_is_empty!20377)))

(declare-fun b!941626 () Bool)

(declare-fun e!529300 () Bool)

(assert (=> b!941626 (= e!529300 tp_is_empty!20377)))

(declare-fun mapIsEmpty!32356 () Bool)

(assert (=> mapIsEmpty!32356 mapRes!32356))

(declare-fun array_inv!21318 (array!56755) Bool)

(declare-fun array_inv!21319 (array!56753) Bool)

(assert (=> b!941627 (= e!529303 (and tp!62083 tp_is_empty!20377 (array_inv!21318 (_keys!10451 thiss!1141)) (array_inv!21319 (_values!5596 thiss!1141)) e!529305))))

(declare-fun mapNonEmpty!32356 () Bool)

(declare-fun tp!62082 () Bool)

(assert (=> mapNonEmpty!32356 (= mapRes!32356 (and tp!62082 e!529300))))

(declare-fun mapKey!32356 () (_ BitVec 32))

(declare-fun mapRest!32356 () (Array (_ BitVec 32) ValueCell!9707))

(declare-fun mapValue!32356 () ValueCell!9707)

(assert (=> mapNonEmpty!32356 (= (arr!27307 (_values!5596 thiss!1141)) (store mapRest!32356 mapKey!32356 mapValue!32356))))

(declare-fun b!941628 () Bool)

(assert (=> b!941628 (= e!529299 e!529304)))

(declare-fun res!632865 () Bool)

(assert (=> b!941628 (=> (not res!632865) (not e!529304))))

(get-info :version)

(assert (=> b!941628 (= res!632865 ((_ is Found!8961) lt!425155))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56755 (_ BitVec 32)) SeekEntryResult!8961)

(assert (=> b!941628 (= lt!425155 (seekEntry!0 key!756 (_keys!10451 thiss!1141) (mask!27163 thiss!1141)))))

(assert (= (and start!80182 res!632864) b!941620))

(assert (= (and b!941620 res!632862) b!941628))

(assert (= (and b!941628 res!632865) b!941623))

(assert (= (and b!941623 (not res!632863)) b!941619))

(assert (= (and b!941619 (not res!632861)) b!941621))

(assert (= (and b!941621 (not res!632860)) b!941624))

(assert (= (and b!941622 condMapEmpty!32356) mapIsEmpty!32356))

(assert (= (and b!941622 (not condMapEmpty!32356)) mapNonEmpty!32356))

(assert (= (and mapNonEmpty!32356 ((_ is ValueCellFull!9707) mapValue!32356)) b!941626))

(assert (= (and b!941622 ((_ is ValueCellFull!9707) mapDefault!32356)) b!941625))

(assert (= b!941627 b!941622))

(assert (= start!80182 b!941627))

(declare-fun m!877367 () Bool)

(assert (=> b!941623 m!877367))

(declare-fun m!877369 () Bool)

(assert (=> b!941623 m!877369))

(declare-fun m!877371 () Bool)

(assert (=> b!941623 m!877371))

(declare-fun m!877373 () Bool)

(assert (=> mapNonEmpty!32356 m!877373))

(declare-fun m!877375 () Bool)

(assert (=> b!941627 m!877375))

(declare-fun m!877377 () Bool)

(assert (=> b!941627 m!877377))

(declare-fun m!877379 () Bool)

(assert (=> start!80182 m!877379))

(declare-fun m!877381 () Bool)

(assert (=> b!941628 m!877381))

(declare-fun m!877383 () Bool)

(assert (=> b!941624 m!877383))

(declare-fun m!877385 () Bool)

(assert (=> b!941621 m!877385))

(check-sat (not b_next!17869) tp_is_empty!20377 b_and!29291 (not mapNonEmpty!32356) (not start!80182) (not b!941628) (not b!941623) (not b!941627) (not b!941624) (not b!941621))
(check-sat b_and!29291 (not b_next!17869))
