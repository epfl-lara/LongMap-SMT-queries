; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45772 () Bool)

(assert start!45772)

(declare-fun b!506521 () Bool)

(declare-fun res!307480 () Bool)

(declare-fun e!296462 () Bool)

(assert (=> b!506521 (=> (not res!307480) (not e!296462))))

(declare-datatypes ((array!32528 0))(
  ( (array!32529 (arr!15644 (Array (_ BitVec 32) (_ BitVec 64))) (size!16008 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32528)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506521 (= res!307480 (validKeyInArray!0 (select (arr!15644 a!3235) j!176)))))

(declare-fun b!506522 () Bool)

(declare-fun res!307490 () Bool)

(assert (=> b!506522 (=> (not res!307490) (not e!296462))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506522 (= res!307490 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506523 () Bool)

(declare-fun res!307485 () Bool)

(assert (=> b!506523 (=> (not res!307485) (not e!296462))))

(assert (=> b!506523 (= res!307485 (validKeyInArray!0 k!2280))))

(declare-fun b!506524 () Bool)

(declare-fun e!296463 () Bool)

(declare-fun e!296466 () Bool)

(assert (=> b!506524 (= e!296463 e!296466)))

(declare-fun res!307487 () Bool)

(assert (=> b!506524 (=> res!307487 e!296466)))

(declare-fun lt!231140 () Bool)

(declare-datatypes ((SeekEntryResult!4111 0))(
  ( (MissingZero!4111 (index!18632 (_ BitVec 32))) (Found!4111 (index!18633 (_ BitVec 32))) (Intermediate!4111 (undefined!4923 Bool) (index!18634 (_ BitVec 32)) (x!47632 (_ BitVec 32))) (Undefined!4111) (MissingVacant!4111 (index!18635 (_ BitVec 32))) )
))
(declare-fun lt!231139 () SeekEntryResult!4111)

(assert (=> b!506524 (= res!307487 (or (and (not lt!231140) (undefined!4923 lt!231139)) (and (not lt!231140) (not (undefined!4923 lt!231139)))))))

(assert (=> b!506524 (= lt!231140 (not (is-Intermediate!4111 lt!231139)))))

(declare-fun b!506525 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!296464 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32528 (_ BitVec 32)) SeekEntryResult!4111)

(assert (=> b!506525 (= e!296464 (= (seekEntryOrOpen!0 (select (arr!15644 a!3235) j!176) a!3235 mask!3524) (Found!4111 j!176)))))

(declare-fun b!506526 () Bool)

(declare-fun e!296465 () Bool)

(assert (=> b!506526 (= e!296465 (not e!296463))))

(declare-fun res!307486 () Bool)

(assert (=> b!506526 (=> res!307486 e!296463)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!231142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32528 (_ BitVec 32)) SeekEntryResult!4111)

(assert (=> b!506526 (= res!307486 (= lt!231139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231142 (select (store (arr!15644 a!3235) i!1204 k!2280) j!176) (array!32529 (store (arr!15644 a!3235) i!1204 k!2280) (size!16008 a!3235)) mask!3524)))))

(declare-fun lt!231141 () (_ BitVec 32))

(assert (=> b!506526 (= lt!231139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231141 (select (arr!15644 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506526 (= lt!231142 (toIndex!0 (select (store (arr!15644 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506526 (= lt!231141 (toIndex!0 (select (arr!15644 a!3235) j!176) mask!3524))))

(assert (=> b!506526 e!296464))

(declare-fun res!307483 () Bool)

(assert (=> b!506526 (=> (not res!307483) (not e!296464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32528 (_ BitVec 32)) Bool)

(assert (=> b!506526 (= res!307483 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15510 0))(
  ( (Unit!15511) )
))
(declare-fun lt!231138 () Unit!15510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15510)

(assert (=> b!506526 (= lt!231138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506527 () Bool)

(declare-fun res!307489 () Bool)

(assert (=> b!506527 (=> (not res!307489) (not e!296462))))

(assert (=> b!506527 (= res!307489 (and (= (size!16008 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16008 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16008 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506528 () Bool)

(declare-fun res!307488 () Bool)

(assert (=> b!506528 (=> (not res!307488) (not e!296465))))

(declare-datatypes ((List!9802 0))(
  ( (Nil!9799) (Cons!9798 (h!10675 (_ BitVec 64)) (t!16030 List!9802)) )
))
(declare-fun arrayNoDuplicates!0 (array!32528 (_ BitVec 32) List!9802) Bool)

(assert (=> b!506528 (= res!307488 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9799))))

(declare-fun b!506529 () Bool)

(declare-fun res!307484 () Bool)

(assert (=> b!506529 (=> (not res!307484) (not e!296465))))

(assert (=> b!506529 (= res!307484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!307482 () Bool)

(assert (=> start!45772 (=> (not res!307482) (not e!296462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45772 (= res!307482 (validMask!0 mask!3524))))

(assert (=> start!45772 e!296462))

(assert (=> start!45772 true))

(declare-fun array_inv!11440 (array!32528) Bool)

(assert (=> start!45772 (array_inv!11440 a!3235)))

(declare-fun b!506530 () Bool)

(assert (=> b!506530 (= e!296462 e!296465)))

(declare-fun res!307481 () Bool)

(assert (=> b!506530 (=> (not res!307481) (not e!296465))))

(declare-fun lt!231137 () SeekEntryResult!4111)

(assert (=> b!506530 (= res!307481 (or (= lt!231137 (MissingZero!4111 i!1204)) (= lt!231137 (MissingVacant!4111 i!1204))))))

(assert (=> b!506530 (= lt!231137 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506531 () Bool)

(assert (=> b!506531 (= e!296466 true)))

(assert (=> b!506531 false))

(assert (= (and start!45772 res!307482) b!506527))

(assert (= (and b!506527 res!307489) b!506521))

(assert (= (and b!506521 res!307480) b!506523))

(assert (= (and b!506523 res!307485) b!506522))

(assert (= (and b!506522 res!307490) b!506530))

(assert (= (and b!506530 res!307481) b!506529))

(assert (= (and b!506529 res!307484) b!506528))

(assert (= (and b!506528 res!307488) b!506526))

(assert (= (and b!506526 res!307483) b!506525))

(assert (= (and b!506526 (not res!307486)) b!506524))

(assert (= (and b!506524 (not res!307487)) b!506531))

(declare-fun m!487191 () Bool)

(assert (=> b!506526 m!487191))

(declare-fun m!487193 () Bool)

(assert (=> b!506526 m!487193))

(declare-fun m!487195 () Bool)

(assert (=> b!506526 m!487195))

(declare-fun m!487197 () Bool)

(assert (=> b!506526 m!487197))

(assert (=> b!506526 m!487195))

(declare-fun m!487199 () Bool)

(assert (=> b!506526 m!487199))

(assert (=> b!506526 m!487193))

(declare-fun m!487201 () Bool)

(assert (=> b!506526 m!487201))

(assert (=> b!506526 m!487195))

(declare-fun m!487203 () Bool)

(assert (=> b!506526 m!487203))

(assert (=> b!506526 m!487193))

(declare-fun m!487205 () Bool)

(assert (=> b!506526 m!487205))

(declare-fun m!487207 () Bool)

(assert (=> b!506526 m!487207))

(declare-fun m!487209 () Bool)

(assert (=> b!506522 m!487209))

(declare-fun m!487211 () Bool)

(assert (=> b!506528 m!487211))

(declare-fun m!487213 () Bool)

(assert (=> start!45772 m!487213))

(declare-fun m!487215 () Bool)

(assert (=> start!45772 m!487215))

(declare-fun m!487217 () Bool)

(assert (=> b!506523 m!487217))

(assert (=> b!506521 m!487195))

(assert (=> b!506521 m!487195))

(declare-fun m!487219 () Bool)

(assert (=> b!506521 m!487219))

(declare-fun m!487221 () Bool)

(assert (=> b!506530 m!487221))

(declare-fun m!487223 () Bool)

(assert (=> b!506529 m!487223))

(assert (=> b!506525 m!487195))

(assert (=> b!506525 m!487195))

(declare-fun m!487225 () Bool)

(assert (=> b!506525 m!487225))

(push 1)

