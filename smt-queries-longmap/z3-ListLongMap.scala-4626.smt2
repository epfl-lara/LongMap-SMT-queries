; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64518 () Bool)

(assert start!64518)

(declare-fun b!725056 () Bool)

(declare-fun res!486106 () Bool)

(declare-fun e!406158 () Bool)

(assert (=> b!725056 (=> (not res!486106) (not e!406158))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40969 0))(
  ( (array!40970 (arr!19603 (Array (_ BitVec 32) (_ BitVec 64))) (size!20023 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40969)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!725056 (= res!486106 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20023 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20023 a!3186))))))

(declare-fun b!725057 () Bool)

(declare-fun res!486095 () Bool)

(declare-fun e!406161 () Bool)

(assert (=> b!725057 (=> (not res!486095) (not e!406161))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725057 (= res!486095 (validKeyInArray!0 (select (arr!19603 a!3186) j!159)))))

(declare-fun e!406159 () Bool)

(declare-fun b!725058 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7159 0))(
  ( (MissingZero!7159 (index!31004 (_ BitVec 32))) (Found!7159 (index!31005 (_ BitVec 32))) (Intermediate!7159 (undefined!7971 Bool) (index!31006 (_ BitVec 32)) (x!62156 (_ BitVec 32))) (Undefined!7159) (MissingVacant!7159 (index!31007 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40969 (_ BitVec 32)) SeekEntryResult!7159)

(assert (=> b!725058 (= e!406159 (= (seekEntryOrOpen!0 (select (arr!19603 a!3186) j!159) a!3186 mask!3328) (Found!7159 j!159)))))

(declare-fun b!725059 () Bool)

(declare-fun res!486096 () Bool)

(declare-fun e!406157 () Bool)

(assert (=> b!725059 (=> (not res!486096) (not e!406157))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725059 (= res!486096 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19603 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!486102 () Bool)

(assert (=> start!64518 (=> (not res!486102) (not e!406161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64518 (= res!486102 (validMask!0 mask!3328))))

(assert (=> start!64518 e!406161))

(assert (=> start!64518 true))

(declare-fun array_inv!15462 (array!40969) Bool)

(assert (=> start!64518 (array_inv!15462 a!3186)))

(declare-fun b!725060 () Bool)

(declare-fun res!486103 () Bool)

(assert (=> b!725060 (=> (not res!486103) (not e!406161))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725060 (= res!486103 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725061 () Bool)

(assert (=> b!725061 (= e!406158 e!406157)))

(declare-fun res!486104 () Bool)

(assert (=> b!725061 (=> (not res!486104) (not e!406157))))

(declare-fun lt!321239 () SeekEntryResult!7159)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40969 (_ BitVec 32)) SeekEntryResult!7159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725061 (= res!486104 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19603 a!3186) j!159) mask!3328) (select (arr!19603 a!3186) j!159) a!3186 mask!3328) lt!321239))))

