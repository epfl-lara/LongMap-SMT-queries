; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86454 () Bool)

(assert start!86454)

(declare-fun b!1000867 () Bool)

(declare-fun res!670478 () Bool)

(declare-fun e!564007 () Bool)

(assert (=> b!1000867 (=> (not res!670478) (not e!564007))))

(declare-datatypes ((array!63202 0))(
  ( (array!63203 (arr!30426 (Array (_ BitVec 32) (_ BitVec 64))) (size!30930 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63202)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000867 (= res!670478 (validKeyInArray!0 (select (arr!30426 a!3219) j!170)))))

(declare-fun b!1000868 () Bool)

(declare-fun res!670475 () Bool)

(assert (=> b!1000868 (=> (not res!670475) (not e!564007))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000868 (= res!670475 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000869 () Bool)

(declare-fun res!670473 () Bool)

(assert (=> b!1000869 (=> (not res!670473) (not e!564007))))

(assert (=> b!1000869 (= res!670473 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000870 () Bool)

(declare-fun res!670479 () Bool)

(declare-fun e!564004 () Bool)

(assert (=> b!1000870 (=> (not res!670479) (not e!564004))))

(declare-datatypes ((List!21168 0))(
  ( (Nil!21165) (Cons!21164 (h!22341 (_ BitVec 64)) (t!30160 List!21168)) )
))
(declare-fun arrayNoDuplicates!0 (array!63202 (_ BitVec 32) List!21168) Bool)

(assert (=> b!1000870 (= res!670479 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21165))))

(declare-fun b!1000871 () Bool)

(declare-fun res!670474 () Bool)

(assert (=> b!1000871 (=> (not res!670474) (not e!564004))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63202 (_ BitVec 32)) Bool)

(assert (=> b!1000871 (= res!670474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000872 () Bool)

(declare-fun res!670481 () Bool)

(declare-fun e!564003 () Bool)

(assert (=> b!1000872 (=> (not res!670481) (not e!564003))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9383 0))(
  ( (MissingZero!9383 (index!39903 (_ BitVec 32))) (Found!9383 (index!39904 (_ BitVec 32))) (Intermediate!9383 (undefined!10195 Bool) (index!39905 (_ BitVec 32)) (x!87342 (_ BitVec 32))) (Undefined!9383) (MissingVacant!9383 (index!39906 (_ BitVec 32))) )
))
(declare-fun lt!442278 () SeekEntryResult!9383)

(declare-fun lt!442276 () array!63202)

(declare-fun lt!442277 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63202 (_ BitVec 32)) SeekEntryResult!9383)

(assert (=> b!1000872 (= res!670481 (not (= lt!442278 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442277 lt!442276 mask!3464))))))

(declare-fun b!1000873 () Bool)

(declare-fun res!670472 () Bool)

(assert (=> b!1000873 (=> (not res!670472) (not e!564004))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000873 (= res!670472 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30930 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30930 a!3219))))))

(declare-fun b!1000874 () Bool)

(declare-fun e!564008 () Bool)

(assert (=> b!1000874 (= e!564004 e!564008)))

(declare-fun res!670477 () Bool)

(assert (=> b!1000874 (=> (not res!670477) (not e!564008))))

(declare-fun lt!442274 () SeekEntryResult!9383)

(declare-fun lt!442279 () SeekEntryResult!9383)

(assert (=> b!1000874 (= res!670477 (= lt!442274 lt!442279))))

(assert (=> b!1000874 (= lt!442279 (Intermediate!9383 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000874 (= lt!442274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30426 a!3219) j!170) mask!3464) (select (arr!30426 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!670469 () Bool)

(assert (=> start!86454 (=> (not res!670469) (not e!564007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86454 (= res!670469 (validMask!0 mask!3464))))

(assert (=> start!86454 e!564007))

(declare-fun array_inv!23569 (array!63202) Bool)

(assert (=> start!86454 (array_inv!23569 a!3219)))

(assert (=> start!86454 true))

(declare-fun b!1000875 () Bool)

(assert (=> b!1000875 (= e!564007 e!564004)))

(declare-fun res!670480 () Bool)

(assert (=> b!1000875 (=> (not res!670480) (not e!564004))))

(declare-fun lt!442275 () SeekEntryResult!9383)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000875 (= res!670480 (or (= lt!442275 (MissingVacant!9383 i!1194)) (= lt!442275 (MissingZero!9383 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63202 (_ BitVec 32)) SeekEntryResult!9383)

(assert (=> b!1000875 (= lt!442275 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000876 () Bool)

(assert (=> b!1000876 (= e!564003 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1000877 () Bool)

(declare-fun e!564005 () Bool)

(assert (=> b!1000877 (= e!564008 e!564005)))

(declare-fun res!670470 () Bool)

(assert (=> b!1000877 (=> (not res!670470) (not e!564005))))

(assert (=> b!1000877 (= res!670470 (= lt!442278 lt!442279))))

(assert (=> b!1000877 (= lt!442278 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30426 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000878 () Bool)

(declare-fun res!670471 () Bool)

(assert (=> b!1000878 (=> (not res!670471) (not e!564007))))

(assert (=> b!1000878 (= res!670471 (and (= (size!30930 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30930 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30930 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000879 () Bool)

(assert (=> b!1000879 (= e!564005 e!564003)))

(declare-fun res!670476 () Bool)

(assert (=> b!1000879 (=> (not res!670476) (not e!564003))))

(assert (=> b!1000879 (= res!670476 (not (= lt!442274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442277 mask!3464) lt!442277 lt!442276 mask!3464))))))

(assert (=> b!1000879 (= lt!442277 (select (store (arr!30426 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1000879 (= lt!442276 (array!63203 (store (arr!30426 a!3219) i!1194 k0!2224) (size!30930 a!3219)))))

(assert (= (and start!86454 res!670469) b!1000878))

(assert (= (and b!1000878 res!670471) b!1000867))

(assert (= (and b!1000867 res!670478) b!1000869))

(assert (= (and b!1000869 res!670473) b!1000868))

(assert (= (and b!1000868 res!670475) b!1000875))

(assert (= (and b!1000875 res!670480) b!1000871))

(assert (= (and b!1000871 res!670474) b!1000870))

(assert (= (and b!1000870 res!670479) b!1000873))

(assert (= (and b!1000873 res!670472) b!1000874))

(assert (= (and b!1000874 res!670477) b!1000877))

(assert (= (and b!1000877 res!670470) b!1000879))

(assert (= (and b!1000879 res!670476) b!1000872))

(assert (= (and b!1000872 res!670481) b!1000876))

(declare-fun m!926455 () Bool)

(assert (=> b!1000871 m!926455))

(declare-fun m!926457 () Bool)

(assert (=> b!1000870 m!926457))

(declare-fun m!926459 () Bool)

(assert (=> b!1000879 m!926459))

(assert (=> b!1000879 m!926459))

(declare-fun m!926461 () Bool)

(assert (=> b!1000879 m!926461))

(declare-fun m!926463 () Bool)

(assert (=> b!1000879 m!926463))

(declare-fun m!926465 () Bool)

(assert (=> b!1000879 m!926465))

(declare-fun m!926467 () Bool)

(assert (=> b!1000874 m!926467))

(assert (=> b!1000874 m!926467))

(declare-fun m!926469 () Bool)

(assert (=> b!1000874 m!926469))

(assert (=> b!1000874 m!926469))

(assert (=> b!1000874 m!926467))

(declare-fun m!926471 () Bool)

(assert (=> b!1000874 m!926471))

(declare-fun m!926473 () Bool)

(assert (=> b!1000875 m!926473))

(declare-fun m!926475 () Bool)

(assert (=> b!1000868 m!926475))

(declare-fun m!926477 () Bool)

(assert (=> b!1000869 m!926477))

(assert (=> b!1000867 m!926467))

(assert (=> b!1000867 m!926467))

(declare-fun m!926479 () Bool)

(assert (=> b!1000867 m!926479))

(declare-fun m!926481 () Bool)

(assert (=> b!1000872 m!926481))

(declare-fun m!926483 () Bool)

(assert (=> start!86454 m!926483))

(declare-fun m!926485 () Bool)

(assert (=> start!86454 m!926485))

(assert (=> b!1000877 m!926467))

(assert (=> b!1000877 m!926467))

(declare-fun m!926487 () Bool)

(assert (=> b!1000877 m!926487))

(check-sat (not b!1000874) (not b!1000870) (not b!1000868) (not b!1000867) (not b!1000871) (not start!86454) (not b!1000872) (not b!1000879) (not b!1000877) (not b!1000875) (not b!1000869))
(check-sat)
