; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65204 () Bool)

(assert start!65204)

(declare-fun b!738124 () Bool)

(declare-fun e!412825 () Bool)

(declare-fun e!412820 () Bool)

(assert (=> b!738124 (= e!412825 e!412820)))

(declare-fun res!496206 () Bool)

(assert (=> b!738124 (=> (not res!496206) (not e!412820))))

(declare-datatypes ((SeekEntryResult!7402 0))(
  ( (MissingZero!7402 (index!31976 (_ BitVec 32))) (Found!7402 (index!31977 (_ BitVec 32))) (Intermediate!7402 (undefined!8214 Bool) (index!31978 (_ BitVec 32)) (x!62968 (_ BitVec 32))) (Undefined!7402) (MissingVacant!7402 (index!31979 (_ BitVec 32))) )
))
(declare-fun lt!327580 () SeekEntryResult!7402)

(declare-fun lt!327584 () SeekEntryResult!7402)

(assert (=> b!738124 (= res!496206 (= lt!327580 lt!327584))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!327583 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41377 0))(
  ( (array!41378 (arr!19802 (Array (_ BitVec 32) (_ BitVec 64))) (size!20223 (_ BitVec 32))) )
))
(declare-fun lt!327582 () array!41377)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41377 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!738124 (= lt!327584 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327583 lt!327582 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738124 (= lt!327580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327583 mask!3328) lt!327583 lt!327582 mask!3328))))

