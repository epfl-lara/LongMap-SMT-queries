; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34240 () Bool)

(assert start!34240)

(declare-fun b_free!7263 () Bool)

(declare-fun b_next!7263 () Bool)

(assert (=> start!34240 (= b_free!7263 (not b_next!7263))))

(declare-fun tp!25323 () Bool)

(declare-fun b_and!14463 () Bool)

(assert (=> start!34240 (= tp!25323 b_and!14463)))

(declare-fun b!341697 () Bool)

(declare-fun res!188918 () Bool)

(declare-fun e!209545 () Bool)

(assert (=> b!341697 (=> (not res!188918) (not e!209545))))

(declare-datatypes ((array!18023 0))(
  ( (array!18024 (arr!8532 (Array (_ BitVec 32) (_ BitVec 64))) (size!8884 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18023)

(declare-datatypes ((List!4909 0))(
  ( (Nil!4906) (Cons!4905 (h!5761 (_ BitVec 64)) (t!10017 List!4909)) )
))
(declare-fun arrayNoDuplicates!0 (array!18023 (_ BitVec 32) List!4909) Bool)

(assert (=> b!341697 (= res!188918 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4906))))

(declare-fun b!341698 () Bool)

(declare-datatypes ((Unit!10615 0))(
  ( (Unit!10616) )
))
(declare-fun e!209541 () Unit!10615)

(declare-fun Unit!10617 () Unit!10615)

(assert (=> b!341698 (= e!209541 Unit!10617)))

(declare-fun b!341699 () Bool)

(declare-fun res!188917 () Bool)

(assert (=> b!341699 (=> (not res!188917) (not e!209545))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18023 (_ BitVec 32)) Bool)

(assert (=> b!341699 (= res!188917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341700 () Bool)

(declare-fun e!209546 () Bool)

(declare-fun e!209542 () Bool)

(declare-fun mapRes!12249 () Bool)

(assert (=> b!341700 (= e!209546 (and e!209542 mapRes!12249))))

(declare-fun condMapEmpty!12249 () Bool)

(declare-datatypes ((V!10597 0))(
  ( (V!10598 (val!3652 Int)) )
))
(declare-datatypes ((ValueCell!3264 0))(
  ( (ValueCellFull!3264 (v!5824 V!10597)) (EmptyCell!3264) )
))
(declare-datatypes ((array!18025 0))(
  ( (array!18026 (arr!8533 (Array (_ BitVec 32) ValueCell!3264)) (size!8885 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18025)

(declare-fun mapDefault!12249 () ValueCell!3264)

(assert (=> b!341700 (= condMapEmpty!12249 (= (arr!8533 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3264)) mapDefault!12249)))))

(declare-fun b!341702 () Bool)

(declare-fun res!188921 () Bool)

(assert (=> b!341702 (=> (not res!188921) (not e!209545))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341702 (= res!188921 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12249 () Bool)

(declare-fun tp!25322 () Bool)

(declare-fun e!209543 () Bool)

(assert (=> mapNonEmpty!12249 (= mapRes!12249 (and tp!25322 e!209543))))

(declare-fun mapValue!12249 () ValueCell!3264)

(declare-fun mapRest!12249 () (Array (_ BitVec 32) ValueCell!3264))

(declare-fun mapKey!12249 () (_ BitVec 32))

(assert (=> mapNonEmpty!12249 (= (arr!8533 _values!1525) (store mapRest!12249 mapKey!12249 mapValue!12249))))

(declare-fun b!341703 () Bool)

(declare-fun res!188920 () Bool)

(assert (=> b!341703 (=> (not res!188920) (not e!209545))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341703 (= res!188920 (and (= (size!8885 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8884 _keys!1895) (size!8885 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341704 () Bool)

(declare-fun tp_is_empty!7215 () Bool)

(assert (=> b!341704 (= e!209542 tp_is_empty!7215)))

(declare-fun b!341705 () Bool)

(declare-fun res!188915 () Bool)

(assert (=> b!341705 (=> (not res!188915) (not e!209545))))

(declare-fun zeroValue!1467 () V!10597)

(declare-fun minValue!1467 () V!10597)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5290 0))(
  ( (tuple2!5291 (_1!2656 (_ BitVec 64)) (_2!2656 V!10597)) )
))
(declare-datatypes ((List!4910 0))(
  ( (Nil!4907) (Cons!4906 (h!5762 tuple2!5290) (t!10018 List!4910)) )
))
(declare-datatypes ((ListLongMap!4203 0))(
  ( (ListLongMap!4204 (toList!2117 List!4910)) )
))
(declare-fun contains!2171 (ListLongMap!4203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1638 (array!18023 array!18025 (_ BitVec 32) (_ BitVec 32) V!10597 V!10597 (_ BitVec 32) Int) ListLongMap!4203)

(assert (=> b!341705 (= res!188915 (not (contains!2171 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341706 () Bool)

(declare-fun Unit!10618 () Unit!10615)

(assert (=> b!341706 (= e!209541 Unit!10618)))

(declare-fun lt!161830 () Unit!10615)

(declare-fun lemmaArrayContainsKeyThenInListMap!292 (array!18023 array!18025 (_ BitVec 32) (_ BitVec 32) V!10597 V!10597 (_ BitVec 64) (_ BitVec 32) Int) Unit!10615)

(declare-fun arrayScanForKey!0 (array!18023 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341706 (= lt!161830 (lemmaArrayContainsKeyThenInListMap!292 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341706 false))

(declare-fun mapIsEmpty!12249 () Bool)

(assert (=> mapIsEmpty!12249 mapRes!12249))

(declare-fun res!188919 () Bool)

(assert (=> start!34240 (=> (not res!188919) (not e!209545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34240 (= res!188919 (validMask!0 mask!2385))))

(assert (=> start!34240 e!209545))

(assert (=> start!34240 true))

(assert (=> start!34240 tp_is_empty!7215))

(assert (=> start!34240 tp!25323))

(declare-fun array_inv!6314 (array!18025) Bool)

(assert (=> start!34240 (and (array_inv!6314 _values!1525) e!209546)))

(declare-fun array_inv!6315 (array!18023) Bool)

(assert (=> start!34240 (array_inv!6315 _keys!1895)))

(declare-fun b!341701 () Bool)

(declare-fun e!209544 () Bool)

(assert (=> b!341701 (= e!209545 e!209544)))

(declare-fun res!188916 () Bool)

(assert (=> b!341701 (=> (not res!188916) (not e!209544))))

(declare-datatypes ((SeekEntryResult!3294 0))(
  ( (MissingZero!3294 (index!15355 (_ BitVec 32))) (Found!3294 (index!15356 (_ BitVec 32))) (Intermediate!3294 (undefined!4106 Bool) (index!15357 (_ BitVec 32)) (x!34032 (_ BitVec 32))) (Undefined!3294) (MissingVacant!3294 (index!15358 (_ BitVec 32))) )
))
(declare-fun lt!161828 () SeekEntryResult!3294)

(get-info :version)

(assert (=> b!341701 (= res!188916 (and (not ((_ is Found!3294) lt!161828)) (not ((_ is MissingZero!3294) lt!161828)) ((_ is MissingVacant!3294) lt!161828)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18023 (_ BitVec 32)) SeekEntryResult!3294)

(assert (=> b!341701 (= lt!161828 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341707 () Bool)

(assert (=> b!341707 (= e!209543 tp_is_empty!7215)))

(declare-fun b!341708 () Bool)

(assert (=> b!341708 (= e!209544 (bvsge #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun lt!161829 () Unit!10615)

(assert (=> b!341708 (= lt!161829 e!209541)))

(declare-fun c!52698 () Bool)

(declare-fun arrayContainsKey!0 (array!18023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341708 (= c!52698 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34240 res!188919) b!341703))

(assert (= (and b!341703 res!188920) b!341699))

(assert (= (and b!341699 res!188917) b!341697))

(assert (= (and b!341697 res!188918) b!341702))

(assert (= (and b!341702 res!188921) b!341705))

(assert (= (and b!341705 res!188915) b!341701))

(assert (= (and b!341701 res!188916) b!341708))

(assert (= (and b!341708 c!52698) b!341706))

(assert (= (and b!341708 (not c!52698)) b!341698))

(assert (= (and b!341700 condMapEmpty!12249) mapIsEmpty!12249))

(assert (= (and b!341700 (not condMapEmpty!12249)) mapNonEmpty!12249))

(assert (= (and mapNonEmpty!12249 ((_ is ValueCellFull!3264) mapValue!12249)) b!341707))

(assert (= (and b!341700 ((_ is ValueCellFull!3264) mapDefault!12249)) b!341704))

(assert (= start!34240 b!341700))

(declare-fun m!344055 () Bool)

(assert (=> b!341697 m!344055))

(declare-fun m!344057 () Bool)

(assert (=> start!34240 m!344057))

(declare-fun m!344059 () Bool)

(assert (=> start!34240 m!344059))

(declare-fun m!344061 () Bool)

(assert (=> start!34240 m!344061))

(declare-fun m!344063 () Bool)

(assert (=> b!341699 m!344063))

(declare-fun m!344065 () Bool)

(assert (=> b!341701 m!344065))

(declare-fun m!344067 () Bool)

(assert (=> b!341706 m!344067))

(assert (=> b!341706 m!344067))

(declare-fun m!344069 () Bool)

(assert (=> b!341706 m!344069))

(declare-fun m!344071 () Bool)

(assert (=> b!341705 m!344071))

(assert (=> b!341705 m!344071))

(declare-fun m!344073 () Bool)

(assert (=> b!341705 m!344073))

(declare-fun m!344075 () Bool)

(assert (=> b!341702 m!344075))

(declare-fun m!344077 () Bool)

(assert (=> b!341708 m!344077))

(declare-fun m!344079 () Bool)

(assert (=> mapNonEmpty!12249 m!344079))

(check-sat (not b!341699) (not b!341705) b_and!14463 (not b!341702) (not b!341708) (not b!341706) (not mapNonEmpty!12249) tp_is_empty!7215 (not b!341701) (not b_next!7263) (not b!341697) (not start!34240))
(check-sat b_and!14463 (not b_next!7263))
(get-model)

(declare-fun d!70955 () Bool)

(declare-fun res!188948 () Bool)

(declare-fun e!209576 () Bool)

(assert (=> d!70955 (=> res!188948 e!209576)))

(assert (=> d!70955 (= res!188948 (bvsge #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(assert (=> d!70955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!209576)))

(declare-fun b!341753 () Bool)

(declare-fun e!209577 () Bool)

(declare-fun call!26569 () Bool)

(assert (=> b!341753 (= e!209577 call!26569)))

(declare-fun b!341754 () Bool)

(declare-fun e!209575 () Bool)

(assert (=> b!341754 (= e!209575 e!209577)))

(declare-fun lt!161846 () (_ BitVec 64))

(assert (=> b!341754 (= lt!161846 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161848 () Unit!10615)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18023 (_ BitVec 64) (_ BitVec 32)) Unit!10615)

(assert (=> b!341754 (= lt!161848 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161846 #b00000000000000000000000000000000))))

(assert (=> b!341754 (arrayContainsKey!0 _keys!1895 lt!161846 #b00000000000000000000000000000000)))

(declare-fun lt!161847 () Unit!10615)

(assert (=> b!341754 (= lt!161847 lt!161848)))

(declare-fun res!188947 () Bool)

(assert (=> b!341754 (= res!188947 (= (seekEntryOrOpen!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3294 #b00000000000000000000000000000000)))))

(assert (=> b!341754 (=> (not res!188947) (not e!209577))))

(declare-fun b!341755 () Bool)

(assert (=> b!341755 (= e!209575 call!26569)))

(declare-fun bm!26566 () Bool)

(assert (=> bm!26566 (= call!26569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!341756 () Bool)

(assert (=> b!341756 (= e!209576 e!209575)))

(declare-fun c!52704 () Bool)

(assert (=> b!341756 (= c!52704 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70955 (not res!188948)) b!341756))

(assert (= (and b!341756 c!52704) b!341754))

(assert (= (and b!341756 (not c!52704)) b!341755))

(assert (= (and b!341754 res!188947) b!341753))

(assert (= (or b!341753 b!341755) bm!26566))

(declare-fun m!344107 () Bool)

(assert (=> b!341754 m!344107))

(declare-fun m!344109 () Bool)

(assert (=> b!341754 m!344109))

(declare-fun m!344111 () Bool)

(assert (=> b!341754 m!344111))

(assert (=> b!341754 m!344107))

(declare-fun m!344113 () Bool)

(assert (=> b!341754 m!344113))

(declare-fun m!344115 () Bool)

(assert (=> bm!26566 m!344115))

(assert (=> b!341756 m!344107))

(assert (=> b!341756 m!344107))

(declare-fun m!344117 () Bool)

(assert (=> b!341756 m!344117))

(assert (=> b!341699 d!70955))

(declare-fun d!70957 () Bool)

(declare-fun res!188953 () Bool)

(declare-fun e!209582 () Bool)

(assert (=> d!70957 (=> res!188953 e!209582)))

(assert (=> d!70957 (= res!188953 (= (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70957 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!209582)))

(declare-fun b!341761 () Bool)

(declare-fun e!209583 () Bool)

(assert (=> b!341761 (= e!209582 e!209583)))

(declare-fun res!188954 () Bool)

(assert (=> b!341761 (=> (not res!188954) (not e!209583))))

(assert (=> b!341761 (= res!188954 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8884 _keys!1895)))))

(declare-fun b!341762 () Bool)

(assert (=> b!341762 (= e!209583 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70957 (not res!188953)) b!341761))

(assert (= (and b!341761 res!188954) b!341762))

(assert (=> d!70957 m!344107))

(declare-fun m!344119 () Bool)

(assert (=> b!341762 m!344119))

(assert (=> b!341708 d!70957))

(declare-fun d!70959 () Bool)

(assert (=> d!70959 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34240 d!70959))

(declare-fun d!70961 () Bool)

(assert (=> d!70961 (= (array_inv!6314 _values!1525) (bvsge (size!8885 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34240 d!70961))

(declare-fun d!70963 () Bool)

(assert (=> d!70963 (= (array_inv!6315 _keys!1895) (bvsge (size!8884 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34240 d!70963))

(declare-fun b!341775 () Bool)

(declare-fun e!209591 () SeekEntryResult!3294)

(declare-fun e!209590 () SeekEntryResult!3294)

(assert (=> b!341775 (= e!209591 e!209590)))

(declare-fun lt!161857 () (_ BitVec 64))

(declare-fun lt!161855 () SeekEntryResult!3294)

(assert (=> b!341775 (= lt!161857 (select (arr!8532 _keys!1895) (index!15357 lt!161855)))))

(declare-fun c!52711 () Bool)

(assert (=> b!341775 (= c!52711 (= lt!161857 k0!1348))))

(declare-fun b!341776 () Bool)

(assert (=> b!341776 (= e!209590 (Found!3294 (index!15357 lt!161855)))))

(declare-fun b!341777 () Bool)

(assert (=> b!341777 (= e!209591 Undefined!3294)))

(declare-fun d!70965 () Bool)

(declare-fun lt!161856 () SeekEntryResult!3294)

(assert (=> d!70965 (and (or ((_ is Undefined!3294) lt!161856) (not ((_ is Found!3294) lt!161856)) (and (bvsge (index!15356 lt!161856) #b00000000000000000000000000000000) (bvslt (index!15356 lt!161856) (size!8884 _keys!1895)))) (or ((_ is Undefined!3294) lt!161856) ((_ is Found!3294) lt!161856) (not ((_ is MissingZero!3294) lt!161856)) (and (bvsge (index!15355 lt!161856) #b00000000000000000000000000000000) (bvslt (index!15355 lt!161856) (size!8884 _keys!1895)))) (or ((_ is Undefined!3294) lt!161856) ((_ is Found!3294) lt!161856) ((_ is MissingZero!3294) lt!161856) (not ((_ is MissingVacant!3294) lt!161856)) (and (bvsge (index!15358 lt!161856) #b00000000000000000000000000000000) (bvslt (index!15358 lt!161856) (size!8884 _keys!1895)))) (or ((_ is Undefined!3294) lt!161856) (ite ((_ is Found!3294) lt!161856) (= (select (arr!8532 _keys!1895) (index!15356 lt!161856)) k0!1348) (ite ((_ is MissingZero!3294) lt!161856) (= (select (arr!8532 _keys!1895) (index!15355 lt!161856)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3294) lt!161856) (= (select (arr!8532 _keys!1895) (index!15358 lt!161856)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70965 (= lt!161856 e!209591)))

(declare-fun c!52712 () Bool)

(assert (=> d!70965 (= c!52712 (and ((_ is Intermediate!3294) lt!161855) (undefined!4106 lt!161855)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18023 (_ BitVec 32)) SeekEntryResult!3294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70965 (= lt!161855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70965 (validMask!0 mask!2385)))

(assert (=> d!70965 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161856)))

(declare-fun b!341778 () Bool)

(declare-fun e!209592 () SeekEntryResult!3294)

(assert (=> b!341778 (= e!209592 (MissingZero!3294 (index!15357 lt!161855)))))

(declare-fun b!341779 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18023 (_ BitVec 32)) SeekEntryResult!3294)

(assert (=> b!341779 (= e!209592 (seekKeyOrZeroReturnVacant!0 (x!34032 lt!161855) (index!15357 lt!161855) (index!15357 lt!161855) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341780 () Bool)

(declare-fun c!52713 () Bool)

(assert (=> b!341780 (= c!52713 (= lt!161857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!341780 (= e!209590 e!209592)))

(assert (= (and d!70965 c!52712) b!341777))

(assert (= (and d!70965 (not c!52712)) b!341775))

(assert (= (and b!341775 c!52711) b!341776))

(assert (= (and b!341775 (not c!52711)) b!341780))

(assert (= (and b!341780 c!52713) b!341778))

(assert (= (and b!341780 (not c!52713)) b!341779))

(declare-fun m!344121 () Bool)

(assert (=> b!341775 m!344121))

(declare-fun m!344123 () Bool)

(assert (=> d!70965 m!344123))

(declare-fun m!344125 () Bool)

(assert (=> d!70965 m!344125))

(declare-fun m!344127 () Bool)

(assert (=> d!70965 m!344127))

(declare-fun m!344129 () Bool)

(assert (=> d!70965 m!344129))

(assert (=> d!70965 m!344125))

(assert (=> d!70965 m!344057))

(declare-fun m!344131 () Bool)

(assert (=> d!70965 m!344131))

(declare-fun m!344133 () Bool)

(assert (=> b!341779 m!344133))

(assert (=> b!341701 d!70965))

(declare-fun d!70967 () Bool)

(declare-fun e!209598 () Bool)

(assert (=> d!70967 e!209598))

(declare-fun res!188957 () Bool)

(assert (=> d!70967 (=> res!188957 e!209598)))

(declare-fun lt!161866 () Bool)

(assert (=> d!70967 (= res!188957 (not lt!161866))))

(declare-fun lt!161869 () Bool)

(assert (=> d!70967 (= lt!161866 lt!161869)))

(declare-fun lt!161868 () Unit!10615)

(declare-fun e!209597 () Unit!10615)

(assert (=> d!70967 (= lt!161868 e!209597)))

(declare-fun c!52716 () Bool)

(assert (=> d!70967 (= c!52716 lt!161869)))

(declare-fun containsKey!326 (List!4910 (_ BitVec 64)) Bool)

(assert (=> d!70967 (= lt!161869 (containsKey!326 (toList!2117 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70967 (= (contains!2171 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161866)))

(declare-fun b!341787 () Bool)

(declare-fun lt!161867 () Unit!10615)

(assert (=> b!341787 (= e!209597 lt!161867)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!274 (List!4910 (_ BitVec 64)) Unit!10615)

(assert (=> b!341787 (= lt!161867 (lemmaContainsKeyImpliesGetValueByKeyDefined!274 (toList!2117 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!340 0))(
  ( (Some!339 (v!5826 V!10597)) (None!338) )
))
(declare-fun isDefined!275 (Option!340) Bool)

(declare-fun getValueByKey!334 (List!4910 (_ BitVec 64)) Option!340)

(assert (=> b!341787 (isDefined!275 (getValueByKey!334 (toList!2117 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!341788 () Bool)

(declare-fun Unit!10619 () Unit!10615)

(assert (=> b!341788 (= e!209597 Unit!10619)))

(declare-fun b!341789 () Bool)

(assert (=> b!341789 (= e!209598 (isDefined!275 (getValueByKey!334 (toList!2117 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70967 c!52716) b!341787))

(assert (= (and d!70967 (not c!52716)) b!341788))

(assert (= (and d!70967 (not res!188957)) b!341789))

(declare-fun m!344135 () Bool)

(assert (=> d!70967 m!344135))

(declare-fun m!344137 () Bool)

(assert (=> b!341787 m!344137))

(declare-fun m!344139 () Bool)

(assert (=> b!341787 m!344139))

(assert (=> b!341787 m!344139))

(declare-fun m!344141 () Bool)

(assert (=> b!341787 m!344141))

(assert (=> b!341789 m!344139))

(assert (=> b!341789 m!344139))

(assert (=> b!341789 m!344141))

(assert (=> b!341705 d!70967))

(declare-fun bm!26581 () Bool)

(declare-fun call!26586 () ListLongMap!4203)

(declare-fun call!26587 () ListLongMap!4203)

(assert (=> bm!26581 (= call!26586 call!26587)))

(declare-fun b!341832 () Bool)

(declare-fun c!52733 () Bool)

(assert (=> b!341832 (= c!52733 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!209626 () ListLongMap!4203)

(declare-fun e!209627 () ListLongMap!4203)

(assert (=> b!341832 (= e!209626 e!209627)))

(declare-fun lt!161935 () ListLongMap!4203)

(declare-fun b!341833 () Bool)

(declare-fun e!209634 () Bool)

(declare-fun apply!276 (ListLongMap!4203 (_ BitVec 64)) V!10597)

(declare-fun get!4626 (ValueCell!3264 V!10597) V!10597)

(declare-fun dynLambda!619 (Int (_ BitVec 64)) V!10597)

(assert (=> b!341833 (= e!209634 (= (apply!276 lt!161935 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)) (get!4626 (select (arr!8533 _values!1525) #b00000000000000000000000000000000) (dynLambda!619 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8885 _values!1525)))))

(assert (=> b!341833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun b!341834 () Bool)

(declare-fun e!209633 () Bool)

(declare-fun e!209631 () Bool)

(assert (=> b!341834 (= e!209633 e!209631)))

(declare-fun c!52734 () Bool)

(assert (=> b!341834 (= c!52734 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!341836 () Bool)

(declare-fun e!209625 () Bool)

(assert (=> b!341836 (= e!209625 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26582 () Bool)

(declare-fun c!52730 () Bool)

(declare-fun call!26588 () ListLongMap!4203)

(declare-fun c!52729 () Bool)

(declare-fun call!26585 () ListLongMap!4203)

(declare-fun +!725 (ListLongMap!4203 tuple2!5290) ListLongMap!4203)

(assert (=> bm!26582 (= call!26585 (+!725 (ite c!52730 call!26587 (ite c!52729 call!26586 call!26588)) (ite (or c!52730 c!52729) (tuple2!5291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!341837 () Bool)

(declare-fun e!209629 () ListLongMap!4203)

(assert (=> b!341837 (= e!209629 e!209626)))

(assert (=> b!341837 (= c!52729 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26583 () Bool)

(declare-fun call!26590 () Bool)

(assert (=> bm!26583 (= call!26590 (contains!2171 lt!161935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341838 () Bool)

(declare-fun e!209632 () Bool)

(assert (=> b!341838 (= e!209632 (not call!26590))))

(declare-fun bm!26584 () Bool)

(declare-fun call!26589 () Bool)

(assert (=> bm!26584 (= call!26589 (contains!2171 lt!161935 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!341839 () Bool)

(declare-fun e!209635 () Unit!10615)

(declare-fun lt!161915 () Unit!10615)

(assert (=> b!341839 (= e!209635 lt!161915)))

(declare-fun lt!161928 () ListLongMap!4203)

(declare-fun getCurrentListMapNoExtraKeys!598 (array!18023 array!18025 (_ BitVec 32) (_ BitVec 32) V!10597 V!10597 (_ BitVec 32) Int) ListLongMap!4203)

(assert (=> b!341839 (= lt!161928 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161930 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161931 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161931 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161934 () Unit!10615)

(declare-fun addStillContains!252 (ListLongMap!4203 (_ BitVec 64) V!10597 (_ BitVec 64)) Unit!10615)

(assert (=> b!341839 (= lt!161934 (addStillContains!252 lt!161928 lt!161930 zeroValue!1467 lt!161931))))

(assert (=> b!341839 (contains!2171 (+!725 lt!161928 (tuple2!5291 lt!161930 zeroValue!1467)) lt!161931)))

(declare-fun lt!161929 () Unit!10615)

(assert (=> b!341839 (= lt!161929 lt!161934)))

(declare-fun lt!161933 () ListLongMap!4203)

(assert (=> b!341839 (= lt!161933 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161924 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161924 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161926 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161926 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161919 () Unit!10615)

(declare-fun addApplyDifferent!252 (ListLongMap!4203 (_ BitVec 64) V!10597 (_ BitVec 64)) Unit!10615)

(assert (=> b!341839 (= lt!161919 (addApplyDifferent!252 lt!161933 lt!161924 minValue!1467 lt!161926))))

(assert (=> b!341839 (= (apply!276 (+!725 lt!161933 (tuple2!5291 lt!161924 minValue!1467)) lt!161926) (apply!276 lt!161933 lt!161926))))

(declare-fun lt!161923 () Unit!10615)

(assert (=> b!341839 (= lt!161923 lt!161919)))

(declare-fun lt!161927 () ListLongMap!4203)

(assert (=> b!341839 (= lt!161927 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161921 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161917 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161917 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161916 () Unit!10615)

(assert (=> b!341839 (= lt!161916 (addApplyDifferent!252 lt!161927 lt!161921 zeroValue!1467 lt!161917))))

(assert (=> b!341839 (= (apply!276 (+!725 lt!161927 (tuple2!5291 lt!161921 zeroValue!1467)) lt!161917) (apply!276 lt!161927 lt!161917))))

(declare-fun lt!161932 () Unit!10615)

(assert (=> b!341839 (= lt!161932 lt!161916)))

(declare-fun lt!161922 () ListLongMap!4203)

(assert (=> b!341839 (= lt!161922 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161925 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161925 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161920 () (_ BitVec 64))

(assert (=> b!341839 (= lt!161920 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!341839 (= lt!161915 (addApplyDifferent!252 lt!161922 lt!161925 minValue!1467 lt!161920))))

(assert (=> b!341839 (= (apply!276 (+!725 lt!161922 (tuple2!5291 lt!161925 minValue!1467)) lt!161920) (apply!276 lt!161922 lt!161920))))

(declare-fun b!341840 () Bool)

(declare-fun res!188984 () Bool)

(assert (=> b!341840 (=> (not res!188984) (not e!209633))))

(declare-fun e!209637 () Bool)

(assert (=> b!341840 (= res!188984 e!209637)))

(declare-fun res!188977 () Bool)

(assert (=> b!341840 (=> res!188977 e!209637)))

(assert (=> b!341840 (= res!188977 (not e!209625))))

(declare-fun res!188981 () Bool)

(assert (=> b!341840 (=> (not res!188981) (not e!209625))))

(assert (=> b!341840 (= res!188981 (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun b!341841 () Bool)

(declare-fun e!209636 () Bool)

(assert (=> b!341841 (= e!209632 e!209636)))

(declare-fun res!188982 () Bool)

(assert (=> b!341841 (= res!188982 call!26590)))

(assert (=> b!341841 (=> (not res!188982) (not e!209636))))

(declare-fun b!341842 () Bool)

(assert (=> b!341842 (= e!209631 (not call!26589))))

(declare-fun b!341843 () Bool)

(declare-fun e!209630 () Bool)

(assert (=> b!341843 (= e!209631 e!209630)))

(declare-fun res!188976 () Bool)

(assert (=> b!341843 (= res!188976 call!26589)))

(assert (=> b!341843 (=> (not res!188976) (not e!209630))))

(declare-fun bm!26585 () Bool)

(assert (=> bm!26585 (= call!26587 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!341844 () Bool)

(assert (=> b!341844 (= e!209637 e!209634)))

(declare-fun res!188978 () Bool)

(assert (=> b!341844 (=> (not res!188978) (not e!209634))))

(assert (=> b!341844 (= res!188978 (contains!2171 lt!161935 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!341844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun b!341845 () Bool)

(declare-fun call!26584 () ListLongMap!4203)

(assert (=> b!341845 (= e!209626 call!26584)))

(declare-fun b!341846 () Bool)

(assert (=> b!341846 (= e!209630 (= (apply!276 lt!161935 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26586 () Bool)

(assert (=> bm!26586 (= call!26588 call!26586)))

(declare-fun b!341847 () Bool)

(assert (=> b!341847 (= e!209636 (= (apply!276 lt!161935 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!341848 () Bool)

(assert (=> b!341848 (= e!209627 call!26588)))

(declare-fun d!70969 () Bool)

(assert (=> d!70969 e!209633))

(declare-fun res!188979 () Bool)

(assert (=> d!70969 (=> (not res!188979) (not e!209633))))

(assert (=> d!70969 (= res!188979 (or (bvsge #b00000000000000000000000000000000 (size!8884 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))))

(declare-fun lt!161918 () ListLongMap!4203)

(assert (=> d!70969 (= lt!161935 lt!161918)))

(declare-fun lt!161914 () Unit!10615)

(assert (=> d!70969 (= lt!161914 e!209635)))

(declare-fun c!52731 () Bool)

(declare-fun e!209628 () Bool)

(assert (=> d!70969 (= c!52731 e!209628)))

(declare-fun res!188983 () Bool)

(assert (=> d!70969 (=> (not res!188983) (not e!209628))))

(assert (=> d!70969 (= res!188983 (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(assert (=> d!70969 (= lt!161918 e!209629)))

(assert (=> d!70969 (= c!52730 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70969 (validMask!0 mask!2385)))

(assert (=> d!70969 (= (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161935)))

(declare-fun b!341835 () Bool)

(declare-fun Unit!10620 () Unit!10615)

(assert (=> b!341835 (= e!209635 Unit!10620)))

(declare-fun b!341849 () Bool)

(assert (=> b!341849 (= e!209628 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341850 () Bool)

(assert (=> b!341850 (= e!209629 (+!725 call!26585 (tuple2!5291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!341851 () Bool)

(assert (=> b!341851 (= e!209627 call!26584)))

(declare-fun bm!26587 () Bool)

(assert (=> bm!26587 (= call!26584 call!26585)))

(declare-fun b!341852 () Bool)

(declare-fun res!188980 () Bool)

(assert (=> b!341852 (=> (not res!188980) (not e!209633))))

(assert (=> b!341852 (= res!188980 e!209632)))

(declare-fun c!52732 () Bool)

(assert (=> b!341852 (= c!52732 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!70969 c!52730) b!341850))

(assert (= (and d!70969 (not c!52730)) b!341837))

(assert (= (and b!341837 c!52729) b!341845))

(assert (= (and b!341837 (not c!52729)) b!341832))

(assert (= (and b!341832 c!52733) b!341851))

(assert (= (and b!341832 (not c!52733)) b!341848))

(assert (= (or b!341851 b!341848) bm!26586))

(assert (= (or b!341845 bm!26586) bm!26581))

(assert (= (or b!341845 b!341851) bm!26587))

(assert (= (or b!341850 bm!26581) bm!26585))

(assert (= (or b!341850 bm!26587) bm!26582))

(assert (= (and d!70969 res!188983) b!341849))

(assert (= (and d!70969 c!52731) b!341839))

(assert (= (and d!70969 (not c!52731)) b!341835))

(assert (= (and d!70969 res!188979) b!341840))

(assert (= (and b!341840 res!188981) b!341836))

(assert (= (and b!341840 (not res!188977)) b!341844))

(assert (= (and b!341844 res!188978) b!341833))

(assert (= (and b!341840 res!188984) b!341852))

(assert (= (and b!341852 c!52732) b!341841))

(assert (= (and b!341852 (not c!52732)) b!341838))

(assert (= (and b!341841 res!188982) b!341847))

(assert (= (or b!341841 b!341838) bm!26583))

(assert (= (and b!341852 res!188980) b!341834))

(assert (= (and b!341834 c!52734) b!341843))

(assert (= (and b!341834 (not c!52734)) b!341842))

(assert (= (and b!341843 res!188976) b!341846))

(assert (= (or b!341843 b!341842) bm!26584))

(declare-fun b_lambda!8443 () Bool)

(assert (=> (not b_lambda!8443) (not b!341833)))

(declare-fun t!10021 () Bool)

(declare-fun tb!3067 () Bool)

(assert (=> (and start!34240 (= defaultEntry!1528 defaultEntry!1528) t!10021) tb!3067))

(declare-fun result!5531 () Bool)

(assert (=> tb!3067 (= result!5531 tp_is_empty!7215)))

(assert (=> b!341833 t!10021))

(declare-fun b_and!14467 () Bool)

(assert (= b_and!14463 (and (=> t!10021 result!5531) b_and!14467)))

(declare-fun m!344143 () Bool)

(assert (=> b!341839 m!344143))

(declare-fun m!344145 () Bool)

(assert (=> b!341839 m!344145))

(declare-fun m!344147 () Bool)

(assert (=> b!341839 m!344147))

(declare-fun m!344149 () Bool)

(assert (=> b!341839 m!344149))

(declare-fun m!344151 () Bool)

(assert (=> b!341839 m!344151))

(declare-fun m!344153 () Bool)

(assert (=> b!341839 m!344153))

(declare-fun m!344155 () Bool)

(assert (=> b!341839 m!344155))

(declare-fun m!344157 () Bool)

(assert (=> b!341839 m!344157))

(declare-fun m!344159 () Bool)

(assert (=> b!341839 m!344159))

(declare-fun m!344161 () Bool)

(assert (=> b!341839 m!344161))

(assert (=> b!341839 m!344107))

(assert (=> b!341839 m!344157))

(declare-fun m!344163 () Bool)

(assert (=> b!341839 m!344163))

(declare-fun m!344165 () Bool)

(assert (=> b!341839 m!344165))

(assert (=> b!341839 m!344165))

(declare-fun m!344167 () Bool)

(assert (=> b!341839 m!344167))

(assert (=> b!341839 m!344143))

(declare-fun m!344169 () Bool)

(assert (=> b!341839 m!344169))

(declare-fun m!344171 () Bool)

(assert (=> b!341839 m!344171))

(declare-fun m!344173 () Bool)

(assert (=> b!341839 m!344173))

(assert (=> b!341839 m!344159))

(declare-fun m!344175 () Bool)

(assert (=> b!341846 m!344175))

(declare-fun m!344177 () Bool)

(assert (=> b!341847 m!344177))

(declare-fun m!344179 () Bool)

(assert (=> b!341833 m!344179))

(declare-fun m!344181 () Bool)

(assert (=> b!341833 m!344181))

(declare-fun m!344183 () Bool)

(assert (=> b!341833 m!344183))

(assert (=> b!341833 m!344179))

(assert (=> b!341833 m!344107))

(declare-fun m!344185 () Bool)

(assert (=> b!341833 m!344185))

(assert (=> b!341833 m!344181))

(assert (=> b!341833 m!344107))

(declare-fun m!344187 () Bool)

(assert (=> bm!26583 m!344187))

(assert (=> b!341844 m!344107))

(assert (=> b!341844 m!344107))

(declare-fun m!344189 () Bool)

(assert (=> b!341844 m!344189))

(assert (=> b!341836 m!344107))

(assert (=> b!341836 m!344107))

(assert (=> b!341836 m!344117))

(assert (=> d!70969 m!344057))

(assert (=> b!341849 m!344107))

(assert (=> b!341849 m!344107))

(assert (=> b!341849 m!344117))

(assert (=> bm!26585 m!344151))

(declare-fun m!344191 () Bool)

(assert (=> b!341850 m!344191))

(declare-fun m!344193 () Bool)

(assert (=> bm!26582 m!344193))

(declare-fun m!344195 () Bool)

(assert (=> bm!26584 m!344195))

(assert (=> b!341705 d!70969))

(declare-fun d!70971 () Bool)

(assert (=> d!70971 (contains!2171 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!161938 () Unit!10615)

(declare-fun choose!1302 (array!18023 array!18025 (_ BitVec 32) (_ BitVec 32) V!10597 V!10597 (_ BitVec 64) (_ BitVec 32) Int) Unit!10615)

(assert (=> d!70971 (= lt!161938 (choose!1302 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70971 (validMask!0 mask!2385)))

(assert (=> d!70971 (= (lemmaArrayContainsKeyThenInListMap!292 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!161938)))

(declare-fun bs!11730 () Bool)

(assert (= bs!11730 d!70971))

(assert (=> bs!11730 m!344071))

(assert (=> bs!11730 m!344071))

(assert (=> bs!11730 m!344073))

(assert (=> bs!11730 m!344067))

(declare-fun m!344197 () Bool)

(assert (=> bs!11730 m!344197))

(assert (=> bs!11730 m!344057))

(assert (=> b!341706 d!70971))

(declare-fun d!70973 () Bool)

(declare-fun lt!161941 () (_ BitVec 32))

(assert (=> d!70973 (and (or (bvslt lt!161941 #b00000000000000000000000000000000) (bvsge lt!161941 (size!8884 _keys!1895)) (and (bvsge lt!161941 #b00000000000000000000000000000000) (bvslt lt!161941 (size!8884 _keys!1895)))) (bvsge lt!161941 #b00000000000000000000000000000000) (bvslt lt!161941 (size!8884 _keys!1895)) (= (select (arr!8532 _keys!1895) lt!161941) k0!1348))))

(declare-fun e!209640 () (_ BitVec 32))

(assert (=> d!70973 (= lt!161941 e!209640)))

(declare-fun c!52737 () Bool)

(assert (=> d!70973 (= c!52737 (= (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70973 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)) (bvslt (size!8884 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70973 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!161941)))

(declare-fun b!341859 () Bool)

(assert (=> b!341859 (= e!209640 #b00000000000000000000000000000000)))

(declare-fun b!341860 () Bool)

(assert (=> b!341860 (= e!209640 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70973 c!52737) b!341859))

(assert (= (and d!70973 (not c!52737)) b!341860))

(declare-fun m!344199 () Bool)

(assert (=> d!70973 m!344199))

(assert (=> d!70973 m!344107))

(declare-fun m!344201 () Bool)

(assert (=> b!341860 m!344201))

(assert (=> b!341706 d!70973))

(declare-fun bm!26590 () Bool)

(declare-fun call!26593 () Bool)

(declare-fun c!52740 () Bool)

(assert (=> bm!26590 (= call!26593 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52740 (Cons!4905 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) Nil!4906) Nil!4906)))))

(declare-fun b!341871 () Bool)

(declare-fun e!209652 () Bool)

(declare-fun contains!2173 (List!4909 (_ BitVec 64)) Bool)

(assert (=> b!341871 (= e!209652 (contains!2173 Nil!4906 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341872 () Bool)

(declare-fun e!209651 () Bool)

(assert (=> b!341872 (= e!209651 call!26593)))

(declare-fun d!70975 () Bool)

(declare-fun res!188991 () Bool)

(declare-fun e!209650 () Bool)

(assert (=> d!70975 (=> res!188991 e!209650)))

(assert (=> d!70975 (= res!188991 (bvsge #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(assert (=> d!70975 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4906) e!209650)))

(declare-fun b!341873 () Bool)

(declare-fun e!209649 () Bool)

(assert (=> b!341873 (= e!209650 e!209649)))

(declare-fun res!188992 () Bool)

(assert (=> b!341873 (=> (not res!188992) (not e!209649))))

(assert (=> b!341873 (= res!188992 (not e!209652))))

(declare-fun res!188993 () Bool)

(assert (=> b!341873 (=> (not res!188993) (not e!209652))))

(assert (=> b!341873 (= res!188993 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341874 () Bool)

(assert (=> b!341874 (= e!209651 call!26593)))

(declare-fun b!341875 () Bool)

(assert (=> b!341875 (= e!209649 e!209651)))

(assert (=> b!341875 (= c!52740 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70975 (not res!188991)) b!341873))

(assert (= (and b!341873 res!188993) b!341871))

(assert (= (and b!341873 res!188992) b!341875))

(assert (= (and b!341875 c!52740) b!341874))

(assert (= (and b!341875 (not c!52740)) b!341872))

(assert (= (or b!341874 b!341872) bm!26590))

(assert (=> bm!26590 m!344107))

(declare-fun m!344203 () Bool)

(assert (=> bm!26590 m!344203))

(assert (=> b!341871 m!344107))

(assert (=> b!341871 m!344107))

(declare-fun m!344205 () Bool)

(assert (=> b!341871 m!344205))

(assert (=> b!341873 m!344107))

(assert (=> b!341873 m!344107))

(assert (=> b!341873 m!344117))

(assert (=> b!341875 m!344107))

(assert (=> b!341875 m!344107))

(assert (=> b!341875 m!344117))

(assert (=> b!341697 d!70975))

(declare-fun d!70977 () Bool)

(assert (=> d!70977 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341702 d!70977))

(declare-fun mapNonEmpty!12255 () Bool)

(declare-fun mapRes!12255 () Bool)

(declare-fun tp!25332 () Bool)

(declare-fun e!209658 () Bool)

(assert (=> mapNonEmpty!12255 (= mapRes!12255 (and tp!25332 e!209658))))

(declare-fun mapValue!12255 () ValueCell!3264)

(declare-fun mapRest!12255 () (Array (_ BitVec 32) ValueCell!3264))

(declare-fun mapKey!12255 () (_ BitVec 32))

(assert (=> mapNonEmpty!12255 (= mapRest!12249 (store mapRest!12255 mapKey!12255 mapValue!12255))))

(declare-fun b!341882 () Bool)

(assert (=> b!341882 (= e!209658 tp_is_empty!7215)))

(declare-fun condMapEmpty!12255 () Bool)

(declare-fun mapDefault!12255 () ValueCell!3264)

(assert (=> mapNonEmpty!12249 (= condMapEmpty!12255 (= mapRest!12249 ((as const (Array (_ BitVec 32) ValueCell!3264)) mapDefault!12255)))))

(declare-fun e!209657 () Bool)

(assert (=> mapNonEmpty!12249 (= tp!25322 (and e!209657 mapRes!12255))))

(declare-fun mapIsEmpty!12255 () Bool)

(assert (=> mapIsEmpty!12255 mapRes!12255))

(declare-fun b!341883 () Bool)

(assert (=> b!341883 (= e!209657 tp_is_empty!7215)))

(assert (= (and mapNonEmpty!12249 condMapEmpty!12255) mapIsEmpty!12255))

(assert (= (and mapNonEmpty!12249 (not condMapEmpty!12255)) mapNonEmpty!12255))

(assert (= (and mapNonEmpty!12255 ((_ is ValueCellFull!3264) mapValue!12255)) b!341882))

(assert (= (and mapNonEmpty!12249 ((_ is ValueCellFull!3264) mapDefault!12255)) b!341883))

(declare-fun m!344207 () Bool)

(assert (=> mapNonEmpty!12255 m!344207))

(declare-fun b_lambda!8445 () Bool)

(assert (= b_lambda!8443 (or (and start!34240 b_free!7263) b_lambda!8445)))

(check-sat (not bm!26582) (not b!341873) (not b!341754) (not bm!26590) (not b!341836) (not b_next!7263) (not b_lambda!8445) (not d!70969) (not b!341833) (not bm!26584) (not b!341849) b_and!14467 (not b!341860) (not b!341779) (not bm!26566) (not bm!26585) (not bm!26583) (not b!341850) (not d!70965) (not b!341756) (not b!341844) (not d!70967) (not b!341789) (not b!341847) (not b!341875) (not b!341787) (not d!70971) (not b!341839) (not b!341846) (not b!341762) (not b!341871) (not mapNonEmpty!12255) tp_is_empty!7215)
(check-sat b_and!14467 (not b_next!7263))
