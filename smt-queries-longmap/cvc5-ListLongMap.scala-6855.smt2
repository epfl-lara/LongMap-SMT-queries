; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86384 () Bool)

(assert start!86384)

(declare-fun b!999697 () Bool)

(declare-fun res!669175 () Bool)

(declare-fun e!563636 () Bool)

(assert (=> b!999697 (=> (not res!669175) (not e!563636))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9350 0))(
  ( (MissingZero!9350 (index!39771 (_ BitVec 32))) (Found!9350 (index!39772 (_ BitVec 32))) (Intermediate!9350 (undefined!10162 Bool) (index!39773 (_ BitVec 32)) (x!87210 (_ BitVec 32))) (Undefined!9350) (MissingVacant!9350 (index!39774 (_ BitVec 32))) )
))
(declare-fun lt!442096 () SeekEntryResult!9350)

(declare-datatypes ((array!63185 0))(
  ( (array!63186 (arr!30418 (Array (_ BitVec 32) (_ BitVec 64))) (size!30920 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63185)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63185 (_ BitVec 32)) SeekEntryResult!9350)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999697 (= res!669175 (not (= lt!442096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30418 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30418 a!3219) i!1194 k!2224) j!170) (array!63186 (store (arr!30418 a!3219) i!1194 k!2224) (size!30920 a!3219)) mask!3464))))))

(declare-fun b!999699 () Bool)

(declare-fun res!669181 () Bool)

(declare-fun e!563637 () Bool)

