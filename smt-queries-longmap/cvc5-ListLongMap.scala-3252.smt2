; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45384 () Bool)

(assert start!45384)

(declare-fun b!498603 () Bool)

(declare-fun res!300683 () Bool)

(declare-fun e!292226 () Bool)

(assert (=> b!498603 (=> (not res!300683) (not e!292226))))

(declare-datatypes ((array!32209 0))(
  ( (array!32210 (arr!15486 (Array (_ BitVec 32) (_ BitVec 64))) (size!15850 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32209)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498603 (= res!300683 (validKeyInArray!0 (select (arr!15486 a!3235) j!176)))))

(declare-fun b!498604 () Bool)

(declare-fun res!300677 () Bool)

(assert (=> b!498604 (=> (not res!300677) (not e!292226))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498604 (= res!300677 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498605 () Bool)

(declare-fun res!300685 () Bool)

(assert (=> b!498605 (=> (not res!300685) (not e!292226))))

(assert (=> b!498605 (= res!300685 (validKeyInArray!0 k!2280))))

(declare-fun b!498606 () Bool)

(declare-datatypes ((Unit!14888 0))(
  ( (Unit!14889) )
))
(declare-fun e!292224 () Unit!14888)

(declare-fun Unit!14890 () Unit!14888)

(assert (=> b!498606 (= e!292224 Unit!14890)))

(declare-fun b!498607 () Bool)

(declare-fun e!292228 () Bool)

(declare-fun e!292225 () Bool)

(assert (=> b!498607 (= e!292228 (not e!292225))))

(declare-fun res!300687 () Bool)

(assert (=> b!498607 (=> res!300687 e!292225)))

(declare-datatypes ((SeekEntryResult!3953 0))(
  ( (MissingZero!3953 (index!17994 (_ BitVec 32))) (Found!3953 (index!17995 (_ BitVec 32))) (Intermediate!3953 (undefined!4765 Bool) (index!17996 (_ BitVec 32)) (x!47046 (_ BitVec 32))) (Undefined!3953) (MissingVacant!3953 (index!17997 (_ BitVec 32))) )
))
(declare-fun lt!225895 () SeekEntryResult!3953)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!225897 () array!32209)

(declare-fun lt!225892 () (_ BitVec 32))

(declare-fun lt!225896 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32209 (_ BitVec 32)) SeekEntryResult!3953)

(assert (=> b!498607 (= res!300687 (= lt!225895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225892 lt!225896 lt!225897 mask!3524)))))

(declare-fun lt!225894 () (_ BitVec 32))

(assert (=> b!498607 (= lt!225895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225894 (select (arr!15486 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498607 (= lt!225892 (toIndex!0 lt!225896 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498607 (= lt!225896 (select (store (arr!15486 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498607 (= lt!225894 (toIndex!0 (select (arr!15486 a!3235) j!176) mask!3524))))

(assert (=> b!498607 (= lt!225897 (array!32210 (store (arr!15486 a!3235) i!1204 k!2280) (size!15850 a!3235)))))

(declare-fun e!292230 () Bool)

(assert (=> b!498607 e!292230))

(declare-fun res!300678 () Bool)

(assert (=> b!498607 (=> (not res!300678) (not e!292230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32209 (_ BitVec 32)) Bool)

(assert (=> b!498607 (= res!300678 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225893 () Unit!14888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14888)

(assert (=> b!498607 (= lt!225893 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498608 () Bool)

(declare-fun e!292227 () Bool)

(assert (=> b!498608 (= e!292227 true)))

(declare-fun lt!225891 () SeekEntryResult!3953)

(assert (=> b!498608 (= lt!225891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225894 lt!225896 lt!225897 mask!3524))))

(declare-fun b!498609 () Bool)

(declare-fun res!300689 () Bool)

(assert (=> b!498609 (=> res!300689 e!292225)))

(assert (=> b!498609 (= res!300689 (or (undefined!4765 lt!225895) (not (is-Intermediate!3953 lt!225895))))))

(declare-fun res!300684 () Bool)

(assert (=> start!45384 (=> (not res!300684) (not e!292226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45384 (= res!300684 (validMask!0 mask!3524))))

(assert (=> start!45384 e!292226))

(assert (=> start!45384 true))

(declare-fun array_inv!11282 (array!32209) Bool)

(assert (=> start!45384 (array_inv!11282 a!3235)))

(declare-fun b!498610 () Bool)

(declare-fun e!292223 () Bool)

(assert (=> b!498610 (= e!292223 false)))

(declare-fun b!498611 () Bool)

(assert (=> b!498611 (= e!292225 e!292227)))

(declare-fun res!300682 () Bool)

(assert (=> b!498611 (=> res!300682 e!292227)))

(assert (=> b!498611 (= res!300682 (or (bvsgt #b00000000000000000000000000000000 (x!47046 lt!225895)) (bvsgt (x!47046 lt!225895) #b01111111111111111111111111111110) (bvslt lt!225894 #b00000000000000000000000000000000) (bvsge lt!225894 (size!15850 a!3235)) (bvslt (index!17996 lt!225895) #b00000000000000000000000000000000) (bvsge (index!17996 lt!225895) (size!15850 a!3235)) (not (= lt!225895 (Intermediate!3953 false (index!17996 lt!225895) (x!47046 lt!225895))))))))

(assert (=> b!498611 (and (or (= (select (arr!15486 a!3235) (index!17996 lt!225895)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15486 a!3235) (index!17996 lt!225895)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15486 a!3235) (index!17996 lt!225895)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15486 a!3235) (index!17996 lt!225895)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225889 () Unit!14888)

(assert (=> b!498611 (= lt!225889 e!292224)))

(declare-fun c!59240 () Bool)

(assert (=> b!498611 (= c!59240 (= (select (arr!15486 a!3235) (index!17996 lt!225895)) (select (arr!15486 a!3235) j!176)))))

(assert (=> b!498611 (and (bvslt (x!47046 lt!225895) #b01111111111111111111111111111110) (or (= (select (arr!15486 a!3235) (index!17996 lt!225895)) (select (arr!15486 a!3235) j!176)) (= (select (arr!15486 a!3235) (index!17996 lt!225895)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15486 a!3235) (index!17996 lt!225895)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498612 () Bool)

(declare-fun Unit!14891 () Unit!14888)

(assert (=> b!498612 (= e!292224 Unit!14891)))

(declare-fun lt!225898 () Unit!14888)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14888)

(assert (=> b!498612 (= lt!225898 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225894 #b00000000000000000000000000000000 (index!17996 lt!225895) (x!47046 lt!225895) mask!3524))))

(declare-fun res!300688 () Bool)

(assert (=> b!498612 (= res!300688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225894 lt!225896 lt!225897 mask!3524) (Intermediate!3953 false (index!17996 lt!225895) (x!47046 lt!225895))))))

(assert (=> b!498612 (=> (not res!300688) (not e!292223))))

(assert (=> b!498612 e!292223))

(declare-fun b!498613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32209 (_ BitVec 32)) SeekEntryResult!3953)

(assert (=> b!498613 (= e!292230 (= (seekEntryOrOpen!0 (select (arr!15486 a!3235) j!176) a!3235 mask!3524) (Found!3953 j!176)))))

(declare-fun b!498614 () Bool)

(declare-fun res!300680 () Bool)

(assert (=> b!498614 (=> (not res!300680) (not e!292228))))

(assert (=> b!498614 (= res!300680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498615 () Bool)

(assert (=> b!498615 (= e!292226 e!292228)))

(declare-fun res!300686 () Bool)

(assert (=> b!498615 (=> (not res!300686) (not e!292228))))

(declare-fun lt!225890 () SeekEntryResult!3953)

(assert (=> b!498615 (= res!300686 (or (= lt!225890 (MissingZero!3953 i!1204)) (= lt!225890 (MissingVacant!3953 i!1204))))))

(assert (=> b!498615 (= lt!225890 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498616 () Bool)

(declare-fun res!300679 () Bool)

(assert (=> b!498616 (=> (not res!300679) (not e!292226))))

(assert (=> b!498616 (= res!300679 (and (= (size!15850 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15850 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15850 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498617 () Bool)

(declare-fun res!300681 () Bool)

(assert (=> b!498617 (=> (not res!300681) (not e!292228))))

(declare-datatypes ((List!9644 0))(
  ( (Nil!9641) (Cons!9640 (h!10514 (_ BitVec 64)) (t!15872 List!9644)) )
))
(declare-fun arrayNoDuplicates!0 (array!32209 (_ BitVec 32) List!9644) Bool)

(assert (=> b!498617 (= res!300681 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9641))))

(assert (= (and start!45384 res!300684) b!498616))

(assert (= (and b!498616 res!300679) b!498603))

(assert (= (and b!498603 res!300683) b!498605))

(assert (= (and b!498605 res!300685) b!498604))

(assert (= (and b!498604 res!300677) b!498615))

(assert (= (and b!498615 res!300686) b!498614))

(assert (= (and b!498614 res!300680) b!498617))

(assert (= (and b!498617 res!300681) b!498607))

(assert (= (and b!498607 res!300678) b!498613))

(assert (= (and b!498607 (not res!300687)) b!498609))

(assert (= (and b!498609 (not res!300689)) b!498611))

(assert (= (and b!498611 c!59240) b!498612))

(assert (= (and b!498611 (not c!59240)) b!498606))

(assert (= (and b!498612 res!300688) b!498610))

(assert (= (and b!498611 (not res!300682)) b!498608))

(declare-fun m!479859 () Bool)

(assert (=> b!498605 m!479859))

(declare-fun m!479861 () Bool)

(assert (=> b!498617 m!479861))

(declare-fun m!479863 () Bool)

(assert (=> b!498608 m!479863))

(declare-fun m!479865 () Bool)

(assert (=> start!45384 m!479865))

(declare-fun m!479867 () Bool)

(assert (=> start!45384 m!479867))

(declare-fun m!479869 () Bool)

(assert (=> b!498614 m!479869))

(declare-fun m!479871 () Bool)

(assert (=> b!498607 m!479871))

(declare-fun m!479873 () Bool)

(assert (=> b!498607 m!479873))

(declare-fun m!479875 () Bool)

(assert (=> b!498607 m!479875))

(declare-fun m!479877 () Bool)

(assert (=> b!498607 m!479877))

(declare-fun m!479879 () Bool)

(assert (=> b!498607 m!479879))

(assert (=> b!498607 m!479877))

(declare-fun m!479881 () Bool)

(assert (=> b!498607 m!479881))

(assert (=> b!498607 m!479877))

(declare-fun m!479883 () Bool)

(assert (=> b!498607 m!479883))

(declare-fun m!479885 () Bool)

(assert (=> b!498607 m!479885))

(declare-fun m!479887 () Bool)

(assert (=> b!498607 m!479887))

(declare-fun m!479889 () Bool)

(assert (=> b!498615 m!479889))

(declare-fun m!479891 () Bool)

(assert (=> b!498611 m!479891))

(assert (=> b!498611 m!479877))

(assert (=> b!498603 m!479877))

(assert (=> b!498603 m!479877))

(declare-fun m!479893 () Bool)

(assert (=> b!498603 m!479893))

(declare-fun m!479895 () Bool)

(assert (=> b!498604 m!479895))

(assert (=> b!498613 m!479877))

(assert (=> b!498613 m!479877))

(declare-fun m!479897 () Bool)

(assert (=> b!498613 m!479897))

(declare-fun m!479899 () Bool)

(assert (=> b!498612 m!479899))

(assert (=> b!498612 m!479863))

(push 1)

