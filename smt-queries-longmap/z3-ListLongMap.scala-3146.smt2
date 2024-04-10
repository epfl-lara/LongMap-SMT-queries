; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44300 () Bool)

(assert start!44300)

(declare-fun b!487168 () Bool)

(declare-fun res!290555 () Bool)

(declare-fun e!286675 () Bool)

(assert (=> b!487168 (=> (not res!290555) (not e!286675))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487168 (= res!290555 (validKeyInArray!0 k0!2280))))

(declare-fun b!487169 () Bool)

(declare-fun res!290558 () Bool)

(declare-fun e!286676 () Bool)

(assert (=> b!487169 (=> (not res!290558) (not e!286676))))

(declare-datatypes ((array!31551 0))(
  ( (array!31552 (arr!15169 (Array (_ BitVec 32) (_ BitVec 64))) (size!15533 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31551)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31551 (_ BitVec 32)) Bool)

(assert (=> b!487169 (= res!290558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487171 () Bool)

(declare-fun res!290559 () Bool)

(assert (=> b!487171 (=> (not res!290559) (not e!286675))))

(declare-fun arrayContainsKey!0 (array!31551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487171 (= res!290559 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487172 () Bool)

(declare-fun res!290556 () Bool)

(assert (=> b!487172 (=> (not res!290556) (not e!286675))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487172 (= res!290556 (and (= (size!15533 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15533 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15533 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487173 () Bool)

(declare-fun res!290560 () Bool)

(assert (=> b!487173 (=> (not res!290560) (not e!286676))))

(declare-datatypes ((List!9327 0))(
  ( (Nil!9324) (Cons!9323 (h!10179 (_ BitVec 64)) (t!15555 List!9327)) )
))
(declare-fun arrayNoDuplicates!0 (array!31551 (_ BitVec 32) List!9327) Bool)

(assert (=> b!487173 (= res!290560 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9324))))

(declare-fun b!487174 () Bool)

(assert (=> b!487174 (= e!286676 (not true))))

(assert (=> b!487174 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14218 0))(
  ( (Unit!14219) )
))
(declare-fun lt!219957 () Unit!14218)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14218)

(assert (=> b!487174 (= lt!219957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487175 () Bool)

(declare-fun res!290557 () Bool)

(assert (=> b!487175 (=> (not res!290557) (not e!286675))))

(assert (=> b!487175 (= res!290557 (validKeyInArray!0 (select (arr!15169 a!3235) j!176)))))

(declare-fun b!487170 () Bool)

(assert (=> b!487170 (= e!286675 e!286676)))

(declare-fun res!290554 () Bool)

(assert (=> b!487170 (=> (not res!290554) (not e!286676))))

(declare-datatypes ((SeekEntryResult!3636 0))(
  ( (MissingZero!3636 (index!16723 (_ BitVec 32))) (Found!3636 (index!16724 (_ BitVec 32))) (Intermediate!3636 (undefined!4448 Bool) (index!16725 (_ BitVec 32)) (x!45848 (_ BitVec 32))) (Undefined!3636) (MissingVacant!3636 (index!16726 (_ BitVec 32))) )
))
(declare-fun lt!219958 () SeekEntryResult!3636)

(assert (=> b!487170 (= res!290554 (or (= lt!219958 (MissingZero!3636 i!1204)) (= lt!219958 (MissingVacant!3636 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31551 (_ BitVec 32)) SeekEntryResult!3636)

(assert (=> b!487170 (= lt!219958 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!290561 () Bool)

(assert (=> start!44300 (=> (not res!290561) (not e!286675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44300 (= res!290561 (validMask!0 mask!3524))))

(assert (=> start!44300 e!286675))

(assert (=> start!44300 true))

(declare-fun array_inv!10965 (array!31551) Bool)

(assert (=> start!44300 (array_inv!10965 a!3235)))

(assert (= (and start!44300 res!290561) b!487172))

(assert (= (and b!487172 res!290556) b!487175))

(assert (= (and b!487175 res!290557) b!487168))

(assert (= (and b!487168 res!290555) b!487171))

(assert (= (and b!487171 res!290559) b!487170))

(assert (= (and b!487170 res!290554) b!487169))

(assert (= (and b!487169 res!290558) b!487173))

(assert (= (and b!487173 res!290560) b!487174))

(declare-fun m!467011 () Bool)

(assert (=> b!487174 m!467011))

(declare-fun m!467013 () Bool)

(assert (=> b!487174 m!467013))

(declare-fun m!467015 () Bool)

(assert (=> start!44300 m!467015))

(declare-fun m!467017 () Bool)

(assert (=> start!44300 m!467017))

(declare-fun m!467019 () Bool)

(assert (=> b!487169 m!467019))

(declare-fun m!467021 () Bool)

(assert (=> b!487168 m!467021))

(declare-fun m!467023 () Bool)

(assert (=> b!487170 m!467023))

(declare-fun m!467025 () Bool)

(assert (=> b!487171 m!467025))

(declare-fun m!467027 () Bool)

(assert (=> b!487173 m!467027))

(declare-fun m!467029 () Bool)

(assert (=> b!487175 m!467029))

(assert (=> b!487175 m!467029))

(declare-fun m!467031 () Bool)

(assert (=> b!487175 m!467031))

(check-sat (not b!487170) (not start!44300) (not b!487168) (not b!487174) (not b!487173) (not b!487175) (not b!487169) (not b!487171))
(check-sat)
