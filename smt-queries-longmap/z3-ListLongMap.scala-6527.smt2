; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83016 () Bool)

(assert start!83016)

(declare-fun b!968564 () Bool)

(declare-fun e!545909 () Bool)

(declare-datatypes ((List!20036 0))(
  ( (Nil!20033) (Cons!20032 (h!21194 (_ BitVec 64)) (t!28390 List!20036)) )
))
(declare-fun contains!5524 (List!20036 (_ BitVec 64)) Bool)

(assert (=> b!968564 (= e!545909 (contains!5524 Nil!20033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968565 () Bool)

(declare-fun res!648402 () Bool)

(declare-fun e!545908 () Bool)

(assert (=> b!968565 (=> (not res!648402) (not e!545908))))

(declare-datatypes ((array!59876 0))(
  ( (array!59877 (arr!28803 (Array (_ BitVec 32) (_ BitVec 64))) (size!29284 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59876)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59876 (_ BitVec 32)) Bool)

(assert (=> b!968565 (= res!648402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968566 () Bool)

(declare-fun e!545907 () Bool)

(declare-fun e!545911 () Bool)

(declare-fun mapRes!34912 () Bool)

(assert (=> b!968566 (= e!545907 (and e!545911 mapRes!34912))))

(declare-fun condMapEmpty!34912 () Bool)

(declare-datatypes ((V!34233 0))(
  ( (V!34234 (val!11019 Int)) )
))
(declare-datatypes ((ValueCell!10487 0))(
  ( (ValueCellFull!10487 (v!13576 V!34233)) (EmptyCell!10487) )
))
(declare-datatypes ((array!59878 0))(
  ( (array!59879 (arr!28804 (Array (_ BitVec 32) ValueCell!10487)) (size!29285 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59878)

(declare-fun mapDefault!34912 () ValueCell!10487)

(assert (=> b!968566 (= condMapEmpty!34912 (= (arr!28804 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10487)) mapDefault!34912)))))

(declare-fun b!968567 () Bool)

(declare-fun res!648400 () Bool)

(assert (=> b!968567 (=> (not res!648400) (not e!545908))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968567 (= res!648400 (and (= (size!29285 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29284 _keys!1717) (size!29285 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34912 () Bool)

(declare-fun tp!66481 () Bool)

(declare-fun e!545910 () Bool)

(assert (=> mapNonEmpty!34912 (= mapRes!34912 (and tp!66481 e!545910))))

(declare-fun mapValue!34912 () ValueCell!10487)

(declare-fun mapKey!34912 () (_ BitVec 32))

(declare-fun mapRest!34912 () (Array (_ BitVec 32) ValueCell!10487))

(assert (=> mapNonEmpty!34912 (= (arr!28804 _values!1425) (store mapRest!34912 mapKey!34912 mapValue!34912))))

(declare-fun mapIsEmpty!34912 () Bool)

(assert (=> mapIsEmpty!34912 mapRes!34912))

(declare-fun b!968569 () Bool)

(declare-fun tp_is_empty!21937 () Bool)

(assert (=> b!968569 (= e!545910 tp_is_empty!21937)))

(declare-fun b!968570 () Bool)

(declare-fun res!648399 () Bool)

(assert (=> b!968570 (=> (not res!648399) (not e!545908))))

(declare-fun noDuplicate!1380 (List!20036) Bool)

(assert (=> b!968570 (= res!648399 (noDuplicate!1380 Nil!20033))))

(declare-fun b!968571 () Bool)

(declare-fun res!648403 () Bool)

(assert (=> b!968571 (=> (not res!648403) (not e!545908))))

(assert (=> b!968571 (= res!648403 (and (bvsle #b00000000000000000000000000000000 (size!29284 _keys!1717)) (bvslt (size!29284 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun b!968572 () Bool)

(assert (=> b!968572 (= e!545908 e!545909)))

(declare-fun res!648401 () Bool)

(assert (=> b!968572 (=> res!648401 e!545909)))

(assert (=> b!968572 (= res!648401 (contains!5524 Nil!20033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968568 () Bool)

(assert (=> b!968568 (= e!545911 tp_is_empty!21937)))

(declare-fun res!648404 () Bool)

(assert (=> start!83016 (=> (not res!648404) (not e!545908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83016 (= res!648404 (validMask!0 mask!2147))))

(assert (=> start!83016 e!545908))

(assert (=> start!83016 true))

(declare-fun array_inv!22361 (array!59878) Bool)

(assert (=> start!83016 (and (array_inv!22361 _values!1425) e!545907)))

(declare-fun array_inv!22362 (array!59876) Bool)

(assert (=> start!83016 (array_inv!22362 _keys!1717)))

(assert (= (and start!83016 res!648404) b!968567))

(assert (= (and b!968567 res!648400) b!968565))

(assert (= (and b!968565 res!648402) b!968571))

(assert (= (and b!968571 res!648403) b!968570))

(assert (= (and b!968570 res!648399) b!968572))

(assert (= (and b!968572 (not res!648401)) b!968564))

(assert (= (and b!968566 condMapEmpty!34912) mapIsEmpty!34912))

(assert (= (and b!968566 (not condMapEmpty!34912)) mapNonEmpty!34912))

(get-info :version)

(assert (= (and mapNonEmpty!34912 ((_ is ValueCellFull!10487) mapValue!34912)) b!968569))

(assert (= (and b!968566 ((_ is ValueCellFull!10487) mapDefault!34912)) b!968568))

(assert (= start!83016 b!968566))

(declare-fun m!896257 () Bool)

(assert (=> start!83016 m!896257))

(declare-fun m!896259 () Bool)

(assert (=> start!83016 m!896259))

(declare-fun m!896261 () Bool)

(assert (=> start!83016 m!896261))

(declare-fun m!896263 () Bool)

(assert (=> mapNonEmpty!34912 m!896263))

(declare-fun m!896265 () Bool)

(assert (=> b!968570 m!896265))

(declare-fun m!896267 () Bool)

(assert (=> b!968572 m!896267))

(declare-fun m!896269 () Bool)

(assert (=> b!968564 m!896269))

(declare-fun m!896271 () Bool)

(assert (=> b!968565 m!896271))

(check-sat (not b!968564) (not mapNonEmpty!34912) (not start!83016) (not b!968570) (not b!968572) (not b!968565) tp_is_empty!21937)
(check-sat)
(get-model)

(declare-fun d!116075 () Bool)

(declare-fun lt!431315 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!413 (List!20036) (InoxSet (_ BitVec 64)))

(assert (=> d!116075 (= lt!431315 (select (content!413 Nil!20033) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!545952 () Bool)

(assert (=> d!116075 (= lt!431315 e!545952)))

(declare-fun res!648446 () Bool)

(assert (=> d!116075 (=> (not res!648446) (not e!545952))))

(assert (=> d!116075 (= res!648446 ((_ is Cons!20032) Nil!20033))))

(assert (=> d!116075 (= (contains!5524 Nil!20033 #b1000000000000000000000000000000000000000000000000000000000000000) lt!431315)))

(declare-fun b!968631 () Bool)

(declare-fun e!545953 () Bool)

(assert (=> b!968631 (= e!545952 e!545953)))

(declare-fun res!648445 () Bool)

(assert (=> b!968631 (=> res!648445 e!545953)))

(assert (=> b!968631 (= res!648445 (= (h!21194 Nil!20033) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968632 () Bool)

(assert (=> b!968632 (= e!545953 (contains!5524 (t!28390 Nil!20033) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116075 res!648446) b!968631))

(assert (= (and b!968631 (not res!648445)) b!968632))

(declare-fun m!896305 () Bool)

(assert (=> d!116075 m!896305))

(declare-fun m!896307 () Bool)

(assert (=> d!116075 m!896307))

(declare-fun m!896309 () Bool)

(assert (=> b!968632 m!896309))

(assert (=> b!968564 d!116075))

(declare-fun bm!41712 () Bool)

(declare-fun call!41715 () Bool)

(assert (=> bm!41712 (= call!41715 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun b!968641 () Bool)

(declare-fun e!545960 () Bool)

(declare-fun e!545961 () Bool)

(assert (=> b!968641 (= e!545960 e!545961)))

(declare-fun lt!431324 () (_ BitVec 64))

(assert (=> b!968641 (= lt!431324 (select (arr!28803 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32236 0))(
  ( (Unit!32237) )
))
(declare-fun lt!431322 () Unit!32236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59876 (_ BitVec 64) (_ BitVec 32)) Unit!32236)

(assert (=> b!968641 (= lt!431322 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431324 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968641 (arrayContainsKey!0 _keys!1717 lt!431324 #b00000000000000000000000000000000)))

(declare-fun lt!431323 () Unit!32236)

(assert (=> b!968641 (= lt!431323 lt!431322)))

(declare-fun res!648451 () Bool)

(declare-datatypes ((SeekEntryResult!9195 0))(
  ( (MissingZero!9195 (index!39151 (_ BitVec 32))) (Found!9195 (index!39152 (_ BitVec 32))) (Intermediate!9195 (undefined!10007 Bool) (index!39153 (_ BitVec 32)) (x!83640 (_ BitVec 32))) (Undefined!9195) (MissingVacant!9195 (index!39154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59876 (_ BitVec 32)) SeekEntryResult!9195)

(assert (=> b!968641 (= res!648451 (= (seekEntryOrOpen!0 (select (arr!28803 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9195 #b00000000000000000000000000000000)))))

(assert (=> b!968641 (=> (not res!648451) (not e!545961))))

(declare-fun b!968642 () Bool)

(assert (=> b!968642 (= e!545960 call!41715)))

(declare-fun b!968643 () Bool)

(declare-fun e!545962 () Bool)

(assert (=> b!968643 (= e!545962 e!545960)))

(declare-fun c!99864 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968643 (= c!99864 (validKeyInArray!0 (select (arr!28803 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun d!116077 () Bool)

(declare-fun res!648452 () Bool)

(assert (=> d!116077 (=> res!648452 e!545962)))

(assert (=> d!116077 (= res!648452 (bvsge #b00000000000000000000000000000000 (size!29284 _keys!1717)))))

(assert (=> d!116077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!545962)))

(declare-fun b!968644 () Bool)

(assert (=> b!968644 (= e!545961 call!41715)))

(assert (= (and d!116077 (not res!648452)) b!968643))

(assert (= (and b!968643 c!99864) b!968641))

(assert (= (and b!968643 (not c!99864)) b!968642))

(assert (= (and b!968641 res!648451) b!968644))

(assert (= (or b!968644 b!968642) bm!41712))

(declare-fun m!896311 () Bool)

(assert (=> bm!41712 m!896311))

(declare-fun m!896313 () Bool)

(assert (=> b!968641 m!896313))

(declare-fun m!896315 () Bool)

(assert (=> b!968641 m!896315))

(declare-fun m!896317 () Bool)

(assert (=> b!968641 m!896317))

(assert (=> b!968641 m!896313))

(declare-fun m!896319 () Bool)

(assert (=> b!968641 m!896319))

(assert (=> b!968643 m!896313))

(assert (=> b!968643 m!896313))

(declare-fun m!896321 () Bool)

(assert (=> b!968643 m!896321))

(assert (=> b!968565 d!116077))

(declare-fun d!116079 () Bool)

(declare-fun res!648457 () Bool)

(declare-fun e!545967 () Bool)

(assert (=> d!116079 (=> res!648457 e!545967)))

(assert (=> d!116079 (= res!648457 ((_ is Nil!20033) Nil!20033))))

(assert (=> d!116079 (= (noDuplicate!1380 Nil!20033) e!545967)))

(declare-fun b!968649 () Bool)

(declare-fun e!545968 () Bool)

(assert (=> b!968649 (= e!545967 e!545968)))

(declare-fun res!648458 () Bool)

(assert (=> b!968649 (=> (not res!648458) (not e!545968))))

(assert (=> b!968649 (= res!648458 (not (contains!5524 (t!28390 Nil!20033) (h!21194 Nil!20033))))))

(declare-fun b!968650 () Bool)

(assert (=> b!968650 (= e!545968 (noDuplicate!1380 (t!28390 Nil!20033)))))

(assert (= (and d!116079 (not res!648457)) b!968649))

(assert (= (and b!968649 res!648458) b!968650))

(declare-fun m!896323 () Bool)

(assert (=> b!968649 m!896323))

(declare-fun m!896325 () Bool)

(assert (=> b!968650 m!896325))

(assert (=> b!968570 d!116079))

(declare-fun d!116081 () Bool)

(assert (=> d!116081 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83016 d!116081))

(declare-fun d!116083 () Bool)

(assert (=> d!116083 (= (array_inv!22361 _values!1425) (bvsge (size!29285 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83016 d!116083))

(declare-fun d!116085 () Bool)

(assert (=> d!116085 (= (array_inv!22362 _keys!1717) (bvsge (size!29284 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83016 d!116085))

(declare-fun d!116087 () Bool)

(declare-fun lt!431325 () Bool)

(assert (=> d!116087 (= lt!431325 (select (content!413 Nil!20033) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!545969 () Bool)

(assert (=> d!116087 (= lt!431325 e!545969)))

(declare-fun res!648460 () Bool)

(assert (=> d!116087 (=> (not res!648460) (not e!545969))))

(assert (=> d!116087 (= res!648460 ((_ is Cons!20032) Nil!20033))))

(assert (=> d!116087 (= (contains!5524 Nil!20033 #b0000000000000000000000000000000000000000000000000000000000000000) lt!431325)))

(declare-fun b!968651 () Bool)

(declare-fun e!545970 () Bool)

(assert (=> b!968651 (= e!545969 e!545970)))

(declare-fun res!648459 () Bool)

(assert (=> b!968651 (=> res!648459 e!545970)))

(assert (=> b!968651 (= res!648459 (= (h!21194 Nil!20033) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968652 () Bool)

(assert (=> b!968652 (= e!545970 (contains!5524 (t!28390 Nil!20033) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116087 res!648460) b!968651))

(assert (= (and b!968651 (not res!648459)) b!968652))

(assert (=> d!116087 m!896305))

(declare-fun m!896327 () Bool)

(assert (=> d!116087 m!896327))

(declare-fun m!896329 () Bool)

(assert (=> b!968652 m!896329))

(assert (=> b!968572 d!116087))

(declare-fun mapNonEmpty!34921 () Bool)

(declare-fun mapRes!34921 () Bool)

(declare-fun tp!66490 () Bool)

(declare-fun e!545976 () Bool)

(assert (=> mapNonEmpty!34921 (= mapRes!34921 (and tp!66490 e!545976))))

(declare-fun mapKey!34921 () (_ BitVec 32))

(declare-fun mapValue!34921 () ValueCell!10487)

(declare-fun mapRest!34921 () (Array (_ BitVec 32) ValueCell!10487))

(assert (=> mapNonEmpty!34921 (= mapRest!34912 (store mapRest!34921 mapKey!34921 mapValue!34921))))

(declare-fun b!968659 () Bool)

(assert (=> b!968659 (= e!545976 tp_is_empty!21937)))

(declare-fun condMapEmpty!34921 () Bool)

(declare-fun mapDefault!34921 () ValueCell!10487)

(assert (=> mapNonEmpty!34912 (= condMapEmpty!34921 (= mapRest!34912 ((as const (Array (_ BitVec 32) ValueCell!10487)) mapDefault!34921)))))

(declare-fun e!545975 () Bool)

(assert (=> mapNonEmpty!34912 (= tp!66481 (and e!545975 mapRes!34921))))

(declare-fun b!968660 () Bool)

(assert (=> b!968660 (= e!545975 tp_is_empty!21937)))

(declare-fun mapIsEmpty!34921 () Bool)

(assert (=> mapIsEmpty!34921 mapRes!34921))

(assert (= (and mapNonEmpty!34912 condMapEmpty!34921) mapIsEmpty!34921))

(assert (= (and mapNonEmpty!34912 (not condMapEmpty!34921)) mapNonEmpty!34921))

(assert (= (and mapNonEmpty!34921 ((_ is ValueCellFull!10487) mapValue!34921)) b!968659))

(assert (= (and mapNonEmpty!34912 ((_ is ValueCellFull!10487) mapDefault!34921)) b!968660))

(declare-fun m!896331 () Bool)

(assert (=> mapNonEmpty!34921 m!896331))

(check-sat (not b!968632) (not b!968641) (not b!968649) (not d!116087) (not b!968650) (not b!968652) (not mapNonEmpty!34921) (not b!968643) (not d!116075) (not bm!41712) tp_is_empty!21937)
(check-sat)
