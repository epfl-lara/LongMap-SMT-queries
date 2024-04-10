; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118096 () Bool)

(assert start!118096)

(declare-fun b!1382671 () Bool)

(declare-fun res!924265 () Bool)

(declare-fun e!783673 () Bool)

(assert (=> b!1382671 (=> (not res!924265) (not e!783673))))

(declare-datatypes ((array!94460 0))(
  ( (array!94461 (arr!45611 (Array (_ BitVec 32) (_ BitVec 64))) (size!46161 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94460)

(declare-datatypes ((List!32145 0))(
  ( (Nil!32142) (Cons!32141 (h!33350 (_ BitVec 64)) (t!46839 List!32145)) )
))
(declare-fun arrayNoDuplicates!0 (array!94460 (_ BitVec 32) List!32145) Bool)

(assert (=> b!1382671 (= res!924265 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32142))))

(declare-fun b!1382672 () Bool)

(declare-fun res!924263 () Bool)

(assert (=> b!1382672 (=> (not res!924263) (not e!783673))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382672 (= res!924263 (and (= (size!46161 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46161 a!2971))))))

(declare-fun b!1382673 () Bool)

(declare-fun res!924268 () Bool)

(assert (=> b!1382673 (=> (not res!924268) (not e!783673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94460 (_ BitVec 32)) Bool)

(assert (=> b!1382673 (= res!924268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382674 () Bool)

(declare-fun res!924264 () Bool)

(assert (=> b!1382674 (=> (not res!924264) (not e!783673))))

(assert (=> b!1382674 (= res!924264 (and (not (= (select (arr!45611 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45611 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46161 a!2971))))))

(declare-fun res!924267 () Bool)

(assert (=> start!118096 (=> (not res!924267) (not e!783673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118096 (= res!924267 (validMask!0 mask!3034))))

(assert (=> start!118096 e!783673))

(assert (=> start!118096 true))

(declare-fun array_inv!34639 (array!94460) Bool)

(assert (=> start!118096 (array_inv!34639 a!2971)))

(declare-fun b!1382675 () Bool)

(declare-fun res!924266 () Bool)

(assert (=> b!1382675 (=> (not res!924266) (not e!783673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382675 (= res!924266 (validKeyInArray!0 (select (arr!45611 a!2971) i!1094)))))

(declare-fun b!1382676 () Bool)

(assert (=> b!1382676 (= e!783673 (not true))))

(assert (=> b!1382676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94461 (store (arr!45611 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46161 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46059 0))(
  ( (Unit!46060) )
))
(declare-fun lt!608469 () Unit!46059)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46059)

(assert (=> b!1382676 (= lt!608469 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(assert (= (and start!118096 res!924267) b!1382672))

(assert (= (and b!1382672 res!924263) b!1382675))

(assert (= (and b!1382675 res!924266) b!1382671))

(assert (= (and b!1382671 res!924265) b!1382673))

(assert (= (and b!1382673 res!924268) b!1382674))

(assert (= (and b!1382674 res!924264) b!1382676))

(declare-fun m!1267797 () Bool)

(assert (=> b!1382671 m!1267797))

(declare-fun m!1267799 () Bool)

(assert (=> b!1382673 m!1267799))

(declare-fun m!1267801 () Bool)

(assert (=> b!1382675 m!1267801))

(assert (=> b!1382675 m!1267801))

(declare-fun m!1267803 () Bool)

(assert (=> b!1382675 m!1267803))

(declare-fun m!1267805 () Bool)

(assert (=> start!118096 m!1267805))

(declare-fun m!1267807 () Bool)

(assert (=> start!118096 m!1267807))

(declare-fun m!1267809 () Bool)

(assert (=> b!1382676 m!1267809))

(declare-fun m!1267811 () Bool)

(assert (=> b!1382676 m!1267811))

(declare-fun m!1267813 () Bool)

(assert (=> b!1382676 m!1267813))

(assert (=> b!1382674 m!1267801))

(push 1)

(assert (not b!1382671))

(assert (not b!1382673))

(assert (not b!1382675))

(assert (not b!1382676))

(assert (not start!118096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

