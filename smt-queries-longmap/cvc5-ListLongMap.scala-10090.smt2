; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118878 () Bool)

(assert start!118878)

(declare-fun res!928854 () Bool)

(declare-fun e!786589 () Bool)

(assert (=> start!118878 (=> (not res!928854) (not e!786589))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118878 (= res!928854 (validMask!0 mask!2840))))

(assert (=> start!118878 e!786589))

(assert (=> start!118878 true))

(declare-datatypes ((array!94956 0))(
  ( (array!94957 (arr!45851 (Array (_ BitVec 32) (_ BitVec 64))) (size!46401 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94956)

(declare-fun array_inv!34879 (array!94956) Bool)

(assert (=> start!118878 (array_inv!34879 a!2901)))

(declare-fun b!1388570 () Bool)

(assert (=> b!1388570 (= e!786589 (and (bvsle #b00000000000000000000000000000000 (size!46401 a!2901)) (bvsge (size!46401 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388571 () Bool)

(declare-fun res!928855 () Bool)

(assert (=> b!1388571 (=> (not res!928855) (not e!786589))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388571 (= res!928855 (validKeyInArray!0 (select (arr!45851 a!2901) j!112)))))

(declare-fun b!1388572 () Bool)

(declare-fun res!928856 () Bool)

(assert (=> b!1388572 (=> (not res!928856) (not e!786589))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1388572 (= res!928856 (and (= (size!46401 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46401 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46401 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388573 () Bool)

(declare-fun res!928857 () Bool)

(assert (=> b!1388573 (=> (not res!928857) (not e!786589))))

(assert (=> b!1388573 (= res!928857 (validKeyInArray!0 (select (arr!45851 a!2901) i!1037)))))

(declare-fun b!1388574 () Bool)

(declare-fun res!928858 () Bool)

(assert (=> b!1388574 (=> (not res!928858) (not e!786589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94956 (_ BitVec 32)) Bool)

(assert (=> b!1388574 (= res!928858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!118878 res!928854) b!1388572))

(assert (= (and b!1388572 res!928856) b!1388573))

(assert (= (and b!1388573 res!928857) b!1388571))

(assert (= (and b!1388571 res!928855) b!1388574))

(assert (= (and b!1388574 res!928858) b!1388570))

(declare-fun m!1274319 () Bool)

(assert (=> start!118878 m!1274319))

(declare-fun m!1274321 () Bool)

(assert (=> start!118878 m!1274321))

(declare-fun m!1274323 () Bool)

(assert (=> b!1388571 m!1274323))

(assert (=> b!1388571 m!1274323))

(declare-fun m!1274325 () Bool)

(assert (=> b!1388571 m!1274325))

(declare-fun m!1274327 () Bool)

(assert (=> b!1388573 m!1274327))

(assert (=> b!1388573 m!1274327))

(declare-fun m!1274329 () Bool)

(assert (=> b!1388573 m!1274329))

(declare-fun m!1274331 () Bool)

(assert (=> b!1388574 m!1274331))

(push 1)

(assert (not b!1388571))

(assert (not b!1388573))

(assert (not b!1388574))

(assert (not start!118878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149951 () Bool)

(assert (=> d!149951 (= (validKeyInArray!0 (select (arr!45851 a!2901) j!112)) (and (not (= (select (arr!45851 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45851 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388571 d!149951))

(declare-fun d!149955 () Bool)

(assert (=> d!149955 (= (validKeyInArray!0 (select (arr!45851 a!2901) i!1037)) (and (not (= (select (arr!45851 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45851 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388573 d!149955))

(declare-fun d!149957 () Bool)

(declare-fun res!928900 () Bool)

(declare-fun e!786619 () Bool)

(assert (=> d!149957 (=> res!928900 e!786619)))

(assert (=> d!149957 (= res!928900 (bvsge #b00000000000000000000000000000000 (size!46401 a!2901)))))

(assert (=> d!149957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786619)))

(declare-fun b!1388625 () Bool)

(declare-fun e!786618 () Bool)

(declare-fun e!786620 () Bool)

(assert (=> b!1388625 (= e!786618 e!786620)))

(declare-fun lt!610374 () (_ BitVec 64))

(assert (=> b!1388625 (= lt!610374 (select (arr!45851 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46408 0))(
  ( (Unit!46409) )
))
(declare-fun lt!610373 () Unit!46408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94956 (_ BitVec 64) (_ BitVec 32)) Unit!46408)

(assert (=> b!1388625 (= lt!610373 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610374 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388625 (arrayContainsKey!0 a!2901 lt!610374 #b00000000000000000000000000000000)))

(declare-fun lt!610372 () Unit!46408)

(assert (=> b!1388625 (= lt!610372 lt!610373)))

(declare-fun res!928899 () Bool)

(declare-datatypes ((SeekEntryResult!10189 0))(
  ( (MissingZero!10189 (index!43127 (_ BitVec 32))) (Found!10189 (index!43128 (_ BitVec 32))) (Intermediate!10189 (undefined!11001 Bool) (index!43129 (_ BitVec 32)) (x!124768 (_ BitVec 32))) (Undefined!10189) (MissingVacant!10189 (index!43130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94956 (_ BitVec 32)) SeekEntryResult!10189)

