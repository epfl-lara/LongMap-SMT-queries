; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69982 () Bool)

(assert start!69982)

(declare-fun b!812956 () Bool)

(declare-fun e!450280 () Bool)

(declare-fun tp_is_empty!13999 () Bool)

(assert (=> b!812956 (= e!450280 tp_is_empty!13999)))

(declare-fun res!555319 () Bool)

(declare-fun e!450281 () Bool)

(assert (=> start!69982 (=> (not res!555319) (not e!450281))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69982 (= res!555319 (validMask!0 mask!1312))))

(assert (=> start!69982 e!450281))

(declare-datatypes ((array!44219 0))(
  ( (array!44220 (arr!21170 (Array (_ BitVec 32) (_ BitVec 64))) (size!21590 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44219)

(declare-fun array_inv!17021 (array!44219) Bool)

(assert (=> start!69982 (array_inv!17021 _keys!976)))

(assert (=> start!69982 true))

(declare-datatypes ((V!23667 0))(
  ( (V!23668 (val!7047 Int)) )
))
(declare-datatypes ((ValueCell!6584 0))(
  ( (ValueCellFull!6584 (v!9473 V!23667)) (EmptyCell!6584) )
))
(declare-datatypes ((array!44221 0))(
  ( (array!44222 (arr!21171 (Array (_ BitVec 32) ValueCell!6584)) (size!21591 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44221)

(declare-fun e!450278 () Bool)

(declare-fun array_inv!17022 (array!44221) Bool)

(assert (=> start!69982 (and (array_inv!17022 _values!788) e!450278)))

(declare-fun b!812957 () Bool)

(declare-fun res!555320 () Bool)

(assert (=> b!812957 (=> (not res!555320) (not e!450281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44219 (_ BitVec 32)) Bool)

(assert (=> b!812957 (= res!555320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812958 () Bool)

(declare-fun res!555318 () Bool)

(assert (=> b!812958 (=> (not res!555318) (not e!450281))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812958 (= res!555318 (and (= (size!21591 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21590 _keys!976) (size!21591 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812959 () Bool)

(declare-fun e!450279 () Bool)

(assert (=> b!812959 (= e!450279 tp_is_empty!13999)))

(declare-fun b!812960 () Bool)

(declare-fun mapRes!22564 () Bool)

(assert (=> b!812960 (= e!450278 (and e!450280 mapRes!22564))))

(declare-fun condMapEmpty!22564 () Bool)

(declare-fun mapDefault!22564 () ValueCell!6584)

(assert (=> b!812960 (= condMapEmpty!22564 (= (arr!21171 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6584)) mapDefault!22564)))))

(declare-fun mapNonEmpty!22564 () Bool)

(declare-fun tp!43672 () Bool)

(assert (=> mapNonEmpty!22564 (= mapRes!22564 (and tp!43672 e!450279))))

(declare-fun mapValue!22564 () ValueCell!6584)

(declare-fun mapKey!22564 () (_ BitVec 32))

(declare-fun mapRest!22564 () (Array (_ BitVec 32) ValueCell!6584))

(assert (=> mapNonEmpty!22564 (= (arr!21171 _values!788) (store mapRest!22564 mapKey!22564 mapValue!22564))))

(declare-fun b!812961 () Bool)

(assert (=> b!812961 (= e!450281 (and (bvsle #b00000000000000000000000000000000 (size!21590 _keys!976)) (bvsge (size!21590 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!22564 () Bool)

(assert (=> mapIsEmpty!22564 mapRes!22564))

(assert (= (and start!69982 res!555319) b!812958))

(assert (= (and b!812958 res!555318) b!812957))

(assert (= (and b!812957 res!555320) b!812961))

(assert (= (and b!812960 condMapEmpty!22564) mapIsEmpty!22564))

(assert (= (and b!812960 (not condMapEmpty!22564)) mapNonEmpty!22564))

(get-info :version)

(assert (= (and mapNonEmpty!22564 ((_ is ValueCellFull!6584) mapValue!22564)) b!812959))

(assert (= (and b!812960 ((_ is ValueCellFull!6584) mapDefault!22564)) b!812956))

(assert (= start!69982 b!812960))

(declare-fun m!755869 () Bool)

(assert (=> start!69982 m!755869))

(declare-fun m!755871 () Bool)

(assert (=> start!69982 m!755871))

(declare-fun m!755873 () Bool)

(assert (=> start!69982 m!755873))

(declare-fun m!755875 () Bool)

(assert (=> b!812957 m!755875))

(declare-fun m!755877 () Bool)

(assert (=> mapNonEmpty!22564 m!755877))

(check-sat (not b!812957) (not start!69982) (not mapNonEmpty!22564) tp_is_empty!13999)
(check-sat)
(get-model)

(declare-fun b!813006 () Bool)

(declare-fun e!450319 () Bool)

(declare-fun call!35523 () Bool)

(assert (=> b!813006 (= e!450319 call!35523)))

(declare-fun b!813007 () Bool)

(declare-fun e!450320 () Bool)

(assert (=> b!813007 (= e!450320 e!450319)))

(declare-fun c!89171 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!813007 (= c!89171 (validKeyInArray!0 (select (arr!21170 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35520 () Bool)

(assert (=> bm!35520 (= call!35523 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!813009 () Bool)

(declare-fun e!450321 () Bool)

(assert (=> b!813009 (= e!450321 call!35523)))

(declare-fun b!813008 () Bool)

(assert (=> b!813008 (= e!450319 e!450321)))

(declare-fun lt!364449 () (_ BitVec 64))

(assert (=> b!813008 (= lt!364449 (select (arr!21170 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27689 0))(
  ( (Unit!27690) )
))
(declare-fun lt!364451 () Unit!27689)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44219 (_ BitVec 64) (_ BitVec 32)) Unit!27689)

(assert (=> b!813008 (= lt!364451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364449 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!813008 (arrayContainsKey!0 _keys!976 lt!364449 #b00000000000000000000000000000000)))

(declare-fun lt!364450 () Unit!27689)

(assert (=> b!813008 (= lt!364450 lt!364451)))

(declare-fun res!555344 () Bool)

(declare-datatypes ((SeekEntryResult!8666 0))(
  ( (MissingZero!8666 (index!37035 (_ BitVec 32))) (Found!8666 (index!37036 (_ BitVec 32))) (Intermediate!8666 (undefined!9478 Bool) (index!37037 (_ BitVec 32)) (x!68145 (_ BitVec 32))) (Undefined!8666) (MissingVacant!8666 (index!37038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44219 (_ BitVec 32)) SeekEntryResult!8666)

(assert (=> b!813008 (= res!555344 (= (seekEntryOrOpen!0 (select (arr!21170 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8666 #b00000000000000000000000000000000)))))

(assert (=> b!813008 (=> (not res!555344) (not e!450321))))

(declare-fun d!104621 () Bool)

(declare-fun res!555343 () Bool)

(assert (=> d!104621 (=> res!555343 e!450320)))

(assert (=> d!104621 (= res!555343 (bvsge #b00000000000000000000000000000000 (size!21590 _keys!976)))))

(assert (=> d!104621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450320)))

(assert (= (and d!104621 (not res!555343)) b!813007))

(assert (= (and b!813007 c!89171) b!813008))

(assert (= (and b!813007 (not c!89171)) b!813006))

(assert (= (and b!813008 res!555344) b!813009))

(assert (= (or b!813009 b!813006) bm!35520))

(declare-fun m!755899 () Bool)

(assert (=> b!813007 m!755899))

(assert (=> b!813007 m!755899))

(declare-fun m!755901 () Bool)

(assert (=> b!813007 m!755901))

(declare-fun m!755903 () Bool)

(assert (=> bm!35520 m!755903))

(assert (=> b!813008 m!755899))

(declare-fun m!755905 () Bool)

(assert (=> b!813008 m!755905))

(declare-fun m!755907 () Bool)

(assert (=> b!813008 m!755907))

(assert (=> b!813008 m!755899))

(declare-fun m!755909 () Bool)

(assert (=> b!813008 m!755909))

(assert (=> b!812957 d!104621))

(declare-fun d!104623 () Bool)

(assert (=> d!104623 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69982 d!104623))

(declare-fun d!104625 () Bool)

(assert (=> d!104625 (= (array_inv!17021 _keys!976) (bvsge (size!21590 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69982 d!104625))

(declare-fun d!104627 () Bool)

(assert (=> d!104627 (= (array_inv!17022 _values!788) (bvsge (size!21591 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69982 d!104627))

(declare-fun b!813016 () Bool)

(declare-fun e!450326 () Bool)

(assert (=> b!813016 (= e!450326 tp_is_empty!13999)))

(declare-fun mapIsEmpty!22573 () Bool)

(declare-fun mapRes!22573 () Bool)

(assert (=> mapIsEmpty!22573 mapRes!22573))

(declare-fun mapNonEmpty!22573 () Bool)

(declare-fun tp!43681 () Bool)

(assert (=> mapNonEmpty!22573 (= mapRes!22573 (and tp!43681 e!450326))))

(declare-fun mapRest!22573 () (Array (_ BitVec 32) ValueCell!6584))

(declare-fun mapValue!22573 () ValueCell!6584)

(declare-fun mapKey!22573 () (_ BitVec 32))

(assert (=> mapNonEmpty!22573 (= mapRest!22564 (store mapRest!22573 mapKey!22573 mapValue!22573))))

(declare-fun b!813017 () Bool)

(declare-fun e!450327 () Bool)

(assert (=> b!813017 (= e!450327 tp_is_empty!13999)))

(declare-fun condMapEmpty!22573 () Bool)

(declare-fun mapDefault!22573 () ValueCell!6584)

(assert (=> mapNonEmpty!22564 (= condMapEmpty!22573 (= mapRest!22564 ((as const (Array (_ BitVec 32) ValueCell!6584)) mapDefault!22573)))))

(assert (=> mapNonEmpty!22564 (= tp!43672 (and e!450327 mapRes!22573))))

(assert (= (and mapNonEmpty!22564 condMapEmpty!22573) mapIsEmpty!22573))

(assert (= (and mapNonEmpty!22564 (not condMapEmpty!22573)) mapNonEmpty!22573))

(assert (= (and mapNonEmpty!22573 ((_ is ValueCellFull!6584) mapValue!22573)) b!813016))

(assert (= (and mapNonEmpty!22564 ((_ is ValueCellFull!6584) mapDefault!22573)) b!813017))

(declare-fun m!755911 () Bool)

(assert (=> mapNonEmpty!22573 m!755911))

(check-sat (not bm!35520) (not mapNonEmpty!22573) (not b!813008) (not b!813007) tp_is_empty!13999)
(check-sat)
