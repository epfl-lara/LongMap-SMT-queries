; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93060 () Bool)

(assert start!93060)

(declare-fun b!1055811 () Bool)

(declare-fun res!704625 () Bool)

(declare-fun e!600116 () Bool)

(assert (=> b!1055811 (=> (not res!704625) (not e!600116))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055811 (= res!704625 (validKeyInArray!0 k!2747))))

(declare-fun b!1055812 () Bool)

(declare-fun res!704631 () Bool)

(assert (=> b!1055812 (=> (not res!704631) (not e!600116))))

(declare-datatypes ((array!66585 0))(
  ( (array!66586 (arr!32020 (Array (_ BitVec 32) (_ BitVec 64))) (size!32556 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66585)

(declare-datatypes ((List!22332 0))(
  ( (Nil!22329) (Cons!22328 (h!23537 (_ BitVec 64)) (t!31639 List!22332)) )
))
(declare-fun arrayNoDuplicates!0 (array!66585 (_ BitVec 32) List!22332) Bool)

(assert (=> b!1055812 (= res!704631 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22329))))

(declare-fun b!1055813 () Bool)

(declare-fun e!600118 () Bool)

(declare-fun e!600121 () Bool)

(assert (=> b!1055813 (= e!600118 e!600121)))

(declare-fun res!704626 () Bool)

(assert (=> b!1055813 (=> (not res!704626) (not e!600121))))

(declare-fun lt!465923 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055813 (= res!704626 (not (= lt!465923 i!1381)))))

(declare-fun lt!465925 () array!66585)

(declare-fun arrayScanForKey!0 (array!66585 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055813 (= lt!465923 (arrayScanForKey!0 lt!465925 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055814 () Bool)

(declare-fun e!600117 () Bool)

(declare-fun e!600115 () Bool)

(assert (=> b!1055814 (= e!600117 e!600115)))

(declare-fun res!704629 () Bool)

(assert (=> b!1055814 (=> res!704629 e!600115)))

(assert (=> b!1055814 (= res!704629 (bvsle lt!465923 i!1381))))

(declare-fun b!1055815 () Bool)

(declare-fun res!704628 () Bool)

(assert (=> b!1055815 (=> (not res!704628) (not e!600116))))

(assert (=> b!1055815 (= res!704628 (= (select (arr!32020 a!3488) i!1381) k!2747))))

(declare-fun b!1055816 () Bool)

(assert (=> b!1055816 (= e!600116 e!600118)))

(declare-fun res!704632 () Bool)

(assert (=> b!1055816 (=> (not res!704632) (not e!600118))))

(declare-fun arrayContainsKey!0 (array!66585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055816 (= res!704632 (arrayContainsKey!0 lt!465925 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055816 (= lt!465925 (array!66586 (store (arr!32020 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32556 a!3488)))))

(declare-fun b!1055817 () Bool)

(assert (=> b!1055817 (= e!600115 (arrayContainsKey!0 a!3488 k!2747 lt!465923))))

(declare-fun res!704633 () Bool)

(assert (=> start!93060 (=> (not res!704633) (not e!600116))))

(assert (=> start!93060 (= res!704633 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32556 a!3488)) (bvslt (size!32556 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93060 e!600116))

(assert (=> start!93060 true))

(declare-fun array_inv!24800 (array!66585) Bool)

(assert (=> start!93060 (array_inv!24800 a!3488)))

(declare-fun b!1055818 () Bool)

(declare-fun e!600119 () Bool)

(assert (=> b!1055818 (= e!600119 true)))

(assert (=> b!1055818 false))

(declare-datatypes ((Unit!34598 0))(
  ( (Unit!34599) )
))
(declare-fun lt!465926 () Unit!34598)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66585 (_ BitVec 64) (_ BitVec 32) List!22332) Unit!34598)

(assert (=> b!1055818 (= lt!465926 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22329))))

(assert (=> b!1055818 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465924 () Unit!34598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34598)

(assert (=> b!1055818 (= lt!465924 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465923 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055818 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22329)))

(declare-fun lt!465927 () Unit!34598)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66585 (_ BitVec 32) (_ BitVec 32)) Unit!34598)

(assert (=> b!1055818 (= lt!465927 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055819 () Bool)

(assert (=> b!1055819 (= e!600121 (not e!600119))))

(declare-fun res!704627 () Bool)

(assert (=> b!1055819 (=> res!704627 e!600119)))

(assert (=> b!1055819 (= res!704627 (bvsle lt!465923 i!1381))))

(assert (=> b!1055819 e!600117))

(declare-fun res!704630 () Bool)

(assert (=> b!1055819 (=> (not res!704630) (not e!600117))))

(assert (=> b!1055819 (= res!704630 (= (select (store (arr!32020 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465923) k!2747))))

(assert (= (and start!93060 res!704633) b!1055812))

(assert (= (and b!1055812 res!704631) b!1055811))

(assert (= (and b!1055811 res!704625) b!1055815))

(assert (= (and b!1055815 res!704628) b!1055816))

(assert (= (and b!1055816 res!704632) b!1055813))

(assert (= (and b!1055813 res!704626) b!1055819))

(assert (= (and b!1055819 res!704630) b!1055814))

(assert (= (and b!1055814 (not res!704629)) b!1055817))

(assert (= (and b!1055819 (not res!704627)) b!1055818))

(declare-fun m!975785 () Bool)

(assert (=> b!1055811 m!975785))

(declare-fun m!975787 () Bool)

(assert (=> start!93060 m!975787))

(declare-fun m!975789 () Bool)

(assert (=> b!1055817 m!975789))

(declare-fun m!975791 () Bool)

(assert (=> b!1055812 m!975791))

(declare-fun m!975793 () Bool)

(assert (=> b!1055818 m!975793))

(declare-fun m!975795 () Bool)

(assert (=> b!1055818 m!975795))

(declare-fun m!975797 () Bool)

(assert (=> b!1055818 m!975797))

(declare-fun m!975799 () Bool)

(assert (=> b!1055818 m!975799))

(declare-fun m!975801 () Bool)

(assert (=> b!1055818 m!975801))

(declare-fun m!975803 () Bool)

(assert (=> b!1055813 m!975803))

(declare-fun m!975805 () Bool)

(assert (=> b!1055816 m!975805))

(declare-fun m!975807 () Bool)

(assert (=> b!1055816 m!975807))

(assert (=> b!1055819 m!975807))

(declare-fun m!975809 () Bool)

(assert (=> b!1055819 m!975809))

(declare-fun m!975811 () Bool)

(assert (=> b!1055815 m!975811))

(push 1)

