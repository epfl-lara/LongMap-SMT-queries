; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41304 () Bool)

(assert start!41304)

(declare-fun res!276219 () Bool)

(declare-fun e!269356 () Bool)

(assert (=> start!41304 (=> (not res!276219) (not e!269356))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41304 (= res!276219 (validMask!0 mask!1365))))

(assert (=> start!41304 e!269356))

(assert (=> start!41304 true))

(declare-datatypes ((array!28711 0))(
  ( (array!28712 (arr!13791 (Array (_ BitVec 32) (_ BitVec 64))) (size!14144 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28711)

(declare-fun array_inv!10042 (array!28711) Bool)

(assert (=> start!41304 (array_inv!10042 _keys!1025)))

(declare-datatypes ((V!17715 0))(
  ( (V!17716 (val!6273 Int)) )
))
(declare-datatypes ((ValueCell!5885 0))(
  ( (ValueCellFull!5885 (v!8553 V!17715)) (EmptyCell!5885) )
))
(declare-datatypes ((array!28713 0))(
  ( (array!28714 (arr!13792 (Array (_ BitVec 32) ValueCell!5885)) (size!14145 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28713)

(declare-fun e!269355 () Bool)

(declare-fun array_inv!10043 (array!28713) Bool)

(assert (=> start!41304 (and (array_inv!10043 _values!833) e!269355)))

(declare-fun b!461766 () Bool)

(declare-fun e!269357 () Bool)

(declare-fun tp_is_empty!12457 () Bool)

(assert (=> b!461766 (= e!269357 tp_is_empty!12457)))

(declare-fun mapIsEmpty!20350 () Bool)

(declare-fun mapRes!20350 () Bool)

(assert (=> mapIsEmpty!20350 mapRes!20350))

(declare-fun b!461767 () Bool)

(declare-fun res!276217 () Bool)

(assert (=> b!461767 (=> (not res!276217) (not e!269356))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461767 (= res!276217 (and (= (size!14145 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14144 _keys!1025) (size!14145 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!461768 () Bool)

(declare-fun e!269359 () Bool)

(assert (=> b!461768 (= e!269355 (and e!269359 mapRes!20350))))

(declare-fun condMapEmpty!20350 () Bool)

(declare-fun mapDefault!20350 () ValueCell!5885)

(assert (=> b!461768 (= condMapEmpty!20350 (= (arr!13792 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5885)) mapDefault!20350)))))

(declare-fun mapNonEmpty!20350 () Bool)

(declare-fun tp!39169 () Bool)

(assert (=> mapNonEmpty!20350 (= mapRes!20350 (and tp!39169 e!269357))))

(declare-fun mapRest!20350 () (Array (_ BitVec 32) ValueCell!5885))

(declare-fun mapValue!20350 () ValueCell!5885)

(declare-fun mapKey!20350 () (_ BitVec 32))

(assert (=> mapNonEmpty!20350 (= (arr!13792 _values!833) (store mapRest!20350 mapKey!20350 mapValue!20350))))

(declare-fun b!461769 () Bool)

(declare-fun res!276218 () Bool)

(assert (=> b!461769 (=> (not res!276218) (not e!269356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28711 (_ BitVec 32)) Bool)

(assert (=> b!461769 (= res!276218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!461770 () Bool)

(assert (=> b!461770 (= e!269359 tp_is_empty!12457)))

(declare-fun b!461771 () Bool)

(declare-datatypes ((List!8353 0))(
  ( (Nil!8350) (Cons!8349 (h!9205 (_ BitVec 64)) (t!14288 List!8353)) )
))
(declare-fun noDuplicate!204 (List!8353) Bool)

(assert (=> b!461771 (= e!269356 (not (noDuplicate!204 Nil!8350)))))

(declare-fun b!461772 () Bool)

(declare-fun res!276216 () Bool)

(assert (=> b!461772 (=> (not res!276216) (not e!269356))))

(assert (=> b!461772 (= res!276216 (and (bvsle #b00000000000000000000000000000000 (size!14144 _keys!1025)) (bvslt (size!14144 _keys!1025) #b01111111111111111111111111111111)))))

(assert (= (and start!41304 res!276219) b!461767))

(assert (= (and b!461767 res!276217) b!461769))

(assert (= (and b!461769 res!276218) b!461772))

(assert (= (and b!461772 res!276216) b!461771))

(assert (= (and b!461768 condMapEmpty!20350) mapIsEmpty!20350))

(assert (= (and b!461768 (not condMapEmpty!20350)) mapNonEmpty!20350))

(get-info :version)

(assert (= (and mapNonEmpty!20350 ((_ is ValueCellFull!5885) mapValue!20350)) b!461766))

(assert (= (and b!461768 ((_ is ValueCellFull!5885) mapDefault!20350)) b!461770))

(assert (= start!41304 b!461768))

(declare-fun m!444381 () Bool)

(assert (=> start!41304 m!444381))

(declare-fun m!444383 () Bool)

(assert (=> start!41304 m!444383))

(declare-fun m!444385 () Bool)

(assert (=> start!41304 m!444385))

(declare-fun m!444387 () Bool)

(assert (=> mapNonEmpty!20350 m!444387))

(declare-fun m!444389 () Bool)

(assert (=> b!461769 m!444389))

(declare-fun m!444391 () Bool)

(assert (=> b!461771 m!444391))

(check-sat (not mapNonEmpty!20350) tp_is_empty!12457 (not b!461771) (not start!41304) (not b!461769))
(check-sat)
(get-model)

(declare-fun d!74727 () Bool)

(assert (=> d!74727 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41304 d!74727))

(declare-fun d!74729 () Bool)

(assert (=> d!74729 (= (array_inv!10042 _keys!1025) (bvsge (size!14144 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41304 d!74729))

(declare-fun d!74731 () Bool)

(assert (=> d!74731 (= (array_inv!10043 _values!833) (bvsge (size!14145 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41304 d!74731))

(declare-fun d!74733 () Bool)

(declare-fun res!276248 () Bool)

(declare-fun e!269394 () Bool)

(assert (=> d!74733 (=> res!276248 e!269394)))

(assert (=> d!74733 (= res!276248 ((_ is Nil!8350) Nil!8350))))

(assert (=> d!74733 (= (noDuplicate!204 Nil!8350) e!269394)))

(declare-fun b!461819 () Bool)

(declare-fun e!269395 () Bool)

(assert (=> b!461819 (= e!269394 e!269395)))

(declare-fun res!276249 () Bool)

(assert (=> b!461819 (=> (not res!276249) (not e!269395))))

(declare-fun contains!2504 (List!8353 (_ BitVec 64)) Bool)

(assert (=> b!461819 (= res!276249 (not (contains!2504 (t!14288 Nil!8350) (h!9205 Nil!8350))))))

(declare-fun b!461820 () Bool)

(assert (=> b!461820 (= e!269395 (noDuplicate!204 (t!14288 Nil!8350)))))

(assert (= (and d!74733 (not res!276248)) b!461819))

(assert (= (and b!461819 res!276249) b!461820))

(declare-fun m!444417 () Bool)

(assert (=> b!461819 m!444417))

(declare-fun m!444419 () Bool)

(assert (=> b!461820 m!444419))

(assert (=> b!461771 d!74733))

(declare-fun d!74735 () Bool)

(declare-fun res!276255 () Bool)

(declare-fun e!269404 () Bool)

(assert (=> d!74735 (=> res!276255 e!269404)))

(assert (=> d!74735 (= res!276255 (bvsge #b00000000000000000000000000000000 (size!14144 _keys!1025)))))

(assert (=> d!74735 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269404)))

(declare-fun bm!30172 () Bool)

(declare-fun call!30175 () Bool)

(assert (=> bm!30172 (= call!30175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!461829 () Bool)

(declare-fun e!269402 () Bool)

(assert (=> b!461829 (= e!269402 call!30175)))

(declare-fun b!461830 () Bool)

(assert (=> b!461830 (= e!269404 e!269402)))

(declare-fun c!56554 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461830 (= c!56554 (validKeyInArray!0 (select (arr!13791 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!461831 () Bool)

(declare-fun e!269403 () Bool)

(assert (=> b!461831 (= e!269403 call!30175)))

(declare-fun b!461832 () Bool)

(assert (=> b!461832 (= e!269402 e!269403)))

(declare-fun lt!208927 () (_ BitVec 64))

(assert (=> b!461832 (= lt!208927 (select (arr!13791 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13412 0))(
  ( (Unit!13413) )
))
(declare-fun lt!208925 () Unit!13412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28711 (_ BitVec 64) (_ BitVec 32)) Unit!13412)

(assert (=> b!461832 (= lt!208925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!208927 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461832 (arrayContainsKey!0 _keys!1025 lt!208927 #b00000000000000000000000000000000)))

(declare-fun lt!208926 () Unit!13412)

(assert (=> b!461832 (= lt!208926 lt!208925)))

(declare-fun res!276254 () Bool)

(declare-datatypes ((SeekEntryResult!3535 0))(
  ( (MissingZero!3535 (index!16319 (_ BitVec 32))) (Found!3535 (index!16320 (_ BitVec 32))) (Intermediate!3535 (undefined!4347 Bool) (index!16321 (_ BitVec 32)) (x!43064 (_ BitVec 32))) (Undefined!3535) (MissingVacant!3535 (index!16322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28711 (_ BitVec 32)) SeekEntryResult!3535)

(assert (=> b!461832 (= res!276254 (= (seekEntryOrOpen!0 (select (arr!13791 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3535 #b00000000000000000000000000000000)))))

(assert (=> b!461832 (=> (not res!276254) (not e!269403))))

(assert (= (and d!74735 (not res!276255)) b!461830))

(assert (= (and b!461830 c!56554) b!461832))

(assert (= (and b!461830 (not c!56554)) b!461829))

(assert (= (and b!461832 res!276254) b!461831))

(assert (= (or b!461831 b!461829) bm!30172))

(declare-fun m!444421 () Bool)

(assert (=> bm!30172 m!444421))

(declare-fun m!444423 () Bool)

(assert (=> b!461830 m!444423))

(assert (=> b!461830 m!444423))

(declare-fun m!444425 () Bool)

(assert (=> b!461830 m!444425))

(assert (=> b!461832 m!444423))

(declare-fun m!444427 () Bool)

(assert (=> b!461832 m!444427))

(declare-fun m!444429 () Bool)

(assert (=> b!461832 m!444429))

(assert (=> b!461832 m!444423))

(declare-fun m!444431 () Bool)

(assert (=> b!461832 m!444431))

(assert (=> b!461769 d!74735))

(declare-fun b!461840 () Bool)

(declare-fun e!269410 () Bool)

(assert (=> b!461840 (= e!269410 tp_is_empty!12457)))

(declare-fun b!461839 () Bool)

(declare-fun e!269409 () Bool)

(assert (=> b!461839 (= e!269409 tp_is_empty!12457)))

(declare-fun mapNonEmpty!20359 () Bool)

(declare-fun mapRes!20359 () Bool)

(declare-fun tp!39178 () Bool)

(assert (=> mapNonEmpty!20359 (= mapRes!20359 (and tp!39178 e!269409))))

(declare-fun mapValue!20359 () ValueCell!5885)

(declare-fun mapRest!20359 () (Array (_ BitVec 32) ValueCell!5885))

(declare-fun mapKey!20359 () (_ BitVec 32))

(assert (=> mapNonEmpty!20359 (= mapRest!20350 (store mapRest!20359 mapKey!20359 mapValue!20359))))

(declare-fun mapIsEmpty!20359 () Bool)

(assert (=> mapIsEmpty!20359 mapRes!20359))

(declare-fun condMapEmpty!20359 () Bool)

(declare-fun mapDefault!20359 () ValueCell!5885)

(assert (=> mapNonEmpty!20350 (= condMapEmpty!20359 (= mapRest!20350 ((as const (Array (_ BitVec 32) ValueCell!5885)) mapDefault!20359)))))

(assert (=> mapNonEmpty!20350 (= tp!39169 (and e!269410 mapRes!20359))))

(assert (= (and mapNonEmpty!20350 condMapEmpty!20359) mapIsEmpty!20359))

(assert (= (and mapNonEmpty!20350 (not condMapEmpty!20359)) mapNonEmpty!20359))

(assert (= (and mapNonEmpty!20359 ((_ is ValueCellFull!5885) mapValue!20359)) b!461839))

(assert (= (and mapNonEmpty!20350 ((_ is ValueCellFull!5885) mapDefault!20359)) b!461840))

(declare-fun m!444433 () Bool)

(assert (=> mapNonEmpty!20359 m!444433))

(check-sat tp_is_empty!12457 (not bm!30172) (not b!461819) (not b!461832) (not b!461830) (not b!461820) (not mapNonEmpty!20359))
(check-sat)
