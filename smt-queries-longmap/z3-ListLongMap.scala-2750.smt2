; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40324 () Bool)

(assert start!40324)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun e!260594 () Bool)

(declare-fun b!442882 () Bool)

(declare-datatypes ((array!27285 0))(
  ( (array!27286 (arr!13091 (Array (_ BitVec 32) (_ BitVec 64))) (size!13444 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27285)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!442882 (= e!260594 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13444 _keys!709)) (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!442883 () Bool)

(declare-fun res!262429 () Bool)

(declare-fun e!260593 () Bool)

(assert (=> b!442883 (=> (not res!262429) (not e!260593))))

(declare-datatypes ((List!7853 0))(
  ( (Nil!7850) (Cons!7849 (h!8705 (_ BitVec 64)) (t!13602 List!7853)) )
))
(declare-fun arrayNoDuplicates!0 (array!27285 (_ BitVec 32) List!7853) Bool)

(assert (=> b!442883 (= res!262429 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7850))))

(declare-fun b!442884 () Bool)

(declare-fun e!260595 () Bool)

(declare-fun e!260592 () Bool)

(declare-fun mapRes!19230 () Bool)

(assert (=> b!442884 (= e!260595 (and e!260592 mapRes!19230))))

(declare-fun condMapEmpty!19230 () Bool)

(declare-datatypes ((V!16755 0))(
  ( (V!16756 (val!5913 Int)) )
))
(declare-datatypes ((ValueCell!5525 0))(
  ( (ValueCellFull!5525 (v!8158 V!16755)) (EmptyCell!5525) )
))
(declare-datatypes ((array!27287 0))(
  ( (array!27288 (arr!13092 (Array (_ BitVec 32) ValueCell!5525)) (size!13445 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27287)

(declare-fun mapDefault!19230 () ValueCell!5525)

(assert (=> b!442884 (= condMapEmpty!19230 (= (arr!13092 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5525)) mapDefault!19230)))))

(declare-fun b!442885 () Bool)

(declare-fun res!262435 () Bool)

(assert (=> b!442885 (=> (not res!262435) (not e!260593))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442885 (= res!262435 (validKeyInArray!0 k0!794))))

(declare-fun b!442886 () Bool)

(assert (=> b!442886 (= e!260593 e!260594)))

(declare-fun res!262439 () Bool)

(assert (=> b!442886 (=> (not res!262439) (not e!260594))))

(declare-fun lt!203063 () array!27285)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27285 (_ BitVec 32)) Bool)

(assert (=> b!442886 (= res!262439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203063 mask!1025))))

(assert (=> b!442886 (= lt!203063 (array!27286 (store (arr!13091 _keys!709) i!563 k0!794) (size!13444 _keys!709)))))

(declare-fun b!442887 () Bool)

(declare-fun e!260596 () Bool)

(declare-fun tp_is_empty!11737 () Bool)

(assert (=> b!442887 (= e!260596 tp_is_empty!11737)))

(declare-fun b!442888 () Bool)

(declare-fun res!262437 () Bool)

(assert (=> b!442888 (=> (not res!262437) (not e!260594))))

(assert (=> b!442888 (= res!262437 (arrayNoDuplicates!0 lt!203063 #b00000000000000000000000000000000 Nil!7850))))

(declare-fun b!442889 () Bool)

(declare-fun res!262436 () Bool)

(assert (=> b!442889 (=> (not res!262436) (not e!260593))))

(assert (=> b!442889 (= res!262436 (or (= (select (arr!13091 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13091 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442890 () Bool)

(assert (=> b!442890 (= e!260592 tp_is_empty!11737)))

(declare-fun res!262438 () Bool)

(assert (=> start!40324 (=> (not res!262438) (not e!260593))))

(assert (=> start!40324 (= res!262438 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13444 _keys!709))))))

(assert (=> start!40324 e!260593))

(assert (=> start!40324 true))

(declare-fun array_inv!9548 (array!27287) Bool)

(assert (=> start!40324 (and (array_inv!9548 _values!549) e!260595)))

(declare-fun array_inv!9549 (array!27285) Bool)

(assert (=> start!40324 (array_inv!9549 _keys!709)))

(declare-fun mapIsEmpty!19230 () Bool)

(assert (=> mapIsEmpty!19230 mapRes!19230))

(declare-fun mapNonEmpty!19230 () Bool)

(declare-fun tp!37212 () Bool)

(assert (=> mapNonEmpty!19230 (= mapRes!19230 (and tp!37212 e!260596))))

(declare-fun mapKey!19230 () (_ BitVec 32))

(declare-fun mapValue!19230 () ValueCell!5525)

(declare-fun mapRest!19230 () (Array (_ BitVec 32) ValueCell!5525))

(assert (=> mapNonEmpty!19230 (= (arr!13092 _values!549) (store mapRest!19230 mapKey!19230 mapValue!19230))))

(declare-fun b!442891 () Bool)

(declare-fun res!262433 () Bool)

(assert (=> b!442891 (=> (not res!262433) (not e!260593))))

(declare-fun arrayContainsKey!0 (array!27285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442891 (= res!262433 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442892 () Bool)

(declare-fun res!262432 () Bool)

(assert (=> b!442892 (=> (not res!262432) (not e!260593))))

(assert (=> b!442892 (= res!262432 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13444 _keys!709))))))

(declare-fun b!442893 () Bool)

(declare-fun res!262431 () Bool)

(assert (=> b!442893 (=> (not res!262431) (not e!260593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442893 (= res!262431 (validMask!0 mask!1025))))

(declare-fun b!442894 () Bool)

(declare-fun res!262434 () Bool)

(assert (=> b!442894 (=> (not res!262434) (not e!260593))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442894 (= res!262434 (and (= (size!13445 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13444 _keys!709) (size!13445 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442895 () Bool)

(declare-fun res!262430 () Bool)

(assert (=> b!442895 (=> (not res!262430) (not e!260593))))

(assert (=> b!442895 (= res!262430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40324 res!262438) b!442893))

(assert (= (and b!442893 res!262431) b!442894))

(assert (= (and b!442894 res!262434) b!442895))

(assert (= (and b!442895 res!262430) b!442883))

(assert (= (and b!442883 res!262429) b!442892))

(assert (= (and b!442892 res!262432) b!442885))

(assert (= (and b!442885 res!262435) b!442889))

(assert (= (and b!442889 res!262436) b!442891))

(assert (= (and b!442891 res!262433) b!442886))

(assert (= (and b!442886 res!262439) b!442888))

(assert (= (and b!442888 res!262437) b!442882))

(assert (= (and b!442884 condMapEmpty!19230) mapIsEmpty!19230))

(assert (= (and b!442884 (not condMapEmpty!19230)) mapNonEmpty!19230))

(get-info :version)

(assert (= (and mapNonEmpty!19230 ((_ is ValueCellFull!5525) mapValue!19230)) b!442887))

(assert (= (and b!442884 ((_ is ValueCellFull!5525) mapDefault!19230)) b!442890))

(assert (= start!40324 b!442884))

(declare-fun m!428797 () Bool)

(assert (=> start!40324 m!428797))

(declare-fun m!428799 () Bool)

(assert (=> start!40324 m!428799))

(declare-fun m!428801 () Bool)

(assert (=> b!442885 m!428801))

(declare-fun m!428803 () Bool)

(assert (=> b!442895 m!428803))

(declare-fun m!428805 () Bool)

(assert (=> b!442891 m!428805))

(declare-fun m!428807 () Bool)

(assert (=> b!442883 m!428807))

(declare-fun m!428809 () Bool)

(assert (=> mapNonEmpty!19230 m!428809))

(declare-fun m!428811 () Bool)

(assert (=> b!442888 m!428811))

(declare-fun m!428813 () Bool)

(assert (=> b!442889 m!428813))

(declare-fun m!428815 () Bool)

(assert (=> b!442886 m!428815))

(declare-fun m!428817 () Bool)

(assert (=> b!442886 m!428817))

(declare-fun m!428819 () Bool)

(assert (=> b!442893 m!428819))

(check-sat (not b!442886) (not b!442893) (not mapNonEmpty!19230) (not b!442888) (not b!442885) (not b!442895) (not start!40324) (not b!442891) (not b!442883) tp_is_empty!11737)
(check-sat)
(get-model)

(declare-fun d!73875 () Bool)

(declare-fun res!262510 () Bool)

(declare-fun e!260637 () Bool)

(assert (=> d!73875 (=> res!262510 e!260637)))

(assert (=> d!73875 (= res!262510 (= (select (arr!13091 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73875 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!260637)))

(declare-fun b!442984 () Bool)

(declare-fun e!260638 () Bool)

(assert (=> b!442984 (= e!260637 e!260638)))

(declare-fun res!262511 () Bool)

(assert (=> b!442984 (=> (not res!262511) (not e!260638))))

(assert (=> b!442984 (= res!262511 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13444 _keys!709)))))

(declare-fun b!442985 () Bool)

(assert (=> b!442985 (= e!260638 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73875 (not res!262510)) b!442984))

(assert (= (and b!442984 res!262511) b!442985))

(declare-fun m!428869 () Bool)

(assert (=> d!73875 m!428869))

(declare-fun m!428871 () Bool)

(assert (=> b!442985 m!428871))

(assert (=> b!442891 d!73875))

(declare-fun bm!29529 () Bool)

(declare-fun call!29532 () Bool)

(declare-fun c!55772 () Bool)

(assert (=> bm!29529 (= call!29532 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55772 (Cons!7849 (select (arr!13091 _keys!709) #b00000000000000000000000000000000) Nil!7850) Nil!7850)))))

(declare-fun b!442996 () Bool)

(declare-fun e!260649 () Bool)

(declare-fun e!260647 () Bool)

(assert (=> b!442996 (= e!260649 e!260647)))

(assert (=> b!442996 (= c!55772 (validKeyInArray!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!442997 () Bool)

(declare-fun e!260648 () Bool)

(declare-fun contains!2477 (List!7853 (_ BitVec 64)) Bool)

(assert (=> b!442997 (= e!260648 (contains!2477 Nil!7850 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!442998 () Bool)

(declare-fun e!260650 () Bool)

(assert (=> b!442998 (= e!260650 e!260649)))

(declare-fun res!262520 () Bool)

(assert (=> b!442998 (=> (not res!262520) (not e!260649))))

(assert (=> b!442998 (= res!262520 (not e!260648))))

(declare-fun res!262518 () Bool)

(assert (=> b!442998 (=> (not res!262518) (not e!260648))))

(assert (=> b!442998 (= res!262518 (validKeyInArray!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!442999 () Bool)

(assert (=> b!442999 (= e!260647 call!29532)))

(declare-fun b!443000 () Bool)

(assert (=> b!443000 (= e!260647 call!29532)))

(declare-fun d!73877 () Bool)

(declare-fun res!262519 () Bool)

(assert (=> d!73877 (=> res!262519 e!260650)))

(assert (=> d!73877 (= res!262519 (bvsge #b00000000000000000000000000000000 (size!13444 _keys!709)))))

(assert (=> d!73877 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7850) e!260650)))

(assert (= (and d!73877 (not res!262519)) b!442998))

(assert (= (and b!442998 res!262518) b!442997))

(assert (= (and b!442998 res!262520) b!442996))

(assert (= (and b!442996 c!55772) b!443000))

(assert (= (and b!442996 (not c!55772)) b!442999))

(assert (= (or b!443000 b!442999) bm!29529))

(assert (=> bm!29529 m!428869))

(declare-fun m!428873 () Bool)

(assert (=> bm!29529 m!428873))

(assert (=> b!442996 m!428869))

(assert (=> b!442996 m!428869))

(declare-fun m!428875 () Bool)

(assert (=> b!442996 m!428875))

(assert (=> b!442997 m!428869))

(assert (=> b!442997 m!428869))

(declare-fun m!428877 () Bool)

(assert (=> b!442997 m!428877))

(assert (=> b!442998 m!428869))

(assert (=> b!442998 m!428869))

(assert (=> b!442998 m!428875))

(assert (=> b!442883 d!73877))

(declare-fun bm!29530 () Bool)

(declare-fun call!29533 () Bool)

(declare-fun c!55773 () Bool)

(assert (=> bm!29530 (= call!29533 (arrayNoDuplicates!0 lt!203063 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55773 (Cons!7849 (select (arr!13091 lt!203063) #b00000000000000000000000000000000) Nil!7850) Nil!7850)))))

(declare-fun b!443001 () Bool)

(declare-fun e!260653 () Bool)

(declare-fun e!260651 () Bool)

(assert (=> b!443001 (= e!260653 e!260651)))

(assert (=> b!443001 (= c!55773 (validKeyInArray!0 (select (arr!13091 lt!203063) #b00000000000000000000000000000000)))))

(declare-fun b!443002 () Bool)

(declare-fun e!260652 () Bool)

(assert (=> b!443002 (= e!260652 (contains!2477 Nil!7850 (select (arr!13091 lt!203063) #b00000000000000000000000000000000)))))

(declare-fun b!443003 () Bool)

(declare-fun e!260654 () Bool)

(assert (=> b!443003 (= e!260654 e!260653)))

(declare-fun res!262523 () Bool)

(assert (=> b!443003 (=> (not res!262523) (not e!260653))))

(assert (=> b!443003 (= res!262523 (not e!260652))))

(declare-fun res!262521 () Bool)

(assert (=> b!443003 (=> (not res!262521) (not e!260652))))

(assert (=> b!443003 (= res!262521 (validKeyInArray!0 (select (arr!13091 lt!203063) #b00000000000000000000000000000000)))))

(declare-fun b!443004 () Bool)

(assert (=> b!443004 (= e!260651 call!29533)))

(declare-fun b!443005 () Bool)

(assert (=> b!443005 (= e!260651 call!29533)))

(declare-fun d!73879 () Bool)

(declare-fun res!262522 () Bool)

(assert (=> d!73879 (=> res!262522 e!260654)))

(assert (=> d!73879 (= res!262522 (bvsge #b00000000000000000000000000000000 (size!13444 lt!203063)))))

(assert (=> d!73879 (= (arrayNoDuplicates!0 lt!203063 #b00000000000000000000000000000000 Nil!7850) e!260654)))

(assert (= (and d!73879 (not res!262522)) b!443003))

(assert (= (and b!443003 res!262521) b!443002))

(assert (= (and b!443003 res!262523) b!443001))

(assert (= (and b!443001 c!55773) b!443005))

(assert (= (and b!443001 (not c!55773)) b!443004))

(assert (= (or b!443005 b!443004) bm!29530))

(declare-fun m!428879 () Bool)

(assert (=> bm!29530 m!428879))

(declare-fun m!428881 () Bool)

(assert (=> bm!29530 m!428881))

(assert (=> b!443001 m!428879))

(assert (=> b!443001 m!428879))

(declare-fun m!428883 () Bool)

(assert (=> b!443001 m!428883))

(assert (=> b!443002 m!428879))

(assert (=> b!443002 m!428879))

(declare-fun m!428885 () Bool)

(assert (=> b!443002 m!428885))

(assert (=> b!443003 m!428879))

(assert (=> b!443003 m!428879))

(assert (=> b!443003 m!428883))

(assert (=> b!442888 d!73879))

(declare-fun d!73881 () Bool)

(assert (=> d!73881 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!442893 d!73881))

(declare-fun d!73883 () Bool)

(assert (=> d!73883 (= (array_inv!9548 _values!549) (bvsge (size!13445 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40324 d!73883))

(declare-fun d!73885 () Bool)

(assert (=> d!73885 (= (array_inv!9549 _keys!709) (bvsge (size!13444 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40324 d!73885))

(declare-fun d!73887 () Bool)

(assert (=> d!73887 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!442885 d!73887))

(declare-fun b!443014 () Bool)

(declare-fun e!260663 () Bool)

(declare-fun call!29536 () Bool)

(assert (=> b!443014 (= e!260663 call!29536)))

(declare-fun d!73889 () Bool)

(declare-fun res!262528 () Bool)

(declare-fun e!260662 () Bool)

(assert (=> d!73889 (=> res!262528 e!260662)))

(assert (=> d!73889 (= res!262528 (bvsge #b00000000000000000000000000000000 (size!13444 _keys!709)))))

(assert (=> d!73889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!260662)))

(declare-fun b!443015 () Bool)

(declare-fun e!260661 () Bool)

(assert (=> b!443015 (= e!260663 e!260661)))

(declare-fun lt!203078 () (_ BitVec 64))

(assert (=> b!443015 (= lt!203078 (select (arr!13091 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13115 0))(
  ( (Unit!13116) )
))
(declare-fun lt!203077 () Unit!13115)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27285 (_ BitVec 64) (_ BitVec 32)) Unit!13115)

(assert (=> b!443015 (= lt!203077 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203078 #b00000000000000000000000000000000))))

(assert (=> b!443015 (arrayContainsKey!0 _keys!709 lt!203078 #b00000000000000000000000000000000)))

(declare-fun lt!203076 () Unit!13115)

(assert (=> b!443015 (= lt!203076 lt!203077)))

(declare-fun res!262529 () Bool)

(declare-datatypes ((SeekEntryResult!3523 0))(
  ( (MissingZero!3523 (index!16271 (_ BitVec 32))) (Found!3523 (index!16272 (_ BitVec 32))) (Intermediate!3523 (undefined!4335 Bool) (index!16273 (_ BitVec 32)) (x!41801 (_ BitVec 32))) (Undefined!3523) (MissingVacant!3523 (index!16274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27285 (_ BitVec 32)) SeekEntryResult!3523)

(assert (=> b!443015 (= res!262529 (= (seekEntryOrOpen!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3523 #b00000000000000000000000000000000)))))

(assert (=> b!443015 (=> (not res!262529) (not e!260661))))

(declare-fun b!443016 () Bool)

(assert (=> b!443016 (= e!260662 e!260663)))

(declare-fun c!55776 () Bool)

(assert (=> b!443016 (= c!55776 (validKeyInArray!0 (select (arr!13091 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!443017 () Bool)

(assert (=> b!443017 (= e!260661 call!29536)))

(declare-fun bm!29533 () Bool)

(assert (=> bm!29533 (= call!29536 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!73889 (not res!262528)) b!443016))

(assert (= (and b!443016 c!55776) b!443015))

(assert (= (and b!443016 (not c!55776)) b!443014))

(assert (= (and b!443015 res!262529) b!443017))

(assert (= (or b!443017 b!443014) bm!29533))

(assert (=> b!443015 m!428869))

(declare-fun m!428887 () Bool)

(assert (=> b!443015 m!428887))

(declare-fun m!428889 () Bool)

(assert (=> b!443015 m!428889))

(assert (=> b!443015 m!428869))

(declare-fun m!428891 () Bool)

(assert (=> b!443015 m!428891))

(assert (=> b!443016 m!428869))

(assert (=> b!443016 m!428869))

(assert (=> b!443016 m!428875))

(declare-fun m!428893 () Bool)

(assert (=> bm!29533 m!428893))

(assert (=> b!442895 d!73889))

(declare-fun b!443018 () Bool)

(declare-fun e!260666 () Bool)

(declare-fun call!29537 () Bool)

(assert (=> b!443018 (= e!260666 call!29537)))

(declare-fun d!73891 () Bool)

(declare-fun res!262530 () Bool)

(declare-fun e!260665 () Bool)

(assert (=> d!73891 (=> res!262530 e!260665)))

(assert (=> d!73891 (= res!262530 (bvsge #b00000000000000000000000000000000 (size!13444 lt!203063)))))

(assert (=> d!73891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203063 mask!1025) e!260665)))

(declare-fun b!443019 () Bool)

(declare-fun e!260664 () Bool)

(assert (=> b!443019 (= e!260666 e!260664)))

(declare-fun lt!203081 () (_ BitVec 64))

(assert (=> b!443019 (= lt!203081 (select (arr!13091 lt!203063) #b00000000000000000000000000000000))))

(declare-fun lt!203080 () Unit!13115)

(assert (=> b!443019 (= lt!203080 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203063 lt!203081 #b00000000000000000000000000000000))))

(assert (=> b!443019 (arrayContainsKey!0 lt!203063 lt!203081 #b00000000000000000000000000000000)))

(declare-fun lt!203079 () Unit!13115)

(assert (=> b!443019 (= lt!203079 lt!203080)))

(declare-fun res!262531 () Bool)

(assert (=> b!443019 (= res!262531 (= (seekEntryOrOpen!0 (select (arr!13091 lt!203063) #b00000000000000000000000000000000) lt!203063 mask!1025) (Found!3523 #b00000000000000000000000000000000)))))

(assert (=> b!443019 (=> (not res!262531) (not e!260664))))

(declare-fun b!443020 () Bool)

(assert (=> b!443020 (= e!260665 e!260666)))

(declare-fun c!55777 () Bool)

(assert (=> b!443020 (= c!55777 (validKeyInArray!0 (select (arr!13091 lt!203063) #b00000000000000000000000000000000)))))

(declare-fun b!443021 () Bool)

(assert (=> b!443021 (= e!260664 call!29537)))

(declare-fun bm!29534 () Bool)

(assert (=> bm!29534 (= call!29537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203063 mask!1025))))

(assert (= (and d!73891 (not res!262530)) b!443020))

(assert (= (and b!443020 c!55777) b!443019))

(assert (= (and b!443020 (not c!55777)) b!443018))

(assert (= (and b!443019 res!262531) b!443021))

(assert (= (or b!443021 b!443018) bm!29534))

(assert (=> b!443019 m!428879))

(declare-fun m!428895 () Bool)

(assert (=> b!443019 m!428895))

(declare-fun m!428897 () Bool)

(assert (=> b!443019 m!428897))

(assert (=> b!443019 m!428879))

(declare-fun m!428899 () Bool)

(assert (=> b!443019 m!428899))

(assert (=> b!443020 m!428879))

(assert (=> b!443020 m!428879))

(assert (=> b!443020 m!428883))

(declare-fun m!428901 () Bool)

(assert (=> bm!29534 m!428901))

(assert (=> b!442886 d!73891))

(declare-fun mapNonEmpty!19239 () Bool)

(declare-fun mapRes!19239 () Bool)

(declare-fun tp!37221 () Bool)

(declare-fun e!260672 () Bool)

(assert (=> mapNonEmpty!19239 (= mapRes!19239 (and tp!37221 e!260672))))

(declare-fun mapValue!19239 () ValueCell!5525)

(declare-fun mapKey!19239 () (_ BitVec 32))

(declare-fun mapRest!19239 () (Array (_ BitVec 32) ValueCell!5525))

(assert (=> mapNonEmpty!19239 (= mapRest!19230 (store mapRest!19239 mapKey!19239 mapValue!19239))))

(declare-fun mapIsEmpty!19239 () Bool)

(assert (=> mapIsEmpty!19239 mapRes!19239))

(declare-fun b!443028 () Bool)

(assert (=> b!443028 (= e!260672 tp_is_empty!11737)))

(declare-fun b!443029 () Bool)

(declare-fun e!260671 () Bool)

(assert (=> b!443029 (= e!260671 tp_is_empty!11737)))

(declare-fun condMapEmpty!19239 () Bool)

(declare-fun mapDefault!19239 () ValueCell!5525)

(assert (=> mapNonEmpty!19230 (= condMapEmpty!19239 (= mapRest!19230 ((as const (Array (_ BitVec 32) ValueCell!5525)) mapDefault!19239)))))

(assert (=> mapNonEmpty!19230 (= tp!37212 (and e!260671 mapRes!19239))))

(assert (= (and mapNonEmpty!19230 condMapEmpty!19239) mapIsEmpty!19239))

(assert (= (and mapNonEmpty!19230 (not condMapEmpty!19239)) mapNonEmpty!19239))

(assert (= (and mapNonEmpty!19239 ((_ is ValueCellFull!5525) mapValue!19239)) b!443028))

(assert (= (and mapNonEmpty!19230 ((_ is ValueCellFull!5525) mapDefault!19239)) b!443029))

(declare-fun m!428903 () Bool)

(assert (=> mapNonEmpty!19239 m!428903))

(check-sat (not b!442985) (not b!443015) (not b!442998) (not bm!29529) (not bm!29533) tp_is_empty!11737 (not bm!29534) (not bm!29530) (not b!443020) (not b!443019) (not b!443016) (not b!442997) (not mapNonEmpty!19239) (not b!442996) (not b!443003) (not b!443002) (not b!443001))
(check-sat)
