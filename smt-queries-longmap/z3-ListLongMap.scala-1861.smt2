; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33568 () Bool)

(assert start!33568)

(declare-fun b_free!6835 () Bool)

(declare-fun b_next!6835 () Bool)

(assert (=> start!33568 (= b_free!6835 (not b_next!6835))))

(declare-fun tp!24005 () Bool)

(declare-fun b_and!14027 () Bool)

(assert (=> start!33568 (= tp!24005 b_and!14027)))

(declare-fun b!333188 () Bool)

(declare-fun e!204594 () Bool)

(declare-fun tp_is_empty!6787 () Bool)

(assert (=> b!333188 (= e!204594 tp_is_empty!6787)))

(declare-fun mapNonEmpty!11574 () Bool)

(declare-fun mapRes!11574 () Bool)

(declare-fun tp!24006 () Bool)

(declare-fun e!204595 () Bool)

(assert (=> mapNonEmpty!11574 (= mapRes!11574 (and tp!24006 e!204595))))

(declare-datatypes ((V!10027 0))(
  ( (V!10028 (val!3438 Int)) )
))
(declare-datatypes ((ValueCell!3050 0))(
  ( (ValueCellFull!3050 (v!5600 V!10027)) (EmptyCell!3050) )
))
(declare-fun mapRest!11574 () (Array (_ BitVec 32) ValueCell!3050))

