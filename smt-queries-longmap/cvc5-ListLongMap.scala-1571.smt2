; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29962 () Bool)

(assert start!29962)

(declare-fun b!300951 () Bool)

(declare-fun e!190001 () Bool)

(declare-fun e!190003 () Bool)

(assert (=> b!300951 (= e!190001 e!190003)))

(declare-fun res!158702 () Bool)

(assert (=> b!300951 (=> (not res!158702) (not e!190003))))

(declare-datatypes ((SeekEntryResult!2339 0))(
  ( (MissingZero!2339 (index!11532 (_ BitVec 32))) (Found!2339 (index!11533 (_ BitVec 32))) (Intermediate!2339 (undefined!3151 Bool) (index!11534 (_ BitVec 32)) (x!29795 (_ BitVec 32))) (Undefined!2339) (MissingVacant!2339 (index!11535 (_ BitVec 32))) )
))
(declare-fun lt!149737 () SeekEntryResult!2339)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300951 (= res!158702 (or (= lt!149737 (MissingZero!2339 i!1256)) (= lt!149737 (MissingVacant!2339 i!1256))))))

(declare-datatypes ((array!15195 0))(
  ( (array!15196 (arr!7190 (Array (_ BitVec 32) (_ BitVec 64))) (size!7542 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15195)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15195 (_ BitVec 32)) SeekEntryResult!2339)

(assert (=> b!300951 (= lt!149737 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300952 () Bool)

(assert (=> b!300952 (= e!190003 false)))

(declare-fun lt!149736 () SeekEntryResult!2339)

(declare-fun lt!149738 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15195 (_ BitVec 32)) SeekEntryResult!2339)

(assert (=> b!300952 (= lt!149736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149738 k!2524 (array!15196 (store (arr!7190 a!3312) i!1256 k!2524) (size!7542 a!3312)) mask!3809))))

(declare-fun lt!149739 () SeekEntryResult!2339)

(assert (=> b!300952 (= lt!149739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149738 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300952 (= lt!149738 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!158704 () Bool)

(assert (=> start!29962 (=> (not res!158704) (not e!190001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29962 (= res!158704 (validMask!0 mask!3809))))

(assert (=> start!29962 e!190001))

(assert (=> start!29962 true))

(declare-fun array_inv!5153 (array!15195) Bool)

(assert (=> start!29962 (array_inv!5153 a!3312)))

(declare-fun b!300953 () Bool)

(declare-fun res!158705 () Bool)

(assert (=> b!300953 (=> (not res!158705) (not e!190001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300953 (= res!158705 (validKeyInArray!0 k!2524))))

(declare-fun b!300954 () Bool)

(declare-fun res!158706 () Bool)

(assert (=> b!300954 (=> (not res!158706) (not e!190001))))

(declare-fun arrayContainsKey!0 (array!15195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300954 (= res!158706 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300955 () Bool)

(declare-fun res!158703 () Bool)

(assert (=> b!300955 (=> (not res!158703) (not e!190001))))

(assert (=> b!300955 (= res!158703 (and (= (size!7542 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7542 a!3312))))))

(declare-fun b!300956 () Bool)

(declare-fun res!158701 () Bool)

(assert (=> b!300956 (=> (not res!158701) (not e!190003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15195 (_ BitVec 32)) Bool)

(assert (=> b!300956 (= res!158701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29962 res!158704) b!300955))

(assert (= (and b!300955 res!158703) b!300953))

(assert (= (and b!300953 res!158705) b!300954))

(assert (= (and b!300954 res!158706) b!300951))

(assert (= (and b!300951 res!158702) b!300956))

(assert (= (and b!300956 res!158701) b!300952))

(declare-fun m!312849 () Bool)

(assert (=> b!300952 m!312849))

(declare-fun m!312851 () Bool)

(assert (=> b!300952 m!312851))

(declare-fun m!312853 () Bool)

(assert (=> b!300952 m!312853))

(declare-fun m!312855 () Bool)

(assert (=> b!300952 m!312855))

(declare-fun m!312857 () Bool)

(assert (=> b!300951 m!312857))

(declare-fun m!312859 () Bool)

(assert (=> b!300956 m!312859))

(declare-fun m!312861 () Bool)

(assert (=> b!300953 m!312861))

(declare-fun m!312863 () Bool)

(assert (=> start!29962 m!312863))

(declare-fun m!312865 () Bool)

(assert (=> start!29962 m!312865))

(declare-fun m!312867 () Bool)

(assert (=> b!300954 m!312867))

(push 1)

