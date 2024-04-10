; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45266 () Bool)

(assert start!45266)

(declare-fun b!497212 () Bool)

(declare-fun e!291477 () Bool)

(assert (=> b!497212 (= e!291477 true)))

(declare-datatypes ((SeekEntryResult!3927 0))(
  ( (MissingZero!3927 (index!17887 (_ BitVec 32))) (Found!3927 (index!17888 (_ BitVec 32))) (Intermediate!3927 (undefined!4739 Bool) (index!17889 (_ BitVec 32)) (x!46939 (_ BitVec 32))) (Undefined!3927) (MissingVacant!3927 (index!17890 (_ BitVec 32))) )
))
(declare-fun lt!225093 () SeekEntryResult!3927)

(declare-datatypes ((array!32154 0))(
  ( (array!32155 (arr!15460 (Array (_ BitVec 32) (_ BitVec 64))) (size!15824 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32154)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497212 (and (bvslt (x!46939 lt!225093) #b01111111111111111111111111111110) (or (= (select (arr!15460 a!3235) (index!17889 lt!225093)) (select (arr!15460 a!3235) j!176)) (= (select (arr!15460 a!3235) (index!17889 lt!225093)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15460 a!3235) (index!17889 lt!225093)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497213 () Bool)

(declare-fun e!291474 () Bool)

(assert (=> b!497213 (= e!291474 (not e!291477))))

(declare-fun res!299600 () Bool)

(assert (=> b!497213 (=> res!299600 e!291477)))

(declare-fun lt!225097 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32154 (_ BitVec 32)) SeekEntryResult!3927)

(assert (=> b!497213 (= res!299600 (= lt!225093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225097 (select (store (arr!15460 a!3235) i!1204 k0!2280) j!176) (array!32155 (store (arr!15460 a!3235) i!1204 k0!2280) (size!15824 a!3235)) mask!3524)))))

(declare-fun lt!225094 () (_ BitVec 32))

(assert (=> b!497213 (= lt!225093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225094 (select (arr!15460 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497213 (= lt!225097 (toIndex!0 (select (store (arr!15460 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497213 (= lt!225094 (toIndex!0 (select (arr!15460 a!3235) j!176) mask!3524))))

(declare-fun e!291475 () Bool)

(assert (=> b!497213 e!291475))

(declare-fun res!299608 () Bool)

(assert (=> b!497213 (=> (not res!299608) (not e!291475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32154 (_ BitVec 32)) Bool)

(assert (=> b!497213 (= res!299608 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14800 0))(
  ( (Unit!14801) )
))
(declare-fun lt!225096 () Unit!14800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14800)

(assert (=> b!497213 (= lt!225096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497214 () Bool)

(declare-fun res!299607 () Bool)

(declare-fun e!291476 () Bool)

(assert (=> b!497214 (=> (not res!299607) (not e!291476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497214 (= res!299607 (validKeyInArray!0 (select (arr!15460 a!3235) j!176)))))

(declare-fun b!497215 () Bool)

(declare-fun res!299602 () Bool)

(assert (=> b!497215 (=> res!299602 e!291477)))

(get-info :version)

(assert (=> b!497215 (= res!299602 (or (undefined!4739 lt!225093) (not ((_ is Intermediate!3927) lt!225093))))))

(declare-fun b!497216 () Bool)

(declare-fun res!299606 () Bool)

(assert (=> b!497216 (=> (not res!299606) (not e!291476))))

(declare-fun arrayContainsKey!0 (array!32154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497216 (= res!299606 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497217 () Bool)

(declare-fun res!299605 () Bool)

(assert (=> b!497217 (=> (not res!299605) (not e!291474))))

(declare-datatypes ((List!9618 0))(
  ( (Nil!9615) (Cons!9614 (h!10485 (_ BitVec 64)) (t!15846 List!9618)) )
))
(declare-fun arrayNoDuplicates!0 (array!32154 (_ BitVec 32) List!9618) Bool)

(assert (=> b!497217 (= res!299605 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9615))))

(declare-fun b!497218 () Bool)

(declare-fun res!299604 () Bool)

(assert (=> b!497218 (=> (not res!299604) (not e!291476))))

(assert (=> b!497218 (= res!299604 (and (= (size!15824 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15824 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15824 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497219 () Bool)

(assert (=> b!497219 (= e!291476 e!291474)))

(declare-fun res!299601 () Bool)

(assert (=> b!497219 (=> (not res!299601) (not e!291474))))

(declare-fun lt!225095 () SeekEntryResult!3927)

(assert (=> b!497219 (= res!299601 (or (= lt!225095 (MissingZero!3927 i!1204)) (= lt!225095 (MissingVacant!3927 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32154 (_ BitVec 32)) SeekEntryResult!3927)

(assert (=> b!497219 (= lt!225095 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497220 () Bool)

(declare-fun res!299603 () Bool)

(assert (=> b!497220 (=> (not res!299603) (not e!291476))))

(assert (=> b!497220 (= res!299603 (validKeyInArray!0 k0!2280))))

(declare-fun res!299599 () Bool)

(assert (=> start!45266 (=> (not res!299599) (not e!291476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45266 (= res!299599 (validMask!0 mask!3524))))

(assert (=> start!45266 e!291476))

(assert (=> start!45266 true))

(declare-fun array_inv!11256 (array!32154) Bool)

(assert (=> start!45266 (array_inv!11256 a!3235)))

(declare-fun b!497221 () Bool)

(assert (=> b!497221 (= e!291475 (= (seekEntryOrOpen!0 (select (arr!15460 a!3235) j!176) a!3235 mask!3524) (Found!3927 j!176)))))

(declare-fun b!497222 () Bool)

(declare-fun res!299609 () Bool)

(assert (=> b!497222 (=> (not res!299609) (not e!291474))))

(assert (=> b!497222 (= res!299609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45266 res!299599) b!497218))

(assert (= (and b!497218 res!299604) b!497214))

(assert (= (and b!497214 res!299607) b!497220))

(assert (= (and b!497220 res!299603) b!497216))

(assert (= (and b!497216 res!299606) b!497219))

(assert (= (and b!497219 res!299601) b!497222))

(assert (= (and b!497222 res!299609) b!497217))

(assert (= (and b!497217 res!299605) b!497213))

(assert (= (and b!497213 res!299608) b!497221))

(assert (= (and b!497213 (not res!299600)) b!497215))

(assert (= (and b!497215 (not res!299602)) b!497212))

(declare-fun m!478565 () Bool)

(assert (=> b!497212 m!478565))

(declare-fun m!478567 () Bool)

(assert (=> b!497212 m!478567))

(declare-fun m!478569 () Bool)

(assert (=> b!497220 m!478569))

(declare-fun m!478571 () Bool)

(assert (=> b!497219 m!478571))

(declare-fun m!478573 () Bool)

(assert (=> start!45266 m!478573))

(declare-fun m!478575 () Bool)

(assert (=> start!45266 m!478575))

(assert (=> b!497214 m!478567))

(assert (=> b!497214 m!478567))

(declare-fun m!478577 () Bool)

(assert (=> b!497214 m!478577))

(declare-fun m!478579 () Bool)

(assert (=> b!497216 m!478579))

(declare-fun m!478581 () Bool)

(assert (=> b!497222 m!478581))

(declare-fun m!478583 () Bool)

(assert (=> b!497213 m!478583))

(declare-fun m!478585 () Bool)

(assert (=> b!497213 m!478585))

(declare-fun m!478587 () Bool)

(assert (=> b!497213 m!478587))

(assert (=> b!497213 m!478567))

(declare-fun m!478589 () Bool)

(assert (=> b!497213 m!478589))

(assert (=> b!497213 m!478567))

(declare-fun m!478591 () Bool)

(assert (=> b!497213 m!478591))

(assert (=> b!497213 m!478567))

(declare-fun m!478593 () Bool)

(assert (=> b!497213 m!478593))

(assert (=> b!497213 m!478587))

(declare-fun m!478595 () Bool)

(assert (=> b!497213 m!478595))

(assert (=> b!497213 m!478587))

(declare-fun m!478597 () Bool)

(assert (=> b!497213 m!478597))

(declare-fun m!478599 () Bool)

(assert (=> b!497217 m!478599))

(assert (=> b!497221 m!478567))

(assert (=> b!497221 m!478567))

(declare-fun m!478601 () Bool)

(assert (=> b!497221 m!478601))

(check-sat (not b!497220) (not start!45266) (not b!497222) (not b!497214) (not b!497213) (not b!497216) (not b!497217) (not b!497221) (not b!497219))
