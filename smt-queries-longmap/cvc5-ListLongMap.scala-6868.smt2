; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86462 () Bool)

(assert start!86462)

(declare-fun b!1001085 () Bool)

(declare-fun res!670564 () Bool)

(declare-fun e!564137 () Bool)

(assert (=> b!1001085 (=> (not res!670564) (not e!564137))))

(declare-datatypes ((array!63263 0))(
  ( (array!63264 (arr!30457 (Array (_ BitVec 32) (_ BitVec 64))) (size!30959 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63263)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001085 (= res!670564 (validKeyInArray!0 (select (arr!30457 a!3219) j!170)))))

(declare-fun b!1001086 () Bool)

(declare-fun res!670567 () Bool)

(declare-fun e!564136 () Bool)

(assert (=> b!1001086 (=> (not res!670567) (not e!564136))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63263 (_ BitVec 32)) Bool)

(assert (=> b!1001086 (= res!670567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001087 () Bool)

(assert (=> b!1001087 (= e!564137 e!564136)))

(declare-fun res!670566 () Bool)

(assert (=> b!1001087 (=> (not res!670566) (not e!564136))))

(declare-datatypes ((SeekEntryResult!9389 0))(
  ( (MissingZero!9389 (index!39927 (_ BitVec 32))) (Found!9389 (index!39928 (_ BitVec 32))) (Intermediate!9389 (undefined!10201 Bool) (index!39929 (_ BitVec 32)) (x!87353 (_ BitVec 32))) (Undefined!9389) (MissingVacant!9389 (index!39930 (_ BitVec 32))) )
))
(declare-fun lt!442506 () SeekEntryResult!9389)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001087 (= res!670566 (or (= lt!442506 (MissingVacant!9389 i!1194)) (= lt!442506 (MissingZero!9389 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63263 (_ BitVec 32)) SeekEntryResult!9389)

(assert (=> b!1001087 (= lt!442506 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001088 () Bool)

(declare-fun e!564139 () Bool)

(assert (=> b!1001088 (= e!564136 e!564139)))

(declare-fun res!670574 () Bool)

(assert (=> b!1001088 (=> (not res!670574) (not e!564139))))

(declare-fun lt!442509 () SeekEntryResult!9389)

(declare-fun lt!442510 () SeekEntryResult!9389)

(assert (=> b!1001088 (= res!670574 (= lt!442509 lt!442510))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001088 (= lt!442510 (Intermediate!9389 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63263 (_ BitVec 32)) SeekEntryResult!9389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001088 (= lt!442509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30457 a!3219) j!170) mask!3464) (select (arr!30457 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001089 () Bool)

(declare-fun e!564138 () Bool)

(assert (=> b!1001089 (= e!564139 e!564138)))

(declare-fun res!670570 () Bool)

(assert (=> b!1001089 (=> (not res!670570) (not e!564138))))

(declare-fun lt!442508 () SeekEntryResult!9389)

(assert (=> b!1001089 (= res!670570 (= lt!442508 lt!442510))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001089 (= lt!442508 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30457 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001090 () Bool)

(declare-fun res!670569 () Bool)

(assert (=> b!1001090 (=> (not res!670569) (not e!564137))))

(declare-fun arrayContainsKey!0 (array!63263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001090 (= res!670569 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001091 () Bool)

(declare-fun e!564134 () Bool)

(assert (=> b!1001091 (= e!564138 e!564134)))

(declare-fun res!670568 () Bool)

(assert (=> b!1001091 (=> (not res!670568) (not e!564134))))

(declare-fun lt!442507 () (_ BitVec 64))

(declare-fun lt!442511 () array!63263)

(assert (=> b!1001091 (= res!670568 (not (= lt!442509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442507 mask!3464) lt!442507 lt!442511 mask!3464))))))

(assert (=> b!1001091 (= lt!442507 (select (store (arr!30457 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001091 (= lt!442511 (array!63264 (store (arr!30457 a!3219) i!1194 k!2224) (size!30959 a!3219)))))

(declare-fun b!1001092 () Bool)

(declare-fun res!670565 () Bool)

(assert (=> b!1001092 (=> (not res!670565) (not e!564136))))

(declare-datatypes ((List!21133 0))(
  ( (Nil!21130) (Cons!21129 (h!22306 (_ BitVec 64)) (t!30134 List!21133)) )
))
(declare-fun arrayNoDuplicates!0 (array!63263 (_ BitVec 32) List!21133) Bool)

(assert (=> b!1001092 (= res!670565 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21130))))

(declare-fun b!1001093 () Bool)

(declare-fun res!670575 () Bool)

(assert (=> b!1001093 (=> (not res!670575) (not e!564137))))

(assert (=> b!1001093 (= res!670575 (and (= (size!30959 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30959 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30959 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001094 () Bool)

(declare-fun res!670573 () Bool)

(assert (=> b!1001094 (=> (not res!670573) (not e!564137))))

(assert (=> b!1001094 (= res!670573 (validKeyInArray!0 k!2224))))

(declare-fun b!1001095 () Bool)

(assert (=> b!1001095 (= e!564134 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1001096 () Bool)

(declare-fun res!670571 () Bool)

(assert (=> b!1001096 (=> (not res!670571) (not e!564136))))

(assert (=> b!1001096 (= res!670571 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30959 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30959 a!3219))))))

(declare-fun b!1001097 () Bool)

(declare-fun res!670563 () Bool)

(assert (=> b!1001097 (=> (not res!670563) (not e!564134))))

(assert (=> b!1001097 (= res!670563 (not (= lt!442508 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442507 lt!442511 mask!3464))))))

(declare-fun res!670572 () Bool)

(assert (=> start!86462 (=> (not res!670572) (not e!564137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86462 (= res!670572 (validMask!0 mask!3464))))

(assert (=> start!86462 e!564137))

(declare-fun array_inv!23581 (array!63263) Bool)

(assert (=> start!86462 (array_inv!23581 a!3219)))

(assert (=> start!86462 true))

(assert (= (and start!86462 res!670572) b!1001093))

(assert (= (and b!1001093 res!670575) b!1001085))

(assert (= (and b!1001085 res!670564) b!1001094))

(assert (= (and b!1001094 res!670573) b!1001090))

(assert (= (and b!1001090 res!670569) b!1001087))

(assert (= (and b!1001087 res!670566) b!1001086))

(assert (= (and b!1001086 res!670567) b!1001092))

(assert (= (and b!1001092 res!670565) b!1001096))

(assert (= (and b!1001096 res!670571) b!1001088))

(assert (= (and b!1001088 res!670574) b!1001089))

(assert (= (and b!1001089 res!670570) b!1001091))

(assert (= (and b!1001091 res!670568) b!1001097))

(assert (= (and b!1001097 res!670563) b!1001095))

(declare-fun m!927185 () Bool)

(assert (=> b!1001087 m!927185))

(declare-fun m!927187 () Bool)

(assert (=> b!1001090 m!927187))

(declare-fun m!927189 () Bool)

(assert (=> b!1001089 m!927189))

(assert (=> b!1001089 m!927189))

(declare-fun m!927191 () Bool)

(assert (=> b!1001089 m!927191))

(declare-fun m!927193 () Bool)

(assert (=> b!1001092 m!927193))

(declare-fun m!927195 () Bool)

(assert (=> b!1001091 m!927195))

(assert (=> b!1001091 m!927195))

(declare-fun m!927197 () Bool)

(assert (=> b!1001091 m!927197))

(declare-fun m!927199 () Bool)

(assert (=> b!1001091 m!927199))

(declare-fun m!927201 () Bool)

(assert (=> b!1001091 m!927201))

(assert (=> b!1001085 m!927189))

(assert (=> b!1001085 m!927189))

(declare-fun m!927203 () Bool)

(assert (=> b!1001085 m!927203))

(declare-fun m!927205 () Bool)

(assert (=> b!1001086 m!927205))

(declare-fun m!927207 () Bool)

(assert (=> b!1001094 m!927207))

(declare-fun m!927209 () Bool)

(assert (=> start!86462 m!927209))

(declare-fun m!927211 () Bool)

(assert (=> start!86462 m!927211))

(declare-fun m!927213 () Bool)

(assert (=> b!1001097 m!927213))

(assert (=> b!1001088 m!927189))

(assert (=> b!1001088 m!927189))

(declare-fun m!927215 () Bool)

(assert (=> b!1001088 m!927215))

(assert (=> b!1001088 m!927215))

(assert (=> b!1001088 m!927189))

(declare-fun m!927217 () Bool)

(assert (=> b!1001088 m!927217))

(push 1)

(assert (not b!1001089))

(assert (not b!1001091))

(assert (not b!1001092))

(assert (not b!1001097))

(assert (not b!1001088))

(assert (not b!1001094))

(assert (not b!1001085))

(assert (not b!1001087))

(assert (not start!86462))

(assert (not b!1001086))

(assert (not b!1001090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

