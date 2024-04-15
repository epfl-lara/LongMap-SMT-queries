; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35288 () Bool)

(assert start!35288)

(declare-fun b!353388 () Bool)

(declare-fun e!216451 () Bool)

(declare-fun tp_is_empty!7789 () Bool)

(assert (=> b!353388 (= e!216451 tp_is_empty!7789)))

(declare-fun res!195936 () Bool)

(declare-fun e!216454 () Bool)

(assert (=> start!35288 (=> (not res!195936) (not e!216454))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35288 (= res!195936 (validMask!0 mask!1842))))

(assert (=> start!35288 e!216454))

(assert (=> start!35288 true))

(declare-datatypes ((V!11363 0))(
  ( (V!11364 (val!3939 Int)) )
))
(declare-datatypes ((ValueCell!3551 0))(
  ( (ValueCellFull!3551 (v!6126 V!11363)) (EmptyCell!3551) )
))
(declare-datatypes ((array!19151 0))(
  ( (array!19152 (arr!9072 (Array (_ BitVec 32) ValueCell!3551)) (size!9425 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19151)

(declare-fun e!216453 () Bool)

(declare-fun array_inv!6714 (array!19151) Bool)

(assert (=> start!35288 (and (array_inv!6714 _values!1208) e!216453)))

(declare-datatypes ((array!19153 0))(
  ( (array!19154 (arr!9073 (Array (_ BitVec 32) (_ BitVec 64))) (size!9426 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19153)

(declare-fun array_inv!6715 (array!19153) Bool)

(assert (=> start!35288 (array_inv!6715 _keys!1456)))

(declare-fun mapNonEmpty!13182 () Bool)

(declare-fun mapRes!13182 () Bool)

(declare-fun tp!27078 () Bool)

(declare-fun e!216450 () Bool)

(assert (=> mapNonEmpty!13182 (= mapRes!13182 (and tp!27078 e!216450))))

(declare-fun mapKey!13182 () (_ BitVec 32))

(declare-fun mapValue!13182 () ValueCell!3551)

(declare-fun mapRest!13182 () (Array (_ BitVec 32) ValueCell!3551))

(assert (=> mapNonEmpty!13182 (= (arr!9072 _values!1208) (store mapRest!13182 mapKey!13182 mapValue!13182))))

(declare-fun b!353389 () Bool)

(declare-datatypes ((List!5247 0))(
  ( (Nil!5244) (Cons!5243 (h!6099 (_ BitVec 64)) (t!10388 List!5247)) )
))
(declare-fun noDuplicate!178 (List!5247) Bool)

(assert (=> b!353389 (= e!216454 (not (noDuplicate!178 Nil!5244)))))

(declare-fun mapIsEmpty!13182 () Bool)

(assert (=> mapIsEmpty!13182 mapRes!13182))

(declare-fun b!353390 () Bool)

(assert (=> b!353390 (= e!216453 (and e!216451 mapRes!13182))))

(declare-fun condMapEmpty!13182 () Bool)

(declare-fun mapDefault!13182 () ValueCell!3551)

(assert (=> b!353390 (= condMapEmpty!13182 (= (arr!9072 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3551)) mapDefault!13182)))))

(declare-fun b!353391 () Bool)

(declare-fun res!195937 () Bool)

(assert (=> b!353391 (=> (not res!195937) (not e!216454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19153 (_ BitVec 32)) Bool)

(assert (=> b!353391 (= res!195937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353392 () Bool)

(declare-fun res!195935 () Bool)

(assert (=> b!353392 (=> (not res!195935) (not e!216454))))

(assert (=> b!353392 (= res!195935 (and (bvsle #b00000000000000000000000000000000 (size!9426 _keys!1456)) (bvslt (size!9426 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353393 () Bool)

(assert (=> b!353393 (= e!216450 tp_is_empty!7789)))

(declare-fun b!353394 () Bool)

(declare-fun res!195938 () Bool)

(assert (=> b!353394 (=> (not res!195938) (not e!216454))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353394 (= res!195938 (and (= (size!9425 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9426 _keys!1456) (size!9425 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35288 res!195936) b!353394))

(assert (= (and b!353394 res!195938) b!353391))

(assert (= (and b!353391 res!195937) b!353392))

(assert (= (and b!353392 res!195935) b!353389))

(assert (= (and b!353390 condMapEmpty!13182) mapIsEmpty!13182))

(assert (= (and b!353390 (not condMapEmpty!13182)) mapNonEmpty!13182))

(get-info :version)

(assert (= (and mapNonEmpty!13182 ((_ is ValueCellFull!3551) mapValue!13182)) b!353393))

(assert (= (and b!353390 ((_ is ValueCellFull!3551) mapDefault!13182)) b!353388))

(assert (= start!35288 b!353390))

(declare-fun m!352223 () Bool)

(assert (=> start!35288 m!352223))

(declare-fun m!352225 () Bool)

(assert (=> start!35288 m!352225))

(declare-fun m!352227 () Bool)

(assert (=> start!35288 m!352227))

(declare-fun m!352229 () Bool)

(assert (=> mapNonEmpty!13182 m!352229))

(declare-fun m!352231 () Bool)

(assert (=> b!353389 m!352231))

(declare-fun m!352233 () Bool)

(assert (=> b!353391 m!352233))

(check-sat (not mapNonEmpty!13182) (not b!353391) (not start!35288) tp_is_empty!7789 (not b!353389))
(check-sat)
(get-model)

(declare-fun d!71435 () Bool)

(declare-fun res!195968 () Bool)

(declare-fun e!216492 () Bool)

(assert (=> d!71435 (=> res!195968 e!216492)))

(assert (=> d!71435 (= res!195968 (bvsge #b00000000000000000000000000000000 (size!9426 _keys!1456)))))

(assert (=> d!71435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216492)))

(declare-fun bm!27122 () Bool)

(declare-fun call!27125 () Bool)

(assert (=> bm!27122 (= call!27125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353445 () Bool)

(declare-fun e!216491 () Bool)

(assert (=> b!353445 (= e!216492 e!216491)))

(declare-fun c!53627 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353445 (= c!53627 (validKeyInArray!0 (select (arr!9073 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353446 () Bool)

(declare-fun e!216493 () Bool)

(assert (=> b!353446 (= e!216493 call!27125)))

(declare-fun b!353447 () Bool)

(assert (=> b!353447 (= e!216491 e!216493)))

(declare-fun lt!165366 () (_ BitVec 64))

(assert (=> b!353447 (= lt!165366 (select (arr!9073 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10908 0))(
  ( (Unit!10909) )
))
(declare-fun lt!165364 () Unit!10908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19153 (_ BitVec 64) (_ BitVec 32)) Unit!10908)

(assert (=> b!353447 (= lt!165364 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165366 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353447 (arrayContainsKey!0 _keys!1456 lt!165366 #b00000000000000000000000000000000)))

(declare-fun lt!165365 () Unit!10908)

(assert (=> b!353447 (= lt!165365 lt!165364)))

(declare-fun res!195967 () Bool)

(declare-datatypes ((SeekEntryResult!3483 0))(
  ( (MissingZero!3483 (index!16111 (_ BitVec 32))) (Found!3483 (index!16112 (_ BitVec 32))) (Intermediate!3483 (undefined!4295 Bool) (index!16113 (_ BitVec 32)) (x!35202 (_ BitVec 32))) (Undefined!3483) (MissingVacant!3483 (index!16114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19153 (_ BitVec 32)) SeekEntryResult!3483)

(assert (=> b!353447 (= res!195967 (= (seekEntryOrOpen!0 (select (arr!9073 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3483 #b00000000000000000000000000000000)))))

(assert (=> b!353447 (=> (not res!195967) (not e!216493))))

(declare-fun b!353448 () Bool)

(assert (=> b!353448 (= e!216491 call!27125)))

(assert (= (and d!71435 (not res!195968)) b!353445))

(assert (= (and b!353445 c!53627) b!353447))

(assert (= (and b!353445 (not c!53627)) b!353448))

(assert (= (and b!353447 res!195967) b!353446))

(assert (= (or b!353446 b!353448) bm!27122))

(declare-fun m!352259 () Bool)

(assert (=> bm!27122 m!352259))

(declare-fun m!352261 () Bool)

(assert (=> b!353445 m!352261))

(assert (=> b!353445 m!352261))

(declare-fun m!352263 () Bool)

(assert (=> b!353445 m!352263))

(assert (=> b!353447 m!352261))

(declare-fun m!352265 () Bool)

(assert (=> b!353447 m!352265))

(declare-fun m!352267 () Bool)

(assert (=> b!353447 m!352267))

(assert (=> b!353447 m!352261))

(declare-fun m!352269 () Bool)

(assert (=> b!353447 m!352269))

(assert (=> b!353391 d!71435))

(declare-fun d!71437 () Bool)

(assert (=> d!71437 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35288 d!71437))

(declare-fun d!71439 () Bool)

(assert (=> d!71439 (= (array_inv!6714 _values!1208) (bvsge (size!9425 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35288 d!71439))

(declare-fun d!71441 () Bool)

(assert (=> d!71441 (= (array_inv!6715 _keys!1456) (bvsge (size!9426 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35288 d!71441))

(declare-fun d!71443 () Bool)

(declare-fun res!195973 () Bool)

(declare-fun e!216498 () Bool)

(assert (=> d!71443 (=> res!195973 e!216498)))

(assert (=> d!71443 (= res!195973 ((_ is Nil!5244) Nil!5244))))

(assert (=> d!71443 (= (noDuplicate!178 Nil!5244) e!216498)))

(declare-fun b!353453 () Bool)

(declare-fun e!216499 () Bool)

(assert (=> b!353453 (= e!216498 e!216499)))

(declare-fun res!195974 () Bool)

(assert (=> b!353453 (=> (not res!195974) (not e!216499))))

(declare-fun contains!2370 (List!5247 (_ BitVec 64)) Bool)

(assert (=> b!353453 (= res!195974 (not (contains!2370 (t!10388 Nil!5244) (h!6099 Nil!5244))))))

(declare-fun b!353454 () Bool)

(assert (=> b!353454 (= e!216499 (noDuplicate!178 (t!10388 Nil!5244)))))

(assert (= (and d!71443 (not res!195973)) b!353453))

(assert (= (and b!353453 res!195974) b!353454))

(declare-fun m!352271 () Bool)

(assert (=> b!353453 m!352271))

(declare-fun m!352273 () Bool)

(assert (=> b!353454 m!352273))

(assert (=> b!353389 d!71443))

(declare-fun mapIsEmpty!13191 () Bool)

(declare-fun mapRes!13191 () Bool)

(assert (=> mapIsEmpty!13191 mapRes!13191))

(declare-fun b!353461 () Bool)

(declare-fun e!216505 () Bool)

(assert (=> b!353461 (= e!216505 tp_is_empty!7789)))

(declare-fun mapNonEmpty!13191 () Bool)

(declare-fun tp!27087 () Bool)

(assert (=> mapNonEmpty!13191 (= mapRes!13191 (and tp!27087 e!216505))))

(declare-fun mapKey!13191 () (_ BitVec 32))

(declare-fun mapValue!13191 () ValueCell!3551)

(declare-fun mapRest!13191 () (Array (_ BitVec 32) ValueCell!3551))

(assert (=> mapNonEmpty!13191 (= mapRest!13182 (store mapRest!13191 mapKey!13191 mapValue!13191))))

(declare-fun condMapEmpty!13191 () Bool)

(declare-fun mapDefault!13191 () ValueCell!3551)

(assert (=> mapNonEmpty!13182 (= condMapEmpty!13191 (= mapRest!13182 ((as const (Array (_ BitVec 32) ValueCell!3551)) mapDefault!13191)))))

(declare-fun e!216504 () Bool)

(assert (=> mapNonEmpty!13182 (= tp!27078 (and e!216504 mapRes!13191))))

(declare-fun b!353462 () Bool)

(assert (=> b!353462 (= e!216504 tp_is_empty!7789)))

(assert (= (and mapNonEmpty!13182 condMapEmpty!13191) mapIsEmpty!13191))

(assert (= (and mapNonEmpty!13182 (not condMapEmpty!13191)) mapNonEmpty!13191))

(assert (= (and mapNonEmpty!13191 ((_ is ValueCellFull!3551) mapValue!13191)) b!353461))

(assert (= (and mapNonEmpty!13182 ((_ is ValueCellFull!3551) mapDefault!13191)) b!353462))

(declare-fun m!352275 () Bool)

(assert (=> mapNonEmpty!13191 m!352275))

(check-sat (not b!353454) (not mapNonEmpty!13191) (not bm!27122) tp_is_empty!7789 (not b!353453) (not b!353447) (not b!353445))
(check-sat)
