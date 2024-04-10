; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117984 () Bool)

(assert start!117984)

(declare-fun b!1382050 () Bool)

(declare-fun res!923681 () Bool)

(declare-fun e!783365 () Bool)

(assert (=> b!1382050 (=> (not res!923681) (not e!783365))))

(declare-datatypes ((array!94375 0))(
  ( (array!94376 (arr!45570 (Array (_ BitVec 32) (_ BitVec 64))) (size!46120 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94375)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382050 (= res!923681 (and (not (= (select (arr!45570 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45570 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46120 a!2971))))))

(declare-fun b!1382051 () Bool)

(declare-fun res!923679 () Bool)

(assert (=> b!1382051 (=> (not res!923679) (not e!783365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382051 (= res!923679 (validKeyInArray!0 (select (arr!45570 a!2971) i!1094)))))

(declare-fun b!1382052 () Bool)

(declare-fun res!923682 () Bool)

(assert (=> b!1382052 (=> (not res!923682) (not e!783365))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94375 (_ BitVec 32)) Bool)

(assert (=> b!1382052 (= res!923682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382053 () Bool)

(assert (=> b!1382053 (= e!783365 (not (bvsle #b00000000000000000000000000000000 (size!46120 a!2971))))))

(assert (=> b!1382053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94376 (store (arr!45570 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46120 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46043 0))(
  ( (Unit!46044) )
))
(declare-fun lt!608337 () Unit!46043)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46043)

(assert (=> b!1382053 (= lt!608337 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382054 () Bool)

(declare-fun res!923678 () Bool)

(assert (=> b!1382054 (=> (not res!923678) (not e!783365))))

(assert (=> b!1382054 (= res!923678 (and (= (size!46120 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46120 a!2971))))))

(declare-fun res!923683 () Bool)

(assert (=> start!117984 (=> (not res!923683) (not e!783365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117984 (= res!923683 (validMask!0 mask!3034))))

(assert (=> start!117984 e!783365))

(assert (=> start!117984 true))

(declare-fun array_inv!34598 (array!94375) Bool)

(assert (=> start!117984 (array_inv!34598 a!2971)))

(declare-fun b!1382055 () Bool)

(declare-fun res!923680 () Bool)

(assert (=> b!1382055 (=> (not res!923680) (not e!783365))))

(declare-datatypes ((List!32104 0))(
  ( (Nil!32101) (Cons!32100 (h!33309 (_ BitVec 64)) (t!46798 List!32104)) )
))
(declare-fun arrayNoDuplicates!0 (array!94375 (_ BitVec 32) List!32104) Bool)

(assert (=> b!1382055 (= res!923680 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32101))))

(assert (= (and start!117984 res!923683) b!1382054))

(assert (= (and b!1382054 res!923678) b!1382051))

(assert (= (and b!1382051 res!923679) b!1382055))

(assert (= (and b!1382055 res!923680) b!1382052))

(assert (= (and b!1382052 res!923682) b!1382050))

(assert (= (and b!1382050 res!923681) b!1382053))

(declare-fun m!1267227 () Bool)

(assert (=> b!1382052 m!1267227))

(declare-fun m!1267229 () Bool)

(assert (=> b!1382050 m!1267229))

(declare-fun m!1267231 () Bool)

(assert (=> start!117984 m!1267231))

(declare-fun m!1267233 () Bool)

(assert (=> start!117984 m!1267233))

(declare-fun m!1267235 () Bool)

(assert (=> b!1382053 m!1267235))

(declare-fun m!1267237 () Bool)

(assert (=> b!1382053 m!1267237))

(declare-fun m!1267239 () Bool)

(assert (=> b!1382053 m!1267239))

(declare-fun m!1267241 () Bool)

(assert (=> b!1382055 m!1267241))

(assert (=> b!1382051 m!1267229))

(assert (=> b!1382051 m!1267229))

(declare-fun m!1267243 () Bool)

(assert (=> b!1382051 m!1267243))

(check-sat (not b!1382055) (not b!1382052) (not b!1382053) (not start!117984) (not b!1382051))
(check-sat)
