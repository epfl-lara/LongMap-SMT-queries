; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45374 () Bool)

(assert start!45374)

(declare-fun b!498542 () Bool)

(declare-fun res!300677 () Bool)

(declare-fun e!292188 () Bool)

(assert (=> b!498542 (=> (not res!300677) (not e!292188))))

(declare-datatypes ((array!32200 0))(
  ( (array!32201 (arr!15481 (Array (_ BitVec 32) (_ BitVec 64))) (size!15845 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32200)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32200 (_ BitVec 32)) Bool)

(assert (=> b!498542 (= res!300677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!300678 () Bool)

(declare-fun e!292185 () Bool)

(assert (=> start!45374 (=> (not res!300678) (not e!292185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45374 (= res!300678 (validMask!0 mask!3524))))

(assert (=> start!45374 e!292185))

(assert (=> start!45374 true))

(declare-fun array_inv!11340 (array!32200) Bool)

(assert (=> start!45374 (array_inv!11340 a!3235)))

(declare-fun b!498543 () Bool)

(assert (=> b!498543 (= e!292185 e!292188)))

(declare-fun res!300671 () Bool)

(assert (=> b!498543 (=> (not res!300671) (not e!292188))))

(declare-datatypes ((SeekEntryResult!3904 0))(
  ( (MissingZero!3904 (index!17798 (_ BitVec 32))) (Found!3904 (index!17799 (_ BitVec 32))) (Intermediate!3904 (undefined!4716 Bool) (index!17800 (_ BitVec 32)) (x!46994 (_ BitVec 32))) (Undefined!3904) (MissingVacant!3904 (index!17801 (_ BitVec 32))) )
))
(declare-fun lt!225902 () SeekEntryResult!3904)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498543 (= res!300671 (or (= lt!225902 (MissingZero!3904 i!1204)) (= lt!225902 (MissingVacant!3904 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32200 (_ BitVec 32)) SeekEntryResult!3904)

(assert (=> b!498543 (= lt!225902 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498544 () Bool)

(declare-fun e!292184 () Bool)

(assert (=> b!498544 (= e!292184 true)))

(declare-fun lt!225903 () (_ BitVec 64))

(declare-fun lt!225910 () (_ BitVec 32))

(declare-fun lt!225908 () SeekEntryResult!3904)

(declare-fun lt!225906 () array!32200)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32200 (_ BitVec 32)) SeekEntryResult!3904)

(assert (=> b!498544 (= lt!225908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225910 lt!225903 lt!225906 mask!3524))))

(declare-fun b!498545 () Bool)

(declare-fun res!300672 () Bool)

(assert (=> b!498545 (=> (not res!300672) (not e!292185))))

(declare-fun arrayContainsKey!0 (array!32200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498545 (= res!300672 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498546 () Bool)

(declare-fun res!300670 () Bool)

(assert (=> b!498546 (=> (not res!300670) (not e!292185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498546 (= res!300670 (validKeyInArray!0 k0!2280))))

(declare-fun b!498547 () Bool)

(declare-datatypes ((Unit!14851 0))(
  ( (Unit!14852) )
))
(declare-fun e!292187 () Unit!14851)

(declare-fun Unit!14853 () Unit!14851)

(assert (=> b!498547 (= e!292187 Unit!14853)))

(declare-fun b!498548 () Bool)

(declare-fun e!292190 () Bool)

(assert (=> b!498548 (= e!292190 false)))

(declare-fun b!498549 () Bool)

(declare-fun res!300681 () Bool)

(assert (=> b!498549 (=> (not res!300681) (not e!292188))))

(declare-datatypes ((List!9546 0))(
  ( (Nil!9543) (Cons!9542 (h!10416 (_ BitVec 64)) (t!15766 List!9546)) )
))
(declare-fun arrayNoDuplicates!0 (array!32200 (_ BitVec 32) List!9546) Bool)

(assert (=> b!498549 (= res!300681 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9543))))

(declare-fun b!498550 () Bool)

(declare-fun res!300675 () Bool)

(declare-fun e!292189 () Bool)

(assert (=> b!498550 (=> res!300675 e!292189)))

(declare-fun lt!225909 () SeekEntryResult!3904)

(get-info :version)

(assert (=> b!498550 (= res!300675 (or (undefined!4716 lt!225909) (not ((_ is Intermediate!3904) lt!225909))))))

(declare-fun b!498551 () Bool)

(declare-fun res!300673 () Bool)

(assert (=> b!498551 (=> (not res!300673) (not e!292185))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498551 (= res!300673 (and (= (size!15845 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15845 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15845 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!292186 () Bool)

(declare-fun b!498552 () Bool)

(assert (=> b!498552 (= e!292186 (= (seekEntryOrOpen!0 (select (arr!15481 a!3235) j!176) a!3235 mask!3524) (Found!3904 j!176)))))

(declare-fun b!498553 () Bool)

(assert (=> b!498553 (= e!292189 e!292184)))

(declare-fun res!300682 () Bool)

(assert (=> b!498553 (=> res!300682 e!292184)))

(assert (=> b!498553 (= res!300682 (or (bvsgt #b00000000000000000000000000000000 (x!46994 lt!225909)) (bvsgt (x!46994 lt!225909) #b01111111111111111111111111111110) (bvslt lt!225910 #b00000000000000000000000000000000) (bvsge lt!225910 (size!15845 a!3235)) (bvslt (index!17800 lt!225909) #b00000000000000000000000000000000) (bvsge (index!17800 lt!225909) (size!15845 a!3235)) (not (= lt!225909 (Intermediate!3904 false (index!17800 lt!225909) (x!46994 lt!225909))))))))

(assert (=> b!498553 (and (or (= (select (arr!15481 a!3235) (index!17800 lt!225909)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15481 a!3235) (index!17800 lt!225909)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15481 a!3235) (index!17800 lt!225909)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15481 a!3235) (index!17800 lt!225909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225904 () Unit!14851)

(assert (=> b!498553 (= lt!225904 e!292187)))

(declare-fun c!59213 () Bool)

(assert (=> b!498553 (= c!59213 (= (select (arr!15481 a!3235) (index!17800 lt!225909)) (select (arr!15481 a!3235) j!176)))))

(assert (=> b!498553 (and (bvslt (x!46994 lt!225909) #b01111111111111111111111111111110) (or (= (select (arr!15481 a!3235) (index!17800 lt!225909)) (select (arr!15481 a!3235) j!176)) (= (select (arr!15481 a!3235) (index!17800 lt!225909)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15481 a!3235) (index!17800 lt!225909)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498554 () Bool)

(assert (=> b!498554 (= e!292188 (not e!292189))))

(declare-fun res!300679 () Bool)

(assert (=> b!498554 (=> res!300679 e!292189)))

(declare-fun lt!225901 () (_ BitVec 32))

(assert (=> b!498554 (= res!300679 (= lt!225909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225901 lt!225903 lt!225906 mask!3524)))))

(assert (=> b!498554 (= lt!225909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225910 (select (arr!15481 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498554 (= lt!225901 (toIndex!0 lt!225903 mask!3524))))

(assert (=> b!498554 (= lt!225903 (select (store (arr!15481 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498554 (= lt!225910 (toIndex!0 (select (arr!15481 a!3235) j!176) mask!3524))))

(assert (=> b!498554 (= lt!225906 (array!32201 (store (arr!15481 a!3235) i!1204 k0!2280) (size!15845 a!3235)))))

(assert (=> b!498554 e!292186))

(declare-fun res!300680 () Bool)

(assert (=> b!498554 (=> (not res!300680) (not e!292186))))

(assert (=> b!498554 (= res!300680 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225907 () Unit!14851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14851)

(assert (=> b!498554 (= lt!225907 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498555 () Bool)

(declare-fun res!300676 () Bool)

(assert (=> b!498555 (=> (not res!300676) (not e!292185))))

(assert (=> b!498555 (= res!300676 (validKeyInArray!0 (select (arr!15481 a!3235) j!176)))))

(declare-fun b!498556 () Bool)

(declare-fun Unit!14854 () Unit!14851)

(assert (=> b!498556 (= e!292187 Unit!14854)))

(declare-fun lt!225905 () Unit!14851)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32200 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14851)

(assert (=> b!498556 (= lt!225905 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225910 #b00000000000000000000000000000000 (index!17800 lt!225909) (x!46994 lt!225909) mask!3524))))

(declare-fun res!300674 () Bool)

(assert (=> b!498556 (= res!300674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225910 lt!225903 lt!225906 mask!3524) (Intermediate!3904 false (index!17800 lt!225909) (x!46994 lt!225909))))))

(assert (=> b!498556 (=> (not res!300674) (not e!292190))))

(assert (=> b!498556 e!292190))

(assert (= (and start!45374 res!300678) b!498551))

(assert (= (and b!498551 res!300673) b!498555))

(assert (= (and b!498555 res!300676) b!498546))

(assert (= (and b!498546 res!300670) b!498545))

(assert (= (and b!498545 res!300672) b!498543))

(assert (= (and b!498543 res!300671) b!498542))

(assert (= (and b!498542 res!300677) b!498549))

(assert (= (and b!498549 res!300681) b!498554))

(assert (= (and b!498554 res!300680) b!498552))

(assert (= (and b!498554 (not res!300679)) b!498550))

(assert (= (and b!498550 (not res!300675)) b!498553))

(assert (= (and b!498553 c!59213) b!498556))

(assert (= (and b!498553 (not c!59213)) b!498547))

(assert (= (and b!498556 res!300674) b!498548))

(assert (= (and b!498553 (not res!300682)) b!498544))

(declare-fun m!480043 () Bool)

(assert (=> b!498556 m!480043))

(declare-fun m!480045 () Bool)

(assert (=> b!498556 m!480045))

(declare-fun m!480047 () Bool)

(assert (=> b!498553 m!480047))

(declare-fun m!480049 () Bool)

(assert (=> b!498553 m!480049))

(assert (=> b!498555 m!480049))

(assert (=> b!498555 m!480049))

(declare-fun m!480051 () Bool)

(assert (=> b!498555 m!480051))

(declare-fun m!480053 () Bool)

(assert (=> b!498543 m!480053))

(assert (=> b!498544 m!480045))

(assert (=> b!498554 m!480049))

(declare-fun m!480055 () Bool)

(assert (=> b!498554 m!480055))

(declare-fun m!480057 () Bool)

(assert (=> b!498554 m!480057))

(declare-fun m!480059 () Bool)

(assert (=> b!498554 m!480059))

(declare-fun m!480061 () Bool)

(assert (=> b!498554 m!480061))

(assert (=> b!498554 m!480049))

(declare-fun m!480063 () Bool)

(assert (=> b!498554 m!480063))

(declare-fun m!480065 () Bool)

(assert (=> b!498554 m!480065))

(assert (=> b!498554 m!480049))

(declare-fun m!480067 () Bool)

(assert (=> b!498554 m!480067))

(declare-fun m!480069 () Bool)

(assert (=> b!498554 m!480069))

(assert (=> b!498552 m!480049))

(assert (=> b!498552 m!480049))

(declare-fun m!480071 () Bool)

(assert (=> b!498552 m!480071))

(declare-fun m!480073 () Bool)

(assert (=> b!498546 m!480073))

(declare-fun m!480075 () Bool)

(assert (=> b!498542 m!480075))

(declare-fun m!480077 () Bool)

(assert (=> start!45374 m!480077))

(declare-fun m!480079 () Bool)

(assert (=> start!45374 m!480079))

(declare-fun m!480081 () Bool)

(assert (=> b!498545 m!480081))

(declare-fun m!480083 () Bool)

(assert (=> b!498549 m!480083))

(check-sat (not b!498544) (not b!498552) (not b!498542) (not b!498545) (not start!45374) (not b!498543) (not b!498549) (not b!498546) (not b!498554) (not b!498556) (not b!498555))
(check-sat)
