; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118100 () Bool)

(assert start!118100)

(declare-fun b!1382707 () Bool)

(declare-fun res!924303 () Bool)

(declare-fun e!783685 () Bool)

(assert (=> b!1382707 (=> (not res!924303) (not e!783685))))

(declare-datatypes ((array!94464 0))(
  ( (array!94465 (arr!45613 (Array (_ BitVec 32) (_ BitVec 64))) (size!46163 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94464)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382707 (= res!924303 (and (not (= (select (arr!45613 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45613 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46163 a!2971))))))

(declare-fun b!1382708 () Bool)

(declare-fun res!924301 () Bool)

(assert (=> b!1382708 (=> (not res!924301) (not e!783685))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94464 (_ BitVec 32)) Bool)

(assert (=> b!1382708 (= res!924301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382709 () Bool)

(assert (=> b!1382709 (= e!783685 (not true))))

(assert (=> b!1382709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94465 (store (arr!45613 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46163 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46063 0))(
  ( (Unit!46064) )
))
(declare-fun lt!608475 () Unit!46063)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46063)

(assert (=> b!1382709 (= lt!608475 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382710 () Bool)

(declare-fun res!924300 () Bool)

(assert (=> b!1382710 (=> (not res!924300) (not e!783685))))

(assert (=> b!1382710 (= res!924300 (and (= (size!46163 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46163 a!2971))))))

(declare-fun b!1382711 () Bool)

(declare-fun res!924299 () Bool)

(assert (=> b!1382711 (=> (not res!924299) (not e!783685))))

(declare-datatypes ((List!32147 0))(
  ( (Nil!32144) (Cons!32143 (h!33352 (_ BitVec 64)) (t!46841 List!32147)) )
))
(declare-fun arrayNoDuplicates!0 (array!94464 (_ BitVec 32) List!32147) Bool)

(assert (=> b!1382711 (= res!924299 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32144))))

(declare-fun res!924302 () Bool)

(assert (=> start!118100 (=> (not res!924302) (not e!783685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118100 (= res!924302 (validMask!0 mask!3034))))

(assert (=> start!118100 e!783685))

(assert (=> start!118100 true))

(declare-fun array_inv!34641 (array!94464) Bool)

(assert (=> start!118100 (array_inv!34641 a!2971)))

(declare-fun b!1382712 () Bool)

(declare-fun res!924304 () Bool)

(assert (=> b!1382712 (=> (not res!924304) (not e!783685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382712 (= res!924304 (validKeyInArray!0 (select (arr!45613 a!2971) i!1094)))))

(assert (= (and start!118100 res!924302) b!1382710))

(assert (= (and b!1382710 res!924300) b!1382712))

(assert (= (and b!1382712 res!924304) b!1382711))

(assert (= (and b!1382711 res!924299) b!1382708))

(assert (= (and b!1382708 res!924301) b!1382707))

(assert (= (and b!1382707 res!924303) b!1382709))

(declare-fun m!1267833 () Bool)

(assert (=> b!1382711 m!1267833))

(declare-fun m!1267835 () Bool)

(assert (=> b!1382709 m!1267835))

(declare-fun m!1267837 () Bool)

(assert (=> b!1382709 m!1267837))

(declare-fun m!1267839 () Bool)

(assert (=> b!1382709 m!1267839))

(declare-fun m!1267841 () Bool)

(assert (=> b!1382707 m!1267841))

(declare-fun m!1267843 () Bool)

(assert (=> start!118100 m!1267843))

(declare-fun m!1267845 () Bool)

(assert (=> start!118100 m!1267845))

(declare-fun m!1267847 () Bool)

(assert (=> b!1382708 m!1267847))

(assert (=> b!1382712 m!1267841))

(assert (=> b!1382712 m!1267841))

(declare-fun m!1267849 () Bool)

(assert (=> b!1382712 m!1267849))

(push 1)

(assert (not b!1382708))

(assert (not b!1382712))

(assert (not b!1382711))

(assert (not b!1382709))

(assert (not start!118100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

