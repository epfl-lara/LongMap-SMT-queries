; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86052 () Bool)

(assert start!86052)

(declare-fun b!996792 () Bool)

(declare-fun e!562313 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996792 (= e!562313 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!996793 () Bool)

(declare-fun res!666910 () Bool)

(assert (=> b!996793 (=> (not res!666910) (not e!562313))))

(declare-datatypes ((array!63057 0))(
  ( (array!63058 (arr!30360 (Array (_ BitVec 32) (_ BitVec 64))) (size!30862 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63057)

(declare-datatypes ((List!21036 0))(
  ( (Nil!21033) (Cons!21032 (h!22197 (_ BitVec 64)) (t!30037 List!21036)) )
))
(declare-fun arrayNoDuplicates!0 (array!63057 (_ BitVec 32) List!21036) Bool)

(assert (=> b!996793 (= res!666910 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21033))))

(declare-fun b!996794 () Bool)

(declare-fun res!666912 () Bool)

(declare-fun e!562315 () Bool)

(assert (=> b!996794 (=> (not res!666912) (not e!562315))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996794 (= res!666912 (validKeyInArray!0 k!2224))))

(declare-fun b!996795 () Bool)

(declare-fun res!666906 () Bool)

(assert (=> b!996795 (=> (not res!666906) (not e!562315))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996795 (= res!666906 (validKeyInArray!0 (select (arr!30360 a!3219) j!170)))))

(declare-fun b!996796 () Bool)

(declare-fun res!666915 () Bool)

(assert (=> b!996796 (=> (not res!666915) (not e!562313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63057 (_ BitVec 32)) Bool)

(assert (=> b!996796 (= res!666915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996797 () Bool)

(declare-fun res!666914 () Bool)

(assert (=> b!996797 (=> (not res!666914) (not e!562313))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996797 (= res!666914 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30862 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30862 a!3219))))))

(declare-fun res!666908 () Bool)

(assert (=> start!86052 (=> (not res!666908) (not e!562315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86052 (= res!666908 (validMask!0 mask!3464))))

(assert (=> start!86052 e!562315))

(declare-fun array_inv!23484 (array!63057) Bool)

(assert (=> start!86052 (array_inv!23484 a!3219)))

(assert (=> start!86052 true))

(declare-fun b!996798 () Bool)

(declare-fun res!666911 () Bool)

(assert (=> b!996798 (=> (not res!666911) (not e!562315))))

(declare-fun arrayContainsKey!0 (array!63057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996798 (= res!666911 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996799 () Bool)

(assert (=> b!996799 (= e!562315 e!562313)))

(declare-fun res!666907 () Bool)

(assert (=> b!996799 (=> (not res!666907) (not e!562313))))

(declare-datatypes ((SeekEntryResult!9292 0))(
  ( (MissingZero!9292 (index!39539 (_ BitVec 32))) (Found!9292 (index!39540 (_ BitVec 32))) (Intermediate!9292 (undefined!10104 Bool) (index!39541 (_ BitVec 32)) (x!86968 (_ BitVec 32))) (Undefined!9292) (MissingVacant!9292 (index!39542 (_ BitVec 32))) )
))
(declare-fun lt!441293 () SeekEntryResult!9292)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996799 (= res!666907 (or (= lt!441293 (MissingVacant!9292 i!1194)) (= lt!441293 (MissingZero!9292 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63057 (_ BitVec 32)) SeekEntryResult!9292)

(assert (=> b!996799 (= lt!441293 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996800 () Bool)

(declare-fun res!666913 () Bool)

(assert (=> b!996800 (=> (not res!666913) (not e!562315))))

(assert (=> b!996800 (= res!666913 (and (= (size!30862 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30862 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30862 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996801 () Bool)

(declare-fun res!666909 () Bool)

(assert (=> b!996801 (=> (not res!666909) (not e!562313))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63057 (_ BitVec 32)) SeekEntryResult!9292)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996801 (= res!666909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30360 a!3219) j!170) mask!3464) (select (arr!30360 a!3219) j!170) a!3219 mask!3464) (Intermediate!9292 false resIndex!38 resX!38)))))

(assert (= (and start!86052 res!666908) b!996800))

(assert (= (and b!996800 res!666913) b!996795))

(assert (= (and b!996795 res!666906) b!996794))

(assert (= (and b!996794 res!666912) b!996798))

(assert (= (and b!996798 res!666911) b!996799))

(assert (= (and b!996799 res!666907) b!996796))

(assert (= (and b!996796 res!666915) b!996793))

(assert (= (and b!996793 res!666910) b!996797))

(assert (= (and b!996797 res!666914) b!996801))

(assert (= (and b!996801 res!666909) b!996792))

(declare-fun m!923827 () Bool)

(assert (=> b!996795 m!923827))

(assert (=> b!996795 m!923827))

(declare-fun m!923829 () Bool)

(assert (=> b!996795 m!923829))

(declare-fun m!923831 () Bool)

(assert (=> b!996793 m!923831))

(assert (=> b!996801 m!923827))

(assert (=> b!996801 m!923827))

(declare-fun m!923833 () Bool)

(assert (=> b!996801 m!923833))

(assert (=> b!996801 m!923833))

(assert (=> b!996801 m!923827))

(declare-fun m!923835 () Bool)

(assert (=> b!996801 m!923835))

(declare-fun m!923837 () Bool)

(assert (=> b!996794 m!923837))

(declare-fun m!923839 () Bool)

(assert (=> start!86052 m!923839))

(declare-fun m!923841 () Bool)

(assert (=> start!86052 m!923841))

(declare-fun m!923843 () Bool)

(assert (=> b!996796 m!923843))

(declare-fun m!923845 () Bool)

(assert (=> b!996799 m!923845))

(declare-fun m!923847 () Bool)

(assert (=> b!996798 m!923847))

(push 1)

(assert (not start!86052))

(assert (not b!996793))

(assert (not b!996798))

(assert (not b!996799))

(assert (not b!996801))

(assert (not b!996794))

(assert (not b!996796))

(assert (not b!996795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

