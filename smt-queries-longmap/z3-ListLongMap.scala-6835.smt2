; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86050 () Bool)

(assert start!86050)

(declare-fun b!996762 () Bool)

(declare-fun res!666882 () Bool)

(declare-fun e!562305 () Bool)

(assert (=> b!996762 (=> (not res!666882) (not e!562305))))

(declare-datatypes ((array!63055 0))(
  ( (array!63056 (arr!30359 (Array (_ BitVec 32) (_ BitVec 64))) (size!30861 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63055)

(declare-datatypes ((List!21035 0))(
  ( (Nil!21032) (Cons!21031 (h!22196 (_ BitVec 64)) (t!30036 List!21035)) )
))
(declare-fun arrayNoDuplicates!0 (array!63055 (_ BitVec 32) List!21035) Bool)

(assert (=> b!996762 (= res!666882 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21032))))

(declare-fun b!996763 () Bool)

(declare-fun res!666883 () Bool)

(assert (=> b!996763 (=> (not res!666883) (not e!562305))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63055 (_ BitVec 32)) Bool)

(assert (=> b!996763 (= res!666883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996764 () Bool)

(declare-fun res!666881 () Bool)

(declare-fun e!562304 () Bool)

(assert (=> b!996764 (=> (not res!666881) (not e!562304))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996764 (= res!666881 (validKeyInArray!0 k0!2224))))

(declare-fun b!996765 () Bool)

(declare-fun res!666879 () Bool)

(assert (=> b!996765 (=> (not res!666879) (not e!562305))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9291 0))(
  ( (MissingZero!9291 (index!39535 (_ BitVec 32))) (Found!9291 (index!39536 (_ BitVec 32))) (Intermediate!9291 (undefined!10103 Bool) (index!39537 (_ BitVec 32)) (x!86967 (_ BitVec 32))) (Undefined!9291) (MissingVacant!9291 (index!39538 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63055 (_ BitVec 32)) SeekEntryResult!9291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996765 (= res!666879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30359 a!3219) j!170) mask!3464) (select (arr!30359 a!3219) j!170) a!3219 mask!3464) (Intermediate!9291 false resIndex!38 resX!38)))))

(declare-fun res!666880 () Bool)

(assert (=> start!86050 (=> (not res!666880) (not e!562304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86050 (= res!666880 (validMask!0 mask!3464))))

(assert (=> start!86050 e!562304))

(declare-fun array_inv!23483 (array!63055) Bool)

(assert (=> start!86050 (array_inv!23483 a!3219)))

(assert (=> start!86050 true))

(declare-fun b!996766 () Bool)

(declare-fun res!666884 () Bool)

(assert (=> b!996766 (=> (not res!666884) (not e!562304))))

(declare-fun arrayContainsKey!0 (array!63055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996766 (= res!666884 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996767 () Bool)

(declare-fun res!666885 () Bool)

(assert (=> b!996767 (=> (not res!666885) (not e!562304))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996767 (= res!666885 (and (= (size!30861 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30861 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30861 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996768 () Bool)

(declare-fun res!666878 () Bool)

(assert (=> b!996768 (=> (not res!666878) (not e!562305))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996768 (= res!666878 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30861 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30861 a!3219))))))

(declare-fun b!996769 () Bool)

(assert (=> b!996769 (= e!562304 e!562305)))

(declare-fun res!666877 () Bool)

(assert (=> b!996769 (=> (not res!666877) (not e!562305))))

(declare-fun lt!441290 () SeekEntryResult!9291)

(assert (=> b!996769 (= res!666877 (or (= lt!441290 (MissingVacant!9291 i!1194)) (= lt!441290 (MissingZero!9291 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63055 (_ BitVec 32)) SeekEntryResult!9291)

(assert (=> b!996769 (= lt!441290 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996770 () Bool)

(declare-fun res!666876 () Bool)

(assert (=> b!996770 (=> (not res!666876) (not e!562304))))

(assert (=> b!996770 (= res!666876 (validKeyInArray!0 (select (arr!30359 a!3219) j!170)))))

(declare-fun b!996771 () Bool)

(assert (=> b!996771 (= e!562305 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(assert (= (and start!86050 res!666880) b!996767))

(assert (= (and b!996767 res!666885) b!996770))

(assert (= (and b!996770 res!666876) b!996764))

(assert (= (and b!996764 res!666881) b!996766))

(assert (= (and b!996766 res!666884) b!996769))

(assert (= (and b!996769 res!666877) b!996763))

(assert (= (and b!996763 res!666883) b!996762))

(assert (= (and b!996762 res!666882) b!996768))

(assert (= (and b!996768 res!666878) b!996765))

(assert (= (and b!996765 res!666879) b!996771))

(declare-fun m!923805 () Bool)

(assert (=> b!996770 m!923805))

(assert (=> b!996770 m!923805))

(declare-fun m!923807 () Bool)

(assert (=> b!996770 m!923807))

(declare-fun m!923809 () Bool)

(assert (=> b!996764 m!923809))

(declare-fun m!923811 () Bool)

(assert (=> b!996766 m!923811))

(declare-fun m!923813 () Bool)

(assert (=> b!996762 m!923813))

(declare-fun m!923815 () Bool)

(assert (=> b!996769 m!923815))

(declare-fun m!923817 () Bool)

(assert (=> b!996763 m!923817))

(declare-fun m!923819 () Bool)

(assert (=> start!86050 m!923819))

(declare-fun m!923821 () Bool)

(assert (=> start!86050 m!923821))

(assert (=> b!996765 m!923805))

(assert (=> b!996765 m!923805))

(declare-fun m!923823 () Bool)

(assert (=> b!996765 m!923823))

(assert (=> b!996765 m!923823))

(assert (=> b!996765 m!923805))

(declare-fun m!923825 () Bool)

(assert (=> b!996765 m!923825))

(check-sat (not b!996764) (not b!996766) (not b!996763) (not b!996762) (not b!996769) (not b!996765) (not start!86050) (not b!996770))
(check-sat)
