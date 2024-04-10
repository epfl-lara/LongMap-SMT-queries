; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118094 () Bool)

(assert start!118094)

(declare-fun b!1382653 () Bool)

(declare-fun res!924248 () Bool)

(declare-fun e!783668 () Bool)

(assert (=> b!1382653 (=> (not res!924248) (not e!783668))))

(declare-datatypes ((array!94458 0))(
  ( (array!94459 (arr!45610 (Array (_ BitVec 32) (_ BitVec 64))) (size!46160 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94458)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382653 (= res!924248 (and (not (= (select (arr!45610 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45610 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46160 a!2971))))))

(declare-fun b!1382654 () Bool)

(assert (=> b!1382654 (= e!783668 (not true))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94458 (_ BitVec 32)) Bool)

(assert (=> b!1382654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94459 (store (arr!45610 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46160 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46057 0))(
  ( (Unit!46058) )
))
(declare-fun lt!608466 () Unit!46057)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46057)

(assert (=> b!1382654 (= lt!608466 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun res!924247 () Bool)

(assert (=> start!118094 (=> (not res!924247) (not e!783668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118094 (= res!924247 (validMask!0 mask!3034))))

(assert (=> start!118094 e!783668))

(assert (=> start!118094 true))

(declare-fun array_inv!34638 (array!94458) Bool)

(assert (=> start!118094 (array_inv!34638 a!2971)))

(declare-fun b!1382655 () Bool)

(declare-fun res!924246 () Bool)

(assert (=> b!1382655 (=> (not res!924246) (not e!783668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382655 (= res!924246 (validKeyInArray!0 (select (arr!45610 a!2971) i!1094)))))

(declare-fun b!1382656 () Bool)

(declare-fun res!924249 () Bool)

(assert (=> b!1382656 (=> (not res!924249) (not e!783668))))

(assert (=> b!1382656 (= res!924249 (and (= (size!46160 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46160 a!2971))))))

(declare-fun b!1382657 () Bool)

(declare-fun res!924250 () Bool)

(assert (=> b!1382657 (=> (not res!924250) (not e!783668))))

(declare-datatypes ((List!32144 0))(
  ( (Nil!32141) (Cons!32140 (h!33349 (_ BitVec 64)) (t!46838 List!32144)) )
))
(declare-fun arrayNoDuplicates!0 (array!94458 (_ BitVec 32) List!32144) Bool)

(assert (=> b!1382657 (= res!924250 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32141))))

(declare-fun b!1382658 () Bool)

(declare-fun res!924245 () Bool)

(assert (=> b!1382658 (=> (not res!924245) (not e!783668))))

(assert (=> b!1382658 (= res!924245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118094 res!924247) b!1382656))

(assert (= (and b!1382656 res!924249) b!1382655))

(assert (= (and b!1382655 res!924246) b!1382657))

(assert (= (and b!1382657 res!924250) b!1382658))

(assert (= (and b!1382658 res!924245) b!1382653))

(assert (= (and b!1382653 res!924248) b!1382654))

(declare-fun m!1267779 () Bool)

(assert (=> b!1382654 m!1267779))

(declare-fun m!1267781 () Bool)

(assert (=> b!1382654 m!1267781))

(declare-fun m!1267783 () Bool)

(assert (=> b!1382654 m!1267783))

(declare-fun m!1267785 () Bool)

(assert (=> start!118094 m!1267785))

(declare-fun m!1267787 () Bool)

(assert (=> start!118094 m!1267787))

(declare-fun m!1267789 () Bool)

(assert (=> b!1382655 m!1267789))

(assert (=> b!1382655 m!1267789))

(declare-fun m!1267791 () Bool)

(assert (=> b!1382655 m!1267791))

(assert (=> b!1382653 m!1267789))

(declare-fun m!1267793 () Bool)

(assert (=> b!1382657 m!1267793))

(declare-fun m!1267795 () Bool)

(assert (=> b!1382658 m!1267795))

(push 1)

(assert (not start!118094))

(assert (not b!1382655))

(assert (not b!1382657))

(assert (not b!1382658))

(assert (not b!1382654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

