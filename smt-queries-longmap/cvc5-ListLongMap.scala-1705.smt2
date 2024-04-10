; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31364 () Bool)

(assert start!31364)

(declare-fun b!314320 () Bool)

(declare-fun res!170070 () Bool)

(declare-fun e!195816 () Bool)

(assert (=> b!314320 (=> (not res!170070) (not e!195816))))

(declare-datatypes ((array!16035 0))(
  ( (array!16036 (arr!7592 (Array (_ BitVec 32) (_ BitVec 64))) (size!7944 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16035)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16035 (_ BitVec 32)) Bool)

(assert (=> b!314320 (= res!170070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314321 () Bool)

(declare-fun res!170069 () Bool)

(assert (=> b!314321 (=> (not res!170069) (not e!195816))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314321 (= res!170069 (validKeyInArray!0 k!2441))))

(declare-fun b!314322 () Bool)

(assert (=> b!314322 (= e!195816 false)))

(declare-datatypes ((SeekEntryResult!2732 0))(
  ( (MissingZero!2732 (index!13104 (_ BitVec 32))) (Found!2732 (index!13105 (_ BitVec 32))) (Intermediate!2732 (undefined!3544 Bool) (index!13106 (_ BitVec 32)) (x!31338 (_ BitVec 32))) (Undefined!2732) (MissingVacant!2732 (index!13107 (_ BitVec 32))) )
))
(declare-fun lt!153891 () SeekEntryResult!2732)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16035 (_ BitVec 32)) SeekEntryResult!2732)

(assert (=> b!314322 (= lt!153891 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314323 () Bool)

(declare-fun res!170073 () Bool)

(assert (=> b!314323 (=> (not res!170073) (not e!195816))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16035 (_ BitVec 32)) SeekEntryResult!2732)

(assert (=> b!314323 (= res!170073 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2732 i!1240)))))

(declare-fun res!170072 () Bool)

(assert (=> start!31364 (=> (not res!170072) (not e!195816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31364 (= res!170072 (validMask!0 mask!3709))))

(assert (=> start!31364 e!195816))

(declare-fun array_inv!5555 (array!16035) Bool)

(assert (=> start!31364 (array_inv!5555 a!3293)))

(assert (=> start!31364 true))

(declare-fun b!314324 () Bool)

(declare-fun res!170071 () Bool)

(assert (=> b!314324 (=> (not res!170071) (not e!195816))))

(declare-fun arrayContainsKey!0 (array!16035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314324 (= res!170071 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314325 () Bool)

(declare-fun res!170076 () Bool)

(assert (=> b!314325 (=> (not res!170076) (not e!195816))))

(assert (=> b!314325 (= res!170076 (and (= (size!7944 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7944 a!3293))))))

(declare-fun b!314326 () Bool)

(declare-fun res!170075 () Bool)

(assert (=> b!314326 (=> (not res!170075) (not e!195816))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314326 (= res!170075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2732 false resIndex!52 resX!52)))))

(declare-fun b!314327 () Bool)

(declare-fun res!170074 () Bool)

(assert (=> b!314327 (=> (not res!170074) (not e!195816))))

(assert (=> b!314327 (= res!170074 (and (= (select (arr!7592 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7944 a!3293))))))

(assert (= (and start!31364 res!170072) b!314325))

(assert (= (and b!314325 res!170076) b!314321))

(assert (= (and b!314321 res!170069) b!314324))

(assert (= (and b!314324 res!170071) b!314323))

(assert (= (and b!314323 res!170073) b!314320))

(assert (= (and b!314320 res!170070) b!314326))

(assert (= (and b!314326 res!170075) b!314327))

(assert (= (and b!314327 res!170074) b!314322))

(declare-fun m!323897 () Bool)

(assert (=> b!314327 m!323897))

(declare-fun m!323899 () Bool)

(assert (=> b!314324 m!323899))

(declare-fun m!323901 () Bool)

(assert (=> b!314321 m!323901))

(declare-fun m!323903 () Bool)

(assert (=> b!314322 m!323903))

(declare-fun m!323905 () Bool)

(assert (=> b!314320 m!323905))

(declare-fun m!323907 () Bool)

(assert (=> start!31364 m!323907))

(declare-fun m!323909 () Bool)

(assert (=> start!31364 m!323909))

(declare-fun m!323911 () Bool)

(assert (=> b!314323 m!323911))

(declare-fun m!323913 () Bool)

(assert (=> b!314326 m!323913))

(assert (=> b!314326 m!323913))

(declare-fun m!323915 () Bool)

(assert (=> b!314326 m!323915))

(push 1)

(assert (not b!314326))

(assert (not start!31364))

(assert (not b!314321))

(assert (not b!314322))

(assert (not b!314323))

(assert (not b!314324))

(assert (not b!314320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

