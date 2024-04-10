; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86430 () Bool)

(assert start!86430)

(declare-fun b!1000490 () Bool)

(declare-fun res!669973 () Bool)

(declare-fun e!563913 () Bool)

(assert (=> b!1000490 (=> (not res!669973) (not e!563913))))

(declare-datatypes ((array!63231 0))(
  ( (array!63232 (arr!30441 (Array (_ BitVec 32) (_ BitVec 64))) (size!30943 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63231)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000490 (= res!669973 (validKeyInArray!0 (select (arr!30441 a!3219) j!170)))))

(declare-fun b!1000491 () Bool)

(declare-fun res!669978 () Bool)

(declare-fun e!563911 () Bool)

(assert (=> b!1000491 (=> (not res!669978) (not e!563911))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000491 (= res!669978 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30943 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30943 a!3219))))))

(declare-fun res!669970 () Bool)

(assert (=> start!86430 (=> (not res!669970) (not e!563913))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86430 (= res!669970 (validMask!0 mask!3464))))

(assert (=> start!86430 e!563913))

(declare-fun array_inv!23565 (array!63231) Bool)

(assert (=> start!86430 (array_inv!23565 a!3219)))

(assert (=> start!86430 true))

(declare-fun b!1000492 () Bool)

(declare-fun res!669976 () Bool)

(assert (=> b!1000492 (=> (not res!669976) (not e!563913))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000492 (= res!669976 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000493 () Bool)

(assert (=> b!1000493 (= e!563913 e!563911)))

(declare-fun res!669977 () Bool)

(assert (=> b!1000493 (=> (not res!669977) (not e!563911))))

(declare-datatypes ((SeekEntryResult!9373 0))(
  ( (MissingZero!9373 (index!39863 (_ BitVec 32))) (Found!9373 (index!39864 (_ BitVec 32))) (Intermediate!9373 (undefined!10185 Bool) (index!39865 (_ BitVec 32)) (x!87289 (_ BitVec 32))) (Undefined!9373) (MissingVacant!9373 (index!39866 (_ BitVec 32))) )
))
(declare-fun lt!442302 () SeekEntryResult!9373)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000493 (= res!669977 (or (= lt!442302 (MissingVacant!9373 i!1194)) (= lt!442302 (MissingZero!9373 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63231 (_ BitVec 32)) SeekEntryResult!9373)

(assert (=> b!1000493 (= lt!442302 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000494 () Bool)

(declare-fun e!563912 () Bool)

(assert (=> b!1000494 (= e!563911 e!563912)))

(declare-fun res!669975 () Bool)

(assert (=> b!1000494 (=> (not res!669975) (not e!563912))))

(declare-fun lt!442304 () SeekEntryResult!9373)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63231 (_ BitVec 32)) SeekEntryResult!9373)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000494 (= res!669975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30441 a!3219) j!170) mask!3464) (select (arr!30441 a!3219) j!170) a!3219 mask!3464) lt!442304))))

(assert (=> b!1000494 (= lt!442304 (Intermediate!9373 false resIndex!38 resX!38))))

(declare-fun b!1000495 () Bool)

(declare-fun res!669971 () Bool)

(assert (=> b!1000495 (=> (not res!669971) (not e!563913))))

(assert (=> b!1000495 (= res!669971 (and (= (size!30943 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30943 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30943 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000496 () Bool)

(assert (=> b!1000496 (= e!563912 false)))

(declare-fun lt!442303 () SeekEntryResult!9373)

(assert (=> b!1000496 (= lt!442303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30441 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30441 a!3219) i!1194 k!2224) j!170) (array!63232 (store (arr!30441 a!3219) i!1194 k!2224) (size!30943 a!3219)) mask!3464))))

(declare-fun b!1000497 () Bool)

(declare-fun res!669968 () Bool)

(assert (=> b!1000497 (=> (not res!669968) (not e!563912))))

(assert (=> b!1000497 (= res!669968 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30441 a!3219) j!170) a!3219 mask!3464) lt!442304))))

