; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86378 () Bool)

(assert start!86378)

(declare-fun b!999596 () Bool)

(declare-fun e!563602 () Bool)

(declare-fun e!563600 () Bool)

(assert (=> b!999596 (= e!563602 e!563600)))

(declare-fun res!669074 () Bool)

(assert (=> b!999596 (=> (not res!669074) (not e!563600))))

(declare-datatypes ((SeekEntryResult!9347 0))(
  ( (MissingZero!9347 (index!39759 (_ BitVec 32))) (Found!9347 (index!39760 (_ BitVec 32))) (Intermediate!9347 (undefined!10159 Bool) (index!39761 (_ BitVec 32)) (x!87199 (_ BitVec 32))) (Undefined!9347) (MissingVacant!9347 (index!39762 (_ BitVec 32))) )
))
(declare-fun lt!442069 () SeekEntryResult!9347)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999596 (= res!669074 (or (= lt!442069 (MissingVacant!9347 i!1194)) (= lt!442069 (MissingZero!9347 i!1194))))))

(declare-datatypes ((array!63179 0))(
  ( (array!63180 (arr!30415 (Array (_ BitVec 32) (_ BitVec 64))) (size!30917 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63179)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63179 (_ BitVec 32)) SeekEntryResult!9347)

(assert (=> b!999596 (= lt!442069 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999597 () Bool)

(declare-fun res!669081 () Bool)

(assert (=> b!999597 (=> (not res!669081) (not e!563600))))

(declare-datatypes ((List!21091 0))(
  ( (Nil!21088) (Cons!21087 (h!22264 (_ BitVec 64)) (t!30092 List!21091)) )
))
(declare-fun arrayNoDuplicates!0 (array!63179 (_ BitVec 32) List!21091) Bool)

(assert (=> b!999597 (= res!669081 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21088))))

(declare-fun b!999598 () Bool)

(declare-fun e!563599 () Bool)

(assert (=> b!999598 (= e!563599 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442068 () SeekEntryResult!9347)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63179 (_ BitVec 32)) SeekEntryResult!9347)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999598 (= lt!442068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30415 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30415 a!3219) i!1194 k!2224) j!170) (array!63180 (store (arr!30415 a!3219) i!1194 k!2224) (size!30917 a!3219)) mask!3464))))

(declare-fun b!999599 () Bool)

(declare-fun res!669077 () Bool)

(assert (=> b!999599 (=> (not res!669077) (not e!563600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63179 (_ BitVec 32)) Bool)

(assert (=> b!999599 (= res!669077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999600 () Bool)

(declare-fun res!669082 () Bool)

(assert (=> b!999600 (=> (not res!669082) (not e!563599))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442070 () SeekEntryResult!9347)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999600 (= res!669082 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30415 a!3219) j!170) a!3219 mask!3464) lt!442070))))

(declare-fun b!999601 () Bool)

(assert (=> b!999601 (= e!563600 e!563599)))

(declare-fun res!669078 () Bool)

(assert (=> b!999601 (=> (not res!669078) (not e!563599))))

(assert (=> b!999601 (= res!669078 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30415 a!3219) j!170) mask!3464) (select (arr!30415 a!3219) j!170) a!3219 mask!3464) lt!442070))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999601 (= lt!442070 (Intermediate!9347 false resIndex!38 resX!38))))

(declare-fun res!669076 () Bool)

(assert (=> start!86378 (=> (not res!669076) (not e!563602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86378 (= res!669076 (validMask!0 mask!3464))))

(assert (=> start!86378 e!563602))

(declare-fun array_inv!23539 (array!63179) Bool)

(assert (=> start!86378 (array_inv!23539 a!3219)))

(assert (=> start!86378 true))

(declare-fun b!999602 () Bool)

(declare-fun res!669083 () Bool)

(assert (=> b!999602 (=> (not res!669083) (not e!563600))))

(assert (=> b!999602 (= res!669083 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30917 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30917 a!3219))))))

(declare-fun b!999603 () Bool)

(declare-fun res!669084 () Bool)

(assert (=> b!999603 (=> (not res!669084) (not e!563602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999603 (= res!669084 (validKeyInArray!0 (select (arr!30415 a!3219) j!170)))))

(declare-fun b!999604 () Bool)

(declare-fun res!669075 () Bool)

(assert (=> b!999604 (=> (not res!669075) (not e!563602))))

(assert (=> b!999604 (= res!669075 (validKeyInArray!0 k!2224))))

(declare-fun b!999605 () Bool)

(declare-fun res!669079 () Bool)

(assert (=> b!999605 (=> (not res!669079) (not e!563602))))

(declare-fun arrayContainsKey!0 (array!63179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999605 (= res!669079 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999606 () Bool)

(declare-fun res!669080 () Bool)

(assert (=> b!999606 (=> (not res!669080) (not e!563602))))

(assert (=> b!999606 (= res!669080 (and (= (size!30917 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30917 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30917 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86378 res!669076) b!999606))

(assert (= (and b!999606 res!669080) b!999603))

(assert (= (and b!999603 res!669084) b!999604))

(assert (= (and b!999604 res!669075) b!999605))

(assert (= (and b!999605 res!669079) b!999596))

(assert (= (and b!999596 res!669074) b!999599))

(assert (= (and b!999599 res!669077) b!999597))

(assert (= (and b!999597 res!669081) b!999602))

(assert (= (and b!999602 res!669083) b!999601))

(assert (= (and b!999601 res!669078) b!999600))

(assert (= (and b!999600 res!669082) b!999598))

(declare-fun m!925823 () Bool)

(assert (=> b!999598 m!925823))

(declare-fun m!925825 () Bool)

(assert (=> b!999598 m!925825))

(assert (=> b!999598 m!925825))

(declare-fun m!925827 () Bool)

(assert (=> b!999598 m!925827))

(assert (=> b!999598 m!925827))

(assert (=> b!999598 m!925825))

(declare-fun m!925829 () Bool)

(assert (=> b!999598 m!925829))

(declare-fun m!925831 () Bool)

(assert (=> b!999599 m!925831))

(declare-fun m!925833 () Bool)

(assert (=> b!999603 m!925833))

(assert (=> b!999603 m!925833))

(declare-fun m!925835 () Bool)

(assert (=> b!999603 m!925835))

(declare-fun m!925837 () Bool)

(assert (=> start!86378 m!925837))

(declare-fun m!925839 () Bool)

(assert (=> start!86378 m!925839))

(assert (=> b!999600 m!925833))

(assert (=> b!999600 m!925833))

(declare-fun m!925841 () Bool)

(assert (=> b!999600 m!925841))

(assert (=> b!999601 m!925833))

(assert (=> b!999601 m!925833))

(declare-fun m!925843 () Bool)

(assert (=> b!999601 m!925843))

(assert (=> b!999601 m!925843))

(assert (=> b!999601 m!925833))

(declare-fun m!925845 () Bool)

(assert (=> b!999601 m!925845))

(declare-fun m!925847 () Bool)

(assert (=> b!999604 m!925847))

(declare-fun m!925849 () Bool)

(assert (=> b!999605 m!925849))

(declare-fun m!925851 () Bool)

(assert (=> b!999597 m!925851))

(declare-fun m!925853 () Bool)

(assert (=> b!999596 m!925853))

(push 1)

