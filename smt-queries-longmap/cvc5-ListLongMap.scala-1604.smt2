; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30296 () Bool)

(assert start!30296)

(declare-fun b!303286 () Bool)

(declare-fun res!160772 () Bool)

(declare-fun e!190918 () Bool)

(assert (=> b!303286 (=> (not res!160772) (not e!190918))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((array!15402 0))(
  ( (array!15403 (arr!7289 (Array (_ BitVec 32) (_ BitVec 64))) (size!7641 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15402)

(declare-datatypes ((SeekEntryResult!2429 0))(
  ( (MissingZero!2429 (index!11892 (_ BitVec 32))) (Found!2429 (index!11893 (_ BitVec 32))) (Intermediate!2429 (undefined!3241 Bool) (index!11894 (_ BitVec 32)) (x!30158 (_ BitVec 32))) (Undefined!2429) (MissingVacant!2429 (index!11895 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15402 (_ BitVec 32)) SeekEntryResult!2429)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303286 (= res!160772 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2429 false resIndex!52 resX!52)))))

(declare-fun b!303287 () Bool)

(declare-fun res!160776 () Bool)

(assert (=> b!303287 (=> (not res!160776) (not e!190918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15402 (_ BitVec 32)) Bool)

(assert (=> b!303287 (= res!160776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303288 () Bool)

(declare-fun res!160774 () Bool)

(assert (=> b!303288 (=> (not res!160774) (not e!190918))))

(declare-fun arrayContainsKey!0 (array!15402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303288 (= res!160774 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303289 () Bool)

(declare-fun res!160775 () Bool)

(assert (=> b!303289 (=> (not res!160775) (not e!190918))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303289 (= res!160775 (and (= (size!7641 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7641 a!3293))))))

(declare-fun res!160773 () Bool)

(assert (=> start!30296 (=> (not res!160773) (not e!190918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30296 (= res!160773 (validMask!0 mask!3709))))

(assert (=> start!30296 e!190918))

(declare-fun array_inv!5252 (array!15402) Bool)

(assert (=> start!30296 (array_inv!5252 a!3293)))

(assert (=> start!30296 true))

(declare-fun b!303290 () Bool)

(assert (=> b!303290 (= e!190918 false)))

(declare-fun lt!150189 () SeekEntryResult!2429)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303290 (= lt!150189 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303291 () Bool)

(declare-fun res!160777 () Bool)

(assert (=> b!303291 (=> (not res!160777) (not e!190918))))

(assert (=> b!303291 (= res!160777 (and (= (select (arr!7289 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7641 a!3293))))))

(declare-fun b!303292 () Bool)

(declare-fun res!160779 () Bool)

(assert (=> b!303292 (=> (not res!160779) (not e!190918))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15402 (_ BitVec 32)) SeekEntryResult!2429)

(assert (=> b!303292 (= res!160779 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2429 i!1240)))))

(declare-fun b!303293 () Bool)

(declare-fun res!160778 () Bool)

(assert (=> b!303293 (=> (not res!160778) (not e!190918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303293 (= res!160778 (validKeyInArray!0 k!2441))))

(assert (= (and start!30296 res!160773) b!303289))

(assert (= (and b!303289 res!160775) b!303293))

(assert (= (and b!303293 res!160778) b!303288))

(assert (= (and b!303288 res!160774) b!303292))

(assert (= (and b!303292 res!160779) b!303287))

(assert (= (and b!303287 res!160776) b!303286))

(assert (= (and b!303286 res!160772) b!303291))

(assert (= (and b!303291 res!160777) b!303290))

(declare-fun m!314663 () Bool)

(assert (=> start!30296 m!314663))

(declare-fun m!314665 () Bool)

(assert (=> start!30296 m!314665))

(declare-fun m!314667 () Bool)

(assert (=> b!303287 m!314667))

(declare-fun m!314669 () Bool)

(assert (=> b!303286 m!314669))

(assert (=> b!303286 m!314669))

(declare-fun m!314671 () Bool)

(assert (=> b!303286 m!314671))

(declare-fun m!314673 () Bool)

(assert (=> b!303291 m!314673))

(declare-fun m!314675 () Bool)

(assert (=> b!303292 m!314675))

(declare-fun m!314677 () Bool)

(assert (=> b!303290 m!314677))

(declare-fun m!314679 () Bool)

(assert (=> b!303293 m!314679))

(declare-fun m!314681 () Bool)

(assert (=> b!303288 m!314681))

(push 1)

(assert (not b!303290))

(assert (not start!30296))

(assert (not b!303286))

(assert (not b!303293))

(assert (not b!303287))

(assert (not b!303288))

(assert (not b!303292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

