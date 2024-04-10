; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130922 () Bool)

(assert start!130922)

(declare-fun b!1535663 () Bool)

(declare-fun res!1052758 () Bool)

(declare-fun e!854866 () Bool)

(assert (=> b!1535663 (=> (not res!1052758) (not e!854866))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((array!102020 0))(
  ( (array!102021 (arr!49226 (Array (_ BitVec 32) (_ BitVec 64))) (size!49776 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102020)

(assert (=> b!1535663 (= res!1052758 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49776 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49776 a!2792)) (= (select (arr!49226 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535664 () Bool)

(declare-fun e!854865 () Bool)

(assert (=> b!1535664 (= e!854866 e!854865)))

(declare-fun res!1052756 () Bool)

(assert (=> b!1535664 (=> (not res!1052756) (not e!854865))))

(declare-fun lt!664105 () (_ BitVec 32))

(assert (=> b!1535664 (= res!1052756 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664105 #b00000000000000000000000000000000) (bvslt lt!664105 (size!49776 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535664 (= lt!664105 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535665 () Bool)

(declare-fun res!1052752 () Bool)

(assert (=> b!1535665 (=> (not res!1052752) (not e!854866))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535665 (= res!1052752 (and (= (size!49776 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49776 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49776 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1052749 () Bool)

(assert (=> start!130922 (=> (not res!1052749) (not e!854866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130922 (= res!1052749 (validMask!0 mask!2480))))

(assert (=> start!130922 e!854866))

(assert (=> start!130922 true))

(declare-fun array_inv!38254 (array!102020) Bool)

(assert (=> start!130922 (array_inv!38254 a!2792)))

(declare-fun b!1535666 () Bool)

(declare-fun res!1052755 () Bool)

(assert (=> b!1535666 (=> (not res!1052755) (not e!854866))))

(declare-datatypes ((List!35700 0))(
  ( (Nil!35697) (Cons!35696 (h!37141 (_ BitVec 64)) (t!50394 List!35700)) )
))
(declare-fun arrayNoDuplicates!0 (array!102020 (_ BitVec 32) List!35700) Bool)

(assert (=> b!1535666 (= res!1052755 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35697))))

(declare-fun b!1535667 () Bool)

(declare-fun res!1052757 () Bool)

(assert (=> b!1535667 (=> (not res!1052757) (not e!854866))))

(assert (=> b!1535667 (= res!1052757 (not (= (select (arr!49226 a!2792) index!463) (select (arr!49226 a!2792) j!64))))))

(declare-fun b!1535668 () Bool)

(declare-fun res!1052754 () Bool)

(assert (=> b!1535668 (=> (not res!1052754) (not e!854866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535668 (= res!1052754 (validKeyInArray!0 (select (arr!49226 a!2792) i!951)))))

(declare-fun b!1535669 () Bool)

(declare-fun res!1052750 () Bool)

(assert (=> b!1535669 (=> (not res!1052750) (not e!854866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102020 (_ BitVec 32)) Bool)

(assert (=> b!1535669 (= res!1052750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535670 () Bool)

(declare-fun res!1052753 () Bool)

(assert (=> b!1535670 (=> (not res!1052753) (not e!854866))))

(declare-datatypes ((SeekEntryResult!13358 0))(
  ( (MissingZero!13358 (index!55827 (_ BitVec 32))) (Found!13358 (index!55828 (_ BitVec 32))) (Intermediate!13358 (undefined!14170 Bool) (index!55829 (_ BitVec 32)) (x!137576 (_ BitVec 32))) (Undefined!13358) (MissingVacant!13358 (index!55830 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102020 (_ BitVec 32)) SeekEntryResult!13358)

(assert (=> b!1535670 (= res!1052753 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49226 a!2792) j!64) a!2792 mask!2480) (Found!13358 j!64)))))

(declare-fun b!1535671 () Bool)

(assert (=> b!1535671 (= e!854865 false)))

(declare-fun lt!664104 () SeekEntryResult!13358)

(assert (=> b!1535671 (= lt!664104 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664105 vacantIndex!5 (select (arr!49226 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535672 () Bool)

(declare-fun res!1052751 () Bool)

(assert (=> b!1535672 (=> (not res!1052751) (not e!854866))))

(assert (=> b!1535672 (= res!1052751 (validKeyInArray!0 (select (arr!49226 a!2792) j!64)))))

(assert (= (and start!130922 res!1052749) b!1535665))

(assert (= (and b!1535665 res!1052752) b!1535668))

(assert (= (and b!1535668 res!1052754) b!1535672))

(assert (= (and b!1535672 res!1052751) b!1535669))

(assert (= (and b!1535669 res!1052750) b!1535666))

(assert (= (and b!1535666 res!1052755) b!1535663))

(assert (= (and b!1535663 res!1052758) b!1535670))

(assert (= (and b!1535670 res!1052753) b!1535667))

(assert (= (and b!1535667 res!1052757) b!1535664))

(assert (= (and b!1535664 res!1052756) b!1535671))

(declare-fun m!1418151 () Bool)

(assert (=> b!1535668 m!1418151))

(assert (=> b!1535668 m!1418151))

(declare-fun m!1418153 () Bool)

(assert (=> b!1535668 m!1418153))

(declare-fun m!1418155 () Bool)

(assert (=> b!1535663 m!1418155))

(declare-fun m!1418157 () Bool)

(assert (=> start!130922 m!1418157))

(declare-fun m!1418159 () Bool)

(assert (=> start!130922 m!1418159))

(declare-fun m!1418161 () Bool)

(assert (=> b!1535664 m!1418161))

(declare-fun m!1418163 () Bool)

(assert (=> b!1535666 m!1418163))

(declare-fun m!1418165 () Bool)

(assert (=> b!1535667 m!1418165))

(declare-fun m!1418167 () Bool)

(assert (=> b!1535667 m!1418167))

(assert (=> b!1535672 m!1418167))

(assert (=> b!1535672 m!1418167))

(declare-fun m!1418169 () Bool)

(assert (=> b!1535672 m!1418169))

(assert (=> b!1535671 m!1418167))

(assert (=> b!1535671 m!1418167))

(declare-fun m!1418171 () Bool)

(assert (=> b!1535671 m!1418171))

(declare-fun m!1418173 () Bool)

(assert (=> b!1535669 m!1418173))

(assert (=> b!1535670 m!1418167))

(assert (=> b!1535670 m!1418167))

(declare-fun m!1418175 () Bool)

(assert (=> b!1535670 m!1418175))

(push 1)

