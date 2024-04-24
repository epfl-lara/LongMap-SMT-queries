; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86716 () Bool)

(assert start!86716)

(declare-fun b!1002859 () Bool)

(declare-fun res!671577 () Bool)

(declare-fun e!565175 () Bool)

(assert (=> b!1002859 (=> (not res!671577) (not e!565175))))

(declare-datatypes ((array!63336 0))(
  ( (array!63337 (arr!30487 (Array (_ BitVec 32) (_ BitVec 64))) (size!30990 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63336)

(declare-fun lt!443247 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9355 0))(
  ( (MissingZero!9355 (index!39791 (_ BitVec 32))) (Found!9355 (index!39792 (_ BitVec 32))) (Intermediate!9355 (undefined!10167 Bool) (index!39793 (_ BitVec 32)) (x!87371 (_ BitVec 32))) (Undefined!9355) (MissingVacant!9355 (index!39794 (_ BitVec 32))) )
))
(declare-fun lt!443244 () SeekEntryResult!9355)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63336 (_ BitVec 32)) SeekEntryResult!9355)

(assert (=> b!1002859 (= res!671577 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443247 (select (arr!30487 a!3219) j!170) a!3219 mask!3464) lt!443244))))

(declare-fun b!1002860 () Bool)

(declare-fun res!671578 () Bool)

(declare-fun e!565174 () Bool)

(assert (=> b!1002860 (=> (not res!671578) (not e!565174))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002860 (= res!671578 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30990 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30990 a!3219))))))

(declare-fun b!1002861 () Bool)

(declare-fun res!671579 () Bool)

(declare-fun e!565179 () Bool)

(assert (=> b!1002861 (=> (not res!671579) (not e!565179))))

(declare-fun lt!443249 () SeekEntryResult!9355)

(declare-fun lt!443243 () (_ BitVec 64))

(declare-fun lt!443245 () array!63336)

(assert (=> b!1002861 (= res!671579 (not (= lt!443249 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443243 lt!443245 mask!3464))))))

(declare-fun b!1002862 () Bool)

(declare-fun res!671584 () Bool)

