; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92278 () Bool)

(assert start!92278)

(declare-fun b!1048732 () Bool)

(declare-fun e!594885 () Bool)

(assert (=> b!1048732 (= e!594885 (not true))))

(declare-fun e!594883 () Bool)

(assert (=> b!1048732 e!594883))

(declare-fun res!697864 () Bool)

(assert (=> b!1048732 (=> (not res!697864) (not e!594883))))

(declare-datatypes ((array!66079 0))(
  ( (array!66080 (arr!31779 (Array (_ BitVec 32) (_ BitVec 64))) (size!32315 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66079)

(declare-fun lt!463272 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048732 (= res!697864 (= (select (store (arr!31779 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463272) k!2747))))

(declare-fun b!1048733 () Bool)

(declare-fun e!594881 () Bool)

(assert (=> b!1048733 (= e!594883 e!594881)))

(declare-fun res!697858 () Bool)

(assert (=> b!1048733 (=> res!697858 e!594881)))

(assert (=> b!1048733 (= res!697858 (bvsle lt!463272 i!1381))))

(declare-fun b!1048734 () Bool)

(declare-fun e!594882 () Bool)

(assert (=> b!1048734 (= e!594882 e!594885)))

(declare-fun res!697859 () Bool)

(assert (=> b!1048734 (=> (not res!697859) (not e!594885))))

(assert (=> b!1048734 (= res!697859 (not (= lt!463272 i!1381)))))

(declare-fun lt!463271 () array!66079)

(declare-fun arrayScanForKey!0 (array!66079 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048734 (= lt!463272 (arrayScanForKey!0 lt!463271 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048735 () Bool)

(declare-fun arrayContainsKey!0 (array!66079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048735 (= e!594881 (arrayContainsKey!0 a!3488 k!2747 lt!463272))))

(declare-fun res!697862 () Bool)

(declare-fun e!594886 () Bool)

(assert (=> start!92278 (=> (not res!697862) (not e!594886))))

(assert (=> start!92278 (= res!697862 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32315 a!3488)) (bvslt (size!32315 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92278 e!594886))

(assert (=> start!92278 true))

(declare-fun array_inv!24559 (array!66079) Bool)

(assert (=> start!92278 (array_inv!24559 a!3488)))

(declare-fun b!1048736 () Bool)

(assert (=> b!1048736 (= e!594886 e!594882)))

(declare-fun res!697861 () Bool)

(assert (=> b!1048736 (=> (not res!697861) (not e!594882))))

(assert (=> b!1048736 (= res!697861 (arrayContainsKey!0 lt!463271 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048736 (= lt!463271 (array!66080 (store (arr!31779 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32315 a!3488)))))

(declare-fun b!1048737 () Bool)

(declare-fun res!697863 () Bool)

(assert (=> b!1048737 (=> (not res!697863) (not e!594886))))

(declare-datatypes ((List!22091 0))(
  ( (Nil!22088) (Cons!22087 (h!23296 (_ BitVec 64)) (t!31398 List!22091)) )
))
(declare-fun arrayNoDuplicates!0 (array!66079 (_ BitVec 32) List!22091) Bool)

(assert (=> b!1048737 (= res!697863 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22088))))

(declare-fun b!1048738 () Bool)

(declare-fun res!697860 () Bool)

(assert (=> b!1048738 (=> (not res!697860) (not e!594886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048738 (= res!697860 (validKeyInArray!0 k!2747))))

(declare-fun b!1048739 () Bool)

(declare-fun res!697865 () Bool)

(assert (=> b!1048739 (=> (not res!697865) (not e!594886))))

(assert (=> b!1048739 (= res!697865 (= (select (arr!31779 a!3488) i!1381) k!2747))))

(assert (= (and start!92278 res!697862) b!1048737))

(assert (= (and b!1048737 res!697863) b!1048738))

(assert (= (and b!1048738 res!697860) b!1048739))

(assert (= (and b!1048739 res!697865) b!1048736))

(assert (= (and b!1048736 res!697861) b!1048734))

(assert (= (and b!1048734 res!697859) b!1048732))

(assert (= (and b!1048732 res!697864) b!1048733))

(assert (= (and b!1048733 (not res!697858)) b!1048735))

(declare-fun m!969629 () Bool)

(assert (=> b!1048738 m!969629))

(declare-fun m!969631 () Bool)

(assert (=> b!1048735 m!969631))

(declare-fun m!969633 () Bool)

(assert (=> b!1048739 m!969633))

(declare-fun m!969635 () Bool)

(assert (=> b!1048734 m!969635))

(declare-fun m!969637 () Bool)

(assert (=> start!92278 m!969637))

(declare-fun m!969639 () Bool)

(assert (=> b!1048736 m!969639))

(declare-fun m!969641 () Bool)

(assert (=> b!1048736 m!969641))

(declare-fun m!969643 () Bool)

(assert (=> b!1048737 m!969643))

(assert (=> b!1048732 m!969641))

(declare-fun m!969645 () Bool)

(assert (=> b!1048732 m!969645))

(push 1)

(assert (not b!1048734))

(assert (not b!1048735))

(assert (not b!1048737))

(assert (not start!92278))

(assert (not b!1048738))

(assert (not b!1048736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

