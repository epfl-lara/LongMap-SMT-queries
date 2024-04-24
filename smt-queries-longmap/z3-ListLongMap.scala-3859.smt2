; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53088 () Bool)

(assert start!53088)

(declare-fun b!577684 () Bool)

(declare-fun res!365617 () Bool)

(declare-fun e!332272 () Bool)

(assert (=> b!577684 (=> (not res!365617) (not e!332272))))

(declare-datatypes ((array!36051 0))(
  ( (array!36052 (arr!17302 (Array (_ BitVec 32) (_ BitVec 64))) (size!17666 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36051)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577684 (= res!365617 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577685 () Bool)

(declare-fun res!365612 () Bool)

(declare-fun e!332273 () Bool)

(assert (=> b!577685 (=> (not res!365612) (not e!332273))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36051 (_ BitVec 32)) Bool)

(assert (=> b!577685 (= res!365612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577686 () Bool)

(declare-fun res!365615 () Bool)

(assert (=> b!577686 (=> (not res!365615) (not e!332272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577686 (= res!365615 (validKeyInArray!0 k0!1786))))

(declare-fun res!365613 () Bool)

(assert (=> start!53088 (=> (not res!365613) (not e!332272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53088 (= res!365613 (validMask!0 mask!3053))))

(assert (=> start!53088 e!332272))

(assert (=> start!53088 true))

(declare-fun array_inv!13161 (array!36051) Bool)

(assert (=> start!53088 (array_inv!13161 a!2986)))

(declare-fun b!577687 () Bool)

(assert (=> b!577687 (= e!332273 (and (bvsle #b00000000000000000000000000000000 (size!17666 a!2986)) (bvsge (size!17666 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577688 () Bool)

(declare-fun res!365611 () Bool)

(assert (=> b!577688 (=> (not res!365611) (not e!332272))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577688 (= res!365611 (and (= (size!17666 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17666 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17666 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577689 () Bool)

(declare-fun res!365614 () Bool)

(assert (=> b!577689 (=> (not res!365614) (not e!332272))))

(assert (=> b!577689 (= res!365614 (validKeyInArray!0 (select (arr!17302 a!2986) j!136)))))

(declare-fun b!577690 () Bool)

(assert (=> b!577690 (= e!332272 e!332273)))

(declare-fun res!365616 () Bool)

(assert (=> b!577690 (=> (not res!365616) (not e!332273))))

(declare-datatypes ((SeekEntryResult!5698 0))(
  ( (MissingZero!5698 (index!25019 (_ BitVec 32))) (Found!5698 (index!25020 (_ BitVec 32))) (Intermediate!5698 (undefined!6510 Bool) (index!25021 (_ BitVec 32)) (x!54082 (_ BitVec 32))) (Undefined!5698) (MissingVacant!5698 (index!25022 (_ BitVec 32))) )
))
(declare-fun lt!264082 () SeekEntryResult!5698)

(assert (=> b!577690 (= res!365616 (or (= lt!264082 (MissingZero!5698 i!1108)) (= lt!264082 (MissingVacant!5698 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36051 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!577690 (= lt!264082 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53088 res!365613) b!577688))

(assert (= (and b!577688 res!365611) b!577689))

(assert (= (and b!577689 res!365614) b!577686))

(assert (= (and b!577686 res!365615) b!577684))

(assert (= (and b!577684 res!365617) b!577690))

(assert (= (and b!577690 res!365616) b!577685))

(assert (= (and b!577685 res!365612) b!577687))

(declare-fun m!556697 () Bool)

(assert (=> b!577690 m!556697))

(declare-fun m!556699 () Bool)

(assert (=> b!577685 m!556699))

(declare-fun m!556701 () Bool)

(assert (=> b!577684 m!556701))

(declare-fun m!556703 () Bool)

(assert (=> start!53088 m!556703))

(declare-fun m!556705 () Bool)

(assert (=> start!53088 m!556705))

(declare-fun m!556707 () Bool)

(assert (=> b!577689 m!556707))

(assert (=> b!577689 m!556707))

(declare-fun m!556709 () Bool)

(assert (=> b!577689 m!556709))

(declare-fun m!556711 () Bool)

(assert (=> b!577686 m!556711))

(check-sat (not start!53088) (not b!577690) (not b!577684) (not b!577686) (not b!577685) (not b!577689))
(check-sat)
(get-model)

(declare-fun b!577741 () Bool)

(declare-fun e!332300 () Bool)

(declare-fun e!332299 () Bool)

(assert (=> b!577741 (= e!332300 e!332299)))

(declare-fun lt!264096 () (_ BitVec 64))

(assert (=> b!577741 (= lt!264096 (select (arr!17302 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18115 0))(
  ( (Unit!18116) )
))
(declare-fun lt!264097 () Unit!18115)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36051 (_ BitVec 64) (_ BitVec 32)) Unit!18115)

(assert (=> b!577741 (= lt!264097 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!264096 #b00000000000000000000000000000000))))

(assert (=> b!577741 (arrayContainsKey!0 a!2986 lt!264096 #b00000000000000000000000000000000)))

(declare-fun lt!264095 () Unit!18115)

(assert (=> b!577741 (= lt!264095 lt!264097)))

(declare-fun res!365665 () Bool)

(assert (=> b!577741 (= res!365665 (= (seekEntryOrOpen!0 (select (arr!17302 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5698 #b00000000000000000000000000000000)))))

(assert (=> b!577741 (=> (not res!365665) (not e!332299))))

(declare-fun b!577742 () Bool)

(declare-fun call!32757 () Bool)

(assert (=> b!577742 (= e!332299 call!32757)))

(declare-fun b!577743 () Bool)

(declare-fun e!332301 () Bool)

(assert (=> b!577743 (= e!332301 e!332300)))

(declare-fun c!66407 () Bool)

(assert (=> b!577743 (= c!66407 (validKeyInArray!0 (select (arr!17302 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32754 () Bool)

(assert (=> bm!32754 (= call!32757 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!577744 () Bool)

(assert (=> b!577744 (= e!332300 call!32757)))

(declare-fun d!85655 () Bool)

(declare-fun res!365664 () Bool)

(assert (=> d!85655 (=> res!365664 e!332301)))

(assert (=> d!85655 (= res!365664 (bvsge #b00000000000000000000000000000000 (size!17666 a!2986)))))

(assert (=> d!85655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332301)))

(assert (= (and d!85655 (not res!365664)) b!577743))

(assert (= (and b!577743 c!66407) b!577741))

(assert (= (and b!577743 (not c!66407)) b!577744))

(assert (= (and b!577741 res!365665) b!577742))

(assert (= (or b!577742 b!577744) bm!32754))

(declare-fun m!556745 () Bool)

(assert (=> b!577741 m!556745))

(declare-fun m!556747 () Bool)

(assert (=> b!577741 m!556747))

(declare-fun m!556749 () Bool)

(assert (=> b!577741 m!556749))

(assert (=> b!577741 m!556745))

(declare-fun m!556751 () Bool)

(assert (=> b!577741 m!556751))

(assert (=> b!577743 m!556745))

(assert (=> b!577743 m!556745))

(declare-fun m!556753 () Bool)

(assert (=> b!577743 m!556753))

(declare-fun m!556755 () Bool)

(assert (=> bm!32754 m!556755))

(assert (=> b!577685 d!85655))

(declare-fun b!577793 () Bool)

(declare-fun e!332331 () SeekEntryResult!5698)

(declare-fun e!332329 () SeekEntryResult!5698)

(assert (=> b!577793 (= e!332331 e!332329)))

(declare-fun lt!264121 () (_ BitVec 64))

(declare-fun lt!264119 () SeekEntryResult!5698)

(assert (=> b!577793 (= lt!264121 (select (arr!17302 a!2986) (index!25021 lt!264119)))))

(declare-fun c!66430 () Bool)

(assert (=> b!577793 (= c!66430 (= lt!264121 k0!1786))))

(declare-fun d!85659 () Bool)

(declare-fun lt!264120 () SeekEntryResult!5698)

(get-info :version)

(assert (=> d!85659 (and (or ((_ is Undefined!5698) lt!264120) (not ((_ is Found!5698) lt!264120)) (and (bvsge (index!25020 lt!264120) #b00000000000000000000000000000000) (bvslt (index!25020 lt!264120) (size!17666 a!2986)))) (or ((_ is Undefined!5698) lt!264120) ((_ is Found!5698) lt!264120) (not ((_ is MissingZero!5698) lt!264120)) (and (bvsge (index!25019 lt!264120) #b00000000000000000000000000000000) (bvslt (index!25019 lt!264120) (size!17666 a!2986)))) (or ((_ is Undefined!5698) lt!264120) ((_ is Found!5698) lt!264120) ((_ is MissingZero!5698) lt!264120) (not ((_ is MissingVacant!5698) lt!264120)) (and (bvsge (index!25022 lt!264120) #b00000000000000000000000000000000) (bvslt (index!25022 lt!264120) (size!17666 a!2986)))) (or ((_ is Undefined!5698) lt!264120) (ite ((_ is Found!5698) lt!264120) (= (select (arr!17302 a!2986) (index!25020 lt!264120)) k0!1786) (ite ((_ is MissingZero!5698) lt!264120) (= (select (arr!17302 a!2986) (index!25019 lt!264120)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5698) lt!264120) (= (select (arr!17302 a!2986) (index!25022 lt!264120)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85659 (= lt!264120 e!332331)))

(declare-fun c!66429 () Bool)

(assert (=> d!85659 (= c!66429 (and ((_ is Intermediate!5698) lt!264119) (undefined!6510 lt!264119)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36051 (_ BitVec 32)) SeekEntryResult!5698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85659 (= lt!264119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85659 (validMask!0 mask!3053)))

(assert (=> d!85659 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!264120)))

(declare-fun b!577794 () Bool)

(assert (=> b!577794 (= e!332331 Undefined!5698)))

(declare-fun b!577795 () Bool)

(declare-fun e!332330 () SeekEntryResult!5698)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36051 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!577795 (= e!332330 (seekKeyOrZeroReturnVacant!0 (x!54082 lt!264119) (index!25021 lt!264119) (index!25021 lt!264119) k0!1786 a!2986 mask!3053))))

(declare-fun b!577796 () Bool)

(assert (=> b!577796 (= e!332329 (Found!5698 (index!25021 lt!264119)))))

(declare-fun b!577797 () Bool)

(assert (=> b!577797 (= e!332330 (MissingZero!5698 (index!25021 lt!264119)))))

(declare-fun b!577798 () Bool)

(declare-fun c!66431 () Bool)

(assert (=> b!577798 (= c!66431 (= lt!264121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577798 (= e!332329 e!332330)))

(assert (= (and d!85659 c!66429) b!577794))

(assert (= (and d!85659 (not c!66429)) b!577793))

(assert (= (and b!577793 c!66430) b!577796))

(assert (= (and b!577793 (not c!66430)) b!577798))

(assert (= (and b!577798 c!66431) b!577797))

(assert (= (and b!577798 (not c!66431)) b!577795))

(declare-fun m!556775 () Bool)

(assert (=> b!577793 m!556775))

(assert (=> d!85659 m!556703))

(declare-fun m!556777 () Bool)

(assert (=> d!85659 m!556777))

(declare-fun m!556779 () Bool)

(assert (=> d!85659 m!556779))

(declare-fun m!556781 () Bool)

(assert (=> d!85659 m!556781))

(declare-fun m!556783 () Bool)

(assert (=> d!85659 m!556783))

(assert (=> d!85659 m!556777))

(declare-fun m!556785 () Bool)

(assert (=> d!85659 m!556785))

(declare-fun m!556787 () Bool)

(assert (=> b!577795 m!556787))

(assert (=> b!577690 d!85659))

(declare-fun d!85669 () Bool)

(assert (=> d!85669 (= (validKeyInArray!0 (select (arr!17302 a!2986) j!136)) (and (not (= (select (arr!17302 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17302 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577689 d!85669))

(declare-fun d!85673 () Bool)

(declare-fun res!365680 () Bool)

(declare-fun e!332345 () Bool)

(assert (=> d!85673 (=> res!365680 e!332345)))

(assert (=> d!85673 (= res!365680 (= (select (arr!17302 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85673 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!332345)))

(declare-fun b!577817 () Bool)

(declare-fun e!332346 () Bool)

(assert (=> b!577817 (= e!332345 e!332346)))

(declare-fun res!365681 () Bool)

(assert (=> b!577817 (=> (not res!365681) (not e!332346))))

(assert (=> b!577817 (= res!365681 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17666 a!2986)))))

(declare-fun b!577818 () Bool)

(assert (=> b!577818 (= e!332346 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85673 (not res!365680)) b!577817))

(assert (= (and b!577817 res!365681) b!577818))

(assert (=> d!85673 m!556745))

(declare-fun m!556803 () Bool)

(assert (=> b!577818 m!556803))

(assert (=> b!577684 d!85673))

(declare-fun d!85675 () Bool)

(assert (=> d!85675 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53088 d!85675))

(declare-fun d!85685 () Bool)

(assert (=> d!85685 (= (array_inv!13161 a!2986) (bvsge (size!17666 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53088 d!85685))

(declare-fun d!85687 () Bool)

(assert (=> d!85687 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577686 d!85687))

(check-sat (not b!577818) (not bm!32754) (not b!577795) (not b!577743) (not b!577741) (not d!85659))
(check-sat)
