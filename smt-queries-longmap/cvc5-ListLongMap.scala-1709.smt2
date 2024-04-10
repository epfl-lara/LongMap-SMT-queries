; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31436 () Bool)

(assert start!31436)

(declare-fun b!314826 () Bool)

(declare-fun res!170439 () Bool)

(declare-fun e!196035 () Bool)

(assert (=> b!314826 (=> (not res!170439) (not e!196035))))

(declare-datatypes ((array!16062 0))(
  ( (array!16063 (arr!7604 (Array (_ BitVec 32) (_ BitVec 64))) (size!7956 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16062)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314826 (= res!170439 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314827 () Bool)

(declare-fun res!170437 () Bool)

(assert (=> b!314827 (=> (not res!170437) (not e!196035))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314827 (= res!170437 (and (= (size!7956 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7956 a!3293))))))

(declare-fun b!314828 () Bool)

(declare-fun e!196033 () Bool)

(declare-fun e!196034 () Bool)

(assert (=> b!314828 (= e!196033 e!196034)))

(declare-fun res!170442 () Bool)

(assert (=> b!314828 (=> (not res!170442) (not e!196034))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2744 0))(
  ( (MissingZero!2744 (index!13152 (_ BitVec 32))) (Found!2744 (index!13153 (_ BitVec 32))) (Intermediate!2744 (undefined!3556 Bool) (index!13154 (_ BitVec 32)) (x!31388 (_ BitVec 32))) (Undefined!2744) (MissingVacant!2744 (index!13155 (_ BitVec 32))) )
))
(declare-fun lt!154035 () SeekEntryResult!2744)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!154034 () SeekEntryResult!2744)

(assert (=> b!314828 (= res!170442 (and (= lt!154035 lt!154034) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7604 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7604 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7604 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16062 (_ BitVec 32)) SeekEntryResult!2744)

(assert (=> b!314828 (= lt!154035 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314829 () Bool)

(assert (=> b!314829 (= e!196035 e!196033)))

(declare-fun res!170438 () Bool)

(assert (=> b!314829 (=> (not res!170438) (not e!196033))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314829 (= res!170438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154034))))

(assert (=> b!314829 (= lt!154034 (Intermediate!2744 false resIndex!52 resX!52))))

(declare-fun b!314830 () Bool)

(declare-fun res!170436 () Bool)

(assert (=> b!314830 (=> (not res!170436) (not e!196033))))

(assert (=> b!314830 (= res!170436 (and (= (select (arr!7604 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7956 a!3293))))))

(declare-fun res!170440 () Bool)

(assert (=> start!31436 (=> (not res!170440) (not e!196035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31436 (= res!170440 (validMask!0 mask!3709))))

(assert (=> start!31436 e!196035))

(declare-fun array_inv!5567 (array!16062) Bool)

(assert (=> start!31436 (array_inv!5567 a!3293)))

(assert (=> start!31436 true))

(declare-fun b!314831 () Bool)

(declare-fun res!170441 () Bool)

(assert (=> b!314831 (=> (not res!170441) (not e!196035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314831 (= res!170441 (validKeyInArray!0 k!2441))))

(declare-fun b!314832 () Bool)

(assert (=> b!314832 (= e!196034 (not false))))

(assert (=> b!314832 (= lt!154035 (Intermediate!2744 false index!1781 resX!52))))

(declare-fun b!314833 () Bool)

(declare-fun res!170435 () Bool)

(assert (=> b!314833 (=> (not res!170435) (not e!196035))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16062 (_ BitVec 32)) SeekEntryResult!2744)

(assert (=> b!314833 (= res!170435 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2744 i!1240)))))

(declare-fun b!314834 () Bool)

(declare-fun res!170434 () Bool)

(assert (=> b!314834 (=> (not res!170434) (not e!196035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16062 (_ BitVec 32)) Bool)

(assert (=> b!314834 (= res!170434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31436 res!170440) b!314827))

(assert (= (and b!314827 res!170437) b!314831))

(assert (= (and b!314831 res!170441) b!314826))

(assert (= (and b!314826 res!170439) b!314833))

(assert (= (and b!314833 res!170435) b!314834))

(assert (= (and b!314834 res!170434) b!314829))

(assert (= (and b!314829 res!170438) b!314830))

(assert (= (and b!314830 res!170436) b!314828))

(assert (= (and b!314828 res!170442) b!314832))

(declare-fun m!324257 () Bool)

(assert (=> b!314833 m!324257))

(declare-fun m!324259 () Bool)

(assert (=> b!314828 m!324259))

(declare-fun m!324261 () Bool)

(assert (=> b!314828 m!324261))

(declare-fun m!324263 () Bool)

(assert (=> b!314831 m!324263))

(declare-fun m!324265 () Bool)

(assert (=> start!31436 m!324265))

(declare-fun m!324267 () Bool)

(assert (=> start!31436 m!324267))

(declare-fun m!324269 () Bool)

(assert (=> b!314829 m!324269))

(assert (=> b!314829 m!324269))

(declare-fun m!324271 () Bool)

(assert (=> b!314829 m!324271))

(declare-fun m!324273 () Bool)

(assert (=> b!314826 m!324273))

(declare-fun m!324275 () Bool)

(assert (=> b!314834 m!324275))

(declare-fun m!324277 () Bool)

(assert (=> b!314830 m!324277))

(push 1)

(assert (not b!314826))

