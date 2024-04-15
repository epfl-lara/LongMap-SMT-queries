; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86412 () Bool)

(assert start!86412)

(declare-fun res!669710 () Bool)

(declare-fun e!563722 () Bool)

(assert (=> start!86412 (=> (not res!669710) (not e!563722))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86412 (= res!669710 (validMask!0 mask!3464))))

(assert (=> start!86412 e!563722))

(declare-datatypes ((array!63160 0))(
  ( (array!63161 (arr!30405 (Array (_ BitVec 32) (_ BitVec 64))) (size!30909 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63160)

(declare-fun array_inv!23548 (array!63160) Bool)

(assert (=> start!86412 (array_inv!23548 a!3219)))

(assert (=> start!86412 true))

(declare-fun b!1000100 () Bool)

(declare-fun res!669707 () Bool)

(declare-fun e!563721 () Bool)

(assert (=> b!1000100 (=> (not res!669707) (not e!563721))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9362 0))(
  ( (MissingZero!9362 (index!39819 (_ BitVec 32))) (Found!9362 (index!39820 (_ BitVec 32))) (Intermediate!9362 (undefined!10174 Bool) (index!39821 (_ BitVec 32)) (x!87265 (_ BitVec 32))) (Undefined!9362) (MissingVacant!9362 (index!39822 (_ BitVec 32))) )
))
(declare-fun lt!442026 () SeekEntryResult!9362)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63160 (_ BitVec 32)) SeekEntryResult!9362)

(assert (=> b!1000100 (= res!669707 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30405 a!3219) j!170) a!3219 mask!3464) lt!442026))))

(declare-fun b!1000101 () Bool)

(declare-fun res!669705 () Bool)

(assert (=> b!1000101 (=> (not res!669705) (not e!563722))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000101 (= res!669705 (and (= (size!30909 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30909 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30909 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000102 () Bool)

(declare-fun res!669704 () Bool)

(declare-fun e!563720 () Bool)

(assert (=> b!1000102 (=> (not res!669704) (not e!563720))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000102 (= res!669704 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30909 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30909 a!3219))))))

(declare-fun b!1000103 () Bool)

(declare-fun res!669711 () Bool)

(assert (=> b!1000103 (=> (not res!669711) (not e!563721))))

(declare-fun lt!442027 () SeekEntryResult!9362)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000103 (= res!669711 (not (= lt!442027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30405 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30405 a!3219) i!1194 k0!2224) j!170) (array!63161 (store (arr!30405 a!3219) i!1194 k0!2224) (size!30909 a!3219)) mask!3464))))))

(declare-fun b!1000104 () Bool)

(assert (=> b!1000104 (= e!563722 e!563720)))

(declare-fun res!669709 () Bool)

(assert (=> b!1000104 (=> (not res!669709) (not e!563720))))

(declare-fun lt!442025 () SeekEntryResult!9362)

