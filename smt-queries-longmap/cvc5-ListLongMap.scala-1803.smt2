; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32518 () Bool)

(assert start!32518)

(declare-fun b!325223 () Bool)

(declare-fun e!200515 () Bool)

(assert (=> b!325223 (= e!200515 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!156960 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325223 (= lt!156960 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325225 () Bool)

(declare-fun res!178556 () Bool)

(declare-fun e!200514 () Bool)

(assert (=> b!325225 (=> (not res!178556) (not e!200514))))

(declare-datatypes ((array!16657 0))(
  ( (array!16658 (arr!7886 (Array (_ BitVec 32) (_ BitVec 64))) (size!8238 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16657)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16657 (_ BitVec 32)) Bool)

(assert (=> b!325225 (= res!178556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325226 () Bool)

(declare-fun res!178558 () Bool)

(assert (=> b!325226 (=> (not res!178558) (not e!200515))))

(declare-datatypes ((SeekEntryResult!3017 0))(
  ( (MissingZero!3017 (index!14244 (_ BitVec 32))) (Found!3017 (index!14245 (_ BitVec 32))) (Intermediate!3017 (undefined!3829 Bool) (index!14246 (_ BitVec 32)) (x!32485 (_ BitVec 32))) (Undefined!3017) (MissingVacant!3017 (index!14247 (_ BitVec 32))) )
))
(declare-fun lt!156959 () SeekEntryResult!3017)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16657 (_ BitVec 32)) SeekEntryResult!3017)

(assert (=> b!325226 (= res!178558 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156959))))

(declare-fun b!325227 () Bool)

(declare-fun res!178560 () Bool)

(assert (=> b!325227 (=> (not res!178560) (not e!200514))))

(declare-fun arrayContainsKey!0 (array!16657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325227 (= res!178560 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325228 () Bool)

(declare-fun res!178562 () Bool)

(assert (=> b!325228 (=> (not res!178562) (not e!200514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325228 (= res!178562 (validKeyInArray!0 k!2497))))

(declare-fun b!325229 () Bool)

(declare-fun res!178563 () Bool)

(assert (=> b!325229 (=> (not res!178563) (not e!200514))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325229 (= res!178563 (and (= (size!8238 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8238 a!3305))))))

(declare-fun b!325230 () Bool)

(declare-fun res!178555 () Bool)

(assert (=> b!325230 (=> (not res!178555) (not e!200514))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16657 (_ BitVec 32)) SeekEntryResult!3017)

(assert (=> b!325230 (= res!178555 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3017 i!1250)))))

(declare-fun b!325231 () Bool)

(declare-fun res!178557 () Bool)

(assert (=> b!325231 (=> (not res!178557) (not e!200515))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325231 (= res!178557 (and (= (select (arr!7886 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8238 a!3305))))))

(declare-fun b!325232 () Bool)

(declare-fun res!178559 () Bool)

(assert (=> b!325232 (=> (not res!178559) (not e!200515))))

(assert (=> b!325232 (= res!178559 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7886 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325224 () Bool)

(assert (=> b!325224 (= e!200514 e!200515)))

(declare-fun res!178554 () Bool)

(assert (=> b!325224 (=> (not res!178554) (not e!200515))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325224 (= res!178554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156959))))

(assert (=> b!325224 (= lt!156959 (Intermediate!3017 false resIndex!58 resX!58))))

(declare-fun res!178561 () Bool)

(assert (=> start!32518 (=> (not res!178561) (not e!200514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32518 (= res!178561 (validMask!0 mask!3777))))

(assert (=> start!32518 e!200514))

(declare-fun array_inv!5849 (array!16657) Bool)

(assert (=> start!32518 (array_inv!5849 a!3305)))

(assert (=> start!32518 true))

(assert (= (and start!32518 res!178561) b!325229))

(assert (= (and b!325229 res!178563) b!325228))

(assert (= (and b!325228 res!178562) b!325227))

(assert (= (and b!325227 res!178560) b!325230))

(assert (= (and b!325230 res!178555) b!325225))

(assert (= (and b!325225 res!178556) b!325224))

(assert (= (and b!325224 res!178554) b!325231))

(assert (= (and b!325231 res!178557) b!325226))

(assert (= (and b!325226 res!178558) b!325232))

(assert (= (and b!325232 res!178559) b!325223))

(declare-fun m!332111 () Bool)

(assert (=> b!325224 m!332111))

(assert (=> b!325224 m!332111))

(declare-fun m!332113 () Bool)

(assert (=> b!325224 m!332113))

(declare-fun m!332115 () Bool)

(assert (=> b!325225 m!332115))

(declare-fun m!332117 () Bool)

(assert (=> b!325230 m!332117))

(declare-fun m!332119 () Bool)

(assert (=> b!325227 m!332119))

(declare-fun m!332121 () Bool)

(assert (=> b!325226 m!332121))

(declare-fun m!332123 () Bool)

(assert (=> b!325228 m!332123))

(declare-fun m!332125 () Bool)

(assert (=> start!32518 m!332125))

(declare-fun m!332127 () Bool)

(assert (=> start!32518 m!332127))

(declare-fun m!332129 () Bool)

(assert (=> b!325223 m!332129))

(declare-fun m!332131 () Bool)

(assert (=> b!325232 m!332131))

(declare-fun m!332133 () Bool)

(assert (=> b!325231 m!332133))

(push 1)

