; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131038 () Bool)

(assert start!131038)

(declare-fun b!1537717 () Bool)

(declare-fun res!1054987 () Bool)

(declare-fun e!855631 () Bool)

(assert (=> b!1537717 (=> (not res!1054987) (not e!855631))))

(declare-datatypes ((array!102134 0))(
  ( (array!102135 (arr!49284 (Array (_ BitVec 32) (_ BitVec 64))) (size!49836 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102134)

(declare-datatypes ((List!35836 0))(
  ( (Nil!35833) (Cons!35832 (h!37278 (_ BitVec 64)) (t!50522 List!35836)) )
))
(declare-fun arrayNoDuplicates!0 (array!102134 (_ BitVec 32) List!35836) Bool)

(assert (=> b!1537717 (= res!1054987 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35833))))

(declare-fun b!1537718 () Bool)

(declare-fun res!1054993 () Bool)

(assert (=> b!1537718 (=> (not res!1054993) (not e!855631))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537718 (= res!1054993 (validKeyInArray!0 (select (arr!49284 a!2792) j!64)))))

(declare-fun b!1537719 () Bool)

(declare-fun res!1054991 () Bool)

(assert (=> b!1537719 (=> (not res!1054991) (not e!855631))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537719 (= res!1054991 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49836 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49836 a!2792)) (= (select (arr!49284 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537721 () Bool)

(declare-fun res!1054992 () Bool)

(assert (=> b!1537721 (=> (not res!1054992) (not e!855631))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102134 (_ BitVec 32)) Bool)

(assert (=> b!1537721 (= res!1054992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537722 () Bool)

(assert (=> b!1537722 (= e!855631 false)))

(declare-datatypes ((SeekEntryResult!13435 0))(
  ( (MissingZero!13435 (index!56135 (_ BitVec 32))) (Found!13435 (index!56136 (_ BitVec 32))) (Intermediate!13435 (undefined!14247 Bool) (index!56137 (_ BitVec 32)) (x!137864 (_ BitVec 32))) (Undefined!13435) (MissingVacant!13435 (index!56138 (_ BitVec 32))) )
))
(declare-fun lt!664533 () SeekEntryResult!13435)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102134 (_ BitVec 32)) SeekEntryResult!13435)

(assert (=> b!1537722 (= lt!664533 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49284 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537723 () Bool)

(declare-fun res!1054989 () Bool)

(assert (=> b!1537723 (=> (not res!1054989) (not e!855631))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537723 (= res!1054989 (validKeyInArray!0 (select (arr!49284 a!2792) i!951)))))

(declare-fun res!1054988 () Bool)

(assert (=> start!131038 (=> (not res!1054988) (not e!855631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131038 (= res!1054988 (validMask!0 mask!2480))))

(assert (=> start!131038 e!855631))

(assert (=> start!131038 true))

(declare-fun array_inv!38517 (array!102134) Bool)

(assert (=> start!131038 (array_inv!38517 a!2792)))

(declare-fun b!1537720 () Bool)

(declare-fun res!1054990 () Bool)

(assert (=> b!1537720 (=> (not res!1054990) (not e!855631))))

(assert (=> b!1537720 (= res!1054990 (and (= (size!49836 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49836 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49836 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131038 res!1054988) b!1537720))

(assert (= (and b!1537720 res!1054990) b!1537723))

(assert (= (and b!1537723 res!1054989) b!1537718))

(assert (= (and b!1537718 res!1054993) b!1537721))

(assert (= (and b!1537721 res!1054992) b!1537717))

(assert (= (and b!1537717 res!1054987) b!1537719))

(assert (= (and b!1537719 res!1054991) b!1537722))

(declare-fun m!1419639 () Bool)

(assert (=> b!1537719 m!1419639))

(declare-fun m!1419641 () Bool)

(assert (=> b!1537721 m!1419641))

(declare-fun m!1419643 () Bool)

(assert (=> b!1537717 m!1419643))

(declare-fun m!1419645 () Bool)

(assert (=> b!1537723 m!1419645))

(assert (=> b!1537723 m!1419645))

(declare-fun m!1419647 () Bool)

(assert (=> b!1537723 m!1419647))

(declare-fun m!1419649 () Bool)

(assert (=> b!1537718 m!1419649))

(assert (=> b!1537718 m!1419649))

(declare-fun m!1419651 () Bool)

(assert (=> b!1537718 m!1419651))

(declare-fun m!1419653 () Bool)

(assert (=> start!131038 m!1419653))

(declare-fun m!1419655 () Bool)

(assert (=> start!131038 m!1419655))

(assert (=> b!1537722 m!1419649))

(assert (=> b!1537722 m!1419649))

(declare-fun m!1419657 () Bool)

(assert (=> b!1537722 m!1419657))

(push 1)

(assert (not b!1537717))

(assert (not b!1537722))

(assert (not b!1537718))

(assert (not b!1537721))

(assert (not start!131038))

(assert (not b!1537723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

