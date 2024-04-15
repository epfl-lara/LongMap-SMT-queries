; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86496 () Bool)

(assert start!86496)

(declare-fun b!1001827 () Bool)

(declare-fun res!671438 () Bool)

(declare-fun e!564434 () Bool)

(assert (=> b!1001827 (=> (not res!671438) (not e!564434))))

(declare-datatypes ((array!63244 0))(
  ( (array!63245 (arr!30447 (Array (_ BitVec 32) (_ BitVec 64))) (size!30951 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63244)

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9404 0))(
  ( (MissingZero!9404 (index!39987 (_ BitVec 32))) (Found!9404 (index!39988 (_ BitVec 32))) (Intermediate!9404 (undefined!10216 Bool) (index!39989 (_ BitVec 32)) (x!87419 (_ BitVec 32))) (Undefined!9404) (MissingVacant!9404 (index!39990 (_ BitVec 32))) )
))
(declare-fun lt!442751 () SeekEntryResult!9404)

(declare-fun lt!442749 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63244 (_ BitVec 32)) SeekEntryResult!9404)

(assert (=> b!1001827 (= res!671438 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442749 (select (arr!30447 a!3219) j!170) a!3219 mask!3464) lt!442751))))

(declare-fun b!1001828 () Bool)

(declare-fun res!671431 () Bool)

(declare-fun e!564428 () Bool)

