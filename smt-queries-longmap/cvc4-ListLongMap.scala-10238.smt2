; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120484 () Bool)

(assert start!120484)

(declare-fun b!1402931 () Bool)

(declare-fun e!794393 () Bool)

(declare-fun lt!618212 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402931 (= e!794393 (validKeyInArray!0 lt!618212))))

(declare-fun b!1402932 () Bool)

(declare-fun res!941444 () Bool)

(declare-fun e!794389 () Bool)

(assert (=> b!1402932 (=> (not res!941444) (not e!794389))))

(declare-datatypes ((array!95893 0))(
  ( (array!95894 (arr!46297 (Array (_ BitVec 32) (_ BitVec 64))) (size!46847 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95893)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402932 (= res!941444 (validKeyInArray!0 (select (arr!46297 a!2901) j!112)))))

(declare-fun b!1402933 () Bool)

(declare-fun res!941443 () Bool)

(assert (=> b!1402933 (=> (not res!941443) (not e!794389))))

(declare-datatypes ((List!32816 0))(
  ( (Nil!32813) (Cons!32812 (h!34060 (_ BitVec 64)) (t!47510 List!32816)) )
))
(declare-fun arrayNoDuplicates!0 (array!95893 (_ BitVec 32) List!32816) Bool)

(assert (=> b!1402933 (= res!941443 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32813))))

(declare-fun b!1402934 () Bool)

(declare-fun res!941451 () Bool)

(assert (=> b!1402934 (=> (not res!941451) (not e!794389))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95893 (_ BitVec 32)) Bool)

(assert (=> b!1402934 (= res!941451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402935 () Bool)

(declare-fun res!941445 () Bool)

(assert (=> b!1402935 (=> (not res!941445) (not e!794389))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402935 (= res!941445 (validKeyInArray!0 (select (arr!46297 a!2901) i!1037)))))

(declare-fun b!1402936 () Bool)

(declare-fun res!941446 () Bool)

(assert (=> b!1402936 (=> (not res!941446) (not e!794389))))

(assert (=> b!1402936 (= res!941446 (and (= (size!46847 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46847 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46847 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402937 () Bool)

(declare-fun e!794388 () Bool)

(declare-fun e!794391 () Bool)

(assert (=> b!1402937 (= e!794388 e!794391)))

(declare-fun res!941442 () Bool)

(assert (=> b!1402937 (=> res!941442 e!794391)))

(declare-datatypes ((SeekEntryResult!10614 0))(
  ( (MissingZero!10614 (index!44833 (_ BitVec 32))) (Found!10614 (index!44834 (_ BitVec 32))) (Intermediate!10614 (undefined!11426 Bool) (index!44835 (_ BitVec 32)) (x!126449 (_ BitVec 32))) (Undefined!10614) (MissingVacant!10614 (index!44836 (_ BitVec 32))) )
))
(declare-fun lt!618211 () SeekEntryResult!10614)

(declare-fun lt!618206 () SeekEntryResult!10614)

(assert (=> b!1402937 (= res!941442 (or (= lt!618211 lt!618206) (not (is-Intermediate!10614 lt!618206))))))

(declare-fun lt!618209 () array!95893)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95893 (_ BitVec 32)) SeekEntryResult!10614)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402937 (= lt!618206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618212 mask!2840) lt!618212 lt!618209 mask!2840))))

(assert (=> b!1402937 (= lt!618212 (select (store (arr!46297 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402937 (= lt!618209 (array!95894 (store (arr!46297 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46847 a!2901)))))

(declare-fun b!1402938 () Bool)

(declare-fun e!794392 () Bool)

(assert (=> b!1402938 (= e!794391 e!794392)))

(declare-fun res!941452 () Bool)

(assert (=> b!1402938 (=> res!941452 e!794392)))

(declare-fun lt!618204 () (_ BitVec 32))

(assert (=> b!1402938 (= res!941452 (or (bvslt (x!126449 lt!618211) #b00000000000000000000000000000000) (bvsgt (x!126449 lt!618211) #b01111111111111111111111111111110) (bvslt (x!126449 lt!618206) #b00000000000000000000000000000000) (bvsgt (x!126449 lt!618206) #b01111111111111111111111111111110) (bvslt lt!618204 #b00000000000000000000000000000000) (bvsge lt!618204 (size!46847 a!2901)) (bvslt (index!44835 lt!618211) #b00000000000000000000000000000000) (bvsge (index!44835 lt!618211) (size!46847 a!2901)) (bvslt (index!44835 lt!618206) #b00000000000000000000000000000000) (bvsge (index!44835 lt!618206) (size!46847 a!2901)) (not (= lt!618211 (Intermediate!10614 false (index!44835 lt!618211) (x!126449 lt!618211)))) (not (= lt!618206 (Intermediate!10614 false (index!44835 lt!618206) (x!126449 lt!618206))))))))

(declare-fun lt!618213 () SeekEntryResult!10614)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95893 (_ BitVec 32)) SeekEntryResult!10614)

(assert (=> b!1402938 (= lt!618213 (seekKeyOrZeroReturnVacant!0 (x!126449 lt!618206) (index!44835 lt!618206) (index!44835 lt!618206) (select (arr!46297 a!2901) j!112) lt!618209 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95893 (_ BitVec 32)) SeekEntryResult!10614)

(assert (=> b!1402938 (= lt!618213 (seekEntryOrOpen!0 lt!618212 lt!618209 mask!2840))))

(assert (=> b!1402938 (and (not (undefined!11426 lt!618206)) (= (index!44835 lt!618206) i!1037) (bvslt (x!126449 lt!618206) (x!126449 lt!618211)) (= (select (store (arr!46297 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44835 lt!618206)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47232 0))(
  ( (Unit!47233) )
))
(declare-fun lt!618210 () Unit!47232)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47232)

(assert (=> b!1402938 (= lt!618210 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618204 (x!126449 lt!618211) (index!44835 lt!618211) (x!126449 lt!618206) (index!44835 lt!618206) (undefined!11426 lt!618206) mask!2840))))

(declare-fun b!1402939 () Bool)

(assert (=> b!1402939 (= e!794389 (not e!794388))))

(declare-fun res!941450 () Bool)

(assert (=> b!1402939 (=> res!941450 e!794388)))

(assert (=> b!1402939 (= res!941450 (or (not (is-Intermediate!10614 lt!618211)) (undefined!11426 lt!618211)))))

(declare-fun lt!618208 () SeekEntryResult!10614)

(assert (=> b!1402939 (= lt!618208 (Found!10614 j!112))))

(assert (=> b!1402939 (= lt!618208 (seekEntryOrOpen!0 (select (arr!46297 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402939 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618207 () Unit!47232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47232)

(assert (=> b!1402939 (= lt!618207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402939 (= lt!618211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618204 (select (arr!46297 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402939 (= lt!618204 (toIndex!0 (select (arr!46297 a!2901) j!112) mask!2840))))

(declare-fun b!1402940 () Bool)

(declare-fun res!941447 () Bool)

(assert (=> b!1402940 (=> res!941447 e!794392)))

(assert (=> b!1402940 (= res!941447 (not (= lt!618206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618204 lt!618212 lt!618209 mask!2840))))))

(declare-fun res!941449 () Bool)

(assert (=> start!120484 (=> (not res!941449) (not e!794389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120484 (= res!941449 (validMask!0 mask!2840))))

(assert (=> start!120484 e!794389))

(assert (=> start!120484 true))

(declare-fun array_inv!35325 (array!95893) Bool)

(assert (=> start!120484 (array_inv!35325 a!2901)))

(declare-fun b!1402941 () Bool)

(assert (=> b!1402941 (= e!794392 e!794393)))

(declare-fun res!941448 () Bool)

(assert (=> b!1402941 (=> res!941448 e!794393)))

(assert (=> b!1402941 (= res!941448 (bvslt mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1402941 (= lt!618208 lt!618213)))

(declare-fun lt!618205 () Unit!47232)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47232)

(assert (=> b!1402941 (= lt!618205 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618204 (x!126449 lt!618211) (index!44835 lt!618211) (x!126449 lt!618206) (index!44835 lt!618206) mask!2840))))

(assert (= (and start!120484 res!941449) b!1402936))

(assert (= (and b!1402936 res!941446) b!1402935))

(assert (= (and b!1402935 res!941445) b!1402932))

(assert (= (and b!1402932 res!941444) b!1402934))

(assert (= (and b!1402934 res!941451) b!1402933))

(assert (= (and b!1402933 res!941443) b!1402939))

(assert (= (and b!1402939 (not res!941450)) b!1402937))

(assert (= (and b!1402937 (not res!941442)) b!1402938))

(assert (= (and b!1402938 (not res!941452)) b!1402940))

(assert (= (and b!1402940 (not res!941447)) b!1402941))

(assert (= (and b!1402941 (not res!941448)) b!1402931))

(declare-fun m!1291347 () Bool)

(assert (=> b!1402938 m!1291347))

(declare-fun m!1291349 () Bool)

(assert (=> b!1402938 m!1291349))

(declare-fun m!1291351 () Bool)

(assert (=> b!1402938 m!1291351))

(declare-fun m!1291353 () Bool)

(assert (=> b!1402938 m!1291353))

(declare-fun m!1291355 () Bool)

(assert (=> b!1402938 m!1291355))

(declare-fun m!1291357 () Bool)

(assert (=> b!1402938 m!1291357))

(assert (=> b!1402938 m!1291347))

(assert (=> b!1402939 m!1291347))

(declare-fun m!1291359 () Bool)

(assert (=> b!1402939 m!1291359))

(assert (=> b!1402939 m!1291347))

(declare-fun m!1291361 () Bool)

(assert (=> b!1402939 m!1291361))

(assert (=> b!1402939 m!1291347))

(declare-fun m!1291363 () Bool)

(assert (=> b!1402939 m!1291363))

(assert (=> b!1402939 m!1291347))

(declare-fun m!1291365 () Bool)

(assert (=> b!1402939 m!1291365))

(declare-fun m!1291367 () Bool)

(assert (=> b!1402939 m!1291367))

(declare-fun m!1291369 () Bool)

(assert (=> b!1402931 m!1291369))

(declare-fun m!1291371 () Bool)

(assert (=> b!1402941 m!1291371))

(declare-fun m!1291373 () Bool)

(assert (=> b!1402940 m!1291373))

(declare-fun m!1291375 () Bool)

(assert (=> b!1402935 m!1291375))

(assert (=> b!1402935 m!1291375))

(declare-fun m!1291377 () Bool)

(assert (=> b!1402935 m!1291377))

(declare-fun m!1291379 () Bool)

(assert (=> b!1402934 m!1291379))

(declare-fun m!1291381 () Bool)

(assert (=> start!120484 m!1291381))

(declare-fun m!1291383 () Bool)

(assert (=> start!120484 m!1291383))

(declare-fun m!1291385 () Bool)

(assert (=> b!1402933 m!1291385))

(assert (=> b!1402932 m!1291347))

(assert (=> b!1402932 m!1291347))

(declare-fun m!1291387 () Bool)

(assert (=> b!1402932 m!1291387))

(declare-fun m!1291389 () Bool)

(assert (=> b!1402937 m!1291389))

(assert (=> b!1402937 m!1291389))

(declare-fun m!1291391 () Bool)

(assert (=> b!1402937 m!1291391))

(assert (=> b!1402937 m!1291355))

(declare-fun m!1291393 () Bool)

(assert (=> b!1402937 m!1291393))

(push 1)

