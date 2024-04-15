; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117972 () Bool)

(assert start!117972)

(declare-fun b!1381891 () Bool)

(declare-fun res!923562 () Bool)

(declare-fun e!783304 () Bool)

(assert (=> b!1381891 (=> (not res!923562) (not e!783304))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94315 0))(
  ( (array!94316 (arr!45540 (Array (_ BitVec 32) (_ BitVec 64))) (size!46092 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94315)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381891 (= res!923562 (and (= (size!46092 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46092 a!2971))))))

(declare-fun b!1381892 () Bool)

(declare-fun res!923567 () Bool)

(assert (=> b!1381892 (=> (not res!923567) (not e!783304))))

(declare-datatypes ((List!32152 0))(
  ( (Nil!32149) (Cons!32148 (h!33357 (_ BitVec 64)) (t!46838 List!32152)) )
))
(declare-fun arrayNoDuplicates!0 (array!94315 (_ BitVec 32) List!32152) Bool)

(assert (=> b!1381892 (= res!923567 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32149))))

(declare-fun b!1381893 () Bool)

(declare-fun res!923566 () Bool)

(assert (=> b!1381893 (=> (not res!923566) (not e!783304))))

(assert (=> b!1381893 (= res!923566 (and (not (= (select (arr!45540 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45540 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46092 a!2971))))))

(declare-fun b!1381894 () Bool)

(assert (=> b!1381894 (= e!783304 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94315 (_ BitVec 32)) Bool)

(assert (=> b!1381894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94316 (store (arr!45540 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46092 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45874 0))(
  ( (Unit!45875) )
))
(declare-fun lt!608138 () Unit!45874)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45874)

(assert (=> b!1381894 (= lt!608138 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun res!923563 () Bool)

(assert (=> start!117972 (=> (not res!923563) (not e!783304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117972 (= res!923563 (validMask!0 mask!3034))))

(assert (=> start!117972 e!783304))

(assert (=> start!117972 true))

(declare-fun array_inv!34773 (array!94315) Bool)

(assert (=> start!117972 (array_inv!34773 a!2971)))

(declare-fun b!1381895 () Bool)

(declare-fun res!923565 () Bool)

(assert (=> b!1381895 (=> (not res!923565) (not e!783304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381895 (= res!923565 (validKeyInArray!0 (select (arr!45540 a!2971) i!1094)))))

(declare-fun b!1381896 () Bool)

(declare-fun res!923564 () Bool)

(assert (=> b!1381896 (=> (not res!923564) (not e!783304))))

(assert (=> b!1381896 (= res!923564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117972 res!923563) b!1381891))

(assert (= (and b!1381891 res!923562) b!1381895))

(assert (= (and b!1381895 res!923565) b!1381892))

(assert (= (and b!1381892 res!923567) b!1381896))

(assert (= (and b!1381896 res!923564) b!1381893))

(assert (= (and b!1381893 res!923566) b!1381894))

(declare-fun m!1266633 () Bool)

(assert (=> b!1381895 m!1266633))

(assert (=> b!1381895 m!1266633))

(declare-fun m!1266635 () Bool)

(assert (=> b!1381895 m!1266635))

(declare-fun m!1266637 () Bool)

(assert (=> start!117972 m!1266637))

(declare-fun m!1266639 () Bool)

(assert (=> start!117972 m!1266639))

(assert (=> b!1381893 m!1266633))

(declare-fun m!1266641 () Bool)

(assert (=> b!1381894 m!1266641))

(declare-fun m!1266643 () Bool)

(assert (=> b!1381894 m!1266643))

(declare-fun m!1266645 () Bool)

(assert (=> b!1381894 m!1266645))

(declare-fun m!1266647 () Bool)

(assert (=> b!1381892 m!1266647))

(declare-fun m!1266649 () Bool)

(assert (=> b!1381896 m!1266649))

(push 1)

(assert (not b!1381896))

(assert (not b!1381895))

(assert (not b!1381894))

(assert (not b!1381892))

(assert (not start!117972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

