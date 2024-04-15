; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32438 () Bool)

(assert start!32438)

(declare-fun b!323965 () Bool)

(declare-fun res!177446 () Bool)

(declare-fun e!200041 () Bool)

(assert (=> b!323965 (=> (not res!177446) (not e!200041))))

(declare-datatypes ((array!16581 0))(
  ( (array!16582 (arr!7848 (Array (_ BitVec 32) (_ BitVec 64))) (size!8201 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16581)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323965 (= res!177446 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323966 () Bool)

(declare-fun res!177444 () Bool)

(assert (=> b!323966 (=> (not res!177444) (not e!200041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323966 (= res!177444 (validKeyInArray!0 k0!2497))))

(declare-fun b!323967 () Bool)

(declare-fun res!177447 () Bool)

(declare-fun e!200042 () Bool)

(assert (=> b!323967 (=> (not res!177447) (not e!200042))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2978 0))(
  ( (MissingZero!2978 (index!14088 (_ BitVec 32))) (Found!2978 (index!14089 (_ BitVec 32))) (Intermediate!2978 (undefined!3790 Bool) (index!14090 (_ BitVec 32)) (x!32353 (_ BitVec 32))) (Undefined!2978) (MissingVacant!2978 (index!14091 (_ BitVec 32))) )
))
(declare-fun lt!156533 () SeekEntryResult!2978)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16581 (_ BitVec 32)) SeekEntryResult!2978)

(assert (=> b!323967 (= res!177447 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156533))))

(declare-fun b!323968 () Bool)

(declare-fun res!177443 () Bool)

(assert (=> b!323968 (=> (not res!177443) (not e!200041))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16581 (_ BitVec 32)) SeekEntryResult!2978)

(assert (=> b!323968 (= res!177443 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2978 i!1250)))))

(declare-fun b!323969 () Bool)

(assert (=> b!323969 (= e!200041 e!200042)))

(declare-fun res!177450 () Bool)

(assert (=> b!323969 (=> (not res!177450) (not e!200042))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323969 (= res!177450 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156533))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323969 (= lt!156533 (Intermediate!2978 false resIndex!58 resX!58))))

(declare-fun b!323970 () Bool)

(assert (=> b!323970 (= e!200042 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7848 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!323971 () Bool)

(declare-fun res!177442 () Bool)

(assert (=> b!323971 (=> (not res!177442) (not e!200042))))

(assert (=> b!323971 (= res!177442 (and (= (select (arr!7848 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8201 a!3305))))))

(declare-fun res!177445 () Bool)

(assert (=> start!32438 (=> (not res!177445) (not e!200041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32438 (= res!177445 (validMask!0 mask!3777))))

(assert (=> start!32438 e!200041))

(declare-fun array_inv!5820 (array!16581) Bool)

(assert (=> start!32438 (array_inv!5820 a!3305)))

(assert (=> start!32438 true))

(declare-fun b!323972 () Bool)

(declare-fun res!177448 () Bool)

(assert (=> b!323972 (=> (not res!177448) (not e!200041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16581 (_ BitVec 32)) Bool)

(assert (=> b!323972 (= res!177448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323973 () Bool)

(declare-fun res!177449 () Bool)

(assert (=> b!323973 (=> (not res!177449) (not e!200041))))

(assert (=> b!323973 (= res!177449 (and (= (size!8201 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8201 a!3305))))))

(assert (= (and start!32438 res!177445) b!323973))

(assert (= (and b!323973 res!177449) b!323966))

(assert (= (and b!323966 res!177444) b!323965))

(assert (= (and b!323965 res!177446) b!323968))

(assert (= (and b!323968 res!177443) b!323972))

(assert (= (and b!323972 res!177448) b!323969))

(assert (= (and b!323969 res!177450) b!323971))

(assert (= (and b!323971 res!177442) b!323967))

(assert (= (and b!323967 res!177447) b!323970))

(declare-fun m!330595 () Bool)

(assert (=> b!323966 m!330595))

(declare-fun m!330597 () Bool)

(assert (=> b!323968 m!330597))

(declare-fun m!330599 () Bool)

(assert (=> b!323970 m!330599))

(declare-fun m!330601 () Bool)

(assert (=> start!32438 m!330601))

(declare-fun m!330603 () Bool)

(assert (=> start!32438 m!330603))

(declare-fun m!330605 () Bool)

(assert (=> b!323965 m!330605))

(declare-fun m!330607 () Bool)

(assert (=> b!323969 m!330607))

(assert (=> b!323969 m!330607))

(declare-fun m!330609 () Bool)

(assert (=> b!323969 m!330609))

(declare-fun m!330611 () Bool)

(assert (=> b!323971 m!330611))

(declare-fun m!330613 () Bool)

(assert (=> b!323972 m!330613))

(declare-fun m!330615 () Bool)

(assert (=> b!323967 m!330615))

(check-sat (not b!323972) (not b!323966) (not b!323968) (not b!323967) (not b!323969) (not b!323965) (not start!32438))
(check-sat)
