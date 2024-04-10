; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86368 () Bool)

(assert start!86368)

(declare-fun b!999422 () Bool)

(declare-fun res!668904 () Bool)

(declare-fun e!563533 () Bool)

(assert (=> b!999422 (=> (not res!668904) (not e!563533))))

(declare-datatypes ((array!63169 0))(
  ( (array!63170 (arr!30410 (Array (_ BitVec 32) (_ BitVec 64))) (size!30912 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63169)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999422 (= res!668904 (validKeyInArray!0 (select (arr!30410 a!3219) j!170)))))

(declare-fun res!668908 () Bool)

(assert (=> start!86368 (=> (not res!668908) (not e!563533))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86368 (= res!668908 (validMask!0 mask!3464))))

(assert (=> start!86368 e!563533))

(declare-fun array_inv!23534 (array!63169) Bool)

(assert (=> start!86368 (array_inv!23534 a!3219)))

(assert (=> start!86368 true))

(declare-fun b!999423 () Bool)

(declare-fun e!563530 () Bool)

(declare-fun e!563531 () Bool)

(assert (=> b!999423 (= e!563530 e!563531)))

(declare-fun res!668907 () Bool)

(assert (=> b!999423 (=> (not res!668907) (not e!563531))))

(declare-datatypes ((SeekEntryResult!9342 0))(
  ( (MissingZero!9342 (index!39739 (_ BitVec 32))) (Found!9342 (index!39740 (_ BitVec 32))) (Intermediate!9342 (undefined!10154 Bool) (index!39741 (_ BitVec 32)) (x!87178 (_ BitVec 32))) (Undefined!9342) (MissingVacant!9342 (index!39742 (_ BitVec 32))) )
))
(declare-fun lt!442024 () SeekEntryResult!9342)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63169 (_ BitVec 32)) SeekEntryResult!9342)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999423 (= res!668907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30410 a!3219) j!170) mask!3464) (select (arr!30410 a!3219) j!170) a!3219 mask!3464) lt!442024))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999423 (= lt!442024 (Intermediate!9342 false resIndex!38 resX!38))))

(declare-fun b!999424 () Bool)

(declare-fun res!668910 () Bool)

(assert (=> b!999424 (=> (not res!668910) (not e!563530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63169 (_ BitVec 32)) Bool)

(assert (=> b!999424 (= res!668910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999425 () Bool)

(declare-fun res!668900 () Bool)

(assert (=> b!999425 (=> (not res!668900) (not e!563533))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999425 (= res!668900 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999426 () Bool)

(assert (=> b!999426 (= e!563531 false)))

(declare-fun lt!442025 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999426 (= lt!442025 (toIndex!0 (select (store (arr!30410 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999427 () Bool)

(declare-fun res!668902 () Bool)

(assert (=> b!999427 (=> (not res!668902) (not e!563530))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!999427 (= res!668902 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30912 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30912 a!3219))))))

(declare-fun b!999428 () Bool)

(assert (=> b!999428 (= e!563533 e!563530)))

(declare-fun res!668906 () Bool)

(assert (=> b!999428 (=> (not res!668906) (not e!563530))))

(declare-fun lt!442023 () SeekEntryResult!9342)

(assert (=> b!999428 (= res!668906 (or (= lt!442023 (MissingVacant!9342 i!1194)) (= lt!442023 (MissingZero!9342 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63169 (_ BitVec 32)) SeekEntryResult!9342)

(assert (=> b!999428 (= lt!442023 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999429 () Bool)

(declare-fun res!668901 () Bool)

(assert (=> b!999429 (=> (not res!668901) (not e!563533))))

(assert (=> b!999429 (= res!668901 (validKeyInArray!0 k0!2224))))

(declare-fun b!999430 () Bool)

(declare-fun res!668905 () Bool)

(assert (=> b!999430 (=> (not res!668905) (not e!563530))))

(declare-datatypes ((List!21086 0))(
  ( (Nil!21083) (Cons!21082 (h!22259 (_ BitVec 64)) (t!30087 List!21086)) )
))
(declare-fun arrayNoDuplicates!0 (array!63169 (_ BitVec 32) List!21086) Bool)

(assert (=> b!999430 (= res!668905 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21083))))

(declare-fun b!999431 () Bool)

(declare-fun res!668903 () Bool)

(assert (=> b!999431 (=> (not res!668903) (not e!563533))))

(assert (=> b!999431 (= res!668903 (and (= (size!30912 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30912 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30912 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999432 () Bool)

(declare-fun res!668909 () Bool)

(assert (=> b!999432 (=> (not res!668909) (not e!563531))))

(assert (=> b!999432 (= res!668909 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30410 a!3219) j!170) a!3219 mask!3464) lt!442024))))

(assert (= (and start!86368 res!668908) b!999431))

(assert (= (and b!999431 res!668903) b!999422))

(assert (= (and b!999422 res!668904) b!999429))

(assert (= (and b!999429 res!668901) b!999425))

(assert (= (and b!999425 res!668900) b!999428))

(assert (= (and b!999428 res!668906) b!999424))

(assert (= (and b!999424 res!668910) b!999430))

(assert (= (and b!999430 res!668905) b!999427))

(assert (= (and b!999427 res!668902) b!999423))

(assert (= (and b!999423 res!668907) b!999432))

(assert (= (and b!999432 res!668909) b!999426))

(declare-fun m!925667 () Bool)

(assert (=> b!999426 m!925667))

(declare-fun m!925669 () Bool)

(assert (=> b!999426 m!925669))

(assert (=> b!999426 m!925669))

(declare-fun m!925671 () Bool)

(assert (=> b!999426 m!925671))

(declare-fun m!925673 () Bool)

(assert (=> b!999432 m!925673))

(assert (=> b!999432 m!925673))

(declare-fun m!925675 () Bool)

(assert (=> b!999432 m!925675))

(declare-fun m!925677 () Bool)

(assert (=> b!999430 m!925677))

(declare-fun m!925679 () Bool)

(assert (=> start!86368 m!925679))

(declare-fun m!925681 () Bool)

(assert (=> start!86368 m!925681))

(declare-fun m!925683 () Bool)

(assert (=> b!999429 m!925683))

(declare-fun m!925685 () Bool)

(assert (=> b!999428 m!925685))

(declare-fun m!925687 () Bool)

(assert (=> b!999424 m!925687))

(assert (=> b!999422 m!925673))

(assert (=> b!999422 m!925673))

(declare-fun m!925689 () Bool)

(assert (=> b!999422 m!925689))

(declare-fun m!925691 () Bool)

(assert (=> b!999425 m!925691))

(assert (=> b!999423 m!925673))

(assert (=> b!999423 m!925673))

(declare-fun m!925693 () Bool)

(assert (=> b!999423 m!925693))

(assert (=> b!999423 m!925693))

(assert (=> b!999423 m!925673))

(declare-fun m!925695 () Bool)

(assert (=> b!999423 m!925695))

(check-sat (not b!999426) (not b!999429) (not b!999425) (not b!999424) (not b!999430) (not b!999422) (not start!86368) (not b!999423) (not b!999432) (not b!999428))
(check-sat)
