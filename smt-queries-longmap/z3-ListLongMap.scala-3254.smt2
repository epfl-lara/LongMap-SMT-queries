; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45384 () Bool)

(assert start!45384)

(declare-fun b!498602 () Bool)

(declare-fun res!300786 () Bool)

(declare-fun e!292199 () Bool)

(assert (=> b!498602 (=> (not res!300786) (not e!292199))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32219 0))(
  ( (array!32220 (arr!15491 (Array (_ BitVec 32) (_ BitVec 64))) (size!15856 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32219)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498602 (= res!300786 (and (= (size!15856 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15856 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15856 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498603 () Bool)

(declare-fun e!292197 () Bool)

(assert (=> b!498603 (= e!292197 true)))

(declare-fun lt!225838 () (_ BitVec 64))

(declare-fun lt!225843 () (_ BitVec 32))

(declare-fun lt!225839 () array!32219)

(declare-datatypes ((SeekEntryResult!3955 0))(
  ( (MissingZero!3955 (index!18002 (_ BitVec 32))) (Found!3955 (index!18003 (_ BitVec 32))) (Intermediate!3955 (undefined!4767 Bool) (index!18004 (_ BitVec 32)) (x!47059 (_ BitVec 32))) (Undefined!3955) (MissingVacant!3955 (index!18005 (_ BitVec 32))) )
))
(declare-fun lt!225837 () SeekEntryResult!3955)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32219 (_ BitVec 32)) SeekEntryResult!3955)

(assert (=> b!498603 (= lt!225837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225843 lt!225838 lt!225839 mask!3524))))

(declare-fun b!498604 () Bool)

(declare-fun res!300791 () Bool)

(declare-fun e!292200 () Bool)

(assert (=> b!498604 (=> res!300791 e!292200)))

(declare-fun lt!225835 () SeekEntryResult!3955)

(get-info :version)

(assert (=> b!498604 (= res!300791 (or (undefined!4767 lt!225835) (not ((_ is Intermediate!3955) lt!225835))))))

(declare-fun b!498605 () Bool)

(declare-fun res!300793 () Bool)

(assert (=> b!498605 (=> (not res!300793) (not e!292199))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498605 (= res!300793 (validKeyInArray!0 k0!2280))))

(declare-fun b!498606 () Bool)

(declare-fun res!300794 () Bool)

(declare-fun e!292193 () Bool)

(assert (=> b!498606 (=> (not res!300794) (not e!292193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32219 (_ BitVec 32)) Bool)

(assert (=> b!498606 (= res!300794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498607 () Bool)

(declare-datatypes ((Unit!14890 0))(
  ( (Unit!14891) )
))
(declare-fun e!292198 () Unit!14890)

(declare-fun Unit!14892 () Unit!14890)

(assert (=> b!498607 (= e!292198 Unit!14892)))

(declare-fun lt!225840 () Unit!14890)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32219 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14890)

(assert (=> b!498607 (= lt!225840 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225843 #b00000000000000000000000000000000 (index!18004 lt!225835) (x!47059 lt!225835) mask!3524))))

(declare-fun res!300790 () Bool)

(assert (=> b!498607 (= res!300790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225843 lt!225838 lt!225839 mask!3524) (Intermediate!3955 false (index!18004 lt!225835) (x!47059 lt!225835))))))

(declare-fun e!292194 () Bool)

(assert (=> b!498607 (=> (not res!300790) (not e!292194))))

(assert (=> b!498607 e!292194))

(declare-fun res!300783 () Bool)

(assert (=> start!45384 (=> (not res!300783) (not e!292199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45384 (= res!300783 (validMask!0 mask!3524))))

(assert (=> start!45384 e!292199))

(assert (=> start!45384 true))

(declare-fun array_inv!11374 (array!32219) Bool)

(assert (=> start!45384 (array_inv!11374 a!3235)))

(declare-fun b!498608 () Bool)

(assert (=> b!498608 (= e!292194 false)))

(declare-fun b!498609 () Bool)

(declare-fun Unit!14893 () Unit!14890)

(assert (=> b!498609 (= e!292198 Unit!14893)))

(declare-fun b!498610 () Bool)

(declare-fun res!300785 () Bool)

(assert (=> b!498610 (=> (not res!300785) (not e!292199))))

(assert (=> b!498610 (= res!300785 (validKeyInArray!0 (select (arr!15491 a!3235) j!176)))))

(declare-fun b!498611 () Bool)

(assert (=> b!498611 (= e!292199 e!292193)))

(declare-fun res!300782 () Bool)

(assert (=> b!498611 (=> (not res!300782) (not e!292193))))

(declare-fun lt!225836 () SeekEntryResult!3955)

(assert (=> b!498611 (= res!300782 (or (= lt!225836 (MissingZero!3955 i!1204)) (= lt!225836 (MissingVacant!3955 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32219 (_ BitVec 32)) SeekEntryResult!3955)

(assert (=> b!498611 (= lt!225836 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498612 () Bool)

(assert (=> b!498612 (= e!292193 (not e!292200))))

(declare-fun res!300788 () Bool)

(assert (=> b!498612 (=> res!300788 e!292200)))

(declare-fun lt!225844 () (_ BitVec 32))

(assert (=> b!498612 (= res!300788 (= lt!225835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225844 lt!225838 lt!225839 mask!3524)))))

(assert (=> b!498612 (= lt!225835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225843 (select (arr!15491 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498612 (= lt!225844 (toIndex!0 lt!225838 mask!3524))))

(assert (=> b!498612 (= lt!225838 (select (store (arr!15491 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498612 (= lt!225843 (toIndex!0 (select (arr!15491 a!3235) j!176) mask!3524))))

(assert (=> b!498612 (= lt!225839 (array!32220 (store (arr!15491 a!3235) i!1204 k0!2280) (size!15856 a!3235)))))

(declare-fun e!292195 () Bool)

(assert (=> b!498612 e!292195))

(declare-fun res!300789 () Bool)

(assert (=> b!498612 (=> (not res!300789) (not e!292195))))

(assert (=> b!498612 (= res!300789 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225841 () Unit!14890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14890)

(assert (=> b!498612 (= lt!225841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498613 () Bool)

(declare-fun res!300792 () Bool)

(assert (=> b!498613 (=> (not res!300792) (not e!292193))))

(declare-datatypes ((List!9688 0))(
  ( (Nil!9685) (Cons!9684 (h!10558 (_ BitVec 64)) (t!15907 List!9688)) )
))
(declare-fun arrayNoDuplicates!0 (array!32219 (_ BitVec 32) List!9688) Bool)

(assert (=> b!498613 (= res!300792 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9685))))

(declare-fun b!498614 () Bool)

(assert (=> b!498614 (= e!292200 e!292197)))

(declare-fun res!300787 () Bool)

(assert (=> b!498614 (=> res!300787 e!292197)))

(assert (=> b!498614 (= res!300787 (or (bvsgt #b00000000000000000000000000000000 (x!47059 lt!225835)) (bvsgt (x!47059 lt!225835) #b01111111111111111111111111111110) (bvslt lt!225843 #b00000000000000000000000000000000) (bvsge lt!225843 (size!15856 a!3235)) (bvslt (index!18004 lt!225835) #b00000000000000000000000000000000) (bvsge (index!18004 lt!225835) (size!15856 a!3235)) (not (= lt!225835 (Intermediate!3955 false (index!18004 lt!225835) (x!47059 lt!225835))))))))

(assert (=> b!498614 (and (or (= (select (arr!15491 a!3235) (index!18004 lt!225835)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15491 a!3235) (index!18004 lt!225835)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15491 a!3235) (index!18004 lt!225835)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15491 a!3235) (index!18004 lt!225835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225842 () Unit!14890)

(assert (=> b!498614 (= lt!225842 e!292198)))

(declare-fun c!59187 () Bool)

(assert (=> b!498614 (= c!59187 (= (select (arr!15491 a!3235) (index!18004 lt!225835)) (select (arr!15491 a!3235) j!176)))))

(assert (=> b!498614 (and (bvslt (x!47059 lt!225835) #b01111111111111111111111111111110) (or (= (select (arr!15491 a!3235) (index!18004 lt!225835)) (select (arr!15491 a!3235) j!176)) (= (select (arr!15491 a!3235) (index!18004 lt!225835)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15491 a!3235) (index!18004 lt!225835)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498615 () Bool)

(assert (=> b!498615 (= e!292195 (= (seekEntryOrOpen!0 (select (arr!15491 a!3235) j!176) a!3235 mask!3524) (Found!3955 j!176)))))

(declare-fun b!498616 () Bool)

(declare-fun res!300784 () Bool)

(assert (=> b!498616 (=> (not res!300784) (not e!292199))))

(declare-fun arrayContainsKey!0 (array!32219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498616 (= res!300784 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45384 res!300783) b!498602))

(assert (= (and b!498602 res!300786) b!498610))

(assert (= (and b!498610 res!300785) b!498605))

(assert (= (and b!498605 res!300793) b!498616))

(assert (= (and b!498616 res!300784) b!498611))

(assert (= (and b!498611 res!300782) b!498606))

(assert (= (and b!498606 res!300794) b!498613))

(assert (= (and b!498613 res!300792) b!498612))

(assert (= (and b!498612 res!300789) b!498615))

(assert (= (and b!498612 (not res!300788)) b!498604))

(assert (= (and b!498604 (not res!300791)) b!498614))

(assert (= (and b!498614 c!59187) b!498607))

(assert (= (and b!498614 (not c!59187)) b!498609))

(assert (= (and b!498607 res!300790) b!498608))

(assert (= (and b!498614 (not res!300787)) b!498603))

(declare-fun m!479359 () Bool)

(assert (=> b!498610 m!479359))

(assert (=> b!498610 m!479359))

(declare-fun m!479361 () Bool)

(assert (=> b!498610 m!479361))

(declare-fun m!479363 () Bool)

(assert (=> b!498606 m!479363))

(declare-fun m!479365 () Bool)

(assert (=> b!498603 m!479365))

(declare-fun m!479367 () Bool)

(assert (=> b!498614 m!479367))

(assert (=> b!498614 m!479359))

(declare-fun m!479369 () Bool)

(assert (=> start!45384 m!479369))

(declare-fun m!479371 () Bool)

(assert (=> start!45384 m!479371))

(declare-fun m!479373 () Bool)

(assert (=> b!498607 m!479373))

(assert (=> b!498607 m!479365))

(declare-fun m!479375 () Bool)

(assert (=> b!498616 m!479375))

(declare-fun m!479377 () Bool)

(assert (=> b!498611 m!479377))

(declare-fun m!479379 () Bool)

(assert (=> b!498605 m!479379))

(assert (=> b!498615 m!479359))

(assert (=> b!498615 m!479359))

(declare-fun m!479381 () Bool)

(assert (=> b!498615 m!479381))

(declare-fun m!479383 () Bool)

(assert (=> b!498613 m!479383))

(declare-fun m!479385 () Bool)

(assert (=> b!498612 m!479385))

(declare-fun m!479387 () Bool)

(assert (=> b!498612 m!479387))

(declare-fun m!479389 () Bool)

(assert (=> b!498612 m!479389))

(assert (=> b!498612 m!479359))

(declare-fun m!479391 () Bool)

(assert (=> b!498612 m!479391))

(assert (=> b!498612 m!479359))

(declare-fun m!479393 () Bool)

(assert (=> b!498612 m!479393))

(assert (=> b!498612 m!479359))

(declare-fun m!479395 () Bool)

(assert (=> b!498612 m!479395))

(declare-fun m!479397 () Bool)

(assert (=> b!498612 m!479397))

(declare-fun m!479399 () Bool)

(assert (=> b!498612 m!479399))

(check-sat (not b!498613) (not b!498603) (not b!498606) (not b!498612) (not b!498607) (not b!498605) (not b!498615) (not b!498610) (not b!498611) (not start!45384) (not b!498616))
(check-sat)
