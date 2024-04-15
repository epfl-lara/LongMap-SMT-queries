; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38374 () Bool)

(assert start!38374)

(declare-fun b!395710 () Bool)

(declare-fun res!226961 () Bool)

(declare-fun e!239491 () Bool)

(assert (=> b!395710 (=> (not res!226961) (not e!239491))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395710 (= res!226961 (validKeyInArray!0 k0!794))))

(declare-fun b!395711 () Bool)

(declare-fun res!226969 () Bool)

(assert (=> b!395711 (=> (not res!226969) (not e!239491))))

(declare-datatypes ((array!23577 0))(
  ( (array!23578 (arr!11240 (Array (_ BitVec 32) (_ BitVec 64))) (size!11593 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23577)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23577 (_ BitVec 32)) Bool)

(assert (=> b!395711 (= res!226969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709)) mask!1025))))

(declare-fun b!395712 () Bool)

(declare-datatypes ((List!6479 0))(
  ( (Nil!6476) (Cons!6475 (h!7331 (_ BitVec 64)) (t!11644 List!6479)) )
))
(declare-fun noDuplicate!199 (List!6479) Bool)

(assert (=> b!395712 (= e!239491 (not (noDuplicate!199 Nil!6476)))))

(declare-fun b!395713 () Bool)

(declare-fun res!226965 () Bool)

(assert (=> b!395713 (=> (not res!226965) (not e!239491))))

