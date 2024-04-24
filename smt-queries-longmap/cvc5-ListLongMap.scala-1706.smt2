; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31360 () Bool)

(assert start!31360)

(declare-fun b!314387 () Bool)

(declare-fun res!170189 () Bool)

(declare-fun e!195813 () Bool)

(assert (=> b!314387 (=> (not res!170189) (not e!195813))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314387 (= res!170189 (validKeyInArray!0 k!2441))))

(declare-fun b!314388 () Bool)

(declare-fun res!170192 () Bool)

(assert (=> b!314388 (=> (not res!170192) (not e!195813))))

(declare-datatypes ((array!16044 0))(
  ( (array!16045 (arr!7596 (Array (_ BitVec 32) (_ BitVec 64))) (size!7948 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16044)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2701 0))(
  ( (MissingZero!2701 (index!12980 (_ BitVec 32))) (Found!2701 (index!12981 (_ BitVec 32))) (Intermediate!2701 (undefined!3513 Bool) (index!12982 (_ BitVec 32)) (x!31312 (_ BitVec 32))) (Undefined!2701) (MissingVacant!2701 (index!12983 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16044 (_ BitVec 32)) SeekEntryResult!2701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314388 (= res!170192 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2701 false resIndex!52 resX!52)))))

(declare-fun b!314389 () Bool)

(declare-fun res!170187 () Bool)

(assert (=> b!314389 (=> (not res!170187) (not e!195813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16044 (_ BitVec 32)) Bool)

(assert (=> b!314389 (= res!170187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314390 () Bool)

(declare-fun res!170186 () Bool)

(assert (=> b!314390 (=> (not res!170186) (not e!195813))))

(declare-fun arrayContainsKey!0 (array!16044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314390 (= res!170186 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!170190 () Bool)

(assert (=> start!31360 (=> (not res!170190) (not e!195813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31360 (= res!170190 (validMask!0 mask!3709))))

(assert (=> start!31360 e!195813))

(declare-fun array_inv!5546 (array!16044) Bool)

(assert (=> start!31360 (array_inv!5546 a!3293)))

(assert (=> start!31360 true))

(declare-fun b!314391 () Bool)

(declare-fun res!170188 () Bool)

(assert (=> b!314391 (=> (not res!170188) (not e!195813))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314391 (= res!170188 (and (= (size!7948 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7948 a!3293))))))

(declare-fun b!314392 () Bool)

(declare-fun res!170191 () Bool)

(assert (=> b!314392 (=> (not res!170191) (not e!195813))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314392 (= res!170191 (and (= (select (arr!7596 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7948 a!3293))))))

(declare-fun b!314393 () Bool)

(declare-fun res!170193 () Bool)

(assert (=> b!314393 (=> (not res!170193) (not e!195813))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16044 (_ BitVec 32)) SeekEntryResult!2701)

(assert (=> b!314393 (= res!170193 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2701 i!1240)))))

(declare-fun b!314394 () Bool)

(assert (=> b!314394 (= e!195813 false)))

(declare-fun lt!153924 () SeekEntryResult!2701)

(assert (=> b!314394 (= lt!153924 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31360 res!170190) b!314391))

(assert (= (and b!314391 res!170188) b!314387))

(assert (= (and b!314387 res!170189) b!314390))

(assert (= (and b!314390 res!170186) b!314393))

(assert (= (and b!314393 res!170193) b!314389))

(assert (= (and b!314389 res!170187) b!314388))

(assert (= (and b!314388 res!170192) b!314392))

(assert (= (and b!314392 res!170191) b!314394))

(declare-fun m!324137 () Bool)

(assert (=> b!314394 m!324137))

(declare-fun m!324139 () Bool)

(assert (=> b!314387 m!324139))

(declare-fun m!324141 () Bool)

(assert (=> b!314390 m!324141))

(declare-fun m!324143 () Bool)

(assert (=> b!314393 m!324143))

(declare-fun m!324145 () Bool)

(assert (=> start!31360 m!324145))

(declare-fun m!324147 () Bool)

(assert (=> start!31360 m!324147))

(declare-fun m!324149 () Bool)

(assert (=> b!314392 m!324149))

(declare-fun m!324151 () Bool)

(assert (=> b!314389 m!324151))

(declare-fun m!324153 () Bool)

(assert (=> b!314388 m!324153))

(assert (=> b!314388 m!324153))

(declare-fun m!324155 () Bool)

(assert (=> b!314388 m!324155))

(push 1)

(assert (not b!314390))

(assert (not b!314387))

(assert (not b!314394))

(assert (not b!314393))

(assert (not b!314388))

(assert (not start!31360))

(assert (not b!314389))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

