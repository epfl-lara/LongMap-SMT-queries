; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47764 () Bool)

(assert start!47764)

(declare-fun b!525844 () Bool)

(declare-fun res!322560 () Bool)

(declare-fun e!306565 () Bool)

(assert (=> b!525844 (=> (not res!322560) (not e!306565))))

(declare-datatypes ((array!33401 0))(
  ( (array!33402 (arr!16052 (Array (_ BitVec 32) (_ BitVec 64))) (size!16416 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33401)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33401 (_ BitVec 32)) Bool)

(assert (=> b!525844 (= res!322560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525845 () Bool)

(declare-fun res!322561 () Bool)

(declare-fun e!306561 () Bool)

(assert (=> b!525845 (=> (not res!322561) (not e!306561))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525845 (= res!322561 (validKeyInArray!0 (select (arr!16052 a!3235) j!176)))))

(declare-fun b!525846 () Bool)

(declare-fun res!322556 () Bool)

(assert (=> b!525846 (=> (not res!322556) (not e!306565))))

(declare-datatypes ((List!10210 0))(
  ( (Nil!10207) (Cons!10206 (h!11137 (_ BitVec 64)) (t!16438 List!10210)) )
))
(declare-fun arrayNoDuplicates!0 (array!33401 (_ BitVec 32) List!10210) Bool)

(assert (=> b!525846 (= res!322556 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10207))))

(declare-fun b!525847 () Bool)

(declare-datatypes ((Unit!16528 0))(
  ( (Unit!16529) )
))
(declare-fun e!306566 () Unit!16528)

(declare-fun Unit!16530 () Unit!16528)

(assert (=> b!525847 (= e!306566 Unit!16530)))

(declare-fun lt!241685 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4519 0))(
  ( (MissingZero!4519 (index!20288 (_ BitVec 32))) (Found!4519 (index!20289 (_ BitVec 32))) (Intermediate!4519 (undefined!5331 Bool) (index!20290 (_ BitVec 32)) (x!49260 (_ BitVec 32))) (Undefined!4519) (MissingVacant!4519 (index!20291 (_ BitVec 32))) )
))
(declare-fun lt!241687 () SeekEntryResult!4519)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!241690 () Unit!16528)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16528)

(assert (=> b!525847 (= lt!241690 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241685 #b00000000000000000000000000000000 (index!20290 lt!241687) (x!49260 lt!241687) mask!3524))))

(declare-fun res!322553 () Bool)

(declare-fun lt!241688 () (_ BitVec 64))

(declare-fun lt!241686 () array!33401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33401 (_ BitVec 32)) SeekEntryResult!4519)

(assert (=> b!525847 (= res!322553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241685 lt!241688 lt!241686 mask!3524) (Intermediate!4519 false (index!20290 lt!241687) (x!49260 lt!241687))))))

(declare-fun e!306563 () Bool)

(assert (=> b!525847 (=> (not res!322553) (not e!306563))))

(assert (=> b!525847 e!306563))

(declare-fun b!525848 () Bool)

(declare-fun e!306562 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33401 (_ BitVec 32)) SeekEntryResult!4519)

(assert (=> b!525848 (= e!306562 (= (seekEntryOrOpen!0 (select (arr!16052 a!3235) j!176) a!3235 mask!3524) (Found!4519 j!176)))))

(declare-fun b!525849 () Bool)

(declare-fun res!322558 () Bool)

(assert (=> b!525849 (=> (not res!322558) (not e!306561))))

(assert (=> b!525849 (= res!322558 (validKeyInArray!0 k!2280))))

(declare-fun res!322552 () Bool)

