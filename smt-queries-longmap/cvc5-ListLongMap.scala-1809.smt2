; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32662 () Bool)

(assert start!32662)

(declare-fun b!326231 () Bool)

(declare-fun res!179264 () Bool)

(declare-fun e!200964 () Bool)

(assert (=> b!326231 (=> (not res!179264) (not e!200964))))

(declare-datatypes ((array!16699 0))(
  ( (array!16700 (arr!7904 (Array (_ BitVec 32) (_ BitVec 64))) (size!8256 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16699)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326231 (= res!179264 (and (= (select (arr!7904 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8256 a!3305))))))

(declare-fun res!179270 () Bool)

(declare-fun e!200963 () Bool)

(assert (=> start!32662 (=> (not res!179270) (not e!200963))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32662 (= res!179270 (validMask!0 mask!3777))))

(assert (=> start!32662 e!200963))

(declare-fun array_inv!5867 (array!16699) Bool)

(assert (=> start!32662 (array_inv!5867 a!3305)))

(assert (=> start!32662 true))

(declare-fun b!326232 () Bool)

(declare-fun res!179262 () Bool)

(assert (=> b!326232 (=> (not res!179262) (not e!200964))))

(declare-fun k!2497 () (_ BitVec 64))

(assert (=> b!326232 (= res!179262 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7904 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326233 () Bool)

(declare-fun res!179268 () Bool)

(assert (=> b!326233 (=> (not res!179268) (not e!200963))))

(declare-datatypes ((SeekEntryResult!3035 0))(
  ( (MissingZero!3035 (index!14316 (_ BitVec 32))) (Found!3035 (index!14317 (_ BitVec 32))) (Intermediate!3035 (undefined!3847 Bool) (index!14318 (_ BitVec 32)) (x!32569 (_ BitVec 32))) (Undefined!3035) (MissingVacant!3035 (index!14319 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16699 (_ BitVec 32)) SeekEntryResult!3035)

(assert (=> b!326233 (= res!179268 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3035 i!1250)))))

(declare-fun b!326234 () Bool)

(assert (=> b!326234 (= e!200964 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10104 0))(
  ( (Unit!10105) )
))
(declare-fun lt!157284 () Unit!10104)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10104)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326234 (= lt!157284 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326235 () Bool)

(declare-fun res!179267 () Bool)

(assert (=> b!326235 (=> (not res!179267) (not e!200964))))

(declare-fun lt!157283 () SeekEntryResult!3035)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16699 (_ BitVec 32)) SeekEntryResult!3035)

(assert (=> b!326235 (= res!179267 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157283))))

(declare-fun b!326236 () Bool)

(assert (=> b!326236 (= e!200963 e!200964)))

(declare-fun res!179271 () Bool)

(assert (=> b!326236 (=> (not res!179271) (not e!200964))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326236 (= res!179271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157283))))

(assert (=> b!326236 (= lt!157283 (Intermediate!3035 false resIndex!58 resX!58))))

(declare-fun b!326237 () Bool)

(declare-fun res!179266 () Bool)

(assert (=> b!326237 (=> (not res!179266) (not e!200963))))

(assert (=> b!326237 (= res!179266 (and (= (size!8256 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8256 a!3305))))))

(declare-fun b!326238 () Bool)

(declare-fun res!179269 () Bool)

(assert (=> b!326238 (=> (not res!179269) (not e!200963))))

(declare-fun arrayContainsKey!0 (array!16699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326238 (= res!179269 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326239 () Bool)

(declare-fun res!179265 () Bool)

(assert (=> b!326239 (=> (not res!179265) (not e!200963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16699 (_ BitVec 32)) Bool)

(assert (=> b!326239 (= res!179265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326240 () Bool)

(declare-fun res!179263 () Bool)

(assert (=> b!326240 (=> (not res!179263) (not e!200963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326240 (= res!179263 (validKeyInArray!0 k!2497))))

(assert (= (and start!32662 res!179270) b!326237))

(assert (= (and b!326237 res!179266) b!326240))

(assert (= (and b!326240 res!179263) b!326238))

(assert (= (and b!326238 res!179269) b!326233))

(assert (= (and b!326233 res!179268) b!326239))

(assert (= (and b!326239 res!179265) b!326236))

(assert (= (and b!326236 res!179271) b!326231))

(assert (= (and b!326231 res!179264) b!326235))

(assert (= (and b!326235 res!179267) b!326232))

(assert (= (and b!326232 res!179262) b!326234))

(declare-fun m!332807 () Bool)

(assert (=> b!326236 m!332807))

(assert (=> b!326236 m!332807))

(declare-fun m!332809 () Bool)

(assert (=> b!326236 m!332809))

(declare-fun m!332811 () Bool)

(assert (=> b!326235 m!332811))

(declare-fun m!332813 () Bool)

(assert (=> b!326231 m!332813))

(declare-fun m!332815 () Bool)

(assert (=> b!326238 m!332815))

(declare-fun m!332817 () Bool)

(assert (=> b!326240 m!332817))

(declare-fun m!332819 () Bool)

(assert (=> b!326239 m!332819))

(declare-fun m!332821 () Bool)

(assert (=> start!32662 m!332821))

(declare-fun m!332823 () Bool)

(assert (=> start!32662 m!332823))

(declare-fun m!332825 () Bool)

(assert (=> b!326232 m!332825))

(declare-fun m!332827 () Bool)

(assert (=> b!326233 m!332827))

(declare-fun m!332829 () Bool)

(assert (=> b!326234 m!332829))

(assert (=> b!326234 m!332829))

(declare-fun m!332831 () Bool)

(assert (=> b!326234 m!332831))

(push 1)

(assert (not b!326236))

(assert (not b!326233))

(assert (not b!326239))

(assert (not b!326240))

(assert (not b!326235))

