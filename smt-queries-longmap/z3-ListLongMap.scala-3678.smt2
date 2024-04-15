; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50672 () Bool)

(assert start!50672)

(declare-fun b!553921 () Bool)

(declare-fun res!346478 () Bool)

(declare-fun e!319415 () Bool)

(assert (=> b!553921 (=> (not res!346478) (not e!319415))))

(declare-datatypes ((array!34906 0))(
  ( (array!34907 (arr!16763 (Array (_ BitVec 32) (_ BitVec 64))) (size!17128 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34906)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553921 (= res!346478 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!346477 () Bool)

(assert (=> start!50672 (=> (not res!346477) (not e!319415))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50672 (= res!346477 (validMask!0 mask!3119))))

(assert (=> start!50672 e!319415))

(assert (=> start!50672 true))

(declare-fun array_inv!12646 (array!34906) Bool)

(assert (=> start!50672 (array_inv!12646 a!3118)))

(declare-fun b!553922 () Bool)

(declare-fun res!346480 () Bool)

(declare-fun e!319414 () Bool)

(assert (=> b!553922 (=> (not res!346480) (not e!319414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34906 (_ BitVec 32)) Bool)

(assert (=> b!553922 (= res!346480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553923 () Bool)

(assert (=> b!553923 (= e!319414 (not true))))

(declare-fun e!319416 () Bool)

(assert (=> b!553923 e!319416))

(declare-fun res!346476 () Bool)

(assert (=> b!553923 (=> (not res!346476) (not e!319416))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553923 (= res!346476 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17178 0))(
  ( (Unit!17179) )
))
(declare-fun lt!251481 () Unit!17178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17178)

(assert (=> b!553923 (= lt!251481 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553924 () Bool)

(declare-fun res!346481 () Bool)

(assert (=> b!553924 (=> (not res!346481) (not e!319415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553924 (= res!346481 (validKeyInArray!0 (select (arr!16763 a!3118) j!142)))))

(declare-fun b!553925 () Bool)

(assert (=> b!553925 (= e!319415 e!319414)))

(declare-fun res!346475 () Bool)

(assert (=> b!553925 (=> (not res!346475) (not e!319414))))

(declare-datatypes ((SeekEntryResult!5209 0))(
  ( (MissingZero!5209 (index!23063 (_ BitVec 32))) (Found!5209 (index!23064 (_ BitVec 32))) (Intermediate!5209 (undefined!6021 Bool) (index!23065 (_ BitVec 32)) (x!51990 (_ BitVec 32))) (Undefined!5209) (MissingVacant!5209 (index!23066 (_ BitVec 32))) )
))
(declare-fun lt!251482 () SeekEntryResult!5209)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553925 (= res!346475 (or (= lt!251482 (MissingZero!5209 i!1132)) (= lt!251482 (MissingVacant!5209 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34906 (_ BitVec 32)) SeekEntryResult!5209)

(assert (=> b!553925 (= lt!251482 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553926 () Bool)

(declare-fun res!346484 () Bool)

(assert (=> b!553926 (=> (not res!346484) (not e!319415))))

(assert (=> b!553926 (= res!346484 (validKeyInArray!0 k0!1914))))

(declare-fun b!553927 () Bool)

(assert (=> b!553927 (= e!319416 (= (seekEntryOrOpen!0 (select (arr!16763 a!3118) j!142) a!3118 mask!3119) (Found!5209 j!142)))))

(declare-fun b!553928 () Bool)

(declare-fun res!346479 () Bool)

(assert (=> b!553928 (=> (not res!346479) (not e!319414))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34906 (_ BitVec 32)) SeekEntryResult!5209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553928 (= res!346479 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16763 a!3118) j!142) mask!3119) (select (arr!16763 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16763 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16763 a!3118) i!1132 k0!1914) j!142) (array!34907 (store (arr!16763 a!3118) i!1132 k0!1914) (size!17128 a!3118)) mask!3119)))))

(declare-fun b!553929 () Bool)

(declare-fun res!346483 () Bool)

(assert (=> b!553929 (=> (not res!346483) (not e!319414))))

(declare-datatypes ((List!10882 0))(
  ( (Nil!10879) (Cons!10878 (h!11863 (_ BitVec 64)) (t!17101 List!10882)) )
))
(declare-fun arrayNoDuplicates!0 (array!34906 (_ BitVec 32) List!10882) Bool)

(assert (=> b!553929 (= res!346483 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10879))))

(declare-fun b!553930 () Bool)

(declare-fun res!346482 () Bool)

(assert (=> b!553930 (=> (not res!346482) (not e!319415))))

(assert (=> b!553930 (= res!346482 (and (= (size!17128 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17128 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17128 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50672 res!346477) b!553930))

(assert (= (and b!553930 res!346482) b!553924))

(assert (= (and b!553924 res!346481) b!553926))

(assert (= (and b!553926 res!346484) b!553921))

(assert (= (and b!553921 res!346478) b!553925))

(assert (= (and b!553925 res!346475) b!553922))

(assert (= (and b!553922 res!346480) b!553929))

(assert (= (and b!553929 res!346483) b!553928))

(assert (= (and b!553928 res!346479) b!553923))

(assert (= (and b!553923 res!346476) b!553927))

(declare-fun m!530663 () Bool)

(assert (=> b!553925 m!530663))

(declare-fun m!530665 () Bool)

(assert (=> b!553927 m!530665))

(assert (=> b!553927 m!530665))

(declare-fun m!530667 () Bool)

(assert (=> b!553927 m!530667))

(assert (=> b!553928 m!530665))

(declare-fun m!530669 () Bool)

(assert (=> b!553928 m!530669))

(assert (=> b!553928 m!530665))

(declare-fun m!530671 () Bool)

(assert (=> b!553928 m!530671))

(declare-fun m!530673 () Bool)

(assert (=> b!553928 m!530673))

(assert (=> b!553928 m!530671))

(declare-fun m!530675 () Bool)

(assert (=> b!553928 m!530675))

(assert (=> b!553928 m!530669))

(assert (=> b!553928 m!530665))

(declare-fun m!530677 () Bool)

(assert (=> b!553928 m!530677))

(declare-fun m!530679 () Bool)

(assert (=> b!553928 m!530679))

(assert (=> b!553928 m!530671))

(assert (=> b!553928 m!530673))

(declare-fun m!530681 () Bool)

(assert (=> b!553922 m!530681))

(assert (=> b!553924 m!530665))

(assert (=> b!553924 m!530665))

(declare-fun m!530683 () Bool)

(assert (=> b!553924 m!530683))

(declare-fun m!530685 () Bool)

(assert (=> b!553926 m!530685))

(declare-fun m!530687 () Bool)

(assert (=> b!553921 m!530687))

(declare-fun m!530689 () Bool)

(assert (=> b!553923 m!530689))

(declare-fun m!530691 () Bool)

(assert (=> b!553923 m!530691))

(declare-fun m!530693 () Bool)

(assert (=> b!553929 m!530693))

(declare-fun m!530695 () Bool)

(assert (=> start!50672 m!530695))

(declare-fun m!530697 () Bool)

(assert (=> start!50672 m!530697))

(check-sat (not b!553927) (not b!553926) (not start!50672) (not b!553923) (not b!553928) (not b!553929) (not b!553921) (not b!553924) (not b!553922) (not b!553925))
(check-sat)
