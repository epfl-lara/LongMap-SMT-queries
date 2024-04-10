; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120350 () Bool)

(assert start!120350)

(declare-fun b!1400783 () Bool)

(declare-fun res!939302 () Bool)

(declare-fun e!793121 () Bool)

(assert (=> b!1400783 (=> (not res!939302) (not e!793121))))

(declare-datatypes ((array!95759 0))(
  ( (array!95760 (arr!46230 (Array (_ BitVec 32) (_ BitVec 64))) (size!46780 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95759)

(declare-datatypes ((List!32749 0))(
  ( (Nil!32746) (Cons!32745 (h!33993 (_ BitVec 64)) (t!47443 List!32749)) )
))
(declare-fun arrayNoDuplicates!0 (array!95759 (_ BitVec 32) List!32749) Bool)

(assert (=> b!1400783 (= res!939302 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32746))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1400784 () Bool)

(declare-fun e!793116 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10547 0))(
  ( (MissingZero!10547 (index!44565 (_ BitVec 32))) (Found!10547 (index!44566 (_ BitVec 32))) (Intermediate!10547 (undefined!11359 Bool) (index!44567 (_ BitVec 32)) (x!126206 (_ BitVec 32))) (Undefined!10547) (MissingVacant!10547 (index!44568 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95759 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1400784 (= e!793116 (= (seekEntryOrOpen!0 (select (arr!46230 a!2901) j!112) a!2901 mask!2840) (Found!10547 j!112)))))

(declare-fun b!1400785 () Bool)

(declare-fun e!793115 () Bool)

(assert (=> b!1400785 (= e!793115 true)))

(declare-fun lt!616455 () (_ BitVec 64))

(declare-fun lt!616460 () array!95759)

(declare-fun lt!616457 () SeekEntryResult!10547)

(declare-fun lt!616459 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95759 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1400785 (= lt!616457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616459 lt!616455 lt!616460 mask!2840))))

(declare-fun b!1400786 () Bool)

(declare-fun res!939304 () Bool)

(assert (=> b!1400786 (=> (not res!939304) (not e!793121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400786 (= res!939304 (validKeyInArray!0 (select (arr!46230 a!2901) j!112)))))

(declare-fun b!1400787 () Bool)

(declare-fun res!939294 () Bool)

(assert (=> b!1400787 (=> (not res!939294) (not e!793121))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400787 (= res!939294 (and (= (size!46780 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46780 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46780 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400788 () Bool)

(declare-fun e!793117 () Bool)

(assert (=> b!1400788 (= e!793121 (not e!793117))))

(declare-fun res!939296 () Bool)

(assert (=> b!1400788 (=> res!939296 e!793117)))

(declare-fun lt!616454 () SeekEntryResult!10547)

(get-info :version)

(assert (=> b!1400788 (= res!939296 (or (not ((_ is Intermediate!10547) lt!616454)) (undefined!11359 lt!616454)))))

(assert (=> b!1400788 e!793116))

(declare-fun res!939295 () Bool)

(assert (=> b!1400788 (=> (not res!939295) (not e!793116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95759 (_ BitVec 32)) Bool)

(assert (=> b!1400788 (= res!939295 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47098 0))(
  ( (Unit!47099) )
))
(declare-fun lt!616458 () Unit!47098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47098)

(assert (=> b!1400788 (= lt!616458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400788 (= lt!616454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616459 (select (arr!46230 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400788 (= lt!616459 (toIndex!0 (select (arr!46230 a!2901) j!112) mask!2840))))

(declare-fun b!1400789 () Bool)

(declare-fun e!793118 () Bool)

(assert (=> b!1400789 (= e!793117 e!793118)))

(declare-fun res!939301 () Bool)

(assert (=> b!1400789 (=> res!939301 e!793118)))

(declare-fun lt!616456 () SeekEntryResult!10547)

(assert (=> b!1400789 (= res!939301 (or (= lt!616454 lt!616456) (not ((_ is Intermediate!10547) lt!616456))))))

(assert (=> b!1400789 (= lt!616456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616455 mask!2840) lt!616455 lt!616460 mask!2840))))

(assert (=> b!1400789 (= lt!616455 (select (store (arr!46230 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400789 (= lt!616460 (array!95760 (store (arr!46230 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46780 a!2901)))))

(declare-fun b!1400790 () Bool)

(declare-fun res!939299 () Bool)

(assert (=> b!1400790 (=> (not res!939299) (not e!793121))))

(assert (=> b!1400790 (= res!939299 (validKeyInArray!0 (select (arr!46230 a!2901) i!1037)))))

(declare-fun e!793120 () Bool)

(declare-fun b!1400791 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95759 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1400791 (= e!793120 (= (seekEntryOrOpen!0 lt!616455 lt!616460 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126206 lt!616456) (index!44567 lt!616456) (index!44567 lt!616456) (select (arr!46230 a!2901) j!112) lt!616460 mask!2840)))))

(declare-fun b!1400792 () Bool)

(declare-fun res!939297 () Bool)

(assert (=> b!1400792 (=> (not res!939297) (not e!793121))))

(assert (=> b!1400792 (= res!939297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400793 () Bool)

(assert (=> b!1400793 (= e!793118 e!793115)))

(declare-fun res!939298 () Bool)

(assert (=> b!1400793 (=> res!939298 e!793115)))

(assert (=> b!1400793 (= res!939298 (or (bvslt (x!126206 lt!616454) #b00000000000000000000000000000000) (bvsgt (x!126206 lt!616454) #b01111111111111111111111111111110) (bvslt (x!126206 lt!616456) #b00000000000000000000000000000000) (bvsgt (x!126206 lt!616456) #b01111111111111111111111111111110) (bvslt lt!616459 #b00000000000000000000000000000000) (bvsge lt!616459 (size!46780 a!2901)) (bvslt (index!44567 lt!616454) #b00000000000000000000000000000000) (bvsge (index!44567 lt!616454) (size!46780 a!2901)) (bvslt (index!44567 lt!616456) #b00000000000000000000000000000000) (bvsge (index!44567 lt!616456) (size!46780 a!2901)) (not (= lt!616454 (Intermediate!10547 false (index!44567 lt!616454) (x!126206 lt!616454)))) (not (= lt!616456 (Intermediate!10547 false (index!44567 lt!616456) (x!126206 lt!616456))))))))

(assert (=> b!1400793 e!793120))

(declare-fun res!939303 () Bool)

(assert (=> b!1400793 (=> (not res!939303) (not e!793120))))

(assert (=> b!1400793 (= res!939303 (and (not (undefined!11359 lt!616456)) (= (index!44567 lt!616456) i!1037) (bvslt (x!126206 lt!616456) (x!126206 lt!616454)) (= (select (store (arr!46230 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44567 lt!616456)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616461 () Unit!47098)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47098)

(assert (=> b!1400793 (= lt!616461 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616459 (x!126206 lt!616454) (index!44567 lt!616454) (x!126206 lt!616456) (index!44567 lt!616456) (undefined!11359 lt!616456) mask!2840))))

(declare-fun res!939300 () Bool)

(assert (=> start!120350 (=> (not res!939300) (not e!793121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120350 (= res!939300 (validMask!0 mask!2840))))

(assert (=> start!120350 e!793121))

(assert (=> start!120350 true))

(declare-fun array_inv!35258 (array!95759) Bool)

(assert (=> start!120350 (array_inv!35258 a!2901)))

(assert (= (and start!120350 res!939300) b!1400787))

(assert (= (and b!1400787 res!939294) b!1400790))

(assert (= (and b!1400790 res!939299) b!1400786))

(assert (= (and b!1400786 res!939304) b!1400792))

(assert (= (and b!1400792 res!939297) b!1400783))

(assert (= (and b!1400783 res!939302) b!1400788))

(assert (= (and b!1400788 res!939295) b!1400784))

(assert (= (and b!1400788 (not res!939296)) b!1400789))

(assert (= (and b!1400789 (not res!939301)) b!1400793))

(assert (= (and b!1400793 res!939303) b!1400791))

(assert (= (and b!1400793 (not res!939298)) b!1400785))

(declare-fun m!1288349 () Bool)

(assert (=> b!1400789 m!1288349))

(assert (=> b!1400789 m!1288349))

(declare-fun m!1288351 () Bool)

(assert (=> b!1400789 m!1288351))

(declare-fun m!1288353 () Bool)

(assert (=> b!1400789 m!1288353))

(declare-fun m!1288355 () Bool)

(assert (=> b!1400789 m!1288355))

(declare-fun m!1288357 () Bool)

(assert (=> b!1400786 m!1288357))

(assert (=> b!1400786 m!1288357))

(declare-fun m!1288359 () Bool)

(assert (=> b!1400786 m!1288359))

(declare-fun m!1288361 () Bool)

(assert (=> b!1400785 m!1288361))

(assert (=> b!1400788 m!1288357))

(declare-fun m!1288363 () Bool)

(assert (=> b!1400788 m!1288363))

(assert (=> b!1400788 m!1288357))

(declare-fun m!1288365 () Bool)

(assert (=> b!1400788 m!1288365))

(assert (=> b!1400788 m!1288357))

(declare-fun m!1288367 () Bool)

(assert (=> b!1400788 m!1288367))

(declare-fun m!1288369 () Bool)

(assert (=> b!1400788 m!1288369))

(declare-fun m!1288371 () Bool)

(assert (=> b!1400790 m!1288371))

(assert (=> b!1400790 m!1288371))

(declare-fun m!1288373 () Bool)

(assert (=> b!1400790 m!1288373))

(declare-fun m!1288375 () Bool)

(assert (=> b!1400783 m!1288375))

(assert (=> b!1400784 m!1288357))

(assert (=> b!1400784 m!1288357))

(declare-fun m!1288377 () Bool)

(assert (=> b!1400784 m!1288377))

(declare-fun m!1288379 () Bool)

(assert (=> start!120350 m!1288379))

(declare-fun m!1288381 () Bool)

(assert (=> start!120350 m!1288381))

(declare-fun m!1288383 () Bool)

(assert (=> b!1400791 m!1288383))

(assert (=> b!1400791 m!1288357))

(assert (=> b!1400791 m!1288357))

(declare-fun m!1288385 () Bool)

(assert (=> b!1400791 m!1288385))

(assert (=> b!1400793 m!1288353))

(declare-fun m!1288387 () Bool)

(assert (=> b!1400793 m!1288387))

(declare-fun m!1288389 () Bool)

(assert (=> b!1400793 m!1288389))

(declare-fun m!1288391 () Bool)

(assert (=> b!1400792 m!1288391))

(check-sat (not b!1400783) (not b!1400790) (not b!1400788) (not b!1400791) (not b!1400786) (not b!1400784) (not start!120350) (not b!1400789) (not b!1400785) (not b!1400792) (not b!1400793))
(check-sat)
