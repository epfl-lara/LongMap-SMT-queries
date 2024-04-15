; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45012 () Bool)

(assert start!45012)

(declare-fun b!493735 () Bool)

(declare-fun res!296456 () Bool)

(declare-fun e!289836 () Bool)

(assert (=> b!493735 (=> (not res!296456) (not e!289836))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31967 0))(
  ( (array!31968 (arr!15368 (Array (_ BitVec 32) (_ BitVec 64))) (size!15733 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31967)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493735 (= res!296456 (and (= (size!15733 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15733 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15733 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493736 () Bool)

(declare-fun e!289839 () Bool)

(assert (=> b!493736 (= e!289836 e!289839)))

(declare-fun res!296455 () Bool)

(assert (=> b!493736 (=> (not res!296455) (not e!289839))))

(declare-datatypes ((SeekEntryResult!3832 0))(
  ( (MissingZero!3832 (index!17507 (_ BitVec 32))) (Found!3832 (index!17508 (_ BitVec 32))) (Intermediate!3832 (undefined!4644 Bool) (index!17509 (_ BitVec 32)) (x!46593 (_ BitVec 32))) (Undefined!3832) (MissingVacant!3832 (index!17510 (_ BitVec 32))) )
))
(declare-fun lt!223281 () SeekEntryResult!3832)

(assert (=> b!493736 (= res!296455 (or (= lt!223281 (MissingZero!3832 i!1204)) (= lt!223281 (MissingVacant!3832 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31967 (_ BitVec 32)) SeekEntryResult!3832)

(assert (=> b!493736 (= lt!223281 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493737 () Bool)

(declare-fun res!296450 () Bool)

(declare-fun e!289837 () Bool)

(assert (=> b!493737 (=> res!296450 e!289837)))

(declare-fun lt!223279 () SeekEntryResult!3832)

(get-info :version)

(assert (=> b!493737 (= res!296450 (or (not ((_ is Intermediate!3832) lt!223279)) (not (undefined!4644 lt!223279))))))

(declare-fun b!493738 () Bool)

(assert (=> b!493738 (= e!289837 true)))

(declare-fun lt!223280 () SeekEntryResult!3832)

(assert (=> b!493738 (= lt!223280 Undefined!3832)))

(declare-fun b!493739 () Bool)

(declare-fun res!296448 () Bool)

(assert (=> b!493739 (=> (not res!296448) (not e!289836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493739 (= res!296448 (validKeyInArray!0 k0!2280))))

(declare-fun b!493740 () Bool)

(declare-fun res!296453 () Bool)

(assert (=> b!493740 (=> (not res!296453) (not e!289839))))

(declare-datatypes ((List!9565 0))(
  ( (Nil!9562) (Cons!9561 (h!10429 (_ BitVec 64)) (t!15784 List!9565)) )
))
(declare-fun arrayNoDuplicates!0 (array!31967 (_ BitVec 32) List!9565) Bool)

(assert (=> b!493740 (= res!296453 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9562))))

(declare-fun res!296447 () Bool)

(assert (=> start!45012 (=> (not res!296447) (not e!289836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45012 (= res!296447 (validMask!0 mask!3524))))

(assert (=> start!45012 e!289836))

(assert (=> start!45012 true))

(declare-fun array_inv!11251 (array!31967) Bool)

(assert (=> start!45012 (array_inv!11251 a!3235)))

(declare-fun b!493741 () Bool)

(declare-fun res!296451 () Bool)

(assert (=> b!493741 (=> (not res!296451) (not e!289839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31967 (_ BitVec 32)) Bool)

(assert (=> b!493741 (= res!296451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493742 () Bool)

(declare-fun res!296449 () Bool)

(assert (=> b!493742 (=> (not res!296449) (not e!289836))))

(declare-fun arrayContainsKey!0 (array!31967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493742 (= res!296449 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493743 () Bool)

(declare-fun res!296452 () Bool)

(assert (=> b!493743 (=> (not res!296452) (not e!289836))))

(assert (=> b!493743 (= res!296452 (validKeyInArray!0 (select (arr!15368 a!3235) j!176)))))

(declare-fun b!493744 () Bool)

(assert (=> b!493744 (= e!289839 (not e!289837))))

(declare-fun res!296454 () Bool)

(assert (=> b!493744 (=> res!296454 e!289837)))

(declare-fun lt!223282 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31967 (_ BitVec 32)) SeekEntryResult!3832)

(assert (=> b!493744 (= res!296454 (= lt!223279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223282 (select (store (arr!15368 a!3235) i!1204 k0!2280) j!176) (array!31968 (store (arr!15368 a!3235) i!1204 k0!2280) (size!15733 a!3235)) mask!3524)))))

(declare-fun lt!223277 () (_ BitVec 32))

(assert (=> b!493744 (= lt!223279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223277 (select (arr!15368 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493744 (= lt!223282 (toIndex!0 (select (store (arr!15368 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493744 (= lt!223277 (toIndex!0 (select (arr!15368 a!3235) j!176) mask!3524))))

(assert (=> b!493744 (= lt!223280 (Found!3832 j!176))))

(assert (=> b!493744 (= lt!223280 (seekEntryOrOpen!0 (select (arr!15368 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493744 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14596 0))(
  ( (Unit!14597) )
))
(declare-fun lt!223278 () Unit!14596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14596)

(assert (=> b!493744 (= lt!223278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45012 res!296447) b!493735))

(assert (= (and b!493735 res!296456) b!493743))

(assert (= (and b!493743 res!296452) b!493739))

(assert (= (and b!493739 res!296448) b!493742))

(assert (= (and b!493742 res!296449) b!493736))

(assert (= (and b!493736 res!296455) b!493741))

(assert (= (and b!493741 res!296451) b!493740))

(assert (= (and b!493740 res!296453) b!493744))

(assert (= (and b!493744 (not res!296454)) b!493737))

(assert (= (and b!493737 (not res!296450)) b!493738))

(declare-fun m!474211 () Bool)

(assert (=> b!493741 m!474211))

(declare-fun m!474213 () Bool)

(assert (=> b!493742 m!474213))

(declare-fun m!474215 () Bool)

(assert (=> b!493740 m!474215))

(declare-fun m!474217 () Bool)

(assert (=> b!493743 m!474217))

(assert (=> b!493743 m!474217))

(declare-fun m!474219 () Bool)

(assert (=> b!493743 m!474219))

(declare-fun m!474221 () Bool)

(assert (=> b!493744 m!474221))

(declare-fun m!474223 () Bool)

(assert (=> b!493744 m!474223))

(declare-fun m!474225 () Bool)

(assert (=> b!493744 m!474225))

(declare-fun m!474227 () Bool)

(assert (=> b!493744 m!474227))

(assert (=> b!493744 m!474221))

(assert (=> b!493744 m!474217))

(declare-fun m!474229 () Bool)

(assert (=> b!493744 m!474229))

(assert (=> b!493744 m!474217))

(declare-fun m!474231 () Bool)

(assert (=> b!493744 m!474231))

(assert (=> b!493744 m!474217))

(declare-fun m!474233 () Bool)

(assert (=> b!493744 m!474233))

(assert (=> b!493744 m!474217))

(declare-fun m!474235 () Bool)

(assert (=> b!493744 m!474235))

(assert (=> b!493744 m!474221))

(declare-fun m!474237 () Bool)

(assert (=> b!493744 m!474237))

(declare-fun m!474239 () Bool)

(assert (=> start!45012 m!474239))

(declare-fun m!474241 () Bool)

(assert (=> start!45012 m!474241))

(declare-fun m!474243 () Bool)

(assert (=> b!493736 m!474243))

(declare-fun m!474245 () Bool)

(assert (=> b!493739 m!474245))

(check-sat (not b!493743) (not b!493744) (not b!493741) (not b!493742) (not b!493736) (not b!493740) (not b!493739) (not start!45012))
(check-sat)