(declare-datatypes ((array!17168 0))(
  ( (array!17169 (arr!8115 (Array (_ BitVec 32) ValueCell!3050)) (size!8467 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17168)

(declare-fun mapValue!11574 () ValueCell!3050)

(declare-fun mapKey!11574 () (_ BitVec 32))

(assert (=> mapNonEmpty!11574 (= (arr!8115 _values!1525) (store mapRest!11574 mapKey!11574 mapValue!11574))))

(declare-fun res!183574 () Bool)

(declare-fun e!204596 () Bool)

(assert (=> start!33568 (=> (not res!183574) (not e!204596))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33568 (= res!183574 (validMask!0 mask!2385))))

(assert (=> start!33568 e!204596))

(assert (=> start!33568 true))

(assert (=> start!33568 tp_is_empty!6787))

(assert (=> start!33568 tp!24005))

(declare-fun e!204593 () Bool)

(declare-fun array_inv!6038 (array!17168) Bool)

(assert (=> start!33568 (and (array_inv!6038 _values!1525) e!204593)))

(declare-datatypes ((array!17170 0))(
  ( (array!17171 (arr!8116 (Array (_ BitVec 32) (_ BitVec 64))) (size!8468 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17170)

(declare-fun array_inv!6039 (array!17170) Bool)

(assert (=> start!33568 (array_inv!6039 _keys!1895)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun b!333189 () Bool)

(declare-datatypes ((SeekEntryResult!3101 0))(
  ( (MissingZero!3101 (index!14583 (_ BitVec 32))) (Found!3101 (index!14584 (_ BitVec 32))) (Intermediate!3101 (undefined!3913 Bool) (index!14585 (_ BitVec 32)) (x!33158 (_ BitVec 32))) (Undefined!3101) (MissingVacant!3101 (index!14586 (_ BitVec 32))) )
))
(declare-fun lt!159277 () SeekEntryResult!3101)

(get-info :version)

(assert (=> b!333189 (= e!204596 (and ((_ is Found!3101) lt!159277) (= (select (arr!8116 _keys!1895) (index!14584 lt!159277)) k0!1348) (bvsge (index!14584 lt!159277) #b00000000000000000000000000000000) (bvslt (index!14584 lt!159277) (size!8468 _keys!1895)) (bvsge (size!8468 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17170 (_ BitVec 32)) SeekEntryResult!3101)

(assert (=> b!333189 (= lt!159277 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11574 () Bool)

(assert (=> mapIsEmpty!11574 mapRes!11574))

(declare-fun b!333190 () Bool)

(declare-fun res!183571 () Bool)

(assert (=> b!333190 (=> (not res!183571) (not e!204596))))

(declare-fun zeroValue!1467 () V!10027)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10027)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!4918 0))(
  ( (tuple2!4919 (_1!2470 (_ BitVec 64)) (_2!2470 V!10027)) )
))
(declare-datatypes ((List!4533 0))(
  ( (Nil!4530) (Cons!4529 (h!5385 tuple2!4918) (t!9611 List!4533)) )
))
(declare-datatypes ((ListLongMap!3833 0))(
  ( (ListLongMap!3834 (toList!1932 List!4533)) )
))
(declare-fun contains!1994 (ListLongMap!3833 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1464 (array!17170 array!17168 (_ BitVec 32) (_ BitVec 32) V!10027 V!10027 (_ BitVec 32) Int) ListLongMap!3833)

(assert (=> b!333190 (= res!183571 (not (contains!1994 (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333191 () Bool)

(assert (=> b!333191 (= e!204593 (and e!204594 mapRes!11574))))

(declare-fun condMapEmpty!11574 () Bool)

(declare-fun mapDefault!11574 () ValueCell!3050)

(assert (=> b!333191 (= condMapEmpty!11574 (= (arr!8115 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3050)) mapDefault!11574)))))

(declare-fun b!333192 () Bool)

(declare-fun res!183575 () Bool)

(assert (=> b!333192 (=> (not res!183575) (not e!204596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17170 (_ BitVec 32)) Bool)

(assert (=> b!333192 (= res!183575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333193 () Bool)

(declare-fun res!183572 () Bool)

(assert (=> b!333193 (=> (not res!183572) (not e!204596))))

(declare-datatypes ((List!4534 0))(
  ( (Nil!4531) (Cons!4530 (h!5386 (_ BitVec 64)) (t!9612 List!4534)) )
))
(declare-fun arrayNoDuplicates!0 (array!17170 (_ BitVec 32) List!4534) Bool)

(assert (=> b!333193 (= res!183572 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4531))))

(declare-fun b!333194 () Bool)

(declare-fun res!183573 () Bool)

(assert (=> b!333194 (=> (not res!183573) (not e!204596))))

(assert (=> b!333194 (= res!183573 (and (= (size!8467 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8468 _keys!1895) (size!8467 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333195 () Bool)

(declare-fun res!183570 () Bool)

(assert (=> b!333195 (=> (not res!183570) (not e!204596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333195 (= res!183570 (validKeyInArray!0 k0!1348))))

(declare-fun b!333196 () Bool)

(assert (=> b!333196 (= e!204595 tp_is_empty!6787)))

(assert (= (and start!33568 res!183574) b!333194))

(assert (= (and b!333194 res!183573) b!333192))

(assert (= (and b!333192 res!183575) b!333193))

(assert (= (and b!333193 res!183572) b!333195))

(assert (= (and b!333195 res!183570) b!333190))

(assert (= (and b!333190 res!183571) b!333189))

(assert (= (and b!333191 condMapEmpty!11574) mapIsEmpty!11574))

(assert (= (and b!333191 (not condMapEmpty!11574)) mapNonEmpty!11574))

(assert (= (and mapNonEmpty!11574 ((_ is ValueCellFull!3050) mapValue!11574)) b!333196))

(assert (= (and b!333191 ((_ is ValueCellFull!3050) mapDefault!11574)) b!333188))

(assert (= start!33568 b!333191))

(declare-fun m!337765 () Bool)

(assert (=> mapNonEmpty!11574 m!337765))

(declare-fun m!337767 () Bool)

(assert (=> start!33568 m!337767))

(declare-fun m!337769 () Bool)

(assert (=> start!33568 m!337769))

(declare-fun m!337771 () Bool)

(assert (=> start!33568 m!337771))

(declare-fun m!337773 () Bool)

(assert (=> b!333192 m!337773))

(declare-fun m!337775 () Bool)

(assert (=> b!333193 m!337775))

(declare-fun m!337777 () Bool)

(assert (=> b!333190 m!337777))

(assert (=> b!333190 m!337777))

(declare-fun m!337779 () Bool)

(assert (=> b!333190 m!337779))

(declare-fun m!337781 () Bool)

(assert (=> b!333189 m!337781))

(declare-fun m!337783 () Bool)

(assert (=> b!333189 m!337783))

(declare-fun m!337785 () Bool)

(assert (=> b!333195 m!337785))

(check-sat (not b!333190) (not b!333189) (not mapNonEmpty!11574) (not b!333193) (not b!333192) (not b!333195) tp_is_empty!6787 (not b_next!6835) b_and!14027 (not start!33568))
(check-sat b_and!14027 (not b_next!6835))
(get-model)

(declare-fun b!333259 () Bool)

(declare-fun e!204634 () Bool)

(declare-fun e!204633 () Bool)

(assert (=> b!333259 (= e!204634 e!204633)))

(declare-fun lt!159292 () (_ BitVec 64))

(assert (=> b!333259 (= lt!159292 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10345 0))(
  ( (Unit!10346) )
))
(declare-fun lt!159291 () Unit!10345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17170 (_ BitVec 64) (_ BitVec 32)) Unit!10345)

(assert (=> b!333259 (= lt!159291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159292 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333259 (arrayContainsKey!0 _keys!1895 lt!159292 #b00000000000000000000000000000000)))

(declare-fun lt!159290 () Unit!10345)

(assert (=> b!333259 (= lt!159290 lt!159291)))

(declare-fun res!183616 () Bool)

(assert (=> b!333259 (= res!183616 (= (seekEntryOrOpen!0 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3101 #b00000000000000000000000000000000)))))

(assert (=> b!333259 (=> (not res!183616) (not e!204633))))

(declare-fun b!333260 () Bool)

(declare-fun e!204635 () Bool)

(assert (=> b!333260 (= e!204635 e!204634)))

(declare-fun c!52136 () Bool)

(assert (=> b!333260 (= c!52136 (validKeyInArray!0 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26255 () Bool)

(declare-fun call!26258 () Bool)

(assert (=> bm!26255 (= call!26258 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!333261 () Bool)

(assert (=> b!333261 (= e!204634 call!26258)))

(declare-fun d!70611 () Bool)

(declare-fun res!183617 () Bool)

(assert (=> d!70611 (=> res!183617 e!204635)))

(assert (=> d!70611 (= res!183617 (bvsge #b00000000000000000000000000000000 (size!8468 _keys!1895)))))

(assert (=> d!70611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204635)))

(declare-fun b!333262 () Bool)

(assert (=> b!333262 (= e!204633 call!26258)))

(assert (= (and d!70611 (not res!183617)) b!333260))

(assert (= (and b!333260 c!52136) b!333259))

(assert (= (and b!333260 (not c!52136)) b!333261))

(assert (= (and b!333259 res!183616) b!333262))

(assert (= (or b!333262 b!333261) bm!26255))

(declare-fun m!337831 () Bool)

(assert (=> b!333259 m!337831))

(declare-fun m!337833 () Bool)

(assert (=> b!333259 m!337833))

(declare-fun m!337835 () Bool)

(assert (=> b!333259 m!337835))

(assert (=> b!333259 m!337831))

(declare-fun m!337837 () Bool)

(assert (=> b!333259 m!337837))

(assert (=> b!333260 m!337831))

(assert (=> b!333260 m!337831))

(declare-fun m!337839 () Bool)

(assert (=> b!333260 m!337839))

(declare-fun m!337841 () Bool)

(assert (=> bm!26255 m!337841))

(assert (=> b!333192 d!70611))

(declare-fun b!333273 () Bool)

(declare-fun e!204647 () Bool)

(declare-fun call!26261 () Bool)

(assert (=> b!333273 (= e!204647 call!26261)))

(declare-fun b!333274 () Bool)

(declare-fun e!204646 () Bool)

(declare-fun e!204644 () Bool)

(assert (=> b!333274 (= e!204646 e!204644)))

(declare-fun res!183625 () Bool)

(assert (=> b!333274 (=> (not res!183625) (not e!204644))))

(declare-fun e!204645 () Bool)

(assert (=> b!333274 (= res!183625 (not e!204645))))

(declare-fun res!183626 () Bool)

(assert (=> b!333274 (=> (not res!183626) (not e!204645))))

(assert (=> b!333274 (= res!183626 (validKeyInArray!0 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26258 () Bool)

(declare-fun c!52139 () Bool)

(assert (=> bm!26258 (= call!26261 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52139 (Cons!4530 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000) Nil!4531) Nil!4531)))))

(declare-fun b!333275 () Bool)

(assert (=> b!333275 (= e!204644 e!204647)))

(assert (=> b!333275 (= c!52139 (validKeyInArray!0 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333276 () Bool)

(declare-fun contains!1996 (List!4534 (_ BitVec 64)) Bool)

(assert (=> b!333276 (= e!204645 (contains!1996 Nil!4531 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333277 () Bool)

(assert (=> b!333277 (= e!204647 call!26261)))

(declare-fun d!70613 () Bool)

(declare-fun res!183624 () Bool)

(assert (=> d!70613 (=> res!183624 e!204646)))

(assert (=> d!70613 (= res!183624 (bvsge #b00000000000000000000000000000000 (size!8468 _keys!1895)))))

(assert (=> d!70613 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4531) e!204646)))

(assert (= (and d!70613 (not res!183624)) b!333274))

(assert (= (and b!333274 res!183626) b!333276))

(assert (= (and b!333274 res!183625) b!333275))

(assert (= (and b!333275 c!52139) b!333277))

(assert (= (and b!333275 (not c!52139)) b!333273))

(assert (= (or b!333277 b!333273) bm!26258))

(assert (=> b!333274 m!337831))

(assert (=> b!333274 m!337831))

(assert (=> b!333274 m!337839))

(assert (=> bm!26258 m!337831))

(declare-fun m!337843 () Bool)

(assert (=> bm!26258 m!337843))

(assert (=> b!333275 m!337831))

(assert (=> b!333275 m!337831))

(assert (=> b!333275 m!337839))

(assert (=> b!333276 m!337831))

(assert (=> b!333276 m!337831))

(declare-fun m!337845 () Bool)

(assert (=> b!333276 m!337845))

(assert (=> b!333193 d!70613))

(declare-fun b!333290 () Bool)

(declare-fun e!204655 () SeekEntryResult!3101)

(declare-fun e!204654 () SeekEntryResult!3101)

(assert (=> b!333290 (= e!204655 e!204654)))

(declare-fun lt!159299 () (_ BitVec 64))

(declare-fun lt!159300 () SeekEntryResult!3101)

(assert (=> b!333290 (= lt!159299 (select (arr!8116 _keys!1895) (index!14585 lt!159300)))))

(declare-fun c!52146 () Bool)

(assert (=> b!333290 (= c!52146 (= lt!159299 k0!1348))))

(declare-fun d!70615 () Bool)

(declare-fun lt!159301 () SeekEntryResult!3101)

(assert (=> d!70615 (and (or ((_ is Undefined!3101) lt!159301) (not ((_ is Found!3101) lt!159301)) (and (bvsge (index!14584 lt!159301) #b00000000000000000000000000000000) (bvslt (index!14584 lt!159301) (size!8468 _keys!1895)))) (or ((_ is Undefined!3101) lt!159301) ((_ is Found!3101) lt!159301) (not ((_ is MissingZero!3101) lt!159301)) (and (bvsge (index!14583 lt!159301) #b00000000000000000000000000000000) (bvslt (index!14583 lt!159301) (size!8468 _keys!1895)))) (or ((_ is Undefined!3101) lt!159301) ((_ is Found!3101) lt!159301) ((_ is MissingZero!3101) lt!159301) (not ((_ is MissingVacant!3101) lt!159301)) (and (bvsge (index!14586 lt!159301) #b00000000000000000000000000000000) (bvslt (index!14586 lt!159301) (size!8468 _keys!1895)))) (or ((_ is Undefined!3101) lt!159301) (ite ((_ is Found!3101) lt!159301) (= (select (arr!8116 _keys!1895) (index!14584 lt!159301)) k0!1348) (ite ((_ is MissingZero!3101) lt!159301) (= (select (arr!8116 _keys!1895) (index!14583 lt!159301)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3101) lt!159301) (= (select (arr!8116 _keys!1895) (index!14586 lt!159301)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70615 (= lt!159301 e!204655)))

(declare-fun c!52148 () Bool)

(assert (=> d!70615 (= c!52148 (and ((_ is Intermediate!3101) lt!159300) (undefined!3913 lt!159300)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17170 (_ BitVec 32)) SeekEntryResult!3101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70615 (= lt!159300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70615 (validMask!0 mask!2385)))

(assert (=> d!70615 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159301)))

(declare-fun b!333291 () Bool)

(assert (=> b!333291 (= e!204654 (Found!3101 (index!14585 lt!159300)))))

(declare-fun b!333292 () Bool)

(declare-fun c!52147 () Bool)

(assert (=> b!333292 (= c!52147 (= lt!159299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!204656 () SeekEntryResult!3101)

(assert (=> b!333292 (= e!204654 e!204656)))

(declare-fun b!333293 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17170 (_ BitVec 32)) SeekEntryResult!3101)

(assert (=> b!333293 (= e!204656 (seekKeyOrZeroReturnVacant!0 (x!33158 lt!159300) (index!14585 lt!159300) (index!14585 lt!159300) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333294 () Bool)

(assert (=> b!333294 (= e!204655 Undefined!3101)))

(declare-fun b!333295 () Bool)

(assert (=> b!333295 (= e!204656 (MissingZero!3101 (index!14585 lt!159300)))))

(assert (= (and d!70615 c!52148) b!333294))

(assert (= (and d!70615 (not c!52148)) b!333290))

(assert (= (and b!333290 c!52146) b!333291))

(assert (= (and b!333290 (not c!52146)) b!333292))

(assert (= (and b!333292 c!52147) b!333295))

(assert (= (and b!333292 (not c!52147)) b!333293))

(declare-fun m!337847 () Bool)

(assert (=> b!333290 m!337847))

(declare-fun m!337849 () Bool)

(assert (=> d!70615 m!337849))

(assert (=> d!70615 m!337767))

(declare-fun m!337851 () Bool)

(assert (=> d!70615 m!337851))

(declare-fun m!337853 () Bool)

(assert (=> d!70615 m!337853))

(declare-fun m!337855 () Bool)

(assert (=> d!70615 m!337855))

(assert (=> d!70615 m!337853))

(declare-fun m!337857 () Bool)

(assert (=> d!70615 m!337857))

(declare-fun m!337859 () Bool)

(assert (=> b!333293 m!337859))

(assert (=> b!333189 d!70615))

(declare-fun d!70617 () Bool)

(assert (=> d!70617 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333195 d!70617))

(declare-fun d!70619 () Bool)

(declare-fun e!204661 () Bool)

(assert (=> d!70619 e!204661))

(declare-fun res!183629 () Bool)

(assert (=> d!70619 (=> res!183629 e!204661)))

(declare-fun lt!159310 () Bool)

(assert (=> d!70619 (= res!183629 (not lt!159310))))

(declare-fun lt!159313 () Bool)

(assert (=> d!70619 (= lt!159310 lt!159313)))

(declare-fun lt!159312 () Unit!10345)

(declare-fun e!204662 () Unit!10345)

(assert (=> d!70619 (= lt!159312 e!204662)))

(declare-fun c!52151 () Bool)

(assert (=> d!70619 (= c!52151 lt!159313)))

(declare-fun containsKey!315 (List!4533 (_ BitVec 64)) Bool)

(assert (=> d!70619 (= lt!159313 (containsKey!315 (toList!1932 (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70619 (= (contains!1994 (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159310)))

(declare-fun b!333302 () Bool)

(declare-fun lt!159311 () Unit!10345)

(assert (=> b!333302 (= e!204662 lt!159311)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!263 (List!4533 (_ BitVec 64)) Unit!10345)

(assert (=> b!333302 (= lt!159311 (lemmaContainsKeyImpliesGetValueByKeyDefined!263 (toList!1932 (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!330 0))(
  ( (Some!329 (v!5603 V!10027)) (None!328) )
))
(declare-fun isDefined!264 (Option!330) Bool)

(declare-fun getValueByKey!324 (List!4533 (_ BitVec 64)) Option!330)

(assert (=> b!333302 (isDefined!264 (getValueByKey!324 (toList!1932 (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!333303 () Bool)

(declare-fun Unit!10347 () Unit!10345)

(assert (=> b!333303 (= e!204662 Unit!10347)))

(declare-fun b!333304 () Bool)

(assert (=> b!333304 (= e!204661 (isDefined!264 (getValueByKey!324 (toList!1932 (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70619 c!52151) b!333302))

(assert (= (and d!70619 (not c!52151)) b!333303))

(assert (= (and d!70619 (not res!183629)) b!333304))

(declare-fun m!337861 () Bool)

(assert (=> d!70619 m!337861))

(declare-fun m!337863 () Bool)

(assert (=> b!333302 m!337863))

(declare-fun m!337865 () Bool)

(assert (=> b!333302 m!337865))

(assert (=> b!333302 m!337865))

(declare-fun m!337867 () Bool)

(assert (=> b!333302 m!337867))

(assert (=> b!333304 m!337865))

(assert (=> b!333304 m!337865))

(assert (=> b!333304 m!337867))

(assert (=> b!333190 d!70619))

(declare-fun b!333347 () Bool)

(declare-fun e!204693 () Bool)

(assert (=> b!333347 (= e!204693 (validKeyInArray!0 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26273 () Bool)

(declare-fun call!26278 () ListLongMap!3833)

(declare-fun getCurrentListMapNoExtraKeys!581 (array!17170 array!17168 (_ BitVec 32) (_ BitVec 32) V!10027 V!10027 (_ BitVec 32) Int) ListLongMap!3833)

(assert (=> bm!26273 (= call!26278 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!333348 () Bool)

(declare-fun e!204690 () Bool)

(declare-fun e!204691 () Bool)

(assert (=> b!333348 (= e!204690 e!204691)))

(declare-fun res!183655 () Bool)

(declare-fun call!26282 () Bool)

(assert (=> b!333348 (= res!183655 call!26282)))

(assert (=> b!333348 (=> (not res!183655) (not e!204691))))

(declare-fun b!333349 () Bool)

(declare-fun e!204689 () Unit!10345)

(declare-fun lt!159379 () Unit!10345)

(assert (=> b!333349 (= e!204689 lt!159379)))

(declare-fun lt!159359 () ListLongMap!3833)

(assert (=> b!333349 (= lt!159359 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159374 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159369 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159369 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159363 () Unit!10345)

(declare-fun addStillContains!241 (ListLongMap!3833 (_ BitVec 64) V!10027 (_ BitVec 64)) Unit!10345)

(assert (=> b!333349 (= lt!159363 (addStillContains!241 lt!159359 lt!159374 zeroValue!1467 lt!159369))))

(declare-fun +!716 (ListLongMap!3833 tuple2!4918) ListLongMap!3833)

(assert (=> b!333349 (contains!1994 (+!716 lt!159359 (tuple2!4919 lt!159374 zeroValue!1467)) lt!159369)))

(declare-fun lt!159361 () Unit!10345)

(assert (=> b!333349 (= lt!159361 lt!159363)))

(declare-fun lt!159378 () ListLongMap!3833)

(assert (=> b!333349 (= lt!159378 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159366 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159375 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159375 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159370 () Unit!10345)

(declare-fun addApplyDifferent!241 (ListLongMap!3833 (_ BitVec 64) V!10027 (_ BitVec 64)) Unit!10345)

(assert (=> b!333349 (= lt!159370 (addApplyDifferent!241 lt!159378 lt!159366 minValue!1467 lt!159375))))

(declare-fun apply!265 (ListLongMap!3833 (_ BitVec 64)) V!10027)

(assert (=> b!333349 (= (apply!265 (+!716 lt!159378 (tuple2!4919 lt!159366 minValue!1467)) lt!159375) (apply!265 lt!159378 lt!159375))))

(declare-fun lt!159377 () Unit!10345)

(assert (=> b!333349 (= lt!159377 lt!159370)))

(declare-fun lt!159373 () ListLongMap!3833)

(assert (=> b!333349 (= lt!159373 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159360 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159358 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159358 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159371 () Unit!10345)

(assert (=> b!333349 (= lt!159371 (addApplyDifferent!241 lt!159373 lt!159360 zeroValue!1467 lt!159358))))

(assert (=> b!333349 (= (apply!265 (+!716 lt!159373 (tuple2!4919 lt!159360 zeroValue!1467)) lt!159358) (apply!265 lt!159373 lt!159358))))

(declare-fun lt!159367 () Unit!10345)

(assert (=> b!333349 (= lt!159367 lt!159371)))

(declare-fun lt!159364 () ListLongMap!3833)

(assert (=> b!333349 (= lt!159364 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159372 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159372 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159365 () (_ BitVec 64))

(assert (=> b!333349 (= lt!159365 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!333349 (= lt!159379 (addApplyDifferent!241 lt!159364 lt!159372 minValue!1467 lt!159365))))

(assert (=> b!333349 (= (apply!265 (+!716 lt!159364 (tuple2!4919 lt!159372 minValue!1467)) lt!159365) (apply!265 lt!159364 lt!159365))))

(declare-fun c!52168 () Bool)

(declare-fun bm!26274 () Bool)

(declare-fun c!52169 () Bool)

(declare-fun call!26279 () ListLongMap!3833)

(declare-fun call!26277 () ListLongMap!3833)

(declare-fun call!26276 () ListLongMap!3833)

(assert (=> bm!26274 (= call!26279 (+!716 (ite c!52169 call!26278 (ite c!52168 call!26277 call!26276)) (ite (or c!52169 c!52168) (tuple2!4919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!4919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26275 () Bool)

(assert (=> bm!26275 (= call!26276 call!26277)))

(declare-fun bm!26276 () Bool)

(declare-fun call!26281 () Bool)

(declare-fun lt!159368 () ListLongMap!3833)

(assert (=> bm!26276 (= call!26281 (contains!1994 lt!159368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333350 () Bool)

(declare-fun e!204699 () Bool)

(assert (=> b!333350 (= e!204699 (not call!26281))))

(declare-fun b!333351 () Bool)

(declare-fun e!204694 () ListLongMap!3833)

(declare-fun e!204695 () ListLongMap!3833)

(assert (=> b!333351 (= e!204694 e!204695)))

(assert (=> b!333351 (= c!52168 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333352 () Bool)

(declare-fun e!204696 () Bool)

(declare-fun e!204692 () Bool)

(assert (=> b!333352 (= e!204696 e!204692)))

(declare-fun res!183652 () Bool)

(assert (=> b!333352 (=> (not res!183652) (not e!204692))))

(assert (=> b!333352 (= res!183652 (contains!1994 lt!159368 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!333352 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8468 _keys!1895)))))

(declare-fun bm!26277 () Bool)

(declare-fun call!26280 () ListLongMap!3833)

(assert (=> bm!26277 (= call!26280 call!26279)))

(declare-fun b!333354 () Bool)

(declare-fun res!183653 () Bool)

(declare-fun e!204700 () Bool)

(assert (=> b!333354 (=> (not res!183653) (not e!204700))))

(assert (=> b!333354 (= res!183653 e!204696)))

(declare-fun res!183651 () Bool)

(assert (=> b!333354 (=> res!183651 e!204696)))

(declare-fun e!204697 () Bool)

(assert (=> b!333354 (= res!183651 (not e!204697))))

(declare-fun res!183648 () Bool)

(assert (=> b!333354 (=> (not res!183648) (not e!204697))))

(assert (=> b!333354 (= res!183648 (bvslt #b00000000000000000000000000000000 (size!8468 _keys!1895)))))

(declare-fun b!333355 () Bool)

(assert (=> b!333355 (= e!204690 (not call!26282))))

(declare-fun b!333356 () Bool)

(declare-fun Unit!10348 () Unit!10345)

(assert (=> b!333356 (= e!204689 Unit!10348)))

(declare-fun b!333357 () Bool)

(declare-fun e!204701 () Bool)

(assert (=> b!333357 (= e!204699 e!204701)))

(declare-fun res!183650 () Bool)

(assert (=> b!333357 (= res!183650 call!26281)))

(assert (=> b!333357 (=> (not res!183650) (not e!204701))))

(declare-fun bm!26278 () Bool)

(assert (=> bm!26278 (= call!26282 (contains!1994 lt!159368 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333358 () Bool)

(declare-fun e!204698 () ListLongMap!3833)

(assert (=> b!333358 (= e!204698 call!26276)))

(declare-fun b!333359 () Bool)

(assert (=> b!333359 (= e!204695 call!26280)))

(declare-fun bm!26279 () Bool)

(assert (=> bm!26279 (= call!26277 call!26278)))

(declare-fun b!333360 () Bool)

(assert (=> b!333360 (= e!204691 (= (apply!265 lt!159368 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!333361 () Bool)

(declare-fun get!4479 (ValueCell!3050 V!10027) V!10027)

(declare-fun dynLambda!608 (Int (_ BitVec 64)) V!10027)

(assert (=> b!333361 (= e!204692 (= (apply!265 lt!159368 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)) (get!4479 (select (arr!8115 _values!1525) #b00000000000000000000000000000000) (dynLambda!608 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8467 _values!1525)))))

(assert (=> b!333361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8468 _keys!1895)))))

(declare-fun b!333362 () Bool)

(assert (=> b!333362 (= e!204697 (validKeyInArray!0 (select (arr!8116 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333363 () Bool)

(declare-fun res!183654 () Bool)

(assert (=> b!333363 (=> (not res!183654) (not e!204700))))

(assert (=> b!333363 (= res!183654 e!204699)))

(declare-fun c!52165 () Bool)

(assert (=> b!333363 (= c!52165 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!333364 () Bool)

(assert (=> b!333364 (= e!204701 (= (apply!265 lt!159368 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!333365 () Bool)

(declare-fun c!52166 () Bool)

(assert (=> b!333365 (= c!52166 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!333365 (= e!204695 e!204698)))

(declare-fun d!70621 () Bool)

(assert (=> d!70621 e!204700))

(declare-fun res!183649 () Bool)

(assert (=> d!70621 (=> (not res!183649) (not e!204700))))

(assert (=> d!70621 (= res!183649 (or (bvsge #b00000000000000000000000000000000 (size!8468 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8468 _keys!1895)))))))

(declare-fun lt!159376 () ListLongMap!3833)

(assert (=> d!70621 (= lt!159368 lt!159376)))

(declare-fun lt!159362 () Unit!10345)

(assert (=> d!70621 (= lt!159362 e!204689)))

(declare-fun c!52167 () Bool)

(assert (=> d!70621 (= c!52167 e!204693)))

(declare-fun res!183656 () Bool)

(assert (=> d!70621 (=> (not res!183656) (not e!204693))))

(assert (=> d!70621 (= res!183656 (bvslt #b00000000000000000000000000000000 (size!8468 _keys!1895)))))

(assert (=> d!70621 (= lt!159376 e!204694)))

(assert (=> d!70621 (= c!52169 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70621 (validMask!0 mask!2385)))

(assert (=> d!70621 (= (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159368)))

(declare-fun b!333353 () Bool)

(assert (=> b!333353 (= e!204698 call!26280)))

(declare-fun b!333366 () Bool)

(assert (=> b!333366 (= e!204694 (+!716 call!26279 (tuple2!4919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!333367 () Bool)

(assert (=> b!333367 (= e!204700 e!204690)))

(declare-fun c!52164 () Bool)

(assert (=> b!333367 (= c!52164 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!70621 c!52169) b!333366))

(assert (= (and d!70621 (not c!52169)) b!333351))

(assert (= (and b!333351 c!52168) b!333359))

(assert (= (and b!333351 (not c!52168)) b!333365))

(assert (= (and b!333365 c!52166) b!333353))

(assert (= (and b!333365 (not c!52166)) b!333358))

(assert (= (or b!333353 b!333358) bm!26275))

(assert (= (or b!333359 bm!26275) bm!26279))

(assert (= (or b!333359 b!333353) bm!26277))

(assert (= (or b!333366 bm!26279) bm!26273))

(assert (= (or b!333366 bm!26277) bm!26274))

(assert (= (and d!70621 res!183656) b!333347))

(assert (= (and d!70621 c!52167) b!333349))

(assert (= (and d!70621 (not c!52167)) b!333356))

(assert (= (and d!70621 res!183649) b!333354))

(assert (= (and b!333354 res!183648) b!333362))

(assert (= (and b!333354 (not res!183651)) b!333352))

(assert (= (and b!333352 res!183652) b!333361))

(assert (= (and b!333354 res!183653) b!333363))

(assert (= (and b!333363 c!52165) b!333357))

(assert (= (and b!333363 (not c!52165)) b!333350))

(assert (= (and b!333357 res!183650) b!333364))

(assert (= (or b!333357 b!333350) bm!26276))

(assert (= (and b!333363 res!183654) b!333367))

(assert (= (and b!333367 c!52164) b!333348))

(assert (= (and b!333367 (not c!52164)) b!333355))

(assert (= (and b!333348 res!183655) b!333360))

(assert (= (or b!333348 b!333355) bm!26278))

(declare-fun b_lambda!8421 () Bool)

(assert (=> (not b_lambda!8421) (not b!333361)))

(declare-fun t!9616 () Bool)

(declare-fun tb!3037 () Bool)

(assert (=> (and start!33568 (= defaultEntry!1528 defaultEntry!1528) t!9616) tb!3037))

(declare-fun result!5457 () Bool)

(assert (=> tb!3037 (= result!5457 tp_is_empty!6787)))

(assert (=> b!333361 t!9616))

(declare-fun b_and!14033 () Bool)

(assert (= b_and!14027 (and (=> t!9616 result!5457) b_and!14033)))

(declare-fun m!337869 () Bool)

(assert (=> bm!26274 m!337869))

(declare-fun m!337871 () Bool)

(assert (=> bm!26276 m!337871))

(assert (=> b!333361 m!337831))

(assert (=> b!333361 m!337831))

(declare-fun m!337873 () Bool)

(assert (=> b!333361 m!337873))

(declare-fun m!337875 () Bool)

(assert (=> b!333361 m!337875))

(declare-fun m!337877 () Bool)

(assert (=> b!333361 m!337877))

(declare-fun m!337879 () Bool)

(assert (=> b!333361 m!337879))

(assert (=> b!333361 m!337875))

(assert (=> b!333361 m!337877))

(assert (=> b!333362 m!337831))

(assert (=> b!333362 m!337831))

(assert (=> b!333362 m!337839))

(declare-fun m!337881 () Bool)

(assert (=> b!333366 m!337881))

(declare-fun m!337883 () Bool)

(assert (=> bm!26278 m!337883))

(declare-fun m!337885 () Bool)

(assert (=> b!333349 m!337885))

(declare-fun m!337887 () Bool)

(assert (=> b!333349 m!337887))

(declare-fun m!337889 () Bool)

(assert (=> b!333349 m!337889))

(assert (=> b!333349 m!337831))

(declare-fun m!337891 () Bool)

(assert (=> b!333349 m!337891))

(declare-fun m!337893 () Bool)

(assert (=> b!333349 m!337893))

(declare-fun m!337895 () Bool)

(assert (=> b!333349 m!337895))

(declare-fun m!337897 () Bool)

(assert (=> b!333349 m!337897))

(assert (=> b!333349 m!337891))

(assert (=> b!333349 m!337889))

(declare-fun m!337899 () Bool)

(assert (=> b!333349 m!337899))

(declare-fun m!337901 () Bool)

(assert (=> b!333349 m!337901))

(assert (=> b!333349 m!337897))

(declare-fun m!337903 () Bool)

(assert (=> b!333349 m!337903))

(declare-fun m!337905 () Bool)

(assert (=> b!333349 m!337905))

(declare-fun m!337907 () Bool)

(assert (=> b!333349 m!337907))

(declare-fun m!337909 () Bool)

(assert (=> b!333349 m!337909))

(assert (=> b!333349 m!337901))

(declare-fun m!337911 () Bool)

(assert (=> b!333349 m!337911))

(declare-fun m!337913 () Bool)

(assert (=> b!333349 m!337913))

(declare-fun m!337915 () Bool)

(assert (=> b!333349 m!337915))

(declare-fun m!337917 () Bool)

(assert (=> b!333360 m!337917))

(assert (=> b!333352 m!337831))

(assert (=> b!333352 m!337831))

(declare-fun m!337919 () Bool)

(assert (=> b!333352 m!337919))

(assert (=> bm!26273 m!337887))

(assert (=> b!333347 m!337831))

(assert (=> b!333347 m!337831))

(assert (=> b!333347 m!337839))

(declare-fun m!337921 () Bool)

(assert (=> b!333364 m!337921))

(assert (=> d!70621 m!337767))

(assert (=> b!333190 d!70621))

(declare-fun d!70623 () Bool)

(assert (=> d!70623 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33568 d!70623))

(declare-fun d!70625 () Bool)

(assert (=> d!70625 (= (array_inv!6038 _values!1525) (bvsge (size!8467 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33568 d!70625))

(declare-fun d!70627 () Bool)

(assert (=> d!70627 (= (array_inv!6039 _keys!1895) (bvsge (size!8468 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33568 d!70627))

(declare-fun condMapEmpty!11583 () Bool)

(declare-fun mapDefault!11583 () ValueCell!3050)

(assert (=> mapNonEmpty!11574 (= condMapEmpty!11583 (= mapRest!11574 ((as const (Array (_ BitVec 32) ValueCell!3050)) mapDefault!11583)))))

(declare-fun e!204707 () Bool)

(declare-fun mapRes!11583 () Bool)

(assert (=> mapNonEmpty!11574 (= tp!24006 (and e!204707 mapRes!11583))))

(declare-fun b!333376 () Bool)

(declare-fun e!204706 () Bool)

(assert (=> b!333376 (= e!204706 tp_is_empty!6787)))

(declare-fun mapIsEmpty!11583 () Bool)

(assert (=> mapIsEmpty!11583 mapRes!11583))

(declare-fun mapNonEmpty!11583 () Bool)

(declare-fun tp!24021 () Bool)

(assert (=> mapNonEmpty!11583 (= mapRes!11583 (and tp!24021 e!204706))))

(declare-fun mapKey!11583 () (_ BitVec 32))

(declare-fun mapRest!11583 () (Array (_ BitVec 32) ValueCell!3050))

(declare-fun mapValue!11583 () ValueCell!3050)

(assert (=> mapNonEmpty!11583 (= mapRest!11574 (store mapRest!11583 mapKey!11583 mapValue!11583))))

(declare-fun b!333377 () Bool)

(assert (=> b!333377 (= e!204707 tp_is_empty!6787)))

(assert (= (and mapNonEmpty!11574 condMapEmpty!11583) mapIsEmpty!11583))

(assert (= (and mapNonEmpty!11574 (not condMapEmpty!11583)) mapNonEmpty!11583))

(assert (= (and mapNonEmpty!11583 ((_ is ValueCellFull!3050) mapValue!11583)) b!333376))

(assert (= (and mapNonEmpty!11574 ((_ is ValueCellFull!3050) mapDefault!11583)) b!333377))

(declare-fun m!337923 () Bool)

(assert (=> mapNonEmpty!11583 m!337923))

(declare-fun b_lambda!8423 () Bool)

(assert (= b_lambda!8421 (or (and start!33568 b_free!6835) b_lambda!8423)))

(check-sat (not b!333276) (not b!333352) (not b!333259) (not b!333349) (not b!333293) (not bm!26276) (not b!333304) (not b!333260) (not b!333274) tp_is_empty!6787 (not bm!26274) (not b!333360) (not mapNonEmpty!11583) (not b_lambda!8423) (not d!70621) (not bm!26258) (not bm!26278) b_and!14033 (not b!333366) (not b!333361) (not d!70615) (not b!333364) (not b!333362) (not b!333275) (not b!333302) (not d!70619) (not bm!26273) (not b!333347) (not bm!26255) (not b_next!6835))
(check-sat b_and!14033 (not b_next!6835))
