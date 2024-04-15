; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36004 () Bool)

(assert start!36004)

(declare-fun b!361467 () Bool)

(declare-fun res!201113 () Bool)

(declare-fun e!221373 () Bool)

(assert (=> b!361467 (=> (not res!201113) (not e!221373))))

(declare-datatypes ((array!20337 0))(
  ( (array!20338 (arr!9655 (Array (_ BitVec 32) (_ BitVec 64))) (size!10008 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20337)

(declare-datatypes ((List!5483 0))(
  ( (Nil!5480) (Cons!5479 (h!6335 (_ BitVec 64)) (t!10624 List!5483)) )
))
(declare-fun arrayNoDuplicates!0 (array!20337 (_ BitVec 32) List!5483) Bool)

(assert (=> b!361467 (= res!201113 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5480))))

(declare-fun b!361468 () Bool)

(declare-fun res!201108 () Bool)

(assert (=> b!361468 (=> (not res!201108) (not e!221373))))

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361468 (= res!201108 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10008 _keys!1541))))))

(declare-fun b!361469 () Bool)

(declare-fun e!221376 () Bool)

(declare-fun e!221377 () Bool)

(declare-fun mapRes!14130 () Bool)

(assert (=> b!361469 (= e!221376 (and e!221377 mapRes!14130))))

(declare-fun condMapEmpty!14130 () Bool)

