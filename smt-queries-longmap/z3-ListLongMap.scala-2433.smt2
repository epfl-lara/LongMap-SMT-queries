; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38354 () Bool)

(assert start!38354)

(declare-fun res!226854 () Bool)

(declare-fun e!239412 () Bool)

(assert (=> start!38354 (=> (not res!226854) (not e!239412))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23565 0))(
  ( (array!23566 (arr!11235 (Array (_ BitVec 32) (_ BitVec 64))) (size!11588 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23565)

(assert (=> start!38354 (= res!226854 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11588 _keys!709))))))

(assert (=> start!38354 e!239412))

(assert (=> start!38354 true))

(declare-datatypes ((V!14219 0))(
  ( (V!14220 (val!4962 Int)) )
))
(declare-datatypes ((ValueCell!4574 0))(
  ( (ValueCellFull!4574 (v!7202 V!14219)) (EmptyCell!4574) )
))
(declare-datatypes ((array!23567 0))(
  ( (array!23568 (arr!11236 (Array (_ BitVec 32) ValueCell!4574)) (size!11589 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23567)

(declare-fun e!239409 () Bool)

(declare-fun array_inv!8246 (array!23567) Bool)

(assert (=> start!38354 (and (array_inv!8246 _values!549) e!239409)))

(declare-fun array_inv!8247 (array!23565) Bool)

(assert (=> start!38354 (array_inv!8247 _keys!709)))

(declare-fun mapNonEmpty!16365 () Bool)

(declare-fun mapRes!16365 () Bool)

(declare-fun tp!32160 () Bool)

(declare-fun e!239413 () Bool)

(assert (=> mapNonEmpty!16365 (= mapRes!16365 (and tp!32160 e!239413))))

(declare-fun mapRest!16365 () (Array (_ BitVec 32) ValueCell!4574))

(declare-fun mapKey!16365 () (_ BitVec 32))

(declare-fun mapValue!16365 () ValueCell!4574)

(assert (=> mapNonEmpty!16365 (= (arr!11236 _values!549) (store mapRest!16365 mapKey!16365 mapValue!16365))))

(declare-fun b!395546 () Bool)

(declare-fun res!226848 () Bool)

(assert (=> b!395546 (=> (not res!226848) (not e!239412))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395546 (= res!226848 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395547 () Bool)

(declare-fun e!239411 () Bool)

(declare-fun tp_is_empty!9835 () Bool)

(assert (=> b!395547 (= e!239411 tp_is_empty!9835)))

(declare-fun b!395548 () Bool)

(assert (=> b!395548 (= e!239413 tp_is_empty!9835)))

(declare-fun b!395549 () Bool)

(declare-fun res!226849 () Bool)

(assert (=> b!395549 (=> (not res!226849) (not e!239412))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23565 (_ BitVec 32)) Bool)

(assert (=> b!395549 (= res!226849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395550 () Bool)

(declare-fun res!226852 () Bool)

(assert (=> b!395550 (=> (not res!226852) (not e!239412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395550 (= res!226852 (validKeyInArray!0 k0!794))))

(declare-fun b!395551 () Bool)

(declare-fun res!226853 () Bool)

(assert (=> b!395551 (=> (not res!226853) (not e!239412))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395551 (= res!226853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025))))

(declare-fun b!395552 () Bool)

(declare-fun res!226850 () Bool)

(assert (=> b!395552 (=> (not res!226850) (not e!239412))))

(assert (=> b!395552 (= res!226850 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11588 _keys!709))))))

(declare-fun b!395553 () Bool)

(declare-fun res!226851 () Bool)

(assert (=> b!395553 (=> (not res!226851) (not e!239412))))

(assert (=> b!395553 (= res!226851 (or (= (select (arr!11235 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11235 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395554 () Bool)

(declare-fun res!226846 () Bool)

(assert (=> b!395554 (=> (not res!226846) (not e!239412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395554 (= res!226846 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16365 () Bool)

(assert (=> mapIsEmpty!16365 mapRes!16365))

(declare-fun b!395555 () Bool)

(declare-fun res!226855 () Bool)

(assert (=> b!395555 (=> (not res!226855) (not e!239412))))

(declare-datatypes ((List!6478 0))(
  ( (Nil!6475) (Cons!6474 (h!7330 (_ BitVec 64)) (t!11643 List!6478)) )
))
(declare-fun arrayNoDuplicates!0 (array!23565 (_ BitVec 32) List!6478) Bool)

(assert (=> b!395555 (= res!226855 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6475))))

(declare-fun b!395556 () Bool)

(assert (=> b!395556 (= e!239412 (and (bvsle #b00000000000000000000000000000000 (size!11588 _keys!709)) (bvsge (size!11588 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395557 () Bool)

(assert (=> b!395557 (= e!239409 (and e!239411 mapRes!16365))))

(declare-fun condMapEmpty!16365 () Bool)

(declare-fun mapDefault!16365 () ValueCell!4574)

(assert (=> b!395557 (= condMapEmpty!16365 (= (arr!11236 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4574)) mapDefault!16365)))))

(declare-fun b!395558 () Bool)

(declare-fun res!226847 () Bool)

(assert (=> b!395558 (=> (not res!226847) (not e!239412))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395558 (= res!226847 (and (= (size!11589 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11588 _keys!709) (size!11589 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38354 res!226854) b!395554))

(assert (= (and b!395554 res!226846) b!395558))

(assert (= (and b!395558 res!226847) b!395549))

(assert (= (and b!395549 res!226849) b!395555))

(assert (= (and b!395555 res!226855) b!395552))

(assert (= (and b!395552 res!226850) b!395550))

(assert (= (and b!395550 res!226852) b!395553))

(assert (= (and b!395553 res!226851) b!395546))

(assert (= (and b!395546 res!226848) b!395551))

(assert (= (and b!395551 res!226853) b!395556))

(assert (= (and b!395557 condMapEmpty!16365) mapIsEmpty!16365))

(assert (= (and b!395557 (not condMapEmpty!16365)) mapNonEmpty!16365))

(get-info :version)

(assert (= (and mapNonEmpty!16365 ((_ is ValueCellFull!4574) mapValue!16365)) b!395548))

(assert (= (and b!395557 ((_ is ValueCellFull!4574) mapDefault!16365)) b!395547))

(assert (= start!38354 b!395557))

(declare-fun m!390963 () Bool)

(assert (=> b!395553 m!390963))

(declare-fun m!390965 () Bool)

(assert (=> b!395554 m!390965))

(declare-fun m!390967 () Bool)

(assert (=> b!395551 m!390967))

(declare-fun m!390969 () Bool)

(assert (=> b!395551 m!390969))

(declare-fun m!390971 () Bool)

(assert (=> b!395550 m!390971))

(declare-fun m!390973 () Bool)

(assert (=> b!395555 m!390973))

(declare-fun m!390975 () Bool)

(assert (=> mapNonEmpty!16365 m!390975))

(declare-fun m!390977 () Bool)

(assert (=> start!38354 m!390977))

(declare-fun m!390979 () Bool)

(assert (=> start!38354 m!390979))

(declare-fun m!390981 () Bool)

(assert (=> b!395546 m!390981))

(declare-fun m!390983 () Bool)

(assert (=> b!395549 m!390983))

(check-sat (not b!395554) (not b!395550) (not b!395551) tp_is_empty!9835 (not b!395549) (not mapNonEmpty!16365) (not b!395546) (not b!395555) (not start!38354))
(check-sat)
(get-model)

(declare-fun d!73153 () Bool)

(assert (=> d!73153 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395554 d!73153))

(declare-fun d!73155 () Bool)

(declare-fun res!226920 () Bool)

(declare-fun e!239451 () Bool)

(assert (=> d!73155 (=> res!226920 e!239451)))

(assert (=> d!73155 (= res!226920 (bvsge #b00000000000000000000000000000000 (size!11588 _keys!709)))))

(assert (=> d!73155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239451)))

(declare-fun b!395645 () Bool)

(declare-fun e!239452 () Bool)

(declare-fun call!27853 () Bool)

(assert (=> b!395645 (= e!239452 call!27853)))

(declare-fun b!395646 () Bool)

(declare-fun e!239450 () Bool)

(assert (=> b!395646 (= e!239451 e!239450)))

(declare-fun c!54483 () Bool)

(assert (=> b!395646 (= c!54483 (validKeyInArray!0 (select (arr!11235 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395647 () Bool)

(assert (=> b!395647 (= e!239450 e!239452)))

(declare-fun lt!186866 () (_ BitVec 64))

(assert (=> b!395647 (= lt!186866 (select (arr!11235 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12042 0))(
  ( (Unit!12043) )
))
(declare-fun lt!186867 () Unit!12042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23565 (_ BitVec 64) (_ BitVec 32)) Unit!12042)

(assert (=> b!395647 (= lt!186867 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!186866 #b00000000000000000000000000000000))))

(assert (=> b!395647 (arrayContainsKey!0 _keys!709 lt!186866 #b00000000000000000000000000000000)))

(declare-fun lt!186868 () Unit!12042)

(assert (=> b!395647 (= lt!186868 lt!186867)))

(declare-fun res!226921 () Bool)

(declare-datatypes ((SeekEntryResult!3519 0))(
  ( (MissingZero!3519 (index!16255 (_ BitVec 32))) (Found!3519 (index!16256 (_ BitVec 32))) (Intermediate!3519 (undefined!4331 Bool) (index!16257 (_ BitVec 32)) (x!38662 (_ BitVec 32))) (Undefined!3519) (MissingVacant!3519 (index!16258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23565 (_ BitVec 32)) SeekEntryResult!3519)

(assert (=> b!395647 (= res!226921 (= (seekEntryOrOpen!0 (select (arr!11235 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3519 #b00000000000000000000000000000000)))))

(assert (=> b!395647 (=> (not res!226921) (not e!239452))))

(declare-fun b!395648 () Bool)

(assert (=> b!395648 (= e!239450 call!27853)))

(declare-fun bm!27850 () Bool)

(assert (=> bm!27850 (= call!27853 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!73155 (not res!226920)) b!395646))

(assert (= (and b!395646 c!54483) b!395647))

(assert (= (and b!395646 (not c!54483)) b!395648))

(assert (= (and b!395647 res!226921) b!395645))

(assert (= (or b!395645 b!395648) bm!27850))

(declare-fun m!391029 () Bool)

(assert (=> b!395646 m!391029))

(assert (=> b!395646 m!391029))

(declare-fun m!391031 () Bool)

(assert (=> b!395646 m!391031))

(assert (=> b!395647 m!391029))

(declare-fun m!391033 () Bool)

(assert (=> b!395647 m!391033))

(declare-fun m!391035 () Bool)

(assert (=> b!395647 m!391035))

(assert (=> b!395647 m!391029))

(declare-fun m!391037 () Bool)

(assert (=> b!395647 m!391037))

(declare-fun m!391039 () Bool)

(assert (=> bm!27850 m!391039))

(assert (=> b!395549 d!73155))

(declare-fun d!73157 () Bool)

(assert (=> d!73157 (= (array_inv!8246 _values!549) (bvsge (size!11589 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38354 d!73157))

(declare-fun d!73159 () Bool)

(assert (=> d!73159 (= (array_inv!8247 _keys!709) (bvsge (size!11588 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38354 d!73159))

(declare-fun d!73161 () Bool)

(declare-fun res!226926 () Bool)

(declare-fun e!239457 () Bool)

(assert (=> d!73161 (=> res!226926 e!239457)))

(assert (=> d!73161 (= res!226926 (= (select (arr!11235 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73161 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239457)))

(declare-fun b!395653 () Bool)

(declare-fun e!239458 () Bool)

(assert (=> b!395653 (= e!239457 e!239458)))

(declare-fun res!226927 () Bool)

(assert (=> b!395653 (=> (not res!226927) (not e!239458))))

(assert (=> b!395653 (= res!226927 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11588 _keys!709)))))

(declare-fun b!395654 () Bool)

(assert (=> b!395654 (= e!239458 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73161 (not res!226926)) b!395653))

(assert (= (and b!395653 res!226927) b!395654))

(assert (=> d!73161 m!391029))

(declare-fun m!391041 () Bool)

(assert (=> b!395654 m!391041))

(assert (=> b!395546 d!73161))

(declare-fun d!73163 () Bool)

(assert (=> d!73163 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395550 d!73163))

(declare-fun d!73165 () Bool)

(declare-fun res!226935 () Bool)

(declare-fun e!239467 () Bool)

(assert (=> d!73165 (=> res!226935 e!239467)))

(assert (=> d!73165 (= res!226935 (bvsge #b00000000000000000000000000000000 (size!11588 _keys!709)))))

(assert (=> d!73165 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6475) e!239467)))

(declare-fun bm!27853 () Bool)

(declare-fun call!27856 () Bool)

(declare-fun c!54486 () Bool)

(assert (=> bm!27853 (= call!27856 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54486 (Cons!6474 (select (arr!11235 _keys!709) #b00000000000000000000000000000000) Nil!6475) Nil!6475)))))

(declare-fun b!395665 () Bool)

(declare-fun e!239468 () Bool)

(declare-fun e!239470 () Bool)

(assert (=> b!395665 (= e!239468 e!239470)))

(assert (=> b!395665 (= c!54486 (validKeyInArray!0 (select (arr!11235 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395666 () Bool)

(assert (=> b!395666 (= e!239470 call!27856)))

(declare-fun b!395667 () Bool)

(declare-fun e!239469 () Bool)

(declare-fun contains!2470 (List!6478 (_ BitVec 64)) Bool)

(assert (=> b!395667 (= e!239469 (contains!2470 Nil!6475 (select (arr!11235 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395668 () Bool)

(assert (=> b!395668 (= e!239470 call!27856)))

(declare-fun b!395669 () Bool)

(assert (=> b!395669 (= e!239467 e!239468)))

(declare-fun res!226934 () Bool)

(assert (=> b!395669 (=> (not res!226934) (not e!239468))))

(assert (=> b!395669 (= res!226934 (not e!239469))))

(declare-fun res!226936 () Bool)

(assert (=> b!395669 (=> (not res!226936) (not e!239469))))

(assert (=> b!395669 (= res!226936 (validKeyInArray!0 (select (arr!11235 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73165 (not res!226935)) b!395669))

(assert (= (and b!395669 res!226936) b!395667))

(assert (= (and b!395669 res!226934) b!395665))

(assert (= (and b!395665 c!54486) b!395668))

(assert (= (and b!395665 (not c!54486)) b!395666))

(assert (= (or b!395668 b!395666) bm!27853))

(assert (=> bm!27853 m!391029))

(declare-fun m!391043 () Bool)

(assert (=> bm!27853 m!391043))

(assert (=> b!395665 m!391029))

(assert (=> b!395665 m!391029))

(assert (=> b!395665 m!391031))

(assert (=> b!395667 m!391029))

(assert (=> b!395667 m!391029))

(declare-fun m!391045 () Bool)

(assert (=> b!395667 m!391045))

(assert (=> b!395669 m!391029))

(assert (=> b!395669 m!391029))

(assert (=> b!395669 m!391031))

(assert (=> b!395555 d!73165))

(declare-fun d!73167 () Bool)

(declare-fun res!226937 () Bool)

(declare-fun e!239472 () Bool)

(assert (=> d!73167 (=> res!226937 e!239472)))

(assert (=> d!73167 (= res!226937 (bvsge #b00000000000000000000000000000000 (size!11588 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709)))))))

(assert (=> d!73167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025) e!239472)))

(declare-fun b!395670 () Bool)

(declare-fun e!239473 () Bool)

(declare-fun call!27857 () Bool)

(assert (=> b!395670 (= e!239473 call!27857)))

(declare-fun b!395671 () Bool)

(declare-fun e!239471 () Bool)

(assert (=> b!395671 (= e!239472 e!239471)))

(declare-fun c!54487 () Bool)

(assert (=> b!395671 (= c!54487 (validKeyInArray!0 (select (arr!11235 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709))) #b00000000000000000000000000000000)))))

(declare-fun b!395672 () Bool)

(assert (=> b!395672 (= e!239471 e!239473)))

(declare-fun lt!186869 () (_ BitVec 64))

(assert (=> b!395672 (= lt!186869 (select (arr!11235 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709))) #b00000000000000000000000000000000))))

(declare-fun lt!186870 () Unit!12042)

(assert (=> b!395672 (= lt!186870 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709)) lt!186869 #b00000000000000000000000000000000))))

(assert (=> b!395672 (arrayContainsKey!0 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709)) lt!186869 #b00000000000000000000000000000000)))

(declare-fun lt!186871 () Unit!12042)

(assert (=> b!395672 (= lt!186871 lt!186870)))

(declare-fun res!226938 () Bool)

(assert (=> b!395672 (= res!226938 (= (seekEntryOrOpen!0 (select (arr!11235 (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709))) #b00000000000000000000000000000000) (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025) (Found!3519 #b00000000000000000000000000000000)))))

(assert (=> b!395672 (=> (not res!226938) (not e!239473))))

(declare-fun b!395673 () Bool)

(assert (=> b!395673 (= e!239471 call!27857)))

(declare-fun bm!27854 () Bool)

(assert (=> bm!27854 (= call!27857 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23566 (store (arr!11235 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025))))

(assert (= (and d!73167 (not res!226937)) b!395671))

(assert (= (and b!395671 c!54487) b!395672))

(assert (= (and b!395671 (not c!54487)) b!395673))

(assert (= (and b!395672 res!226938) b!395670))

(assert (= (or b!395670 b!395673) bm!27854))

(declare-fun m!391047 () Bool)

(assert (=> b!395671 m!391047))

(assert (=> b!395671 m!391047))

(declare-fun m!391049 () Bool)

(assert (=> b!395671 m!391049))

(assert (=> b!395672 m!391047))

(declare-fun m!391051 () Bool)

(assert (=> b!395672 m!391051))

(declare-fun m!391053 () Bool)

(assert (=> b!395672 m!391053))

(assert (=> b!395672 m!391047))

(declare-fun m!391055 () Bool)

(assert (=> b!395672 m!391055))

(declare-fun m!391057 () Bool)

(assert (=> bm!27854 m!391057))

(assert (=> b!395551 d!73167))

(declare-fun b!395681 () Bool)

(declare-fun e!239478 () Bool)

(assert (=> b!395681 (= e!239478 tp_is_empty!9835)))

(declare-fun mapNonEmpty!16374 () Bool)

(declare-fun mapRes!16374 () Bool)

(declare-fun tp!32169 () Bool)

(declare-fun e!239479 () Bool)

(assert (=> mapNonEmpty!16374 (= mapRes!16374 (and tp!32169 e!239479))))

(declare-fun mapKey!16374 () (_ BitVec 32))

(declare-fun mapValue!16374 () ValueCell!4574)

(declare-fun mapRest!16374 () (Array (_ BitVec 32) ValueCell!4574))

(assert (=> mapNonEmpty!16374 (= mapRest!16365 (store mapRest!16374 mapKey!16374 mapValue!16374))))

(declare-fun mapIsEmpty!16374 () Bool)

(assert (=> mapIsEmpty!16374 mapRes!16374))

(declare-fun condMapEmpty!16374 () Bool)

(declare-fun mapDefault!16374 () ValueCell!4574)

(assert (=> mapNonEmpty!16365 (= condMapEmpty!16374 (= mapRest!16365 ((as const (Array (_ BitVec 32) ValueCell!4574)) mapDefault!16374)))))

(assert (=> mapNonEmpty!16365 (= tp!32160 (and e!239478 mapRes!16374))))

(declare-fun b!395680 () Bool)

(assert (=> b!395680 (= e!239479 tp_is_empty!9835)))

(assert (= (and mapNonEmpty!16365 condMapEmpty!16374) mapIsEmpty!16374))

(assert (= (and mapNonEmpty!16365 (not condMapEmpty!16374)) mapNonEmpty!16374))

(assert (= (and mapNonEmpty!16374 ((_ is ValueCellFull!4574) mapValue!16374)) b!395680))

(assert (= (and mapNonEmpty!16365 ((_ is ValueCellFull!4574) mapDefault!16374)) b!395681))

(declare-fun m!391059 () Bool)

(assert (=> mapNonEmpty!16374 m!391059))

(check-sat (not b!395665) (not bm!27853) (not bm!27854) (not b!395646) (not bm!27850) (not b!395654) (not b!395672) tp_is_empty!9835 (not b!395667) (not b!395669) (not mapNonEmpty!16374) (not b!395647) (not b!395671))
(check-sat)
