; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32446 () Bool)

(assert start!32446)

(declare-fun b!324159 () Bool)

(declare-fun res!177494 () Bool)

(declare-fun e!200190 () Bool)

(assert (=> b!324159 (=> (not res!177494) (not e!200190))))

(declare-datatypes ((array!16585 0))(
  ( (array!16586 (arr!7850 (Array (_ BitVec 32) (_ BitVec 64))) (size!8202 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16585)

(declare-datatypes ((SeekEntryResult!2981 0))(
  ( (MissingZero!2981 (index!14100 (_ BitVec 32))) (Found!2981 (index!14101 (_ BitVec 32))) (Intermediate!2981 (undefined!3793 Bool) (index!14102 (_ BitVec 32)) (x!32353 (_ BitVec 32))) (Undefined!2981) (MissingVacant!2981 (index!14103 (_ BitVec 32))) )
))
(declare-fun lt!156759 () SeekEntryResult!2981)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16585 (_ BitVec 32)) SeekEntryResult!2981)

(assert (=> b!324159 (= res!177494 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156759))))

(declare-fun b!324160 () Bool)

(declare-fun res!177493 () Bool)

(assert (=> b!324160 (=> (not res!177493) (not e!200190))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324160 (= res!177493 (and (= (select (arr!7850 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8202 a!3305))))))

(declare-fun b!324161 () Bool)

(assert (=> b!324161 (= e!200190 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7850 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!324162 () Bool)

(declare-fun res!177498 () Bool)

(declare-fun e!200189 () Bool)

(assert (=> b!324162 (=> (not res!177498) (not e!200189))))

(assert (=> b!324162 (= res!177498 (and (= (size!8202 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8202 a!3305))))))

(declare-fun b!324163 () Bool)

(declare-fun res!177490 () Bool)

(assert (=> b!324163 (=> (not res!177490) (not e!200189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324163 (= res!177490 (validKeyInArray!0 k!2497))))

(declare-fun b!324164 () Bool)

(assert (=> b!324164 (= e!200189 e!200190)))

(declare-fun res!177497 () Bool)

(assert (=> b!324164 (=> (not res!177497) (not e!200190))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324164 (= res!177497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156759))))

(assert (=> b!324164 (= lt!156759 (Intermediate!2981 false resIndex!58 resX!58))))

(declare-fun res!177492 () Bool)

(assert (=> start!32446 (=> (not res!177492) (not e!200189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32446 (= res!177492 (validMask!0 mask!3777))))

(assert (=> start!32446 e!200189))

(declare-fun array_inv!5813 (array!16585) Bool)

(assert (=> start!32446 (array_inv!5813 a!3305)))

(assert (=> start!32446 true))

(declare-fun b!324165 () Bool)

(declare-fun res!177491 () Bool)

(assert (=> b!324165 (=> (not res!177491) (not e!200189))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16585 (_ BitVec 32)) SeekEntryResult!2981)

(assert (=> b!324165 (= res!177491 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2981 i!1250)))))

(declare-fun b!324166 () Bool)

(declare-fun res!177496 () Bool)

(assert (=> b!324166 (=> (not res!177496) (not e!200189))))

(declare-fun arrayContainsKey!0 (array!16585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324166 (= res!177496 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324167 () Bool)

(declare-fun res!177495 () Bool)

(assert (=> b!324167 (=> (not res!177495) (not e!200189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16585 (_ BitVec 32)) Bool)

(assert (=> b!324167 (= res!177495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32446 res!177492) b!324162))

(assert (= (and b!324162 res!177498) b!324163))

(assert (= (and b!324163 res!177490) b!324166))

(assert (= (and b!324166 res!177496) b!324165))

(assert (= (and b!324165 res!177491) b!324167))

(assert (= (and b!324167 res!177495) b!324164))

(assert (= (and b!324164 res!177497) b!324160))

(assert (= (and b!324160 res!177493) b!324159))

(assert (= (and b!324159 res!177494) b!324161))

(declare-fun m!331259 () Bool)

(assert (=> b!324161 m!331259))

(declare-fun m!331261 () Bool)

(assert (=> b!324163 m!331261))

(declare-fun m!331263 () Bool)

(assert (=> b!324166 m!331263))

(declare-fun m!331265 () Bool)

(assert (=> b!324167 m!331265))

(declare-fun m!331267 () Bool)

(assert (=> b!324159 m!331267))

(declare-fun m!331269 () Bool)

(assert (=> b!324164 m!331269))

(assert (=> b!324164 m!331269))

(declare-fun m!331271 () Bool)

(assert (=> b!324164 m!331271))

(declare-fun m!331273 () Bool)

(assert (=> start!32446 m!331273))

(declare-fun m!331275 () Bool)

(assert (=> start!32446 m!331275))

(declare-fun m!331277 () Bool)

(assert (=> b!324160 m!331277))

(declare-fun m!331279 () Bool)

(assert (=> b!324165 m!331279))

(push 1)

(assert (not b!324165))

(assert (not b!324167))

(assert (not b!324164))

(assert (not b!324166))

(assert (not start!32446))

(assert (not b!324159))

(assert (not b!324163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

