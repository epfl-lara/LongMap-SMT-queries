; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86594 () Bool)

(assert start!86594)

(declare-fun b!1001214 () Bool)

(declare-fun e!564445 () Bool)

(declare-fun e!564446 () Bool)

(assert (=> b!1001214 (= e!564445 e!564446)))

(declare-fun res!670134 () Bool)

(assert (=> b!1001214 (=> (not res!670134) (not e!564446))))

(declare-datatypes ((array!63265 0))(
  ( (array!63266 (arr!30453 (Array (_ BitVec 32) (_ BitVec 64))) (size!30956 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63265)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9321 0))(
  ( (MissingZero!9321 (index!39655 (_ BitVec 32))) (Found!9321 (index!39656 (_ BitVec 32))) (Intermediate!9321 (undefined!10133 Bool) (index!39657 (_ BitVec 32)) (x!87235 (_ BitVec 32))) (Undefined!9321) (MissingVacant!9321 (index!39658 (_ BitVec 32))) )
))
(declare-fun lt!442616 () SeekEntryResult!9321)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63265 (_ BitVec 32)) SeekEntryResult!9321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001214 (= res!670134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30453 a!3219) j!170) mask!3464) (select (arr!30453 a!3219) j!170) a!3219 mask!3464) lt!442616))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001214 (= lt!442616 (Intermediate!9321 false resIndex!38 resX!38))))

(declare-fun b!1001215 () Bool)

(declare-fun res!670127 () Bool)

