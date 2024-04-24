; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35274 () Bool)

(assert start!35274)

(declare-fun mapIsEmpty!13170 () Bool)

(declare-fun mapRes!13170 () Bool)

(assert (=> mapIsEmpty!13170 mapRes!13170))

(declare-fun b!353534 () Bool)

(declare-fun res!196028 () Bool)

(declare-fun e!216536 () Bool)

(assert (=> b!353534 (=> (not res!196028) (not e!216536))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((array!19142 0))(
  ( (array!19143 (arr!9068 (Array (_ BitVec 32) (_ BitVec 64))) (size!9420 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19142)

(declare-datatypes ((V!11355 0))(
  ( (V!11356 (val!3936 Int)) )
))
(declare-datatypes ((ValueCell!3548 0))(
  ( (ValueCellFull!3548 (v!6130 V!11355)) (EmptyCell!3548) )
))
(declare-datatypes ((array!19144 0))(
  ( (array!19145 (arr!9069 (Array (_ BitVec 32) ValueCell!3548)) (size!9421 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19144)

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!353534 (= res!196028 (and (= (size!9421 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9420 _keys!1456) (size!9421 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13170 () Bool)

(declare-fun tp!27066 () Bool)

(declare-fun e!216533 () Bool)

(assert (=> mapNonEmpty!13170 (= mapRes!13170 (and tp!27066 e!216533))))

(declare-fun mapKey!13170 () (_ BitVec 32))

(declare-fun mapRest!13170 () (Array (_ BitVec 32) ValueCell!3548))

(declare-fun mapValue!13170 () ValueCell!3548)

(assert (=> mapNonEmpty!13170 (= (arr!9069 _values!1208) (store mapRest!13170 mapKey!13170 mapValue!13170))))

(declare-fun b!353535 () Bool)

(assert (=> b!353535 (= e!216536 (and (bvsle #b00000000000000000000000000000000 (size!9420 _keys!1456)) (bvsge (size!9420 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353536 () Bool)

(declare-fun e!216535 () Bool)

(declare-fun e!216532 () Bool)

(assert (=> b!353536 (= e!216535 (and e!216532 mapRes!13170))))

(declare-fun condMapEmpty!13170 () Bool)

(declare-fun mapDefault!13170 () ValueCell!3548)

(assert (=> b!353536 (= condMapEmpty!13170 (= (arr!9069 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3548)) mapDefault!13170)))))

(declare-fun res!196027 () Bool)

(assert (=> start!35274 (=> (not res!196027) (not e!216536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35274 (= res!196027 (validMask!0 mask!1842))))

(assert (=> start!35274 e!216536))

(assert (=> start!35274 true))

(declare-fun array_inv!6696 (array!19144) Bool)

(assert (=> start!35274 (and (array_inv!6696 _values!1208) e!216535)))

(declare-fun array_inv!6697 (array!19142) Bool)

(assert (=> start!35274 (array_inv!6697 _keys!1456)))

(declare-fun b!353537 () Bool)

(declare-fun tp_is_empty!7783 () Bool)

(assert (=> b!353537 (= e!216532 tp_is_empty!7783)))

(declare-fun b!353538 () Bool)

(declare-fun res!196026 () Bool)

(assert (=> b!353538 (=> (not res!196026) (not e!216536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19142 (_ BitVec 32)) Bool)

(assert (=> b!353538 (= res!196026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353539 () Bool)

(assert (=> b!353539 (= e!216533 tp_is_empty!7783)))

(assert (= (and start!35274 res!196027) b!353534))

(assert (= (and b!353534 res!196028) b!353538))

(assert (= (and b!353538 res!196026) b!353535))

(assert (= (and b!353536 condMapEmpty!13170) mapIsEmpty!13170))

(assert (= (and b!353536 (not condMapEmpty!13170)) mapNonEmpty!13170))

(get-info :version)

(assert (= (and mapNonEmpty!13170 ((_ is ValueCellFull!3548) mapValue!13170)) b!353539))

(assert (= (and b!353536 ((_ is ValueCellFull!3548) mapDefault!13170)) b!353537))

(assert (= start!35274 b!353536))

(declare-fun m!353133 () Bool)

(assert (=> mapNonEmpty!13170 m!353133))

(declare-fun m!353135 () Bool)

(assert (=> start!35274 m!353135))

(declare-fun m!353137 () Bool)

(assert (=> start!35274 m!353137))

(declare-fun m!353139 () Bool)

(assert (=> start!35274 m!353139))

(declare-fun m!353141 () Bool)

(assert (=> b!353538 m!353141))

(check-sat (not start!35274) (not b!353538) (not mapNonEmpty!13170) tp_is_empty!7783)
(check-sat)
(get-model)

(declare-fun d!71659 () Bool)

(assert (=> d!71659 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35274 d!71659))

(declare-fun d!71661 () Bool)

(assert (=> d!71661 (= (array_inv!6696 _values!1208) (bvsge (size!9421 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35274 d!71661))

(declare-fun d!71663 () Bool)

(assert (=> d!71663 (= (array_inv!6697 _keys!1456) (bvsge (size!9420 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35274 d!71663))

(declare-fun b!353584 () Bool)

(declare-fun e!216573 () Bool)

(declare-fun e!216574 () Bool)

(assert (=> b!353584 (= e!216573 e!216574)))

(declare-fun lt!165610 () (_ BitVec 64))

(assert (=> b!353584 (= lt!165610 (select (arr!9068 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10897 0))(
  ( (Unit!10898) )
))
(declare-fun lt!165608 () Unit!10897)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19142 (_ BitVec 64) (_ BitVec 32)) Unit!10897)

(assert (=> b!353584 (= lt!165608 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165610 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353584 (arrayContainsKey!0 _keys!1456 lt!165610 #b00000000000000000000000000000000)))

(declare-fun lt!165609 () Unit!10897)

(assert (=> b!353584 (= lt!165609 lt!165608)))

(declare-fun res!196051 () Bool)

(declare-datatypes ((SeekEntryResult!3436 0))(
  ( (MissingZero!3436 (index!15923 (_ BitVec 32))) (Found!3436 (index!15924 (_ BitVec 32))) (Intermediate!3436 (undefined!4248 Bool) (index!15925 (_ BitVec 32)) (x!35147 (_ BitVec 32))) (Undefined!3436) (MissingVacant!3436 (index!15926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19142 (_ BitVec 32)) SeekEntryResult!3436)

(assert (=> b!353584 (= res!196051 (= (seekEntryOrOpen!0 (select (arr!9068 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3436 #b00000000000000000000000000000000)))))

(assert (=> b!353584 (=> (not res!196051) (not e!216574))))

(declare-fun b!353585 () Bool)

(declare-fun call!27134 () Bool)

(assert (=> b!353585 (= e!216573 call!27134)))

(declare-fun b!353586 () Bool)

(assert (=> b!353586 (= e!216574 call!27134)))

(declare-fun bm!27131 () Bool)

(assert (=> bm!27131 (= call!27134 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353587 () Bool)

(declare-fun e!216575 () Bool)

(assert (=> b!353587 (= e!216575 e!216573)))

(declare-fun c!53672 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353587 (= c!53672 (validKeyInArray!0 (select (arr!9068 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun d!71665 () Bool)

(declare-fun res!196052 () Bool)

(assert (=> d!71665 (=> res!196052 e!216575)))

(assert (=> d!71665 (= res!196052 (bvsge #b00000000000000000000000000000000 (size!9420 _keys!1456)))))

(assert (=> d!71665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216575)))

(assert (= (and d!71665 (not res!196052)) b!353587))

(assert (= (and b!353587 c!53672) b!353584))

(assert (= (and b!353587 (not c!53672)) b!353585))

(assert (= (and b!353584 res!196051) b!353586))

(assert (= (or b!353586 b!353585) bm!27131))

(declare-fun m!353163 () Bool)

(assert (=> b!353584 m!353163))

(declare-fun m!353165 () Bool)

(assert (=> b!353584 m!353165))

(declare-fun m!353167 () Bool)

(assert (=> b!353584 m!353167))

(assert (=> b!353584 m!353163))

(declare-fun m!353169 () Bool)

(assert (=> b!353584 m!353169))

(declare-fun m!353171 () Bool)

(assert (=> bm!27131 m!353171))

(assert (=> b!353587 m!353163))

(assert (=> b!353587 m!353163))

(declare-fun m!353173 () Bool)

(assert (=> b!353587 m!353173))

(assert (=> b!353538 d!71665))

(declare-fun mapIsEmpty!13179 () Bool)

(declare-fun mapRes!13179 () Bool)

(assert (=> mapIsEmpty!13179 mapRes!13179))

(declare-fun condMapEmpty!13179 () Bool)

(declare-fun mapDefault!13179 () ValueCell!3548)

(assert (=> mapNonEmpty!13170 (= condMapEmpty!13179 (= mapRest!13170 ((as const (Array (_ BitVec 32) ValueCell!3548)) mapDefault!13179)))))

(declare-fun e!216581 () Bool)

(assert (=> mapNonEmpty!13170 (= tp!27066 (and e!216581 mapRes!13179))))

(declare-fun b!353595 () Bool)

(assert (=> b!353595 (= e!216581 tp_is_empty!7783)))

(declare-fun b!353594 () Bool)

(declare-fun e!216580 () Bool)

(assert (=> b!353594 (= e!216580 tp_is_empty!7783)))

(declare-fun mapNonEmpty!13179 () Bool)

(declare-fun tp!27075 () Bool)

(assert (=> mapNonEmpty!13179 (= mapRes!13179 (and tp!27075 e!216580))))

(declare-fun mapKey!13179 () (_ BitVec 32))

(declare-fun mapRest!13179 () (Array (_ BitVec 32) ValueCell!3548))

(declare-fun mapValue!13179 () ValueCell!3548)

(assert (=> mapNonEmpty!13179 (= mapRest!13170 (store mapRest!13179 mapKey!13179 mapValue!13179))))

(assert (= (and mapNonEmpty!13170 condMapEmpty!13179) mapIsEmpty!13179))

(assert (= (and mapNonEmpty!13170 (not condMapEmpty!13179)) mapNonEmpty!13179))

(assert (= (and mapNonEmpty!13179 ((_ is ValueCellFull!3548) mapValue!13179)) b!353594))

(assert (= (and mapNonEmpty!13170 ((_ is ValueCellFull!3548) mapDefault!13179)) b!353595))

(declare-fun m!353175 () Bool)

(assert (=> mapNonEmpty!13179 m!353175))

(check-sat (not mapNonEmpty!13179) (not b!353584) tp_is_empty!7783 (not b!353587) (not bm!27131))
(check-sat)
