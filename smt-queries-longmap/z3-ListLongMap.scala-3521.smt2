; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48684 () Bool)

(assert start!48684)

(declare-fun b!534885 () Bool)

(declare-fun res!330233 () Bool)

(declare-fun e!310770 () Bool)

(assert (=> b!534885 (=> (not res!330233) (not e!310770))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33906 0))(
  ( (array!33907 (arr!16292 (Array (_ BitVec 32) (_ BitVec 64))) (size!16657 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33906)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534885 (= res!330233 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16657 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16657 a!3154)) (= (select (arr!16292 a!3154) resIndex!32) (select (arr!16292 a!3154) j!147))))))

(declare-fun res!330240 () Bool)

(declare-fun e!310767 () Bool)

(assert (=> start!48684 (=> (not res!330240) (not e!310767))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48684 (= res!330240 (validMask!0 mask!3216))))

(assert (=> start!48684 e!310767))

(assert (=> start!48684 true))

(declare-fun array_inv!12175 (array!33906) Bool)

(assert (=> start!48684 (array_inv!12175 a!3154)))

(declare-fun b!534886 () Bool)

(declare-fun res!330242 () Bool)

(assert (=> b!534886 (=> (not res!330242) (not e!310770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33906 (_ BitVec 32)) Bool)

(assert (=> b!534886 (= res!330242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534887 () Bool)

(declare-fun res!330237 () Bool)

(assert (=> b!534887 (=> (not res!330237) (not e!310767))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534887 (= res!330237 (validKeyInArray!0 k0!1998))))

(declare-fun b!534888 () Bool)

(assert (=> b!534888 (= e!310767 e!310770)))

(declare-fun res!330235 () Bool)

(assert (=> b!534888 (=> (not res!330235) (not e!310770))))

(declare-datatypes ((SeekEntryResult!4747 0))(
  ( (MissingZero!4747 (index!21212 (_ BitVec 32))) (Found!4747 (index!21213 (_ BitVec 32))) (Intermediate!4747 (undefined!5559 Bool) (index!21214 (_ BitVec 32)) (x!50173 (_ BitVec 32))) (Undefined!4747) (MissingVacant!4747 (index!21215 (_ BitVec 32))) )
))
(declare-fun lt!245539 () SeekEntryResult!4747)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534888 (= res!330235 (or (= lt!245539 (MissingZero!4747 i!1153)) (= lt!245539 (MissingVacant!4747 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33906 (_ BitVec 32)) SeekEntryResult!4747)

(assert (=> b!534888 (= lt!245539 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534889 () Bool)

(declare-fun res!330236 () Bool)

(declare-fun e!310769 () Bool)

(assert (=> b!534889 (=> (not res!330236) (not e!310769))))

(declare-fun lt!245538 () SeekEntryResult!4747)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33906 (_ BitVec 32)) SeekEntryResult!4747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534889 (= res!330236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16292 a!3154) j!147) mask!3216) (select (arr!16292 a!3154) j!147) a!3154 mask!3216) lt!245538))))

(declare-fun b!534890 () Bool)

(declare-fun res!330239 () Bool)

(assert (=> b!534890 (=> (not res!330239) (not e!310767))))

(declare-fun arrayContainsKey!0 (array!33906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534890 (= res!330239 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534891 () Bool)

(declare-fun res!330232 () Bool)

(assert (=> b!534891 (=> (not res!330232) (not e!310770))))

(declare-datatypes ((List!10450 0))(
  ( (Nil!10447) (Cons!10446 (h!11389 (_ BitVec 64)) (t!16669 List!10450)) )
))
(declare-fun arrayNoDuplicates!0 (array!33906 (_ BitVec 32) List!10450) Bool)

(assert (=> b!534891 (= res!330232 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10447))))

(declare-fun b!534892 () Bool)

(declare-fun res!330234 () Bool)

(assert (=> b!534892 (=> (not res!330234) (not e!310767))))

(assert (=> b!534892 (= res!330234 (validKeyInArray!0 (select (arr!16292 a!3154) j!147)))))

(declare-fun b!534893 () Bool)

(assert (=> b!534893 (= e!310770 e!310769)))

(declare-fun res!330238 () Bool)

(assert (=> b!534893 (=> (not res!330238) (not e!310769))))

(assert (=> b!534893 (= res!330238 (= lt!245538 (Intermediate!4747 false resIndex!32 resX!32)))))

(assert (=> b!534893 (= lt!245538 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16292 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534894 () Bool)

(declare-fun res!330241 () Bool)

(assert (=> b!534894 (=> (not res!330241) (not e!310767))))

(assert (=> b!534894 (= res!330241 (and (= (size!16657 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16657 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16657 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534895 () Bool)

(assert (=> b!534895 (= e!310769 (and (not (= (select (arr!16292 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16292 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16292 a!3154) index!1177) (select (arr!16292 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(assert (= (and start!48684 res!330240) b!534894))

(assert (= (and b!534894 res!330241) b!534892))

(assert (= (and b!534892 res!330234) b!534887))

(assert (= (and b!534887 res!330237) b!534890))

(assert (= (and b!534890 res!330239) b!534888))

(assert (= (and b!534888 res!330235) b!534886))

(assert (= (and b!534886 res!330242) b!534891))

(assert (= (and b!534891 res!330232) b!534885))

(assert (= (and b!534885 res!330233) b!534893))

(assert (= (and b!534893 res!330238) b!534889))

(assert (= (and b!534889 res!330236) b!534895))

(declare-fun m!514021 () Bool)

(assert (=> b!534890 m!514021))

(declare-fun m!514023 () Bool)

(assert (=> b!534891 m!514023))

(declare-fun m!514025 () Bool)

(assert (=> b!534885 m!514025))

(declare-fun m!514027 () Bool)

(assert (=> b!534885 m!514027))

(declare-fun m!514029 () Bool)

(assert (=> start!48684 m!514029))

(declare-fun m!514031 () Bool)

(assert (=> start!48684 m!514031))

(assert (=> b!534889 m!514027))

(assert (=> b!534889 m!514027))

(declare-fun m!514033 () Bool)

(assert (=> b!534889 m!514033))

(assert (=> b!534889 m!514033))

(assert (=> b!534889 m!514027))

(declare-fun m!514035 () Bool)

(assert (=> b!534889 m!514035))

(assert (=> b!534893 m!514027))

(assert (=> b!534893 m!514027))

(declare-fun m!514037 () Bool)

(assert (=> b!534893 m!514037))

(assert (=> b!534892 m!514027))

(assert (=> b!534892 m!514027))

(declare-fun m!514039 () Bool)

(assert (=> b!534892 m!514039))

(declare-fun m!514041 () Bool)

(assert (=> b!534888 m!514041))

(declare-fun m!514043 () Bool)

(assert (=> b!534887 m!514043))

(declare-fun m!514045 () Bool)

(assert (=> b!534895 m!514045))

(assert (=> b!534895 m!514027))

(declare-fun m!514047 () Bool)

(assert (=> b!534886 m!514047))

(check-sat (not b!534892) (not b!534890) (not b!534893) (not b!534887) (not b!534886) (not b!534888) (not b!534891) (not b!534889) (not start!48684))
(check-sat)
