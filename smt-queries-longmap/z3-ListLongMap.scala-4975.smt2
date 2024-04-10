; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68362 () Bool)

(assert start!68362)

(declare-fun b!794316 () Bool)

(declare-fun res!538839 () Bool)

(declare-fun e!441076 () Bool)

(assert (=> b!794316 (=> (not res!538839) (not e!441076))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43152 0))(
  ( (array!43153 (arr!20656 (Array (_ BitVec 32) (_ BitVec 64))) (size!21077 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43152)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794316 (= res!538839 (and (= (size!21077 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21077 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21077 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794317 () Bool)

(declare-fun res!538836 () Bool)

(assert (=> b!794317 (=> (not res!538836) (not e!441076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794317 (= res!538836 (validKeyInArray!0 (select (arr!20656 a!3170) j!153)))))

(declare-fun res!538837 () Bool)

(assert (=> start!68362 (=> (not res!538837) (not e!441076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68362 (= res!538837 (validMask!0 mask!3266))))

(assert (=> start!68362 e!441076))

(assert (=> start!68362 true))

(declare-fun array_inv!16452 (array!43152) Bool)

(assert (=> start!68362 (array_inv!16452 a!3170)))

(declare-fun b!794318 () Bool)

(declare-fun res!538835 () Bool)

(assert (=> b!794318 (=> (not res!538835) (not e!441076))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794318 (= res!538835 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794319 () Bool)

(declare-fun res!538843 () Bool)

(declare-fun e!441075 () Bool)

(assert (=> b!794319 (=> (not res!538843) (not e!441075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43152 (_ BitVec 32)) Bool)

(assert (=> b!794319 (= res!538843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794320 () Bool)

(declare-fun e!441074 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794320 (= e!441074 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!794321 () Bool)

(declare-fun res!538844 () Bool)

(assert (=> b!794321 (=> (not res!538844) (not e!441075))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!794321 (= res!538844 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21077 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20656 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21077 a!3170)) (= (select (arr!20656 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794322 () Bool)

(assert (=> b!794322 (= e!441076 e!441075)))

(declare-fun res!538840 () Bool)

(assert (=> b!794322 (=> (not res!538840) (not e!441075))))

(declare-datatypes ((SeekEntryResult!8247 0))(
  ( (MissingZero!8247 (index!35356 (_ BitVec 32))) (Found!8247 (index!35357 (_ BitVec 32))) (Intermediate!8247 (undefined!9059 Bool) (index!35358 (_ BitVec 32)) (x!66285 (_ BitVec 32))) (Undefined!8247) (MissingVacant!8247 (index!35359 (_ BitVec 32))) )
))
(declare-fun lt!354078 () SeekEntryResult!8247)

(assert (=> b!794322 (= res!538840 (or (= lt!354078 (MissingZero!8247 i!1163)) (= lt!354078 (MissingVacant!8247 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43152 (_ BitVec 32)) SeekEntryResult!8247)

(assert (=> b!794322 (= lt!354078 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794323 () Bool)

(declare-fun res!538838 () Bool)

(assert (=> b!794323 (=> (not res!538838) (not e!441075))))

(declare-datatypes ((List!14619 0))(
  ( (Nil!14616) (Cons!14615 (h!15744 (_ BitVec 64)) (t!20934 List!14619)) )
))
(declare-fun arrayNoDuplicates!0 (array!43152 (_ BitVec 32) List!14619) Bool)

(assert (=> b!794323 (= res!538838 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14616))))

(declare-fun b!794324 () Bool)

(declare-fun res!538841 () Bool)

(assert (=> b!794324 (=> (not res!538841) (not e!441076))))

(assert (=> b!794324 (= res!538841 (validKeyInArray!0 k0!2044))))

(declare-fun b!794325 () Bool)

(assert (=> b!794325 (= e!441075 e!441074)))

(declare-fun res!538842 () Bool)

(assert (=> b!794325 (=> (not res!538842) (not e!441074))))

(declare-fun lt!354079 () array!43152)

(declare-fun lt!354080 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43152 (_ BitVec 32)) SeekEntryResult!8247)

(assert (=> b!794325 (= res!538842 (= (seekEntryOrOpen!0 lt!354080 lt!354079 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354080 lt!354079 mask!3266)))))

(assert (=> b!794325 (= lt!354080 (select (store (arr!20656 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794325 (= lt!354079 (array!43153 (store (arr!20656 a!3170) i!1163 k0!2044) (size!21077 a!3170)))))

(assert (= (and start!68362 res!538837) b!794316))

(assert (= (and b!794316 res!538839) b!794317))

(assert (= (and b!794317 res!538836) b!794324))

(assert (= (and b!794324 res!538841) b!794318))

(assert (= (and b!794318 res!538835) b!794322))

(assert (= (and b!794322 res!538840) b!794319))

(assert (= (and b!794319 res!538843) b!794323))

(assert (= (and b!794323 res!538838) b!794321))

(assert (= (and b!794321 res!538844) b!794325))

(assert (= (and b!794325 res!538842) b!794320))

(declare-fun m!734843 () Bool)

(assert (=> b!794317 m!734843))

(assert (=> b!794317 m!734843))

(declare-fun m!734845 () Bool)

(assert (=> b!794317 m!734845))

(declare-fun m!734847 () Bool)

(assert (=> b!794322 m!734847))

(declare-fun m!734849 () Bool)

(assert (=> start!68362 m!734849))

(declare-fun m!734851 () Bool)

(assert (=> start!68362 m!734851))

(declare-fun m!734853 () Bool)

(assert (=> b!794319 m!734853))

(declare-fun m!734855 () Bool)

(assert (=> b!794324 m!734855))

(declare-fun m!734857 () Bool)

(assert (=> b!794318 m!734857))

(declare-fun m!734859 () Bool)

(assert (=> b!794325 m!734859))

(declare-fun m!734861 () Bool)

(assert (=> b!794325 m!734861))

(declare-fun m!734863 () Bool)

(assert (=> b!794325 m!734863))

(declare-fun m!734865 () Bool)

(assert (=> b!794325 m!734865))

(declare-fun m!734867 () Bool)

(assert (=> b!794321 m!734867))

(declare-fun m!734869 () Bool)

(assert (=> b!794321 m!734869))

(declare-fun m!734871 () Bool)

(assert (=> b!794323 m!734871))

(check-sat (not b!794318) (not b!794325) (not b!794319) (not b!794322) (not b!794324) (not b!794323) (not start!68362) (not b!794317))
(check-sat)
