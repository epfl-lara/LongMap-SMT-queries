; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120326 () Bool)

(assert start!120326)

(declare-fun b!1400372 () Bool)

(declare-fun res!938937 () Bool)

(declare-fun e!792868 () Bool)

(assert (=> b!1400372 (=> (not res!938937) (not e!792868))))

(declare-datatypes ((array!95688 0))(
  ( (array!95689 (arr!46195 (Array (_ BitVec 32) (_ BitVec 64))) (size!46747 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95688)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400372 (= res!938937 (validKeyInArray!0 (select (arr!46195 a!2901) i!1037)))))

(declare-fun b!1400373 () Bool)

(declare-fun res!938938 () Bool)

(assert (=> b!1400373 (=> (not res!938938) (not e!792868))))

(declare-datatypes ((List!32792 0))(
  ( (Nil!32789) (Cons!32788 (h!34036 (_ BitVec 64)) (t!47478 List!32792)) )
))
(declare-fun arrayNoDuplicates!0 (array!95688 (_ BitVec 32) List!32792) Bool)

(assert (=> b!1400373 (= res!938938 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32789))))

(declare-fun b!1400374 () Bool)

(declare-fun e!792869 () Bool)

(declare-fun e!792870 () Bool)

(assert (=> b!1400374 (= e!792869 e!792870)))

(declare-fun res!938940 () Bool)

(assert (=> b!1400374 (=> res!938940 e!792870)))

(declare-datatypes ((SeekEntryResult!10538 0))(
  ( (MissingZero!10538 (index!44529 (_ BitVec 32))) (Found!10538 (index!44530 (_ BitVec 32))) (Intermediate!10538 (undefined!11350 Bool) (index!44531 (_ BitVec 32)) (x!126170 (_ BitVec 32))) (Undefined!10538) (MissingVacant!10538 (index!44532 (_ BitVec 32))) )
))
(declare-fun lt!616025 () SeekEntryResult!10538)

(declare-fun lt!616024 () SeekEntryResult!10538)

(declare-fun lt!616030 () (_ BitVec 32))

(assert (=> b!1400374 (= res!938940 (or (bvslt (x!126170 lt!616025) #b00000000000000000000000000000000) (bvsgt (x!126170 lt!616025) #b01111111111111111111111111111110) (bvslt (x!126170 lt!616024) #b00000000000000000000000000000000) (bvsgt (x!126170 lt!616024) #b01111111111111111111111111111110) (bvslt lt!616030 #b00000000000000000000000000000000) (bvsge lt!616030 (size!46747 a!2901)) (bvslt (index!44531 lt!616025) #b00000000000000000000000000000000) (bvsge (index!44531 lt!616025) (size!46747 a!2901)) (bvslt (index!44531 lt!616024) #b00000000000000000000000000000000) (bvsge (index!44531 lt!616024) (size!46747 a!2901)) (not (= lt!616025 (Intermediate!10538 false (index!44531 lt!616025) (x!126170 lt!616025)))) (not (= lt!616024 (Intermediate!10538 false (index!44531 lt!616024) (x!126170 lt!616024))))))))

(declare-fun e!792866 () Bool)

(assert (=> b!1400374 e!792866))

(declare-fun res!938942 () Bool)

(assert (=> b!1400374 (=> (not res!938942) (not e!792866))))

(assert (=> b!1400374 (= res!938942 (and (not (undefined!11350 lt!616024)) (= (index!44531 lt!616024) i!1037) (bvslt (x!126170 lt!616024) (x!126170 lt!616025)) (= (select (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44531 lt!616024)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!46923 0))(
  ( (Unit!46924) )
))
(declare-fun lt!616028 () Unit!46923)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46923)

(assert (=> b!1400374 (= lt!616028 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616030 (x!126170 lt!616025) (index!44531 lt!616025) (x!126170 lt!616024) (index!44531 lt!616024) (undefined!11350 lt!616024) mask!2840))))

(declare-fun e!792867 () Bool)

(declare-fun b!1400375 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95688 (_ BitVec 32)) SeekEntryResult!10538)

(assert (=> b!1400375 (= e!792867 (= (seekEntryOrOpen!0 (select (arr!46195 a!2901) j!112) a!2901 mask!2840) (Found!10538 j!112)))))

(declare-fun b!1400376 () Bool)

(declare-fun res!938936 () Bool)

(assert (=> b!1400376 (=> (not res!938936) (not e!792868))))

(assert (=> b!1400376 (= res!938936 (and (= (size!46747 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46747 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46747 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400377 () Bool)

(declare-fun res!938941 () Bool)

(assert (=> b!1400377 (=> (not res!938941) (not e!792868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95688 (_ BitVec 32)) Bool)

(assert (=> b!1400377 (= res!938941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400378 () Bool)

(declare-fun res!938943 () Bool)

(assert (=> b!1400378 (=> (not res!938943) (not e!792868))))

(assert (=> b!1400378 (= res!938943 (validKeyInArray!0 (select (arr!46195 a!2901) j!112)))))

(declare-fun b!1400379 () Bool)

(assert (=> b!1400379 (= e!792870 true)))

(declare-fun lt!616027 () (_ BitVec 64))

(declare-fun lt!616026 () SeekEntryResult!10538)

(declare-fun lt!616031 () array!95688)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95688 (_ BitVec 32)) SeekEntryResult!10538)

(assert (=> b!1400379 (= lt!616026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616030 lt!616027 lt!616031 mask!2840))))

(declare-fun res!938935 () Bool)

(assert (=> start!120326 (=> (not res!938935) (not e!792868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120326 (= res!938935 (validMask!0 mask!2840))))

(assert (=> start!120326 e!792868))

(assert (=> start!120326 true))

(declare-fun array_inv!35428 (array!95688) Bool)

(assert (=> start!120326 (array_inv!35428 a!2901)))

(declare-fun b!1400380 () Bool)

(declare-fun e!792871 () Bool)

(assert (=> b!1400380 (= e!792871 e!792869)))

(declare-fun res!938944 () Bool)

(assert (=> b!1400380 (=> res!938944 e!792869)))

(get-info :version)

(assert (=> b!1400380 (= res!938944 (or (= lt!616025 lt!616024) (not ((_ is Intermediate!10538) lt!616024))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400380 (= lt!616024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616027 mask!2840) lt!616027 lt!616031 mask!2840))))

(assert (=> b!1400380 (= lt!616027 (select (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400380 (= lt!616031 (array!95689 (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46747 a!2901)))))

(declare-fun b!1400381 () Bool)

(assert (=> b!1400381 (= e!792868 (not e!792871))))

(declare-fun res!938939 () Bool)

(assert (=> b!1400381 (=> res!938939 e!792871)))

(assert (=> b!1400381 (= res!938939 (or (not ((_ is Intermediate!10538) lt!616025)) (undefined!11350 lt!616025)))))

(assert (=> b!1400381 e!792867))

(declare-fun res!938934 () Bool)

(assert (=> b!1400381 (=> (not res!938934) (not e!792867))))

(assert (=> b!1400381 (= res!938934 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616029 () Unit!46923)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46923)

(assert (=> b!1400381 (= lt!616029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400381 (= lt!616025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616030 (select (arr!46195 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400381 (= lt!616030 (toIndex!0 (select (arr!46195 a!2901) j!112) mask!2840))))

(declare-fun b!1400382 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95688 (_ BitVec 32)) SeekEntryResult!10538)

(assert (=> b!1400382 (= e!792866 (= (seekEntryOrOpen!0 lt!616027 lt!616031 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126170 lt!616024) (index!44531 lt!616024) (index!44531 lt!616024) (select (arr!46195 a!2901) j!112) lt!616031 mask!2840)))))

(assert (= (and start!120326 res!938935) b!1400376))

(assert (= (and b!1400376 res!938936) b!1400372))

(assert (= (and b!1400372 res!938937) b!1400378))

(assert (= (and b!1400378 res!938943) b!1400377))

(assert (= (and b!1400377 res!938941) b!1400373))

(assert (= (and b!1400373 res!938938) b!1400381))

(assert (= (and b!1400381 res!938934) b!1400375))

(assert (= (and b!1400381 (not res!938939)) b!1400380))

(assert (= (and b!1400380 (not res!938944)) b!1400374))

(assert (= (and b!1400374 res!938942) b!1400382))

(assert (= (and b!1400374 (not res!938940)) b!1400379))

(declare-fun m!1287373 () Bool)

(assert (=> b!1400378 m!1287373))

(assert (=> b!1400378 m!1287373))

(declare-fun m!1287375 () Bool)

(assert (=> b!1400378 m!1287375))

(declare-fun m!1287377 () Bool)

(assert (=> b!1400379 m!1287377))

(declare-fun m!1287379 () Bool)

(assert (=> b!1400380 m!1287379))

(assert (=> b!1400380 m!1287379))

(declare-fun m!1287381 () Bool)

(assert (=> b!1400380 m!1287381))

(declare-fun m!1287383 () Bool)

(assert (=> b!1400380 m!1287383))

(declare-fun m!1287385 () Bool)

(assert (=> b!1400380 m!1287385))

(declare-fun m!1287387 () Bool)

(assert (=> b!1400373 m!1287387))

(declare-fun m!1287389 () Bool)

(assert (=> start!120326 m!1287389))

(declare-fun m!1287391 () Bool)

(assert (=> start!120326 m!1287391))

(assert (=> b!1400381 m!1287373))

(declare-fun m!1287393 () Bool)

(assert (=> b!1400381 m!1287393))

(assert (=> b!1400381 m!1287373))

(assert (=> b!1400381 m!1287373))

(declare-fun m!1287395 () Bool)

(assert (=> b!1400381 m!1287395))

(declare-fun m!1287397 () Bool)

(assert (=> b!1400381 m!1287397))

(declare-fun m!1287399 () Bool)

(assert (=> b!1400381 m!1287399))

(assert (=> b!1400374 m!1287383))

(declare-fun m!1287401 () Bool)

(assert (=> b!1400374 m!1287401))

(declare-fun m!1287403 () Bool)

(assert (=> b!1400374 m!1287403))

(declare-fun m!1287405 () Bool)

(assert (=> b!1400377 m!1287405))

(declare-fun m!1287407 () Bool)

(assert (=> b!1400382 m!1287407))

(assert (=> b!1400382 m!1287373))

(assert (=> b!1400382 m!1287373))

(declare-fun m!1287409 () Bool)

(assert (=> b!1400382 m!1287409))

(assert (=> b!1400375 m!1287373))

(assert (=> b!1400375 m!1287373))

(declare-fun m!1287411 () Bool)

(assert (=> b!1400375 m!1287411))

(declare-fun m!1287413 () Bool)

(assert (=> b!1400372 m!1287413))

(assert (=> b!1400372 m!1287413))

(declare-fun m!1287415 () Bool)

(assert (=> b!1400372 m!1287415))

(check-sat (not b!1400380) (not b!1400373) (not b!1400378) (not b!1400377) (not b!1400379) (not b!1400382) (not b!1400374) (not start!120326) (not b!1400375) (not b!1400372) (not b!1400381))
(check-sat)
