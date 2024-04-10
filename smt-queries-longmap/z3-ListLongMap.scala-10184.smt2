; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120032 () Bool)

(assert start!120032)

(declare-fun b!1397392 () Bool)

(declare-fun e!791105 () Bool)

(assert (=> b!1397392 (= e!791105 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10451 0))(
  ( (MissingZero!10451 (index!44175 (_ BitVec 32))) (Found!10451 (index!44176 (_ BitVec 32))) (Intermediate!10451 (undefined!11263 Bool) (index!44177 (_ BitVec 32)) (x!125833 (_ BitVec 32))) (Undefined!10451) (MissingVacant!10451 (index!44178 (_ BitVec 32))) )
))
(declare-fun lt!614171 () SeekEntryResult!10451)

(declare-fun lt!614167 () (_ BitVec 64))

(declare-datatypes ((array!95561 0))(
  ( (array!95562 (arr!46134 (Array (_ BitVec 32) (_ BitVec 64))) (size!46684 (_ BitVec 32))) )
))
(declare-fun lt!614166 () array!95561)

(declare-fun lt!614172 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95561 (_ BitVec 32)) SeekEntryResult!10451)

(assert (=> b!1397392 (= lt!614171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614172 lt!614167 lt!614166 mask!2840))))

(declare-fun b!1397393 () Bool)

(declare-fun e!791108 () Bool)

(declare-fun e!791106 () Bool)

(assert (=> b!1397393 (= e!791108 (not e!791106))))

(declare-fun res!936309 () Bool)

(assert (=> b!1397393 (=> res!936309 e!791106)))

(declare-fun lt!614168 () SeekEntryResult!10451)

(get-info :version)

(assert (=> b!1397393 (= res!936309 (or (not ((_ is Intermediate!10451) lt!614168)) (undefined!11263 lt!614168)))))

(declare-fun e!791104 () Bool)

(assert (=> b!1397393 e!791104))

(declare-fun res!936311 () Bool)

(assert (=> b!1397393 (=> (not res!936311) (not e!791104))))

(declare-fun a!2901 () array!95561)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95561 (_ BitVec 32)) Bool)

(assert (=> b!1397393 (= res!936311 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46906 0))(
  ( (Unit!46907) )
))
(declare-fun lt!614170 () Unit!46906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46906)

