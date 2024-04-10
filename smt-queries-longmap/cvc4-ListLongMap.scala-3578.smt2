; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49204 () Bool)

(assert start!49204)

(declare-fun b!541856 () Bool)

(declare-fun res!336584 () Bool)

(declare-fun e!313685 () Bool)

(assert (=> b!541856 (=> (not res!336584) (not e!313685))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34263 0))(
  ( (array!34264 (arr!16466 (Array (_ BitVec 32) (_ BitVec 64))) (size!16830 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34263)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4924 0))(
  ( (MissingZero!4924 (index!21920 (_ BitVec 32))) (Found!4924 (index!21921 (_ BitVec 32))) (Intermediate!4924 (undefined!5736 Bool) (index!21922 (_ BitVec 32)) (x!50829 (_ BitVec 32))) (Undefined!4924) (MissingVacant!4924 (index!21923 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34263 (_ BitVec 32)) SeekEntryResult!4924)

(assert (=> b!541856 (= res!336584 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16466 a!3154) j!147) a!3154 mask!3216) (Intermediate!4924 false resIndex!32 resX!32)))))

(declare-fun b!541857 () Bool)

(declare-fun res!336591 () Bool)

(assert (=> b!541857 (=> (not res!336591) (not e!313685))))

(declare-datatypes ((List!10585 0))(
  ( (Nil!10582) (Cons!10581 (h!11533 (_ BitVec 64)) (t!16813 List!10585)) )
))
(declare-fun arrayNoDuplicates!0 (array!34263 (_ BitVec 32) List!10585) Bool)

(assert (=> b!541857 (= res!336591 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10582))))

(declare-fun b!541858 () Bool)

(declare-fun e!313686 () Bool)

(assert (=> b!541858 (= e!313686 e!313685)))

(declare-fun res!336585 () Bool)

(assert (=> b!541858 (=> (not res!336585) (not e!313685))))

(declare-fun lt!247747 () SeekEntryResult!4924)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541858 (= res!336585 (or (= lt!247747 (MissingZero!4924 i!1153)) (= lt!247747 (MissingVacant!4924 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34263 (_ BitVec 32)) SeekEntryResult!4924)

(assert (=> b!541858 (= lt!247747 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541859 () Bool)

(declare-fun res!336590 () Bool)

(assert (=> b!541859 (=> (not res!336590) (not e!313686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541859 (= res!336590 (validKeyInArray!0 (select (arr!16466 a!3154) j!147)))))

(declare-fun b!541860 () Bool)

(declare-fun res!336586 () Bool)

(assert (=> b!541860 (=> (not res!336586) (not e!313685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34263 (_ BitVec 32)) Bool)

(assert (=> b!541860 (= res!336586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541861 () Bool)

(declare-fun res!336588 () Bool)

(assert (=> b!541861 (=> (not res!336588) (not e!313686))))

(assert (=> b!541861 (= res!336588 (validKeyInArray!0 k!1998))))

(declare-fun b!541863 () Bool)

(assert (=> b!541863 (= e!313685 false)))

(declare-fun lt!247746 () SeekEntryResult!4924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541863 (= lt!247746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16466 a!3154) j!147) mask!3216) (select (arr!16466 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541864 () Bool)

(declare-fun res!336593 () Bool)

(assert (=> b!541864 (=> (not res!336593) (not e!313685))))

(assert (=> b!541864 (= res!336593 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16830 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16830 a!3154)) (= (select (arr!16466 a!3154) resIndex!32) (select (arr!16466 a!3154) j!147))))))

(declare-fun b!541865 () Bool)

(declare-fun res!336587 () Bool)

(assert (=> b!541865 (=> (not res!336587) (not e!313686))))

(assert (=> b!541865 (= res!336587 (and (= (size!16830 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16830 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16830 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!336589 () Bool)

(assert (=> start!49204 (=> (not res!336589) (not e!313686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49204 (= res!336589 (validMask!0 mask!3216))))

(assert (=> start!49204 e!313686))

(assert (=> start!49204 true))

(declare-fun array_inv!12262 (array!34263) Bool)

(assert (=> start!49204 (array_inv!12262 a!3154)))

(declare-fun b!541862 () Bool)

(declare-fun res!336592 () Bool)

(assert (=> b!541862 (=> (not res!336592) (not e!313686))))

(declare-fun arrayContainsKey!0 (array!34263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541862 (= res!336592 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49204 res!336589) b!541865))

(assert (= (and b!541865 res!336587) b!541859))

(assert (= (and b!541859 res!336590) b!541861))

(assert (= (and b!541861 res!336588) b!541862))

(assert (= (and b!541862 res!336592) b!541858))

(assert (= (and b!541858 res!336585) b!541860))

(assert (= (and b!541860 res!336586) b!541857))

(assert (= (and b!541857 res!336591) b!541864))

(assert (= (and b!541864 res!336593) b!541856))

(assert (= (and b!541856 res!336584) b!541863))

(declare-fun m!520285 () Bool)

(assert (=> b!541860 m!520285))

(declare-fun m!520287 () Bool)

(assert (=> b!541858 m!520287))

(declare-fun m!520289 () Bool)

(assert (=> b!541859 m!520289))

(assert (=> b!541859 m!520289))

(declare-fun m!520291 () Bool)

(assert (=> b!541859 m!520291))

(assert (=> b!541863 m!520289))

(assert (=> b!541863 m!520289))

(declare-fun m!520293 () Bool)

(assert (=> b!541863 m!520293))

(assert (=> b!541863 m!520293))

(assert (=> b!541863 m!520289))

(declare-fun m!520295 () Bool)

(assert (=> b!541863 m!520295))

(declare-fun m!520297 () Bool)

(assert (=> b!541857 m!520297))

(declare-fun m!520299 () Bool)

(assert (=> b!541864 m!520299))

(assert (=> b!541864 m!520289))

(declare-fun m!520301 () Bool)

(assert (=> start!49204 m!520301))

(declare-fun m!520303 () Bool)

(assert (=> start!49204 m!520303))

(declare-fun m!520305 () Bool)

(assert (=> b!541861 m!520305))

(assert (=> b!541856 m!520289))

(assert (=> b!541856 m!520289))

(declare-fun m!520307 () Bool)

(assert (=> b!541856 m!520307))

(declare-fun m!520309 () Bool)

(assert (=> b!541862 m!520309))

(push 1)

(assert (not start!49204))

(assert (not b!541859))

(assert (not b!541856))

(assert (not b!541861))

(assert (not b!541862))

(assert (not b!541863))

(assert (not b!541857))

(assert (not b!541860))

(assert (not b!541858))

(check-sat)

