; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134048 () Bool)

(assert start!134048)

(declare-fun res!1070799 () Bool)

(declare-fun e!873310 () Bool)

(assert (=> start!134048 (=> (not res!1070799) (not e!873310))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134048 (= res!1070799 (validMask!0 mask!947))))

(assert (=> start!134048 e!873310))

(assert (=> start!134048 true))

(declare-datatypes ((array!104622 0))(
  ( (array!104623 (arr!50497 (Array (_ BitVec 32) (_ BitVec 64))) (size!51047 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104622)

(declare-fun array_inv!39235 (array!104622) Bool)

(assert (=> start!134048 (array_inv!39235 _keys!637)))

(declare-datatypes ((V!60163 0))(
  ( (V!60164 (val!19567 Int)) )
))
(declare-datatypes ((ValueCell!18453 0))(
  ( (ValueCellFull!18453 (v!22326 V!60163)) (EmptyCell!18453) )
))
(declare-datatypes ((array!104624 0))(
  ( (array!104625 (arr!50498 (Array (_ BitVec 32) ValueCell!18453)) (size!51048 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104624)

(declare-fun e!873313 () Bool)

(declare-fun array_inv!39236 (array!104624) Bool)

(assert (=> start!134048 (and (array_inv!39236 _values!487) e!873313)))

(declare-fun b!1566732 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566732 (= e!873310 (bvsge (bvsub (size!51047 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51047 _keys!637)) from!782)))))

(declare-fun b!1566733 () Bool)

(declare-fun res!1070800 () Bool)

(assert (=> b!1566733 (=> (not res!1070800) (not e!873310))))

(assert (=> b!1566733 (= res!1070800 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51047 _keys!637)) (bvslt from!782 (size!51047 _keys!637))))))

(declare-fun b!1566734 () Bool)

(declare-fun e!873311 () Bool)

(declare-fun tp_is_empty!38967 () Bool)

(assert (=> b!1566734 (= e!873311 tp_is_empty!38967)))

(declare-fun mapNonEmpty!59847 () Bool)

(declare-fun mapRes!59847 () Bool)

(declare-fun tp!113880 () Bool)

(assert (=> mapNonEmpty!59847 (= mapRes!59847 (and tp!113880 e!873311))))

(declare-fun mapKey!59847 () (_ BitVec 32))

(declare-fun mapRest!59847 () (Array (_ BitVec 32) ValueCell!18453))

(declare-fun mapValue!59847 () ValueCell!18453)

(assert (=> mapNonEmpty!59847 (= (arr!50498 _values!487) (store mapRest!59847 mapKey!59847 mapValue!59847))))

(declare-fun b!1566735 () Bool)

(declare-fun e!873312 () Bool)

(assert (=> b!1566735 (= e!873312 tp_is_empty!38967)))

(declare-fun b!1566736 () Bool)

(assert (=> b!1566736 (= e!873313 (and e!873312 mapRes!59847))))

(declare-fun condMapEmpty!59847 () Bool)

(declare-fun mapDefault!59847 () ValueCell!18453)

(assert (=> b!1566736 (= condMapEmpty!59847 (= (arr!50498 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18453)) mapDefault!59847)))))

(declare-fun b!1566737 () Bool)

(declare-fun res!1070803 () Bool)

(assert (=> b!1566737 (=> (not res!1070803) (not e!873310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104622 (_ BitVec 32)) Bool)

(assert (=> b!1566737 (= res!1070803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566738 () Bool)

(declare-fun res!1070801 () Bool)

(assert (=> b!1566738 (=> (not res!1070801) (not e!873310))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566738 (= res!1070801 (and (= (size!51048 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51047 _keys!637) (size!51048 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566739 () Bool)

(declare-fun res!1070802 () Bool)

(assert (=> b!1566739 (=> (not res!1070802) (not e!873310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566739 (= res!1070802 (not (validKeyInArray!0 (select (arr!50497 _keys!637) from!782))))))

(declare-fun b!1566740 () Bool)

(declare-fun res!1070798 () Bool)

(assert (=> b!1566740 (=> (not res!1070798) (not e!873310))))

(declare-datatypes ((List!36633 0))(
  ( (Nil!36630) (Cons!36629 (h!38076 (_ BitVec 64)) (t!51537 List!36633)) )
))
(declare-fun arrayNoDuplicates!0 (array!104622 (_ BitVec 32) List!36633) Bool)

(assert (=> b!1566740 (= res!1070798 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36630))))

(declare-fun mapIsEmpty!59847 () Bool)

(assert (=> mapIsEmpty!59847 mapRes!59847))

(assert (= (and start!134048 res!1070799) b!1566738))

(assert (= (and b!1566738 res!1070801) b!1566737))

(assert (= (and b!1566737 res!1070803) b!1566740))

(assert (= (and b!1566740 res!1070798) b!1566733))

(assert (= (and b!1566733 res!1070800) b!1566739))

(assert (= (and b!1566739 res!1070802) b!1566732))

(assert (= (and b!1566736 condMapEmpty!59847) mapIsEmpty!59847))

(assert (= (and b!1566736 (not condMapEmpty!59847)) mapNonEmpty!59847))

(get-info :version)

(assert (= (and mapNonEmpty!59847 ((_ is ValueCellFull!18453) mapValue!59847)) b!1566734))

(assert (= (and b!1566736 ((_ is ValueCellFull!18453) mapDefault!59847)) b!1566735))

(assert (= start!134048 b!1566736))

(declare-fun m!1441797 () Bool)

(assert (=> b!1566739 m!1441797))

(assert (=> b!1566739 m!1441797))

(declare-fun m!1441799 () Bool)

(assert (=> b!1566739 m!1441799))

(declare-fun m!1441801 () Bool)

(assert (=> start!134048 m!1441801))

(declare-fun m!1441803 () Bool)

(assert (=> start!134048 m!1441803))

(declare-fun m!1441805 () Bool)

(assert (=> start!134048 m!1441805))

(declare-fun m!1441807 () Bool)

(assert (=> b!1566737 m!1441807))

(declare-fun m!1441809 () Bool)

(assert (=> mapNonEmpty!59847 m!1441809))

(declare-fun m!1441811 () Bool)

(assert (=> b!1566740 m!1441811))

(check-sat tp_is_empty!38967 (not b!1566737) (not start!134048) (not mapNonEmpty!59847) (not b!1566739) (not b!1566740))
(check-sat)
(get-model)

(declare-fun b!1566776 () Bool)

(declare-fun e!873335 () Bool)

(declare-fun e!873337 () Bool)

(assert (=> b!1566776 (= e!873335 e!873337)))

(declare-fun c!144460 () Bool)

(assert (=> b!1566776 (= c!144460 (validKeyInArray!0 (select (arr!50497 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566777 () Bool)

(declare-fun e!873336 () Bool)

(declare-fun call!71918 () Bool)

(assert (=> b!1566777 (= e!873336 call!71918)))

(declare-fun bm!71915 () Bool)

(assert (=> bm!71915 (= call!71918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566778 () Bool)

(assert (=> b!1566778 (= e!873337 e!873336)))

(declare-fun lt!672801 () (_ BitVec 64))

(assert (=> b!1566778 (= lt!672801 (select (arr!50497 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52053 0))(
  ( (Unit!52054) )
))
(declare-fun lt!672802 () Unit!52053)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104622 (_ BitVec 64) (_ BitVec 32)) Unit!52053)

(assert (=> b!1566778 (= lt!672802 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672801 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1566778 (arrayContainsKey!0 _keys!637 lt!672801 #b00000000000000000000000000000000)))

(declare-fun lt!672803 () Unit!52053)

(assert (=> b!1566778 (= lt!672803 lt!672802)))

(declare-fun res!1070827 () Bool)

(declare-datatypes ((SeekEntryResult!13527 0))(
  ( (MissingZero!13527 (index!56506 (_ BitVec 32))) (Found!13527 (index!56507 (_ BitVec 32))) (Intermediate!13527 (undefined!14339 Bool) (index!56508 (_ BitVec 32)) (x!140771 (_ BitVec 32))) (Undefined!13527) (MissingVacant!13527 (index!56509 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104622 (_ BitVec 32)) SeekEntryResult!13527)

(assert (=> b!1566778 (= res!1070827 (= (seekEntryOrOpen!0 (select (arr!50497 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13527 #b00000000000000000000000000000000)))))

(assert (=> b!1566778 (=> (not res!1070827) (not e!873336))))

(declare-fun d!163527 () Bool)

(declare-fun res!1070826 () Bool)

(assert (=> d!163527 (=> res!1070826 e!873335)))

(assert (=> d!163527 (= res!1070826 (bvsge #b00000000000000000000000000000000 (size!51047 _keys!637)))))

(assert (=> d!163527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873335)))

(declare-fun b!1566779 () Bool)

(assert (=> b!1566779 (= e!873337 call!71918)))

(assert (= (and d!163527 (not res!1070826)) b!1566776))

(assert (= (and b!1566776 c!144460) b!1566778))

(assert (= (and b!1566776 (not c!144460)) b!1566779))

(assert (= (and b!1566778 res!1070827) b!1566777))

(assert (= (or b!1566777 b!1566779) bm!71915))

(declare-fun m!1441829 () Bool)

(assert (=> b!1566776 m!1441829))

(assert (=> b!1566776 m!1441829))

(declare-fun m!1441831 () Bool)

(assert (=> b!1566776 m!1441831))

(declare-fun m!1441833 () Bool)

(assert (=> bm!71915 m!1441833))

(assert (=> b!1566778 m!1441829))

(declare-fun m!1441835 () Bool)

(assert (=> b!1566778 m!1441835))

(declare-fun m!1441837 () Bool)

(assert (=> b!1566778 m!1441837))

(assert (=> b!1566778 m!1441829))

(declare-fun m!1441839 () Bool)

(assert (=> b!1566778 m!1441839))

(assert (=> b!1566737 d!163527))

(declare-fun d!163529 () Bool)

(assert (=> d!163529 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134048 d!163529))

(declare-fun d!163531 () Bool)

(assert (=> d!163531 (= (array_inv!39235 _keys!637) (bvsge (size!51047 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134048 d!163531))

(declare-fun d!163533 () Bool)

(assert (=> d!163533 (= (array_inv!39236 _values!487) (bvsge (size!51048 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134048 d!163533))

(declare-fun d!163535 () Bool)

(assert (=> d!163535 (= (validKeyInArray!0 (select (arr!50497 _keys!637) from!782)) (and (not (= (select (arr!50497 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50497 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566739 d!163535))

(declare-fun b!1566790 () Bool)

(declare-fun e!873348 () Bool)

(declare-fun call!71921 () Bool)

(assert (=> b!1566790 (= e!873348 call!71921)))

(declare-fun b!1566791 () Bool)

(declare-fun e!873347 () Bool)

(assert (=> b!1566791 (= e!873347 e!873348)))

(declare-fun c!144463 () Bool)

(assert (=> b!1566791 (= c!144463 (validKeyInArray!0 (select (arr!50497 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566792 () Bool)

(assert (=> b!1566792 (= e!873348 call!71921)))

(declare-fun bm!71918 () Bool)

(assert (=> bm!71918 (= call!71921 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144463 (Cons!36629 (select (arr!50497 _keys!637) #b00000000000000000000000000000000) Nil!36630) Nil!36630)))))

(declare-fun d!163537 () Bool)

(declare-fun res!1070835 () Bool)

(declare-fun e!873349 () Bool)

(assert (=> d!163537 (=> res!1070835 e!873349)))

(assert (=> d!163537 (= res!1070835 (bvsge #b00000000000000000000000000000000 (size!51047 _keys!637)))))

(assert (=> d!163537 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36630) e!873349)))

(declare-fun b!1566793 () Bool)

(assert (=> b!1566793 (= e!873349 e!873347)))

(declare-fun res!1070834 () Bool)

(assert (=> b!1566793 (=> (not res!1070834) (not e!873347))))

(declare-fun e!873346 () Bool)

(assert (=> b!1566793 (= res!1070834 (not e!873346))))

(declare-fun res!1070836 () Bool)

(assert (=> b!1566793 (=> (not res!1070836) (not e!873346))))

(assert (=> b!1566793 (= res!1070836 (validKeyInArray!0 (select (arr!50497 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566794 () Bool)

(declare-fun contains!10349 (List!36633 (_ BitVec 64)) Bool)

(assert (=> b!1566794 (= e!873346 (contains!10349 Nil!36630 (select (arr!50497 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163537 (not res!1070835)) b!1566793))

(assert (= (and b!1566793 res!1070836) b!1566794))

(assert (= (and b!1566793 res!1070834) b!1566791))

(assert (= (and b!1566791 c!144463) b!1566792))

(assert (= (and b!1566791 (not c!144463)) b!1566790))

(assert (= (or b!1566792 b!1566790) bm!71918))

(assert (=> b!1566791 m!1441829))

(assert (=> b!1566791 m!1441829))

(assert (=> b!1566791 m!1441831))

(assert (=> bm!71918 m!1441829))

(declare-fun m!1441841 () Bool)

(assert (=> bm!71918 m!1441841))

(assert (=> b!1566793 m!1441829))

(assert (=> b!1566793 m!1441829))

(assert (=> b!1566793 m!1441831))

(assert (=> b!1566794 m!1441829))

(assert (=> b!1566794 m!1441829))

(declare-fun m!1441843 () Bool)

(assert (=> b!1566794 m!1441843))

(assert (=> b!1566740 d!163537))

(declare-fun mapIsEmpty!59853 () Bool)

(declare-fun mapRes!59853 () Bool)

(assert (=> mapIsEmpty!59853 mapRes!59853))

(declare-fun b!1566801 () Bool)

(declare-fun e!873355 () Bool)

(assert (=> b!1566801 (= e!873355 tp_is_empty!38967)))

(declare-fun b!1566802 () Bool)

(declare-fun e!873354 () Bool)

(assert (=> b!1566802 (= e!873354 tp_is_empty!38967)))

(declare-fun mapNonEmpty!59853 () Bool)

(declare-fun tp!113886 () Bool)

(assert (=> mapNonEmpty!59853 (= mapRes!59853 (and tp!113886 e!873355))))

(declare-fun mapKey!59853 () (_ BitVec 32))

(declare-fun mapRest!59853 () (Array (_ BitVec 32) ValueCell!18453))

(declare-fun mapValue!59853 () ValueCell!18453)

(assert (=> mapNonEmpty!59853 (= mapRest!59847 (store mapRest!59853 mapKey!59853 mapValue!59853))))

(declare-fun condMapEmpty!59853 () Bool)

(declare-fun mapDefault!59853 () ValueCell!18453)

(assert (=> mapNonEmpty!59847 (= condMapEmpty!59853 (= mapRest!59847 ((as const (Array (_ BitVec 32) ValueCell!18453)) mapDefault!59853)))))

(assert (=> mapNonEmpty!59847 (= tp!113880 (and e!873354 mapRes!59853))))

(assert (= (and mapNonEmpty!59847 condMapEmpty!59853) mapIsEmpty!59853))

(assert (= (and mapNonEmpty!59847 (not condMapEmpty!59853)) mapNonEmpty!59853))

(assert (= (and mapNonEmpty!59853 ((_ is ValueCellFull!18453) mapValue!59853)) b!1566801))

(assert (= (and mapNonEmpty!59847 ((_ is ValueCellFull!18453) mapDefault!59853)) b!1566802))

(declare-fun m!1441845 () Bool)

(assert (=> mapNonEmpty!59853 m!1441845))

(check-sat tp_is_empty!38967 (not b!1566791) (not b!1566794) (not b!1566776) (not mapNonEmpty!59853) (not bm!71918) (not b!1566793) (not b!1566778) (not bm!71915))
(check-sat)
