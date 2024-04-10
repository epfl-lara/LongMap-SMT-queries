; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86226 () Bool)

(assert start!86226)

(declare-fun b!998339 () Bool)

(declare-fun res!668144 () Bool)

(declare-fun e!562993 () Bool)

(assert (=> b!998339 (=> (not res!668144) (not e!562993))))

(declare-datatypes ((array!63129 0))(
  ( (array!63130 (arr!30393 (Array (_ BitVec 32) (_ BitVec 64))) (size!30895 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63129)

(declare-datatypes ((List!21069 0))(
  ( (Nil!21066) (Cons!21065 (h!22236 (_ BitVec 64)) (t!30070 List!21069)) )
))
(declare-fun arrayNoDuplicates!0 (array!63129 (_ BitVec 32) List!21069) Bool)

(assert (=> b!998339 (= res!668144 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21066))))

(declare-fun b!998340 () Bool)

(declare-fun res!668137 () Bool)

(declare-fun e!562992 () Bool)

(assert (=> b!998340 (=> (not res!668137) (not e!562992))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998340 (= res!668137 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998341 () Bool)

(declare-fun res!668136 () Bool)

(assert (=> b!998341 (=> (not res!668136) (not e!562992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998341 (= res!668136 (validKeyInArray!0 k!2224))))

(declare-fun b!998342 () Bool)

(declare-fun res!668142 () Bool)

(assert (=> b!998342 (=> (not res!668142) (not e!562993))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63129 (_ BitVec 32)) Bool)

(assert (=> b!998342 (= res!668142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998343 () Bool)

(assert (=> b!998343 (= e!562992 e!562993)))

(declare-fun res!668140 () Bool)

(assert (=> b!998343 (=> (not res!668140) (not e!562993))))

(declare-datatypes ((SeekEntryResult!9325 0))(
  ( (MissingZero!9325 (index!39671 (_ BitVec 32))) (Found!9325 (index!39672 (_ BitVec 32))) (Intermediate!9325 (undefined!10137 Bool) (index!39673 (_ BitVec 32)) (x!87101 (_ BitVec 32))) (Undefined!9325) (MissingVacant!9325 (index!39674 (_ BitVec 32))) )
))
(declare-fun lt!441682 () SeekEntryResult!9325)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998343 (= res!668140 (or (= lt!441682 (MissingVacant!9325 i!1194)) (= lt!441682 (MissingZero!9325 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63129 (_ BitVec 32)) SeekEntryResult!9325)

(assert (=> b!998343 (= lt!441682 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998344 () Bool)

(declare-fun res!668139 () Bool)

(assert (=> b!998344 (=> (not res!668139) (not e!562992))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!998344 (= res!668139 (and (= (size!30895 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30895 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30895 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998345 () Bool)

(declare-fun e!562990 () Bool)

(assert (=> b!998345 (= e!562993 e!562990)))

(declare-fun res!668135 () Bool)

(assert (=> b!998345 (=> (not res!668135) (not e!562990))))

(declare-fun lt!441683 () SeekEntryResult!9325)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63129 (_ BitVec 32)) SeekEntryResult!9325)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998345 (= res!668135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30393 a!3219) j!170) mask!3464) (select (arr!30393 a!3219) j!170) a!3219 mask!3464) lt!441683))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998345 (= lt!441683 (Intermediate!9325 false resIndex!38 resX!38))))

(declare-fun b!998346 () Bool)

(declare-fun res!668138 () Bool)

(assert (=> b!998346 (=> (not res!668138) (not e!562990))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998346 (= res!668138 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30393 a!3219) j!170) a!3219 mask!3464) lt!441683))))

(declare-fun b!998347 () Bool)

(declare-fun res!668141 () Bool)

(assert (=> b!998347 (=> (not res!668141) (not e!562993))))

(assert (=> b!998347 (= res!668141 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30895 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30895 a!3219))))))

(declare-fun res!668145 () Bool)

(assert (=> start!86226 (=> (not res!668145) (not e!562992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86226 (= res!668145 (validMask!0 mask!3464))))

(assert (=> start!86226 e!562992))

(declare-fun array_inv!23517 (array!63129) Bool)

(assert (=> start!86226 (array_inv!23517 a!3219)))

(assert (=> start!86226 true))

(declare-fun b!998348 () Bool)

(declare-fun res!668143 () Bool)

(assert (=> b!998348 (=> (not res!668143) (not e!562992))))

(assert (=> b!998348 (= res!668143 (validKeyInArray!0 (select (arr!30393 a!3219) j!170)))))

(declare-fun b!998349 () Bool)

(assert (=> b!998349 (= e!562990 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!86226 res!668145) b!998344))

(assert (= (and b!998344 res!668139) b!998348))

(assert (= (and b!998348 res!668143) b!998341))

(assert (= (and b!998341 res!668136) b!998340))

(assert (= (and b!998340 res!668137) b!998343))

(assert (= (and b!998343 res!668140) b!998342))

(assert (= (and b!998342 res!668142) b!998339))

(assert (= (and b!998339 res!668144) b!998347))

(assert (= (and b!998347 res!668141) b!998345))

(assert (= (and b!998345 res!668135) b!998346))

(assert (= (and b!998346 res!668138) b!998349))

(declare-fun m!924893 () Bool)

(assert (=> b!998345 m!924893))

(assert (=> b!998345 m!924893))

(declare-fun m!924895 () Bool)

(assert (=> b!998345 m!924895))

(assert (=> b!998345 m!924895))

(assert (=> b!998345 m!924893))

(declare-fun m!924897 () Bool)

(assert (=> b!998345 m!924897))

(declare-fun m!924899 () Bool)

(assert (=> b!998343 m!924899))

(assert (=> b!998348 m!924893))

(assert (=> b!998348 m!924893))

(declare-fun m!924901 () Bool)

(assert (=> b!998348 m!924901))

(assert (=> b!998346 m!924893))

(assert (=> b!998346 m!924893))

(declare-fun m!924903 () Bool)

(assert (=> b!998346 m!924903))

(declare-fun m!924905 () Bool)

(assert (=> b!998340 m!924905))

(declare-fun m!924907 () Bool)

(assert (=> b!998341 m!924907))

(declare-fun m!924909 () Bool)

(assert (=> b!998342 m!924909))

(declare-fun m!924911 () Bool)

(assert (=> start!86226 m!924911))

(declare-fun m!924913 () Bool)

(assert (=> start!86226 m!924913))

(declare-fun m!924915 () Bool)

(assert (=> b!998339 m!924915))

(push 1)

(assert (not b!998343))

(assert (not b!998345))

(assert (not b!998342))

(assert (not b!998346))

(assert (not start!86226))

(assert (not b!998340))

(assert (not b!998348))

(assert (not b!998341))

(assert (not b!998339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

