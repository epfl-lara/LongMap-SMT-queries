; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32238 () Bool)

(assert start!32238)

(declare-fun b!320979 () Bool)

(declare-fun res!175244 () Bool)

(declare-fun e!198938 () Bool)

(assert (=> b!320979 (=> (not res!175244) (not e!198938))))

(declare-datatypes ((array!16432 0))(
  ( (array!16433 (arr!7775 (Array (_ BitVec 32) (_ BitVec 64))) (size!8128 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16432)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320979 (= res!175244 (and (= (select (arr!7775 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8128 a!3305))))))

(declare-fun b!320980 () Bool)

(assert (=> b!320980 (= e!198938 false)))

(declare-datatypes ((SeekEntryResult!2905 0))(
  ( (MissingZero!2905 (index!13796 (_ BitVec 32))) (Found!2905 (index!13797 (_ BitVec 32))) (Intermediate!2905 (undefined!3717 Bool) (index!13798 (_ BitVec 32)) (x!32071 (_ BitVec 32))) (Undefined!2905) (MissingVacant!2905 (index!13799 (_ BitVec 32))) )
))
(declare-fun lt!155939 () SeekEntryResult!2905)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16432 (_ BitVec 32)) SeekEntryResult!2905)

(assert (=> b!320980 (= lt!155939 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320981 () Bool)

(declare-fun res!175245 () Bool)

(assert (=> b!320981 (=> (not res!175245) (not e!198938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320981 (= res!175245 (validKeyInArray!0 k!2497))))

(declare-fun b!320982 () Bool)

(declare-fun res!175250 () Bool)

(assert (=> b!320982 (=> (not res!175250) (not e!198938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16432 (_ BitVec 32)) Bool)

(assert (=> b!320982 (= res!175250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320983 () Bool)

(declare-fun res!175248 () Bool)

(assert (=> b!320983 (=> (not res!175248) (not e!198938))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16432 (_ BitVec 32)) SeekEntryResult!2905)

(assert (=> b!320983 (= res!175248 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2905 i!1250)))))

(declare-fun res!175246 () Bool)

(assert (=> start!32238 (=> (not res!175246) (not e!198938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32238 (= res!175246 (validMask!0 mask!3777))))

(assert (=> start!32238 e!198938))

(declare-fun array_inv!5747 (array!16432) Bool)

(assert (=> start!32238 (array_inv!5747 a!3305)))

(assert (=> start!32238 true))

(declare-fun b!320978 () Bool)

(declare-fun res!175251 () Bool)

(assert (=> b!320978 (=> (not res!175251) (not e!198938))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320978 (= res!175251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2905 false resIndex!58 resX!58)))))

(declare-fun b!320984 () Bool)

(declare-fun res!175249 () Bool)

(assert (=> b!320984 (=> (not res!175249) (not e!198938))))

(assert (=> b!320984 (= res!175249 (and (= (size!8128 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8128 a!3305))))))

(declare-fun b!320985 () Bool)

(declare-fun res!175247 () Bool)

(assert (=> b!320985 (=> (not res!175247) (not e!198938))))

(declare-fun arrayContainsKey!0 (array!16432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320985 (= res!175247 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32238 res!175246) b!320984))

(assert (= (and b!320984 res!175249) b!320981))

(assert (= (and b!320981 res!175245) b!320985))

(assert (= (and b!320985 res!175247) b!320983))

(assert (= (and b!320983 res!175248) b!320982))

(assert (= (and b!320982 res!175250) b!320978))

(assert (= (and b!320978 res!175251) b!320979))

(assert (= (and b!320979 res!175244) b!320980))

(declare-fun m!328703 () Bool)

(assert (=> b!320981 m!328703))

(declare-fun m!328705 () Bool)

(assert (=> b!320978 m!328705))

(assert (=> b!320978 m!328705))

(declare-fun m!328707 () Bool)

(assert (=> b!320978 m!328707))

(declare-fun m!328709 () Bool)

(assert (=> b!320985 m!328709))

(declare-fun m!328711 () Bool)

(assert (=> b!320982 m!328711))

(declare-fun m!328713 () Bool)

(assert (=> b!320980 m!328713))

(declare-fun m!328715 () Bool)

(assert (=> b!320979 m!328715))

(declare-fun m!328717 () Bool)

(assert (=> b!320983 m!328717))

(declare-fun m!328719 () Bool)

(assert (=> start!32238 m!328719))

(declare-fun m!328721 () Bool)

(assert (=> start!32238 m!328721))

(push 1)

(assert (not b!320981))

(assert (not b!320978))

(assert (not b!320980))

(assert (not start!32238))

(assert (not b!320985))

(assert (not b!320982))

(assert (not b!320983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