(declare-datatypes ((V!12179 0))(
  ( (V!12180 (val!4245 Int)) )
))
(declare-datatypes ((ValueCell!3857 0))(
  ( (ValueCellFull!3857 (v!6434 V!12179)) (EmptyCell!3857) )
))
(declare-datatypes ((array!20339 0))(
  ( (array!20340 (arr!9656 (Array (_ BitVec 32) ValueCell!3857)) (size!10009 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20339)

(declare-fun mapDefault!14130 () ValueCell!3857)

(assert (=> b!361469 (= condMapEmpty!14130 (= (arr!9656 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3857)) mapDefault!14130)))))

(declare-fun mapIsEmpty!14130 () Bool)

(assert (=> mapIsEmpty!14130 mapRes!14130))

(declare-fun b!361470 () Bool)

(declare-fun e!221375 () Bool)

(declare-fun tp_is_empty!8401 () Bool)

(assert (=> b!361470 (= e!221375 tp_is_empty!8401)))

(declare-fun b!361471 () Bool)

(declare-fun k0!1134 () (_ BitVec 64))

(assert (=> b!361471 (= e!221373 (and (not (= (select (arr!9655 _keys!1541) from!1924) k0!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) (size!10008 _keys!1541))))))

(declare-fun b!361472 () Bool)

(declare-fun res!201109 () Bool)

(assert (=> b!361472 (=> (not res!201109) (not e!221373))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361472 (= res!201109 (and (= (size!10009 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10008 _keys!1541) (size!10009 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun res!201110 () Bool)

(assert (=> start!36004 (=> (not res!201110) (not e!221373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36004 (= res!201110 (validMask!0 mask!1943))))

(assert (=> start!36004 e!221373))

(assert (=> start!36004 true))

(declare-fun array_inv!7114 (array!20337) Bool)

(assert (=> start!36004 (array_inv!7114 _keys!1541)))

(declare-fun array_inv!7115 (array!20339) Bool)

(assert (=> start!36004 (and (array_inv!7115 _values!1277) e!221376)))

(declare-fun b!361473 () Bool)

(declare-fun res!201112 () Bool)

(assert (=> b!361473 (=> (not res!201112) (not e!221373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20337 (_ BitVec 32)) Bool)

(assert (=> b!361473 (= res!201112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapNonEmpty!14130 () Bool)

(declare-fun tp!28206 () Bool)

(assert (=> mapNonEmpty!14130 (= mapRes!14130 (and tp!28206 e!221375))))

(declare-fun mapValue!14130 () ValueCell!3857)

(declare-fun mapRest!14130 () (Array (_ BitVec 32) ValueCell!3857))

(declare-fun mapKey!14130 () (_ BitVec 32))

(assert (=> mapNonEmpty!14130 (= (arr!9656 _values!1277) (store mapRest!14130 mapKey!14130 mapValue!14130))))

(declare-fun b!361474 () Bool)

(declare-fun res!201111 () Bool)

(assert (=> b!361474 (=> (not res!201111) (not e!221373))))

(declare-fun arrayContainsKey!0 (array!20337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361474 (= res!201111 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun b!361475 () Bool)

(assert (=> b!361475 (= e!221377 tp_is_empty!8401)))

(assert (= (and start!36004 res!201110) b!361472))

(assert (= (and b!361472 res!201109) b!361473))

(assert (= (and b!361473 res!201112) b!361467))

(assert (= (and b!361467 res!201113) b!361468))

(assert (= (and b!361468 res!201108) b!361474))

(assert (= (and b!361474 res!201111) b!361471))

(assert (= (and b!361469 condMapEmpty!14130) mapIsEmpty!14130))

(assert (= (and b!361469 (not condMapEmpty!14130)) mapNonEmpty!14130))

(get-info :version)

(assert (= (and mapNonEmpty!14130 ((_ is ValueCellFull!3857) mapValue!14130)) b!361470))

(assert (= (and b!361469 ((_ is ValueCellFull!3857) mapDefault!14130)) b!361475))

(assert (= start!36004 b!361469))

(declare-fun m!357717 () Bool)

(assert (=> b!361467 m!357717))

(declare-fun m!357719 () Bool)

(assert (=> start!36004 m!357719))

(declare-fun m!357721 () Bool)

(assert (=> start!36004 m!357721))

(declare-fun m!357723 () Bool)

(assert (=> start!36004 m!357723))

(declare-fun m!357725 () Bool)

(assert (=> b!361471 m!357725))

(declare-fun m!357727 () Bool)

(assert (=> b!361473 m!357727))

(declare-fun m!357729 () Bool)

(assert (=> b!361474 m!357729))

(declare-fun m!357731 () Bool)

(assert (=> mapNonEmpty!14130 m!357731))

(check-sat (not b!361474) (not b!361473) tp_is_empty!8401 (not b!361467) (not start!36004) (not mapNonEmpty!14130))
(check-sat)
(get-model)

(declare-fun bm!27158 () Bool)

(declare-fun call!27161 () Bool)

(assert (=> bm!27158 (= call!27161 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361538 () Bool)

(declare-fun e!221415 () Bool)

(assert (=> b!361538 (= e!221415 call!27161)))

(declare-fun b!361539 () Bool)

(declare-fun e!221416 () Bool)

(assert (=> b!361539 (= e!221416 call!27161)))

(declare-fun b!361540 () Bool)

(assert (=> b!361540 (= e!221415 e!221416)))

(declare-fun lt!166356 () (_ BitVec 64))

(assert (=> b!361540 (= lt!166356 (select (arr!9655 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11096 0))(
  ( (Unit!11097) )
))
(declare-fun lt!166357 () Unit!11096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20337 (_ BitVec 64) (_ BitVec 32)) Unit!11096)

(assert (=> b!361540 (= lt!166357 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166356 #b00000000000000000000000000000000))))

(assert (=> b!361540 (arrayContainsKey!0 _keys!1541 lt!166356 #b00000000000000000000000000000000)))

(declare-fun lt!166358 () Unit!11096)

(assert (=> b!361540 (= lt!166358 lt!166357)))

(declare-fun res!201154 () Bool)

(declare-datatypes ((SeekEntryResult!3492 0))(
  ( (MissingZero!3492 (index!16147 (_ BitVec 32))) (Found!3492 (index!16148 (_ BitVec 32))) (Intermediate!3492 (undefined!4304 Bool) (index!16149 (_ BitVec 32)) (x!36047 (_ BitVec 32))) (Undefined!3492) (MissingVacant!3492 (index!16150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20337 (_ BitVec 32)) SeekEntryResult!3492)

(assert (=> b!361540 (= res!201154 (= (seekEntryOrOpen!0 (select (arr!9655 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3492 #b00000000000000000000000000000000)))))

(assert (=> b!361540 (=> (not res!201154) (not e!221416))))

(declare-fun b!361541 () Bool)

(declare-fun e!221414 () Bool)

(assert (=> b!361541 (= e!221414 e!221415)))

(declare-fun c!53663 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361541 (= c!53663 (validKeyInArray!0 (select (arr!9655 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71749 () Bool)

(declare-fun res!201155 () Bool)

(assert (=> d!71749 (=> res!201155 e!221414)))

(assert (=> d!71749 (= res!201155 (bvsge #b00000000000000000000000000000000 (size!10008 _keys!1541)))))

(assert (=> d!71749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221414)))

(assert (= (and d!71749 (not res!201155)) b!361541))

(assert (= (and b!361541 c!53663) b!361540))

(assert (= (and b!361541 (not c!53663)) b!361538))

(assert (= (and b!361540 res!201154) b!361539))

(assert (= (or b!361539 b!361538) bm!27158))

(declare-fun m!357765 () Bool)

(assert (=> bm!27158 m!357765))

(declare-fun m!357767 () Bool)

(assert (=> b!361540 m!357767))

(declare-fun m!357769 () Bool)

(assert (=> b!361540 m!357769))

(declare-fun m!357771 () Bool)

(assert (=> b!361540 m!357771))

(assert (=> b!361540 m!357767))

(declare-fun m!357773 () Bool)

(assert (=> b!361540 m!357773))

(assert (=> b!361541 m!357767))

(assert (=> b!361541 m!357767))

(declare-fun m!357775 () Bool)

(assert (=> b!361541 m!357775))

(assert (=> b!361473 d!71749))

(declare-fun b!361552 () Bool)

(declare-fun e!221425 () Bool)

(declare-fun e!221426 () Bool)

(assert (=> b!361552 (= e!221425 e!221426)))

(declare-fun c!53666 () Bool)

(assert (=> b!361552 (= c!53666 (validKeyInArray!0 (select (arr!9655 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361553 () Bool)

(declare-fun call!27164 () Bool)

(assert (=> b!361553 (= e!221426 call!27164)))

(declare-fun bm!27161 () Bool)

(assert (=> bm!27161 (= call!27164 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53666 (Cons!5479 (select (arr!9655 _keys!1541) #b00000000000000000000000000000000) Nil!5480) Nil!5480)))))

(declare-fun d!71751 () Bool)

(declare-fun res!201163 () Bool)

(declare-fun e!221428 () Bool)

(assert (=> d!71751 (=> res!201163 e!221428)))

(assert (=> d!71751 (= res!201163 (bvsge #b00000000000000000000000000000000 (size!10008 _keys!1541)))))

(assert (=> d!71751 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5480) e!221428)))

(declare-fun b!361554 () Bool)

(assert (=> b!361554 (= e!221428 e!221425)))

(declare-fun res!201162 () Bool)

(assert (=> b!361554 (=> (not res!201162) (not e!221425))))

(declare-fun e!221427 () Bool)

(assert (=> b!361554 (= res!201162 (not e!221427))))

(declare-fun res!201164 () Bool)

(assert (=> b!361554 (=> (not res!201164) (not e!221427))))

(assert (=> b!361554 (= res!201164 (validKeyInArray!0 (select (arr!9655 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361555 () Bool)

(assert (=> b!361555 (= e!221426 call!27164)))

(declare-fun b!361556 () Bool)

(declare-fun contains!2417 (List!5483 (_ BitVec 64)) Bool)

(assert (=> b!361556 (= e!221427 (contains!2417 Nil!5480 (select (arr!9655 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71751 (not res!201163)) b!361554))

(assert (= (and b!361554 res!201164) b!361556))

(assert (= (and b!361554 res!201162) b!361552))

(assert (= (and b!361552 c!53666) b!361553))

(assert (= (and b!361552 (not c!53666)) b!361555))

(assert (= (or b!361553 b!361555) bm!27161))

(assert (=> b!361552 m!357767))

(assert (=> b!361552 m!357767))

(assert (=> b!361552 m!357775))

(assert (=> bm!27161 m!357767))

(declare-fun m!357777 () Bool)

(assert (=> bm!27161 m!357777))

(assert (=> b!361554 m!357767))

(assert (=> b!361554 m!357767))

(assert (=> b!361554 m!357775))

(assert (=> b!361556 m!357767))

(assert (=> b!361556 m!357767))

(declare-fun m!357779 () Bool)

(assert (=> b!361556 m!357779))

(assert (=> b!361467 d!71751))

(declare-fun d!71753 () Bool)

(assert (=> d!71753 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36004 d!71753))

(declare-fun d!71755 () Bool)

(assert (=> d!71755 (= (array_inv!7114 _keys!1541) (bvsge (size!10008 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36004 d!71755))

(declare-fun d!71757 () Bool)

(assert (=> d!71757 (= (array_inv!7115 _values!1277) (bvsge (size!10009 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36004 d!71757))

(declare-fun d!71759 () Bool)

(declare-fun res!201169 () Bool)

(declare-fun e!221433 () Bool)

(assert (=> d!71759 (=> res!201169 e!221433)))

(assert (=> d!71759 (= res!201169 (= (select (arr!9655 _keys!1541) from!1924) k0!1134))))

(assert (=> d!71759 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221433)))

(declare-fun b!361561 () Bool)

(declare-fun e!221434 () Bool)

(assert (=> b!361561 (= e!221433 e!221434)))

(declare-fun res!201170 () Bool)

(assert (=> b!361561 (=> (not res!201170) (not e!221434))))

(assert (=> b!361561 (= res!201170 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10008 _keys!1541)))))

(declare-fun b!361562 () Bool)

(assert (=> b!361562 (= e!221434 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71759 (not res!201169)) b!361561))

(assert (= (and b!361561 res!201170) b!361562))

(assert (=> d!71759 m!357725))

(declare-fun m!357781 () Bool)

(assert (=> b!361562 m!357781))

(assert (=> b!361474 d!71759))

(declare-fun mapNonEmpty!14139 () Bool)

(declare-fun mapRes!14139 () Bool)

(declare-fun tp!28215 () Bool)

(declare-fun e!221439 () Bool)

(assert (=> mapNonEmpty!14139 (= mapRes!14139 (and tp!28215 e!221439))))

(declare-fun mapRest!14139 () (Array (_ BitVec 32) ValueCell!3857))

(declare-fun mapValue!14139 () ValueCell!3857)

(declare-fun mapKey!14139 () (_ BitVec 32))

(assert (=> mapNonEmpty!14139 (= mapRest!14130 (store mapRest!14139 mapKey!14139 mapValue!14139))))

(declare-fun b!361569 () Bool)

(assert (=> b!361569 (= e!221439 tp_is_empty!8401)))

(declare-fun condMapEmpty!14139 () Bool)

(declare-fun mapDefault!14139 () ValueCell!3857)

(assert (=> mapNonEmpty!14130 (= condMapEmpty!14139 (= mapRest!14130 ((as const (Array (_ BitVec 32) ValueCell!3857)) mapDefault!14139)))))

(declare-fun e!221440 () Bool)

(assert (=> mapNonEmpty!14130 (= tp!28206 (and e!221440 mapRes!14139))))

(declare-fun b!361570 () Bool)

(assert (=> b!361570 (= e!221440 tp_is_empty!8401)))

(declare-fun mapIsEmpty!14139 () Bool)

(assert (=> mapIsEmpty!14139 mapRes!14139))

(assert (= (and mapNonEmpty!14130 condMapEmpty!14139) mapIsEmpty!14139))

(assert (= (and mapNonEmpty!14130 (not condMapEmpty!14139)) mapNonEmpty!14139))

(assert (= (and mapNonEmpty!14139 ((_ is ValueCellFull!3857) mapValue!14139)) b!361569))

(assert (= (and mapNonEmpty!14130 ((_ is ValueCellFull!3857) mapDefault!14139)) b!361570))

(declare-fun m!357783 () Bool)

(assert (=> mapNonEmpty!14139 m!357783))

(check-sat (not bm!27161) (not b!361554) tp_is_empty!8401 (not b!361540) (not b!361556) (not b!361552) (not mapNonEmpty!14139) (not b!361541) (not b!361562) (not bm!27158))
(check-sat)
