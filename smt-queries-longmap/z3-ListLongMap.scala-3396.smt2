; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46838 () Bool)

(assert start!46838)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!301742 () Bool)

(declare-datatypes ((array!33094 0))(
  ( (array!33095 (arr!15913 (Array (_ BitVec 32) (_ BitVec 64))) (size!16277 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33094)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!517095 () Bool)

(declare-datatypes ((SeekEntryResult!4336 0))(
  ( (MissingZero!4336 (index!19532 (_ BitVec 32))) (Found!4336 (index!19533 (_ BitVec 32))) (Intermediate!4336 (undefined!5148 Bool) (index!19534 (_ BitVec 32)) (x!48638 (_ BitVec 32))) (Undefined!4336) (MissingVacant!4336 (index!19535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33094 (_ BitVec 32)) SeekEntryResult!4336)

(assert (=> b!517095 (= e!301742 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) (Found!4336 j!176)))))

(declare-fun b!517096 () Bool)

(declare-fun e!301746 () Bool)

(declare-fun e!301744 () Bool)

(assert (=> b!517096 (= e!301746 (not e!301744))))

(declare-fun res!316533 () Bool)

(assert (=> b!517096 (=> res!316533 e!301744)))

(declare-fun lt!236752 () SeekEntryResult!4336)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236753 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33094 (_ BitVec 32)) SeekEntryResult!4336)

(assert (=> b!517096 (= res!316533 (= lt!236752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236753 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)) mask!3524)))))

(declare-fun lt!236751 () (_ BitVec 32))