(assert (=> b!999699 (=> (not res!669181) (not e!563637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63185 (_ BitVec 32)) Bool)

(assert (=> b!999699 (= res!669181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999700 () Bool)

(declare-fun e!563635 () Bool)

(assert (=> b!999700 (= e!563635 e!563637)))

(declare-fun res!669185 () Bool)

(assert (=> b!999700 (=> (not res!669185) (not e!563637))))

(declare-fun lt!442097 () SeekEntryResult!9350)

(assert (=> b!999700 (= res!669185 (or (= lt!442097 (MissingVacant!9350 i!1194)) (= lt!442097 (MissingZero!9350 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63185 (_ BitVec 32)) SeekEntryResult!9350)

(assert (=> b!999700 (= lt!442097 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999701 () Bool)

(declare-fun res!669183 () Bool)

(assert (=> b!999701 (=> (not res!669183) (not e!563635))))

(declare-fun arrayContainsKey!0 (array!63185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999701 (= res!669183 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999702 () Bool)

(declare-fun res!669184 () Bool)

(assert (=> b!999702 (=> (not res!669184) (not e!563636))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!442095 () SeekEntryResult!9350)

(assert (=> b!999702 (= res!669184 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30418 a!3219) j!170) a!3219 mask!3464) lt!442095))))

(declare-fun b!999703 () Bool)

(assert (=> b!999703 (= e!563636 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!999704 () Bool)

(declare-fun res!669182 () Bool)

(assert (=> b!999704 (=> (not res!669182) (not e!563635))))

(assert (=> b!999704 (= res!669182 (and (= (size!30920 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30920 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30920 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999705 () Bool)

(assert (=> b!999705 (= e!563637 e!563636)))

(declare-fun res!669176 () Bool)

(assert (=> b!999705 (=> (not res!669176) (not e!563636))))

(assert (=> b!999705 (= res!669176 (= lt!442096 lt!442095))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999705 (= lt!442095 (Intermediate!9350 false resIndex!38 resX!38))))

(assert (=> b!999705 (= lt!442096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30418 a!3219) j!170) mask!3464) (select (arr!30418 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999706 () Bool)

(declare-fun res!669178 () Bool)

(assert (=> b!999706 (=> (not res!669178) (not e!563635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999706 (= res!669178 (validKeyInArray!0 (select (arr!30418 a!3219) j!170)))))

(declare-fun b!999698 () Bool)

(declare-fun res!669177 () Bool)

(assert (=> b!999698 (=> (not res!669177) (not e!563635))))

(assert (=> b!999698 (= res!669177 (validKeyInArray!0 k!2224))))

(declare-fun res!669186 () Bool)

(assert (=> start!86384 (=> (not res!669186) (not e!563635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86384 (= res!669186 (validMask!0 mask!3464))))

(assert (=> start!86384 e!563635))

(declare-fun array_inv!23542 (array!63185) Bool)

(assert (=> start!86384 (array_inv!23542 a!3219)))

(assert (=> start!86384 true))

(declare-fun b!999707 () Bool)

(declare-fun res!669179 () Bool)

(assert (=> b!999707 (=> (not res!669179) (not e!563637))))

(declare-datatypes ((List!21094 0))(
  ( (Nil!21091) (Cons!21090 (h!22267 (_ BitVec 64)) (t!30095 List!21094)) )
))
(declare-fun arrayNoDuplicates!0 (array!63185 (_ BitVec 32) List!21094) Bool)

(assert (=> b!999707 (= res!669179 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21091))))

(declare-fun b!999708 () Bool)

(declare-fun res!669180 () Bool)

(assert (=> b!999708 (=> (not res!669180) (not e!563637))))

(assert (=> b!999708 (= res!669180 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30920 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30920 a!3219))))))

(assert (= (and start!86384 res!669186) b!999704))

(assert (= (and b!999704 res!669182) b!999706))

(assert (= (and b!999706 res!669178) b!999698))

(assert (= (and b!999698 res!669177) b!999701))

(assert (= (and b!999701 res!669183) b!999700))

(assert (= (and b!999700 res!669185) b!999699))

(assert (= (and b!999699 res!669181) b!999707))

(assert (= (and b!999707 res!669179) b!999708))

(assert (= (and b!999708 res!669180) b!999705))

(assert (= (and b!999705 res!669176) b!999702))

(assert (= (and b!999702 res!669184) b!999697))

(assert (= (and b!999697 res!669175) b!999703))

(declare-fun m!925919 () Bool)

(assert (=> b!999699 m!925919))

(declare-fun m!925921 () Bool)

(assert (=> b!999706 m!925921))

(assert (=> b!999706 m!925921))

(declare-fun m!925923 () Bool)

(assert (=> b!999706 m!925923))

(assert (=> b!999702 m!925921))

(assert (=> b!999702 m!925921))

(declare-fun m!925925 () Bool)

(assert (=> b!999702 m!925925))

(declare-fun m!925927 () Bool)

(assert (=> start!86384 m!925927))

(declare-fun m!925929 () Bool)

(assert (=> start!86384 m!925929))

(declare-fun m!925931 () Bool)

(assert (=> b!999707 m!925931))

(assert (=> b!999705 m!925921))

(assert (=> b!999705 m!925921))

(declare-fun m!925933 () Bool)

(assert (=> b!999705 m!925933))

(assert (=> b!999705 m!925933))

(assert (=> b!999705 m!925921))

(declare-fun m!925935 () Bool)

(assert (=> b!999705 m!925935))

(declare-fun m!925937 () Bool)

(assert (=> b!999697 m!925937))

(declare-fun m!925939 () Bool)

(assert (=> b!999697 m!925939))

(assert (=> b!999697 m!925939))

(declare-fun m!925941 () Bool)

(assert (=> b!999697 m!925941))

(assert (=> b!999697 m!925941))

(assert (=> b!999697 m!925939))

(declare-fun m!925943 () Bool)

(assert (=> b!999697 m!925943))

(declare-fun m!925945 () Bool)

(assert (=> b!999698 m!925945))

(declare-fun m!925947 () Bool)

(assert (=> b!999701 m!925947))

(declare-fun m!925949 () Bool)

(assert (=> b!999700 m!925949))

(push 1)

