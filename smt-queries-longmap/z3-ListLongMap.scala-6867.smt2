; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86632 () Bool)

(assert start!86632)

(declare-fun b!1001899 () Bool)

(declare-fun res!670821 () Bool)

(declare-fun e!564687 () Bool)

(assert (=> b!1001899 (=> (not res!670821) (not e!564687))))

(declare-datatypes ((array!63303 0))(
  ( (array!63304 (arr!30472 (Array (_ BitVec 32) (_ BitVec 64))) (size!30975 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63303)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001899 (= res!670821 (and (= (size!30975 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30975 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30975 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001900 () Bool)

(declare-fun res!670814 () Bool)

(declare-fun e!564688 () Bool)

(assert (=> b!1001900 (=> (not res!670814) (not e!564688))))

(declare-datatypes ((SeekEntryResult!9340 0))(
  ( (MissingZero!9340 (index!39731 (_ BitVec 32))) (Found!9340 (index!39732 (_ BitVec 32))) (Intermediate!9340 (undefined!10152 Bool) (index!39733 (_ BitVec 32)) (x!87310 (_ BitVec 32))) (Undefined!9340) (MissingVacant!9340 (index!39734 (_ BitVec 32))) )
))
(declare-fun lt!442818 () SeekEntryResult!9340)

(declare-fun lt!442819 () array!63303)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442822 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63303 (_ BitVec 32)) SeekEntryResult!9340)

(assert (=> b!1001900 (= res!670814 (not (= lt!442818 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442822 lt!442819 mask!3464))))))

(declare-fun res!670817 () Bool)

(assert (=> start!86632 (=> (not res!670817) (not e!564687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86632 (= res!670817 (validMask!0 mask!3464))))

(assert (=> start!86632 e!564687))

(declare-fun array_inv!23608 (array!63303) Bool)

(assert (=> start!86632 (array_inv!23608 a!3219)))

(assert (=> start!86632 true))

(declare-fun b!1001901 () Bool)

(declare-fun res!670811 () Bool)

(assert (=> b!1001901 (=> (not res!670811) (not e!564687))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001901 (= res!670811 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001902 () Bool)

(declare-fun e!564689 () Bool)

(declare-fun e!564686 () Bool)

(assert (=> b!1001902 (= e!564689 e!564686)))

(declare-fun res!670816 () Bool)

(assert (=> b!1001902 (=> (not res!670816) (not e!564686))))

(declare-fun lt!442820 () SeekEntryResult!9340)

(assert (=> b!1001902 (= res!670816 (= lt!442818 lt!442820))))

(assert (=> b!1001902 (= lt!442818 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30472 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001903 () Bool)

(declare-fun res!670812 () Bool)

(declare-fun e!564690 () Bool)

(assert (=> b!1001903 (=> (not res!670812) (not e!564690))))

(declare-datatypes ((List!21119 0))(
  ( (Nil!21116) (Cons!21115 (h!22298 (_ BitVec 64)) (t!30112 List!21119)) )
))
(declare-fun arrayNoDuplicates!0 (array!63303 (_ BitVec 32) List!21119) Bool)

(assert (=> b!1001903 (= res!670812 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21116))))

(declare-fun b!1001904 () Bool)

(declare-fun res!670822 () Bool)

(assert (=> b!1001904 (=> (not res!670822) (not e!564687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001904 (= res!670822 (validKeyInArray!0 (select (arr!30472 a!3219) j!170)))))

(declare-fun b!1001905 () Bool)

(assert (=> b!1001905 (= e!564686 e!564688)))

(declare-fun res!670813 () Bool)

(assert (=> b!1001905 (=> (not res!670813) (not e!564688))))

(declare-fun lt!442821 () SeekEntryResult!9340)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001905 (= res!670813 (not (= lt!442821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442822 mask!3464) lt!442822 lt!442819 mask!3464))))))

(assert (=> b!1001905 (= lt!442822 (select (store (arr!30472 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001905 (= lt!442819 (array!63304 (store (arr!30472 a!3219) i!1194 k0!2224) (size!30975 a!3219)))))

(declare-fun b!1001906 () Bool)

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001906 (= e!564688 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!1001907 () Bool)

(declare-fun res!670819 () Bool)

(assert (=> b!1001907 (=> (not res!670819) (not e!564690))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001907 (= res!670819 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30975 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30975 a!3219))))))

(declare-fun b!1001908 () Bool)

(declare-fun res!670815 () Bool)

(assert (=> b!1001908 (=> (not res!670815) (not e!564690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63303 (_ BitVec 32)) Bool)

(assert (=> b!1001908 (= res!670815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001909 () Bool)

(assert (=> b!1001909 (= e!564687 e!564690)))

(declare-fun res!670823 () Bool)

(assert (=> b!1001909 (=> (not res!670823) (not e!564690))))

(declare-fun lt!442823 () SeekEntryResult!9340)

(assert (=> b!1001909 (= res!670823 (or (= lt!442823 (MissingVacant!9340 i!1194)) (= lt!442823 (MissingZero!9340 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63303 (_ BitVec 32)) SeekEntryResult!9340)

(assert (=> b!1001909 (= lt!442823 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001910 () Bool)

(assert (=> b!1001910 (= e!564690 e!564689)))

(declare-fun res!670820 () Bool)

(assert (=> b!1001910 (=> (not res!670820) (not e!564689))))

(assert (=> b!1001910 (= res!670820 (= lt!442821 lt!442820))))

(assert (=> b!1001910 (= lt!442820 (Intermediate!9340 false resIndex!38 resX!38))))

(assert (=> b!1001910 (= lt!442821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30472 a!3219) j!170) mask!3464) (select (arr!30472 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001911 () Bool)

(declare-fun res!670818 () Bool)

(assert (=> b!1001911 (=> (not res!670818) (not e!564687))))

(assert (=> b!1001911 (= res!670818 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86632 res!670817) b!1001899))

(assert (= (and b!1001899 res!670821) b!1001904))

(assert (= (and b!1001904 res!670822) b!1001911))

(assert (= (and b!1001911 res!670818) b!1001901))

(assert (= (and b!1001901 res!670811) b!1001909))

(assert (= (and b!1001909 res!670823) b!1001908))

(assert (= (and b!1001908 res!670815) b!1001903))

(assert (= (and b!1001903 res!670812) b!1001907))

(assert (= (and b!1001907 res!670819) b!1001910))

(assert (= (and b!1001910 res!670820) b!1001902))

(assert (= (and b!1001902 res!670816) b!1001905))

(assert (= (and b!1001905 res!670813) b!1001900))

(assert (= (and b!1001900 res!670814) b!1001906))

(declare-fun m!928421 () Bool)

(assert (=> b!1001909 m!928421))

(declare-fun m!928423 () Bool)

(assert (=> b!1001905 m!928423))

(assert (=> b!1001905 m!928423))

(declare-fun m!928425 () Bool)

(assert (=> b!1001905 m!928425))

(declare-fun m!928427 () Bool)

(assert (=> b!1001905 m!928427))

(declare-fun m!928429 () Bool)

(assert (=> b!1001905 m!928429))

(declare-fun m!928431 () Bool)

(assert (=> b!1001900 m!928431))

(declare-fun m!928433 () Bool)

(assert (=> b!1001904 m!928433))

(assert (=> b!1001904 m!928433))

(declare-fun m!928435 () Bool)

(assert (=> b!1001904 m!928435))

(assert (=> b!1001902 m!928433))

(assert (=> b!1001902 m!928433))

(declare-fun m!928437 () Bool)

(assert (=> b!1001902 m!928437))

(assert (=> b!1001910 m!928433))

(assert (=> b!1001910 m!928433))

(declare-fun m!928439 () Bool)

(assert (=> b!1001910 m!928439))

(assert (=> b!1001910 m!928439))

(assert (=> b!1001910 m!928433))

(declare-fun m!928441 () Bool)

(assert (=> b!1001910 m!928441))

(declare-fun m!928443 () Bool)

(assert (=> b!1001901 m!928443))

(declare-fun m!928445 () Bool)

(assert (=> b!1001903 m!928445))

(declare-fun m!928447 () Bool)

(assert (=> b!1001908 m!928447))

(declare-fun m!928449 () Bool)

(assert (=> b!1001911 m!928449))

(declare-fun m!928451 () Bool)

(assert (=> start!86632 m!928451))

(declare-fun m!928453 () Bool)

(assert (=> start!86632 m!928453))

(check-sat (not start!86632) (not b!1001905) (not b!1001903) (not b!1001910) (not b!1001900) (not b!1001911) (not b!1001909) (not b!1001908) (not b!1001901) (not b!1001904) (not b!1001902))
(check-sat)
