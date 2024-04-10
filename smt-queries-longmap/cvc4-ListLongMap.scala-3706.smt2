; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50856 () Bool)

(assert start!50856)

(declare-fun b!556619 () Bool)

(declare-fun e!320656 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5299 0))(
  ( (MissingZero!5299 (index!23423 (_ BitVec 32))) (Found!5299 (index!23424 (_ BitVec 32))) (Intermediate!5299 (undefined!6111 Bool) (index!23425 (_ BitVec 32)) (x!52309 (_ BitVec 32))) (Undefined!5299) (MissingVacant!5299 (index!23426 (_ BitVec 32))) )
))
(declare-fun lt!252949 () SeekEntryResult!5299)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35081 0))(
  ( (array!35082 (arr!16850 (Array (_ BitVec 32) (_ BitVec 64))) (size!17214 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35081)

(assert (=> b!556619 (= e!320656 (not (or (not (is-Intermediate!5299 lt!252949)) (undefined!6111 lt!252949) (= (select (arr!16850 a!3118) (index!23425 lt!252949)) (select (arr!16850 a!3118) j!142)) (= (select (arr!16850 a!3118) (index!23425 lt!252949)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23425 lt!252949) #b00000000000000000000000000000000) (bvslt (index!23425 lt!252949) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!320657 () Bool)

(assert (=> b!556619 e!320657))

(declare-fun res!349036 () Bool)

(assert (=> b!556619 (=> (not res!349036) (not e!320657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35081 (_ BitVec 32)) Bool)

(assert (=> b!556619 (= res!349036 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17372 0))(
  ( (Unit!17373) )
))
(declare-fun lt!252948 () Unit!17372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17372)

(assert (=> b!556619 (= lt!252948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556620 () Bool)

(declare-fun res!349038 () Bool)

(declare-fun e!320654 () Bool)

(assert (=> b!556620 (=> (not res!349038) (not e!320654))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556620 (= res!349038 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556621 () Bool)

(declare-fun e!320658 () Bool)

(assert (=> b!556621 (= e!320658 e!320656)))

(declare-fun res!349035 () Bool)

(assert (=> b!556621 (=> (not res!349035) (not e!320656))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!252951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35081 (_ BitVec 32)) SeekEntryResult!5299)

(assert (=> b!556621 (= res!349035 (= lt!252949 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252951 (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118)) mask!3119)))))

(declare-fun lt!252952 () (_ BitVec 32))

(assert (=> b!556621 (= lt!252949 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252952 (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556621 (= lt!252951 (toIndex!0 (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!556621 (= lt!252952 (toIndex!0 (select (arr!16850 a!3118) j!142) mask!3119))))

(declare-fun res!349032 () Bool)

(assert (=> start!50856 (=> (not res!349032) (not e!320654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50856 (= res!349032 (validMask!0 mask!3119))))

(assert (=> start!50856 e!320654))

(assert (=> start!50856 true))

(declare-fun array_inv!12646 (array!35081) Bool)

(assert (=> start!50856 (array_inv!12646 a!3118)))

(declare-fun b!556622 () Bool)

(assert (=> b!556622 (= e!320654 e!320658)))

(declare-fun res!349039 () Bool)

(assert (=> b!556622 (=> (not res!349039) (not e!320658))))

(declare-fun lt!252950 () SeekEntryResult!5299)

(assert (=> b!556622 (= res!349039 (or (= lt!252950 (MissingZero!5299 i!1132)) (= lt!252950 (MissingVacant!5299 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35081 (_ BitVec 32)) SeekEntryResult!5299)

(assert (=> b!556622 (= lt!252950 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556623 () Bool)

(declare-fun res!349034 () Bool)

(assert (=> b!556623 (=> (not res!349034) (not e!320654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556623 (= res!349034 (validKeyInArray!0 k!1914))))

(declare-fun b!556624 () Bool)

(assert (=> b!556624 (= e!320657 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) (Found!5299 j!142)))))

(declare-fun b!556625 () Bool)

(declare-fun res!349033 () Bool)

(assert (=> b!556625 (=> (not res!349033) (not e!320658))))

(assert (=> b!556625 (= res!349033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556626 () Bool)

(declare-fun res!349031 () Bool)

(assert (=> b!556626 (=> (not res!349031) (not e!320654))))

(assert (=> b!556626 (= res!349031 (and (= (size!17214 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17214 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17214 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556627 () Bool)

(declare-fun res!349040 () Bool)

(assert (=> b!556627 (=> (not res!349040) (not e!320654))))

(assert (=> b!556627 (= res!349040 (validKeyInArray!0 (select (arr!16850 a!3118) j!142)))))

(declare-fun b!556628 () Bool)

(declare-fun res!349037 () Bool)

(assert (=> b!556628 (=> (not res!349037) (not e!320658))))

(declare-datatypes ((List!10930 0))(
  ( (Nil!10927) (Cons!10926 (h!11911 (_ BitVec 64)) (t!17158 List!10930)) )
))
(declare-fun arrayNoDuplicates!0 (array!35081 (_ BitVec 32) List!10930) Bool)

(assert (=> b!556628 (= res!349037 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10927))))

(assert (= (and start!50856 res!349032) b!556626))

(assert (= (and b!556626 res!349031) b!556627))

(assert (= (and b!556627 res!349040) b!556623))

(assert (= (and b!556623 res!349034) b!556620))

(assert (= (and b!556620 res!349038) b!556622))

(assert (= (and b!556622 res!349039) b!556625))

(assert (= (and b!556625 res!349033) b!556628))

(assert (= (and b!556628 res!349037) b!556621))

(assert (= (and b!556621 res!349035) b!556619))

(assert (= (and b!556619 res!349036) b!556624))

(declare-fun m!534655 () Bool)

(assert (=> start!50856 m!534655))

(declare-fun m!534657 () Bool)

(assert (=> start!50856 m!534657))

(declare-fun m!534659 () Bool)

(assert (=> b!556620 m!534659))

(declare-fun m!534661 () Bool)

(assert (=> b!556624 m!534661))

(assert (=> b!556624 m!534661))

(declare-fun m!534663 () Bool)

(assert (=> b!556624 m!534663))

(assert (=> b!556621 m!534661))

(declare-fun m!534665 () Bool)

(assert (=> b!556621 m!534665))

(assert (=> b!556621 m!534661))

(declare-fun m!534667 () Bool)

(assert (=> b!556621 m!534667))

(declare-fun m!534669 () Bool)

(assert (=> b!556621 m!534669))

(assert (=> b!556621 m!534667))

(declare-fun m!534671 () Bool)

(assert (=> b!556621 m!534671))

(assert (=> b!556621 m!534661))

(declare-fun m!534673 () Bool)

(assert (=> b!556621 m!534673))

(assert (=> b!556621 m!534667))

(declare-fun m!534675 () Bool)

(assert (=> b!556621 m!534675))

(declare-fun m!534677 () Bool)

(assert (=> b!556623 m!534677))

(declare-fun m!534679 () Bool)

(assert (=> b!556619 m!534679))

(assert (=> b!556619 m!534661))

(declare-fun m!534681 () Bool)

(assert (=> b!556619 m!534681))

(declare-fun m!534683 () Bool)

(assert (=> b!556619 m!534683))

(assert (=> b!556627 m!534661))

(assert (=> b!556627 m!534661))

(declare-fun m!534685 () Bool)

(assert (=> b!556627 m!534685))

(declare-fun m!534687 () Bool)

(assert (=> b!556625 m!534687))

(declare-fun m!534689 () Bool)

(assert (=> b!556622 m!534689))

(declare-fun m!534691 () Bool)

(assert (=> b!556628 m!534691))

(push 1)

(assert (not b!556627))

(assert (not b!556622))

(assert (not b!556628))

(assert (not start!50856))

(assert (not b!556624))

(assert (not b!556625))

(assert (not b!556620))

(assert (not b!556621))

(assert (not b!556623))

(assert (not b!556619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83297 () Bool)

(declare-fun res!349053 () Bool)

(declare-fun e!320679 () Bool)

(assert (=> d!83297 (=> res!349053 e!320679)))

(assert (=> d!83297 (= res!349053 (= (select (arr!16850 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83297 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!320679)))

(declare-fun b!556657 () Bool)

(declare-fun e!320680 () Bool)

(assert (=> b!556657 (= e!320679 e!320680)))

(declare-fun res!349054 () Bool)

(assert (=> b!556657 (=> (not res!349054) (not e!320680))))

(assert (=> b!556657 (= res!349054 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17214 a!3118)))))

(declare-fun b!556658 () Bool)

(assert (=> b!556658 (= e!320680 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83297 (not res!349053)) b!556657))

(assert (= (and b!556657 res!349054) b!556658))

(declare-fun m!534713 () Bool)

(assert (=> d!83297 m!534713))

(declare-fun m!534715 () Bool)

(assert (=> b!556658 m!534715))

(assert (=> b!556620 d!83297))

(declare-fun lt!253000 () SeekEntryResult!5299)

(declare-fun b!556759 () Bool)

(assert (=> b!556759 (and (bvsge (index!23425 lt!253000) #b00000000000000000000000000000000) (bvslt (index!23425 lt!253000) (size!17214 (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118)))))))

(declare-fun res!349094 () Bool)

(assert (=> b!556759 (= res!349094 (= (select (arr!16850 (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118))) (index!23425 lt!253000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320745 () Bool)

(assert (=> b!556759 (=> res!349094 e!320745)))

(declare-fun b!556760 () Bool)

(declare-fun e!320746 () Bool)

(assert (=> b!556760 (= e!320746 (bvsge (x!52309 lt!253000) #b01111111111111111111111111111110))))

(declare-fun b!556761 () Bool)

(assert (=> b!556761 (and (bvsge (index!23425 lt!253000) #b00000000000000000000000000000000) (bvslt (index!23425 lt!253000) (size!17214 (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118)))))))

(assert (=> b!556761 (= e!320745 (= (select (arr!16850 (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118))) (index!23425 lt!253000)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83299 () Bool)

(assert (=> d!83299 e!320746))

(declare-fun c!64171 () Bool)

(assert (=> d!83299 (= c!64171 (and (is-Intermediate!5299 lt!253000) (undefined!6111 lt!253000)))))

(declare-fun e!320743 () SeekEntryResult!5299)

(assert (=> d!83299 (= lt!253000 e!320743)))

(declare-fun c!64173 () Bool)

(assert (=> d!83299 (= c!64173 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253001 () (_ BitVec 64))

(assert (=> d!83299 (= lt!253001 (select (arr!16850 (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118))) lt!252951))))

(assert (=> d!83299 (validMask!0 mask!3119)))

(assert (=> d!83299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252951 (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118)) mask!3119) lt!253000)))

(declare-fun b!556762 () Bool)

(assert (=> b!556762 (and (bvsge (index!23425 lt!253000) #b00000000000000000000000000000000) (bvslt (index!23425 lt!253000) (size!17214 (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118)))))))

(declare-fun res!349092 () Bool)

(assert (=> b!556762 (= res!349092 (= (select (arr!16850 (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118))) (index!23425 lt!253000)) (select (store (arr!16850 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!556762 (=> res!349092 e!320745)))

(declare-fun e!320747 () Bool)

(assert (=> b!556762 (= e!320747 e!320745)))

(declare-fun b!556763 () Bool)

(declare-fun e!320744 () SeekEntryResult!5299)

(assert (=> b!556763 (= e!320743 e!320744)))

(declare-fun c!64172 () Bool)

(assert (=> b!556763 (= c!64172 (or (= lt!253001 (select (store (arr!16850 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!253001 lt!253001) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!556764 () Bool)

(assert (=> b!556764 (= e!320743 (Intermediate!5299 true lt!252951 #b00000000000000000000000000000000))))

(declare-fun b!556765 () Bool)

(assert (=> b!556765 (= e!320746 e!320747)))

(declare-fun res!349093 () Bool)

(assert (=> b!556765 (= res!349093 (and (is-Intermediate!5299 lt!253000) (not (undefined!6111 lt!253000)) (bvslt (x!52309 lt!253000) #b01111111111111111111111111111110) (bvsge (x!52309 lt!253000) #b00000000000000000000000000000000) (bvsge (x!52309 lt!253000) #b00000000000000000000000000000000)))))

(assert (=> b!556765 (=> (not res!349093) (not e!320747))))

(declare-fun b!556766 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556766 (= e!320744 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252951 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) (array!35082 (store (arr!16850 a!3118) i!1132 k!1914) (size!17214 a!3118)) mask!3119))))

(declare-fun b!556767 () Bool)

(assert (=> b!556767 (= e!320744 (Intermediate!5299 false lt!252951 #b00000000000000000000000000000000))))

(assert (= (and d!83299 c!64173) b!556764))

(assert (= (and d!83299 (not c!64173)) b!556763))

(assert (= (and b!556763 c!64172) b!556767))

(assert (= (and b!556763 (not c!64172)) b!556766))

(assert (= (and d!83299 c!64171) b!556760))

(assert (= (and d!83299 (not c!64171)) b!556765))

(assert (= (and b!556765 res!349093) b!556762))

(assert (= (and b!556762 (not res!349092)) b!556759))

(assert (= (and b!556759 (not res!349094)) b!556761))

(declare-fun m!534771 () Bool)

(assert (=> b!556759 m!534771))

(assert (=> b!556761 m!534771))

(declare-fun m!534773 () Bool)

(assert (=> d!83299 m!534773))

(assert (=> d!83299 m!534655))

(declare-fun m!534775 () Bool)

(assert (=> b!556766 m!534775))

(assert (=> b!556766 m!534775))

(assert (=> b!556766 m!534667))

(declare-fun m!534777 () Bool)

(assert (=> b!556766 m!534777))

(assert (=> b!556762 m!534771))

(assert (=> b!556621 d!83299))

(declare-fun b!556768 () Bool)

(declare-fun lt!253002 () SeekEntryResult!5299)

(assert (=> b!556768 (and (bvsge (index!23425 lt!253002) #b00000000000000000000000000000000) (bvslt (index!23425 lt!253002) (size!17214 a!3118)))))

(declare-fun res!349097 () Bool)

(assert (=> b!556768 (= res!349097 (= (select (arr!16850 a!3118) (index!23425 lt!253002)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320750 () Bool)

(assert (=> b!556768 (=> res!349097 e!320750)))

(declare-fun b!556769 () Bool)

(declare-fun e!320751 () Bool)

(assert (=> b!556769 (= e!320751 (bvsge (x!52309 lt!253002) #b01111111111111111111111111111110))))

(declare-fun b!556770 () Bool)

(assert (=> b!556770 (and (bvsge (index!23425 lt!253002) #b00000000000000000000000000000000) (bvslt (index!23425 lt!253002) (size!17214 a!3118)))))

(assert (=> b!556770 (= e!320750 (= (select (arr!16850 a!3118) (index!23425 lt!253002)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83317 () Bool)

(assert (=> d!83317 e!320751))

(declare-fun c!64174 () Bool)

(assert (=> d!83317 (= c!64174 (and (is-Intermediate!5299 lt!253002) (undefined!6111 lt!253002)))))

(declare-fun e!320748 () SeekEntryResult!5299)

(assert (=> d!83317 (= lt!253002 e!320748)))

(declare-fun c!64176 () Bool)

(assert (=> d!83317 (= c!64176 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253003 () (_ BitVec 64))

(assert (=> d!83317 (= lt!253003 (select (arr!16850 a!3118) lt!252952))))

(assert (=> d!83317 (validMask!0 mask!3119)))

(assert (=> d!83317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252952 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) lt!253002)))

(declare-fun b!556771 () Bool)

(assert (=> b!556771 (and (bvsge (index!23425 lt!253002) #b00000000000000000000000000000000) (bvslt (index!23425 lt!253002) (size!17214 a!3118)))))

(declare-fun res!349095 () Bool)

(assert (=> b!556771 (= res!349095 (= (select (arr!16850 a!3118) (index!23425 lt!253002)) (select (arr!16850 a!3118) j!142)))))

(assert (=> b!556771 (=> res!349095 e!320750)))

(declare-fun e!320752 () Bool)

(assert (=> b!556771 (= e!320752 e!320750)))

(declare-fun b!556772 () Bool)

(declare-fun e!320749 () SeekEntryResult!5299)

(assert (=> b!556772 (= e!320748 e!320749)))

(declare-fun c!64175 () Bool)

(assert (=> b!556772 (= c!64175 (or (= lt!253003 (select (arr!16850 a!3118) j!142)) (= (bvadd lt!253003 lt!253003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!556773 () Bool)

(assert (=> b!556773 (= e!320748 (Intermediate!5299 true lt!252952 #b00000000000000000000000000000000))))

(declare-fun b!556774 () Bool)

(assert (=> b!556774 (= e!320751 e!320752)))

(declare-fun res!349096 () Bool)

(assert (=> b!556774 (= res!349096 (and (is-Intermediate!5299 lt!253002) (not (undefined!6111 lt!253002)) (bvslt (x!52309 lt!253002) #b01111111111111111111111111111110) (bvsge (x!52309 lt!253002) #b00000000000000000000000000000000) (bvsge (x!52309 lt!253002) #b00000000000000000000000000000000)))))

(assert (=> b!556774 (=> (not res!349096) (not e!320752))))

(declare-fun b!556775 () Bool)

(assert (=> b!556775 (= e!320749 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252952 #b00000000000000000000000000000000 mask!3119) (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556776 () Bool)

(assert (=> b!556776 (= e!320749 (Intermediate!5299 false lt!252952 #b00000000000000000000000000000000))))

(assert (= (and d!83317 c!64176) b!556773))

(assert (= (and d!83317 (not c!64176)) b!556772))

(assert (= (and b!556772 c!64175) b!556776))

(assert (= (and b!556772 (not c!64175)) b!556775))

(assert (= (and d!83317 c!64174) b!556769))

(assert (= (and d!83317 (not c!64174)) b!556774))

(assert (= (and b!556774 res!349096) b!556771))

(assert (= (and b!556771 (not res!349095)) b!556768))

(assert (= (and b!556768 (not res!349097)) b!556770))

(declare-fun m!534779 () Bool)

(assert (=> b!556768 m!534779))

(assert (=> b!556770 m!534779))

(declare-fun m!534781 () Bool)

(assert (=> d!83317 m!534781))

(assert (=> d!83317 m!534655))

(declare-fun m!534783 () Bool)

(assert (=> b!556775 m!534783))

(assert (=> b!556775 m!534783))

(assert (=> b!556775 m!534661))

(declare-fun m!534785 () Bool)

(assert (=> b!556775 m!534785))

(assert (=> b!556771 m!534779))

(assert (=> b!556621 d!83317))

(declare-fun d!83319 () Bool)

(declare-fun lt!253021 () (_ BitVec 32))

(declare-fun lt!253020 () (_ BitVec 32))

(assert (=> d!83319 (= lt!253021 (bvmul (bvxor lt!253020 (bvlshr lt!253020 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83319 (= lt!253020 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83319 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349102 (let ((h!11913 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52313 (bvmul (bvxor h!11913 (bvlshr h!11913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52313 (bvlshr x!52313 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349102 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349102 #b00000000000000000000000000000000))))))

(assert (=> d!83319 (= (toIndex!0 (select (store (arr!16850 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!253021 (bvlshr lt!253021 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556621 d!83319))

(declare-fun d!83325 () Bool)

(declare-fun lt!253023 () (_ BitVec 32))

(declare-fun lt!253022 () (_ BitVec 32))

(assert (=> d!83325 (= lt!253023 (bvmul (bvxor lt!253022 (bvlshr lt!253022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83325 (= lt!253022 ((_ extract 31 0) (bvand (bvxor (select (arr!16850 a!3118) j!142) (bvlshr (select (arr!16850 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83325 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349102 (let ((h!11913 ((_ extract 31 0) (bvand (bvxor (select (arr!16850 a!3118) j!142) (bvlshr (select (arr!16850 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52313 (bvmul (bvxor h!11913 (bvlshr h!11913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52313 (bvlshr x!52313 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349102 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349102 #b00000000000000000000000000000000))))))

(assert (=> d!83325 (= (toIndex!0 (select (arr!16850 a!3118) j!142) mask!3119) (bvand (bvxor lt!253023 (bvlshr lt!253023 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556621 d!83325))

(declare-fun d!83327 () Bool)

(assert (=> d!83327 (= (validKeyInArray!0 (select (arr!16850 a!3118) j!142)) (and (not (= (select (arr!16850 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16850 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556627 d!83327))

(declare-fun b!556841 () Bool)

(declare-fun e!320796 () SeekEntryResult!5299)

(declare-fun lt!253045 () SeekEntryResult!5299)

(assert (=> b!556841 (= e!320796 (MissingZero!5299 (index!23425 lt!253045)))))

(declare-fun b!556842 () Bool)

(declare-fun e!320797 () SeekEntryResult!5299)

(assert (=> b!556842 (= e!320797 (Found!5299 (index!23425 lt!253045)))))

(declare-fun d!83329 () Bool)

(declare-fun lt!253046 () SeekEntryResult!5299)

(assert (=> d!83329 (and (or (is-Undefined!5299 lt!253046) (not (is-Found!5299 lt!253046)) (and (bvsge (index!23424 lt!253046) #b00000000000000000000000000000000) (bvslt (index!23424 lt!253046) (size!17214 a!3118)))) (or (is-Undefined!5299 lt!253046) (is-Found!5299 lt!253046) (not (is-MissingZero!5299 lt!253046)) (and (bvsge (index!23423 lt!253046) #b00000000000000000000000000000000) (bvslt (index!23423 lt!253046) (size!17214 a!3118)))) (or (is-Undefined!5299 lt!253046) (is-Found!5299 lt!253046) (is-MissingZero!5299 lt!253046) (not (is-MissingVacant!5299 lt!253046)) (and (bvsge (index!23426 lt!253046) #b00000000000000000000000000000000) (bvslt (index!23426 lt!253046) (size!17214 a!3118)))) (or (is-Undefined!5299 lt!253046) (ite (is-Found!5299 lt!253046) (= (select (arr!16850 a!3118) (index!23424 lt!253046)) k!1914) (ite (is-MissingZero!5299 lt!253046) (= (select (arr!16850 a!3118) (index!23423 lt!253046)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5299 lt!253046) (= (select (arr!16850 a!3118) (index!23426 lt!253046)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!320795 () SeekEntryResult!5299)

(assert (=> d!83329 (= lt!253046 e!320795)))

(declare-fun c!64199 () Bool)

(assert (=> d!83329 (= c!64199 (and (is-Intermediate!5299 lt!253045) (undefined!6111 lt!253045)))))

(assert (=> d!83329 (= lt!253045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83329 (validMask!0 mask!3119)))

(assert (=> d!83329 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!253046)))

(declare-fun b!556843 () Bool)

(assert (=> b!556843 (= e!320795 Undefined!5299)))

(declare-fun b!556844 () Bool)

(assert (=> b!556844 (= e!320795 e!320797)))

(declare-fun lt!253047 () (_ BitVec 64))

(assert (=> b!556844 (= lt!253047 (select (arr!16850 a!3118) (index!23425 lt!253045)))))

(declare-fun c!64200 () Bool)

(assert (=> b!556844 (= c!64200 (= lt!253047 k!1914))))

(declare-fun b!556845 () Bool)

(declare-fun c!64201 () Bool)

(assert (=> b!556845 (= c!64201 (= lt!253047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556845 (= e!320797 e!320796)))

(declare-fun b!556846 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35081 (_ BitVec 32)) SeekEntryResult!5299)

(assert (=> b!556846 (= e!320796 (seekKeyOrZeroReturnVacant!0 (x!52309 lt!253045) (index!23425 lt!253045) (index!23425 lt!253045) k!1914 a!3118 mask!3119))))

(assert (= (and d!83329 c!64199) b!556843))

(assert (= (and d!83329 (not c!64199)) b!556844))

(assert (= (and b!556844 c!64200) b!556842))

(assert (= (and b!556844 (not c!64200)) b!556845))

(assert (= (and b!556845 c!64201) b!556841))

(assert (= (and b!556845 (not c!64201)) b!556846))

(declare-fun m!534833 () Bool)

(assert (=> d!83329 m!534833))

(declare-fun m!534835 () Bool)

(assert (=> d!83329 m!534835))

(declare-fun m!534837 () Bool)

(assert (=> d!83329 m!534837))

(declare-fun m!534839 () Bool)

(assert (=> d!83329 m!534839))

(assert (=> d!83329 m!534655))

(assert (=> d!83329 m!534835))

(declare-fun m!534841 () Bool)

(assert (=> d!83329 m!534841))

(declare-fun m!534843 () Bool)

(assert (=> b!556844 m!534843))

(declare-fun m!534845 () Bool)

(assert (=> b!556846 m!534845))

(assert (=> b!556622 d!83329))

(declare-fun d!83347 () Bool)

(assert (=> d!83347 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556623 d!83347))

(declare-fun d!83349 () Bool)

(declare-fun res!349136 () Bool)

(declare-fun e!320824 () Bool)

(assert (=> d!83349 (=> res!349136 e!320824)))

(assert (=> d!83349 (= res!349136 (bvsge #b00000000000000000000000000000000 (size!17214 a!3118)))))

(assert (=> d!83349 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10927) e!320824)))

(declare-fun b!556884 () Bool)

(declare-fun e!320823 () Bool)

(declare-fun call!32347 () Bool)

(assert (=> b!556884 (= e!320823 call!32347)))

(declare-fun b!556885 () Bool)

(declare-fun e!320821 () Bool)

(declare-fun contains!2847 (List!10930 (_ BitVec 64)) Bool)

(assert (=> b!556885 (= e!320821 (contains!2847 Nil!10927 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556886 () Bool)

(declare-fun e!320822 () Bool)

(assert (=> b!556886 (= e!320824 e!320822)))

(declare-fun res!349135 () Bool)

(assert (=> b!556886 (=> (not res!349135) (not e!320822))))

(assert (=> b!556886 (= res!349135 (not e!320821))))

(declare-fun res!349134 () Bool)

(assert (=> b!556886 (=> (not res!349134) (not e!320821))))

(assert (=> b!556886 (= res!349134 (validKeyInArray!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556887 () Bool)

(assert (=> b!556887 (= e!320823 call!32347)))

(declare-fun bm!32344 () Bool)

(declare-fun c!64213 () Bool)

(assert (=> bm!32344 (= call!32347 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64213 (Cons!10926 (select (arr!16850 a!3118) #b00000000000000000000000000000000) Nil!10927) Nil!10927)))))

(declare-fun b!556888 () Bool)

(assert (=> b!556888 (= e!320822 e!320823)))

(assert (=> b!556888 (= c!64213 (validKeyInArray!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83349 (not res!349136)) b!556886))

(assert (= (and b!556886 res!349134) b!556885))

(assert (= (and b!556886 res!349135) b!556888))

(assert (= (and b!556888 c!64213) b!556884))

(assert (= (and b!556888 (not c!64213)) b!556887))

(assert (= (or b!556884 b!556887) bm!32344))

(assert (=> b!556885 m!534713))

(assert (=> b!556885 m!534713))

(declare-fun m!534847 () Bool)

(assert (=> b!556885 m!534847))

(assert (=> b!556886 m!534713))

(assert (=> b!556886 m!534713))

(declare-fun m!534851 () Bool)

(assert (=> b!556886 m!534851))

(assert (=> bm!32344 m!534713))

(declare-fun m!534857 () Bool)

(assert (=> bm!32344 m!534857))

(assert (=> b!556888 m!534713))

(assert (=> b!556888 m!534713))

(assert (=> b!556888 m!534851))

(assert (=> b!556628 d!83349))

(declare-fun d!83355 () Bool)

(assert (=> d!83355 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50856 d!83355))

(declare-fun d!83365 () Bool)

(assert (=> d!83365 (= (array_inv!12646 a!3118) (bvsge (size!17214 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50856 d!83365))

(declare-fun b!556906 () Bool)

(declare-fun e!320836 () Bool)

(declare-fun call!32350 () Bool)

(assert (=> b!556906 (= e!320836 call!32350)))

(declare-fun bm!32347 () Bool)

(assert (=> bm!32347 (= call!32350 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83367 () Bool)

(declare-fun res!349145 () Bool)

(declare-fun e!320838 () Bool)

(assert (=> d!83367 (=> res!349145 e!320838)))

(assert (=> d!83367 (= res!349145 (bvsge j!142 (size!17214 a!3118)))))

(assert (=> d!83367 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320838)))

(declare-fun b!556907 () Bool)

(declare-fun e!320837 () Bool)

(assert (=> b!556907 (= e!320838 e!320837)))

(declare-fun c!64219 () Bool)

(assert (=> b!556907 (= c!64219 (validKeyInArray!0 (select (arr!16850 a!3118) j!142)))))

(declare-fun b!556908 () Bool)

(assert (=> b!556908 (= e!320837 e!320836)))

(declare-fun lt!253070 () (_ BitVec 64))

(assert (=> b!556908 (= lt!253070 (select (arr!16850 a!3118) j!142))))

(declare-fun lt!253072 () Unit!17372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35081 (_ BitVec 64) (_ BitVec 32)) Unit!17372)

(assert (=> b!556908 (= lt!253072 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253070 j!142))))

(assert (=> b!556908 (arrayContainsKey!0 a!3118 lt!253070 #b00000000000000000000000000000000)))

(declare-fun lt!253071 () Unit!17372)

(assert (=> b!556908 (= lt!253071 lt!253072)))

(declare-fun res!349146 () Bool)

(assert (=> b!556908 (= res!349146 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) (Found!5299 j!142)))))

(assert (=> b!556908 (=> (not res!349146) (not e!320836))))

(declare-fun b!556909 () Bool)

(assert (=> b!556909 (= e!320837 call!32350)))

(assert (= (and d!83367 (not res!349145)) b!556907))

(assert (= (and b!556907 c!64219) b!556908))

(assert (= (and b!556907 (not c!64219)) b!556909))

(assert (= (and b!556908 res!349146) b!556906))

(assert (= (or b!556906 b!556909) bm!32347))

(declare-fun m!534869 () Bool)

(assert (=> bm!32347 m!534869))

(assert (=> b!556907 m!534661))

(assert (=> b!556907 m!534661))

(assert (=> b!556907 m!534685))

(assert (=> b!556908 m!534661))

(declare-fun m!534871 () Bool)

(assert (=> b!556908 m!534871))

(declare-fun m!534873 () Bool)

(assert (=> b!556908 m!534873))

(assert (=> b!556908 m!534661))

(assert (=> b!556908 m!534663))

(assert (=> b!556619 d!83367))

(declare-fun d!83371 () Bool)

(assert (=> d!83371 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253075 () Unit!17372)

(declare-fun choose!38 (array!35081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17372)

(assert (=> d!83371 (= lt!253075 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83371 (validMask!0 mask!3119)))

(assert (=> d!83371 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253075)))

(declare-fun bs!17343 () Bool)

(assert (= bs!17343 d!83371))

(assert (=> bs!17343 m!534681))

(declare-fun m!534875 () Bool)

(assert (=> bs!17343 m!534875))

(assert (=> bs!17343 m!534655))

(assert (=> b!556619 d!83371))

(declare-fun b!556910 () Bool)

(declare-fun e!320840 () SeekEntryResult!5299)

(declare-fun lt!253076 () SeekEntryResult!5299)

(assert (=> b!556910 (= e!320840 (MissingZero!5299 (index!23425 lt!253076)))))

(declare-fun b!556911 () Bool)

(declare-fun e!320841 () SeekEntryResult!5299)

(assert (=> b!556911 (= e!320841 (Found!5299 (index!23425 lt!253076)))))

(declare-fun d!83373 () Bool)

(declare-fun lt!253077 () SeekEntryResult!5299)

(assert (=> d!83373 (and (or (is-Undefined!5299 lt!253077) (not (is-Found!5299 lt!253077)) (and (bvsge (index!23424 lt!253077) #b00000000000000000000000000000000) (bvslt (index!23424 lt!253077) (size!17214 a!3118)))) (or (is-Undefined!5299 lt!253077) (is-Found!5299 lt!253077) (not (is-MissingZero!5299 lt!253077)) (and (bvsge (index!23423 lt!253077) #b00000000000000000000000000000000) (bvslt (index!23423 lt!253077) (size!17214 a!3118)))) (or (is-Undefined!5299 lt!253077) (is-Found!5299 lt!253077) (is-MissingZero!5299 lt!253077) (not (is-MissingVacant!5299 lt!253077)) (and (bvsge (index!23426 lt!253077) #b00000000000000000000000000000000) (bvslt (index!23426 lt!253077) (size!17214 a!3118)))) (or (is-Undefined!5299 lt!253077) (ite (is-Found!5299 lt!253077) (= (select (arr!16850 a!3118) (index!23424 lt!253077)) (select (arr!16850 a!3118) j!142)) (ite (is-MissingZero!5299 lt!253077) (= (select (arr!16850 a!3118) (index!23423 lt!253077)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5299 lt!253077) (= (select (arr!16850 a!3118) (index!23426 lt!253077)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!320839 () SeekEntryResult!5299)

(assert (=> d!83373 (= lt!253077 e!320839)))

(declare-fun c!64220 () Bool)

(assert (=> d!83373 (= c!64220 (and (is-Intermediate!5299 lt!253076) (undefined!6111 lt!253076)))))

(assert (=> d!83373 (= lt!253076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16850 a!3118) j!142) mask!3119) (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83373 (validMask!0 mask!3119)))

(assert (=> d!83373 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) j!142) a!3118 mask!3119) lt!253077)))

(declare-fun b!556912 () Bool)

(assert (=> b!556912 (= e!320839 Undefined!5299)))

(declare-fun b!556913 () Bool)

(assert (=> b!556913 (= e!320839 e!320841)))

(declare-fun lt!253078 () (_ BitVec 64))

(assert (=> b!556913 (= lt!253078 (select (arr!16850 a!3118) (index!23425 lt!253076)))))

(declare-fun c!64221 () Bool)

(assert (=> b!556913 (= c!64221 (= lt!253078 (select (arr!16850 a!3118) j!142)))))

(declare-fun b!556914 () Bool)

(declare-fun c!64222 () Bool)

(assert (=> b!556914 (= c!64222 (= lt!253078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556914 (= e!320841 e!320840)))

(declare-fun b!556915 () Bool)

(assert (=> b!556915 (= e!320840 (seekKeyOrZeroReturnVacant!0 (x!52309 lt!253076) (index!23425 lt!253076) (index!23425 lt!253076) (select (arr!16850 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83373 c!64220) b!556912))

(assert (= (and d!83373 (not c!64220)) b!556913))

(assert (= (and b!556913 c!64221) b!556911))

(assert (= (and b!556913 (not c!64221)) b!556914))

(assert (= (and b!556914 c!64222) b!556910))

(assert (= (and b!556914 (not c!64222)) b!556915))

(declare-fun m!534877 () Bool)

(assert (=> d!83373 m!534877))

(assert (=> d!83373 m!534665))

(assert (=> d!83373 m!534661))

(declare-fun m!534879 () Bool)

(assert (=> d!83373 m!534879))

(declare-fun m!534881 () Bool)

(assert (=> d!83373 m!534881))

(assert (=> d!83373 m!534655))

(assert (=> d!83373 m!534661))

(assert (=> d!83373 m!534665))

(declare-fun m!534883 () Bool)

(assert (=> d!83373 m!534883))

(declare-fun m!534885 () Bool)

(assert (=> b!556913 m!534885))

(assert (=> b!556915 m!534661))

(declare-fun m!534887 () Bool)

(assert (=> b!556915 m!534887))

(assert (=> b!556624 d!83373))

(declare-fun b!556916 () Bool)

(declare-fun e!320842 () Bool)

(declare-fun call!32351 () Bool)

(assert (=> b!556916 (= e!320842 call!32351)))

(declare-fun bm!32348 () Bool)

(assert (=> bm!32348 (= call!32351 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83375 () Bool)

(declare-fun res!349147 () Bool)

(declare-fun e!320844 () Bool)

(assert (=> d!83375 (=> res!349147 e!320844)))

(assert (=> d!83375 (= res!349147 (bvsge #b00000000000000000000000000000000 (size!17214 a!3118)))))

(assert (=> d!83375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320844)))

(declare-fun b!556917 () Bool)

(declare-fun e!320843 () Bool)

(assert (=> b!556917 (= e!320844 e!320843)))

(declare-fun c!64223 () Bool)

(assert (=> b!556917 (= c!64223 (validKeyInArray!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556918 () Bool)

(assert (=> b!556918 (= e!320843 e!320842)))

(declare-fun lt!253079 () (_ BitVec 64))

(assert (=> b!556918 (= lt!253079 (select (arr!16850 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253081 () Unit!17372)

(assert (=> b!556918 (= lt!253081 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253079 #b00000000000000000000000000000000))))

(assert (=> b!556918 (arrayContainsKey!0 a!3118 lt!253079 #b00000000000000000000000000000000)))

(declare-fun lt!253080 () Unit!17372)

(assert (=> b!556918 (= lt!253080 lt!253081)))

(declare-fun res!349148 () Bool)

(assert (=> b!556918 (= res!349148 (= (seekEntryOrOpen!0 (select (arr!16850 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5299 #b00000000000000000000000000000000)))))

(assert (=> b!556918 (=> (not res!349148) (not e!320842))))

(declare-fun b!556919 () Bool)

(assert (=> b!556919 (= e!320843 call!32351)))

(assert (= (and d!83375 (not res!349147)) b!556917))

(assert (= (and b!556917 c!64223) b!556918))

(assert (= (and b!556917 (not c!64223)) b!556919))

(assert (= (and b!556918 res!349148) b!556916))

(assert (= (or b!556916 b!556919) bm!32348))

(declare-fun m!534889 () Bool)

(assert (=> bm!32348 m!534889))

(assert (=> b!556917 m!534713))

(assert (=> b!556917 m!534713))

(assert (=> b!556917 m!534851))

(assert (=> b!556918 m!534713))

(declare-fun m!534891 () Bool)

(assert (=> b!556918 m!534891))

(declare-fun m!534893 () Bool)

(assert (=> b!556918 m!534893))

(assert (=> b!556918 m!534713))

(declare-fun m!534895 () Bool)

(assert (=> b!556918 m!534895))

(assert (=> b!556625 d!83375))

(push 1)

