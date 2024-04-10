; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126252 () Bool)

(assert start!126252)

(declare-fun b!1479839 () Bool)

(declare-fun e!830048 () Bool)

(declare-fun e!830051 () Bool)

(assert (=> b!1479839 (= e!830048 e!830051)))

(declare-fun res!1005716 () Bool)

(assert (=> b!1479839 (=> (not res!1005716) (not e!830051))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12198 0))(
  ( (MissingZero!12198 (index!51184 (_ BitVec 32))) (Found!12198 (index!51185 (_ BitVec 32))) (Intermediate!12198 (undefined!13010 Bool) (index!51186 (_ BitVec 32)) (x!132765 (_ BitVec 32))) (Undefined!12198) (MissingVacant!12198 (index!51187 (_ BitVec 32))) )
))
(declare-fun lt!646186 () SeekEntryResult!12198)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479839 (= res!1005716 (= lt!646186 (Intermediate!12198 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99358 0))(
  ( (array!99359 (arr!47958 (Array (_ BitVec 32) (_ BitVec 64))) (size!48508 (_ BitVec 32))) )
))
(declare-fun lt!646188 () array!99358)

(declare-fun lt!646190 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99358 (_ BitVec 32)) SeekEntryResult!12198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479839 (= lt!646186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646190 mask!2687) lt!646190 lt!646188 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99358)

