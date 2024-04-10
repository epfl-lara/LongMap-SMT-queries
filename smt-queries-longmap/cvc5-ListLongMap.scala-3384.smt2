; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46716 () Bool)

(assert start!46716)

(declare-fun e!301058 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!515677 () Bool)

(declare-datatypes ((array!33028 0))(
  ( (array!33029 (arr!15882 (Array (_ BitVec 32) (_ BitVec 64))) (size!16246 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33028)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4349 0))(
  ( (MissingZero!4349 (index!19584 (_ BitVec 32))) (Found!4349 (index!19585 (_ BitVec 32))) (Intermediate!4349 (undefined!5161 Bool) (index!19586 (_ BitVec 32)) (x!48552 (_ BitVec 32))) (Undefined!4349) (MissingVacant!4349 (index!19587 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33028 (_ BitVec 32)) SeekEntryResult!4349)

(assert (=> b!515677 (= e!301058 (= (seekEntryOrOpen!0 (select (arr!15882 a!3235) j!176) a!3235 mask!3524) (Found!4349 j!176)))))

(declare-fun b!515678 () Bool)

(declare-fun e!301057 () Bool)

(declare-fun e!301055 () Bool)

(assert (=> b!515678 (= e!301057 e!301055)))

(declare-fun res!315249 () Bool)

(assert (=> b!515678 (=> (not res!315249) (not e!301055))))

(declare-fun lt!236074 () SeekEntryResult!4349)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515678 (= res!315249 (or (= lt!236074 (MissingZero!4349 i!1204)) (= lt!236074 (MissingVacant!4349 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!515678 (= lt!236074 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!315247 () Bool)

(assert (=> start!46716 (=> (not res!315247) (not e!301057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46716 (= res!315247 (validMask!0 mask!3524))))

(assert (=> start!46716 e!301057))

(assert (=> start!46716 true))

(declare-fun array_inv!11678 (array!33028) Bool)

(assert (=> start!46716 (array_inv!11678 a!3235)))

(declare-fun b!515679 () Bool)

(declare-fun res!315251 () Bool)

(assert (=> b!515679 (=> (not res!315251) (not e!301057))))

(declare-fun arrayContainsKey!0 (array!33028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515679 (= res!315251 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515680 () Bool)

(declare-fun res!315248 () Bool)

(assert (=> b!515680 (=> (not res!315248) (not e!301057))))

(assert (=> b!515680 (= res!315248 (and (= (size!16246 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16246 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16246 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515681 () Bool)

(declare-fun res!315246 () Bool)

(assert (=> b!515681 (=> (not res!315246) (not e!301055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33028 (_ BitVec 32)) Bool)

(assert (=> b!515681 (= res!315246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515682 () Bool)

(declare-fun e!301056 () Bool)

(assert (=> b!515682 (= e!301055 (not e!301056))))

(declare-fun res!315244 () Bool)

(assert (=> b!515682 (=> res!315244 e!301056)))

(declare-fun lt!236070 () SeekEntryResult!4349)

(declare-fun lt!236071 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33028 (_ BitVec 32)) SeekEntryResult!4349)

(assert (=> b!515682 (= res!315244 (= lt!236070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236071 (select (store (arr!15882 a!3235) i!1204 k!2280) j!176) (array!33029 (store (arr!15882 a!3235) i!1204 k!2280) (size!16246 a!3235)) mask!3524)))))

(declare-fun lt!236073 () (_ BitVec 32))

(assert (=> b!515682 (= lt!236070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236073 (select (arr!15882 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515682 (= lt!236071 (toIndex!0 (select (store (arr!15882 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515682 (= lt!236073 (toIndex!0 (select (arr!15882 a!3235) j!176) mask!3524))))

(assert (=> b!515682 e!301058))

(declare-fun res!315243 () Bool)

(assert (=> b!515682 (=> (not res!315243) (not e!301058))))

(assert (=> b!515682 (= res!315243 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15956 0))(
  ( (Unit!15957) )
))
(declare-fun lt!236072 () Unit!15956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15956)

(assert (=> b!515682 (= lt!236072 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515683 () Bool)

(declare-fun res!315250 () Bool)

(assert (=> b!515683 (=> (not res!315250) (not e!301057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515683 (= res!315250 (validKeyInArray!0 k!2280))))

(declare-fun b!515684 () Bool)

(declare-fun res!315241 () Bool)

(assert (=> b!515684 (=> res!315241 e!301056)))

(assert (=> b!515684 (= res!315241 (or (undefined!5161 lt!236070) (not (is-Intermediate!4349 lt!236070))))))

(declare-fun b!515685 () Bool)

(assert (=> b!515685 (= e!301056 true)))

(assert (=> b!515685 (and (bvslt (x!48552 lt!236070) #b01111111111111111111111111111110) (or (= (select (arr!15882 a!3235) (index!19586 lt!236070)) (select (arr!15882 a!3235) j!176)) (= (select (arr!15882 a!3235) (index!19586 lt!236070)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15882 a!3235) (index!19586 lt!236070)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515686 () Bool)

(declare-fun res!315245 () Bool)

(assert (=> b!515686 (=> (not res!315245) (not e!301057))))

(assert (=> b!515686 (= res!315245 (validKeyInArray!0 (select (arr!15882 a!3235) j!176)))))

(declare-fun b!515687 () Bool)

(declare-fun res!315242 () Bool)

(assert (=> b!515687 (=> (not res!315242) (not e!301055))))

(declare-datatypes ((List!10040 0))(
  ( (Nil!10037) (Cons!10036 (h!10934 (_ BitVec 64)) (t!16268 List!10040)) )
))
(declare-fun arrayNoDuplicates!0 (array!33028 (_ BitVec 32) List!10040) Bool)

(assert (=> b!515687 (= res!315242 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10037))))

(assert (= (and start!46716 res!315247) b!515680))

(assert (= (and b!515680 res!315248) b!515686))

(assert (= (and b!515686 res!315245) b!515683))

(assert (= (and b!515683 res!315250) b!515679))

(assert (= (and b!515679 res!315251) b!515678))

(assert (= (and b!515678 res!315249) b!515681))

(assert (= (and b!515681 res!315246) b!515687))

(assert (= (and b!515687 res!315242) b!515682))

(assert (= (and b!515682 res!315243) b!515677))

(assert (= (and b!515682 (not res!315244)) b!515684))

(assert (= (and b!515684 (not res!315241)) b!515685))

(declare-fun m!497049 () Bool)

(assert (=> b!515681 m!497049))

(declare-fun m!497051 () Bool)

(assert (=> b!515678 m!497051))

(declare-fun m!497053 () Bool)

(assert (=> b!515683 m!497053))

(declare-fun m!497055 () Bool)

(assert (=> b!515685 m!497055))

(declare-fun m!497057 () Bool)

(assert (=> b!515685 m!497057))

(assert (=> b!515686 m!497057))

(assert (=> b!515686 m!497057))

(declare-fun m!497059 () Bool)

(assert (=> b!515686 m!497059))

(declare-fun m!497061 () Bool)

(assert (=> b!515687 m!497061))

(assert (=> b!515677 m!497057))

(assert (=> b!515677 m!497057))

(declare-fun m!497063 () Bool)

(assert (=> b!515677 m!497063))

(declare-fun m!497065 () Bool)

(assert (=> b!515679 m!497065))

(declare-fun m!497067 () Bool)

(assert (=> b!515682 m!497067))

(declare-fun m!497069 () Bool)

(assert (=> b!515682 m!497069))

(declare-fun m!497071 () Bool)

(assert (=> b!515682 m!497071))

(assert (=> b!515682 m!497057))

(declare-fun m!497073 () Bool)

(assert (=> b!515682 m!497073))

(assert (=> b!515682 m!497057))

(assert (=> b!515682 m!497071))

(declare-fun m!497075 () Bool)

(assert (=> b!515682 m!497075))

(assert (=> b!515682 m!497071))

(declare-fun m!497077 () Bool)

(assert (=> b!515682 m!497077))

(declare-fun m!497079 () Bool)

(assert (=> b!515682 m!497079))

(assert (=> b!515682 m!497057))

(declare-fun m!497081 () Bool)

(assert (=> b!515682 m!497081))

(declare-fun m!497083 () Bool)

(assert (=> start!46716 m!497083))

(declare-fun m!497085 () Bool)

(assert (=> start!46716 m!497085))

(push 1)

