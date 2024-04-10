; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44286 () Bool)

(assert start!44286)

(declare-fun b!487000 () Bool)

(declare-fun res!290386 () Bool)

(declare-fun e!286614 () Bool)

(assert (=> b!487000 (=> (not res!290386) (not e!286614))))

(declare-datatypes ((array!31537 0))(
  ( (array!31538 (arr!15162 (Array (_ BitVec 32) (_ BitVec 64))) (size!15526 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31537)

(declare-datatypes ((List!9320 0))(
  ( (Nil!9317) (Cons!9316 (h!10172 (_ BitVec 64)) (t!15548 List!9320)) )
))
(declare-fun arrayNoDuplicates!0 (array!31537 (_ BitVec 32) List!9320) Bool)

(assert (=> b!487000 (= res!290386 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9317))))

(declare-fun b!487001 () Bool)

(declare-fun res!290393 () Bool)

(assert (=> b!487001 (=> (not res!290393) (not e!286614))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31537 (_ BitVec 32)) Bool)

(assert (=> b!487001 (= res!290393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487002 () Bool)

(declare-fun e!286612 () Bool)

(assert (=> b!487002 (= e!286612 e!286614)))

(declare-fun res!290388 () Bool)

(assert (=> b!487002 (=> (not res!290388) (not e!286614))))

(declare-datatypes ((SeekEntryResult!3629 0))(
  ( (MissingZero!3629 (index!16695 (_ BitVec 32))) (Found!3629 (index!16696 (_ BitVec 32))) (Intermediate!3629 (undefined!4441 Bool) (index!16697 (_ BitVec 32)) (x!45825 (_ BitVec 32))) (Undefined!3629) (MissingVacant!3629 (index!16698 (_ BitVec 32))) )
))
(declare-fun lt!219916 () SeekEntryResult!3629)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487002 (= res!290388 (or (= lt!219916 (MissingZero!3629 i!1204)) (= lt!219916 (MissingVacant!3629 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31537 (_ BitVec 32)) SeekEntryResult!3629)

(assert (=> b!487002 (= lt!219916 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487003 () Bool)

(declare-fun res!290387 () Bool)

(assert (=> b!487003 (=> (not res!290387) (not e!286612))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487003 (= res!290387 (and (= (size!15526 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15526 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15526 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487004 () Bool)

(assert (=> b!487004 (= e!286614 (not true))))

(assert (=> b!487004 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14204 0))(
  ( (Unit!14205) )
))
(declare-fun lt!219915 () Unit!14204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14204)

(assert (=> b!487004 (= lt!219915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487005 () Bool)

(declare-fun res!290389 () Bool)

(assert (=> b!487005 (=> (not res!290389) (not e!286612))))

(declare-fun arrayContainsKey!0 (array!31537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487005 (= res!290389 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290390 () Bool)

(assert (=> start!44286 (=> (not res!290390) (not e!286612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44286 (= res!290390 (validMask!0 mask!3524))))

(assert (=> start!44286 e!286612))

(assert (=> start!44286 true))

(declare-fun array_inv!10958 (array!31537) Bool)

(assert (=> start!44286 (array_inv!10958 a!3235)))

(declare-fun b!487006 () Bool)

(declare-fun res!290391 () Bool)

(assert (=> b!487006 (=> (not res!290391) (not e!286612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487006 (= res!290391 (validKeyInArray!0 k!2280))))

(declare-fun b!487007 () Bool)

(declare-fun res!290392 () Bool)

(assert (=> b!487007 (=> (not res!290392) (not e!286612))))

(assert (=> b!487007 (= res!290392 (validKeyInArray!0 (select (arr!15162 a!3235) j!176)))))

(assert (= (and start!44286 res!290390) b!487003))

(assert (= (and b!487003 res!290387) b!487007))

(assert (= (and b!487007 res!290392) b!487006))

(assert (= (and b!487006 res!290391) b!487005))

(assert (= (and b!487005 res!290389) b!487002))

(assert (= (and b!487002 res!290388) b!487001))

(assert (= (and b!487001 res!290393) b!487000))

(assert (= (and b!487000 res!290386) b!487004))

(declare-fun m!466857 () Bool)

(assert (=> b!487005 m!466857))

(declare-fun m!466859 () Bool)

(assert (=> start!44286 m!466859))

(declare-fun m!466861 () Bool)

(assert (=> start!44286 m!466861))

(declare-fun m!466863 () Bool)

(assert (=> b!487004 m!466863))

(declare-fun m!466865 () Bool)

(assert (=> b!487004 m!466865))

(declare-fun m!466867 () Bool)

(assert (=> b!487002 m!466867))

(declare-fun m!466869 () Bool)

(assert (=> b!487001 m!466869))

(declare-fun m!466871 () Bool)

(assert (=> b!487007 m!466871))

(assert (=> b!487007 m!466871))

(declare-fun m!466873 () Bool)

(assert (=> b!487007 m!466873))

(declare-fun m!466875 () Bool)

(assert (=> b!487006 m!466875))

(declare-fun m!466877 () Bool)

(assert (=> b!487000 m!466877))

(push 1)

