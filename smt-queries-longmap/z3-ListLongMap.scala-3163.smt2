; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44592 () Bool)

(assert start!44592)

(declare-fun b!488968 () Bool)

(declare-fun res!292046 () Bool)

(declare-fun e!287597 () Bool)

(assert (=> b!488968 (=> (not res!292046) (not e!287597))))

(declare-datatypes ((array!31661 0))(
  ( (array!31662 (arr!15218 (Array (_ BitVec 32) (_ BitVec 64))) (size!15583 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31661)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488968 (= res!292046 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488969 () Bool)

(declare-fun e!287594 () Bool)

(declare-fun e!287595 () Bool)

(assert (=> b!488969 (= e!287594 (not e!287595))))

(declare-fun res!292053 () Bool)

(assert (=> b!488969 (=> res!292053 e!287595)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!220485 () (_ BitVec 32))

(assert (=> b!488969 (= res!292053 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvslt lt!220485 #b00000000000000000000000000000000) (bvsge lt!220485 (bvadd #b00000000000000000000000000000001 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488969 (= lt!220485 (toIndex!0 (select (store (arr!15218 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287596 () Bool)

(assert (=> b!488969 e!287596))

(declare-fun res!292050 () Bool)

(assert (=> b!488969 (=> (not res!292050) (not e!287596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31661 (_ BitVec 32)) Bool)

(assert (=> b!488969 (= res!292050 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14296 0))(
  ( (Unit!14297) )
))
(declare-fun lt!220484 () Unit!14296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14296)

(assert (=> b!488969 (= lt!220484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488970 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488970 (= e!287595 (validKeyInArray!0 (select (store (arr!15218 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun b!488972 () Bool)

(declare-fun res!292055 () Bool)

(assert (=> b!488972 (=> (not res!292055) (not e!287594))))

(assert (=> b!488972 (= res!292055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488973 () Bool)

(assert (=> b!488973 (= e!287597 e!287594)))

(declare-fun res!292052 () Bool)

(assert (=> b!488973 (=> (not res!292052) (not e!287594))))

(declare-datatypes ((SeekEntryResult!3682 0))(
  ( (MissingZero!3682 (index!16907 (_ BitVec 32))) (Found!3682 (index!16908 (_ BitVec 32))) (Intermediate!3682 (undefined!4494 Bool) (index!16909 (_ BitVec 32)) (x!46031 (_ BitVec 32))) (Undefined!3682) (MissingVacant!3682 (index!16910 (_ BitVec 32))) )
))
(declare-fun lt!220486 () SeekEntryResult!3682)

(assert (=> b!488973 (= res!292052 (or (= lt!220486 (MissingZero!3682 i!1204)) (= lt!220486 (MissingVacant!3682 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31661 (_ BitVec 32)) SeekEntryResult!3682)

(assert (=> b!488973 (= lt!220486 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488974 () Bool)

(declare-fun res!292051 () Bool)

(assert (=> b!488974 (=> (not res!292051) (not e!287597))))

(assert (=> b!488974 (= res!292051 (validKeyInArray!0 (select (arr!15218 a!3235) j!176)))))

(declare-fun b!488975 () Bool)

(declare-fun res!292048 () Bool)

(assert (=> b!488975 (=> (not res!292048) (not e!287597))))

(assert (=> b!488975 (= res!292048 (validKeyInArray!0 k0!2280))))

(declare-fun b!488976 () Bool)

(declare-fun res!292049 () Bool)

(assert (=> b!488976 (=> (not res!292049) (not e!287594))))

(declare-datatypes ((List!9415 0))(
  ( (Nil!9412) (Cons!9411 (h!10273 (_ BitVec 64)) (t!15634 List!9415)) )
))
(declare-fun arrayNoDuplicates!0 (array!31661 (_ BitVec 32) List!9415) Bool)

(assert (=> b!488976 (= res!292049 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9412))))

(declare-fun b!488977 () Bool)

(declare-fun res!292054 () Bool)

(assert (=> b!488977 (=> (not res!292054) (not e!287597))))

(assert (=> b!488977 (= res!292054 (and (= (size!15583 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15583 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15583 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488971 () Bool)

(assert (=> b!488971 (= e!287596 (= (seekEntryOrOpen!0 (select (arr!15218 a!3235) j!176) a!3235 mask!3524) (Found!3682 j!176)))))

(declare-fun res!292047 () Bool)

(assert (=> start!44592 (=> (not res!292047) (not e!287597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44592 (= res!292047 (validMask!0 mask!3524))))

(assert (=> start!44592 e!287597))

(assert (=> start!44592 true))

(declare-fun array_inv!11101 (array!31661) Bool)

(assert (=> start!44592 (array_inv!11101 a!3235)))

(assert (= (and start!44592 res!292047) b!488977))

(assert (= (and b!488977 res!292054) b!488974))

(assert (= (and b!488974 res!292051) b!488975))

(assert (= (and b!488975 res!292048) b!488968))

(assert (= (and b!488968 res!292046) b!488973))

(assert (= (and b!488973 res!292052) b!488972))

(assert (= (and b!488972 res!292055) b!488976))

(assert (= (and b!488976 res!292049) b!488969))

(assert (= (and b!488969 res!292050) b!488971))

(assert (= (and b!488969 (not res!292053)) b!488970))

(declare-fun m!468217 () Bool)

(assert (=> b!488975 m!468217))

(declare-fun m!468219 () Bool)

(assert (=> b!488969 m!468219))

(declare-fun m!468221 () Bool)

(assert (=> b!488969 m!468221))

(declare-fun m!468223 () Bool)

(assert (=> b!488969 m!468223))

(declare-fun m!468225 () Bool)

(assert (=> b!488969 m!468225))

(assert (=> b!488969 m!468223))

(declare-fun m!468227 () Bool)

(assert (=> b!488969 m!468227))

(declare-fun m!468229 () Bool)

(assert (=> b!488972 m!468229))

(assert (=> b!488970 m!468219))

(assert (=> b!488970 m!468223))

(assert (=> b!488970 m!468223))

(declare-fun m!468231 () Bool)

(assert (=> b!488970 m!468231))

(declare-fun m!468233 () Bool)

(assert (=> b!488971 m!468233))

(assert (=> b!488971 m!468233))

(declare-fun m!468235 () Bool)

(assert (=> b!488971 m!468235))

(declare-fun m!468237 () Bool)

(assert (=> b!488976 m!468237))

(declare-fun m!468239 () Bool)

(assert (=> start!44592 m!468239))

(declare-fun m!468241 () Bool)

(assert (=> start!44592 m!468241))

(declare-fun m!468243 () Bool)

(assert (=> b!488973 m!468243))

(assert (=> b!488974 m!468233))

(assert (=> b!488974 m!468233))

(declare-fun m!468245 () Bool)

(assert (=> b!488974 m!468245))

(declare-fun m!468247 () Bool)

(assert (=> b!488968 m!468247))

(check-sat (not b!488974) (not b!488975) (not b!488976) (not b!488972) (not b!488971) (not b!488968) (not b!488973) (not b!488970) (not start!44592) (not b!488969))
(check-sat)
