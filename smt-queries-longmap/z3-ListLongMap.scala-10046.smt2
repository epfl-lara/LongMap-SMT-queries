; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118592 () Bool)

(assert start!118592)

(declare-fun b!1385982 () Bool)

(declare-fun res!926587 () Bool)

(declare-fun e!785462 () Bool)

(assert (=> b!1385982 (=> (not res!926587) (not e!785462))))

(declare-datatypes ((array!94793 0))(
  ( (array!94794 (arr!45772 (Array (_ BitVec 32) (_ BitVec 64))) (size!46323 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94793)

(declare-datatypes ((List!32287 0))(
  ( (Nil!32284) (Cons!32283 (h!33501 (_ BitVec 64)) (t!46973 List!32287)) )
))
(declare-fun arrayNoDuplicates!0 (array!94793 (_ BitVec 32) List!32287) Bool)

(assert (=> b!1385982 (= res!926587 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32284))))

(declare-fun b!1385983 () Bool)

(declare-fun res!926586 () Bool)

(assert (=> b!1385983 (=> (not res!926586) (not e!785462))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385983 (= res!926586 (validKeyInArray!0 (select (arr!45772 a!2938) i!1065)))))

(declare-fun b!1385984 () Bool)

(declare-fun e!785461 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385984 (= e!785461 (validKeyInArray!0 (select (arr!45772 a!2938) startIndex!16)))))

(declare-fun b!1385985 () Bool)

(declare-datatypes ((Unit!46133 0))(
  ( (Unit!46134) )
))
(declare-fun e!785464 () Unit!46133)

(declare-fun lt!609483 () Unit!46133)

(assert (=> b!1385985 (= e!785464 lt!609483)))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lt!609485 () Unit!46133)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46133)

