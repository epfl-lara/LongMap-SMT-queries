; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118336 () Bool)

(assert start!118336)

(declare-fun b!1384060 () Bool)

(declare-fun e!784331 () Bool)

(assert (=> b!1384060 (= e!784331 false)))

(declare-datatypes ((Unit!46128 0))(
  ( (Unit!46129) )
))
(declare-fun lt!608764 () Unit!46128)

(declare-fun e!784328 () Unit!46128)

(assert (=> b!1384060 (= lt!608764 e!784328)))

(declare-fun c!128679 () Bool)

(declare-fun e!784329 () Bool)

(assert (=> b!1384060 (= c!128679 e!784329)))

(declare-fun res!925582 () Bool)

(assert (=> b!1384060 (=> (not res!925582) (not e!784329))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384060 (= res!925582 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384061 () Bool)

(declare-fun res!925584 () Bool)

(assert (=> b!1384061 (=> (not res!925584) (not e!784331))))

(declare-datatypes ((array!94639 0))(
  ( (array!94640 (arr!45697 (Array (_ BitVec 32) (_ BitVec 64))) (size!46247 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94639)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384061 (= res!925584 (validKeyInArray!0 (select (arr!45697 a!2938) i!1065)))))

(declare-fun b!1384062 () Bool)

(assert (=> b!1384062 (= e!784329 (validKeyInArray!0 (select (arr!45697 a!2938) startIndex!16)))))

(declare-fun b!1384063 () Bool)

(declare-fun res!925588 () Bool)

(assert (=> b!1384063 (=> (not res!925588) (not e!784331))))

(assert (=> b!1384063 (= res!925588 (and (not (= (select (arr!45697 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45697 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384064 () Bool)

(declare-fun res!925583 () Bool)

(assert (=> b!1384064 (=> (not res!925583) (not e!784331))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94639 (_ BitVec 32)) Bool)

(assert (=> b!1384064 (= res!925583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925586 () Bool)

(assert (=> start!118336 (=> (not res!925586) (not e!784331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118336 (= res!925586 (validMask!0 mask!2987))))

(assert (=> start!118336 e!784331))

(assert (=> start!118336 true))

(declare-fun array_inv!34725 (array!94639) Bool)

(assert (=> start!118336 (array_inv!34725 a!2938)))

(declare-fun b!1384065 () Bool)

(declare-fun res!925585 () Bool)

(assert (=> b!1384065 (=> (not res!925585) (not e!784331))))

(assert (=> b!1384065 (= res!925585 (and (= (size!46247 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46247 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46247 a!2938))))))

(declare-fun b!1384066 () Bool)

(declare-fun res!925587 () Bool)

(assert (=> b!1384066 (=> (not res!925587) (not e!784331))))

(declare-datatypes ((List!32225 0))(
  ( (Nil!32222) (Cons!32221 (h!33430 (_ BitVec 64)) (t!46919 List!32225)) )
))
(declare-fun arrayNoDuplicates!0 (array!94639 (_ BitVec 32) List!32225) Bool)

(assert (=> b!1384066 (= res!925587 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32222))))

(declare-fun b!1384067 () Bool)

(declare-fun lt!608766 () Unit!46128)

(assert (=> b!1384067 (= e!784328 lt!608766)))

(declare-fun lt!608765 () Unit!46128)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46128)

(assert (=> b!1384067 (= lt!608765 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10090 0))(
  ( (MissingZero!10090 (index!42731 (_ BitVec 32))) (Found!10090 (index!42732 (_ BitVec 32))) (Intermediate!10090 (undefined!10902 Bool) (index!42733 (_ BitVec 32)) (x!124235 (_ BitVec 32))) (Undefined!10090) (MissingVacant!10090 (index!42734 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94639 (_ BitVec 32)) SeekEntryResult!10090)

(assert (=> b!1384067 (= (seekEntryOrOpen!0 (select (arr!45697 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45697 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94640 (store (arr!45697 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46247 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46128)

(assert (=> b!1384067 (= lt!608766 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384067 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384068 () Bool)

(declare-fun Unit!46130 () Unit!46128)

(assert (=> b!1384068 (= e!784328 Unit!46130)))

(assert (= (and start!118336 res!925586) b!1384065))

(assert (= (and b!1384065 res!925585) b!1384061))

(assert (= (and b!1384061 res!925584) b!1384066))

(assert (= (and b!1384066 res!925587) b!1384064))

(assert (= (and b!1384064 res!925583) b!1384063))

(assert (= (and b!1384063 res!925588) b!1384060))

(assert (= (and b!1384060 res!925582) b!1384062))

(assert (= (and b!1384060 c!128679) b!1384067))

(assert (= (and b!1384060 (not c!128679)) b!1384068))

(declare-fun m!1269261 () Bool)

(assert (=> b!1384067 m!1269261))

(declare-fun m!1269263 () Bool)

(assert (=> b!1384067 m!1269263))

(assert (=> b!1384067 m!1269263))

(declare-fun m!1269265 () Bool)

(assert (=> b!1384067 m!1269265))

(declare-fun m!1269267 () Bool)

(assert (=> b!1384067 m!1269267))

(declare-fun m!1269269 () Bool)

(assert (=> b!1384067 m!1269269))

(declare-fun m!1269271 () Bool)

(assert (=> b!1384067 m!1269271))

(declare-fun m!1269273 () Bool)

(assert (=> b!1384067 m!1269273))

(assert (=> b!1384067 m!1269271))

(declare-fun m!1269275 () Bool)

(assert (=> b!1384067 m!1269275))

(assert (=> b!1384062 m!1269271))

(assert (=> b!1384062 m!1269271))

(declare-fun m!1269277 () Bool)

(assert (=> b!1384062 m!1269277))

(declare-fun m!1269279 () Bool)

(assert (=> b!1384066 m!1269279))

(declare-fun m!1269281 () Bool)

(assert (=> start!118336 m!1269281))

(declare-fun m!1269283 () Bool)

(assert (=> start!118336 m!1269283))

(declare-fun m!1269285 () Bool)

(assert (=> b!1384061 m!1269285))

(assert (=> b!1384061 m!1269285))

(declare-fun m!1269287 () Bool)

(assert (=> b!1384061 m!1269287))

(declare-fun m!1269289 () Bool)

(assert (=> b!1384064 m!1269289))

(assert (=> b!1384063 m!1269285))

(push 1)

(assert (not b!1384064))

(assert (not b!1384061))

(assert (not b!1384066))

(assert (not start!118336))

(assert (not b!1384062))

(assert (not b!1384067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

