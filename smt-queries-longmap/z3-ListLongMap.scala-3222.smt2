; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45068 () Bool)

(assert start!45068)

(declare-fun b!494755 () Bool)

(declare-fun res!297382 () Bool)

(declare-fun e!290297 () Bool)

(assert (=> b!494755 (=> res!297382 e!290297)))

(declare-datatypes ((SeekEntryResult!3814 0))(
  ( (MissingZero!3814 (index!17435 (_ BitVec 32))) (Found!3814 (index!17436 (_ BitVec 32))) (Intermediate!3814 (undefined!4626 Bool) (index!17437 (_ BitVec 32)) (x!46649 (_ BitVec 32))) (Undefined!3814) (MissingVacant!3814 (index!17438 (_ BitVec 32))) )
))
(declare-fun lt!224010 () SeekEntryResult!3814)

(get-info :version)

(assert (=> b!494755 (= res!297382 (or (not ((_ is Intermediate!3814) lt!224010)) (not (undefined!4626 lt!224010))))))

(declare-fun b!494756 () Bool)

(assert (=> b!494756 (= e!290297 true)))

(declare-fun lt!224012 () SeekEntryResult!3814)

(assert (=> b!494756 (= lt!224012 Undefined!3814)))

(declare-fun b!494757 () Bool)

(declare-fun res!297381 () Bool)

(declare-fun e!290298 () Bool)

(assert (=> b!494757 (=> (not res!297381) (not e!290298))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494757 (= res!297381 (validKeyInArray!0 k0!2280))))

(declare-fun b!494758 () Bool)

(declare-fun e!290296 () Bool)

(assert (=> b!494758 (= e!290298 e!290296)))

(declare-fun res!297384 () Bool)

(assert (=> b!494758 (=> (not res!297384) (not e!290296))))

