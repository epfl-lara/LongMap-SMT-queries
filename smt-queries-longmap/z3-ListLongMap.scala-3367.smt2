; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46256 () Bool)

(assert start!46256)

(declare-fun b!512330 () Bool)

(declare-fun e!299223 () Bool)

(declare-fun e!299222 () Bool)

(assert (=> b!512330 (= e!299223 e!299222)))

(declare-fun res!313001 () Bool)

(assert (=> b!512330 (=> (not res!313001) (not e!299222))))

(declare-datatypes ((SeekEntryResult!4299 0))(
  ( (MissingZero!4299 (index!19384 (_ BitVec 32))) (Found!4299 (index!19385 (_ BitVec 32))) (Intermediate!4299 (undefined!5111 Bool) (index!19386 (_ BitVec 32)) (x!48330 (_ BitVec 32))) (Undefined!4299) (MissingVacant!4299 (index!19387 (_ BitVec 32))) )
))
(declare-fun lt!234517 () SeekEntryResult!4299)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512330 (= res!313001 (or (= lt!234517 (MissingZero!4299 i!1204)) (= lt!234517 (MissingVacant!4299 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32910 0))(
  ( (array!32911 (arr!15832 (Array (_ BitVec 32) (_ BitVec 64))) (size!16196 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32910)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32910 (_ BitVec 32)) SeekEntryResult!4299)

(assert (=> b!512330 (= lt!234517 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512331 () Bool)

(declare-fun e!299220 () Bool)

(assert (=> b!512331 (= e!299220 true)))

(declare-fun lt!234519 () SeekEntryResult!4299)

(assert (=> b!512331 (= lt!234519 Undefined!4299)))

(declare-fun b!512332 () Bool)

(declare-fun res!312992 () Bool)

(assert (=> b!512332 (=> res!312992 e!299220)))

(declare-fun lt!234516 () SeekEntryResult!4299)

(get-info :version)

(assert (=> b!512332 (= res!312992 (or (not ((_ is Intermediate!4299) lt!234516)) (not (undefined!5111 lt!234516))))))

(declare-fun res!312995 () Bool)

(assert (=> start!46256 (=> (not res!312995) (not e!299223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46256 (= res!312995 (validMask!0 mask!3524))))

(assert (=> start!46256 e!299223))

(assert (=> start!46256 true))

(declare-fun array_inv!11628 (array!32910) Bool)

(assert (=> start!46256 (array_inv!11628 a!3235)))

(declare-fun b!512333 () Bool)

(declare-fun res!312993 () Bool)

(assert (=> b!512333 (=> (not res!312993) (not e!299222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32910 (_ BitVec 32)) Bool)

(assert (=> b!512333 (= res!312993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512334 () Bool)

(declare-fun res!313000 () Bool)

(assert (=> b!512334 (=> (not res!313000) (not e!299223))))

(declare-fun arrayContainsKey!0 (array!32910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512334 (= res!313000 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512335 () Bool)

(declare-fun res!312996 () Bool)

(assert (=> b!512335 (=> (not res!312996) (not e!299223))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512335 (= res!312996 (and (= (size!16196 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16196 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16196 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512336 () Bool)

(declare-fun res!312994 () Bool)

(assert (=> b!512336 (=> (not res!312994) (not e!299223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512336 (= res!312994 (validKeyInArray!0 (select (arr!15832 a!3235) j!176)))))

(declare-fun b!512337 () Bool)

(declare-fun res!312997 () Bool)

(assert (=> b!512337 (=> (not res!312997) (not e!299223))))

(assert (=> b!512337 (= res!312997 (validKeyInArray!0 k0!2280))))

(declare-fun b!512338 () Bool)

(declare-fun res!312998 () Bool)

(assert (=> b!512338 (=> (not res!312998) (not e!299222))))

(declare-datatypes ((List!9990 0))(
  ( (Nil!9987) (Cons!9986 (h!10866 (_ BitVec 64)) (t!16218 List!9990)) )
))
(declare-fun arrayNoDuplicates!0 (array!32910 (_ BitVec 32) List!9990) Bool)

(assert (=> b!512338 (= res!312998 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9987))))

(declare-fun b!512339 () Bool)

(assert (=> b!512339 (= e!299222 (not e!299220))))

(declare-fun res!312999 () Bool)

(assert (=> b!512339 (=> res!312999 e!299220)))

(declare-fun lt!234515 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32910 (_ BitVec 32)) SeekEntryResult!4299)

(assert (=> b!512339 (= res!312999 (= lt!234516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234515 (select (store (arr!15832 a!3235) i!1204 k0!2280) j!176) (array!32911 (store (arr!15832 a!3235) i!1204 k0!2280) (size!16196 a!3235)) mask!3524)))))

(declare-fun lt!234520 () (_ BitVec 32))

(assert (=> b!512339 (= lt!234516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234520 (select (arr!15832 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512339 (= lt!234515 (toIndex!0 (select (store (arr!15832 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512339 (= lt!234520 (toIndex!0 (select (arr!15832 a!3235) j!176) mask!3524))))

(assert (=> b!512339 (= lt!234519 (Found!4299 j!176))))

(assert (=> b!512339 (= lt!234519 (seekEntryOrOpen!0 (select (arr!15832 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512339 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15856 0))(
  ( (Unit!15857) )
))
(declare-fun lt!234518 () Unit!15856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15856)

(assert (=> b!512339 (= lt!234518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46256 res!312995) b!512335))

(assert (= (and b!512335 res!312996) b!512336))

(assert (= (and b!512336 res!312994) b!512337))

(assert (= (and b!512337 res!312997) b!512334))

(assert (= (and b!512334 res!313000) b!512330))

(assert (= (and b!512330 res!313001) b!512333))

(assert (= (and b!512333 res!312993) b!512338))

(assert (= (and b!512338 res!312998) b!512339))

(assert (= (and b!512339 (not res!312999)) b!512332))

(assert (= (and b!512332 (not res!312992)) b!512331))

(declare-fun m!493965 () Bool)

(assert (=> b!512333 m!493965))

(declare-fun m!493967 () Bool)

(assert (=> b!512334 m!493967))

(declare-fun m!493969 () Bool)

(assert (=> b!512338 m!493969))

(declare-fun m!493971 () Bool)

(assert (=> start!46256 m!493971))

(declare-fun m!493973 () Bool)

(assert (=> start!46256 m!493973))

(declare-fun m!493975 () Bool)

(assert (=> b!512336 m!493975))

(assert (=> b!512336 m!493975))

(declare-fun m!493977 () Bool)

(assert (=> b!512336 m!493977))

(declare-fun m!493979 () Bool)

(assert (=> b!512339 m!493979))

(declare-fun m!493981 () Bool)

(assert (=> b!512339 m!493981))

(assert (=> b!512339 m!493975))

(declare-fun m!493983 () Bool)

(assert (=> b!512339 m!493983))

(assert (=> b!512339 m!493975))

(declare-fun m!493985 () Bool)

(assert (=> b!512339 m!493985))

(assert (=> b!512339 m!493975))

(declare-fun m!493987 () Bool)

(assert (=> b!512339 m!493987))

(assert (=> b!512339 m!493975))

(declare-fun m!493989 () Bool)

(assert (=> b!512339 m!493989))

(assert (=> b!512339 m!493981))

(declare-fun m!493991 () Bool)

(assert (=> b!512339 m!493991))

(declare-fun m!493993 () Bool)

(assert (=> b!512339 m!493993))

(assert (=> b!512339 m!493981))

(declare-fun m!493995 () Bool)

(assert (=> b!512339 m!493995))

(declare-fun m!493997 () Bool)

(assert (=> b!512337 m!493997))

(declare-fun m!493999 () Bool)

(assert (=> b!512330 m!493999))

(check-sat (not start!46256) (not b!512330) (not b!512336) (not b!512339) (not b!512337) (not b!512334) (not b!512333) (not b!512338))
(check-sat)
