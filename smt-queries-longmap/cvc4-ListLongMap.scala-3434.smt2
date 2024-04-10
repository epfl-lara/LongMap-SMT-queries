; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47728 () Bool)

(assert start!47728)

(declare-fun b!525088 () Bool)

(declare-fun res!321910 () Bool)

(declare-fun e!306183 () Bool)

(assert (=> b!525088 (=> (not res!321910) (not e!306183))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33365 0))(
  ( (array!33366 (arr!16034 (Array (_ BitVec 32) (_ BitVec 64))) (size!16398 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33365)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525088 (= res!321910 (and (= (size!16398 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16398 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16398 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525089 () Bool)

(declare-fun res!321909 () Bool)

(declare-fun e!306188 () Bool)

(assert (=> b!525089 (=> res!321909 e!306188)))

(declare-datatypes ((SeekEntryResult!4501 0))(
  ( (MissingZero!4501 (index!20216 (_ BitVec 32))) (Found!4501 (index!20217 (_ BitVec 32))) (Intermediate!4501 (undefined!5313 Bool) (index!20218 (_ BitVec 32)) (x!49194 (_ BitVec 32))) (Undefined!4501) (MissingVacant!4501 (index!20219 (_ BitVec 32))) )
))
(declare-fun lt!241152 () SeekEntryResult!4501)

(assert (=> b!525089 (= res!321909 (or (undefined!5313 lt!241152) (not (is-Intermediate!4501 lt!241152))))))

(declare-fun b!525090 () Bool)

(declare-fun res!321914 () Bool)

(assert (=> b!525090 (=> (not res!321914) (not e!306183))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525090 (= res!321914 (validKeyInArray!0 k!2280))))

(declare-fun b!525091 () Bool)

(declare-fun e!306184 () Bool)

(assert (=> b!525091 (= e!306184 false)))

(declare-fun b!525092 () Bool)

(declare-fun res!321912 () Bool)

(assert (=> b!525092 (=> (not res!321912) (not e!306183))))

(declare-fun arrayContainsKey!0 (array!33365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525092 (= res!321912 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525093 () Bool)

(declare-fun res!321905 () Bool)

(declare-fun e!306187 () Bool)

(assert (=> b!525093 (=> (not res!321905) (not e!306187))))

(declare-datatypes ((List!10192 0))(
  ( (Nil!10189) (Cons!10188 (h!11119 (_ BitVec 64)) (t!16420 List!10192)) )
))
(declare-fun arrayNoDuplicates!0 (array!33365 (_ BitVec 32) List!10192) Bool)

(assert (=> b!525093 (= res!321905 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10189))))

(declare-fun b!525094 () Bool)

(assert (=> b!525094 (= e!306188 true)))

(assert (=> b!525094 (= (index!20218 lt!241152) i!1204)))

(declare-datatypes ((Unit!16456 0))(
  ( (Unit!16457) )
))
(declare-fun lt!241150 () Unit!16456)

(declare-fun lt!241145 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16456)

(assert (=> b!525094 (= lt!241150 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241145 #b00000000000000000000000000000000 (index!20218 lt!241152) (x!49194 lt!241152) mask!3524))))

(assert (=> b!525094 (and (or (= (select (arr!16034 a!3235) (index!20218 lt!241152)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16034 a!3235) (index!20218 lt!241152)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16034 a!3235) (index!20218 lt!241152)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16034 a!3235) (index!20218 lt!241152)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241148 () Unit!16456)

(declare-fun e!306189 () Unit!16456)

(assert (=> b!525094 (= lt!241148 e!306189)))

(declare-fun c!61898 () Bool)

(assert (=> b!525094 (= c!61898 (= (select (arr!16034 a!3235) (index!20218 lt!241152)) (select (arr!16034 a!3235) j!176)))))

(assert (=> b!525094 (and (bvslt (x!49194 lt!241152) #b01111111111111111111111111111110) (or (= (select (arr!16034 a!3235) (index!20218 lt!241152)) (select (arr!16034 a!3235) j!176)) (= (select (arr!16034 a!3235) (index!20218 lt!241152)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16034 a!3235) (index!20218 lt!241152)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!306186 () Bool)

(declare-fun b!525095 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33365 (_ BitVec 32)) SeekEntryResult!4501)

(assert (=> b!525095 (= e!306186 (= (seekEntryOrOpen!0 (select (arr!16034 a!3235) j!176) a!3235 mask!3524) (Found!4501 j!176)))))

(declare-fun res!321911 () Bool)

(assert (=> start!47728 (=> (not res!321911) (not e!306183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47728 (= res!321911 (validMask!0 mask!3524))))

(assert (=> start!47728 e!306183))

(assert (=> start!47728 true))

(declare-fun array_inv!11830 (array!33365) Bool)

(assert (=> start!47728 (array_inv!11830 a!3235)))

(declare-fun b!525096 () Bool)

(assert (=> b!525096 (= e!306187 (not e!306188))))

(declare-fun res!321913 () Bool)

(assert (=> b!525096 (=> res!321913 e!306188)))

(declare-fun lt!241151 () array!33365)

(declare-fun lt!241149 () (_ BitVec 32))

(declare-fun lt!241146 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33365 (_ BitVec 32)) SeekEntryResult!4501)

(assert (=> b!525096 (= res!321913 (= lt!241152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241149 lt!241146 lt!241151 mask!3524)))))

(assert (=> b!525096 (= lt!241152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241145 (select (arr!16034 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525096 (= lt!241149 (toIndex!0 lt!241146 mask!3524))))

(assert (=> b!525096 (= lt!241146 (select (store (arr!16034 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525096 (= lt!241145 (toIndex!0 (select (arr!16034 a!3235) j!176) mask!3524))))

(assert (=> b!525096 (= lt!241151 (array!33366 (store (arr!16034 a!3235) i!1204 k!2280) (size!16398 a!3235)))))

(assert (=> b!525096 e!306186))

(declare-fun res!321906 () Bool)

(assert (=> b!525096 (=> (not res!321906) (not e!306186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33365 (_ BitVec 32)) Bool)

(assert (=> b!525096 (= res!321906 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241147 () Unit!16456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16456)

(assert (=> b!525096 (= lt!241147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525097 () Bool)

(declare-fun res!321904 () Bool)

(assert (=> b!525097 (=> (not res!321904) (not e!306183))))

(assert (=> b!525097 (= res!321904 (validKeyInArray!0 (select (arr!16034 a!3235) j!176)))))

(declare-fun b!525098 () Bool)

(declare-fun res!321903 () Bool)

(assert (=> b!525098 (=> (not res!321903) (not e!306187))))

(assert (=> b!525098 (= res!321903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525099 () Bool)

(declare-fun Unit!16458 () Unit!16456)

(assert (=> b!525099 (= e!306189 Unit!16458)))

(declare-fun b!525100 () Bool)

(assert (=> b!525100 (= e!306183 e!306187)))

(declare-fun res!321908 () Bool)

(assert (=> b!525100 (=> (not res!321908) (not e!306187))))

(declare-fun lt!241153 () SeekEntryResult!4501)

(assert (=> b!525100 (= res!321908 (or (= lt!241153 (MissingZero!4501 i!1204)) (= lt!241153 (MissingVacant!4501 i!1204))))))

(assert (=> b!525100 (= lt!241153 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525101 () Bool)

(declare-fun Unit!16459 () Unit!16456)

(assert (=> b!525101 (= e!306189 Unit!16459)))

(declare-fun lt!241144 () Unit!16456)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16456)

(assert (=> b!525101 (= lt!241144 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241145 #b00000000000000000000000000000000 (index!20218 lt!241152) (x!49194 lt!241152) mask!3524))))

(declare-fun res!321907 () Bool)

(assert (=> b!525101 (= res!321907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241145 lt!241146 lt!241151 mask!3524) (Intermediate!4501 false (index!20218 lt!241152) (x!49194 lt!241152))))))

(assert (=> b!525101 (=> (not res!321907) (not e!306184))))

(assert (=> b!525101 e!306184))

(assert (= (and start!47728 res!321911) b!525088))

(assert (= (and b!525088 res!321910) b!525097))

(assert (= (and b!525097 res!321904) b!525090))

(assert (= (and b!525090 res!321914) b!525092))

(assert (= (and b!525092 res!321912) b!525100))

(assert (= (and b!525100 res!321908) b!525098))

(assert (= (and b!525098 res!321903) b!525093))

(assert (= (and b!525093 res!321905) b!525096))

(assert (= (and b!525096 res!321906) b!525095))

(assert (= (and b!525096 (not res!321913)) b!525089))

(assert (= (and b!525089 (not res!321909)) b!525094))

(assert (= (and b!525094 c!61898) b!525101))

(assert (= (and b!525094 (not c!61898)) b!525099))

(assert (= (and b!525101 res!321907) b!525091))

(declare-fun m!505729 () Bool)

(assert (=> b!525097 m!505729))

(assert (=> b!525097 m!505729))

(declare-fun m!505731 () Bool)

(assert (=> b!525097 m!505731))

(declare-fun m!505733 () Bool)

(assert (=> start!47728 m!505733))

(declare-fun m!505735 () Bool)

(assert (=> start!47728 m!505735))

(declare-fun m!505737 () Bool)

(assert (=> b!525092 m!505737))

(assert (=> b!525095 m!505729))

(assert (=> b!525095 m!505729))

(declare-fun m!505739 () Bool)

(assert (=> b!525095 m!505739))

(declare-fun m!505741 () Bool)

(assert (=> b!525101 m!505741))

(declare-fun m!505743 () Bool)

(assert (=> b!525101 m!505743))

(declare-fun m!505745 () Bool)

(assert (=> b!525090 m!505745))

(declare-fun m!505747 () Bool)

(assert (=> b!525096 m!505747))

(assert (=> b!525096 m!505729))

(declare-fun m!505749 () Bool)

(assert (=> b!525096 m!505749))

(declare-fun m!505751 () Bool)

(assert (=> b!525096 m!505751))

(declare-fun m!505753 () Bool)

(assert (=> b!525096 m!505753))

(declare-fun m!505755 () Bool)

(assert (=> b!525096 m!505755))

(assert (=> b!525096 m!505729))

(declare-fun m!505757 () Bool)

(assert (=> b!525096 m!505757))

(assert (=> b!525096 m!505729))

(declare-fun m!505759 () Bool)

(assert (=> b!525096 m!505759))

(declare-fun m!505761 () Bool)

(assert (=> b!525096 m!505761))

(declare-fun m!505763 () Bool)

(assert (=> b!525098 m!505763))

(declare-fun m!505765 () Bool)

(assert (=> b!525093 m!505765))

(declare-fun m!505767 () Bool)

(assert (=> b!525100 m!505767))

(declare-fun m!505769 () Bool)

(assert (=> b!525094 m!505769))

(declare-fun m!505771 () Bool)

(assert (=> b!525094 m!505771))

(assert (=> b!525094 m!505729))

(push 1)

