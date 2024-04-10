; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122678 () Bool)

(assert start!122678)

(declare-fun b!1421143 () Bool)

(declare-fun res!956576 () Bool)

(declare-fun e!803638 () Bool)

(assert (=> b!1421143 (=> (not res!956576) (not e!803638))))

(declare-datatypes ((array!97043 0))(
  ( (array!97044 (arr!46839 (Array (_ BitVec 32) (_ BitVec 64))) (size!47389 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97043)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11124 0))(
  ( (MissingZero!11124 (index!46888 (_ BitVec 32))) (Found!11124 (index!46889 (_ BitVec 32))) (Intermediate!11124 (undefined!11936 Bool) (index!46890 (_ BitVec 32)) (x!128542 (_ BitVec 32))) (Undefined!11124) (MissingVacant!11124 (index!46891 (_ BitVec 32))) )
))
(declare-fun lt!626141 () SeekEntryResult!11124)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97043 (_ BitVec 32)) SeekEntryResult!11124)

(assert (=> b!1421143 (= res!956576 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46839 a!2831) j!81) a!2831 mask!2608) lt!626141))))

(declare-fun b!1421144 () Bool)

(declare-fun res!956587 () Bool)

(declare-fun e!803639 () Bool)

(assert (=> b!1421144 (=> (not res!956587) (not e!803639))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421144 (= res!956587 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47389 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47389 a!2831))))))

(declare-fun b!1421145 () Bool)

(declare-fun res!956577 () Bool)

