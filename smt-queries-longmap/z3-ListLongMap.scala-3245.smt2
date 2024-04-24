; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45266 () Bool)

(assert start!45266)

(declare-fun b!497316 () Bool)

(declare-fun res!299762 () Bool)

(declare-fun e!291513 () Bool)

(assert (=> b!497316 (=> (not res!299762) (not e!291513))))

(declare-datatypes ((array!32155 0))(
  ( (array!32156 (arr!15460 (Array (_ BitVec 32) (_ BitVec 64))) (size!15824 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32155)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32155 (_ BitVec 32)) Bool)

(assert (=> b!497316 (= res!299762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497317 () Bool)

(declare-fun e!291512 () Bool)

(assert (=> b!497317 (= e!291512 true)))

(declare-datatypes ((SeekEntryResult!3883 0))(
  ( (MissingZero!3883 (index!17711 (_ BitVec 32))) (Found!3883 (index!17712 (_ BitVec 32))) (Intermediate!3883 (undefined!4695 Bool) (index!17713 (_ BitVec 32)) (x!46908 (_ BitVec 32))) (Undefined!3883) (MissingVacant!3883 (index!17714 (_ BitVec 32))) )
))
(declare-fun lt!225183 () SeekEntryResult!3883)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497317 (and (bvslt (x!46908 lt!225183) #b01111111111111111111111111111110) (or (= (select (arr!15460 a!3235) (index!17713 lt!225183)) (select (arr!15460 a!3235) j!176)) (= (select (arr!15460 a!3235) (index!17713 lt!225183)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15460 a!3235) (index!17713 lt!225183)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497318 () Bool)

(declare-fun res!299757 () Bool)

(declare-fun e!291509 () Bool)

(assert (=> b!497318 (=> (not res!299757) (not e!291509))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497318 (= res!299757 (and (= (size!15824 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15824 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15824 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497319 () Bool)

(assert (=> b!497319 (= e!291513 (not e!291512))))

(declare-fun res!299759 () Bool)

(assert (=> b!497319 (=> res!299759 e!291512)))

(declare-fun lt!225180 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32155 (_ BitVec 32)) SeekEntryResult!3883)

(assert (=> b!497319 (= res!299759 (= lt!225183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225180 (select (store (arr!15460 a!3235) i!1204 k0!2280) j!176) (array!32156 (store (arr!15460 a!3235) i!1204 k0!2280) (size!15824 a!3235)) mask!3524)))))

(declare-fun lt!225181 () (_ BitVec 32))

(assert (=> b!497319 (= lt!225183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225181 (select (arr!15460 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497319 (= lt!225180 (toIndex!0 (select (store (arr!15460 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497319 (= lt!225181 (toIndex!0 (select (arr!15460 a!3235) j!176) mask!3524))))

(declare-fun e!291511 () Bool)

(assert (=> b!497319 e!291511))

(declare-fun res!299758 () Bool)

(assert (=> b!497319 (=> (not res!299758) (not e!291511))))

(assert (=> b!497319 (= res!299758 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14773 0))(
  ( (Unit!14774) )
))
(declare-fun lt!225182 () Unit!14773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14773)

(assert (=> b!497319 (= lt!225182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!299761 () Bool)

(assert (=> start!45266 (=> (not res!299761) (not e!291509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45266 (= res!299761 (validMask!0 mask!3524))))

(assert (=> start!45266 e!291509))

(assert (=> start!45266 true))

(declare-fun array_inv!11319 (array!32155) Bool)

(assert (=> start!45266 (array_inv!11319 a!3235)))

(declare-fun b!497320 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32155 (_ BitVec 32)) SeekEntryResult!3883)

(assert (=> b!497320 (= e!291511 (= (seekEntryOrOpen!0 (select (arr!15460 a!3235) j!176) a!3235 mask!3524) (Found!3883 j!176)))))

(declare-fun b!497321 () Bool)

(declare-fun res!299760 () Bool)

(assert (=> b!497321 (=> res!299760 e!291512)))

(get-info :version)

(assert (=> b!497321 (= res!299760 (or (undefined!4695 lt!225183) (not ((_ is Intermediate!3883) lt!225183))))))

(declare-fun b!497322 () Bool)

(declare-fun res!299765 () Bool)

(assert (=> b!497322 (=> (not res!299765) (not e!291509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497322 (= res!299765 (validKeyInArray!0 (select (arr!15460 a!3235) j!176)))))

(declare-fun b!497323 () Bool)

(assert (=> b!497323 (= e!291509 e!291513)))

(declare-fun res!299766 () Bool)

(assert (=> b!497323 (=> (not res!299766) (not e!291513))))

(declare-fun lt!225184 () SeekEntryResult!3883)

(assert (=> b!497323 (= res!299766 (or (= lt!225184 (MissingZero!3883 i!1204)) (= lt!225184 (MissingVacant!3883 i!1204))))))

(assert (=> b!497323 (= lt!225184 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497324 () Bool)

(declare-fun res!299764 () Bool)

(assert (=> b!497324 (=> (not res!299764) (not e!291509))))

(assert (=> b!497324 (= res!299764 (validKeyInArray!0 k0!2280))))

(declare-fun b!497325 () Bool)

(declare-fun res!299763 () Bool)

(assert (=> b!497325 (=> (not res!299763) (not e!291509))))

(declare-fun arrayContainsKey!0 (array!32155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497325 (= res!299763 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497326 () Bool)

(declare-fun res!299767 () Bool)

(assert (=> b!497326 (=> (not res!299767) (not e!291513))))

(declare-datatypes ((List!9525 0))(
  ( (Nil!9522) (Cons!9521 (h!10392 (_ BitVec 64)) (t!15745 List!9525)) )
))
(declare-fun arrayNoDuplicates!0 (array!32155 (_ BitVec 32) List!9525) Bool)

(assert (=> b!497326 (= res!299767 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9522))))

(assert (= (and start!45266 res!299761) b!497318))

(assert (= (and b!497318 res!299757) b!497322))

(assert (= (and b!497322 res!299765) b!497324))

(assert (= (and b!497324 res!299764) b!497325))

(assert (= (and b!497325 res!299763) b!497323))

(assert (= (and b!497323 res!299766) b!497316))

(assert (= (and b!497316 res!299762) b!497326))

(assert (= (and b!497326 res!299767) b!497319))

(assert (= (and b!497319 res!299758) b!497320))

(assert (= (and b!497319 (not res!299759)) b!497321))

(assert (= (and b!497321 (not res!299760)) b!497317))

(declare-fun m!478939 () Bool)

(assert (=> b!497326 m!478939))

(declare-fun m!478941 () Bool)

(assert (=> b!497320 m!478941))

(assert (=> b!497320 m!478941))

(declare-fun m!478943 () Bool)

(assert (=> b!497320 m!478943))

(declare-fun m!478945 () Bool)

(assert (=> b!497319 m!478945))

(assert (=> b!497319 m!478941))

(declare-fun m!478947 () Bool)

(assert (=> b!497319 m!478947))

(declare-fun m!478949 () Bool)

(assert (=> b!497319 m!478949))

(declare-fun m!478951 () Bool)

(assert (=> b!497319 m!478951))

(assert (=> b!497319 m!478941))

(declare-fun m!478953 () Bool)

(assert (=> b!497319 m!478953))

(assert (=> b!497319 m!478951))

(declare-fun m!478955 () Bool)

(assert (=> b!497319 m!478955))

(assert (=> b!497319 m!478941))

(declare-fun m!478957 () Bool)

(assert (=> b!497319 m!478957))

(assert (=> b!497319 m!478951))

(declare-fun m!478959 () Bool)

(assert (=> b!497319 m!478959))

(declare-fun m!478961 () Bool)

(assert (=> b!497324 m!478961))

(declare-fun m!478963 () Bool)

(assert (=> b!497325 m!478963))

(declare-fun m!478965 () Bool)

(assert (=> b!497316 m!478965))

(assert (=> b!497322 m!478941))

(assert (=> b!497322 m!478941))

(declare-fun m!478967 () Bool)

(assert (=> b!497322 m!478967))

(declare-fun m!478969 () Bool)

(assert (=> b!497323 m!478969))

(declare-fun m!478971 () Bool)

(assert (=> b!497317 m!478971))

(assert (=> b!497317 m!478941))

(declare-fun m!478973 () Bool)

(assert (=> start!45266 m!478973))

(declare-fun m!478975 () Bool)

(assert (=> start!45266 m!478975))

(check-sat (not b!497326) (not b!497323) (not b!497319) (not b!497322) (not b!497320) (not b!497325) (not start!45266) (not b!497316) (not b!497324))
(check-sat)
