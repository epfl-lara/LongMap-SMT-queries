; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93072 () Bool)

(assert start!93072)

(declare-fun b!1055599 () Bool)

(declare-fun e!599777 () Bool)

(declare-fun e!599774 () Bool)

(assert (=> b!1055599 (= e!599777 e!599774)))

(declare-fun res!703742 () Bool)

(assert (=> b!1055599 (=> (not res!703742) (not e!599774))))

(declare-datatypes ((array!66547 0))(
  ( (array!66548 (arr!31999 (Array (_ BitVec 32) (_ BitVec 64))) (size!32536 (_ BitVec 32))) )
))
(declare-fun lt!465873 () array!66547)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055599 (= res!703742 (arrayContainsKey!0 lt!465873 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66547)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055599 (= lt!465873 (array!66548 (store (arr!31999 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32536 a!3488)))))

(declare-fun b!1055600 () Bool)

(declare-fun e!599773 () Bool)

(assert (=> b!1055600 (= e!599774 e!599773)))

(declare-fun res!703735 () Bool)

(assert (=> b!1055600 (=> (not res!703735) (not e!599773))))

(declare-fun lt!465875 () (_ BitVec 32))

(assert (=> b!1055600 (= res!703735 (not (= lt!465875 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66547 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055600 (= lt!465875 (arrayScanForKey!0 lt!465873 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055602 () Bool)

(declare-fun e!599775 () Bool)

(assert (=> b!1055602 (= e!599775 true)))

(declare-datatypes ((List!22281 0))(
  ( (Nil!22278) (Cons!22277 (h!23495 (_ BitVec 64)) (t!31580 List!22281)) )
))
(declare-fun arrayNoDuplicates!0 (array!66547 (_ BitVec 32) List!22281) Bool)

(assert (=> b!1055602 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22278)))

(declare-datatypes ((Unit!34525 0))(
  ( (Unit!34526) )
))
(declare-fun lt!465874 () Unit!34525)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66547 (_ BitVec 32) (_ BitVec 32)) Unit!34525)

(assert (=> b!1055602 (= lt!465874 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055603 () Bool)

(declare-fun e!599779 () Bool)

(declare-fun e!599776 () Bool)

(assert (=> b!1055603 (= e!599779 e!599776)))

(declare-fun res!703736 () Bool)

(assert (=> b!1055603 (=> res!703736 e!599776)))

(assert (=> b!1055603 (= res!703736 (bvsle lt!465875 i!1381))))

(declare-fun b!1055604 () Bool)

(assert (=> b!1055604 (= e!599776 (arrayContainsKey!0 a!3488 k0!2747 lt!465875))))

(declare-fun b!1055605 () Bool)

(declare-fun res!703740 () Bool)

(assert (=> b!1055605 (=> (not res!703740) (not e!599777))))

(assert (=> b!1055605 (= res!703740 (= (select (arr!31999 a!3488) i!1381) k0!2747))))

(declare-fun b!1055606 () Bool)

(declare-fun res!703737 () Bool)

(assert (=> b!1055606 (=> (not res!703737) (not e!599777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055606 (= res!703737 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055607 () Bool)

(assert (=> b!1055607 (= e!599773 (not e!599775))))

(declare-fun res!703739 () Bool)

(assert (=> b!1055607 (=> res!703739 e!599775)))

(assert (=> b!1055607 (= res!703739 (bvsle lt!465875 i!1381))))

(assert (=> b!1055607 e!599779))

(declare-fun res!703738 () Bool)

(assert (=> b!1055607 (=> (not res!703738) (not e!599779))))

(assert (=> b!1055607 (= res!703738 (= (select (store (arr!31999 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465875) k0!2747))))

(declare-fun res!703734 () Bool)

(assert (=> start!93072 (=> (not res!703734) (not e!599777))))

(assert (=> start!93072 (= res!703734 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32536 a!3488)) (bvslt (size!32536 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93072 e!599777))

(assert (=> start!93072 true))

(declare-fun array_inv!24781 (array!66547) Bool)

(assert (=> start!93072 (array_inv!24781 a!3488)))

(declare-fun b!1055601 () Bool)

(declare-fun res!703741 () Bool)

(assert (=> b!1055601 (=> (not res!703741) (not e!599777))))

(assert (=> b!1055601 (= res!703741 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22278))))

(assert (= (and start!93072 res!703734) b!1055601))

(assert (= (and b!1055601 res!703741) b!1055606))

(assert (= (and b!1055606 res!703737) b!1055605))

(assert (= (and b!1055605 res!703740) b!1055599))

(assert (= (and b!1055599 res!703742) b!1055600))

(assert (= (and b!1055600 res!703735) b!1055607))

(assert (= (and b!1055607 res!703738) b!1055603))

(assert (= (and b!1055603 (not res!703736)) b!1055604))

(assert (= (and b!1055607 (not res!703739)) b!1055602))

(declare-fun m!976049 () Bool)

(assert (=> b!1055602 m!976049))

(declare-fun m!976051 () Bool)

(assert (=> b!1055602 m!976051))

(declare-fun m!976053 () Bool)

(assert (=> b!1055607 m!976053))

(declare-fun m!976055 () Bool)

(assert (=> b!1055607 m!976055))

(declare-fun m!976057 () Bool)

(assert (=> b!1055605 m!976057))

(declare-fun m!976059 () Bool)

(assert (=> b!1055599 m!976059))

(assert (=> b!1055599 m!976053))

(declare-fun m!976061 () Bool)

(assert (=> start!93072 m!976061))

(declare-fun m!976063 () Bool)

(assert (=> b!1055600 m!976063))

(declare-fun m!976065 () Bool)

(assert (=> b!1055601 m!976065))

(declare-fun m!976067 () Bool)

(assert (=> b!1055604 m!976067))

(declare-fun m!976069 () Bool)

(assert (=> b!1055606 m!976069))

(check-sat (not b!1055600) (not b!1055602) (not b!1055606) (not b!1055599) (not start!93072) (not b!1055604) (not b!1055601))
(check-sat)