(assert (=> b!1479839 (= lt!646190 (select (store (arr!47958 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479840 () Bool)

(declare-fun res!1005715 () Bool)

(declare-fun e!830052 () Bool)

(assert (=> b!1479840 (=> (not res!1005715) (not e!830052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99358 (_ BitVec 32)) Bool)

(assert (=> b!1479840 (= res!1005715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479841 () Bool)

(declare-fun e!830056 () Bool)

(declare-fun e!830054 () Bool)

(assert (=> b!1479841 (= e!830056 e!830054)))

(declare-fun res!1005720 () Bool)

(assert (=> b!1479841 (=> res!1005720 e!830054)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1479841 (= res!1005720 (or (and (= (select (arr!47958 a!2862) index!646) (select (store (arr!47958 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47958 a!2862) index!646) (select (arr!47958 a!2862) j!93))) (not (= (select (arr!47958 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1479842 () Bool)

(declare-fun e!830057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99358 (_ BitVec 32)) SeekEntryResult!12198)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99358 (_ BitVec 32)) SeekEntryResult!12198)

(assert (=> b!1479842 (= e!830057 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646190 lt!646188 mask!2687) (seekEntryOrOpen!0 lt!646190 lt!646188 mask!2687)))))

(declare-fun b!1479843 () Bool)

(declare-fun res!1005707 () Bool)

(assert (=> b!1479843 (=> (not res!1005707) (not e!830051))))

(assert (=> b!1479843 (= res!1005707 e!830057)))

(declare-fun c!136587 () Bool)

(assert (=> b!1479843 (= c!136587 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479844 () Bool)

(declare-fun res!1005705 () Bool)

(declare-fun e!830055 () Bool)

(assert (=> b!1479844 (=> res!1005705 e!830055)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!646185 () SeekEntryResult!12198)

(assert (=> b!1479844 (= res!1005705 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47958 a!2862) j!93) a!2862 mask!2687) lt!646185)))))

(declare-fun b!1479845 () Bool)

(declare-fun e!830053 () Bool)

(assert (=> b!1479845 (= e!830054 e!830053)))

(declare-fun res!1005710 () Bool)

(assert (=> b!1479845 (=> (not res!1005710) (not e!830053))))

(declare-fun lt!646187 () SeekEntryResult!12198)

(assert (=> b!1479845 (= res!1005710 (= lt!646187 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47958 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479846 () Bool)

(declare-fun res!1005719 () Bool)

(assert (=> b!1479846 (=> (not res!1005719) (not e!830052))))

(assert (=> b!1479846 (= res!1005719 (and (= (size!48508 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48508 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48508 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479848 () Bool)

(declare-fun e!830049 () Bool)

(assert (=> b!1479848 (= e!830049 e!830048)))

(declare-fun res!1005714 () Bool)

(assert (=> b!1479848 (=> (not res!1005714) (not e!830048))))

(declare-fun lt!646189 () SeekEntryResult!12198)

(assert (=> b!1479848 (= res!1005714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47958 a!2862) j!93) mask!2687) (select (arr!47958 a!2862) j!93) a!2862 mask!2687) lt!646189))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479848 (= lt!646189 (Intermediate!12198 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479849 () Bool)

(declare-fun res!1005718 () Bool)

(assert (=> b!1479849 (=> (not res!1005718) (not e!830052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479849 (= res!1005718 (validKeyInArray!0 (select (arr!47958 a!2862) j!93)))))

(declare-fun b!1479850 () Bool)

(declare-fun res!1005721 () Bool)

(assert (=> b!1479850 (=> (not res!1005721) (not e!830052))))

(assert (=> b!1479850 (= res!1005721 (validKeyInArray!0 (select (arr!47958 a!2862) i!1006)))))

(declare-fun b!1479851 () Bool)

(assert (=> b!1479851 (= e!830051 (not e!830055))))

(declare-fun res!1005712 () Bool)

(assert (=> b!1479851 (=> res!1005712 e!830055)))

(assert (=> b!1479851 (= res!1005712 (or (and (= (select (arr!47958 a!2862) index!646) (select (store (arr!47958 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47958 a!2862) index!646) (select (arr!47958 a!2862) j!93))) (not (= (select (arr!47958 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47958 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479851 e!830056))

(declare-fun res!1005708 () Bool)

(assert (=> b!1479851 (=> (not res!1005708) (not e!830056))))

(assert (=> b!1479851 (= res!1005708 (and (= lt!646187 lt!646185) (or (= (select (arr!47958 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47958 a!2862) intermediateBeforeIndex!19) (select (arr!47958 a!2862) j!93)))))))

(assert (=> b!1479851 (= lt!646185 (Found!12198 j!93))))

(assert (=> b!1479851 (= lt!646187 (seekEntryOrOpen!0 (select (arr!47958 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479851 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49736 0))(
  ( (Unit!49737) )
))
(declare-fun lt!646184 () Unit!49736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49736)

(assert (=> b!1479851 (= lt!646184 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479852 () Bool)

(declare-fun res!1005713 () Bool)

(assert (=> b!1479852 (=> (not res!1005713) (not e!830051))))

(assert (=> b!1479852 (= res!1005713 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479853 () Bool)

(declare-fun res!1005704 () Bool)

(assert (=> b!1479853 (=> (not res!1005704) (not e!830048))))

(assert (=> b!1479853 (= res!1005704 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47958 a!2862) j!93) a!2862 mask!2687) lt!646189))))

(declare-fun b!1479854 () Bool)

(assert (=> b!1479854 (= e!830053 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479855 () Bool)

(declare-fun res!1005711 () Bool)

(assert (=> b!1479855 (=> (not res!1005711) (not e!830052))))

(declare-datatypes ((List!34459 0))(
  ( (Nil!34456) (Cons!34455 (h!35823 (_ BitVec 64)) (t!49153 List!34459)) )
))
(declare-fun arrayNoDuplicates!0 (array!99358 (_ BitVec 32) List!34459) Bool)

(assert (=> b!1479855 (= res!1005711 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34456))))

(declare-fun b!1479856 () Bool)

(assert (=> b!1479856 (= e!830055 true)))

(assert (=> b!1479856 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646190 lt!646188 mask!2687) lt!646185)))

(declare-fun lt!646191 () Unit!49736)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49736)

(assert (=> b!1479856 (= lt!646191 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479847 () Bool)

(assert (=> b!1479847 (= e!830057 (= lt!646186 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646190 lt!646188 mask!2687)))))

(declare-fun res!1005706 () Bool)

(assert (=> start!126252 (=> (not res!1005706) (not e!830052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126252 (= res!1005706 (validMask!0 mask!2687))))

(assert (=> start!126252 e!830052))

(assert (=> start!126252 true))

(declare-fun array_inv!36986 (array!99358) Bool)

(assert (=> start!126252 (array_inv!36986 a!2862)))

(declare-fun b!1479857 () Bool)

(declare-fun res!1005717 () Bool)

(assert (=> b!1479857 (=> (not res!1005717) (not e!830052))))

(assert (=> b!1479857 (= res!1005717 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48508 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48508 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48508 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479858 () Bool)

(assert (=> b!1479858 (= e!830052 e!830049)))

(declare-fun res!1005709 () Bool)

(assert (=> b!1479858 (=> (not res!1005709) (not e!830049))))

(assert (=> b!1479858 (= res!1005709 (= (select (store (arr!47958 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479858 (= lt!646188 (array!99359 (store (arr!47958 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48508 a!2862)))))

(assert (= (and start!126252 res!1005706) b!1479846))

(assert (= (and b!1479846 res!1005719) b!1479850))

(assert (= (and b!1479850 res!1005721) b!1479849))

(assert (= (and b!1479849 res!1005718) b!1479840))

(assert (= (and b!1479840 res!1005715) b!1479855))

(assert (= (and b!1479855 res!1005711) b!1479857))

(assert (= (and b!1479857 res!1005717) b!1479858))

(assert (= (and b!1479858 res!1005709) b!1479848))

(assert (= (and b!1479848 res!1005714) b!1479853))

(assert (= (and b!1479853 res!1005704) b!1479839))

(assert (= (and b!1479839 res!1005716) b!1479843))

(assert (= (and b!1479843 c!136587) b!1479847))

(assert (= (and b!1479843 (not c!136587)) b!1479842))

(assert (= (and b!1479843 res!1005707) b!1479852))

(assert (= (and b!1479852 res!1005713) b!1479851))

(assert (= (and b!1479851 res!1005708) b!1479841))

(assert (= (and b!1479841 (not res!1005720)) b!1479845))

(assert (= (and b!1479845 res!1005710) b!1479854))

(assert (= (and b!1479851 (not res!1005712)) b!1479844))

(assert (= (and b!1479844 (not res!1005705)) b!1479856))

(declare-fun m!1365681 () Bool)

(assert (=> b!1479842 m!1365681))

(declare-fun m!1365683 () Bool)

(assert (=> b!1479842 m!1365683))

(declare-fun m!1365685 () Bool)

(assert (=> b!1479849 m!1365685))

(assert (=> b!1479849 m!1365685))

(declare-fun m!1365687 () Bool)

(assert (=> b!1479849 m!1365687))

(declare-fun m!1365689 () Bool)

(assert (=> b!1479840 m!1365689))

(assert (=> b!1479848 m!1365685))

(assert (=> b!1479848 m!1365685))

(declare-fun m!1365691 () Bool)

(assert (=> b!1479848 m!1365691))

(assert (=> b!1479848 m!1365691))

(assert (=> b!1479848 m!1365685))

(declare-fun m!1365693 () Bool)

(assert (=> b!1479848 m!1365693))

(assert (=> b!1479845 m!1365685))

(assert (=> b!1479845 m!1365685))

(declare-fun m!1365695 () Bool)

(assert (=> b!1479845 m!1365695))

(declare-fun m!1365697 () Bool)

(assert (=> start!126252 m!1365697))

(declare-fun m!1365699 () Bool)

(assert (=> start!126252 m!1365699))

(declare-fun m!1365701 () Bool)

(assert (=> b!1479841 m!1365701))

(declare-fun m!1365703 () Bool)

(assert (=> b!1479841 m!1365703))

(declare-fun m!1365705 () Bool)

(assert (=> b!1479841 m!1365705))

(assert (=> b!1479841 m!1365685))

(assert (=> b!1479853 m!1365685))

(assert (=> b!1479853 m!1365685))

(declare-fun m!1365707 () Bool)

(assert (=> b!1479853 m!1365707))

(declare-fun m!1365709 () Bool)

(assert (=> b!1479839 m!1365709))

(assert (=> b!1479839 m!1365709))

(declare-fun m!1365711 () Bool)

(assert (=> b!1479839 m!1365711))

(assert (=> b!1479839 m!1365703))

(declare-fun m!1365713 () Bool)

(assert (=> b!1479839 m!1365713))

(assert (=> b!1479844 m!1365685))

(assert (=> b!1479844 m!1365685))

(declare-fun m!1365715 () Bool)

(assert (=> b!1479844 m!1365715))

(declare-fun m!1365717 () Bool)

(assert (=> b!1479847 m!1365717))

(declare-fun m!1365719 () Bool)

(assert (=> b!1479850 m!1365719))

(assert (=> b!1479850 m!1365719))

(declare-fun m!1365721 () Bool)

(assert (=> b!1479850 m!1365721))

(assert (=> b!1479858 m!1365703))

(declare-fun m!1365723 () Bool)

(assert (=> b!1479858 m!1365723))

(assert (=> b!1479856 m!1365681))

(declare-fun m!1365725 () Bool)

(assert (=> b!1479856 m!1365725))

(declare-fun m!1365727 () Bool)

(assert (=> b!1479855 m!1365727))

(declare-fun m!1365729 () Bool)

(assert (=> b!1479851 m!1365729))

(assert (=> b!1479851 m!1365703))

(declare-fun m!1365731 () Bool)

(assert (=> b!1479851 m!1365731))

(assert (=> b!1479851 m!1365705))

(assert (=> b!1479851 m!1365701))

(assert (=> b!1479851 m!1365685))

(declare-fun m!1365733 () Bool)

(assert (=> b!1479851 m!1365733))

(declare-fun m!1365735 () Bool)

(assert (=> b!1479851 m!1365735))

(assert (=> b!1479851 m!1365685))

(check-sat (not b!1479842) (not b!1479845) (not b!1479855) (not b!1479851) (not b!1479849) (not b!1479848) (not b!1479839) (not b!1479856) (not b!1479847) (not b!1479840) (not start!126252) (not b!1479850) (not b!1479853) (not b!1479844))
(check-sat)
