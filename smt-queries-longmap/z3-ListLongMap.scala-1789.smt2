; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32420 () Bool)

(assert start!32420)

(declare-fun b!323729 () Bool)

(declare-fun res!177209 () Bool)

(declare-fun e!199967 () Bool)

(assert (=> b!323729 (=> (not res!177209) (not e!199967))))

(declare-datatypes ((array!16563 0))(
  ( (array!16564 (arr!7839 (Array (_ BitVec 32) (_ BitVec 64))) (size!8192 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16563)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16563 (_ BitVec 32)) Bool)

(assert (=> b!323729 (= res!177209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!177206 () Bool)

(assert (=> start!32420 (=> (not res!177206) (not e!199967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32420 (= res!177206 (validMask!0 mask!3777))))

(assert (=> start!32420 e!199967))

(declare-fun array_inv!5811 (array!16563) Bool)

(assert (=> start!32420 (array_inv!5811 a!3305)))

(assert (=> start!32420 true))

(declare-fun b!323730 () Bool)

(declare-fun res!177210 () Bool)

(assert (=> b!323730 (=> (not res!177210) (not e!199967))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2969 0))(
  ( (MissingZero!2969 (index!14052 (_ BitVec 32))) (Found!2969 (index!14053 (_ BitVec 32))) (Intermediate!2969 (undefined!3781 Bool) (index!14054 (_ BitVec 32)) (x!32320 (_ BitVec 32))) (Undefined!2969) (MissingVacant!2969 (index!14055 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16563 (_ BitVec 32)) SeekEntryResult!2969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323730 (= res!177210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2969 false resIndex!58 resX!58)))))

(declare-fun b!323731 () Bool)

(declare-fun res!177208 () Bool)

(assert (=> b!323731 (=> (not res!177208) (not e!199967))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323731 (= res!177208 (and (= (select (arr!7839 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8192 a!3305))))))

(declare-fun b!323732 () Bool)

(declare-fun res!177207 () Bool)

(assert (=> b!323732 (=> (not res!177207) (not e!199967))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16563 (_ BitVec 32)) SeekEntryResult!2969)

(assert (=> b!323732 (= res!177207 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2969 i!1250)))))

(declare-fun b!323733 () Bool)

(assert (=> b!323733 (= e!199967 false)))

(declare-fun lt!156506 () SeekEntryResult!2969)

(assert (=> b!323733 (= lt!156506 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!323734 () Bool)

(declare-fun res!177213 () Bool)

(assert (=> b!323734 (=> (not res!177213) (not e!199967))))

(declare-fun arrayContainsKey!0 (array!16563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323734 (= res!177213 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323735 () Bool)

(declare-fun res!177211 () Bool)

(assert (=> b!323735 (=> (not res!177211) (not e!199967))))

(assert (=> b!323735 (= res!177211 (and (= (size!8192 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8192 a!3305))))))

(declare-fun b!323736 () Bool)

(declare-fun res!177212 () Bool)

(assert (=> b!323736 (=> (not res!177212) (not e!199967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323736 (= res!177212 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32420 res!177206) b!323735))

(assert (= (and b!323735 res!177211) b!323736))

(assert (= (and b!323736 res!177212) b!323734))

(assert (= (and b!323734 res!177213) b!323732))

(assert (= (and b!323732 res!177207) b!323729))

(assert (= (and b!323729 res!177209) b!323730))

(assert (= (and b!323730 res!177210) b!323731))

(assert (= (and b!323731 res!177208) b!323733))

(declare-fun m!330403 () Bool)

(assert (=> b!323734 m!330403))

(declare-fun m!330405 () Bool)

(assert (=> b!323736 m!330405))

(declare-fun m!330407 () Bool)

(assert (=> start!32420 m!330407))

(declare-fun m!330409 () Bool)

(assert (=> start!32420 m!330409))

(declare-fun m!330411 () Bool)

(assert (=> b!323730 m!330411))

(assert (=> b!323730 m!330411))

(declare-fun m!330413 () Bool)

(assert (=> b!323730 m!330413))

(declare-fun m!330415 () Bool)

(assert (=> b!323733 m!330415))

(declare-fun m!330417 () Bool)

(assert (=> b!323731 m!330417))

(declare-fun m!330419 () Bool)

(assert (=> b!323729 m!330419))

(declare-fun m!330421 () Bool)

(assert (=> b!323732 m!330421))

(check-sat (not b!323729) (not start!32420) (not b!323734) (not b!323730) (not b!323736) (not b!323732) (not b!323733))
(check-sat)
