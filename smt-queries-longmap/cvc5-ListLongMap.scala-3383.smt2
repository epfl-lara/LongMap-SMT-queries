; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46710 () Bool)

(assert start!46710)

(declare-fun b!515578 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33022 0))(
  ( (array!33023 (arr!15879 (Array (_ BitVec 32) (_ BitVec 64))) (size!16243 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33022)

(declare-fun e!301011 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4346 0))(
  ( (MissingZero!4346 (index!19572 (_ BitVec 32))) (Found!4346 (index!19573 (_ BitVec 32))) (Intermediate!4346 (undefined!5158 Bool) (index!19574 (_ BitVec 32)) (x!48541 (_ BitVec 32))) (Undefined!4346) (MissingVacant!4346 (index!19575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33022 (_ BitVec 32)) SeekEntryResult!4346)

(assert (=> b!515578 (= e!301011 (= (seekEntryOrOpen!0 (select (arr!15879 a!3235) j!176) a!3235 mask!3524) (Found!4346 j!176)))))

(declare-fun b!515579 () Bool)

(declare-fun res!315143 () Bool)

(declare-fun e!301014 () Bool)

(assert (=> b!515579 (=> (not res!315143) (not e!301014))))

(declare-datatypes ((List!10037 0))(
  ( (Nil!10034) (Cons!10033 (h!10931 (_ BitVec 64)) (t!16265 List!10037)) )
))
(declare-fun arrayNoDuplicates!0 (array!33022 (_ BitVec 32) List!10037) Bool)

(assert (=> b!515579 (= res!315143 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10034))))

(declare-fun res!315151 () Bool)

(declare-fun e!301013 () Bool)

(assert (=> start!46710 (=> (not res!315151) (not e!301013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46710 (= res!315151 (validMask!0 mask!3524))))

(assert (=> start!46710 e!301013))

(assert (=> start!46710 true))

(declare-fun array_inv!11675 (array!33022) Bool)

(assert (=> start!46710 (array_inv!11675 a!3235)))

(declare-fun b!515580 () Bool)

(declare-fun res!315149 () Bool)

(assert (=> b!515580 (=> (not res!315149) (not e!301013))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515580 (= res!315149 (and (= (size!16243 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16243 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16243 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515581 () Bool)

(declare-fun res!315145 () Bool)

(assert (=> b!515581 (=> (not res!315145) (not e!301013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515581 (= res!315145 (validKeyInArray!0 (select (arr!15879 a!3235) j!176)))))

(declare-fun b!515582 () Bool)

(declare-fun e!301012 () Bool)

(assert (=> b!515582 (= e!301012 true)))

(declare-fun lt!236025 () SeekEntryResult!4346)

(assert (=> b!515582 (and (bvslt (x!48541 lt!236025) #b01111111111111111111111111111110) (or (= (select (arr!15879 a!3235) (index!19574 lt!236025)) (select (arr!15879 a!3235) j!176)) (= (select (arr!15879 a!3235) (index!19574 lt!236025)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15879 a!3235) (index!19574 lt!236025)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515583 () Bool)

(declare-fun res!315148 () Bool)

(assert (=> b!515583 (=> (not res!315148) (not e!301014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33022 (_ BitVec 32)) Bool)

(assert (=> b!515583 (= res!315148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515584 () Bool)

(declare-fun res!315152 () Bool)

(assert (=> b!515584 (=> (not res!315152) (not e!301013))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515584 (= res!315152 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515585 () Bool)

(declare-fun res!315144 () Bool)

(assert (=> b!515585 (=> res!315144 e!301012)))

(assert (=> b!515585 (= res!315144 (or (undefined!5158 lt!236025) (not (is-Intermediate!4346 lt!236025))))))

(declare-fun b!515586 () Bool)

(assert (=> b!515586 (= e!301013 e!301014)))

(declare-fun res!315146 () Bool)

(assert (=> b!515586 (=> (not res!315146) (not e!301014))))

(declare-fun lt!236026 () SeekEntryResult!4346)

(assert (=> b!515586 (= res!315146 (or (= lt!236026 (MissingZero!4346 i!1204)) (= lt!236026 (MissingVacant!4346 i!1204))))))

(assert (=> b!515586 (= lt!236026 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515587 () Bool)

(assert (=> b!515587 (= e!301014 (not e!301012))))

(declare-fun res!315150 () Bool)

(assert (=> b!515587 (=> res!315150 e!301012)))

(declare-fun lt!236028 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33022 (_ BitVec 32)) SeekEntryResult!4346)

(assert (=> b!515587 (= res!315150 (= lt!236025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236028 (select (store (arr!15879 a!3235) i!1204 k!2280) j!176) (array!33023 (store (arr!15879 a!3235) i!1204 k!2280) (size!16243 a!3235)) mask!3524)))))

(declare-fun lt!236029 () (_ BitVec 32))

(assert (=> b!515587 (= lt!236025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236029 (select (arr!15879 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515587 (= lt!236028 (toIndex!0 (select (store (arr!15879 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515587 (= lt!236029 (toIndex!0 (select (arr!15879 a!3235) j!176) mask!3524))))

(assert (=> b!515587 e!301011))

(declare-fun res!315142 () Bool)

(assert (=> b!515587 (=> (not res!315142) (not e!301011))))

(assert (=> b!515587 (= res!315142 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15950 0))(
  ( (Unit!15951) )
))
(declare-fun lt!236027 () Unit!15950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15950)

(assert (=> b!515587 (= lt!236027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515588 () Bool)

(declare-fun res!315147 () Bool)

(assert (=> b!515588 (=> (not res!315147) (not e!301013))))

(assert (=> b!515588 (= res!315147 (validKeyInArray!0 k!2280))))

(assert (= (and start!46710 res!315151) b!515580))

(assert (= (and b!515580 res!315149) b!515581))

(assert (= (and b!515581 res!315145) b!515588))

(assert (= (and b!515588 res!315147) b!515584))

(assert (= (and b!515584 res!315152) b!515586))

(assert (= (and b!515586 res!315146) b!515583))

(assert (= (and b!515583 res!315148) b!515579))

(assert (= (and b!515579 res!315143) b!515587))

(assert (= (and b!515587 res!315142) b!515578))

(assert (= (and b!515587 (not res!315150)) b!515585))

(assert (= (and b!515585 (not res!315144)) b!515582))

(declare-fun m!496935 () Bool)

(assert (=> b!515588 m!496935))

(declare-fun m!496937 () Bool)

(assert (=> b!515578 m!496937))

(assert (=> b!515578 m!496937))

(declare-fun m!496939 () Bool)

(assert (=> b!515578 m!496939))

(declare-fun m!496941 () Bool)

(assert (=> b!515586 m!496941))

(declare-fun m!496943 () Bool)

(assert (=> b!515582 m!496943))

(assert (=> b!515582 m!496937))

(declare-fun m!496945 () Bool)

(assert (=> start!46710 m!496945))

(declare-fun m!496947 () Bool)

(assert (=> start!46710 m!496947))

(declare-fun m!496949 () Bool)

(assert (=> b!515583 m!496949))

(declare-fun m!496951 () Bool)

(assert (=> b!515584 m!496951))

(declare-fun m!496953 () Bool)

(assert (=> b!515579 m!496953))

(assert (=> b!515581 m!496937))

(assert (=> b!515581 m!496937))

(declare-fun m!496955 () Bool)

(assert (=> b!515581 m!496955))

(declare-fun m!496957 () Bool)

(assert (=> b!515587 m!496957))

(declare-fun m!496959 () Bool)

(assert (=> b!515587 m!496959))

(declare-fun m!496961 () Bool)

(assert (=> b!515587 m!496961))

(assert (=> b!515587 m!496937))

(declare-fun m!496963 () Bool)

(assert (=> b!515587 m!496963))

(declare-fun m!496965 () Bool)

(assert (=> b!515587 m!496965))

(assert (=> b!515587 m!496937))

(declare-fun m!496967 () Bool)

(assert (=> b!515587 m!496967))

(assert (=> b!515587 m!496937))

(assert (=> b!515587 m!496961))

(declare-fun m!496969 () Bool)

(assert (=> b!515587 m!496969))

(assert (=> b!515587 m!496961))

(declare-fun m!496971 () Bool)

(assert (=> b!515587 m!496971))

(push 1)

