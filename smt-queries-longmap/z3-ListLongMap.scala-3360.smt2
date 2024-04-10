; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46214 () Bool)

(assert start!46214)

(declare-fun res!312363 () Bool)

(declare-fun e!298969 () Bool)

(assert (=> start!46214 (=> (not res!312363) (not e!298969))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46214 (= res!312363 (validMask!0 mask!3524))))

(assert (=> start!46214 e!298969))

(assert (=> start!46214 true))

(declare-datatypes ((array!32868 0))(
  ( (array!32869 (arr!15811 (Array (_ BitVec 32) (_ BitVec 64))) (size!16175 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32868)

(declare-fun array_inv!11607 (array!32868) Bool)

(assert (=> start!46214 (array_inv!11607 a!3235)))

(declare-fun b!511700 () Bool)

(declare-fun e!298968 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511700 (= e!298968 (or (bvsgt #b00000000000000000000000000000000 (size!16175 a!3235)) (bvsle j!176 (size!16175 a!3235))))))

(declare-datatypes ((SeekEntryResult!4278 0))(
  ( (MissingZero!4278 (index!19300 (_ BitVec 32))) (Found!4278 (index!19301 (_ BitVec 32))) (Intermediate!4278 (undefined!5090 Bool) (index!19302 (_ BitVec 32)) (x!48253 (_ BitVec 32))) (Undefined!4278) (MissingVacant!4278 (index!19303 (_ BitVec 32))) )
))
(declare-fun lt!234142 () SeekEntryResult!4278)

(assert (=> b!511700 (= lt!234142 Undefined!4278)))

(declare-fun b!511701 () Bool)

(declare-fun res!312369 () Bool)

(assert (=> b!511701 (=> res!312369 e!298968)))

(declare-fun lt!234137 () SeekEntryResult!4278)

(get-info :version)

(assert (=> b!511701 (= res!312369 (or (not ((_ is Intermediate!4278) lt!234137)) (not (undefined!5090 lt!234137))))))

(declare-fun b!511702 () Bool)

(declare-fun res!312364 () Bool)

(assert (=> b!511702 (=> (not res!312364) (not e!298969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511702 (= res!312364 (validKeyInArray!0 (select (arr!15811 a!3235) j!176)))))

(declare-fun b!511703 () Bool)

(declare-fun res!312366 () Bool)

(assert (=> b!511703 (=> (not res!312366) (not e!298969))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511703 (= res!312366 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511704 () Bool)

(declare-fun res!312371 () Bool)

(declare-fun e!298970 () Bool)

(assert (=> b!511704 (=> (not res!312371) (not e!298970))))

(declare-datatypes ((List!9969 0))(
  ( (Nil!9966) (Cons!9965 (h!10845 (_ BitVec 64)) (t!16197 List!9969)) )
))
(declare-fun arrayNoDuplicates!0 (array!32868 (_ BitVec 32) List!9969) Bool)

(assert (=> b!511704 (= res!312371 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9966))))

(declare-fun b!511705 () Bool)

(declare-fun res!312365 () Bool)

(assert (=> b!511705 (=> (not res!312365) (not e!298969))))

(assert (=> b!511705 (= res!312365 (validKeyInArray!0 k0!2280))))

(declare-fun b!511706 () Bool)

(declare-fun res!312368 () Bool)

(assert (=> b!511706 (=> (not res!312368) (not e!298970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32868 (_ BitVec 32)) Bool)

(assert (=> b!511706 (= res!312368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511707 () Bool)

(assert (=> b!511707 (= e!298970 (not e!298968))))

(declare-fun res!312370 () Bool)

(assert (=> b!511707 (=> res!312370 e!298968)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234138 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32868 (_ BitVec 32)) SeekEntryResult!4278)

(assert (=> b!511707 (= res!312370 (= lt!234137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234138 (select (store (arr!15811 a!3235) i!1204 k0!2280) j!176) (array!32869 (store (arr!15811 a!3235) i!1204 k0!2280) (size!16175 a!3235)) mask!3524)))))

(declare-fun lt!234139 () (_ BitVec 32))

(assert (=> b!511707 (= lt!234137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234139 (select (arr!15811 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511707 (= lt!234138 (toIndex!0 (select (store (arr!15811 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511707 (= lt!234139 (toIndex!0 (select (arr!15811 a!3235) j!176) mask!3524))))

(assert (=> b!511707 (= lt!234142 (Found!4278 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32868 (_ BitVec 32)) SeekEntryResult!4278)

(assert (=> b!511707 (= lt!234142 (seekEntryOrOpen!0 (select (arr!15811 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511707 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15814 0))(
  ( (Unit!15815) )
))
(declare-fun lt!234140 () Unit!15814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15814)

(assert (=> b!511707 (= lt!234140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511708 () Bool)

(declare-fun res!312367 () Bool)

(assert (=> b!511708 (=> (not res!312367) (not e!298969))))

(assert (=> b!511708 (= res!312367 (and (= (size!16175 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16175 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16175 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511709 () Bool)

(assert (=> b!511709 (= e!298969 e!298970)))

(declare-fun res!312362 () Bool)

(assert (=> b!511709 (=> (not res!312362) (not e!298970))))

(declare-fun lt!234141 () SeekEntryResult!4278)

(assert (=> b!511709 (= res!312362 (or (= lt!234141 (MissingZero!4278 i!1204)) (= lt!234141 (MissingVacant!4278 i!1204))))))

(assert (=> b!511709 (= lt!234141 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46214 res!312363) b!511708))

(assert (= (and b!511708 res!312367) b!511702))

(assert (= (and b!511702 res!312364) b!511705))

(assert (= (and b!511705 res!312365) b!511703))

(assert (= (and b!511703 res!312366) b!511709))

(assert (= (and b!511709 res!312362) b!511706))

(assert (= (and b!511706 res!312368) b!511704))

(assert (= (and b!511704 res!312371) b!511707))

(assert (= (and b!511707 (not res!312370)) b!511701))

(assert (= (and b!511701 (not res!312369)) b!511700))

(declare-fun m!493209 () Bool)

(assert (=> b!511704 m!493209))

(declare-fun m!493211 () Bool)

(assert (=> b!511703 m!493211))

(declare-fun m!493213 () Bool)

(assert (=> b!511705 m!493213))

(declare-fun m!493215 () Bool)

(assert (=> b!511707 m!493215))

(declare-fun m!493217 () Bool)

(assert (=> b!511707 m!493217))

(declare-fun m!493219 () Bool)

(assert (=> b!511707 m!493219))

(declare-fun m!493221 () Bool)

(assert (=> b!511707 m!493221))

(declare-fun m!493223 () Bool)

(assert (=> b!511707 m!493223))

(assert (=> b!511707 m!493221))

(declare-fun m!493225 () Bool)

(assert (=> b!511707 m!493225))

(assert (=> b!511707 m!493221))

(declare-fun m!493227 () Bool)

(assert (=> b!511707 m!493227))

(assert (=> b!511707 m!493219))

(declare-fun m!493229 () Bool)

(assert (=> b!511707 m!493229))

(assert (=> b!511707 m!493219))

(declare-fun m!493231 () Bool)

(assert (=> b!511707 m!493231))

(assert (=> b!511707 m!493221))

(declare-fun m!493233 () Bool)

(assert (=> b!511707 m!493233))

(assert (=> b!511702 m!493221))

(assert (=> b!511702 m!493221))

(declare-fun m!493235 () Bool)

(assert (=> b!511702 m!493235))

(declare-fun m!493237 () Bool)

(assert (=> b!511706 m!493237))

(declare-fun m!493239 () Bool)

(assert (=> b!511709 m!493239))

(declare-fun m!493241 () Bool)

(assert (=> start!46214 m!493241))

(declare-fun m!493243 () Bool)

(assert (=> start!46214 m!493243))

(check-sat (not b!511709) (not b!511704) (not b!511703) (not b!511702) (not start!46214) (not b!511706) (not b!511707) (not b!511705))
(check-sat)
