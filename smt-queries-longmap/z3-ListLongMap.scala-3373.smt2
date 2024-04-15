; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46398 () Bool)

(assert start!46398)

(declare-fun b!513153 () Bool)

(declare-fun res!313598 () Bool)

(declare-fun e!299646 () Bool)

(assert (=> b!513153 (=> (not res!313598) (not e!299646))))

(declare-datatypes ((array!32948 0))(
  ( (array!32949 (arr!15848 (Array (_ BitVec 32) (_ BitVec 64))) (size!16213 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32948)

(declare-datatypes ((List!10045 0))(
  ( (Nil!10042) (Cons!10041 (h!10927 (_ BitVec 64)) (t!16264 List!10045)) )
))
(declare-fun arrayNoDuplicates!0 (array!32948 (_ BitVec 32) List!10045) Bool)

(assert (=> b!513153 (= res!313598 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10042))))

(declare-fun b!513154 () Bool)

(declare-fun e!299643 () Bool)

(assert (=> b!513154 (= e!299643 true)))

(declare-datatypes ((SeekEntryResult!4312 0))(
  ( (MissingZero!4312 (index!19436 (_ BitVec 32))) (Found!4312 (index!19437 (_ BitVec 32))) (Intermediate!4312 (undefined!5124 Bool) (index!19438 (_ BitVec 32)) (x!48398 (_ BitVec 32))) (Undefined!4312) (MissingVacant!4312 (index!19439 (_ BitVec 32))) )
))
(declare-fun lt!234827 () SeekEntryResult!4312)

(assert (=> b!513154 (bvslt (x!48398 lt!234827) #b01111111111111111111111111111110)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!513155 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!299645 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32948 (_ BitVec 32)) SeekEntryResult!4312)

(assert (=> b!513155 (= e!299645 (= (seekEntryOrOpen!0 (select (arr!15848 a!3235) j!176) a!3235 mask!3524) (Found!4312 j!176)))))

(declare-fun b!513156 () Bool)

(declare-fun res!313596 () Bool)

(declare-fun e!299642 () Bool)

(assert (=> b!513156 (=> (not res!313596) (not e!299642))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513156 (= res!313596 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!313594 () Bool)

(assert (=> start!46398 (=> (not res!313594) (not e!299642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46398 (= res!313594 (validMask!0 mask!3524))))

(assert (=> start!46398 e!299642))

(assert (=> start!46398 true))

(declare-fun array_inv!11731 (array!32948) Bool)

(assert (=> start!46398 (array_inv!11731 a!3235)))

(declare-fun b!513157 () Bool)

(declare-fun res!313600 () Bool)

(assert (=> b!513157 (=> (not res!313600) (not e!299642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513157 (= res!313600 (validKeyInArray!0 (select (arr!15848 a!3235) j!176)))))

(declare-fun b!513158 () Bool)

(declare-fun res!313593 () Bool)

(assert (=> b!513158 (=> (not res!313593) (not e!299642))))

(assert (=> b!513158 (= res!313593 (validKeyInArray!0 k0!2280))))

(declare-fun b!513159 () Bool)

(assert (=> b!513159 (= e!299646 (not e!299643))))

(declare-fun res!313592 () Bool)

(assert (=> b!513159 (=> res!313592 e!299643)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234826 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32948 (_ BitVec 32)) SeekEntryResult!4312)

(assert (=> b!513159 (= res!313592 (= lt!234827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234826 (select (store (arr!15848 a!3235) i!1204 k0!2280) j!176) (array!32949 (store (arr!15848 a!3235) i!1204 k0!2280) (size!16213 a!3235)) mask!3524)))))

(declare-fun lt!234825 () (_ BitVec 32))

(assert (=> b!513159 (= lt!234827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234825 (select (arr!15848 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513159 (= lt!234826 (toIndex!0 (select (store (arr!15848 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513159 (= lt!234825 (toIndex!0 (select (arr!15848 a!3235) j!176) mask!3524))))

(assert (=> b!513159 e!299645))

(declare-fun res!313601 () Bool)

(assert (=> b!513159 (=> (not res!313601) (not e!299645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32948 (_ BitVec 32)) Bool)

(assert (=> b!513159 (= res!313601 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15868 0))(
  ( (Unit!15869) )
))
(declare-fun lt!234828 () Unit!15868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15868)

(assert (=> b!513159 (= lt!234828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513160 () Bool)

(declare-fun res!313595 () Bool)

(assert (=> b!513160 (=> (not res!313595) (not e!299646))))

(assert (=> b!513160 (= res!313595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513161 () Bool)

(assert (=> b!513161 (= e!299642 e!299646)))

(declare-fun res!313591 () Bool)

(assert (=> b!513161 (=> (not res!313591) (not e!299646))))

(declare-fun lt!234829 () SeekEntryResult!4312)

(assert (=> b!513161 (= res!313591 (or (= lt!234829 (MissingZero!4312 i!1204)) (= lt!234829 (MissingVacant!4312 i!1204))))))

(assert (=> b!513161 (= lt!234829 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!513162 () Bool)

(declare-fun res!313599 () Bool)

(assert (=> b!513162 (=> (not res!313599) (not e!299642))))

(assert (=> b!513162 (= res!313599 (and (= (size!16213 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16213 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16213 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513163 () Bool)

(declare-fun res!313597 () Bool)

(assert (=> b!513163 (=> res!313597 e!299643)))

(get-info :version)

(assert (=> b!513163 (= res!313597 (or (undefined!5124 lt!234827) (not ((_ is Intermediate!4312) lt!234827))))))

(assert (= (and start!46398 res!313594) b!513162))

(assert (= (and b!513162 res!313599) b!513157))

(assert (= (and b!513157 res!313600) b!513158))

(assert (= (and b!513158 res!313593) b!513156))

(assert (= (and b!513156 res!313596) b!513161))

(assert (= (and b!513161 res!313591) b!513160))

(assert (= (and b!513160 res!313595) b!513153))

(assert (= (and b!513153 res!313598) b!513159))

(assert (= (and b!513159 res!313601) b!513155))

(assert (= (and b!513159 (not res!313592)) b!513163))

(assert (= (and b!513163 (not res!313597)) b!513154))

(declare-fun m!494233 () Bool)

(assert (=> b!513157 m!494233))

(assert (=> b!513157 m!494233))

(declare-fun m!494235 () Bool)

(assert (=> b!513157 m!494235))

(declare-fun m!494237 () Bool)

(assert (=> b!513159 m!494237))

(declare-fun m!494239 () Bool)

(assert (=> b!513159 m!494239))

(declare-fun m!494241 () Bool)

(assert (=> b!513159 m!494241))

(assert (=> b!513159 m!494233))

(declare-fun m!494243 () Bool)

(assert (=> b!513159 m!494243))

(assert (=> b!513159 m!494233))

(declare-fun m!494245 () Bool)

(assert (=> b!513159 m!494245))

(assert (=> b!513159 m!494241))

(declare-fun m!494247 () Bool)

(assert (=> b!513159 m!494247))

(assert (=> b!513159 m!494233))

(declare-fun m!494249 () Bool)

(assert (=> b!513159 m!494249))

(assert (=> b!513159 m!494241))

(declare-fun m!494251 () Bool)

(assert (=> b!513159 m!494251))

(declare-fun m!494253 () Bool)

(assert (=> b!513158 m!494253))

(declare-fun m!494255 () Bool)

(assert (=> b!513161 m!494255))

(declare-fun m!494257 () Bool)

(assert (=> b!513156 m!494257))

(declare-fun m!494259 () Bool)

(assert (=> start!46398 m!494259))

(declare-fun m!494261 () Bool)

(assert (=> start!46398 m!494261))

(assert (=> b!513155 m!494233))

(assert (=> b!513155 m!494233))

(declare-fun m!494263 () Bool)

(assert (=> b!513155 m!494263))

(declare-fun m!494265 () Bool)

(assert (=> b!513153 m!494265))

(declare-fun m!494267 () Bool)

(assert (=> b!513160 m!494267))

(check-sat (not b!513156) (not b!513153) (not b!513159) (not b!513158) (not b!513160) (not b!513157) (not b!513155) (not b!513161) (not start!46398))
(check-sat)
