; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32678 () Bool)

(assert start!32678)

(declare-fun b!326471 () Bool)

(declare-fun res!179507 () Bool)

(declare-fun e!201036 () Bool)

(assert (=> b!326471 (=> (not res!179507) (not e!201036))))

(declare-datatypes ((array!16715 0))(
  ( (array!16716 (arr!7912 (Array (_ BitVec 32) (_ BitVec 64))) (size!8264 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16715)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326471 (= res!179507 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326472 () Bool)

(declare-fun e!201037 () Bool)

(assert (=> b!326472 (= e!201036 e!201037)))

(declare-fun res!179510 () Bool)

(assert (=> b!326472 (=> (not res!179510) (not e!201037))))

(declare-datatypes ((SeekEntryResult!3043 0))(
  ( (MissingZero!3043 (index!14348 (_ BitVec 32))) (Found!3043 (index!14349 (_ BitVec 32))) (Intermediate!3043 (undefined!3855 Bool) (index!14350 (_ BitVec 32)) (x!32593 (_ BitVec 32))) (Undefined!3043) (MissingVacant!3043 (index!14351 (_ BitVec 32))) )
))
(declare-fun lt!157331 () SeekEntryResult!3043)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16715 (_ BitVec 32)) SeekEntryResult!3043)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326472 (= res!179510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157331))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326472 (= lt!157331 (Intermediate!3043 false resIndex!58 resX!58))))

(declare-fun b!326473 () Bool)

(declare-fun res!179503 () Bool)

(assert (=> b!326473 (=> (not res!179503) (not e!201036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326473 (= res!179503 (validKeyInArray!0 k!2497))))

(declare-fun b!326474 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326474 (= e!201037 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10120 0))(
  ( (Unit!10121) )
))
(declare-fun lt!157332 () Unit!10120)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16715 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10120)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326474 (= lt!157332 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326475 () Bool)

(declare-fun res!179502 () Bool)

(assert (=> b!326475 (=> (not res!179502) (not e!201036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16715 (_ BitVec 32)) Bool)

(assert (=> b!326475 (= res!179502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326476 () Bool)

(declare-fun res!179508 () Bool)

(assert (=> b!326476 (=> (not res!179508) (not e!201037))))

(assert (=> b!326476 (= res!179508 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157331))))

(declare-fun b!326477 () Bool)

(declare-fun res!179506 () Bool)

(assert (=> b!326477 (=> (not res!179506) (not e!201036))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16715 (_ BitVec 32)) SeekEntryResult!3043)

(assert (=> b!326477 (= res!179506 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3043 i!1250)))))

(declare-fun b!326478 () Bool)

(declare-fun res!179505 () Bool)

(assert (=> b!326478 (=> (not res!179505) (not e!201036))))

(assert (=> b!326478 (= res!179505 (and (= (size!8264 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8264 a!3305))))))

(declare-fun res!179509 () Bool)

(assert (=> start!32678 (=> (not res!179509) (not e!201036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32678 (= res!179509 (validMask!0 mask!3777))))

(assert (=> start!32678 e!201036))

(declare-fun array_inv!5875 (array!16715) Bool)

(assert (=> start!32678 (array_inv!5875 a!3305)))

(assert (=> start!32678 true))

(declare-fun b!326479 () Bool)

(declare-fun res!179504 () Bool)

(assert (=> b!326479 (=> (not res!179504) (not e!201037))))

(assert (=> b!326479 (= res!179504 (and (= (select (arr!7912 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8264 a!3305))))))

(declare-fun b!326480 () Bool)

(declare-fun res!179511 () Bool)

(assert (=> b!326480 (=> (not res!179511) (not e!201037))))

(assert (=> b!326480 (= res!179511 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7912 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32678 res!179509) b!326478))

(assert (= (and b!326478 res!179505) b!326473))

(assert (= (and b!326473 res!179503) b!326471))

(assert (= (and b!326471 res!179507) b!326477))

(assert (= (and b!326477 res!179506) b!326475))

(assert (= (and b!326475 res!179502) b!326472))

(assert (= (and b!326472 res!179510) b!326479))

(assert (= (and b!326479 res!179504) b!326476))

(assert (= (and b!326476 res!179508) b!326480))

(assert (= (and b!326480 res!179511) b!326474))

(declare-fun m!333015 () Bool)

(assert (=> b!326477 m!333015))

(declare-fun m!333017 () Bool)

(assert (=> b!326479 m!333017))

(declare-fun m!333019 () Bool)

(assert (=> start!32678 m!333019))

(declare-fun m!333021 () Bool)

(assert (=> start!32678 m!333021))

(declare-fun m!333023 () Bool)

(assert (=> b!326473 m!333023))

(declare-fun m!333025 () Bool)

(assert (=> b!326471 m!333025))

(declare-fun m!333027 () Bool)

(assert (=> b!326480 m!333027))

(declare-fun m!333029 () Bool)

(assert (=> b!326476 m!333029))

(declare-fun m!333031 () Bool)

(assert (=> b!326474 m!333031))

(assert (=> b!326474 m!333031))

(declare-fun m!333033 () Bool)

(assert (=> b!326474 m!333033))

(declare-fun m!333035 () Bool)

(assert (=> b!326475 m!333035))

(declare-fun m!333037 () Bool)

(assert (=> b!326472 m!333037))

(assert (=> b!326472 m!333037))

(declare-fun m!333039 () Bool)

(assert (=> b!326472 m!333039))

(push 1)

(assert (not b!326476))

(assert (not b!326475))

(assert (not b!326472))

(assert (not b!326477))

(assert (not b!326471))

(assert (not start!32678))

(assert (not b!326474))

(assert (not b!326473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

