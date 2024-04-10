; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86396 () Bool)

(assert start!86396)

(declare-fun b!999904 () Bool)

(declare-fun res!669389 () Bool)

(declare-fun e!563709 () Bool)

(assert (=> b!999904 (=> (not res!669389) (not e!563709))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999904 (= res!669389 (validKeyInArray!0 k!2224))))

(declare-fun b!999905 () Bool)

(declare-fun res!669386 () Bool)

(declare-fun e!563708 () Bool)

(assert (=> b!999905 (=> (not res!669386) (not e!563708))))

(declare-datatypes ((array!63197 0))(
  ( (array!63198 (arr!30424 (Array (_ BitVec 32) (_ BitVec 64))) (size!30926 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63197)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9356 0))(
  ( (MissingZero!9356 (index!39795 (_ BitVec 32))) (Found!9356 (index!39796 (_ BitVec 32))) (Intermediate!9356 (undefined!10168 Bool) (index!39797 (_ BitVec 32)) (x!87232 (_ BitVec 32))) (Undefined!9356) (MissingVacant!9356 (index!39798 (_ BitVec 32))) )
))
(declare-fun lt!442150 () SeekEntryResult!9356)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63197 (_ BitVec 32)) SeekEntryResult!9356)

(assert (=> b!999905 (= res!669386 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30424 a!3219) j!170) a!3219 mask!3464) lt!442150))))

(declare-fun b!999906 () Bool)

(declare-fun res!669384 () Bool)

(assert (=> b!999906 (=> (not res!669384) (not e!563709))))

(assert (=> b!999906 (= res!669384 (validKeyInArray!0 (select (arr!30424 a!3219) j!170)))))

(declare-fun b!999907 () Bool)

(declare-fun res!669383 () Bool)

(assert (=> b!999907 (=> (not res!669383) (not e!563709))))

