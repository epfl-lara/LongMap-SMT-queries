; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45060 () Bool)

(assert start!45060)

(declare-fun b!494455 () Bool)

(declare-fun res!297171 () Bool)

(declare-fun e!290126 () Bool)

(assert (=> b!494455 (=> (not res!297171) (not e!290126))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494455 (= res!297171 (validKeyInArray!0 k0!2280))))

(declare-fun b!494456 () Bool)

(declare-fun res!297172 () Bool)

(declare-fun e!290127 () Bool)

(assert (=> b!494456 (=> (not res!297172) (not e!290127))))

(declare-datatypes ((array!32015 0))(
  ( (array!32016 (arr!15392 (Array (_ BitVec 32) (_ BitVec 64))) (size!15757 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32015)

(declare-datatypes ((List!9589 0))(
  ( (Nil!9586) (Cons!9585 (h!10453 (_ BitVec 64)) (t!15808 List!9589)) )
))
(declare-fun arrayNoDuplicates!0 (array!32015 (_ BitVec 32) List!9589) Bool)

(assert (=> b!494456 (= res!297172 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9586))))

(declare-fun b!494457 () Bool)

(declare-fun res!297170 () Bool)

(declare-fun e!290124 () Bool)

(assert (=> b!494457 (=> res!297170 e!290124)))

(declare-datatypes ((SeekEntryResult!3856 0))(
  ( (MissingZero!3856 (index!17603 (_ BitVec 32))) (Found!3856 (index!17604 (_ BitVec 32))) (Intermediate!3856 (undefined!4668 Bool) (index!17605 (_ BitVec 32)) (x!46681 (_ BitVec 32))) (Undefined!3856) (MissingVacant!3856 (index!17606 (_ BitVec 32))) )
))
(declare-fun lt!223712 () SeekEntryResult!3856)

(get-info :version)

(assert (=> b!494457 (= res!297170 (or (not ((_ is Intermediate!3856) lt!223712)) (not (undefined!4668 lt!223712))))))

(declare-fun b!494458 () Bool)

(assert (=> b!494458 (= e!290124 true)))

(declare-fun lt!223709 () SeekEntryResult!3856)

(assert (=> b!494458 (= lt!223709 Undefined!3856)))

(declare-fun b!494459 () Bool)

(assert (=> b!494459 (= e!290127 (not e!290124))))

(declare-fun res!297167 () Bool)

(assert (=> b!494459 (=> res!297167 e!290124)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!223710 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32015 (_ BitVec 32)) SeekEntryResult!3856)

(assert (=> b!494459 (= res!297167 (= lt!223712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223710 (select (store (arr!15392 a!3235) i!1204 k0!2280) j!176) (array!32016 (store (arr!15392 a!3235) i!1204 k0!2280) (size!15757 a!3235)) mask!3524)))))

(declare-fun lt!223714 () (_ BitVec 32))

(assert (=> b!494459 (= lt!223712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223714 (select (arr!15392 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494459 (= lt!223710 (toIndex!0 (select (store (arr!15392 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494459 (= lt!223714 (toIndex!0 (select (arr!15392 a!3235) j!176) mask!3524))))

(assert (=> b!494459 (= lt!223709 (Found!3856 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32015 (_ BitVec 32)) SeekEntryResult!3856)

(assert (=> b!494459 (= lt!223709 (seekEntryOrOpen!0 (select (arr!15392 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32015 (_ BitVec 32)) Bool)

(assert (=> b!494459 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14644 0))(
  ( (Unit!14645) )
))
(declare-fun lt!223713 () Unit!14644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32015 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14644)

(assert (=> b!494459 (= lt!223713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!297174 () Bool)

(assert (=> start!45060 (=> (not res!297174) (not e!290126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45060 (= res!297174 (validMask!0 mask!3524))))

(assert (=> start!45060 e!290126))

(assert (=> start!45060 true))

(declare-fun array_inv!11275 (array!32015) Bool)

(assert (=> start!45060 (array_inv!11275 a!3235)))

(declare-fun b!494460 () Bool)

(assert (=> b!494460 (= e!290126 e!290127)))

(declare-fun res!297173 () Bool)

(assert (=> b!494460 (=> (not res!297173) (not e!290127))))

(declare-fun lt!223711 () SeekEntryResult!3856)

(assert (=> b!494460 (= res!297173 (or (= lt!223711 (MissingZero!3856 i!1204)) (= lt!223711 (MissingVacant!3856 i!1204))))))

(assert (=> b!494460 (= lt!223711 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494461 () Bool)

(declare-fun res!297175 () Bool)

(assert (=> b!494461 (=> (not res!297175) (not e!290126))))

(declare-fun arrayContainsKey!0 (array!32015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494461 (= res!297175 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494462 () Bool)

(declare-fun res!297168 () Bool)

(assert (=> b!494462 (=> (not res!297168) (not e!290126))))

(assert (=> b!494462 (= res!297168 (validKeyInArray!0 (select (arr!15392 a!3235) j!176)))))

(declare-fun b!494463 () Bool)

(declare-fun res!297169 () Bool)

(assert (=> b!494463 (=> (not res!297169) (not e!290127))))

(assert (=> b!494463 (= res!297169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494464 () Bool)

(declare-fun res!297176 () Bool)

(assert (=> b!494464 (=> (not res!297176) (not e!290126))))

(assert (=> b!494464 (= res!297176 (and (= (size!15757 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15757 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15757 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45060 res!297174) b!494464))

(assert (= (and b!494464 res!297176) b!494462))

(assert (= (and b!494462 res!297168) b!494455))

(assert (= (and b!494455 res!297171) b!494461))

(assert (= (and b!494461 res!297175) b!494460))

(assert (= (and b!494460 res!297173) b!494463))

(assert (= (and b!494463 res!297169) b!494456))

(assert (= (and b!494456 res!297172) b!494459))

(assert (= (and b!494459 (not res!297167)) b!494457))

(assert (= (and b!494457 (not res!297170)) b!494458))

(declare-fun m!475075 () Bool)

(assert (=> b!494455 m!475075))

(declare-fun m!475077 () Bool)

(assert (=> b!494463 m!475077))

(declare-fun m!475079 () Bool)

(assert (=> start!45060 m!475079))

(declare-fun m!475081 () Bool)

(assert (=> start!45060 m!475081))

(declare-fun m!475083 () Bool)

(assert (=> b!494456 m!475083))

(declare-fun m!475085 () Bool)

(assert (=> b!494461 m!475085))

(declare-fun m!475087 () Bool)

(assert (=> b!494459 m!475087))

(declare-fun m!475089 () Bool)

(assert (=> b!494459 m!475089))

(declare-fun m!475091 () Bool)

(assert (=> b!494459 m!475091))

(declare-fun m!475093 () Bool)

(assert (=> b!494459 m!475093))

(declare-fun m!475095 () Bool)

(assert (=> b!494459 m!475095))

(assert (=> b!494459 m!475093))

(declare-fun m!475097 () Bool)

(assert (=> b!494459 m!475097))

(assert (=> b!494459 m!475091))

(declare-fun m!475099 () Bool)

(assert (=> b!494459 m!475099))

(assert (=> b!494459 m!475093))

(declare-fun m!475101 () Bool)

(assert (=> b!494459 m!475101))

(assert (=> b!494459 m!475093))

(declare-fun m!475103 () Bool)

(assert (=> b!494459 m!475103))

(assert (=> b!494459 m!475091))

(declare-fun m!475105 () Bool)

(assert (=> b!494459 m!475105))

(assert (=> b!494462 m!475093))

(assert (=> b!494462 m!475093))

(declare-fun m!475107 () Bool)

(assert (=> b!494462 m!475107))

(declare-fun m!475109 () Bool)

(assert (=> b!494460 m!475109))

(check-sat (not start!45060) (not b!494456) (not b!494459) (not b!494455) (not b!494461) (not b!494460) (not b!494462) (not b!494463))
(check-sat)
