; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48796 () Bool)

(assert start!48796)

(declare-fun b!536305 () Bool)

(declare-fun res!331410 () Bool)

(declare-fun e!311415 () Bool)

(assert (=> b!536305 (=> (not res!331410) (not e!311415))))

(declare-datatypes ((array!33956 0))(
  ( (array!33957 (arr!16315 (Array (_ BitVec 32) (_ BitVec 64))) (size!16679 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33956)

(declare-datatypes ((List!10341 0))(
  ( (Nil!10338) (Cons!10337 (h!11283 (_ BitVec 64)) (t!16561 List!10341)) )
))
(declare-fun arrayNoDuplicates!0 (array!33956 (_ BitVec 32) List!10341) Bool)

(assert (=> b!536305 (= res!331410 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10338))))

(declare-fun b!536306 () Bool)

(declare-fun e!311417 () Bool)

(declare-fun e!311416 () Bool)

(assert (=> b!536306 (= e!311417 e!311416)))

(declare-fun res!331417 () Bool)

(assert (=> b!536306 (=> (not res!331417) (not e!311416))))

(declare-fun lt!246101 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536306 (= res!331417 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246101 #b00000000000000000000000000000000) (bvslt lt!246101 (size!16679 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536306 (= lt!246101 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!536307 () Bool)

(declare-fun res!331412 () Bool)

(assert (=> b!536307 (=> (not res!331412) (not e!311415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33956 (_ BitVec 32)) Bool)

(assert (=> b!536307 (= res!331412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536308 () Bool)

(declare-fun res!331405 () Bool)

(assert (=> b!536308 (=> (not res!331405) (not e!311417))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!536308 (= res!331405 (and (not (= (select (arr!16315 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16315 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16315 a!3154) index!1177) (select (arr!16315 a!3154) j!147)))))))

(declare-fun b!536309 () Bool)

(assert (=> b!536309 (= e!311415 e!311417)))

(declare-fun res!331406 () Bool)

(assert (=> b!536309 (=> (not res!331406) (not e!311417))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4729 0))(
  ( (MissingZero!4729 (index!21140 (_ BitVec 32))) (Found!4729 (index!21141 (_ BitVec 32))) (Intermediate!4729 (undefined!5541 Bool) (index!21142 (_ BitVec 32)) (x!50235 (_ BitVec 32))) (Undefined!4729) (MissingVacant!4729 (index!21143 (_ BitVec 32))) )
))
(declare-fun lt!246103 () SeekEntryResult!4729)

(assert (=> b!536309 (= res!331406 (= lt!246103 (Intermediate!4729 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33956 (_ BitVec 32)) SeekEntryResult!4729)

(assert (=> b!536309 (= lt!246103 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16315 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536310 () Bool)

(declare-fun res!331407 () Bool)

(assert (=> b!536310 (=> (not res!331407) (not e!311415))))

(assert (=> b!536310 (= res!331407 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16679 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16679 a!3154)) (= (select (arr!16315 a!3154) resIndex!32) (select (arr!16315 a!3154) j!147))))))

(declare-fun res!331411 () Bool)

(declare-fun e!311414 () Bool)

(assert (=> start!48796 (=> (not res!331411) (not e!311414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48796 (= res!331411 (validMask!0 mask!3216))))

(assert (=> start!48796 e!311414))

(assert (=> start!48796 true))

(declare-fun array_inv!12174 (array!33956) Bool)

(assert (=> start!48796 (array_inv!12174 a!3154)))

(declare-fun b!536311 () Bool)

(declare-fun res!331414 () Bool)

(assert (=> b!536311 (=> (not res!331414) (not e!311414))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536311 (= res!331414 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536312 () Bool)

(declare-fun res!331413 () Bool)

(assert (=> b!536312 (=> (not res!331413) (not e!311414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536312 (= res!331413 (validKeyInArray!0 (select (arr!16315 a!3154) j!147)))))

(declare-fun b!536313 () Bool)

(assert (=> b!536313 (= e!311416 false)))

(declare-fun lt!246102 () SeekEntryResult!4729)

(assert (=> b!536313 (= lt!246102 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246101 (select (arr!16315 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536314 () Bool)

(declare-fun res!331409 () Bool)

(assert (=> b!536314 (=> (not res!331409) (not e!311417))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536314 (= res!331409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16315 a!3154) j!147) mask!3216) (select (arr!16315 a!3154) j!147) a!3154 mask!3216) lt!246103))))

(declare-fun b!536315 () Bool)

(assert (=> b!536315 (= e!311414 e!311415)))

(declare-fun res!331415 () Bool)

(assert (=> b!536315 (=> (not res!331415) (not e!311415))))

(declare-fun lt!246100 () SeekEntryResult!4729)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536315 (= res!331415 (or (= lt!246100 (MissingZero!4729 i!1153)) (= lt!246100 (MissingVacant!4729 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33956 (_ BitVec 32)) SeekEntryResult!4729)

(assert (=> b!536315 (= lt!246100 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536316 () Bool)

(declare-fun res!331408 () Bool)

(assert (=> b!536316 (=> (not res!331408) (not e!311414))))

(assert (=> b!536316 (= res!331408 (validKeyInArray!0 k0!1998))))

(declare-fun b!536317 () Bool)

(declare-fun res!331416 () Bool)

(assert (=> b!536317 (=> (not res!331416) (not e!311414))))

(assert (=> b!536317 (= res!331416 (and (= (size!16679 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16679 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16679 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48796 res!331411) b!536317))

(assert (= (and b!536317 res!331416) b!536312))

(assert (= (and b!536312 res!331413) b!536316))

(assert (= (and b!536316 res!331408) b!536311))

(assert (= (and b!536311 res!331414) b!536315))

(assert (= (and b!536315 res!331415) b!536307))

(assert (= (and b!536307 res!331412) b!536305))

(assert (= (and b!536305 res!331410) b!536310))

(assert (= (and b!536310 res!331407) b!536309))

(assert (= (and b!536309 res!331406) b!536314))

(assert (= (and b!536314 res!331409) b!536308))

(assert (= (and b!536308 res!331405) b!536306))

(assert (= (and b!536306 res!331417) b!536313))

(declare-fun m!515899 () Bool)

(assert (=> b!536309 m!515899))

(assert (=> b!536309 m!515899))

(declare-fun m!515901 () Bool)

(assert (=> b!536309 m!515901))

(declare-fun m!515903 () Bool)

(assert (=> b!536305 m!515903))

(assert (=> b!536313 m!515899))

(assert (=> b!536313 m!515899))

(declare-fun m!515905 () Bool)

(assert (=> b!536313 m!515905))

(declare-fun m!515907 () Bool)

(assert (=> b!536308 m!515907))

(assert (=> b!536308 m!515899))

(declare-fun m!515909 () Bool)

(assert (=> b!536307 m!515909))

(declare-fun m!515911 () Bool)

(assert (=> b!536310 m!515911))

(assert (=> b!536310 m!515899))

(declare-fun m!515913 () Bool)

(assert (=> start!48796 m!515913))

(declare-fun m!515915 () Bool)

(assert (=> start!48796 m!515915))

(declare-fun m!515917 () Bool)

(assert (=> b!536311 m!515917))

(declare-fun m!515919 () Bool)

(assert (=> b!536315 m!515919))

(declare-fun m!515921 () Bool)

(assert (=> b!536306 m!515921))

(assert (=> b!536314 m!515899))

(assert (=> b!536314 m!515899))

(declare-fun m!515923 () Bool)

(assert (=> b!536314 m!515923))

(assert (=> b!536314 m!515923))

(assert (=> b!536314 m!515899))

(declare-fun m!515925 () Bool)

(assert (=> b!536314 m!515925))

(declare-fun m!515927 () Bool)

(assert (=> b!536316 m!515927))

(assert (=> b!536312 m!515899))

(assert (=> b!536312 m!515899))

(declare-fun m!515929 () Bool)

(assert (=> b!536312 m!515929))

(check-sat (not b!536311) (not b!536316) (not b!536306) (not b!536307) (not b!536313) (not start!48796) (not b!536314) (not b!536315) (not b!536312) (not b!536309) (not b!536305))
(check-sat)
