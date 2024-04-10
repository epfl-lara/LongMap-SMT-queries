; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86760 () Bool)

(assert start!86760)

(declare-fun b!1005810 () Bool)

(declare-fun res!674907 () Bool)

(declare-fun e!566281 () Bool)

(assert (=> b!1005810 (=> (not res!674907) (not e!566281))))

(declare-datatypes ((array!63459 0))(
  ( (array!63460 (arr!30552 (Array (_ BitVec 32) (_ BitVec 64))) (size!31054 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63459)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005810 (= res!674907 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005812 () Bool)

(declare-fun e!566280 () Bool)

(assert (=> b!1005812 (= e!566280 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9484 0))(
  ( (MissingZero!9484 (index!40307 (_ BitVec 32))) (Found!9484 (index!40308 (_ BitVec 32))) (Intermediate!9484 (undefined!10296 Bool) (index!40309 (_ BitVec 32)) (x!87708 (_ BitVec 32))) (Undefined!9484) (MissingVacant!9484 (index!40310 (_ BitVec 32))) )
))
(declare-fun lt!444628 () SeekEntryResult!9484)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63459 (_ BitVec 32)) SeekEntryResult!9484)

(assert (=> b!1005812 (= lt!444628 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30552 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005813 () Bool)

(declare-fun res!674903 () Bool)

(assert (=> b!1005813 (=> (not res!674903) (not e!566281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005813 (= res!674903 (validKeyInArray!0 k!2224))))

(declare-fun b!1005814 () Bool)

(declare-fun res!674900 () Bool)

(assert (=> b!1005814 (=> (not res!674900) (not e!566281))))

(assert (=> b!1005814 (= res!674900 (validKeyInArray!0 (select (arr!30552 a!3219) j!170)))))

(declare-fun b!1005815 () Bool)

(declare-fun res!674899 () Bool)

(assert (=> b!1005815 (=> (not res!674899) (not e!566280))))

(declare-datatypes ((List!21228 0))(
  ( (Nil!21225) (Cons!21224 (h!22407 (_ BitVec 64)) (t!30229 List!21228)) )
))
(declare-fun arrayNoDuplicates!0 (array!63459 (_ BitVec 32) List!21228) Bool)

(assert (=> b!1005815 (= res!674899 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21225))))

(declare-fun b!1005816 () Bool)

(declare-fun res!674904 () Bool)

(assert (=> b!1005816 (=> (not res!674904) (not e!566280))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005816 (= res!674904 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31054 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31054 a!3219))))))

(declare-fun b!1005817 () Bool)

(declare-fun res!674905 () Bool)

(assert (=> b!1005817 (=> (not res!674905) (not e!566280))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005817 (= res!674905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30552 a!3219) j!170) mask!3464) (select (arr!30552 a!3219) j!170) a!3219 mask!3464) (Intermediate!9484 false resIndex!38 resX!38)))))

(declare-fun b!1005811 () Bool)

(declare-fun res!674906 () Bool)

(assert (=> b!1005811 (=> (not res!674906) (not e!566280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63459 (_ BitVec 32)) Bool)

(assert (=> b!1005811 (= res!674906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!674901 () Bool)

(assert (=> start!86760 (=> (not res!674901) (not e!566281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86760 (= res!674901 (validMask!0 mask!3464))))

(assert (=> start!86760 e!566281))

(declare-fun array_inv!23676 (array!63459) Bool)

(assert (=> start!86760 (array_inv!23676 a!3219)))

(assert (=> start!86760 true))

(declare-fun b!1005818 () Bool)

(declare-fun res!674902 () Bool)

(assert (=> b!1005818 (=> (not res!674902) (not e!566281))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005818 (= res!674902 (and (= (size!31054 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31054 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31054 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005819 () Bool)

(assert (=> b!1005819 (= e!566281 e!566280)))

(declare-fun res!674898 () Bool)

(assert (=> b!1005819 (=> (not res!674898) (not e!566280))))

(declare-fun lt!444629 () SeekEntryResult!9484)

(assert (=> b!1005819 (= res!674898 (or (= lt!444629 (MissingVacant!9484 i!1194)) (= lt!444629 (MissingZero!9484 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63459 (_ BitVec 32)) SeekEntryResult!9484)

(assert (=> b!1005819 (= lt!444629 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86760 res!674901) b!1005818))

(assert (= (and b!1005818 res!674902) b!1005814))

(assert (= (and b!1005814 res!674900) b!1005813))

(assert (= (and b!1005813 res!674903) b!1005810))

(assert (= (and b!1005810 res!674907) b!1005819))

(assert (= (and b!1005819 res!674898) b!1005811))

(assert (= (and b!1005811 res!674906) b!1005815))

(assert (= (and b!1005815 res!674899) b!1005816))

(assert (= (and b!1005816 res!674904) b!1005817))

(assert (= (and b!1005817 res!674905) b!1005812))

(declare-fun m!930977 () Bool)

(assert (=> b!1005811 m!930977))

(declare-fun m!930979 () Bool)

(assert (=> b!1005814 m!930979))

(assert (=> b!1005814 m!930979))

(declare-fun m!930981 () Bool)

(assert (=> b!1005814 m!930981))

(declare-fun m!930983 () Bool)

(assert (=> b!1005819 m!930983))

(declare-fun m!930985 () Bool)

(assert (=> b!1005810 m!930985))

(declare-fun m!930987 () Bool)

(assert (=> b!1005815 m!930987))

(assert (=> b!1005817 m!930979))

(assert (=> b!1005817 m!930979))

(declare-fun m!930989 () Bool)

(assert (=> b!1005817 m!930989))

(assert (=> b!1005817 m!930989))

(assert (=> b!1005817 m!930979))

(declare-fun m!930991 () Bool)

(assert (=> b!1005817 m!930991))

(declare-fun m!930993 () Bool)

(assert (=> b!1005813 m!930993))

(declare-fun m!930995 () Bool)

(assert (=> start!86760 m!930995))

(declare-fun m!930997 () Bool)

(assert (=> start!86760 m!930997))

(assert (=> b!1005812 m!930979))

(assert (=> b!1005812 m!930979))

(declare-fun m!930999 () Bool)

(assert (=> b!1005812 m!930999))

(push 1)

(assert (not b!1005814))

(assert (not b!1005810))

(assert (not b!1005817))

(assert (not b!1005813))

(assert (not b!1005811))

(assert (not b!1005812))

(assert (not b!1005815))

