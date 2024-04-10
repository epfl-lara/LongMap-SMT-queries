; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86508 () Bool)

(assert start!86508)

(declare-fun b!1002141 () Bool)

(declare-fun res!671632 () Bool)

(declare-fun e!564607 () Bool)

(assert (=> b!1002141 (=> (not res!671632) (not e!564607))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002141 (= res!671632 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002142 () Bool)

(declare-fun e!564604 () Bool)

(assert (=> b!1002142 (= e!564604 e!564607)))

(declare-fun res!671627 () Bool)

(assert (=> b!1002142 (=> (not res!671627) (not e!564607))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9412 0))(
  ( (MissingZero!9412 (index!40019 (_ BitVec 32))) (Found!9412 (index!40020 (_ BitVec 32))) (Intermediate!9412 (undefined!10224 Bool) (index!40021 (_ BitVec 32)) (x!87432 (_ BitVec 32))) (Undefined!9412) (MissingVacant!9412 (index!40022 (_ BitVec 32))) )
))
(declare-fun lt!443032 () SeekEntryResult!9412)

(declare-datatypes ((array!63309 0))(
  ( (array!63310 (arr!30480 (Array (_ BitVec 32) (_ BitVec 64))) (size!30982 (_ BitVec 32))) )
))
(declare-fun lt!443026 () array!63309)

(declare-fun lt!443028 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63309 (_ BitVec 32)) SeekEntryResult!9412)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002142 (= res!671627 (not (= lt!443032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443028 mask!3464) lt!443028 lt!443026 mask!3464))))))

(declare-fun a!3219 () array!63309)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1002142 (= lt!443028 (select (store (arr!30480 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002142 (= lt!443026 (array!63310 (store (arr!30480 a!3219) i!1194 k!2224) (size!30982 a!3219)))))

(declare-fun b!1002143 () Bool)

(declare-fun e!564602 () Bool)

(assert (=> b!1002143 (= e!564602 false)))

(declare-fun lt!443027 () (_ BitVec 32))

(declare-fun lt!443033 () SeekEntryResult!9412)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1002143 (= lt!443033 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443027 lt!443028 lt!443026 mask!3464))))

(declare-fun b!1002144 () Bool)

(declare-fun e!564606 () Bool)

(assert (=> b!1002144 (= e!564606 e!564604)))

(declare-fun res!671633 () Bool)

(assert (=> b!1002144 (=> (not res!671633) (not e!564604))))

(declare-fun lt!443030 () SeekEntryResult!9412)

(declare-fun lt!443031 () SeekEntryResult!9412)

(assert (=> b!1002144 (= res!671633 (= lt!443030 lt!443031))))

