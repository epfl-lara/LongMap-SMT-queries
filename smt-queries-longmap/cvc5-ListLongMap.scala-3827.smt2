; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52448 () Bool)

(assert start!52448)

(declare-fun b!572699 () Bool)

(declare-fun res!362212 () Bool)

(declare-fun e!329439 () Bool)

(assert (=> b!572699 (=> (not res!362212) (not e!329439))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572699 (= res!362212 (validKeyInArray!0 k!1914))))

(declare-fun b!572700 () Bool)

(declare-fun res!362218 () Bool)

(assert (=> b!572700 (=> (not res!362218) (not e!329439))))

(declare-datatypes ((array!35845 0))(
  ( (array!35846 (arr!17211 (Array (_ BitVec 32) (_ BitVec 64))) (size!17575 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35845)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572700 (= res!362218 (validKeyInArray!0 (select (arr!17211 a!3118) j!142)))))

(declare-fun res!362219 () Bool)

(assert (=> start!52448 (=> (not res!362219) (not e!329439))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52448 (= res!362219 (validMask!0 mask!3119))))

(assert (=> start!52448 e!329439))

(assert (=> start!52448 true))

(declare-fun array_inv!13007 (array!35845) Bool)

(assert (=> start!52448 (array_inv!13007 a!3118)))

(declare-fun b!572701 () Bool)

(declare-fun e!329438 () Bool)

(declare-fun e!329440 () Bool)

(assert (=> b!572701 (= e!329438 e!329440)))

(declare-fun res!362211 () Bool)

(assert (=> b!572701 (=> (not res!362211) (not e!329440))))

(declare-datatypes ((SeekEntryResult!5660 0))(
  ( (MissingZero!5660 (index!24867 (_ BitVec 32))) (Found!5660 (index!24868 (_ BitVec 32))) (Intermediate!5660 (undefined!6472 Bool) (index!24869 (_ BitVec 32)) (x!53737 (_ BitVec 32))) (Undefined!5660) (MissingVacant!5660 (index!24870 (_ BitVec 32))) )
))
(declare-fun lt!261418 () SeekEntryResult!5660)

(declare-fun lt!261419 () array!35845)

(declare-fun lt!261423 () (_ BitVec 64))

(declare-fun lt!261416 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35845 (_ BitVec 32)) SeekEntryResult!5660)

(assert (=> b!572701 (= res!362211 (= lt!261418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261416 lt!261423 lt!261419 mask!3119)))))

(declare-fun lt!261421 () (_ BitVec 32))

