; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86040 () Bool)

(assert start!86040)

(declare-fun b!996621 () Bool)

(declare-fun e!562259 () Bool)

(declare-fun e!562260 () Bool)

(assert (=> b!996621 (= e!562259 e!562260)))

(declare-fun res!666738 () Bool)

(assert (=> b!996621 (=> (not res!666738) (not e!562260))))

(declare-datatypes ((SeekEntryResult!9286 0))(
  ( (MissingZero!9286 (index!39515 (_ BitVec 32))) (Found!9286 (index!39516 (_ BitVec 32))) (Intermediate!9286 (undefined!10098 Bool) (index!39517 (_ BitVec 32)) (x!86946 (_ BitVec 32))) (Undefined!9286) (MissingVacant!9286 (index!39518 (_ BitVec 32))) )
))
(declare-fun lt!441266 () SeekEntryResult!9286)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996621 (= res!666738 (or (= lt!441266 (MissingVacant!9286 i!1194)) (= lt!441266 (MissingZero!9286 i!1194))))))

(declare-datatypes ((array!63045 0))(
  ( (array!63046 (arr!30354 (Array (_ BitVec 32) (_ BitVec 64))) (size!30856 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63045)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63045 (_ BitVec 32)) SeekEntryResult!9286)

(assert (=> b!996621 (= lt!441266 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996622 () Bool)

(declare-fun res!666739 () Bool)

(assert (=> b!996622 (=> (not res!666739) (not e!562260))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996622 (= res!666739 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30856 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30856 a!3219))))))

(declare-fun b!996623 () Bool)

(declare-fun res!666743 () Bool)

(assert (=> b!996623 (=> (not res!666743) (not e!562260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63045 (_ BitVec 32)) Bool)

(assert (=> b!996623 (= res!666743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996625 () Bool)

(declare-fun res!666735 () Bool)

(assert (=> b!996625 (=> (not res!666735) (not e!562259))))

(declare-fun arrayContainsKey!0 (array!63045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996625 (= res!666735 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996626 () Bool)

(declare-fun res!666742 () Bool)

(assert (=> b!996626 (=> (not res!666742) (not e!562260))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63045 (_ BitVec 32)) SeekEntryResult!9286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996626 (= res!666742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30354 a!3219) j!170) mask!3464) (select (arr!30354 a!3219) j!170) a!3219 mask!3464) (Intermediate!9286 false resIndex!38 resX!38)))))

(declare-fun b!996627 () Bool)

(declare-fun res!666737 () Bool)

(assert (=> b!996627 (=> (not res!666737) (not e!562259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996627 (= res!666737 (validKeyInArray!0 (select (arr!30354 a!3219) j!170)))))

(declare-fun b!996628 () Bool)

(assert (=> b!996628 (= e!562260 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!996629 () Bool)

(declare-fun res!666736 () Bool)

(assert (=> b!996629 (=> (not res!666736) (not e!562259))))

(assert (=> b!996629 (= res!666736 (validKeyInArray!0 k!2224))))

(declare-fun b!996630 () Bool)

(declare-fun res!666741 () Bool)

(assert (=> b!996630 (=> (not res!666741) (not e!562260))))

(declare-datatypes ((List!21030 0))(
  ( (Nil!21027) (Cons!21026 (h!22191 (_ BitVec 64)) (t!30031 List!21030)) )
))
(declare-fun arrayNoDuplicates!0 (array!63045 (_ BitVec 32) List!21030) Bool)

(assert (=> b!996630 (= res!666741 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21027))))

(declare-fun res!666744 () Bool)

(assert (=> start!86040 (=> (not res!666744) (not e!562259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86040 (= res!666744 (validMask!0 mask!3464))))

(assert (=> start!86040 e!562259))

(declare-fun array_inv!23478 (array!63045) Bool)

(assert (=> start!86040 (array_inv!23478 a!3219)))

(assert (=> start!86040 true))

(declare-fun b!996624 () Bool)

(declare-fun res!666740 () Bool)

(assert (=> b!996624 (=> (not res!666740) (not e!562259))))

(assert (=> b!996624 (= res!666740 (and (= (size!30856 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30856 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30856 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86040 res!666744) b!996624))

(assert (= (and b!996624 res!666740) b!996627))

(assert (= (and b!996627 res!666737) b!996629))

(assert (= (and b!996629 res!666736) b!996625))

(assert (= (and b!996625 res!666735) b!996621))

(assert (= (and b!996621 res!666738) b!996623))

(assert (= (and b!996623 res!666743) b!996630))

(assert (= (and b!996630 res!666741) b!996622))

(assert (= (and b!996622 res!666739) b!996626))

(assert (= (and b!996626 res!666742) b!996628))

(declare-fun m!923695 () Bool)

(assert (=> b!996623 m!923695))

(declare-fun m!923697 () Bool)

(assert (=> b!996629 m!923697))

(declare-fun m!923699 () Bool)

(assert (=> b!996625 m!923699))

(declare-fun m!923701 () Bool)

(assert (=> b!996627 m!923701))

(assert (=> b!996627 m!923701))

(declare-fun m!923703 () Bool)

(assert (=> b!996627 m!923703))

(assert (=> b!996626 m!923701))

(assert (=> b!996626 m!923701))

(declare-fun m!923705 () Bool)

(assert (=> b!996626 m!923705))

(assert (=> b!996626 m!923705))

(assert (=> b!996626 m!923701))

(declare-fun m!923707 () Bool)

(assert (=> b!996626 m!923707))

(declare-fun m!923709 () Bool)

(assert (=> b!996630 m!923709))

(declare-fun m!923711 () Bool)

(assert (=> b!996621 m!923711))

(declare-fun m!923713 () Bool)

(assert (=> start!86040 m!923713))

(declare-fun m!923715 () Bool)

(assert (=> start!86040 m!923715))

(push 1)

(assert (not b!996623))

(assert (not b!996621))

(assert (not b!996626))

(assert (not b!996625))

(assert (not start!86040))

(assert (not b!996630))

(assert (not b!996629))

(assert (not b!996627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

