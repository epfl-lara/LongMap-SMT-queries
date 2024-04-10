; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32440 () Bool)

(assert start!32440)

(declare-fun b!324078 () Bool)

(declare-fun res!177413 () Bool)

(declare-fun e!200162 () Bool)

(assert (=> b!324078 (=> (not res!177413) (not e!200162))))

(declare-datatypes ((array!16579 0))(
  ( (array!16580 (arr!7847 (Array (_ BitVec 32) (_ BitVec 64))) (size!8199 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16579)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2978 0))(
  ( (MissingZero!2978 (index!14088 (_ BitVec 32))) (Found!2978 (index!14089 (_ BitVec 32))) (Intermediate!2978 (undefined!3790 Bool) (index!14090 (_ BitVec 32)) (x!32342 (_ BitVec 32))) (Undefined!2978) (MissingVacant!2978 (index!14091 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16579 (_ BitVec 32)) SeekEntryResult!2978)

(assert (=> b!324078 (= res!177413 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2978 i!1250)))))

(declare-fun b!324079 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun e!200163 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324079 (= e!200163 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7847 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!324080 () Bool)

(declare-fun res!177411 () Bool)

(assert (=> b!324080 (=> (not res!177411) (not e!200163))))

(declare-fun lt!156750 () SeekEntryResult!2978)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16579 (_ BitVec 32)) SeekEntryResult!2978)

(assert (=> b!324080 (= res!177411 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156750))))

(declare-fun res!177409 () Bool)

(assert (=> start!32440 (=> (not res!177409) (not e!200162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32440 (= res!177409 (validMask!0 mask!3777))))

(assert (=> start!32440 e!200162))

(declare-fun array_inv!5810 (array!16579) Bool)

(assert (=> start!32440 (array_inv!5810 a!3305)))

(assert (=> start!32440 true))

(declare-fun b!324081 () Bool)

(declare-fun res!177410 () Bool)

(assert (=> b!324081 (=> (not res!177410) (not e!200162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16579 (_ BitVec 32)) Bool)

(assert (=> b!324081 (= res!177410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324082 () Bool)

(declare-fun res!177414 () Bool)

(assert (=> b!324082 (=> (not res!177414) (not e!200162))))

(declare-fun arrayContainsKey!0 (array!16579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324082 (= res!177414 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324083 () Bool)

(assert (=> b!324083 (= e!200162 e!200163)))

(declare-fun res!177412 () Bool)

(assert (=> b!324083 (=> (not res!177412) (not e!200163))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324083 (= res!177412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156750))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324083 (= lt!156750 (Intermediate!2978 false resIndex!58 resX!58))))

(declare-fun b!324084 () Bool)

(declare-fun res!177417 () Bool)

(assert (=> b!324084 (=> (not res!177417) (not e!200162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324084 (= res!177417 (validKeyInArray!0 k!2497))))

(declare-fun b!324085 () Bool)

(declare-fun res!177415 () Bool)

(assert (=> b!324085 (=> (not res!177415) (not e!200163))))

(assert (=> b!324085 (= res!177415 (and (= (select (arr!7847 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8199 a!3305))))))

(declare-fun b!324086 () Bool)

(declare-fun res!177416 () Bool)

(assert (=> b!324086 (=> (not res!177416) (not e!200162))))

(assert (=> b!324086 (= res!177416 (and (= (size!8199 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8199 a!3305))))))

(assert (= (and start!32440 res!177409) b!324086))

(assert (= (and b!324086 res!177416) b!324084))

(assert (= (and b!324084 res!177417) b!324082))

(assert (= (and b!324082 res!177414) b!324078))

(assert (= (and b!324078 res!177413) b!324081))

(assert (= (and b!324081 res!177410) b!324083))

(assert (= (and b!324083 res!177412) b!324085))

(assert (= (and b!324085 res!177415) b!324080))

(assert (= (and b!324080 res!177411) b!324079))

(declare-fun m!331193 () Bool)

(assert (=> b!324080 m!331193))

(declare-fun m!331195 () Bool)

(assert (=> b!324083 m!331195))

(assert (=> b!324083 m!331195))

(declare-fun m!331197 () Bool)

(assert (=> b!324083 m!331197))

(declare-fun m!331199 () Bool)

(assert (=> b!324084 m!331199))

(declare-fun m!331201 () Bool)

(assert (=> b!324085 m!331201))

(declare-fun m!331203 () Bool)

(assert (=> b!324082 m!331203))

(declare-fun m!331205 () Bool)

(assert (=> start!32440 m!331205))

(declare-fun m!331207 () Bool)

(assert (=> start!32440 m!331207))

(declare-fun m!331209 () Bool)

(assert (=> b!324081 m!331209))

(declare-fun m!331211 () Bool)

(assert (=> b!324079 m!331211))

(declare-fun m!331213 () Bool)

(assert (=> b!324078 m!331213))

(push 1)