(assert (=> b!1002144 (= lt!443030 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30480 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002145 () Bool)

(assert (=> b!1002145 (= e!564607 e!564602)))

(declare-fun res!671634 () Bool)

(assert (=> b!1002145 (=> (not res!671634) (not e!564602))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002145 (= res!671634 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443027 #b00000000000000000000000000000000) (bvslt lt!443027 (size!30982 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002145 (= lt!443027 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002146 () Bool)

(declare-fun res!671624 () Bool)

(declare-fun e!564605 () Bool)

(assert (=> b!1002146 (=> (not res!671624) (not e!564605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63309 (_ BitVec 32)) Bool)

(assert (=> b!1002146 (= res!671624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002147 () Bool)

(declare-fun res!671625 () Bool)

(declare-fun e!564603 () Bool)

(assert (=> b!1002147 (=> (not res!671625) (not e!564603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002147 (= res!671625 (validKeyInArray!0 (select (arr!30480 a!3219) j!170)))))

(declare-fun b!1002148 () Bool)

(declare-fun res!671630 () Bool)

(assert (=> b!1002148 (=> (not res!671630) (not e!564603))))

(declare-fun arrayContainsKey!0 (array!63309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002148 (= res!671630 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!671620 () Bool)

(assert (=> start!86508 (=> (not res!671620) (not e!564603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86508 (= res!671620 (validMask!0 mask!3464))))

(assert (=> start!86508 e!564603))

(declare-fun array_inv!23604 (array!63309) Bool)

(assert (=> start!86508 (array_inv!23604 a!3219)))

(assert (=> start!86508 true))

(declare-fun b!1002149 () Bool)

(declare-fun res!671631 () Bool)

(assert (=> b!1002149 (=> (not res!671631) (not e!564602))))

(assert (=> b!1002149 (= res!671631 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443027 (select (arr!30480 a!3219) j!170) a!3219 mask!3464) lt!443031))))

(declare-fun b!1002150 () Bool)

(assert (=> b!1002150 (= e!564603 e!564605)))

(declare-fun res!671619 () Bool)

(assert (=> b!1002150 (=> (not res!671619) (not e!564605))))

(declare-fun lt!443029 () SeekEntryResult!9412)

(assert (=> b!1002150 (= res!671619 (or (= lt!443029 (MissingVacant!9412 i!1194)) (= lt!443029 (MissingZero!9412 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63309 (_ BitVec 32)) SeekEntryResult!9412)

(assert (=> b!1002150 (= lt!443029 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002151 () Bool)

(declare-fun res!671628 () Bool)

(assert (=> b!1002151 (=> (not res!671628) (not e!564605))))

(assert (=> b!1002151 (= res!671628 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30982 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30982 a!3219))))))

(declare-fun b!1002152 () Bool)

(declare-fun res!671629 () Bool)

(assert (=> b!1002152 (=> (not res!671629) (not e!564603))))

(assert (=> b!1002152 (= res!671629 (and (= (size!30982 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30982 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30982 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002153 () Bool)

(assert (=> b!1002153 (= e!564605 e!564606)))

(declare-fun res!671622 () Bool)

(assert (=> b!1002153 (=> (not res!671622) (not e!564606))))

(assert (=> b!1002153 (= res!671622 (= lt!443032 lt!443031))))

(assert (=> b!1002153 (= lt!443031 (Intermediate!9412 false resIndex!38 resX!38))))

(assert (=> b!1002153 (= lt!443032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30480 a!3219) j!170) mask!3464) (select (arr!30480 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002154 () Bool)

(declare-fun res!671623 () Bool)

(assert (=> b!1002154 (=> (not res!671623) (not e!564603))))

(assert (=> b!1002154 (= res!671623 (validKeyInArray!0 k!2224))))

(declare-fun b!1002155 () Bool)

(declare-fun res!671621 () Bool)

(assert (=> b!1002155 (=> (not res!671621) (not e!564605))))

(declare-datatypes ((List!21156 0))(
  ( (Nil!21153) (Cons!21152 (h!22329 (_ BitVec 64)) (t!30157 List!21156)) )
))
(declare-fun arrayNoDuplicates!0 (array!63309 (_ BitVec 32) List!21156) Bool)

(assert (=> b!1002155 (= res!671621 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21153))))

(declare-fun b!1002156 () Bool)

(declare-fun res!671626 () Bool)

(assert (=> b!1002156 (=> (not res!671626) (not e!564607))))

(assert (=> b!1002156 (= res!671626 (not (= lt!443030 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443028 lt!443026 mask!3464))))))

(assert (= (and start!86508 res!671620) b!1002152))

(assert (= (and b!1002152 res!671629) b!1002147))

(assert (= (and b!1002147 res!671625) b!1002154))

(assert (= (and b!1002154 res!671623) b!1002148))

(assert (= (and b!1002148 res!671630) b!1002150))

(assert (= (and b!1002150 res!671619) b!1002146))

(assert (= (and b!1002146 res!671624) b!1002155))

(assert (= (and b!1002155 res!671621) b!1002151))

(assert (= (and b!1002151 res!671628) b!1002153))

(assert (= (and b!1002153 res!671622) b!1002144))

(assert (= (and b!1002144 res!671633) b!1002142))

(assert (= (and b!1002142 res!671627) b!1002156))

(assert (= (and b!1002156 res!671626) b!1002141))

(assert (= (and b!1002141 res!671632) b!1002145))

(assert (= (and b!1002145 res!671634) b!1002149))

(assert (= (and b!1002149 res!671631) b!1002143))

(declare-fun m!928069 () Bool)

(assert (=> start!86508 m!928069))

(declare-fun m!928071 () Bool)

(assert (=> start!86508 m!928071))

(declare-fun m!928073 () Bool)

(assert (=> b!1002142 m!928073))

(assert (=> b!1002142 m!928073))

(declare-fun m!928075 () Bool)

(assert (=> b!1002142 m!928075))

(declare-fun m!928077 () Bool)

(assert (=> b!1002142 m!928077))

(declare-fun m!928079 () Bool)

(assert (=> b!1002142 m!928079))

(declare-fun m!928081 () Bool)

(assert (=> b!1002149 m!928081))

(assert (=> b!1002149 m!928081))

(declare-fun m!928083 () Bool)

(assert (=> b!1002149 m!928083))

(declare-fun m!928085 () Bool)

(assert (=> b!1002145 m!928085))

(assert (=> b!1002153 m!928081))

(assert (=> b!1002153 m!928081))

(declare-fun m!928087 () Bool)

(assert (=> b!1002153 m!928087))

(assert (=> b!1002153 m!928087))

(assert (=> b!1002153 m!928081))

(declare-fun m!928089 () Bool)

(assert (=> b!1002153 m!928089))

(declare-fun m!928091 () Bool)

(assert (=> b!1002143 m!928091))

(declare-fun m!928093 () Bool)

(assert (=> b!1002146 m!928093))

(declare-fun m!928095 () Bool)

(assert (=> b!1002150 m!928095))

(assert (=> b!1002147 m!928081))

(assert (=> b!1002147 m!928081))

(declare-fun m!928097 () Bool)

(assert (=> b!1002147 m!928097))

(declare-fun m!928099 () Bool)

(assert (=> b!1002155 m!928099))

(assert (=> b!1002144 m!928081))

(assert (=> b!1002144 m!928081))

(declare-fun m!928101 () Bool)

(assert (=> b!1002144 m!928101))

(declare-fun m!928103 () Bool)

(assert (=> b!1002156 m!928103))

(declare-fun m!928105 () Bool)

(assert (=> b!1002148 m!928105))

(declare-fun m!928107 () Bool)

(assert (=> b!1002154 m!928107))

(push 1)

(assert (not b!1002145))