(assert (=> b!1397393 (= lt!614170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397393 (= lt!614168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614172 (select (arr!46134 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397393 (= lt!614172 (toIndex!0 (select (arr!46134 a!2901) j!112) mask!2840))))

(declare-fun b!1397394 () Bool)

(assert (=> b!1397394 (= e!791106 e!791105)))

(declare-fun res!936306 () Bool)

(assert (=> b!1397394 (=> res!936306 e!791105)))

(declare-fun lt!614169 () SeekEntryResult!10451)

(assert (=> b!1397394 (= res!936306 (or (= lt!614168 lt!614169) (not ((_ is Intermediate!10451) lt!614169)) (bvslt (x!125833 lt!614168) #b00000000000000000000000000000000) (bvsgt (x!125833 lt!614168) #b01111111111111111111111111111110) (bvslt lt!614172 #b00000000000000000000000000000000) (bvsge lt!614172 (size!46684 a!2901)) (bvslt (index!44177 lt!614168) #b00000000000000000000000000000000) (bvsge (index!44177 lt!614168) (size!46684 a!2901)) (not (= lt!614168 (Intermediate!10451 false (index!44177 lt!614168) (x!125833 lt!614168)))) (not (= lt!614169 (Intermediate!10451 (undefined!11263 lt!614169) (index!44177 lt!614169) (x!125833 lt!614169))))))))

(assert (=> b!1397394 (= lt!614169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614167 mask!2840) lt!614167 lt!614166 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397394 (= lt!614167 (select (store (arr!46134 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397394 (= lt!614166 (array!95562 (store (arr!46134 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46684 a!2901)))))

(declare-fun b!1397395 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95561 (_ BitVec 32)) SeekEntryResult!10451)

(assert (=> b!1397395 (= e!791104 (= (seekEntryOrOpen!0 (select (arr!46134 a!2901) j!112) a!2901 mask!2840) (Found!10451 j!112)))))

(declare-fun b!1397396 () Bool)

(declare-fun res!936308 () Bool)

(assert (=> b!1397396 (=> (not res!936308) (not e!791108))))

(assert (=> b!1397396 (= res!936308 (and (= (size!46684 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46684 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46684 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397397 () Bool)

(declare-fun res!936313 () Bool)

(assert (=> b!1397397 (=> (not res!936313) (not e!791108))))

(declare-datatypes ((List!32653 0))(
  ( (Nil!32650) (Cons!32649 (h!33891 (_ BitVec 64)) (t!47347 List!32653)) )
))
(declare-fun arrayNoDuplicates!0 (array!95561 (_ BitVec 32) List!32653) Bool)

(assert (=> b!1397397 (= res!936313 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32650))))

(declare-fun res!936312 () Bool)

(assert (=> start!120032 (=> (not res!936312) (not e!791108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120032 (= res!936312 (validMask!0 mask!2840))))

(assert (=> start!120032 e!791108))

(assert (=> start!120032 true))

(declare-fun array_inv!35162 (array!95561) Bool)

(assert (=> start!120032 (array_inv!35162 a!2901)))

(declare-fun b!1397398 () Bool)

(declare-fun res!936307 () Bool)

(assert (=> b!1397398 (=> (not res!936307) (not e!791108))))

(assert (=> b!1397398 (= res!936307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397399 () Bool)

(declare-fun res!936305 () Bool)

(assert (=> b!1397399 (=> (not res!936305) (not e!791108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397399 (= res!936305 (validKeyInArray!0 (select (arr!46134 a!2901) j!112)))))

(declare-fun b!1397400 () Bool)

(declare-fun res!936310 () Bool)

(assert (=> b!1397400 (=> (not res!936310) (not e!791108))))

(assert (=> b!1397400 (= res!936310 (validKeyInArray!0 (select (arr!46134 a!2901) i!1037)))))

(assert (= (and start!120032 res!936312) b!1397396))

(assert (= (and b!1397396 res!936308) b!1397400))

(assert (= (and b!1397400 res!936310) b!1397399))

(assert (= (and b!1397399 res!936305) b!1397398))

(assert (= (and b!1397398 res!936307) b!1397397))

(assert (= (and b!1397397 res!936313) b!1397393))

(assert (= (and b!1397393 res!936311) b!1397395))

(assert (= (and b!1397393 (not res!936309)) b!1397394))

(assert (= (and b!1397394 (not res!936306)) b!1397392))

(declare-fun m!1284147 () Bool)

(assert (=> b!1397392 m!1284147))

(declare-fun m!1284149 () Bool)

(assert (=> b!1397397 m!1284149))

(declare-fun m!1284151 () Bool)

(assert (=> b!1397394 m!1284151))

(assert (=> b!1397394 m!1284151))

(declare-fun m!1284153 () Bool)

(assert (=> b!1397394 m!1284153))

(declare-fun m!1284155 () Bool)

(assert (=> b!1397394 m!1284155))

(declare-fun m!1284157 () Bool)

(assert (=> b!1397394 m!1284157))

(declare-fun m!1284159 () Bool)

(assert (=> start!120032 m!1284159))

(declare-fun m!1284161 () Bool)

(assert (=> start!120032 m!1284161))

(declare-fun m!1284163 () Bool)

(assert (=> b!1397399 m!1284163))

(assert (=> b!1397399 m!1284163))

(declare-fun m!1284165 () Bool)

(assert (=> b!1397399 m!1284165))

(assert (=> b!1397395 m!1284163))

(assert (=> b!1397395 m!1284163))

(declare-fun m!1284167 () Bool)

(assert (=> b!1397395 m!1284167))

(assert (=> b!1397393 m!1284163))

(declare-fun m!1284169 () Bool)

(assert (=> b!1397393 m!1284169))

(assert (=> b!1397393 m!1284163))

(declare-fun m!1284171 () Bool)

(assert (=> b!1397393 m!1284171))

(assert (=> b!1397393 m!1284163))

(declare-fun m!1284173 () Bool)

(assert (=> b!1397393 m!1284173))

(declare-fun m!1284175 () Bool)

(assert (=> b!1397393 m!1284175))

(declare-fun m!1284177 () Bool)

(assert (=> b!1397400 m!1284177))

(assert (=> b!1397400 m!1284177))

(declare-fun m!1284179 () Bool)

(assert (=> b!1397400 m!1284179))

(declare-fun m!1284181 () Bool)

(assert (=> b!1397398 m!1284181))

(check-sat (not b!1397392) (not b!1397395) (not b!1397399) (not b!1397394) (not b!1397398) (not b!1397397) (not b!1397400) (not start!120032) (not b!1397393))
(check-sat)
