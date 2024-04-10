; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120482 () Bool)

(assert start!120482)

(declare-fun b!1402898 () Bool)

(declare-fun e!794375 () Bool)

(declare-fun e!794370 () Bool)

(assert (=> b!1402898 (= e!794375 (not e!794370))))

(declare-fun res!941412 () Bool)

(assert (=> b!1402898 (=> res!941412 e!794370)))

(declare-datatypes ((SeekEntryResult!10613 0))(
  ( (MissingZero!10613 (index!44829 (_ BitVec 32))) (Found!10613 (index!44830 (_ BitVec 32))) (Intermediate!10613 (undefined!11425 Bool) (index!44831 (_ BitVec 32)) (x!126448 (_ BitVec 32))) (Undefined!10613) (MissingVacant!10613 (index!44832 (_ BitVec 32))) )
))
(declare-fun lt!618177 () SeekEntryResult!10613)

(get-info :version)

(assert (=> b!1402898 (= res!941412 (or (not ((_ is Intermediate!10613) lt!618177)) (undefined!11425 lt!618177)))))

(declare-fun lt!618176 () SeekEntryResult!10613)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402898 (= lt!618176 (Found!10613 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95891 0))(
  ( (array!95892 (arr!46296 (Array (_ BitVec 32) (_ BitVec 64))) (size!46846 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95891)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95891 (_ BitVec 32)) SeekEntryResult!10613)

(assert (=> b!1402898 (= lt!618176 (seekEntryOrOpen!0 (select (arr!46296 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95891 (_ BitVec 32)) Bool)

(assert (=> b!1402898 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47230 0))(
  ( (Unit!47231) )
))
(declare-fun lt!618182 () Unit!47230)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47230)

(assert (=> b!1402898 (= lt!618182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618174 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95891 (_ BitVec 32)) SeekEntryResult!10613)

(assert (=> b!1402898 (= lt!618177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618174 (select (arr!46296 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402898 (= lt!618174 (toIndex!0 (select (arr!46296 a!2901) j!112) mask!2840))))

(declare-fun b!1402899 () Bool)

(declare-fun res!941413 () Bool)

(assert (=> b!1402899 (=> (not res!941413) (not e!794375))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402899 (= res!941413 (and (= (size!46846 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46846 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46846 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402900 () Bool)

(declare-fun res!941411 () Bool)

(declare-fun e!794372 () Bool)

(assert (=> b!1402900 (=> res!941411 e!794372)))

(declare-fun lt!618178 () (_ BitVec 64))

(declare-fun lt!618175 () SeekEntryResult!10613)

(declare-fun lt!618180 () array!95891)

(assert (=> b!1402900 (= res!941411 (not (= lt!618175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618174 lt!618178 lt!618180 mask!2840))))))

(declare-fun b!1402902 () Bool)

(declare-fun res!941417 () Bool)

(assert (=> b!1402902 (=> (not res!941417) (not e!794375))))

(assert (=> b!1402902 (= res!941417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402903 () Bool)

(declare-fun e!794371 () Bool)

(assert (=> b!1402903 (= e!794371 e!794372)))

(declare-fun res!941416 () Bool)

(assert (=> b!1402903 (=> res!941416 e!794372)))

(assert (=> b!1402903 (= res!941416 (or (bvslt (x!126448 lt!618177) #b00000000000000000000000000000000) (bvsgt (x!126448 lt!618177) #b01111111111111111111111111111110) (bvslt (x!126448 lt!618175) #b00000000000000000000000000000000) (bvsgt (x!126448 lt!618175) #b01111111111111111111111111111110) (bvslt lt!618174 #b00000000000000000000000000000000) (bvsge lt!618174 (size!46846 a!2901)) (bvslt (index!44831 lt!618177) #b00000000000000000000000000000000) (bvsge (index!44831 lt!618177) (size!46846 a!2901)) (bvslt (index!44831 lt!618175) #b00000000000000000000000000000000) (bvsge (index!44831 lt!618175) (size!46846 a!2901)) (not (= lt!618177 (Intermediate!10613 false (index!44831 lt!618177) (x!126448 lt!618177)))) (not (= lt!618175 (Intermediate!10613 false (index!44831 lt!618175) (x!126448 lt!618175))))))))

(declare-fun lt!618181 () SeekEntryResult!10613)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95891 (_ BitVec 32)) SeekEntryResult!10613)

(assert (=> b!1402903 (= lt!618181 (seekKeyOrZeroReturnVacant!0 (x!126448 lt!618175) (index!44831 lt!618175) (index!44831 lt!618175) (select (arr!46296 a!2901) j!112) lt!618180 mask!2840))))

(assert (=> b!1402903 (= lt!618181 (seekEntryOrOpen!0 lt!618178 lt!618180 mask!2840))))

(assert (=> b!1402903 (and (not (undefined!11425 lt!618175)) (= (index!44831 lt!618175) i!1037) (bvslt (x!126448 lt!618175) (x!126448 lt!618177)) (= (select (store (arr!46296 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44831 lt!618175)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618179 () Unit!47230)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47230)

(assert (=> b!1402903 (= lt!618179 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618174 (x!126448 lt!618177) (index!44831 lt!618177) (x!126448 lt!618175) (index!44831 lt!618175) (undefined!11425 lt!618175) mask!2840))))

(declare-fun b!1402904 () Bool)

(declare-fun res!941410 () Bool)

(assert (=> b!1402904 (=> (not res!941410) (not e!794375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402904 (= res!941410 (validKeyInArray!0 (select (arr!46296 a!2901) i!1037)))))

(declare-fun res!941415 () Bool)

(assert (=> start!120482 (=> (not res!941415) (not e!794375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120482 (= res!941415 (validMask!0 mask!2840))))

(assert (=> start!120482 e!794375))

(assert (=> start!120482 true))

(declare-fun array_inv!35324 (array!95891) Bool)

(assert (=> start!120482 (array_inv!35324 a!2901)))

(declare-fun b!1402901 () Bool)

(declare-fun res!941419 () Bool)

(assert (=> b!1402901 (=> (not res!941419) (not e!794375))))

(declare-datatypes ((List!32815 0))(
  ( (Nil!32812) (Cons!32811 (h!34059 (_ BitVec 64)) (t!47509 List!32815)) )
))
(declare-fun arrayNoDuplicates!0 (array!95891 (_ BitVec 32) List!32815) Bool)

(assert (=> b!1402901 (= res!941419 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32812))))

(declare-fun b!1402905 () Bool)

(declare-fun e!794374 () Bool)

(assert (=> b!1402905 (= e!794372 e!794374)))

(declare-fun res!941414 () Bool)

(assert (=> b!1402905 (=> res!941414 e!794374)))

(assert (=> b!1402905 (= res!941414 (bvslt mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1402905 (= lt!618176 lt!618181)))

(declare-fun lt!618183 () Unit!47230)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47230)

(assert (=> b!1402905 (= lt!618183 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618174 (x!126448 lt!618177) (index!44831 lt!618177) (x!126448 lt!618175) (index!44831 lt!618175) mask!2840))))

(declare-fun b!1402906 () Bool)

(assert (=> b!1402906 (= e!794374 (validKeyInArray!0 lt!618178))))

(declare-fun b!1402907 () Bool)

(assert (=> b!1402907 (= e!794370 e!794371)))

(declare-fun res!941409 () Bool)

(assert (=> b!1402907 (=> res!941409 e!794371)))

(assert (=> b!1402907 (= res!941409 (or (= lt!618177 lt!618175) (not ((_ is Intermediate!10613) lt!618175))))))

(assert (=> b!1402907 (= lt!618175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618178 mask!2840) lt!618178 lt!618180 mask!2840))))

(assert (=> b!1402907 (= lt!618178 (select (store (arr!46296 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402907 (= lt!618180 (array!95892 (store (arr!46296 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46846 a!2901)))))

(declare-fun b!1402908 () Bool)

(declare-fun res!941418 () Bool)

(assert (=> b!1402908 (=> (not res!941418) (not e!794375))))

(assert (=> b!1402908 (= res!941418 (validKeyInArray!0 (select (arr!46296 a!2901) j!112)))))

(assert (= (and start!120482 res!941415) b!1402899))

(assert (= (and b!1402899 res!941413) b!1402904))

(assert (= (and b!1402904 res!941410) b!1402908))

(assert (= (and b!1402908 res!941418) b!1402902))

(assert (= (and b!1402902 res!941417) b!1402901))

(assert (= (and b!1402901 res!941419) b!1402898))

(assert (= (and b!1402898 (not res!941412)) b!1402907))

(assert (= (and b!1402907 (not res!941409)) b!1402903))

(assert (= (and b!1402903 (not res!941416)) b!1402900))

(assert (= (and b!1402900 (not res!941411)) b!1402905))

(assert (= (and b!1402905 (not res!941414)) b!1402906))

(declare-fun m!1291299 () Bool)

(assert (=> b!1402898 m!1291299))

(declare-fun m!1291301 () Bool)

(assert (=> b!1402898 m!1291301))

(assert (=> b!1402898 m!1291299))

(declare-fun m!1291303 () Bool)

(assert (=> b!1402898 m!1291303))

(assert (=> b!1402898 m!1291299))

(declare-fun m!1291305 () Bool)

(assert (=> b!1402898 m!1291305))

(declare-fun m!1291307 () Bool)

(assert (=> b!1402898 m!1291307))

(assert (=> b!1402898 m!1291299))

(declare-fun m!1291309 () Bool)

(assert (=> b!1402898 m!1291309))

(declare-fun m!1291311 () Bool)

(assert (=> b!1402902 m!1291311))

(declare-fun m!1291313 () Bool)

(assert (=> b!1402901 m!1291313))

(declare-fun m!1291315 () Bool)

(assert (=> b!1402900 m!1291315))

(declare-fun m!1291317 () Bool)

(assert (=> b!1402906 m!1291317))

(assert (=> b!1402908 m!1291299))

(assert (=> b!1402908 m!1291299))

(declare-fun m!1291319 () Bool)

(assert (=> b!1402908 m!1291319))

(declare-fun m!1291321 () Bool)

(assert (=> start!120482 m!1291321))

(declare-fun m!1291323 () Bool)

(assert (=> start!120482 m!1291323))

(assert (=> b!1402903 m!1291299))

(declare-fun m!1291325 () Bool)

(assert (=> b!1402903 m!1291325))

(assert (=> b!1402903 m!1291299))

(declare-fun m!1291327 () Bool)

(assert (=> b!1402903 m!1291327))

(declare-fun m!1291329 () Bool)

(assert (=> b!1402903 m!1291329))

(declare-fun m!1291331 () Bool)

(assert (=> b!1402903 m!1291331))

(declare-fun m!1291333 () Bool)

(assert (=> b!1402903 m!1291333))

(declare-fun m!1291335 () Bool)

(assert (=> b!1402907 m!1291335))

(assert (=> b!1402907 m!1291335))

(declare-fun m!1291337 () Bool)

(assert (=> b!1402907 m!1291337))

(assert (=> b!1402907 m!1291331))

(declare-fun m!1291339 () Bool)

(assert (=> b!1402907 m!1291339))

(declare-fun m!1291341 () Bool)

(assert (=> b!1402905 m!1291341))

(declare-fun m!1291343 () Bool)

(assert (=> b!1402904 m!1291343))

(assert (=> b!1402904 m!1291343))

(declare-fun m!1291345 () Bool)

(assert (=> b!1402904 m!1291345))

(check-sat (not b!1402905) (not b!1402903) (not b!1402901) (not b!1402898) (not b!1402906) (not b!1402904) (not b!1402900) (not b!1402908) (not b!1402907) (not start!120482) (not b!1402902))
(check-sat)
