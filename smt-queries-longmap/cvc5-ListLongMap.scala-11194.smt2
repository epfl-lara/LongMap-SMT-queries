; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131182 () Bool)

(assert start!131182)

(declare-fun b!1536290 () Bool)

(declare-fun res!1051894 () Bool)

(declare-fun e!855798 () Bool)

(assert (=> b!1536290 (=> (not res!1051894) (not e!855798))))

(declare-datatypes ((array!102017 0))(
  ( (array!102018 (arr!49218 (Array (_ BitVec 32) (_ BitVec 64))) (size!49769 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102017)

(declare-datatypes ((List!35679 0))(
  ( (Nil!35676) (Cons!35675 (h!37138 (_ BitVec 64)) (t!50365 List!35679)) )
))
(declare-fun arrayNoDuplicates!0 (array!102017 (_ BitVec 32) List!35679) Bool)

(assert (=> b!1536290 (= res!1051894 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35676))))

(declare-fun b!1536291 () Bool)

(declare-fun res!1051891 () Bool)

(assert (=> b!1536291 (=> (not res!1051891) (not e!855798))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536291 (= res!1051891 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49769 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49769 a!2792)) (= (select (arr!49218 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536292 () Bool)

(declare-fun res!1051895 () Bool)

(assert (=> b!1536292 (=> (not res!1051895) (not e!855798))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102017 (_ BitVec 32)) Bool)

(assert (=> b!1536292 (= res!1051895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536293 () Bool)

(declare-fun res!1051890 () Bool)

(assert (=> b!1536293 (=> (not res!1051890) (not e!855798))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536293 (= res!1051890 (validKeyInArray!0 (select (arr!49218 a!2792) j!64)))))

(declare-fun res!1051892 () Bool)

(assert (=> start!131182 (=> (not res!1051892) (not e!855798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131182 (= res!1051892 (validMask!0 mask!2480))))

(assert (=> start!131182 e!855798))

(assert (=> start!131182 true))

(declare-fun array_inv!38499 (array!102017) Bool)

(assert (=> start!131182 (array_inv!38499 a!2792)))

(declare-fun b!1536294 () Bool)

(assert (=> b!1536294 (= e!855798 false)))

(declare-datatypes ((SeekEntryResult!13245 0))(
  ( (MissingZero!13245 (index!55375 (_ BitVec 32))) (Found!13245 (index!55376 (_ BitVec 32))) (Intermediate!13245 (undefined!14057 Bool) (index!55377 (_ BitVec 32)) (x!137342 (_ BitVec 32))) (Undefined!13245) (MissingVacant!13245 (index!55378 (_ BitVec 32))) )
))
(declare-fun lt!664704 () SeekEntryResult!13245)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102017 (_ BitVec 32)) SeekEntryResult!13245)

(assert (=> b!1536294 (= lt!664704 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49218 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536295 () Bool)

(declare-fun res!1051896 () Bool)

(assert (=> b!1536295 (=> (not res!1051896) (not e!855798))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536295 (= res!1051896 (validKeyInArray!0 (select (arr!49218 a!2792) i!951)))))

(declare-fun b!1536296 () Bool)

(declare-fun res!1051893 () Bool)

(assert (=> b!1536296 (=> (not res!1051893) (not e!855798))))

(assert (=> b!1536296 (= res!1051893 (and (= (size!49769 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49769 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49769 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131182 res!1051892) b!1536296))

(assert (= (and b!1536296 res!1051893) b!1536295))

(assert (= (and b!1536295 res!1051896) b!1536293))

(assert (= (and b!1536293 res!1051890) b!1536292))

(assert (= (and b!1536292 res!1051895) b!1536290))

(assert (= (and b!1536290 res!1051894) b!1536291))

(assert (= (and b!1536291 res!1051891) b!1536294))

(declare-fun m!1418837 () Bool)

(assert (=> b!1536293 m!1418837))

(assert (=> b!1536293 m!1418837))

(declare-fun m!1418839 () Bool)

(assert (=> b!1536293 m!1418839))

(declare-fun m!1418841 () Bool)

(assert (=> b!1536295 m!1418841))

(assert (=> b!1536295 m!1418841))

(declare-fun m!1418843 () Bool)

(assert (=> b!1536295 m!1418843))

(declare-fun m!1418845 () Bool)

(assert (=> b!1536292 m!1418845))

(declare-fun m!1418847 () Bool)

(assert (=> b!1536291 m!1418847))

(declare-fun m!1418849 () Bool)

(assert (=> b!1536290 m!1418849))

(declare-fun m!1418851 () Bool)

(assert (=> start!131182 m!1418851))

(declare-fun m!1418853 () Bool)

(assert (=> start!131182 m!1418853))

(assert (=> b!1536294 m!1418837))

(assert (=> b!1536294 m!1418837))

(declare-fun m!1418855 () Bool)

(assert (=> b!1536294 m!1418855))

(push 1)

(assert (not start!131182))

(assert (not b!1536295))

(assert (not b!1536294))

(assert (not b!1536290))

(assert (not b!1536293))

(assert (not b!1536292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