(assert (=> b!572701 (= lt!261418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261421 (select (arr!17211 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572701 (= lt!261416 (toIndex!0 lt!261423 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572701 (= lt!261423 (select (store (arr!17211 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572701 (= lt!261421 (toIndex!0 (select (arr!17211 a!3118) j!142) mask!3119))))

(assert (=> b!572701 (= lt!261419 (array!35846 (store (arr!17211 a!3118) i!1132 k!1914) (size!17575 a!3118)))))

(declare-fun b!572702 () Bool)

(assert (=> b!572702 (= e!329439 e!329438)))

(declare-fun res!362207 () Bool)

(assert (=> b!572702 (=> (not res!362207) (not e!329438))))

(declare-fun lt!261422 () SeekEntryResult!5660)

(assert (=> b!572702 (= res!362207 (or (= lt!261422 (MissingZero!5660 i!1132)) (= lt!261422 (MissingVacant!5660 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35845 (_ BitVec 32)) SeekEntryResult!5660)

(assert (=> b!572702 (= lt!261422 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572703 () Bool)

(declare-fun res!362217 () Bool)

(assert (=> b!572703 (=> (not res!362217) (not e!329438))))

(declare-datatypes ((List!11291 0))(
  ( (Nil!11288) (Cons!11287 (h!12314 (_ BitVec 64)) (t!17519 List!11291)) )
))
(declare-fun arrayNoDuplicates!0 (array!35845 (_ BitVec 32) List!11291) Bool)

(assert (=> b!572703 (= res!362217 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11288))))

(declare-fun b!572704 () Bool)

(declare-fun res!362216 () Bool)

(assert (=> b!572704 (=> (not res!362216) (not e!329439))))

(declare-fun arrayContainsKey!0 (array!35845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572704 (= res!362216 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572705 () Bool)

(declare-fun res!362209 () Bool)

(assert (=> b!572705 (=> (not res!362209) (not e!329439))))

(assert (=> b!572705 (= res!362209 (and (= (size!17575 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17575 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17575 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572706 () Bool)

(declare-fun e!329441 () Bool)

(declare-fun e!329437 () Bool)

(assert (=> b!572706 (= e!329441 e!329437)))

(declare-fun res!362214 () Bool)

(assert (=> b!572706 (=> (not res!362214) (not e!329437))))

(declare-fun lt!261424 () SeekEntryResult!5660)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35845 (_ BitVec 32)) SeekEntryResult!5660)

(assert (=> b!572706 (= res!362214 (= lt!261424 (seekKeyOrZeroReturnVacant!0 (x!53737 lt!261418) (index!24869 lt!261418) (index!24869 lt!261418) (select (arr!17211 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572707 () Bool)

(declare-fun res!362215 () Bool)

(assert (=> b!572707 (=> (not res!362215) (not e!329438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35845 (_ BitVec 32)) Bool)

(assert (=> b!572707 (= res!362215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572708 () Bool)

(declare-fun e!329442 () Bool)

(declare-fun e!329435 () Bool)

(assert (=> b!572708 (= e!329442 e!329435)))

(declare-fun res!362210 () Bool)

(assert (=> b!572708 (=> res!362210 e!329435)))

(assert (=> b!572708 (= res!362210 (or (undefined!6472 lt!261418) (not (is-Intermediate!5660 lt!261418))))))

(declare-fun b!572709 () Bool)

(assert (=> b!572709 (= e!329440 (not true))))

(assert (=> b!572709 e!329442))

(declare-fun res!362208 () Bool)

(assert (=> b!572709 (=> (not res!362208) (not e!329442))))

(assert (=> b!572709 (= res!362208 (= lt!261424 (Found!5660 j!142)))))

(assert (=> b!572709 (= lt!261424 (seekEntryOrOpen!0 (select (arr!17211 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572709 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18022 0))(
  ( (Unit!18023) )
))
(declare-fun lt!261420 () Unit!18022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18022)

(assert (=> b!572709 (= lt!261420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572710 () Bool)

(assert (=> b!572710 (= e!329437 (= (seekEntryOrOpen!0 lt!261423 lt!261419 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53737 lt!261418) (index!24869 lt!261418) (index!24869 lt!261418) lt!261423 lt!261419 mask!3119)))))

(declare-fun b!572711 () Bool)

(assert (=> b!572711 (= e!329435 e!329441)))

(declare-fun res!362213 () Bool)

(assert (=> b!572711 (=> res!362213 e!329441)))

(declare-fun lt!261417 () (_ BitVec 64))

(assert (=> b!572711 (= res!362213 (or (= lt!261417 (select (arr!17211 a!3118) j!142)) (= lt!261417 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572711 (= lt!261417 (select (arr!17211 a!3118) (index!24869 lt!261418)))))

(assert (= (and start!52448 res!362219) b!572705))

(assert (= (and b!572705 res!362209) b!572700))

(assert (= (and b!572700 res!362218) b!572699))

(assert (= (and b!572699 res!362212) b!572704))

(assert (= (and b!572704 res!362216) b!572702))

(assert (= (and b!572702 res!362207) b!572707))

(assert (= (and b!572707 res!362215) b!572703))

(assert (= (and b!572703 res!362217) b!572701))

(assert (= (and b!572701 res!362211) b!572709))

(assert (= (and b!572709 res!362208) b!572708))

(assert (= (and b!572708 (not res!362210)) b!572711))

(assert (= (and b!572711 (not res!362213)) b!572706))

(assert (= (and b!572706 res!362214) b!572710))

(declare-fun m!551709 () Bool)

(assert (=> b!572706 m!551709))

(assert (=> b!572706 m!551709))

(declare-fun m!551711 () Bool)

(assert (=> b!572706 m!551711))

(assert (=> b!572709 m!551709))

(assert (=> b!572709 m!551709))

(declare-fun m!551713 () Bool)

(assert (=> b!572709 m!551713))

(declare-fun m!551715 () Bool)

(assert (=> b!572709 m!551715))

(declare-fun m!551717 () Bool)

(assert (=> b!572709 m!551717))

(assert (=> b!572700 m!551709))

(assert (=> b!572700 m!551709))

(declare-fun m!551719 () Bool)

(assert (=> b!572700 m!551719))

(declare-fun m!551721 () Bool)

(assert (=> b!572707 m!551721))

(declare-fun m!551723 () Bool)

(assert (=> b!572704 m!551723))

(declare-fun m!551725 () Bool)

(assert (=> b!572701 m!551725))

(assert (=> b!572701 m!551709))

(declare-fun m!551727 () Bool)

(assert (=> b!572701 m!551727))

(declare-fun m!551729 () Bool)

(assert (=> b!572701 m!551729))

(assert (=> b!572701 m!551709))

(declare-fun m!551731 () Bool)

(assert (=> b!572701 m!551731))

(assert (=> b!572701 m!551709))

(declare-fun m!551733 () Bool)

(assert (=> b!572701 m!551733))

(declare-fun m!551735 () Bool)

(assert (=> b!572701 m!551735))

(assert (=> b!572711 m!551709))

(declare-fun m!551737 () Bool)

(assert (=> b!572711 m!551737))

(declare-fun m!551739 () Bool)

(assert (=> b!572703 m!551739))

(declare-fun m!551741 () Bool)

(assert (=> b!572699 m!551741))

(declare-fun m!551743 () Bool)

(assert (=> start!52448 m!551743))

(declare-fun m!551745 () Bool)

(assert (=> start!52448 m!551745))

(declare-fun m!551747 () Bool)

(assert (=> b!572710 m!551747))

(declare-fun m!551749 () Bool)

(assert (=> b!572710 m!551749))

(declare-fun m!551751 () Bool)

(assert (=> b!572702 m!551751))

(push 1)