(assert (=> b!517096 (= lt!236752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236751 (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517096 (= lt!236753 (toIndex!0 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517096 (= lt!236751 (toIndex!0 (select (arr!15913 a!3235) j!176) mask!3524))))

(assert (=> b!517096 e!301742))

(declare-fun res!316534 () Bool)

(assert (=> b!517096 (=> (not res!316534) (not e!301742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33094 (_ BitVec 32)) Bool)

(assert (=> b!517096 (= res!316534 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15991 0))(
  ( (Unit!15992) )
))
(declare-fun lt!236755 () Unit!15991)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15991)

(assert (=> b!517096 (= lt!236755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517097 () Bool)

(declare-fun res!316540 () Bool)

(assert (=> b!517097 (=> (not res!316540) (not e!301746))))

(assert (=> b!517097 (= res!316540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517098 () Bool)

(declare-fun res!316536 () Bool)

(declare-fun e!301743 () Bool)

(assert (=> b!517098 (=> (not res!316536) (not e!301743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517098 (= res!316536 (validKeyInArray!0 k0!2280))))

(declare-fun b!517099 () Bool)

(declare-fun res!316531 () Bool)

(assert (=> b!517099 (=> (not res!316531) (not e!301743))))

(assert (=> b!517099 (= res!316531 (and (= (size!16277 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16277 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16277 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!316532 () Bool)

(assert (=> start!46838 (=> (not res!316532) (not e!301743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46838 (= res!316532 (validMask!0 mask!3524))))

(assert (=> start!46838 e!301743))

(assert (=> start!46838 true))

(declare-fun array_inv!11772 (array!33094) Bool)

(assert (=> start!46838 (array_inv!11772 a!3235)))

(declare-fun b!517100 () Bool)

(assert (=> b!517100 (= e!301744 (or (not (= (select (arr!15913 a!3235) (index!19534 lt!236752)) (select (arr!15913 a!3235) j!176))) (bvsgt (x!48638 lt!236752) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48638 lt!236752)) (and (bvsge lt!236751 #b00000000000000000000000000000000) (bvslt lt!236751 (size!16277 a!3235)))))))

(assert (=> b!517100 (and (bvslt (x!48638 lt!236752) #b01111111111111111111111111111110) (or (= (select (arr!15913 a!3235) (index!19534 lt!236752)) (select (arr!15913 a!3235) j!176)) (= (select (arr!15913 a!3235) (index!19534 lt!236752)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15913 a!3235) (index!19534 lt!236752)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517101 () Bool)

(declare-fun res!316530 () Bool)

(assert (=> b!517101 (=> res!316530 e!301744)))

(get-info :version)

(assert (=> b!517101 (= res!316530 (or (undefined!5148 lt!236752) (not ((_ is Intermediate!4336) lt!236752))))))

(declare-fun b!517102 () Bool)

(declare-fun res!316535 () Bool)

(assert (=> b!517102 (=> (not res!316535) (not e!301743))))

(declare-fun arrayContainsKey!0 (array!33094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517102 (= res!316535 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517103 () Bool)

(declare-fun res!316539 () Bool)

(assert (=> b!517103 (=> (not res!316539) (not e!301743))))

(assert (=> b!517103 (= res!316539 (validKeyInArray!0 (select (arr!15913 a!3235) j!176)))))

(declare-fun b!517104 () Bool)

(declare-fun res!316538 () Bool)

(assert (=> b!517104 (=> (not res!316538) (not e!301746))))

(declare-datatypes ((List!9978 0))(
  ( (Nil!9975) (Cons!9974 (h!10875 (_ BitVec 64)) (t!16198 List!9978)) )
))
(declare-fun arrayNoDuplicates!0 (array!33094 (_ BitVec 32) List!9978) Bool)

(assert (=> b!517104 (= res!316538 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9975))))

(declare-fun b!517105 () Bool)

(assert (=> b!517105 (= e!301743 e!301746)))

(declare-fun res!316537 () Bool)

(assert (=> b!517105 (=> (not res!316537) (not e!301746))))

(declare-fun lt!236754 () SeekEntryResult!4336)

(assert (=> b!517105 (= res!316537 (or (= lt!236754 (MissingZero!4336 i!1204)) (= lt!236754 (MissingVacant!4336 i!1204))))))

(assert (=> b!517105 (= lt!236754 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46838 res!316532) b!517099))

(assert (= (and b!517099 res!316531) b!517103))

(assert (= (and b!517103 res!316539) b!517098))

(assert (= (and b!517098 res!316536) b!517102))

(assert (= (and b!517102 res!316535) b!517105))

(assert (= (and b!517105 res!316537) b!517097))

(assert (= (and b!517097 res!316540) b!517104))

(assert (= (and b!517104 res!316538) b!517096))

(assert (= (and b!517096 res!316534) b!517095))

(assert (= (and b!517096 (not res!316533)) b!517101))

(assert (= (and b!517101 (not res!316530)) b!517100))

(declare-fun m!498805 () Bool)

(assert (=> b!517095 m!498805))

(assert (=> b!517095 m!498805))

(declare-fun m!498807 () Bool)

(assert (=> b!517095 m!498807))

(declare-fun m!498809 () Bool)

(assert (=> b!517104 m!498809))

(declare-fun m!498811 () Bool)

(assert (=> b!517100 m!498811))

(assert (=> b!517100 m!498805))

(declare-fun m!498813 () Bool)

(assert (=> b!517096 m!498813))

(declare-fun m!498815 () Bool)

(assert (=> b!517096 m!498815))

(declare-fun m!498817 () Bool)

(assert (=> b!517096 m!498817))

(assert (=> b!517096 m!498805))

(declare-fun m!498819 () Bool)

(assert (=> b!517096 m!498819))

(assert (=> b!517096 m!498805))

(declare-fun m!498821 () Bool)

(assert (=> b!517096 m!498821))

(assert (=> b!517096 m!498817))

(declare-fun m!498823 () Bool)

(assert (=> b!517096 m!498823))

(assert (=> b!517096 m!498817))

(declare-fun m!498825 () Bool)

(assert (=> b!517096 m!498825))

(assert (=> b!517096 m!498805))

(declare-fun m!498827 () Bool)

(assert (=> b!517096 m!498827))

(declare-fun m!498829 () Bool)

(assert (=> b!517105 m!498829))

(assert (=> b!517103 m!498805))

(assert (=> b!517103 m!498805))

(declare-fun m!498831 () Bool)

(assert (=> b!517103 m!498831))

(declare-fun m!498833 () Bool)

(assert (=> b!517097 m!498833))

(declare-fun m!498835 () Bool)

(assert (=> b!517098 m!498835))

(declare-fun m!498837 () Bool)

(assert (=> b!517102 m!498837))

(declare-fun m!498839 () Bool)

(assert (=> start!46838 m!498839))

(declare-fun m!498841 () Bool)

(assert (=> start!46838 m!498841))

(check-sat (not b!517104) (not b!517103) (not b!517097) (not start!46838) (not b!517105) (not b!517096) (not b!517102) (not b!517098) (not b!517095))
(check-sat)
(get-model)

(declare-fun b!517182 () Bool)

(declare-fun e!301785 () Bool)

(declare-fun contains!2721 (List!9978 (_ BitVec 64)) Bool)

(assert (=> b!517182 (= e!301785 (contains!2721 Nil!9975 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517183 () Bool)

(declare-fun e!301788 () Bool)

(declare-fun call!31650 () Bool)

(assert (=> b!517183 (= e!301788 call!31650)))

(declare-fun b!517184 () Bool)

(assert (=> b!517184 (= e!301788 call!31650)))

(declare-fun b!517185 () Bool)

(declare-fun e!301786 () Bool)

(assert (=> b!517185 (= e!301786 e!301788)))

(declare-fun c!60575 () Bool)

(assert (=> b!517185 (= c!60575 (validKeyInArray!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31647 () Bool)

(assert (=> bm!31647 (= call!31650 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60575 (Cons!9974 (select (arr!15913 a!3235) #b00000000000000000000000000000000) Nil!9975) Nil!9975)))))

(declare-fun b!517186 () Bool)

(declare-fun e!301787 () Bool)

(assert (=> b!517186 (= e!301787 e!301786)))

(declare-fun res!316614 () Bool)

(assert (=> b!517186 (=> (not res!316614) (not e!301786))))

(assert (=> b!517186 (= res!316614 (not e!301785))))

(declare-fun res!316613 () Bool)

(assert (=> b!517186 (=> (not res!316613) (not e!301785))))

(assert (=> b!517186 (= res!316613 (validKeyInArray!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79703 () Bool)

(declare-fun res!316615 () Bool)

(assert (=> d!79703 (=> res!316615 e!301787)))

(assert (=> d!79703 (= res!316615 (bvsge #b00000000000000000000000000000000 (size!16277 a!3235)))))

(assert (=> d!79703 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9975) e!301787)))

(assert (= (and d!79703 (not res!316615)) b!517186))

(assert (= (and b!517186 res!316613) b!517182))

(assert (= (and b!517186 res!316614) b!517185))

(assert (= (and b!517185 c!60575) b!517184))

(assert (= (and b!517185 (not c!60575)) b!517183))

(assert (= (or b!517184 b!517183) bm!31647))

(declare-fun m!498919 () Bool)

(assert (=> b!517182 m!498919))

(assert (=> b!517182 m!498919))

(declare-fun m!498921 () Bool)

(assert (=> b!517182 m!498921))

(assert (=> b!517185 m!498919))

(assert (=> b!517185 m!498919))

(declare-fun m!498923 () Bool)

(assert (=> b!517185 m!498923))

(assert (=> bm!31647 m!498919))

(declare-fun m!498925 () Bool)

(assert (=> bm!31647 m!498925))

(assert (=> b!517186 m!498919))

(assert (=> b!517186 m!498919))

(assert (=> b!517186 m!498923))

(assert (=> b!517104 d!79703))

(declare-fun b!517199 () Bool)

(declare-fun e!301797 () SeekEntryResult!4336)

(declare-fun lt!236792 () SeekEntryResult!4336)

(assert (=> b!517199 (= e!301797 (Found!4336 (index!19534 lt!236792)))))

(declare-fun b!517200 () Bool)

(declare-fun e!301796 () SeekEntryResult!4336)

(assert (=> b!517200 (= e!301796 e!301797)))

(declare-fun lt!236793 () (_ BitVec 64))

(assert (=> b!517200 (= lt!236793 (select (arr!15913 a!3235) (index!19534 lt!236792)))))

(declare-fun c!60584 () Bool)

(assert (=> b!517200 (= c!60584 (= lt!236793 (select (arr!15913 a!3235) j!176)))))

(declare-fun d!79705 () Bool)

(declare-fun lt!236794 () SeekEntryResult!4336)

(assert (=> d!79705 (and (or ((_ is Undefined!4336) lt!236794) (not ((_ is Found!4336) lt!236794)) (and (bvsge (index!19533 lt!236794) #b00000000000000000000000000000000) (bvslt (index!19533 lt!236794) (size!16277 a!3235)))) (or ((_ is Undefined!4336) lt!236794) ((_ is Found!4336) lt!236794) (not ((_ is MissingZero!4336) lt!236794)) (and (bvsge (index!19532 lt!236794) #b00000000000000000000000000000000) (bvslt (index!19532 lt!236794) (size!16277 a!3235)))) (or ((_ is Undefined!4336) lt!236794) ((_ is Found!4336) lt!236794) ((_ is MissingZero!4336) lt!236794) (not ((_ is MissingVacant!4336) lt!236794)) (and (bvsge (index!19535 lt!236794) #b00000000000000000000000000000000) (bvslt (index!19535 lt!236794) (size!16277 a!3235)))) (or ((_ is Undefined!4336) lt!236794) (ite ((_ is Found!4336) lt!236794) (= (select (arr!15913 a!3235) (index!19533 lt!236794)) (select (arr!15913 a!3235) j!176)) (ite ((_ is MissingZero!4336) lt!236794) (= (select (arr!15913 a!3235) (index!19532 lt!236794)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4336) lt!236794) (= (select (arr!15913 a!3235) (index!19535 lt!236794)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79705 (= lt!236794 e!301796)))

(declare-fun c!60583 () Bool)

(assert (=> d!79705 (= c!60583 (and ((_ is Intermediate!4336) lt!236792) (undefined!5148 lt!236792)))))

(assert (=> d!79705 (= lt!236792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15913 a!3235) j!176) mask!3524) (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79705 (validMask!0 mask!3524)))

(assert (=> d!79705 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) lt!236794)))

(declare-fun e!301795 () SeekEntryResult!4336)

(declare-fun b!517201 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33094 (_ BitVec 32)) SeekEntryResult!4336)

(assert (=> b!517201 (= e!301795 (seekKeyOrZeroReturnVacant!0 (x!48638 lt!236792) (index!19534 lt!236792) (index!19534 lt!236792) (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517202 () Bool)

(assert (=> b!517202 (= e!301796 Undefined!4336)))

(declare-fun b!517203 () Bool)

(assert (=> b!517203 (= e!301795 (MissingZero!4336 (index!19534 lt!236792)))))

(declare-fun b!517204 () Bool)

(declare-fun c!60582 () Bool)

(assert (=> b!517204 (= c!60582 (= lt!236793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517204 (= e!301797 e!301795)))

(assert (= (and d!79705 c!60583) b!517202))

(assert (= (and d!79705 (not c!60583)) b!517200))

(assert (= (and b!517200 c!60584) b!517199))

(assert (= (and b!517200 (not c!60584)) b!517204))

(assert (= (and b!517204 c!60582) b!517203))

(assert (= (and b!517204 (not c!60582)) b!517201))

(declare-fun m!498927 () Bool)

(assert (=> b!517200 m!498927))

(assert (=> d!79705 m!498839))

(assert (=> d!79705 m!498805))

(assert (=> d!79705 m!498819))

(declare-fun m!498929 () Bool)

(assert (=> d!79705 m!498929))

(declare-fun m!498931 () Bool)

(assert (=> d!79705 m!498931))

(declare-fun m!498933 () Bool)

(assert (=> d!79705 m!498933))

(assert (=> d!79705 m!498819))

(assert (=> d!79705 m!498805))

(declare-fun m!498935 () Bool)

(assert (=> d!79705 m!498935))

(assert (=> b!517201 m!498805))

(declare-fun m!498937 () Bool)

(assert (=> b!517201 m!498937))

(assert (=> b!517095 d!79705))

(declare-fun b!517205 () Bool)

(declare-fun e!301800 () SeekEntryResult!4336)

(declare-fun lt!236795 () SeekEntryResult!4336)

(assert (=> b!517205 (= e!301800 (Found!4336 (index!19534 lt!236795)))))

(declare-fun b!517206 () Bool)

(declare-fun e!301799 () SeekEntryResult!4336)

(assert (=> b!517206 (= e!301799 e!301800)))

(declare-fun lt!236796 () (_ BitVec 64))

(assert (=> b!517206 (= lt!236796 (select (arr!15913 a!3235) (index!19534 lt!236795)))))

(declare-fun c!60587 () Bool)

(assert (=> b!517206 (= c!60587 (= lt!236796 k0!2280))))

(declare-fun d!79709 () Bool)

(declare-fun lt!236797 () SeekEntryResult!4336)

(assert (=> d!79709 (and (or ((_ is Undefined!4336) lt!236797) (not ((_ is Found!4336) lt!236797)) (and (bvsge (index!19533 lt!236797) #b00000000000000000000000000000000) (bvslt (index!19533 lt!236797) (size!16277 a!3235)))) (or ((_ is Undefined!4336) lt!236797) ((_ is Found!4336) lt!236797) (not ((_ is MissingZero!4336) lt!236797)) (and (bvsge (index!19532 lt!236797) #b00000000000000000000000000000000) (bvslt (index!19532 lt!236797) (size!16277 a!3235)))) (or ((_ is Undefined!4336) lt!236797) ((_ is Found!4336) lt!236797) ((_ is MissingZero!4336) lt!236797) (not ((_ is MissingVacant!4336) lt!236797)) (and (bvsge (index!19535 lt!236797) #b00000000000000000000000000000000) (bvslt (index!19535 lt!236797) (size!16277 a!3235)))) (or ((_ is Undefined!4336) lt!236797) (ite ((_ is Found!4336) lt!236797) (= (select (arr!15913 a!3235) (index!19533 lt!236797)) k0!2280) (ite ((_ is MissingZero!4336) lt!236797) (= (select (arr!15913 a!3235) (index!19532 lt!236797)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4336) lt!236797) (= (select (arr!15913 a!3235) (index!19535 lt!236797)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79709 (= lt!236797 e!301799)))

(declare-fun c!60586 () Bool)

(assert (=> d!79709 (= c!60586 (and ((_ is Intermediate!4336) lt!236795) (undefined!5148 lt!236795)))))

(assert (=> d!79709 (= lt!236795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79709 (validMask!0 mask!3524)))

(assert (=> d!79709 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!236797)))

(declare-fun b!517207 () Bool)

(declare-fun e!301798 () SeekEntryResult!4336)

(assert (=> b!517207 (= e!301798 (seekKeyOrZeroReturnVacant!0 (x!48638 lt!236795) (index!19534 lt!236795) (index!19534 lt!236795) k0!2280 a!3235 mask!3524))))

(declare-fun b!517208 () Bool)

(assert (=> b!517208 (= e!301799 Undefined!4336)))

(declare-fun b!517209 () Bool)

(assert (=> b!517209 (= e!301798 (MissingZero!4336 (index!19534 lt!236795)))))

(declare-fun b!517210 () Bool)

(declare-fun c!60585 () Bool)

(assert (=> b!517210 (= c!60585 (= lt!236796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517210 (= e!301800 e!301798)))

(assert (= (and d!79709 c!60586) b!517208))

(assert (= (and d!79709 (not c!60586)) b!517206))

(assert (= (and b!517206 c!60587) b!517205))

(assert (= (and b!517206 (not c!60587)) b!517210))

(assert (= (and b!517210 c!60585) b!517209))

(assert (= (and b!517210 (not c!60585)) b!517207))

(declare-fun m!498939 () Bool)

(assert (=> b!517206 m!498939))

(assert (=> d!79709 m!498839))

(declare-fun m!498941 () Bool)

(assert (=> d!79709 m!498941))

(declare-fun m!498943 () Bool)

(assert (=> d!79709 m!498943))

(declare-fun m!498945 () Bool)

(assert (=> d!79709 m!498945))

(declare-fun m!498947 () Bool)

(assert (=> d!79709 m!498947))

(assert (=> d!79709 m!498941))

(declare-fun m!498949 () Bool)

(assert (=> d!79709 m!498949))

(declare-fun m!498951 () Bool)

(assert (=> b!517207 m!498951))

(assert (=> b!517105 d!79709))

(declare-fun d!79711 () Bool)

(assert (=> d!79711 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46838 d!79711))

(declare-fun d!79717 () Bool)

(assert (=> d!79717 (= (array_inv!11772 a!3235) (bvsge (size!16277 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46838 d!79717))

(declare-fun d!79719 () Bool)

(declare-fun res!316630 () Bool)

(declare-fun e!301817 () Bool)

(assert (=> d!79719 (=> res!316630 e!301817)))

(assert (=> d!79719 (= res!316630 (= (select (arr!15913 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79719 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!301817)))

(declare-fun b!517230 () Bool)

(declare-fun e!301818 () Bool)

(assert (=> b!517230 (= e!301817 e!301818)))

(declare-fun res!316631 () Bool)

(assert (=> b!517230 (=> (not res!316631) (not e!301818))))

(assert (=> b!517230 (= res!316631 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16277 a!3235)))))

(declare-fun b!517231 () Bool)

(assert (=> b!517231 (= e!301818 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79719 (not res!316630)) b!517230))

(assert (= (and b!517230 res!316631) b!517231))

(assert (=> d!79719 m!498919))

(declare-fun m!498961 () Bool)

(assert (=> b!517231 m!498961))

(assert (=> b!517102 d!79719))

(declare-fun lt!236824 () SeekEntryResult!4336)

(declare-fun b!517304 () Bool)

(assert (=> b!517304 (and (bvsge (index!19534 lt!236824) #b00000000000000000000000000000000) (bvslt (index!19534 lt!236824) (size!16277 (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)))))))

(declare-fun e!301860 () Bool)

(assert (=> b!517304 (= e!301860 (= (select (arr!15913 (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) (index!19534 lt!236824)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517305 () Bool)

(declare-fun e!301862 () SeekEntryResult!4336)

(assert (=> b!517305 (= e!301862 (Intermediate!4336 true lt!236753 #b00000000000000000000000000000000))))

(declare-fun b!517306 () Bool)

(declare-fun e!301863 () SeekEntryResult!4336)

(assert (=> b!517306 (= e!301862 e!301863)))

(declare-fun c!60617 () Bool)

(declare-fun lt!236825 () (_ BitVec 64))

(assert (=> b!517306 (= c!60617 (or (= lt!236825 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236825 lt!236825) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517307 () Bool)

(declare-fun e!301859 () Bool)

(declare-fun e!301861 () Bool)

(assert (=> b!517307 (= e!301859 e!301861)))

(declare-fun res!316657 () Bool)

(assert (=> b!517307 (= res!316657 (and ((_ is Intermediate!4336) lt!236824) (not (undefined!5148 lt!236824)) (bvslt (x!48638 lt!236824) #b01111111111111111111111111111110) (bvsge (x!48638 lt!236824) #b00000000000000000000000000000000) (bvsge (x!48638 lt!236824) #b00000000000000000000000000000000)))))

(assert (=> b!517307 (=> (not res!316657) (not e!301861))))

(declare-fun b!517308 () Bool)

(assert (=> b!517308 (and (bvsge (index!19534 lt!236824) #b00000000000000000000000000000000) (bvslt (index!19534 lt!236824) (size!16277 (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)))))))

(declare-fun res!316659 () Bool)

(assert (=> b!517308 (= res!316659 (= (select (arr!15913 (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) (index!19534 lt!236824)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517308 (=> res!316659 e!301860)))

(declare-fun b!517309 () Bool)

(assert (=> b!517309 (= e!301863 (Intermediate!4336 false lt!236753 #b00000000000000000000000000000000))))

(declare-fun b!517311 () Bool)

(assert (=> b!517311 (and (bvsge (index!19534 lt!236824) #b00000000000000000000000000000000) (bvslt (index!19534 lt!236824) (size!16277 (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)))))))

(declare-fun res!316658 () Bool)

(assert (=> b!517311 (= res!316658 (= (select (arr!15913 (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) (index!19534 lt!236824)) (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!517311 (=> res!316658 e!301860)))

(assert (=> b!517311 (= e!301861 e!301860)))

(declare-fun b!517312 () Bool)

(assert (=> b!517312 (= e!301859 (bvsge (x!48638 lt!236824) #b01111111111111111111111111111110))))

(declare-fun b!517310 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517310 (= e!301863 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236753 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)) mask!3524))))

(declare-fun d!79723 () Bool)

(assert (=> d!79723 e!301859))

(declare-fun c!60615 () Bool)

(assert (=> d!79723 (= c!60615 (and ((_ is Intermediate!4336) lt!236824) (undefined!5148 lt!236824)))))

(assert (=> d!79723 (= lt!236824 e!301862)))

(declare-fun c!60616 () Bool)

(assert (=> d!79723 (= c!60616 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79723 (= lt!236825 (select (arr!15913 (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) lt!236753))))

(assert (=> d!79723 (validMask!0 mask!3524)))

(assert (=> d!79723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236753 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (array!33095 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)) mask!3524) lt!236824)))

(assert (= (and d!79723 c!60616) b!517305))

(assert (= (and d!79723 (not c!60616)) b!517306))

(assert (= (and b!517306 c!60617) b!517309))

(assert (= (and b!517306 (not c!60617)) b!517310))

(assert (= (and d!79723 c!60615) b!517312))

(assert (= (and d!79723 (not c!60615)) b!517307))

(assert (= (and b!517307 res!316657) b!517311))

(assert (= (and b!517311 (not res!316658)) b!517308))

(assert (= (and b!517308 (not res!316659)) b!517304))

(declare-fun m!498979 () Bool)

(assert (=> b!517311 m!498979))

(declare-fun m!498981 () Bool)

(assert (=> d!79723 m!498981))

(assert (=> d!79723 m!498839))

(assert (=> b!517304 m!498979))

(declare-fun m!498983 () Bool)

(assert (=> b!517310 m!498983))

(assert (=> b!517310 m!498983))

(assert (=> b!517310 m!498817))

(declare-fun m!498985 () Bool)

(assert (=> b!517310 m!498985))

(assert (=> b!517308 m!498979))

(assert (=> b!517096 d!79723))

(declare-fun d!79731 () Bool)

(declare-fun lt!236839 () (_ BitVec 32))

(declare-fun lt!236838 () (_ BitVec 32))

(assert (=> d!79731 (= lt!236839 (bvmul (bvxor lt!236838 (bvlshr lt!236838 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79731 (= lt!236838 ((_ extract 31 0) (bvand (bvxor (select (arr!15913 a!3235) j!176) (bvlshr (select (arr!15913 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79731 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316660 (let ((h!10880 ((_ extract 31 0) (bvand (bvxor (select (arr!15913 a!3235) j!176) (bvlshr (select (arr!15913 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48646 (bvmul (bvxor h!10880 (bvlshr h!10880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48646 (bvlshr x!48646 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316660 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316660 #b00000000000000000000000000000000))))))

(assert (=> d!79731 (= (toIndex!0 (select (arr!15913 a!3235) j!176) mask!3524) (bvand (bvxor lt!236839 (bvlshr lt!236839 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517096 d!79731))

(declare-fun b!517327 () Bool)

(declare-fun lt!236844 () SeekEntryResult!4336)

(assert (=> b!517327 (and (bvsge (index!19534 lt!236844) #b00000000000000000000000000000000) (bvslt (index!19534 lt!236844) (size!16277 a!3235)))))

(declare-fun e!301875 () Bool)

(assert (=> b!517327 (= e!301875 (= (select (arr!15913 a!3235) (index!19534 lt!236844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517328 () Bool)

(declare-fun e!301877 () SeekEntryResult!4336)

(assert (=> b!517328 (= e!301877 (Intermediate!4336 true lt!236751 #b00000000000000000000000000000000))))

(declare-fun b!517329 () Bool)

(declare-fun e!301878 () SeekEntryResult!4336)

(assert (=> b!517329 (= e!301877 e!301878)))

(declare-fun c!60624 () Bool)

(declare-fun lt!236845 () (_ BitVec 64))

(assert (=> b!517329 (= c!60624 (or (= lt!236845 (select (arr!15913 a!3235) j!176)) (= (bvadd lt!236845 lt!236845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517330 () Bool)

(declare-fun e!301874 () Bool)

(declare-fun e!301876 () Bool)

(assert (=> b!517330 (= e!301874 e!301876)))

(declare-fun res!316667 () Bool)

(assert (=> b!517330 (= res!316667 (and ((_ is Intermediate!4336) lt!236844) (not (undefined!5148 lt!236844)) (bvslt (x!48638 lt!236844) #b01111111111111111111111111111110) (bvsge (x!48638 lt!236844) #b00000000000000000000000000000000) (bvsge (x!48638 lt!236844) #b00000000000000000000000000000000)))))

(assert (=> b!517330 (=> (not res!316667) (not e!301876))))

(declare-fun b!517331 () Bool)

(assert (=> b!517331 (and (bvsge (index!19534 lt!236844) #b00000000000000000000000000000000) (bvslt (index!19534 lt!236844) (size!16277 a!3235)))))

(declare-fun res!316669 () Bool)

(assert (=> b!517331 (= res!316669 (= (select (arr!15913 a!3235) (index!19534 lt!236844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517331 (=> res!316669 e!301875)))

(declare-fun b!517332 () Bool)

(assert (=> b!517332 (= e!301878 (Intermediate!4336 false lt!236751 #b00000000000000000000000000000000))))

(declare-fun b!517334 () Bool)

(assert (=> b!517334 (and (bvsge (index!19534 lt!236844) #b00000000000000000000000000000000) (bvslt (index!19534 lt!236844) (size!16277 a!3235)))))

(declare-fun res!316668 () Bool)

(assert (=> b!517334 (= res!316668 (= (select (arr!15913 a!3235) (index!19534 lt!236844)) (select (arr!15913 a!3235) j!176)))))

(assert (=> b!517334 (=> res!316668 e!301875)))

(assert (=> b!517334 (= e!301876 e!301875)))

(declare-fun b!517335 () Bool)

(assert (=> b!517335 (= e!301874 (bvsge (x!48638 lt!236844) #b01111111111111111111111111111110))))

(declare-fun b!517333 () Bool)

(assert (=> b!517333 (= e!301878 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236751 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79733 () Bool)

(assert (=> d!79733 e!301874))

(declare-fun c!60622 () Bool)

(assert (=> d!79733 (= c!60622 (and ((_ is Intermediate!4336) lt!236844) (undefined!5148 lt!236844)))))

(assert (=> d!79733 (= lt!236844 e!301877)))

(declare-fun c!60623 () Bool)

(assert (=> d!79733 (= c!60623 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79733 (= lt!236845 (select (arr!15913 a!3235) lt!236751))))

(assert (=> d!79733 (validMask!0 mask!3524)))

(assert (=> d!79733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236751 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) lt!236844)))

(assert (= (and d!79733 c!60623) b!517328))

(assert (= (and d!79733 (not c!60623)) b!517329))

(assert (= (and b!517329 c!60624) b!517332))

(assert (= (and b!517329 (not c!60624)) b!517333))

(assert (= (and d!79733 c!60622) b!517335))

(assert (= (and d!79733 (not c!60622)) b!517330))

(assert (= (and b!517330 res!316667) b!517334))

(assert (= (and b!517334 (not res!316668)) b!517331))

(assert (= (and b!517331 (not res!316669)) b!517327))

(declare-fun m!498987 () Bool)

(assert (=> b!517334 m!498987))

(declare-fun m!498989 () Bool)

(assert (=> d!79733 m!498989))

(assert (=> d!79733 m!498839))

(assert (=> b!517327 m!498987))

(declare-fun m!498991 () Bool)

(assert (=> b!517333 m!498991))

(assert (=> b!517333 m!498991))

(assert (=> b!517333 m!498805))

(declare-fun m!498993 () Bool)

(assert (=> b!517333 m!498993))

(assert (=> b!517331 m!498987))

(assert (=> b!517096 d!79733))

(declare-fun b!517372 () Bool)

(declare-fun e!301905 () Bool)

(declare-fun e!301904 () Bool)

(assert (=> b!517372 (= e!301905 e!301904)))

(declare-fun lt!236875 () (_ BitVec 64))

(assert (=> b!517372 (= lt!236875 (select (arr!15913 a!3235) j!176))))

(declare-fun lt!236876 () Unit!15991)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33094 (_ BitVec 64) (_ BitVec 32)) Unit!15991)

(assert (=> b!517372 (= lt!236876 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236875 j!176))))

(assert (=> b!517372 (arrayContainsKey!0 a!3235 lt!236875 #b00000000000000000000000000000000)))

(declare-fun lt!236874 () Unit!15991)

(assert (=> b!517372 (= lt!236874 lt!236876)))

(declare-fun res!316687 () Bool)

(assert (=> b!517372 (= res!316687 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) (Found!4336 j!176)))))

(assert (=> b!517372 (=> (not res!316687) (not e!301904))))

(declare-fun d!79735 () Bool)

(declare-fun res!316686 () Bool)

(declare-fun e!301903 () Bool)

(assert (=> d!79735 (=> res!316686 e!301903)))

(assert (=> d!79735 (= res!316686 (bvsge j!176 (size!16277 a!3235)))))

(assert (=> d!79735 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301903)))

(declare-fun bm!31659 () Bool)

(declare-fun call!31662 () Bool)

(assert (=> bm!31659 (= call!31662 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517373 () Bool)

(assert (=> b!517373 (= e!301905 call!31662)))

(declare-fun b!517374 () Bool)

(assert (=> b!517374 (= e!301903 e!301905)))

(declare-fun c!60635 () Bool)

(assert (=> b!517374 (= c!60635 (validKeyInArray!0 (select (arr!15913 a!3235) j!176)))))

(declare-fun b!517375 () Bool)

(assert (=> b!517375 (= e!301904 call!31662)))

(assert (= (and d!79735 (not res!316686)) b!517374))

(assert (= (and b!517374 c!60635) b!517372))

(assert (= (and b!517374 (not c!60635)) b!517373))

(assert (= (and b!517372 res!316687) b!517375))

(assert (= (or b!517375 b!517373) bm!31659))

(assert (=> b!517372 m!498805))

(declare-fun m!499027 () Bool)

(assert (=> b!517372 m!499027))

(declare-fun m!499029 () Bool)

(assert (=> b!517372 m!499029))

(assert (=> b!517372 m!498805))

(assert (=> b!517372 m!498807))

(declare-fun m!499031 () Bool)

(assert (=> bm!31659 m!499031))

(assert (=> b!517374 m!498805))

(assert (=> b!517374 m!498805))

(assert (=> b!517374 m!498831))

(assert (=> b!517096 d!79735))

(declare-fun d!79753 () Bool)

(assert (=> d!79753 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236879 () Unit!15991)

(declare-fun choose!38 (array!33094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15991)

(assert (=> d!79753 (= lt!236879 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79753 (validMask!0 mask!3524)))

(assert (=> d!79753 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236879)))

(declare-fun bs!16354 () Bool)

(assert (= bs!16354 d!79753))

(assert (=> bs!16354 m!498821))

(declare-fun m!499033 () Bool)

(assert (=> bs!16354 m!499033))

(assert (=> bs!16354 m!498839))

(assert (=> b!517096 d!79753))

(declare-fun d!79755 () Bool)

(declare-fun lt!236881 () (_ BitVec 32))

(declare-fun lt!236880 () (_ BitVec 32))

(assert (=> d!79755 (= lt!236881 (bvmul (bvxor lt!236880 (bvlshr lt!236880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79755 (= lt!236880 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79755 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316660 (let ((h!10880 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48646 (bvmul (bvxor h!10880 (bvlshr h!10880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48646 (bvlshr x!48646 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316660 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316660 #b00000000000000000000000000000000))))))

(assert (=> d!79755 (= (toIndex!0 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236881 (bvlshr lt!236881 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517096 d!79755))

(declare-fun d!79757 () Bool)

(assert (=> d!79757 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517098 d!79757))

(declare-fun d!79759 () Bool)

(assert (=> d!79759 (= (validKeyInArray!0 (select (arr!15913 a!3235) j!176)) (and (not (= (select (arr!15913 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15913 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517103 d!79759))

(declare-fun b!517376 () Bool)

(declare-fun e!301908 () Bool)

(declare-fun e!301907 () Bool)

(assert (=> b!517376 (= e!301908 e!301907)))

(declare-fun lt!236883 () (_ BitVec 64))

(assert (=> b!517376 (= lt!236883 (select (arr!15913 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236884 () Unit!15991)

(assert (=> b!517376 (= lt!236884 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236883 #b00000000000000000000000000000000))))

(assert (=> b!517376 (arrayContainsKey!0 a!3235 lt!236883 #b00000000000000000000000000000000)))

(declare-fun lt!236882 () Unit!15991)

(assert (=> b!517376 (= lt!236882 lt!236884)))

(declare-fun res!316689 () Bool)

(assert (=> b!517376 (= res!316689 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4336 #b00000000000000000000000000000000)))))

(assert (=> b!517376 (=> (not res!316689) (not e!301907))))

(declare-fun d!79761 () Bool)

(declare-fun res!316688 () Bool)

(declare-fun e!301906 () Bool)

(assert (=> d!79761 (=> res!316688 e!301906)))

(assert (=> d!79761 (= res!316688 (bvsge #b00000000000000000000000000000000 (size!16277 a!3235)))))

(assert (=> d!79761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301906)))

(declare-fun bm!31660 () Bool)

(declare-fun call!31663 () Bool)

(assert (=> bm!31660 (= call!31663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517377 () Bool)

(assert (=> b!517377 (= e!301908 call!31663)))

(declare-fun b!517378 () Bool)

(assert (=> b!517378 (= e!301906 e!301908)))

(declare-fun c!60636 () Bool)

(assert (=> b!517378 (= c!60636 (validKeyInArray!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517379 () Bool)

(assert (=> b!517379 (= e!301907 call!31663)))

(assert (= (and d!79761 (not res!316688)) b!517378))

(assert (= (and b!517378 c!60636) b!517376))

(assert (= (and b!517378 (not c!60636)) b!517377))

(assert (= (and b!517376 res!316689) b!517379))

(assert (= (or b!517379 b!517377) bm!31660))

(assert (=> b!517376 m!498919))

(declare-fun m!499035 () Bool)

(assert (=> b!517376 m!499035))

(declare-fun m!499037 () Bool)

(assert (=> b!517376 m!499037))

(assert (=> b!517376 m!498919))

(declare-fun m!499039 () Bool)

(assert (=> b!517376 m!499039))

(declare-fun m!499041 () Bool)

(assert (=> bm!31660 m!499041))

(assert (=> b!517378 m!498919))

(assert (=> b!517378 m!498919))

(assert (=> b!517378 m!498923))

(assert (=> b!517097 d!79761))

(check-sat (not bm!31647) (not d!79709) (not b!517201) (not d!79733) (not bm!31659) (not d!79723) (not d!79753) (not b!517186) (not b!517185) (not b!517207) (not b!517310) (not d!79705) (not b!517372) (not b!517231) (not b!517182) (not b!517378) (not bm!31660) (not b!517376) (not b!517374) (not b!517333))
(check-sat)