(assert (=> start!47764 (=> (not res!322552) (not e!306561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47764 (= res!322552 (validMask!0 mask!3524))))

(assert (=> start!47764 e!306561))

(assert (=> start!47764 true))

(declare-fun array_inv!11848 (array!33401) Bool)

(assert (=> start!47764 (array_inv!11848 a!3235)))

(declare-fun b!525850 () Bool)

(assert (=> b!525850 (= e!306563 false)))

(declare-fun b!525851 () Bool)

(assert (=> b!525851 (= e!306561 e!306565)))

(declare-fun res!322551 () Bool)

(assert (=> b!525851 (=> (not res!322551) (not e!306565))))

(declare-fun lt!241692 () SeekEntryResult!4519)

(assert (=> b!525851 (= res!322551 (or (= lt!241692 (MissingZero!4519 i!1204)) (= lt!241692 (MissingVacant!4519 i!1204))))))

(assert (=> b!525851 (= lt!241692 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525852 () Bool)

(declare-fun e!306567 () Bool)

(assert (=> b!525852 (= e!306567 true)))

(assert (=> b!525852 (= (index!20290 lt!241687) i!1204)))

(declare-fun lt!241684 () Unit!16528)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16528)

(assert (=> b!525852 (= lt!241684 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241685 #b00000000000000000000000000000000 (index!20290 lt!241687) (x!49260 lt!241687) mask!3524))))

(assert (=> b!525852 (and (or (= (select (arr!16052 a!3235) (index!20290 lt!241687)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16052 a!3235) (index!20290 lt!241687)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16052 a!3235) (index!20290 lt!241687)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16052 a!3235) (index!20290 lt!241687)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241691 () Unit!16528)

(assert (=> b!525852 (= lt!241691 e!306566)))

(declare-fun c!61952 () Bool)

(assert (=> b!525852 (= c!61952 (= (select (arr!16052 a!3235) (index!20290 lt!241687)) (select (arr!16052 a!3235) j!176)))))

(assert (=> b!525852 (and (bvslt (x!49260 lt!241687) #b01111111111111111111111111111110) (or (= (select (arr!16052 a!3235) (index!20290 lt!241687)) (select (arr!16052 a!3235) j!176)) (= (select (arr!16052 a!3235) (index!20290 lt!241687)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16052 a!3235) (index!20290 lt!241687)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525853 () Bool)

(assert (=> b!525853 (= e!306565 (not e!306567))))

(declare-fun res!322562 () Bool)

(assert (=> b!525853 (=> res!322562 e!306567)))

(declare-fun lt!241693 () (_ BitVec 32))

(assert (=> b!525853 (= res!322562 (= lt!241687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241693 lt!241688 lt!241686 mask!3524)))))

(assert (=> b!525853 (= lt!241687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241685 (select (arr!16052 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525853 (= lt!241693 (toIndex!0 lt!241688 mask!3524))))

(assert (=> b!525853 (= lt!241688 (select (store (arr!16052 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525853 (= lt!241685 (toIndex!0 (select (arr!16052 a!3235) j!176) mask!3524))))

(assert (=> b!525853 (= lt!241686 (array!33402 (store (arr!16052 a!3235) i!1204 k!2280) (size!16416 a!3235)))))

(assert (=> b!525853 e!306562))

(declare-fun res!322559 () Bool)

(assert (=> b!525853 (=> (not res!322559) (not e!306562))))

(assert (=> b!525853 (= res!322559 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241689 () Unit!16528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16528)

(assert (=> b!525853 (= lt!241689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525854 () Bool)

(declare-fun res!322557 () Bool)

(assert (=> b!525854 (=> res!322557 e!306567)))

(assert (=> b!525854 (= res!322557 (or (undefined!5331 lt!241687) (not (is-Intermediate!4519 lt!241687))))))

(declare-fun b!525855 () Bool)

(declare-fun Unit!16531 () Unit!16528)

(assert (=> b!525855 (= e!306566 Unit!16531)))

(declare-fun b!525856 () Bool)

(declare-fun res!322554 () Bool)

(assert (=> b!525856 (=> (not res!322554) (not e!306561))))

(declare-fun arrayContainsKey!0 (array!33401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525856 (= res!322554 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525857 () Bool)

(declare-fun res!322555 () Bool)

(assert (=> b!525857 (=> (not res!322555) (not e!306561))))

(assert (=> b!525857 (= res!322555 (and (= (size!16416 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16416 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16416 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47764 res!322552) b!525857))

(assert (= (and b!525857 res!322555) b!525845))

(assert (= (and b!525845 res!322561) b!525849))

(assert (= (and b!525849 res!322558) b!525856))

(assert (= (and b!525856 res!322554) b!525851))

(assert (= (and b!525851 res!322551) b!525844))

(assert (= (and b!525844 res!322560) b!525846))

(assert (= (and b!525846 res!322556) b!525853))

(assert (= (and b!525853 res!322559) b!525848))

(assert (= (and b!525853 (not res!322562)) b!525854))

(assert (= (and b!525854 (not res!322557)) b!525852))

(assert (= (and b!525852 c!61952) b!525847))

(assert (= (and b!525852 (not c!61952)) b!525855))

(assert (= (and b!525847 res!322553) b!525850))

(declare-fun m!506521 () Bool)

(assert (=> b!525853 m!506521))

(declare-fun m!506523 () Bool)

(assert (=> b!525853 m!506523))

(declare-fun m!506525 () Bool)

(assert (=> b!525853 m!506525))

(declare-fun m!506527 () Bool)

(assert (=> b!525853 m!506527))

(declare-fun m!506529 () Bool)

(assert (=> b!525853 m!506529))

(declare-fun m!506531 () Bool)

(assert (=> b!525853 m!506531))

(declare-fun m!506533 () Bool)

(assert (=> b!525853 m!506533))

(assert (=> b!525853 m!506531))

(declare-fun m!506535 () Bool)

(assert (=> b!525853 m!506535))

(assert (=> b!525853 m!506531))

(declare-fun m!506537 () Bool)

(assert (=> b!525853 m!506537))

(declare-fun m!506539 () Bool)

(assert (=> b!525844 m!506539))

(declare-fun m!506541 () Bool)

(assert (=> b!525852 m!506541))

(declare-fun m!506543 () Bool)

(assert (=> b!525852 m!506543))

(assert (=> b!525852 m!506531))

(declare-fun m!506545 () Bool)

(assert (=> start!47764 m!506545))

(declare-fun m!506547 () Bool)

(assert (=> start!47764 m!506547))

(assert (=> b!525848 m!506531))

(assert (=> b!525848 m!506531))

(declare-fun m!506549 () Bool)

(assert (=> b!525848 m!506549))

(declare-fun m!506551 () Bool)

(assert (=> b!525856 m!506551))

(declare-fun m!506553 () Bool)

(assert (=> b!525846 m!506553))

(declare-fun m!506555 () Bool)

(assert (=> b!525849 m!506555))

(assert (=> b!525845 m!506531))

(assert (=> b!525845 m!506531))

(declare-fun m!506557 () Bool)

(assert (=> b!525845 m!506557))

(declare-fun m!506559 () Bool)

(assert (=> b!525851 m!506559))

(declare-fun m!506561 () Bool)

(assert (=> b!525847 m!506561))

(declare-fun m!506563 () Bool)

(assert (=> b!525847 m!506563))

(push 1)

