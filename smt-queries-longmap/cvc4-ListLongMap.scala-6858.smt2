; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86406 () Bool)

(assert start!86406)

(declare-fun b!1000084 () Bool)

(declare-fun res!669572 () Bool)

(declare-fun e!563769 () Bool)

(assert (=> b!1000084 (=> (not res!669572) (not e!563769))))

(declare-datatypes ((array!63207 0))(
  ( (array!63208 (arr!30429 (Array (_ BitVec 32) (_ BitVec 64))) (size!30931 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63207)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000084 (= res!669572 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30931 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30931 a!3219))))))

(declare-fun b!1000085 () Bool)

(declare-fun res!669573 () Bool)

(assert (=> b!1000085 (=> (not res!669573) (not e!563769))))

(declare-datatypes ((List!21105 0))(
  ( (Nil!21102) (Cons!21101 (h!22278 (_ BitVec 64)) (t!30106 List!21105)) )
))
(declare-fun arrayNoDuplicates!0 (array!63207 (_ BitVec 32) List!21105) Bool)

(assert (=> b!1000085 (= res!669573 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21102))))

(declare-fun b!1000086 () Bool)

(declare-fun e!563768 () Bool)

(assert (=> b!1000086 (= e!563769 e!563768)))

(declare-fun res!669566 () Bool)

(assert (=> b!1000086 (=> (not res!669566) (not e!563768))))

(declare-datatypes ((SeekEntryResult!9361 0))(
  ( (MissingZero!9361 (index!39815 (_ BitVec 32))) (Found!9361 (index!39816 (_ BitVec 32))) (Intermediate!9361 (undefined!10173 Bool) (index!39817 (_ BitVec 32)) (x!87245 (_ BitVec 32))) (Undefined!9361) (MissingVacant!9361 (index!39818 (_ BitVec 32))) )
))
(declare-fun lt!442195 () SeekEntryResult!9361)

(declare-fun lt!442196 () SeekEntryResult!9361)

(assert (=> b!1000086 (= res!669566 (= lt!442195 lt!442196))))

