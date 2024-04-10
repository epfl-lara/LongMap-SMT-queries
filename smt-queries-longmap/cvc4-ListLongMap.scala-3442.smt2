; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47776 () Bool)

(assert start!47776)

(declare-fun b!526096 () Bool)

(declare-fun res!322772 () Bool)

(declare-fun e!306693 () Bool)

(assert (=> b!526096 (=> res!322772 e!306693)))

(declare-datatypes ((SeekEntryResult!4525 0))(
  ( (MissingZero!4525 (index!20312 (_ BitVec 32))) (Found!4525 (index!20313 (_ BitVec 32))) (Intermediate!4525 (undefined!5337 Bool) (index!20314 (_ BitVec 32)) (x!49282 (_ BitVec 32))) (Undefined!4525) (MissingVacant!4525 (index!20315 (_ BitVec 32))) )
))
(declare-fun lt!241869 () SeekEntryResult!4525)

(assert (=> b!526096 (= res!322772 (or (undefined!5337 lt!241869) (not (is-Intermediate!4525 lt!241869))))))

(declare-fun b!526097 () Bool)

(declare-fun res!322768 () Bool)

(declare-fun e!306690 () Bool)

(assert (=> b!526097 (=> (not res!322768) (not e!306690))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526097 (= res!322768 (validKeyInArray!0 k!2280))))

(declare-fun b!526098 () Bool)

(declare-fun res!322776 () Bool)

(declare-fun e!306687 () Bool)

(assert (=> b!526098 (=> (not res!322776) (not e!306687))))