(assert (=> b!1002862 (=> (not res!671584) (not e!565174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63336 (_ BitVec 32)) Bool)

(assert (=> b!1002862 (= res!671584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002863 () Bool)

(declare-fun e!565173 () Bool)

(declare-fun e!565178 () Bool)

(assert (=> b!1002863 (= e!565173 e!565178)))

(declare-fun res!671582 () Bool)

(assert (=> b!1002863 (=> (not res!671582) (not e!565178))))

(assert (=> b!1002863 (= res!671582 (= lt!443249 lt!443244))))

(assert (=> b!1002863 (= lt!443249 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30487 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002864 () Bool)

(declare-fun res!671583 () Bool)

(declare-fun e!565177 () Bool)

(assert (=> b!1002864 (=> (not res!671583) (not e!565177))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002864 (= res!671583 (validKeyInArray!0 k0!2224))))

(declare-fun res!671580 () Bool)

(assert (=> start!86716 (=> (not res!671580) (not e!565177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86716 (= res!671580 (validMask!0 mask!3464))))

(assert (=> start!86716 e!565177))

(declare-fun array_inv!23623 (array!63336) Bool)

(assert (=> start!86716 (array_inv!23623 a!3219)))

(assert (=> start!86716 true))

(declare-fun b!1002865 () Bool)

(declare-fun res!671585 () Bool)

(assert (=> b!1002865 (=> (not res!671585) (not e!565177))))

(assert (=> b!1002865 (= res!671585 (validKeyInArray!0 (select (arr!30487 a!3219) j!170)))))

(declare-fun b!1002866 () Bool)

(assert (=> b!1002866 (= e!565174 e!565173)))

(declare-fun res!671591 () Bool)

(assert (=> b!1002866 (=> (not res!671591) (not e!565173))))

(declare-fun lt!443246 () SeekEntryResult!9355)

(assert (=> b!1002866 (= res!671591 (= lt!443246 lt!443244))))

(assert (=> b!1002866 (= lt!443244 (Intermediate!9355 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002866 (= lt!443246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30487 a!3219) j!170) mask!3464) (select (arr!30487 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002867 () Bool)

(assert (=> b!1002867 (= e!565178 e!565179)))

(declare-fun res!671587 () Bool)

(assert (=> b!1002867 (=> (not res!671587) (not e!565179))))

(assert (=> b!1002867 (= res!671587 (not (= lt!443246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443243 mask!3464) lt!443243 lt!443245 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002867 (= lt!443243 (select (store (arr!30487 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002867 (= lt!443245 (array!63337 (store (arr!30487 a!3219) i!1194 k0!2224) (size!30990 a!3219)))))

(declare-fun b!1002868 () Bool)

(declare-fun res!671586 () Bool)

(assert (=> b!1002868 (=> (not res!671586) (not e!565174))))

(declare-datatypes ((List!21134 0))(
  ( (Nil!21131) (Cons!21130 (h!22316 (_ BitVec 64)) (t!30127 List!21134)) )
))
(declare-fun arrayNoDuplicates!0 (array!63336 (_ BitVec 32) List!21134) Bool)

(assert (=> b!1002868 (= res!671586 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21131))))

(declare-fun b!1002869 () Bool)

(declare-fun res!671590 () Bool)

(assert (=> b!1002869 (=> (not res!671590) (not e!565177))))

(declare-fun arrayContainsKey!0 (array!63336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002869 (= res!671590 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002870 () Bool)

(assert (=> b!1002870 (= e!565179 e!565175)))

(declare-fun res!671588 () Bool)

(assert (=> b!1002870 (=> (not res!671588) (not e!565175))))

(assert (=> b!1002870 (= res!671588 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443247 #b00000000000000000000000000000000) (bvslt lt!443247 (size!30990 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002870 (= lt!443247 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1002871 () Bool)

(assert (=> b!1002871 (= e!565177 e!565174)))

(declare-fun res!671589 () Bool)

(assert (=> b!1002871 (=> (not res!671589) (not e!565174))))

(declare-fun lt!443242 () SeekEntryResult!9355)

(assert (=> b!1002871 (= res!671589 (or (= lt!443242 (MissingVacant!9355 i!1194)) (= lt!443242 (MissingZero!9355 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63336 (_ BitVec 32)) SeekEntryResult!9355)

(assert (=> b!1002871 (= lt!443242 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002872 () Bool)

(declare-fun res!671581 () Bool)

(assert (=> b!1002872 (=> (not res!671581) (not e!565179))))

(assert (=> b!1002872 (= res!671581 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002873 () Bool)

(declare-fun res!671576 () Bool)

(assert (=> b!1002873 (=> (not res!671576) (not e!565177))))

(assert (=> b!1002873 (= res!671576 (and (= (size!30990 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30990 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30990 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002874 () Bool)

(assert (=> b!1002874 (= e!565175 false)))

(declare-fun lt!443248 () SeekEntryResult!9355)

(assert (=> b!1002874 (= lt!443248 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443247 lt!443243 lt!443245 mask!3464))))

(assert (= (and start!86716 res!671580) b!1002873))

(assert (= (and b!1002873 res!671576) b!1002865))

(assert (= (and b!1002865 res!671585) b!1002864))

(assert (= (and b!1002864 res!671583) b!1002869))

(assert (= (and b!1002869 res!671590) b!1002871))

(assert (= (and b!1002871 res!671589) b!1002862))

(assert (= (and b!1002862 res!671584) b!1002868))

(assert (= (and b!1002868 res!671586) b!1002860))

(assert (= (and b!1002860 res!671578) b!1002866))

(assert (= (and b!1002866 res!671591) b!1002863))

(assert (= (and b!1002863 res!671582) b!1002867))

(assert (= (and b!1002867 res!671587) b!1002861))

(assert (= (and b!1002861 res!671579) b!1002872))

(assert (= (and b!1002872 res!671581) b!1002870))

(assert (= (and b!1002870 res!671588) b!1002859))

(assert (= (and b!1002859 res!671577) b!1002874))

(declare-fun m!929153 () Bool)

(assert (=> b!1002874 m!929153))

(declare-fun m!929155 () Bool)

(assert (=> b!1002865 m!929155))

(assert (=> b!1002865 m!929155))

(declare-fun m!929157 () Bool)

(assert (=> b!1002865 m!929157))

(declare-fun m!929159 () Bool)

(assert (=> start!86716 m!929159))

(declare-fun m!929161 () Bool)

(assert (=> start!86716 m!929161))

(declare-fun m!929163 () Bool)

(assert (=> b!1002862 m!929163))

(declare-fun m!929165 () Bool)

(assert (=> b!1002864 m!929165))

(declare-fun m!929167 () Bool)

(assert (=> b!1002871 m!929167))

(declare-fun m!929169 () Bool)

(assert (=> b!1002867 m!929169))

(assert (=> b!1002867 m!929169))

(declare-fun m!929171 () Bool)

(assert (=> b!1002867 m!929171))

(declare-fun m!929173 () Bool)

(assert (=> b!1002867 m!929173))

(declare-fun m!929175 () Bool)

(assert (=> b!1002867 m!929175))

(declare-fun m!929177 () Bool)

(assert (=> b!1002868 m!929177))

(declare-fun m!929179 () Bool)

(assert (=> b!1002861 m!929179))

(assert (=> b!1002863 m!929155))

(assert (=> b!1002863 m!929155))

(declare-fun m!929181 () Bool)

(assert (=> b!1002863 m!929181))

(declare-fun m!929183 () Bool)

(assert (=> b!1002869 m!929183))

(assert (=> b!1002866 m!929155))

(assert (=> b!1002866 m!929155))

(declare-fun m!929185 () Bool)

(assert (=> b!1002866 m!929185))

(assert (=> b!1002866 m!929185))

(assert (=> b!1002866 m!929155))

(declare-fun m!929187 () Bool)

(assert (=> b!1002866 m!929187))

(assert (=> b!1002859 m!929155))

(assert (=> b!1002859 m!929155))

(declare-fun m!929189 () Bool)

(assert (=> b!1002859 m!929189))

(declare-fun m!929191 () Bool)

(assert (=> b!1002870 m!929191))

(check-sat (not b!1002865) (not b!1002870) (not b!1002861) (not b!1002862) (not b!1002864) (not b!1002866) (not b!1002867) (not b!1002874) (not start!86716) (not b!1002859) (not b!1002863) (not b!1002868) (not b!1002869) (not b!1002871))
(check-sat)