(assert (=> b!1385985 (= lt!609485 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun lt!609484 () array!94793)

(declare-datatypes ((SeekEntryResult!10068 0))(
  ( (MissingZero!10068 (index!42643 (_ BitVec 32))) (Found!10068 (index!42644 (_ BitVec 32))) (Intermediate!10068 (undefined!10880 Bool) (index!42645 (_ BitVec 32)) (x!124299 (_ BitVec 32))) (Undefined!10068) (MissingVacant!10068 (index!42646 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94793 (_ BitVec 32)) SeekEntryResult!10068)

(assert (=> b!1385985 (= (seekEntryOrOpen!0 (select (arr!45772 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45772 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609484 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46133)

(assert (=> b!1385985 (= lt!609483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94793 (_ BitVec 32)) Bool)

(assert (=> b!1385985 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385986 () Bool)

(declare-fun res!926590 () Bool)

(assert (=> b!1385986 (=> (not res!926590) (not e!785462))))

(assert (=> b!1385986 (= res!926590 (and (not (= (select (arr!45772 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45772 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385987 () Bool)

(declare-fun Unit!46135 () Unit!46133)

(assert (=> b!1385987 (= e!785464 Unit!46135)))

(declare-fun b!1385988 () Bool)

(declare-fun e!785463 () Bool)

(assert (=> b!1385988 (= e!785462 e!785463)))

(declare-fun res!926583 () Bool)

(assert (=> b!1385988 (=> (not res!926583) (not e!785463))))

(assert (=> b!1385988 (= res!926583 (and (bvslt startIndex!16 (bvsub (size!46323 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609482 () Unit!46133)

(assert (=> b!1385988 (= lt!609482 e!785464)))

(declare-fun c!129147 () Bool)

(assert (=> b!1385988 (= c!129147 e!785461)))

(declare-fun res!926585 () Bool)

(assert (=> b!1385988 (=> (not res!926585) (not e!785461))))

(assert (=> b!1385988 (= res!926585 (not (= startIndex!16 i!1065)))))

(assert (=> b!1385988 (= lt!609484 (array!94794 (store (arr!45772 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46323 a!2938)))))

(declare-fun b!1385989 () Bool)

(declare-fun res!926589 () Bool)

(assert (=> b!1385989 (=> (not res!926589) (not e!785462))))

(assert (=> b!1385989 (= res!926589 (and (= (size!46323 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46323 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46323 a!2938))))))

(declare-fun res!926588 () Bool)

(assert (=> start!118592 (=> (not res!926588) (not e!785462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118592 (= res!926588 (validMask!0 mask!2987))))

(assert (=> start!118592 e!785462))

(assert (=> start!118592 true))

(declare-fun array_inv!35053 (array!94793) Bool)

(assert (=> start!118592 (array_inv!35053 a!2938)))

(declare-fun b!1385990 () Bool)

(declare-fun res!926584 () Bool)

(assert (=> b!1385990 (=> (not res!926584) (not e!785462))))

(assert (=> b!1385990 (= res!926584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385991 () Bool)

(assert (=> b!1385991 (= e!785463 (not true))))

(assert (=> b!1385991 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609484 mask!2987)))

(declare-fun lt!609486 () Unit!46133)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46133)

(assert (=> b!1385991 (= lt!609486 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(assert (= (and start!118592 res!926588) b!1385989))

(assert (= (and b!1385989 res!926589) b!1385983))

(assert (= (and b!1385983 res!926586) b!1385982))

(assert (= (and b!1385982 res!926587) b!1385990))

(assert (= (and b!1385990 res!926584) b!1385986))

(assert (= (and b!1385986 res!926590) b!1385988))

(assert (= (and b!1385988 res!926585) b!1385984))

(assert (= (and b!1385988 c!129147) b!1385985))

(assert (= (and b!1385988 (not c!129147)) b!1385987))

(assert (= (and b!1385988 res!926583) b!1385991))

(declare-fun m!1271577 () Bool)

(assert (=> b!1385990 m!1271577))

(declare-fun m!1271579 () Bool)

(assert (=> b!1385991 m!1271579))

(declare-fun m!1271581 () Bool)

(assert (=> b!1385991 m!1271581))

(declare-fun m!1271583 () Bool)

(assert (=> b!1385983 m!1271583))

(assert (=> b!1385983 m!1271583))

(declare-fun m!1271585 () Bool)

(assert (=> b!1385983 m!1271585))

(declare-fun m!1271587 () Bool)

(assert (=> b!1385982 m!1271587))

(declare-fun m!1271589 () Bool)

(assert (=> start!118592 m!1271589))

(declare-fun m!1271591 () Bool)

(assert (=> start!118592 m!1271591))

(declare-fun m!1271593 () Bool)

(assert (=> b!1385984 m!1271593))

(assert (=> b!1385984 m!1271593))

(declare-fun m!1271595 () Bool)

(assert (=> b!1385984 m!1271595))

(declare-fun m!1271597 () Bool)

(assert (=> b!1385985 m!1271597))

(declare-fun m!1271599 () Bool)

(assert (=> b!1385985 m!1271599))

(declare-fun m!1271601 () Bool)

(assert (=> b!1385985 m!1271601))

(assert (=> b!1385985 m!1271599))

(declare-fun m!1271603 () Bool)

(assert (=> b!1385985 m!1271603))

(declare-fun m!1271605 () Bool)

(assert (=> b!1385985 m!1271605))

(assert (=> b!1385985 m!1271593))

(declare-fun m!1271607 () Bool)

(assert (=> b!1385985 m!1271607))

(assert (=> b!1385985 m!1271593))

(declare-fun m!1271609 () Bool)

(assert (=> b!1385985 m!1271609))

(assert (=> b!1385986 m!1271583))

(assert (=> b!1385988 m!1271601))

(check-sat (not b!1385983) (not b!1385985) (not b!1385990) (not b!1385982) (not b!1385984) (not b!1385991) (not start!118592))
(check-sat)
