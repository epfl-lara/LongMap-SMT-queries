; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35350 () Bool)

(assert start!35350)

(declare-fun b!354001 () Bool)

(declare-fun e!216880 () Bool)

(declare-fun tp_is_empty!7815 () Bool)

(assert (=> b!354001 (= e!216880 tp_is_empty!7815)))

(declare-fun b!354002 () Bool)

(declare-fun res!196259 () Bool)

(declare-fun e!216884 () Bool)

(assert (=> b!354002 (=> (not res!196259) (not e!216884))))

(declare-datatypes ((array!19219 0))(
  ( (array!19220 (arr!9104 (Array (_ BitVec 32) (_ BitVec 64))) (size!9456 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19219)

(declare-datatypes ((List!5285 0))(
  ( (Nil!5282) (Cons!5281 (h!6137 (_ BitVec 64)) (t!10435 List!5285)) )
))
(declare-fun arrayNoDuplicates!0 (array!19219 (_ BitVec 32) List!5285) Bool)

(assert (=> b!354002 (= res!196259 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5282))))

(declare-fun mapIsEmpty!13227 () Bool)

(declare-fun mapRes!13227 () Bool)

(assert (=> mapIsEmpty!13227 mapRes!13227))

(declare-fun mapNonEmpty!13227 () Bool)

(declare-fun tp!27123 () Bool)

(declare-fun e!216883 () Bool)

(assert (=> mapNonEmpty!13227 (= mapRes!13227 (and tp!27123 e!216883))))

(declare-datatypes ((V!11397 0))(
  ( (V!11398 (val!3952 Int)) )
))
(declare-datatypes ((ValueCell!3564 0))(
  ( (ValueCellFull!3564 (v!6146 V!11397)) (EmptyCell!3564) )
))
(declare-datatypes ((array!19221 0))(
  ( (array!19222 (arr!9105 (Array (_ BitVec 32) ValueCell!3564)) (size!9457 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19221)

(declare-fun mapKey!13227 () (_ BitVec 32))

(declare-fun mapValue!13227 () ValueCell!3564)

(declare-fun mapRest!13227 () (Array (_ BitVec 32) ValueCell!3564))

(assert (=> mapNonEmpty!13227 (= (arr!9105 _values!1208) (store mapRest!13227 mapKey!13227 mapValue!13227))))

(declare-fun b!354003 () Bool)

(declare-fun res!196261 () Bool)

(assert (=> b!354003 (=> (not res!196261) (not e!216884))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!354003 (= res!196261 (and (= (size!9457 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9456 _keys!1456) (size!9457 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354005 () Bool)

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!354005 (= e!216884 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9456 _keys!1456)) (bvsge (size!9456 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!354006 () Bool)

(assert (=> b!354006 (= e!216883 tp_is_empty!7815)))

(declare-fun b!354007 () Bool)

(declare-fun res!196257 () Bool)

(assert (=> b!354007 (=> (not res!196257) (not e!216884))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354007 (= res!196257 (validKeyInArray!0 k0!1077))))

(declare-fun b!354008 () Bool)

(declare-fun e!216881 () Bool)

(assert (=> b!354008 (= e!216881 (and e!216880 mapRes!13227))))

(declare-fun condMapEmpty!13227 () Bool)

(declare-fun mapDefault!13227 () ValueCell!3564)

(assert (=> b!354008 (= condMapEmpty!13227 (= (arr!9105 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3564)) mapDefault!13227)))))

(declare-fun b!354004 () Bool)

(declare-fun res!196260 () Bool)

(assert (=> b!354004 (=> (not res!196260) (not e!216884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19219 (_ BitVec 32)) Bool)

(assert (=> b!354004 (= res!196260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196258 () Bool)

(assert (=> start!35350 (=> (not res!196258) (not e!216884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35350 (= res!196258 (validMask!0 mask!1842))))

(assert (=> start!35350 e!216884))

(assert (=> start!35350 true))

(declare-fun array_inv!6700 (array!19219) Bool)

(assert (=> start!35350 (array_inv!6700 _keys!1456)))

(declare-fun array_inv!6701 (array!19221) Bool)

(assert (=> start!35350 (and (array_inv!6701 _values!1208) e!216881)))

(assert (= (and start!35350 res!196258) b!354003))

(assert (= (and b!354003 res!196261) b!354004))

(assert (= (and b!354004 res!196260) b!354002))

(assert (= (and b!354002 res!196259) b!354007))

(assert (= (and b!354007 res!196257) b!354005))

(assert (= (and b!354008 condMapEmpty!13227) mapIsEmpty!13227))

(assert (= (and b!354008 (not condMapEmpty!13227)) mapNonEmpty!13227))

(get-info :version)

(assert (= (and mapNonEmpty!13227 ((_ is ValueCellFull!3564) mapValue!13227)) b!354006))

(assert (= (and b!354008 ((_ is ValueCellFull!3564) mapDefault!13227)) b!354001))

(assert (= start!35350 b!354008))

(declare-fun m!353169 () Bool)

(assert (=> mapNonEmpty!13227 m!353169))

(declare-fun m!353171 () Bool)

(assert (=> b!354004 m!353171))

(declare-fun m!353173 () Bool)

(assert (=> b!354007 m!353173))

(declare-fun m!353175 () Bool)

(assert (=> b!354002 m!353175))

(declare-fun m!353177 () Bool)

(assert (=> start!35350 m!353177))

(declare-fun m!353179 () Bool)

(assert (=> start!35350 m!353179))

(declare-fun m!353181 () Bool)

(assert (=> start!35350 m!353181))

(check-sat (not mapNonEmpty!13227) (not b!354004) (not b!354007) (not start!35350) tp_is_empty!7815 (not b!354002))
(check-sat)
(get-model)

(declare-fun d!71673 () Bool)

(declare-fun res!196283 () Bool)

(declare-fun e!216911 () Bool)

(assert (=> d!71673 (=> res!196283 e!216911)))

(assert (=> d!71673 (= res!196283 (bvsge #b00000000000000000000000000000000 (size!9456 _keys!1456)))))

(assert (=> d!71673 (= (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5282) e!216911)))

(declare-fun b!354043 () Bool)

(declare-fun e!216908 () Bool)

(assert (=> b!354043 (= e!216911 e!216908)))

(declare-fun res!196285 () Bool)

(assert (=> b!354043 (=> (not res!196285) (not e!216908))))

(declare-fun e!216910 () Bool)

(assert (=> b!354043 (= res!196285 (not e!216910))))

(declare-fun res!196284 () Bool)

(assert (=> b!354043 (=> (not res!196284) (not e!216910))))

(assert (=> b!354043 (= res!196284 (validKeyInArray!0 (select (arr!9104 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!354044 () Bool)

(declare-fun contains!2381 (List!5285 (_ BitVec 64)) Bool)

(assert (=> b!354044 (= e!216910 (contains!2381 Nil!5282 (select (arr!9104 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun bm!27154 () Bool)

(declare-fun call!27157 () Bool)

(declare-fun c!53706 () Bool)

(assert (=> bm!27154 (= call!27157 (arrayNoDuplicates!0 _keys!1456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53706 (Cons!5281 (select (arr!9104 _keys!1456) #b00000000000000000000000000000000) Nil!5282) Nil!5282)))))

(declare-fun b!354045 () Bool)

(declare-fun e!216909 () Bool)

(assert (=> b!354045 (= e!216909 call!27157)))

(declare-fun b!354046 () Bool)

(assert (=> b!354046 (= e!216908 e!216909)))

(assert (=> b!354046 (= c!53706 (validKeyInArray!0 (select (arr!9104 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!354047 () Bool)

(assert (=> b!354047 (= e!216909 call!27157)))

(assert (= (and d!71673 (not res!196283)) b!354043))

(assert (= (and b!354043 res!196284) b!354044))

(assert (= (and b!354043 res!196285) b!354046))

(assert (= (and b!354046 c!53706) b!354045))

(assert (= (and b!354046 (not c!53706)) b!354047))

(assert (= (or b!354045 b!354047) bm!27154))

(declare-fun m!353197 () Bool)

(assert (=> b!354043 m!353197))

(assert (=> b!354043 m!353197))

(declare-fun m!353199 () Bool)

(assert (=> b!354043 m!353199))

(assert (=> b!354044 m!353197))

(assert (=> b!354044 m!353197))

(declare-fun m!353201 () Bool)

(assert (=> b!354044 m!353201))

(assert (=> bm!27154 m!353197))

(declare-fun m!353203 () Bool)

(assert (=> bm!27154 m!353203))

(assert (=> b!354046 m!353197))

(assert (=> b!354046 m!353197))

(assert (=> b!354046 m!353199))

(assert (=> b!354002 d!71673))

(declare-fun d!71675 () Bool)

(assert (=> d!71675 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35350 d!71675))

(declare-fun d!71677 () Bool)

(assert (=> d!71677 (= (array_inv!6700 _keys!1456) (bvsge (size!9456 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35350 d!71677))

(declare-fun d!71679 () Bool)

(assert (=> d!71679 (= (array_inv!6701 _values!1208) (bvsge (size!9457 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35350 d!71679))

(declare-fun d!71681 () Bool)

(declare-fun res!196291 () Bool)

(declare-fun e!216920 () Bool)

(assert (=> d!71681 (=> res!196291 e!216920)))

(assert (=> d!71681 (= res!196291 (bvsge #b00000000000000000000000000000000 (size!9456 _keys!1456)))))

(assert (=> d!71681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216920)))

(declare-fun b!354056 () Bool)

(declare-fun e!216919 () Bool)

(declare-fun call!27160 () Bool)

(assert (=> b!354056 (= e!216919 call!27160)))

(declare-fun bm!27157 () Bool)

(assert (=> bm!27157 (= call!27160 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!354057 () Bool)

(declare-fun e!216918 () Bool)

(assert (=> b!354057 (= e!216918 call!27160)))

(declare-fun b!354058 () Bool)

(assert (=> b!354058 (= e!216918 e!216919)))

(declare-fun lt!165641 () (_ BitVec 64))

(assert (=> b!354058 (= lt!165641 (select (arr!9104 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10924 0))(
  ( (Unit!10925) )
))
(declare-fun lt!165640 () Unit!10924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19219 (_ BitVec 64) (_ BitVec 32)) Unit!10924)

(assert (=> b!354058 (= lt!165640 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165641 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354058 (arrayContainsKey!0 _keys!1456 lt!165641 #b00000000000000000000000000000000)))

(declare-fun lt!165639 () Unit!10924)

(assert (=> b!354058 (= lt!165639 lt!165640)))

(declare-fun res!196290 () Bool)

(declare-datatypes ((SeekEntryResult!3490 0))(
  ( (MissingZero!3490 (index!16139 (_ BitVec 32))) (Found!3490 (index!16140 (_ BitVec 32))) (Intermediate!3490 (undefined!4302 Bool) (index!16141 (_ BitVec 32)) (x!35250 (_ BitVec 32))) (Undefined!3490) (MissingVacant!3490 (index!16142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19219 (_ BitVec 32)) SeekEntryResult!3490)

(assert (=> b!354058 (= res!196290 (= (seekEntryOrOpen!0 (select (arr!9104 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3490 #b00000000000000000000000000000000)))))

(assert (=> b!354058 (=> (not res!196290) (not e!216919))))

(declare-fun b!354059 () Bool)

(assert (=> b!354059 (= e!216920 e!216918)))

(declare-fun c!53709 () Bool)

(assert (=> b!354059 (= c!53709 (validKeyInArray!0 (select (arr!9104 _keys!1456) #b00000000000000000000000000000000)))))

(assert (= (and d!71681 (not res!196291)) b!354059))

(assert (= (and b!354059 c!53709) b!354058))

(assert (= (and b!354059 (not c!53709)) b!354057))

(assert (= (and b!354058 res!196290) b!354056))

(assert (= (or b!354056 b!354057) bm!27157))

(declare-fun m!353205 () Bool)

(assert (=> bm!27157 m!353205))

(assert (=> b!354058 m!353197))

(declare-fun m!353207 () Bool)

(assert (=> b!354058 m!353207))

(declare-fun m!353209 () Bool)

(assert (=> b!354058 m!353209))

(assert (=> b!354058 m!353197))

(declare-fun m!353211 () Bool)

(assert (=> b!354058 m!353211))

(assert (=> b!354059 m!353197))

(assert (=> b!354059 m!353197))

(assert (=> b!354059 m!353199))

(assert (=> b!354004 d!71681))

(declare-fun d!71683 () Bool)

(assert (=> d!71683 (= (validKeyInArray!0 k0!1077) (and (not (= k0!1077 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1077 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!354007 d!71683))

(declare-fun mapNonEmpty!13233 () Bool)

(declare-fun mapRes!13233 () Bool)

(declare-fun tp!27129 () Bool)

(declare-fun e!216925 () Bool)

(assert (=> mapNonEmpty!13233 (= mapRes!13233 (and tp!27129 e!216925))))

(declare-fun mapKey!13233 () (_ BitVec 32))

(declare-fun mapRest!13233 () (Array (_ BitVec 32) ValueCell!3564))

(declare-fun mapValue!13233 () ValueCell!3564)

(assert (=> mapNonEmpty!13233 (= mapRest!13227 (store mapRest!13233 mapKey!13233 mapValue!13233))))

(declare-fun b!354067 () Bool)

(declare-fun e!216926 () Bool)

(assert (=> b!354067 (= e!216926 tp_is_empty!7815)))

(declare-fun condMapEmpty!13233 () Bool)

(declare-fun mapDefault!13233 () ValueCell!3564)

(assert (=> mapNonEmpty!13227 (= condMapEmpty!13233 (= mapRest!13227 ((as const (Array (_ BitVec 32) ValueCell!3564)) mapDefault!13233)))))

(assert (=> mapNonEmpty!13227 (= tp!27123 (and e!216926 mapRes!13233))))

(declare-fun mapIsEmpty!13233 () Bool)

(assert (=> mapIsEmpty!13233 mapRes!13233))

(declare-fun b!354066 () Bool)

(assert (=> b!354066 (= e!216925 tp_is_empty!7815)))

(assert (= (and mapNonEmpty!13227 condMapEmpty!13233) mapIsEmpty!13233))

(assert (= (and mapNonEmpty!13227 (not condMapEmpty!13233)) mapNonEmpty!13233))

(assert (= (and mapNonEmpty!13233 ((_ is ValueCellFull!3564) mapValue!13233)) b!354066))

(assert (= (and mapNonEmpty!13227 ((_ is ValueCellFull!3564) mapDefault!13233)) b!354067))

(declare-fun m!353213 () Bool)

(assert (=> mapNonEmpty!13233 m!353213))

(check-sat (not bm!27157) (not b!354058) (not b!354044) (not b!354046) (not b!354043) (not mapNonEmpty!13233) tp_is_empty!7815 (not b!354059) (not bm!27154))
(check-sat)