(declare-datatypes ((array!33413 0))(
  ( (array!33414 (arr!16058 (Array (_ BitVec 32) (_ BitVec 64))) (size!16422 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33413)

(declare-datatypes ((List!10216 0))(
  ( (Nil!10213) (Cons!10212 (h!11143 (_ BitVec 64)) (t!16444 List!10216)) )
))
(declare-fun arrayNoDuplicates!0 (array!33413 (_ BitVec 32) List!10216) Bool)

(assert (=> b!526098 (= res!322776 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10213))))

(declare-fun b!526099 () Bool)

(declare-fun e!306688 () Bool)

(assert (=> b!526099 (= e!306688 false)))

(declare-fun b!526100 () Bool)

(declare-fun res!322775 () Bool)

(assert (=> b!526100 (=> (not res!322775) (not e!306690))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526100 (= res!322775 (validKeyInArray!0 (select (arr!16058 a!3235) j!176)))))

(declare-fun b!526101 () Bool)

(declare-fun res!322773 () Bool)

(assert (=> b!526101 (=> (not res!322773) (not e!306690))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526101 (= res!322773 (and (= (size!16422 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16422 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16422 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!322767 () Bool)

(assert (=> start!47776 (=> (not res!322767) (not e!306690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47776 (= res!322767 (validMask!0 mask!3524))))

(assert (=> start!47776 e!306690))

(assert (=> start!47776 true))

(declare-fun array_inv!11854 (array!33413) Bool)

(assert (=> start!47776 (array_inv!11854 a!3235)))

(declare-fun b!526102 () Bool)

(declare-fun res!322777 () Bool)

(assert (=> b!526102 (=> (not res!322777) (not e!306690))))

(declare-fun arrayContainsKey!0 (array!33413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526102 (= res!322777 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526103 () Bool)

(assert (=> b!526103 (= e!306693 true)))

(assert (=> b!526103 (= (index!20314 lt!241869) i!1204)))

(declare-fun lt!241864 () (_ BitVec 32))

(declare-datatypes ((Unit!16552 0))(
  ( (Unit!16553) )
))
(declare-fun lt!241865 () Unit!16552)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16552)

(assert (=> b!526103 (= lt!241865 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241864 #b00000000000000000000000000000000 (index!20314 lt!241869) (x!49282 lt!241869) mask!3524))))

(assert (=> b!526103 (and (or (= (select (arr!16058 a!3235) (index!20314 lt!241869)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16058 a!3235) (index!20314 lt!241869)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16058 a!3235) (index!20314 lt!241869)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16058 a!3235) (index!20314 lt!241869)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241873 () Unit!16552)

(declare-fun e!306689 () Unit!16552)

(assert (=> b!526103 (= lt!241873 e!306689)))

(declare-fun c!61970 () Bool)

(assert (=> b!526103 (= c!61970 (= (select (arr!16058 a!3235) (index!20314 lt!241869)) (select (arr!16058 a!3235) j!176)))))

(assert (=> b!526103 (and (bvslt (x!49282 lt!241869) #b01111111111111111111111111111110) (or (= (select (arr!16058 a!3235) (index!20314 lt!241869)) (select (arr!16058 a!3235) j!176)) (= (select (arr!16058 a!3235) (index!20314 lt!241869)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16058 a!3235) (index!20314 lt!241869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526104 () Bool)

(declare-fun res!322771 () Bool)

(assert (=> b!526104 (=> (not res!322771) (not e!306687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33413 (_ BitVec 32)) Bool)

(assert (=> b!526104 (= res!322771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526105 () Bool)

(assert (=> b!526105 (= e!306690 e!306687)))

(declare-fun res!322778 () Bool)

(assert (=> b!526105 (=> (not res!322778) (not e!306687))))

(declare-fun lt!241870 () SeekEntryResult!4525)

(assert (=> b!526105 (= res!322778 (or (= lt!241870 (MissingZero!4525 i!1204)) (= lt!241870 (MissingVacant!4525 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33413 (_ BitVec 32)) SeekEntryResult!4525)

(assert (=> b!526105 (= lt!241870 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526106 () Bool)

(assert (=> b!526106 (= e!306687 (not e!306693))))

(declare-fun res!322769 () Bool)

(assert (=> b!526106 (=> res!322769 e!306693)))

(declare-fun lt!241866 () (_ BitVec 32))

(declare-fun lt!241872 () array!33413)

(declare-fun lt!241871 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33413 (_ BitVec 32)) SeekEntryResult!4525)

(assert (=> b!526106 (= res!322769 (= lt!241869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241866 lt!241871 lt!241872 mask!3524)))))

(assert (=> b!526106 (= lt!241869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241864 (select (arr!16058 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526106 (= lt!241866 (toIndex!0 lt!241871 mask!3524))))

(assert (=> b!526106 (= lt!241871 (select (store (arr!16058 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526106 (= lt!241864 (toIndex!0 (select (arr!16058 a!3235) j!176) mask!3524))))

(assert (=> b!526106 (= lt!241872 (array!33414 (store (arr!16058 a!3235) i!1204 k!2280) (size!16422 a!3235)))))

(declare-fun e!306691 () Bool)

(assert (=> b!526106 e!306691))

(declare-fun res!322770 () Bool)

(assert (=> b!526106 (=> (not res!322770) (not e!306691))))

(assert (=> b!526106 (= res!322770 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241868 () Unit!16552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16552)

(assert (=> b!526106 (= lt!241868 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526107 () Bool)

(declare-fun Unit!16554 () Unit!16552)

(assert (=> b!526107 (= e!306689 Unit!16554)))

(declare-fun b!526108 () Bool)

(assert (=> b!526108 (= e!306691 (= (seekEntryOrOpen!0 (select (arr!16058 a!3235) j!176) a!3235 mask!3524) (Found!4525 j!176)))))

(declare-fun b!526109 () Bool)

(declare-fun Unit!16555 () Unit!16552)

(assert (=> b!526109 (= e!306689 Unit!16555)))

(declare-fun lt!241867 () Unit!16552)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16552)

(assert (=> b!526109 (= lt!241867 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241864 #b00000000000000000000000000000000 (index!20314 lt!241869) (x!49282 lt!241869) mask!3524))))

(declare-fun res!322774 () Bool)

(assert (=> b!526109 (= res!322774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241864 lt!241871 lt!241872 mask!3524) (Intermediate!4525 false (index!20314 lt!241869) (x!49282 lt!241869))))))

(assert (=> b!526109 (=> (not res!322774) (not e!306688))))

(assert (=> b!526109 e!306688))

(assert (= (and start!47776 res!322767) b!526101))

(assert (= (and b!526101 res!322773) b!526100))

(assert (= (and b!526100 res!322775) b!526097))

(assert (= (and b!526097 res!322768) b!526102))

(assert (= (and b!526102 res!322777) b!526105))

(assert (= (and b!526105 res!322778) b!526104))

(assert (= (and b!526104 res!322771) b!526098))

(assert (= (and b!526098 res!322776) b!526106))

(assert (= (and b!526106 res!322770) b!526108))

(assert (= (and b!526106 (not res!322769)) b!526096))

(assert (= (and b!526096 (not res!322772)) b!526103))

(assert (= (and b!526103 c!61970) b!526109))

(assert (= (and b!526103 (not c!61970)) b!526107))

(assert (= (and b!526109 res!322774) b!526099))

(declare-fun m!506785 () Bool)

(assert (=> b!526102 m!506785))

(declare-fun m!506787 () Bool)

(assert (=> b!526109 m!506787))

(declare-fun m!506789 () Bool)

(assert (=> b!526109 m!506789))

(declare-fun m!506791 () Bool)

(assert (=> b!526108 m!506791))

(assert (=> b!526108 m!506791))

(declare-fun m!506793 () Bool)

(assert (=> b!526108 m!506793))

(declare-fun m!506795 () Bool)

(assert (=> b!526097 m!506795))

(assert (=> b!526100 m!506791))

(assert (=> b!526100 m!506791))

(declare-fun m!506797 () Bool)

(assert (=> b!526100 m!506797))

(declare-fun m!506799 () Bool)

(assert (=> b!526104 m!506799))

(declare-fun m!506801 () Bool)

(assert (=> b!526103 m!506801))

(declare-fun m!506803 () Bool)

(assert (=> b!526103 m!506803))

(assert (=> b!526103 m!506791))

(declare-fun m!506805 () Bool)

(assert (=> b!526106 m!506805))

(declare-fun m!506807 () Bool)

(assert (=> b!526106 m!506807))

(declare-fun m!506809 () Bool)

(assert (=> b!526106 m!506809))

(declare-fun m!506811 () Bool)

(assert (=> b!526106 m!506811))

(declare-fun m!506813 () Bool)

(assert (=> b!526106 m!506813))

(assert (=> b!526106 m!506791))

(declare-fun m!506815 () Bool)

(assert (=> b!526106 m!506815))

(assert (=> b!526106 m!506791))

(assert (=> b!526106 m!506791))

(declare-fun m!506817 () Bool)

(assert (=> b!526106 m!506817))

(declare-fun m!506819 () Bool)

(assert (=> b!526106 m!506819))

(declare-fun m!506821 () Bool)

(assert (=> b!526105 m!506821))

(declare-fun m!506823 () Bool)

(assert (=> start!47776 m!506823))

(declare-fun m!506825 () Bool)

(assert (=> start!47776 m!506825))

(declare-fun m!506827 () Bool)

(assert (=> b!526098 m!506827))

(push 1)

