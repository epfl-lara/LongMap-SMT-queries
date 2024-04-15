; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118578 () Bool)

(assert start!118578)

(declare-fun b!1386214 () Bool)

(declare-fun res!927495 () Bool)

(declare-fun e!785297 () Bool)

(assert (=> b!1386214 (=> (not res!927495) (not e!785297))))

(declare-datatypes ((array!94807 0))(
  ( (array!94808 (arr!45780 (Array (_ BitVec 32) (_ BitVec 64))) (size!46332 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94807)

(declare-datatypes ((List!32386 0))(
  ( (Nil!32383) (Cons!32382 (h!33591 (_ BitVec 64)) (t!47072 List!32386)) )
))
(declare-fun arrayNoDuplicates!0 (array!94807 (_ BitVec 32) List!32386) Bool)

(assert (=> b!1386214 (= res!927495 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32383))))

(declare-fun b!1386215 () Bool)

(declare-fun res!927491 () Bool)

(assert (=> b!1386215 (=> (not res!927491) (not e!785297))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386215 (= res!927491 (and (not (= (select (arr!45780 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45780 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386216 () Bool)

(declare-fun res!927494 () Bool)

(assert (=> b!1386216 (=> (not res!927494) (not e!785297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386216 (= res!927494 (validKeyInArray!0 (select (arr!45780 a!2938) i!1065)))))

(declare-fun b!1386217 () Bool)

(declare-datatypes ((Unit!46131 0))(
  ( (Unit!46132) )
))
(declare-fun e!785299 () Unit!46131)

(declare-fun Unit!46133 () Unit!46131)

(assert (=> b!1386217 (= e!785299 Unit!46133)))

(declare-fun b!1386218 () Bool)

(assert (=> b!1386218 (= e!785297 false)))

(declare-fun lt!609228 () Unit!46131)

(assert (=> b!1386218 (= lt!609228 e!785299)))

(declare-fun c!128804 () Bool)

(declare-fun e!785296 () Bool)

(assert (=> b!1386218 (= c!128804 e!785296)))

(declare-fun res!927493 () Bool)

(assert (=> b!1386218 (=> (not res!927493) (not e!785296))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386218 (= res!927493 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386219 () Bool)

(declare-fun lt!609230 () Unit!46131)

(assert (=> b!1386219 (= e!785299 lt!609230)))

(declare-fun lt!609229 () Unit!46131)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46131)

(assert (=> b!1386219 (= lt!609229 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10149 0))(
  ( (MissingZero!10149 (index!42967 (_ BitVec 32))) (Found!10149 (index!42968 (_ BitVec 32))) (Intermediate!10149 (undefined!10961 Bool) (index!42969 (_ BitVec 32)) (x!124579 (_ BitVec 32))) (Undefined!10149) (MissingVacant!10149 (index!42970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94807 (_ BitVec 32)) SeekEntryResult!10149)

(assert (=> b!1386219 (= (seekEntryOrOpen!0 (select (arr!45780 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45780 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94808 (store (arr!45780 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46332 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46131)

(assert (=> b!1386219 (= lt!609230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94807 (_ BitVec 32)) Bool)

(assert (=> b!1386219 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!927496 () Bool)

(assert (=> start!118578 (=> (not res!927496) (not e!785297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118578 (= res!927496 (validMask!0 mask!2987))))

(assert (=> start!118578 e!785297))

(assert (=> start!118578 true))

(declare-fun array_inv!35013 (array!94807) Bool)

(assert (=> start!118578 (array_inv!35013 a!2938)))

(declare-fun b!1386220 () Bool)

(declare-fun res!927497 () Bool)

(assert (=> b!1386220 (=> (not res!927497) (not e!785297))))

(assert (=> b!1386220 (= res!927497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386221 () Bool)

(assert (=> b!1386221 (= e!785296 (validKeyInArray!0 (select (arr!45780 a!2938) startIndex!16)))))

(declare-fun b!1386222 () Bool)

(declare-fun res!927492 () Bool)

(assert (=> b!1386222 (=> (not res!927492) (not e!785297))))

(assert (=> b!1386222 (= res!927492 (and (= (size!46332 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46332 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46332 a!2938))))))

(assert (= (and start!118578 res!927496) b!1386222))

(assert (= (and b!1386222 res!927492) b!1386216))

(assert (= (and b!1386216 res!927494) b!1386214))

(assert (= (and b!1386214 res!927495) b!1386220))

(assert (= (and b!1386220 res!927497) b!1386215))

(assert (= (and b!1386215 res!927491) b!1386218))

(assert (= (and b!1386218 res!927493) b!1386221))

(assert (= (and b!1386218 c!128804) b!1386219))

(assert (= (and b!1386218 (not c!128804)) b!1386217))

(declare-fun m!1271127 () Bool)

(assert (=> b!1386219 m!1271127))

(declare-fun m!1271129 () Bool)

(assert (=> b!1386219 m!1271129))

(assert (=> b!1386219 m!1271129))

(declare-fun m!1271131 () Bool)

(assert (=> b!1386219 m!1271131))

(declare-fun m!1271133 () Bool)

(assert (=> b!1386219 m!1271133))

(declare-fun m!1271135 () Bool)

(assert (=> b!1386219 m!1271135))

(declare-fun m!1271137 () Bool)

(assert (=> b!1386219 m!1271137))

(declare-fun m!1271139 () Bool)

(assert (=> b!1386219 m!1271139))

(assert (=> b!1386219 m!1271137))

(declare-fun m!1271141 () Bool)

(assert (=> b!1386219 m!1271141))

(declare-fun m!1271143 () Bool)

(assert (=> b!1386215 m!1271143))

(assert (=> b!1386221 m!1271137))

(assert (=> b!1386221 m!1271137))

(declare-fun m!1271145 () Bool)

(assert (=> b!1386221 m!1271145))

(assert (=> b!1386216 m!1271143))

(assert (=> b!1386216 m!1271143))

(declare-fun m!1271147 () Bool)

(assert (=> b!1386216 m!1271147))

(declare-fun m!1271149 () Bool)

(assert (=> b!1386220 m!1271149))

(declare-fun m!1271151 () Bool)

(assert (=> b!1386214 m!1271151))

(declare-fun m!1271153 () Bool)

(assert (=> start!118578 m!1271153))

(declare-fun m!1271155 () Bool)

(assert (=> start!118578 m!1271155))

(push 1)

(assert (not b!1386214))

(assert (not b!1386220))

(assert (not b!1386221))

(assert (not b!1386219))

(assert (not start!118578))

(assert (not b!1386216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

