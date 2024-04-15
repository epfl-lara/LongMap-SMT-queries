; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46086 () Bool)

(assert start!46086)

(declare-fun b!510350 () Bool)

(declare-fun res!311342 () Bool)

(declare-fun e!298275 () Bool)

(assert (=> b!510350 (=> (not res!311342) (not e!298275))))

(declare-datatypes ((array!32807 0))(
  ( (array!32808 (arr!15782 (Array (_ BitVec 32) (_ BitVec 64))) (size!16147 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32807)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510350 (= res!311342 (validKeyInArray!0 (select (arr!15782 a!3235) j!176)))))

(declare-fun b!510351 () Bool)

(declare-fun res!311344 () Bool)

(assert (=> b!510351 (=> (not res!311344) (not e!298275))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510351 (= res!311344 (and (= (size!16147 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16147 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16147 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510352 () Bool)

(declare-fun res!311340 () Bool)

(declare-fun e!298274 () Bool)

(assert (=> b!510352 (=> (not res!311340) (not e!298274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32807 (_ BitVec 32)) Bool)

(assert (=> b!510352 (= res!311340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510353 () Bool)

(declare-fun res!311337 () Bool)

(assert (=> b!510353 (=> (not res!311337) (not e!298274))))

(declare-datatypes ((List!9979 0))(
  ( (Nil!9976) (Cons!9975 (h!10852 (_ BitVec 64)) (t!16198 List!9979)) )
))
(declare-fun arrayNoDuplicates!0 (array!32807 (_ BitVec 32) List!9979) Bool)

(assert (=> b!510353 (= res!311337 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9976))))

(declare-fun b!510354 () Bool)

(assert (=> b!510354 (= e!298275 e!298274)))

(declare-fun res!311338 () Bool)

(assert (=> b!510354 (=> (not res!311338) (not e!298274))))

(declare-datatypes ((SeekEntryResult!4246 0))(
  ( (MissingZero!4246 (index!19172 (_ BitVec 32))) (Found!4246 (index!19173 (_ BitVec 32))) (Intermediate!4246 (undefined!5058 Bool) (index!19174 (_ BitVec 32)) (x!48138 (_ BitVec 32))) (Undefined!4246) (MissingVacant!4246 (index!19175 (_ BitVec 32))) )
))
(declare-fun lt!233275 () SeekEntryResult!4246)

(assert (=> b!510354 (= res!311338 (or (= lt!233275 (MissingZero!4246 i!1204)) (= lt!233275 (MissingVacant!4246 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32807 (_ BitVec 32)) SeekEntryResult!4246)

(assert (=> b!510354 (= lt!233275 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510355 () Bool)

(declare-fun res!311345 () Bool)

(assert (=> b!510355 (=> (not res!311345) (not e!298275))))

(assert (=> b!510355 (= res!311345 (validKeyInArray!0 k0!2280))))

(declare-fun b!510356 () Bool)

(declare-fun e!298273 () Bool)

(assert (=> b!510356 (= e!298273 true)))

(declare-fun lt!233270 () (_ BitVec 64))

(declare-fun lt!233271 () array!32807)

(declare-fun lt!233272 () SeekEntryResult!4246)

(assert (=> b!510356 (= lt!233272 (seekEntryOrOpen!0 lt!233270 lt!233271 mask!3524))))

(declare-datatypes ((Unit!15736 0))(
  ( (Unit!15737) )
))
(declare-fun lt!233274 () Unit!15736)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32807 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15736)

(assert (=> b!510356 (= lt!233274 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!311339 () Bool)

(assert (=> start!46086 (=> (not res!311339) (not e!298275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46086 (= res!311339 (validMask!0 mask!3524))))

(assert (=> start!46086 e!298275))

(assert (=> start!46086 true))

(declare-fun array_inv!11665 (array!32807) Bool)

(assert (=> start!46086 (array_inv!11665 a!3235)))

(declare-fun b!510357 () Bool)

(declare-fun res!311341 () Bool)

(assert (=> b!510357 (=> (not res!311341) (not e!298275))))

(declare-fun arrayContainsKey!0 (array!32807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510357 (= res!311341 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510358 () Bool)

(assert (=> b!510358 (= e!298274 (not e!298273))))

(declare-fun res!311343 () Bool)

(assert (=> b!510358 (=> res!311343 e!298273)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32807 (_ BitVec 32)) SeekEntryResult!4246)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510358 (= res!311343 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15782 a!3235) j!176) mask!3524) (select (arr!15782 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233270 mask!3524) lt!233270 lt!233271 mask!3524))))))

(assert (=> b!510358 (= lt!233270 (select (store (arr!15782 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510358 (= lt!233271 (array!32808 (store (arr!15782 a!3235) i!1204 k0!2280) (size!16147 a!3235)))))

(assert (=> b!510358 (= lt!233272 (Found!4246 j!176))))

(assert (=> b!510358 (= lt!233272 (seekEntryOrOpen!0 (select (arr!15782 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510358 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233273 () Unit!15736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15736)

(assert (=> b!510358 (= lt!233273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46086 res!311339) b!510351))

(assert (= (and b!510351 res!311344) b!510350))

(assert (= (and b!510350 res!311342) b!510355))

(assert (= (and b!510355 res!311345) b!510357))

(assert (= (and b!510357 res!311341) b!510354))

(assert (= (and b!510354 res!311338) b!510352))

(assert (= (and b!510352 res!311340) b!510353))

(assert (= (and b!510353 res!311337) b!510358))

(assert (= (and b!510358 (not res!311343)) b!510356))

(declare-fun m!491221 () Bool)

(assert (=> b!510357 m!491221))

(declare-fun m!491223 () Bool)

(assert (=> b!510356 m!491223))

(declare-fun m!491225 () Bool)

(assert (=> b!510356 m!491225))

(declare-fun m!491227 () Bool)

(assert (=> b!510352 m!491227))

(declare-fun m!491229 () Bool)

(assert (=> b!510350 m!491229))

(assert (=> b!510350 m!491229))

(declare-fun m!491231 () Bool)

(assert (=> b!510350 m!491231))

(declare-fun m!491233 () Bool)

(assert (=> b!510354 m!491233))

(declare-fun m!491235 () Bool)

(assert (=> b!510353 m!491235))

(declare-fun m!491237 () Bool)

(assert (=> start!46086 m!491237))

(declare-fun m!491239 () Bool)

(assert (=> start!46086 m!491239))

(declare-fun m!491241 () Bool)

(assert (=> b!510355 m!491241))

(declare-fun m!491243 () Bool)

(assert (=> b!510358 m!491243))

(declare-fun m!491245 () Bool)

(assert (=> b!510358 m!491245))

(declare-fun m!491247 () Bool)

(assert (=> b!510358 m!491247))

(declare-fun m!491249 () Bool)

(assert (=> b!510358 m!491249))

(assert (=> b!510358 m!491229))

(declare-fun m!491251 () Bool)

(assert (=> b!510358 m!491251))

(assert (=> b!510358 m!491229))

(assert (=> b!510358 m!491249))

(declare-fun m!491253 () Bool)

(assert (=> b!510358 m!491253))

(declare-fun m!491255 () Bool)

(assert (=> b!510358 m!491255))

(declare-fun m!491257 () Bool)

(assert (=> b!510358 m!491257))

(assert (=> b!510358 m!491229))

(assert (=> b!510358 m!491229))

(declare-fun m!491259 () Bool)

(assert (=> b!510358 m!491259))

(assert (=> b!510358 m!491255))

(check-sat (not b!510353) (not b!510350) (not start!46086) (not b!510358) (not b!510352) (not b!510356) (not b!510357) (not b!510355) (not b!510354))
(check-sat)
