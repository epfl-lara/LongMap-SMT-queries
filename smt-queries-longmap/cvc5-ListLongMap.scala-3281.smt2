; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45630 () Bool)

(assert start!45630)

(declare-fun b!502993 () Bool)

(declare-fun res!304346 () Bool)

(declare-fun e!294592 () Bool)

(assert (=> b!502993 (=> (not res!304346) (not e!294592))))

(declare-datatypes ((array!32386 0))(
  ( (array!32387 (arr!15573 (Array (_ BitVec 32) (_ BitVec 64))) (size!15937 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32386)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32386 (_ BitVec 32)) Bool)

(assert (=> b!502993 (= res!304346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502994 () Bool)

(declare-fun res!304350 () Bool)

(declare-fun e!294593 () Bool)

(assert (=> b!502994 (=> res!304350 e!294593)))

(declare-datatypes ((SeekEntryResult!4040 0))(
  ( (MissingZero!4040 (index!18348 (_ BitVec 32))) (Found!4040 (index!18349 (_ BitVec 32))) (Intermediate!4040 (undefined!4852 Bool) (index!18350 (_ BitVec 32)) (x!47377 (_ BitVec 32))) (Undefined!4040) (MissingVacant!4040 (index!18351 (_ BitVec 32))) )
))
(declare-fun lt!228739 () SeekEntryResult!4040)

(assert (=> b!502994 (= res!304350 (or (undefined!4852 lt!228739) (not (is-Intermediate!4040 lt!228739))))))

(declare-fun b!502995 () Bool)

(declare-datatypes ((Unit!15236 0))(
  ( (Unit!15237) )
))
(declare-fun e!294590 () Unit!15236)

(declare-fun Unit!15238 () Unit!15236)

(assert (=> b!502995 (= e!294590 Unit!15238)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!228740 () Unit!15236)

(declare-fun lt!228744 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32386 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15236)

(assert (=> b!502995 (= lt!228740 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228744 #b00000000000000000000000000000000 (index!18350 lt!228739) (x!47377 lt!228739) mask!3524))))

(declare-fun lt!228742 () array!32386)

(declare-fun lt!228741 () (_ BitVec 64))

(declare-fun res!304353 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32386 (_ BitVec 32)) SeekEntryResult!4040)

(assert (=> b!502995 (= res!304353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228744 lt!228741 lt!228742 mask!3524) (Intermediate!4040 false (index!18350 lt!228739) (x!47377 lt!228739))))))

(declare-fun e!294589 () Bool)

(assert (=> b!502995 (=> (not res!304353) (not e!294589))))

(assert (=> b!502995 e!294589))

(declare-fun b!502996 () Bool)

(declare-fun res!304348 () Bool)

(declare-fun e!294587 () Bool)

(assert (=> b!502996 (=> (not res!304348) (not e!294587))))

(declare-fun arrayContainsKey!0 (array!32386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502996 (= res!304348 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502997 () Bool)

(declare-fun Unit!15239 () Unit!15236)

(assert (=> b!502997 (= e!294590 Unit!15239)))

(declare-fun b!502998 () Bool)

(declare-fun res!304347 () Bool)

(declare-fun e!294594 () Bool)

(assert (=> b!502998 (=> res!304347 e!294594)))

(declare-fun e!294586 () Bool)

(assert (=> b!502998 (= res!304347 e!294586)))

(declare-fun res!304357 () Bool)

(assert (=> b!502998 (=> (not res!304357) (not e!294586))))

(assert (=> b!502998 (= res!304357 (bvsgt #b00000000000000000000000000000000 (x!47377 lt!228739)))))

(declare-fun e!294588 () Bool)

(declare-fun b!502999 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32386 (_ BitVec 32)) SeekEntryResult!4040)

(assert (=> b!502999 (= e!294588 (= (seekEntryOrOpen!0 (select (arr!15573 a!3235) j!176) a!3235 mask!3524) (Found!4040 j!176)))))

(declare-fun b!503000 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32386 (_ BitVec 32)) SeekEntryResult!4040)

(assert (=> b!503000 (= e!294586 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228744 (index!18350 lt!228739) (select (arr!15573 a!3235) j!176) a!3235 mask!3524) (Found!4040 j!176))))))

(declare-fun b!503001 () Bool)

(declare-fun res!304355 () Bool)

(assert (=> b!503001 (=> (not res!304355) (not e!294592))))

(declare-datatypes ((List!9731 0))(
  ( (Nil!9728) (Cons!9727 (h!10604 (_ BitVec 64)) (t!15959 List!9731)) )
))
(declare-fun arrayNoDuplicates!0 (array!32386 (_ BitVec 32) List!9731) Bool)

(assert (=> b!503001 (= res!304355 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9728))))

(declare-fun b!503002 () Bool)

(declare-fun res!304354 () Bool)

(assert (=> b!503002 (=> (not res!304354) (not e!294587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503002 (= res!304354 (validKeyInArray!0 k!2280))))

(declare-fun res!304351 () Bool)

(assert (=> start!45630 (=> (not res!304351) (not e!294587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45630 (= res!304351 (validMask!0 mask!3524))))

(assert (=> start!45630 e!294587))

(assert (=> start!45630 true))

(declare-fun array_inv!11369 (array!32386) Bool)

(assert (=> start!45630 (array_inv!11369 a!3235)))

(declare-fun b!503003 () Bool)

(assert (=> b!503003 (= e!294593 e!294594)))

(declare-fun res!304356 () Bool)

(assert (=> b!503003 (=> res!304356 e!294594)))

(assert (=> b!503003 (= res!304356 (or (bvsgt (x!47377 lt!228739) #b01111111111111111111111111111110) (bvslt lt!228744 #b00000000000000000000000000000000) (bvsge lt!228744 (size!15937 a!3235)) (bvslt (index!18350 lt!228739) #b00000000000000000000000000000000) (bvsge (index!18350 lt!228739) (size!15937 a!3235)) (not (= lt!228739 (Intermediate!4040 false (index!18350 lt!228739) (x!47377 lt!228739))))))))

(assert (=> b!503003 (= (index!18350 lt!228739) i!1204)))

(declare-fun lt!228735 () Unit!15236)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32386 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15236)

(assert (=> b!503003 (= lt!228735 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228744 #b00000000000000000000000000000000 (index!18350 lt!228739) (x!47377 lt!228739) mask!3524))))

(assert (=> b!503003 (and (or (= (select (arr!15573 a!3235) (index!18350 lt!228739)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15573 a!3235) (index!18350 lt!228739)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15573 a!3235) (index!18350 lt!228739)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15573 a!3235) (index!18350 lt!228739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228736 () Unit!15236)

(assert (=> b!503003 (= lt!228736 e!294590)))

(declare-fun c!59603 () Bool)

(assert (=> b!503003 (= c!59603 (= (select (arr!15573 a!3235) (index!18350 lt!228739)) (select (arr!15573 a!3235) j!176)))))

(assert (=> b!503003 (and (bvslt (x!47377 lt!228739) #b01111111111111111111111111111110) (or (= (select (arr!15573 a!3235) (index!18350 lt!228739)) (select (arr!15573 a!3235) j!176)) (= (select (arr!15573 a!3235) (index!18350 lt!228739)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15573 a!3235) (index!18350 lt!228739)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503004 () Bool)

(declare-fun res!304358 () Bool)

(assert (=> b!503004 (=> (not res!304358) (not e!294587))))

(assert (=> b!503004 (= res!304358 (and (= (size!15937 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15937 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15937 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503005 () Bool)

(assert (=> b!503005 (= e!294592 (not e!294593))))

(declare-fun res!304352 () Bool)

(assert (=> b!503005 (=> res!304352 e!294593)))

(declare-fun lt!228745 () (_ BitVec 32))

(assert (=> b!503005 (= res!304352 (= lt!228739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228745 lt!228741 lt!228742 mask!3524)))))

(assert (=> b!503005 (= lt!228739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228744 (select (arr!15573 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503005 (= lt!228745 (toIndex!0 lt!228741 mask!3524))))

(assert (=> b!503005 (= lt!228741 (select (store (arr!15573 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503005 (= lt!228744 (toIndex!0 (select (arr!15573 a!3235) j!176) mask!3524))))

(assert (=> b!503005 (= lt!228742 (array!32387 (store (arr!15573 a!3235) i!1204 k!2280) (size!15937 a!3235)))))

(assert (=> b!503005 e!294588))

(declare-fun res!304345 () Bool)

(assert (=> b!503005 (=> (not res!304345) (not e!294588))))

(assert (=> b!503005 (= res!304345 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228738 () Unit!15236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15236)

(assert (=> b!503005 (= lt!228738 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503006 () Bool)

(declare-fun res!304344 () Bool)

(assert (=> b!503006 (=> (not res!304344) (not e!294587))))

(assert (=> b!503006 (= res!304344 (validKeyInArray!0 (select (arr!15573 a!3235) j!176)))))

(declare-fun b!503007 () Bool)

(assert (=> b!503007 (= e!294587 e!294592)))

(declare-fun res!304349 () Bool)

(assert (=> b!503007 (=> (not res!304349) (not e!294592))))

(declare-fun lt!228737 () SeekEntryResult!4040)

(assert (=> b!503007 (= res!304349 (or (= lt!228737 (MissingZero!4040 i!1204)) (= lt!228737 (MissingVacant!4040 i!1204))))))

(assert (=> b!503007 (= lt!228737 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503008 () Bool)

(assert (=> b!503008 (= e!294594 true)))

(declare-fun lt!228743 () SeekEntryResult!4040)

(assert (=> b!503008 (= lt!228743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228744 lt!228741 lt!228742 mask!3524))))

(declare-fun b!503009 () Bool)

(assert (=> b!503009 (= e!294589 false)))

(assert (= (and start!45630 res!304351) b!503004))

(assert (= (and b!503004 res!304358) b!503006))

(assert (= (and b!503006 res!304344) b!503002))

(assert (= (and b!503002 res!304354) b!502996))

(assert (= (and b!502996 res!304348) b!503007))

(assert (= (and b!503007 res!304349) b!502993))

(assert (= (and b!502993 res!304346) b!503001))

(assert (= (and b!503001 res!304355) b!503005))

(assert (= (and b!503005 res!304345) b!502999))

(assert (= (and b!503005 (not res!304352)) b!502994))

(assert (= (and b!502994 (not res!304350)) b!503003))

(assert (= (and b!503003 c!59603) b!502995))

(assert (= (and b!503003 (not c!59603)) b!502997))

(assert (= (and b!502995 res!304353) b!503009))

(assert (= (and b!503003 (not res!304356)) b!502998))

(assert (= (and b!502998 res!304357) b!503000))

(assert (= (and b!502998 (not res!304347)) b!503008))

(declare-fun m!483873 () Bool)

(assert (=> start!45630 m!483873))

(declare-fun m!483875 () Bool)

(assert (=> start!45630 m!483875))

(declare-fun m!483877 () Bool)

(assert (=> b!503000 m!483877))

(assert (=> b!503000 m!483877))

(declare-fun m!483879 () Bool)

(assert (=> b!503000 m!483879))

(declare-fun m!483881 () Bool)

(assert (=> b!503008 m!483881))

(declare-fun m!483883 () Bool)

(assert (=> b!503005 m!483883))

(declare-fun m!483885 () Bool)

(assert (=> b!503005 m!483885))

(assert (=> b!503005 m!483877))

(declare-fun m!483887 () Bool)

(assert (=> b!503005 m!483887))

(assert (=> b!503005 m!483877))

(declare-fun m!483889 () Bool)

(assert (=> b!503005 m!483889))

(declare-fun m!483891 () Bool)

(assert (=> b!503005 m!483891))

(assert (=> b!503005 m!483877))

(declare-fun m!483893 () Bool)

(assert (=> b!503005 m!483893))

(declare-fun m!483895 () Bool)

(assert (=> b!503005 m!483895))

(declare-fun m!483897 () Bool)

(assert (=> b!503005 m!483897))

(declare-fun m!483899 () Bool)

(assert (=> b!503003 m!483899))

(declare-fun m!483901 () Bool)

(assert (=> b!503003 m!483901))

(assert (=> b!503003 m!483877))

(declare-fun m!483903 () Bool)

(assert (=> b!503007 m!483903))

(declare-fun m!483905 () Bool)

(assert (=> b!503002 m!483905))

(declare-fun m!483907 () Bool)

(assert (=> b!503001 m!483907))

(declare-fun m!483909 () Bool)

(assert (=> b!502995 m!483909))

(assert (=> b!502995 m!483881))

(assert (=> b!502999 m!483877))

(assert (=> b!502999 m!483877))

(declare-fun m!483911 () Bool)

(assert (=> b!502999 m!483911))

(declare-fun m!483913 () Bool)

(assert (=> b!502996 m!483913))

(assert (=> b!503006 m!483877))

(assert (=> b!503006 m!483877))

(declare-fun m!483915 () Bool)

(assert (=> b!503006 m!483915))

(declare-fun m!483917 () Bool)

(assert (=> b!502993 m!483917))

(push 1)