(assert (=> b!1001828 (=> (not res!671431) (not e!564428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63244 (_ BitVec 32)) Bool)

(assert (=> b!1001828 (= res!671431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001829 () Bool)

(declare-fun e!564433 () Bool)

(assert (=> b!1001829 (= e!564433 e!564434)))

(declare-fun res!671430 () Bool)

(assert (=> b!1001829 (=> (not res!671430) (not e!564434))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001829 (= res!671430 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442749 #b00000000000000000000000000000000) (bvslt lt!442749 (size!30951 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001829 (= lt!442749 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001830 () Bool)

(declare-fun res!671429 () Bool)

(declare-fun e!564431 () Bool)

(assert (=> b!1001830 (=> (not res!671429) (not e!564431))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001830 (= res!671429 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001831 () Bool)

(declare-fun res!671444 () Bool)

(assert (=> b!1001831 (=> (not res!671444) (not e!564431))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001831 (= res!671444 (and (= (size!30951 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30951 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30951 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001832 () Bool)

(declare-fun res!671443 () Bool)

(assert (=> b!1001832 (=> (not res!671443) (not e!564428))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001832 (= res!671443 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30951 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30951 a!3219))))))

(declare-fun b!1001833 () Bool)

(declare-fun e!564430 () Bool)

(assert (=> b!1001833 (= e!564430 e!564433)))

(declare-fun res!671433 () Bool)

(assert (=> b!1001833 (=> (not res!671433) (not e!564433))))

(declare-fun lt!442746 () SeekEntryResult!9404)

(declare-fun lt!442753 () array!63244)

(declare-fun lt!442752 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001833 (= res!671433 (not (= lt!442746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442752 mask!3464) lt!442752 lt!442753 mask!3464))))))

(assert (=> b!1001833 (= lt!442752 (select (store (arr!30447 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001833 (= lt!442753 (array!63245 (store (arr!30447 a!3219) i!1194 k0!2224) (size!30951 a!3219)))))

(declare-fun res!671439 () Bool)

(assert (=> start!86496 (=> (not res!671439) (not e!564431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86496 (= res!671439 (validMask!0 mask!3464))))

(assert (=> start!86496 e!564431))

(declare-fun array_inv!23590 (array!63244) Bool)

(assert (=> start!86496 (array_inv!23590 a!3219)))

(assert (=> start!86496 true))

(declare-fun b!1001834 () Bool)

(assert (=> b!1001834 (= e!564434 false)))

(declare-fun lt!442750 () SeekEntryResult!9404)

(assert (=> b!1001834 (= lt!442750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442749 lt!442752 lt!442753 mask!3464))))

(declare-fun b!1001835 () Bool)

(declare-fun res!671441 () Bool)

(assert (=> b!1001835 (=> (not res!671441) (not e!564431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001835 (= res!671441 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001836 () Bool)

(declare-fun e!564429 () Bool)

(assert (=> b!1001836 (= e!564428 e!564429)))

(declare-fun res!671434 () Bool)

(assert (=> b!1001836 (=> (not res!671434) (not e!564429))))

(assert (=> b!1001836 (= res!671434 (= lt!442746 lt!442751))))

(assert (=> b!1001836 (= lt!442751 (Intermediate!9404 false resIndex!38 resX!38))))

(assert (=> b!1001836 (= lt!442746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30447 a!3219) j!170) mask!3464) (select (arr!30447 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001837 () Bool)

(declare-fun res!671432 () Bool)

(assert (=> b!1001837 (=> (not res!671432) (not e!564431))))

(assert (=> b!1001837 (= res!671432 (validKeyInArray!0 (select (arr!30447 a!3219) j!170)))))

(declare-fun b!1001838 () Bool)

(declare-fun res!671442 () Bool)

(assert (=> b!1001838 (=> (not res!671442) (not e!564433))))

(declare-fun lt!442747 () SeekEntryResult!9404)

(assert (=> b!1001838 (= res!671442 (not (= lt!442747 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442752 lt!442753 mask!3464))))))

(declare-fun b!1001839 () Bool)

(assert (=> b!1001839 (= e!564429 e!564430)))

(declare-fun res!671435 () Bool)

(assert (=> b!1001839 (=> (not res!671435) (not e!564430))))

(assert (=> b!1001839 (= res!671435 (= lt!442747 lt!442751))))

(assert (=> b!1001839 (= lt!442747 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30447 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001840 () Bool)

(declare-fun res!671436 () Bool)

(assert (=> b!1001840 (=> (not res!671436) (not e!564428))))

(declare-datatypes ((List!21189 0))(
  ( (Nil!21186) (Cons!21185 (h!22362 (_ BitVec 64)) (t!30181 List!21189)) )
))
(declare-fun arrayNoDuplicates!0 (array!63244 (_ BitVec 32) List!21189) Bool)

(assert (=> b!1001840 (= res!671436 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21186))))

(declare-fun b!1001841 () Bool)

(declare-fun res!671440 () Bool)

(assert (=> b!1001841 (=> (not res!671440) (not e!564433))))

(assert (=> b!1001841 (= res!671440 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001842 () Bool)

(assert (=> b!1001842 (= e!564431 e!564428)))

(declare-fun res!671437 () Bool)

(assert (=> b!1001842 (=> (not res!671437) (not e!564428))))

(declare-fun lt!442748 () SeekEntryResult!9404)

(assert (=> b!1001842 (= res!671437 (or (= lt!442748 (MissingVacant!9404 i!1194)) (= lt!442748 (MissingZero!9404 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63244 (_ BitVec 32)) SeekEntryResult!9404)

(assert (=> b!1001842 (= lt!442748 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86496 res!671439) b!1001831))

(assert (= (and b!1001831 res!671444) b!1001837))

(assert (= (and b!1001837 res!671432) b!1001835))

(assert (= (and b!1001835 res!671441) b!1001830))

(assert (= (and b!1001830 res!671429) b!1001842))

(assert (= (and b!1001842 res!671437) b!1001828))

(assert (= (and b!1001828 res!671431) b!1001840))

(assert (= (and b!1001840 res!671436) b!1001832))

(assert (= (and b!1001832 res!671443) b!1001836))

(assert (= (and b!1001836 res!671434) b!1001839))

(assert (= (and b!1001839 res!671435) b!1001833))

(assert (= (and b!1001833 res!671433) b!1001838))

(assert (= (and b!1001838 res!671442) b!1001841))

(assert (= (and b!1001841 res!671440) b!1001829))

(assert (= (and b!1001829 res!671430) b!1001827))

(assert (= (and b!1001827 res!671438) b!1001834))

(declare-fun m!927259 () Bool)

(assert (=> b!1001833 m!927259))

(assert (=> b!1001833 m!927259))

(declare-fun m!927261 () Bool)

(assert (=> b!1001833 m!927261))

(declare-fun m!927263 () Bool)

(assert (=> b!1001833 m!927263))

(declare-fun m!927265 () Bool)

(assert (=> b!1001833 m!927265))

(declare-fun m!927267 () Bool)

(assert (=> b!1001840 m!927267))

(declare-fun m!927269 () Bool)

(assert (=> b!1001839 m!927269))

(assert (=> b!1001839 m!927269))

(declare-fun m!927271 () Bool)

(assert (=> b!1001839 m!927271))

(declare-fun m!927273 () Bool)

(assert (=> b!1001842 m!927273))

(assert (=> b!1001827 m!927269))

(assert (=> b!1001827 m!927269))

(declare-fun m!927275 () Bool)

(assert (=> b!1001827 m!927275))

(declare-fun m!927277 () Bool)

(assert (=> b!1001835 m!927277))

(declare-fun m!927279 () Bool)

(assert (=> b!1001830 m!927279))

(declare-fun m!927281 () Bool)

(assert (=> start!86496 m!927281))

(declare-fun m!927283 () Bool)

(assert (=> start!86496 m!927283))

(declare-fun m!927285 () Bool)

(assert (=> b!1001834 m!927285))

(declare-fun m!927287 () Bool)

(assert (=> b!1001828 m!927287))

(assert (=> b!1001837 m!927269))

(assert (=> b!1001837 m!927269))

(declare-fun m!927289 () Bool)

(assert (=> b!1001837 m!927289))

(assert (=> b!1001836 m!927269))

(assert (=> b!1001836 m!927269))

(declare-fun m!927291 () Bool)

(assert (=> b!1001836 m!927291))

(assert (=> b!1001836 m!927291))

(assert (=> b!1001836 m!927269))

(declare-fun m!927293 () Bool)

(assert (=> b!1001836 m!927293))

(declare-fun m!927295 () Bool)

(assert (=> b!1001829 m!927295))

(declare-fun m!927297 () Bool)

(assert (=> b!1001838 m!927297))

(check-sat (not start!86496) (not b!1001838) (not b!1001840) (not b!1001830) (not b!1001842) (not b!1001833) (not b!1001836) (not b!1001834) (not b!1001835) (not b!1001837) (not b!1001839) (not b!1001829) (not b!1001827) (not b!1001828))
(check-sat)
