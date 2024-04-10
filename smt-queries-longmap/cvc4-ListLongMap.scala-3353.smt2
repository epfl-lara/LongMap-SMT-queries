; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46114 () Bool)

(assert start!46114)

(declare-fun res!311690 () Bool)

(declare-fun e!298542 () Bool)

(assert (=> start!46114 (=> (not res!311690) (not e!298542))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46114 (= res!311690 (validMask!0 mask!3524))))

(assert (=> start!46114 e!298542))

(assert (=> start!46114 true))

(declare-datatypes ((array!32825 0))(
  ( (array!32826 (arr!15791 (Array (_ BitVec 32) (_ BitVec 64))) (size!16155 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32825)

(declare-fun array_inv!11587 (array!32825) Bool)

(assert (=> start!46114 (array_inv!11587 a!3235)))

(declare-fun b!510837 () Bool)

(declare-fun res!311682 () Bool)

(declare-fun e!298544 () Bool)

(assert (=> b!510837 (=> (not res!311682) (not e!298544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32825 (_ BitVec 32)) Bool)

(assert (=> b!510837 (= res!311682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510838 () Bool)

(declare-fun res!311689 () Bool)

(assert (=> b!510838 (=> (not res!311689) (not e!298542))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510838 (= res!311689 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun e!298543 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!510839 () Bool)

(declare-datatypes ((SeekEntryResult!4258 0))(
  ( (MissingZero!4258 (index!19220 (_ BitVec 32))) (Found!4258 (index!19221 (_ BitVec 32))) (Intermediate!4258 (undefined!5070 Bool) (index!19222 (_ BitVec 32)) (x!48171 (_ BitVec 32))) (Undefined!4258) (MissingVacant!4258 (index!19223 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32825 (_ BitVec 32)) SeekEntryResult!4258)

(assert (=> b!510839 (= e!298543 (= (seekEntryOrOpen!0 (select (arr!15791 a!3235) j!176) a!3235 mask!3524) (Found!4258 j!176)))))

(declare-fun b!510840 () Bool)

(declare-fun res!311688 () Bool)

(assert (=> b!510840 (=> (not res!311688) (not e!298542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510840 (= res!311688 (validKeyInArray!0 k!2280))))

(declare-fun b!510841 () Bool)

(assert (=> b!510841 (= e!298544 (not true))))

(declare-fun lt!233649 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!233650 () SeekEntryResult!4258)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32825 (_ BitVec 32)) SeekEntryResult!4258)

(assert (=> b!510841 (= lt!233650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233649 (select (store (arr!15791 a!3235) i!1204 k!2280) j!176) (array!32826 (store (arr!15791 a!3235) i!1204 k!2280) (size!16155 a!3235)) mask!3524))))

(declare-fun lt!233653 () (_ BitVec 32))

(declare-fun lt!233652 () SeekEntryResult!4258)

(assert (=> b!510841 (= lt!233652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233653 (select (arr!15791 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510841 (= lt!233649 (toIndex!0 (select (store (arr!15791 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510841 (= lt!233653 (toIndex!0 (select (arr!15791 a!3235) j!176) mask!3524))))

(assert (=> b!510841 e!298543))

(declare-fun res!311684 () Bool)

(assert (=> b!510841 (=> (not res!311684) (not e!298543))))

(assert (=> b!510841 (= res!311684 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15774 0))(
  ( (Unit!15775) )
))
(declare-fun lt!233648 () Unit!15774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15774)

(assert (=> b!510841 (= lt!233648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510842 () Bool)

(assert (=> b!510842 (= e!298542 e!298544)))

(declare-fun res!311685 () Bool)

(assert (=> b!510842 (=> (not res!311685) (not e!298544))))

(declare-fun lt!233651 () SeekEntryResult!4258)

(assert (=> b!510842 (= res!311685 (or (= lt!233651 (MissingZero!4258 i!1204)) (= lt!233651 (MissingVacant!4258 i!1204))))))

(assert (=> b!510842 (= lt!233651 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510843 () Bool)

(declare-fun res!311686 () Bool)

(assert (=> b!510843 (=> (not res!311686) (not e!298544))))

(declare-datatypes ((List!9949 0))(
  ( (Nil!9946) (Cons!9945 (h!10822 (_ BitVec 64)) (t!16177 List!9949)) )
))
(declare-fun arrayNoDuplicates!0 (array!32825 (_ BitVec 32) List!9949) Bool)

(assert (=> b!510843 (= res!311686 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9946))))

(declare-fun b!510844 () Bool)

(declare-fun res!311683 () Bool)

(assert (=> b!510844 (=> (not res!311683) (not e!298542))))

(assert (=> b!510844 (= res!311683 (and (= (size!16155 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16155 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16155 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510845 () Bool)

(declare-fun res!311687 () Bool)

(assert (=> b!510845 (=> (not res!311687) (not e!298542))))

(assert (=> b!510845 (= res!311687 (validKeyInArray!0 (select (arr!15791 a!3235) j!176)))))

(assert (= (and start!46114 res!311690) b!510844))

(assert (= (and b!510844 res!311683) b!510845))

(assert (= (and b!510845 res!311687) b!510840))

(assert (= (and b!510840 res!311688) b!510838))

(assert (= (and b!510838 res!311689) b!510842))

(assert (= (and b!510842 res!311685) b!510837))

(assert (= (and b!510837 res!311682) b!510843))

(assert (= (and b!510843 res!311686) b!510841))

(assert (= (and b!510841 res!311684) b!510839))

(declare-fun m!492285 () Bool)

(assert (=> b!510843 m!492285))

(declare-fun m!492287 () Bool)

(assert (=> b!510837 m!492287))

(declare-fun m!492289 () Bool)

(assert (=> b!510842 m!492289))

(declare-fun m!492291 () Bool)

(assert (=> b!510845 m!492291))

(assert (=> b!510845 m!492291))

(declare-fun m!492293 () Bool)

(assert (=> b!510845 m!492293))

(declare-fun m!492295 () Bool)

(assert (=> b!510841 m!492295))

(declare-fun m!492297 () Bool)

(assert (=> b!510841 m!492297))

(assert (=> b!510841 m!492291))

(declare-fun m!492299 () Bool)

(assert (=> b!510841 m!492299))

(assert (=> b!510841 m!492291))

(declare-fun m!492301 () Bool)

(assert (=> b!510841 m!492301))

(assert (=> b!510841 m!492291))

(declare-fun m!492303 () Bool)

(assert (=> b!510841 m!492303))

(assert (=> b!510841 m!492297))

(declare-fun m!492305 () Bool)

(assert (=> b!510841 m!492305))

(assert (=> b!510841 m!492297))

(declare-fun m!492307 () Bool)

(assert (=> b!510841 m!492307))

(declare-fun m!492309 () Bool)

(assert (=> b!510841 m!492309))

(declare-fun m!492311 () Bool)

(assert (=> b!510838 m!492311))

(assert (=> b!510839 m!492291))

(assert (=> b!510839 m!492291))

(declare-fun m!492313 () Bool)

(assert (=> b!510839 m!492313))

(declare-fun m!492315 () Bool)

(assert (=> b!510840 m!492315))

(declare-fun m!492317 () Bool)

(assert (=> start!46114 m!492317))

(declare-fun m!492319 () Bool)

(assert (=> start!46114 m!492319))

(push 1)

