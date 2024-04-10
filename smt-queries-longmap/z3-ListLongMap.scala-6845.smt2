; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86218 () Bool)

(assert start!86218)

(declare-fun b!998211 () Bool)

(declare-fun e!562947 () Bool)

(assert (=> b!998211 (= e!562947 false)))

(declare-datatypes ((array!63121 0))(
  ( (array!63122 (arr!30389 (Array (_ BitVec 32) (_ BitVec 64))) (size!30891 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63121)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9321 0))(
  ( (MissingZero!9321 (index!39655 (_ BitVec 32))) (Found!9321 (index!39656 (_ BitVec 32))) (Intermediate!9321 (undefined!10133 Bool) (index!39657 (_ BitVec 32)) (x!87089 (_ BitVec 32))) (Undefined!9321) (MissingVacant!9321 (index!39658 (_ BitVec 32))) )
))
(declare-fun lt!441659 () SeekEntryResult!9321)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63121 (_ BitVec 32)) SeekEntryResult!9321)

(assert (=> b!998211 (= lt!441659 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30389 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998212 () Bool)

(declare-fun res!668014 () Bool)

(declare-fun e!562948 () Bool)

(assert (=> b!998212 (=> (not res!668014) (not e!562948))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998212 (= res!668014 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998213 () Bool)

(declare-fun res!668009 () Bool)

(assert (=> b!998213 (=> (not res!668009) (not e!562948))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998213 (= res!668009 (and (= (size!30891 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30891 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30891 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998214 () Bool)

(declare-fun res!668016 () Bool)

(assert (=> b!998214 (=> (not res!668016) (not e!562948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998214 (= res!668016 (validKeyInArray!0 k0!2224))))

(declare-fun b!998215 () Bool)

(declare-fun res!668010 () Bool)

(assert (=> b!998215 (=> (not res!668010) (not e!562947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63121 (_ BitVec 32)) Bool)

(assert (=> b!998215 (= res!668010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998216 () Bool)

(declare-fun res!668012 () Bool)

(assert (=> b!998216 (=> (not res!668012) (not e!562947))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998216 (= res!668012 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30891 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30891 a!3219))))))

(declare-fun b!998217 () Bool)

(declare-fun res!668011 () Bool)

(assert (=> b!998217 (=> (not res!668011) (not e!562948))))

(assert (=> b!998217 (= res!668011 (validKeyInArray!0 (select (arr!30389 a!3219) j!170)))))

(declare-fun b!998218 () Bool)

(declare-fun res!668008 () Bool)

(assert (=> b!998218 (=> (not res!668008) (not e!562947))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998218 (= res!668008 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30389 a!3219) j!170) mask!3464) (select (arr!30389 a!3219) j!170) a!3219 mask!3464) (Intermediate!9321 false resIndex!38 resX!38)))))

(declare-fun res!668015 () Bool)

(assert (=> start!86218 (=> (not res!668015) (not e!562948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86218 (= res!668015 (validMask!0 mask!3464))))

(assert (=> start!86218 e!562948))

(declare-fun array_inv!23513 (array!63121) Bool)

(assert (=> start!86218 (array_inv!23513 a!3219)))

(assert (=> start!86218 true))

(declare-fun b!998219 () Bool)

(declare-fun res!668007 () Bool)

(assert (=> b!998219 (=> (not res!668007) (not e!562947))))

(declare-datatypes ((List!21065 0))(
  ( (Nil!21062) (Cons!21061 (h!22232 (_ BitVec 64)) (t!30066 List!21065)) )
))
(declare-fun arrayNoDuplicates!0 (array!63121 (_ BitVec 32) List!21065) Bool)

(assert (=> b!998219 (= res!668007 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21062))))

(declare-fun b!998220 () Bool)

(assert (=> b!998220 (= e!562948 e!562947)))

(declare-fun res!668013 () Bool)

(assert (=> b!998220 (=> (not res!668013) (not e!562947))))

(declare-fun lt!441658 () SeekEntryResult!9321)

(assert (=> b!998220 (= res!668013 (or (= lt!441658 (MissingVacant!9321 i!1194)) (= lt!441658 (MissingZero!9321 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63121 (_ BitVec 32)) SeekEntryResult!9321)

(assert (=> b!998220 (= lt!441658 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86218 res!668015) b!998213))

(assert (= (and b!998213 res!668009) b!998217))

(assert (= (and b!998217 res!668011) b!998214))

(assert (= (and b!998214 res!668016) b!998212))

(assert (= (and b!998212 res!668014) b!998220))

(assert (= (and b!998220 res!668013) b!998215))

(assert (= (and b!998215 res!668010) b!998219))

(assert (= (and b!998219 res!668007) b!998216))

(assert (= (and b!998216 res!668012) b!998218))

(assert (= (and b!998218 res!668008) b!998211))

(declare-fun m!924797 () Bool)

(assert (=> b!998219 m!924797))

(declare-fun m!924799 () Bool)

(assert (=> b!998220 m!924799))

(declare-fun m!924801 () Bool)

(assert (=> b!998214 m!924801))

(declare-fun m!924803 () Bool)

(assert (=> b!998215 m!924803))

(declare-fun m!924805 () Bool)

(assert (=> start!86218 m!924805))

(declare-fun m!924807 () Bool)

(assert (=> start!86218 m!924807))

(declare-fun m!924809 () Bool)

(assert (=> b!998217 m!924809))

(assert (=> b!998217 m!924809))

(declare-fun m!924811 () Bool)

(assert (=> b!998217 m!924811))

(assert (=> b!998211 m!924809))

(assert (=> b!998211 m!924809))

(declare-fun m!924813 () Bool)

(assert (=> b!998211 m!924813))

(assert (=> b!998218 m!924809))

(assert (=> b!998218 m!924809))

(declare-fun m!924815 () Bool)

(assert (=> b!998218 m!924815))

(assert (=> b!998218 m!924815))

(assert (=> b!998218 m!924809))

(declare-fun m!924817 () Bool)

(assert (=> b!998218 m!924817))

(declare-fun m!924819 () Bool)

(assert (=> b!998212 m!924819))

(check-sat (not start!86218) (not b!998219) (not b!998218) (not b!998217) (not b!998220) (not b!998215) (not b!998212) (not b!998211) (not b!998214))
(check-sat)