(assert (=> b!1000086 (= lt!442196 (Intermediate!9361 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63207 (_ BitVec 32)) SeekEntryResult!9361)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000086 (= lt!442195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30429 a!3219) j!170) mask!3464) (select (arr!30429 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!669569 () Bool)

(declare-fun e!563770 () Bool)

(assert (=> start!86406 (=> (not res!669569) (not e!563770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86406 (= res!669569 (validMask!0 mask!3464))))

(assert (=> start!86406 e!563770))

(declare-fun array_inv!23553 (array!63207) Bool)

(assert (=> start!86406 (array_inv!23553 a!3219)))

(assert (=> start!86406 true))

(declare-fun b!1000087 () Bool)

(declare-fun res!669563 () Bool)

(assert (=> b!1000087 (=> (not res!669563) (not e!563770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000087 (= res!669563 (validKeyInArray!0 (select (arr!30429 a!3219) j!170)))))

(declare-fun b!1000088 () Bool)

(assert (=> b!1000088 (= e!563770 e!563769)))

(declare-fun res!669567 () Bool)

(assert (=> b!1000088 (=> (not res!669567) (not e!563769))))

(declare-fun lt!442194 () SeekEntryResult!9361)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000088 (= res!669567 (or (= lt!442194 (MissingVacant!9361 i!1194)) (= lt!442194 (MissingZero!9361 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63207 (_ BitVec 32)) SeekEntryResult!9361)

(assert (=> b!1000088 (= lt!442194 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000089 () Bool)

(declare-fun res!669570 () Bool)

(assert (=> b!1000089 (=> (not res!669570) (not e!563770))))

(declare-fun arrayContainsKey!0 (array!63207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000089 (= res!669570 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000090 () Bool)

(declare-fun res!669565 () Bool)

(assert (=> b!1000090 (=> (not res!669565) (not e!563770))))

(assert (=> b!1000090 (= res!669565 (validKeyInArray!0 k!2224))))

(declare-fun b!1000091 () Bool)

(declare-fun res!669571 () Bool)

(assert (=> b!1000091 (=> (not res!669571) (not e!563768))))

(assert (=> b!1000091 (= res!669571 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30429 a!3219) j!170) a!3219 mask!3464) lt!442196))))

(declare-fun b!1000092 () Bool)

(declare-fun res!669562 () Bool)

(assert (=> b!1000092 (=> (not res!669562) (not e!563769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63207 (_ BitVec 32)) Bool)

(assert (=> b!1000092 (= res!669562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000093 () Bool)

(declare-fun res!669568 () Bool)

(assert (=> b!1000093 (=> (not res!669568) (not e!563770))))

(assert (=> b!1000093 (= res!669568 (and (= (size!30931 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30931 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30931 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000094 () Bool)

(assert (=> b!1000094 (= e!563768 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000095 () Bool)

(declare-fun res!669564 () Bool)

(assert (=> b!1000095 (=> (not res!669564) (not e!563768))))

(assert (=> b!1000095 (= res!669564 (not (= lt!442195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30429 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30429 a!3219) i!1194 k!2224) j!170) (array!63208 (store (arr!30429 a!3219) i!1194 k!2224) (size!30931 a!3219)) mask!3464))))))

(assert (= (and start!86406 res!669569) b!1000093))

(assert (= (and b!1000093 res!669568) b!1000087))

(assert (= (and b!1000087 res!669563) b!1000090))

(assert (= (and b!1000090 res!669565) b!1000089))

(assert (= (and b!1000089 res!669570) b!1000088))

(assert (= (and b!1000088 res!669567) b!1000092))

(assert (= (and b!1000092 res!669562) b!1000085))

(assert (= (and b!1000085 res!669573) b!1000084))

(assert (= (and b!1000084 res!669572) b!1000086))

(assert (= (and b!1000086 res!669566) b!1000091))

(assert (= (and b!1000091 res!669571) b!1000095))

(assert (= (and b!1000095 res!669564) b!1000094))

(declare-fun m!926271 () Bool)

(assert (=> b!1000087 m!926271))

(assert (=> b!1000087 m!926271))

(declare-fun m!926273 () Bool)

(assert (=> b!1000087 m!926273))

(declare-fun m!926275 () Bool)

(assert (=> b!1000089 m!926275))

(declare-fun m!926277 () Bool)

(assert (=> b!1000090 m!926277))

(assert (=> b!1000091 m!926271))

(assert (=> b!1000091 m!926271))

(declare-fun m!926279 () Bool)

(assert (=> b!1000091 m!926279))

(declare-fun m!926281 () Bool)

(assert (=> b!1000092 m!926281))

(declare-fun m!926283 () Bool)

(assert (=> b!1000088 m!926283))

(declare-fun m!926285 () Bool)

(assert (=> start!86406 m!926285))

(declare-fun m!926287 () Bool)

(assert (=> start!86406 m!926287))

(declare-fun m!926289 () Bool)

(assert (=> b!1000095 m!926289))

(declare-fun m!926291 () Bool)

(assert (=> b!1000095 m!926291))

(assert (=> b!1000095 m!926291))

(declare-fun m!926293 () Bool)

(assert (=> b!1000095 m!926293))

(assert (=> b!1000095 m!926293))

(assert (=> b!1000095 m!926291))

(declare-fun m!926295 () Bool)

(assert (=> b!1000095 m!926295))

(assert (=> b!1000086 m!926271))

(assert (=> b!1000086 m!926271))

(declare-fun m!926297 () Bool)

(assert (=> b!1000086 m!926297))

(assert (=> b!1000086 m!926297))

(assert (=> b!1000086 m!926271))

(declare-fun m!926299 () Bool)

(assert (=> b!1000086 m!926299))

(declare-fun m!926301 () Bool)

(assert (=> b!1000085 m!926301))

(push 1)

(assert (not b!1000088))

(assert (not b!1000095))

(assert (not b!1000092))

(assert (not start!86406))

(assert (not b!1000090))

