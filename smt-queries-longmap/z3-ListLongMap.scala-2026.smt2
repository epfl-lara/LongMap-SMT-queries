; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35276 () Bool)

(assert start!35276)

(declare-fun res!196005 () Bool)

(declare-fun e!216525 () Bool)

(assert (=> start!35276 (=> (not res!196005) (not e!216525))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35276 (= res!196005 (validMask!0 mask!1842))))

(assert (=> start!35276 e!216525))

(assert (=> start!35276 true))

(declare-datatypes ((V!11349 0))(
  ( (V!11350 (val!3934 Int)) )
))
(declare-datatypes ((ValueCell!3546 0))(
  ( (ValueCellFull!3546 (v!6127 V!11349)) (EmptyCell!3546) )
))
(declare-datatypes ((array!19147 0))(
  ( (array!19148 (arr!9072 (Array (_ BitVec 32) ValueCell!3546)) (size!9424 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19147)

(declare-fun e!216522 () Bool)

(declare-fun array_inv!6684 (array!19147) Bool)

(assert (=> start!35276 (and (array_inv!6684 _values!1208) e!216522)))

(declare-datatypes ((array!19149 0))(
  ( (array!19150 (arr!9073 (Array (_ BitVec 32) (_ BitVec 64))) (size!9425 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19149)

(declare-fun array_inv!6685 (array!19149) Bool)

(assert (=> start!35276 (array_inv!6685 _keys!1456)))

(declare-fun mapIsEmpty!13161 () Bool)

(declare-fun mapRes!13161 () Bool)

(assert (=> mapIsEmpty!13161 mapRes!13161))

(declare-fun b!353531 () Bool)

(assert (=> b!353531 (= e!216525 (bvsgt #b00000000000000000000000000000000 (size!9425 _keys!1456)))))

(declare-fun b!353532 () Bool)

(declare-fun e!216523 () Bool)

(declare-fun tp_is_empty!7779 () Bool)

(assert (=> b!353532 (= e!216523 tp_is_empty!7779)))

(declare-fun b!353533 () Bool)

(declare-fun res!196006 () Bool)

(assert (=> b!353533 (=> (not res!196006) (not e!216525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19149 (_ BitVec 32)) Bool)

(assert (=> b!353533 (= res!196006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13161 () Bool)

(declare-fun tp!27057 () Bool)

(declare-fun e!216524 () Bool)

(assert (=> mapNonEmpty!13161 (= mapRes!13161 (and tp!27057 e!216524))))

(declare-fun mapKey!13161 () (_ BitVec 32))

(declare-fun mapValue!13161 () ValueCell!3546)

(declare-fun mapRest!13161 () (Array (_ BitVec 32) ValueCell!3546))

(assert (=> mapNonEmpty!13161 (= (arr!9072 _values!1208) (store mapRest!13161 mapKey!13161 mapValue!13161))))

(declare-fun b!353534 () Bool)

(declare-fun res!196007 () Bool)

(assert (=> b!353534 (=> (not res!196007) (not e!216525))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353534 (= res!196007 (and (= (size!9424 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9425 _keys!1456) (size!9424 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353535 () Bool)

(assert (=> b!353535 (= e!216522 (and e!216523 mapRes!13161))))

(declare-fun condMapEmpty!13161 () Bool)

(declare-fun mapDefault!13161 () ValueCell!3546)

(assert (=> b!353535 (= condMapEmpty!13161 (= (arr!9072 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3546)) mapDefault!13161)))))

(declare-fun b!353536 () Bool)

(assert (=> b!353536 (= e!216524 tp_is_empty!7779)))

(assert (= (and start!35276 res!196005) b!353534))

(assert (= (and b!353534 res!196007) b!353533))

(assert (= (and b!353533 res!196006) b!353531))

(assert (= (and b!353535 condMapEmpty!13161) mapIsEmpty!13161))

(assert (= (and b!353535 (not condMapEmpty!13161)) mapNonEmpty!13161))

(get-info :version)

(assert (= (and mapNonEmpty!13161 ((_ is ValueCellFull!3546) mapValue!13161)) b!353536))

(assert (= (and b!353535 ((_ is ValueCellFull!3546) mapDefault!13161)) b!353532))

(assert (= start!35276 b!353535))

(declare-fun m!352875 () Bool)

(assert (=> start!35276 m!352875))

(declare-fun m!352877 () Bool)

(assert (=> start!35276 m!352877))

(declare-fun m!352879 () Bool)

(assert (=> start!35276 m!352879))

(declare-fun m!352881 () Bool)

(assert (=> b!353533 m!352881))

(declare-fun m!352883 () Bool)

(assert (=> mapNonEmpty!13161 m!352883))

(check-sat (not start!35276) (not b!353533) (not mapNonEmpty!13161) tp_is_empty!7779)
(check-sat)
(get-model)

(declare-fun d!71621 () Bool)

(assert (=> d!71621 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35276 d!71621))

(declare-fun d!71623 () Bool)

(assert (=> d!71623 (= (array_inv!6684 _values!1208) (bvsge (size!9424 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35276 d!71623))

(declare-fun d!71625 () Bool)

(assert (=> d!71625 (= (array_inv!6685 _keys!1456) (bvsge (size!9425 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35276 d!71625))

(declare-fun b!353563 () Bool)

(declare-fun e!216549 () Bool)

(declare-fun e!216548 () Bool)

(assert (=> b!353563 (= e!216549 e!216548)))

(declare-fun c!53694 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353563 (= c!53694 (validKeyInArray!0 (select (arr!9073 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353564 () Bool)

(declare-fun e!216547 () Bool)

(declare-fun call!27145 () Bool)

(assert (=> b!353564 (= e!216547 call!27145)))

(declare-fun d!71627 () Bool)

(declare-fun res!196022 () Bool)

(assert (=> d!71627 (=> res!196022 e!216549)))

(assert (=> d!71627 (= res!196022 (bvsge #b00000000000000000000000000000000 (size!9425 _keys!1456)))))

(assert (=> d!71627 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216549)))

(declare-fun b!353565 () Bool)

(assert (=> b!353565 (= e!216548 call!27145)))

(declare-fun b!353566 () Bool)

(assert (=> b!353566 (= e!216548 e!216547)))

(declare-fun lt!165582 () (_ BitVec 64))

(assert (=> b!353566 (= lt!165582 (select (arr!9073 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10916 0))(
  ( (Unit!10917) )
))
(declare-fun lt!165581 () Unit!10916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19149 (_ BitVec 64) (_ BitVec 32)) Unit!10916)

(assert (=> b!353566 (= lt!165581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165582 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353566 (arrayContainsKey!0 _keys!1456 lt!165582 #b00000000000000000000000000000000)))

(declare-fun lt!165583 () Unit!10916)

(assert (=> b!353566 (= lt!165583 lt!165581)))

(declare-fun res!196021 () Bool)

(declare-datatypes ((SeekEntryResult!3486 0))(
  ( (MissingZero!3486 (index!16123 (_ BitVec 32))) (Found!3486 (index!16124 (_ BitVec 32))) (Intermediate!3486 (undefined!4298 Bool) (index!16125 (_ BitVec 32)) (x!35190 (_ BitVec 32))) (Undefined!3486) (MissingVacant!3486 (index!16126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19149 (_ BitVec 32)) SeekEntryResult!3486)

(assert (=> b!353566 (= res!196021 (= (seekEntryOrOpen!0 (select (arr!9073 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3486 #b00000000000000000000000000000000)))))

(assert (=> b!353566 (=> (not res!196021) (not e!216547))))

(declare-fun bm!27142 () Bool)

(assert (=> bm!27142 (= call!27145 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(assert (= (and d!71627 (not res!196022)) b!353563))

(assert (= (and b!353563 c!53694) b!353566))

(assert (= (and b!353563 (not c!53694)) b!353565))

(assert (= (and b!353566 res!196021) b!353564))

(assert (= (or b!353564 b!353565) bm!27142))

(declare-fun m!352895 () Bool)

(assert (=> b!353563 m!352895))

(assert (=> b!353563 m!352895))

(declare-fun m!352897 () Bool)

(assert (=> b!353563 m!352897))

(assert (=> b!353566 m!352895))

(declare-fun m!352899 () Bool)

(assert (=> b!353566 m!352899))

(declare-fun m!352901 () Bool)

(assert (=> b!353566 m!352901))

(assert (=> b!353566 m!352895))

(declare-fun m!352903 () Bool)

(assert (=> b!353566 m!352903))

(declare-fun m!352905 () Bool)

(assert (=> bm!27142 m!352905))

(assert (=> b!353533 d!71627))

(declare-fun b!353574 () Bool)

(declare-fun e!216554 () Bool)

(assert (=> b!353574 (= e!216554 tp_is_empty!7779)))

(declare-fun b!353573 () Bool)

(declare-fun e!216555 () Bool)

(assert (=> b!353573 (= e!216555 tp_is_empty!7779)))

(declare-fun mapNonEmpty!13167 () Bool)

(declare-fun mapRes!13167 () Bool)

(declare-fun tp!27063 () Bool)

(assert (=> mapNonEmpty!13167 (= mapRes!13167 (and tp!27063 e!216555))))

(declare-fun mapValue!13167 () ValueCell!3546)

(declare-fun mapKey!13167 () (_ BitVec 32))

(declare-fun mapRest!13167 () (Array (_ BitVec 32) ValueCell!3546))

(assert (=> mapNonEmpty!13167 (= mapRest!13161 (store mapRest!13167 mapKey!13167 mapValue!13167))))

(declare-fun mapIsEmpty!13167 () Bool)

(assert (=> mapIsEmpty!13167 mapRes!13167))

(declare-fun condMapEmpty!13167 () Bool)

(declare-fun mapDefault!13167 () ValueCell!3546)

(assert (=> mapNonEmpty!13161 (= condMapEmpty!13167 (= mapRest!13161 ((as const (Array (_ BitVec 32) ValueCell!3546)) mapDefault!13167)))))

(assert (=> mapNonEmpty!13161 (= tp!27057 (and e!216554 mapRes!13167))))

(assert (= (and mapNonEmpty!13161 condMapEmpty!13167) mapIsEmpty!13167))

(assert (= (and mapNonEmpty!13161 (not condMapEmpty!13167)) mapNonEmpty!13167))

(assert (= (and mapNonEmpty!13167 ((_ is ValueCellFull!3546) mapValue!13167)) b!353573))

(assert (= (and mapNonEmpty!13161 ((_ is ValueCellFull!3546) mapDefault!13167)) b!353574))

(declare-fun m!352907 () Bool)

(assert (=> mapNonEmpty!13167 m!352907))

(check-sat (not bm!27142) (not b!353563) (not b!353566) tp_is_empty!7779 (not mapNonEmpty!13167))
(check-sat)