(assert (=> b!1001215 (=> (not res!670127) (not e!564445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63265 (_ BitVec 32)) Bool)

(assert (=> b!1001215 (= res!670127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001216 () Bool)

(declare-fun res!670126 () Bool)

(assert (=> b!1001216 (=> (not res!670126) (not e!564445))))

(declare-datatypes ((List!21100 0))(
  ( (Nil!21097) (Cons!21096 (h!22279 (_ BitVec 64)) (t!30093 List!21100)) )
))
(declare-fun arrayNoDuplicates!0 (array!63265 (_ BitVec 32) List!21100) Bool)

(assert (=> b!1001216 (= res!670126 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21097))))

(declare-fun b!1001217 () Bool)

(declare-fun e!564444 () Bool)

(assert (=> b!1001217 (= e!564444 e!564445)))

(declare-fun res!670132 () Bool)

(assert (=> b!1001217 (=> (not res!670132) (not e!564445))))

(declare-fun lt!442615 () SeekEntryResult!9321)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001217 (= res!670132 (or (= lt!442615 (MissingVacant!9321 i!1194)) (= lt!442615 (MissingZero!9321 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63265 (_ BitVec 32)) SeekEntryResult!9321)

(assert (=> b!1001217 (= lt!442615 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001218 () Bool)

(declare-fun res!670128 () Bool)

(assert (=> b!1001218 (=> (not res!670128) (not e!564444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001218 (= res!670128 (validKeyInArray!0 (select (arr!30453 a!3219) j!170)))))

(declare-fun b!1001219 () Bool)

(declare-fun res!670130 () Bool)

(assert (=> b!1001219 (=> (not res!670130) (not e!564444))))

(assert (=> b!1001219 (= res!670130 (and (= (size!30956 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30956 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30956 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001220 () Bool)

(declare-fun res!670135 () Bool)

(assert (=> b!1001220 (=> (not res!670135) (not e!564444))))

(assert (=> b!1001220 (= res!670135 (validKeyInArray!0 k!2224))))

(declare-fun res!670131 () Bool)

(assert (=> start!86594 (=> (not res!670131) (not e!564444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86594 (= res!670131 (validMask!0 mask!3464))))

(assert (=> start!86594 e!564444))

(declare-fun array_inv!23589 (array!63265) Bool)

(assert (=> start!86594 (array_inv!23589 a!3219)))

(assert (=> start!86594 true))

(declare-fun b!1001221 () Bool)

(assert (=> b!1001221 (= e!564446 false)))

(declare-fun lt!442614 () SeekEntryResult!9321)

(assert (=> b!1001221 (= lt!442614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30453 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30453 a!3219) i!1194 k!2224) j!170) (array!63266 (store (arr!30453 a!3219) i!1194 k!2224) (size!30956 a!3219)) mask!3464))))

(declare-fun b!1001222 () Bool)

(declare-fun res!670133 () Bool)

(assert (=> b!1001222 (=> (not res!670133) (not e!564444))))

(declare-fun arrayContainsKey!0 (array!63265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001222 (= res!670133 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001223 () Bool)

(declare-fun res!670129 () Bool)

(assert (=> b!1001223 (=> (not res!670129) (not e!564445))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1001223 (= res!670129 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30956 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30956 a!3219))))))

(declare-fun b!1001224 () Bool)

(declare-fun res!670136 () Bool)

(assert (=> b!1001224 (=> (not res!670136) (not e!564446))))

(assert (=> b!1001224 (= res!670136 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30453 a!3219) j!170) a!3219 mask!3464) lt!442616))))

(assert (= (and start!86594 res!670131) b!1001219))

(assert (= (and b!1001219 res!670130) b!1001218))

(assert (= (and b!1001218 res!670128) b!1001220))

(assert (= (and b!1001220 res!670135) b!1001222))

(assert (= (and b!1001222 res!670133) b!1001217))

(assert (= (and b!1001217 res!670132) b!1001215))

(assert (= (and b!1001215 res!670127) b!1001216))

(assert (= (and b!1001216 res!670126) b!1001223))

(assert (= (and b!1001223 res!670129) b!1001214))

(assert (= (and b!1001214 res!670134) b!1001224))

(assert (= (and b!1001224 res!670136) b!1001221))

(declare-fun m!927801 () Bool)

(assert (=> b!1001222 m!927801))

(declare-fun m!927803 () Bool)

(assert (=> b!1001220 m!927803))

(declare-fun m!927805 () Bool)

(assert (=> b!1001218 m!927805))

(assert (=> b!1001218 m!927805))

(declare-fun m!927807 () Bool)

(assert (=> b!1001218 m!927807))

(declare-fun m!927809 () Bool)

(assert (=> b!1001221 m!927809))

(declare-fun m!927811 () Bool)

(assert (=> b!1001221 m!927811))

(assert (=> b!1001221 m!927811))

(declare-fun m!927813 () Bool)

(assert (=> b!1001221 m!927813))

(assert (=> b!1001221 m!927813))

(assert (=> b!1001221 m!927811))

(declare-fun m!927815 () Bool)

(assert (=> b!1001221 m!927815))

(declare-fun m!927817 () Bool)

(assert (=> b!1001217 m!927817))

(assert (=> b!1001214 m!927805))

(assert (=> b!1001214 m!927805))

(declare-fun m!927819 () Bool)

(assert (=> b!1001214 m!927819))

(assert (=> b!1001214 m!927819))

(assert (=> b!1001214 m!927805))

(declare-fun m!927821 () Bool)

(assert (=> b!1001214 m!927821))

(declare-fun m!927823 () Bool)

(assert (=> start!86594 m!927823))

(declare-fun m!927825 () Bool)

(assert (=> start!86594 m!927825))

(declare-fun m!927827 () Bool)

(assert (=> b!1001215 m!927827))

(declare-fun m!927829 () Bool)

(assert (=> b!1001216 m!927829))

(assert (=> b!1001224 m!927805))

(assert (=> b!1001224 m!927805))

(declare-fun m!927831 () Bool)

(assert (=> b!1001224 m!927831))

(push 1)

(assert (not b!1001221))

(assert (not b!1001216))

(assert (not b!1001220))

(assert (not b!1001214))

(assert (not start!86594))

(assert (not b!1001222))

(assert (not b!1001224))

(assert (not b!1001217))

(assert (not b!1001215))

(assert (not b!1001218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

