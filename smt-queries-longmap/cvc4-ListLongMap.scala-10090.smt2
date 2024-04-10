; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118882 () Bool)

(assert start!118882)

(declare-fun b!1388600 () Bool)

(declare-fun res!928885 () Bool)

(declare-fun e!786601 () Bool)

(assert (=> b!1388600 (=> (not res!928885) (not e!786601))))

(declare-datatypes ((array!94960 0))(
  ( (array!94961 (arr!45853 (Array (_ BitVec 32) (_ BitVec 64))) (size!46403 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94960)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388600 (= res!928885 (validKeyInArray!0 (select (arr!45853 a!2901) i!1037)))))

(declare-fun b!1388601 () Bool)

(declare-fun res!928886 () Bool)

(assert (=> b!1388601 (=> (not res!928886) (not e!786601))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388601 (= res!928886 (validKeyInArray!0 (select (arr!45853 a!2901) j!112)))))

(declare-fun b!1388602 () Bool)

(declare-fun res!928887 () Bool)

(assert (=> b!1388602 (=> (not res!928887) (not e!786601))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1388602 (= res!928887 (and (= (size!46403 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46403 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46403 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388603 () Bool)

(declare-fun res!928888 () Bool)

(assert (=> b!1388603 (=> (not res!928888) (not e!786601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94960 (_ BitVec 32)) Bool)

(assert (=> b!1388603 (= res!928888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!928884 () Bool)

(assert (=> start!118882 (=> (not res!928884) (not e!786601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118882 (= res!928884 (validMask!0 mask!2840))))

(assert (=> start!118882 e!786601))

(assert (=> start!118882 true))

(declare-fun array_inv!34881 (array!94960) Bool)

(assert (=> start!118882 (array_inv!34881 a!2901)))

(declare-fun b!1388604 () Bool)

(assert (=> b!1388604 (= e!786601 (and (bvsle #b00000000000000000000000000000000 (size!46403 a!2901)) (bvsge (size!46403 a!2901) #b01111111111111111111111111111111)))))

(assert (= (and start!118882 res!928884) b!1388602))

(assert (= (and b!1388602 res!928887) b!1388600))

(assert (= (and b!1388600 res!928885) b!1388601))

(assert (= (and b!1388601 res!928886) b!1388603))

(assert (= (and b!1388603 res!928888) b!1388604))

(declare-fun m!1274347 () Bool)

(assert (=> b!1388600 m!1274347))

(assert (=> b!1388600 m!1274347))

(declare-fun m!1274349 () Bool)

(assert (=> b!1388600 m!1274349))

(declare-fun m!1274351 () Bool)

(assert (=> b!1388601 m!1274351))

(assert (=> b!1388601 m!1274351))

(declare-fun m!1274353 () Bool)

(assert (=> b!1388601 m!1274353))

(declare-fun m!1274355 () Bool)

(assert (=> b!1388603 m!1274355))

(declare-fun m!1274357 () Bool)

(assert (=> start!118882 m!1274357))

(declare-fun m!1274359 () Bool)

(assert (=> start!118882 m!1274359))

(push 1)

(assert (not b!1388600))

(assert (not start!118882))

(assert (not b!1388601))

(assert (not b!1388603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149953 () Bool)

(assert (=> d!149953 (= (validKeyInArray!0 (select (arr!45853 a!2901) i!1037)) (and (not (= (select (arr!45853 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45853 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388600 d!149953))

(declare-fun d!149959 () Bool)

(assert (=> d!149959 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118882 d!149959))

(declare-fun d!149969 () Bool)

(assert (=> d!149969 (= (array_inv!34881 a!2901) (bvsge (size!46403 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118882 d!149969))

(declare-fun d!149971 () Bool)

(assert (=> d!149971 (= (validKeyInArray!0 (select (arr!45853 a!2901) j!112)) (and (not (= (select (arr!45853 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45853 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388601 d!149971))

(declare-fun b!1388638 () Bool)

(declare-fun e!786627 () Bool)

(declare-fun call!66643 () Bool)

(assert (=> b!1388638 (= e!786627 call!66643)))

(declare-fun b!1388639 () Bool)

(declare-fun e!786629 () Bool)

(assert (=> b!1388639 (= e!786629 e!786627)))

(declare-fun lt!610381 () (_ BitVec 64))

(assert (=> b!1388639 (= lt!610381 (select (arr!45853 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46410 0))(
  ( (Unit!46411) )
))
(declare-fun lt!610383 () Unit!46410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94960 (_ BitVec 64) (_ BitVec 32)) Unit!46410)

(assert (=> b!1388639 (= lt!610383 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610381 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388639 (arrayContainsKey!0 a!2901 lt!610381 #b00000000000000000000000000000000)))

