; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86214 () Bool)

(assert start!86214)

(declare-fun b!998055 () Bool)

(declare-fun res!667984 () Bool)

(declare-fun e!562838 () Bool)

(assert (=> b!998055 (=> (not res!667984) (not e!562838))))

(declare-datatypes ((array!63064 0))(
  ( (array!63065 (arr!30360 (Array (_ BitVec 32) (_ BitVec 64))) (size!30864 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63064)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998055 (= res!667984 (and (= (size!30864 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30864 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30864 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998056 () Bool)

(declare-fun e!562835 () Bool)

(assert (=> b!998056 (= e!562838 e!562835)))

(declare-fun res!667975 () Bool)

(assert (=> b!998056 (=> (not res!667975) (not e!562835))))

(declare-datatypes ((SeekEntryResult!9317 0))(
  ( (MissingZero!9317 (index!39639 (_ BitVec 32))) (Found!9317 (index!39640 (_ BitVec 32))) (Intermediate!9317 (undefined!10129 Bool) (index!39641 (_ BitVec 32)) (x!87088 (_ BitVec 32))) (Undefined!9317) (MissingVacant!9317 (index!39642 (_ BitVec 32))) )
))
(declare-fun lt!441438 () SeekEntryResult!9317)

(assert (=> b!998056 (= res!667975 (or (= lt!441438 (MissingVacant!9317 i!1194)) (= lt!441438 (MissingZero!9317 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63064 (_ BitVec 32)) SeekEntryResult!9317)

(assert (=> b!998056 (= lt!441438 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998057 () Bool)

(declare-fun res!667980 () Bool)

(assert (=> b!998057 (=> (not res!667980) (not e!562838))))

(declare-fun arrayContainsKey!0 (array!63064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998057 (= res!667980 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998058 () Bool)

(declare-fun res!667983 () Bool)

(assert (=> b!998058 (=> (not res!667983) (not e!562835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63064 (_ BitVec 32)) Bool)

(assert (=> b!998058 (= res!667983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998059 () Bool)

(declare-fun res!667982 () Bool)

(declare-fun e!562837 () Bool)

(assert (=> b!998059 (=> (not res!667982) (not e!562837))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441439 () SeekEntryResult!9317)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63064 (_ BitVec 32)) SeekEntryResult!9317)

(assert (=> b!998059 (= res!667982 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30360 a!3219) j!170) a!3219 mask!3464) lt!441439))))

(declare-fun b!998061 () Bool)

(declare-fun res!667978 () Bool)

(assert (=> b!998061 (=> (not res!667978) (not e!562838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998061 (= res!667978 (validKeyInArray!0 k0!2224))))

(declare-fun b!998062 () Bool)

(assert (=> b!998062 (= e!562835 e!562837)))

(declare-fun res!667981 () Bool)

(assert (=> b!998062 (=> (not res!667981) (not e!562837))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998062 (= res!667981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30360 a!3219) j!170) mask!3464) (select (arr!30360 a!3219) j!170) a!3219 mask!3464) lt!441439))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998062 (= lt!441439 (Intermediate!9317 false resIndex!38 resX!38))))

(declare-fun b!998063 () Bool)

(declare-fun res!667979 () Bool)

(assert (=> b!998063 (=> (not res!667979) (not e!562838))))

(assert (=> b!998063 (= res!667979 (validKeyInArray!0 (select (arr!30360 a!3219) j!170)))))

(declare-fun b!998064 () Bool)

(declare-fun res!667976 () Bool)

(assert (=> b!998064 (=> (not res!667976) (not e!562835))))

(declare-datatypes ((List!21102 0))(
  ( (Nil!21099) (Cons!21098 (h!22269 (_ BitVec 64)) (t!30094 List!21102)) )
))
(declare-fun arrayNoDuplicates!0 (array!63064 (_ BitVec 32) List!21102) Bool)

(assert (=> b!998064 (= res!667976 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21099))))

(declare-fun b!998065 () Bool)

(assert (=> b!998065 (= e!562837 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!998060 () Bool)

(declare-fun res!667985 () Bool)

(assert (=> b!998060 (=> (not res!667985) (not e!562835))))

(assert (=> b!998060 (= res!667985 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30864 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30864 a!3219))))))

(declare-fun res!667977 () Bool)

(assert (=> start!86214 (=> (not res!667977) (not e!562838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86214 (= res!667977 (validMask!0 mask!3464))))

(assert (=> start!86214 e!562838))

(declare-fun array_inv!23503 (array!63064) Bool)

(assert (=> start!86214 (array_inv!23503 a!3219)))

(assert (=> start!86214 true))

(assert (= (and start!86214 res!667977) b!998055))

(assert (= (and b!998055 res!667984) b!998063))

(assert (= (and b!998063 res!667979) b!998061))

(assert (= (and b!998061 res!667978) b!998057))

(assert (= (and b!998057 res!667980) b!998056))

(assert (= (and b!998056 res!667975) b!998058))

(assert (= (and b!998058 res!667983) b!998064))

(assert (= (and b!998064 res!667976) b!998060))

(assert (= (and b!998060 res!667985) b!998062))

(assert (= (and b!998062 res!667981) b!998059))

(assert (= (and b!998059 res!667982) b!998065))

(declare-fun m!924115 () Bool)

(assert (=> b!998063 m!924115))

(assert (=> b!998063 m!924115))

(declare-fun m!924117 () Bool)

(assert (=> b!998063 m!924117))

(declare-fun m!924119 () Bool)

(assert (=> start!86214 m!924119))

(declare-fun m!924121 () Bool)

(assert (=> start!86214 m!924121))

(assert (=> b!998062 m!924115))

(assert (=> b!998062 m!924115))

(declare-fun m!924123 () Bool)

(assert (=> b!998062 m!924123))

(assert (=> b!998062 m!924123))

(assert (=> b!998062 m!924115))

(declare-fun m!924125 () Bool)

(assert (=> b!998062 m!924125))

(assert (=> b!998059 m!924115))

(assert (=> b!998059 m!924115))

(declare-fun m!924127 () Bool)

(assert (=> b!998059 m!924127))

(declare-fun m!924129 () Bool)

(assert (=> b!998056 m!924129))

(declare-fun m!924131 () Bool)

(assert (=> b!998061 m!924131))

(declare-fun m!924133 () Bool)

(assert (=> b!998064 m!924133))

(declare-fun m!924135 () Bool)

(assert (=> b!998058 m!924135))

(declare-fun m!924137 () Bool)

(assert (=> b!998057 m!924137))

(check-sat (not b!998062) (not b!998056) (not b!998064) (not b!998058) (not start!86214) (not b!998059) (not b!998061) (not b!998063) (not b!998057))
(check-sat)
