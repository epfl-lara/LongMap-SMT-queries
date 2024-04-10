; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30084 () Bool)

(assert start!30084)

(declare-fun b!301608 () Bool)

(declare-fun res!159288 () Bool)

(declare-fun e!190308 () Bool)

(assert (=> b!301608 (=> (not res!159288) (not e!190308))))

(declare-datatypes ((array!15274 0))(
  ( (array!15275 (arr!7228 (Array (_ BitVec 32) (_ BitVec 64))) (size!7580 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15274)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301608 (= res!159288 (and (= (size!7580 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7580 a!3293))))))

(declare-fun b!301609 () Bool)

(declare-fun res!159286 () Bool)

(assert (=> b!301609 (=> (not res!159286) (not e!190308))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301609 (= res!159286 (validKeyInArray!0 k!2441))))

(declare-fun b!301611 () Bool)

(declare-fun res!159291 () Bool)

(assert (=> b!301611 (=> (not res!159291) (not e!190308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15274 (_ BitVec 32)) Bool)

(assert (=> b!301611 (= res!159291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301612 () Bool)

(declare-fun res!159290 () Bool)

(assert (=> b!301612 (=> (not res!159290) (not e!190308))))

(declare-fun arrayContainsKey!0 (array!15274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301612 (= res!159290 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301613 () Bool)

(declare-fun res!159289 () Bool)

(assert (=> b!301613 (=> (not res!159289) (not e!190308))))

(declare-datatypes ((SeekEntryResult!2368 0))(
  ( (MissingZero!2368 (index!11648 (_ BitVec 32))) (Found!2368 (index!11649 (_ BitVec 32))) (Intermediate!2368 (undefined!3180 Bool) (index!11650 (_ BitVec 32)) (x!29920 (_ BitVec 32))) (Undefined!2368) (MissingVacant!2368 (index!11651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15274 (_ BitVec 32)) SeekEntryResult!2368)

(assert (=> b!301613 (= res!159289 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2368 i!1240)))))

(declare-fun b!301610 () Bool)

(assert (=> b!301610 (= e!190308 false)))

(declare-fun lt!149871 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301610 (= lt!149871 (toIndex!0 k!2441 mask!3709))))

(declare-fun res!159287 () Bool)

(assert (=> start!30084 (=> (not res!159287) (not e!190308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30084 (= res!159287 (validMask!0 mask!3709))))

(assert (=> start!30084 e!190308))

(assert (=> start!30084 true))

(declare-fun array_inv!5191 (array!15274) Bool)

(assert (=> start!30084 (array_inv!5191 a!3293)))

(assert (= (and start!30084 res!159287) b!301608))

(assert (= (and b!301608 res!159288) b!301609))

(assert (= (and b!301609 res!159286) b!301612))

(assert (= (and b!301612 res!159290) b!301613))

(assert (= (and b!301613 res!159289) b!301611))

(assert (= (and b!301611 res!159291) b!301610))

(declare-fun m!313347 () Bool)

(assert (=> b!301611 m!313347))

(declare-fun m!313349 () Bool)

(assert (=> b!301609 m!313349))

(declare-fun m!313351 () Bool)

(assert (=> b!301613 m!313351))

(declare-fun m!313353 () Bool)

(assert (=> b!301610 m!313353))

(declare-fun m!313355 () Bool)

(assert (=> start!30084 m!313355))

(declare-fun m!313357 () Bool)

(assert (=> start!30084 m!313357))

(declare-fun m!313359 () Bool)

(assert (=> b!301612 m!313359))

(push 1)

(assert (not b!301613))

(assert (not b!301611))

(assert (not b!301612))

