; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38306 () Bool)

(assert start!38306)

(declare-fun res!226440 () Bool)

(declare-fun e!239114 () Bool)

(assert (=> start!38306 (=> (not res!226440) (not e!239114))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23493 0))(
  ( (array!23494 (arr!11200 (Array (_ BitVec 32) (_ BitVec 64))) (size!11553 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23493)

(assert (=> start!38306 (= res!226440 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11553 _keys!709))))))

(assert (=> start!38306 e!239114))

(assert (=> start!38306 true))

(declare-datatypes ((V!14171 0))(
  ( (V!14172 (val!4944 Int)) )
))
(declare-datatypes ((ValueCell!4556 0))(
  ( (ValueCellFull!4556 (v!7184 V!14171)) (EmptyCell!4556) )
))
(declare-datatypes ((array!23495 0))(
  ( (array!23496 (arr!11201 (Array (_ BitVec 32) ValueCell!4556)) (size!11554 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23495)

(declare-fun e!239112 () Bool)

(declare-fun array_inv!8222 (array!23495) Bool)

(assert (=> start!38306 (and (array_inv!8222 _values!549) e!239112)))

(declare-fun array_inv!8223 (array!23493) Bool)

(assert (=> start!38306 (array_inv!8223 _keys!709)))

(declare-fun b!394956 () Bool)

(declare-fun res!226444 () Bool)

(assert (=> b!394956 (=> (not res!226444) (not e!239114))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394956 (= res!226444 (validKeyInArray!0 k0!794))))

(declare-fun b!394957 () Bool)

(declare-fun res!226441 () Bool)

(assert (=> b!394957 (=> (not res!226441) (not e!239114))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394957 (= res!226441 (and (= (size!11554 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11553 _keys!709) (size!11554 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394958 () Bool)

(declare-fun res!226438 () Bool)

(assert (=> b!394958 (=> (not res!226438) (not e!239114))))

(declare-datatypes ((List!6463 0))(
  ( (Nil!6460) (Cons!6459 (h!7315 (_ BitVec 64)) (t!11628 List!6463)) )
))
(declare-fun arrayNoDuplicates!0 (array!23493 (_ BitVec 32) List!6463) Bool)

(assert (=> b!394958 (= res!226438 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6460))))

(declare-fun b!394959 () Bool)

(declare-fun res!226443 () Bool)

(assert (=> b!394959 (=> (not res!226443) (not e!239114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394959 (= res!226443 (validMask!0 mask!1025))))

(declare-fun b!394960 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!394960 (= e!239114 (and (or (= (select (arr!11200 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11200 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!11553 _keys!709)) (bvsge (size!11553 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394961 () Bool)

(declare-fun e!239116 () Bool)

(declare-fun tp_is_empty!9799 () Bool)

(assert (=> b!394961 (= e!239116 tp_is_empty!9799)))

(declare-fun mapNonEmpty!16308 () Bool)

(declare-fun mapRes!16308 () Bool)

(declare-fun tp!32103 () Bool)

(declare-fun e!239115 () Bool)

(assert (=> mapNonEmpty!16308 (= mapRes!16308 (and tp!32103 e!239115))))

(declare-fun mapKey!16308 () (_ BitVec 32))

(declare-fun mapRest!16308 () (Array (_ BitVec 32) ValueCell!4556))

(declare-fun mapValue!16308 () ValueCell!4556)

(assert (=> mapNonEmpty!16308 (= (arr!11201 _values!549) (store mapRest!16308 mapKey!16308 mapValue!16308))))

(declare-fun b!394962 () Bool)

(assert (=> b!394962 (= e!239115 tp_is_empty!9799)))

(declare-fun b!394963 () Bool)

(assert (=> b!394963 (= e!239112 (and e!239116 mapRes!16308))))

(declare-fun condMapEmpty!16308 () Bool)

(declare-fun mapDefault!16308 () ValueCell!4556)

(assert (=> b!394963 (= condMapEmpty!16308 (= (arr!11201 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4556)) mapDefault!16308)))))

(declare-fun b!394964 () Bool)

(declare-fun res!226439 () Bool)

(assert (=> b!394964 (=> (not res!226439) (not e!239114))))

(assert (=> b!394964 (= res!226439 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11553 _keys!709))))))

(declare-fun b!394965 () Bool)

(declare-fun res!226442 () Bool)

(assert (=> b!394965 (=> (not res!226442) (not e!239114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23493 (_ BitVec 32)) Bool)

(assert (=> b!394965 (= res!226442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16308 () Bool)

(assert (=> mapIsEmpty!16308 mapRes!16308))

(assert (= (and start!38306 res!226440) b!394959))

(assert (= (and b!394959 res!226443) b!394957))

(assert (= (and b!394957 res!226441) b!394965))

(assert (= (and b!394965 res!226442) b!394958))

(assert (= (and b!394958 res!226438) b!394964))

(assert (= (and b!394964 res!226439) b!394956))

(assert (= (and b!394956 res!226444) b!394960))

(assert (= (and b!394963 condMapEmpty!16308) mapIsEmpty!16308))

(assert (= (and b!394963 (not condMapEmpty!16308)) mapNonEmpty!16308))

(get-info :version)

(assert (= (and mapNonEmpty!16308 ((_ is ValueCellFull!4556) mapValue!16308)) b!394962))

(assert (= (and b!394963 ((_ is ValueCellFull!4556) mapDefault!16308)) b!394961))

(assert (= start!38306 b!394963))

(declare-fun m!390651 () Bool)

(assert (=> b!394958 m!390651))

(declare-fun m!390653 () Bool)

(assert (=> b!394965 m!390653))

(declare-fun m!390655 () Bool)

(assert (=> mapNonEmpty!16308 m!390655))

(declare-fun m!390657 () Bool)

(assert (=> b!394956 m!390657))

(declare-fun m!390659 () Bool)

(assert (=> b!394959 m!390659))

(declare-fun m!390661 () Bool)

(assert (=> start!38306 m!390661))

(declare-fun m!390663 () Bool)

(assert (=> start!38306 m!390663))

(declare-fun m!390665 () Bool)

(assert (=> b!394960 m!390665))

(check-sat (not b!394958) (not mapNonEmpty!16308) (not b!394959) (not start!38306) (not b!394956) (not b!394965) tp_is_empty!9799)
(check-sat)
(get-model)

(declare-fun b!395034 () Bool)

(declare-fun e!239153 () Bool)

(declare-fun call!27847 () Bool)

(assert (=> b!395034 (= e!239153 call!27847)))

(declare-fun b!395035 () Bool)

(declare-fun e!239154 () Bool)

(assert (=> b!395035 (= e!239154 call!27847)))

(declare-fun b!395036 () Bool)

(declare-fun e!239155 () Bool)

(assert (=> b!395036 (= e!239155 e!239154)))

(declare-fun c!54477 () Bool)

(assert (=> b!395036 (= c!54477 (validKeyInArray!0 (select (arr!11200 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73129 () Bool)

(declare-fun res!226491 () Bool)

(assert (=> d!73129 (=> res!226491 e!239155)))

(assert (=> d!73129 (= res!226491 (bvsge #b00000000000000000000000000000000 (size!11553 _keys!709)))))

(assert (=> d!73129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239155)))

(declare-fun bm!27844 () Bool)

(assert (=> bm!27844 (= call!27847 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!395037 () Bool)

(assert (=> b!395037 (= e!239154 e!239153)))

(declare-fun lt!186839 () (_ BitVec 64))

(assert (=> b!395037 (= lt!186839 (select (arr!11200 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12040 0))(
  ( (Unit!12041) )
))
(declare-fun lt!186840 () Unit!12040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23493 (_ BitVec 64) (_ BitVec 32)) Unit!12040)

(assert (=> b!395037 (= lt!186840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!186839 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395037 (arrayContainsKey!0 _keys!709 lt!186839 #b00000000000000000000000000000000)))

(declare-fun lt!186841 () Unit!12040)

(assert (=> b!395037 (= lt!186841 lt!186840)))

(declare-fun res!226492 () Bool)

(declare-datatypes ((SeekEntryResult!3518 0))(
  ( (MissingZero!3518 (index!16251 (_ BitVec 32))) (Found!3518 (index!16252 (_ BitVec 32))) (Intermediate!3518 (undefined!4330 Bool) (index!16253 (_ BitVec 32)) (x!38611 (_ BitVec 32))) (Undefined!3518) (MissingVacant!3518 (index!16254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23493 (_ BitVec 32)) SeekEntryResult!3518)

(assert (=> b!395037 (= res!226492 (= (seekEntryOrOpen!0 (select (arr!11200 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3518 #b00000000000000000000000000000000)))))

(assert (=> b!395037 (=> (not res!226492) (not e!239153))))

(assert (= (and d!73129 (not res!226491)) b!395036))

(assert (= (and b!395036 c!54477) b!395037))

(assert (= (and b!395036 (not c!54477)) b!395035))

(assert (= (and b!395037 res!226492) b!395034))

(assert (= (or b!395034 b!395035) bm!27844))

(declare-fun m!390699 () Bool)

(assert (=> b!395036 m!390699))

(assert (=> b!395036 m!390699))

(declare-fun m!390701 () Bool)

(assert (=> b!395036 m!390701))

(declare-fun m!390703 () Bool)

(assert (=> bm!27844 m!390703))

(assert (=> b!395037 m!390699))

(declare-fun m!390705 () Bool)

(assert (=> b!395037 m!390705))

(declare-fun m!390707 () Bool)

(assert (=> b!395037 m!390707))

(assert (=> b!395037 m!390699))

(declare-fun m!390709 () Bool)

(assert (=> b!395037 m!390709))

(assert (=> b!394965 d!73129))

(declare-fun d!73131 () Bool)

(assert (=> d!73131 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394959 d!73131))

(declare-fun b!395048 () Bool)

(declare-fun e!239165 () Bool)

(declare-fun e!239166 () Bool)

(assert (=> b!395048 (= e!239165 e!239166)))

(declare-fun c!54480 () Bool)

(assert (=> b!395048 (= c!54480 (validKeyInArray!0 (select (arr!11200 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395049 () Bool)

(declare-fun e!239167 () Bool)

(assert (=> b!395049 (= e!239167 e!239165)))

(declare-fun res!226500 () Bool)

(assert (=> b!395049 (=> (not res!226500) (not e!239165))))

(declare-fun e!239164 () Bool)

(assert (=> b!395049 (= res!226500 (not e!239164))))

(declare-fun res!226499 () Bool)

(assert (=> b!395049 (=> (not res!226499) (not e!239164))))

(assert (=> b!395049 (= res!226499 (validKeyInArray!0 (select (arr!11200 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395050 () Bool)

(declare-fun contains!2469 (List!6463 (_ BitVec 64)) Bool)

(assert (=> b!395050 (= e!239164 (contains!2469 Nil!6460 (select (arr!11200 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27847 () Bool)

(declare-fun call!27850 () Bool)

(assert (=> bm!27847 (= call!27850 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54480 (Cons!6459 (select (arr!11200 _keys!709) #b00000000000000000000000000000000) Nil!6460) Nil!6460)))))

(declare-fun d!73133 () Bool)

(declare-fun res!226501 () Bool)

(assert (=> d!73133 (=> res!226501 e!239167)))

(assert (=> d!73133 (= res!226501 (bvsge #b00000000000000000000000000000000 (size!11553 _keys!709)))))

(assert (=> d!73133 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6460) e!239167)))

(declare-fun b!395051 () Bool)

(assert (=> b!395051 (= e!239166 call!27850)))

(declare-fun b!395052 () Bool)

(assert (=> b!395052 (= e!239166 call!27850)))

(assert (= (and d!73133 (not res!226501)) b!395049))

(assert (= (and b!395049 res!226499) b!395050))

(assert (= (and b!395049 res!226500) b!395048))

(assert (= (and b!395048 c!54480) b!395051))

(assert (= (and b!395048 (not c!54480)) b!395052))

(assert (= (or b!395051 b!395052) bm!27847))

(assert (=> b!395048 m!390699))

(assert (=> b!395048 m!390699))

(assert (=> b!395048 m!390701))

(assert (=> b!395049 m!390699))

(assert (=> b!395049 m!390699))

(assert (=> b!395049 m!390701))

(assert (=> b!395050 m!390699))

(assert (=> b!395050 m!390699))

(declare-fun m!390711 () Bool)

(assert (=> b!395050 m!390711))

(assert (=> bm!27847 m!390699))

(declare-fun m!390713 () Bool)

(assert (=> bm!27847 m!390713))

(assert (=> b!394958 d!73133))

(declare-fun d!73135 () Bool)

(assert (=> d!73135 (= (array_inv!8222 _values!549) (bvsge (size!11554 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38306 d!73135))

(declare-fun d!73137 () Bool)

(assert (=> d!73137 (= (array_inv!8223 _keys!709) (bvsge (size!11553 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38306 d!73137))

(declare-fun d!73139 () Bool)

(assert (=> d!73139 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!394956 d!73139))

(declare-fun mapIsEmpty!16317 () Bool)

(declare-fun mapRes!16317 () Bool)

(assert (=> mapIsEmpty!16317 mapRes!16317))

(declare-fun b!395059 () Bool)

(declare-fun e!239172 () Bool)

(assert (=> b!395059 (= e!239172 tp_is_empty!9799)))

(declare-fun condMapEmpty!16317 () Bool)

(declare-fun mapDefault!16317 () ValueCell!4556)

(assert (=> mapNonEmpty!16308 (= condMapEmpty!16317 (= mapRest!16308 ((as const (Array (_ BitVec 32) ValueCell!4556)) mapDefault!16317)))))

(declare-fun e!239173 () Bool)

(assert (=> mapNonEmpty!16308 (= tp!32103 (and e!239173 mapRes!16317))))

(declare-fun mapNonEmpty!16317 () Bool)

(declare-fun tp!32112 () Bool)

(assert (=> mapNonEmpty!16317 (= mapRes!16317 (and tp!32112 e!239172))))

(declare-fun mapValue!16317 () ValueCell!4556)

(declare-fun mapKey!16317 () (_ BitVec 32))

(declare-fun mapRest!16317 () (Array (_ BitVec 32) ValueCell!4556))

(assert (=> mapNonEmpty!16317 (= mapRest!16308 (store mapRest!16317 mapKey!16317 mapValue!16317))))

(declare-fun b!395060 () Bool)

(assert (=> b!395060 (= e!239173 tp_is_empty!9799)))

(assert (= (and mapNonEmpty!16308 condMapEmpty!16317) mapIsEmpty!16317))

(assert (= (and mapNonEmpty!16308 (not condMapEmpty!16317)) mapNonEmpty!16317))

(assert (= (and mapNonEmpty!16317 ((_ is ValueCellFull!4556) mapValue!16317)) b!395059))

(assert (= (and mapNonEmpty!16308 ((_ is ValueCellFull!4556) mapDefault!16317)) b!395060))

(declare-fun m!390715 () Bool)

(assert (=> mapNonEmpty!16317 m!390715))

(check-sat (not bm!27847) tp_is_empty!9799 (not b!395037) (not b!395036) (not b!395048) (not b!395049) (not bm!27844) (not b!395050) (not mapNonEmpty!16317))
(check-sat)
