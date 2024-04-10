; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47730 () Bool)

(assert start!47730)

(declare-fun b!525130 () Bool)

(declare-fun e!306210 () Bool)

(assert (=> b!525130 (= e!306210 true)))

(declare-datatypes ((SeekEntryResult!4502 0))(
  ( (MissingZero!4502 (index!20220 (_ BitVec 32))) (Found!4502 (index!20221 (_ BitVec 32))) (Intermediate!4502 (undefined!5314 Bool) (index!20222 (_ BitVec 32)) (x!49203 (_ BitVec 32))) (Undefined!4502) (MissingVacant!4502 (index!20223 (_ BitVec 32))) )
))
(declare-fun lt!241181 () SeekEntryResult!4502)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525130 (= (index!20222 lt!241181) i!1204)))

(declare-datatypes ((Unit!16460 0))(
  ( (Unit!16461) )
))
(declare-fun lt!241174 () Unit!16460)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33367 0))(
  ( (array!33368 (arr!16035 (Array (_ BitVec 32) (_ BitVec 64))) (size!16399 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33367)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241175 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33367 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16460)

(assert (=> b!525130 (= lt!241174 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241175 #b00000000000000000000000000000000 (index!20222 lt!241181) (x!49203 lt!241181) mask!3524))))

(assert (=> b!525130 (and (or (= (select (arr!16035 a!3235) (index!20222 lt!241181)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16035 a!3235) (index!20222 lt!241181)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16035 a!3235) (index!20222 lt!241181)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16035 a!3235) (index!20222 lt!241181)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241182 () Unit!16460)

(declare-fun e!306206 () Unit!16460)

(assert (=> b!525130 (= lt!241182 e!306206)))

(declare-fun c!61901 () Bool)

(assert (=> b!525130 (= c!61901 (= (select (arr!16035 a!3235) (index!20222 lt!241181)) (select (arr!16035 a!3235) j!176)))))

(assert (=> b!525130 (and (bvslt (x!49203 lt!241181) #b01111111111111111111111111111110) (or (= (select (arr!16035 a!3235) (index!20222 lt!241181)) (select (arr!16035 a!3235) j!176)) (= (select (arr!16035 a!3235) (index!20222 lt!241181)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16035 a!3235) (index!20222 lt!241181)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525131 () Bool)

(declare-fun res!321941 () Bool)

(declare-fun e!306205 () Bool)

(assert (=> b!525131 (=> (not res!321941) (not e!306205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525131 (= res!321941 (validKeyInArray!0 k!2280))))

(declare-fun b!525132 () Bool)

(declare-fun e!306204 () Bool)

(assert (=> b!525132 (= e!306204 false)))

(declare-fun b!525133 () Bool)

(declare-fun res!321939 () Bool)

(assert (=> b!525133 (=> (not res!321939) (not e!306205))))

(declare-fun arrayContainsKey!0 (array!33367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525133 (= res!321939 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525134 () Bool)

(declare-fun res!321945 () Bool)

(declare-fun e!306208 () Bool)

(assert (=> b!525134 (=> (not res!321945) (not e!306208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33367 (_ BitVec 32)) Bool)

(assert (=> b!525134 (= res!321945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525135 () Bool)

(declare-fun res!321950 () Bool)

(assert (=> b!525135 (=> (not res!321950) (not e!306205))))

(assert (=> b!525135 (= res!321950 (and (= (size!16399 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16399 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16399 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525136 () Bool)

(assert (=> b!525136 (= e!306208 (not e!306210))))

(declare-fun res!321942 () Bool)

(assert (=> b!525136 (=> res!321942 e!306210)))

(declare-fun lt!241176 () (_ BitVec 32))

(declare-fun lt!241180 () array!33367)

(declare-fun lt!241183 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33367 (_ BitVec 32)) SeekEntryResult!4502)

(assert (=> b!525136 (= res!321942 (= lt!241181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241176 lt!241183 lt!241180 mask!3524)))))

(assert (=> b!525136 (= lt!241181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241175 (select (arr!16035 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525136 (= lt!241176 (toIndex!0 lt!241183 mask!3524))))

(assert (=> b!525136 (= lt!241183 (select (store (arr!16035 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525136 (= lt!241175 (toIndex!0 (select (arr!16035 a!3235) j!176) mask!3524))))

(assert (=> b!525136 (= lt!241180 (array!33368 (store (arr!16035 a!3235) i!1204 k!2280) (size!16399 a!3235)))))

(declare-fun e!306209 () Bool)

(assert (=> b!525136 e!306209))

(declare-fun res!321943 () Bool)

(assert (=> b!525136 (=> (not res!321943) (not e!306209))))

(assert (=> b!525136 (= res!321943 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241177 () Unit!16460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16460)

(assert (=> b!525136 (= lt!241177 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!321949 () Bool)

(assert (=> start!47730 (=> (not res!321949) (not e!306205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47730 (= res!321949 (validMask!0 mask!3524))))

(assert (=> start!47730 e!306205))

(assert (=> start!47730 true))

(declare-fun array_inv!11831 (array!33367) Bool)

(assert (=> start!47730 (array_inv!11831 a!3235)))

(declare-fun b!525137 () Bool)

(declare-fun res!321946 () Bool)

(assert (=> b!525137 (=> (not res!321946) (not e!306208))))

(declare-datatypes ((List!10193 0))(
  ( (Nil!10190) (Cons!10189 (h!11120 (_ BitVec 64)) (t!16421 List!10193)) )
))
(declare-fun arrayNoDuplicates!0 (array!33367 (_ BitVec 32) List!10193) Bool)

(assert (=> b!525137 (= res!321946 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10190))))

(declare-fun b!525138 () Bool)

(declare-fun res!321947 () Bool)

(assert (=> b!525138 (=> res!321947 e!306210)))

(assert (=> b!525138 (= res!321947 (or (undefined!5314 lt!241181) (not (is-Intermediate!4502 lt!241181))))))

(declare-fun b!525139 () Bool)

(declare-fun res!321944 () Bool)

(assert (=> b!525139 (=> (not res!321944) (not e!306205))))

(assert (=> b!525139 (= res!321944 (validKeyInArray!0 (select (arr!16035 a!3235) j!176)))))

(declare-fun b!525140 () Bool)

(declare-fun Unit!16462 () Unit!16460)

(assert (=> b!525140 (= e!306206 Unit!16462)))

(declare-fun lt!241179 () Unit!16460)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33367 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16460)

(assert (=> b!525140 (= lt!241179 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241175 #b00000000000000000000000000000000 (index!20222 lt!241181) (x!49203 lt!241181) mask!3524))))

(declare-fun res!321948 () Bool)

(assert (=> b!525140 (= res!321948 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241175 lt!241183 lt!241180 mask!3524) (Intermediate!4502 false (index!20222 lt!241181) (x!49203 lt!241181))))))

(assert (=> b!525140 (=> (not res!321948) (not e!306204))))

(assert (=> b!525140 e!306204))

(declare-fun b!525141 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33367 (_ BitVec 32)) SeekEntryResult!4502)

(assert (=> b!525141 (= e!306209 (= (seekEntryOrOpen!0 (select (arr!16035 a!3235) j!176) a!3235 mask!3524) (Found!4502 j!176)))))

(declare-fun b!525142 () Bool)

(declare-fun Unit!16463 () Unit!16460)

(assert (=> b!525142 (= e!306206 Unit!16463)))

(declare-fun b!525143 () Bool)

(assert (=> b!525143 (= e!306205 e!306208)))

(declare-fun res!321940 () Bool)

(assert (=> b!525143 (=> (not res!321940) (not e!306208))))

(declare-fun lt!241178 () SeekEntryResult!4502)

(assert (=> b!525143 (= res!321940 (or (= lt!241178 (MissingZero!4502 i!1204)) (= lt!241178 (MissingVacant!4502 i!1204))))))

(assert (=> b!525143 (= lt!241178 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47730 res!321949) b!525135))

(assert (= (and b!525135 res!321950) b!525139))

(assert (= (and b!525139 res!321944) b!525131))

(assert (= (and b!525131 res!321941) b!525133))

(assert (= (and b!525133 res!321939) b!525143))

(assert (= (and b!525143 res!321940) b!525134))

(assert (= (and b!525134 res!321945) b!525137))

(assert (= (and b!525137 res!321946) b!525136))

(assert (= (and b!525136 res!321943) b!525141))

(assert (= (and b!525136 (not res!321942)) b!525138))

(assert (= (and b!525138 (not res!321947)) b!525130))

(assert (= (and b!525130 c!61901) b!525140))

(assert (= (and b!525130 (not c!61901)) b!525142))

(assert (= (and b!525140 res!321948) b!525132))

(declare-fun m!505773 () Bool)

(assert (=> b!525130 m!505773))

(declare-fun m!505775 () Bool)

(assert (=> b!525130 m!505775))

(declare-fun m!505777 () Bool)

(assert (=> b!525130 m!505777))

(assert (=> b!525139 m!505777))

(assert (=> b!525139 m!505777))

(declare-fun m!505779 () Bool)

(assert (=> b!525139 m!505779))

(declare-fun m!505781 () Bool)

(assert (=> b!525131 m!505781))

(declare-fun m!505783 () Bool)

(assert (=> start!47730 m!505783))

(declare-fun m!505785 () Bool)

(assert (=> start!47730 m!505785))

(declare-fun m!505787 () Bool)

(assert (=> b!525143 m!505787))

(declare-fun m!505789 () Bool)

(assert (=> b!525133 m!505789))

(declare-fun m!505791 () Bool)

(assert (=> b!525136 m!505791))

(declare-fun m!505793 () Bool)

(assert (=> b!525136 m!505793))

(declare-fun m!505795 () Bool)

(assert (=> b!525136 m!505795))

(declare-fun m!505797 () Bool)

(assert (=> b!525136 m!505797))

(declare-fun m!505799 () Bool)

(assert (=> b!525136 m!505799))

(assert (=> b!525136 m!505777))

(declare-fun m!505801 () Bool)

(assert (=> b!525136 m!505801))

(assert (=> b!525136 m!505777))

(declare-fun m!505803 () Bool)

(assert (=> b!525136 m!505803))

(assert (=> b!525136 m!505777))

(declare-fun m!505805 () Bool)

(assert (=> b!525136 m!505805))

(declare-fun m!505807 () Bool)

(assert (=> b!525137 m!505807))

(assert (=> b!525141 m!505777))

(assert (=> b!525141 m!505777))

(declare-fun m!505809 () Bool)

(assert (=> b!525141 m!505809))

(declare-fun m!505811 () Bool)

(assert (=> b!525140 m!505811))

(declare-fun m!505813 () Bool)

(assert (=> b!525140 m!505813))

(declare-fun m!505815 () Bool)

(assert (=> b!525134 m!505815))

(push 1)

