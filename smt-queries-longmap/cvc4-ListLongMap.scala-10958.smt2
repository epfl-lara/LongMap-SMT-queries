; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128260 () Bool)

(assert start!128260)

(declare-fun b!1505545 () Bool)

(declare-fun e!841464 () Bool)

(declare-datatypes ((array!100413 0))(
  ( (array!100414 (arr!48457 (Array (_ BitVec 32) (_ BitVec 64))) (size!49007 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100413)

(assert (=> b!1505545 (= e!841464 (and (bvsle #b00000000000000000000000000000000 (size!49007 a!2804)) (bvsge (size!49007 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505546 () Bool)

(declare-fun res!1025992 () Bool)

(assert (=> b!1505546 (=> (not res!1025992) (not e!841464))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100413 (_ BitVec 32)) Bool)

(assert (=> b!1505546 (= res!1025992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505547 () Bool)

(declare-fun res!1025995 () Bool)

(assert (=> b!1505547 (=> (not res!1025995) (not e!841464))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505547 (= res!1025995 (and (= (size!49007 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49007 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49007 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505548 () Bool)

(declare-fun res!1025991 () Bool)

(assert (=> b!1505548 (=> (not res!1025991) (not e!841464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505548 (= res!1025991 (validKeyInArray!0 (select (arr!48457 a!2804) j!70)))))

(declare-fun b!1505549 () Bool)

(declare-fun res!1025994 () Bool)

(assert (=> b!1505549 (=> (not res!1025994) (not e!841464))))

(assert (=> b!1505549 (= res!1025994 (validKeyInArray!0 (select (arr!48457 a!2804) i!961)))))

(declare-fun res!1025993 () Bool)

(assert (=> start!128260 (=> (not res!1025993) (not e!841464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128260 (= res!1025993 (validMask!0 mask!2512))))

(assert (=> start!128260 e!841464))

(assert (=> start!128260 true))

(declare-fun array_inv!37485 (array!100413) Bool)

(assert (=> start!128260 (array_inv!37485 a!2804)))

(assert (= (and start!128260 res!1025993) b!1505547))

(assert (= (and b!1505547 res!1025995) b!1505549))

(assert (= (and b!1505549 res!1025994) b!1505548))

(assert (= (and b!1505548 res!1025991) b!1505546))

(assert (= (and b!1505546 res!1025992) b!1505545))

(declare-fun m!1388639 () Bool)

(assert (=> b!1505546 m!1388639))

(declare-fun m!1388641 () Bool)

(assert (=> b!1505548 m!1388641))

(assert (=> b!1505548 m!1388641))

(declare-fun m!1388643 () Bool)

(assert (=> b!1505548 m!1388643))

(declare-fun m!1388645 () Bool)

(assert (=> b!1505549 m!1388645))

(assert (=> b!1505549 m!1388645))

(declare-fun m!1388647 () Bool)

(assert (=> b!1505549 m!1388647))

(declare-fun m!1388649 () Bool)

(assert (=> start!128260 m!1388649))

(declare-fun m!1388651 () Bool)

(assert (=> start!128260 m!1388651))

(push 1)

(assert (not b!1505546))

(assert (not start!128260))

(assert (not b!1505549))

(assert (not b!1505548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1505570 () Bool)

(declare-fun e!841481 () Bool)

(declare-fun e!841482 () Bool)

(assert (=> b!1505570 (= e!841481 e!841482)))

(declare-fun c!139315 () Bool)

(assert (=> b!1505570 (= c!139315 (validKeyInArray!0 (select (arr!48457 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505571 () Bool)

(declare-fun e!841480 () Bool)

(declare-fun call!68180 () Bool)

(assert (=> b!1505571 (= e!841480 call!68180)))

(declare-fun bm!68177 () Bool)

(assert (=> bm!68177 (= call!68180 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505573 () Bool)

(assert (=> b!1505573 (= e!841482 e!841480)))

(declare-fun lt!654037 () (_ BitVec 64))

(assert (=> b!1505573 (= lt!654037 (select (arr!48457 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50302 0))(
  ( (Unit!50303) )
))
(declare-fun lt!654036 () Unit!50302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100413 (_ BitVec 64) (_ BitVec 32)) Unit!50302)

(assert (=> b!1505573 (= lt!654036 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654037 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505573 (arrayContainsKey!0 a!2804 lt!654037 #b00000000000000000000000000000000)))

(declare-fun lt!654035 () Unit!50302)

(assert (=> b!1505573 (= lt!654035 lt!654036)))

(declare-fun res!1026006 () Bool)

