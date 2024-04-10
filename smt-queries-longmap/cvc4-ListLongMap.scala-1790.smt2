; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32444 () Bool)

(assert start!32444)

(declare-fun b!324132 () Bool)

(declare-fun res!177463 () Bool)

(declare-fun e!200182 () Bool)

(assert (=> b!324132 (=> (not res!177463) (not e!200182))))

(declare-datatypes ((array!16583 0))(
  ( (array!16584 (arr!7849 (Array (_ BitVec 32) (_ BitVec 64))) (size!8201 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16583)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2980 0))(
  ( (MissingZero!2980 (index!14096 (_ BitVec 32))) (Found!2980 (index!14097 (_ BitVec 32))) (Intermediate!2980 (undefined!3792 Bool) (index!14098 (_ BitVec 32)) (x!32344 (_ BitVec 32))) (Undefined!2980) (MissingVacant!2980 (index!14099 (_ BitVec 32))) )
))
(declare-fun lt!156756 () SeekEntryResult!2980)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16583 (_ BitVec 32)) SeekEntryResult!2980)

(assert (=> b!324132 (= res!177463 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156756))))

(declare-fun b!324133 () Bool)

(declare-fun res!177471 () Bool)

(assert (=> b!324133 (=> (not res!177471) (not e!200182))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324133 (= res!177471 (and (= (select (arr!7849 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8201 a!3305))))))

(declare-fun b!324134 () Bool)

(declare-fun res!177464 () Bool)

(declare-fun e!200180 () Bool)

(assert (=> b!324134 (=> (not res!177464) (not e!200180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16583 (_ BitVec 32)) Bool)

(assert (=> b!324134 (= res!177464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324135 () Bool)

(declare-fun res!177465 () Bool)

(assert (=> b!324135 (=> (not res!177465) (not e!200180))))

(declare-fun arrayContainsKey!0 (array!16583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324135 (= res!177465 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324136 () Bool)

(assert (=> b!324136 (= e!200180 e!200182)))

(declare-fun res!177469 () Bool)

(assert (=> b!324136 (=> (not res!177469) (not e!200182))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324136 (= res!177469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156756))))

(assert (=> b!324136 (= lt!156756 (Intermediate!2980 false resIndex!58 resX!58))))

(declare-fun b!324137 () Bool)

(declare-fun res!177468 () Bool)

(assert (=> b!324137 (=> (not res!177468) (not e!200180))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16583 (_ BitVec 32)) SeekEntryResult!2980)

(assert (=> b!324137 (= res!177468 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2980 i!1250)))))

(declare-fun res!177470 () Bool)

(assert (=> start!32444 (=> (not res!177470) (not e!200180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32444 (= res!177470 (validMask!0 mask!3777))))

(assert (=> start!32444 e!200180))

(declare-fun array_inv!5812 (array!16583) Bool)

(assert (=> start!32444 (array_inv!5812 a!3305)))

(assert (=> start!32444 true))

(declare-fun b!324138 () Bool)

(assert (=> b!324138 (= e!200182 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7849 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!324139 () Bool)

(declare-fun res!177467 () Bool)

(assert (=> b!324139 (=> (not res!177467) (not e!200180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324139 (= res!177467 (validKeyInArray!0 k!2497))))

(declare-fun b!324140 () Bool)

(declare-fun res!177466 () Bool)

(assert (=> b!324140 (=> (not res!177466) (not e!200180))))

(assert (=> b!324140 (= res!177466 (and (= (size!8201 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8201 a!3305))))))

(assert (= (and start!32444 res!177470) b!324140))

(assert (= (and b!324140 res!177466) b!324139))

(assert (= (and b!324139 res!177467) b!324135))

(assert (= (and b!324135 res!177465) b!324137))

(assert (= (and b!324137 res!177468) b!324134))

(assert (= (and b!324134 res!177464) b!324136))

(assert (= (and b!324136 res!177469) b!324133))

(assert (= (and b!324133 res!177471) b!324132))

(assert (= (and b!324132 res!177463) b!324138))

(declare-fun m!331237 () Bool)

(assert (=> b!324138 m!331237))

(declare-fun m!331239 () Bool)

(assert (=> start!32444 m!331239))

(declare-fun m!331241 () Bool)

(assert (=> start!32444 m!331241))

(declare-fun m!331243 () Bool)

(assert (=> b!324132 m!331243))

(declare-fun m!331245 () Bool)

(assert (=> b!324134 m!331245))

(declare-fun m!331247 () Bool)

(assert (=> b!324139 m!331247))

(declare-fun m!331249 () Bool)

(assert (=> b!324133 m!331249))

(declare-fun m!331251 () Bool)

(assert (=> b!324137 m!331251))

(declare-fun m!331253 () Bool)

(assert (=> b!324136 m!331253))

(assert (=> b!324136 m!331253))

(declare-fun m!331255 () Bool)

(assert (=> b!324136 m!331255))

(declare-fun m!331257 () Bool)

(assert (=> b!324135 m!331257))

(push 1)

(assert (not b!324135))

(assert (not b!324132))

(assert (not b!324136))

(assert (not b!324137))

(assert (not b!324139))

(assert (not b!324134))

(assert (not start!32444))

(check-sat)

(pop 1)

