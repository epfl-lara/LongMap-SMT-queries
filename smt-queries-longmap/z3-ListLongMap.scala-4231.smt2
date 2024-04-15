; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58310 () Bool)

(assert start!58310)

(declare-fun b!643572 () Bool)

(declare-fun e!368661 () Bool)

(declare-fun e!368671 () Bool)

(assert (=> b!643572 (= e!368661 e!368671)))

(declare-fun res!416910 () Bool)

(assert (=> b!643572 (=> (not res!416910) (not e!368671))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38418 0))(
  ( (array!38419 (arr!18422 (Array (_ BitVec 32) (_ BitVec 64))) (size!18787 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38418)

(assert (=> b!643572 (= res!416910 (= (select (store (arr!18422 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!298084 () array!38418)

(assert (=> b!643572 (= lt!298084 (array!38419 (store (arr!18422 a!2986) i!1108 k0!1786) (size!18787 a!2986)))))

(declare-fun b!643573 () Bool)

(declare-datatypes ((Unit!21782 0))(
  ( (Unit!21783) )
))
(declare-fun e!368675 () Unit!21782)

(declare-fun Unit!21784 () Unit!21782)

(assert (=> b!643573 (= e!368675 Unit!21784)))

(assert (=> b!643573 false))

(declare-fun b!643574 () Bool)

(declare-fun res!416899 () Bool)

(declare-fun e!368664 () Bool)

(assert (=> b!643574 (=> (not res!416899) (not e!368664))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!643574 (= res!416899 (and (= (size!18787 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18787 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18787 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643575 () Bool)

(declare-fun e!368672 () Unit!21782)

(declare-fun Unit!21785 () Unit!21782)

(assert (=> b!643575 (= e!368672 Unit!21785)))

(declare-fun lt!298086 () Unit!21782)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38418 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21782)

(assert (=> b!643575 (= lt!298086 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298084 (select (arr!18422 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643575 (arrayContainsKey!0 lt!298084 (select (arr!18422 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298081 () Unit!21782)

(declare-datatypes ((List!12502 0))(
  ( (Nil!12499) (Cons!12498 (h!13543 (_ BitVec 64)) (t!18721 List!12502)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38418 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12502) Unit!21782)

(assert (=> b!643575 (= lt!298081 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12499))))

(declare-fun arrayNoDuplicates!0 (array!38418 (_ BitVec 32) List!12502) Bool)

(assert (=> b!643575 (arrayNoDuplicates!0 lt!298084 #b00000000000000000000000000000000 Nil!12499)))

(declare-fun lt!298079 () Unit!21782)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38418 (_ BitVec 32) (_ BitVec 32)) Unit!21782)

(assert (=> b!643575 (= lt!298079 (lemmaNoDuplicateFromThenFromBigger!0 lt!298084 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643575 (arrayNoDuplicates!0 lt!298084 j!136 Nil!12499)))

(declare-fun lt!298075 () Unit!21782)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38418 (_ BitVec 64) (_ BitVec 32) List!12502) Unit!21782)

(assert (=> b!643575 (= lt!298075 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298084 (select (arr!18422 a!2986) j!136) j!136 Nil!12499))))

(assert (=> b!643575 false))

(declare-fun b!643576 () Bool)

(assert (=> b!643576 (= e!368664 e!368661)))

(declare-fun res!416915 () Bool)

(assert (=> b!643576 (=> (not res!416915) (not e!368661))))

(declare-datatypes ((SeekEntryResult!6859 0))(
  ( (MissingZero!6859 (index!29768 (_ BitVec 32))) (Found!6859 (index!29769 (_ BitVec 32))) (Intermediate!6859 (undefined!7671 Bool) (index!29770 (_ BitVec 32)) (x!58550 (_ BitVec 32))) (Undefined!6859) (MissingVacant!6859 (index!29771 (_ BitVec 32))) )
))
(declare-fun lt!298083 () SeekEntryResult!6859)

(assert (=> b!643576 (= res!416915 (or (= lt!298083 (MissingZero!6859 i!1108)) (= lt!298083 (MissingVacant!6859 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38418 (_ BitVec 32)) SeekEntryResult!6859)

(assert (=> b!643576 (= lt!298083 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643577 () Bool)

(declare-fun e!368668 () Bool)

(assert (=> b!643577 (= e!368668 (arrayContainsKey!0 lt!298084 (select (arr!18422 a!2986) j!136) index!984))))

(declare-fun b!643578 () Bool)

(declare-fun res!416902 () Bool)

(assert (=> b!643578 (=> (not res!416902) (not e!368664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643578 (= res!416902 (validKeyInArray!0 (select (arr!18422 a!2986) j!136)))))

(declare-fun b!643579 () Bool)

(declare-fun e!368665 () Bool)

(assert (=> b!643579 (= e!368665 e!368668)))

(declare-fun res!416913 () Bool)

(assert (=> b!643579 (=> (not res!416913) (not e!368668))))

(assert (=> b!643579 (= res!416913 (arrayContainsKey!0 lt!298084 (select (arr!18422 a!2986) j!136) j!136))))

(declare-fun b!643580 () Bool)

(declare-fun res!416914 () Bool)

(assert (=> b!643580 (=> (not res!416914) (not e!368661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38418 (_ BitVec 32)) Bool)

(assert (=> b!643580 (= res!416914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643581 () Bool)

(declare-fun res!416909 () Bool)

(assert (=> b!643581 (=> (not res!416909) (not e!368664))))

(assert (=> b!643581 (= res!416909 (validKeyInArray!0 k0!1786))))

(declare-fun b!643582 () Bool)

(declare-fun e!368662 () Bool)

(declare-fun e!368667 () Bool)

(assert (=> b!643582 (= e!368662 (not e!368667))))

(declare-fun res!416917 () Bool)

(assert (=> b!643582 (=> res!416917 e!368667)))

(declare-fun lt!298082 () SeekEntryResult!6859)

(assert (=> b!643582 (= res!416917 (not (= lt!298082 (Found!6859 index!984))))))

(declare-fun lt!298076 () Unit!21782)

(assert (=> b!643582 (= lt!298076 e!368675)))

(declare-fun c!73703 () Bool)

(assert (=> b!643582 (= c!73703 (= lt!298082 Undefined!6859))))

(declare-fun lt!298072 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38418 (_ BitVec 32)) SeekEntryResult!6859)

(assert (=> b!643582 (= lt!298082 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298072 lt!298084 mask!3053))))

(declare-fun e!368666 () Bool)

(assert (=> b!643582 e!368666))

(declare-fun res!416904 () Bool)

(assert (=> b!643582 (=> (not res!416904) (not e!368666))))

(declare-fun lt!298073 () SeekEntryResult!6859)

(declare-fun lt!298074 () (_ BitVec 32))

(assert (=> b!643582 (= res!416904 (= lt!298073 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298074 vacantSpotIndex!68 lt!298072 lt!298084 mask!3053)))))

(assert (=> b!643582 (= lt!298073 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298074 vacantSpotIndex!68 (select (arr!18422 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643582 (= lt!298072 (select (store (arr!18422 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298080 () Unit!21782)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38418 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21782)

(assert (=> b!643582 (= lt!298080 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298074 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643582 (= lt!298074 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643583 () Bool)

(declare-fun e!368670 () Bool)

(assert (=> b!643583 (= e!368670 e!368665)))

(declare-fun res!416903 () Bool)

(assert (=> b!643583 (=> res!416903 e!368665)))

(declare-fun lt!298085 () (_ BitVec 64))

(assert (=> b!643583 (= res!416903 (or (not (= (select (arr!18422 a!2986) j!136) lt!298072)) (not (= (select (arr!18422 a!2986) j!136) lt!298085)) (bvsge j!136 index!984)))))

(declare-fun b!643584 () Bool)

(declare-fun Unit!21786 () Unit!21782)

(assert (=> b!643584 (= e!368672 Unit!21786)))

(declare-fun b!643585 () Bool)

(declare-fun res!416911 () Bool)

(assert (=> b!643585 (=> (not res!416911) (not e!368661))))

(assert (=> b!643585 (= res!416911 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12499))))

(declare-fun b!643586 () Bool)

(declare-fun e!368669 () Bool)

(assert (=> b!643586 (= e!368669 (arrayContainsKey!0 lt!298084 (select (arr!18422 a!2986) j!136) index!984))))

(declare-fun b!643571 () Bool)

(declare-fun e!368673 () Bool)

(assert (=> b!643571 (= e!368667 e!368673)))

(declare-fun res!416907 () Bool)

(assert (=> b!643571 (=> res!416907 e!368673)))

(assert (=> b!643571 (= res!416907 (or (not (= (select (arr!18422 a!2986) j!136) lt!298072)) (not (= (select (arr!18422 a!2986) j!136) lt!298085))))))

(assert (=> b!643571 e!368670))

(declare-fun res!416900 () Bool)

(assert (=> b!643571 (=> (not res!416900) (not e!368670))))

(assert (=> b!643571 (= res!416900 (= lt!298085 (select (arr!18422 a!2986) j!136)))))

(assert (=> b!643571 (= lt!298085 (select (store (arr!18422 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!416912 () Bool)

(assert (=> start!58310 (=> (not res!416912) (not e!368664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58310 (= res!416912 (validMask!0 mask!3053))))

(assert (=> start!58310 e!368664))

(assert (=> start!58310 true))

(declare-fun array_inv!14305 (array!38418) Bool)

(assert (=> start!58310 (array_inv!14305 a!2986)))

(declare-fun b!643587 () Bool)

(declare-fun lt!298078 () SeekEntryResult!6859)

(assert (=> b!643587 (= e!368666 (= lt!298078 lt!298073))))

(declare-fun b!643588 () Bool)

(assert (=> b!643588 (= e!368671 e!368662)))

(declare-fun res!416905 () Bool)

(assert (=> b!643588 (=> (not res!416905) (not e!368662))))

(assert (=> b!643588 (= res!416905 (and (= lt!298078 (Found!6859 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18422 a!2986) index!984) (select (arr!18422 a!2986) j!136))) (not (= (select (arr!18422 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!643588 (= lt!298078 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18422 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643589 () Bool)

(declare-fun Unit!21787 () Unit!21782)

(assert (=> b!643589 (= e!368675 Unit!21787)))

(declare-fun b!643590 () Bool)

(declare-fun res!416901 () Bool)

(assert (=> b!643590 (=> (not res!416901) (not e!368661))))

(assert (=> b!643590 (= res!416901 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18422 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643591 () Bool)

(declare-fun e!368674 () Bool)

(assert (=> b!643591 (= e!368673 e!368674)))

(declare-fun res!416916 () Bool)

(assert (=> b!643591 (=> res!416916 e!368674)))

(assert (=> b!643591 (= res!416916 (bvsge index!984 j!136))))

(declare-fun lt!298077 () Unit!21782)

(assert (=> b!643591 (= lt!298077 e!368672)))

(declare-fun c!73704 () Bool)

(assert (=> b!643591 (= c!73704 (bvslt j!136 index!984))))

(declare-fun b!643592 () Bool)

(assert (=> b!643592 (= e!368674 true)))

(assert (=> b!643592 e!368669))

(declare-fun res!416908 () Bool)

(assert (=> b!643592 (=> (not res!416908) (not e!368669))))

(assert (=> b!643592 (= res!416908 (arrayContainsKey!0 lt!298084 (select (arr!18422 a!2986) j!136) j!136))))

(declare-fun b!643593 () Bool)

(declare-fun res!416906 () Bool)

(assert (=> b!643593 (=> (not res!416906) (not e!368664))))

(assert (=> b!643593 (= res!416906 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!58310 res!416912) b!643574))

(assert (= (and b!643574 res!416899) b!643578))

(assert (= (and b!643578 res!416902) b!643581))

(assert (= (and b!643581 res!416909) b!643593))

(assert (= (and b!643593 res!416906) b!643576))

(assert (= (and b!643576 res!416915) b!643580))

(assert (= (and b!643580 res!416914) b!643585))

(assert (= (and b!643585 res!416911) b!643590))

(assert (= (and b!643590 res!416901) b!643572))

(assert (= (and b!643572 res!416910) b!643588))

(assert (= (and b!643588 res!416905) b!643582))

(assert (= (and b!643582 res!416904) b!643587))

(assert (= (and b!643582 c!73703) b!643573))

(assert (= (and b!643582 (not c!73703)) b!643589))

(assert (= (and b!643582 (not res!416917)) b!643571))

(assert (= (and b!643571 res!416900) b!643583))

(assert (= (and b!643583 (not res!416903)) b!643579))

(assert (= (and b!643579 res!416913) b!643577))

(assert (= (and b!643571 (not res!416907)) b!643591))

(assert (= (and b!643591 c!73704) b!643575))

(assert (= (and b!643591 (not c!73704)) b!643584))

(assert (= (and b!643591 (not res!416916)) b!643592))

(assert (= (and b!643592 res!416908) b!643586))

(declare-fun m!616767 () Bool)

(assert (=> b!643579 m!616767))

(assert (=> b!643579 m!616767))

(declare-fun m!616769 () Bool)

(assert (=> b!643579 m!616769))

(assert (=> b!643575 m!616767))

(assert (=> b!643575 m!616767))

(declare-fun m!616771 () Bool)

(assert (=> b!643575 m!616771))

(declare-fun m!616773 () Bool)

(assert (=> b!643575 m!616773))

(assert (=> b!643575 m!616767))

(declare-fun m!616775 () Bool)

(assert (=> b!643575 m!616775))

(declare-fun m!616777 () Bool)

(assert (=> b!643575 m!616777))

(assert (=> b!643575 m!616767))

(declare-fun m!616779 () Bool)

(assert (=> b!643575 m!616779))

(declare-fun m!616781 () Bool)

(assert (=> b!643575 m!616781))

(declare-fun m!616783 () Bool)

(assert (=> b!643575 m!616783))

(assert (=> b!643571 m!616767))

(declare-fun m!616785 () Bool)

(assert (=> b!643571 m!616785))

(declare-fun m!616787 () Bool)

(assert (=> b!643571 m!616787))

(declare-fun m!616789 () Bool)

(assert (=> b!643576 m!616789))

(assert (=> b!643572 m!616785))

(declare-fun m!616791 () Bool)

(assert (=> b!643572 m!616791))

(declare-fun m!616793 () Bool)

(assert (=> start!58310 m!616793))

(declare-fun m!616795 () Bool)

(assert (=> start!58310 m!616795))

(declare-fun m!616797 () Bool)

(assert (=> b!643590 m!616797))

(declare-fun m!616799 () Bool)

(assert (=> b!643580 m!616799))

(declare-fun m!616801 () Bool)

(assert (=> b!643581 m!616801))

(declare-fun m!616803 () Bool)

(assert (=> b!643585 m!616803))

(assert (=> b!643583 m!616767))

(assert (=> b!643586 m!616767))

(assert (=> b!643586 m!616767))

(declare-fun m!616805 () Bool)

(assert (=> b!643586 m!616805))

(declare-fun m!616807 () Bool)

(assert (=> b!643588 m!616807))

(assert (=> b!643588 m!616767))

(assert (=> b!643588 m!616767))

(declare-fun m!616809 () Bool)

(assert (=> b!643588 m!616809))

(declare-fun m!616811 () Bool)

(assert (=> b!643593 m!616811))

(declare-fun m!616813 () Bool)

(assert (=> b!643582 m!616813))

(declare-fun m!616815 () Bool)

(assert (=> b!643582 m!616815))

(assert (=> b!643582 m!616767))

(assert (=> b!643582 m!616785))

(declare-fun m!616817 () Bool)

(assert (=> b!643582 m!616817))

(declare-fun m!616819 () Bool)

(assert (=> b!643582 m!616819))

(assert (=> b!643582 m!616767))

(declare-fun m!616821 () Bool)

(assert (=> b!643582 m!616821))

(declare-fun m!616823 () Bool)

(assert (=> b!643582 m!616823))

(assert (=> b!643577 m!616767))

(assert (=> b!643577 m!616767))

(assert (=> b!643577 m!616805))

(assert (=> b!643578 m!616767))

(assert (=> b!643578 m!616767))

(declare-fun m!616825 () Bool)

(assert (=> b!643578 m!616825))

(assert (=> b!643592 m!616767))

(assert (=> b!643592 m!616767))

(assert (=> b!643592 m!616769))

(check-sat (not b!643581) (not b!643588) (not b!643593) (not b!643582) (not b!643586) (not b!643575) (not b!643578) (not b!643592) (not b!643579) (not start!58310) (not b!643585) (not b!643580) (not b!643576) (not b!643577))
(check-sat)
