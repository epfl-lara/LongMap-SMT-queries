; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46126 () Bool)

(assert start!46126)

(declare-fun b!510999 () Bool)

(declare-fun e!298615 () Bool)

(assert (=> b!510999 (= e!298615 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4264 0))(
  ( (MissingZero!4264 (index!19244 (_ BitVec 32))) (Found!4264 (index!19245 (_ BitVec 32))) (Intermediate!4264 (undefined!5076 Bool) (index!19246 (_ BitVec 32)) (x!48193 (_ BitVec 32))) (Undefined!4264) (MissingVacant!4264 (index!19247 (_ BitVec 32))) )
))
(declare-fun lt!233758 () SeekEntryResult!4264)

(declare-datatypes ((array!32837 0))(
  ( (array!32838 (arr!15797 (Array (_ BitVec 32) (_ BitVec 64))) (size!16161 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32837)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233759 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32837 (_ BitVec 32)) SeekEntryResult!4264)

(assert (=> b!510999 (= lt!233758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233759 (select (store (arr!15797 a!3235) i!1204 k!2280) j!176) (array!32838 (store (arr!15797 a!3235) i!1204 k!2280) (size!16161 a!3235)) mask!3524))))

(declare-fun lt!233756 () (_ BitVec 32))

(declare-fun lt!233760 () SeekEntryResult!4264)

(assert (=> b!510999 (= lt!233760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233756 (select (arr!15797 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510999 (= lt!233759 (toIndex!0 (select (store (arr!15797 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510999 (= lt!233756 (toIndex!0 (select (arr!15797 a!3235) j!176) mask!3524))))

(declare-fun e!298616 () Bool)

(assert (=> b!510999 e!298616))

(declare-fun res!311844 () Bool)

(assert (=> b!510999 (=> (not res!311844) (not e!298616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32837 (_ BitVec 32)) Bool)

(assert (=> b!510999 (= res!311844 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15786 0))(
  ( (Unit!15787) )
))
(declare-fun lt!233761 () Unit!15786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15786)

(assert (=> b!510999 (= lt!233761 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511000 () Bool)

(declare-fun res!311848 () Bool)

(assert (=> b!511000 (=> (not res!311848) (not e!298615))))

(declare-datatypes ((List!9955 0))(
  ( (Nil!9952) (Cons!9951 (h!10828 (_ BitVec 64)) (t!16183 List!9955)) )
))
(declare-fun arrayNoDuplicates!0 (array!32837 (_ BitVec 32) List!9955) Bool)

(assert (=> b!511000 (= res!311848 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9952))))

(declare-fun b!511001 () Bool)

(declare-fun e!298617 () Bool)

(assert (=> b!511001 (= e!298617 e!298615)))

(declare-fun res!311845 () Bool)

(assert (=> b!511001 (=> (not res!311845) (not e!298615))))

(declare-fun lt!233757 () SeekEntryResult!4264)

(assert (=> b!511001 (= res!311845 (or (= lt!233757 (MissingZero!4264 i!1204)) (= lt!233757 (MissingVacant!4264 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32837 (_ BitVec 32)) SeekEntryResult!4264)

(assert (=> b!511001 (= lt!233757 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511003 () Bool)

(declare-fun res!311850 () Bool)

(assert (=> b!511003 (=> (not res!311850) (not e!298617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511003 (= res!311850 (validKeyInArray!0 (select (arr!15797 a!3235) j!176)))))

(declare-fun b!511004 () Bool)

(assert (=> b!511004 (= e!298616 (= (seekEntryOrOpen!0 (select (arr!15797 a!3235) j!176) a!3235 mask!3524) (Found!4264 j!176)))))

(declare-fun b!511005 () Bool)

(declare-fun res!311851 () Bool)

(assert (=> b!511005 (=> (not res!311851) (not e!298617))))

(declare-fun arrayContainsKey!0 (array!32837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511005 (= res!311851 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511006 () Bool)

(declare-fun res!311852 () Bool)

(assert (=> b!511006 (=> (not res!311852) (not e!298615))))

(assert (=> b!511006 (= res!311852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511007 () Bool)

(declare-fun res!311847 () Bool)

(assert (=> b!511007 (=> (not res!311847) (not e!298617))))

(assert (=> b!511007 (= res!311847 (and (= (size!16161 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16161 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16161 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511002 () Bool)

(declare-fun res!311849 () Bool)

(assert (=> b!511002 (=> (not res!311849) (not e!298617))))

(assert (=> b!511002 (= res!311849 (validKeyInArray!0 k!2280))))

(declare-fun res!311846 () Bool)

(assert (=> start!46126 (=> (not res!311846) (not e!298617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46126 (= res!311846 (validMask!0 mask!3524))))

(assert (=> start!46126 e!298617))

(assert (=> start!46126 true))

(declare-fun array_inv!11593 (array!32837) Bool)

(assert (=> start!46126 (array_inv!11593 a!3235)))

(assert (= (and start!46126 res!311846) b!511007))

(assert (= (and b!511007 res!311847) b!511003))

(assert (= (and b!511003 res!311850) b!511002))

(assert (= (and b!511002 res!311849) b!511005))

(assert (= (and b!511005 res!311851) b!511001))

(assert (= (and b!511001 res!311845) b!511006))

(assert (= (and b!511006 res!311852) b!511000))

(assert (= (and b!511000 res!311848) b!510999))

(assert (= (and b!510999 res!311844) b!511004))

(declare-fun m!492501 () Bool)

(assert (=> start!46126 m!492501))

(declare-fun m!492503 () Bool)

(assert (=> start!46126 m!492503))

(declare-fun m!492505 () Bool)

(assert (=> b!511005 m!492505))

(declare-fun m!492507 () Bool)

(assert (=> b!511000 m!492507))

(declare-fun m!492509 () Bool)

(assert (=> b!511003 m!492509))

(assert (=> b!511003 m!492509))

(declare-fun m!492511 () Bool)

(assert (=> b!511003 m!492511))

(assert (=> b!511004 m!492509))

(assert (=> b!511004 m!492509))

(declare-fun m!492513 () Bool)

(assert (=> b!511004 m!492513))

(declare-fun m!492515 () Bool)

(assert (=> b!511001 m!492515))

(declare-fun m!492517 () Bool)

(assert (=> b!510999 m!492517))

(declare-fun m!492519 () Bool)

(assert (=> b!510999 m!492519))

(declare-fun m!492521 () Bool)

(assert (=> b!510999 m!492521))

(assert (=> b!510999 m!492509))

(declare-fun m!492523 () Bool)

(assert (=> b!510999 m!492523))

(assert (=> b!510999 m!492509))

(declare-fun m!492525 () Bool)

(assert (=> b!510999 m!492525))

(assert (=> b!510999 m!492509))

(declare-fun m!492527 () Bool)

(assert (=> b!510999 m!492527))

(assert (=> b!510999 m!492521))

(declare-fun m!492529 () Bool)

(assert (=> b!510999 m!492529))

(assert (=> b!510999 m!492521))

(declare-fun m!492531 () Bool)

(assert (=> b!510999 m!492531))

(declare-fun m!492533 () Bool)

(assert (=> b!511006 m!492533))

(declare-fun m!492535 () Bool)

(assert (=> b!511002 m!492535))

(push 1)

