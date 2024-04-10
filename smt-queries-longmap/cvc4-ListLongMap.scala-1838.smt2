; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33296 () Bool)

(assert start!33296)

(declare-fun b!331107 () Bool)

(declare-fun res!182512 () Bool)

(declare-fun e!203147 () Bool)

(assert (=> b!331107 (=> (not res!182512) (not e!203147))))

(declare-datatypes ((array!16904 0))(
  ( (array!16905 (arr!7993 (Array (_ BitVec 32) (_ BitVec 64))) (size!8345 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16904)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3124 0))(
  ( (MissingZero!3124 (index!14672 (_ BitVec 32))) (Found!3124 (index!14673 (_ BitVec 32))) (Intermediate!3124 (undefined!3936 Bool) (index!14674 (_ BitVec 32)) (x!32956 (_ BitVec 32))) (Undefined!3124) (MissingVacant!3124 (index!14675 (_ BitVec 32))) )
))
(declare-fun lt!158715 () SeekEntryResult!3124)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16904 (_ BitVec 32)) SeekEntryResult!3124)

(assert (=> b!331107 (= res!182512 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158715))))

(declare-fun b!331108 () Bool)

(declare-fun e!203149 () Bool)

(assert (=> b!331108 (= e!203149 e!203147)))

(declare-fun res!182509 () Bool)

(assert (=> b!331108 (=> (not res!182509) (not e!203147))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331108 (= res!182509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158715))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!331108 (= lt!158715 (Intermediate!3124 false resIndex!58 resX!58))))

(declare-fun b!331109 () Bool)

(declare-fun res!182514 () Bool)

(assert (=> b!331109 (=> (not res!182514) (not e!203149))))

(declare-fun arrayContainsKey!0 (array!16904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331109 (= res!182514 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!331110 () Bool)

(declare-fun res!182517 () Bool)

(assert (=> b!331110 (=> (not res!182517) (not e!203147))))

(assert (=> b!331110 (= res!182517 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7993 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!331111 () Bool)

(assert (=> b!331111 (= e!203147 false)))

(declare-datatypes ((Unit!10327 0))(
  ( (Unit!10328) )
))
(declare-fun lt!158714 () Unit!10327)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16904 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10327)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331111 (= lt!158714 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun res!182516 () Bool)

(assert (=> start!33296 (=> (not res!182516) (not e!203149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33296 (= res!182516 (validMask!0 mask!3777))))

(assert (=> start!33296 e!203149))

(declare-fun array_inv!5956 (array!16904) Bool)

(assert (=> start!33296 (array_inv!5956 a!3305)))

(assert (=> start!33296 true))

(declare-fun b!331106 () Bool)

(declare-fun res!182508 () Bool)

(assert (=> b!331106 (=> (not res!182508) (not e!203149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331106 (= res!182508 (validKeyInArray!0 k!2497))))

(declare-fun b!331112 () Bool)

(declare-fun res!182515 () Bool)

(assert (=> b!331112 (=> (not res!182515) (not e!203147))))

(assert (=> b!331112 (= res!182515 (and (= (select (arr!7993 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8345 a!3305))))))

(declare-fun b!331113 () Bool)

(declare-fun res!182513 () Bool)

(assert (=> b!331113 (=> (not res!182513) (not e!203149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16904 (_ BitVec 32)) Bool)

(assert (=> b!331113 (= res!182513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!331114 () Bool)

(declare-fun res!182511 () Bool)

(assert (=> b!331114 (=> (not res!182511) (not e!203149))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16904 (_ BitVec 32)) SeekEntryResult!3124)

(assert (=> b!331114 (= res!182511 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3124 i!1250)))))

(declare-fun b!331115 () Bool)

(declare-fun res!182510 () Bool)

(assert (=> b!331115 (=> (not res!182510) (not e!203149))))

(assert (=> b!331115 (= res!182510 (and (= (size!8345 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8345 a!3305))))))

(assert (= (and start!33296 res!182516) b!331115))

(assert (= (and b!331115 res!182510) b!331106))

(assert (= (and b!331106 res!182508) b!331109))

(assert (= (and b!331109 res!182514) b!331114))

(assert (= (and b!331114 res!182511) b!331113))

(assert (= (and b!331113 res!182513) b!331108))

(assert (= (and b!331108 res!182509) b!331112))

(assert (= (and b!331112 res!182515) b!331107))

(assert (= (and b!331107 res!182512) b!331110))

(assert (= (and b!331110 res!182517) b!331111))

(declare-fun m!336105 () Bool)

(assert (=> b!331107 m!336105))

(declare-fun m!336107 () Bool)

(assert (=> b!331113 m!336107))

(declare-fun m!336109 () Bool)

(assert (=> b!331108 m!336109))

(assert (=> b!331108 m!336109))

(declare-fun m!336111 () Bool)

(assert (=> b!331108 m!336111))

(declare-fun m!336113 () Bool)

(assert (=> b!331106 m!336113))

(declare-fun m!336115 () Bool)

(assert (=> b!331110 m!336115))

(declare-fun m!336117 () Bool)

(assert (=> start!33296 m!336117))

(declare-fun m!336119 () Bool)

(assert (=> start!33296 m!336119))

(declare-fun m!336121 () Bool)

(assert (=> b!331112 m!336121))

(declare-fun m!336123 () Bool)

(assert (=> b!331109 m!336123))

(declare-fun m!336125 () Bool)

(assert (=> b!331114 m!336125))

(declare-fun m!336127 () Bool)

(assert (=> b!331111 m!336127))

(assert (=> b!331111 m!336127))

(declare-fun m!336129 () Bool)

(assert (=> b!331111 m!336129))

(push 1)

(assert (not b!331113))

(assert (not b!331109))

(assert (not start!33296))

(assert (not b!331107))

(assert (not b!331106))

(assert (not b!331108))

(assert (not b!331111))

