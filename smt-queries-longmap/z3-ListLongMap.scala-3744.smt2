; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51446 () Bool)

(assert start!51446)

(declare-fun b!562331 () Bool)

(declare-fun res!353632 () Bool)

(declare-fun e!324056 () Bool)

(assert (=> b!562331 (=> (not res!353632) (not e!324056))))

(declare-datatypes ((array!35320 0))(
  ( (array!35321 (arr!16961 (Array (_ BitVec 32) (_ BitVec 64))) (size!17326 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35320)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562331 (= res!353632 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562332 () Bool)

(declare-fun res!353629 () Bool)

(declare-fun e!324054 () Bool)

(assert (=> b!562332 (=> (not res!353629) (not e!324054))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35320 (_ BitVec 32)) Bool)

(assert (=> b!562332 (= res!353629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562333 () Bool)

(declare-fun res!353631 () Bool)

(assert (=> b!562333 (=> (not res!353631) (not e!324056))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562333 (= res!353631 (and (= (size!17326 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17326 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17326 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562334 () Bool)

(declare-fun res!353630 () Bool)

(assert (=> b!562334 (=> (not res!353630) (not e!324054))))

(declare-datatypes ((List!11080 0))(
  ( (Nil!11077) (Cons!11076 (h!12079 (_ BitVec 64)) (t!17299 List!11080)) )
))
(declare-fun arrayNoDuplicates!0 (array!35320 (_ BitVec 32) List!11080) Bool)

(assert (=> b!562334 (= res!353630 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11077))))

(declare-fun b!562335 () Bool)

(declare-fun e!324057 () Bool)

(declare-fun e!324058 () Bool)

(assert (=> b!562335 (= e!324057 e!324058)))

(declare-fun res!353628 () Bool)

(assert (=> b!562335 (=> res!353628 e!324058)))

(declare-datatypes ((SeekEntryResult!5407 0))(
  ( (MissingZero!5407 (index!23855 (_ BitVec 32))) (Found!5407 (index!23856 (_ BitVec 32))) (Intermediate!5407 (undefined!6219 Bool) (index!23857 (_ BitVec 32)) (x!52761 (_ BitVec 32))) (Undefined!5407) (MissingVacant!5407 (index!23858 (_ BitVec 32))) )
))
(declare-fun lt!256202 () SeekEntryResult!5407)

(declare-fun lt!256197 () (_ BitVec 64))

(declare-fun lt!256198 () SeekEntryResult!5407)

(declare-fun lt!256207 () SeekEntryResult!5407)

(assert (=> b!562335 (= res!353628 (or (bvslt (index!23857 lt!256207) #b00000000000000000000000000000000) (bvsge (index!23857 lt!256207) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52761 lt!256207) #b01111111111111111111111111111110) (bvslt (x!52761 lt!256207) #b00000000000000000000000000000000) (not (= lt!256197 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16961 a!3118) i!1132 k0!1914) (index!23857 lt!256207)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256198 lt!256202))))))

(declare-fun lt!256199 () SeekEntryResult!5407)

(declare-fun lt!256194 () SeekEntryResult!5407)

(assert (=> b!562335 (= lt!256199 lt!256194)))

(declare-fun lt!256204 () array!35320)

(declare-fun lt!256196 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35320 (_ BitVec 32)) SeekEntryResult!5407)

(assert (=> b!562335 (= lt!256194 (seekKeyOrZeroReturnVacant!0 (x!52761 lt!256207) (index!23857 lt!256207) (index!23857 lt!256207) lt!256196 lt!256204 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35320 (_ BitVec 32)) SeekEntryResult!5407)

(assert (=> b!562335 (= lt!256199 (seekEntryOrOpen!0 lt!256196 lt!256204 mask!3119))))

(declare-fun lt!256206 () SeekEntryResult!5407)

(assert (=> b!562335 (= lt!256206 lt!256198)))

(assert (=> b!562335 (= lt!256198 (seekKeyOrZeroReturnVacant!0 (x!52761 lt!256207) (index!23857 lt!256207) (index!23857 lt!256207) (select (arr!16961 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562336 () Bool)

(declare-fun e!324060 () Bool)

(declare-fun e!324059 () Bool)

(assert (=> b!562336 (= e!324060 (not e!324059))))

(declare-fun res!353627 () Bool)

(assert (=> b!562336 (=> res!353627 e!324059)))

(get-info :version)

(assert (=> b!562336 (= res!353627 (or (undefined!6219 lt!256207) (not ((_ is Intermediate!5407) lt!256207))))))

(assert (=> b!562336 (= lt!256206 lt!256202)))

(assert (=> b!562336 (= lt!256202 (Found!5407 j!142))))

(assert (=> b!562336 (= lt!256206 (seekEntryOrOpen!0 (select (arr!16961 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562336 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17574 0))(
  ( (Unit!17575) )
))
(declare-fun lt!256195 () Unit!17574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17574)

(assert (=> b!562336 (= lt!256195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!353626 () Bool)

(assert (=> start!51446 (=> (not res!353626) (not e!324056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51446 (= res!353626 (validMask!0 mask!3119))))

(assert (=> start!51446 e!324056))

(assert (=> start!51446 true))

(declare-fun array_inv!12844 (array!35320) Bool)

(assert (=> start!51446 (array_inv!12844 a!3118)))

(declare-fun b!562337 () Bool)

(declare-fun res!353636 () Bool)

(assert (=> b!562337 (=> (not res!353636) (not e!324056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562337 (= res!353636 (validKeyInArray!0 k0!1914))))

(declare-fun b!562338 () Bool)

(assert (=> b!562338 (= e!324054 e!324060)))

(declare-fun res!353625 () Bool)

(assert (=> b!562338 (=> (not res!353625) (not e!324060))))

(declare-fun lt!256203 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35320 (_ BitVec 32)) SeekEntryResult!5407)

(assert (=> b!562338 (= res!353625 (= lt!256207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256203 lt!256196 lt!256204 mask!3119)))))

(declare-fun lt!256200 () (_ BitVec 32))

(assert (=> b!562338 (= lt!256207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256200 (select (arr!16961 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562338 (= lt!256203 (toIndex!0 lt!256196 mask!3119))))

(assert (=> b!562338 (= lt!256196 (select (store (arr!16961 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562338 (= lt!256200 (toIndex!0 (select (arr!16961 a!3118) j!142) mask!3119))))

(assert (=> b!562338 (= lt!256204 (array!35321 (store (arr!16961 a!3118) i!1132 k0!1914) (size!17326 a!3118)))))

(declare-fun b!562339 () Bool)

(assert (=> b!562339 (= e!324056 e!324054)))

(declare-fun res!353635 () Bool)

(assert (=> b!562339 (=> (not res!353635) (not e!324054))))

(declare-fun lt!256205 () SeekEntryResult!5407)

(assert (=> b!562339 (= res!353635 (or (= lt!256205 (MissingZero!5407 i!1132)) (= lt!256205 (MissingVacant!5407 i!1132))))))

(assert (=> b!562339 (= lt!256205 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562340 () Bool)

(declare-fun res!353633 () Bool)

(assert (=> b!562340 (=> (not res!353633) (not e!324056))))

(assert (=> b!562340 (= res!353633 (validKeyInArray!0 (select (arr!16961 a!3118) j!142)))))

(declare-fun b!562341 () Bool)

(assert (=> b!562341 (= e!324058 true)))

(assert (=> b!562341 (= lt!256198 lt!256194)))

(declare-fun lt!256201 () Unit!17574)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35320 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17574)

(assert (=> b!562341 (= lt!256201 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52761 lt!256207) (index!23857 lt!256207) (index!23857 lt!256207) mask!3119))))

(declare-fun b!562342 () Bool)

(assert (=> b!562342 (= e!324059 e!324057)))

(declare-fun res!353634 () Bool)

(assert (=> b!562342 (=> res!353634 e!324057)))

(assert (=> b!562342 (= res!353634 (or (= lt!256197 (select (arr!16961 a!3118) j!142)) (= lt!256197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562342 (= lt!256197 (select (arr!16961 a!3118) (index!23857 lt!256207)))))

(assert (= (and start!51446 res!353626) b!562333))

(assert (= (and b!562333 res!353631) b!562340))

(assert (= (and b!562340 res!353633) b!562337))

(assert (= (and b!562337 res!353636) b!562331))

(assert (= (and b!562331 res!353632) b!562339))

(assert (= (and b!562339 res!353635) b!562332))

(assert (= (and b!562332 res!353629) b!562334))

(assert (= (and b!562334 res!353630) b!562338))

(assert (= (and b!562338 res!353625) b!562336))

(assert (= (and b!562336 (not res!353627)) b!562342))

(assert (= (and b!562342 (not res!353634)) b!562335))

(assert (= (and b!562335 (not res!353628)) b!562341))

(declare-fun m!539921 () Bool)

(assert (=> b!562338 m!539921))

(declare-fun m!539923 () Bool)

(assert (=> b!562338 m!539923))

(assert (=> b!562338 m!539921))

(declare-fun m!539925 () Bool)

(assert (=> b!562338 m!539925))

(assert (=> b!562338 m!539921))

(declare-fun m!539927 () Bool)

(assert (=> b!562338 m!539927))

(declare-fun m!539929 () Bool)

(assert (=> b!562338 m!539929))

(declare-fun m!539931 () Bool)

(assert (=> b!562338 m!539931))

(declare-fun m!539933 () Bool)

(assert (=> b!562338 m!539933))

(assert (=> b!562336 m!539921))

(assert (=> b!562336 m!539921))

(declare-fun m!539935 () Bool)

(assert (=> b!562336 m!539935))

(declare-fun m!539937 () Bool)

(assert (=> b!562336 m!539937))

(declare-fun m!539939 () Bool)

(assert (=> b!562336 m!539939))

(declare-fun m!539941 () Bool)

(assert (=> b!562341 m!539941))

(declare-fun m!539943 () Bool)

(assert (=> b!562339 m!539943))

(declare-fun m!539945 () Bool)

(assert (=> b!562337 m!539945))

(declare-fun m!539947 () Bool)

(assert (=> start!51446 m!539947))

(declare-fun m!539949 () Bool)

(assert (=> start!51446 m!539949))

(assert (=> b!562335 m!539921))

(declare-fun m!539951 () Bool)

(assert (=> b!562335 m!539951))

(declare-fun m!539953 () Bool)

(assert (=> b!562335 m!539953))

(assert (=> b!562335 m!539933))

(assert (=> b!562335 m!539921))

(declare-fun m!539955 () Bool)

(assert (=> b!562335 m!539955))

(declare-fun m!539957 () Bool)

(assert (=> b!562335 m!539957))

(assert (=> b!562342 m!539921))

(declare-fun m!539959 () Bool)

(assert (=> b!562342 m!539959))

(declare-fun m!539961 () Bool)

(assert (=> b!562331 m!539961))

(declare-fun m!539963 () Bool)

(assert (=> b!562332 m!539963))

(declare-fun m!539965 () Bool)

(assert (=> b!562334 m!539965))

(assert (=> b!562340 m!539921))

(assert (=> b!562340 m!539921))

(declare-fun m!539967 () Bool)

(assert (=> b!562340 m!539967))

(check-sat (not b!562338) (not b!562335) (not b!562341) (not b!562336) (not b!562339) (not b!562331) (not b!562334) (not start!51446) (not b!562332) (not b!562340) (not b!562337))
(check-sat)