(declare-fun a!3186 () array!41377)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738124 (= lt!327583 (select (store (arr!19802 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738124 (= lt!327582 (array!41378 (store (arr!19802 a!3186) i!1173 k!2102) (size!20223 a!3186)))))

(declare-fun b!738125 () Bool)

(declare-fun lt!327591 () SeekEntryResult!7402)

(declare-fun e!412818 () Bool)

(assert (=> b!738125 (= e!412818 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327591))))

(declare-fun b!738126 () Bool)

(declare-fun e!412816 () Bool)

(assert (=> b!738126 (= e!412820 (not e!412816))))

(declare-fun res!496199 () Bool)

(assert (=> b!738126 (=> res!496199 e!412816)))

(assert (=> b!738126 (= res!496199 (or (not (is-Intermediate!7402 lt!327584)) (bvsge x!1131 (x!62968 lt!327584))))))

(declare-fun lt!327587 () SeekEntryResult!7402)

(assert (=> b!738126 (= lt!327587 (Found!7402 j!159))))

(declare-fun e!412815 () Bool)

(assert (=> b!738126 e!412815))

(declare-fun res!496195 () Bool)

(assert (=> b!738126 (=> (not res!496195) (not e!412815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41377 (_ BitVec 32)) Bool)

(assert (=> b!738126 (= res!496195 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25204 0))(
  ( (Unit!25205) )
))
(declare-fun lt!327592 () Unit!25204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25204)

(assert (=> b!738126 (= lt!327592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!496203 () Bool)

(declare-fun e!412819 () Bool)

(assert (=> start!65204 (=> (not res!496203) (not e!412819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65204 (= res!496203 (validMask!0 mask!3328))))

(assert (=> start!65204 e!412819))

(assert (=> start!65204 true))

(declare-fun array_inv!15598 (array!41377) Bool)

(assert (=> start!65204 (array_inv!15598 a!3186)))

(declare-fun b!738127 () Bool)

(declare-fun res!496194 () Bool)

(assert (=> b!738127 (=> (not res!496194) (not e!412819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738127 (= res!496194 (validKeyInArray!0 (select (arr!19802 a!3186) j!159)))))

(declare-fun b!738128 () Bool)

(declare-fun res!496205 () Bool)

(assert (=> b!738128 (=> (not res!496205) (not e!412819))))

(declare-fun arrayContainsKey!0 (array!41377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738128 (= res!496205 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738129 () Bool)

(declare-fun res!496200 () Bool)

(assert (=> b!738129 (=> (not res!496200) (not e!412819))))

(assert (=> b!738129 (= res!496200 (validKeyInArray!0 k!2102))))

(declare-fun b!738130 () Bool)

(declare-fun e!412817 () Bool)

(assert (=> b!738130 (= e!412817 e!412825)))

(declare-fun res!496201 () Bool)

(assert (=> b!738130 (=> (not res!496201) (not e!412825))))

(assert (=> b!738130 (= res!496201 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19802 a!3186) j!159) mask!3328) (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327591))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738130 (= lt!327591 (Intermediate!7402 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738131 () Bool)

(declare-fun res!496196 () Bool)

(declare-fun e!412822 () Bool)

(assert (=> b!738131 (=> res!496196 e!412822)))

(declare-fun e!412826 () Bool)

(assert (=> b!738131 (= res!496196 e!412826)))

(declare-fun c!81348 () Bool)

(declare-fun lt!327581 () Bool)

(assert (=> b!738131 (= c!81348 lt!327581)))

(declare-fun b!738132 () Bool)

(declare-fun res!496191 () Bool)

(assert (=> b!738132 (=> (not res!496191) (not e!412817))))

(assert (=> b!738132 (= res!496191 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20223 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20223 a!3186))))))

(declare-fun b!738133 () Bool)

(assert (=> b!738133 (= e!412816 e!412822)))

(declare-fun res!496204 () Bool)

(assert (=> b!738133 (=> res!496204 e!412822)))

(declare-fun lt!327590 () (_ BitVec 32))

(assert (=> b!738133 (= res!496204 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327590 #b00000000000000000000000000000000) (bvsge lt!327590 (size!20223 a!3186))))))

(declare-fun lt!327593 () Unit!25204)

(declare-fun e!412824 () Unit!25204)

(assert (=> b!738133 (= lt!327593 e!412824)))

(declare-fun c!81347 () Bool)

(assert (=> b!738133 (= c!81347 lt!327581)))

(assert (=> b!738133 (= lt!327581 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738133 (= lt!327590 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738134 () Bool)

(declare-fun res!496193 () Bool)

(assert (=> b!738134 (=> (not res!496193) (not e!412825))))

(assert (=> b!738134 (= res!496193 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19802 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738135 () Bool)

(assert (=> b!738135 (= e!412826 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327590 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327591)))))

(declare-fun b!738136 () Bool)

(declare-fun e!412821 () Bool)

(declare-fun lt!327585 () SeekEntryResult!7402)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41377 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!738136 (= e!412821 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327585))))

(declare-fun b!738137 () Bool)

(assert (=> b!738137 (= e!412815 e!412821)))

(declare-fun res!496192 () Bool)

(assert (=> b!738137 (=> (not res!496192) (not e!412821))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41377 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!738137 (= res!496192 (= (seekEntryOrOpen!0 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327585))))

(assert (=> b!738137 (= lt!327585 (Found!7402 j!159))))

(declare-fun b!738138 () Bool)

(assert (=> b!738138 (= e!412819 e!412817)))

(declare-fun res!496197 () Bool)

(assert (=> b!738138 (=> (not res!496197) (not e!412817))))

(declare-fun lt!327588 () SeekEntryResult!7402)

(assert (=> b!738138 (= res!496197 (or (= lt!327588 (MissingZero!7402 i!1173)) (= lt!327588 (MissingVacant!7402 i!1173))))))

(assert (=> b!738138 (= lt!327588 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738139 () Bool)

(assert (=> b!738139 (= e!412822 true)))

(declare-fun lt!327589 () SeekEntryResult!7402)

(assert (=> b!738139 (= lt!327589 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327590 lt!327583 lt!327582 mask!3328))))

(declare-fun b!738140 () Bool)

(declare-fun Unit!25206 () Unit!25204)

(assert (=> b!738140 (= e!412824 Unit!25206)))

(assert (=> b!738140 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327590 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327591)))

(declare-fun b!738141 () Bool)

(declare-fun Unit!25207 () Unit!25204)

(assert (=> b!738141 (= e!412824 Unit!25207)))

(declare-fun lt!327586 () SeekEntryResult!7402)

(assert (=> b!738141 (= lt!327586 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738141 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327590 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327587)))

(declare-fun b!738142 () Bool)

(declare-fun res!496198 () Bool)

(assert (=> b!738142 (=> (not res!496198) (not e!412817))))

(assert (=> b!738142 (= res!496198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738143 () Bool)

(declare-fun res!496207 () Bool)

(assert (=> b!738143 (=> (not res!496207) (not e!412819))))

(assert (=> b!738143 (= res!496207 (and (= (size!20223 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20223 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20223 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738144 () Bool)

(declare-fun res!496202 () Bool)

(assert (=> b!738144 (=> (not res!496202) (not e!412817))))

(declare-datatypes ((List!13804 0))(
  ( (Nil!13801) (Cons!13800 (h!14872 (_ BitVec 64)) (t!20119 List!13804)) )
))
(declare-fun arrayNoDuplicates!0 (array!41377 (_ BitVec 32) List!13804) Bool)

(assert (=> b!738144 (= res!496202 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13801))))

(declare-fun b!738145 () Bool)

(declare-fun res!496208 () Bool)

(assert (=> b!738145 (=> (not res!496208) (not e!412825))))

(assert (=> b!738145 (= res!496208 e!412818)))

(declare-fun c!81349 () Bool)

(assert (=> b!738145 (= c!81349 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738146 () Bool)

(assert (=> b!738146 (= e!412818 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) (Found!7402 j!159)))))

(declare-fun b!738147 () Bool)

(assert (=> b!738147 (= e!412826 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327590 resIntermediateIndex!5 (select (arr!19802 a!3186) j!159) a!3186 mask!3328) lt!327587)))))

(assert (= (and start!65204 res!496203) b!738143))

(assert (= (and b!738143 res!496207) b!738127))

(assert (= (and b!738127 res!496194) b!738129))

(assert (= (and b!738129 res!496200) b!738128))

(assert (= (and b!738128 res!496205) b!738138))

(assert (= (and b!738138 res!496197) b!738142))

(assert (= (and b!738142 res!496198) b!738144))

(assert (= (and b!738144 res!496202) b!738132))

(assert (= (and b!738132 res!496191) b!738130))

(assert (= (and b!738130 res!496201) b!738134))

(assert (= (and b!738134 res!496193) b!738145))

(assert (= (and b!738145 c!81349) b!738125))

(assert (= (and b!738145 (not c!81349)) b!738146))

(assert (= (and b!738145 res!496208) b!738124))

(assert (= (and b!738124 res!496206) b!738126))

(assert (= (and b!738126 res!496195) b!738137))

(assert (= (and b!738137 res!496192) b!738136))

(assert (= (and b!738126 (not res!496199)) b!738133))

(assert (= (and b!738133 c!81347) b!738140))

(assert (= (and b!738133 (not c!81347)) b!738141))

(assert (= (and b!738133 (not res!496204)) b!738131))

(assert (= (and b!738131 c!81348) b!738135))

(assert (= (and b!738131 (not c!81348)) b!738147))

(assert (= (and b!738131 (not res!496196)) b!738139))

(declare-fun m!689833 () Bool)

(assert (=> start!65204 m!689833))

(declare-fun m!689835 () Bool)

(assert (=> start!65204 m!689835))

(declare-fun m!689837 () Bool)

(assert (=> b!738125 m!689837))

(assert (=> b!738125 m!689837))

(declare-fun m!689839 () Bool)

(assert (=> b!738125 m!689839))

(assert (=> b!738147 m!689837))

(assert (=> b!738147 m!689837))

(declare-fun m!689841 () Bool)

(assert (=> b!738147 m!689841))

(declare-fun m!689843 () Bool)

(assert (=> b!738133 m!689843))

(assert (=> b!738137 m!689837))

(assert (=> b!738137 m!689837))

(declare-fun m!689845 () Bool)

(assert (=> b!738137 m!689845))

(declare-fun m!689847 () Bool)

(assert (=> b!738129 m!689847))

(assert (=> b!738140 m!689837))

(assert (=> b!738140 m!689837))

(declare-fun m!689849 () Bool)

(assert (=> b!738140 m!689849))

(assert (=> b!738146 m!689837))

(assert (=> b!738146 m!689837))

(declare-fun m!689851 () Bool)

(assert (=> b!738146 m!689851))

(declare-fun m!689853 () Bool)

(assert (=> b!738134 m!689853))

(declare-fun m!689855 () Bool)

(assert (=> b!738138 m!689855))

(assert (=> b!738141 m!689837))

(assert (=> b!738141 m!689837))

(assert (=> b!738141 m!689851))

(assert (=> b!738141 m!689837))

(assert (=> b!738141 m!689841))

(declare-fun m!689857 () Bool)

(assert (=> b!738124 m!689857))

(declare-fun m!689859 () Bool)

(assert (=> b!738124 m!689859))

(assert (=> b!738124 m!689857))

(declare-fun m!689861 () Bool)

(assert (=> b!738124 m!689861))

(declare-fun m!689863 () Bool)

(assert (=> b!738124 m!689863))

(declare-fun m!689865 () Bool)

(assert (=> b!738124 m!689865))

(declare-fun m!689867 () Bool)

(assert (=> b!738126 m!689867))

(declare-fun m!689869 () Bool)

(assert (=> b!738126 m!689869))

(declare-fun m!689871 () Bool)

(assert (=> b!738144 m!689871))

(assert (=> b!738135 m!689837))

(assert (=> b!738135 m!689837))

(assert (=> b!738135 m!689849))

(declare-fun m!689873 () Bool)

(assert (=> b!738128 m!689873))

(assert (=> b!738127 m!689837))

(assert (=> b!738127 m!689837))

(declare-fun m!689875 () Bool)

(assert (=> b!738127 m!689875))

(assert (=> b!738136 m!689837))

(assert (=> b!738136 m!689837))

(declare-fun m!689877 () Bool)

(assert (=> b!738136 m!689877))

(declare-fun m!689879 () Bool)

(assert (=> b!738142 m!689879))

(declare-fun m!689881 () Bool)

(assert (=> b!738139 m!689881))

(assert (=> b!738130 m!689837))

(assert (=> b!738130 m!689837))

(declare-fun m!689883 () Bool)

(assert (=> b!738130 m!689883))

(assert (=> b!738130 m!689883))

(assert (=> b!738130 m!689837))

(declare-fun m!689885 () Bool)

(assert (=> b!738130 m!689885))

(push 1)

