; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123344 () Bool)

(assert start!123344)

(declare-fun b!1430225 () Bool)

(declare-fun res!964708 () Bool)

(declare-fun e!807504 () Bool)

(assert (=> b!1430225 (=> (not res!964708) (not e!807504))))

(declare-datatypes ((array!97407 0))(
  ( (array!97408 (arr!47014 (Array (_ BitVec 32) (_ BitVec 64))) (size!47566 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97407)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430225 (= res!964708 (validKeyInArray!0 (select (arr!47014 a!2831) j!81)))))

(declare-fun b!1430226 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun e!807503 () Bool)

(assert (=> b!1430226 (= e!807503 (or (= (select (arr!47014 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47014 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47014 a!2831) index!585) (select (arr!47014 a!2831) j!81)) (not (= (select (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13)))))

(declare-fun b!1430227 () Bool)

(declare-fun res!964713 () Bool)

(assert (=> b!1430227 (=> (not res!964713) (not e!807504))))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1430227 (= res!964713 (and (= (size!47566 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47566 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47566 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430229 () Bool)

(declare-fun e!807505 () Bool)

(assert (=> b!1430229 (= e!807504 e!807505)))

(declare-fun res!964716 () Bool)

(assert (=> b!1430229 (=> (not res!964716) (not e!807505))))

(declare-datatypes ((SeekEntryResult!11320 0))(
  ( (MissingZero!11320 (index!47672 (_ BitVec 32))) (Found!11320 (index!47673 (_ BitVec 32))) (Intermediate!11320 (undefined!12132 Bool) (index!47674 (_ BitVec 32)) (x!129301 (_ BitVec 32))) (Undefined!11320) (MissingVacant!11320 (index!47675 (_ BitVec 32))) )
))
(declare-fun lt!629525 () SeekEntryResult!11320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97407 (_ BitVec 32)) SeekEntryResult!11320)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430229 (= res!964716 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47014 a!2831) j!81) mask!2608) (select (arr!47014 a!2831) j!81) a!2831 mask!2608) lt!629525))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1430229 (= lt!629525 (Intermediate!11320 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430230 () Bool)

(declare-fun e!807502 () Bool)

(assert (=> b!1430230 (= e!807505 e!807502)))

(declare-fun res!964714 () Bool)

(assert (=> b!1430230 (=> (not res!964714) (not e!807502))))

(declare-fun lt!629522 () array!97407)

(declare-fun lt!629524 () (_ BitVec 64))

(declare-fun lt!629523 () SeekEntryResult!11320)

(assert (=> b!1430230 (= res!964714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629524 mask!2608) lt!629524 lt!629522 mask!2608) lt!629523))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430230 (= lt!629523 (Intermediate!11320 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430230 (= lt!629524 (select (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430230 (= lt!629522 (array!97408 (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47566 a!2831)))))

(declare-fun b!1430231 () Bool)

(declare-fun res!964707 () Bool)

(assert (=> b!1430231 (=> (not res!964707) (not e!807504))))

(declare-datatypes ((List!33602 0))(
  ( (Nil!33599) (Cons!33598 (h!34915 (_ BitVec 64)) (t!48288 List!33602)) )
))
(declare-fun arrayNoDuplicates!0 (array!97407 (_ BitVec 32) List!33602) Bool)

(assert (=> b!1430231 (= res!964707 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33599))))

(declare-fun b!1430232 () Bool)

(declare-fun res!964717 () Bool)

(assert (=> b!1430232 (=> (not res!964717) (not e!807504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97407 (_ BitVec 32)) Bool)

(assert (=> b!1430232 (= res!964717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430233 () Bool)

(declare-fun res!964706 () Bool)

(assert (=> b!1430233 (=> (not res!964706) (not e!807503))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97407 (_ BitVec 32)) SeekEntryResult!11320)

(assert (=> b!1430233 (= res!964706 (= (seekEntryOrOpen!0 (select (arr!47014 a!2831) j!81) a!2831 mask!2608) (Found!11320 j!81)))))

(declare-fun b!1430234 () Bool)

(assert (=> b!1430234 (= e!807502 (not (or (= (select (arr!47014 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47014 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47014 a!2831) index!585) (select (arr!47014 a!2831) j!81)) (not (= (select (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= intermediateAfterIndex!13 i!982))))))

(assert (=> b!1430234 e!807503))

(declare-fun res!964704 () Bool)

(assert (=> b!1430234 (=> (not res!964704) (not e!807503))))

(assert (=> b!1430234 (= res!964704 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48225 0))(
  ( (Unit!48226) )
))
(declare-fun lt!629521 () Unit!48225)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48225)

(assert (=> b!1430234 (= lt!629521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430235 () Bool)

(declare-fun res!964715 () Bool)

(assert (=> b!1430235 (=> (not res!964715) (not e!807504))))

(assert (=> b!1430235 (= res!964715 (validKeyInArray!0 (select (arr!47014 a!2831) i!982)))))

(declare-fun b!1430236 () Bool)

(declare-fun res!964705 () Bool)

(assert (=> b!1430236 (=> (not res!964705) (not e!807502))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1430236 (= res!964705 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629524 lt!629522 mask!2608) lt!629523))))

(declare-fun b!1430228 () Bool)

(declare-fun res!964709 () Bool)

(assert (=> b!1430228 (=> (not res!964709) (not e!807502))))

(assert (=> b!1430228 (= res!964709 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47014 a!2831) j!81) a!2831 mask!2608) lt!629525))))

(declare-fun res!964712 () Bool)

(assert (=> start!123344 (=> (not res!964712) (not e!807504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123344 (= res!964712 (validMask!0 mask!2608))))

(assert (=> start!123344 e!807504))

(assert (=> start!123344 true))

(declare-fun array_inv!36247 (array!97407) Bool)

(assert (=> start!123344 (array_inv!36247 a!2831)))

(declare-fun b!1430237 () Bool)

(declare-fun res!964711 () Bool)

(assert (=> b!1430237 (=> (not res!964711) (not e!807502))))

(assert (=> b!1430237 (= res!964711 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430238 () Bool)

(declare-fun res!964710 () Bool)

(assert (=> b!1430238 (=> (not res!964710) (not e!807504))))

(assert (=> b!1430238 (= res!964710 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47566 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47566 a!2831))))))

(assert (= (and start!123344 res!964712) b!1430227))

(assert (= (and b!1430227 res!964713) b!1430235))

(assert (= (and b!1430235 res!964715) b!1430225))

(assert (= (and b!1430225 res!964708) b!1430232))

(assert (= (and b!1430232 res!964717) b!1430231))

(assert (= (and b!1430231 res!964707) b!1430238))

(assert (= (and b!1430238 res!964710) b!1430229))

(assert (= (and b!1430229 res!964716) b!1430230))

(assert (= (and b!1430230 res!964714) b!1430228))

(assert (= (and b!1430228 res!964709) b!1430236))

(assert (= (and b!1430236 res!964705) b!1430237))

(assert (= (and b!1430237 res!964711) b!1430234))

(assert (= (and b!1430234 res!964704) b!1430233))

(assert (= (and b!1430233 res!964706) b!1430226))

(declare-fun m!1319727 () Bool)

(assert (=> b!1430236 m!1319727))

(declare-fun m!1319729 () Bool)

(assert (=> b!1430225 m!1319729))

(assert (=> b!1430225 m!1319729))

(declare-fun m!1319731 () Bool)

(assert (=> b!1430225 m!1319731))

(declare-fun m!1319733 () Bool)

(assert (=> b!1430231 m!1319733))

(declare-fun m!1319735 () Bool)

(assert (=> b!1430234 m!1319735))

(declare-fun m!1319737 () Bool)

(assert (=> b!1430234 m!1319737))

(declare-fun m!1319739 () Bool)

(assert (=> b!1430234 m!1319739))

(declare-fun m!1319741 () Bool)

(assert (=> b!1430234 m!1319741))

(assert (=> b!1430234 m!1319729))

(declare-fun m!1319743 () Bool)

(assert (=> b!1430234 m!1319743))

(declare-fun m!1319745 () Bool)

(assert (=> b!1430235 m!1319745))

(assert (=> b!1430235 m!1319745))

(declare-fun m!1319747 () Bool)

(assert (=> b!1430235 m!1319747))

(assert (=> b!1430229 m!1319729))

(assert (=> b!1430229 m!1319729))

(declare-fun m!1319749 () Bool)

(assert (=> b!1430229 m!1319749))

(assert (=> b!1430229 m!1319749))

(assert (=> b!1430229 m!1319729))

(declare-fun m!1319751 () Bool)

(assert (=> b!1430229 m!1319751))

(assert (=> b!1430228 m!1319729))

(assert (=> b!1430228 m!1319729))

(declare-fun m!1319753 () Bool)

(assert (=> b!1430228 m!1319753))

(declare-fun m!1319755 () Bool)

(assert (=> start!123344 m!1319755))

(declare-fun m!1319757 () Bool)

(assert (=> start!123344 m!1319757))

(assert (=> b!1430226 m!1319739))

(assert (=> b!1430226 m!1319729))

(assert (=> b!1430226 m!1319735))

(assert (=> b!1430226 m!1319737))

(declare-fun m!1319759 () Bool)

(assert (=> b!1430232 m!1319759))

(assert (=> b!1430233 m!1319729))

(assert (=> b!1430233 m!1319729))

(declare-fun m!1319761 () Bool)

(assert (=> b!1430233 m!1319761))

(declare-fun m!1319763 () Bool)

(assert (=> b!1430230 m!1319763))

(assert (=> b!1430230 m!1319763))

(declare-fun m!1319765 () Bool)

(assert (=> b!1430230 m!1319765))

(assert (=> b!1430230 m!1319735))

(declare-fun m!1319767 () Bool)

(assert (=> b!1430230 m!1319767))

(check-sat (not b!1430225) (not start!123344) (not b!1430231) (not b!1430229) (not b!1430228) (not b!1430235) (not b!1430233) (not b!1430232) (not b!1430236) (not b!1430234) (not b!1430230))
(check-sat)
