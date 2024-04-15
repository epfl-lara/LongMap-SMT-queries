; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130790 () Bool)

(assert start!130790)

(declare-fun b!1534132 () Bool)

(declare-fun res!1051405 () Bool)

(declare-fun e!854301 () Bool)

(assert (=> b!1534132 (=> (not res!1051405) (not e!854301))))

(declare-datatypes ((array!101886 0))(
  ( (array!101887 (arr!49160 (Array (_ BitVec 32) (_ BitVec 64))) (size!49712 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101886)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534132 (= res!1051405 (and (= (size!49712 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49712 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49712 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534133 () Bool)

(declare-fun res!1051402 () Bool)

(assert (=> b!1534133 (=> (not res!1051402) (not e!854301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534133 (= res!1051402 (validKeyInArray!0 (select (arr!49160 a!2792) i!951)))))

(declare-fun res!1051403 () Bool)

(assert (=> start!130790 (=> (not res!1051403) (not e!854301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130790 (= res!1051403 (validMask!0 mask!2480))))

(assert (=> start!130790 e!854301))

(assert (=> start!130790 true))

(declare-fun array_inv!38393 (array!101886) Bool)

(assert (=> start!130790 (array_inv!38393 a!2792)))

(declare-fun b!1534134 () Bool)

(declare-fun res!1051404 () Bool)

(assert (=> b!1534134 (=> (not res!1051404) (not e!854301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101886 (_ BitVec 32)) Bool)

(assert (=> b!1534134 (= res!1051404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534135 () Bool)

(declare-fun res!1051408 () Bool)

(assert (=> b!1534135 (=> (not res!1051408) (not e!854301))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534135 (= res!1051408 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49712 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49712 a!2792)) (= (select (arr!49160 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534136 () Bool)

(declare-fun res!1051407 () Bool)

(assert (=> b!1534136 (=> (not res!1051407) (not e!854301))))

(declare-datatypes ((List!35712 0))(
  ( (Nil!35709) (Cons!35708 (h!37154 (_ BitVec 64)) (t!50398 List!35712)) )
))
(declare-fun arrayNoDuplicates!0 (array!101886 (_ BitVec 32) List!35712) Bool)

(assert (=> b!1534136 (= res!1051407 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35709))))

(declare-fun b!1534137 () Bool)

(assert (=> b!1534137 (= e!854301 false)))

(declare-datatypes ((SeekEntryResult!13317 0))(
  ( (MissingZero!13317 (index!55663 (_ BitVec 32))) (Found!13317 (index!55664 (_ BitVec 32))) (Intermediate!13317 (undefined!14129 Bool) (index!55665 (_ BitVec 32)) (x!137418 (_ BitVec 32))) (Undefined!13317) (MissingVacant!13317 (index!55666 (_ BitVec 32))) )
))
(declare-fun lt!663576 () SeekEntryResult!13317)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101886 (_ BitVec 32)) SeekEntryResult!13317)

(assert (=> b!1534137 (= lt!663576 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49160 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534138 () Bool)

(declare-fun res!1051406 () Bool)

(assert (=> b!1534138 (=> (not res!1051406) (not e!854301))))

(assert (=> b!1534138 (= res!1051406 (validKeyInArray!0 (select (arr!49160 a!2792) j!64)))))

(assert (= (and start!130790 res!1051403) b!1534132))

(assert (= (and b!1534132 res!1051405) b!1534133))

(assert (= (and b!1534133 res!1051402) b!1534138))

(assert (= (and b!1534138 res!1051406) b!1534134))

(assert (= (and b!1534134 res!1051404) b!1534136))

(assert (= (and b!1534136 res!1051407) b!1534135))

(assert (= (and b!1534135 res!1051408) b!1534137))

(declare-fun m!1416205 () Bool)

(assert (=> start!130790 m!1416205))

(declare-fun m!1416207 () Bool)

(assert (=> start!130790 m!1416207))

(declare-fun m!1416209 () Bool)

(assert (=> b!1534137 m!1416209))

(assert (=> b!1534137 m!1416209))

(declare-fun m!1416211 () Bool)

(assert (=> b!1534137 m!1416211))

(declare-fun m!1416213 () Bool)

(assert (=> b!1534135 m!1416213))

(assert (=> b!1534138 m!1416209))

(assert (=> b!1534138 m!1416209))

(declare-fun m!1416215 () Bool)

(assert (=> b!1534138 m!1416215))

(declare-fun m!1416217 () Bool)

(assert (=> b!1534133 m!1416217))

(assert (=> b!1534133 m!1416217))

(declare-fun m!1416219 () Bool)

(assert (=> b!1534133 m!1416219))

(declare-fun m!1416221 () Bool)

(assert (=> b!1534136 m!1416221))

(declare-fun m!1416223 () Bool)

(assert (=> b!1534134 m!1416223))

(push 1)

(assert (not b!1534138))

(assert (not b!1534137))

(assert (not start!130790))

(assert (not b!1534133))

(assert (not b!1534136))

(assert (not b!1534134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