(declare-fun arrayContainsKey!0 (array!63197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999907 (= res!669383 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!669387 () Bool)

(assert (=> start!86396 (=> (not res!669387) (not e!563709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86396 (= res!669387 (validMask!0 mask!3464))))

(assert (=> start!86396 e!563709))

(declare-fun array_inv!23548 (array!63197) Bool)

(assert (=> start!86396 (array_inv!23548 a!3219)))

(assert (=> start!86396 true))

(declare-fun b!999908 () Bool)

(declare-fun e!563707 () Bool)

(assert (=> b!999908 (= e!563709 e!563707)))

(declare-fun res!669390 () Bool)

(assert (=> b!999908 (=> (not res!669390) (not e!563707))))

(declare-fun lt!442151 () SeekEntryResult!9356)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999908 (= res!669390 (or (= lt!442151 (MissingVacant!9356 i!1194)) (= lt!442151 (MissingZero!9356 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63197 (_ BitVec 32)) SeekEntryResult!9356)

(assert (=> b!999908 (= lt!442151 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999909 () Bool)

(assert (=> b!999909 (= e!563708 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!999910 () Bool)

(declare-fun res!669392 () Bool)

(assert (=> b!999910 (=> (not res!669392) (not e!563708))))

(declare-fun lt!442149 () SeekEntryResult!9356)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999910 (= res!669392 (not (= lt!442149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30424 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30424 a!3219) i!1194 k!2224) j!170) (array!63198 (store (arr!30424 a!3219) i!1194 k!2224) (size!30926 a!3219)) mask!3464))))))

(declare-fun b!999911 () Bool)

(declare-fun res!669382 () Bool)

(assert (=> b!999911 (=> (not res!669382) (not e!563707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63197 (_ BitVec 32)) Bool)

(assert (=> b!999911 (= res!669382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999912 () Bool)

(declare-fun res!669391 () Bool)

(assert (=> b!999912 (=> (not res!669391) (not e!563707))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999912 (= res!669391 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30926 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30926 a!3219))))))

(declare-fun b!999913 () Bool)

(declare-fun res!669385 () Bool)

(assert (=> b!999913 (=> (not res!669385) (not e!563709))))

(assert (=> b!999913 (= res!669385 (and (= (size!30926 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30926 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30926 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999914 () Bool)

(declare-fun res!669393 () Bool)

(assert (=> b!999914 (=> (not res!669393) (not e!563707))))

(declare-datatypes ((List!21100 0))(
  ( (Nil!21097) (Cons!21096 (h!22273 (_ BitVec 64)) (t!30101 List!21100)) )
))
(declare-fun arrayNoDuplicates!0 (array!63197 (_ BitVec 32) List!21100) Bool)

(assert (=> b!999914 (= res!669393 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21097))))

(declare-fun b!999915 () Bool)

(assert (=> b!999915 (= e!563707 e!563708)))

(declare-fun res!669388 () Bool)

(assert (=> b!999915 (=> (not res!669388) (not e!563708))))

(assert (=> b!999915 (= res!669388 (= lt!442149 lt!442150))))

(assert (=> b!999915 (= lt!442150 (Intermediate!9356 false resIndex!38 resX!38))))

(assert (=> b!999915 (= lt!442149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30424 a!3219) j!170) mask!3464) (select (arr!30424 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86396 res!669387) b!999913))

(assert (= (and b!999913 res!669385) b!999906))

(assert (= (and b!999906 res!669384) b!999904))

(assert (= (and b!999904 res!669389) b!999907))

(assert (= (and b!999907 res!669383) b!999908))

(assert (= (and b!999908 res!669390) b!999911))

(assert (= (and b!999911 res!669382) b!999914))

(assert (= (and b!999914 res!669393) b!999912))

(assert (= (and b!999912 res!669391) b!999915))

(assert (= (and b!999915 res!669388) b!999905))

(assert (= (and b!999905 res!669386) b!999910))

(assert (= (and b!999910 res!669392) b!999909))

(declare-fun m!926111 () Bool)

(assert (=> b!999906 m!926111))

(assert (=> b!999906 m!926111))

(declare-fun m!926113 () Bool)

(assert (=> b!999906 m!926113))

(assert (=> b!999915 m!926111))

(assert (=> b!999915 m!926111))

(declare-fun m!926115 () Bool)

(assert (=> b!999915 m!926115))

(assert (=> b!999915 m!926115))

(assert (=> b!999915 m!926111))

(declare-fun m!926117 () Bool)

(assert (=> b!999915 m!926117))

(declare-fun m!926119 () Bool)

(assert (=> b!999914 m!926119))

(declare-fun m!926121 () Bool)

(assert (=> b!999910 m!926121))

(declare-fun m!926123 () Bool)

(assert (=> b!999910 m!926123))

(assert (=> b!999910 m!926123))

(declare-fun m!926125 () Bool)

(assert (=> b!999910 m!926125))

(assert (=> b!999910 m!926125))

(assert (=> b!999910 m!926123))

(declare-fun m!926127 () Bool)

(assert (=> b!999910 m!926127))

(declare-fun m!926129 () Bool)

(assert (=> start!86396 m!926129))

(declare-fun m!926131 () Bool)

(assert (=> start!86396 m!926131))

(declare-fun m!926133 () Bool)

(assert (=> b!999908 m!926133))

(declare-fun m!926135 () Bool)

(assert (=> b!999904 m!926135))

(declare-fun m!926137 () Bool)

(assert (=> b!999911 m!926137))

(assert (=> b!999905 m!926111))

(assert (=> b!999905 m!926111))

(declare-fun m!926139 () Bool)

(assert (=> b!999905 m!926139))

(declare-fun m!926141 () Bool)

(assert (=> b!999907 m!926141))

(push 1)

(assert (not b!999905))

(assert (not b!999914))

(assert (not b!999910))

(assert (not b!999904))

(assert (not start!86396))

(assert (not b!999906))

(assert (not b!999907))

(assert (not b!999911))

(assert (not b!999908))

(assert (not b!999915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

