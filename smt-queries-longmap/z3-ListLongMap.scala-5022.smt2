; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68644 () Bool)

(assert start!68644)

(declare-fun res!543410 () Bool)

(declare-fun e!443078 () Bool)

(assert (=> start!68644 (=> (not res!543410) (not e!443078))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68644 (= res!543410 (validMask!0 mask!3266))))

(assert (=> start!68644 e!443078))

(assert (=> start!68644 true))

(declare-datatypes ((array!43434 0))(
  ( (array!43435 (arr!20797 (Array (_ BitVec 32) (_ BitVec 64))) (size!21218 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43434)

(declare-fun array_inv!16593 (array!43434) Bool)

(assert (=> start!68644 (array_inv!16593 a!3170)))

(declare-fun b!798885 () Bool)

(declare-fun res!543404 () Bool)

(assert (=> b!798885 (=> (not res!543404) (not e!443078))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798885 (= res!543404 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798886 () Bool)

(declare-fun res!543415 () Bool)

(assert (=> b!798886 (=> (not res!543415) (not e!443078))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798886 (= res!543415 (and (= (size!21218 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21218 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21218 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798887 () Bool)

(declare-fun res!543416 () Bool)

(declare-fun e!443077 () Bool)

(assert (=> b!798887 (=> (not res!543416) (not e!443077))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356657 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8388 0))(
  ( (MissingZero!8388 (index!35920 (_ BitVec 32))) (Found!8388 (index!35921 (_ BitVec 32))) (Intermediate!8388 (undefined!9200 Bool) (index!35922 (_ BitVec 32)) (x!66802 (_ BitVec 32))) (Undefined!8388) (MissingVacant!8388 (index!35923 (_ BitVec 32))) )
))
(declare-fun lt!356652 () SeekEntryResult!8388)

(declare-fun lt!356654 () (_ BitVec 32))

(declare-fun lt!356653 () array!43434)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43434 (_ BitVec 32)) SeekEntryResult!8388)

(assert (=> b!798887 (= res!543416 (= lt!356652 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356654 vacantAfter!23 lt!356657 lt!356653 mask!3266)))))

(declare-fun b!798888 () Bool)

(assert (=> b!798888 (= e!443077 false)))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!356650 () SeekEntryResult!8388)

(assert (=> b!798888 (= lt!356650 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356654 vacantBefore!23 (select (arr!20797 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798889 () Bool)

(declare-fun e!443076 () Bool)

(assert (=> b!798889 (= e!443076 e!443077)))

(declare-fun res!543409 () Bool)

(assert (=> b!798889 (=> (not res!543409) (not e!443077))))

(assert (=> b!798889 (= res!543409 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356654 #b00000000000000000000000000000000) (bvslt lt!356654 (size!21218 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798889 (= lt!356654 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!798890 () Bool)

(declare-fun res!543408 () Bool)

(assert (=> b!798890 (=> (not res!543408) (not e!443078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798890 (= res!543408 (validKeyInArray!0 (select (arr!20797 a!3170) j!153)))))

(declare-fun b!798891 () Bool)

(declare-fun e!443075 () Bool)

(declare-fun e!443073 () Bool)

(assert (=> b!798891 (= e!443075 e!443073)))

(declare-fun res!543406 () Bool)

(assert (=> b!798891 (=> (not res!543406) (not e!443073))))

(assert (=> b!798891 (= res!543406 (= lt!356652 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356657 lt!356653 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43434 (_ BitVec 32)) SeekEntryResult!8388)

(assert (=> b!798891 (= lt!356652 (seekEntryOrOpen!0 lt!356657 lt!356653 mask!3266))))

(assert (=> b!798891 (= lt!356657 (select (store (arr!20797 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798891 (= lt!356653 (array!43435 (store (arr!20797 a!3170) i!1163 k0!2044) (size!21218 a!3170)))))

(declare-fun b!798892 () Bool)

(declare-fun res!543405 () Bool)

(assert (=> b!798892 (=> (not res!543405) (not e!443075))))

(assert (=> b!798892 (= res!543405 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21218 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20797 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21218 a!3170)) (= (select (arr!20797 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798893 () Bool)

(assert (=> b!798893 (= e!443078 e!443075)))

(declare-fun res!543407 () Bool)

(assert (=> b!798893 (=> (not res!543407) (not e!443075))))

(declare-fun lt!356655 () SeekEntryResult!8388)

(assert (=> b!798893 (= res!543407 (or (= lt!356655 (MissingZero!8388 i!1163)) (= lt!356655 (MissingVacant!8388 i!1163))))))

(assert (=> b!798893 (= lt!356655 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798894 () Bool)

(declare-fun res!543413 () Bool)

(assert (=> b!798894 (=> (not res!543413) (not e!443075))))

(declare-datatypes ((List!14760 0))(
  ( (Nil!14757) (Cons!14756 (h!15885 (_ BitVec 64)) (t!21075 List!14760)) )
))
(declare-fun arrayNoDuplicates!0 (array!43434 (_ BitVec 32) List!14760) Bool)

(assert (=> b!798894 (= res!543413 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14757))))

(declare-fun b!798895 () Bool)

(declare-fun res!543414 () Bool)

(assert (=> b!798895 (=> (not res!543414) (not e!443078))))

(assert (=> b!798895 (= res!543414 (validKeyInArray!0 k0!2044))))

(declare-fun b!798896 () Bool)

(declare-fun res!543412 () Bool)

(assert (=> b!798896 (=> (not res!543412) (not e!443075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43434 (_ BitVec 32)) Bool)

(assert (=> b!798896 (= res!543412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798897 () Bool)

(assert (=> b!798897 (= e!443073 e!443076)))

(declare-fun res!543411 () Bool)

(assert (=> b!798897 (=> (not res!543411) (not e!443076))))

(declare-fun lt!356651 () SeekEntryResult!8388)

(declare-fun lt!356656 () SeekEntryResult!8388)

(assert (=> b!798897 (= res!543411 (and (= lt!356651 lt!356656) (= lt!356656 (Found!8388 j!153)) (not (= (select (arr!20797 a!3170) index!1236) (select (arr!20797 a!3170) j!153)))))))

(assert (=> b!798897 (= lt!356656 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20797 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798897 (= lt!356651 (seekEntryOrOpen!0 (select (arr!20797 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68644 res!543410) b!798886))

(assert (= (and b!798886 res!543415) b!798890))

(assert (= (and b!798890 res!543408) b!798895))

(assert (= (and b!798895 res!543414) b!798885))

(assert (= (and b!798885 res!543404) b!798893))

(assert (= (and b!798893 res!543407) b!798896))

(assert (= (and b!798896 res!543412) b!798894))

(assert (= (and b!798894 res!543413) b!798892))

(assert (= (and b!798892 res!543405) b!798891))

(assert (= (and b!798891 res!543406) b!798897))

(assert (= (and b!798897 res!543411) b!798889))

(assert (= (and b!798889 res!543409) b!798887))

(assert (= (and b!798887 res!543416) b!798888))

(declare-fun m!739853 () Bool)

(assert (=> b!798894 m!739853))

(declare-fun m!739855 () Bool)

(assert (=> b!798895 m!739855))

(declare-fun m!739857 () Bool)

(assert (=> b!798887 m!739857))

(declare-fun m!739859 () Bool)

(assert (=> b!798890 m!739859))

(assert (=> b!798890 m!739859))

(declare-fun m!739861 () Bool)

(assert (=> b!798890 m!739861))

(assert (=> b!798888 m!739859))

(assert (=> b!798888 m!739859))

(declare-fun m!739863 () Bool)

(assert (=> b!798888 m!739863))

(declare-fun m!739865 () Bool)

(assert (=> b!798889 m!739865))

(declare-fun m!739867 () Bool)

(assert (=> b!798892 m!739867))

(declare-fun m!739869 () Bool)

(assert (=> b!798892 m!739869))

(declare-fun m!739871 () Bool)

(assert (=> start!68644 m!739871))

(declare-fun m!739873 () Bool)

(assert (=> start!68644 m!739873))

(declare-fun m!739875 () Bool)

(assert (=> b!798893 m!739875))

(declare-fun m!739877 () Bool)

(assert (=> b!798885 m!739877))

(declare-fun m!739879 () Bool)

(assert (=> b!798897 m!739879))

(assert (=> b!798897 m!739859))

(assert (=> b!798897 m!739859))

(declare-fun m!739881 () Bool)

(assert (=> b!798897 m!739881))

(assert (=> b!798897 m!739859))

(declare-fun m!739883 () Bool)

(assert (=> b!798897 m!739883))

(declare-fun m!739885 () Bool)

(assert (=> b!798891 m!739885))

(declare-fun m!739887 () Bool)

(assert (=> b!798891 m!739887))

(declare-fun m!739889 () Bool)

(assert (=> b!798891 m!739889))

(declare-fun m!739891 () Bool)

(assert (=> b!798891 m!739891))

(declare-fun m!739893 () Bool)

(assert (=> b!798896 m!739893))

(check-sat (not b!798895) (not b!798893) (not b!798897) (not b!798890) (not start!68644) (not b!798887) (not b!798896) (not b!798889) (not b!798894) (not b!798885) (not b!798888) (not b!798891))
(check-sat)
