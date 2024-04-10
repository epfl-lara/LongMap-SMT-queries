; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32386 () Bool)

(assert start!32386)

(declare-fun b!322868 () Bool)

(declare-datatypes ((Unit!9920 0))(
  ( (Unit!9921) )
))
(declare-fun e!199720 () Unit!9920)

(declare-fun Unit!9922 () Unit!9920)

(assert (=> b!322868 (= e!199720 Unit!9922)))

(declare-fun b!322869 () Bool)

(declare-fun res!176628 () Bool)

(declare-fun e!199721 () Bool)

(assert (=> b!322869 (=> (not res!176628) (not e!199721))))

(declare-datatypes ((array!16525 0))(
  ( (array!16526 (arr!7820 (Array (_ BitVec 32) (_ BitVec 64))) (size!8172 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16525)

(declare-datatypes ((SeekEntryResult!2951 0))(
  ( (MissingZero!2951 (index!13980 (_ BitVec 32))) (Found!2951 (index!13981 (_ BitVec 32))) (Intermediate!2951 (undefined!3763 Bool) (index!13982 (_ BitVec 32)) (x!32243 (_ BitVec 32))) (Undefined!2951) (MissingVacant!2951 (index!13983 (_ BitVec 32))) )
))
(declare-fun lt!156530 () SeekEntryResult!2951)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16525 (_ BitVec 32)) SeekEntryResult!2951)

(assert (=> b!322869 (= res!176628 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156530))))

(declare-fun b!322870 () Bool)

(declare-fun res!176627 () Bool)

(declare-fun e!199719 () Bool)

(assert (=> b!322870 (=> (not res!176627) (not e!199719))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16525 (_ BitVec 32)) SeekEntryResult!2951)

(assert (=> b!322870 (= res!176627 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2951 i!1250)))))

(declare-fun b!322871 () Bool)

(declare-fun res!176622 () Bool)

(assert (=> b!322871 (=> (not res!176622) (not e!199719))))

(assert (=> b!322871 (= res!176622 (and (= (size!8172 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8172 a!3305))))))

(declare-fun res!176623 () Bool)

