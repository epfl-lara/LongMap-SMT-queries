; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47774 () Bool)

(assert start!47774)

(declare-fun b!526203 () Bool)

(declare-fun res!322911 () Bool)

(declare-fun e!306734 () Bool)

(assert (=> b!526203 (=> (not res!322911) (not e!306734))))

(declare-datatypes ((array!33412 0))(
  ( (array!33413 (arr!16057 (Array (_ BitVec 32) (_ BitVec 64))) (size!16421 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33412)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526203 (= res!322911 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526204 () Bool)

(declare-fun e!306735 () Bool)

(assert (=> b!526204 (= e!306735 true)))

(declare-datatypes ((SeekEntryResult!4480 0))(
  ( (MissingZero!4480 (index!20132 (_ BitVec 32))) (Found!4480 (index!20133 (_ BitVec 32))) (Intermediate!4480 (undefined!5292 Bool) (index!20134 (_ BitVec 32)) (x!49250 (_ BitVec 32))) (Undefined!4480) (MissingVacant!4480 (index!20135 (_ BitVec 32))) )
))
(declare-fun lt!241996 () SeekEntryResult!4480)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526204 (= (index!20134 lt!241996) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!16531 0))(
  ( (Unit!16532) )
))
(declare-fun lt!242005 () Unit!16531)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242002 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33412 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16531)

(assert (=> b!526204 (= lt!242005 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242002 #b00000000000000000000000000000000 (index!20134 lt!241996) (x!49250 lt!241996) mask!3524))))

(assert (=> b!526204 (and (or (= (select (arr!16057 a!3235) (index!20134 lt!241996)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16057 a!3235) (index!20134 lt!241996)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16057 a!3235) (index!20134 lt!241996)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16057 a!3235) (index!20134 lt!241996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242003 () Unit!16531)

(declare-fun e!306738 () Unit!16531)

(assert (=> b!526204 (= lt!242003 e!306738)))

(declare-fun c!61955 () Bool)

(assert (=> b!526204 (= c!61955 (= (select (arr!16057 a!3235) (index!20134 lt!241996)) (select (arr!16057 a!3235) j!176)))))

(assert (=> b!526204 (and (bvslt (x!49250 lt!241996) #b01111111111111111111111111111110) (or (= (select (arr!16057 a!3235) (index!20134 lt!241996)) (select (arr!16057 a!3235) j!176)) (= (select (arr!16057 a!3235) (index!20134 lt!241996)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16057 a!3235) (index!20134 lt!241996)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526205 () Bool)

(declare-fun res!322914 () Bool)

(assert (=> b!526205 (=> (not res!322914) (not e!306734))))

(assert (=> b!526205 (= res!322914 (and (= (size!16421 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16421 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16421 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526206 () Bool)

(declare-fun res!322906 () Bool)

(assert (=> b!526206 (=> (not res!322906) (not e!306734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526206 (= res!322906 (validKeyInArray!0 (select (arr!16057 a!3235) j!176)))))

(declare-fun b!526207 () Bool)

(declare-fun e!306732 () Bool)

(assert (=> b!526207 (= e!306732 (not e!306735))))

(declare-fun res!322905 () Bool)

(assert (=> b!526207 (=> res!322905 e!306735)))

(declare-fun lt!242001 () (_ BitVec 64))

(declare-fun lt!241999 () array!33412)

(declare-fun lt!241998 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33412 (_ BitVec 32)) SeekEntryResult!4480)

(assert (=> b!526207 (= res!322905 (= lt!241996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241998 lt!242001 lt!241999 mask!3524)))))

(assert (=> b!526207 (= lt!241996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242002 (select (arr!16057 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526207 (= lt!241998 (toIndex!0 lt!242001 mask!3524))))

(assert (=> b!526207 (= lt!242001 (select (store (arr!16057 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526207 (= lt!242002 (toIndex!0 (select (arr!16057 a!3235) j!176) mask!3524))))

(assert (=> b!526207 (= lt!241999 (array!33413 (store (arr!16057 a!3235) i!1204 k0!2280) (size!16421 a!3235)))))

(declare-fun e!306733 () Bool)

(assert (=> b!526207 e!306733))

(declare-fun res!322908 () Bool)

(assert (=> b!526207 (=> (not res!322908) (not e!306733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33412 (_ BitVec 32)) Bool)

(assert (=> b!526207 (= res!322908 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241997 () Unit!16531)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16531)

(assert (=> b!526207 (= lt!241997 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526208 () Bool)

(declare-fun e!306736 () Bool)

(assert (=> b!526208 (= e!306736 false)))

(declare-fun b!526210 () Bool)

(declare-fun Unit!16533 () Unit!16531)

(assert (=> b!526210 (= e!306738 Unit!16533)))

(declare-fun b!526211 () Bool)

(declare-fun res!322907 () Bool)

(assert (=> b!526211 (=> (not res!322907) (not e!306732))))

(assert (=> b!526211 (= res!322907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526212 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33412 (_ BitVec 32)) SeekEntryResult!4480)

(assert (=> b!526212 (= e!306733 (= (seekEntryOrOpen!0 (select (arr!16057 a!3235) j!176) a!3235 mask!3524) (Found!4480 j!176)))))

(declare-fun b!526213 () Bool)

(declare-fun res!322910 () Bool)

(assert (=> b!526213 (=> res!322910 e!306735)))

(get-info :version)

(assert (=> b!526213 (= res!322910 (or (undefined!5292 lt!241996) (not ((_ is Intermediate!4480) lt!241996))))))

(declare-fun b!526214 () Bool)

(declare-fun res!322909 () Bool)

(assert (=> b!526214 (=> (not res!322909) (not e!306732))))

(declare-datatypes ((List!10122 0))(
  ( (Nil!10119) (Cons!10118 (h!11049 (_ BitVec 64)) (t!16342 List!10122)) )
))
(declare-fun arrayNoDuplicates!0 (array!33412 (_ BitVec 32) List!10122) Bool)

(assert (=> b!526214 (= res!322909 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10119))))

(declare-fun b!526215 () Bool)

(declare-fun res!322915 () Bool)

(assert (=> b!526215 (=> (not res!322915) (not e!306734))))

(assert (=> b!526215 (= res!322915 (validKeyInArray!0 k0!2280))))

(declare-fun b!526216 () Bool)

(declare-fun Unit!16534 () Unit!16531)

(assert (=> b!526216 (= e!306738 Unit!16534)))

(declare-fun lt!242000 () Unit!16531)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33412 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16531)

(assert (=> b!526216 (= lt!242000 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242002 #b00000000000000000000000000000000 (index!20134 lt!241996) (x!49250 lt!241996) mask!3524))))

(declare-fun res!322913 () Bool)

(assert (=> b!526216 (= res!322913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242002 lt!242001 lt!241999 mask!3524) (Intermediate!4480 false (index!20134 lt!241996) (x!49250 lt!241996))))))

(assert (=> b!526216 (=> (not res!322913) (not e!306736))))

(assert (=> b!526216 e!306736))

(declare-fun res!322904 () Bool)

(assert (=> start!47774 (=> (not res!322904) (not e!306734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47774 (= res!322904 (validMask!0 mask!3524))))

(assert (=> start!47774 e!306734))

(assert (=> start!47774 true))

(declare-fun array_inv!11916 (array!33412) Bool)

(assert (=> start!47774 (array_inv!11916 a!3235)))

(declare-fun b!526209 () Bool)

(assert (=> b!526209 (= e!306734 e!306732)))

(declare-fun res!322912 () Bool)

(assert (=> b!526209 (=> (not res!322912) (not e!306732))))

(declare-fun lt!242004 () SeekEntryResult!4480)

(assert (=> b!526209 (= res!322912 (or (= lt!242004 (MissingZero!4480 i!1204)) (= lt!242004 (MissingVacant!4480 i!1204))))))

(assert (=> b!526209 (= lt!242004 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47774 res!322904) b!526205))

(assert (= (and b!526205 res!322914) b!526206))

(assert (= (and b!526206 res!322906) b!526215))

(assert (= (and b!526215 res!322915) b!526203))

(assert (= (and b!526203 res!322911) b!526209))

(assert (= (and b!526209 res!322912) b!526211))

(assert (= (and b!526211 res!322907) b!526214))

(assert (= (and b!526214 res!322909) b!526207))

(assert (= (and b!526207 res!322908) b!526212))

(assert (= (and b!526207 (not res!322905)) b!526213))

(assert (= (and b!526213 (not res!322910)) b!526204))

(assert (= (and b!526204 c!61955) b!526216))

(assert (= (and b!526204 (not c!61955)) b!526210))

(assert (= (and b!526216 res!322913) b!526208))

(declare-fun m!507145 () Bool)

(assert (=> b!526203 m!507145))

(declare-fun m!507147 () Bool)

(assert (=> b!526214 m!507147))

(declare-fun m!507149 () Bool)

(assert (=> b!526207 m!507149))

(declare-fun m!507151 () Bool)

(assert (=> b!526207 m!507151))

(declare-fun m!507153 () Bool)

(assert (=> b!526207 m!507153))

(declare-fun m!507155 () Bool)

(assert (=> b!526207 m!507155))

(declare-fun m!507157 () Bool)

(assert (=> b!526207 m!507157))

(assert (=> b!526207 m!507151))

(declare-fun m!507159 () Bool)

(assert (=> b!526207 m!507159))

(declare-fun m!507161 () Bool)

(assert (=> b!526207 m!507161))

(assert (=> b!526207 m!507151))

(declare-fun m!507163 () Bool)

(assert (=> b!526207 m!507163))

(declare-fun m!507165 () Bool)

(assert (=> b!526207 m!507165))

(declare-fun m!507167 () Bool)

(assert (=> b!526215 m!507167))

(assert (=> b!526206 m!507151))

(assert (=> b!526206 m!507151))

(declare-fun m!507169 () Bool)

(assert (=> b!526206 m!507169))

(declare-fun m!507171 () Bool)

(assert (=> start!47774 m!507171))

(declare-fun m!507173 () Bool)

(assert (=> start!47774 m!507173))

(declare-fun m!507175 () Bool)

(assert (=> b!526216 m!507175))

(declare-fun m!507177 () Bool)

(assert (=> b!526216 m!507177))

(declare-fun m!507179 () Bool)

(assert (=> b!526209 m!507179))

(declare-fun m!507181 () Bool)

(assert (=> b!526204 m!507181))

(declare-fun m!507183 () Bool)

(assert (=> b!526204 m!507183))

(assert (=> b!526204 m!507151))

(declare-fun m!507185 () Bool)

(assert (=> b!526211 m!507185))

(assert (=> b!526212 m!507151))

(assert (=> b!526212 m!507151))

(declare-fun m!507187 () Bool)

(assert (=> b!526212 m!507187))

(check-sat (not b!526209) (not b!526215) (not b!526207) (not b!526216) (not b!526204) (not b!526206) (not b!526203) (not b!526211) (not b!526214) (not start!47774) (not b!526212))
(check-sat)
