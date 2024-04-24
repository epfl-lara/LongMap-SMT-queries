; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118116 () Bool)

(assert start!118116)

(declare-fun res!923642 () Bool)

(declare-fun e!783967 () Bool)

(assert (=> start!118116 (=> (not res!923642) (not e!783967))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118116 (= res!923642 (validMask!0 mask!3034))))

(assert (=> start!118116 e!783967))

(assert (=> start!118116 true))

(declare-datatypes ((array!94403 0))(
  ( (array!94404 (arr!45582 (Array (_ BitVec 32) (_ BitVec 64))) (size!46133 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94403)

(declare-fun array_inv!34863 (array!94403) Bool)

(assert (=> start!118116 (array_inv!34863 a!2971)))

(declare-fun b!1382803 () Bool)

(declare-fun res!923644 () Bool)

(assert (=> b!1382803 (=> (not res!923644) (not e!783967))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382803 (= res!923644 (and (= (size!46133 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46133 a!2971))))))

(declare-fun b!1382804 () Bool)

(declare-fun res!923643 () Bool)

(assert (=> b!1382804 (=> (not res!923643) (not e!783967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382804 (= res!923643 (validKeyInArray!0 (select (arr!45582 a!2971) i!1094)))))

(declare-fun b!1382805 () Bool)

(assert (=> b!1382805 (= e!783967 false)))

(declare-fun lt!608703 () Bool)

(declare-datatypes ((List!32103 0))(
  ( (Nil!32100) (Cons!32099 (h!33317 (_ BitVec 64)) (t!46789 List!32103)) )
))
(declare-fun arrayNoDuplicates!0 (array!94403 (_ BitVec 32) List!32103) Bool)

(assert (=> b!1382805 (= lt!608703 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32100))))

(assert (= (and start!118116 res!923642) b!1382803))

(assert (= (and b!1382803 res!923644) b!1382804))

(assert (= (and b!1382804 res!923643) b!1382805))

(declare-fun m!1268315 () Bool)

(assert (=> start!118116 m!1268315))

(declare-fun m!1268317 () Bool)

(assert (=> start!118116 m!1268317))

(declare-fun m!1268319 () Bool)

(assert (=> b!1382804 m!1268319))

(assert (=> b!1382804 m!1268319))

(declare-fun m!1268321 () Bool)

(assert (=> b!1382804 m!1268321))

(declare-fun m!1268323 () Bool)

(assert (=> b!1382805 m!1268323))

(push 1)

(assert (not b!1382804))

(assert (not start!118116))

(assert (not b!1382805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

