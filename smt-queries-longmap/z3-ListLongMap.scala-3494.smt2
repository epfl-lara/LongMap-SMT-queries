; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48472 () Bool)

(assert start!48472)

(declare-fun b!532438 () Bool)

(declare-fun res!327843 () Bool)

(declare-fun e!310001 () Bool)

(assert (=> b!532438 (=> (not res!327843) (not e!310001))))

(declare-datatypes ((array!33734 0))(
  ( (array!33735 (arr!16207 (Array (_ BitVec 32) (_ BitVec 64))) (size!16571 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33734)

(declare-datatypes ((List!10233 0))(
  ( (Nil!10230) (Cons!10229 (h!11169 (_ BitVec 64)) (t!16453 List!10233)) )
))
(declare-fun arrayNoDuplicates!0 (array!33734 (_ BitVec 32) List!10233) Bool)

(assert (=> b!532438 (= res!327843 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10230))))

(declare-fun b!532439 () Bool)

(declare-fun res!327839 () Bool)

(declare-fun e!310002 () Bool)

(assert (=> b!532439 (=> (not res!327839) (not e!310002))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532439 (= res!327839 (validKeyInArray!0 (select (arr!16207 a!3154) j!147)))))

(declare-fun b!532440 () Bool)

(declare-fun res!327838 () Bool)

(assert (=> b!532440 (=> (not res!327838) (not e!310001))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4621 0))(
  ( (MissingZero!4621 (index!20708 (_ BitVec 32))) (Found!4621 (index!20709 (_ BitVec 32))) (Intermediate!4621 (undefined!5433 Bool) (index!20710 (_ BitVec 32)) (x!49827 (_ BitVec 32))) (Undefined!4621) (MissingVacant!4621 (index!20711 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33734 (_ BitVec 32)) SeekEntryResult!4621)

(assert (=> b!532440 (= res!327838 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16207 a!3154) j!147) a!3154 mask!3216) (Intermediate!4621 false resIndex!32 resX!32)))))

(declare-fun b!532441 () Bool)

(declare-fun res!327844 () Bool)

(assert (=> b!532441 (=> (not res!327844) (not e!310002))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532441 (= res!327844 (and (= (size!16571 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16571 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16571 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532442 () Bool)

(declare-fun res!327845 () Bool)

(assert (=> b!532442 (=> (not res!327845) (not e!310002))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532442 (= res!327845 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532443 () Bool)

(declare-fun res!327841 () Bool)

(assert (=> b!532443 (=> (not res!327841) (not e!310001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33734 (_ BitVec 32)) Bool)

(assert (=> b!532443 (= res!327841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!327847 () Bool)

(assert (=> start!48472 (=> (not res!327847) (not e!310002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48472 (= res!327847 (validMask!0 mask!3216))))

(assert (=> start!48472 e!310002))

(assert (=> start!48472 true))

(declare-fun array_inv!12066 (array!33734) Bool)

(assert (=> start!48472 (array_inv!12066 a!3154)))

(declare-fun b!532444 () Bool)

(declare-fun res!327842 () Bool)

(assert (=> b!532444 (=> (not res!327842) (not e!310001))))

(assert (=> b!532444 (= res!327842 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16571 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16571 a!3154)) (= (select (arr!16207 a!3154) resIndex!32) (select (arr!16207 a!3154) j!147))))))

(declare-fun b!532445 () Bool)

(assert (=> b!532445 (= e!310001 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun lt!245235 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532445 (= lt!245235 (toIndex!0 (select (arr!16207 a!3154) j!147) mask!3216))))

(declare-fun b!532446 () Bool)

(assert (=> b!532446 (= e!310002 e!310001)))

(declare-fun res!327840 () Bool)

(assert (=> b!532446 (=> (not res!327840) (not e!310001))))

(declare-fun lt!245236 () SeekEntryResult!4621)

(assert (=> b!532446 (= res!327840 (or (= lt!245236 (MissingZero!4621 i!1153)) (= lt!245236 (MissingVacant!4621 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33734 (_ BitVec 32)) SeekEntryResult!4621)

(assert (=> b!532446 (= lt!245236 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532447 () Bool)

(declare-fun res!327846 () Bool)

(assert (=> b!532447 (=> (not res!327846) (not e!310002))))

(assert (=> b!532447 (= res!327846 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48472 res!327847) b!532441))

(assert (= (and b!532441 res!327844) b!532439))

(assert (= (and b!532439 res!327839) b!532447))

(assert (= (and b!532447 res!327846) b!532442))

(assert (= (and b!532442 res!327845) b!532446))

(assert (= (and b!532446 res!327840) b!532443))

(assert (= (and b!532443 res!327841) b!532438))

(assert (= (and b!532438 res!327843) b!532444))

(assert (= (and b!532444 res!327842) b!532440))

(assert (= (and b!532440 res!327838) b!532445))

(declare-fun m!512821 () Bool)

(assert (=> b!532446 m!512821))

(declare-fun m!512823 () Bool)

(assert (=> b!532442 m!512823))

(declare-fun m!512825 () Bool)

(assert (=> b!532445 m!512825))

(assert (=> b!532445 m!512825))

(declare-fun m!512827 () Bool)

(assert (=> b!532445 m!512827))

(declare-fun m!512829 () Bool)

(assert (=> start!48472 m!512829))

(declare-fun m!512831 () Bool)

(assert (=> start!48472 m!512831))

(declare-fun m!512833 () Bool)

(assert (=> b!532443 m!512833))

(assert (=> b!532439 m!512825))

(assert (=> b!532439 m!512825))

(declare-fun m!512835 () Bool)

(assert (=> b!532439 m!512835))

(declare-fun m!512837 () Bool)

(assert (=> b!532444 m!512837))

(assert (=> b!532444 m!512825))

(declare-fun m!512839 () Bool)

(assert (=> b!532438 m!512839))

(declare-fun m!512841 () Bool)

(assert (=> b!532447 m!512841))

(assert (=> b!532440 m!512825))

(assert (=> b!532440 m!512825))

(declare-fun m!512843 () Bool)

(assert (=> b!532440 m!512843))

(check-sat (not b!532447) (not start!48472) (not b!532445) (not b!532439) (not b!532446) (not b!532440) (not b!532442) (not b!532438) (not b!532443))
(check-sat)
