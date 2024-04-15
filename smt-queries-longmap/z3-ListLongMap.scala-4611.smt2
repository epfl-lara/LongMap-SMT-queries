; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64280 () Bool)

(assert start!64280)

(declare-fun b!722052 () Bool)

(declare-fun res!483921 () Bool)

(declare-fun e!404730 () Bool)

(assert (=> b!722052 (=> (not res!483921) (not e!404730))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!722052 (= res!483921 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722053 () Bool)

(declare-fun res!483930 () Bool)

(assert (=> b!722053 (=> (not res!483930) (not e!404730))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((array!40878 0))(
  ( (array!40879 (arr!19562 (Array (_ BitVec 32) (_ BitVec 64))) (size!19983 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40878)

(assert (=> b!722053 (= res!483930 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19562 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722054 () Bool)

(declare-fun res!483933 () Bool)

(declare-fun e!404727 () Bool)

(assert (=> b!722054 (=> (not res!483933) (not e!404727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40878 (_ BitVec 32)) Bool)

(assert (=> b!722054 (= res!483933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722055 () Bool)

(declare-fun res!483924 () Bool)

(declare-fun e!404729 () Bool)

(assert (=> b!722055 (=> (not res!483924) (not e!404729))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722055 (= res!483924 (validKeyInArray!0 k0!2102))))

(declare-fun b!722056 () Bool)

(assert (=> b!722056 (= e!404729 e!404727)))

(declare-fun res!483928 () Bool)

(assert (=> b!722056 (=> (not res!483928) (not e!404727))))

(declare-datatypes ((SeekEntryResult!7159 0))(
  ( (MissingZero!7159 (index!31004 (_ BitVec 32))) (Found!7159 (index!31005 (_ BitVec 32))) (Intermediate!7159 (undefined!7971 Bool) (index!31006 (_ BitVec 32)) (x!62019 (_ BitVec 32))) (Undefined!7159) (MissingVacant!7159 (index!31007 (_ BitVec 32))) )
))
(declare-fun lt!320011 () SeekEntryResult!7159)

(assert (=> b!722056 (= res!483928 (or (= lt!320011 (MissingZero!7159 i!1173)) (= lt!320011 (MissingVacant!7159 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40878 (_ BitVec 32)) SeekEntryResult!7159)

(assert (=> b!722056 (= lt!320011 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722057 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!722057 (= e!404730 (not (validKeyInArray!0 (select (store (arr!19562 a!3186) i!1173 k0!2102) j!159))))))

(declare-fun b!722058 () Bool)

(declare-fun res!483922 () Bool)

(assert (=> b!722058 (=> (not res!483922) (not e!404729))))

(assert (=> b!722058 (= res!483922 (validKeyInArray!0 (select (arr!19562 a!3186) j!159)))))

(declare-fun b!722059 () Bool)

(declare-fun res!483923 () Bool)

(assert (=> b!722059 (=> (not res!483923) (not e!404730))))

(declare-fun e!404731 () Bool)

(assert (=> b!722059 (= res!483923 e!404731)))

(declare-fun c!79437 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722059 (= c!79437 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722060 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40878 (_ BitVec 32)) SeekEntryResult!7159)

(assert (=> b!722060 (= e!404731 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19562 a!3186) j!159) a!3186 mask!3328) (Found!7159 j!159)))))

(declare-fun b!722061 () Bool)

(assert (=> b!722061 (= e!404727 e!404730)))

(declare-fun res!483932 () Bool)

(assert (=> b!722061 (=> (not res!483932) (not e!404730))))

(declare-fun lt!320012 () SeekEntryResult!7159)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40878 (_ BitVec 32)) SeekEntryResult!7159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722061 (= res!483932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19562 a!3186) j!159) mask!3328) (select (arr!19562 a!3186) j!159) a!3186 mask!3328) lt!320012))))

(assert (=> b!722061 (= lt!320012 (Intermediate!7159 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722062 () Bool)

(assert (=> b!722062 (= e!404731 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19562 a!3186) j!159) a!3186 mask!3328) lt!320012))))

(declare-fun res!483926 () Bool)

(assert (=> start!64280 (=> (not res!483926) (not e!404729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64280 (= res!483926 (validMask!0 mask!3328))))

(assert (=> start!64280 e!404729))

(assert (=> start!64280 true))

(declare-fun array_inv!15445 (array!40878) Bool)

(assert (=> start!64280 (array_inv!15445 a!3186)))

(declare-fun b!722063 () Bool)

(declare-fun res!483927 () Bool)

(assert (=> b!722063 (=> (not res!483927) (not e!404727))))

(assert (=> b!722063 (= res!483927 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19983 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19983 a!3186))))))

(declare-fun b!722064 () Bool)

(declare-fun res!483929 () Bool)

(assert (=> b!722064 (=> (not res!483929) (not e!404729))))

(declare-fun arrayContainsKey!0 (array!40878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722064 (= res!483929 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722065 () Bool)

(declare-fun res!483925 () Bool)

(assert (=> b!722065 (=> (not res!483925) (not e!404727))))

(declare-datatypes ((List!13603 0))(
  ( (Nil!13600) (Cons!13599 (h!14653 (_ BitVec 64)) (t!19909 List!13603)) )
))
(declare-fun arrayNoDuplicates!0 (array!40878 (_ BitVec 32) List!13603) Bool)

(assert (=> b!722065 (= res!483925 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13600))))

(declare-fun b!722066 () Bool)

(declare-fun res!483931 () Bool)

(assert (=> b!722066 (=> (not res!483931) (not e!404729))))

(assert (=> b!722066 (= res!483931 (and (= (size!19983 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19983 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19983 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64280 res!483926) b!722066))

(assert (= (and b!722066 res!483931) b!722058))

(assert (= (and b!722058 res!483922) b!722055))

(assert (= (and b!722055 res!483924) b!722064))

(assert (= (and b!722064 res!483929) b!722056))

(assert (= (and b!722056 res!483928) b!722054))

(assert (= (and b!722054 res!483933) b!722065))

(assert (= (and b!722065 res!483925) b!722063))

(assert (= (and b!722063 res!483927) b!722061))

(assert (= (and b!722061 res!483932) b!722053))

(assert (= (and b!722053 res!483930) b!722059))

(assert (= (and b!722059 c!79437) b!722062))

(assert (= (and b!722059 (not c!79437)) b!722060))

(assert (= (and b!722059 res!483923) b!722052))

(assert (= (and b!722052 res!483921) b!722057))

(declare-fun m!676103 () Bool)

(assert (=> start!64280 m!676103))

(declare-fun m!676105 () Bool)

(assert (=> start!64280 m!676105))

(declare-fun m!676107 () Bool)

(assert (=> b!722061 m!676107))

(assert (=> b!722061 m!676107))

(declare-fun m!676109 () Bool)

(assert (=> b!722061 m!676109))

(assert (=> b!722061 m!676109))

(assert (=> b!722061 m!676107))

(declare-fun m!676111 () Bool)

(assert (=> b!722061 m!676111))

(assert (=> b!722062 m!676107))

(assert (=> b!722062 m!676107))

(declare-fun m!676113 () Bool)

(assert (=> b!722062 m!676113))

(declare-fun m!676115 () Bool)

(assert (=> b!722054 m!676115))

(declare-fun m!676117 () Bool)

(assert (=> b!722055 m!676117))

(declare-fun m!676119 () Bool)

(assert (=> b!722065 m!676119))

(declare-fun m!676121 () Bool)

(assert (=> b!722057 m!676121))

(declare-fun m!676123 () Bool)

(assert (=> b!722057 m!676123))

(assert (=> b!722057 m!676123))

(declare-fun m!676125 () Bool)

(assert (=> b!722057 m!676125))

(declare-fun m!676127 () Bool)

(assert (=> b!722056 m!676127))

(assert (=> b!722058 m!676107))

(assert (=> b!722058 m!676107))

(declare-fun m!676129 () Bool)

(assert (=> b!722058 m!676129))

(declare-fun m!676131 () Bool)

(assert (=> b!722053 m!676131))

(assert (=> b!722060 m!676107))

(assert (=> b!722060 m!676107))

(declare-fun m!676133 () Bool)

(assert (=> b!722060 m!676133))

(declare-fun m!676135 () Bool)

(assert (=> b!722064 m!676135))

(check-sat (not b!722057) (not b!722064) (not b!722056) (not b!722054) (not start!64280) (not b!722062) (not b!722061) (not b!722060) (not b!722065) (not b!722058) (not b!722055))
(check-sat)
