; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45024 () Bool)

(assert start!45024)

(declare-fun b!494006 () Bool)

(declare-fun e!290012 () Bool)

(assert (=> b!494006 (= e!290012 true)))

(declare-datatypes ((SeekEntryResult!3836 0))(
  ( (MissingZero!3836 (index!17523 (_ BitVec 32))) (Found!3836 (index!17524 (_ BitVec 32))) (Intermediate!3836 (undefined!4648 Bool) (index!17525 (_ BitVec 32)) (x!46602 (_ BitVec 32))) (Undefined!3836) (MissingVacant!3836 (index!17526 (_ BitVec 32))) )
))
(declare-fun lt!223511 () SeekEntryResult!3836)

(assert (=> b!494006 (= lt!223511 Undefined!3836)))

(declare-fun b!494007 () Bool)

(declare-fun res!296585 () Bool)

(declare-fun e!290013 () Bool)

(assert (=> b!494007 (=> (not res!296585) (not e!290013))))

(declare-datatypes ((array!31969 0))(
  ( (array!31970 (arr!15369 (Array (_ BitVec 32) (_ BitVec 64))) (size!15733 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31969)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31969 (_ BitVec 32)) Bool)

(assert (=> b!494007 (= res!296585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!296576 () Bool)

(declare-fun e!290011 () Bool)

(assert (=> start!45024 (=> (not res!296576) (not e!290011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45024 (= res!296576 (validMask!0 mask!3524))))

(assert (=> start!45024 e!290011))

(assert (=> start!45024 true))

(declare-fun array_inv!11165 (array!31969) Bool)

(assert (=> start!45024 (array_inv!11165 a!3235)))

(declare-fun b!494008 () Bool)

(declare-fun res!296584 () Bool)

(assert (=> b!494008 (=> (not res!296584) (not e!290011))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494008 (= res!296584 (validKeyInArray!0 k!2280))))

(declare-fun b!494009 () Bool)

(assert (=> b!494009 (= e!290013 (not e!290012))))

(declare-fun res!296577 () Bool)

(assert (=> b!494009 (=> res!296577 e!290012)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223512 () (_ BitVec 32))

(declare-fun lt!223513 () SeekEntryResult!3836)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31969 (_ BitVec 32)) SeekEntryResult!3836)

(assert (=> b!494009 (= res!296577 (= lt!223513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223512 (select (store (arr!15369 a!3235) i!1204 k!2280) j!176) (array!31970 (store (arr!15369 a!3235) i!1204 k!2280) (size!15733 a!3235)) mask!3524)))))

(declare-fun lt!223515 () (_ BitVec 32))

(assert (=> b!494009 (= lt!223513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223515 (select (arr!15369 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494009 (= lt!223512 (toIndex!0 (select (store (arr!15369 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494009 (= lt!223515 (toIndex!0 (select (arr!15369 a!3235) j!176) mask!3524))))

(assert (=> b!494009 (= lt!223511 (Found!3836 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31969 (_ BitVec 32)) SeekEntryResult!3836)

(assert (=> b!494009 (= lt!223511 (seekEntryOrOpen!0 (select (arr!15369 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494009 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14618 0))(
  ( (Unit!14619) )
))
(declare-fun lt!223516 () Unit!14618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14618)

(assert (=> b!494009 (= lt!223516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494010 () Bool)

(declare-fun res!296582 () Bool)

(assert (=> b!494010 (=> (not res!296582) (not e!290011))))

(declare-fun arrayContainsKey!0 (array!31969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494010 (= res!296582 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494011 () Bool)

(declare-fun res!296580 () Bool)

(assert (=> b!494011 (=> (not res!296580) (not e!290013))))

(declare-datatypes ((List!9527 0))(
  ( (Nil!9524) (Cons!9523 (h!10391 (_ BitVec 64)) (t!15755 List!9527)) )
))
(declare-fun arrayNoDuplicates!0 (array!31969 (_ BitVec 32) List!9527) Bool)

(assert (=> b!494011 (= res!296580 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9524))))

(declare-fun b!494012 () Bool)

(declare-fun res!296581 () Bool)

(assert (=> b!494012 (=> res!296581 e!290012)))

(assert (=> b!494012 (= res!296581 (or (not (is-Intermediate!3836 lt!223513)) (not (undefined!4648 lt!223513))))))

(declare-fun b!494013 () Bool)

(declare-fun res!296583 () Bool)

(assert (=> b!494013 (=> (not res!296583) (not e!290011))))

(assert (=> b!494013 (= res!296583 (and (= (size!15733 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15733 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15733 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494014 () Bool)

(declare-fun res!296578 () Bool)

(assert (=> b!494014 (=> (not res!296578) (not e!290011))))

(assert (=> b!494014 (= res!296578 (validKeyInArray!0 (select (arr!15369 a!3235) j!176)))))

(declare-fun b!494015 () Bool)

(assert (=> b!494015 (= e!290011 e!290013)))

(declare-fun res!296579 () Bool)

(assert (=> b!494015 (=> (not res!296579) (not e!290013))))

(declare-fun lt!223514 () SeekEntryResult!3836)

(assert (=> b!494015 (= res!296579 (or (= lt!223514 (MissingZero!3836 i!1204)) (= lt!223514 (MissingVacant!3836 i!1204))))))

(assert (=> b!494015 (= lt!223514 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45024 res!296576) b!494013))

(assert (= (and b!494013 res!296583) b!494014))

(assert (= (and b!494014 res!296578) b!494008))

(assert (= (and b!494008 res!296584) b!494010))

(assert (= (and b!494010 res!296582) b!494015))

(assert (= (and b!494015 res!296579) b!494007))

(assert (= (and b!494007 res!296585) b!494011))

(assert (= (and b!494011 res!296580) b!494009))

(assert (= (and b!494009 (not res!296577)) b!494012))

(assert (= (and b!494012 (not res!296581)) b!494006))

(declare-fun m!474963 () Bool)

(assert (=> b!494010 m!474963))

(declare-fun m!474965 () Bool)

(assert (=> b!494007 m!474965))

(declare-fun m!474967 () Bool)

(assert (=> b!494008 m!474967))

(declare-fun m!474969 () Bool)

(assert (=> b!494009 m!474969))

(declare-fun m!474971 () Bool)

(assert (=> b!494009 m!474971))

(declare-fun m!474973 () Bool)

(assert (=> b!494009 m!474973))

(declare-fun m!474975 () Bool)

(assert (=> b!494009 m!474975))

(assert (=> b!494009 m!474969))

(declare-fun m!474977 () Bool)

(assert (=> b!494009 m!474977))

(declare-fun m!474979 () Bool)

(assert (=> b!494009 m!474979))

(assert (=> b!494009 m!474977))

(declare-fun m!474981 () Bool)

(assert (=> b!494009 m!474981))

(assert (=> b!494009 m!474977))

(declare-fun m!474983 () Bool)

(assert (=> b!494009 m!474983))

(assert (=> b!494009 m!474977))

(declare-fun m!474985 () Bool)

(assert (=> b!494009 m!474985))

(assert (=> b!494009 m!474969))

(declare-fun m!474987 () Bool)

(assert (=> b!494009 m!474987))

(declare-fun m!474989 () Bool)

(assert (=> b!494011 m!474989))

(declare-fun m!474991 () Bool)

(assert (=> b!494015 m!474991))

(declare-fun m!474993 () Bool)

(assert (=> start!45024 m!474993))

(declare-fun m!474995 () Bool)

(assert (=> start!45024 m!474995))

(assert (=> b!494014 m!474977))

(assert (=> b!494014 m!474977))

(declare-fun m!474997 () Bool)

(assert (=> b!494014 m!474997))

(push 1)

