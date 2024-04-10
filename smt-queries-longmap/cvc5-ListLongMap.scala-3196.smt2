; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44862 () Bool)

(assert start!44862)

(declare-fun b!492246 () Bool)

(declare-fun res!295002 () Bool)

(declare-fun e!289187 () Bool)

(assert (=> b!492246 (=> (not res!295002) (not e!289187))))

(declare-datatypes ((array!31864 0))(
  ( (array!31865 (arr!15318 (Array (_ BitVec 32) (_ BitVec 64))) (size!15682 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31864)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492246 (= res!295002 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492247 () Bool)

(declare-fun e!289185 () Bool)

(assert (=> b!492247 (= e!289185 (not true))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3785 0))(
  ( (MissingZero!3785 (index!17319 (_ BitVec 32))) (Found!3785 (index!17320 (_ BitVec 32))) (Intermediate!3785 (undefined!4597 Bool) (index!17321 (_ BitVec 32)) (x!46409 (_ BitVec 32))) (Undefined!3785) (MissingVacant!3785 (index!17322 (_ BitVec 32))) )
))
(declare-fun lt!222537 () SeekEntryResult!3785)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222538 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31864 (_ BitVec 32)) SeekEntryResult!3785)

(assert (=> b!492247 (= lt!222537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222538 (select (store (arr!15318 a!3235) i!1204 k!2280) j!176) (array!31865 (store (arr!15318 a!3235) i!1204 k!2280) (size!15682 a!3235)) mask!3524))))

(declare-fun lt!222536 () SeekEntryResult!3785)

(declare-fun lt!222541 () (_ BitVec 32))

(assert (=> b!492247 (= lt!222536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222541 (select (arr!15318 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492247 (= lt!222538 (toIndex!0 (select (store (arr!15318 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!492247 (= lt!222541 (toIndex!0 (select (arr!15318 a!3235) j!176) mask!3524))))

(declare-fun e!289188 () Bool)

(assert (=> b!492247 e!289188))

(declare-fun res!295005 () Bool)

(assert (=> b!492247 (=> (not res!295005) (not e!289188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31864 (_ BitVec 32)) Bool)

(assert (=> b!492247 (= res!295005 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14516 0))(
  ( (Unit!14517) )
))
(declare-fun lt!222540 () Unit!14516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14516)

(assert (=> b!492247 (= lt!222540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492248 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31864 (_ BitVec 32)) SeekEntryResult!3785)

(assert (=> b!492248 (= e!289188 (= (seekEntryOrOpen!0 (select (arr!15318 a!3235) j!176) a!3235 mask!3524) (Found!3785 j!176)))))

(declare-fun b!492249 () Bool)

(declare-fun res!294999 () Bool)

(assert (=> b!492249 (=> (not res!294999) (not e!289185))))

(assert (=> b!492249 (= res!294999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!295007 () Bool)

(assert (=> start!44862 (=> (not res!295007) (not e!289187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44862 (= res!295007 (validMask!0 mask!3524))))

(assert (=> start!44862 e!289187))

(assert (=> start!44862 true))

(declare-fun array_inv!11114 (array!31864) Bool)

(assert (=> start!44862 (array_inv!11114 a!3235)))

(declare-fun b!492250 () Bool)

(declare-fun res!295004 () Bool)

(assert (=> b!492250 (=> (not res!295004) (not e!289187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492250 (= res!295004 (validKeyInArray!0 k!2280))))

(declare-fun b!492251 () Bool)

(assert (=> b!492251 (= e!289187 e!289185)))

(declare-fun res!295001 () Bool)

(assert (=> b!492251 (=> (not res!295001) (not e!289185))))

(declare-fun lt!222539 () SeekEntryResult!3785)

(assert (=> b!492251 (= res!295001 (or (= lt!222539 (MissingZero!3785 i!1204)) (= lt!222539 (MissingVacant!3785 i!1204))))))

(assert (=> b!492251 (= lt!222539 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492252 () Bool)

(declare-fun res!295000 () Bool)

(assert (=> b!492252 (=> (not res!295000) (not e!289187))))

(assert (=> b!492252 (= res!295000 (and (= (size!15682 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15682 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15682 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492253 () Bool)

(declare-fun res!295003 () Bool)

(assert (=> b!492253 (=> (not res!295003) (not e!289185))))

(declare-datatypes ((List!9476 0))(
  ( (Nil!9473) (Cons!9472 (h!10337 (_ BitVec 64)) (t!15704 List!9476)) )
))
(declare-fun arrayNoDuplicates!0 (array!31864 (_ BitVec 32) List!9476) Bool)

(assert (=> b!492253 (= res!295003 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9473))))

(declare-fun b!492254 () Bool)

(declare-fun res!295006 () Bool)

(assert (=> b!492254 (=> (not res!295006) (not e!289187))))

(assert (=> b!492254 (= res!295006 (validKeyInArray!0 (select (arr!15318 a!3235) j!176)))))

(assert (= (and start!44862 res!295007) b!492252))

(assert (= (and b!492252 res!295000) b!492254))

(assert (= (and b!492254 res!295006) b!492250))

(assert (= (and b!492250 res!295004) b!492246))

(assert (= (and b!492246 res!295002) b!492251))

(assert (= (and b!492251 res!295001) b!492249))

(assert (= (and b!492249 res!294999) b!492253))

(assert (= (and b!492253 res!295003) b!492247))

(assert (= (and b!492247 res!295005) b!492248))

(declare-fun m!472923 () Bool)

(assert (=> b!492250 m!472923))

(declare-fun m!472925 () Bool)

(assert (=> b!492253 m!472925))

(declare-fun m!472927 () Bool)

(assert (=> b!492248 m!472927))

(assert (=> b!492248 m!472927))

(declare-fun m!472929 () Bool)

(assert (=> b!492248 m!472929))

(declare-fun m!472931 () Bool)

(assert (=> b!492249 m!472931))

(declare-fun m!472933 () Bool)

(assert (=> b!492247 m!472933))

(declare-fun m!472935 () Bool)

(assert (=> b!492247 m!472935))

(assert (=> b!492247 m!472927))

(declare-fun m!472937 () Bool)

(assert (=> b!492247 m!472937))

(assert (=> b!492247 m!472927))

(assert (=> b!492247 m!472935))

(declare-fun m!472939 () Bool)

(assert (=> b!492247 m!472939))

(declare-fun m!472941 () Bool)

(assert (=> b!492247 m!472941))

(assert (=> b!492247 m!472935))

(declare-fun m!472943 () Bool)

(assert (=> b!492247 m!472943))

(assert (=> b!492247 m!472927))

(declare-fun m!472945 () Bool)

(assert (=> b!492247 m!472945))

(declare-fun m!472947 () Bool)

(assert (=> b!492247 m!472947))

(assert (=> b!492254 m!472927))

(assert (=> b!492254 m!472927))

(declare-fun m!472949 () Bool)

(assert (=> b!492254 m!472949))

(declare-fun m!472951 () Bool)

(assert (=> start!44862 m!472951))

(declare-fun m!472953 () Bool)

(assert (=> start!44862 m!472953))

(declare-fun m!472955 () Bool)

(assert (=> b!492251 m!472955))

(declare-fun m!472957 () Bool)

(assert (=> b!492246 m!472957))

(push 1)

