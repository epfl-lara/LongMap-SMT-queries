; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65722 () Bool)

(assert start!65722)

(declare-fun b!754322 () Bool)

(declare-fun res!509709 () Bool)

(declare-fun e!420691 () Bool)

(assert (=> b!754322 (=> (not res!509709) (not e!420691))))

(declare-fun e!420697 () Bool)

(assert (=> b!754322 (= res!509709 e!420697)))

(declare-fun c!82696 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754322 (= c!82696 (bvsle x!1131 resIntermediateX!5))))

(declare-datatypes ((array!41895 0))(
  ( (array!41896 (arr!20061 (Array (_ BitVec 32) (_ BitVec 64))) (size!20482 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41895)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!754323 () Bool)

(declare-datatypes ((SeekEntryResult!7661 0))(
  ( (MissingZero!7661 (index!33012 (_ BitVec 32))) (Found!7661 (index!33013 (_ BitVec 32))) (Intermediate!7661 (undefined!8473 Bool) (index!33014 (_ BitVec 32)) (x!63923 (_ BitVec 32))) (Undefined!7661) (MissingVacant!7661 (index!33015 (_ BitVec 32))) )
))
(declare-fun lt!335689 () SeekEntryResult!7661)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41895 (_ BitVec 32)) SeekEntryResult!7661)

(assert (=> b!754323 (= e!420697 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20061 a!3186) j!159) a!3186 mask!3328) lt!335689))))

(declare-fun b!754324 () Bool)

(declare-fun e!420700 () Bool)

(declare-fun e!420692 () Bool)

(assert (=> b!754324 (= e!420700 e!420692)))

(declare-fun res!509694 () Bool)

(assert (=> b!754324 (=> (not res!509694) (not e!420692))))

