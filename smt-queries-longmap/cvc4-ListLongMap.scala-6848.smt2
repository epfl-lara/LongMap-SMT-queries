; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86292 () Bool)

(assert start!86292)

(declare-fun b!998798 () Bool)

(declare-fun res!668444 () Bool)

(declare-fun e!563233 () Bool)

(assert (=> b!998798 (=> (not res!668444) (not e!563233))))

(declare-datatypes ((array!63144 0))(
  ( (array!63145 (arr!30399 (Array (_ BitVec 32) (_ BitVec 64))) (size!30901 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63144)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998798 (= res!668444 (validKeyInArray!0 (select (arr!30399 a!3219) j!170)))))

(declare-fun b!998799 () Bool)

(declare-fun res!668437 () Bool)

(declare-fun e!563230 () Bool)

(assert (=> b!998799 (=> (not res!668437) (not e!563230))))

(declare-datatypes ((List!21075 0))(
  ( (Nil!21072) (Cons!21071 (h!22245 (_ BitVec 64)) (t!30076 List!21075)) )
))
(declare-fun arrayNoDuplicates!0 (array!63144 (_ BitVec 32) List!21075) Bool)

(assert (=> b!998799 (= res!668437 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21072))))

(declare-fun res!668445 () Bool)

(assert (=> start!86292 (=> (not res!668445) (not e!563233))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86292 (= res!668445 (validMask!0 mask!3464))))

(assert (=> start!86292 e!563233))

(declare-fun array_inv!23523 (array!63144) Bool)

(assert (=> start!86292 (array_inv!23523 a!3219)))

(assert (=> start!86292 true))

(declare-fun b!998800 () Bool)

(declare-fun e!563232 () Bool)

(assert (=> b!998800 (= e!563230 e!563232)))

(declare-fun res!668443 () Bool)

(assert (=> b!998800 (=> (not res!668443) (not e!563232))))

(declare-datatypes ((SeekEntryResult!9331 0))(
  ( (MissingZero!9331 (index!39695 (_ BitVec 32))) (Found!9331 (index!39696 (_ BitVec 32))) (Intermediate!9331 (undefined!10143 Bool) (index!39697 (_ BitVec 32)) (x!87129 (_ BitVec 32))) (Undefined!9331) (MissingVacant!9331 (index!39698 (_ BitVec 32))) )
))
(declare-fun lt!441822 () SeekEntryResult!9331)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63144 (_ BitVec 32)) SeekEntryResult!9331)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998800 (= res!668443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30399 a!3219) j!170) mask!3464) (select (arr!30399 a!3219) j!170) a!3219 mask!3464) lt!441822))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998800 (= lt!441822 (Intermediate!9331 false resIndex!38 resX!38))))

(declare-fun b!998801 () Bool)

(declare-fun res!668436 () Bool)

(assert (=> b!998801 (=> (not res!668436) (not e!563233))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998801 (= res!668436 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998802 () Bool)

(declare-fun res!668440 () Bool)

(assert (=> b!998802 (=> (not res!668440) (not e!563230))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998802 (= res!668440 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30901 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30901 a!3219))))))

(declare-fun b!998803 () Bool)

(assert (=> b!998803 (= e!563233 e!563230)))

(declare-fun res!668441 () Bool)

(assert (=> b!998803 (=> (not res!668441) (not e!563230))))

(declare-fun lt!441824 () SeekEntryResult!9331)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998803 (= res!668441 (or (= lt!441824 (MissingVacant!9331 i!1194)) (= lt!441824 (MissingZero!9331 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63144 (_ BitVec 32)) SeekEntryResult!9331)

(assert (=> b!998803 (= lt!441824 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998804 () Bool)

(declare-fun res!668435 () Bool)

(assert (=> b!998804 (=> (not res!668435) (not e!563232))))

(assert (=> b!998804 (= res!668435 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30399 a!3219) j!170) a!3219 mask!3464) lt!441822))))

(declare-fun b!998805 () Bool)

(declare-fun res!668439 () Bool)

(assert (=> b!998805 (=> (not res!668439) (not e!563233))))

(assert (=> b!998805 (= res!668439 (validKeyInArray!0 k!2224))))

(declare-fun b!998806 () Bool)

(assert (=> b!998806 (= e!563232 false)))

(declare-fun lt!441823 () (_ BitVec 32))

(assert (=> b!998806 (= lt!441823 (toIndex!0 (select (store (arr!30399 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!998807 () Bool)

(declare-fun res!668438 () Bool)

(assert (=> b!998807 (=> (not res!668438) (not e!563233))))

(assert (=> b!998807 (= res!668438 (and (= (size!30901 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30901 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30901 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998808 () Bool)

(declare-fun res!668442 () Bool)

(assert (=> b!998808 (=> (not res!668442) (not e!563230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63144 (_ BitVec 32)) Bool)

(assert (=> b!998808 (= res!668442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86292 res!668445) b!998807))

(assert (= (and b!998807 res!668438) b!998798))

(assert (= (and b!998798 res!668444) b!998805))

(assert (= (and b!998805 res!668439) b!998801))

(assert (= (and b!998801 res!668436) b!998803))

(assert (= (and b!998803 res!668441) b!998808))

(assert (= (and b!998808 res!668442) b!998799))

(assert (= (and b!998799 res!668437) b!998802))

(assert (= (and b!998802 res!668440) b!998800))

(assert (= (and b!998800 res!668443) b!998804))

(assert (= (and b!998804 res!668435) b!998806))

(declare-fun m!925193 () Bool)

(assert (=> b!998801 m!925193))

(declare-fun m!925195 () Bool)

(assert (=> b!998808 m!925195))

(declare-fun m!925197 () Bool)

(assert (=> start!86292 m!925197))

(declare-fun m!925199 () Bool)

(assert (=> start!86292 m!925199))

(declare-fun m!925201 () Bool)

(assert (=> b!998805 m!925201))

(declare-fun m!925203 () Bool)

(assert (=> b!998804 m!925203))

(assert (=> b!998804 m!925203))

(declare-fun m!925205 () Bool)

(assert (=> b!998804 m!925205))

(declare-fun m!925207 () Bool)

(assert (=> b!998806 m!925207))

(declare-fun m!925209 () Bool)

(assert (=> b!998806 m!925209))

(assert (=> b!998806 m!925209))

(declare-fun m!925211 () Bool)

(assert (=> b!998806 m!925211))

(assert (=> b!998800 m!925203))

(assert (=> b!998800 m!925203))

(declare-fun m!925213 () Bool)

(assert (=> b!998800 m!925213))

(assert (=> b!998800 m!925213))

(assert (=> b!998800 m!925203))

(declare-fun m!925215 () Bool)

(assert (=> b!998800 m!925215))

(assert (=> b!998798 m!925203))

(assert (=> b!998798 m!925203))

(declare-fun m!925217 () Bool)

(assert (=> b!998798 m!925217))

(declare-fun m!925219 () Bool)

(assert (=> b!998799 m!925219))

(declare-fun m!925221 () Bool)

(assert (=> b!998803 m!925221))

(push 1)

(assert (not b!998800))

(assert (not b!998804))

(assert (not b!998808))

(assert (not start!86292))

(assert (not b!998803))

(assert (not b!998798))

(assert (not b!998806))

(assert (not b!998801))

(assert (not b!998805))

