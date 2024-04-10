; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120342 () Bool)

(assert start!120342)

(declare-fun b!1400651 () Bool)

(declare-fun res!939171 () Bool)

(declare-fun e!793034 () Bool)

(assert (=> b!1400651 (=> (not res!939171) (not e!793034))))

(declare-datatypes ((array!95751 0))(
  ( (array!95752 (arr!46226 (Array (_ BitVec 32) (_ BitVec 64))) (size!46776 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95751)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95751 (_ BitVec 32)) Bool)

(assert (=> b!1400651 (= res!939171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400652 () Bool)

(declare-fun e!793035 () Bool)

(assert (=> b!1400652 (= e!793034 (not e!793035))))

(declare-fun res!939170 () Bool)

(assert (=> b!1400652 (=> res!939170 e!793035)))

(declare-datatypes ((SeekEntryResult!10543 0))(
  ( (MissingZero!10543 (index!44549 (_ BitVec 32))) (Found!10543 (index!44550 (_ BitVec 32))) (Intermediate!10543 (undefined!11355 Bool) (index!44551 (_ BitVec 32)) (x!126194 (_ BitVec 32))) (Undefined!10543) (MissingVacant!10543 (index!44552 (_ BitVec 32))) )
))
(declare-fun lt!616364 () SeekEntryResult!10543)

(assert (=> b!1400652 (= res!939170 (or (not (is-Intermediate!10543 lt!616364)) (undefined!11355 lt!616364)))))

(declare-fun e!793037 () Bool)

(assert (=> b!1400652 e!793037))

(declare-fun res!939166 () Bool)

(assert (=> b!1400652 (=> (not res!939166) (not e!793037))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400652 (= res!939166 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47090 0))(
  ( (Unit!47091) )
))
(declare-fun lt!616361 () Unit!47090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47090)

(assert (=> b!1400652 (= lt!616361 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616360 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95751 (_ BitVec 32)) SeekEntryResult!10543)

(assert (=> b!1400652 (= lt!616364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616360 (select (arr!46226 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400652 (= lt!616360 (toIndex!0 (select (arr!46226 a!2901) j!112) mask!2840))))

(declare-fun b!1400653 () Bool)

(declare-fun e!793033 () Bool)

(assert (=> b!1400653 (= e!793035 e!793033)))

(declare-fun res!939168 () Bool)

(assert (=> b!1400653 (=> res!939168 e!793033)))

(declare-fun lt!616359 () SeekEntryResult!10543)

(assert (=> b!1400653 (= res!939168 (or (= lt!616364 lt!616359) (not (is-Intermediate!10543 lt!616359))))))

(declare-fun lt!616365 () (_ BitVec 64))

(declare-fun lt!616363 () array!95751)

(assert (=> b!1400653 (= lt!616359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616365 mask!2840) lt!616365 lt!616363 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400653 (= lt!616365 (select (store (arr!46226 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400653 (= lt!616363 (array!95752 (store (arr!46226 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46776 a!2901)))))

(declare-fun b!1400655 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95751 (_ BitVec 32)) SeekEntryResult!10543)

(assert (=> b!1400655 (= e!793037 (= (seekEntryOrOpen!0 (select (arr!46226 a!2901) j!112) a!2901 mask!2840) (Found!10543 j!112)))))

(declare-fun b!1400656 () Bool)

(declare-fun e!793031 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95751 (_ BitVec 32)) SeekEntryResult!10543)

(assert (=> b!1400656 (= e!793031 (= (seekEntryOrOpen!0 lt!616365 lt!616363 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126194 lt!616359) (index!44551 lt!616359) (index!44551 lt!616359) (select (arr!46226 a!2901) j!112) lt!616363 mask!2840)))))

(declare-fun b!1400657 () Bool)

(declare-fun e!793036 () Bool)

(assert (=> b!1400657 (= e!793033 e!793036)))

(declare-fun res!939163 () Bool)

(assert (=> b!1400657 (=> res!939163 e!793036)))

(assert (=> b!1400657 (= res!939163 (or (bvslt (x!126194 lt!616364) #b00000000000000000000000000000000) (bvsgt (x!126194 lt!616364) #b01111111111111111111111111111110) (bvslt (x!126194 lt!616359) #b00000000000000000000000000000000) (bvsgt (x!126194 lt!616359) #b01111111111111111111111111111110) (bvslt lt!616360 #b00000000000000000000000000000000) (bvsge lt!616360 (size!46776 a!2901)) (bvslt (index!44551 lt!616364) #b00000000000000000000000000000000) (bvsge (index!44551 lt!616364) (size!46776 a!2901)) (bvslt (index!44551 lt!616359) #b00000000000000000000000000000000) (bvsge (index!44551 lt!616359) (size!46776 a!2901)) (not (= lt!616364 (Intermediate!10543 false (index!44551 lt!616364) (x!126194 lt!616364)))) (not (= lt!616359 (Intermediate!10543 false (index!44551 lt!616359) (x!126194 lt!616359))))))))

(assert (=> b!1400657 e!793031))

(declare-fun res!939169 () Bool)

(assert (=> b!1400657 (=> (not res!939169) (not e!793031))))

(assert (=> b!1400657 (= res!939169 (and (not (undefined!11355 lt!616359)) (= (index!44551 lt!616359) i!1037) (bvslt (x!126194 lt!616359) (x!126194 lt!616364)) (= (select (store (arr!46226 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44551 lt!616359)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616362 () Unit!47090)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47090)

(assert (=> b!1400657 (= lt!616362 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616360 (x!126194 lt!616364) (index!44551 lt!616364) (x!126194 lt!616359) (index!44551 lt!616359) (undefined!11355 lt!616359) mask!2840))))

(declare-fun b!1400658 () Bool)

(declare-fun res!939162 () Bool)

(assert (=> b!1400658 (=> (not res!939162) (not e!793034))))

(assert (=> b!1400658 (= res!939162 (and (= (size!46776 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46776 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46776 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400659 () Bool)

(declare-fun res!939167 () Bool)

(assert (=> b!1400659 (=> (not res!939167) (not e!793034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400659 (= res!939167 (validKeyInArray!0 (select (arr!46226 a!2901) i!1037)))))

(declare-fun res!939172 () Bool)

(assert (=> start!120342 (=> (not res!939172) (not e!793034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120342 (= res!939172 (validMask!0 mask!2840))))

(assert (=> start!120342 e!793034))

(assert (=> start!120342 true))

(declare-fun array_inv!35254 (array!95751) Bool)

(assert (=> start!120342 (array_inv!35254 a!2901)))

(declare-fun b!1400654 () Bool)

(declare-fun res!939164 () Bool)

(assert (=> b!1400654 (=> (not res!939164) (not e!793034))))

(assert (=> b!1400654 (= res!939164 (validKeyInArray!0 (select (arr!46226 a!2901) j!112)))))

(declare-fun b!1400660 () Bool)

(declare-fun res!939165 () Bool)

(assert (=> b!1400660 (=> (not res!939165) (not e!793034))))

(declare-datatypes ((List!32745 0))(
  ( (Nil!32742) (Cons!32741 (h!33989 (_ BitVec 64)) (t!47439 List!32745)) )
))
(declare-fun arrayNoDuplicates!0 (array!95751 (_ BitVec 32) List!32745) Bool)

(assert (=> b!1400660 (= res!939165 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32742))))

(declare-fun b!1400661 () Bool)

(assert (=> b!1400661 (= e!793036 true)))

(declare-fun lt!616358 () SeekEntryResult!10543)

(assert (=> b!1400661 (= lt!616358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616360 lt!616365 lt!616363 mask!2840))))

(assert (= (and start!120342 res!939172) b!1400658))

(assert (= (and b!1400658 res!939162) b!1400659))

(assert (= (and b!1400659 res!939167) b!1400654))

(assert (= (and b!1400654 res!939164) b!1400651))

(assert (= (and b!1400651 res!939171) b!1400660))

(assert (= (and b!1400660 res!939165) b!1400652))

(assert (= (and b!1400652 res!939166) b!1400655))

(assert (= (and b!1400652 (not res!939170)) b!1400653))

(assert (= (and b!1400653 (not res!939168)) b!1400657))

(assert (= (and b!1400657 res!939169) b!1400656))

(assert (= (and b!1400657 (not res!939163)) b!1400661))

(declare-fun m!1288173 () Bool)

(assert (=> b!1400660 m!1288173))

(declare-fun m!1288175 () Bool)

(assert (=> b!1400657 m!1288175))

(declare-fun m!1288177 () Bool)

(assert (=> b!1400657 m!1288177))

(declare-fun m!1288179 () Bool)

(assert (=> b!1400657 m!1288179))

(declare-fun m!1288181 () Bool)

(assert (=> start!120342 m!1288181))

(declare-fun m!1288183 () Bool)

(assert (=> start!120342 m!1288183))

(declare-fun m!1288185 () Bool)

(assert (=> b!1400653 m!1288185))

(assert (=> b!1400653 m!1288185))

(declare-fun m!1288187 () Bool)

(assert (=> b!1400653 m!1288187))

(assert (=> b!1400653 m!1288175))

(declare-fun m!1288189 () Bool)

(assert (=> b!1400653 m!1288189))

(declare-fun m!1288191 () Bool)

(assert (=> b!1400655 m!1288191))

(assert (=> b!1400655 m!1288191))

(declare-fun m!1288193 () Bool)

(assert (=> b!1400655 m!1288193))

(declare-fun m!1288195 () Bool)

(assert (=> b!1400656 m!1288195))

(assert (=> b!1400656 m!1288191))

(assert (=> b!1400656 m!1288191))

(declare-fun m!1288197 () Bool)

(assert (=> b!1400656 m!1288197))

(assert (=> b!1400652 m!1288191))

(declare-fun m!1288199 () Bool)

(assert (=> b!1400652 m!1288199))

(assert (=> b!1400652 m!1288191))

(assert (=> b!1400652 m!1288191))

(declare-fun m!1288201 () Bool)

(assert (=> b!1400652 m!1288201))

(declare-fun m!1288203 () Bool)

(assert (=> b!1400652 m!1288203))

(declare-fun m!1288205 () Bool)

(assert (=> b!1400652 m!1288205))

(declare-fun m!1288207 () Bool)

(assert (=> b!1400651 m!1288207))

(declare-fun m!1288209 () Bool)

(assert (=> b!1400661 m!1288209))

(declare-fun m!1288211 () Bool)

(assert (=> b!1400659 m!1288211))

(assert (=> b!1400659 m!1288211))

(declare-fun m!1288213 () Bool)

(assert (=> b!1400659 m!1288213))

(assert (=> b!1400654 m!1288191))

(assert (=> b!1400654 m!1288191))

(declare-fun m!1288215 () Bool)

(assert (=> b!1400654 m!1288215))

(push 1)

