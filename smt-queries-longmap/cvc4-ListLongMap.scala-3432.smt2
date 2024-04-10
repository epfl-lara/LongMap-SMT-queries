; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47716 () Bool)

(assert start!47716)

(declare-fun b!524836 () Bool)

(declare-fun e!306062 () Bool)

(declare-fun e!306059 () Bool)

(assert (=> b!524836 (= e!306062 (not e!306059))))

(declare-fun res!321689 () Bool)

(assert (=> b!524836 (=> res!321689 e!306059)))

(declare-fun lt!240970 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!240969 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4495 0))(
  ( (MissingZero!4495 (index!20192 (_ BitVec 32))) (Found!4495 (index!20193 (_ BitVec 32))) (Intermediate!4495 (undefined!5307 Bool) (index!20194 (_ BitVec 32)) (x!49172 (_ BitVec 32))) (Undefined!4495) (MissingVacant!4495 (index!20195 (_ BitVec 32))) )
))
(declare-fun lt!240972 () SeekEntryResult!4495)

(declare-datatypes ((array!33353 0))(
  ( (array!33354 (arr!16028 (Array (_ BitVec 32) (_ BitVec 64))) (size!16392 (_ BitVec 32))) )
))
(declare-fun lt!240968 () array!33353)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33353 (_ BitVec 32)) SeekEntryResult!4495)

(assert (=> b!524836 (= res!321689 (= lt!240972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240969 lt!240970 lt!240968 mask!3524)))))

(declare-fun a!3235 () array!33353)

