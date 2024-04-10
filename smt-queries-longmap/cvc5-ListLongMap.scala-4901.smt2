; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67650 () Bool)

(assert start!67650)

(declare-fun b!783162 () Bool)

(declare-fun res!529791 () Bool)

(declare-fun e!435470 () Bool)

(assert (=> b!783162 (=> (not res!529791) (not e!435470))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783162 (= res!529791 (validKeyInArray!0 k!2102))))

(declare-fun b!783164 () Bool)

(declare-fun res!529786 () Bool)

(assert (=> b!783164 (=> (not res!529786) (not e!435470))))

(declare-datatypes ((array!42690 0))(
  ( (array!42691 (arr!20433 (Array (_ BitVec 32) (_ BitVec 64))) (size!20854 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42690)

(declare-fun arrayContainsKey!0 (array!42690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783164 (= res!529786 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783165 () Bool)

(declare-fun res!529802 () Bool)

(declare-fun e!435474 () Bool)

(assert (=> b!783165 (=> (not res!529802) (not e!435474))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783165 (= res!529802 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20433 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783166 () Bool)

(declare-fun e!435473 () Bool)

(declare-fun e!435472 () Bool)

(assert (=> b!783166 (= e!435473 e!435472)))

(declare-fun res!529788 () Bool)

(assert (=> b!783166 (=> res!529788 e!435472)))

(declare-fun lt!349025 () (_ BitVec 64))

(declare-fun lt!349022 () (_ BitVec 64))

(assert (=> b!783166 (= res!529788 (= lt!349025 lt!349022))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!783166 (= lt!349025 (select (store (arr!20433 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783167 () Bool)

(declare-fun e!435475 () Bool)

(assert (=> b!783167 (= e!435474 e!435475)))

(declare-fun res!529785 () Bool)

(assert (=> b!783167 (=> (not res!529785) (not e!435475))))

(declare-datatypes ((SeekEntryResult!8033 0))(
  ( (MissingZero!8033 (index!34500 (_ BitVec 32))) (Found!8033 (index!34501 (_ BitVec 32))) (Intermediate!8033 (undefined!8845 Bool) (index!34502 (_ BitVec 32)) (x!65461 (_ BitVec 32))) (Undefined!8033) (MissingVacant!8033 (index!34503 (_ BitVec 32))) )
))
(declare-fun lt!349028 () SeekEntryResult!8033)

(declare-fun lt!349023 () SeekEntryResult!8033)

(assert (=> b!783167 (= res!529785 (= lt!349028 lt!349023))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349031 () array!42690)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42690 (_ BitVec 32)) SeekEntryResult!8033)

(assert (=> b!783167 (= lt!349023 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349022 lt!349031 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783167 (= lt!349028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349022 mask!3328) lt!349022 lt!349031 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!783167 (= lt!349022 (select (store (arr!20433 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783167 (= lt!349031 (array!42691 (store (arr!20433 a!3186) i!1173 k!2102) (size!20854 a!3186)))))

(declare-fun b!783168 () Bool)

(declare-fun e!435471 () Bool)

(assert (=> b!783168 (= e!435470 e!435471)))

(declare-fun res!529790 () Bool)

(assert (=> b!783168 (=> (not res!529790) (not e!435471))))

(declare-fun lt!349030 () SeekEntryResult!8033)

(assert (=> b!783168 (= res!529790 (or (= lt!349030 (MissingZero!8033 i!1173)) (= lt!349030 (MissingVacant!8033 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42690 (_ BitVec 32)) SeekEntryResult!8033)

(assert (=> b!783168 (= lt!349030 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!783169 () Bool)

(declare-fun res!529801 () Bool)

(assert (=> b!783169 (=> (not res!529801) (not e!435474))))

(declare-fun e!435479 () Bool)

(assert (=> b!783169 (= res!529801 e!435479)))

(declare-fun c!87097 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783169 (= c!87097 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783170 () Bool)

(declare-fun res!529792 () Bool)

(assert (=> b!783170 (=> (not res!529792) (not e!435471))))

(declare-datatypes ((List!14435 0))(
  ( (Nil!14432) (Cons!14431 (h!15554 (_ BitVec 64)) (t!20750 List!14435)) )
))
(declare-fun arrayNoDuplicates!0 (array!42690 (_ BitVec 32) List!14435) Bool)

(assert (=> b!783170 (= res!529792 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14432))))

(declare-fun b!783171 () Bool)

(assert (=> b!783171 (= e!435471 e!435474)))

(declare-fun res!529794 () Bool)

(assert (=> b!783171 (=> (not res!529794) (not e!435474))))

(declare-fun lt!349029 () SeekEntryResult!8033)

(assert (=> b!783171 (= res!529794 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20433 a!3186) j!159) mask!3328) (select (arr!20433 a!3186) j!159) a!3186 mask!3328) lt!349029))))

(assert (=> b!783171 (= lt!349029 (Intermediate!8033 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783172 () Bool)

(declare-fun res!529787 () Bool)

(assert (=> b!783172 (=> (not res!529787) (not e!435470))))

(assert (=> b!783172 (= res!529787 (validKeyInArray!0 (select (arr!20433 a!3186) j!159)))))

(declare-fun b!783173 () Bool)

(declare-fun res!529799 () Bool)

(assert (=> b!783173 (=> (not res!529799) (not e!435471))))

(assert (=> b!783173 (= res!529799 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20854 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20854 a!3186))))))

(declare-fun b!783174 () Bool)

(declare-fun res!529789 () Bool)

(assert (=> b!783174 (=> (not res!529789) (not e!435471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42690 (_ BitVec 32)) Bool)

(assert (=> b!783174 (= res!529789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783175 () Bool)

(declare-fun res!529797 () Bool)

(assert (=> b!783175 (=> (not res!529797) (not e!435470))))

(assert (=> b!783175 (= res!529797 (and (= (size!20854 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20854 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20854 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783163 () Bool)

(assert (=> b!783163 (= e!435479 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20433 a!3186) j!159) a!3186 mask!3328) lt!349029))))

(declare-fun res!529795 () Bool)

(assert (=> start!67650 (=> (not res!529795) (not e!435470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67650 (= res!529795 (validMask!0 mask!3328))))

(assert (=> start!67650 e!435470))

(assert (=> start!67650 true))

(declare-fun array_inv!16229 (array!42690) Bool)

(assert (=> start!67650 (array_inv!16229 a!3186)))

(declare-fun b!783176 () Bool)

(declare-fun res!529796 () Bool)

(assert (=> b!783176 (=> res!529796 e!435473)))

(declare-fun lt!349026 () SeekEntryResult!8033)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42690 (_ BitVec 32)) SeekEntryResult!8033)

(assert (=> b!783176 (= res!529796 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20433 a!3186) j!159) a!3186 mask!3328) lt!349026)))))

(declare-fun b!783177 () Bool)

(declare-fun e!435478 () Bool)

(assert (=> b!783177 (= e!435478 (= (seekEntryOrOpen!0 lt!349022 lt!349031 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349022 lt!349031 mask!3328)))))

(declare-fun b!783178 () Bool)

(declare-datatypes ((Unit!27020 0))(
  ( (Unit!27021) )
))
(declare-fun e!435469 () Unit!27020)

(declare-fun Unit!27022 () Unit!27020)

(assert (=> b!783178 (= e!435469 Unit!27022)))

(declare-fun b!783179 () Bool)

(assert (=> b!783179 (= e!435472 true)))

(assert (=> b!783179 e!435478))

(declare-fun res!529800 () Bool)

(assert (=> b!783179 (=> (not res!529800) (not e!435478))))

(assert (=> b!783179 (= res!529800 (= lt!349025 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349027 () Unit!27020)

(assert (=> b!783179 (= lt!349027 e!435469)))

(declare-fun c!87096 () Bool)

(assert (=> b!783179 (= c!87096 (= lt!349025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783180 () Bool)

(assert (=> b!783180 (= e!435479 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20433 a!3186) j!159) a!3186 mask!3328) (Found!8033 j!159)))))

(declare-fun e!435476 () Bool)

(declare-fun b!783181 () Bool)

(assert (=> b!783181 (= e!435476 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20433 a!3186) j!159) a!3186 mask!3328) lt!349026))))

(declare-fun b!783182 () Bool)

(declare-fun Unit!27023 () Unit!27020)

(assert (=> b!783182 (= e!435469 Unit!27023)))

(assert (=> b!783182 false))

(declare-fun b!783183 () Bool)

(assert (=> b!783183 (= e!435475 (not e!435473))))

(declare-fun res!529798 () Bool)

(assert (=> b!783183 (=> res!529798 e!435473)))

(assert (=> b!783183 (= res!529798 (or (not (is-Intermediate!8033 lt!349023)) (bvslt x!1131 (x!65461 lt!349023)) (not (= x!1131 (x!65461 lt!349023))) (not (= index!1321 (index!34502 lt!349023)))))))

(assert (=> b!783183 e!435476))

(declare-fun res!529793 () Bool)

(assert (=> b!783183 (=> (not res!529793) (not e!435476))))

(declare-fun lt!349021 () SeekEntryResult!8033)

(assert (=> b!783183 (= res!529793 (= lt!349021 lt!349026))))

(assert (=> b!783183 (= lt!349026 (Found!8033 j!159))))

(assert (=> b!783183 (= lt!349021 (seekEntryOrOpen!0 (select (arr!20433 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783183 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349024 () Unit!27020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27020)

(assert (=> b!783183 (= lt!349024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67650 res!529795) b!783175))

(assert (= (and b!783175 res!529797) b!783172))

(assert (= (and b!783172 res!529787) b!783162))

(assert (= (and b!783162 res!529791) b!783164))

(assert (= (and b!783164 res!529786) b!783168))

(assert (= (and b!783168 res!529790) b!783174))

(assert (= (and b!783174 res!529789) b!783170))

(assert (= (and b!783170 res!529792) b!783173))

(assert (= (and b!783173 res!529799) b!783171))

(assert (= (and b!783171 res!529794) b!783165))

(assert (= (and b!783165 res!529802) b!783169))

(assert (= (and b!783169 c!87097) b!783163))

(assert (= (and b!783169 (not c!87097)) b!783180))

(assert (= (and b!783169 res!529801) b!783167))

(assert (= (and b!783167 res!529785) b!783183))

(assert (= (and b!783183 res!529793) b!783181))

(assert (= (and b!783183 (not res!529798)) b!783176))

(assert (= (and b!783176 (not res!529796)) b!783166))

(assert (= (and b!783166 (not res!529788)) b!783179))

(assert (= (and b!783179 c!87096) b!783182))

(assert (= (and b!783179 (not c!87096)) b!783178))

(assert (= (and b!783179 res!529800) b!783177))

(declare-fun m!725777 () Bool)

(assert (=> b!783164 m!725777))

(declare-fun m!725779 () Bool)

(assert (=> b!783165 m!725779))

(declare-fun m!725781 () Bool)

(assert (=> b!783168 m!725781))

(declare-fun m!725783 () Bool)

(assert (=> b!783163 m!725783))

(assert (=> b!783163 m!725783))

(declare-fun m!725785 () Bool)

(assert (=> b!783163 m!725785))

(declare-fun m!725787 () Bool)

(assert (=> b!783170 m!725787))

(declare-fun m!725789 () Bool)

(assert (=> b!783177 m!725789))

(declare-fun m!725791 () Bool)

(assert (=> b!783177 m!725791))

(assert (=> b!783171 m!725783))

(assert (=> b!783171 m!725783))

(declare-fun m!725793 () Bool)

(assert (=> b!783171 m!725793))

(assert (=> b!783171 m!725793))

(assert (=> b!783171 m!725783))

(declare-fun m!725795 () Bool)

(assert (=> b!783171 m!725795))

(declare-fun m!725797 () Bool)

(assert (=> b!783162 m!725797))

(declare-fun m!725799 () Bool)

(assert (=> b!783174 m!725799))

(assert (=> b!783183 m!725783))

(assert (=> b!783183 m!725783))

(declare-fun m!725801 () Bool)

(assert (=> b!783183 m!725801))

(declare-fun m!725803 () Bool)

(assert (=> b!783183 m!725803))

(declare-fun m!725805 () Bool)

(assert (=> b!783183 m!725805))

(assert (=> b!783172 m!725783))

(assert (=> b!783172 m!725783))

(declare-fun m!725807 () Bool)

(assert (=> b!783172 m!725807))

(assert (=> b!783180 m!725783))

(assert (=> b!783180 m!725783))

(declare-fun m!725809 () Bool)

(assert (=> b!783180 m!725809))

(assert (=> b!783176 m!725783))

(assert (=> b!783176 m!725783))

(assert (=> b!783176 m!725809))

(assert (=> b!783181 m!725783))

(assert (=> b!783181 m!725783))

(declare-fun m!725811 () Bool)

(assert (=> b!783181 m!725811))

(declare-fun m!725813 () Bool)

(assert (=> b!783166 m!725813))

(declare-fun m!725815 () Bool)

(assert (=> b!783166 m!725815))

(declare-fun m!725817 () Bool)

(assert (=> start!67650 m!725817))

(declare-fun m!725819 () Bool)

(assert (=> start!67650 m!725819))

(declare-fun m!725821 () Bool)

(assert (=> b!783167 m!725821))

(assert (=> b!783167 m!725813))

(declare-fun m!725823 () Bool)

(assert (=> b!783167 m!725823))

(declare-fun m!725825 () Bool)

(assert (=> b!783167 m!725825))

(declare-fun m!725827 () Bool)

(assert (=> b!783167 m!725827))

(assert (=> b!783167 m!725823))

(push 1)

