; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46116 () Bool)

(assert start!46116)

(declare-fun b!510864 () Bool)

(declare-fun res!311709 () Bool)

(declare-fun e!298554 () Bool)

(assert (=> b!510864 (=> (not res!311709) (not e!298554))))

(declare-datatypes ((array!32827 0))(
  ( (array!32828 (arr!15792 (Array (_ BitVec 32) (_ BitVec 64))) (size!16156 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32827)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510864 (= res!311709 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311711 () Bool)

(assert (=> start!46116 (=> (not res!311711) (not e!298554))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46116 (= res!311711 (validMask!0 mask!3524))))

(assert (=> start!46116 e!298554))

(assert (=> start!46116 true))

(declare-fun array_inv!11588 (array!32827) Bool)

(assert (=> start!46116 (array_inv!11588 a!3235)))

(declare-fun b!510865 () Bool)

(declare-fun res!311712 () Bool)

(declare-fun e!298556 () Bool)

(assert (=> b!510865 (=> (not res!311712) (not e!298556))))

(declare-datatypes ((List!9950 0))(
  ( (Nil!9947) (Cons!9946 (h!10823 (_ BitVec 64)) (t!16178 List!9950)) )
))
(declare-fun arrayNoDuplicates!0 (array!32827 (_ BitVec 32) List!9950) Bool)

(assert (=> b!510865 (= res!311712 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9947))))

(declare-fun b!510866 () Bool)

(assert (=> b!510866 (= e!298556 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4259 0))(
  ( (MissingZero!4259 (index!19224 (_ BitVec 32))) (Found!4259 (index!19225 (_ BitVec 32))) (Intermediate!4259 (undefined!5071 Bool) (index!19226 (_ BitVec 32)) (x!48180 (_ BitVec 32))) (Undefined!4259) (MissingVacant!4259 (index!19227 (_ BitVec 32))) )
))
(declare-fun lt!233668 () SeekEntryResult!4259)

(declare-fun lt!233669 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32827 (_ BitVec 32)) SeekEntryResult!4259)

(assert (=> b!510866 (= lt!233668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233669 (select (store (arr!15792 a!3235) i!1204 k!2280) j!176) (array!32828 (store (arr!15792 a!3235) i!1204 k!2280) (size!16156 a!3235)) mask!3524))))

(declare-fun lt!233667 () SeekEntryResult!4259)

(declare-fun lt!233671 () (_ BitVec 32))

(assert (=> b!510866 (= lt!233667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233671 (select (arr!15792 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510866 (= lt!233669 (toIndex!0 (select (store (arr!15792 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510866 (= lt!233671 (toIndex!0 (select (arr!15792 a!3235) j!176) mask!3524))))

(declare-fun e!298555 () Bool)

(assert (=> b!510866 e!298555))

(declare-fun res!311710 () Bool)

(assert (=> b!510866 (=> (not res!311710) (not e!298555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32827 (_ BitVec 32)) Bool)

(assert (=> b!510866 (= res!311710 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15776 0))(
  ( (Unit!15777) )
))
(declare-fun lt!233666 () Unit!15776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15776)

(assert (=> b!510866 (= lt!233666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510867 () Bool)

(declare-fun res!311713 () Bool)

(assert (=> b!510867 (=> (not res!311713) (not e!298554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510867 (= res!311713 (validKeyInArray!0 k!2280))))

(declare-fun b!510868 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32827 (_ BitVec 32)) SeekEntryResult!4259)

(assert (=> b!510868 (= e!298555 (= (seekEntryOrOpen!0 (select (arr!15792 a!3235) j!176) a!3235 mask!3524) (Found!4259 j!176)))))

(declare-fun b!510869 () Bool)

(declare-fun res!311717 () Bool)

(assert (=> b!510869 (=> (not res!311717) (not e!298554))))

(assert (=> b!510869 (= res!311717 (and (= (size!16156 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16156 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16156 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510870 () Bool)

(declare-fun res!311716 () Bool)

(assert (=> b!510870 (=> (not res!311716) (not e!298554))))

(assert (=> b!510870 (= res!311716 (validKeyInArray!0 (select (arr!15792 a!3235) j!176)))))

(declare-fun b!510871 () Bool)

(assert (=> b!510871 (= e!298554 e!298556)))

(declare-fun res!311714 () Bool)

(assert (=> b!510871 (=> (not res!311714) (not e!298556))))

(declare-fun lt!233670 () SeekEntryResult!4259)

(assert (=> b!510871 (= res!311714 (or (= lt!233670 (MissingZero!4259 i!1204)) (= lt!233670 (MissingVacant!4259 i!1204))))))

(assert (=> b!510871 (= lt!233670 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510872 () Bool)

(declare-fun res!311715 () Bool)

(assert (=> b!510872 (=> (not res!311715) (not e!298556))))

(assert (=> b!510872 (= res!311715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46116 res!311711) b!510869))

(assert (= (and b!510869 res!311717) b!510870))

(assert (= (and b!510870 res!311716) b!510867))

(assert (= (and b!510867 res!311713) b!510864))

(assert (= (and b!510864 res!311709) b!510871))

(assert (= (and b!510871 res!311714) b!510872))

(assert (= (and b!510872 res!311715) b!510865))

(assert (= (and b!510865 res!311712) b!510866))

(assert (= (and b!510866 res!311710) b!510868))

(declare-fun m!492321 () Bool)

(assert (=> b!510868 m!492321))

(assert (=> b!510868 m!492321))

(declare-fun m!492323 () Bool)

(assert (=> b!510868 m!492323))

(declare-fun m!492325 () Bool)

(assert (=> b!510864 m!492325))

(declare-fun m!492327 () Bool)

(assert (=> b!510871 m!492327))

(assert (=> b!510870 m!492321))

(assert (=> b!510870 m!492321))

(declare-fun m!492329 () Bool)

(assert (=> b!510870 m!492329))

(declare-fun m!492331 () Bool)

(assert (=> b!510867 m!492331))

(declare-fun m!492333 () Bool)

(assert (=> b!510866 m!492333))

(declare-fun m!492335 () Bool)

(assert (=> b!510866 m!492335))

(declare-fun m!492337 () Bool)

(assert (=> b!510866 m!492337))

(assert (=> b!510866 m!492337))

(declare-fun m!492339 () Bool)

(assert (=> b!510866 m!492339))

(assert (=> b!510866 m!492321))

(declare-fun m!492341 () Bool)

(assert (=> b!510866 m!492341))

(assert (=> b!510866 m!492321))

(declare-fun m!492343 () Bool)

(assert (=> b!510866 m!492343))

(assert (=> b!510866 m!492321))

(declare-fun m!492345 () Bool)

(assert (=> b!510866 m!492345))

(assert (=> b!510866 m!492337))

(declare-fun m!492347 () Bool)

(assert (=> b!510866 m!492347))

(declare-fun m!492349 () Bool)

(assert (=> start!46116 m!492349))

(declare-fun m!492351 () Bool)

(assert (=> start!46116 m!492351))

(declare-fun m!492353 () Bool)

(assert (=> b!510865 m!492353))

(declare-fun m!492355 () Bool)

(assert (=> b!510872 m!492355))

(push 1)

