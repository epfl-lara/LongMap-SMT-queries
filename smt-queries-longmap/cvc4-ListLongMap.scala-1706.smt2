; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31374 () Bool)

(assert start!31374)

(declare-fun b!314440 () Bool)

(declare-fun res!170196 () Bool)

(declare-fun e!195847 () Bool)

(assert (=> b!314440 (=> (not res!170196) (not e!195847))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314440 (= res!170196 (validKeyInArray!0 k!2441))))

(declare-fun res!170195 () Bool)

(assert (=> start!31374 (=> (not res!170195) (not e!195847))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31374 (= res!170195 (validMask!0 mask!3709))))

(assert (=> start!31374 e!195847))

(declare-datatypes ((array!16045 0))(
  ( (array!16046 (arr!7597 (Array (_ BitVec 32) (_ BitVec 64))) (size!7949 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16045)

(declare-fun array_inv!5560 (array!16045) Bool)

(assert (=> start!31374 (array_inv!5560 a!3293)))

(assert (=> start!31374 true))

(declare-fun b!314441 () Bool)

(declare-fun res!170194 () Bool)

(assert (=> b!314441 (=> (not res!170194) (not e!195847))))

(declare-fun arrayContainsKey!0 (array!16045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314441 (= res!170194 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314442 () Bool)

(declare-fun res!170193 () Bool)

(assert (=> b!314442 (=> (not res!170193) (not e!195847))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314442 (= res!170193 (and (= (size!7949 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7949 a!3293))))))

(declare-fun b!314443 () Bool)

(declare-fun res!170191 () Bool)

(assert (=> b!314443 (=> (not res!170191) (not e!195847))))

(declare-datatypes ((SeekEntryResult!2737 0))(
  ( (MissingZero!2737 (index!13124 (_ BitVec 32))) (Found!2737 (index!13125 (_ BitVec 32))) (Intermediate!2737 (undefined!3549 Bool) (index!13126 (_ BitVec 32)) (x!31351 (_ BitVec 32))) (Undefined!2737) (MissingVacant!2737 (index!13127 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16045 (_ BitVec 32)) SeekEntryResult!2737)

(assert (=> b!314443 (= res!170191 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2737 i!1240)))))

(declare-fun b!314444 () Bool)

(declare-fun res!170190 () Bool)

(assert (=> b!314444 (=> (not res!170190) (not e!195847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16045 (_ BitVec 32)) Bool)

(assert (=> b!314444 (= res!170190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314445 () Bool)

(assert (=> b!314445 (= e!195847 false)))

(declare-fun lt!153906 () SeekEntryResult!2737)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16045 (_ BitVec 32)) SeekEntryResult!2737)

(assert (=> b!314445 (= lt!153906 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314446 () Bool)

(declare-fun res!170192 () Bool)

(assert (=> b!314446 (=> (not res!170192) (not e!195847))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314446 (= res!170192 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2737 false resIndex!52 resX!52)))))

(declare-fun b!314447 () Bool)

(declare-fun res!170189 () Bool)

(assert (=> b!314447 (=> (not res!170189) (not e!195847))))

(assert (=> b!314447 (= res!170189 (and (= (select (arr!7597 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7949 a!3293))))))

(assert (= (and start!31374 res!170195) b!314442))

(assert (= (and b!314442 res!170193) b!314440))

(assert (= (and b!314440 res!170196) b!314441))

(assert (= (and b!314441 res!170194) b!314443))

(assert (= (and b!314443 res!170191) b!314444))

(assert (= (and b!314444 res!170190) b!314446))

(assert (= (and b!314446 res!170192) b!314447))

(assert (= (and b!314447 res!170189) b!314445))

(declare-fun m!323997 () Bool)

(assert (=> b!314446 m!323997))

(assert (=> b!314446 m!323997))

(declare-fun m!323999 () Bool)

(assert (=> b!314446 m!323999))

(declare-fun m!324001 () Bool)

(assert (=> b!314441 m!324001))

(declare-fun m!324003 () Bool)

(assert (=> b!314443 m!324003))

(declare-fun m!324005 () Bool)

(assert (=> b!314447 m!324005))

(declare-fun m!324007 () Bool)

(assert (=> b!314444 m!324007))

(declare-fun m!324009 () Bool)

(assert (=> b!314445 m!324009))

(declare-fun m!324011 () Bool)

(assert (=> start!31374 m!324011))

(declare-fun m!324013 () Bool)

(assert (=> start!31374 m!324013))

(declare-fun m!324015 () Bool)

(assert (=> b!314440 m!324015))

(push 1)

