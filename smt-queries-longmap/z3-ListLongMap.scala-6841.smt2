; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86314 () Bool)

(assert start!86314)

(declare-fun b!998475 () Bool)

(declare-fun res!667874 () Bool)

(declare-fun e!563252 () Bool)

(assert (=> b!998475 (=> (not res!667874) (not e!563252))))

(declare-datatypes ((array!63138 0))(
  ( (array!63139 (arr!30394 (Array (_ BitVec 32) (_ BitVec 64))) (size!30897 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63138)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998475 (= res!667874 (validKeyInArray!0 (select (arr!30394 a!3219) j!170)))))

(declare-fun b!998476 () Bool)

(declare-fun e!563251 () Bool)

(assert (=> b!998476 (= e!563252 e!563251)))

(declare-fun res!667865 () Bool)

(assert (=> b!998476 (=> (not res!667865) (not e!563251))))

(declare-datatypes ((SeekEntryResult!9262 0))(
  ( (MissingZero!9262 (index!39419 (_ BitVec 32))) (Found!9262 (index!39420 (_ BitVec 32))) (Intermediate!9262 (undefined!10074 Bool) (index!39421 (_ BitVec 32)) (x!87006 (_ BitVec 32))) (Undefined!9262) (MissingVacant!9262 (index!39422 (_ BitVec 32))) )
))
(declare-fun lt!441842 () SeekEntryResult!9262)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998476 (= res!667865 (or (= lt!441842 (MissingVacant!9262 i!1194)) (= lt!441842 (MissingZero!9262 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63138 (_ BitVec 32)) SeekEntryResult!9262)

(assert (=> b!998476 (= lt!441842 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!667872 () Bool)

(assert (=> start!86314 (=> (not res!667872) (not e!563252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86314 (= res!667872 (validMask!0 mask!3464))))

(assert (=> start!86314 e!563252))

(declare-fun array_inv!23530 (array!63138) Bool)

(assert (=> start!86314 (array_inv!23530 a!3219)))

(assert (=> start!86314 true))

(declare-fun b!998477 () Bool)

(declare-fun res!667873 () Bool)

(assert (=> b!998477 (=> (not res!667873) (not e!563251))))

(declare-datatypes ((List!21041 0))(
  ( (Nil!21038) (Cons!21037 (h!22211 (_ BitVec 64)) (t!30034 List!21041)) )
))
(declare-fun arrayNoDuplicates!0 (array!63138 (_ BitVec 32) List!21041) Bool)

(assert (=> b!998477 (= res!667873 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21038))))

(declare-fun b!998478 () Bool)

(declare-fun res!667869 () Bool)

(assert (=> b!998478 (=> (not res!667869) (not e!563252))))

(declare-fun arrayContainsKey!0 (array!63138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998478 (= res!667869 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998479 () Bool)

(declare-fun res!667870 () Bool)

(assert (=> b!998479 (=> (not res!667870) (not e!563252))))

(assert (=> b!998479 (= res!667870 (and (= (size!30897 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30897 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30897 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998480 () Bool)

(declare-fun e!563253 () Bool)

(assert (=> b!998480 (= e!563253 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!998481 () Bool)

(declare-fun res!667867 () Bool)

(assert (=> b!998481 (=> (not res!667867) (not e!563253))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441841 () SeekEntryResult!9262)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63138 (_ BitVec 32)) SeekEntryResult!9262)

(assert (=> b!998481 (= res!667867 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30394 a!3219) j!170) a!3219 mask!3464) lt!441841))))

(declare-fun b!998482 () Bool)

(assert (=> b!998482 (= e!563251 e!563253)))

(declare-fun res!667866 () Bool)

(assert (=> b!998482 (=> (not res!667866) (not e!563253))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998482 (= res!667866 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30394 a!3219) j!170) mask!3464) (select (arr!30394 a!3219) j!170) a!3219 mask!3464) lt!441841))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998482 (= lt!441841 (Intermediate!9262 false resIndex!38 resX!38))))

(declare-fun b!998483 () Bool)

(declare-fun res!667868 () Bool)

(assert (=> b!998483 (=> (not res!667868) (not e!563251))))

(assert (=> b!998483 (= res!667868 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30897 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30897 a!3219))))))

(declare-fun b!998484 () Bool)

(declare-fun res!667864 () Bool)

(assert (=> b!998484 (=> (not res!667864) (not e!563251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63138 (_ BitVec 32)) Bool)

(assert (=> b!998484 (= res!667864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998485 () Bool)

(declare-fun res!667871 () Bool)

(assert (=> b!998485 (=> (not res!667871) (not e!563252))))

(assert (=> b!998485 (= res!667871 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86314 res!667872) b!998479))

(assert (= (and b!998479 res!667870) b!998475))

(assert (= (and b!998475 res!667874) b!998485))

(assert (= (and b!998485 res!667871) b!998478))

(assert (= (and b!998478 res!667869) b!998476))

(assert (= (and b!998476 res!667865) b!998484))

(assert (= (and b!998484 res!667864) b!998477))

(assert (= (and b!998477 res!667873) b!998483))

(assert (= (and b!998483 res!667868) b!998482))

(assert (= (and b!998482 res!667866) b!998481))

(assert (= (and b!998481 res!667867) b!998480))

(declare-fun m!925679 () Bool)

(assert (=> b!998481 m!925679))

(assert (=> b!998481 m!925679))

(declare-fun m!925681 () Bool)

(assert (=> b!998481 m!925681))

(declare-fun m!925683 () Bool)

(assert (=> b!998484 m!925683))

(declare-fun m!925685 () Bool)

(assert (=> start!86314 m!925685))

(declare-fun m!925687 () Bool)

(assert (=> start!86314 m!925687))

(declare-fun m!925689 () Bool)

(assert (=> b!998478 m!925689))

(assert (=> b!998475 m!925679))

(assert (=> b!998475 m!925679))

(declare-fun m!925691 () Bool)

(assert (=> b!998475 m!925691))

(assert (=> b!998482 m!925679))

(assert (=> b!998482 m!925679))

(declare-fun m!925693 () Bool)

(assert (=> b!998482 m!925693))

(assert (=> b!998482 m!925693))

(assert (=> b!998482 m!925679))

(declare-fun m!925695 () Bool)

(assert (=> b!998482 m!925695))

(declare-fun m!925697 () Bool)

(assert (=> b!998477 m!925697))

(declare-fun m!925699 () Bool)

(assert (=> b!998485 m!925699))

(declare-fun m!925701 () Bool)

(assert (=> b!998476 m!925701))

(check-sat (not b!998476) (not b!998482) (not b!998481) (not b!998485) (not b!998475) (not b!998484) (not start!86314) (not b!998477) (not b!998478))
(check-sat)
