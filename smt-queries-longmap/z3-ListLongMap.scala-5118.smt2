; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69424 () Bool)

(assert start!69424)

(declare-fun b!809581 () Bool)

(declare-fun e!448115 () Bool)

(declare-fun e!448114 () Bool)

(assert (=> b!809581 (= e!448115 e!448114)))

(declare-fun res!553312 () Bool)

(assert (=> b!809581 (=> (not res!553312) (not e!448114))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362825 () (_ BitVec 32))

(declare-datatypes ((array!44022 0))(
  ( (array!44023 (arr!21085 (Array (_ BitVec 32) (_ BitVec 64))) (size!21506 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44022)

(assert (=> b!809581 (= res!553312 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!362825 #b00000000000000000000000000000000) (bvslt lt!362825 (size!21506 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809581 (= lt!362825 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809582 () Bool)

(declare-fun res!553308 () Bool)

(declare-fun e!448118 () Bool)

(assert (=> b!809582 (=> (not res!553308) (not e!448118))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809582 (= res!553308 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809583 () Bool)

(declare-fun e!448117 () Bool)

(assert (=> b!809583 (= e!448118 e!448117)))

(declare-fun res!553313 () Bool)

(assert (=> b!809583 (=> (not res!553313) (not e!448117))))

(declare-datatypes ((SeekEntryResult!8676 0))(
  ( (MissingZero!8676 (index!37072 (_ BitVec 32))) (Found!8676 (index!37073 (_ BitVec 32))) (Intermediate!8676 (undefined!9488 Bool) (index!37074 (_ BitVec 32)) (x!67876 (_ BitVec 32))) (Undefined!8676) (MissingVacant!8676 (index!37075 (_ BitVec 32))) )
))
(declare-fun lt!362829 () SeekEntryResult!8676)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809583 (= res!553313 (or (= lt!362829 (MissingZero!8676 i!1163)) (= lt!362829 (MissingVacant!8676 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44022 (_ BitVec 32)) SeekEntryResult!8676)

(assert (=> b!809583 (= lt!362829 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809584 () Bool)

(declare-fun res!553316 () Bool)

(assert (=> b!809584 (=> (not res!553316) (not e!448117))))

(declare-datatypes ((List!15048 0))(
  ( (Nil!15045) (Cons!15044 (h!16173 (_ BitVec 64)) (t!21363 List!15048)) )
))
(declare-fun arrayNoDuplicates!0 (array!44022 (_ BitVec 32) List!15048) Bool)

(assert (=> b!809584 (= res!553316 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15045))))

(declare-fun b!809585 () Bool)

(declare-fun res!553317 () Bool)

(assert (=> b!809585 (=> (not res!553317) (not e!448117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44022 (_ BitVec 32)) Bool)

(assert (=> b!809585 (= res!553317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809586 () Bool)

(declare-fun e!448113 () Bool)

(assert (=> b!809586 (= e!448113 e!448115)))

(declare-fun res!553315 () Bool)

(assert (=> b!809586 (=> (not res!553315) (not e!448115))))

(declare-fun lt!362831 () SeekEntryResult!8676)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362830 () SeekEntryResult!8676)

(assert (=> b!809586 (= res!553315 (and (= lt!362831 lt!362830) (= lt!362830 (Found!8676 j!153)) (not (= (select (arr!21085 a!3170) index!1236) (select (arr!21085 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44022 (_ BitVec 32)) SeekEntryResult!8676)

(assert (=> b!809586 (= lt!362830 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809586 (= lt!362831 (seekEntryOrOpen!0 (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809587 () Bool)

(assert (=> b!809587 (= e!448117 e!448113)))

(declare-fun res!553311 () Bool)

(assert (=> b!809587 (=> (not res!553311) (not e!448113))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362828 () SeekEntryResult!8676)

(declare-fun lt!362827 () (_ BitVec 64))

(declare-fun lt!362826 () array!44022)

(assert (=> b!809587 (= res!553311 (= lt!362828 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362827 lt!362826 mask!3266)))))

(assert (=> b!809587 (= lt!362828 (seekEntryOrOpen!0 lt!362827 lt!362826 mask!3266))))

(assert (=> b!809587 (= lt!362827 (select (store (arr!21085 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809587 (= lt!362826 (array!44023 (store (arr!21085 a!3170) i!1163 k0!2044) (size!21506 a!3170)))))

(declare-fun res!553310 () Bool)

(assert (=> start!69424 (=> (not res!553310) (not e!448118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69424 (= res!553310 (validMask!0 mask!3266))))

(assert (=> start!69424 e!448118))

(assert (=> start!69424 true))

(declare-fun array_inv!16881 (array!44022) Bool)

(assert (=> start!69424 (array_inv!16881 a!3170)))

(declare-fun b!809588 () Bool)

(declare-fun res!553319 () Bool)

(assert (=> b!809588 (=> (not res!553319) (not e!448118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809588 (= res!553319 (validKeyInArray!0 (select (arr!21085 a!3170) j!153)))))

(declare-fun b!809589 () Bool)

(declare-fun res!553318 () Bool)

(assert (=> b!809589 (=> (not res!553318) (not e!448117))))

(assert (=> b!809589 (= res!553318 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21506 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21085 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21506 a!3170)) (= (select (arr!21085 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809590 () Bool)

(assert (=> b!809590 (= e!448114 (not (= lt!362828 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362825 vacantAfter!23 lt!362827 lt!362826 mask!3266))))))

(declare-fun b!809591 () Bool)

(declare-fun res!553309 () Bool)

(assert (=> b!809591 (=> (not res!553309) (not e!448118))))

(assert (=> b!809591 (= res!553309 (and (= (size!21506 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21506 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21506 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809592 () Bool)

(declare-fun res!553314 () Bool)

(assert (=> b!809592 (=> (not res!553314) (not e!448118))))

(assert (=> b!809592 (= res!553314 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69424 res!553310) b!809591))

(assert (= (and b!809591 res!553309) b!809588))

(assert (= (and b!809588 res!553319) b!809592))

(assert (= (and b!809592 res!553314) b!809582))

(assert (= (and b!809582 res!553308) b!809583))

(assert (= (and b!809583 res!553313) b!809585))

(assert (= (and b!809585 res!553317) b!809584))

(assert (= (and b!809584 res!553316) b!809589))

(assert (= (and b!809589 res!553318) b!809587))

(assert (= (and b!809587 res!553311) b!809586))

(assert (= (and b!809586 res!553315) b!809581))

(assert (= (and b!809581 res!553312) b!809590))

(declare-fun m!751791 () Bool)

(assert (=> b!809583 m!751791))

(declare-fun m!751793 () Bool)

(assert (=> b!809585 m!751793))

(declare-fun m!751795 () Bool)

(assert (=> b!809581 m!751795))

(declare-fun m!751797 () Bool)

(assert (=> b!809586 m!751797))

(declare-fun m!751799 () Bool)

(assert (=> b!809586 m!751799))

(assert (=> b!809586 m!751799))

(declare-fun m!751801 () Bool)

(assert (=> b!809586 m!751801))

(assert (=> b!809586 m!751799))

(declare-fun m!751803 () Bool)

(assert (=> b!809586 m!751803))

(declare-fun m!751805 () Bool)

(assert (=> b!809582 m!751805))

(declare-fun m!751807 () Bool)

(assert (=> b!809592 m!751807))

(declare-fun m!751809 () Bool)

(assert (=> b!809589 m!751809))

(declare-fun m!751811 () Bool)

(assert (=> b!809589 m!751811))

(assert (=> b!809588 m!751799))

(assert (=> b!809588 m!751799))

(declare-fun m!751813 () Bool)

(assert (=> b!809588 m!751813))

(declare-fun m!751815 () Bool)

(assert (=> start!69424 m!751815))

(declare-fun m!751817 () Bool)

(assert (=> start!69424 m!751817))

(declare-fun m!751819 () Bool)

(assert (=> b!809587 m!751819))

(declare-fun m!751821 () Bool)

(assert (=> b!809587 m!751821))

(declare-fun m!751823 () Bool)

(assert (=> b!809587 m!751823))

(declare-fun m!751825 () Bool)

(assert (=> b!809587 m!751825))

(declare-fun m!751827 () Bool)

(assert (=> b!809584 m!751827))

(declare-fun m!751829 () Bool)

(assert (=> b!809590 m!751829))

(check-sat (not b!809585) (not start!69424) (not b!809584) (not b!809587) (not b!809590) (not b!809581) (not b!809583) (not b!809592) (not b!809588) (not b!809586) (not b!809582))
(check-sat)
(get-model)

(declare-fun d!103913 () Bool)

(declare-fun res!553362 () Bool)

(declare-fun e!448148 () Bool)

(assert (=> d!103913 (=> res!553362 e!448148)))

(assert (=> d!103913 (= res!553362 (bvsge #b00000000000000000000000000000000 (size!21506 a!3170)))))

(assert (=> d!103913 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15045) e!448148)))

(declare-fun b!809639 () Bool)

(declare-fun e!448147 () Bool)

(assert (=> b!809639 (= e!448148 e!448147)))

(declare-fun res!553364 () Bool)

(assert (=> b!809639 (=> (not res!553364) (not e!448147))))

(declare-fun e!448146 () Bool)

(assert (=> b!809639 (= res!553364 (not e!448146))))

(declare-fun res!553363 () Bool)

(assert (=> b!809639 (=> (not res!553363) (not e!448146))))

(assert (=> b!809639 (= res!553363 (validKeyInArray!0 (select (arr!21085 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809640 () Bool)

(declare-fun e!448145 () Bool)

(assert (=> b!809640 (= e!448147 e!448145)))

(declare-fun c!88549 () Bool)

(assert (=> b!809640 (= c!88549 (validKeyInArray!0 (select (arr!21085 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809641 () Bool)

(declare-fun call!35421 () Bool)

(assert (=> b!809641 (= e!448145 call!35421)))

(declare-fun b!809642 () Bool)

(declare-fun contains!4131 (List!15048 (_ BitVec 64)) Bool)

(assert (=> b!809642 (= e!448146 (contains!4131 Nil!15045 (select (arr!21085 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35418 () Bool)

(assert (=> bm!35418 (= call!35421 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88549 (Cons!15044 (select (arr!21085 a!3170) #b00000000000000000000000000000000) Nil!15045) Nil!15045)))))

(declare-fun b!809643 () Bool)

(assert (=> b!809643 (= e!448145 call!35421)))

(assert (= (and d!103913 (not res!553362)) b!809639))

(assert (= (and b!809639 res!553363) b!809642))

(assert (= (and b!809639 res!553364) b!809640))

(assert (= (and b!809640 c!88549) b!809643))

(assert (= (and b!809640 (not c!88549)) b!809641))

(assert (= (or b!809643 b!809641) bm!35418))

(declare-fun m!751871 () Bool)

(assert (=> b!809639 m!751871))

(assert (=> b!809639 m!751871))

(declare-fun m!751873 () Bool)

(assert (=> b!809639 m!751873))

(assert (=> b!809640 m!751871))

(assert (=> b!809640 m!751871))

(assert (=> b!809640 m!751873))

(assert (=> b!809642 m!751871))

(assert (=> b!809642 m!751871))

(declare-fun m!751875 () Bool)

(assert (=> b!809642 m!751875))

(assert (=> bm!35418 m!751871))

(declare-fun m!751877 () Bool)

(assert (=> bm!35418 m!751877))

(assert (=> b!809584 d!103913))

(declare-fun d!103915 () Bool)

(declare-fun res!553370 () Bool)

(declare-fun e!448157 () Bool)

(assert (=> d!103915 (=> res!553370 e!448157)))

(assert (=> d!103915 (= res!553370 (bvsge #b00000000000000000000000000000000 (size!21506 a!3170)))))

(assert (=> d!103915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448157)))

(declare-fun b!809652 () Bool)

(declare-fun e!448155 () Bool)

(declare-fun call!35424 () Bool)

(assert (=> b!809652 (= e!448155 call!35424)))

(declare-fun b!809653 () Bool)

(declare-fun e!448156 () Bool)

(assert (=> b!809653 (= e!448157 e!448156)))

(declare-fun c!88552 () Bool)

(assert (=> b!809653 (= c!88552 (validKeyInArray!0 (select (arr!21085 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809654 () Bool)

(assert (=> b!809654 (= e!448156 call!35424)))

(declare-fun bm!35421 () Bool)

(assert (=> bm!35421 (= call!35424 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!809655 () Bool)

(assert (=> b!809655 (= e!448156 e!448155)))

(declare-fun lt!362859 () (_ BitVec 64))

(assert (=> b!809655 (= lt!362859 (select (arr!21085 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27624 0))(
  ( (Unit!27625) )
))
(declare-fun lt!362860 () Unit!27624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44022 (_ BitVec 64) (_ BitVec 32)) Unit!27624)

(assert (=> b!809655 (= lt!362860 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362859 #b00000000000000000000000000000000))))

(assert (=> b!809655 (arrayContainsKey!0 a!3170 lt!362859 #b00000000000000000000000000000000)))

(declare-fun lt!362861 () Unit!27624)

(assert (=> b!809655 (= lt!362861 lt!362860)))

(declare-fun res!553369 () Bool)

(assert (=> b!809655 (= res!553369 (= (seekEntryOrOpen!0 (select (arr!21085 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8676 #b00000000000000000000000000000000)))))

(assert (=> b!809655 (=> (not res!553369) (not e!448155))))

(assert (= (and d!103915 (not res!553370)) b!809653))

(assert (= (and b!809653 c!88552) b!809655))

(assert (= (and b!809653 (not c!88552)) b!809654))

(assert (= (and b!809655 res!553369) b!809652))

(assert (= (or b!809652 b!809654) bm!35421))

(assert (=> b!809653 m!751871))

(assert (=> b!809653 m!751871))

(assert (=> b!809653 m!751873))

(declare-fun m!751879 () Bool)

(assert (=> bm!35421 m!751879))

(assert (=> b!809655 m!751871))

(declare-fun m!751881 () Bool)

(assert (=> b!809655 m!751881))

(declare-fun m!751883 () Bool)

(assert (=> b!809655 m!751883))

(assert (=> b!809655 m!751871))

(declare-fun m!751885 () Bool)

(assert (=> b!809655 m!751885))

(assert (=> b!809585 d!103915))

(declare-fun b!809670 () Bool)

(declare-fun e!448168 () SeekEntryResult!8676)

(assert (=> b!809670 (= e!448168 (MissingVacant!8676 vacantAfter!23))))

(declare-fun b!809672 () Bool)

(declare-fun e!448166 () SeekEntryResult!8676)

(declare-fun e!448167 () SeekEntryResult!8676)

(assert (=> b!809672 (= e!448166 e!448167)))

(declare-fun c!88560 () Bool)

(declare-fun lt!362866 () (_ BitVec 64))

(assert (=> b!809672 (= c!88560 (= lt!362866 lt!362827))))

(declare-fun b!809673 () Bool)

(assert (=> b!809673 (= e!448166 Undefined!8676)))

(declare-fun d!103917 () Bool)

(declare-fun lt!362867 () SeekEntryResult!8676)

(get-info :version)

(assert (=> d!103917 (and (or ((_ is Undefined!8676) lt!362867) (not ((_ is Found!8676) lt!362867)) (and (bvsge (index!37073 lt!362867) #b00000000000000000000000000000000) (bvslt (index!37073 lt!362867) (size!21506 lt!362826)))) (or ((_ is Undefined!8676) lt!362867) ((_ is Found!8676) lt!362867) (not ((_ is MissingVacant!8676) lt!362867)) (not (= (index!37075 lt!362867) vacantAfter!23)) (and (bvsge (index!37075 lt!362867) #b00000000000000000000000000000000) (bvslt (index!37075 lt!362867) (size!21506 lt!362826)))) (or ((_ is Undefined!8676) lt!362867) (ite ((_ is Found!8676) lt!362867) (= (select (arr!21085 lt!362826) (index!37073 lt!362867)) lt!362827) (and ((_ is MissingVacant!8676) lt!362867) (= (index!37075 lt!362867) vacantAfter!23) (= (select (arr!21085 lt!362826) (index!37075 lt!362867)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103917 (= lt!362867 e!448166)))

(declare-fun c!88559 () Bool)

(assert (=> d!103917 (= c!88559 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!103917 (= lt!362866 (select (arr!21085 lt!362826) lt!362825))))

(assert (=> d!103917 (validMask!0 mask!3266)))

(assert (=> d!103917 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362825 vacantAfter!23 lt!362827 lt!362826 mask!3266) lt!362867)))

(declare-fun b!809671 () Bool)

(assert (=> b!809671 (= e!448168 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362825 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!362827 lt!362826 mask!3266))))

(declare-fun b!809674 () Bool)

(assert (=> b!809674 (= e!448167 (Found!8676 lt!362825))))

(declare-fun b!809675 () Bool)

(declare-fun c!88561 () Bool)

(assert (=> b!809675 (= c!88561 (= lt!362866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809675 (= e!448167 e!448168)))

(assert (= (and d!103917 c!88559) b!809673))

(assert (= (and d!103917 (not c!88559)) b!809672))

(assert (= (and b!809672 c!88560) b!809674))

(assert (= (and b!809672 (not c!88560)) b!809675))

(assert (= (and b!809675 c!88561) b!809670))

(assert (= (and b!809675 (not c!88561)) b!809671))

(declare-fun m!751887 () Bool)

(assert (=> d!103917 m!751887))

(declare-fun m!751889 () Bool)

(assert (=> d!103917 m!751889))

(declare-fun m!751891 () Bool)

(assert (=> d!103917 m!751891))

(assert (=> d!103917 m!751815))

(declare-fun m!751893 () Bool)

(assert (=> b!809671 m!751893))

(assert (=> b!809671 m!751893))

(declare-fun m!751895 () Bool)

(assert (=> b!809671 m!751895))

(assert (=> b!809590 d!103917))

(declare-fun d!103921 () Bool)

(declare-fun lt!362870 () (_ BitVec 32))

(assert (=> d!103921 (and (bvsge lt!362870 #b00000000000000000000000000000000) (bvslt lt!362870 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103921 (= lt!362870 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103921 (validMask!0 mask!3266)))

(assert (=> d!103921 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362870)))

(declare-fun bs!22423 () Bool)

(assert (= bs!22423 d!103921))

(declare-fun m!751901 () Bool)

(assert (=> bs!22423 m!751901))

(assert (=> bs!22423 m!751815))

(assert (=> b!809581 d!103921))

(declare-fun b!809680 () Bool)

(declare-fun e!448175 () SeekEntryResult!8676)

(assert (=> b!809680 (= e!448175 (MissingVacant!8676 vacantBefore!23))))

(declare-fun b!809682 () Bool)

(declare-fun e!448173 () SeekEntryResult!8676)

(declare-fun e!448174 () SeekEntryResult!8676)

(assert (=> b!809682 (= e!448173 e!448174)))

(declare-fun c!88563 () Bool)

(declare-fun lt!362871 () (_ BitVec 64))

(assert (=> b!809682 (= c!88563 (= lt!362871 (select (arr!21085 a!3170) j!153)))))

(declare-fun b!809683 () Bool)

(assert (=> b!809683 (= e!448173 Undefined!8676)))

(declare-fun lt!362872 () SeekEntryResult!8676)

(declare-fun d!103927 () Bool)

(assert (=> d!103927 (and (or ((_ is Undefined!8676) lt!362872) (not ((_ is Found!8676) lt!362872)) (and (bvsge (index!37073 lt!362872) #b00000000000000000000000000000000) (bvslt (index!37073 lt!362872) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362872) ((_ is Found!8676) lt!362872) (not ((_ is MissingVacant!8676) lt!362872)) (not (= (index!37075 lt!362872) vacantBefore!23)) (and (bvsge (index!37075 lt!362872) #b00000000000000000000000000000000) (bvslt (index!37075 lt!362872) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362872) (ite ((_ is Found!8676) lt!362872) (= (select (arr!21085 a!3170) (index!37073 lt!362872)) (select (arr!21085 a!3170) j!153)) (and ((_ is MissingVacant!8676) lt!362872) (= (index!37075 lt!362872) vacantBefore!23) (= (select (arr!21085 a!3170) (index!37075 lt!362872)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103927 (= lt!362872 e!448173)))

(declare-fun c!88562 () Bool)

(assert (=> d!103927 (= c!88562 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103927 (= lt!362871 (select (arr!21085 a!3170) index!1236))))

(assert (=> d!103927 (validMask!0 mask!3266)))

(assert (=> d!103927 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21085 a!3170) j!153) a!3170 mask!3266) lt!362872)))

(declare-fun b!809681 () Bool)

(assert (=> b!809681 (= e!448175 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809684 () Bool)

(assert (=> b!809684 (= e!448174 (Found!8676 index!1236))))

(declare-fun b!809685 () Bool)

(declare-fun c!88564 () Bool)

(assert (=> b!809685 (= c!88564 (= lt!362871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809685 (= e!448174 e!448175)))

(assert (= (and d!103927 c!88562) b!809683))

(assert (= (and d!103927 (not c!88562)) b!809682))

(assert (= (and b!809682 c!88563) b!809684))

(assert (= (and b!809682 (not c!88563)) b!809685))

(assert (= (and b!809685 c!88564) b!809680))

(assert (= (and b!809685 (not c!88564)) b!809681))

(declare-fun m!751903 () Bool)

(assert (=> d!103927 m!751903))

(declare-fun m!751905 () Bool)

(assert (=> d!103927 m!751905))

(assert (=> d!103927 m!751797))

(assert (=> d!103927 m!751815))

(assert (=> b!809681 m!751795))

(assert (=> b!809681 m!751795))

(assert (=> b!809681 m!751799))

(declare-fun m!751907 () Bool)

(assert (=> b!809681 m!751907))

(assert (=> b!809586 d!103927))

(declare-fun b!809728 () Bool)

(declare-fun e!448201 () SeekEntryResult!8676)

(declare-fun lt!362894 () SeekEntryResult!8676)

(assert (=> b!809728 (= e!448201 (Found!8676 (index!37074 lt!362894)))))

(declare-fun e!448200 () SeekEntryResult!8676)

(declare-fun b!809730 () Bool)

(assert (=> b!809730 (= e!448200 (seekKeyOrZeroReturnVacant!0 (x!67876 lt!362894) (index!37074 lt!362894) (index!37074 lt!362894) (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809731 () Bool)

(declare-fun c!88585 () Bool)

(declare-fun lt!362896 () (_ BitVec 64))

(assert (=> b!809731 (= c!88585 (= lt!362896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809731 (= e!448201 e!448200)))

(declare-fun d!103929 () Bool)

(declare-fun lt!362895 () SeekEntryResult!8676)

(assert (=> d!103929 (and (or ((_ is Undefined!8676) lt!362895) (not ((_ is Found!8676) lt!362895)) (and (bvsge (index!37073 lt!362895) #b00000000000000000000000000000000) (bvslt (index!37073 lt!362895) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362895) ((_ is Found!8676) lt!362895) (not ((_ is MissingZero!8676) lt!362895)) (and (bvsge (index!37072 lt!362895) #b00000000000000000000000000000000) (bvslt (index!37072 lt!362895) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362895) ((_ is Found!8676) lt!362895) ((_ is MissingZero!8676) lt!362895) (not ((_ is MissingVacant!8676) lt!362895)) (and (bvsge (index!37075 lt!362895) #b00000000000000000000000000000000) (bvslt (index!37075 lt!362895) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362895) (ite ((_ is Found!8676) lt!362895) (= (select (arr!21085 a!3170) (index!37073 lt!362895)) (select (arr!21085 a!3170) j!153)) (ite ((_ is MissingZero!8676) lt!362895) (= (select (arr!21085 a!3170) (index!37072 lt!362895)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8676) lt!362895) (= (select (arr!21085 a!3170) (index!37075 lt!362895)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448202 () SeekEntryResult!8676)

(assert (=> d!103929 (= lt!362895 e!448202)))

(declare-fun c!88584 () Bool)

(assert (=> d!103929 (= c!88584 (and ((_ is Intermediate!8676) lt!362894) (undefined!9488 lt!362894)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44022 (_ BitVec 32)) SeekEntryResult!8676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103929 (= lt!362894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21085 a!3170) j!153) mask!3266) (select (arr!21085 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103929 (validMask!0 mask!3266)))

(assert (=> d!103929 (= (seekEntryOrOpen!0 (select (arr!21085 a!3170) j!153) a!3170 mask!3266) lt!362895)))

(declare-fun b!809729 () Bool)

(assert (=> b!809729 (= e!448200 (MissingZero!8676 (index!37074 lt!362894)))))

(declare-fun b!809732 () Bool)

(assert (=> b!809732 (= e!448202 e!448201)))

(assert (=> b!809732 (= lt!362896 (select (arr!21085 a!3170) (index!37074 lt!362894)))))

(declare-fun c!88583 () Bool)

(assert (=> b!809732 (= c!88583 (= lt!362896 (select (arr!21085 a!3170) j!153)))))

(declare-fun b!809733 () Bool)

(assert (=> b!809733 (= e!448202 Undefined!8676)))

(assert (= (and d!103929 c!88584) b!809733))

(assert (= (and d!103929 (not c!88584)) b!809732))

(assert (= (and b!809732 c!88583) b!809728))

(assert (= (and b!809732 (not c!88583)) b!809731))

(assert (= (and b!809731 c!88585) b!809729))

(assert (= (and b!809731 (not c!88585)) b!809730))

(assert (=> b!809730 m!751799))

(declare-fun m!751929 () Bool)

(assert (=> b!809730 m!751929))

(declare-fun m!751931 () Bool)

(assert (=> d!103929 m!751931))

(declare-fun m!751933 () Bool)

(assert (=> d!103929 m!751933))

(declare-fun m!751935 () Bool)

(assert (=> d!103929 m!751935))

(assert (=> d!103929 m!751799))

(declare-fun m!751937 () Bool)

(assert (=> d!103929 m!751937))

(assert (=> d!103929 m!751799))

(assert (=> d!103929 m!751935))

(assert (=> d!103929 m!751815))

(declare-fun m!751939 () Bool)

(assert (=> d!103929 m!751939))

(declare-fun m!751941 () Bool)

(assert (=> b!809732 m!751941))

(assert (=> b!809586 d!103929))

(declare-fun b!809734 () Bool)

(declare-fun e!448207 () SeekEntryResult!8676)

(assert (=> b!809734 (= e!448207 (MissingVacant!8676 vacantAfter!23))))

(declare-fun b!809736 () Bool)

(declare-fun e!448205 () SeekEntryResult!8676)

(declare-fun e!448206 () SeekEntryResult!8676)

(assert (=> b!809736 (= e!448205 e!448206)))

(declare-fun c!88587 () Bool)

(declare-fun lt!362897 () (_ BitVec 64))

(assert (=> b!809736 (= c!88587 (= lt!362897 lt!362827))))

(declare-fun b!809739 () Bool)

(assert (=> b!809739 (= e!448205 Undefined!8676)))

(declare-fun lt!362898 () SeekEntryResult!8676)

(declare-fun d!103939 () Bool)

(assert (=> d!103939 (and (or ((_ is Undefined!8676) lt!362898) (not ((_ is Found!8676) lt!362898)) (and (bvsge (index!37073 lt!362898) #b00000000000000000000000000000000) (bvslt (index!37073 lt!362898) (size!21506 lt!362826)))) (or ((_ is Undefined!8676) lt!362898) ((_ is Found!8676) lt!362898) (not ((_ is MissingVacant!8676) lt!362898)) (not (= (index!37075 lt!362898) vacantAfter!23)) (and (bvsge (index!37075 lt!362898) #b00000000000000000000000000000000) (bvslt (index!37075 lt!362898) (size!21506 lt!362826)))) (or ((_ is Undefined!8676) lt!362898) (ite ((_ is Found!8676) lt!362898) (= (select (arr!21085 lt!362826) (index!37073 lt!362898)) lt!362827) (and ((_ is MissingVacant!8676) lt!362898) (= (index!37075 lt!362898) vacantAfter!23) (= (select (arr!21085 lt!362826) (index!37075 lt!362898)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103939 (= lt!362898 e!448205)))

(declare-fun c!88586 () Bool)

(assert (=> d!103939 (= c!88586 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103939 (= lt!362897 (select (arr!21085 lt!362826) index!1236))))

(assert (=> d!103939 (validMask!0 mask!3266)))

(assert (=> d!103939 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362827 lt!362826 mask!3266) lt!362898)))

(declare-fun b!809735 () Bool)

(assert (=> b!809735 (= e!448207 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362827 lt!362826 mask!3266))))

(declare-fun b!809740 () Bool)

(assert (=> b!809740 (= e!448206 (Found!8676 index!1236))))

(declare-fun b!809741 () Bool)

(declare-fun c!88588 () Bool)

(assert (=> b!809741 (= c!88588 (= lt!362897 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809741 (= e!448206 e!448207)))

(assert (= (and d!103939 c!88586) b!809739))

(assert (= (and d!103939 (not c!88586)) b!809736))

(assert (= (and b!809736 c!88587) b!809740))

(assert (= (and b!809736 (not c!88587)) b!809741))

(assert (= (and b!809741 c!88588) b!809734))

(assert (= (and b!809741 (not c!88588)) b!809735))

(declare-fun m!751943 () Bool)

(assert (=> d!103939 m!751943))

(declare-fun m!751945 () Bool)

(assert (=> d!103939 m!751945))

(declare-fun m!751947 () Bool)

(assert (=> d!103939 m!751947))

(assert (=> d!103939 m!751815))

(assert (=> b!809735 m!751795))

(assert (=> b!809735 m!751795))

(declare-fun m!751949 () Bool)

(assert (=> b!809735 m!751949))

(assert (=> b!809587 d!103939))

(declare-fun b!809744 () Bool)

(declare-fun e!448211 () SeekEntryResult!8676)

(declare-fun lt!362899 () SeekEntryResult!8676)

(assert (=> b!809744 (= e!448211 (Found!8676 (index!37074 lt!362899)))))

(declare-fun b!809746 () Bool)

(declare-fun e!448210 () SeekEntryResult!8676)

(assert (=> b!809746 (= e!448210 (seekKeyOrZeroReturnVacant!0 (x!67876 lt!362899) (index!37074 lt!362899) (index!37074 lt!362899) lt!362827 lt!362826 mask!3266))))

(declare-fun b!809747 () Bool)

(declare-fun c!88591 () Bool)

(declare-fun lt!362901 () (_ BitVec 64))

(assert (=> b!809747 (= c!88591 (= lt!362901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809747 (= e!448211 e!448210)))

(declare-fun d!103941 () Bool)

(declare-fun lt!362900 () SeekEntryResult!8676)

(assert (=> d!103941 (and (or ((_ is Undefined!8676) lt!362900) (not ((_ is Found!8676) lt!362900)) (and (bvsge (index!37073 lt!362900) #b00000000000000000000000000000000) (bvslt (index!37073 lt!362900) (size!21506 lt!362826)))) (or ((_ is Undefined!8676) lt!362900) ((_ is Found!8676) lt!362900) (not ((_ is MissingZero!8676) lt!362900)) (and (bvsge (index!37072 lt!362900) #b00000000000000000000000000000000) (bvslt (index!37072 lt!362900) (size!21506 lt!362826)))) (or ((_ is Undefined!8676) lt!362900) ((_ is Found!8676) lt!362900) ((_ is MissingZero!8676) lt!362900) (not ((_ is MissingVacant!8676) lt!362900)) (and (bvsge (index!37075 lt!362900) #b00000000000000000000000000000000) (bvslt (index!37075 lt!362900) (size!21506 lt!362826)))) (or ((_ is Undefined!8676) lt!362900) (ite ((_ is Found!8676) lt!362900) (= (select (arr!21085 lt!362826) (index!37073 lt!362900)) lt!362827) (ite ((_ is MissingZero!8676) lt!362900) (= (select (arr!21085 lt!362826) (index!37072 lt!362900)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8676) lt!362900) (= (select (arr!21085 lt!362826) (index!37075 lt!362900)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448212 () SeekEntryResult!8676)

(assert (=> d!103941 (= lt!362900 e!448212)))

(declare-fun c!88590 () Bool)

(assert (=> d!103941 (= c!88590 (and ((_ is Intermediate!8676) lt!362899) (undefined!9488 lt!362899)))))

(assert (=> d!103941 (= lt!362899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362827 mask!3266) lt!362827 lt!362826 mask!3266))))

(assert (=> d!103941 (validMask!0 mask!3266)))

(assert (=> d!103941 (= (seekEntryOrOpen!0 lt!362827 lt!362826 mask!3266) lt!362900)))

(declare-fun b!809745 () Bool)

(assert (=> b!809745 (= e!448210 (MissingZero!8676 (index!37074 lt!362899)))))

(declare-fun b!809748 () Bool)

(assert (=> b!809748 (= e!448212 e!448211)))

(assert (=> b!809748 (= lt!362901 (select (arr!21085 lt!362826) (index!37074 lt!362899)))))

(declare-fun c!88589 () Bool)

(assert (=> b!809748 (= c!88589 (= lt!362901 lt!362827))))

(declare-fun b!809749 () Bool)

(assert (=> b!809749 (= e!448212 Undefined!8676)))

(assert (= (and d!103941 c!88590) b!809749))

(assert (= (and d!103941 (not c!88590)) b!809748))

(assert (= (and b!809748 c!88589) b!809744))

(assert (= (and b!809748 (not c!88589)) b!809747))

(assert (= (and b!809747 c!88591) b!809745))

(assert (= (and b!809747 (not c!88591)) b!809746))

(declare-fun m!751951 () Bool)

(assert (=> b!809746 m!751951))

(declare-fun m!751953 () Bool)

(assert (=> d!103941 m!751953))

(declare-fun m!751955 () Bool)

(assert (=> d!103941 m!751955))

(declare-fun m!751957 () Bool)

(assert (=> d!103941 m!751957))

(declare-fun m!751959 () Bool)

(assert (=> d!103941 m!751959))

(assert (=> d!103941 m!751957))

(assert (=> d!103941 m!751815))

(declare-fun m!751961 () Bool)

(assert (=> d!103941 m!751961))

(declare-fun m!751965 () Bool)

(assert (=> b!809748 m!751965))

(assert (=> b!809587 d!103941))

(declare-fun d!103943 () Bool)

(assert (=> d!103943 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809592 d!103943))

(declare-fun d!103947 () Bool)

(assert (=> d!103947 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69424 d!103947))

(declare-fun d!103949 () Bool)

(assert (=> d!103949 (= (array_inv!16881 a!3170) (bvsge (size!21506 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69424 d!103949))

(declare-fun d!103951 () Bool)

(declare-fun res!553393 () Bool)

(declare-fun e!448228 () Bool)

(assert (=> d!103951 (=> res!553393 e!448228)))

(assert (=> d!103951 (= res!553393 (= (select (arr!21085 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103951 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448228)))

(declare-fun b!809774 () Bool)

(declare-fun e!448229 () Bool)

(assert (=> b!809774 (= e!448228 e!448229)))

(declare-fun res!553394 () Bool)

(assert (=> b!809774 (=> (not res!553394) (not e!448229))))

(assert (=> b!809774 (= res!553394 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21506 a!3170)))))

(declare-fun b!809775 () Bool)

(assert (=> b!809775 (= e!448229 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103951 (not res!553393)) b!809774))

(assert (= (and b!809774 res!553394) b!809775))

(assert (=> d!103951 m!751871))

(declare-fun m!751981 () Bool)

(assert (=> b!809775 m!751981))

(assert (=> b!809582 d!103951))

(declare-fun b!809778 () Bool)

(declare-fun e!448231 () SeekEntryResult!8676)

(declare-fun lt!362915 () SeekEntryResult!8676)

(assert (=> b!809778 (= e!448231 (Found!8676 (index!37074 lt!362915)))))

(declare-fun e!448230 () SeekEntryResult!8676)

(declare-fun b!809780 () Bool)

(assert (=> b!809780 (= e!448230 (seekKeyOrZeroReturnVacant!0 (x!67876 lt!362915) (index!37074 lt!362915) (index!37074 lt!362915) k0!2044 a!3170 mask!3266))))

(declare-fun b!809781 () Bool)

(declare-fun c!88603 () Bool)

(declare-fun lt!362917 () (_ BitVec 64))

(assert (=> b!809781 (= c!88603 (= lt!362917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!809781 (= e!448231 e!448230)))

(declare-fun d!103955 () Bool)

(declare-fun lt!362916 () SeekEntryResult!8676)

(assert (=> d!103955 (and (or ((_ is Undefined!8676) lt!362916) (not ((_ is Found!8676) lt!362916)) (and (bvsge (index!37073 lt!362916) #b00000000000000000000000000000000) (bvslt (index!37073 lt!362916) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362916) ((_ is Found!8676) lt!362916) (not ((_ is MissingZero!8676) lt!362916)) (and (bvsge (index!37072 lt!362916) #b00000000000000000000000000000000) (bvslt (index!37072 lt!362916) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362916) ((_ is Found!8676) lt!362916) ((_ is MissingZero!8676) lt!362916) (not ((_ is MissingVacant!8676) lt!362916)) (and (bvsge (index!37075 lt!362916) #b00000000000000000000000000000000) (bvslt (index!37075 lt!362916) (size!21506 a!3170)))) (or ((_ is Undefined!8676) lt!362916) (ite ((_ is Found!8676) lt!362916) (= (select (arr!21085 a!3170) (index!37073 lt!362916)) k0!2044) (ite ((_ is MissingZero!8676) lt!362916) (= (select (arr!21085 a!3170) (index!37072 lt!362916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8676) lt!362916) (= (select (arr!21085 a!3170) (index!37075 lt!362916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448232 () SeekEntryResult!8676)

(assert (=> d!103955 (= lt!362916 e!448232)))

(declare-fun c!88602 () Bool)

(assert (=> d!103955 (= c!88602 (and ((_ is Intermediate!8676) lt!362915) (undefined!9488 lt!362915)))))

(assert (=> d!103955 (= lt!362915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103955 (validMask!0 mask!3266)))

(assert (=> d!103955 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362916)))

(declare-fun b!809779 () Bool)

(assert (=> b!809779 (= e!448230 (MissingZero!8676 (index!37074 lt!362915)))))

(declare-fun b!809782 () Bool)

(assert (=> b!809782 (= e!448232 e!448231)))

(assert (=> b!809782 (= lt!362917 (select (arr!21085 a!3170) (index!37074 lt!362915)))))

(declare-fun c!88601 () Bool)

(assert (=> b!809782 (= c!88601 (= lt!362917 k0!2044))))

(declare-fun b!809783 () Bool)

(assert (=> b!809783 (= e!448232 Undefined!8676)))

(assert (= (and d!103955 c!88602) b!809783))

(assert (= (and d!103955 (not c!88602)) b!809782))

(assert (= (and b!809782 c!88601) b!809778))

(assert (= (and b!809782 (not c!88601)) b!809781))

(assert (= (and b!809781 c!88603) b!809779))

(assert (= (and b!809781 (not c!88603)) b!809780))

(declare-fun m!751983 () Bool)

(assert (=> b!809780 m!751983))

(declare-fun m!751985 () Bool)

(assert (=> d!103955 m!751985))

(declare-fun m!751987 () Bool)

(assert (=> d!103955 m!751987))

(declare-fun m!751989 () Bool)

(assert (=> d!103955 m!751989))

(declare-fun m!751991 () Bool)

(assert (=> d!103955 m!751991))

(assert (=> d!103955 m!751989))

(assert (=> d!103955 m!751815))

(declare-fun m!751993 () Bool)

(assert (=> d!103955 m!751993))

(declare-fun m!751995 () Bool)

(assert (=> b!809782 m!751995))

(assert (=> b!809583 d!103955))

(declare-fun d!103957 () Bool)

(assert (=> d!103957 (= (validKeyInArray!0 (select (arr!21085 a!3170) j!153)) (and (not (= (select (arr!21085 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21085 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809588 d!103957))

(check-sat (not b!809639) (not b!809642) (not d!103955) (not bm!35421) (not b!809671) (not b!809775) (not b!809655) (not b!809681) (not d!103921) (not bm!35418) (not d!103941) (not b!809746) (not d!103939) (not d!103927) (not b!809653) (not b!809780) (not d!103917) (not b!809640) (not b!809730) (not b!809735) (not d!103929))
(check-sat)