(assert (=> b!395713 (= res!226965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395714 () Bool)

(declare-fun res!226971 () Bool)

(assert (=> b!395714 (=> (not res!226971) (not e!239491))))

(assert (=> b!395714 (= res!226971 (or (= (select (arr!11240 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11240 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395715 () Bool)

(declare-fun e!239492 () Bool)

(declare-fun tp_is_empty!9841 () Bool)

(assert (=> b!395715 (= e!239492 tp_is_empty!9841)))

(declare-fun b!395716 () Bool)

(declare-fun res!226966 () Bool)

(assert (=> b!395716 (=> (not res!226966) (not e!239491))))

(assert (=> b!395716 (= res!226966 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11593 _keys!709))))))

(declare-fun b!395717 () Bool)

(declare-fun res!226964 () Bool)

(assert (=> b!395717 (=> (not res!226964) (not e!239491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395717 (= res!226964 (validMask!0 mask!1025))))

(declare-fun b!395718 () Bool)

(declare-fun e!239493 () Bool)

(assert (=> b!395718 (= e!239493 tp_is_empty!9841)))

(declare-fun b!395719 () Bool)

(declare-fun res!226968 () Bool)

(assert (=> b!395719 (=> (not res!226968) (not e!239491))))

(declare-fun arrayNoDuplicates!0 (array!23577 (_ BitVec 32) List!6479) Bool)

(assert (=> b!395719 (= res!226968 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6476))))

(declare-fun b!395720 () Bool)

(declare-fun e!239490 () Bool)

(declare-fun mapRes!16377 () Bool)

(assert (=> b!395720 (= e!239490 (and e!239492 mapRes!16377))))

(declare-fun condMapEmpty!16377 () Bool)

(declare-datatypes ((V!14227 0))(
  ( (V!14228 (val!4965 Int)) )
))
(declare-datatypes ((ValueCell!4577 0))(
  ( (ValueCellFull!4577 (v!7205 V!14227)) (EmptyCell!4577) )
))
(declare-datatypes ((array!23579 0))(
  ( (array!23580 (arr!11241 (Array (_ BitVec 32) ValueCell!4577)) (size!11594 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23579)

(declare-fun mapDefault!16377 () ValueCell!4577)

(assert (=> b!395720 (= condMapEmpty!16377 (= (arr!11241 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4577)) mapDefault!16377)))))

(declare-fun b!395721 () Bool)

(declare-fun res!226970 () Bool)

(assert (=> b!395721 (=> (not res!226970) (not e!239491))))

(declare-fun arrayContainsKey!0 (array!23577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395721 (= res!226970 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16377 () Bool)

(declare-fun tp!32172 () Bool)

(assert (=> mapNonEmpty!16377 (= mapRes!16377 (and tp!32172 e!239493))))

(declare-fun mapRest!16377 () (Array (_ BitVec 32) ValueCell!4577))

(declare-fun mapValue!16377 () ValueCell!4577)

(declare-fun mapKey!16377 () (_ BitVec 32))

(assert (=> mapNonEmpty!16377 (= (arr!11241 _values!549) (store mapRest!16377 mapKey!16377 mapValue!16377))))

(declare-fun b!395722 () Bool)

(declare-fun res!226962 () Bool)

(assert (=> b!395722 (=> (not res!226962) (not e!239491))))

(assert (=> b!395722 (= res!226962 (and (bvsle #b00000000000000000000000000000000 (size!11593 _keys!709)) (bvslt (size!11593 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395723 () Bool)

(declare-fun res!226963 () Bool)

(assert (=> b!395723 (=> (not res!226963) (not e!239491))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395723 (= res!226963 (and (= (size!11594 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11593 _keys!709) (size!11594 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!226967 () Bool)

(assert (=> start!38374 (=> (not res!226967) (not e!239491))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38374 (= res!226967 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11593 _keys!709))))))

(assert (=> start!38374 e!239491))

(assert (=> start!38374 true))

(declare-fun array_inv!8248 (array!23579) Bool)

(assert (=> start!38374 (and (array_inv!8248 _values!549) e!239490)))

(declare-fun array_inv!8249 (array!23577) Bool)

(assert (=> start!38374 (array_inv!8249 _keys!709)))

(declare-fun mapIsEmpty!16377 () Bool)

(assert (=> mapIsEmpty!16377 mapRes!16377))

(assert (= (and start!38374 res!226967) b!395717))

(assert (= (and b!395717 res!226964) b!395723))

(assert (= (and b!395723 res!226963) b!395713))

(assert (= (and b!395713 res!226965) b!395719))

(assert (= (and b!395719 res!226968) b!395716))

(assert (= (and b!395716 res!226966) b!395710))

(assert (= (and b!395710 res!226961) b!395714))

(assert (= (and b!395714 res!226971) b!395721))

(assert (= (and b!395721 res!226970) b!395711))

(assert (= (and b!395711 res!226969) b!395722))

(assert (= (and b!395722 res!226962) b!395712))

(assert (= (and b!395720 condMapEmpty!16377) mapIsEmpty!16377))

(assert (= (and b!395720 (not condMapEmpty!16377)) mapNonEmpty!16377))

(get-info :version)

(assert (= (and mapNonEmpty!16377 ((_ is ValueCellFull!4577) mapValue!16377)) b!395718))

(assert (= (and b!395720 ((_ is ValueCellFull!4577) mapDefault!16377)) b!395715))

(assert (= start!38374 b!395720))

(declare-fun m!391061 () Bool)

(assert (=> b!395712 m!391061))

(declare-fun m!391063 () Bool)

(assert (=> b!395717 m!391063))

(declare-fun m!391065 () Bool)

(assert (=> start!38374 m!391065))

(declare-fun m!391067 () Bool)

(assert (=> start!38374 m!391067))

(declare-fun m!391069 () Bool)

(assert (=> mapNonEmpty!16377 m!391069))

(declare-fun m!391071 () Bool)

(assert (=> b!395710 m!391071))

(declare-fun m!391073 () Bool)

(assert (=> b!395713 m!391073))

(declare-fun m!391075 () Bool)

(assert (=> b!395721 m!391075))

(declare-fun m!391077 () Bool)

(assert (=> b!395719 m!391077))

(declare-fun m!391079 () Bool)

(assert (=> b!395714 m!391079))

(declare-fun m!391081 () Bool)

(assert (=> b!395711 m!391081))

(declare-fun m!391083 () Bool)

(assert (=> b!395711 m!391083))

(check-sat (not b!395712) (not b!395717) tp_is_empty!9841 (not b!395721) (not start!38374) (not mapNonEmpty!16377) (not b!395710) (not b!395719) (not b!395713) (not b!395711))
(check-sat)
(get-model)

(declare-fun b!395816 () Bool)

(declare-fun e!239532 () Bool)

(declare-fun call!27860 () Bool)

(assert (=> b!395816 (= e!239532 call!27860)))

(declare-fun d!73171 () Bool)

(declare-fun res!227042 () Bool)

(declare-fun e!239533 () Bool)

(assert (=> d!73171 (=> res!227042 e!239533)))

(assert (=> d!73171 (= res!227042 (bvsge #b00000000000000000000000000000000 (size!11593 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709)))))))

(assert (=> d!73171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709)) mask!1025) e!239533)))

(declare-fun b!395817 () Bool)

(declare-fun e!239531 () Bool)

(assert (=> b!395817 (= e!239531 call!27860)))

(declare-fun bm!27857 () Bool)

(assert (=> bm!27857 (= call!27860 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709)) mask!1025))))

(declare-fun b!395818 () Bool)

(assert (=> b!395818 (= e!239531 e!239532)))

(declare-fun lt!186879 () (_ BitVec 64))

(assert (=> b!395818 (= lt!186879 (select (arr!11240 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12044 0))(
  ( (Unit!12045) )
))
(declare-fun lt!186878 () Unit!12044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23577 (_ BitVec 64) (_ BitVec 32)) Unit!12044)

(assert (=> b!395818 (= lt!186878 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709)) lt!186879 #b00000000000000000000000000000000))))

(assert (=> b!395818 (arrayContainsKey!0 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709)) lt!186879 #b00000000000000000000000000000000)))

(declare-fun lt!186880 () Unit!12044)

(assert (=> b!395818 (= lt!186880 lt!186878)))

(declare-fun res!227043 () Bool)

(declare-datatypes ((SeekEntryResult!3520 0))(
  ( (MissingZero!3520 (index!16259 (_ BitVec 32))) (Found!3520 (index!16260 (_ BitVec 32))) (Intermediate!3520 (undefined!4332 Bool) (index!16261 (_ BitVec 32)) (x!38673 (_ BitVec 32))) (Undefined!3520) (MissingVacant!3520 (index!16262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23577 (_ BitVec 32)) SeekEntryResult!3520)

(assert (=> b!395818 (= res!227043 (= (seekEntryOrOpen!0 (select (arr!11240 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709))) #b00000000000000000000000000000000) (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709)) mask!1025) (Found!3520 #b00000000000000000000000000000000)))))

(assert (=> b!395818 (=> (not res!227043) (not e!239532))))

(declare-fun b!395819 () Bool)

(assert (=> b!395819 (= e!239533 e!239531)))

(declare-fun c!54490 () Bool)

(assert (=> b!395819 (= c!54490 (validKeyInArray!0 (select (arr!11240 (array!23578 (store (arr!11240 _keys!709) i!563 k0!794) (size!11593 _keys!709))) #b00000000000000000000000000000000)))))

(assert (= (and d!73171 (not res!227042)) b!395819))

(assert (= (and b!395819 c!54490) b!395818))

(assert (= (and b!395819 (not c!54490)) b!395817))

(assert (= (and b!395818 res!227043) b!395816))

(assert (= (or b!395816 b!395817) bm!27857))

(declare-fun m!391133 () Bool)

(assert (=> bm!27857 m!391133))

(declare-fun m!391135 () Bool)

(assert (=> b!395818 m!391135))

(declare-fun m!391137 () Bool)

(assert (=> b!395818 m!391137))

(declare-fun m!391139 () Bool)

(assert (=> b!395818 m!391139))

(assert (=> b!395818 m!391135))

(declare-fun m!391141 () Bool)

(assert (=> b!395818 m!391141))

(assert (=> b!395819 m!391135))

(assert (=> b!395819 m!391135))

(declare-fun m!391143 () Bool)

(assert (=> b!395819 m!391143))

(assert (=> b!395711 d!73171))

(declare-fun d!73173 () Bool)

(declare-fun res!227048 () Bool)

(declare-fun e!239538 () Bool)

(assert (=> d!73173 (=> res!227048 e!239538)))

(assert (=> d!73173 (= res!227048 (= (select (arr!11240 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73173 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239538)))

(declare-fun b!395824 () Bool)

(declare-fun e!239539 () Bool)

(assert (=> b!395824 (= e!239538 e!239539)))

(declare-fun res!227049 () Bool)

(assert (=> b!395824 (=> (not res!227049) (not e!239539))))

(assert (=> b!395824 (= res!227049 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11593 _keys!709)))))

(declare-fun b!395825 () Bool)

(assert (=> b!395825 (= e!239539 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73173 (not res!227048)) b!395824))

(assert (= (and b!395824 res!227049) b!395825))

(declare-fun m!391145 () Bool)

(assert (=> d!73173 m!391145))

(declare-fun m!391147 () Bool)

(assert (=> b!395825 m!391147))

(assert (=> b!395721 d!73173))

(declare-fun d!73175 () Bool)

(declare-fun res!227054 () Bool)

(declare-fun e!239544 () Bool)

(assert (=> d!73175 (=> res!227054 e!239544)))

(assert (=> d!73175 (= res!227054 ((_ is Nil!6476) Nil!6476))))

(assert (=> d!73175 (= (noDuplicate!199 Nil!6476) e!239544)))

(declare-fun b!395830 () Bool)

(declare-fun e!239545 () Bool)

(assert (=> b!395830 (= e!239544 e!239545)))

(declare-fun res!227055 () Bool)

(assert (=> b!395830 (=> (not res!227055) (not e!239545))))

(declare-fun contains!2471 (List!6479 (_ BitVec 64)) Bool)

(assert (=> b!395830 (= res!227055 (not (contains!2471 (t!11644 Nil!6476) (h!7331 Nil!6476))))))

(declare-fun b!395831 () Bool)

(assert (=> b!395831 (= e!239545 (noDuplicate!199 (t!11644 Nil!6476)))))

(assert (= (and d!73175 (not res!227054)) b!395830))

(assert (= (and b!395830 res!227055) b!395831))

(declare-fun m!391149 () Bool)

(assert (=> b!395830 m!391149))

(declare-fun m!391151 () Bool)

(assert (=> b!395831 m!391151))

(assert (=> b!395712 d!73175))

(declare-fun d!73177 () Bool)

(assert (=> d!73177 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395717 d!73177))

(declare-fun d!73179 () Bool)

(assert (=> d!73179 (= (array_inv!8248 _values!549) (bvsge (size!11594 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38374 d!73179))

(declare-fun d!73181 () Bool)

(assert (=> d!73181 (= (array_inv!8249 _keys!709) (bvsge (size!11593 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38374 d!73181))

(declare-fun b!395842 () Bool)

(declare-fun e!239556 () Bool)

(assert (=> b!395842 (= e!239556 (contains!2471 Nil!6476 (select (arr!11240 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73183 () Bool)

(declare-fun res!227062 () Bool)

(declare-fun e!239557 () Bool)

(assert (=> d!73183 (=> res!227062 e!239557)))

(assert (=> d!73183 (= res!227062 (bvsge #b00000000000000000000000000000000 (size!11593 _keys!709)))))

(assert (=> d!73183 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6476) e!239557)))

(declare-fun b!395843 () Bool)

(declare-fun e!239554 () Bool)

(declare-fun call!27863 () Bool)

(assert (=> b!395843 (= e!239554 call!27863)))

(declare-fun bm!27860 () Bool)

(declare-fun c!54493 () Bool)

(assert (=> bm!27860 (= call!27863 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54493 (Cons!6475 (select (arr!11240 _keys!709) #b00000000000000000000000000000000) Nil!6476) Nil!6476)))))

(declare-fun b!395844 () Bool)

(declare-fun e!239555 () Bool)

(assert (=> b!395844 (= e!239555 e!239554)))

(assert (=> b!395844 (= c!54493 (validKeyInArray!0 (select (arr!11240 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395845 () Bool)

(assert (=> b!395845 (= e!239557 e!239555)))

(declare-fun res!227063 () Bool)

(assert (=> b!395845 (=> (not res!227063) (not e!239555))))

(assert (=> b!395845 (= res!227063 (not e!239556))))

(declare-fun res!227064 () Bool)

(assert (=> b!395845 (=> (not res!227064) (not e!239556))))

(assert (=> b!395845 (= res!227064 (validKeyInArray!0 (select (arr!11240 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395846 () Bool)

(assert (=> b!395846 (= e!239554 call!27863)))

(assert (= (and d!73183 (not res!227062)) b!395845))

(assert (= (and b!395845 res!227064) b!395842))

(assert (= (and b!395845 res!227063) b!395844))

(assert (= (and b!395844 c!54493) b!395843))

(assert (= (and b!395844 (not c!54493)) b!395846))

(assert (= (or b!395843 b!395846) bm!27860))

(assert (=> b!395842 m!391145))

(assert (=> b!395842 m!391145))

(declare-fun m!391153 () Bool)

(assert (=> b!395842 m!391153))

(assert (=> bm!27860 m!391145))

(declare-fun m!391155 () Bool)

(assert (=> bm!27860 m!391155))

(assert (=> b!395844 m!391145))

(assert (=> b!395844 m!391145))

(declare-fun m!391157 () Bool)

(assert (=> b!395844 m!391157))

(assert (=> b!395845 m!391145))

(assert (=> b!395845 m!391145))

(assert (=> b!395845 m!391157))

(assert (=> b!395719 d!73183))

(declare-fun b!395847 () Bool)

(declare-fun e!239559 () Bool)

(declare-fun call!27864 () Bool)

(assert (=> b!395847 (= e!239559 call!27864)))

(declare-fun d!73185 () Bool)

(declare-fun res!227065 () Bool)

(declare-fun e!239560 () Bool)

(assert (=> d!73185 (=> res!227065 e!239560)))

(assert (=> d!73185 (= res!227065 (bvsge #b00000000000000000000000000000000 (size!11593 _keys!709)))))

(assert (=> d!73185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239560)))

(declare-fun b!395848 () Bool)

(declare-fun e!239558 () Bool)

(assert (=> b!395848 (= e!239558 call!27864)))

(declare-fun bm!27861 () Bool)

(assert (=> bm!27861 (= call!27864 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!395849 () Bool)

(assert (=> b!395849 (= e!239558 e!239559)))

(declare-fun lt!186882 () (_ BitVec 64))

(assert (=> b!395849 (= lt!186882 (select (arr!11240 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!186881 () Unit!12044)

(assert (=> b!395849 (= lt!186881 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!186882 #b00000000000000000000000000000000))))

(assert (=> b!395849 (arrayContainsKey!0 _keys!709 lt!186882 #b00000000000000000000000000000000)))

(declare-fun lt!186883 () Unit!12044)

(assert (=> b!395849 (= lt!186883 lt!186881)))

(declare-fun res!227066 () Bool)

(assert (=> b!395849 (= res!227066 (= (seekEntryOrOpen!0 (select (arr!11240 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3520 #b00000000000000000000000000000000)))))

(assert (=> b!395849 (=> (not res!227066) (not e!239559))))

(declare-fun b!395850 () Bool)

(assert (=> b!395850 (= e!239560 e!239558)))

(declare-fun c!54494 () Bool)

(assert (=> b!395850 (= c!54494 (validKeyInArray!0 (select (arr!11240 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73185 (not res!227065)) b!395850))

(assert (= (and b!395850 c!54494) b!395849))

(assert (= (and b!395850 (not c!54494)) b!395848))

(assert (= (and b!395849 res!227066) b!395847))

(assert (= (or b!395847 b!395848) bm!27861))

(declare-fun m!391159 () Bool)

(assert (=> bm!27861 m!391159))

(assert (=> b!395849 m!391145))

(declare-fun m!391161 () Bool)

(assert (=> b!395849 m!391161))

(declare-fun m!391163 () Bool)

(assert (=> b!395849 m!391163))

(assert (=> b!395849 m!391145))

(declare-fun m!391165 () Bool)

(assert (=> b!395849 m!391165))

(assert (=> b!395850 m!391145))

(assert (=> b!395850 m!391145))

(assert (=> b!395850 m!391157))

(assert (=> b!395713 d!73185))

(declare-fun d!73187 () Bool)

(assert (=> d!73187 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395710 d!73187))

(declare-fun mapNonEmpty!16386 () Bool)

(declare-fun mapRes!16386 () Bool)

(declare-fun tp!32181 () Bool)

(declare-fun e!239566 () Bool)

(assert (=> mapNonEmpty!16386 (= mapRes!16386 (and tp!32181 e!239566))))

(declare-fun mapRest!16386 () (Array (_ BitVec 32) ValueCell!4577))

(declare-fun mapValue!16386 () ValueCell!4577)

(declare-fun mapKey!16386 () (_ BitVec 32))

(assert (=> mapNonEmpty!16386 (= mapRest!16377 (store mapRest!16386 mapKey!16386 mapValue!16386))))

(declare-fun b!395858 () Bool)

(declare-fun e!239565 () Bool)

(assert (=> b!395858 (= e!239565 tp_is_empty!9841)))

(declare-fun mapIsEmpty!16386 () Bool)

(assert (=> mapIsEmpty!16386 mapRes!16386))

(declare-fun b!395857 () Bool)

(assert (=> b!395857 (= e!239566 tp_is_empty!9841)))

(declare-fun condMapEmpty!16386 () Bool)

(declare-fun mapDefault!16386 () ValueCell!4577)

(assert (=> mapNonEmpty!16377 (= condMapEmpty!16386 (= mapRest!16377 ((as const (Array (_ BitVec 32) ValueCell!4577)) mapDefault!16386)))))

(assert (=> mapNonEmpty!16377 (= tp!32172 (and e!239565 mapRes!16386))))

(assert (= (and mapNonEmpty!16377 condMapEmpty!16386) mapIsEmpty!16386))

(assert (= (and mapNonEmpty!16377 (not condMapEmpty!16386)) mapNonEmpty!16386))

(assert (= (and mapNonEmpty!16386 ((_ is ValueCellFull!4577) mapValue!16386)) b!395857))

(assert (= (and mapNonEmpty!16377 ((_ is ValueCellFull!4577) mapDefault!16386)) b!395858))

(declare-fun m!391167 () Bool)

(assert (=> mapNonEmpty!16386 m!391167))

(check-sat (not b!395825) (not bm!27860) (not mapNonEmpty!16386) (not b!395842) (not b!395831) (not b!395818) (not bm!27861) (not b!395844) (not b!395849) (not bm!27857) tp_is_empty!9841 (not b!395819) (not b!395845) (not b!395850) (not b!395830))
(check-sat)
