; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33076 () Bool)

(assert start!33076)

(declare-fun b!329199 () Bool)

(declare-fun res!181388 () Bool)

(declare-fun e!202262 () Bool)

(assert (=> b!329199 (=> (not res!181388) (not e!202262))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329199 (= res!181388 (validKeyInArray!0 k!2497))))

(declare-fun b!329201 () Bool)

(declare-fun res!181384 () Bool)

(assert (=> b!329201 (=> (not res!181384) (not e!202262))))

(declare-datatypes ((array!16837 0))(
  ( (array!16838 (arr!7964 (Array (_ BitVec 32) (_ BitVec 64))) (size!8316 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16837)

(declare-fun arrayContainsKey!0 (array!16837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329201 (= res!181384 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329202 () Bool)

(declare-fun e!202263 () Bool)

(declare-fun e!202261 () Bool)

(assert (=> b!329202 (= e!202263 e!202261)))

(declare-fun res!181386 () Bool)

(assert (=> b!329202 (=> (not res!181386) (not e!202261))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3095 0))(
  ( (MissingZero!3095 (index!14556 (_ BitVec 32))) (Found!3095 (index!14557 (_ BitVec 32))) (Intermediate!3095 (undefined!3907 Bool) (index!14558 (_ BitVec 32)) (x!32828 (_ BitVec 32))) (Undefined!3095) (MissingVacant!3095 (index!14559 (_ BitVec 32))) )
))
(declare-fun lt!158156 () SeekEntryResult!3095)

(declare-fun lt!158157 () SeekEntryResult!3095)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329202 (= res!181386 (and (= lt!158156 lt!158157) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7964 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7964 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7964 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16837 (_ BitVec 32)) SeekEntryResult!3095)

(assert (=> b!329202 (= lt!158156 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!329203 () Bool)

(assert (=> b!329203 (= e!202261 (not false))))

(assert (=> b!329203 (= lt!158156 (Intermediate!3095 false index!1840 resX!58))))

(declare-fun b!329204 () Bool)

(declare-fun res!181385 () Bool)

(assert (=> b!329204 (=> (not res!181385) (not e!202262))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16837 (_ BitVec 32)) SeekEntryResult!3095)

(assert (=> b!329204 (= res!181385 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3095 i!1250)))))

(declare-fun b!329205 () Bool)

(declare-fun res!181390 () Bool)

(assert (=> b!329205 (=> (not res!181390) (not e!202263))))

(assert (=> b!329205 (= res!181390 (and (= (select (arr!7964 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8316 a!3305))))))

(declare-fun b!329206 () Bool)

(declare-fun res!181389 () Bool)

(assert (=> b!329206 (=> (not res!181389) (not e!202262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16837 (_ BitVec 32)) Bool)

(assert (=> b!329206 (= res!181389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329207 () Bool)

(declare-fun res!181391 () Bool)

(assert (=> b!329207 (=> (not res!181391) (not e!202262))))

(assert (=> b!329207 (= res!181391 (and (= (size!8316 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8316 a!3305))))))

(declare-fun b!329200 () Bool)

(assert (=> b!329200 (= e!202262 e!202263)))

(declare-fun res!181387 () Bool)

(assert (=> b!329200 (=> (not res!181387) (not e!202263))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329200 (= res!181387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158157))))

(assert (=> b!329200 (= lt!158157 (Intermediate!3095 false resIndex!58 resX!58))))

(declare-fun res!181392 () Bool)

(assert (=> start!33076 (=> (not res!181392) (not e!202262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33076 (= res!181392 (validMask!0 mask!3777))))

(assert (=> start!33076 e!202262))

(declare-fun array_inv!5927 (array!16837) Bool)

(assert (=> start!33076 (array_inv!5927 a!3305)))

(assert (=> start!33076 true))

(assert (= (and start!33076 res!181392) b!329207))

(assert (= (and b!329207 res!181391) b!329199))

(assert (= (and b!329199 res!181388) b!329201))

(assert (= (and b!329201 res!181384) b!329204))

(assert (= (and b!329204 res!181385) b!329206))

(assert (= (and b!329206 res!181389) b!329200))

(assert (= (and b!329200 res!181387) b!329205))

(assert (= (and b!329205 res!181390) b!329202))

(assert (= (and b!329202 res!181386) b!329203))

(declare-fun m!334925 () Bool)

(assert (=> b!329201 m!334925))

(declare-fun m!334927 () Bool)

(assert (=> b!329202 m!334927))

(declare-fun m!334929 () Bool)

(assert (=> b!329202 m!334929))

(declare-fun m!334931 () Bool)

(assert (=> start!33076 m!334931))

(declare-fun m!334933 () Bool)

(assert (=> start!33076 m!334933))

(declare-fun m!334935 () Bool)

(assert (=> b!329204 m!334935))

(declare-fun m!334937 () Bool)

(assert (=> b!329205 m!334937))

(declare-fun m!334939 () Bool)

(assert (=> b!329199 m!334939))

(declare-fun m!334941 () Bool)

(assert (=> b!329200 m!334941))

(assert (=> b!329200 m!334941))

(declare-fun m!334943 () Bool)

(assert (=> b!329200 m!334943))

(declare-fun m!334945 () Bool)

(assert (=> b!329206 m!334945))

(push 1)

