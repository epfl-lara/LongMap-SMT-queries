; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117982 () Bool)

(assert start!117982)

(declare-fun b!1382032 () Bool)

(declare-fun res!923660 () Bool)

(declare-fun e!783358 () Bool)

(assert (=> b!1382032 (=> (not res!923660) (not e!783358))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94373 0))(
  ( (array!94374 (arr!45569 (Array (_ BitVec 32) (_ BitVec 64))) (size!46119 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94373)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382032 (= res!923660 (and (= (size!46119 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46119 a!2971))))))

(declare-fun b!1382033 () Bool)

(declare-fun res!923662 () Bool)

(assert (=> b!1382033 (=> (not res!923662) (not e!783358))))

(assert (=> b!1382033 (= res!923662 (and (not (= (select (arr!45569 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45569 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46119 a!2971))))))

(declare-fun b!1382034 () Bool)

(declare-fun res!923665 () Bool)

(assert (=> b!1382034 (=> (not res!923665) (not e!783358))))

(declare-datatypes ((List!32103 0))(
  ( (Nil!32100) (Cons!32099 (h!33308 (_ BitVec 64)) (t!46797 List!32103)) )
))
(declare-fun arrayNoDuplicates!0 (array!94373 (_ BitVec 32) List!32103) Bool)

(assert (=> b!1382034 (= res!923665 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32100))))

(declare-fun b!1382035 () Bool)

(declare-fun res!923664 () Bool)

(assert (=> b!1382035 (=> (not res!923664) (not e!783358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382035 (= res!923664 (validKeyInArray!0 (select (arr!45569 a!2971) i!1094)))))

(declare-fun b!1382036 () Bool)

(declare-fun res!923663 () Bool)

(assert (=> b!1382036 (=> (not res!923663) (not e!783358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94373 (_ BitVec 32)) Bool)

(assert (=> b!1382036 (= res!923663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923661 () Bool)

(assert (=> start!117982 (=> (not res!923661) (not e!783358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117982 (= res!923661 (validMask!0 mask!3034))))

(assert (=> start!117982 e!783358))

(assert (=> start!117982 true))

(declare-fun array_inv!34597 (array!94373) Bool)

(assert (=> start!117982 (array_inv!34597 a!2971)))

(declare-fun b!1382037 () Bool)

(assert (=> b!1382037 (= e!783358 (not (bvsle #b00000000000000000000000000000000 (size!46119 a!2971))))))

(assert (=> b!1382037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94374 (store (arr!45569 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46119 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46041 0))(
  ( (Unit!46042) )
))
(declare-fun lt!608334 () Unit!46041)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46041)

(assert (=> b!1382037 (= lt!608334 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(assert (= (and start!117982 res!923661) b!1382032))

(assert (= (and b!1382032 res!923660) b!1382035))

(assert (= (and b!1382035 res!923664) b!1382034))

(assert (= (and b!1382034 res!923665) b!1382036))

(assert (= (and b!1382036 res!923663) b!1382033))

(assert (= (and b!1382033 res!923662) b!1382037))

(declare-fun m!1267209 () Bool)

(assert (=> b!1382036 m!1267209))

(declare-fun m!1267211 () Bool)

(assert (=> b!1382034 m!1267211))

(declare-fun m!1267213 () Bool)

(assert (=> b!1382037 m!1267213))

(declare-fun m!1267215 () Bool)

(assert (=> b!1382037 m!1267215))

(declare-fun m!1267217 () Bool)

(assert (=> b!1382037 m!1267217))

(declare-fun m!1267219 () Bool)

(assert (=> b!1382033 m!1267219))

(declare-fun m!1267221 () Bool)

(assert (=> start!117982 m!1267221))

(declare-fun m!1267223 () Bool)

(assert (=> start!117982 m!1267223))

(assert (=> b!1382035 m!1267219))

(assert (=> b!1382035 m!1267219))

(declare-fun m!1267225 () Bool)

(assert (=> b!1382035 m!1267225))

(push 1)

