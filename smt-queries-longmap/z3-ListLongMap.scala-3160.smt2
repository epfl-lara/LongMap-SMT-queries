; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44534 () Bool)

(assert start!44534)

(declare-fun b!488838 () Bool)

(declare-fun res!291893 () Bool)

(declare-fun e!287546 () Bool)

(assert (=> b!488838 (=> (not res!291893) (not e!287546))))

(declare-datatypes ((array!31644 0))(
  ( (array!31645 (arr!15211 (Array (_ BitVec 32) (_ BitVec 64))) (size!15575 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31644)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31644 (_ BitVec 32)) Bool)

(assert (=> b!488838 (= res!291893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488839 () Bool)

(declare-fun e!287547 () Bool)

(assert (=> b!488839 (= e!287547 e!287546)))

(declare-fun res!291887 () Bool)

(assert (=> b!488839 (=> (not res!291887) (not e!287546))))

(declare-datatypes ((SeekEntryResult!3678 0))(
  ( (MissingZero!3678 (index!16891 (_ BitVec 32))) (Found!3678 (index!16892 (_ BitVec 32))) (Intermediate!3678 (undefined!4490 Bool) (index!16893 (_ BitVec 32)) (x!46005 (_ BitVec 32))) (Undefined!3678) (MissingVacant!3678 (index!16894 (_ BitVec 32))) )
))
(declare-fun lt!220548 () SeekEntryResult!3678)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488839 (= res!291887 (or (= lt!220548 (MissingZero!3678 i!1204)) (= lt!220548 (MissingVacant!3678 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31644 (_ BitVec 32)) SeekEntryResult!3678)

(assert (=> b!488839 (= lt!220548 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488840 () Bool)

(declare-fun res!291888 () Bool)

(assert (=> b!488840 (=> (not res!291888) (not e!287547))))

(declare-fun arrayContainsKey!0 (array!31644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488840 (= res!291888 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488841 () Bool)

(declare-fun res!291890 () Bool)

(assert (=> b!488841 (=> (not res!291890) (not e!287547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488841 (= res!291890 (validKeyInArray!0 k0!2280))))

(declare-fun b!488842 () Bool)

(declare-fun e!287544 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488842 (= e!287544 (= (seekEntryOrOpen!0 (select (arr!15211 a!3235) j!176) a!3235 mask!3524) (Found!3678 j!176)))))

(declare-fun b!488843 () Bool)

(declare-fun res!291886 () Bool)

(assert (=> b!488843 (=> (not res!291886) (not e!287546))))

(declare-datatypes ((List!9369 0))(
  ( (Nil!9366) (Cons!9365 (h!10224 (_ BitVec 64)) (t!15597 List!9369)) )
))
(declare-fun arrayNoDuplicates!0 (array!31644 (_ BitVec 32) List!9369) Bool)

(assert (=> b!488843 (= res!291886 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9366))))

(declare-fun b!488844 () Bool)

(declare-fun res!291892 () Bool)

(assert (=> b!488844 (=> (not res!291892) (not e!287547))))

(assert (=> b!488844 (= res!291892 (validKeyInArray!0 (select (arr!15211 a!3235) j!176)))))

(declare-fun res!291891 () Bool)

(assert (=> start!44534 (=> (not res!291891) (not e!287547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44534 (= res!291891 (validMask!0 mask!3524))))

(assert (=> start!44534 e!287547))

(assert (=> start!44534 true))

(declare-fun array_inv!11007 (array!31644) Bool)

(assert (=> start!44534 (array_inv!11007 a!3235)))

(declare-fun b!488845 () Bool)

(declare-fun res!291885 () Bool)

(assert (=> b!488845 (=> (not res!291885) (not e!287547))))

(assert (=> b!488845 (= res!291885 (and (= (size!15575 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15575 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15575 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488846 () Bool)

(assert (=> b!488846 (= e!287546 (not true))))

(declare-fun lt!220549 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488846 (= lt!220549 (toIndex!0 (select (store (arr!15211 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!488846 e!287544))

(declare-fun res!291889 () Bool)

(assert (=> b!488846 (=> (not res!291889) (not e!287544))))

(assert (=> b!488846 (= res!291889 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14302 0))(
  ( (Unit!14303) )
))
(declare-fun lt!220547 () Unit!14302)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14302)

(assert (=> b!488846 (= lt!220547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44534 res!291891) b!488845))

(assert (= (and b!488845 res!291885) b!488844))

(assert (= (and b!488844 res!291892) b!488841))

(assert (= (and b!488841 res!291890) b!488840))

(assert (= (and b!488840 res!291888) b!488839))

(assert (= (and b!488839 res!291887) b!488838))

(assert (= (and b!488838 res!291893) b!488843))

(assert (= (and b!488843 res!291886) b!488846))

(assert (= (and b!488846 res!291889) b!488842))

(declare-fun m!468567 () Bool)

(assert (=> b!488843 m!468567))

(declare-fun m!468569 () Bool)

(assert (=> b!488839 m!468569))

(declare-fun m!468571 () Bool)

(assert (=> b!488838 m!468571))

(declare-fun m!468573 () Bool)

(assert (=> b!488841 m!468573))

(declare-fun m!468575 () Bool)

(assert (=> b!488844 m!468575))

(assert (=> b!488844 m!468575))

(declare-fun m!468577 () Bool)

(assert (=> b!488844 m!468577))

(declare-fun m!468579 () Bool)

(assert (=> start!44534 m!468579))

(declare-fun m!468581 () Bool)

(assert (=> start!44534 m!468581))

(declare-fun m!468583 () Bool)

(assert (=> b!488846 m!468583))

(declare-fun m!468585 () Bool)

(assert (=> b!488846 m!468585))

(declare-fun m!468587 () Bool)

(assert (=> b!488846 m!468587))

(declare-fun m!468589 () Bool)

(assert (=> b!488846 m!468589))

(assert (=> b!488846 m!468587))

(declare-fun m!468591 () Bool)

(assert (=> b!488846 m!468591))

(assert (=> b!488842 m!468575))

(assert (=> b!488842 m!468575))

(declare-fun m!468593 () Bool)

(assert (=> b!488842 m!468593))

(declare-fun m!468595 () Bool)

(assert (=> b!488840 m!468595))

(check-sat (not b!488842) (not b!488844) (not b!488838) (not b!488840) (not start!44534) (not b!488839) (not b!488846) (not b!488843) (not b!488841))
