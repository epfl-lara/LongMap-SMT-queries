; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92554 () Bool)

(assert start!92554)

(declare-fun b!1052784 () Bool)

(declare-fun e!597783 () Bool)

(assert (=> b!1052784 (= e!597783 (not true))))

(declare-datatypes ((array!66355 0))(
  ( (array!66356 (arr!31917 (Array (_ BitVec 32) (_ BitVec 64))) (size!32453 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66355)

(declare-fun lt!464963 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052784 (= (select (store (arr!31917 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464963) k!2747)))

(declare-fun b!1052785 () Bool)

(declare-fun e!597781 () Bool)

(declare-fun e!597782 () Bool)

(assert (=> b!1052785 (= e!597781 e!597782)))

(declare-fun res!701912 () Bool)

(assert (=> b!1052785 (=> (not res!701912) (not e!597782))))

(declare-fun lt!464964 () array!66355)

(declare-fun arrayContainsKey!0 (array!66355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052785 (= res!701912 (arrayContainsKey!0 lt!464964 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052785 (= lt!464964 (array!66356 (store (arr!31917 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32453 a!3488)))))

(declare-fun b!1052786 () Bool)

(assert (=> b!1052786 (= e!597782 e!597783)))

(declare-fun res!701913 () Bool)

(assert (=> b!1052786 (=> (not res!701913) (not e!597783))))

(assert (=> b!1052786 (= res!701913 (not (= lt!464963 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66355 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052786 (= lt!464963 (arrayScanForKey!0 lt!464964 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052787 () Bool)

(declare-fun res!701911 () Bool)

(assert (=> b!1052787 (=> (not res!701911) (not e!597781))))

(declare-datatypes ((List!22229 0))(
  ( (Nil!22226) (Cons!22225 (h!23434 (_ BitVec 64)) (t!31536 List!22229)) )
))
(declare-fun arrayNoDuplicates!0 (array!66355 (_ BitVec 32) List!22229) Bool)

(assert (=> b!1052787 (= res!701911 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22226))))

(declare-fun res!701915 () Bool)

(assert (=> start!92554 (=> (not res!701915) (not e!597781))))

(assert (=> start!92554 (= res!701915 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32453 a!3488)) (bvslt (size!32453 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92554 e!597781))

(assert (=> start!92554 true))

(declare-fun array_inv!24697 (array!66355) Bool)

(assert (=> start!92554 (array_inv!24697 a!3488)))

(declare-fun b!1052788 () Bool)

(declare-fun res!701910 () Bool)

(assert (=> b!1052788 (=> (not res!701910) (not e!597781))))

(assert (=> b!1052788 (= res!701910 (= (select (arr!31917 a!3488) i!1381) k!2747))))

(declare-fun b!1052789 () Bool)

(declare-fun res!701914 () Bool)

(assert (=> b!1052789 (=> (not res!701914) (not e!597781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052789 (= res!701914 (validKeyInArray!0 k!2747))))

(assert (= (and start!92554 res!701915) b!1052787))

(assert (= (and b!1052787 res!701911) b!1052789))

(assert (= (and b!1052789 res!701914) b!1052788))

(assert (= (and b!1052788 res!701910) b!1052785))

(assert (= (and b!1052785 res!701912) b!1052786))

(assert (= (and b!1052786 res!701913) b!1052784))

(declare-fun m!973189 () Bool)

(assert (=> b!1052788 m!973189))

(declare-fun m!973191 () Bool)

(assert (=> b!1052787 m!973191))

(declare-fun m!973193 () Bool)

(assert (=> start!92554 m!973193))

(declare-fun m!973195 () Bool)

(assert (=> b!1052789 m!973195))

(declare-fun m!973197 () Bool)

(assert (=> b!1052784 m!973197))

(declare-fun m!973199 () Bool)

(assert (=> b!1052784 m!973199))

(declare-fun m!973201 () Bool)

(assert (=> b!1052786 m!973201))

(declare-fun m!973203 () Bool)

(assert (=> b!1052785 m!973203))

(assert (=> b!1052785 m!973197))

(push 1)

(assert (not start!92554))

(assert (not b!1052786))

(assert (not b!1052789))

(assert (not b!1052785))

