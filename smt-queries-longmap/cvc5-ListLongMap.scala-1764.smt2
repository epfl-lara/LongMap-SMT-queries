; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32230 () Bool)

(assert start!32230)

(declare-fun b!320973 () Bool)

(declare-fun res!175094 () Bool)

(declare-fun e!199032 () Bool)

(assert (=> b!320973 (=> (not res!175094) (not e!199032))))

(declare-datatypes ((array!16420 0))(
  ( (array!16421 (arr!7769 (Array (_ BitVec 32) (_ BitVec 64))) (size!8121 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16420)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320973 (= res!175094 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320974 () Bool)

(declare-fun e!199033 () Bool)

(assert (=> b!320974 (= e!199032 e!199033)))

(declare-fun res!175095 () Bool)

(assert (=> b!320974 (=> (not res!175095) (not e!199033))))

(declare-datatypes ((SeekEntryResult!2900 0))(
  ( (MissingZero!2900 (index!13776 (_ BitVec 32))) (Found!2900 (index!13777 (_ BitVec 32))) (Intermediate!2900 (undefined!3712 Bool) (index!13778 (_ BitVec 32)) (x!32047 (_ BitVec 32))) (Undefined!2900) (MissingVacant!2900 (index!13779 (_ BitVec 32))) )
))
(declare-fun lt!156141 () SeekEntryResult!2900)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16420 (_ BitVec 32)) SeekEntryResult!2900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320974 (= res!175095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156141))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320974 (= lt!156141 (Intermediate!2900 false resIndex!58 resX!58))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!320975 () Bool)

(assert (=> b!320975 (= e!199033 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7769 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7769 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7769 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!320976 () Bool)

(declare-fun res!175100 () Bool)

(assert (=> b!320976 (=> (not res!175100) (not e!199032))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16420 (_ BitVec 32)) SeekEntryResult!2900)

(assert (=> b!320976 (= res!175100 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2900 i!1250)))))

(declare-fun res!175101 () Bool)

(assert (=> start!32230 (=> (not res!175101) (not e!199032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32230 (= res!175101 (validMask!0 mask!3777))))

(assert (=> start!32230 e!199032))

(declare-fun array_inv!5732 (array!16420) Bool)

(assert (=> start!32230 (array_inv!5732 a!3305)))

(assert (=> start!32230 true))

(declare-fun b!320977 () Bool)

(declare-fun res!175096 () Bool)

(assert (=> b!320977 (=> (not res!175096) (not e!199032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16420 (_ BitVec 32)) Bool)

(assert (=> b!320977 (= res!175096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320978 () Bool)

(declare-fun res!175093 () Bool)

(assert (=> b!320978 (=> (not res!175093) (not e!199033))))

(assert (=> b!320978 (= res!175093 (and (= (select (arr!7769 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8121 a!3305))))))

(declare-fun b!320979 () Bool)

(declare-fun res!175097 () Bool)

(assert (=> b!320979 (=> (not res!175097) (not e!199032))))

(assert (=> b!320979 (= res!175097 (and (= (size!8121 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8121 a!3305))))))

(declare-fun b!320980 () Bool)

(declare-fun res!175098 () Bool)

(assert (=> b!320980 (=> (not res!175098) (not e!199032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320980 (= res!175098 (validKeyInArray!0 k!2497))))

(declare-fun b!320981 () Bool)

(declare-fun res!175099 () Bool)

(assert (=> b!320981 (=> (not res!175099) (not e!199033))))

(assert (=> b!320981 (= res!175099 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156141))))

(assert (= (and start!32230 res!175101) b!320979))

(assert (= (and b!320979 res!175097) b!320980))

(assert (= (and b!320980 res!175098) b!320973))

(assert (= (and b!320973 res!175094) b!320976))

(assert (= (and b!320976 res!175100) b!320977))

(assert (= (and b!320977 res!175096) b!320974))

(assert (= (and b!320974 res!175095) b!320978))

(assert (= (and b!320978 res!175093) b!320981))

(assert (= (and b!320981 res!175099) b!320975))

(declare-fun m!329201 () Bool)

(assert (=> b!320980 m!329201))

(declare-fun m!329203 () Bool)

(assert (=> b!320977 m!329203))

(declare-fun m!329205 () Bool)

(assert (=> b!320978 m!329205))

(declare-fun m!329207 () Bool)

(assert (=> b!320981 m!329207))

(declare-fun m!329209 () Bool)

(assert (=> start!32230 m!329209))

(declare-fun m!329211 () Bool)

(assert (=> start!32230 m!329211))

(declare-fun m!329213 () Bool)

(assert (=> b!320974 m!329213))

(assert (=> b!320974 m!329213))

(declare-fun m!329215 () Bool)

(assert (=> b!320974 m!329215))

(declare-fun m!329217 () Bool)

(assert (=> b!320973 m!329217))

(declare-fun m!329219 () Bool)

(assert (=> b!320975 m!329219))

(declare-fun m!329221 () Bool)

(assert (=> b!320976 m!329221))

(push 1)

(assert (not b!320980))

(assert (not b!320973))

(assert (not b!320981))

(assert (not b!320974))

(assert (not b!320977))

(assert (not b!320976))

(assert (not start!32230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

