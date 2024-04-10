; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118912 () Bool)

(assert start!118912)

(declare-fun b!1388689 () Bool)

(declare-fun res!928956 () Bool)

(declare-fun e!786647 () Bool)

(assert (=> b!1388689 (=> (not res!928956) (not e!786647))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!94969 0))(
  ( (array!94970 (arr!45856 (Array (_ BitVec 32) (_ BitVec 64))) (size!46406 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94969)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388689 (= res!928956 (and (= (size!46406 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46406 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46406 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388690 () Bool)

(declare-fun res!928959 () Bool)

(assert (=> b!1388690 (=> (not res!928959) (not e!786647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94969 (_ BitVec 32)) Bool)

(assert (=> b!1388690 (= res!928959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388691 () Bool)

(declare-datatypes ((List!32375 0))(
  ( (Nil!32372) (Cons!32371 (h!33586 (_ BitVec 64)) (t!47069 List!32375)) )
))
(declare-fun noDuplicate!2602 (List!32375) Bool)

(assert (=> b!1388691 (= e!786647 (not (noDuplicate!2602 Nil!32372)))))

(declare-fun res!928955 () Bool)

(assert (=> start!118912 (=> (not res!928955) (not e!786647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118912 (= res!928955 (validMask!0 mask!2840))))

(assert (=> start!118912 e!786647))

(assert (=> start!118912 true))

(declare-fun array_inv!34884 (array!94969) Bool)

(assert (=> start!118912 (array_inv!34884 a!2901)))

(declare-fun b!1388692 () Bool)

(declare-fun res!928958 () Bool)

(assert (=> b!1388692 (=> (not res!928958) (not e!786647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388692 (= res!928958 (validKeyInArray!0 (select (arr!45856 a!2901) i!1037)))))

(declare-fun b!1388693 () Bool)

(declare-fun res!928957 () Bool)

(assert (=> b!1388693 (=> (not res!928957) (not e!786647))))

(assert (=> b!1388693 (= res!928957 (and (bvsle #b00000000000000000000000000000000 (size!46406 a!2901)) (bvslt (size!46406 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388694 () Bool)

(declare-fun res!928960 () Bool)

(assert (=> b!1388694 (=> (not res!928960) (not e!786647))))

(assert (=> b!1388694 (= res!928960 (validKeyInArray!0 (select (arr!45856 a!2901) j!112)))))

(assert (= (and start!118912 res!928955) b!1388689))

(assert (= (and b!1388689 res!928956) b!1388692))

(assert (= (and b!1388692 res!928958) b!1388694))

(assert (= (and b!1388694 res!928960) b!1388690))

(assert (= (and b!1388690 res!928959) b!1388693))

(assert (= (and b!1388693 res!928957) b!1388691))

(declare-fun m!1274429 () Bool)

(assert (=> b!1388691 m!1274429))

(declare-fun m!1274431 () Bool)

(assert (=> start!118912 m!1274431))

(declare-fun m!1274433 () Bool)

(assert (=> start!118912 m!1274433))

(declare-fun m!1274435 () Bool)

(assert (=> b!1388692 m!1274435))

(assert (=> b!1388692 m!1274435))

(declare-fun m!1274437 () Bool)

(assert (=> b!1388692 m!1274437))

(declare-fun m!1274439 () Bool)

(assert (=> b!1388694 m!1274439))

(assert (=> b!1388694 m!1274439))

(declare-fun m!1274441 () Bool)

(assert (=> b!1388694 m!1274441))

(declare-fun m!1274443 () Bool)

(assert (=> b!1388690 m!1274443))

(push 1)

(assert (not b!1388691))

(assert (not start!118912))

(assert (not b!1388692))

(assert (not b!1388694))

(assert (not b!1388690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149989 () Bool)

(declare-fun res!928971 () Bool)

(declare-fun e!786662 () Bool)

(assert (=> d!149989 (=> res!928971 e!786662)))

(assert (=> d!149989 (= res!928971 (bvsge #b00000000000000000000000000000000 (size!46406 a!2901)))))

(assert (=> d!149989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786662)))

(declare-fun b!1388709 () Bool)

(declare-fun e!786660 () Bool)

(assert (=> b!1388709 (= e!786662 e!786660)))

(declare-fun c!129312 () Bool)

(assert (=> b!1388709 (= c!129312 (validKeyInArray!0 (select (arr!45856 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388710 () Bool)

(declare-fun e!786661 () Bool)

(declare-fun call!66646 () Bool)

(assert (=> b!1388710 (= e!786661 call!66646)))

(declare-fun b!1388711 () Bool)

(assert (=> b!1388711 (= e!786660 e!786661)))

(declare-fun lt!610390 () (_ BitVec 64))

(assert (=> b!1388711 (= lt!610390 (select (arr!45856 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46414 0))(
  ( (Unit!46415) )
))
(declare-fun lt!610392 () Unit!46414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94969 (_ BitVec 64) (_ BitVec 32)) Unit!46414)

(assert (=> b!1388711 (= lt!610392 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610390 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388711 (arrayContainsKey!0 a!2901 lt!610390 #b00000000000000000000000000000000)))

(declare-fun lt!610391 () Unit!46414)

(assert (=> b!1388711 (= lt!610391 lt!610392)))

(declare-fun res!928972 () Bool)

(declare-datatypes ((SeekEntryResult!10191 0))(
  ( (MissingZero!10191 (index!43135 (_ BitVec 32))) (Found!10191 (index!43136 (_ BitVec 32))) (Intermediate!10191 (undefined!11003 Bool) (index!43137 (_ BitVec 32)) (x!124778 (_ BitVec 32))) (Undefined!10191) (MissingVacant!10191 (index!43138 (_ BitVec 32))) )
))
