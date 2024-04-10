; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46004 () Bool)

(assert start!46004)

(declare-fun b!509352 () Bool)

(declare-fun res!310203 () Bool)

(declare-fun e!297882 () Bool)

(assert (=> b!509352 (=> (not res!310203) (not e!297882))))

(declare-datatypes ((array!32715 0))(
  ( (array!32716 (arr!15736 (Array (_ BitVec 32) (_ BitVec 64))) (size!16100 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32715)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509352 (= res!310203 (validKeyInArray!0 (select (arr!15736 a!3235) j!176)))))

(declare-fun b!509353 () Bool)

(declare-fun res!310199 () Bool)

(assert (=> b!509353 (=> (not res!310199) (not e!297882))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509353 (= res!310199 (and (= (size!16100 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16100 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16100 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!310204 () Bool)

(assert (=> start!46004 (=> (not res!310204) (not e!297882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46004 (= res!310204 (validMask!0 mask!3524))))

(assert (=> start!46004 e!297882))

(assert (=> start!46004 true))

(declare-fun array_inv!11532 (array!32715) Bool)

(assert (=> start!46004 (array_inv!11532 a!3235)))

(declare-fun b!509354 () Bool)

(declare-fun e!297885 () Bool)

(assert (=> b!509354 (= e!297885 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!232660 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4203 0))(
  ( (MissingZero!4203 (index!19000 (_ BitVec 32))) (Found!4203 (index!19001 (_ BitVec 32))) (Intermediate!4203 (undefined!5015 Bool) (index!19002 (_ BitVec 32)) (x!47972 (_ BitVec 32))) (Undefined!4203) (MissingVacant!4203 (index!19003 (_ BitVec 32))) )
))
(declare-fun lt!232658 () SeekEntryResult!4203)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32715 (_ BitVec 32)) SeekEntryResult!4203)

(assert (=> b!509354 (= lt!232658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232660 (select (store (arr!15736 a!3235) i!1204 k0!2280) j!176) (array!32716 (store (arr!15736 a!3235) i!1204 k0!2280) (size!16100 a!3235)) mask!3524))))

(declare-fun lt!232661 () SeekEntryResult!4203)

(declare-fun lt!232663 () (_ BitVec 32))

(assert (=> b!509354 (= lt!232661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232663 (select (arr!15736 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509354 (= lt!232660 (toIndex!0 (select (store (arr!15736 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509354 (= lt!232663 (toIndex!0 (select (arr!15736 a!3235) j!176) mask!3524))))

(declare-fun e!297884 () Bool)

(assert (=> b!509354 e!297884))

(declare-fun res!310202 () Bool)

(assert (=> b!509354 (=> (not res!310202) (not e!297884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32715 (_ BitVec 32)) Bool)

(assert (=> b!509354 (= res!310202 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15664 0))(
  ( (Unit!15665) )
))
(declare-fun lt!232662 () Unit!15664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15664)

(assert (=> b!509354 (= lt!232662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509355 () Bool)

(declare-fun res!310198 () Bool)

(assert (=> b!509355 (=> (not res!310198) (not e!297882))))

(declare-fun arrayContainsKey!0 (array!32715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509355 (= res!310198 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509356 () Bool)

(assert (=> b!509356 (= e!297882 e!297885)))

(declare-fun res!310200 () Bool)

(assert (=> b!509356 (=> (not res!310200) (not e!297885))))

(declare-fun lt!232659 () SeekEntryResult!4203)

(assert (=> b!509356 (= res!310200 (or (= lt!232659 (MissingZero!4203 i!1204)) (= lt!232659 (MissingVacant!4203 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32715 (_ BitVec 32)) SeekEntryResult!4203)

(assert (=> b!509356 (= lt!232659 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509357 () Bool)

(declare-fun res!310205 () Bool)

(assert (=> b!509357 (=> (not res!310205) (not e!297882))))

(assert (=> b!509357 (= res!310205 (validKeyInArray!0 k0!2280))))

(declare-fun b!509358 () Bool)

(assert (=> b!509358 (= e!297884 (= (seekEntryOrOpen!0 (select (arr!15736 a!3235) j!176) a!3235 mask!3524) (Found!4203 j!176)))))

(declare-fun b!509359 () Bool)

(declare-fun res!310197 () Bool)

(assert (=> b!509359 (=> (not res!310197) (not e!297885))))

(declare-datatypes ((List!9894 0))(
  ( (Nil!9891) (Cons!9890 (h!10767 (_ BitVec 64)) (t!16122 List!9894)) )
))
(declare-fun arrayNoDuplicates!0 (array!32715 (_ BitVec 32) List!9894) Bool)

(assert (=> b!509359 (= res!310197 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9891))))

(declare-fun b!509360 () Bool)

(declare-fun res!310201 () Bool)

(assert (=> b!509360 (=> (not res!310201) (not e!297885))))

(assert (=> b!509360 (= res!310201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46004 res!310204) b!509353))

(assert (= (and b!509353 res!310199) b!509352))

(assert (= (and b!509352 res!310203) b!509357))

(assert (= (and b!509357 res!310205) b!509355))

(assert (= (and b!509355 res!310198) b!509356))

(assert (= (and b!509356 res!310200) b!509360))

(assert (= (and b!509360 res!310201) b!509359))

(assert (= (and b!509359 res!310197) b!509354))

(assert (= (and b!509354 res!310202) b!509358))

(declare-fun m!490209 () Bool)

(assert (=> b!509360 m!490209))

(declare-fun m!490211 () Bool)

(assert (=> b!509357 m!490211))

(declare-fun m!490213 () Bool)

(assert (=> b!509358 m!490213))

(assert (=> b!509358 m!490213))

(declare-fun m!490215 () Bool)

(assert (=> b!509358 m!490215))

(declare-fun m!490217 () Bool)

(assert (=> b!509356 m!490217))

(declare-fun m!490219 () Bool)

(assert (=> b!509359 m!490219))

(declare-fun m!490221 () Bool)

(assert (=> b!509354 m!490221))

(declare-fun m!490223 () Bool)

(assert (=> b!509354 m!490223))

(declare-fun m!490225 () Bool)

(assert (=> b!509354 m!490225))

(declare-fun m!490227 () Bool)

(assert (=> b!509354 m!490227))

(assert (=> b!509354 m!490221))

(assert (=> b!509354 m!490213))

(declare-fun m!490229 () Bool)

(assert (=> b!509354 m!490229))

(assert (=> b!509354 m!490213))

(declare-fun m!490231 () Bool)

(assert (=> b!509354 m!490231))

(assert (=> b!509354 m!490221))

(declare-fun m!490233 () Bool)

(assert (=> b!509354 m!490233))

(assert (=> b!509354 m!490213))

(declare-fun m!490235 () Bool)

(assert (=> b!509354 m!490235))

(declare-fun m!490237 () Bool)

(assert (=> b!509355 m!490237))

(declare-fun m!490239 () Bool)

(assert (=> start!46004 m!490239))

(declare-fun m!490241 () Bool)

(assert (=> start!46004 m!490241))

(assert (=> b!509352 m!490213))

(assert (=> b!509352 m!490213))

(declare-fun m!490243 () Bool)

(assert (=> b!509352 m!490243))

(check-sat (not b!509359) (not b!509358) (not b!509352) (not b!509354) (not b!509357) (not b!509360) (not b!509355) (not b!509356) (not start!46004))
(check-sat)
