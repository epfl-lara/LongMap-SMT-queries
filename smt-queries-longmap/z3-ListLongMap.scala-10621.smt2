; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124866 () Bool)

(assert start!124866)

(declare-fun b!1449923 () Bool)

(declare-fun res!981327 () Bool)

(declare-fun e!816488 () Bool)

(assert (=> b!1449923 (=> (not res!981327) (not e!816488))))

(declare-fun e!816493 () Bool)

(assert (=> b!1449923 (= res!981327 e!816493)))

(declare-fun c!133815 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449923 (= c!133815 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449924 () Bool)

(declare-fun e!816491 () Bool)

(declare-fun e!816486 () Bool)

(assert (=> b!1449924 (= e!816491 e!816486)))

(declare-fun res!981317 () Bool)

(assert (=> b!1449924 (=> (not res!981317) (not e!816486))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98314 0))(
  ( (array!98315 (arr!47445 (Array (_ BitVec 32) (_ BitVec 64))) (size!47995 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98314)

(assert (=> b!1449924 (= res!981317 (= (select (store (arr!47445 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636086 () array!98314)

(assert (=> b!1449924 (= lt!636086 (array!98315 (store (arr!47445 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47995 a!2862)))))

(declare-fun b!1449925 () Bool)

(declare-fun res!981324 () Bool)

(assert (=> b!1449925 (=> (not res!981324) (not e!816491))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98314 (_ BitVec 32)) Bool)

(assert (=> b!1449925 (= res!981324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449926 () Bool)

(declare-fun e!816492 () Bool)

(assert (=> b!1449926 (= e!816488 (not e!816492))))

(declare-fun res!981321 () Bool)

(assert (=> b!1449926 (=> res!981321 e!816492)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1449926 (= res!981321 (or (and (= (select (arr!47445 a!2862) index!646) (select (store (arr!47445 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47445 a!2862) index!646) (select (arr!47445 a!2862) j!93))) (not (= (select (arr!47445 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47445 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816489 () Bool)

(assert (=> b!1449926 e!816489))

(declare-fun res!981325 () Bool)

(assert (=> b!1449926 (=> (not res!981325) (not e!816489))))

(declare-datatypes ((SeekEntryResult!11697 0))(
  ( (MissingZero!11697 (index!49180 (_ BitVec 32))) (Found!11697 (index!49181 (_ BitVec 32))) (Intermediate!11697 (undefined!12509 Bool) (index!49182 (_ BitVec 32)) (x!130842 (_ BitVec 32))) (Undefined!11697) (MissingVacant!11697 (index!49183 (_ BitVec 32))) )
))
(declare-fun lt!636090 () SeekEntryResult!11697)

(declare-fun lt!636088 () SeekEntryResult!11697)

(assert (=> b!1449926 (= res!981325 (and (= lt!636090 lt!636088) (or (= (select (arr!47445 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47445 a!2862) intermediateBeforeIndex!19) (select (arr!47445 a!2862) j!93)))))))

(assert (=> b!1449926 (= lt!636088 (Found!11697 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98314 (_ BitVec 32)) SeekEntryResult!11697)

(assert (=> b!1449926 (= lt!636090 (seekEntryOrOpen!0 (select (arr!47445 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449926 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48890 0))(
  ( (Unit!48891) )
))
(declare-fun lt!636087 () Unit!48890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48890)

(assert (=> b!1449926 (= lt!636087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449927 () Bool)

(declare-fun e!816494 () Bool)

(assert (=> b!1449927 (= e!816494 e!816488)))

(declare-fun res!981326 () Bool)

(assert (=> b!1449927 (=> (not res!981326) (not e!816488))))

(declare-fun lt!636092 () SeekEntryResult!11697)

(assert (=> b!1449927 (= res!981326 (= lt!636092 (Intermediate!11697 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636093 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98314 (_ BitVec 32)) SeekEntryResult!11697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449927 (= lt!636092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636093 mask!2687) lt!636093 lt!636086 mask!2687))))

(assert (=> b!1449927 (= lt!636093 (select (store (arr!47445 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449928 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98314 (_ BitVec 32)) SeekEntryResult!11697)

(assert (=> b!1449928 (= e!816493 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636093 lt!636086 mask!2687) (seekEntryOrOpen!0 lt!636093 lt!636086 mask!2687)))))

(declare-fun b!1449929 () Bool)

(declare-fun e!816490 () Bool)

(assert (=> b!1449929 (= e!816489 e!816490)))

(declare-fun res!981314 () Bool)

(assert (=> b!1449929 (=> res!981314 e!816490)))

(assert (=> b!1449929 (= res!981314 (or (and (= (select (arr!47445 a!2862) index!646) (select (store (arr!47445 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47445 a!2862) index!646) (select (arr!47445 a!2862) j!93))) (not (= (select (arr!47445 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449930 () Bool)

(assert (=> b!1449930 (= e!816492 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1449930 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636093 lt!636086 mask!2687) lt!636088)))

(declare-fun lt!636089 () Unit!48890)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48890)

(assert (=> b!1449930 (= lt!636089 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449931 () Bool)

(declare-fun res!981318 () Bool)

(assert (=> b!1449931 (=> (not res!981318) (not e!816491))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449931 (= res!981318 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47995 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47995 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47995 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449932 () Bool)

(assert (=> b!1449932 (= e!816486 e!816494)))

(declare-fun res!981316 () Bool)

(assert (=> b!1449932 (=> (not res!981316) (not e!816494))))

(declare-fun lt!636091 () SeekEntryResult!11697)

(assert (=> b!1449932 (= res!981316 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47445 a!2862) j!93) mask!2687) (select (arr!47445 a!2862) j!93) a!2862 mask!2687) lt!636091))))

(assert (=> b!1449932 (= lt!636091 (Intermediate!11697 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449933 () Bool)

(declare-fun res!981319 () Bool)

(assert (=> b!1449933 (=> (not res!981319) (not e!816491))))

(assert (=> b!1449933 (= res!981319 (and (= (size!47995 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47995 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47995 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!981320 () Bool)

(assert (=> start!124866 (=> (not res!981320) (not e!816491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124866 (= res!981320 (validMask!0 mask!2687))))

(assert (=> start!124866 e!816491))

(assert (=> start!124866 true))

(declare-fun array_inv!36473 (array!98314) Bool)

(assert (=> start!124866 (array_inv!36473 a!2862)))

(declare-fun b!1449934 () Bool)

(declare-fun res!981315 () Bool)

(assert (=> b!1449934 (=> (not res!981315) (not e!816494))))

(assert (=> b!1449934 (= res!981315 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47445 a!2862) j!93) a!2862 mask!2687) lt!636091))))

(declare-fun b!1449935 () Bool)

(assert (=> b!1449935 (= e!816493 (= lt!636092 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636093 lt!636086 mask!2687)))))

(declare-fun b!1449936 () Bool)

(declare-fun res!981331 () Bool)

(assert (=> b!1449936 (=> (not res!981331) (not e!816491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449936 (= res!981331 (validKeyInArray!0 (select (arr!47445 a!2862) j!93)))))

(declare-fun b!1449937 () Bool)

(declare-fun e!816487 () Bool)

(assert (=> b!1449937 (= e!816487 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449938 () Bool)

(declare-fun res!981322 () Bool)

(assert (=> b!1449938 (=> res!981322 e!816492)))

(assert (=> b!1449938 (= res!981322 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47445 a!2862) j!93) a!2862 mask!2687) lt!636088)))))

(declare-fun b!1449939 () Bool)

(assert (=> b!1449939 (= e!816490 e!816487)))

(declare-fun res!981330 () Bool)

(assert (=> b!1449939 (=> (not res!981330) (not e!816487))))

(assert (=> b!1449939 (= res!981330 (= lt!636090 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47445 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449940 () Bool)

(declare-fun res!981329 () Bool)

(assert (=> b!1449940 (=> (not res!981329) (not e!816488))))

(assert (=> b!1449940 (= res!981329 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449941 () Bool)

(declare-fun res!981323 () Bool)

(assert (=> b!1449941 (=> (not res!981323) (not e!816491))))

(assert (=> b!1449941 (= res!981323 (validKeyInArray!0 (select (arr!47445 a!2862) i!1006)))))

(declare-fun b!1449942 () Bool)

(declare-fun res!981328 () Bool)

(assert (=> b!1449942 (=> (not res!981328) (not e!816491))))

(declare-datatypes ((List!33946 0))(
  ( (Nil!33943) (Cons!33942 (h!35292 (_ BitVec 64)) (t!48640 List!33946)) )
))
(declare-fun arrayNoDuplicates!0 (array!98314 (_ BitVec 32) List!33946) Bool)

(assert (=> b!1449942 (= res!981328 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33943))))

(assert (= (and start!124866 res!981320) b!1449933))

(assert (= (and b!1449933 res!981319) b!1449941))

(assert (= (and b!1449941 res!981323) b!1449936))

(assert (= (and b!1449936 res!981331) b!1449925))

(assert (= (and b!1449925 res!981324) b!1449942))

(assert (= (and b!1449942 res!981328) b!1449931))

(assert (= (and b!1449931 res!981318) b!1449924))

(assert (= (and b!1449924 res!981317) b!1449932))

(assert (= (and b!1449932 res!981316) b!1449934))

(assert (= (and b!1449934 res!981315) b!1449927))

(assert (= (and b!1449927 res!981326) b!1449923))

(assert (= (and b!1449923 c!133815) b!1449935))

(assert (= (and b!1449923 (not c!133815)) b!1449928))

(assert (= (and b!1449923 res!981327) b!1449940))

(assert (= (and b!1449940 res!981329) b!1449926))

(assert (= (and b!1449926 res!981325) b!1449929))

(assert (= (and b!1449929 (not res!981314)) b!1449939))

(assert (= (and b!1449939 res!981330) b!1449937))

(assert (= (and b!1449926 (not res!981321)) b!1449938))

(assert (= (and b!1449938 (not res!981322)) b!1449930))

(declare-fun m!1338603 () Bool)

(assert (=> b!1449932 m!1338603))

(assert (=> b!1449932 m!1338603))

(declare-fun m!1338605 () Bool)

(assert (=> b!1449932 m!1338605))

(assert (=> b!1449932 m!1338605))

(assert (=> b!1449932 m!1338603))

(declare-fun m!1338607 () Bool)

(assert (=> b!1449932 m!1338607))

(declare-fun m!1338609 () Bool)

(assert (=> b!1449935 m!1338609))

(declare-fun m!1338611 () Bool)

(assert (=> b!1449928 m!1338611))

(declare-fun m!1338613 () Bool)

(assert (=> b!1449928 m!1338613))

(declare-fun m!1338615 () Bool)

(assert (=> b!1449929 m!1338615))

(declare-fun m!1338617 () Bool)

(assert (=> b!1449929 m!1338617))

(declare-fun m!1338619 () Bool)

(assert (=> b!1449929 m!1338619))

(assert (=> b!1449929 m!1338603))

(declare-fun m!1338621 () Bool)

(assert (=> start!124866 m!1338621))

(declare-fun m!1338623 () Bool)

(assert (=> start!124866 m!1338623))

(declare-fun m!1338625 () Bool)

(assert (=> b!1449926 m!1338625))

(assert (=> b!1449926 m!1338617))

(declare-fun m!1338627 () Bool)

(assert (=> b!1449926 m!1338627))

(assert (=> b!1449926 m!1338619))

(assert (=> b!1449926 m!1338615))

(assert (=> b!1449926 m!1338603))

(declare-fun m!1338629 () Bool)

(assert (=> b!1449926 m!1338629))

(declare-fun m!1338631 () Bool)

(assert (=> b!1449926 m!1338631))

(assert (=> b!1449926 m!1338603))

(declare-fun m!1338633 () Bool)

(assert (=> b!1449942 m!1338633))

(assert (=> b!1449924 m!1338617))

(declare-fun m!1338635 () Bool)

(assert (=> b!1449924 m!1338635))

(declare-fun m!1338637 () Bool)

(assert (=> b!1449941 m!1338637))

(assert (=> b!1449941 m!1338637))

(declare-fun m!1338639 () Bool)

(assert (=> b!1449941 m!1338639))

(assert (=> b!1449939 m!1338603))

(assert (=> b!1449939 m!1338603))

(declare-fun m!1338641 () Bool)

(assert (=> b!1449939 m!1338641))

(assert (=> b!1449934 m!1338603))

(assert (=> b!1449934 m!1338603))

(declare-fun m!1338643 () Bool)

(assert (=> b!1449934 m!1338643))

(declare-fun m!1338645 () Bool)

(assert (=> b!1449927 m!1338645))

(assert (=> b!1449927 m!1338645))

(declare-fun m!1338647 () Bool)

(assert (=> b!1449927 m!1338647))

(assert (=> b!1449927 m!1338617))

(declare-fun m!1338649 () Bool)

(assert (=> b!1449927 m!1338649))

(assert (=> b!1449936 m!1338603))

(assert (=> b!1449936 m!1338603))

(declare-fun m!1338651 () Bool)

(assert (=> b!1449936 m!1338651))

(declare-fun m!1338653 () Bool)

(assert (=> b!1449925 m!1338653))

(assert (=> b!1449930 m!1338611))

(declare-fun m!1338655 () Bool)

(assert (=> b!1449930 m!1338655))

(assert (=> b!1449938 m!1338603))

(assert (=> b!1449938 m!1338603))

(declare-fun m!1338657 () Bool)

(assert (=> b!1449938 m!1338657))

(check-sat (not b!1449939) (not b!1449938) (not b!1449936) (not b!1449941) (not b!1449934) (not b!1449926) (not b!1449925) (not b!1449942) (not b!1449928) (not b!1449930) (not b!1449932) (not b!1449927) (not start!124866) (not b!1449935))
(check-sat)
