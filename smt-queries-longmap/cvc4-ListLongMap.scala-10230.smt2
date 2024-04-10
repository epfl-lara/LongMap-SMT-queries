; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120436 () Bool)

(assert start!120436)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95845 0))(
  ( (array!95846 (arr!46273 (Array (_ BitVec 32) (_ BitVec 64))) (size!46823 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95845)

(declare-fun e!794018 () Bool)

(declare-fun b!1402202 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10590 0))(
  ( (MissingZero!10590 (index!44737 (_ BitVec 32))) (Found!10590 (index!44738 (_ BitVec 32))) (Intermediate!10590 (undefined!11402 Bool) (index!44739 (_ BitVec 32)) (x!126361 (_ BitVec 32))) (Undefined!10590) (MissingVacant!10590 (index!44740 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95845 (_ BitVec 32)) SeekEntryResult!10590)

(assert (=> b!1402202 (= e!794018 (= (seekEntryOrOpen!0 (select (arr!46273 a!2901) j!112) a!2901 mask!2840) (Found!10590 j!112)))))

(declare-fun b!1402203 () Bool)

(declare-fun e!794022 () Bool)

(declare-fun e!794019 () Bool)

(assert (=> b!1402203 (= e!794022 e!794019)))

(declare-fun res!940722 () Bool)

(assert (=> b!1402203 (=> res!940722 e!794019)))

(declare-fun lt!617486 () SeekEntryResult!10590)

(declare-fun lt!617491 () SeekEntryResult!10590)

(assert (=> b!1402203 (= res!940722 (or (= lt!617486 lt!617491) (not (is-Intermediate!10590 lt!617491))))))

(declare-fun lt!617492 () array!95845)

(declare-fun lt!617493 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95845 (_ BitVec 32)) SeekEntryResult!10590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402203 (= lt!617491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617493 mask!2840) lt!617493 lt!617492 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402203 (= lt!617493 (select (store (arr!46273 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402203 (= lt!617492 (array!95846 (store (arr!46273 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46823 a!2901)))))

(declare-fun b!1402204 () Bool)

(declare-fun res!940721 () Bool)

(declare-fun e!794021 () Bool)

(assert (=> b!1402204 (=> (not res!940721) (not e!794021))))

(assert (=> b!1402204 (= res!940721 (and (= (size!46823 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46823 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46823 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402205 () Bool)

(declare-fun e!794020 () Bool)

(assert (=> b!1402205 (= e!794019 e!794020)))

(declare-fun res!940714 () Bool)

(assert (=> b!1402205 (=> res!940714 e!794020)))

(declare-fun lt!617488 () (_ BitVec 32))

(assert (=> b!1402205 (= res!940714 (or (bvslt (x!126361 lt!617486) #b00000000000000000000000000000000) (bvsgt (x!126361 lt!617486) #b01111111111111111111111111111110) (bvslt (x!126361 lt!617491) #b00000000000000000000000000000000) (bvsgt (x!126361 lt!617491) #b01111111111111111111111111111110) (bvslt lt!617488 #b00000000000000000000000000000000) (bvsge lt!617488 (size!46823 a!2901)) (bvslt (index!44739 lt!617486) #b00000000000000000000000000000000) (bvsge (index!44739 lt!617486) (size!46823 a!2901)) (bvslt (index!44739 lt!617491) #b00000000000000000000000000000000) (bvsge (index!44739 lt!617491) (size!46823 a!2901)) (not (= lt!617486 (Intermediate!10590 false (index!44739 lt!617486) (x!126361 lt!617486)))) (not (= lt!617491 (Intermediate!10590 false (index!44739 lt!617491) (x!126361 lt!617491))))))))

(declare-fun e!794024 () Bool)

(assert (=> b!1402205 e!794024))

(declare-fun res!940723 () Bool)

(assert (=> b!1402205 (=> (not res!940723) (not e!794024))))

(assert (=> b!1402205 (= res!940723 (and (not (undefined!11402 lt!617491)) (= (index!44739 lt!617491) i!1037) (bvslt (x!126361 lt!617491) (x!126361 lt!617486)) (= (select (store (arr!46273 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44739 lt!617491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47184 0))(
  ( (Unit!47185) )
))
(declare-fun lt!617489 () Unit!47184)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47184)

(assert (=> b!1402205 (= lt!617489 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617488 (x!126361 lt!617486) (index!44739 lt!617486) (x!126361 lt!617491) (index!44739 lt!617491) (undefined!11402 lt!617491) mask!2840))))

(declare-fun b!1402206 () Bool)

(declare-fun res!940716 () Bool)

(assert (=> b!1402206 (=> (not res!940716) (not e!794021))))

(declare-datatypes ((List!32792 0))(
  ( (Nil!32789) (Cons!32788 (h!34036 (_ BitVec 64)) (t!47486 List!32792)) )
))
(declare-fun arrayNoDuplicates!0 (array!95845 (_ BitVec 32) List!32792) Bool)

(assert (=> b!1402206 (= res!940716 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32789))))

(declare-fun b!1402207 () Bool)

(declare-fun res!940715 () Bool)

(assert (=> b!1402207 (=> (not res!940715) (not e!794021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402207 (= res!940715 (validKeyInArray!0 (select (arr!46273 a!2901) j!112)))))

(declare-fun b!1402208 () Bool)

(assert (=> b!1402208 (= e!794020 true)))

(declare-fun lt!617487 () SeekEntryResult!10590)

(assert (=> b!1402208 (= lt!617487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617488 lt!617493 lt!617492 mask!2840))))

(declare-fun b!1402209 () Bool)

(declare-fun res!940720 () Bool)

(assert (=> b!1402209 (=> (not res!940720) (not e!794021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95845 (_ BitVec 32)) Bool)

(assert (=> b!1402209 (= res!940720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402210 () Bool)

(declare-fun res!940717 () Bool)

(assert (=> b!1402210 (=> (not res!940717) (not e!794021))))

(assert (=> b!1402210 (= res!940717 (validKeyInArray!0 (select (arr!46273 a!2901) i!1037)))))

(declare-fun res!940719 () Bool)

(assert (=> start!120436 (=> (not res!940719) (not e!794021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120436 (= res!940719 (validMask!0 mask!2840))))

(assert (=> start!120436 e!794021))

(assert (=> start!120436 true))

(declare-fun array_inv!35301 (array!95845) Bool)

(assert (=> start!120436 (array_inv!35301 a!2901)))

(declare-fun b!1402211 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95845 (_ BitVec 32)) SeekEntryResult!10590)

(assert (=> b!1402211 (= e!794024 (= (seekEntryOrOpen!0 lt!617493 lt!617492 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126361 lt!617491) (index!44739 lt!617491) (index!44739 lt!617491) (select (arr!46273 a!2901) j!112) lt!617492 mask!2840)))))

(declare-fun b!1402212 () Bool)

(assert (=> b!1402212 (= e!794021 (not e!794022))))

(declare-fun res!940718 () Bool)

(assert (=> b!1402212 (=> res!940718 e!794022)))

(assert (=> b!1402212 (= res!940718 (or (not (is-Intermediate!10590 lt!617486)) (undefined!11402 lt!617486)))))

(assert (=> b!1402212 e!794018))

(declare-fun res!940713 () Bool)

(assert (=> b!1402212 (=> (not res!940713) (not e!794018))))

(assert (=> b!1402212 (= res!940713 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617490 () Unit!47184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47184)

(assert (=> b!1402212 (= lt!617490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402212 (= lt!617486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617488 (select (arr!46273 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402212 (= lt!617488 (toIndex!0 (select (arr!46273 a!2901) j!112) mask!2840))))

(assert (= (and start!120436 res!940719) b!1402204))

(assert (= (and b!1402204 res!940721) b!1402210))

(assert (= (and b!1402210 res!940717) b!1402207))

(assert (= (and b!1402207 res!940715) b!1402209))

(assert (= (and b!1402209 res!940720) b!1402206))

(assert (= (and b!1402206 res!940716) b!1402212))

(assert (= (and b!1402212 res!940713) b!1402202))

(assert (= (and b!1402212 (not res!940718)) b!1402203))

(assert (= (and b!1402203 (not res!940722)) b!1402205))

(assert (= (and b!1402205 res!940723) b!1402211))

(assert (= (and b!1402205 (not res!940714)) b!1402208))

(declare-fun m!1290241 () Bool)

(assert (=> b!1402206 m!1290241))

(declare-fun m!1290243 () Bool)

(assert (=> b!1402212 m!1290243))

(declare-fun m!1290245 () Bool)

(assert (=> b!1402212 m!1290245))

(assert (=> b!1402212 m!1290243))

(declare-fun m!1290247 () Bool)

(assert (=> b!1402212 m!1290247))

(assert (=> b!1402212 m!1290243))

(declare-fun m!1290249 () Bool)

(assert (=> b!1402212 m!1290249))

(declare-fun m!1290251 () Bool)

(assert (=> b!1402212 m!1290251))

(assert (=> b!1402207 m!1290243))

(assert (=> b!1402207 m!1290243))

(declare-fun m!1290253 () Bool)

(assert (=> b!1402207 m!1290253))

(assert (=> b!1402202 m!1290243))

(assert (=> b!1402202 m!1290243))

(declare-fun m!1290255 () Bool)

(assert (=> b!1402202 m!1290255))

(declare-fun m!1290257 () Bool)

(assert (=> b!1402208 m!1290257))

(declare-fun m!1290259 () Bool)

(assert (=> start!120436 m!1290259))

(declare-fun m!1290261 () Bool)

(assert (=> start!120436 m!1290261))

(declare-fun m!1290263 () Bool)

(assert (=> b!1402203 m!1290263))

(assert (=> b!1402203 m!1290263))

(declare-fun m!1290265 () Bool)

(assert (=> b!1402203 m!1290265))

(declare-fun m!1290267 () Bool)

(assert (=> b!1402203 m!1290267))

(declare-fun m!1290269 () Bool)

(assert (=> b!1402203 m!1290269))

(declare-fun m!1290271 () Bool)

(assert (=> b!1402210 m!1290271))

(assert (=> b!1402210 m!1290271))

(declare-fun m!1290273 () Bool)

(assert (=> b!1402210 m!1290273))

(declare-fun m!1290275 () Bool)

(assert (=> b!1402209 m!1290275))

(declare-fun m!1290277 () Bool)

(assert (=> b!1402211 m!1290277))

(assert (=> b!1402211 m!1290243))

(assert (=> b!1402211 m!1290243))

(declare-fun m!1290279 () Bool)

(assert (=> b!1402211 m!1290279))

(assert (=> b!1402205 m!1290267))

(declare-fun m!1290281 () Bool)

(assert (=> b!1402205 m!1290281))

(declare-fun m!1290283 () Bool)

(assert (=> b!1402205 m!1290283))

(push 1)

