; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32530 () Bool)

(assert start!32530)

(declare-fun b!325403 () Bool)

(declare-fun res!178736 () Bool)

(declare-fun e!200569 () Bool)

(assert (=> b!325403 (=> (not res!178736) (not e!200569))))

(declare-datatypes ((array!16669 0))(
  ( (array!16670 (arr!7892 (Array (_ BitVec 32) (_ BitVec 64))) (size!8244 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16669)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325403 (= res!178736 (and (= (select (arr!7892 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8244 a!3305))))))

(declare-fun b!325404 () Bool)

(declare-fun res!178740 () Bool)

(declare-fun e!200567 () Bool)

(assert (=> b!325404 (=> (not res!178740) (not e!200567))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16669 (_ BitVec 32)) Bool)

(assert (=> b!325404 (= res!178740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325405 () Bool)

(declare-fun res!178742 () Bool)

(assert (=> b!325405 (=> (not res!178742) (not e!200567))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325405 (= res!178742 (validKeyInArray!0 k!2497))))

(declare-fun res!178741 () Bool)

(assert (=> start!32530 (=> (not res!178741) (not e!200567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32530 (= res!178741 (validMask!0 mask!3777))))

(assert (=> start!32530 e!200567))

(declare-fun array_inv!5855 (array!16669) Bool)

(assert (=> start!32530 (array_inv!5855 a!3305)))

(assert (=> start!32530 true))

(declare-fun b!325406 () Bool)

(declare-fun res!178738 () Bool)

(assert (=> b!325406 (=> (not res!178738) (not e!200567))))

(declare-datatypes ((SeekEntryResult!3023 0))(
  ( (MissingZero!3023 (index!14268 (_ BitVec 32))) (Found!3023 (index!14269 (_ BitVec 32))) (Intermediate!3023 (undefined!3835 Bool) (index!14270 (_ BitVec 32)) (x!32507 (_ BitVec 32))) (Undefined!3023) (MissingVacant!3023 (index!14271 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16669 (_ BitVec 32)) SeekEntryResult!3023)

(assert (=> b!325406 (= res!178738 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3023 i!1250)))))

(declare-fun b!325407 () Bool)

(assert (=> b!325407 (= e!200569 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000)))))

(declare-fun lt!156995 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325407 (= lt!156995 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325408 () Bool)

(declare-fun res!178737 () Bool)

(assert (=> b!325408 (=> (not res!178737) (not e!200569))))

(declare-fun lt!156996 () SeekEntryResult!3023)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16669 (_ BitVec 32)) SeekEntryResult!3023)

(assert (=> b!325408 (= res!178737 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156996))))

(declare-fun b!325409 () Bool)

(declare-fun res!178739 () Bool)

(assert (=> b!325409 (=> (not res!178739) (not e!200567))))

(assert (=> b!325409 (= res!178739 (and (= (size!8244 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8244 a!3305))))))

(declare-fun b!325410 () Bool)

(declare-fun res!178743 () Bool)

(assert (=> b!325410 (=> (not res!178743) (not e!200569))))

(assert (=> b!325410 (= res!178743 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7892 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325411 () Bool)

(declare-fun res!178735 () Bool)

(assert (=> b!325411 (=> (not res!178735) (not e!200567))))

(declare-fun arrayContainsKey!0 (array!16669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325411 (= res!178735 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325412 () Bool)

(assert (=> b!325412 (= e!200567 e!200569)))

(declare-fun res!178734 () Bool)

(assert (=> b!325412 (=> (not res!178734) (not e!200569))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325412 (= res!178734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156996))))

(assert (=> b!325412 (= lt!156996 (Intermediate!3023 false resIndex!58 resX!58))))

(assert (= (and start!32530 res!178741) b!325409))

(assert (= (and b!325409 res!178739) b!325405))

(assert (= (and b!325405 res!178742) b!325411))

(assert (= (and b!325411 res!178735) b!325406))

(assert (= (and b!325406 res!178738) b!325404))

(assert (= (and b!325404 res!178740) b!325412))

(assert (= (and b!325412 res!178734) b!325403))

(assert (= (and b!325403 res!178736) b!325408))

(assert (= (and b!325408 res!178737) b!325410))

(assert (= (and b!325410 res!178743) b!325407))

(declare-fun m!332255 () Bool)

(assert (=> b!325403 m!332255))

(declare-fun m!332257 () Bool)

(assert (=> b!325406 m!332257))

(declare-fun m!332259 () Bool)

(assert (=> b!325411 m!332259))

(declare-fun m!332261 () Bool)

(assert (=> b!325408 m!332261))

(declare-fun m!332263 () Bool)

(assert (=> start!32530 m!332263))

(declare-fun m!332265 () Bool)

(assert (=> start!32530 m!332265))

(declare-fun m!332267 () Bool)

(assert (=> b!325410 m!332267))

(declare-fun m!332269 () Bool)

(assert (=> b!325412 m!332269))

(assert (=> b!325412 m!332269))

(declare-fun m!332271 () Bool)

(assert (=> b!325412 m!332271))

(declare-fun m!332273 () Bool)

(assert (=> b!325407 m!332273))

(declare-fun m!332275 () Bool)

(assert (=> b!325405 m!332275))

(declare-fun m!332277 () Bool)

(assert (=> b!325404 m!332277))

(push 1)

(assert (not b!325412))

(assert (not b!325407))

(assert (not b!325408))

(assert (not b!325405))

(assert (not b!325404))

(assert (not b!325411))

(assert (not start!32530))

(assert (not b!325406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

