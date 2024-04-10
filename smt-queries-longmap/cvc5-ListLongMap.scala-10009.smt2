; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118090 () Bool)

(assert start!118090)

(declare-fun res!924211 () Bool)

(declare-fun e!783655 () Bool)

(assert (=> start!118090 (=> (not res!924211) (not e!783655))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118090 (= res!924211 (validMask!0 mask!3034))))

(assert (=> start!118090 e!783655))

(assert (=> start!118090 true))

(declare-datatypes ((array!94454 0))(
  ( (array!94455 (arr!45608 (Array (_ BitVec 32) (_ BitVec 64))) (size!46158 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94454)

(declare-fun array_inv!34636 (array!94454) Bool)

(assert (=> start!118090 (array_inv!34636 a!2971)))

(declare-fun b!1382617 () Bool)

(declare-fun res!924213 () Bool)

(assert (=> b!1382617 (=> (not res!924213) (not e!783655))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382617 (= res!924213 (and (= (size!46158 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46158 a!2971))))))

(declare-fun b!1382618 () Bool)

(assert (=> b!1382618 (= e!783655 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94454 (_ BitVec 32)) Bool)

(assert (=> b!1382618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94455 (store (arr!45608 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46158 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46053 0))(
  ( (Unit!46054) )
))
(declare-fun lt!608460 () Unit!46053)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46053)

(assert (=> b!1382618 (= lt!608460 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382619 () Bool)

(declare-fun res!924210 () Bool)

(assert (=> b!1382619 (=> (not res!924210) (not e!783655))))

(assert (=> b!1382619 (= res!924210 (and (not (= (select (arr!45608 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45608 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46158 a!2971))))))

(declare-fun b!1382620 () Bool)

(declare-fun res!924214 () Bool)

(assert (=> b!1382620 (=> (not res!924214) (not e!783655))))

(declare-datatypes ((List!32142 0))(
  ( (Nil!32139) (Cons!32138 (h!33347 (_ BitVec 64)) (t!46836 List!32142)) )
))
(declare-fun arrayNoDuplicates!0 (array!94454 (_ BitVec 32) List!32142) Bool)

(assert (=> b!1382620 (= res!924214 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32139))))

(declare-fun b!1382621 () Bool)

(declare-fun res!924212 () Bool)

(assert (=> b!1382621 (=> (not res!924212) (not e!783655))))

(assert (=> b!1382621 (= res!924212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382622 () Bool)

(declare-fun res!924209 () Bool)

(assert (=> b!1382622 (=> (not res!924209) (not e!783655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382622 (= res!924209 (validKeyInArray!0 (select (arr!45608 a!2971) i!1094)))))

(assert (= (and start!118090 res!924211) b!1382617))

(assert (= (and b!1382617 res!924213) b!1382622))

(assert (= (and b!1382622 res!924209) b!1382620))

(assert (= (and b!1382620 res!924214) b!1382621))

(assert (= (and b!1382621 res!924212) b!1382619))

(assert (= (and b!1382619 res!924210) b!1382618))

(declare-fun m!1267743 () Bool)

(assert (=> start!118090 m!1267743))

(declare-fun m!1267745 () Bool)

(assert (=> start!118090 m!1267745))

(declare-fun m!1267747 () Bool)

(assert (=> b!1382622 m!1267747))

(assert (=> b!1382622 m!1267747))

(declare-fun m!1267749 () Bool)

(assert (=> b!1382622 m!1267749))

(declare-fun m!1267751 () Bool)

(assert (=> b!1382618 m!1267751))

(declare-fun m!1267753 () Bool)

(assert (=> b!1382618 m!1267753))

(declare-fun m!1267755 () Bool)

(assert (=> b!1382618 m!1267755))

(assert (=> b!1382619 m!1267747))

(declare-fun m!1267757 () Bool)

(assert (=> b!1382621 m!1267757))

(declare-fun m!1267759 () Bool)

(assert (=> b!1382620 m!1267759))

(push 1)

(assert (not b!1382618))

(assert (not b!1382622))

(assert (not b!1382621))

(assert (not b!1382620))

(assert (not start!118090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

