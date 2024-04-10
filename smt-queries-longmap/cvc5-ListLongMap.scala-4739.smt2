; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65494 () Bool)

(assert start!65494)

(declare-fun b!746797 () Bool)

(declare-datatypes ((array!41667 0))(
  ( (array!41668 (arr!19947 (Array (_ BitVec 32) (_ BitVec 64))) (size!20368 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41667)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!417025 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7547 0))(
  ( (MissingZero!7547 (index!32556 (_ BitVec 32))) (Found!7547 (index!32557 (_ BitVec 32))) (Intermediate!7547 (undefined!8359 Bool) (index!32558 (_ BitVec 32)) (x!63505 (_ BitVec 32))) (Undefined!7547) (MissingVacant!7547 (index!32559 (_ BitVec 32))) )
))
(declare-fun lt!331921 () SeekEntryResult!7547)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41667 (_ BitVec 32)) SeekEntryResult!7547)

(assert (=> b!746797 (= e!417025 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19947 a!3186) j!159) a!3186 mask!3328) lt!331921))))

(declare-fun b!746798 () Bool)

(declare-fun res!503527 () Bool)

(declare-fun e!417027 () Bool)

(assert (=> b!746798 (=> (not res!503527) (not e!417027))))

(assert (=> b!746798 (= res!503527 e!417025)))

(declare-fun c!82018 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746798 (= c!82018 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746799 () Bool)

(declare-fun e!417029 () Bool)

(assert (=> b!746799 (= e!417029 e!417027)))

(declare-fun res!503526 () Bool)

(assert (=> b!746799 (=> (not res!503526) (not e!417027))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746799 (= res!503526 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19947 a!3186) j!159) mask!3328) (select (arr!19947 a!3186) j!159) a!3186 mask!3328) lt!331921))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!746799 (= lt!331921 (Intermediate!7547 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746801 () Bool)

(declare-fun e!417024 () Bool)

(assert (=> b!746801 (= e!417024 e!417029)))

(declare-fun res!503533 () Bool)

(assert (=> b!746801 (=> (not res!503533) (not e!417029))))

(declare-fun lt!331923 () SeekEntryResult!7547)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746801 (= res!503533 (or (= lt!331923 (MissingZero!7547 i!1173)) (= lt!331923 (MissingVacant!7547 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41667 (_ BitVec 32)) SeekEntryResult!7547)

(assert (=> b!746801 (= lt!331923 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746802 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41667 (_ BitVec 32)) SeekEntryResult!7547)

(assert (=> b!746802 (= e!417025 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19947 a!3186) j!159) a!3186 mask!3328) (Found!7547 j!159)))))

(declare-fun b!746803 () Bool)

(declare-fun res!503534 () Bool)

(assert (=> b!746803 (=> (not res!503534) (not e!417029))))

(assert (=> b!746803 (= res!503534 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20368 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20368 a!3186))))))

(declare-fun b!746804 () Bool)

(declare-fun e!417026 () Bool)

(assert (=> b!746804 (= e!417026 true)))

(declare-fun lt!331916 () SeekEntryResult!7547)

(declare-fun lt!331925 () SeekEntryResult!7547)

(assert (=> b!746804 (= lt!331916 lt!331925)))

(declare-fun b!746805 () Bool)

(declare-fun e!417028 () Bool)

(assert (=> b!746805 (= e!417028 e!417026)))

(declare-fun res!503529 () Bool)

(assert (=> b!746805 (=> res!503529 e!417026)))

(declare-fun lt!331920 () (_ BitVec 64))

(declare-fun lt!331918 () SeekEntryResult!7547)