(assert (=> b!1000104 (= res!669709 (or (= lt!442025 (MissingVacant!9362 i!1194)) (= lt!442025 (MissingZero!9362 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63160 (_ BitVec 32)) SeekEntryResult!9362)

(assert (=> b!1000104 (= lt!442025 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000105 () Bool)

(declare-fun res!669703 () Bool)

(assert (=> b!1000105 (=> (not res!669703) (not e!563722))))

(declare-fun arrayContainsKey!0 (array!63160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000105 (= res!669703 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000106 () Bool)

(declare-fun res!669713 () Bool)

(assert (=> b!1000106 (=> (not res!669713) (not e!563722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000106 (= res!669713 (validKeyInArray!0 (select (arr!30405 a!3219) j!170)))))

(declare-fun b!1000107 () Bool)

(declare-fun res!669702 () Bool)

(assert (=> b!1000107 (=> (not res!669702) (not e!563720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63160 (_ BitVec 32)) Bool)

(assert (=> b!1000107 (= res!669702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000108 () Bool)

(declare-fun res!669712 () Bool)

(assert (=> b!1000108 (=> (not res!669712) (not e!563720))))

(declare-datatypes ((List!21147 0))(
  ( (Nil!21144) (Cons!21143 (h!22320 (_ BitVec 64)) (t!30139 List!21147)) )
))
(declare-fun arrayNoDuplicates!0 (array!63160 (_ BitVec 32) List!21147) Bool)

(assert (=> b!1000108 (= res!669712 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21144))))

(declare-fun b!1000109 () Bool)

(assert (=> b!1000109 (= e!563720 e!563721)))

(declare-fun res!669708 () Bool)

(assert (=> b!1000109 (=> (not res!669708) (not e!563721))))

(assert (=> b!1000109 (= res!669708 (= lt!442027 lt!442026))))

(assert (=> b!1000109 (= lt!442026 (Intermediate!9362 false resIndex!38 resX!38))))

(assert (=> b!1000109 (= lt!442027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30405 a!3219) j!170) mask!3464) (select (arr!30405 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000110 () Bool)

(assert (=> b!1000110 (= e!563721 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!1000111 () Bool)

(declare-fun res!669706 () Bool)

(assert (=> b!1000111 (=> (not res!669706) (not e!563722))))

(assert (=> b!1000111 (= res!669706 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86412 res!669710) b!1000101))

(assert (= (and b!1000101 res!669705) b!1000106))

(assert (= (and b!1000106 res!669713) b!1000111))

(assert (= (and b!1000111 res!669706) b!1000105))

(assert (= (and b!1000105 res!669703) b!1000104))

(assert (= (and b!1000104 res!669709) b!1000107))

(assert (= (and b!1000107 res!669702) b!1000108))

(assert (= (and b!1000108 res!669712) b!1000102))

(assert (= (and b!1000102 res!669704) b!1000109))

(assert (= (and b!1000109 res!669708) b!1000100))

(assert (= (and b!1000100 res!669707) b!1000103))

(assert (= (and b!1000103 res!669711) b!1000110))

(declare-fun m!925765 () Bool)

(assert (=> start!86412 m!925765))

(declare-fun m!925767 () Bool)

(assert (=> start!86412 m!925767))

(declare-fun m!925769 () Bool)

(assert (=> b!1000109 m!925769))

(assert (=> b!1000109 m!925769))

(declare-fun m!925771 () Bool)

(assert (=> b!1000109 m!925771))

(assert (=> b!1000109 m!925771))

(assert (=> b!1000109 m!925769))

(declare-fun m!925773 () Bool)

(assert (=> b!1000109 m!925773))

(declare-fun m!925775 () Bool)

(assert (=> b!1000104 m!925775))

(assert (=> b!1000100 m!925769))

(assert (=> b!1000100 m!925769))

(declare-fun m!925777 () Bool)

(assert (=> b!1000100 m!925777))

(assert (=> b!1000106 m!925769))

(assert (=> b!1000106 m!925769))

(declare-fun m!925779 () Bool)

(assert (=> b!1000106 m!925779))

(declare-fun m!925781 () Bool)

(assert (=> b!1000108 m!925781))

(declare-fun m!925783 () Bool)

(assert (=> b!1000107 m!925783))

(declare-fun m!925785 () Bool)

(assert (=> b!1000103 m!925785))

(declare-fun m!925787 () Bool)

(assert (=> b!1000103 m!925787))

(assert (=> b!1000103 m!925787))

(declare-fun m!925789 () Bool)

(assert (=> b!1000103 m!925789))

(assert (=> b!1000103 m!925789))

(assert (=> b!1000103 m!925787))

(declare-fun m!925791 () Bool)

(assert (=> b!1000103 m!925791))

(declare-fun m!925793 () Bool)

(assert (=> b!1000111 m!925793))

(declare-fun m!925795 () Bool)

(assert (=> b!1000105 m!925795))

(check-sat (not start!86412) (not b!1000104) (not b!1000108) (not b!1000103) (not b!1000111) (not b!1000109) (not b!1000107) (not b!1000106) (not b!1000100) (not b!1000105))
(check-sat)
