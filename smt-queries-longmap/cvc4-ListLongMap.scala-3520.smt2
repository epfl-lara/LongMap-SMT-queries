; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48694 () Bool)

(assert start!48694)

(declare-fun b!535123 () Bool)

(declare-fun res!330329 () Bool)

(declare-fun e!310929 () Bool)

(assert (=> b!535123 (=> (not res!330329) (not e!310929))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33906 0))(
  ( (array!33907 (arr!16292 (Array (_ BitVec 32) (_ BitVec 64))) (size!16656 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33906)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535123 (= res!330329 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16656 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16656 a!3154)) (= (select (arr!16292 a!3154) resIndex!32) (select (arr!16292 a!3154) j!147))))))

(declare-fun b!535124 () Bool)

(declare-fun res!330334 () Bool)

(declare-fun e!310931 () Bool)

(assert (=> b!535124 (=> (not res!330334) (not e!310931))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535124 (= res!330334 (validKeyInArray!0 k!1998))))

(declare-fun res!330335 () Bool)

(assert (=> start!48694 (=> (not res!330335) (not e!310931))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48694 (= res!330335 (validMask!0 mask!3216))))

(assert (=> start!48694 e!310931))

(assert (=> start!48694 true))

(declare-fun array_inv!12088 (array!33906) Bool)

(assert (=> start!48694 (array_inv!12088 a!3154)))

(declare-fun b!535125 () Bool)

(declare-fun res!330332 () Bool)

(assert (=> b!535125 (=> (not res!330332) (not e!310929))))

(declare-datatypes ((List!10411 0))(
  ( (Nil!10408) (Cons!10407 (h!11350 (_ BitVec 64)) (t!16639 List!10411)) )
))
(declare-fun arrayNoDuplicates!0 (array!33906 (_ BitVec 32) List!10411) Bool)

(assert (=> b!535125 (= res!330332 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10408))))

(declare-fun b!535126 () Bool)

(declare-fun res!330337 () Bool)

(assert (=> b!535126 (=> (not res!330337) (not e!310931))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535126 (= res!330337 (and (= (size!16656 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16656 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16656 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535127 () Bool)

(declare-fun res!330338 () Bool)

(assert (=> b!535127 (=> (not res!330338) (not e!310931))))

(declare-fun arrayContainsKey!0 (array!33906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535127 (= res!330338 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535128 () Bool)

(declare-fun res!330336 () Bool)

(declare-fun e!310930 () Bool)

(assert (=> b!535128 (=> (not res!330336) (not e!310930))))

(declare-datatypes ((SeekEntryResult!4750 0))(
  ( (MissingZero!4750 (index!21224 (_ BitVec 32))) (Found!4750 (index!21225 (_ BitVec 32))) (Intermediate!4750 (undefined!5562 Bool) (index!21226 (_ BitVec 32)) (x!50173 (_ BitVec 32))) (Undefined!4750) (MissingVacant!4750 (index!21227 (_ BitVec 32))) )
))
(declare-fun lt!245767 () SeekEntryResult!4750)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33906 (_ BitVec 32)) SeekEntryResult!4750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535128 (= res!330336 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16292 a!3154) j!147) mask!3216) (select (arr!16292 a!3154) j!147) a!3154 mask!3216) lt!245767))))

(declare-fun b!535129 () Bool)

(declare-fun res!330333 () Bool)

(assert (=> b!535129 (=> (not res!330333) (not e!310931))))

(assert (=> b!535129 (= res!330333 (validKeyInArray!0 (select (arr!16292 a!3154) j!147)))))

(declare-fun b!535130 () Bool)

(assert (=> b!535130 (= e!310930 (and (not (= (select (arr!16292 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16292 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16292 a!3154) index!1177) (select (arr!16292 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!535131 () Bool)

(assert (=> b!535131 (= e!310931 e!310929)))

(declare-fun res!330331 () Bool)

(assert (=> b!535131 (=> (not res!330331) (not e!310929))))

(declare-fun lt!245766 () SeekEntryResult!4750)

(assert (=> b!535131 (= res!330331 (or (= lt!245766 (MissingZero!4750 i!1153)) (= lt!245766 (MissingVacant!4750 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33906 (_ BitVec 32)) SeekEntryResult!4750)

(assert (=> b!535131 (= lt!245766 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535132 () Bool)

(assert (=> b!535132 (= e!310929 e!310930)))

(declare-fun res!330328 () Bool)

(assert (=> b!535132 (=> (not res!330328) (not e!310930))))

(assert (=> b!535132 (= res!330328 (= lt!245767 (Intermediate!4750 false resIndex!32 resX!32)))))

(assert (=> b!535132 (= lt!245767 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16292 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535133 () Bool)

(declare-fun res!330330 () Bool)

(assert (=> b!535133 (=> (not res!330330) (not e!310929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33906 (_ BitVec 32)) Bool)

(assert (=> b!535133 (= res!330330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48694 res!330335) b!535126))

(assert (= (and b!535126 res!330337) b!535129))

(assert (= (and b!535129 res!330333) b!535124))

(assert (= (and b!535124 res!330334) b!535127))

(assert (= (and b!535127 res!330338) b!535131))

(assert (= (and b!535131 res!330331) b!535133))

(assert (= (and b!535133 res!330330) b!535125))

(assert (= (and b!535125 res!330332) b!535123))

(assert (= (and b!535123 res!330329) b!535132))

(assert (= (and b!535132 res!330328) b!535128))

(assert (= (and b!535128 res!330336) b!535130))

(declare-fun m!514745 () Bool)

(assert (=> b!535133 m!514745))

(declare-fun m!514747 () Bool)

(assert (=> b!535125 m!514747))

(declare-fun m!514749 () Bool)

(assert (=> b!535131 m!514749))

(declare-fun m!514751 () Bool)

(assert (=> b!535130 m!514751))

(declare-fun m!514753 () Bool)

(assert (=> b!535130 m!514753))

(assert (=> b!535129 m!514753))

(assert (=> b!535129 m!514753))

(declare-fun m!514755 () Bool)

(assert (=> b!535129 m!514755))

(declare-fun m!514757 () Bool)

(assert (=> start!48694 m!514757))

(declare-fun m!514759 () Bool)

(assert (=> start!48694 m!514759))

(assert (=> b!535132 m!514753))

(assert (=> b!535132 m!514753))

(declare-fun m!514761 () Bool)

(assert (=> b!535132 m!514761))

(declare-fun m!514763 () Bool)

(assert (=> b!535127 m!514763))

(declare-fun m!514765 () Bool)

(assert (=> b!535124 m!514765))

(assert (=> b!535128 m!514753))

(assert (=> b!535128 m!514753))

(declare-fun m!514767 () Bool)

(assert (=> b!535128 m!514767))

(assert (=> b!535128 m!514767))

(assert (=> b!535128 m!514753))

(declare-fun m!514769 () Bool)

(assert (=> b!535128 m!514769))

(declare-fun m!514771 () Bool)

(assert (=> b!535123 m!514771))

(assert (=> b!535123 m!514753))

(push 1)

(assert (not b!535128))

(assert (not start!48694))

(assert (not b!535133))

(assert (not b!535129))

(assert (not b!535124))

(assert (not b!535132))

(assert (not b!535127))

(assert (not b!535131))

(assert (not b!535125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