(declare-fun b!1000498 () Bool)

(declare-fun res!669972 () Bool)

(assert (=> b!1000498 (=> (not res!669972) (not e!563911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63231 (_ BitVec 32)) Bool)

(assert (=> b!1000498 (= res!669972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000499 () Bool)

(declare-fun res!669974 () Bool)

(assert (=> b!1000499 (=> (not res!669974) (not e!563911))))

(declare-datatypes ((List!21117 0))(
  ( (Nil!21114) (Cons!21113 (h!22290 (_ BitVec 64)) (t!30118 List!21117)) )
))
(declare-fun arrayNoDuplicates!0 (array!63231 (_ BitVec 32) List!21117) Bool)

(assert (=> b!1000499 (= res!669974 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21114))))

(declare-fun b!1000500 () Bool)

(declare-fun res!669969 () Bool)

(assert (=> b!1000500 (=> (not res!669969) (not e!563913))))

(assert (=> b!1000500 (= res!669969 (validKeyInArray!0 k!2224))))

(assert (= (and start!86430 res!669970) b!1000495))

(assert (= (and b!1000495 res!669971) b!1000490))

(assert (= (and b!1000490 res!669973) b!1000500))

(assert (= (and b!1000500 res!669969) b!1000492))

(assert (= (and b!1000492 res!669976) b!1000493))

(assert (= (and b!1000493 res!669977) b!1000498))

(assert (= (and b!1000498 res!669972) b!1000499))

(assert (= (and b!1000499 res!669974) b!1000491))

(assert (= (and b!1000491 res!669978) b!1000494))

(assert (= (and b!1000494 res!669975) b!1000497))

(assert (= (and b!1000497 res!669968) b!1000496))

(declare-fun m!926655 () Bool)

(assert (=> b!1000490 m!926655))

(assert (=> b!1000490 m!926655))

(declare-fun m!926657 () Bool)

(assert (=> b!1000490 m!926657))

(declare-fun m!926659 () Bool)

(assert (=> start!86430 m!926659))

(declare-fun m!926661 () Bool)

(assert (=> start!86430 m!926661))

(assert (=> b!1000497 m!926655))

(assert (=> b!1000497 m!926655))

(declare-fun m!926663 () Bool)

(assert (=> b!1000497 m!926663))

(declare-fun m!926665 () Bool)

(assert (=> b!1000492 m!926665))

(declare-fun m!926667 () Bool)

(assert (=> b!1000498 m!926667))

(declare-fun m!926669 () Bool)

(assert (=> b!1000499 m!926669))

(declare-fun m!926671 () Bool)

(assert (=> b!1000500 m!926671))

(assert (=> b!1000494 m!926655))

(assert (=> b!1000494 m!926655))

(declare-fun m!926673 () Bool)

(assert (=> b!1000494 m!926673))

(assert (=> b!1000494 m!926673))

(assert (=> b!1000494 m!926655))

(declare-fun m!926675 () Bool)

(assert (=> b!1000494 m!926675))

(declare-fun m!926677 () Bool)

(assert (=> b!1000496 m!926677))

(declare-fun m!926679 () Bool)

(assert (=> b!1000496 m!926679))

(assert (=> b!1000496 m!926679))

(declare-fun m!926681 () Bool)

(assert (=> b!1000496 m!926681))

(assert (=> b!1000496 m!926681))

(assert (=> b!1000496 m!926679))

(declare-fun m!926683 () Bool)

(assert (=> b!1000496 m!926683))

(declare-fun m!926685 () Bool)

(assert (=> b!1000493 m!926685))

(push 1)

(assert (not b!1000493))

(assert (not b!1000499))

(assert (not b!1000500))

(assert (not b!1000496))

(assert (not b!1000494))