(assert (=> b!725061 (= lt!321239 (Intermediate!7159 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725062 () Bool)

(assert (=> b!725062 (= e!406161 e!406158)))

(declare-fun res!486094 () Bool)

(assert (=> b!725062 (=> (not res!486094) (not e!406158))))

(declare-fun lt!321240 () SeekEntryResult!7159)

(assert (=> b!725062 (= res!486094 (or (= lt!321240 (MissingZero!7159 i!1173)) (= lt!321240 (MissingVacant!7159 i!1173))))))

(assert (=> b!725062 (= lt!321240 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725063 () Bool)

(declare-fun res!486098 () Bool)

(assert (=> b!725063 (=> (not res!486098) (not e!406158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40969 (_ BitVec 32)) Bool)

(assert (=> b!725063 (= res!486098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725064 () Bool)

(declare-fun res!486101 () Bool)

(assert (=> b!725064 (=> (not res!486101) (not e!406161))))

(assert (=> b!725064 (= res!486101 (and (= (size!20023 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20023 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20023 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725065 () Bool)

(declare-fun e!406160 () Bool)

(assert (=> b!725065 (= e!406157 e!406160)))

(declare-fun res!486105 () Bool)

(assert (=> b!725065 (=> (not res!486105) (not e!406160))))

(declare-fun lt!321243 () array!40969)

(declare-fun lt!321242 () (_ BitVec 64))

(assert (=> b!725065 (= res!486105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321242 mask!3328) lt!321242 lt!321243 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321242 lt!321243 mask!3328)))))

(assert (=> b!725065 (= lt!321242 (select (store (arr!19603 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725065 (= lt!321243 (array!40970 (store (arr!19603 a!3186) i!1173 k0!2102) (size!20023 a!3186)))))

(declare-fun b!725066 () Bool)

(declare-fun res!486100 () Bool)

(assert (=> b!725066 (=> (not res!486100) (not e!406157))))

(declare-fun e!406156 () Bool)

(assert (=> b!725066 (= res!486100 e!406156)))

(declare-fun c!79856 () Bool)

(assert (=> b!725066 (= c!79856 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725067 () Bool)

(assert (=> b!725067 (= e!406160 (not true))))

(assert (=> b!725067 e!406159))

(declare-fun res!486093 () Bool)

(assert (=> b!725067 (=> (not res!486093) (not e!406159))))

(assert (=> b!725067 (= res!486093 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24715 0))(
  ( (Unit!24716) )
))
(declare-fun lt!321241 () Unit!24715)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24715)

(assert (=> b!725067 (= lt!321241 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725068 () Bool)

(declare-fun res!486097 () Bool)

(assert (=> b!725068 (=> (not res!486097) (not e!406161))))

(assert (=> b!725068 (= res!486097 (validKeyInArray!0 k0!2102))))

(declare-fun b!725069 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40969 (_ BitVec 32)) SeekEntryResult!7159)

(assert (=> b!725069 (= e!406156 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19603 a!3186) j!159) a!3186 mask!3328) (Found!7159 j!159)))))

(declare-fun b!725070 () Bool)

(declare-fun res!486099 () Bool)

(assert (=> b!725070 (=> (not res!486099) (not e!406158))))

(declare-datatypes ((List!13512 0))(
  ( (Nil!13509) (Cons!13508 (h!14568 (_ BitVec 64)) (t!19819 List!13512)) )
))
(declare-fun arrayNoDuplicates!0 (array!40969 (_ BitVec 32) List!13512) Bool)

(assert (=> b!725070 (= res!486099 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13509))))

(declare-fun b!725071 () Bool)

(assert (=> b!725071 (= e!406156 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19603 a!3186) j!159) a!3186 mask!3328) lt!321239))))

(assert (= (and start!64518 res!486102) b!725064))

(assert (= (and b!725064 res!486101) b!725057))

(assert (= (and b!725057 res!486095) b!725068))

(assert (= (and b!725068 res!486097) b!725060))

(assert (= (and b!725060 res!486103) b!725062))

(assert (= (and b!725062 res!486094) b!725063))

(assert (= (and b!725063 res!486098) b!725070))

(assert (= (and b!725070 res!486099) b!725056))

(assert (= (and b!725056 res!486106) b!725061))

(assert (= (and b!725061 res!486104) b!725059))

(assert (= (and b!725059 res!486096) b!725066))

(assert (= (and b!725066 c!79856) b!725071))

(assert (= (and b!725066 (not c!79856)) b!725069))

(assert (= (and b!725066 res!486100) b!725065))

(assert (= (and b!725065 res!486105) b!725067))

(assert (= (and b!725067 res!486093) b!725058))

(declare-fun m!679803 () Bool)

(assert (=> b!725058 m!679803))

(assert (=> b!725058 m!679803))

(declare-fun m!679805 () Bool)

(assert (=> b!725058 m!679805))

(declare-fun m!679807 () Bool)

(assert (=> b!725060 m!679807))

(assert (=> b!725061 m!679803))

(assert (=> b!725061 m!679803))

(declare-fun m!679809 () Bool)

(assert (=> b!725061 m!679809))

(assert (=> b!725061 m!679809))

(assert (=> b!725061 m!679803))

(declare-fun m!679811 () Bool)

(assert (=> b!725061 m!679811))

(declare-fun m!679813 () Bool)

(assert (=> start!64518 m!679813))

(declare-fun m!679815 () Bool)

(assert (=> start!64518 m!679815))

(assert (=> b!725069 m!679803))

(assert (=> b!725069 m!679803))

(declare-fun m!679817 () Bool)

(assert (=> b!725069 m!679817))

(assert (=> b!725057 m!679803))

(assert (=> b!725057 m!679803))

(declare-fun m!679819 () Bool)

(assert (=> b!725057 m!679819))

(declare-fun m!679821 () Bool)

(assert (=> b!725062 m!679821))

(declare-fun m!679823 () Bool)

(assert (=> b!725065 m!679823))

(declare-fun m!679825 () Bool)

(assert (=> b!725065 m!679825))

(declare-fun m!679827 () Bool)

(assert (=> b!725065 m!679827))

(assert (=> b!725065 m!679827))

(declare-fun m!679829 () Bool)

(assert (=> b!725065 m!679829))

(declare-fun m!679831 () Bool)

(assert (=> b!725065 m!679831))

(assert (=> b!725071 m!679803))

(assert (=> b!725071 m!679803))

(declare-fun m!679833 () Bool)

(assert (=> b!725071 m!679833))

(declare-fun m!679835 () Bool)

(assert (=> b!725070 m!679835))

(declare-fun m!679837 () Bool)

(assert (=> b!725068 m!679837))

(declare-fun m!679839 () Bool)

(assert (=> b!725067 m!679839))

(declare-fun m!679841 () Bool)

(assert (=> b!725067 m!679841))

(declare-fun m!679843 () Bool)

(assert (=> b!725059 m!679843))

(declare-fun m!679845 () Bool)

(assert (=> b!725063 m!679845))

(check-sat (not b!725058) (not b!725070) (not b!725068) (not b!725065) (not b!725071) (not b!725057) (not b!725069) (not start!64518) (not b!725062) (not b!725063) (not b!725060) (not b!725067) (not b!725061))
(check-sat)
