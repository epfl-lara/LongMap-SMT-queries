; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32656 () Bool)

(assert start!32656)

(declare-fun b!326141 () Bool)

(declare-fun e!200938 () Bool)

(assert (=> b!326141 (= e!200938 false)))

(declare-datatypes ((array!16693 0))(
  ( (array!16694 (arr!7901 (Array (_ BitVec 32) (_ BitVec 64))) (size!8253 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16693)

(declare-datatypes ((Unit!10098 0))(
  ( (Unit!10099) )
))
(declare-fun lt!157266 () Unit!10098)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16693 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10098)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326141 (= lt!157266 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326142 () Bool)

(declare-fun res!179180 () Bool)

(declare-fun e!200937 () Bool)

(assert (=> b!326142 (=> (not res!179180) (not e!200937))))

(declare-fun arrayContainsKey!0 (array!16693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326142 (= res!179180 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326143 () Bool)

(declare-fun res!179175 () Bool)

(assert (=> b!326143 (=> (not res!179175) (not e!200938))))

(assert (=> b!326143 (= res!179175 (and (= (select (arr!7901 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8253 a!3305))))))

(declare-fun b!326144 () Bool)

(declare-fun res!179174 () Bool)

(assert (=> b!326144 (=> (not res!179174) (not e!200937))))

(assert (=> b!326144 (= res!179174 (and (= (size!8253 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8253 a!3305))))))

(declare-fun b!326145 () Bool)

(declare-fun res!179178 () Bool)

(assert (=> b!326145 (=> (not res!179178) (not e!200937))))

(declare-datatypes ((SeekEntryResult!3032 0))(
  ( (MissingZero!3032 (index!14304 (_ BitVec 32))) (Found!3032 (index!14305 (_ BitVec 32))) (Intermediate!3032 (undefined!3844 Bool) (index!14306 (_ BitVec 32)) (x!32558 (_ BitVec 32))) (Undefined!3032) (MissingVacant!3032 (index!14307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16693 (_ BitVec 32)) SeekEntryResult!3032)

(assert (=> b!326145 (= res!179178 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3032 i!1250)))))

(declare-fun b!326146 () Bool)

(declare-fun res!179177 () Bool)

(assert (=> b!326146 (=> (not res!179177) (not e!200938))))

(assert (=> b!326146 (= res!179177 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7901 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326147 () Bool)

(assert (=> b!326147 (= e!200937 e!200938)))

(declare-fun res!179173 () Bool)

(assert (=> b!326147 (=> (not res!179173) (not e!200938))))

(declare-fun lt!157265 () SeekEntryResult!3032)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16693 (_ BitVec 32)) SeekEntryResult!3032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326147 (= res!179173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157265))))

(assert (=> b!326147 (= lt!157265 (Intermediate!3032 false resIndex!58 resX!58))))

(declare-fun b!326148 () Bool)

(declare-fun res!179176 () Bool)

(assert (=> b!326148 (=> (not res!179176) (not e!200937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16693 (_ BitVec 32)) Bool)

(assert (=> b!326148 (= res!179176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!179181 () Bool)

(assert (=> start!32656 (=> (not res!179181) (not e!200937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32656 (= res!179181 (validMask!0 mask!3777))))

(assert (=> start!32656 e!200937))

(declare-fun array_inv!5864 (array!16693) Bool)

(assert (=> start!32656 (array_inv!5864 a!3305)))

(assert (=> start!32656 true))

(declare-fun b!326149 () Bool)

(declare-fun res!179179 () Bool)

(assert (=> b!326149 (=> (not res!179179) (not e!200937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326149 (= res!179179 (validKeyInArray!0 k!2497))))

(declare-fun b!326150 () Bool)

(declare-fun res!179172 () Bool)

(assert (=> b!326150 (=> (not res!179172) (not e!200938))))

(assert (=> b!326150 (= res!179172 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157265))))

(assert (= (and start!32656 res!179181) b!326144))

(assert (= (and b!326144 res!179174) b!326149))

(assert (= (and b!326149 res!179179) b!326142))

(assert (= (and b!326142 res!179180) b!326145))

(assert (= (and b!326145 res!179178) b!326148))

(assert (= (and b!326148 res!179176) b!326147))

(assert (= (and b!326147 res!179173) b!326143))

(assert (= (and b!326143 res!179175) b!326150))

(assert (= (and b!326150 res!179172) b!326146))

(assert (= (and b!326146 res!179177) b!326141))

(declare-fun m!332729 () Bool)

(assert (=> b!326148 m!332729))

(declare-fun m!332731 () Bool)

(assert (=> b!326146 m!332731))

(declare-fun m!332733 () Bool)

(assert (=> b!326145 m!332733))

(declare-fun m!332735 () Bool)

(assert (=> b!326147 m!332735))

(assert (=> b!326147 m!332735))

(declare-fun m!332737 () Bool)

(assert (=> b!326147 m!332737))

(declare-fun m!332739 () Bool)

(assert (=> b!326141 m!332739))

(assert (=> b!326141 m!332739))

(declare-fun m!332741 () Bool)

(assert (=> b!326141 m!332741))

(declare-fun m!332743 () Bool)

(assert (=> b!326143 m!332743))

(declare-fun m!332745 () Bool)

(assert (=> b!326150 m!332745))

(declare-fun m!332747 () Bool)

(assert (=> b!326149 m!332747))

(declare-fun m!332749 () Bool)

(assert (=> b!326142 m!332749))

(declare-fun m!332751 () Bool)

(assert (=> start!32656 m!332751))

(declare-fun m!332753 () Bool)

(assert (=> start!32656 m!332753))

(push 1)

(assert (not b!326142))

