; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126170 () Bool)

(assert start!126170)

(declare-fun b!1477570 () Bool)

(declare-fun res!1003696 () Bool)

(declare-fun e!828912 () Bool)

(assert (=> b!1477570 (=> (not res!1003696) (not e!828912))))

(declare-datatypes ((array!99276 0))(
  ( (array!99277 (arr!47917 (Array (_ BitVec 32) (_ BitVec 64))) (size!48467 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99276)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477570 (= res!1003696 (validKeyInArray!0 (select (arr!47917 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!828913 () Bool)

(declare-fun lt!645396 () array!99276)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!645395 () (_ BitVec 64))

(declare-fun b!1477571 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12157 0))(
  ( (MissingZero!12157 (index!51020 (_ BitVec 32))) (Found!12157 (index!51021 (_ BitVec 32))) (Intermediate!12157 (undefined!12969 Bool) (index!51022 (_ BitVec 32)) (x!132612 (_ BitVec 32))) (Undefined!12157) (MissingVacant!12157 (index!51023 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99276 (_ BitVec 32)) SeekEntryResult!12157)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99276 (_ BitVec 32)) SeekEntryResult!12157)

(assert (=> b!1477571 (= e!828913 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645395 lt!645396 mask!2687) (seekEntryOrOpen!0 lt!645395 lt!645396 mask!2687)))))

(declare-fun b!1477572 () Bool)

(declare-fun e!828917 () Bool)

(declare-fun e!828911 () Bool)

(assert (=> b!1477572 (= e!828917 e!828911)))

(declare-fun res!1003685 () Bool)

(assert (=> b!1477572 (=> (not res!1003685) (not e!828911))))

(declare-fun lt!645393 () SeekEntryResult!12157)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477572 (= res!1003685 (= lt!645393 (Intermediate!12157 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99276 (_ BitVec 32)) SeekEntryResult!12157)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477572 (= lt!645393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645395 mask!2687) lt!645395 lt!645396 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477572 (= lt!645395 (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477573 () Bool)

(declare-fun res!1003683 () Bool)

(assert (=> b!1477573 (=> (not res!1003683) (not e!828912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99276 (_ BitVec 32)) Bool)

(assert (=> b!1477573 (= res!1003683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477574 () Bool)

(declare-fun res!1003692 () Bool)

(assert (=> b!1477574 (=> (not res!1003692) (not e!828912))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477574 (= res!1003692 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48467 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48467 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48467 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477575 () Bool)

(declare-fun e!828909 () Bool)

(declare-fun e!828914 () Bool)

(assert (=> b!1477575 (= e!828909 e!828914)))

(declare-fun res!1003694 () Bool)

(assert (=> b!1477575 (=> (not res!1003694) (not e!828914))))

(declare-fun lt!645392 () SeekEntryResult!12157)

(assert (=> b!1477575 (= res!1003694 (= lt!645392 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47917 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477576 () Bool)

(declare-fun res!1003691 () Bool)

(assert (=> b!1477576 (=> (not res!1003691) (not e!828912))))

(declare-datatypes ((List!34418 0))(
  ( (Nil!34415) (Cons!34414 (h!35782 (_ BitVec 64)) (t!49112 List!34418)) )
))
(declare-fun arrayNoDuplicates!0 (array!99276 (_ BitVec 32) List!34418) Bool)

(assert (=> b!1477576 (= res!1003691 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34415))))

(declare-fun b!1477577 () Bool)

(declare-fun e!828910 () Bool)

(assert (=> b!1477577 (= e!828910 e!828909)))

(declare-fun res!1003681 () Bool)

(assert (=> b!1477577 (=> res!1003681 e!828909)))

(assert (=> b!1477577 (= res!1003681 (or (and (= (select (arr!47917 a!2862) index!646) (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47917 a!2862) index!646) (select (arr!47917 a!2862) j!93))) (not (= (select (arr!47917 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477578 () Bool)

(declare-fun res!1003693 () Bool)

(assert (=> b!1477578 (=> (not res!1003693) (not e!828912))))

(assert (=> b!1477578 (= res!1003693 (validKeyInArray!0 (select (arr!47917 a!2862) i!1006)))))

(declare-fun b!1477579 () Bool)

(assert (=> b!1477579 (= e!828914 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477580 () Bool)

(declare-fun res!1003684 () Bool)

(assert (=> b!1477580 (=> (not res!1003684) (not e!828911))))

(assert (=> b!1477580 (= res!1003684 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477581 () Bool)

(declare-fun res!1003695 () Bool)

(assert (=> b!1477581 (=> (not res!1003695) (not e!828917))))

(declare-fun lt!645391 () SeekEntryResult!12157)

(assert (=> b!1477581 (= res!1003695 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47917 a!2862) j!93) a!2862 mask!2687) lt!645391))))

(declare-fun b!1477582 () Bool)

(declare-fun e!828916 () Bool)

(assert (=> b!1477582 (= e!828912 e!828916)))

(declare-fun res!1003689 () Bool)

(assert (=> b!1477582 (=> (not res!1003689) (not e!828916))))

(assert (=> b!1477582 (= res!1003689 (= (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477582 (= lt!645396 (array!99277 (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48467 a!2862)))))

(declare-fun b!1477583 () Bool)

(assert (=> b!1477583 (= e!828913 (= lt!645393 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645395 lt!645396 mask!2687)))))

(declare-fun b!1477584 () Bool)

(assert (=> b!1477584 (= e!828916 e!828917)))

(declare-fun res!1003687 () Bool)

(assert (=> b!1477584 (=> (not res!1003687) (not e!828917))))

(assert (=> b!1477584 (= res!1003687 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47917 a!2862) j!93) mask!2687) (select (arr!47917 a!2862) j!93) a!2862 mask!2687) lt!645391))))

(assert (=> b!1477584 (= lt!645391 (Intermediate!12157 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477585 () Bool)

(declare-fun res!1003690 () Bool)

(assert (=> b!1477585 (=> (not res!1003690) (not e!828911))))

(assert (=> b!1477585 (= res!1003690 e!828913)))

(declare-fun c!136464 () Bool)

(assert (=> b!1477585 (= c!136464 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477586 () Bool)

(assert (=> b!1477586 (= e!828911 (not true))))

(assert (=> b!1477586 e!828910))

(declare-fun res!1003682 () Bool)

(assert (=> b!1477586 (=> (not res!1003682) (not e!828910))))

(assert (=> b!1477586 (= res!1003682 (and (= lt!645392 (Found!12157 j!93)) (or (= (select (arr!47917 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47917 a!2862) intermediateBeforeIndex!19) (select (arr!47917 a!2862) j!93)))))))

(assert (=> b!1477586 (= lt!645392 (seekEntryOrOpen!0 (select (arr!47917 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477586 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49654 0))(
  ( (Unit!49655) )
))
(declare-fun lt!645394 () Unit!49654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49654)

(assert (=> b!1477586 (= lt!645394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477587 () Bool)

(declare-fun res!1003686 () Bool)

(assert (=> b!1477587 (=> (not res!1003686) (not e!828912))))

(assert (=> b!1477587 (= res!1003686 (and (= (size!48467 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48467 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48467 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1003688 () Bool)

(assert (=> start!126170 (=> (not res!1003688) (not e!828912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126170 (= res!1003688 (validMask!0 mask!2687))))

(assert (=> start!126170 e!828912))

(assert (=> start!126170 true))

(declare-fun array_inv!36945 (array!99276) Bool)

(assert (=> start!126170 (array_inv!36945 a!2862)))

(assert (= (and start!126170 res!1003688) b!1477587))

(assert (= (and b!1477587 res!1003686) b!1477578))

(assert (= (and b!1477578 res!1003693) b!1477570))

(assert (= (and b!1477570 res!1003696) b!1477573))

(assert (= (and b!1477573 res!1003683) b!1477576))

(assert (= (and b!1477576 res!1003691) b!1477574))

(assert (= (and b!1477574 res!1003692) b!1477582))

(assert (= (and b!1477582 res!1003689) b!1477584))

(assert (= (and b!1477584 res!1003687) b!1477581))

(assert (= (and b!1477581 res!1003695) b!1477572))

(assert (= (and b!1477572 res!1003685) b!1477585))

(assert (= (and b!1477585 c!136464) b!1477583))

(assert (= (and b!1477585 (not c!136464)) b!1477571))

(assert (= (and b!1477585 res!1003690) b!1477580))

(assert (= (and b!1477580 res!1003684) b!1477586))

(assert (= (and b!1477586 res!1003682) b!1477577))

(assert (= (and b!1477577 (not res!1003681)) b!1477575))

(assert (= (and b!1477575 res!1003694) b!1477579))

(declare-fun m!1363515 () Bool)

(assert (=> b!1477577 m!1363515))

(declare-fun m!1363517 () Bool)

(assert (=> b!1477577 m!1363517))

(declare-fun m!1363519 () Bool)

(assert (=> b!1477577 m!1363519))

(declare-fun m!1363521 () Bool)

(assert (=> b!1477577 m!1363521))

(declare-fun m!1363523 () Bool)

(assert (=> b!1477573 m!1363523))

(declare-fun m!1363525 () Bool)

(assert (=> b!1477586 m!1363525))

(declare-fun m!1363527 () Bool)

(assert (=> b!1477586 m!1363527))

(assert (=> b!1477586 m!1363521))

(declare-fun m!1363529 () Bool)

(assert (=> b!1477586 m!1363529))

(declare-fun m!1363531 () Bool)

(assert (=> b!1477586 m!1363531))

(assert (=> b!1477586 m!1363521))

(assert (=> b!1477582 m!1363517))

(declare-fun m!1363533 () Bool)

(assert (=> b!1477582 m!1363533))

(assert (=> b!1477570 m!1363521))

(assert (=> b!1477570 m!1363521))

(declare-fun m!1363535 () Bool)

(assert (=> b!1477570 m!1363535))

(declare-fun m!1363537 () Bool)

(assert (=> start!126170 m!1363537))

(declare-fun m!1363539 () Bool)

(assert (=> start!126170 m!1363539))

(declare-fun m!1363541 () Bool)

(assert (=> b!1477571 m!1363541))

(declare-fun m!1363543 () Bool)

(assert (=> b!1477571 m!1363543))

(assert (=> b!1477584 m!1363521))

(assert (=> b!1477584 m!1363521))

(declare-fun m!1363545 () Bool)

(assert (=> b!1477584 m!1363545))

(assert (=> b!1477584 m!1363545))

(assert (=> b!1477584 m!1363521))

(declare-fun m!1363547 () Bool)

(assert (=> b!1477584 m!1363547))

(assert (=> b!1477575 m!1363521))

(assert (=> b!1477575 m!1363521))

(declare-fun m!1363549 () Bool)

(assert (=> b!1477575 m!1363549))

(declare-fun m!1363551 () Bool)

(assert (=> b!1477572 m!1363551))

(assert (=> b!1477572 m!1363551))

(declare-fun m!1363553 () Bool)

(assert (=> b!1477572 m!1363553))

(assert (=> b!1477572 m!1363517))

(declare-fun m!1363555 () Bool)

(assert (=> b!1477572 m!1363555))

(declare-fun m!1363557 () Bool)

(assert (=> b!1477583 m!1363557))

(declare-fun m!1363559 () Bool)

(assert (=> b!1477576 m!1363559))

(declare-fun m!1363561 () Bool)

(assert (=> b!1477578 m!1363561))

(assert (=> b!1477578 m!1363561))

(declare-fun m!1363563 () Bool)

(assert (=> b!1477578 m!1363563))

(assert (=> b!1477581 m!1363521))

(assert (=> b!1477581 m!1363521))

(declare-fun m!1363565 () Bool)

(assert (=> b!1477581 m!1363565))

(push 1)