(assert (=> b!1421145 (=> (not res!956577) (not e!803639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97043 (_ BitVec 32)) Bool)

(assert (=> b!1421145 (= res!956577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!956578 () Bool)

(assert (=> start!122678 (=> (not res!956578) (not e!803639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122678 (= res!956578 (validMask!0 mask!2608))))

(assert (=> start!122678 e!803639))

(assert (=> start!122678 true))

(declare-fun array_inv!35867 (array!97043) Bool)

(assert (=> start!122678 (array_inv!35867 a!2831)))

(declare-fun b!1421146 () Bool)

(declare-fun res!956581 () Bool)

(assert (=> b!1421146 (=> (not res!956581) (not e!803639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421146 (= res!956581 (validKeyInArray!0 (select (arr!46839 a!2831) j!81)))))

(declare-fun b!1421147 () Bool)

(declare-fun res!956584 () Bool)

(assert (=> b!1421147 (=> (not res!956584) (not e!803639))))

(declare-datatypes ((List!33349 0))(
  ( (Nil!33346) (Cons!33345 (h!34647 (_ BitVec 64)) (t!48043 List!33349)) )
))
(declare-fun arrayNoDuplicates!0 (array!97043 (_ BitVec 32) List!33349) Bool)

(assert (=> b!1421147 (= res!956584 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33346))))

(declare-fun b!1421148 () Bool)

(declare-fun e!803637 () Bool)

(assert (=> b!1421148 (= e!803637 e!803638)))

(declare-fun res!956586 () Bool)

(assert (=> b!1421148 (=> (not res!956586) (not e!803638))))

(declare-fun lt!626143 () array!97043)

(declare-fun lt!626142 () (_ BitVec 64))

(declare-fun lt!626145 () SeekEntryResult!11124)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421148 (= res!956586 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626142 mask!2608) lt!626142 lt!626143 mask!2608) lt!626145))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1421148 (= lt!626145 (Intermediate!11124 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421148 (= lt!626142 (select (store (arr!46839 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421148 (= lt!626143 (array!97044 (store (arr!46839 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47389 a!2831)))))

(declare-fun b!1421149 () Bool)

(declare-fun res!956579 () Bool)

(assert (=> b!1421149 (=> (not res!956579) (not e!803639))))

(assert (=> b!1421149 (= res!956579 (and (= (size!47389 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47389 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47389 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421150 () Bool)

(assert (=> b!1421150 (= e!803638 (not true))))

(assert (=> b!1421150 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48084 0))(
  ( (Unit!48085) )
))
(declare-fun lt!626144 () Unit!48084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48084)

(assert (=> b!1421150 (= lt!626144 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421151 () Bool)

(declare-fun res!956580 () Bool)

(assert (=> b!1421151 (=> (not res!956580) (not e!803638))))

(assert (=> b!1421151 (= res!956580 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421152 () Bool)

(assert (=> b!1421152 (= e!803639 e!803637)))

(declare-fun res!956585 () Bool)

(assert (=> b!1421152 (=> (not res!956585) (not e!803637))))

(assert (=> b!1421152 (= res!956585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46839 a!2831) j!81) mask!2608) (select (arr!46839 a!2831) j!81) a!2831 mask!2608) lt!626141))))

(assert (=> b!1421152 (= lt!626141 (Intermediate!11124 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421153 () Bool)

(declare-fun res!956582 () Bool)

(assert (=> b!1421153 (=> (not res!956582) (not e!803639))))

(assert (=> b!1421153 (= res!956582 (validKeyInArray!0 (select (arr!46839 a!2831) i!982)))))

(declare-fun b!1421154 () Bool)

(declare-fun res!956583 () Bool)

(assert (=> b!1421154 (=> (not res!956583) (not e!803638))))

(assert (=> b!1421154 (= res!956583 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626142 lt!626143 mask!2608) lt!626145))))

(assert (= (and start!122678 res!956578) b!1421149))

(assert (= (and b!1421149 res!956579) b!1421153))

(assert (= (and b!1421153 res!956582) b!1421146))

(assert (= (and b!1421146 res!956581) b!1421145))

(assert (= (and b!1421145 res!956577) b!1421147))

(assert (= (and b!1421147 res!956584) b!1421144))

(assert (= (and b!1421144 res!956587) b!1421152))

(assert (= (and b!1421152 res!956585) b!1421148))

(assert (= (and b!1421148 res!956586) b!1421143))

(assert (= (and b!1421143 res!956576) b!1421154))

(assert (= (and b!1421154 res!956583) b!1421151))

(assert (= (and b!1421151 res!956580) b!1421150))

(declare-fun m!1311687 () Bool)

(assert (=> b!1421148 m!1311687))

(assert (=> b!1421148 m!1311687))

(declare-fun m!1311689 () Bool)

(assert (=> b!1421148 m!1311689))

(declare-fun m!1311691 () Bool)

(assert (=> b!1421148 m!1311691))

(declare-fun m!1311693 () Bool)

(assert (=> b!1421148 m!1311693))

(declare-fun m!1311695 () Bool)

(assert (=> b!1421145 m!1311695))

(declare-fun m!1311697 () Bool)

(assert (=> b!1421153 m!1311697))

(assert (=> b!1421153 m!1311697))

(declare-fun m!1311699 () Bool)

(assert (=> b!1421153 m!1311699))

(declare-fun m!1311701 () Bool)

(assert (=> b!1421152 m!1311701))

(assert (=> b!1421152 m!1311701))

(declare-fun m!1311703 () Bool)

(assert (=> b!1421152 m!1311703))

(assert (=> b!1421152 m!1311703))

(assert (=> b!1421152 m!1311701))

(declare-fun m!1311705 () Bool)

(assert (=> b!1421152 m!1311705))

(assert (=> b!1421146 m!1311701))

(assert (=> b!1421146 m!1311701))

(declare-fun m!1311707 () Bool)

(assert (=> b!1421146 m!1311707))

(declare-fun m!1311709 () Bool)

(assert (=> start!122678 m!1311709))

(declare-fun m!1311711 () Bool)

(assert (=> start!122678 m!1311711))

(declare-fun m!1311713 () Bool)

(assert (=> b!1421150 m!1311713))

(declare-fun m!1311715 () Bool)

(assert (=> b!1421150 m!1311715))

(assert (=> b!1421143 m!1311701))

(assert (=> b!1421143 m!1311701))

(declare-fun m!1311717 () Bool)

(assert (=> b!1421143 m!1311717))

(declare-fun m!1311719 () Bool)

(assert (=> b!1421154 m!1311719))

(declare-fun m!1311721 () Bool)

(assert (=> b!1421147 m!1311721))

(check-sat (not b!1421148) (not b!1421153) (not b!1421146) (not b!1421145) (not start!122678) (not b!1421147) (not b!1421152) (not b!1421154) (not b!1421150) (not b!1421143))