(declare-fun lt!240966 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524836 (= lt!240972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240966 (select (arr!16028 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524836 (= lt!240969 (toIndex!0 lt!240970 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524836 (= lt!240970 (select (store (arr!16028 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524836 (= lt!240966 (toIndex!0 (select (arr!16028 a!3235) j!176) mask!3524))))

(assert (=> b!524836 (= lt!240968 (array!33354 (store (arr!16028 a!3235) i!1204 k!2280) (size!16392 a!3235)))))

(declare-fun e!306058 () Bool)

(assert (=> b!524836 e!306058))

(declare-fun res!321698 () Bool)

(assert (=> b!524836 (=> (not res!321698) (not e!306058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33353 (_ BitVec 32)) Bool)

(assert (=> b!524836 (= res!321698 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16432 0))(
  ( (Unit!16433) )
))
(declare-fun lt!240964 () Unit!16432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16432)

(assert (=> b!524836 (= lt!240964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524838 () Bool)

(declare-fun res!321692 () Bool)

(declare-fun e!306063 () Bool)

(assert (=> b!524838 (=> (not res!321692) (not e!306063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524838 (= res!321692 (validKeyInArray!0 k!2280))))

(declare-fun b!524839 () Bool)

(assert (=> b!524839 (= e!306059 true)))

(assert (=> b!524839 (= (index!20194 lt!240972) i!1204)))

(declare-fun lt!240971 () Unit!16432)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16432)

(assert (=> b!524839 (= lt!240971 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!240966 #b00000000000000000000000000000000 (index!20194 lt!240972) (x!49172 lt!240972) mask!3524))))

(assert (=> b!524839 (and (or (= (select (arr!16028 a!3235) (index!20194 lt!240972)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16028 a!3235) (index!20194 lt!240972)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16028 a!3235) (index!20194 lt!240972)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16028 a!3235) (index!20194 lt!240972)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240973 () Unit!16432)

(declare-fun e!306061 () Unit!16432)

(assert (=> b!524839 (= lt!240973 e!306061)))

(declare-fun c!61880 () Bool)

(assert (=> b!524839 (= c!61880 (= (select (arr!16028 a!3235) (index!20194 lt!240972)) (select (arr!16028 a!3235) j!176)))))

(assert (=> b!524839 (and (bvslt (x!49172 lt!240972) #b01111111111111111111111111111110) (or (= (select (arr!16028 a!3235) (index!20194 lt!240972)) (select (arr!16028 a!3235) j!176)) (= (select (arr!16028 a!3235) (index!20194 lt!240972)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16028 a!3235) (index!20194 lt!240972)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524840 () Bool)

(declare-fun e!306057 () Bool)

(assert (=> b!524840 (= e!306057 false)))

(declare-fun b!524841 () Bool)

(declare-fun res!321694 () Bool)

(assert (=> b!524841 (=> (not res!321694) (not e!306063))))

(declare-fun arrayContainsKey!0 (array!33353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524841 (= res!321694 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524842 () Bool)

(declare-fun res!321687 () Bool)

(assert (=> b!524842 (=> (not res!321687) (not e!306062))))

(declare-datatypes ((List!10186 0))(
  ( (Nil!10183) (Cons!10182 (h!11113 (_ BitVec 64)) (t!16414 List!10186)) )
))
(declare-fun arrayNoDuplicates!0 (array!33353 (_ BitVec 32) List!10186) Bool)

(assert (=> b!524842 (= res!321687 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10183))))

(declare-fun b!524843 () Bool)

(declare-fun res!321691 () Bool)

(assert (=> b!524843 (=> (not res!321691) (not e!306062))))

(assert (=> b!524843 (= res!321691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524844 () Bool)

(declare-fun res!321693 () Bool)

(assert (=> b!524844 (=> res!321693 e!306059)))

(assert (=> b!524844 (= res!321693 (or (undefined!5307 lt!240972) (not (is-Intermediate!4495 lt!240972))))))

(declare-fun b!524845 () Bool)

(assert (=> b!524845 (= e!306063 e!306062)))

(declare-fun res!321688 () Bool)

(assert (=> b!524845 (=> (not res!321688) (not e!306062))))

(declare-fun lt!240967 () SeekEntryResult!4495)

(assert (=> b!524845 (= res!321688 (or (= lt!240967 (MissingZero!4495 i!1204)) (= lt!240967 (MissingVacant!4495 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33353 (_ BitVec 32)) SeekEntryResult!4495)

(assert (=> b!524845 (= lt!240967 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524846 () Bool)

(declare-fun res!321696 () Bool)

(assert (=> b!524846 (=> (not res!321696) (not e!306063))))

(assert (=> b!524846 (= res!321696 (and (= (size!16392 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16392 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16392 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524847 () Bool)

(declare-fun res!321697 () Bool)

(assert (=> b!524847 (=> (not res!321697) (not e!306063))))

(assert (=> b!524847 (= res!321697 (validKeyInArray!0 (select (arr!16028 a!3235) j!176)))))

(declare-fun b!524848 () Bool)

(assert (=> b!524848 (= e!306058 (= (seekEntryOrOpen!0 (select (arr!16028 a!3235) j!176) a!3235 mask!3524) (Found!4495 j!176)))))

(declare-fun b!524849 () Bool)

(declare-fun Unit!16434 () Unit!16432)

(assert (=> b!524849 (= e!306061 Unit!16434)))

(declare-fun res!321695 () Bool)

(assert (=> start!47716 (=> (not res!321695) (not e!306063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47716 (= res!321695 (validMask!0 mask!3524))))

(assert (=> start!47716 e!306063))

(assert (=> start!47716 true))

(declare-fun array_inv!11824 (array!33353) Bool)

(assert (=> start!47716 (array_inv!11824 a!3235)))

(declare-fun b!524837 () Bool)

(declare-fun Unit!16435 () Unit!16432)

(assert (=> b!524837 (= e!306061 Unit!16435)))

(declare-fun lt!240965 () Unit!16432)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16432)

(assert (=> b!524837 (= lt!240965 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240966 #b00000000000000000000000000000000 (index!20194 lt!240972) (x!49172 lt!240972) mask!3524))))

(declare-fun res!321690 () Bool)

(assert (=> b!524837 (= res!321690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240966 lt!240970 lt!240968 mask!3524) (Intermediate!4495 false (index!20194 lt!240972) (x!49172 lt!240972))))))

(assert (=> b!524837 (=> (not res!321690) (not e!306057))))

(assert (=> b!524837 e!306057))

(assert (= (and start!47716 res!321695) b!524846))

(assert (= (and b!524846 res!321696) b!524847))

(assert (= (and b!524847 res!321697) b!524838))

(assert (= (and b!524838 res!321692) b!524841))

(assert (= (and b!524841 res!321694) b!524845))

(assert (= (and b!524845 res!321688) b!524843))

(assert (= (and b!524843 res!321691) b!524842))

(assert (= (and b!524842 res!321687) b!524836))

(assert (= (and b!524836 res!321698) b!524848))

(assert (= (and b!524836 (not res!321689)) b!524844))

(assert (= (and b!524844 (not res!321693)) b!524839))

(assert (= (and b!524839 c!61880) b!524837))

(assert (= (and b!524839 (not c!61880)) b!524849))

(assert (= (and b!524837 res!321690) b!524840))

(declare-fun m!505465 () Bool)

(assert (=> b!524842 m!505465))

(declare-fun m!505467 () Bool)

(assert (=> b!524843 m!505467))

(declare-fun m!505469 () Bool)

(assert (=> b!524838 m!505469))

(declare-fun m!505471 () Bool)

(assert (=> b!524848 m!505471))

(assert (=> b!524848 m!505471))

(declare-fun m!505473 () Bool)

(assert (=> b!524848 m!505473))

(declare-fun m!505475 () Bool)

(assert (=> b!524837 m!505475))

(declare-fun m!505477 () Bool)

(assert (=> b!524837 m!505477))

(declare-fun m!505479 () Bool)

(assert (=> start!47716 m!505479))

(declare-fun m!505481 () Bool)

(assert (=> start!47716 m!505481))

(declare-fun m!505483 () Bool)

(assert (=> b!524841 m!505483))

(declare-fun m!505485 () Bool)

(assert (=> b!524836 m!505485))

(declare-fun m!505487 () Bool)

(assert (=> b!524836 m!505487))

(declare-fun m!505489 () Bool)

(assert (=> b!524836 m!505489))

(declare-fun m!505491 () Bool)

(assert (=> b!524836 m!505491))

(declare-fun m!505493 () Bool)

(assert (=> b!524836 m!505493))

(assert (=> b!524836 m!505471))

(declare-fun m!505495 () Bool)

(assert (=> b!524836 m!505495))

(assert (=> b!524836 m!505471))

(declare-fun m!505497 () Bool)

(assert (=> b!524836 m!505497))

(assert (=> b!524836 m!505471))

(declare-fun m!505499 () Bool)

(assert (=> b!524836 m!505499))

(declare-fun m!505501 () Bool)

(assert (=> b!524839 m!505501))

(declare-fun m!505503 () Bool)

(assert (=> b!524839 m!505503))

(assert (=> b!524839 m!505471))

(declare-fun m!505505 () Bool)

(assert (=> b!524845 m!505505))

(assert (=> b!524847 m!505471))

(assert (=> b!524847 m!505471))

(declare-fun m!505507 () Bool)

(assert (=> b!524847 m!505507))

(push 1)