(declare-fun lt!224011 () SeekEntryResult!3814)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494758 (= res!297384 (or (= lt!224011 (MissingZero!3814 i!1204)) (= lt!224011 (MissingVacant!3814 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32014 0))(
  ( (array!32015 (arr!15391 (Array (_ BitVec 32) (_ BitVec 64))) (size!15755 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32014)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32014 (_ BitVec 32)) SeekEntryResult!3814)

(assert (=> b!494758 (= lt!224011 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494759 () Bool)

(assert (=> b!494759 (= e!290296 (not e!290297))))

(declare-fun res!297386 () Bool)

(assert (=> b!494759 (=> res!297386 e!290297)))

(declare-fun lt!224014 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32014 (_ BitVec 32)) SeekEntryResult!3814)

(assert (=> b!494759 (= res!297386 (= lt!224010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224014 (select (store (arr!15391 a!3235) i!1204 k0!2280) j!176) (array!32015 (store (arr!15391 a!3235) i!1204 k0!2280) (size!15755 a!3235)) mask!3524)))))

(declare-fun lt!224013 () (_ BitVec 32))

(assert (=> b!494759 (= lt!224010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224013 (select (arr!15391 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494759 (= lt!224014 (toIndex!0 (select (store (arr!15391 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494759 (= lt!224013 (toIndex!0 (select (arr!15391 a!3235) j!176) mask!3524))))

(assert (=> b!494759 (= lt!224012 (Found!3814 j!176))))

(assert (=> b!494759 (= lt!224012 (seekEntryOrOpen!0 (select (arr!15391 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32014 (_ BitVec 32)) Bool)

(assert (=> b!494759 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14635 0))(
  ( (Unit!14636) )
))
(declare-fun lt!224009 () Unit!14635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14635)

(assert (=> b!494759 (= lt!224009 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494760 () Bool)

(declare-fun res!297385 () Bool)

(assert (=> b!494760 (=> (not res!297385) (not e!290298))))

(declare-fun arrayContainsKey!0 (array!32014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494760 (= res!297385 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494762 () Bool)

(declare-fun res!297388 () Bool)

(assert (=> b!494762 (=> (not res!297388) (not e!290296))))

(assert (=> b!494762 (= res!297388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494761 () Bool)

(declare-fun res!297383 () Bool)

(assert (=> b!494761 (=> (not res!297383) (not e!290298))))

(assert (=> b!494761 (= res!297383 (validKeyInArray!0 (select (arr!15391 a!3235) j!176)))))

(declare-fun res!297380 () Bool)

(assert (=> start!45068 (=> (not res!297380) (not e!290298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45068 (= res!297380 (validMask!0 mask!3524))))

(assert (=> start!45068 e!290298))

(assert (=> start!45068 true))

(declare-fun array_inv!11250 (array!32014) Bool)

(assert (=> start!45068 (array_inv!11250 a!3235)))

(declare-fun b!494763 () Bool)

(declare-fun res!297387 () Bool)

(assert (=> b!494763 (=> (not res!297387) (not e!290296))))

(declare-datatypes ((List!9456 0))(
  ( (Nil!9453) (Cons!9452 (h!10320 (_ BitVec 64)) (t!15676 List!9456)) )
))
(declare-fun arrayNoDuplicates!0 (array!32014 (_ BitVec 32) List!9456) Bool)

(assert (=> b!494763 (= res!297387 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9453))))

(declare-fun b!494764 () Bool)

(declare-fun res!297379 () Bool)

(assert (=> b!494764 (=> (not res!297379) (not e!290298))))

(assert (=> b!494764 (= res!297379 (and (= (size!15755 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15755 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15755 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45068 res!297380) b!494764))

(assert (= (and b!494764 res!297379) b!494761))

(assert (= (and b!494761 res!297383) b!494757))

(assert (= (and b!494757 res!297381) b!494760))

(assert (= (and b!494760 res!297385) b!494758))

(assert (= (and b!494758 res!297384) b!494762))

(assert (= (and b!494762 res!297388) b!494763))

(assert (= (and b!494763 res!297387) b!494759))

(assert (= (and b!494759 (not res!297386)) b!494755))

(assert (= (and b!494755 (not res!297382)) b!494756))

(declare-fun m!476119 () Bool)

(assert (=> b!494759 m!476119))

(declare-fun m!476121 () Bool)

(assert (=> b!494759 m!476121))

(declare-fun m!476123 () Bool)

(assert (=> b!494759 m!476123))

(declare-fun m!476125 () Bool)

(assert (=> b!494759 m!476125))

(declare-fun m!476127 () Bool)

(assert (=> b!494759 m!476127))

(assert (=> b!494759 m!476127))

(declare-fun m!476129 () Bool)

(assert (=> b!494759 m!476129))

(assert (=> b!494759 m!476119))

(declare-fun m!476131 () Bool)

(assert (=> b!494759 m!476131))

(assert (=> b!494759 m!476119))

(declare-fun m!476133 () Bool)

(assert (=> b!494759 m!476133))

(assert (=> b!494759 m!476119))

(declare-fun m!476135 () Bool)

(assert (=> b!494759 m!476135))

(assert (=> b!494759 m!476127))

(declare-fun m!476137 () Bool)

(assert (=> b!494759 m!476137))

(declare-fun m!476139 () Bool)

(assert (=> start!45068 m!476139))

(declare-fun m!476141 () Bool)

(assert (=> start!45068 m!476141))

(declare-fun m!476143 () Bool)

(assert (=> b!494758 m!476143))

(declare-fun m!476145 () Bool)

(assert (=> b!494760 m!476145))

(declare-fun m!476147 () Bool)

(assert (=> b!494762 m!476147))

(declare-fun m!476149 () Bool)

(assert (=> b!494757 m!476149))

(assert (=> b!494761 m!476119))

(assert (=> b!494761 m!476119))

(declare-fun m!476151 () Bool)

(assert (=> b!494761 m!476151))

(declare-fun m!476153 () Bool)

(assert (=> b!494763 m!476153))

(check-sat (not start!45068) (not b!494759) (not b!494758) (not b!494760) (not b!494763) (not b!494761) (not b!494757) (not b!494762))
(check-sat)
