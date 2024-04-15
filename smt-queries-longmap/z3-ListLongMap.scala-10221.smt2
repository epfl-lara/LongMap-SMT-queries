; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120374 () Bool)

(assert start!120374)

(declare-fun b!1401164 () Bool)

(declare-fun res!939735 () Bool)

(declare-fun e!793375 () Bool)

(assert (=> b!1401164 (=> (not res!939735) (not e!793375))))

(declare-datatypes ((array!95736 0))(
  ( (array!95737 (arr!46219 (Array (_ BitVec 32) (_ BitVec 64))) (size!46771 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95736)

(declare-datatypes ((List!32816 0))(
  ( (Nil!32813) (Cons!32812 (h!34060 (_ BitVec 64)) (t!47502 List!32816)) )
))
(declare-fun arrayNoDuplicates!0 (array!95736 (_ BitVec 32) List!32816) Bool)

(assert (=> b!1401164 (= res!939735 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32813))))

(declare-fun b!1401165 () Bool)

(declare-fun res!939726 () Bool)

(assert (=> b!1401165 (=> (not res!939726) (not e!793375))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401165 (= res!939726 (and (= (size!46771 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46771 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46771 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!939727 () Bool)

(assert (=> start!120374 (=> (not res!939727) (not e!793375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120374 (= res!939727 (validMask!0 mask!2840))))

(assert (=> start!120374 e!793375))

(assert (=> start!120374 true))

(declare-fun array_inv!35452 (array!95736) Bool)

(assert (=> start!120374 (array_inv!35452 a!2901)))

(declare-fun b!1401166 () Bool)

(declare-fun res!939731 () Bool)

(assert (=> b!1401166 (=> (not res!939731) (not e!793375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95736 (_ BitVec 32)) Bool)

(assert (=> b!1401166 (= res!939731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401167 () Bool)

(declare-fun e!793370 () Bool)

(declare-fun e!793372 () Bool)

(assert (=> b!1401167 (= e!793370 e!793372)))

(declare-fun res!939732 () Bool)

(assert (=> b!1401167 (=> res!939732 e!793372)))

(declare-datatypes ((SeekEntryResult!10562 0))(
  ( (MissingZero!10562 (index!44625 (_ BitVec 32))) (Found!10562 (index!44626 (_ BitVec 32))) (Intermediate!10562 (undefined!11374 Bool) (index!44627 (_ BitVec 32)) (x!126258 (_ BitVec 32))) (Undefined!10562) (MissingVacant!10562 (index!44628 (_ BitVec 32))) )
))
(declare-fun lt!616601 () SeekEntryResult!10562)

(declare-fun lt!616600 () SeekEntryResult!10562)

(get-info :version)

(assert (=> b!1401167 (= res!939732 (or (= lt!616601 lt!616600) (not ((_ is Intermediate!10562) lt!616600))))))

(declare-fun lt!616604 () (_ BitVec 64))

(declare-fun lt!616606 () array!95736)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95736 (_ BitVec 32)) SeekEntryResult!10562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401167 (= lt!616600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616604 mask!2840) lt!616604 lt!616606 mask!2840))))

(assert (=> b!1401167 (= lt!616604 (select (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401167 (= lt!616606 (array!95737 (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46771 a!2901)))))

(declare-fun e!793371 () Bool)

(declare-fun b!1401168 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95736 (_ BitVec 32)) SeekEntryResult!10562)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95736 (_ BitVec 32)) SeekEntryResult!10562)

(assert (=> b!1401168 (= e!793371 (= (seekEntryOrOpen!0 lt!616604 lt!616606 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126258 lt!616600) (index!44627 lt!616600) (index!44627 lt!616600) (select (arr!46219 a!2901) j!112) lt!616606 mask!2840)))))

(declare-fun b!1401169 () Bool)

(declare-fun res!939736 () Bool)

(assert (=> b!1401169 (=> (not res!939736) (not e!793375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401169 (= res!939736 (validKeyInArray!0 (select (arr!46219 a!2901) j!112)))))

(declare-fun b!1401170 () Bool)

(declare-fun res!939733 () Bool)

(assert (=> b!1401170 (=> (not res!939733) (not e!793375))))

(assert (=> b!1401170 (= res!939733 (validKeyInArray!0 (select (arr!46219 a!2901) i!1037)))))

(declare-fun b!1401171 () Bool)

(declare-fun e!793374 () Bool)

(assert (=> b!1401171 (= e!793374 true)))

(declare-fun lt!616602 () (_ BitVec 32))

(declare-fun lt!616607 () SeekEntryResult!10562)

(assert (=> b!1401171 (= lt!616607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616602 lt!616604 lt!616606 mask!2840))))

(declare-fun b!1401172 () Bool)

(assert (=> b!1401172 (= e!793372 e!793374)))

(declare-fun res!939728 () Bool)

(assert (=> b!1401172 (=> res!939728 e!793374)))

(assert (=> b!1401172 (= res!939728 (or (bvslt (x!126258 lt!616601) #b00000000000000000000000000000000) (bvsgt (x!126258 lt!616601) #b01111111111111111111111111111110) (bvslt (x!126258 lt!616600) #b00000000000000000000000000000000) (bvsgt (x!126258 lt!616600) #b01111111111111111111111111111110) (bvslt lt!616602 #b00000000000000000000000000000000) (bvsge lt!616602 (size!46771 a!2901)) (bvslt (index!44627 lt!616601) #b00000000000000000000000000000000) (bvsge (index!44627 lt!616601) (size!46771 a!2901)) (bvslt (index!44627 lt!616600) #b00000000000000000000000000000000) (bvsge (index!44627 lt!616600) (size!46771 a!2901)) (not (= lt!616601 (Intermediate!10562 false (index!44627 lt!616601) (x!126258 lt!616601)))) (not (= lt!616600 (Intermediate!10562 false (index!44627 lt!616600) (x!126258 lt!616600))))))))

(assert (=> b!1401172 e!793371))

(declare-fun res!939734 () Bool)

(assert (=> b!1401172 (=> (not res!939734) (not e!793371))))

(assert (=> b!1401172 (= res!939734 (and (not (undefined!11374 lt!616600)) (= (index!44627 lt!616600) i!1037) (bvslt (x!126258 lt!616600) (x!126258 lt!616601)) (= (select (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44627 lt!616600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46971 0))(
  ( (Unit!46972) )
))
(declare-fun lt!616603 () Unit!46971)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46971)

(assert (=> b!1401172 (= lt!616603 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616602 (x!126258 lt!616601) (index!44627 lt!616601) (x!126258 lt!616600) (index!44627 lt!616600) (undefined!11374 lt!616600) mask!2840))))

(declare-fun e!793376 () Bool)

(declare-fun b!1401173 () Bool)

(assert (=> b!1401173 (= e!793376 (= (seekEntryOrOpen!0 (select (arr!46219 a!2901) j!112) a!2901 mask!2840) (Found!10562 j!112)))))

(declare-fun b!1401174 () Bool)

(assert (=> b!1401174 (= e!793375 (not e!793370))))

(declare-fun res!939730 () Bool)

(assert (=> b!1401174 (=> res!939730 e!793370)))

(assert (=> b!1401174 (= res!939730 (or (not ((_ is Intermediate!10562) lt!616601)) (undefined!11374 lt!616601)))))

(assert (=> b!1401174 e!793376))

(declare-fun res!939729 () Bool)

(assert (=> b!1401174 (=> (not res!939729) (not e!793376))))

(assert (=> b!1401174 (= res!939729 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616605 () Unit!46971)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46971)

(assert (=> b!1401174 (= lt!616605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401174 (= lt!616601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616602 (select (arr!46219 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401174 (= lt!616602 (toIndex!0 (select (arr!46219 a!2901) j!112) mask!2840))))

(assert (= (and start!120374 res!939727) b!1401165))

(assert (= (and b!1401165 res!939726) b!1401170))

(assert (= (and b!1401170 res!939733) b!1401169))

(assert (= (and b!1401169 res!939736) b!1401166))

(assert (= (and b!1401166 res!939731) b!1401164))

(assert (= (and b!1401164 res!939735) b!1401174))

(assert (= (and b!1401174 res!939729) b!1401173))

(assert (= (and b!1401174 (not res!939730)) b!1401167))

(assert (= (and b!1401167 (not res!939732)) b!1401172))

(assert (= (and b!1401172 res!939734) b!1401168))

(assert (= (and b!1401172 (not res!939728)) b!1401171))

(declare-fun m!1288429 () Bool)

(assert (=> b!1401168 m!1288429))

(declare-fun m!1288431 () Bool)

(assert (=> b!1401168 m!1288431))

(assert (=> b!1401168 m!1288431))

(declare-fun m!1288433 () Bool)

(assert (=> b!1401168 m!1288433))

(declare-fun m!1288435 () Bool)

(assert (=> b!1401166 m!1288435))

(declare-fun m!1288437 () Bool)

(assert (=> b!1401170 m!1288437))

(assert (=> b!1401170 m!1288437))

(declare-fun m!1288439 () Bool)

(assert (=> b!1401170 m!1288439))

(declare-fun m!1288441 () Bool)

(assert (=> start!120374 m!1288441))

(declare-fun m!1288443 () Bool)

(assert (=> start!120374 m!1288443))

(declare-fun m!1288445 () Bool)

(assert (=> b!1401167 m!1288445))

(assert (=> b!1401167 m!1288445))

(declare-fun m!1288447 () Bool)

(assert (=> b!1401167 m!1288447))

(declare-fun m!1288449 () Bool)

(assert (=> b!1401167 m!1288449))

(declare-fun m!1288451 () Bool)

(assert (=> b!1401167 m!1288451))

(assert (=> b!1401174 m!1288431))

(declare-fun m!1288453 () Bool)

(assert (=> b!1401174 m!1288453))

(assert (=> b!1401174 m!1288431))

(assert (=> b!1401174 m!1288431))

(declare-fun m!1288455 () Bool)

(assert (=> b!1401174 m!1288455))

(declare-fun m!1288457 () Bool)

(assert (=> b!1401174 m!1288457))

(declare-fun m!1288459 () Bool)

(assert (=> b!1401174 m!1288459))

(assert (=> b!1401169 m!1288431))

(assert (=> b!1401169 m!1288431))

(declare-fun m!1288461 () Bool)

(assert (=> b!1401169 m!1288461))

(declare-fun m!1288463 () Bool)

(assert (=> b!1401164 m!1288463))

(declare-fun m!1288465 () Bool)

(assert (=> b!1401171 m!1288465))

(assert (=> b!1401172 m!1288449))

(declare-fun m!1288467 () Bool)

(assert (=> b!1401172 m!1288467))

(declare-fun m!1288469 () Bool)

(assert (=> b!1401172 m!1288469))

(assert (=> b!1401173 m!1288431))

(assert (=> b!1401173 m!1288431))

(declare-fun m!1288471 () Bool)

(assert (=> b!1401173 m!1288471))

(check-sat (not b!1401168) (not b!1401172) (not b!1401174) (not b!1401171) (not b!1401173) (not b!1401164) (not b!1401166) (not start!120374) (not b!1401167) (not b!1401170) (not b!1401169))
(check-sat)
