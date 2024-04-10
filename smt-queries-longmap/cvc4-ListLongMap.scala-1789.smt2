; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32438 () Bool)

(assert start!32438)

(declare-fun b!324052 () Bool)

(declare-fun res!177385 () Bool)

(declare-fun e!200155 () Bool)

(assert (=> b!324052 (=> (not res!177385) (not e!200155))))

(declare-datatypes ((array!16577 0))(
  ( (array!16578 (arr!7846 (Array (_ BitVec 32) (_ BitVec 64))) (size!8198 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16577)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2977 0))(
  ( (MissingZero!2977 (index!14084 (_ BitVec 32))) (Found!2977 (index!14085 (_ BitVec 32))) (Intermediate!2977 (undefined!3789 Bool) (index!14086 (_ BitVec 32)) (x!32333 (_ BitVec 32))) (Undefined!2977) (MissingVacant!2977 (index!14087 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16577 (_ BitVec 32)) SeekEntryResult!2977)

(assert (=> b!324052 (= res!177385 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2977 i!1250)))))

(declare-fun res!177383 () Bool)

(assert (=> start!32438 (=> (not res!177383) (not e!200155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32438 (= res!177383 (validMask!0 mask!3777))))

(assert (=> start!32438 e!200155))

(declare-fun array_inv!5809 (array!16577) Bool)

(assert (=> start!32438 (array_inv!5809 a!3305)))

(assert (=> start!32438 true))

(declare-fun b!324053 () Bool)

(declare-fun res!177386 () Bool)

(assert (=> b!324053 (=> (not res!177386) (not e!200155))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324053 (= res!177386 (and (= (select (arr!7846 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8198 a!3305))))))

(declare-fun b!324054 () Bool)

(declare-fun res!177388 () Bool)

(assert (=> b!324054 (=> (not res!177388) (not e!200155))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16577 (_ BitVec 32)) SeekEntryResult!2977)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324054 (= res!177388 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2977 false resIndex!58 resX!58)))))

(declare-fun b!324055 () Bool)

(declare-fun res!177384 () Bool)

(assert (=> b!324055 (=> (not res!177384) (not e!200155))))

(assert (=> b!324055 (= res!177384 (and (= (size!8198 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8198 a!3305))))))

(declare-fun b!324056 () Bool)

(declare-fun res!177389 () Bool)

(assert (=> b!324056 (=> (not res!177389) (not e!200155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16577 (_ BitVec 32)) Bool)

(assert (=> b!324056 (= res!177389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324057 () Bool)

(declare-fun res!177387 () Bool)

(assert (=> b!324057 (=> (not res!177387) (not e!200155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324057 (= res!177387 (validKeyInArray!0 k!2497))))

(declare-fun b!324058 () Bool)

(declare-fun res!177390 () Bool)

(assert (=> b!324058 (=> (not res!177390) (not e!200155))))

(declare-fun arrayContainsKey!0 (array!16577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324058 (= res!177390 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324059 () Bool)

(assert (=> b!324059 (= e!200155 false)))

(declare-fun lt!156747 () SeekEntryResult!2977)

(assert (=> b!324059 (= lt!156747 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(assert (= (and start!32438 res!177383) b!324055))

(assert (= (and b!324055 res!177384) b!324057))

(assert (= (and b!324057 res!177387) b!324058))

(assert (= (and b!324058 res!177390) b!324052))

(assert (= (and b!324052 res!177385) b!324056))

(assert (= (and b!324056 res!177389) b!324054))

(assert (= (and b!324054 res!177388) b!324053))

(assert (= (and b!324053 res!177386) b!324059))

(declare-fun m!331173 () Bool)

(assert (=> b!324053 m!331173))

(declare-fun m!331175 () Bool)

(assert (=> start!32438 m!331175))

(declare-fun m!331177 () Bool)

(assert (=> start!32438 m!331177))

(declare-fun m!331179 () Bool)

(assert (=> b!324058 m!331179))

(declare-fun m!331181 () Bool)

(assert (=> b!324057 m!331181))

(declare-fun m!331183 () Bool)

(assert (=> b!324052 m!331183))

(declare-fun m!331185 () Bool)

(assert (=> b!324056 m!331185))

(declare-fun m!331187 () Bool)

(assert (=> b!324054 m!331187))

(assert (=> b!324054 m!331187))

(declare-fun m!331189 () Bool)

(assert (=> b!324054 m!331189))

(declare-fun m!331191 () Bool)

(assert (=> b!324059 m!331191))

(push 1)

(assert (not b!324052))

(assert (not b!324058))

(assert (not b!324054))

(assert (not b!324056))

(assert (not start!32438))

(assert (not b!324057))

(assert (not b!324059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

