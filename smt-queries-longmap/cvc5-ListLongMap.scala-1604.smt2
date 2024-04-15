; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30286 () Bool)

(assert start!30286)

(declare-fun b!303059 () Bool)

(declare-fun res!160693 () Bool)

(declare-fun e!190753 () Bool)

(assert (=> b!303059 (=> (not res!160693) (not e!190753))))

(declare-datatypes ((array!15396 0))(
  ( (array!15397 (arr!7286 (Array (_ BitVec 32) (_ BitVec 64))) (size!7639 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15396)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2425 0))(
  ( (MissingZero!2425 (index!11876 (_ BitVec 32))) (Found!2425 (index!11877 (_ BitVec 32))) (Intermediate!2425 (undefined!3237 Bool) (index!11878 (_ BitVec 32)) (x!30149 (_ BitVec 32))) (Undefined!2425) (MissingVacant!2425 (index!11879 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15396 (_ BitVec 32)) SeekEntryResult!2425)

(assert (=> b!303059 (= res!160693 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2425 i!1240)))))

(declare-fun res!160692 () Bool)

(assert (=> start!30286 (=> (not res!160692) (not e!190753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30286 (= res!160692 (validMask!0 mask!3709))))

(assert (=> start!30286 e!190753))

(declare-fun array_inv!5258 (array!15396) Bool)

(assert (=> start!30286 (array_inv!5258 a!3293)))

(assert (=> start!30286 true))

(declare-fun b!303060 () Bool)

(declare-fun res!160697 () Bool)

(assert (=> b!303060 (=> (not res!160697) (not e!190753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15396 (_ BitVec 32)) Bool)

(assert (=> b!303060 (= res!160697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303061 () Bool)

(declare-fun res!160694 () Bool)

(assert (=> b!303061 (=> (not res!160694) (not e!190753))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303061 (= res!160694 (and (= (select (arr!7286 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7639 a!3293))))))

(declare-fun b!303062 () Bool)

(declare-fun res!160696 () Bool)

(assert (=> b!303062 (=> (not res!160696) (not e!190753))))

(declare-fun arrayContainsKey!0 (array!15396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303062 (= res!160696 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303063 () Bool)

(assert (=> b!303063 (= e!190753 false)))

(declare-fun lt!149960 () SeekEntryResult!2425)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15396 (_ BitVec 32)) SeekEntryResult!2425)

(assert (=> b!303063 (= lt!149960 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303064 () Bool)

(declare-fun res!160698 () Bool)

(assert (=> b!303064 (=> (not res!160698) (not e!190753))))

(assert (=> b!303064 (= res!160698 (and (= (size!7639 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7639 a!3293))))))

(declare-fun b!303065 () Bool)

(declare-fun res!160695 () Bool)

(assert (=> b!303065 (=> (not res!160695) (not e!190753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303065 (= res!160695 (validKeyInArray!0 k!2441))))

(declare-fun b!303066 () Bool)

(declare-fun res!160691 () Bool)

(assert (=> b!303066 (=> (not res!160691) (not e!190753))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303066 (= res!160691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2425 false resIndex!52 resX!52)))))

(assert (= (and start!30286 res!160692) b!303064))

(assert (= (and b!303064 res!160698) b!303065))

(assert (= (and b!303065 res!160695) b!303062))

(assert (= (and b!303062 res!160696) b!303059))

(assert (= (and b!303059 res!160693) b!303060))

(assert (= (and b!303060 res!160697) b!303066))

(assert (= (and b!303066 res!160691) b!303061))

(assert (= (and b!303061 res!160694) b!303063))

(declare-fun m!313973 () Bool)

(assert (=> b!303063 m!313973))

(declare-fun m!313975 () Bool)

(assert (=> b!303059 m!313975))

(declare-fun m!313977 () Bool)

(assert (=> b!303065 m!313977))

(declare-fun m!313979 () Bool)

(assert (=> b!303066 m!313979))

(assert (=> b!303066 m!313979))

(declare-fun m!313981 () Bool)

(assert (=> b!303066 m!313981))

(declare-fun m!313983 () Bool)

(assert (=> b!303062 m!313983))

(declare-fun m!313985 () Bool)

(assert (=> b!303061 m!313985))

(declare-fun m!313987 () Bool)

(assert (=> b!303060 m!313987))

(declare-fun m!313989 () Bool)

(assert (=> start!30286 m!313989))

(declare-fun m!313991 () Bool)

(assert (=> start!30286 m!313991))

(push 1)

(assert (not b!303060))

(assert (not b!303065))

(assert (not start!30286))

(assert (not b!303066))

(assert (not b!303059))

(assert (not b!303062))

(assert (not b!303063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

