; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48676 () Bool)

(assert start!48676)

(declare-fun b!534836 () Bool)

(declare-fun e!310832 () Bool)

(assert (=> b!534836 (= e!310832 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33888 0))(
  ( (array!33889 (arr!16283 (Array (_ BitVec 32) (_ BitVec 64))) (size!16647 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33888)

(declare-datatypes ((SeekEntryResult!4741 0))(
  ( (MissingZero!4741 (index!21188 (_ BitVec 32))) (Found!4741 (index!21189 (_ BitVec 32))) (Intermediate!4741 (undefined!5553 Bool) (index!21190 (_ BitVec 32)) (x!50140 (_ BitVec 32))) (Undefined!4741) (MissingVacant!4741 (index!21191 (_ BitVec 32))) )
))
(declare-fun lt!245713 () SeekEntryResult!4741)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33888 (_ BitVec 32)) SeekEntryResult!4741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534836 (= lt!245713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16283 a!3154) j!147) mask!3216) (select (arr!16283 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!330046 () Bool)

(declare-fun e!310831 () Bool)

(assert (=> start!48676 (=> (not res!330046) (not e!310831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48676 (= res!330046 (validMask!0 mask!3216))))

(assert (=> start!48676 e!310831))

(assert (=> start!48676 true))

(declare-fun array_inv!12079 (array!33888) Bool)

(assert (=> start!48676 (array_inv!12079 a!3154)))

(declare-fun b!534837 () Bool)

(declare-fun res!330044 () Bool)

(assert (=> b!534837 (=> (not res!330044) (not e!310832))))

(declare-datatypes ((List!10402 0))(
  ( (Nil!10399) (Cons!10398 (h!11341 (_ BitVec 64)) (t!16630 List!10402)) )
))
(declare-fun arrayNoDuplicates!0 (array!33888 (_ BitVec 32) List!10402) Bool)

(assert (=> b!534837 (= res!330044 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10399))))

(declare-fun b!534838 () Bool)

(declare-fun res!330043 () Bool)

(assert (=> b!534838 (=> (not res!330043) (not e!310831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534838 (= res!330043 (validKeyInArray!0 (select (arr!16283 a!3154) j!147)))))

(declare-fun b!534839 () Bool)

(declare-fun res!330041 () Bool)

(assert (=> b!534839 (=> (not res!330041) (not e!310831))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!534839 (= res!330041 (validKeyInArray!0 k!1998))))

(declare-fun b!534840 () Bool)

(declare-fun res!330049 () Bool)

(assert (=> b!534840 (=> (not res!330049) (not e!310831))))

(declare-fun arrayContainsKey!0 (array!33888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534840 (= res!330049 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534841 () Bool)

(declare-fun res!330050 () Bool)

(assert (=> b!534841 (=> (not res!330050) (not e!310831))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534841 (= res!330050 (and (= (size!16647 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16647 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16647 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534842 () Bool)

(declare-fun res!330047 () Bool)

(assert (=> b!534842 (=> (not res!330047) (not e!310832))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534842 (= res!330047 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16283 a!3154) j!147) a!3154 mask!3216) (Intermediate!4741 false resIndex!32 resX!32)))))

(declare-fun b!534843 () Bool)

(assert (=> b!534843 (= e!310831 e!310832)))

(declare-fun res!330048 () Bool)

(assert (=> b!534843 (=> (not res!330048) (not e!310832))))

(declare-fun lt!245712 () SeekEntryResult!4741)

(assert (=> b!534843 (= res!330048 (or (= lt!245712 (MissingZero!4741 i!1153)) (= lt!245712 (MissingVacant!4741 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33888 (_ BitVec 32)) SeekEntryResult!4741)

(assert (=> b!534843 (= lt!245712 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534844 () Bool)

(declare-fun res!330045 () Bool)

(assert (=> b!534844 (=> (not res!330045) (not e!310832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33888 (_ BitVec 32)) Bool)

(assert (=> b!534844 (= res!330045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534845 () Bool)

(declare-fun res!330042 () Bool)

(assert (=> b!534845 (=> (not res!330042) (not e!310832))))

(assert (=> b!534845 (= res!330042 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16647 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16647 a!3154)) (= (select (arr!16283 a!3154) resIndex!32) (select (arr!16283 a!3154) j!147))))))

(assert (= (and start!48676 res!330046) b!534841))

(assert (= (and b!534841 res!330050) b!534838))

(assert (= (and b!534838 res!330043) b!534839))

(assert (= (and b!534839 res!330041) b!534840))

(assert (= (and b!534840 res!330049) b!534843))

(assert (= (and b!534843 res!330048) b!534844))

(assert (= (and b!534844 res!330045) b!534837))

(assert (= (and b!534837 res!330044) b!534845))

(assert (= (and b!534845 res!330042) b!534842))

(assert (= (and b!534842 res!330047) b!534836))

(declare-fun m!514501 () Bool)

(assert (=> b!534839 m!514501))

(declare-fun m!514503 () Bool)

(assert (=> b!534842 m!514503))

(assert (=> b!534842 m!514503))

(declare-fun m!514505 () Bool)

(assert (=> b!534842 m!514505))

(declare-fun m!514507 () Bool)

(assert (=> start!48676 m!514507))

(declare-fun m!514509 () Bool)

(assert (=> start!48676 m!514509))

(declare-fun m!514511 () Bool)

(assert (=> b!534840 m!514511))

(declare-fun m!514513 () Bool)

(assert (=> b!534844 m!514513))

(declare-fun m!514515 () Bool)

(assert (=> b!534837 m!514515))

(assert (=> b!534838 m!514503))

(assert (=> b!534838 m!514503))

(declare-fun m!514517 () Bool)

(assert (=> b!534838 m!514517))

(declare-fun m!514519 () Bool)

(assert (=> b!534845 m!514519))

(assert (=> b!534845 m!514503))

(declare-fun m!514521 () Bool)

(assert (=> b!534843 m!514521))

(assert (=> b!534836 m!514503))

(assert (=> b!534836 m!514503))

(declare-fun m!514523 () Bool)

(assert (=> b!534836 m!514523))

(assert (=> b!534836 m!514523))

(assert (=> b!534836 m!514503))

(declare-fun m!514525 () Bool)

(assert (=> b!534836 m!514525))

(push 1)

(assert (not start!48676))

(assert (not b!534839))

(assert (not b!534840))

(assert (not b!534838))

(assert (not b!534836))

(assert (not b!534843))

(assert (not b!534837))

