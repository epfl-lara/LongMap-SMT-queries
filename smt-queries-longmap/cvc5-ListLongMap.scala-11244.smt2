; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131554 () Bool)

(assert start!131554)

(declare-fun res!1056179 () Bool)

(declare-fun e!857481 () Bool)

(assert (=> start!131554 (=> (not res!1056179) (not e!857481))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131554 (= res!1056179 (validMask!0 mask!2480))))

(assert (=> start!131554 e!857481))

(assert (=> start!131554 true))

(declare-datatypes ((array!102323 0))(
  ( (array!102324 (arr!49368 (Array (_ BitVec 32) (_ BitVec 64))) (size!49919 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102323)

(declare-fun array_inv!38649 (array!102323) Bool)

(assert (=> start!131554 (array_inv!38649 a!2792)))

(declare-fun b!1540770 () Bool)

(declare-fun res!1056177 () Bool)

(assert (=> b!1540770 (=> (not res!1056177) (not e!857481))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540770 (= res!1056177 (validKeyInArray!0 (select (arr!49368 a!2792) j!64)))))

(declare-fun b!1540771 () Bool)

(declare-fun res!1056175 () Bool)

(assert (=> b!1540771 (=> (not res!1056175) (not e!857481))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540771 (= res!1056175 (and (= (size!49919 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49919 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49919 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540772 () Bool)

(declare-fun res!1056173 () Bool)

(assert (=> b!1540772 (=> (not res!1056173) (not e!857481))))

(assert (=> b!1540772 (= res!1056173 (validKeyInArray!0 (select (arr!49368 a!2792) i!951)))))

(declare-fun b!1540773 () Bool)

(declare-fun res!1056176 () Bool)

(assert (=> b!1540773 (=> (not res!1056176) (not e!857481))))

(declare-datatypes ((List!35829 0))(
  ( (Nil!35826) (Cons!35825 (h!37288 (_ BitVec 64)) (t!50515 List!35829)) )
))
(declare-fun arrayNoDuplicates!0 (array!102323 (_ BitVec 32) List!35829) Bool)

(assert (=> b!1540773 (= res!1056176 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35826))))

(declare-fun b!1540774 () Bool)

(assert (=> b!1540774 (= e!857481 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665799 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540774 (= lt!665799 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1540775 () Bool)

(declare-fun res!1056178 () Bool)

(assert (=> b!1540775 (=> (not res!1056178) (not e!857481))))

(assert (=> b!1540775 (= res!1056178 (not (= (select (arr!49368 a!2792) index!463) (select (arr!49368 a!2792) j!64))))))

(declare-fun b!1540776 () Bool)

(declare-fun res!1056172 () Bool)

(assert (=> b!1540776 (=> (not res!1056172) (not e!857481))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13389 0))(
  ( (MissingZero!13389 (index!55951 (_ BitVec 32))) (Found!13389 (index!55952 (_ BitVec 32))) (Intermediate!13389 (undefined!14201 Bool) (index!55953 (_ BitVec 32)) (x!137892 (_ BitVec 32))) (Undefined!13389) (MissingVacant!13389 (index!55954 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102323 (_ BitVec 32)) SeekEntryResult!13389)

(assert (=> b!1540776 (= res!1056172 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49368 a!2792) j!64) a!2792 mask!2480) (Found!13389 j!64)))))

(declare-fun b!1540777 () Bool)

(declare-fun res!1056180 () Bool)

(assert (=> b!1540777 (=> (not res!1056180) (not e!857481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102323 (_ BitVec 32)) Bool)

(assert (=> b!1540777 (= res!1056180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540778 () Bool)

(declare-fun res!1056174 () Bool)

(assert (=> b!1540778 (=> (not res!1056174) (not e!857481))))

(assert (=> b!1540778 (= res!1056174 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49919 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49919 a!2792)) (= (select (arr!49368 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131554 res!1056179) b!1540771))

(assert (= (and b!1540771 res!1056175) b!1540772))

(assert (= (and b!1540772 res!1056173) b!1540770))

(assert (= (and b!1540770 res!1056177) b!1540777))

(assert (= (and b!1540777 res!1056180) b!1540773))

(assert (= (and b!1540773 res!1056176) b!1540778))

(assert (= (and b!1540778 res!1056174) b!1540776))

(assert (= (and b!1540776 res!1056172) b!1540775))

(assert (= (and b!1540775 res!1056178) b!1540774))

(declare-fun m!1423015 () Bool)

(assert (=> b!1540775 m!1423015))

(declare-fun m!1423017 () Bool)

(assert (=> b!1540775 m!1423017))

(declare-fun m!1423019 () Bool)

(assert (=> b!1540774 m!1423019))

(assert (=> b!1540770 m!1423017))

(assert (=> b!1540770 m!1423017))

(declare-fun m!1423021 () Bool)

(assert (=> b!1540770 m!1423021))

(declare-fun m!1423023 () Bool)

(assert (=> b!1540777 m!1423023))

(declare-fun m!1423025 () Bool)

(assert (=> b!1540778 m!1423025))

(assert (=> b!1540776 m!1423017))

(assert (=> b!1540776 m!1423017))

(declare-fun m!1423027 () Bool)

(assert (=> b!1540776 m!1423027))

(declare-fun m!1423029 () Bool)

(assert (=> b!1540772 m!1423029))

(assert (=> b!1540772 m!1423029))

(declare-fun m!1423031 () Bool)

(assert (=> b!1540772 m!1423031))

(declare-fun m!1423033 () Bool)

(assert (=> b!1540773 m!1423033))

(declare-fun m!1423035 () Bool)

(assert (=> start!131554 m!1423035))

(declare-fun m!1423037 () Bool)

(assert (=> start!131554 m!1423037))

(push 1)

(assert (not start!131554))

(assert (not b!1540777))

(assert (not b!1540773))

(assert (not b!1540774))

(assert (not b!1540776))

(assert (not b!1540770))

(assert (not b!1540772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

