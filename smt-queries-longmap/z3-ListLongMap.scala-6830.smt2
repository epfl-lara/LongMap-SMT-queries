; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86194 () Bool)

(assert start!86194)

(declare-fun b!997247 () Bool)

(declare-fun res!666796 () Bool)

(declare-fun e!562766 () Bool)

(assert (=> b!997247 (=> (not res!666796) (not e!562766))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997247 (= res!666796 (validKeyInArray!0 k0!2224))))

(declare-fun b!997248 () Bool)

(declare-fun res!666803 () Bool)

(assert (=> b!997248 (=> (not res!666803) (not e!562766))))

(declare-datatypes ((array!63069 0))(
  ( (array!63070 (arr!30361 (Array (_ BitVec 32) (_ BitVec 64))) (size!30864 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63069)

(declare-fun arrayContainsKey!0 (array!63069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997248 (= res!666803 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997249 () Bool)

(declare-fun res!666798 () Bool)

(assert (=> b!997249 (=> (not res!666798) (not e!562766))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997249 (= res!666798 (and (= (size!30864 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30864 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30864 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997250 () Bool)

(declare-fun res!666799 () Bool)

(assert (=> b!997250 (=> (not res!666799) (not e!562766))))

(assert (=> b!997250 (= res!666799 (validKeyInArray!0 (select (arr!30361 a!3219) j!170)))))

(declare-fun b!997251 () Bool)

(declare-fun e!562767 () Bool)

(assert (=> b!997251 (= e!562767 false)))

(declare-fun lt!441574 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997251 (= lt!441574 (toIndex!0 (select (arr!30361 a!3219) j!170) mask!3464))))

(declare-fun b!997252 () Bool)

(declare-fun res!666800 () Bool)

(assert (=> b!997252 (=> (not res!666800) (not e!562767))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997252 (= res!666800 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30864 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30864 a!3219))))))

(declare-fun b!997253 () Bool)

(declare-fun res!666802 () Bool)

(assert (=> b!997253 (=> (not res!666802) (not e!562767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63069 (_ BitVec 32)) Bool)

(assert (=> b!997253 (= res!666802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!666797 () Bool)

(assert (=> start!86194 (=> (not res!666797) (not e!562766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86194 (= res!666797 (validMask!0 mask!3464))))

(assert (=> start!86194 e!562766))

(declare-fun array_inv!23497 (array!63069) Bool)

(assert (=> start!86194 (array_inv!23497 a!3219)))

(assert (=> start!86194 true))

(declare-fun b!997254 () Bool)

(assert (=> b!997254 (= e!562766 e!562767)))

(declare-fun res!666795 () Bool)

(assert (=> b!997254 (=> (not res!666795) (not e!562767))))

(declare-datatypes ((SeekEntryResult!9229 0))(
  ( (MissingZero!9229 (index!39287 (_ BitVec 32))) (Found!9229 (index!39288 (_ BitVec 32))) (Intermediate!9229 (undefined!10041 Bool) (index!39289 (_ BitVec 32)) (x!86879 (_ BitVec 32))) (Undefined!9229) (MissingVacant!9229 (index!39290 (_ BitVec 32))) )
))
(declare-fun lt!441575 () SeekEntryResult!9229)

(assert (=> b!997254 (= res!666795 (or (= lt!441575 (MissingVacant!9229 i!1194)) (= lt!441575 (MissingZero!9229 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63069 (_ BitVec 32)) SeekEntryResult!9229)

(assert (=> b!997254 (= lt!441575 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997255 () Bool)

(declare-fun res!666801 () Bool)

(assert (=> b!997255 (=> (not res!666801) (not e!562767))))

(declare-datatypes ((List!21008 0))(
  ( (Nil!21005) (Cons!21004 (h!22175 (_ BitVec 64)) (t!30001 List!21008)) )
))
(declare-fun arrayNoDuplicates!0 (array!63069 (_ BitVec 32) List!21008) Bool)

(assert (=> b!997255 (= res!666801 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21005))))

(assert (= (and start!86194 res!666797) b!997249))

(assert (= (and b!997249 res!666798) b!997250))

(assert (= (and b!997250 res!666799) b!997247))

(assert (= (and b!997247 res!666796) b!997248))

(assert (= (and b!997248 res!666803) b!997254))

(assert (= (and b!997254 res!666795) b!997253))

(assert (= (and b!997253 res!666802) b!997255))

(assert (= (and b!997255 res!666801) b!997252))

(assert (= (and b!997252 res!666800) b!997251))

(declare-fun m!924803 () Bool)

(assert (=> b!997247 m!924803))

(declare-fun m!924805 () Bool)

(assert (=> b!997248 m!924805))

(declare-fun m!924807 () Bool)

(assert (=> start!86194 m!924807))

(declare-fun m!924809 () Bool)

(assert (=> start!86194 m!924809))

(declare-fun m!924811 () Bool)

(assert (=> b!997251 m!924811))

(assert (=> b!997251 m!924811))

(declare-fun m!924813 () Bool)

(assert (=> b!997251 m!924813))

(declare-fun m!924815 () Bool)

(assert (=> b!997254 m!924815))

(assert (=> b!997250 m!924811))

(assert (=> b!997250 m!924811))

(declare-fun m!924817 () Bool)

(assert (=> b!997250 m!924817))

(declare-fun m!924819 () Bool)

(assert (=> b!997253 m!924819))

(declare-fun m!924821 () Bool)

(assert (=> b!997255 m!924821))

(check-sat (not b!997255) (not b!997248) (not b!997247) (not start!86194) (not b!997254) (not b!997250) (not b!997251) (not b!997253))
(check-sat)
