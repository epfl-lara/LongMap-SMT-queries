; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30148 () Bool)

(assert start!30148)

(declare-fun b!301774 () Bool)

(declare-fun res!159533 () Bool)

(declare-fun e!190313 () Bool)

(assert (=> b!301774 (=> (not res!159533) (not e!190313))))

(declare-datatypes ((array!15303 0))(
  ( (array!15304 (arr!7241 (Array (_ BitVec 32) (_ BitVec 64))) (size!7594 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15303)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301774 (= res!159533 (and (= (size!7594 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7594 a!3293))))))

(declare-fun b!301775 () Bool)

(declare-fun res!159529 () Bool)

(assert (=> b!301775 (=> (not res!159529) (not e!190313))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301775 (= res!159529 (validKeyInArray!0 k!2441))))

(declare-fun res!159532 () Bool)

(assert (=> start!30148 (=> (not res!159532) (not e!190313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30148 (= res!159532 (validMask!0 mask!3709))))

(assert (=> start!30148 e!190313))

(assert (=> start!30148 true))

(declare-fun array_inv!5213 (array!15303) Bool)

(assert (=> start!30148 (array_inv!5213 a!3293)))

(declare-fun b!301776 () Bool)

(declare-fun res!159534 () Bool)

(assert (=> b!301776 (=> (not res!159534) (not e!190313))))

(declare-fun arrayContainsKey!0 (array!15303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301776 (= res!159534 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301777 () Bool)

(declare-fun res!159531 () Bool)

(assert (=> b!301777 (=> (not res!159531) (not e!190313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15303 (_ BitVec 32)) Bool)

(assert (=> b!301777 (= res!159531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301778 () Bool)

(declare-fun res!159530 () Bool)

(assert (=> b!301778 (=> (not res!159530) (not e!190313))))

(declare-datatypes ((SeekEntryResult!2380 0))(
  ( (MissingZero!2380 (index!11696 (_ BitVec 32))) (Found!2380 (index!11697 (_ BitVec 32))) (Intermediate!2380 (undefined!3192 Bool) (index!11698 (_ BitVec 32)) (x!29978 (_ BitVec 32))) (Undefined!2380) (MissingVacant!2380 (index!11699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15303 (_ BitVec 32)) SeekEntryResult!2380)

(assert (=> b!301778 (= res!159530 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2380 i!1240)))))

(declare-fun b!301779 () Bool)

(assert (=> b!301779 (= e!190313 false)))

(declare-fun lt!149753 () SeekEntryResult!2380)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15303 (_ BitVec 32)) SeekEntryResult!2380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301779 (= lt!149753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30148 res!159532) b!301774))

(assert (= (and b!301774 res!159533) b!301775))

(assert (= (and b!301775 res!159529) b!301776))

(assert (= (and b!301776 res!159534) b!301778))

(assert (= (and b!301778 res!159530) b!301777))

(assert (= (and b!301777 res!159531) b!301779))

(declare-fun m!312969 () Bool)

(assert (=> b!301778 m!312969))

(declare-fun m!312971 () Bool)

(assert (=> b!301775 m!312971))

(declare-fun m!312973 () Bool)

(assert (=> b!301776 m!312973))

(declare-fun m!312975 () Bool)

(assert (=> start!30148 m!312975))

(declare-fun m!312977 () Bool)

(assert (=> start!30148 m!312977))

(declare-fun m!312979 () Bool)

(assert (=> b!301777 m!312979))

(declare-fun m!312981 () Bool)

(assert (=> b!301779 m!312981))

(assert (=> b!301779 m!312981))

(declare-fun m!312983 () Bool)

(assert (=> b!301779 m!312983))

(push 1)

(assert (not b!301776))

(assert (not b!301775))

(assert (not b!301777))

(assert (not b!301778))

(assert (not start!30148))

(assert (not b!301779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