(assert (=> b!746805 (= res!503529 (or (not (= lt!331925 lt!331918)) (= (select (store (arr!19947 a!3186) i!1173 k!2102) index!1321) lt!331920) (not (= (select (store (arr!19947 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746805 (= lt!331925 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19947 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746806 () Bool)

(declare-fun res!503530 () Bool)

(assert (=> b!746806 (=> (not res!503530) (not e!417029))))

(declare-datatypes ((List!13949 0))(
  ( (Nil!13946) (Cons!13945 (h!15017 (_ BitVec 64)) (t!20264 List!13949)) )
))
(declare-fun arrayNoDuplicates!0 (array!41667 (_ BitVec 32) List!13949) Bool)

(assert (=> b!746806 (= res!503530 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13946))))

(declare-fun b!746807 () Bool)

(declare-fun res!503523 () Bool)

(assert (=> b!746807 (=> (not res!503523) (not e!417027))))

(assert (=> b!746807 (= res!503523 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19947 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!417022 () Bool)

(declare-fun b!746800 () Bool)

(assert (=> b!746800 (= e!417022 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19947 a!3186) j!159) a!3186 mask!3328) lt!331918))))

(declare-fun res!503531 () Bool)

(assert (=> start!65494 (=> (not res!503531) (not e!417024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65494 (= res!503531 (validMask!0 mask!3328))))

(assert (=> start!65494 e!417024))

(assert (=> start!65494 true))

(declare-fun array_inv!15743 (array!41667) Bool)

(assert (=> start!65494 (array_inv!15743 a!3186)))

(declare-fun b!746808 () Bool)

(declare-fun res!503524 () Bool)

(assert (=> b!746808 (=> (not res!503524) (not e!417024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746808 (= res!503524 (validKeyInArray!0 k!2102))))

(declare-fun b!746809 () Bool)

(declare-fun res!503536 () Bool)

(assert (=> b!746809 (=> (not res!503536) (not e!417024))))

(assert (=> b!746809 (= res!503536 (validKeyInArray!0 (select (arr!19947 a!3186) j!159)))))

(declare-fun b!746810 () Bool)

(declare-fun e!417023 () Bool)

(assert (=> b!746810 (= e!417027 e!417023)))

(declare-fun res!503522 () Bool)

(assert (=> b!746810 (=> (not res!503522) (not e!417023))))

(declare-fun lt!331924 () SeekEntryResult!7547)

(declare-fun lt!331919 () SeekEntryResult!7547)

(assert (=> b!746810 (= res!503522 (= lt!331924 lt!331919))))

(declare-fun lt!331917 () array!41667)

(assert (=> b!746810 (= lt!331919 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331920 lt!331917 mask!3328))))

(assert (=> b!746810 (= lt!331924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331920 mask!3328) lt!331920 lt!331917 mask!3328))))

(assert (=> b!746810 (= lt!331920 (select (store (arr!19947 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746810 (= lt!331917 (array!41668 (store (arr!19947 a!3186) i!1173 k!2102) (size!20368 a!3186)))))

(declare-fun b!746811 () Bool)

(declare-fun res!503537 () Bool)

(assert (=> b!746811 (=> (not res!503537) (not e!417024))))

(declare-fun arrayContainsKey!0 (array!41667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746811 (= res!503537 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746812 () Bool)

(assert (=> b!746812 (= e!417023 (not e!417028))))

(declare-fun res!503528 () Bool)

(assert (=> b!746812 (=> res!503528 e!417028)))

(assert (=> b!746812 (= res!503528 (or (not (is-Intermediate!7547 lt!331919)) (bvslt x!1131 (x!63505 lt!331919)) (not (= x!1131 (x!63505 lt!331919))) (not (= index!1321 (index!32558 lt!331919)))))))

(assert (=> b!746812 e!417022))

(declare-fun res!503525 () Bool)

(assert (=> b!746812 (=> (not res!503525) (not e!417022))))

(assert (=> b!746812 (= res!503525 (= lt!331916 lt!331918))))

(assert (=> b!746812 (= lt!331918 (Found!7547 j!159))))

(assert (=> b!746812 (= lt!331916 (seekEntryOrOpen!0 (select (arr!19947 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41667 (_ BitVec 32)) Bool)

(assert (=> b!746812 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25574 0))(
  ( (Unit!25575) )
))
(declare-fun lt!331922 () Unit!25574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25574)

(assert (=> b!746812 (= lt!331922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746813 () Bool)

(declare-fun res!503535 () Bool)

(assert (=> b!746813 (=> (not res!503535) (not e!417024))))

(assert (=> b!746813 (= res!503535 (and (= (size!20368 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20368 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20368 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746814 () Bool)

(declare-fun res!503532 () Bool)

(assert (=> b!746814 (=> (not res!503532) (not e!417029))))

(assert (=> b!746814 (= res!503532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65494 res!503531) b!746813))

(assert (= (and b!746813 res!503535) b!746809))

(assert (= (and b!746809 res!503536) b!746808))

(assert (= (and b!746808 res!503524) b!746811))

(assert (= (and b!746811 res!503537) b!746801))

(assert (= (and b!746801 res!503533) b!746814))

(assert (= (and b!746814 res!503532) b!746806))

(assert (= (and b!746806 res!503530) b!746803))

(assert (= (and b!746803 res!503534) b!746799))

(assert (= (and b!746799 res!503526) b!746807))

(assert (= (and b!746807 res!503523) b!746798))

(assert (= (and b!746798 c!82018) b!746797))

(assert (= (and b!746798 (not c!82018)) b!746802))

(assert (= (and b!746798 res!503527) b!746810))

(assert (= (and b!746810 res!503522) b!746812))

(assert (= (and b!746812 res!503525) b!746800))

(assert (= (and b!746812 (not res!503528)) b!746805))

(assert (= (and b!746805 (not res!503529)) b!746804))

(declare-fun m!697015 () Bool)

(assert (=> b!746801 m!697015))

(declare-fun m!697017 () Bool)

(assert (=> b!746805 m!697017))

(declare-fun m!697019 () Bool)

(assert (=> b!746805 m!697019))

(declare-fun m!697021 () Bool)

(assert (=> b!746805 m!697021))

(assert (=> b!746805 m!697021))

(declare-fun m!697023 () Bool)

(assert (=> b!746805 m!697023))

(assert (=> b!746802 m!697021))

(assert (=> b!746802 m!697021))

(assert (=> b!746802 m!697023))

(assert (=> b!746812 m!697021))

(assert (=> b!746812 m!697021))

(declare-fun m!697025 () Bool)

(assert (=> b!746812 m!697025))

(declare-fun m!697027 () Bool)

(assert (=> b!746812 m!697027))

(declare-fun m!697029 () Bool)

(assert (=> b!746812 m!697029))

(declare-fun m!697031 () Bool)

(assert (=> b!746807 m!697031))

(declare-fun m!697033 () Bool)

(assert (=> b!746806 m!697033))

(assert (=> b!746797 m!697021))

(assert (=> b!746797 m!697021))

(declare-fun m!697035 () Bool)

(assert (=> b!746797 m!697035))

(assert (=> b!746809 m!697021))

(assert (=> b!746809 m!697021))

(declare-fun m!697037 () Bool)

(assert (=> b!746809 m!697037))

(declare-fun m!697039 () Bool)

(assert (=> b!746810 m!697039))

(declare-fun m!697041 () Bool)

(assert (=> b!746810 m!697041))

(assert (=> b!746810 m!697017))

(declare-fun m!697043 () Bool)

(assert (=> b!746810 m!697043))

(assert (=> b!746810 m!697041))

(declare-fun m!697045 () Bool)

(assert (=> b!746810 m!697045))

(declare-fun m!697047 () Bool)

(assert (=> b!746808 m!697047))

(assert (=> b!746800 m!697021))

(assert (=> b!746800 m!697021))

(declare-fun m!697049 () Bool)

(assert (=> b!746800 m!697049))

(declare-fun m!697051 () Bool)

(assert (=> b!746811 m!697051))

(declare-fun m!697053 () Bool)

(assert (=> start!65494 m!697053))

(declare-fun m!697055 () Bool)

(assert (=> start!65494 m!697055))

(declare-fun m!697057 () Bool)

(assert (=> b!746814 m!697057))

(assert (=> b!746799 m!697021))

(assert (=> b!746799 m!697021))

(declare-fun m!697059 () Bool)

(assert (=> b!746799 m!697059))

(assert (=> b!746799 m!697059))

(assert (=> b!746799 m!697021))

(declare-fun m!697061 () Bool)

(assert (=> b!746799 m!697061))

(push 1)

