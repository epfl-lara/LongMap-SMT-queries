; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44286 () Bool)

(assert start!44286)

(declare-fun b!486873 () Bool)

(declare-fun res!290405 () Bool)

(declare-fun e!286492 () Bool)

(assert (=> b!486873 (=> (not res!290405) (not e!286492))))

(declare-datatypes ((array!31547 0))(
  ( (array!31548 (arr!15167 (Array (_ BitVec 32) (_ BitVec 64))) (size!15532 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31547)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31547 (_ BitVec 32)) Bool)

(assert (=> b!486873 (= res!290405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486874 () Bool)

(declare-fun res!290404 () Bool)

(assert (=> b!486874 (=> (not res!290404) (not e!286492))))

(declare-datatypes ((List!9364 0))(
  ( (Nil!9361) (Cons!9360 (h!10216 (_ BitVec 64)) (t!15583 List!9364)) )
))
(declare-fun arrayNoDuplicates!0 (array!31547 (_ BitVec 32) List!9364) Bool)

(assert (=> b!486874 (= res!290404 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9361))))

(declare-fun b!486875 () Bool)

(declare-fun res!290401 () Bool)

(declare-fun e!286493 () Bool)

(assert (=> b!486875 (=> (not res!290401) (not e!286493))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486875 (= res!290401 (validKeyInArray!0 (select (arr!15167 a!3235) j!176)))))

(declare-fun res!290402 () Bool)

(assert (=> start!44286 (=> (not res!290402) (not e!286493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44286 (= res!290402 (validMask!0 mask!3524))))

(assert (=> start!44286 e!286493))

(assert (=> start!44286 true))

(declare-fun array_inv!11050 (array!31547) Bool)

(assert (=> start!44286 (array_inv!11050 a!3235)))

(declare-fun b!486876 () Bool)

(assert (=> b!486876 (= e!286492 (not true))))

(assert (=> b!486876 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14194 0))(
  ( (Unit!14195) )
))
(declare-fun lt!219717 () Unit!14194)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14194)

(assert (=> b!486876 (= lt!219717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!486877 () Bool)

(declare-fun res!290407 () Bool)

(assert (=> b!486877 (=> (not res!290407) (not e!286493))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486877 (= res!290407 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486878 () Bool)

(assert (=> b!486878 (= e!286493 e!286492)))

(declare-fun res!290406 () Bool)

(assert (=> b!486878 (=> (not res!290406) (not e!286492))))

(declare-datatypes ((SeekEntryResult!3631 0))(
  ( (MissingZero!3631 (index!16703 (_ BitVec 32))) (Found!3631 (index!16704 (_ BitVec 32))) (Intermediate!3631 (undefined!4443 Bool) (index!16705 (_ BitVec 32)) (x!45838 (_ BitVec 32))) (Undefined!3631) (MissingVacant!3631 (index!16706 (_ BitVec 32))) )
))
(declare-fun lt!219718 () SeekEntryResult!3631)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486878 (= res!290406 (or (= lt!219718 (MissingZero!3631 i!1204)) (= lt!219718 (MissingVacant!3631 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31547 (_ BitVec 32)) SeekEntryResult!3631)

(assert (=> b!486878 (= lt!219718 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486879 () Bool)

(declare-fun res!290403 () Bool)

(assert (=> b!486879 (=> (not res!290403) (not e!286493))))

(assert (=> b!486879 (= res!290403 (and (= (size!15532 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15532 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15532 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486880 () Bool)

(declare-fun res!290408 () Bool)

(assert (=> b!486880 (=> (not res!290408) (not e!286493))))

(assert (=> b!486880 (= res!290408 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44286 res!290402) b!486879))

(assert (= (and b!486879 res!290403) b!486875))

(assert (= (and b!486875 res!290401) b!486880))

(assert (= (and b!486880 res!290408) b!486877))

(assert (= (and b!486877 res!290407) b!486878))

(assert (= (and b!486878 res!290406) b!486873))

(assert (= (and b!486873 res!290405) b!486874))

(assert (= (and b!486874 res!290404) b!486876))

(declare-fun m!466237 () Bool)

(assert (=> b!486873 m!466237))

(declare-fun m!466239 () Bool)

(assert (=> b!486878 m!466239))

(declare-fun m!466241 () Bool)

(assert (=> b!486880 m!466241))

(declare-fun m!466243 () Bool)

(assert (=> b!486877 m!466243))

(declare-fun m!466245 () Bool)

(assert (=> b!486875 m!466245))

(assert (=> b!486875 m!466245))

(declare-fun m!466247 () Bool)

(assert (=> b!486875 m!466247))

(declare-fun m!466249 () Bool)

(assert (=> start!44286 m!466249))

(declare-fun m!466251 () Bool)

(assert (=> start!44286 m!466251))

(declare-fun m!466253 () Bool)

(assert (=> b!486876 m!466253))

(declare-fun m!466255 () Bool)

(assert (=> b!486876 m!466255))

(declare-fun m!466257 () Bool)

(assert (=> b!486874 m!466257))

(check-sat (not b!486876) (not b!486874) (not b!486880) (not b!486877) (not start!44286) (not b!486878) (not b!486873) (not b!486875))
(check-sat)
