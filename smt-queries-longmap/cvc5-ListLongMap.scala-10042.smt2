; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118356 () Bool)

(assert start!118356)

(declare-fun res!925812 () Bool)

(declare-fun e!784442 () Bool)

(assert (=> start!118356 (=> (not res!925812) (not e!784442))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118356 (= res!925812 (validMask!0 mask!2987))))

(assert (=> start!118356 e!784442))

(assert (=> start!118356 true))

(declare-datatypes ((array!94612 0))(
  ( (array!94613 (arr!45684 (Array (_ BitVec 32) (_ BitVec 64))) (size!46236 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94612)

(declare-fun array_inv!34917 (array!94612) Bool)

(assert (=> start!118356 (array_inv!34917 a!2938)))

(declare-fun b!1384315 () Bool)

(declare-fun e!784443 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384315 (= e!784443 (validKeyInArray!0 (select (arr!45684 a!2938) startIndex!16)))))

(declare-fun b!1384316 () Bool)

(declare-fun res!925811 () Bool)

(assert (=> b!1384316 (=> (not res!925811) (not e!784442))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384316 (= res!925811 (validKeyInArray!0 (select (arr!45684 a!2938) i!1065)))))

(declare-fun b!1384317 () Bool)

(declare-fun res!925813 () Bool)

(assert (=> b!1384317 (=> (not res!925813) (not e!784442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94612 (_ BitVec 32)) Bool)

(assert (=> b!1384317 (= res!925813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384318 () Bool)

(declare-datatypes ((Unit!46005 0))(
  ( (Unit!46006) )
))
(declare-fun e!784444 () Unit!46005)

(declare-fun lt!608689 () Unit!46005)

(assert (=> b!1384318 (= e!784444 lt!608689)))

(declare-fun lt!608688 () Unit!46005)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46005)

(assert (=> b!1384318 (= lt!608688 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10101 0))(
  ( (MissingZero!10101 (index!42775 (_ BitVec 32))) (Found!10101 (index!42776 (_ BitVec 32))) (Intermediate!10101 (undefined!10913 Bool) (index!42777 (_ BitVec 32)) (x!124275 (_ BitVec 32))) (Undefined!10101) (MissingVacant!10101 (index!42778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94612 (_ BitVec 32)) SeekEntryResult!10101)

(assert (=> b!1384318 (= (seekEntryOrOpen!0 (select (arr!45684 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45684 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94613 (store (arr!45684 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46236 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46005)

(assert (=> b!1384318 (= lt!608689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384318 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384319 () Bool)

(declare-fun res!925808 () Bool)

(assert (=> b!1384319 (=> (not res!925808) (not e!784442))))

(assert (=> b!1384319 (= res!925808 (and (not (= (select (arr!45684 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45684 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384320 () Bool)

(declare-fun res!925814 () Bool)

(assert (=> b!1384320 (=> (not res!925814) (not e!784442))))

(assert (=> b!1384320 (= res!925814 (and (= (size!46236 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46236 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46236 a!2938))))))

(declare-fun b!1384321 () Bool)

(assert (=> b!1384321 (= e!784442 false)))

(declare-fun lt!608690 () Unit!46005)

(assert (=> b!1384321 (= lt!608690 e!784444)))

(declare-fun c!128696 () Bool)

(assert (=> b!1384321 (= c!128696 e!784443)))

(declare-fun res!925810 () Bool)

(assert (=> b!1384321 (=> (not res!925810) (not e!784443))))

(assert (=> b!1384321 (= res!925810 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384322 () Bool)

(declare-fun Unit!46007 () Unit!46005)

(assert (=> b!1384322 (= e!784444 Unit!46007)))

(declare-fun b!1384323 () Bool)

(declare-fun res!925809 () Bool)

(assert (=> b!1384323 (=> (not res!925809) (not e!784442))))

(declare-datatypes ((List!32290 0))(
  ( (Nil!32287) (Cons!32286 (h!33495 (_ BitVec 64)) (t!46976 List!32290)) )
))
(declare-fun arrayNoDuplicates!0 (array!94612 (_ BitVec 32) List!32290) Bool)

(assert (=> b!1384323 (= res!925809 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32287))))

(assert (= (and start!118356 res!925812) b!1384320))

(assert (= (and b!1384320 res!925814) b!1384316))

(assert (= (and b!1384316 res!925811) b!1384323))

(assert (= (and b!1384323 res!925809) b!1384317))

(assert (= (and b!1384317 res!925813) b!1384319))

(assert (= (and b!1384319 res!925808) b!1384321))

(assert (= (and b!1384321 res!925810) b!1384315))

(assert (= (and b!1384321 c!128696) b!1384318))

(assert (= (and b!1384321 (not c!128696)) b!1384322))

(declare-fun m!1269117 () Bool)

(assert (=> b!1384319 m!1269117))

(declare-fun m!1269119 () Bool)

(assert (=> b!1384317 m!1269119))

(declare-fun m!1269121 () Bool)

(assert (=> b!1384318 m!1269121))

(declare-fun m!1269123 () Bool)

(assert (=> b!1384318 m!1269123))

(assert (=> b!1384318 m!1269123))

(declare-fun m!1269125 () Bool)

(assert (=> b!1384318 m!1269125))

(declare-fun m!1269127 () Bool)

(assert (=> b!1384318 m!1269127))

(declare-fun m!1269129 () Bool)

(assert (=> b!1384318 m!1269129))

(declare-fun m!1269131 () Bool)

(assert (=> b!1384318 m!1269131))

(declare-fun m!1269133 () Bool)

(assert (=> b!1384318 m!1269133))

(assert (=> b!1384318 m!1269131))

(declare-fun m!1269135 () Bool)

(assert (=> b!1384318 m!1269135))

(declare-fun m!1269137 () Bool)

(assert (=> b!1384323 m!1269137))

(declare-fun m!1269139 () Bool)

(assert (=> start!118356 m!1269139))

(declare-fun m!1269141 () Bool)

(assert (=> start!118356 m!1269141))

(assert (=> b!1384315 m!1269131))

(assert (=> b!1384315 m!1269131))

(declare-fun m!1269143 () Bool)

(assert (=> b!1384315 m!1269143))

(assert (=> b!1384316 m!1269117))

(assert (=> b!1384316 m!1269117))

(declare-fun m!1269145 () Bool)

(assert (=> b!1384316 m!1269145))

(push 1)

(assert (not b!1384323))

(assert (not b!1384317))

(assert (not b!1384315))

(assert (not b!1384318))

(assert (not start!118356))

(assert (not b!1384316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

