; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32228 () Bool)

(assert start!32228)

(declare-fun b!320947 () Bool)

(declare-fun res!175068 () Bool)

(declare-fun e!199024 () Bool)

(assert (=> b!320947 (=> (not res!175068) (not e!199024))))

(declare-datatypes ((array!16418 0))(
  ( (array!16419 (arr!7768 (Array (_ BitVec 32) (_ BitVec 64))) (size!8120 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16418)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16418 (_ BitVec 32)) Bool)

(assert (=> b!320947 (= res!175068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!175070 () Bool)

(assert (=> start!32228 (=> (not res!175070) (not e!199024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32228 (= res!175070 (validMask!0 mask!3777))))

(assert (=> start!32228 e!199024))

(declare-fun array_inv!5731 (array!16418) Bool)

(assert (=> start!32228 (array_inv!5731 a!3305)))

(assert (=> start!32228 true))

(declare-fun b!320948 () Bool)

(declare-fun res!175074 () Bool)

(assert (=> b!320948 (=> (not res!175074) (not e!199024))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320948 (= res!175074 (and (= (select (arr!7768 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8120 a!3305))))))

(declare-fun b!320949 () Bool)

(declare-fun res!175072 () Bool)

(assert (=> b!320949 (=> (not res!175072) (not e!199024))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320949 (= res!175072 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320950 () Bool)

(declare-fun res!175073 () Bool)

(assert (=> b!320950 (=> (not res!175073) (not e!199024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320950 (= res!175073 (validKeyInArray!0 k!2497))))

(declare-fun b!320951 () Bool)

(assert (=> b!320951 (= e!199024 false)))

(declare-datatypes ((SeekEntryResult!2899 0))(
  ( (MissingZero!2899 (index!13772 (_ BitVec 32))) (Found!2899 (index!13773 (_ BitVec 32))) (Intermediate!2899 (undefined!3711 Bool) (index!13774 (_ BitVec 32)) (x!32038 (_ BitVec 32))) (Undefined!2899) (MissingVacant!2899 (index!13775 (_ BitVec 32))) )
))
(declare-fun lt!156138 () SeekEntryResult!2899)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16418 (_ BitVec 32)) SeekEntryResult!2899)

(assert (=> b!320951 (= lt!156138 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320952 () Bool)

(declare-fun res!175067 () Bool)

(assert (=> b!320952 (=> (not res!175067) (not e!199024))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320952 (= res!175067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2899 false resIndex!58 resX!58)))))

(declare-fun b!320953 () Bool)

(declare-fun res!175069 () Bool)

(assert (=> b!320953 (=> (not res!175069) (not e!199024))))

(assert (=> b!320953 (= res!175069 (and (= (size!8120 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8120 a!3305))))))

(declare-fun b!320954 () Bool)

(declare-fun res!175071 () Bool)

(assert (=> b!320954 (=> (not res!175071) (not e!199024))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16418 (_ BitVec 32)) SeekEntryResult!2899)

(assert (=> b!320954 (= res!175071 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2899 i!1250)))))

(assert (= (and start!32228 res!175070) b!320953))

(assert (= (and b!320953 res!175069) b!320950))

(assert (= (and b!320950 res!175073) b!320949))

(assert (= (and b!320949 res!175072) b!320954))

(assert (= (and b!320954 res!175071) b!320947))

(assert (= (and b!320947 res!175068) b!320952))

(assert (= (and b!320952 res!175067) b!320948))

(assert (= (and b!320948 res!175074) b!320951))

(declare-fun m!329181 () Bool)

(assert (=> b!320951 m!329181))

(declare-fun m!329183 () Bool)

(assert (=> b!320952 m!329183))

(assert (=> b!320952 m!329183))

(declare-fun m!329185 () Bool)

(assert (=> b!320952 m!329185))

(declare-fun m!329187 () Bool)

(assert (=> b!320947 m!329187))

(declare-fun m!329189 () Bool)

(assert (=> b!320948 m!329189))

(declare-fun m!329191 () Bool)

(assert (=> b!320954 m!329191))

(declare-fun m!329193 () Bool)

(assert (=> start!32228 m!329193))

(declare-fun m!329195 () Bool)

(assert (=> start!32228 m!329195))

(declare-fun m!329197 () Bool)

(assert (=> b!320949 m!329197))

(declare-fun m!329199 () Bool)

(assert (=> b!320950 m!329199))

(push 1)

(assert (not b!320954))

(assert (not b!320951))

(assert (not start!32228))

(assert (not b!320947))

(assert (not b!320952))

(assert (not b!320950))

(assert (not b!320949))

(check-sat)

