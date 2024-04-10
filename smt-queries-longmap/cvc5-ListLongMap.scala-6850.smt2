; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86300 () Bool)

(assert start!86300)

(declare-fun b!998930 () Bool)

(declare-fun res!668575 () Bool)

(declare-fun e!563279 () Bool)

(assert (=> b!998930 (=> (not res!668575) (not e!563279))))

(declare-datatypes ((array!63152 0))(
  ( (array!63153 (arr!30403 (Array (_ BitVec 32) (_ BitVec 64))) (size!30905 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63152)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998930 (= res!668575 (and (= (size!30905 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30905 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30905 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998931 () Bool)

(declare-fun e!563278 () Bool)

(assert (=> b!998931 (= e!563279 e!563278)))

(declare-fun res!668571 () Bool)

(assert (=> b!998931 (=> (not res!668571) (not e!563278))))

(declare-datatypes ((SeekEntryResult!9335 0))(
  ( (MissingZero!9335 (index!39711 (_ BitVec 32))) (Found!9335 (index!39712 (_ BitVec 32))) (Intermediate!9335 (undefined!10147 Bool) (index!39713 (_ BitVec 32)) (x!87149 (_ BitVec 32))) (Undefined!9335) (MissingVacant!9335 (index!39714 (_ BitVec 32))) )
))
(declare-fun lt!441859 () SeekEntryResult!9335)

(assert (=> b!998931 (= res!668571 (or (= lt!441859 (MissingVacant!9335 i!1194)) (= lt!441859 (MissingZero!9335 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63152 (_ BitVec 32)) SeekEntryResult!9335)

(assert (=> b!998931 (= lt!441859 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998932 () Bool)

(declare-fun e!563281 () Bool)

(assert (=> b!998932 (= e!563278 e!563281)))

(declare-fun res!668568 () Bool)

(assert (=> b!998932 (=> (not res!668568) (not e!563281))))

(declare-fun lt!441860 () SeekEntryResult!9335)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63152 (_ BitVec 32)) SeekEntryResult!9335)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998932 (= res!668568 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30403 a!3219) j!170) mask!3464) (select (arr!30403 a!3219) j!170) a!3219 mask!3464) lt!441860))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998932 (= lt!441860 (Intermediate!9335 false resIndex!38 resX!38))))

(declare-fun b!998933 () Bool)

(assert (=> b!998933 (= e!563281 false)))

(declare-fun lt!441858 () (_ BitVec 32))

(assert (=> b!998933 (= lt!441858 (toIndex!0 (select (store (arr!30403 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!998935 () Bool)

(declare-fun res!668572 () Bool)

(assert (=> b!998935 (=> (not res!668572) (not e!563278))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998935 (= res!668572 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30905 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30905 a!3219))))))

(declare-fun b!998936 () Bool)

(declare-fun res!668576 () Bool)

(assert (=> b!998936 (=> (not res!668576) (not e!563279))))

(declare-fun arrayContainsKey!0 (array!63152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998936 (= res!668576 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998937 () Bool)

(declare-fun res!668570 () Bool)

(assert (=> b!998937 (=> (not res!668570) (not e!563278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63152 (_ BitVec 32)) Bool)

(assert (=> b!998937 (= res!668570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998938 () Bool)

(declare-fun res!668574 () Bool)

(assert (=> b!998938 (=> (not res!668574) (not e!563279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998938 (= res!668574 (validKeyInArray!0 k!2224))))

(declare-fun b!998939 () Bool)

(declare-fun res!668573 () Bool)

(assert (=> b!998939 (=> (not res!668573) (not e!563281))))

(assert (=> b!998939 (= res!668573 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30403 a!3219) j!170) a!3219 mask!3464) lt!441860))))

(declare-fun b!998940 () Bool)

(declare-fun res!668569 () Bool)

(assert (=> b!998940 (=> (not res!668569) (not e!563279))))

(assert (=> b!998940 (= res!668569 (validKeyInArray!0 (select (arr!30403 a!3219) j!170)))))

(declare-fun res!668577 () Bool)

(assert (=> start!86300 (=> (not res!668577) (not e!563279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86300 (= res!668577 (validMask!0 mask!3464))))

(assert (=> start!86300 e!563279))

(declare-fun array_inv!23527 (array!63152) Bool)

(assert (=> start!86300 (array_inv!23527 a!3219)))

(assert (=> start!86300 true))

(declare-fun b!998934 () Bool)

(declare-fun res!668567 () Bool)

(assert (=> b!998934 (=> (not res!668567) (not e!563278))))

(declare-datatypes ((List!21079 0))(
  ( (Nil!21076) (Cons!21075 (h!22249 (_ BitVec 64)) (t!30080 List!21079)) )
))
(declare-fun arrayNoDuplicates!0 (array!63152 (_ BitVec 32) List!21079) Bool)

(assert (=> b!998934 (= res!668567 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21076))))

(assert (= (and start!86300 res!668577) b!998930))

(assert (= (and b!998930 res!668575) b!998940))

(assert (= (and b!998940 res!668569) b!998938))

(assert (= (and b!998938 res!668574) b!998936))

(assert (= (and b!998936 res!668576) b!998931))

(assert (= (and b!998931 res!668571) b!998937))

(assert (= (and b!998937 res!668570) b!998934))

(assert (= (and b!998934 res!668567) b!998935))

(assert (= (and b!998935 res!668572) b!998932))

(assert (= (and b!998932 res!668568) b!998939))

(assert (= (and b!998939 res!668573) b!998933))

(declare-fun m!925313 () Bool)

(assert (=> b!998938 m!925313))

(declare-fun m!925315 () Bool)

(assert (=> b!998933 m!925315))

(declare-fun m!925317 () Bool)

(assert (=> b!998933 m!925317))

(assert (=> b!998933 m!925317))

(declare-fun m!925319 () Bool)

(assert (=> b!998933 m!925319))

(declare-fun m!925321 () Bool)

(assert (=> b!998931 m!925321))

(declare-fun m!925323 () Bool)

(assert (=> b!998932 m!925323))

(assert (=> b!998932 m!925323))

(declare-fun m!925325 () Bool)

(assert (=> b!998932 m!925325))

(assert (=> b!998932 m!925325))

(assert (=> b!998932 m!925323))

(declare-fun m!925327 () Bool)

(assert (=> b!998932 m!925327))

(assert (=> b!998940 m!925323))

(assert (=> b!998940 m!925323))

(declare-fun m!925329 () Bool)

(assert (=> b!998940 m!925329))

(declare-fun m!925331 () Bool)

(assert (=> b!998934 m!925331))

(declare-fun m!925333 () Bool)

(assert (=> b!998937 m!925333))

(declare-fun m!925335 () Bool)

(assert (=> start!86300 m!925335))

(declare-fun m!925337 () Bool)

(assert (=> start!86300 m!925337))

(assert (=> b!998939 m!925323))

(assert (=> b!998939 m!925323))

(declare-fun m!925339 () Bool)

(assert (=> b!998939 m!925339))

(declare-fun m!925341 () Bool)

(assert (=> b!998936 m!925341))

(push 1)

