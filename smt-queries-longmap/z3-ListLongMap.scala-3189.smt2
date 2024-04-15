; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44748 () Bool)

(assert start!44748)

(declare-fun b!491090 () Bool)

(declare-fun res!294176 () Bool)

(declare-fun e!288548 () Bool)

(assert (=> b!491090 (=> (not res!294176) (not e!288548))))

(declare-datatypes ((array!31817 0))(
  ( (array!31818 (arr!15296 (Array (_ BitVec 32) (_ BitVec 64))) (size!15661 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31817)

(declare-datatypes ((List!9493 0))(
  ( (Nil!9490) (Cons!9489 (h!10351 (_ BitVec 64)) (t!15712 List!9493)) )
))
(declare-fun arrayNoDuplicates!0 (array!31817 (_ BitVec 32) List!9493) Bool)

(assert (=> b!491090 (= res!294176 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9490))))

(declare-fun b!491092 () Bool)

(declare-fun res!294175 () Bool)

(declare-fun e!288549 () Bool)

(assert (=> b!491092 (=> (not res!294175) (not e!288549))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491092 (= res!294175 (and (= (size!15661 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15661 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15661 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491093 () Bool)

(declare-fun e!288546 () Bool)

(assert (=> b!491093 (= e!288546 true)))

(declare-datatypes ((SeekEntryResult!3760 0))(
  ( (MissingZero!3760 (index!17219 (_ BitVec 32))) (Found!3760 (index!17220 (_ BitVec 32))) (Intermediate!3760 (undefined!4572 Bool) (index!17221 (_ BitVec 32)) (x!46317 (_ BitVec 32))) (Undefined!3760) (MissingVacant!3760 (index!17222 (_ BitVec 32))) )
))
(declare-fun lt!221867 () SeekEntryResult!3760)

(declare-fun lt!221872 () array!31817)

(declare-fun lt!221871 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31817 (_ BitVec 32)) SeekEntryResult!3760)

(assert (=> b!491093 (= lt!221867 (seekEntryOrOpen!0 lt!221871 lt!221872 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!14452 0))(
  ( (Unit!14453) )
))
(declare-fun lt!221869 () Unit!14452)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14452)

(assert (=> b!491093 (= lt!221869 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491094 () Bool)

(declare-fun res!294170 () Bool)

(assert (=> b!491094 (=> (not res!294170) (not e!288548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31817 (_ BitVec 32)) Bool)

(assert (=> b!491094 (= res!294170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491095 () Bool)

(assert (=> b!491095 (= e!288548 (not e!288546))))

(declare-fun res!294168 () Bool)

(assert (=> b!491095 (=> res!294168 e!288546)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31817 (_ BitVec 32)) SeekEntryResult!3760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491095 (= res!294168 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15296 a!3235) j!176) mask!3524) (select (arr!15296 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221871 mask!3524) lt!221871 lt!221872 mask!3524))))))

(assert (=> b!491095 (= lt!221871 (select (store (arr!15296 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491095 (= lt!221872 (array!31818 (store (arr!15296 a!3235) i!1204 k0!2280) (size!15661 a!3235)))))

(assert (=> b!491095 (= lt!221867 (Found!3760 j!176))))

(assert (=> b!491095 (= lt!221867 (seekEntryOrOpen!0 (select (arr!15296 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491095 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221868 () Unit!14452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14452)

(assert (=> b!491095 (= lt!221868 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491096 () Bool)

(declare-fun res!294173 () Bool)

(assert (=> b!491096 (=> (not res!294173) (not e!288549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491096 (= res!294173 (validKeyInArray!0 k0!2280))))

(declare-fun b!491097 () Bool)

(declare-fun res!294174 () Bool)

(assert (=> b!491097 (=> (not res!294174) (not e!288549))))

(declare-fun arrayContainsKey!0 (array!31817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491097 (= res!294174 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491098 () Bool)

(declare-fun res!294172 () Bool)

(assert (=> b!491098 (=> (not res!294172) (not e!288549))))

(assert (=> b!491098 (= res!294172 (validKeyInArray!0 (select (arr!15296 a!3235) j!176)))))

(declare-fun res!294171 () Bool)

(assert (=> start!44748 (=> (not res!294171) (not e!288549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44748 (= res!294171 (validMask!0 mask!3524))))

(assert (=> start!44748 e!288549))

(assert (=> start!44748 true))

(declare-fun array_inv!11179 (array!31817) Bool)

(assert (=> start!44748 (array_inv!11179 a!3235)))

(declare-fun b!491091 () Bool)

(assert (=> b!491091 (= e!288549 e!288548)))

(declare-fun res!294169 () Bool)

(assert (=> b!491091 (=> (not res!294169) (not e!288548))))

(declare-fun lt!221870 () SeekEntryResult!3760)

(assert (=> b!491091 (= res!294169 (or (= lt!221870 (MissingZero!3760 i!1204)) (= lt!221870 (MissingVacant!3760 i!1204))))))

(assert (=> b!491091 (= lt!221870 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44748 res!294171) b!491092))

(assert (= (and b!491092 res!294175) b!491098))

(assert (= (and b!491098 res!294172) b!491096))

(assert (= (and b!491096 res!294173) b!491097))

(assert (= (and b!491097 res!294174) b!491091))

(assert (= (and b!491091 res!294169) b!491094))

(assert (= (and b!491094 res!294170) b!491090))

(assert (= (and b!491090 res!294176) b!491095))

(assert (= (and b!491095 (not res!294168)) b!491093))

(declare-fun m!471151 () Bool)

(assert (=> b!491097 m!471151))

(declare-fun m!471153 () Bool)

(assert (=> b!491098 m!471153))

(assert (=> b!491098 m!471153))

(declare-fun m!471155 () Bool)

(assert (=> b!491098 m!471155))

(declare-fun m!471157 () Bool)

(assert (=> b!491096 m!471157))

(declare-fun m!471159 () Bool)

(assert (=> b!491091 m!471159))

(declare-fun m!471161 () Bool)

(assert (=> start!44748 m!471161))

(declare-fun m!471163 () Bool)

(assert (=> start!44748 m!471163))

(declare-fun m!471165 () Bool)

(assert (=> b!491094 m!471165))

(declare-fun m!471167 () Bool)

(assert (=> b!491095 m!471167))

(declare-fun m!471169 () Bool)

(assert (=> b!491095 m!471169))

(declare-fun m!471171 () Bool)

(assert (=> b!491095 m!471171))

(assert (=> b!491095 m!471153))

(declare-fun m!471173 () Bool)

(assert (=> b!491095 m!471173))

(assert (=> b!491095 m!471153))

(declare-fun m!471175 () Bool)

(assert (=> b!491095 m!471175))

(assert (=> b!491095 m!471153))

(declare-fun m!471177 () Bool)

(assert (=> b!491095 m!471177))

(declare-fun m!471179 () Bool)

(assert (=> b!491095 m!471179))

(assert (=> b!491095 m!471173))

(assert (=> b!491095 m!471153))

(declare-fun m!471181 () Bool)

(assert (=> b!491095 m!471181))

(assert (=> b!491095 m!471179))

(declare-fun m!471183 () Bool)

(assert (=> b!491095 m!471183))

(declare-fun m!471185 () Bool)

(assert (=> b!491093 m!471185))

(declare-fun m!471187 () Bool)

(assert (=> b!491093 m!471187))

(declare-fun m!471189 () Bool)

(assert (=> b!491090 m!471189))

(check-sat (not b!491094) (not b!491090) (not b!491096) (not b!491095) (not b!491091) (not b!491098) (not b!491093) (not start!44748) (not b!491097))
(check-sat)
