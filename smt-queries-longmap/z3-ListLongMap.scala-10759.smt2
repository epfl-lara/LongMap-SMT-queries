; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125814 () Bool)

(assert start!125814)

(declare-fun b!1472922 () Bool)

(declare-fun res!1000533 () Bool)

(declare-fun e!826556 () Bool)

(assert (=> b!1472922 (=> (not res!1000533) (not e!826556))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472922 (= res!1000533 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472923 () Bool)

(declare-fun res!1000540 () Bool)

(declare-fun e!826553 () Bool)

(assert (=> b!1472923 (=> (not res!1000540) (not e!826553))))

(declare-datatypes ((array!99148 0))(
  ( (array!99149 (arr!47859 (Array (_ BitVec 32) (_ BitVec 64))) (size!48409 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99148)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472923 (= res!1000540 (validKeyInArray!0 (select (arr!47859 a!2862) i!1006)))))

(declare-fun b!1472924 () Bool)

(declare-fun res!1000528 () Bool)

(assert (=> b!1472924 (=> (not res!1000528) (not e!826556))))

(declare-fun e!826555 () Bool)

(assert (=> b!1472924 (= res!1000528 e!826555)))

(declare-fun c!135711 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472924 (= c!135711 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472925 () Bool)

(declare-fun res!1000536 () Bool)

(assert (=> b!1472925 (=> (not res!1000536) (not e!826553))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99148 (_ BitVec 32)) Bool)

(assert (=> b!1472925 (= res!1000536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472926 () Bool)

(declare-fun res!1000534 () Bool)

(assert (=> b!1472926 (=> (not res!1000534) (not e!826553))))

(declare-datatypes ((List!34360 0))(
  ( (Nil!34357) (Cons!34356 (h!35712 (_ BitVec 64)) (t!49054 List!34360)) )
))
(declare-fun arrayNoDuplicates!0 (array!99148 (_ BitVec 32) List!34360) Bool)

(assert (=> b!1472926 (= res!1000534 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34357))))

(declare-fun b!1472927 () Bool)

(declare-fun res!1000538 () Bool)

(assert (=> b!1472927 (=> (not res!1000538) (not e!826553))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1472927 (= res!1000538 (and (= (size!48409 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48409 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48409 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!643722 () array!99148)

(declare-fun b!1472928 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643725 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12099 0))(
  ( (MissingZero!12099 (index!50788 (_ BitVec 32))) (Found!12099 (index!50789 (_ BitVec 32))) (Intermediate!12099 (undefined!12911 Bool) (index!50790 (_ BitVec 32)) (x!132366 (_ BitVec 32))) (Undefined!12099) (MissingVacant!12099 (index!50791 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99148 (_ BitVec 32)) SeekEntryResult!12099)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99148 (_ BitVec 32)) SeekEntryResult!12099)

(assert (=> b!1472928 (= e!826555 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643725 lt!643722 mask!2687) (seekEntryOrOpen!0 lt!643725 lt!643722 mask!2687)))))

(declare-fun b!1472929 () Bool)

(declare-fun res!1000532 () Bool)

(assert (=> b!1472929 (=> (not res!1000532) (not e!826553))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472929 (= res!1000532 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48409 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48409 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48409 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472931 () Bool)

(declare-fun e!826551 () Bool)

(assert (=> b!1472931 (= e!826551 e!826556)))

(declare-fun res!1000530 () Bool)

(assert (=> b!1472931 (=> (not res!1000530) (not e!826556))))

(declare-fun lt!643723 () SeekEntryResult!12099)

(assert (=> b!1472931 (= res!1000530 (= lt!643723 (Intermediate!12099 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99148 (_ BitVec 32)) SeekEntryResult!12099)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472931 (= lt!643723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643725 mask!2687) lt!643725 lt!643722 mask!2687))))

(assert (=> b!1472931 (= lt!643725 (select (store (arr!47859 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472932 () Bool)

(assert (=> b!1472932 (= e!826555 (= lt!643723 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643725 lt!643722 mask!2687)))))

(declare-fun b!1472933 () Bool)

(declare-fun res!1000527 () Bool)

(assert (=> b!1472933 (=> (not res!1000527) (not e!826551))))

(declare-fun lt!643724 () SeekEntryResult!12099)

(assert (=> b!1472933 (= res!1000527 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47859 a!2862) j!93) a!2862 mask!2687) lt!643724))))

(declare-fun b!1472934 () Bool)

(declare-fun e!826550 () Bool)

(assert (=> b!1472934 (= e!826553 e!826550)))

(declare-fun res!1000531 () Bool)

(assert (=> b!1472934 (=> (not res!1000531) (not e!826550))))

(assert (=> b!1472934 (= res!1000531 (= (select (store (arr!47859 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472934 (= lt!643722 (array!99149 (store (arr!47859 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48409 a!2862)))))

(declare-fun b!1472935 () Bool)

(declare-fun res!1000535 () Bool)

(assert (=> b!1472935 (=> (not res!1000535) (not e!826553))))

(assert (=> b!1472935 (= res!1000535 (validKeyInArray!0 (select (arr!47859 a!2862) j!93)))))

(declare-fun e!826552 () Bool)

(declare-fun lt!643721 () SeekEntryResult!12099)

(declare-fun b!1472936 () Bool)

(assert (=> b!1472936 (= e!826552 (= lt!643721 (seekEntryOrOpen!0 lt!643725 lt!643722 mask!2687)))))

(declare-fun b!1472937 () Bool)

(assert (=> b!1472937 (= e!826556 (not e!826552))))

(declare-fun res!1000539 () Bool)

(assert (=> b!1472937 (=> res!1000539 e!826552)))

(assert (=> b!1472937 (= res!1000539 (or (not (= (select (arr!47859 a!2862) index!646) (select (store (arr!47859 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47859 a!2862) index!646) (select (arr!47859 a!2862) j!93)))))))

(assert (=> b!1472937 (and (= lt!643721 (Found!12099 j!93)) (or (= (select (arr!47859 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47859 a!2862) intermediateBeforeIndex!19) (select (arr!47859 a!2862) j!93))))))

(assert (=> b!1472937 (= lt!643721 (seekEntryOrOpen!0 (select (arr!47859 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1472937 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49538 0))(
  ( (Unit!49539) )
))
(declare-fun lt!643720 () Unit!49538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49538)

(assert (=> b!1472937 (= lt!643720 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472930 () Bool)

(assert (=> b!1472930 (= e!826550 e!826551)))

(declare-fun res!1000529 () Bool)

(assert (=> b!1472930 (=> (not res!1000529) (not e!826551))))

(assert (=> b!1472930 (= res!1000529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687) (select (arr!47859 a!2862) j!93) a!2862 mask!2687) lt!643724))))

(assert (=> b!1472930 (= lt!643724 (Intermediate!12099 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1000537 () Bool)

(assert (=> start!125814 (=> (not res!1000537) (not e!826553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125814 (= res!1000537 (validMask!0 mask!2687))))

(assert (=> start!125814 e!826553))

(assert (=> start!125814 true))

(declare-fun array_inv!36887 (array!99148) Bool)

(assert (=> start!125814 (array_inv!36887 a!2862)))

(assert (= (and start!125814 res!1000537) b!1472927))

(assert (= (and b!1472927 res!1000538) b!1472923))

(assert (= (and b!1472923 res!1000540) b!1472935))

(assert (= (and b!1472935 res!1000535) b!1472925))

(assert (= (and b!1472925 res!1000536) b!1472926))

(assert (= (and b!1472926 res!1000534) b!1472929))

(assert (= (and b!1472929 res!1000532) b!1472934))

(assert (= (and b!1472934 res!1000531) b!1472930))

(assert (= (and b!1472930 res!1000529) b!1472933))

(assert (= (and b!1472933 res!1000527) b!1472931))

(assert (= (and b!1472931 res!1000530) b!1472924))

(assert (= (and b!1472924 c!135711) b!1472932))

(assert (= (and b!1472924 (not c!135711)) b!1472928))

(assert (= (and b!1472924 res!1000528) b!1472922))

(assert (= (and b!1472922 res!1000533) b!1472937))

(assert (= (and b!1472937 (not res!1000539)) b!1472936))

(declare-fun m!1359597 () Bool)

(assert (=> b!1472930 m!1359597))

(assert (=> b!1472930 m!1359597))

(declare-fun m!1359599 () Bool)

(assert (=> b!1472930 m!1359599))

(assert (=> b!1472930 m!1359599))

(assert (=> b!1472930 m!1359597))

(declare-fun m!1359601 () Bool)

(assert (=> b!1472930 m!1359601))

(assert (=> b!1472935 m!1359597))

(assert (=> b!1472935 m!1359597))

(declare-fun m!1359603 () Bool)

(assert (=> b!1472935 m!1359603))

(declare-fun m!1359605 () Bool)

(assert (=> b!1472926 m!1359605))

(declare-fun m!1359607 () Bool)

(assert (=> b!1472934 m!1359607))

(declare-fun m!1359609 () Bool)

(assert (=> b!1472934 m!1359609))

(declare-fun m!1359611 () Bool)

(assert (=> b!1472923 m!1359611))

(assert (=> b!1472923 m!1359611))

(declare-fun m!1359613 () Bool)

(assert (=> b!1472923 m!1359613))

(declare-fun m!1359615 () Bool)

(assert (=> start!125814 m!1359615))

(declare-fun m!1359617 () Bool)

(assert (=> start!125814 m!1359617))

(declare-fun m!1359619 () Bool)

(assert (=> b!1472937 m!1359619))

(assert (=> b!1472937 m!1359607))

(declare-fun m!1359621 () Bool)

(assert (=> b!1472937 m!1359621))

(declare-fun m!1359623 () Bool)

(assert (=> b!1472937 m!1359623))

(declare-fun m!1359625 () Bool)

(assert (=> b!1472937 m!1359625))

(assert (=> b!1472937 m!1359597))

(declare-fun m!1359627 () Bool)

(assert (=> b!1472937 m!1359627))

(declare-fun m!1359629 () Bool)

(assert (=> b!1472937 m!1359629))

(assert (=> b!1472937 m!1359597))

(declare-fun m!1359631 () Bool)

(assert (=> b!1472936 m!1359631))

(declare-fun m!1359633 () Bool)

(assert (=> b!1472932 m!1359633))

(declare-fun m!1359635 () Bool)

(assert (=> b!1472925 m!1359635))

(declare-fun m!1359637 () Bool)

(assert (=> b!1472931 m!1359637))

(assert (=> b!1472931 m!1359637))

(declare-fun m!1359639 () Bool)

(assert (=> b!1472931 m!1359639))

(assert (=> b!1472931 m!1359607))

(declare-fun m!1359641 () Bool)

(assert (=> b!1472931 m!1359641))

(declare-fun m!1359643 () Bool)

(assert (=> b!1472928 m!1359643))

(assert (=> b!1472928 m!1359631))

(assert (=> b!1472933 m!1359597))

(assert (=> b!1472933 m!1359597))

(declare-fun m!1359645 () Bool)

(assert (=> b!1472933 m!1359645))

(check-sat (not b!1472923) (not b!1472933) (not b!1472935) (not b!1472937) (not b!1472928) (not b!1472926) (not b!1472925) (not b!1472930) (not b!1472936) (not b!1472932) (not start!125814) (not b!1472931))
(check-sat)
(get-model)

(declare-fun b!1473004 () Bool)

(declare-fun lt!643749 () SeekEntryResult!12099)

(assert (=> b!1473004 (and (bvsge (index!50790 lt!643749) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643749) (size!48409 a!2862)))))

(declare-fun res!1000590 () Bool)

(assert (=> b!1473004 (= res!1000590 (= (select (arr!47859 a!2862) (index!50790 lt!643749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826592 () Bool)

(assert (=> b!1473004 (=> res!1000590 e!826592)))

(declare-fun b!1473005 () Bool)

(assert (=> b!1473005 (and (bvsge (index!50790 lt!643749) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643749) (size!48409 a!2862)))))

(declare-fun res!1000591 () Bool)

(assert (=> b!1473005 (= res!1000591 (= (select (arr!47859 a!2862) (index!50790 lt!643749)) (select (arr!47859 a!2862) j!93)))))

(assert (=> b!1473005 (=> res!1000591 e!826592)))

(declare-fun e!826589 () Bool)

(assert (=> b!1473005 (= e!826589 e!826592)))

(declare-fun d!155543 () Bool)

(declare-fun e!826591 () Bool)

(assert (=> d!155543 e!826591))

(declare-fun c!135722 () Bool)

(get-info :version)

(assert (=> d!155543 (= c!135722 (and ((_ is Intermediate!12099) lt!643749) (undefined!12911 lt!643749)))))

(declare-fun e!826588 () SeekEntryResult!12099)

(assert (=> d!155543 (= lt!643749 e!826588)))

(declare-fun c!135723 () Bool)

(assert (=> d!155543 (= c!135723 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643748 () (_ BitVec 64))

(assert (=> d!155543 (= lt!643748 (select (arr!47859 a!2862) (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687)))))

(assert (=> d!155543 (validMask!0 mask!2687)))

(assert (=> d!155543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687) (select (arr!47859 a!2862) j!93) a!2862 mask!2687) lt!643749)))

(declare-fun b!1473006 () Bool)

(declare-fun e!826590 () SeekEntryResult!12099)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473006 (= e!826590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47859 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473007 () Bool)

(assert (=> b!1473007 (= e!826588 (Intermediate!12099 true (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473008 () Bool)

(assert (=> b!1473008 (and (bvsge (index!50790 lt!643749) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643749) (size!48409 a!2862)))))

(assert (=> b!1473008 (= e!826592 (= (select (arr!47859 a!2862) (index!50790 lt!643749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473009 () Bool)

(assert (=> b!1473009 (= e!826591 (bvsge (x!132366 lt!643749) #b01111111111111111111111111111110))))

(declare-fun b!1473010 () Bool)

(assert (=> b!1473010 (= e!826588 e!826590)))

(declare-fun c!135721 () Bool)

(assert (=> b!1473010 (= c!135721 (or (= lt!643748 (select (arr!47859 a!2862) j!93)) (= (bvadd lt!643748 lt!643748) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473011 () Bool)

(assert (=> b!1473011 (= e!826590 (Intermediate!12099 false (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473012 () Bool)

(assert (=> b!1473012 (= e!826591 e!826589)))

(declare-fun res!1000589 () Bool)

(assert (=> b!1473012 (= res!1000589 (and ((_ is Intermediate!12099) lt!643749) (not (undefined!12911 lt!643749)) (bvslt (x!132366 lt!643749) #b01111111111111111111111111111110) (bvsge (x!132366 lt!643749) #b00000000000000000000000000000000) (bvsge (x!132366 lt!643749) #b00000000000000000000000000000000)))))

(assert (=> b!1473012 (=> (not res!1000589) (not e!826589))))

(assert (= (and d!155543 c!135723) b!1473007))

(assert (= (and d!155543 (not c!135723)) b!1473010))

(assert (= (and b!1473010 c!135721) b!1473011))

(assert (= (and b!1473010 (not c!135721)) b!1473006))

(assert (= (and d!155543 c!135722) b!1473009))

(assert (= (and d!155543 (not c!135722)) b!1473012))

(assert (= (and b!1473012 res!1000589) b!1473005))

(assert (= (and b!1473005 (not res!1000591)) b!1473004))

(assert (= (and b!1473004 (not res!1000590)) b!1473008))

(declare-fun m!1359697 () Bool)

(assert (=> b!1473005 m!1359697))

(assert (=> b!1473006 m!1359599))

(declare-fun m!1359699 () Bool)

(assert (=> b!1473006 m!1359699))

(assert (=> b!1473006 m!1359699))

(assert (=> b!1473006 m!1359597))

(declare-fun m!1359701 () Bool)

(assert (=> b!1473006 m!1359701))

(assert (=> d!155543 m!1359599))

(declare-fun m!1359703 () Bool)

(assert (=> d!155543 m!1359703))

(assert (=> d!155543 m!1359615))

(assert (=> b!1473008 m!1359697))

(assert (=> b!1473004 m!1359697))

(assert (=> b!1472930 d!155543))

(declare-fun d!155545 () Bool)

(declare-fun lt!643755 () (_ BitVec 32))

(declare-fun lt!643754 () (_ BitVec 32))

(assert (=> d!155545 (= lt!643755 (bvmul (bvxor lt!643754 (bvlshr lt!643754 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155545 (= lt!643754 ((_ extract 31 0) (bvand (bvxor (select (arr!47859 a!2862) j!93) (bvlshr (select (arr!47859 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155545 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000592 (let ((h!35714 ((_ extract 31 0) (bvand (bvxor (select (arr!47859 a!2862) j!93) (bvlshr (select (arr!47859 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132369 (bvmul (bvxor h!35714 (bvlshr h!35714 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132369 (bvlshr x!132369 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000592 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000592 #b00000000000000000000000000000000))))))

(assert (=> d!155545 (= (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687) (bvand (bvxor lt!643755 (bvlshr lt!643755 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472930 d!155545))

(declare-fun b!1473023 () Bool)

(declare-fun e!826602 () Bool)

(declare-fun call!67741 () Bool)

(assert (=> b!1473023 (= e!826602 call!67741)))

(declare-fun b!1473024 () Bool)

(declare-fun e!826601 () Bool)

(declare-fun e!826603 () Bool)

(assert (=> b!1473024 (= e!826601 e!826603)))

(declare-fun res!1000599 () Bool)

(assert (=> b!1473024 (=> (not res!1000599) (not e!826603))))

(declare-fun e!826604 () Bool)

(assert (=> b!1473024 (= res!1000599 (not e!826604))))

(declare-fun res!1000600 () Bool)

(assert (=> b!1473024 (=> (not res!1000600) (not e!826604))))

(assert (=> b!1473024 (= res!1000600 (validKeyInArray!0 (select (arr!47859 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1473025 () Bool)

(declare-fun contains!9902 (List!34360 (_ BitVec 64)) Bool)

(assert (=> b!1473025 (= e!826604 (contains!9902 Nil!34357 (select (arr!47859 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1473026 () Bool)

(assert (=> b!1473026 (= e!826602 call!67741)))

(declare-fun bm!67738 () Bool)

(declare-fun c!135726 () Bool)

(assert (=> bm!67738 (= call!67741 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135726 (Cons!34356 (select (arr!47859 a!2862) #b00000000000000000000000000000000) Nil!34357) Nil!34357)))))

(declare-fun b!1473027 () Bool)

(assert (=> b!1473027 (= e!826603 e!826602)))

(assert (=> b!1473027 (= c!135726 (validKeyInArray!0 (select (arr!47859 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155547 () Bool)

(declare-fun res!1000601 () Bool)

(assert (=> d!155547 (=> res!1000601 e!826601)))

(assert (=> d!155547 (= res!1000601 (bvsge #b00000000000000000000000000000000 (size!48409 a!2862)))))

(assert (=> d!155547 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34357) e!826601)))

(assert (= (and d!155547 (not res!1000601)) b!1473024))

(assert (= (and b!1473024 res!1000600) b!1473025))

(assert (= (and b!1473024 res!1000599) b!1473027))

(assert (= (and b!1473027 c!135726) b!1473023))

(assert (= (and b!1473027 (not c!135726)) b!1473026))

(assert (= (or b!1473023 b!1473026) bm!67738))

(declare-fun m!1359705 () Bool)

(assert (=> b!1473024 m!1359705))

(assert (=> b!1473024 m!1359705))

(declare-fun m!1359707 () Bool)

(assert (=> b!1473024 m!1359707))

(assert (=> b!1473025 m!1359705))

(assert (=> b!1473025 m!1359705))

(declare-fun m!1359709 () Bool)

(assert (=> b!1473025 m!1359709))

(assert (=> bm!67738 m!1359705))

(declare-fun m!1359711 () Bool)

(assert (=> bm!67738 m!1359711))

(assert (=> b!1473027 m!1359705))

(assert (=> b!1473027 m!1359705))

(assert (=> b!1473027 m!1359707))

(assert (=> b!1472926 d!155547))

(declare-fun b!1473040 () Bool)

(declare-fun e!826613 () SeekEntryResult!12099)

(declare-fun lt!643763 () SeekEntryResult!12099)

(assert (=> b!1473040 (= e!826613 (MissingZero!12099 (index!50790 lt!643763)))))

(declare-fun d!155549 () Bool)

(declare-fun lt!643764 () SeekEntryResult!12099)

(assert (=> d!155549 (and (or ((_ is Undefined!12099) lt!643764) (not ((_ is Found!12099) lt!643764)) (and (bvsge (index!50789 lt!643764) #b00000000000000000000000000000000) (bvslt (index!50789 lt!643764) (size!48409 a!2862)))) (or ((_ is Undefined!12099) lt!643764) ((_ is Found!12099) lt!643764) (not ((_ is MissingZero!12099) lt!643764)) (and (bvsge (index!50788 lt!643764) #b00000000000000000000000000000000) (bvslt (index!50788 lt!643764) (size!48409 a!2862)))) (or ((_ is Undefined!12099) lt!643764) ((_ is Found!12099) lt!643764) ((_ is MissingZero!12099) lt!643764) (not ((_ is MissingVacant!12099) lt!643764)) (and (bvsge (index!50791 lt!643764) #b00000000000000000000000000000000) (bvslt (index!50791 lt!643764) (size!48409 a!2862)))) (or ((_ is Undefined!12099) lt!643764) (ite ((_ is Found!12099) lt!643764) (= (select (arr!47859 a!2862) (index!50789 lt!643764)) (select (arr!47859 a!2862) j!93)) (ite ((_ is MissingZero!12099) lt!643764) (= (select (arr!47859 a!2862) (index!50788 lt!643764)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12099) lt!643764) (= (select (arr!47859 a!2862) (index!50791 lt!643764)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!826612 () SeekEntryResult!12099)

(assert (=> d!155549 (= lt!643764 e!826612)))

(declare-fun c!135733 () Bool)

(assert (=> d!155549 (= c!135733 (and ((_ is Intermediate!12099) lt!643763) (undefined!12911 lt!643763)))))

(assert (=> d!155549 (= lt!643763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47859 a!2862) j!93) mask!2687) (select (arr!47859 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155549 (validMask!0 mask!2687)))

(assert (=> d!155549 (= (seekEntryOrOpen!0 (select (arr!47859 a!2862) j!93) a!2862 mask!2687) lt!643764)))

(declare-fun b!1473041 () Bool)

(declare-fun e!826611 () SeekEntryResult!12099)

(assert (=> b!1473041 (= e!826612 e!826611)))

(declare-fun lt!643762 () (_ BitVec 64))

(assert (=> b!1473041 (= lt!643762 (select (arr!47859 a!2862) (index!50790 lt!643763)))))

(declare-fun c!135734 () Bool)

(assert (=> b!1473041 (= c!135734 (= lt!643762 (select (arr!47859 a!2862) j!93)))))

(declare-fun b!1473042 () Bool)

(assert (=> b!1473042 (= e!826611 (Found!12099 (index!50790 lt!643763)))))

(declare-fun b!1473043 () Bool)

(declare-fun c!135735 () Bool)

(assert (=> b!1473043 (= c!135735 (= lt!643762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473043 (= e!826611 e!826613)))

(declare-fun b!1473044 () Bool)

(assert (=> b!1473044 (= e!826613 (seekKeyOrZeroReturnVacant!0 (x!132366 lt!643763) (index!50790 lt!643763) (index!50790 lt!643763) (select (arr!47859 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473045 () Bool)

(assert (=> b!1473045 (= e!826612 Undefined!12099)))

(assert (= (and d!155549 c!135733) b!1473045))

(assert (= (and d!155549 (not c!135733)) b!1473041))

(assert (= (and b!1473041 c!135734) b!1473042))

(assert (= (and b!1473041 (not c!135734)) b!1473043))

(assert (= (and b!1473043 c!135735) b!1473040))

(assert (= (and b!1473043 (not c!135735)) b!1473044))

(assert (=> d!155549 m!1359597))

(assert (=> d!155549 m!1359599))

(declare-fun m!1359713 () Bool)

(assert (=> d!155549 m!1359713))

(declare-fun m!1359715 () Bool)

(assert (=> d!155549 m!1359715))

(declare-fun m!1359717 () Bool)

(assert (=> d!155549 m!1359717))

(assert (=> d!155549 m!1359599))

(assert (=> d!155549 m!1359597))

(assert (=> d!155549 m!1359601))

(assert (=> d!155549 m!1359615))

(declare-fun m!1359719 () Bool)

(assert (=> b!1473041 m!1359719))

(assert (=> b!1473044 m!1359597))

(declare-fun m!1359721 () Bool)

(assert (=> b!1473044 m!1359721))

(assert (=> b!1472937 d!155549))

(declare-fun b!1473069 () Bool)

(declare-fun e!826632 () Bool)

(declare-fun call!67747 () Bool)

(assert (=> b!1473069 (= e!826632 call!67747)))

(declare-fun b!1473070 () Bool)

(declare-fun e!826633 () Bool)

(assert (=> b!1473070 (= e!826632 e!826633)))

(declare-fun lt!643771 () (_ BitVec 64))

(assert (=> b!1473070 (= lt!643771 (select (arr!47859 a!2862) j!93))))

(declare-fun lt!643772 () Unit!49538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99148 (_ BitVec 64) (_ BitVec 32)) Unit!49538)

(assert (=> b!1473070 (= lt!643772 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643771 j!93))))

(declare-fun arrayContainsKey!0 (array!99148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1473070 (arrayContainsKey!0 a!2862 lt!643771 #b00000000000000000000000000000000)))

(declare-fun lt!643773 () Unit!49538)

(assert (=> b!1473070 (= lt!643773 lt!643772)))

(declare-fun res!1000615 () Bool)

(assert (=> b!1473070 (= res!1000615 (= (seekEntryOrOpen!0 (select (arr!47859 a!2862) j!93) a!2862 mask!2687) (Found!12099 j!93)))))

(assert (=> b!1473070 (=> (not res!1000615) (not e!826633))))

(declare-fun b!1473071 () Bool)

(declare-fun e!826634 () Bool)

(assert (=> b!1473071 (= e!826634 e!826632)))

(declare-fun c!135741 () Bool)

(assert (=> b!1473071 (= c!135741 (validKeyInArray!0 (select (arr!47859 a!2862) j!93)))))

(declare-fun bm!67744 () Bool)

(assert (=> bm!67744 (= call!67747 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1473072 () Bool)

(assert (=> b!1473072 (= e!826633 call!67747)))

(declare-fun d!155553 () Bool)

(declare-fun res!1000616 () Bool)

(assert (=> d!155553 (=> res!1000616 e!826634)))

(assert (=> d!155553 (= res!1000616 (bvsge j!93 (size!48409 a!2862)))))

(assert (=> d!155553 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!826634)))

(assert (= (and d!155553 (not res!1000616)) b!1473071))

(assert (= (and b!1473071 c!135741) b!1473070))

(assert (= (and b!1473071 (not c!135741)) b!1473069))

(assert (= (and b!1473070 res!1000615) b!1473072))

(assert (= (or b!1473072 b!1473069) bm!67744))

(assert (=> b!1473070 m!1359597))

(declare-fun m!1359731 () Bool)

(assert (=> b!1473070 m!1359731))

(declare-fun m!1359733 () Bool)

(assert (=> b!1473070 m!1359733))

(assert (=> b!1473070 m!1359597))

(assert (=> b!1473070 m!1359627))

(assert (=> b!1473071 m!1359597))

(assert (=> b!1473071 m!1359597))

(assert (=> b!1473071 m!1359603))

(declare-fun m!1359735 () Bool)

(assert (=> bm!67744 m!1359735))

(assert (=> b!1472937 d!155553))

(declare-fun d!155563 () Bool)

(assert (=> d!155563 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643776 () Unit!49538)

(declare-fun choose!38 (array!99148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49538)

(assert (=> d!155563 (= lt!643776 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155563 (validMask!0 mask!2687)))

(assert (=> d!155563 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643776)))

(declare-fun bs!42539 () Bool)

(assert (= bs!42539 d!155563))

(assert (=> bs!42539 m!1359629))

(declare-fun m!1359737 () Bool)

(assert (=> bs!42539 m!1359737))

(assert (=> bs!42539 m!1359615))

(assert (=> b!1472937 d!155563))

(declare-fun b!1473157 () Bool)

(declare-fun e!826681 () SeekEntryResult!12099)

(assert (=> b!1473157 (= e!826681 (Found!12099 index!646))))

(declare-fun b!1473158 () Bool)

(declare-fun c!135773 () Bool)

(declare-fun lt!643802 () (_ BitVec 64))

(assert (=> b!1473158 (= c!135773 (= lt!643802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826683 () SeekEntryResult!12099)

(assert (=> b!1473158 (= e!826681 e!826683)))

(declare-fun d!155565 () Bool)

(declare-fun lt!643801 () SeekEntryResult!12099)

(assert (=> d!155565 (and (or ((_ is Undefined!12099) lt!643801) (not ((_ is Found!12099) lt!643801)) (and (bvsge (index!50789 lt!643801) #b00000000000000000000000000000000) (bvslt (index!50789 lt!643801) (size!48409 lt!643722)))) (or ((_ is Undefined!12099) lt!643801) ((_ is Found!12099) lt!643801) (not ((_ is MissingVacant!12099) lt!643801)) (not (= (index!50791 lt!643801) intermediateAfterIndex!19)) (and (bvsge (index!50791 lt!643801) #b00000000000000000000000000000000) (bvslt (index!50791 lt!643801) (size!48409 lt!643722)))) (or ((_ is Undefined!12099) lt!643801) (ite ((_ is Found!12099) lt!643801) (= (select (arr!47859 lt!643722) (index!50789 lt!643801)) lt!643725) (and ((_ is MissingVacant!12099) lt!643801) (= (index!50791 lt!643801) intermediateAfterIndex!19) (= (select (arr!47859 lt!643722) (index!50791 lt!643801)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!826682 () SeekEntryResult!12099)

(assert (=> d!155565 (= lt!643801 e!826682)))

(declare-fun c!135772 () Bool)

(assert (=> d!155565 (= c!135772 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155565 (= lt!643802 (select (arr!47859 lt!643722) index!646))))

(assert (=> d!155565 (validMask!0 mask!2687)))

(assert (=> d!155565 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643725 lt!643722 mask!2687) lt!643801)))

(declare-fun b!1473159 () Bool)

(assert (=> b!1473159 (= e!826683 (MissingVacant!12099 intermediateAfterIndex!19))))

(declare-fun b!1473160 () Bool)

(assert (=> b!1473160 (= e!826682 Undefined!12099)))

(declare-fun b!1473161 () Bool)

(assert (=> b!1473161 (= e!826682 e!826681)))

(declare-fun c!135774 () Bool)

(assert (=> b!1473161 (= c!135774 (= lt!643802 lt!643725))))

(declare-fun b!1473162 () Bool)

(assert (=> b!1473162 (= e!826683 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!643725 lt!643722 mask!2687))))

(assert (= (and d!155565 c!135772) b!1473160))

(assert (= (and d!155565 (not c!135772)) b!1473161))

(assert (= (and b!1473161 c!135774) b!1473157))

(assert (= (and b!1473161 (not c!135774)) b!1473158))

(assert (= (and b!1473158 c!135773) b!1473159))

(assert (= (and b!1473158 (not c!135773)) b!1473162))

(declare-fun m!1359769 () Bool)

(assert (=> d!155565 m!1359769))

(declare-fun m!1359771 () Bool)

(assert (=> d!155565 m!1359771))

(declare-fun m!1359773 () Bool)

(assert (=> d!155565 m!1359773))

(assert (=> d!155565 m!1359615))

(declare-fun m!1359775 () Bool)

(assert (=> b!1473162 m!1359775))

(assert (=> b!1473162 m!1359775))

(declare-fun m!1359777 () Bool)

(assert (=> b!1473162 m!1359777))

(assert (=> b!1472928 d!155565))

(declare-fun b!1473172 () Bool)

(declare-fun e!826691 () SeekEntryResult!12099)

(declare-fun lt!643808 () SeekEntryResult!12099)

(assert (=> b!1473172 (= e!826691 (MissingZero!12099 (index!50790 lt!643808)))))

(declare-fun d!155577 () Bool)

(declare-fun lt!643809 () SeekEntryResult!12099)

(assert (=> d!155577 (and (or ((_ is Undefined!12099) lt!643809) (not ((_ is Found!12099) lt!643809)) (and (bvsge (index!50789 lt!643809) #b00000000000000000000000000000000) (bvslt (index!50789 lt!643809) (size!48409 lt!643722)))) (or ((_ is Undefined!12099) lt!643809) ((_ is Found!12099) lt!643809) (not ((_ is MissingZero!12099) lt!643809)) (and (bvsge (index!50788 lt!643809) #b00000000000000000000000000000000) (bvslt (index!50788 lt!643809) (size!48409 lt!643722)))) (or ((_ is Undefined!12099) lt!643809) ((_ is Found!12099) lt!643809) ((_ is MissingZero!12099) lt!643809) (not ((_ is MissingVacant!12099) lt!643809)) (and (bvsge (index!50791 lt!643809) #b00000000000000000000000000000000) (bvslt (index!50791 lt!643809) (size!48409 lt!643722)))) (or ((_ is Undefined!12099) lt!643809) (ite ((_ is Found!12099) lt!643809) (= (select (arr!47859 lt!643722) (index!50789 lt!643809)) lt!643725) (ite ((_ is MissingZero!12099) lt!643809) (= (select (arr!47859 lt!643722) (index!50788 lt!643809)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12099) lt!643809) (= (select (arr!47859 lt!643722) (index!50791 lt!643809)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!826690 () SeekEntryResult!12099)

(assert (=> d!155577 (= lt!643809 e!826690)))

(declare-fun c!135778 () Bool)

(assert (=> d!155577 (= c!135778 (and ((_ is Intermediate!12099) lt!643808) (undefined!12911 lt!643808)))))

(assert (=> d!155577 (= lt!643808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643725 mask!2687) lt!643725 lt!643722 mask!2687))))

(assert (=> d!155577 (validMask!0 mask!2687)))

(assert (=> d!155577 (= (seekEntryOrOpen!0 lt!643725 lt!643722 mask!2687) lt!643809)))

(declare-fun b!1473173 () Bool)

(declare-fun e!826689 () SeekEntryResult!12099)

(assert (=> b!1473173 (= e!826690 e!826689)))

(declare-fun lt!643807 () (_ BitVec 64))

(assert (=> b!1473173 (= lt!643807 (select (arr!47859 lt!643722) (index!50790 lt!643808)))))

(declare-fun c!135779 () Bool)

(assert (=> b!1473173 (= c!135779 (= lt!643807 lt!643725))))

(declare-fun b!1473174 () Bool)

(assert (=> b!1473174 (= e!826689 (Found!12099 (index!50790 lt!643808)))))

(declare-fun b!1473175 () Bool)

(declare-fun c!135780 () Bool)

(assert (=> b!1473175 (= c!135780 (= lt!643807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473175 (= e!826689 e!826691)))

(declare-fun b!1473176 () Bool)

(assert (=> b!1473176 (= e!826691 (seekKeyOrZeroReturnVacant!0 (x!132366 lt!643808) (index!50790 lt!643808) (index!50790 lt!643808) lt!643725 lt!643722 mask!2687))))

(declare-fun b!1473177 () Bool)

(assert (=> b!1473177 (= e!826690 Undefined!12099)))

(assert (= (and d!155577 c!135778) b!1473177))

(assert (= (and d!155577 (not c!135778)) b!1473173))

(assert (= (and b!1473173 c!135779) b!1473174))

(assert (= (and b!1473173 (not c!135779)) b!1473175))

(assert (= (and b!1473175 c!135780) b!1473172))

(assert (= (and b!1473175 (not c!135780)) b!1473176))

(assert (=> d!155577 m!1359637))

(declare-fun m!1359787 () Bool)

(assert (=> d!155577 m!1359787))

(declare-fun m!1359789 () Bool)

(assert (=> d!155577 m!1359789))

(declare-fun m!1359791 () Bool)

(assert (=> d!155577 m!1359791))

(assert (=> d!155577 m!1359637))

(assert (=> d!155577 m!1359639))

(assert (=> d!155577 m!1359615))

(declare-fun m!1359793 () Bool)

(assert (=> b!1473173 m!1359793))

(declare-fun m!1359795 () Bool)

(assert (=> b!1473176 m!1359795))

(assert (=> b!1472928 d!155577))

(declare-fun d!155583 () Bool)

(assert (=> d!155583 (= (validKeyInArray!0 (select (arr!47859 a!2862) i!1006)) (and (not (= (select (arr!47859 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47859 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472923 d!155583))

(declare-fun d!155585 () Bool)

(assert (=> d!155585 (= (validKeyInArray!0 (select (arr!47859 a!2862) j!93)) (and (not (= (select (arr!47859 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47859 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472935 d!155585))

(declare-fun b!1473178 () Bool)

(declare-fun e!826692 () Bool)

(declare-fun call!67748 () Bool)

(assert (=> b!1473178 (= e!826692 call!67748)))

(declare-fun b!1473179 () Bool)

(declare-fun e!826693 () Bool)

(assert (=> b!1473179 (= e!826692 e!826693)))

(declare-fun lt!643812 () (_ BitVec 64))

(assert (=> b!1473179 (= lt!643812 (select (arr!47859 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643813 () Unit!49538)

(assert (=> b!1473179 (= lt!643813 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643812 #b00000000000000000000000000000000))))

(assert (=> b!1473179 (arrayContainsKey!0 a!2862 lt!643812 #b00000000000000000000000000000000)))

(declare-fun lt!643814 () Unit!49538)

(assert (=> b!1473179 (= lt!643814 lt!643813)))

(declare-fun res!1000646 () Bool)

(assert (=> b!1473179 (= res!1000646 (= (seekEntryOrOpen!0 (select (arr!47859 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12099 #b00000000000000000000000000000000)))))

(assert (=> b!1473179 (=> (not res!1000646) (not e!826693))))

(declare-fun b!1473180 () Bool)

(declare-fun e!826694 () Bool)

(assert (=> b!1473180 (= e!826694 e!826692)))

(declare-fun c!135781 () Bool)

(assert (=> b!1473180 (= c!135781 (validKeyInArray!0 (select (arr!47859 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67745 () Bool)

(assert (=> bm!67745 (= call!67748 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1473181 () Bool)

(assert (=> b!1473181 (= e!826693 call!67748)))

(declare-fun d!155587 () Bool)

(declare-fun res!1000647 () Bool)

(assert (=> d!155587 (=> res!1000647 e!826694)))

(assert (=> d!155587 (= res!1000647 (bvsge #b00000000000000000000000000000000 (size!48409 a!2862)))))

(assert (=> d!155587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!826694)))

(assert (= (and d!155587 (not res!1000647)) b!1473180))

(assert (= (and b!1473180 c!135781) b!1473179))

(assert (= (and b!1473180 (not c!135781)) b!1473178))

(assert (= (and b!1473179 res!1000646) b!1473181))

(assert (= (or b!1473181 b!1473178) bm!67745))

(assert (=> b!1473179 m!1359705))

(declare-fun m!1359797 () Bool)

(assert (=> b!1473179 m!1359797))

(declare-fun m!1359799 () Bool)

(assert (=> b!1473179 m!1359799))

(assert (=> b!1473179 m!1359705))

(declare-fun m!1359801 () Bool)

(assert (=> b!1473179 m!1359801))

(assert (=> b!1473180 m!1359705))

(assert (=> b!1473180 m!1359705))

(assert (=> b!1473180 m!1359707))

(declare-fun m!1359803 () Bool)

(assert (=> bm!67745 m!1359803))

(assert (=> b!1472925 d!155587))

(assert (=> b!1472936 d!155577))

(declare-fun b!1473182 () Bool)

(declare-fun lt!643820 () SeekEntryResult!12099)

(assert (=> b!1473182 (and (bvsge (index!50790 lt!643820) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643820) (size!48409 lt!643722)))))

(declare-fun res!1000649 () Bool)

(assert (=> b!1473182 (= res!1000649 (= (select (arr!47859 lt!643722) (index!50790 lt!643820)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826699 () Bool)

(assert (=> b!1473182 (=> res!1000649 e!826699)))

(declare-fun b!1473183 () Bool)

(assert (=> b!1473183 (and (bvsge (index!50790 lt!643820) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643820) (size!48409 lt!643722)))))

(declare-fun res!1000650 () Bool)

(assert (=> b!1473183 (= res!1000650 (= (select (arr!47859 lt!643722) (index!50790 lt!643820)) lt!643725))))

(assert (=> b!1473183 (=> res!1000650 e!826699)))

(declare-fun e!826696 () Bool)

(assert (=> b!1473183 (= e!826696 e!826699)))

(declare-fun d!155589 () Bool)

(declare-fun e!826698 () Bool)

(assert (=> d!155589 e!826698))

(declare-fun c!135783 () Bool)

(assert (=> d!155589 (= c!135783 (and ((_ is Intermediate!12099) lt!643820) (undefined!12911 lt!643820)))))

(declare-fun e!826695 () SeekEntryResult!12099)

(assert (=> d!155589 (= lt!643820 e!826695)))

(declare-fun c!135784 () Bool)

(assert (=> d!155589 (= c!135784 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643819 () (_ BitVec 64))

(assert (=> d!155589 (= lt!643819 (select (arr!47859 lt!643722) (toIndex!0 lt!643725 mask!2687)))))

(assert (=> d!155589 (validMask!0 mask!2687)))

(assert (=> d!155589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643725 mask!2687) lt!643725 lt!643722 mask!2687) lt!643820)))

(declare-fun b!1473184 () Bool)

(declare-fun e!826697 () SeekEntryResult!12099)

(assert (=> b!1473184 (= e!826697 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643725 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!643725 lt!643722 mask!2687))))

(declare-fun b!1473185 () Bool)

(assert (=> b!1473185 (= e!826695 (Intermediate!12099 true (toIndex!0 lt!643725 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473186 () Bool)

(assert (=> b!1473186 (and (bvsge (index!50790 lt!643820) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643820) (size!48409 lt!643722)))))

(assert (=> b!1473186 (= e!826699 (= (select (arr!47859 lt!643722) (index!50790 lt!643820)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473187 () Bool)

(assert (=> b!1473187 (= e!826698 (bvsge (x!132366 lt!643820) #b01111111111111111111111111111110))))

(declare-fun b!1473188 () Bool)

(assert (=> b!1473188 (= e!826695 e!826697)))

(declare-fun c!135782 () Bool)

(assert (=> b!1473188 (= c!135782 (or (= lt!643819 lt!643725) (= (bvadd lt!643819 lt!643819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473189 () Bool)

(assert (=> b!1473189 (= e!826697 (Intermediate!12099 false (toIndex!0 lt!643725 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473190 () Bool)

(assert (=> b!1473190 (= e!826698 e!826696)))

(declare-fun res!1000648 () Bool)

(assert (=> b!1473190 (= res!1000648 (and ((_ is Intermediate!12099) lt!643820) (not (undefined!12911 lt!643820)) (bvslt (x!132366 lt!643820) #b01111111111111111111111111111110) (bvsge (x!132366 lt!643820) #b00000000000000000000000000000000) (bvsge (x!132366 lt!643820) #b00000000000000000000000000000000)))))

(assert (=> b!1473190 (=> (not res!1000648) (not e!826696))))

(assert (= (and d!155589 c!135784) b!1473185))

(assert (= (and d!155589 (not c!135784)) b!1473188))

(assert (= (and b!1473188 c!135782) b!1473189))

(assert (= (and b!1473188 (not c!135782)) b!1473184))

(assert (= (and d!155589 c!135783) b!1473187))

(assert (= (and d!155589 (not c!135783)) b!1473190))

(assert (= (and b!1473190 res!1000648) b!1473183))

(assert (= (and b!1473183 (not res!1000650)) b!1473182))

(assert (= (and b!1473182 (not res!1000649)) b!1473186))

(declare-fun m!1359805 () Bool)

(assert (=> b!1473183 m!1359805))

(assert (=> b!1473184 m!1359637))

(declare-fun m!1359807 () Bool)

(assert (=> b!1473184 m!1359807))

(assert (=> b!1473184 m!1359807))

(declare-fun m!1359809 () Bool)

(assert (=> b!1473184 m!1359809))

(assert (=> d!155589 m!1359637))

(declare-fun m!1359811 () Bool)

(assert (=> d!155589 m!1359811))

(assert (=> d!155589 m!1359615))

(assert (=> b!1473186 m!1359805))

(assert (=> b!1473182 m!1359805))

(assert (=> b!1472931 d!155589))

(declare-fun d!155593 () Bool)

(declare-fun lt!643826 () (_ BitVec 32))

(declare-fun lt!643825 () (_ BitVec 32))

(assert (=> d!155593 (= lt!643826 (bvmul (bvxor lt!643825 (bvlshr lt!643825 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155593 (= lt!643825 ((_ extract 31 0) (bvand (bvxor lt!643725 (bvlshr lt!643725 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155593 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000592 (let ((h!35714 ((_ extract 31 0) (bvand (bvxor lt!643725 (bvlshr lt!643725 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132369 (bvmul (bvxor h!35714 (bvlshr h!35714 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132369 (bvlshr x!132369 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000592 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000592 #b00000000000000000000000000000000))))))

(assert (=> d!155593 (= (toIndex!0 lt!643725 mask!2687) (bvand (bvxor lt!643826 (bvlshr lt!643826 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472931 d!155593))

(declare-fun b!1473210 () Bool)

(declare-fun lt!643828 () SeekEntryResult!12099)

(assert (=> b!1473210 (and (bvsge (index!50790 lt!643828) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643828) (size!48409 lt!643722)))))

(declare-fun res!1000661 () Bool)

(assert (=> b!1473210 (= res!1000661 (= (select (arr!47859 lt!643722) (index!50790 lt!643828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826717 () Bool)

(assert (=> b!1473210 (=> res!1000661 e!826717)))

(declare-fun b!1473211 () Bool)

(assert (=> b!1473211 (and (bvsge (index!50790 lt!643828) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643828) (size!48409 lt!643722)))))

(declare-fun res!1000662 () Bool)

(assert (=> b!1473211 (= res!1000662 (= (select (arr!47859 lt!643722) (index!50790 lt!643828)) lt!643725))))

(assert (=> b!1473211 (=> res!1000662 e!826717)))

(declare-fun e!826714 () Bool)

(assert (=> b!1473211 (= e!826714 e!826717)))

(declare-fun d!155595 () Bool)

(declare-fun e!826716 () Bool)

(assert (=> d!155595 e!826716))

(declare-fun c!135791 () Bool)

(assert (=> d!155595 (= c!135791 (and ((_ is Intermediate!12099) lt!643828) (undefined!12911 lt!643828)))))

(declare-fun e!826713 () SeekEntryResult!12099)

(assert (=> d!155595 (= lt!643828 e!826713)))

(declare-fun c!135792 () Bool)

(assert (=> d!155595 (= c!135792 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643827 () (_ BitVec 64))

(assert (=> d!155595 (= lt!643827 (select (arr!47859 lt!643722) index!646))))

(assert (=> d!155595 (validMask!0 mask!2687)))

(assert (=> d!155595 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643725 lt!643722 mask!2687) lt!643828)))

(declare-fun e!826715 () SeekEntryResult!12099)

(declare-fun b!1473212 () Bool)

(assert (=> b!1473212 (= e!826715 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!643725 lt!643722 mask!2687))))

(declare-fun b!1473213 () Bool)

(assert (=> b!1473213 (= e!826713 (Intermediate!12099 true index!646 x!665))))

(declare-fun b!1473214 () Bool)

(assert (=> b!1473214 (and (bvsge (index!50790 lt!643828) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643828) (size!48409 lt!643722)))))

(assert (=> b!1473214 (= e!826717 (= (select (arr!47859 lt!643722) (index!50790 lt!643828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473215 () Bool)

(assert (=> b!1473215 (= e!826716 (bvsge (x!132366 lt!643828) #b01111111111111111111111111111110))))

(declare-fun b!1473216 () Bool)

(assert (=> b!1473216 (= e!826713 e!826715)))

(declare-fun c!135790 () Bool)

(assert (=> b!1473216 (= c!135790 (or (= lt!643827 lt!643725) (= (bvadd lt!643827 lt!643827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473217 () Bool)

(assert (=> b!1473217 (= e!826715 (Intermediate!12099 false index!646 x!665))))

(declare-fun b!1473218 () Bool)

(assert (=> b!1473218 (= e!826716 e!826714)))

(declare-fun res!1000660 () Bool)

(assert (=> b!1473218 (= res!1000660 (and ((_ is Intermediate!12099) lt!643828) (not (undefined!12911 lt!643828)) (bvslt (x!132366 lt!643828) #b01111111111111111111111111111110) (bvsge (x!132366 lt!643828) #b00000000000000000000000000000000) (bvsge (x!132366 lt!643828) x!665)))))

(assert (=> b!1473218 (=> (not res!1000660) (not e!826714))))

(assert (= (and d!155595 c!135792) b!1473213))

(assert (= (and d!155595 (not c!135792)) b!1473216))

(assert (= (and b!1473216 c!135790) b!1473217))

(assert (= (and b!1473216 (not c!135790)) b!1473212))

(assert (= (and d!155595 c!135791) b!1473215))

(assert (= (and d!155595 (not c!135791)) b!1473218))

(assert (= (and b!1473218 res!1000660) b!1473211))

(assert (= (and b!1473211 (not res!1000662)) b!1473210))

(assert (= (and b!1473210 (not res!1000661)) b!1473214))

(declare-fun m!1359821 () Bool)

(assert (=> b!1473211 m!1359821))

(assert (=> b!1473212 m!1359775))

(assert (=> b!1473212 m!1359775))

(declare-fun m!1359823 () Bool)

(assert (=> b!1473212 m!1359823))

(assert (=> d!155595 m!1359773))

(assert (=> d!155595 m!1359615))

(assert (=> b!1473214 m!1359821))

(assert (=> b!1473210 m!1359821))

(assert (=> b!1472932 d!155595))

(declare-fun d!155601 () Bool)

(assert (=> d!155601 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125814 d!155601))

(declare-fun d!155605 () Bool)

(assert (=> d!155605 (= (array_inv!36887 a!2862) (bvsge (size!48409 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125814 d!155605))

(declare-fun b!1473232 () Bool)

(declare-fun lt!643838 () SeekEntryResult!12099)

(assert (=> b!1473232 (and (bvsge (index!50790 lt!643838) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643838) (size!48409 a!2862)))))

(declare-fun res!1000671 () Bool)

(assert (=> b!1473232 (= res!1000671 (= (select (arr!47859 a!2862) (index!50790 lt!643838)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826732 () Bool)

(assert (=> b!1473232 (=> res!1000671 e!826732)))

(declare-fun b!1473233 () Bool)

(assert (=> b!1473233 (and (bvsge (index!50790 lt!643838) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643838) (size!48409 a!2862)))))

(declare-fun res!1000672 () Bool)

(assert (=> b!1473233 (= res!1000672 (= (select (arr!47859 a!2862) (index!50790 lt!643838)) (select (arr!47859 a!2862) j!93)))))

(assert (=> b!1473233 (=> res!1000672 e!826732)))

(declare-fun e!826729 () Bool)

(assert (=> b!1473233 (= e!826729 e!826732)))

(declare-fun d!155609 () Bool)

(declare-fun e!826731 () Bool)

(assert (=> d!155609 e!826731))

(declare-fun c!135797 () Bool)

(assert (=> d!155609 (= c!135797 (and ((_ is Intermediate!12099) lt!643838) (undefined!12911 lt!643838)))))

(declare-fun e!826728 () SeekEntryResult!12099)

(assert (=> d!155609 (= lt!643838 e!826728)))

(declare-fun c!135798 () Bool)

(assert (=> d!155609 (= c!135798 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643837 () (_ BitVec 64))

(assert (=> d!155609 (= lt!643837 (select (arr!47859 a!2862) index!646))))

(assert (=> d!155609 (validMask!0 mask!2687)))

(assert (=> d!155609 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47859 a!2862) j!93) a!2862 mask!2687) lt!643838)))

(declare-fun e!826730 () SeekEntryResult!12099)

(declare-fun b!1473234 () Bool)

(assert (=> b!1473234 (= e!826730 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47859 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473235 () Bool)

(assert (=> b!1473235 (= e!826728 (Intermediate!12099 true index!646 x!665))))

(declare-fun b!1473236 () Bool)

(assert (=> b!1473236 (and (bvsge (index!50790 lt!643838) #b00000000000000000000000000000000) (bvslt (index!50790 lt!643838) (size!48409 a!2862)))))

(assert (=> b!1473236 (= e!826732 (= (select (arr!47859 a!2862) (index!50790 lt!643838)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473237 () Bool)

(assert (=> b!1473237 (= e!826731 (bvsge (x!132366 lt!643838) #b01111111111111111111111111111110))))

(declare-fun b!1473238 () Bool)

(assert (=> b!1473238 (= e!826728 e!826730)))

(declare-fun c!135796 () Bool)

(assert (=> b!1473238 (= c!135796 (or (= lt!643837 (select (arr!47859 a!2862) j!93)) (= (bvadd lt!643837 lt!643837) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473239 () Bool)

(assert (=> b!1473239 (= e!826730 (Intermediate!12099 false index!646 x!665))))

(declare-fun b!1473240 () Bool)

(assert (=> b!1473240 (= e!826731 e!826729)))

(declare-fun res!1000670 () Bool)

(assert (=> b!1473240 (= res!1000670 (and ((_ is Intermediate!12099) lt!643838) (not (undefined!12911 lt!643838)) (bvslt (x!132366 lt!643838) #b01111111111111111111111111111110) (bvsge (x!132366 lt!643838) #b00000000000000000000000000000000) (bvsge (x!132366 lt!643838) x!665)))))

(assert (=> b!1473240 (=> (not res!1000670) (not e!826729))))

(assert (= (and d!155609 c!135798) b!1473235))

(assert (= (and d!155609 (not c!135798)) b!1473238))

(assert (= (and b!1473238 c!135796) b!1473239))

(assert (= (and b!1473238 (not c!135796)) b!1473234))

(assert (= (and d!155609 c!135797) b!1473237))

(assert (= (and d!155609 (not c!135797)) b!1473240))

(assert (= (and b!1473240 res!1000670) b!1473233))

(assert (= (and b!1473233 (not res!1000672)) b!1473232))

(assert (= (and b!1473232 (not res!1000671)) b!1473236))

(declare-fun m!1359833 () Bool)

(assert (=> b!1473233 m!1359833))

(assert (=> b!1473234 m!1359775))

(assert (=> b!1473234 m!1359775))

(assert (=> b!1473234 m!1359597))

(declare-fun m!1359835 () Bool)

(assert (=> b!1473234 m!1359835))

(assert (=> d!155609 m!1359625))

(assert (=> d!155609 m!1359615))

(assert (=> b!1473236 m!1359833))

(assert (=> b!1473232 m!1359833))

(assert (=> b!1472933 d!155609))

(check-sat (not b!1473024) (not b!1473184) (not b!1473176) (not d!155543) (not bm!67744) (not b!1473180) (not b!1473162) (not b!1473025) (not d!155609) (not b!1473006) (not b!1473027) (not d!155595) (not d!155549) (not b!1473071) (not d!155565) (not b!1473234) (not b!1473044) (not b!1473212) (not d!155577) (not d!155563) (not bm!67745) (not b!1473070) (not bm!67738) (not b!1473179) (not d!155589))
(check-sat)