(assert (=> start!32386 (=> (not res!176623) (not e!199719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32386 (= res!176623 (validMask!0 mask!3777))))

(assert (=> start!32386 e!199719))

(declare-fun array_inv!5783 (array!16525) Bool)

(assert (=> start!32386 (array_inv!5783 a!3305)))

(assert (=> start!32386 true))

(declare-fun b!322872 () Bool)

(assert (=> b!322872 (= e!199721 (not (or (not (= (select (arr!7820 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322872 (= index!1840 resIndex!58)))

(declare-fun lt!156531 () Unit!9920)

(assert (=> b!322872 (= lt!156531 e!199720)))

(declare-fun c!50754 () Bool)

(assert (=> b!322872 (= c!50754 (not (= resIndex!58 index!1840)))))

(declare-fun b!322873 () Bool)

(declare-fun e!199718 () Unit!9920)

(declare-fun Unit!9923 () Unit!9920)

(assert (=> b!322873 (= e!199718 Unit!9923)))

(assert (=> b!322873 false))

(declare-fun b!322874 () Bool)

(declare-fun res!176625 () Bool)

(assert (=> b!322874 (=> (not res!176625) (not e!199719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16525 (_ BitVec 32)) Bool)

(assert (=> b!322874 (= res!176625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322875 () Bool)

(declare-fun res!176626 () Bool)

(assert (=> b!322875 (=> (not res!176626) (not e!199719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322875 (= res!176626 (validKeyInArray!0 k!2497))))

(declare-fun b!322876 () Bool)

(declare-fun res!176619 () Bool)

(assert (=> b!322876 (=> (not res!176619) (not e!199721))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322876 (= res!176619 (and (= (select (arr!7820 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8172 a!3305))))))

(declare-fun b!322877 () Bool)

(declare-fun Unit!9924 () Unit!9920)

(assert (=> b!322877 (= e!199718 Unit!9924)))

(declare-fun b!322878 () Bool)

(declare-fun e!199722 () Unit!9920)

(assert (=> b!322878 (= e!199720 e!199722)))

(declare-fun c!50753 () Bool)

(assert (=> b!322878 (= c!50753 (or (= (select (arr!7820 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7820 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322879 () Bool)

(assert (=> b!322879 false))

(declare-fun lt!156529 () Unit!9920)

(assert (=> b!322879 (= lt!156529 e!199718)))

(declare-fun c!50752 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322879 (= c!50752 (is-Intermediate!2951 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!9925 () Unit!9920)

(assert (=> b!322879 (= e!199722 Unit!9925)))

(declare-fun b!322880 () Bool)

(assert (=> b!322880 (= e!199719 e!199721)))

(declare-fun res!176621 () Bool)

(assert (=> b!322880 (=> (not res!176621) (not e!199721))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322880 (= res!176621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156530))))

(assert (=> b!322880 (= lt!156530 (Intermediate!2951 false resIndex!58 resX!58))))

(declare-fun b!322881 () Bool)

(declare-fun res!176620 () Bool)

(assert (=> b!322881 (=> (not res!176620) (not e!199721))))

(assert (=> b!322881 (= res!176620 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7820 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322882 () Bool)

(declare-fun res!176624 () Bool)

(assert (=> b!322882 (=> (not res!176624) (not e!199719))))

(declare-fun arrayContainsKey!0 (array!16525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322882 (= res!176624 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322883 () Bool)

(assert (=> b!322883 false))

(declare-fun Unit!9926 () Unit!9920)

(assert (=> b!322883 (= e!199722 Unit!9926)))

(assert (= (and start!32386 res!176623) b!322871))

(assert (= (and b!322871 res!176622) b!322875))

(assert (= (and b!322875 res!176626) b!322882))

(assert (= (and b!322882 res!176624) b!322870))

(assert (= (and b!322870 res!176627) b!322874))

(assert (= (and b!322874 res!176625) b!322880))

(assert (= (and b!322880 res!176621) b!322876))

(assert (= (and b!322876 res!176619) b!322869))

(assert (= (and b!322869 res!176628) b!322881))

(assert (= (and b!322881 res!176620) b!322872))

(assert (= (and b!322872 c!50754) b!322878))

(assert (= (and b!322872 (not c!50754)) b!322868))

(assert (= (and b!322878 c!50753) b!322883))

(assert (= (and b!322878 (not c!50753)) b!322879))

(assert (= (and b!322879 c!50752) b!322877))

(assert (= (and b!322879 (not c!50752)) b!322873))

(declare-fun m!330509 () Bool)

(assert (=> b!322880 m!330509))

(assert (=> b!322880 m!330509))

(declare-fun m!330511 () Bool)

(assert (=> b!322880 m!330511))

(declare-fun m!330513 () Bool)

(assert (=> b!322878 m!330513))

(assert (=> b!322881 m!330513))

(declare-fun m!330515 () Bool)

(assert (=> b!322870 m!330515))

(declare-fun m!330517 () Bool)

(assert (=> start!32386 m!330517))

(declare-fun m!330519 () Bool)

(assert (=> start!32386 m!330519))

(declare-fun m!330521 () Bool)

(assert (=> b!322876 m!330521))

(declare-fun m!330523 () Bool)

(assert (=> b!322875 m!330523))

(declare-fun m!330525 () Bool)

(assert (=> b!322869 m!330525))

(declare-fun m!330527 () Bool)

(assert (=> b!322882 m!330527))

(assert (=> b!322872 m!330513))

(declare-fun m!330529 () Bool)

(assert (=> b!322879 m!330529))

(assert (=> b!322879 m!330529))

(declare-fun m!330531 () Bool)

(assert (=> b!322879 m!330531))

(declare-fun m!330533 () Bool)

(assert (=> b!322874 m!330533))

(push 1)

