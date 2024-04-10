; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86774 () Bool)

(assert start!86774)

(declare-fun b!1006022 () Bool)

(declare-fun res!675111 () Bool)

(declare-fun e!566345 () Bool)

(assert (=> b!1006022 (=> (not res!675111) (not e!566345))))

(declare-datatypes ((array!63473 0))(
  ( (array!63474 (arr!30559 (Array (_ BitVec 32) (_ BitVec 64))) (size!31061 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63473)

(declare-datatypes ((List!21235 0))(
  ( (Nil!21232) (Cons!21231 (h!22414 (_ BitVec 64)) (t!30236 List!21235)) )
))
(declare-fun arrayNoDuplicates!0 (array!63473 (_ BitVec 32) List!21235) Bool)

(assert (=> b!1006022 (= res!675111 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21232))))

(declare-fun b!1006023 () Bool)

(declare-fun res!675115 () Bool)

(declare-fun e!566346 () Bool)

(assert (=> b!1006023 (=> (not res!675115) (not e!566346))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006023 (= res!675115 (and (= (size!31061 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31061 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31061 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006025 () Bool)

(declare-fun res!675120 () Bool)

(assert (=> b!1006025 (=> (not res!675120) (not e!566345))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1006025 (= res!675120 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31061 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31061 a!3219))))))

(declare-fun b!1006026 () Bool)

(declare-fun res!675116 () Bool)

(assert (=> b!1006026 (=> (not res!675116) (not e!566345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63473 (_ BitVec 32)) Bool)

(assert (=> b!1006026 (= res!675116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006027 () Bool)

(declare-fun res!675113 () Bool)

(assert (=> b!1006027 (=> (not res!675113) (not e!566346))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006027 (= res!675113 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006028 () Bool)

(declare-fun res!675114 () Bool)

(assert (=> b!1006028 (=> (not res!675114) (not e!566346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006028 (= res!675114 (validKeyInArray!0 k!2224))))

(declare-fun b!1006029 () Bool)

(assert (=> b!1006029 (= e!566346 e!566345)))

(declare-fun res!675119 () Bool)

(assert (=> b!1006029 (=> (not res!675119) (not e!566345))))

(declare-datatypes ((SeekEntryResult!9491 0))(
  ( (MissingZero!9491 (index!40335 (_ BitVec 32))) (Found!9491 (index!40336 (_ BitVec 32))) (Intermediate!9491 (undefined!10303 Bool) (index!40337 (_ BitVec 32)) (x!87739 (_ BitVec 32))) (Undefined!9491) (MissingVacant!9491 (index!40338 (_ BitVec 32))) )
))
(declare-fun lt!444674 () SeekEntryResult!9491)

(assert (=> b!1006029 (= res!675119 (or (= lt!444674 (MissingVacant!9491 i!1194)) (= lt!444674 (MissingZero!9491 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63473 (_ BitVec 32)) SeekEntryResult!9491)

(assert (=> b!1006029 (= lt!444674 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006030 () Bool)

(declare-fun e!566344 () Bool)

(assert (=> b!1006030 (= e!566344 false)))

(declare-fun lt!444673 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006030 (= lt!444673 (toIndex!0 (select (store (arr!30559 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun res!675112 () Bool)

(assert (=> start!86774 (=> (not res!675112) (not e!566346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86774 (= res!675112 (validMask!0 mask!3464))))

(assert (=> start!86774 e!566346))

(declare-fun array_inv!23683 (array!63473) Bool)

(assert (=> start!86774 (array_inv!23683 a!3219)))

(assert (=> start!86774 true))

(declare-fun b!1006024 () Bool)

(assert (=> b!1006024 (= e!566345 e!566344)))

(declare-fun res!675118 () Bool)

(assert (=> b!1006024 (=> (not res!675118) (not e!566344))))

(declare-fun lt!444672 () SeekEntryResult!9491)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63473 (_ BitVec 32)) SeekEntryResult!9491)

(assert (=> b!1006024 (= res!675118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30559 a!3219) j!170) mask!3464) (select (arr!30559 a!3219) j!170) a!3219 mask!3464) lt!444672))))

(assert (=> b!1006024 (= lt!444672 (Intermediate!9491 false resIndex!38 resX!38))))

(declare-fun b!1006031 () Bool)

(declare-fun res!675110 () Bool)

(assert (=> b!1006031 (=> (not res!675110) (not e!566344))))

(assert (=> b!1006031 (= res!675110 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30559 a!3219) j!170) a!3219 mask!3464) lt!444672))))

(declare-fun b!1006032 () Bool)

(declare-fun res!675117 () Bool)

(assert (=> b!1006032 (=> (not res!675117) (not e!566346))))

(assert (=> b!1006032 (= res!675117 (validKeyInArray!0 (select (arr!30559 a!3219) j!170)))))

(assert (= (and start!86774 res!675112) b!1006023))

(assert (= (and b!1006023 res!675115) b!1006032))

(assert (= (and b!1006032 res!675117) b!1006028))

(assert (= (and b!1006028 res!675114) b!1006027))

(assert (= (and b!1006027 res!675113) b!1006029))

(assert (= (and b!1006029 res!675119) b!1006026))

(assert (= (and b!1006026 res!675116) b!1006022))

(assert (= (and b!1006022 res!675111) b!1006025))

(assert (= (and b!1006025 res!675120) b!1006024))

(assert (= (and b!1006024 res!675118) b!1006031))

(assert (= (and b!1006031 res!675110) b!1006030))

(declare-fun m!931145 () Bool)

(assert (=> b!1006029 m!931145))

(declare-fun m!931147 () Bool)

(assert (=> b!1006026 m!931147))

(declare-fun m!931149 () Bool)

(assert (=> b!1006032 m!931149))

(assert (=> b!1006032 m!931149))

(declare-fun m!931151 () Bool)

(assert (=> b!1006032 m!931151))

(declare-fun m!931153 () Bool)

(assert (=> b!1006030 m!931153))

(declare-fun m!931155 () Bool)

(assert (=> b!1006030 m!931155))

(assert (=> b!1006030 m!931155))

(declare-fun m!931157 () Bool)

(assert (=> b!1006030 m!931157))

(assert (=> b!1006024 m!931149))

(assert (=> b!1006024 m!931149))

(declare-fun m!931159 () Bool)

(assert (=> b!1006024 m!931159))

(assert (=> b!1006024 m!931159))

(assert (=> b!1006024 m!931149))

(declare-fun m!931161 () Bool)

(assert (=> b!1006024 m!931161))

(declare-fun m!931163 () Bool)

(assert (=> b!1006027 m!931163))

(assert (=> b!1006031 m!931149))

(assert (=> b!1006031 m!931149))

(declare-fun m!931165 () Bool)

(assert (=> b!1006031 m!931165))

(declare-fun m!931167 () Bool)

(assert (=> start!86774 m!931167))

(declare-fun m!931169 () Bool)

(assert (=> start!86774 m!931169))

(declare-fun m!931171 () Bool)

(assert (=> b!1006028 m!931171))

(declare-fun m!931173 () Bool)

(assert (=> b!1006022 m!931173))

(push 1)