(declare-fun lt!335685 () SeekEntryResult!7661)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754324 (= res!509694 (or (= lt!335685 (MissingZero!7661 i!1173)) (= lt!335685 (MissingVacant!7661 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41895 (_ BitVec 32)) SeekEntryResult!7661)

(assert (=> b!754324 (= lt!335685 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!509698 () Bool)

(assert (=> start!65722 (=> (not res!509698) (not e!420700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65722 (= res!509698 (validMask!0 mask!3328))))

(assert (=> start!65722 e!420700))

(assert (=> start!65722 true))

(declare-fun array_inv!15857 (array!41895) Bool)

(assert (=> start!65722 (array_inv!15857 a!3186)))

(declare-fun b!754325 () Bool)

(declare-fun res!509707 () Bool)

(assert (=> b!754325 (=> (not res!509707) (not e!420692))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!754325 (= res!509707 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20482 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20482 a!3186))))))

(declare-fun b!754326 () Bool)

(declare-fun e!420694 () Bool)

(declare-fun lt!335693 () SeekEntryResult!7661)

(declare-fun lt!335690 () SeekEntryResult!7661)

(assert (=> b!754326 (= e!420694 (= lt!335693 lt!335690))))

(declare-fun b!754327 () Bool)

(declare-fun res!509693 () Bool)

(assert (=> b!754327 (=> (not res!509693) (not e!420700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754327 (= res!509693 (validKeyInArray!0 (select (arr!20061 a!3186) j!159)))))

(declare-fun b!754328 () Bool)

(declare-fun res!509703 () Bool)

(assert (=> b!754328 (=> (not res!509703) (not e!420691))))

(assert (=> b!754328 (= res!509703 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20061 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754329 () Bool)

(declare-fun e!420695 () Bool)

(declare-fun e!420693 () Bool)

(assert (=> b!754329 (= e!420695 e!420693)))

(declare-fun res!509697 () Bool)

(assert (=> b!754329 (=> res!509697 e!420693)))

(declare-fun lt!335687 () SeekEntryResult!7661)

(assert (=> b!754329 (= res!509697 (not (= lt!335690 lt!335687)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41895 (_ BitVec 32)) SeekEntryResult!7661)

(assert (=> b!754329 (= lt!335690 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20061 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754330 () Bool)

(declare-fun res!509706 () Bool)

(assert (=> b!754330 (=> (not res!509706) (not e!420692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41895 (_ BitVec 32)) Bool)

(assert (=> b!754330 (= res!509706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754331 () Bool)

(assert (=> b!754331 (= e!420692 e!420691)))

(declare-fun res!509704 () Bool)

(assert (=> b!754331 (=> (not res!509704) (not e!420691))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754331 (= res!509704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20061 a!3186) j!159) mask!3328) (select (arr!20061 a!3186) j!159) a!3186 mask!3328) lt!335689))))

(assert (=> b!754331 (= lt!335689 (Intermediate!7661 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754332 () Bool)

(declare-fun res!509695 () Bool)

(assert (=> b!754332 (=> (not res!509695) (not e!420700))))

(assert (=> b!754332 (= res!509695 (and (= (size!20482 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20482 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20482 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754333 () Bool)

(declare-fun e!420701 () Bool)

(assert (=> b!754333 (= e!420701 true)))

(assert (=> b!754333 e!420694))

(declare-fun res!509705 () Bool)

(assert (=> b!754333 (=> (not res!509705) (not e!420694))))

(declare-fun lt!335683 () (_ BitVec 64))

(assert (=> b!754333 (= res!509705 (= lt!335683 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26024 0))(
  ( (Unit!26025) )
))
(declare-fun lt!335684 () Unit!26024)

(declare-fun e!420690 () Unit!26024)

(assert (=> b!754333 (= lt!335684 e!420690)))

(declare-fun c!82695 () Bool)

(assert (=> b!754333 (= c!82695 (= lt!335683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754334 () Bool)

(assert (=> b!754334 (= e!420697 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20061 a!3186) j!159) a!3186 mask!3328) (Found!7661 j!159)))))

(declare-fun b!754335 () Bool)

(declare-fun e!420696 () Bool)

(assert (=> b!754335 (= e!420691 e!420696)))

(declare-fun res!509708 () Bool)

(assert (=> b!754335 (=> (not res!509708) (not e!420696))))

(declare-fun lt!335686 () SeekEntryResult!7661)

(declare-fun lt!335691 () SeekEntryResult!7661)

(assert (=> b!754335 (= res!509708 (= lt!335686 lt!335691))))

(declare-fun lt!335692 () array!41895)

(declare-fun lt!335688 () (_ BitVec 64))

(assert (=> b!754335 (= lt!335691 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335688 lt!335692 mask!3328))))

(assert (=> b!754335 (= lt!335686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335688 mask!3328) lt!335688 lt!335692 mask!3328))))

(assert (=> b!754335 (= lt!335688 (select (store (arr!20061 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754335 (= lt!335692 (array!41896 (store (arr!20061 a!3186) i!1173 k!2102) (size!20482 a!3186)))))

(declare-fun b!754336 () Bool)

(declare-fun Unit!26026 () Unit!26024)

(assert (=> b!754336 (= e!420690 Unit!26026)))

(declare-fun b!754337 () Bool)

(declare-fun res!509701 () Bool)

(assert (=> b!754337 (=> (not res!509701) (not e!420700))))

(declare-fun arrayContainsKey!0 (array!41895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754337 (= res!509701 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754338 () Bool)

(declare-fun res!509699 () Bool)

(assert (=> b!754338 (=> (not res!509699) (not e!420694))))

(assert (=> b!754338 (= res!509699 (= (seekEntryOrOpen!0 lt!335688 lt!335692 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335688 lt!335692 mask!3328)))))

(declare-fun b!754339 () Bool)

(assert (=> b!754339 (= e!420696 (not e!420695))))

(declare-fun res!509696 () Bool)

(assert (=> b!754339 (=> res!509696 e!420695)))

(assert (=> b!754339 (= res!509696 (or (not (is-Intermediate!7661 lt!335691)) (bvslt x!1131 (x!63923 lt!335691)) (not (= x!1131 (x!63923 lt!335691))) (not (= index!1321 (index!33014 lt!335691)))))))

(declare-fun e!420698 () Bool)

(assert (=> b!754339 e!420698))

(declare-fun res!509702 () Bool)

(assert (=> b!754339 (=> (not res!509702) (not e!420698))))

(assert (=> b!754339 (= res!509702 (= lt!335693 lt!335687))))

(assert (=> b!754339 (= lt!335687 (Found!7661 j!159))))

(assert (=> b!754339 (= lt!335693 (seekEntryOrOpen!0 (select (arr!20061 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754339 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335682 () Unit!26024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26024)

(assert (=> b!754339 (= lt!335682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754340 () Bool)

(assert (=> b!754340 (= e!420693 e!420701)))

(declare-fun res!509710 () Bool)

(assert (=> b!754340 (=> res!509710 e!420701)))

(assert (=> b!754340 (= res!509710 (= lt!335683 lt!335688))))

(assert (=> b!754340 (= lt!335683 (select (store (arr!20061 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754341 () Bool)

(declare-fun res!509700 () Bool)

(assert (=> b!754341 (=> (not res!509700) (not e!420700))))

(assert (=> b!754341 (= res!509700 (validKeyInArray!0 k!2102))))

(declare-fun b!754342 () Bool)

(declare-fun res!509711 () Bool)

(assert (=> b!754342 (=> (not res!509711) (not e!420692))))

(declare-datatypes ((List!14063 0))(
  ( (Nil!14060) (Cons!14059 (h!15131 (_ BitVec 64)) (t!20378 List!14063)) )
))
(declare-fun arrayNoDuplicates!0 (array!41895 (_ BitVec 32) List!14063) Bool)

(assert (=> b!754342 (= res!509711 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14060))))

(declare-fun b!754343 () Bool)

(assert (=> b!754343 (= e!420698 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20061 a!3186) j!159) a!3186 mask!3328) lt!335687))))

(declare-fun b!754344 () Bool)

(declare-fun Unit!26027 () Unit!26024)

(assert (=> b!754344 (= e!420690 Unit!26027)))

(assert (=> b!754344 false))

(assert (= (and start!65722 res!509698) b!754332))

(assert (= (and b!754332 res!509695) b!754327))

(assert (= (and b!754327 res!509693) b!754341))

(assert (= (and b!754341 res!509700) b!754337))

(assert (= (and b!754337 res!509701) b!754324))

(assert (= (and b!754324 res!509694) b!754330))

(assert (= (and b!754330 res!509706) b!754342))

(assert (= (and b!754342 res!509711) b!754325))

(assert (= (and b!754325 res!509707) b!754331))

(assert (= (and b!754331 res!509704) b!754328))

(assert (= (and b!754328 res!509703) b!754322))

(assert (= (and b!754322 c!82696) b!754323))

(assert (= (and b!754322 (not c!82696)) b!754334))

(assert (= (and b!754322 res!509709) b!754335))

(assert (= (and b!754335 res!509708) b!754339))

(assert (= (and b!754339 res!509702) b!754343))

(assert (= (and b!754339 (not res!509696)) b!754329))

(assert (= (and b!754329 (not res!509697)) b!754340))

(assert (= (and b!754340 (not res!509710)) b!754333))

(assert (= (and b!754333 c!82695) b!754344))

(assert (= (and b!754333 (not c!82695)) b!754336))

(assert (= (and b!754333 res!509705) b!754338))

(assert (= (and b!754338 res!509699) b!754326))

(declare-fun m!702799 () Bool)

(assert (=> b!754338 m!702799))

(declare-fun m!702801 () Bool)

(assert (=> b!754338 m!702801))

(declare-fun m!702803 () Bool)

(assert (=> b!754334 m!702803))

(assert (=> b!754334 m!702803))

(declare-fun m!702805 () Bool)

(assert (=> b!754334 m!702805))

(declare-fun m!702807 () Bool)

(assert (=> b!754330 m!702807))

(assert (=> b!754331 m!702803))

(assert (=> b!754331 m!702803))

(declare-fun m!702809 () Bool)

(assert (=> b!754331 m!702809))

(assert (=> b!754331 m!702809))

(assert (=> b!754331 m!702803))

(declare-fun m!702811 () Bool)

(assert (=> b!754331 m!702811))

(assert (=> b!754343 m!702803))

(assert (=> b!754343 m!702803))

(declare-fun m!702813 () Bool)

(assert (=> b!754343 m!702813))

(declare-fun m!702815 () Bool)

(assert (=> b!754324 m!702815))

(declare-fun m!702817 () Bool)

(assert (=> b!754342 m!702817))

(declare-fun m!702819 () Bool)

(assert (=> start!65722 m!702819))

(declare-fun m!702821 () Bool)

(assert (=> start!65722 m!702821))

(assert (=> b!754323 m!702803))

(assert (=> b!754323 m!702803))

(declare-fun m!702823 () Bool)

(assert (=> b!754323 m!702823))

(declare-fun m!702825 () Bool)

(assert (=> b!754341 m!702825))

(declare-fun m!702827 () Bool)

(assert (=> b!754328 m!702827))

(declare-fun m!702829 () Bool)

(assert (=> b!754337 m!702829))

(declare-fun m!702831 () Bool)

(assert (=> b!754335 m!702831))

(declare-fun m!702833 () Bool)

(assert (=> b!754335 m!702833))

(assert (=> b!754335 m!702831))

(declare-fun m!702835 () Bool)

(assert (=> b!754335 m!702835))

(declare-fun m!702837 () Bool)

(assert (=> b!754335 m!702837))

(declare-fun m!702839 () Bool)

(assert (=> b!754335 m!702839))

(assert (=> b!754340 m!702837))

(declare-fun m!702841 () Bool)

(assert (=> b!754340 m!702841))

(assert (=> b!754339 m!702803))

(assert (=> b!754339 m!702803))

(declare-fun m!702843 () Bool)

(assert (=> b!754339 m!702843))

(declare-fun m!702845 () Bool)

(assert (=> b!754339 m!702845))

(declare-fun m!702847 () Bool)

(assert (=> b!754339 m!702847))

(assert (=> b!754327 m!702803))

(assert (=> b!754327 m!702803))

(declare-fun m!702849 () Bool)

(assert (=> b!754327 m!702849))

(assert (=> b!754329 m!702803))

(assert (=> b!754329 m!702803))

(assert (=> b!754329 m!702805))

(push 1)

