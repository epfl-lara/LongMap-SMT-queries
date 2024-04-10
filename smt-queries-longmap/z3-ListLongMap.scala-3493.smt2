; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48476 () Bool)

(assert start!48476)

(declare-fun res!327786 () Bool)

(declare-fun e!310022 () Bool)

(assert (=> start!48476 (=> (not res!327786) (not e!310022))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48476 (= res!327786 (validMask!0 mask!3216))))

(assert (=> start!48476 e!310022))

(assert (=> start!48476 true))

(declare-datatypes ((array!33739 0))(
  ( (array!33740 (arr!16210 (Array (_ BitVec 32) (_ BitVec 64))) (size!16574 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33739)

(declare-fun array_inv!12006 (array!33739) Bool)

(assert (=> start!48476 (array_inv!12006 a!3154)))

(declare-fun b!532439 () Bool)

(declare-fun res!327785 () Bool)

(declare-fun e!310021 () Bool)

(assert (=> b!532439 (=> (not res!327785) (not e!310021))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532439 (= res!327785 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16574 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16574 a!3154)) (= (select (arr!16210 a!3154) resIndex!32) (select (arr!16210 a!3154) j!147))))))

(declare-fun b!532440 () Bool)

(assert (=> b!532440 (= e!310021 false)))

(declare-fun lt!245211 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532440 (= lt!245211 (toIndex!0 (select (arr!16210 a!3154) j!147) mask!3216))))

(declare-fun b!532441 () Bool)

(declare-fun res!327791 () Bool)

(assert (=> b!532441 (=> (not res!327791) (not e!310021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33739 (_ BitVec 32)) Bool)

(assert (=> b!532441 (= res!327791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532442 () Bool)

(assert (=> b!532442 (= e!310022 e!310021)))

(declare-fun res!327789 () Bool)

(assert (=> b!532442 (=> (not res!327789) (not e!310021))))

(declare-datatypes ((SeekEntryResult!4668 0))(
  ( (MissingZero!4668 (index!20896 (_ BitVec 32))) (Found!4668 (index!20897 (_ BitVec 32))) (Intermediate!4668 (undefined!5480 Bool) (index!20898 (_ BitVec 32)) (x!49869 (_ BitVec 32))) (Undefined!4668) (MissingVacant!4668 (index!20899 (_ BitVec 32))) )
))
(declare-fun lt!245212 () SeekEntryResult!4668)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532442 (= res!327789 (or (= lt!245212 (MissingZero!4668 i!1153)) (= lt!245212 (MissingVacant!4668 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33739 (_ BitVec 32)) SeekEntryResult!4668)

(assert (=> b!532442 (= lt!245212 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532443 () Bool)

(declare-fun res!327787 () Bool)

(assert (=> b!532443 (=> (not res!327787) (not e!310021))))

(declare-datatypes ((List!10329 0))(
  ( (Nil!10326) (Cons!10325 (h!11265 (_ BitVec 64)) (t!16557 List!10329)) )
))
(declare-fun arrayNoDuplicates!0 (array!33739 (_ BitVec 32) List!10329) Bool)

(assert (=> b!532443 (= res!327787 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10326))))

(declare-fun b!532444 () Bool)

(declare-fun res!327788 () Bool)

(assert (=> b!532444 (=> (not res!327788) (not e!310022))))

(assert (=> b!532444 (= res!327788 (and (= (size!16574 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16574 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16574 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532445 () Bool)

(declare-fun res!327790 () Bool)

(assert (=> b!532445 (=> (not res!327790) (not e!310022))))

(declare-fun arrayContainsKey!0 (array!33739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532445 (= res!327790 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532446 () Bool)

(declare-fun res!327793 () Bool)

(assert (=> b!532446 (=> (not res!327793) (not e!310022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532446 (= res!327793 (validKeyInArray!0 k0!1998))))

(declare-fun b!532447 () Bool)

(declare-fun res!327794 () Bool)

(assert (=> b!532447 (=> (not res!327794) (not e!310022))))

(assert (=> b!532447 (= res!327794 (validKeyInArray!0 (select (arr!16210 a!3154) j!147)))))

(declare-fun b!532448 () Bool)

(declare-fun res!327792 () Bool)

(assert (=> b!532448 (=> (not res!327792) (not e!310021))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33739 (_ BitVec 32)) SeekEntryResult!4668)

(assert (=> b!532448 (= res!327792 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16210 a!3154) j!147) a!3154 mask!3216) (Intermediate!4668 false resIndex!32 resX!32)))))

(assert (= (and start!48476 res!327786) b!532444))

(assert (= (and b!532444 res!327788) b!532447))

(assert (= (and b!532447 res!327794) b!532446))

(assert (= (and b!532446 res!327793) b!532445))

(assert (= (and b!532445 res!327790) b!532442))

(assert (= (and b!532442 res!327789) b!532441))

(assert (= (and b!532441 res!327791) b!532443))

(assert (= (and b!532443 res!327787) b!532439))

(assert (= (and b!532439 res!327785) b!532448))

(assert (= (and b!532448 res!327792) b!532440))

(declare-fun m!512589 () Bool)

(assert (=> b!532443 m!512589))

(declare-fun m!512591 () Bool)

(assert (=> b!532442 m!512591))

(declare-fun m!512593 () Bool)

(assert (=> b!532445 m!512593))

(declare-fun m!512595 () Bool)

(assert (=> start!48476 m!512595))

(declare-fun m!512597 () Bool)

(assert (=> start!48476 m!512597))

(declare-fun m!512599 () Bool)

(assert (=> b!532439 m!512599))

(declare-fun m!512601 () Bool)

(assert (=> b!532439 m!512601))

(assert (=> b!532440 m!512601))

(assert (=> b!532440 m!512601))

(declare-fun m!512603 () Bool)

(assert (=> b!532440 m!512603))

(declare-fun m!512605 () Bool)

(assert (=> b!532441 m!512605))

(assert (=> b!532447 m!512601))

(assert (=> b!532447 m!512601))

(declare-fun m!512607 () Bool)

(assert (=> b!532447 m!512607))

(assert (=> b!532448 m!512601))

(assert (=> b!532448 m!512601))

(declare-fun m!512609 () Bool)

(assert (=> b!532448 m!512609))

(declare-fun m!512611 () Bool)

(assert (=> b!532446 m!512611))

(check-sat (not b!532443) (not b!532446) (not start!48476) (not b!532440) (not b!532448) (not b!532447) (not b!532445) (not b!532441) (not b!532442))
(check-sat)
