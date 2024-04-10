; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47078 () Bool)

(assert start!47078)

(declare-fun b!518842 () Bool)

(declare-fun res!317637 () Bool)

(declare-fun e!302734 () Bool)

(assert (=> b!518842 (=> (not res!317637) (not e!302734))))

(declare-datatypes ((array!33156 0))(
  ( (array!33157 (arr!15940 (Array (_ BitVec 32) (_ BitVec 64))) (size!16304 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33156)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518842 (= res!317637 (validKeyInArray!0 (select (arr!15940 a!3235) j!176)))))

(declare-fun b!518843 () Bool)

(declare-fun e!302731 () Bool)

(declare-fun e!302736 () Bool)

(assert (=> b!518843 (= e!302731 (not e!302736))))

(declare-fun res!317628 () Bool)

(assert (=> b!518843 (=> res!317628 e!302736)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!237561 () (_ BitVec 64))

(declare-fun lt!237559 () (_ BitVec 32))

(declare-fun lt!237560 () array!33156)

(declare-datatypes ((SeekEntryResult!4407 0))(
  ( (MissingZero!4407 (index!19819 (_ BitVec 32))) (Found!4407 (index!19820 (_ BitVec 32))) (Intermediate!4407 (undefined!5219 Bool) (index!19821 (_ BitVec 32)) (x!48789 (_ BitVec 32))) (Undefined!4407) (MissingVacant!4407 (index!19822 (_ BitVec 32))) )
))
(declare-fun lt!237557 () SeekEntryResult!4407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33156 (_ BitVec 32)) SeekEntryResult!4407)

(assert (=> b!518843 (= res!317628 (= lt!237557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237559 lt!237561 lt!237560 mask!3524)))))

(declare-fun lt!237554 () (_ BitVec 32))

(assert (=> b!518843 (= lt!237557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237554 (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518843 (= lt!237559 (toIndex!0 lt!237561 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518843 (= lt!237561 (select (store (arr!15940 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518843 (= lt!237554 (toIndex!0 (select (arr!15940 a!3235) j!176) mask!3524))))

(assert (=> b!518843 (= lt!237560 (array!33157 (store (arr!15940 a!3235) i!1204 k0!2280) (size!16304 a!3235)))))

(declare-fun e!302732 () Bool)

(assert (=> b!518843 e!302732))

(declare-fun res!317639 () Bool)

(assert (=> b!518843 (=> (not res!317639) (not e!302732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33156 (_ BitVec 32)) Bool)

(assert (=> b!518843 (= res!317639 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16080 0))(
  ( (Unit!16081) )
))
(declare-fun lt!237562 () Unit!16080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16080)

(assert (=> b!518843 (= lt!237562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518844 () Bool)

(declare-fun res!317634 () Bool)

(assert (=> b!518844 (=> res!317634 e!302736)))

(get-info :version)

(assert (=> b!518844 (= res!317634 (or (undefined!5219 lt!237557) (not ((_ is Intermediate!4407) lt!237557))))))

(declare-fun b!518845 () Bool)

(declare-fun res!317638 () Bool)

(assert (=> b!518845 (=> (not res!317638) (not e!302734))))

(declare-fun arrayContainsKey!0 (array!33156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518845 (= res!317638 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518846 () Bool)

(declare-fun e!302733 () Unit!16080)

(declare-fun Unit!16082 () Unit!16080)

(assert (=> b!518846 (= e!302733 Unit!16082)))

(declare-fun lt!237555 () Unit!16080)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33156 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16080)

(assert (=> b!518846 (= lt!237555 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237554 #b00000000000000000000000000000000 (index!19821 lt!237557) (x!48789 lt!237557) mask!3524))))

(declare-fun res!317632 () Bool)

(assert (=> b!518846 (= res!317632 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237554 lt!237561 lt!237560 mask!3524) (Intermediate!4407 false (index!19821 lt!237557) (x!48789 lt!237557))))))

(declare-fun e!302735 () Bool)

(assert (=> b!518846 (=> (not res!317632) (not e!302735))))

(assert (=> b!518846 e!302735))

(declare-fun b!518847 () Bool)

(assert (=> b!518847 (= e!302735 false)))

(declare-fun b!518848 () Bool)

(declare-fun res!317630 () Bool)

(assert (=> b!518848 (=> (not res!317630) (not e!302734))))

(assert (=> b!518848 (= res!317630 (validKeyInArray!0 k0!2280))))

(declare-fun b!518850 () Bool)

(declare-fun res!317631 () Bool)

(assert (=> b!518850 (=> (not res!317631) (not e!302731))))

(assert (=> b!518850 (= res!317631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518851 () Bool)

(assert (=> b!518851 (= e!302734 e!302731)))

(declare-fun res!317636 () Bool)

(assert (=> b!518851 (=> (not res!317636) (not e!302731))))

(declare-fun lt!237558 () SeekEntryResult!4407)

(assert (=> b!518851 (= res!317636 (or (= lt!237558 (MissingZero!4407 i!1204)) (= lt!237558 (MissingVacant!4407 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33156 (_ BitVec 32)) SeekEntryResult!4407)

(assert (=> b!518851 (= lt!237558 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518852 () Bool)

(assert (=> b!518852 (= e!302732 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) (Found!4407 j!176)))))

(declare-fun b!518853 () Bool)

(assert (=> b!518853 (= e!302736 (or (= (select (arr!15940 a!3235) (index!19821 lt!237557)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19821 lt!237557) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237557) (size!16304 a!3235)))))))

(declare-fun lt!237556 () Unit!16080)

(assert (=> b!518853 (= lt!237556 e!302733)))

(declare-fun c!60902 () Bool)

(assert (=> b!518853 (= c!60902 (= (select (arr!15940 a!3235) (index!19821 lt!237557)) (select (arr!15940 a!3235) j!176)))))

(assert (=> b!518853 (and (bvslt (x!48789 lt!237557) #b01111111111111111111111111111110) (or (= (select (arr!15940 a!3235) (index!19821 lt!237557)) (select (arr!15940 a!3235) j!176)) (= (select (arr!15940 a!3235) (index!19821 lt!237557)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15940 a!3235) (index!19821 lt!237557)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518854 () Bool)

(declare-fun res!317629 () Bool)

(assert (=> b!518854 (=> (not res!317629) (not e!302731))))

(declare-datatypes ((List!10098 0))(
  ( (Nil!10095) (Cons!10094 (h!11004 (_ BitVec 64)) (t!16326 List!10098)) )
))
(declare-fun arrayNoDuplicates!0 (array!33156 (_ BitVec 32) List!10098) Bool)

(assert (=> b!518854 (= res!317629 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10095))))

(declare-fun b!518855 () Bool)

(declare-fun res!317633 () Bool)

(assert (=> b!518855 (=> (not res!317633) (not e!302734))))

(assert (=> b!518855 (= res!317633 (and (= (size!16304 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16304 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16304 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!317635 () Bool)

(assert (=> start!47078 (=> (not res!317635) (not e!302734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47078 (= res!317635 (validMask!0 mask!3524))))

(assert (=> start!47078 e!302734))

(assert (=> start!47078 true))

(declare-fun array_inv!11736 (array!33156) Bool)

(assert (=> start!47078 (array_inv!11736 a!3235)))

(declare-fun b!518849 () Bool)

(declare-fun Unit!16083 () Unit!16080)

(assert (=> b!518849 (= e!302733 Unit!16083)))

(assert (= (and start!47078 res!317635) b!518855))

(assert (= (and b!518855 res!317633) b!518842))

(assert (= (and b!518842 res!317637) b!518848))

(assert (= (and b!518848 res!317630) b!518845))

(assert (= (and b!518845 res!317638) b!518851))

(assert (= (and b!518851 res!317636) b!518850))

(assert (= (and b!518850 res!317631) b!518854))

(assert (= (and b!518854 res!317629) b!518843))

(assert (= (and b!518843 res!317639) b!518852))

(assert (= (and b!518843 (not res!317628)) b!518844))

(assert (= (and b!518844 (not res!317634)) b!518853))

(assert (= (and b!518853 c!60902) b!518846))

(assert (= (and b!518853 (not c!60902)) b!518849))

(assert (= (and b!518846 res!317632) b!518847))

(declare-fun m!500127 () Bool)

(assert (=> start!47078 m!500127))

(declare-fun m!500129 () Bool)

(assert (=> start!47078 m!500129))

(declare-fun m!500131 () Bool)

(assert (=> b!518848 m!500131))

(declare-fun m!500133 () Bool)

(assert (=> b!518851 m!500133))

(declare-fun m!500135 () Bool)

(assert (=> b!518853 m!500135))

(declare-fun m!500137 () Bool)

(assert (=> b!518853 m!500137))

(declare-fun m!500139 () Bool)

(assert (=> b!518843 m!500139))

(declare-fun m!500141 () Bool)

(assert (=> b!518843 m!500141))

(declare-fun m!500143 () Bool)

(assert (=> b!518843 m!500143))

(declare-fun m!500145 () Bool)

(assert (=> b!518843 m!500145))

(assert (=> b!518843 m!500137))

(declare-fun m!500147 () Bool)

(assert (=> b!518843 m!500147))

(assert (=> b!518843 m!500137))

(declare-fun m!500149 () Bool)

(assert (=> b!518843 m!500149))

(assert (=> b!518843 m!500137))

(declare-fun m!500151 () Bool)

(assert (=> b!518843 m!500151))

(declare-fun m!500153 () Bool)

(assert (=> b!518843 m!500153))

(declare-fun m!500155 () Bool)

(assert (=> b!518845 m!500155))

(declare-fun m!500157 () Bool)

(assert (=> b!518846 m!500157))

(declare-fun m!500159 () Bool)

(assert (=> b!518846 m!500159))

(assert (=> b!518852 m!500137))

(assert (=> b!518852 m!500137))

(declare-fun m!500161 () Bool)

(assert (=> b!518852 m!500161))

(declare-fun m!500163 () Bool)

(assert (=> b!518850 m!500163))

(declare-fun m!500165 () Bool)

(assert (=> b!518854 m!500165))

(assert (=> b!518842 m!500137))

(assert (=> b!518842 m!500137))

(declare-fun m!500167 () Bool)

(assert (=> b!518842 m!500167))

(check-sat (not b!518852) (not b!518854) (not start!47078) (not b!518848) (not b!518850) (not b!518851) (not b!518846) (not b!518842) (not b!518843) (not b!518845))
(check-sat)
(get-model)

(declare-fun lt!237598 () SeekEntryResult!4407)

(declare-fun b!518910 () Bool)

(declare-fun e!302764 () SeekEntryResult!4407)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33156 (_ BitVec 32)) SeekEntryResult!4407)

(assert (=> b!518910 (= e!302764 (seekKeyOrZeroReturnVacant!0 (x!48789 lt!237598) (index!19821 lt!237598) (index!19821 lt!237598) (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518911 () Bool)

(declare-fun e!302765 () SeekEntryResult!4407)

(assert (=> b!518911 (= e!302765 (Found!4407 (index!19821 lt!237598)))))

(declare-fun b!518913 () Bool)

(assert (=> b!518913 (= e!302764 (MissingZero!4407 (index!19821 lt!237598)))))

(declare-fun b!518914 () Bool)

(declare-fun e!302766 () SeekEntryResult!4407)

(assert (=> b!518914 (= e!302766 Undefined!4407)))

(declare-fun b!518915 () Bool)

(declare-fun c!60913 () Bool)

(declare-fun lt!237597 () (_ BitVec 64))

(assert (=> b!518915 (= c!60913 (= lt!237597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518915 (= e!302765 e!302764)))

(declare-fun b!518912 () Bool)

(assert (=> b!518912 (= e!302766 e!302765)))

(assert (=> b!518912 (= lt!237597 (select (arr!15940 a!3235) (index!19821 lt!237598)))))

(declare-fun c!60912 () Bool)

(assert (=> b!518912 (= c!60912 (= lt!237597 (select (arr!15940 a!3235) j!176)))))

(declare-fun d!79965 () Bool)

(declare-fun lt!237596 () SeekEntryResult!4407)

(assert (=> d!79965 (and (or ((_ is Undefined!4407) lt!237596) (not ((_ is Found!4407) lt!237596)) (and (bvsge (index!19820 lt!237596) #b00000000000000000000000000000000) (bvslt (index!19820 lt!237596) (size!16304 a!3235)))) (or ((_ is Undefined!4407) lt!237596) ((_ is Found!4407) lt!237596) (not ((_ is MissingZero!4407) lt!237596)) (and (bvsge (index!19819 lt!237596) #b00000000000000000000000000000000) (bvslt (index!19819 lt!237596) (size!16304 a!3235)))) (or ((_ is Undefined!4407) lt!237596) ((_ is Found!4407) lt!237596) ((_ is MissingZero!4407) lt!237596) (not ((_ is MissingVacant!4407) lt!237596)) (and (bvsge (index!19822 lt!237596) #b00000000000000000000000000000000) (bvslt (index!19822 lt!237596) (size!16304 a!3235)))) (or ((_ is Undefined!4407) lt!237596) (ite ((_ is Found!4407) lt!237596) (= (select (arr!15940 a!3235) (index!19820 lt!237596)) (select (arr!15940 a!3235) j!176)) (ite ((_ is MissingZero!4407) lt!237596) (= (select (arr!15940 a!3235) (index!19819 lt!237596)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4407) lt!237596) (= (select (arr!15940 a!3235) (index!19822 lt!237596)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79965 (= lt!237596 e!302766)))

(declare-fun c!60914 () Bool)

(assert (=> d!79965 (= c!60914 (and ((_ is Intermediate!4407) lt!237598) (undefined!5219 lt!237598)))))

(assert (=> d!79965 (= lt!237598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15940 a!3235) j!176) mask!3524) (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79965 (validMask!0 mask!3524)))

(assert (=> d!79965 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) lt!237596)))

(assert (= (and d!79965 c!60914) b!518914))

(assert (= (and d!79965 (not c!60914)) b!518912))

(assert (= (and b!518912 c!60912) b!518911))

(assert (= (and b!518912 (not c!60912)) b!518915))

(assert (= (and b!518915 c!60913) b!518913))

(assert (= (and b!518915 (not c!60913)) b!518910))

(assert (=> b!518910 m!500137))

(declare-fun m!500211 () Bool)

(assert (=> b!518910 m!500211))

(declare-fun m!500213 () Bool)

(assert (=> b!518912 m!500213))

(declare-fun m!500215 () Bool)

(assert (=> d!79965 m!500215))

(declare-fun m!500217 () Bool)

(assert (=> d!79965 m!500217))

(assert (=> d!79965 m!500137))

(assert (=> d!79965 m!500149))

(declare-fun m!500219 () Bool)

(assert (=> d!79965 m!500219))

(assert (=> d!79965 m!500149))

(assert (=> d!79965 m!500137))

(declare-fun m!500221 () Bool)

(assert (=> d!79965 m!500221))

(assert (=> d!79965 m!500127))

(assert (=> b!518852 d!79965))

(declare-fun d!79967 () Bool)

(assert (=> d!79967 (= (validKeyInArray!0 (select (arr!15940 a!3235) j!176)) (and (not (= (select (arr!15940 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15940 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518842 d!79967))

(declare-fun d!79969 () Bool)

(assert (=> d!79969 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47078 d!79969))

(declare-fun d!79971 () Bool)

(assert (=> d!79971 (= (array_inv!11736 a!3235) (bvsge (size!16304 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47078 d!79971))

(declare-fun d!79973 () Bool)

(declare-fun lt!237604 () (_ BitVec 32))

(declare-fun lt!237603 () (_ BitVec 32))

(assert (=> d!79973 (= lt!237604 (bvmul (bvxor lt!237603 (bvlshr lt!237603 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79973 (= lt!237603 ((_ extract 31 0) (bvand (bvxor lt!237561 (bvlshr lt!237561 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79973 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317676 (let ((h!11006 ((_ extract 31 0) (bvand (bvxor lt!237561 (bvlshr lt!237561 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48791 (bvmul (bvxor h!11006 (bvlshr h!11006 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48791 (bvlshr x!48791 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317676 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317676 #b00000000000000000000000000000000))))))

(assert (=> d!79973 (= (toIndex!0 lt!237561 mask!3524) (bvand (bvxor lt!237604 (bvlshr lt!237604 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518843 d!79973))

(declare-fun d!79975 () Bool)

(declare-fun lt!237606 () (_ BitVec 32))

(declare-fun lt!237605 () (_ BitVec 32))

(assert (=> d!79975 (= lt!237606 (bvmul (bvxor lt!237605 (bvlshr lt!237605 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79975 (= lt!237605 ((_ extract 31 0) (bvand (bvxor (select (arr!15940 a!3235) j!176) (bvlshr (select (arr!15940 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79975 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317676 (let ((h!11006 ((_ extract 31 0) (bvand (bvxor (select (arr!15940 a!3235) j!176) (bvlshr (select (arr!15940 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48791 (bvmul (bvxor h!11006 (bvlshr h!11006 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48791 (bvlshr x!48791 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317676 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317676 #b00000000000000000000000000000000))))))

(assert (=> d!79975 (= (toIndex!0 (select (arr!15940 a!3235) j!176) mask!3524) (bvand (bvxor lt!237606 (bvlshr lt!237606 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518843 d!79975))

(declare-fun b!518924 () Bool)

(declare-fun e!302774 () Bool)

(declare-fun e!302773 () Bool)

(assert (=> b!518924 (= e!302774 e!302773)))

(declare-fun lt!237615 () (_ BitVec 64))

(assert (=> b!518924 (= lt!237615 (select (arr!15940 a!3235) j!176))))

(declare-fun lt!237614 () Unit!16080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33156 (_ BitVec 64) (_ BitVec 32)) Unit!16080)

(assert (=> b!518924 (= lt!237614 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237615 j!176))))

(assert (=> b!518924 (arrayContainsKey!0 a!3235 lt!237615 #b00000000000000000000000000000000)))

(declare-fun lt!237613 () Unit!16080)

(assert (=> b!518924 (= lt!237613 lt!237614)))

(declare-fun res!317681 () Bool)

(assert (=> b!518924 (= res!317681 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) (Found!4407 j!176)))))

(assert (=> b!518924 (=> (not res!317681) (not e!302773))))

(declare-fun b!518925 () Bool)

(declare-fun call!31727 () Bool)

(assert (=> b!518925 (= e!302773 call!31727)))

(declare-fun d!79977 () Bool)

(declare-fun res!317682 () Bool)

(declare-fun e!302775 () Bool)

(assert (=> d!79977 (=> res!317682 e!302775)))

(assert (=> d!79977 (= res!317682 (bvsge j!176 (size!16304 a!3235)))))

(assert (=> d!79977 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302775)))

(declare-fun b!518926 () Bool)

(assert (=> b!518926 (= e!302775 e!302774)))

(declare-fun c!60917 () Bool)

(assert (=> b!518926 (= c!60917 (validKeyInArray!0 (select (arr!15940 a!3235) j!176)))))

(declare-fun bm!31724 () Bool)

(assert (=> bm!31724 (= call!31727 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518927 () Bool)

(assert (=> b!518927 (= e!302774 call!31727)))

(assert (= (and d!79977 (not res!317682)) b!518926))

(assert (= (and b!518926 c!60917) b!518924))

(assert (= (and b!518926 (not c!60917)) b!518927))

(assert (= (and b!518924 res!317681) b!518925))

(assert (= (or b!518925 b!518927) bm!31724))

(assert (=> b!518924 m!500137))

(declare-fun m!500223 () Bool)

(assert (=> b!518924 m!500223))

(declare-fun m!500225 () Bool)

(assert (=> b!518924 m!500225))

(assert (=> b!518924 m!500137))

(assert (=> b!518924 m!500161))

(assert (=> b!518926 m!500137))

(assert (=> b!518926 m!500137))

(assert (=> b!518926 m!500167))

(declare-fun m!500227 () Bool)

(assert (=> bm!31724 m!500227))

(assert (=> b!518843 d!79977))

(declare-fun b!518979 () Bool)

(declare-fun lt!237625 () SeekEntryResult!4407)

(assert (=> b!518979 (and (bvsge (index!19821 lt!237625) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237625) (size!16304 a!3235)))))

(declare-fun res!317706 () Bool)

(assert (=> b!518979 (= res!317706 (= (select (arr!15940 a!3235) (index!19821 lt!237625)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302810 () Bool)

(assert (=> b!518979 (=> res!317706 e!302810)))

(declare-fun b!518980 () Bool)

(assert (=> b!518980 (and (bvsge (index!19821 lt!237625) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237625) (size!16304 a!3235)))))

(assert (=> b!518980 (= e!302810 (= (select (arr!15940 a!3235) (index!19821 lt!237625)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518981 () Bool)

(declare-fun e!302809 () SeekEntryResult!4407)

(declare-fun e!302811 () SeekEntryResult!4407)

(assert (=> b!518981 (= e!302809 e!302811)))

(declare-fun lt!237624 () (_ BitVec 64))

(declare-fun c!60933 () Bool)

(assert (=> b!518981 (= c!60933 (or (= lt!237624 (select (arr!15940 a!3235) j!176)) (= (bvadd lt!237624 lt!237624) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518982 () Bool)

(assert (=> b!518982 (and (bvsge (index!19821 lt!237625) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237625) (size!16304 a!3235)))))

(declare-fun res!317704 () Bool)

(assert (=> b!518982 (= res!317704 (= (select (arr!15940 a!3235) (index!19821 lt!237625)) (select (arr!15940 a!3235) j!176)))))

(assert (=> b!518982 (=> res!317704 e!302810)))

(declare-fun e!302812 () Bool)

(assert (=> b!518982 (= e!302812 e!302810)))

(declare-fun d!79987 () Bool)

(declare-fun e!302808 () Bool)

(assert (=> d!79987 e!302808))

(declare-fun c!60935 () Bool)

(assert (=> d!79987 (= c!60935 (and ((_ is Intermediate!4407) lt!237625) (undefined!5219 lt!237625)))))

(assert (=> d!79987 (= lt!237625 e!302809)))

(declare-fun c!60934 () Bool)

(assert (=> d!79987 (= c!60934 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79987 (= lt!237624 (select (arr!15940 a!3235) lt!237554))))

(assert (=> d!79987 (validMask!0 mask!3524)))

(assert (=> d!79987 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237554 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) lt!237625)))

(declare-fun b!518983 () Bool)

(assert (=> b!518983 (= e!302811 (Intermediate!4407 false lt!237554 #b00000000000000000000000000000000))))

(declare-fun b!518984 () Bool)

(assert (=> b!518984 (= e!302808 (bvsge (x!48789 lt!237625) #b01111111111111111111111111111110))))

(declare-fun b!518985 () Bool)

(assert (=> b!518985 (= e!302808 e!302812)))

(declare-fun res!317705 () Bool)

(assert (=> b!518985 (= res!317705 (and ((_ is Intermediate!4407) lt!237625) (not (undefined!5219 lt!237625)) (bvslt (x!48789 lt!237625) #b01111111111111111111111111111110) (bvsge (x!48789 lt!237625) #b00000000000000000000000000000000) (bvsge (x!48789 lt!237625) #b00000000000000000000000000000000)))))

(assert (=> b!518985 (=> (not res!317705) (not e!302812))))

(declare-fun b!518986 () Bool)

(assert (=> b!518986 (= e!302809 (Intermediate!4407 true lt!237554 #b00000000000000000000000000000000))))

(declare-fun b!518987 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518987 (= e!302811 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237554 #b00000000000000000000000000000000 mask!3524) (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79987 c!60934) b!518986))

(assert (= (and d!79987 (not c!60934)) b!518981))

(assert (= (and b!518981 c!60933) b!518983))

(assert (= (and b!518981 (not c!60933)) b!518987))

(assert (= (and d!79987 c!60935) b!518984))

(assert (= (and d!79987 (not c!60935)) b!518985))

(assert (= (and b!518985 res!317705) b!518982))

(assert (= (and b!518982 (not res!317704)) b!518979))

(assert (= (and b!518979 (not res!317706)) b!518980))

(declare-fun m!500237 () Bool)

(assert (=> b!518980 m!500237))

(assert (=> b!518979 m!500237))

(assert (=> b!518982 m!500237))

(declare-fun m!500239 () Bool)

(assert (=> b!518987 m!500239))

(assert (=> b!518987 m!500239))

(assert (=> b!518987 m!500137))

(declare-fun m!500241 () Bool)

(assert (=> b!518987 m!500241))

(declare-fun m!500243 () Bool)

(assert (=> d!79987 m!500243))

(assert (=> d!79987 m!500127))

(assert (=> b!518843 d!79987))

(declare-fun d!79991 () Bool)

(assert (=> d!79991 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237630 () Unit!16080)

(declare-fun choose!38 (array!33156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16080)

(assert (=> d!79991 (= lt!237630 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79991 (validMask!0 mask!3524)))

(assert (=> d!79991 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237630)))

(declare-fun bs!16366 () Bool)

(assert (= bs!16366 d!79991))

(assert (=> bs!16366 m!500151))

(declare-fun m!500245 () Bool)

(assert (=> bs!16366 m!500245))

(assert (=> bs!16366 m!500127))

(assert (=> b!518843 d!79991))

(declare-fun b!518997 () Bool)

(declare-fun lt!237632 () SeekEntryResult!4407)

(assert (=> b!518997 (and (bvsge (index!19821 lt!237632) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237632) (size!16304 lt!237560)))))

(declare-fun res!317712 () Bool)

(assert (=> b!518997 (= res!317712 (= (select (arr!15940 lt!237560) (index!19821 lt!237632)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302820 () Bool)

(assert (=> b!518997 (=> res!317712 e!302820)))

(declare-fun b!518998 () Bool)

(assert (=> b!518998 (and (bvsge (index!19821 lt!237632) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237632) (size!16304 lt!237560)))))

(assert (=> b!518998 (= e!302820 (= (select (arr!15940 lt!237560) (index!19821 lt!237632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518999 () Bool)

(declare-fun e!302819 () SeekEntryResult!4407)

(declare-fun e!302821 () SeekEntryResult!4407)

(assert (=> b!518999 (= e!302819 e!302821)))

(declare-fun c!60939 () Bool)

(declare-fun lt!237631 () (_ BitVec 64))

(assert (=> b!518999 (= c!60939 (or (= lt!237631 lt!237561) (= (bvadd lt!237631 lt!237631) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519000 () Bool)

(assert (=> b!519000 (and (bvsge (index!19821 lt!237632) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237632) (size!16304 lt!237560)))))

(declare-fun res!317710 () Bool)

(assert (=> b!519000 (= res!317710 (= (select (arr!15940 lt!237560) (index!19821 lt!237632)) lt!237561))))

(assert (=> b!519000 (=> res!317710 e!302820)))

(declare-fun e!302822 () Bool)

(assert (=> b!519000 (= e!302822 e!302820)))

(declare-fun d!79993 () Bool)

(declare-fun e!302818 () Bool)

(assert (=> d!79993 e!302818))

(declare-fun c!60941 () Bool)

(assert (=> d!79993 (= c!60941 (and ((_ is Intermediate!4407) lt!237632) (undefined!5219 lt!237632)))))

(assert (=> d!79993 (= lt!237632 e!302819)))

(declare-fun c!60940 () Bool)

(assert (=> d!79993 (= c!60940 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79993 (= lt!237631 (select (arr!15940 lt!237560) lt!237559))))

(assert (=> d!79993 (validMask!0 mask!3524)))

(assert (=> d!79993 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237559 lt!237561 lt!237560 mask!3524) lt!237632)))

(declare-fun b!519001 () Bool)

(assert (=> b!519001 (= e!302821 (Intermediate!4407 false lt!237559 #b00000000000000000000000000000000))))

(declare-fun b!519002 () Bool)

(assert (=> b!519002 (= e!302818 (bvsge (x!48789 lt!237632) #b01111111111111111111111111111110))))

(declare-fun b!519003 () Bool)

(assert (=> b!519003 (= e!302818 e!302822)))

(declare-fun res!317711 () Bool)

(assert (=> b!519003 (= res!317711 (and ((_ is Intermediate!4407) lt!237632) (not (undefined!5219 lt!237632)) (bvslt (x!48789 lt!237632) #b01111111111111111111111111111110) (bvsge (x!48789 lt!237632) #b00000000000000000000000000000000) (bvsge (x!48789 lt!237632) #b00000000000000000000000000000000)))))

(assert (=> b!519003 (=> (not res!317711) (not e!302822))))

(declare-fun b!519004 () Bool)

(assert (=> b!519004 (= e!302819 (Intermediate!4407 true lt!237559 #b00000000000000000000000000000000))))

(declare-fun b!519005 () Bool)

(assert (=> b!519005 (= e!302821 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237559 #b00000000000000000000000000000000 mask!3524) lt!237561 lt!237560 mask!3524))))

(assert (= (and d!79993 c!60940) b!519004))

(assert (= (and d!79993 (not c!60940)) b!518999))

(assert (= (and b!518999 c!60939) b!519001))

(assert (= (and b!518999 (not c!60939)) b!519005))

(assert (= (and d!79993 c!60941) b!519002))

(assert (= (and d!79993 (not c!60941)) b!519003))

(assert (= (and b!519003 res!317711) b!519000))

(assert (= (and b!519000 (not res!317710)) b!518997))

(assert (= (and b!518997 (not res!317712)) b!518998))

(declare-fun m!500255 () Bool)

(assert (=> b!518998 m!500255))

(assert (=> b!518997 m!500255))

(assert (=> b!519000 m!500255))

(declare-fun m!500257 () Bool)

(assert (=> b!519005 m!500257))

(assert (=> b!519005 m!500257))

(declare-fun m!500259 () Bool)

(assert (=> b!519005 m!500259))

(declare-fun m!500261 () Bool)

(assert (=> d!79993 m!500261))

(assert (=> d!79993 m!500127))

(assert (=> b!518843 d!79993))

(declare-fun d!79997 () Bool)

(assert (=> d!79997 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518848 d!79997))

(declare-fun b!519018 () Bool)

(declare-fun e!302834 () Bool)

(declare-fun e!302833 () Bool)

(assert (=> b!519018 (= e!302834 e!302833)))

(declare-fun res!317722 () Bool)

(assert (=> b!519018 (=> (not res!317722) (not e!302833))))

(declare-fun e!302832 () Bool)

(assert (=> b!519018 (= res!317722 (not e!302832))))

(declare-fun res!317721 () Bool)

(assert (=> b!519018 (=> (not res!317721) (not e!302832))))

(assert (=> b!519018 (= res!317721 (validKeyInArray!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519020 () Bool)

(declare-fun contains!2752 (List!10098 (_ BitVec 64)) Bool)

(assert (=> b!519020 (= e!302832 (contains!2752 Nil!10095 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31730 () Bool)

(declare-fun call!31733 () Bool)

(declare-fun c!60944 () Bool)

(assert (=> bm!31730 (= call!31733 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60944 (Cons!10094 (select (arr!15940 a!3235) #b00000000000000000000000000000000) Nil!10095) Nil!10095)))))

(declare-fun b!519021 () Bool)

(declare-fun e!302831 () Bool)

(assert (=> b!519021 (= e!302833 e!302831)))

(assert (=> b!519021 (= c!60944 (validKeyInArray!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519023 () Bool)

(assert (=> b!519023 (= e!302831 call!31733)))

(declare-fun d!79999 () Bool)

(declare-fun res!317720 () Bool)

(assert (=> d!79999 (=> res!317720 e!302834)))

(assert (=> d!79999 (= res!317720 (bvsge #b00000000000000000000000000000000 (size!16304 a!3235)))))

(assert (=> d!79999 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10095) e!302834)))

(declare-fun b!519024 () Bool)

(assert (=> b!519024 (= e!302831 call!31733)))

(assert (= (and d!79999 (not res!317720)) b!519018))

(assert (= (and b!519018 res!317721) b!519020))

(assert (= (and b!519018 res!317722) b!519021))

(assert (= (and b!519021 c!60944) b!519023))

(assert (= (and b!519021 (not c!60944)) b!519024))

(assert (= (or b!519023 b!519024) bm!31730))

(declare-fun m!500263 () Bool)

(assert (=> b!519018 m!500263))

(assert (=> b!519018 m!500263))

(declare-fun m!500265 () Bool)

(assert (=> b!519018 m!500265))

(assert (=> b!519020 m!500263))

(assert (=> b!519020 m!500263))

(declare-fun m!500267 () Bool)

(assert (=> b!519020 m!500267))

(assert (=> bm!31730 m!500263))

(declare-fun m!500269 () Bool)

(assert (=> bm!31730 m!500269))

(assert (=> b!519021 m!500263))

(assert (=> b!519021 m!500263))

(assert (=> b!519021 m!500265))

(assert (=> b!518854 d!79999))

(declare-fun d!80001 () Bool)

(declare-fun res!317727 () Bool)

(declare-fun e!302845 () Bool)

(assert (=> d!80001 (=> res!317727 e!302845)))

(assert (=> d!80001 (= res!317727 (= (select (arr!15940 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80001 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302845)))

(declare-fun b!519037 () Bool)

(declare-fun e!302846 () Bool)

(assert (=> b!519037 (= e!302845 e!302846)))

(declare-fun res!317728 () Bool)

(assert (=> b!519037 (=> (not res!317728) (not e!302846))))

(assert (=> b!519037 (= res!317728 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16304 a!3235)))))

(declare-fun b!519038 () Bool)

(assert (=> b!519038 (= e!302846 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80001 (not res!317727)) b!519037))

(assert (= (and b!519037 res!317728) b!519038))

(assert (=> d!80001 m!500263))

(declare-fun m!500271 () Bool)

(assert (=> b!519038 m!500271))

(assert (=> b!518845 d!80001))

(declare-fun b!519039 () Bool)

(declare-fun e!302848 () Bool)

(declare-fun e!302847 () Bool)

(assert (=> b!519039 (= e!302848 e!302847)))

(declare-fun lt!237649 () (_ BitVec 64))

(assert (=> b!519039 (= lt!237649 (select (arr!15940 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237648 () Unit!16080)

(assert (=> b!519039 (= lt!237648 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237649 #b00000000000000000000000000000000))))

(assert (=> b!519039 (arrayContainsKey!0 a!3235 lt!237649 #b00000000000000000000000000000000)))

(declare-fun lt!237647 () Unit!16080)

(assert (=> b!519039 (= lt!237647 lt!237648)))

(declare-fun res!317729 () Bool)

(assert (=> b!519039 (= res!317729 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4407 #b00000000000000000000000000000000)))))

(assert (=> b!519039 (=> (not res!317729) (not e!302847))))

(declare-fun b!519040 () Bool)

(declare-fun call!31734 () Bool)

(assert (=> b!519040 (= e!302847 call!31734)))

(declare-fun d!80007 () Bool)

(declare-fun res!317730 () Bool)

(declare-fun e!302849 () Bool)

(assert (=> d!80007 (=> res!317730 e!302849)))

(assert (=> d!80007 (= res!317730 (bvsge #b00000000000000000000000000000000 (size!16304 a!3235)))))

(assert (=> d!80007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302849)))

(declare-fun b!519041 () Bool)

(assert (=> b!519041 (= e!302849 e!302848)))

(declare-fun c!60951 () Bool)

(assert (=> b!519041 (= c!60951 (validKeyInArray!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31731 () Bool)

(assert (=> bm!31731 (= call!31734 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519042 () Bool)

(assert (=> b!519042 (= e!302848 call!31734)))

(assert (= (and d!80007 (not res!317730)) b!519041))

(assert (= (and b!519041 c!60951) b!519039))

(assert (= (and b!519041 (not c!60951)) b!519042))

(assert (= (and b!519039 res!317729) b!519040))

(assert (= (or b!519040 b!519042) bm!31731))

(assert (=> b!519039 m!500263))

(declare-fun m!500273 () Bool)

(assert (=> b!519039 m!500273))

(declare-fun m!500275 () Bool)

(assert (=> b!519039 m!500275))

(assert (=> b!519039 m!500263))

(declare-fun m!500277 () Bool)

(assert (=> b!519039 m!500277))

(assert (=> b!519041 m!500263))

(assert (=> b!519041 m!500263))

(assert (=> b!519041 m!500265))

(declare-fun m!500279 () Bool)

(assert (=> bm!31731 m!500279))

(assert (=> b!518850 d!80007))

(declare-fun b!519043 () Bool)

(declare-fun lt!237652 () SeekEntryResult!4407)

(declare-fun e!302850 () SeekEntryResult!4407)

(assert (=> b!519043 (= e!302850 (seekKeyOrZeroReturnVacant!0 (x!48789 lt!237652) (index!19821 lt!237652) (index!19821 lt!237652) k0!2280 a!3235 mask!3524))))

(declare-fun b!519044 () Bool)

(declare-fun e!302851 () SeekEntryResult!4407)

(assert (=> b!519044 (= e!302851 (Found!4407 (index!19821 lt!237652)))))

(declare-fun b!519046 () Bool)

(assert (=> b!519046 (= e!302850 (MissingZero!4407 (index!19821 lt!237652)))))

(declare-fun b!519047 () Bool)

(declare-fun e!302852 () SeekEntryResult!4407)

(assert (=> b!519047 (= e!302852 Undefined!4407)))

(declare-fun b!519048 () Bool)

(declare-fun c!60953 () Bool)

(declare-fun lt!237651 () (_ BitVec 64))

(assert (=> b!519048 (= c!60953 (= lt!237651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519048 (= e!302851 e!302850)))

(declare-fun b!519045 () Bool)

(assert (=> b!519045 (= e!302852 e!302851)))

(assert (=> b!519045 (= lt!237651 (select (arr!15940 a!3235) (index!19821 lt!237652)))))

(declare-fun c!60952 () Bool)

(assert (=> b!519045 (= c!60952 (= lt!237651 k0!2280))))

(declare-fun d!80009 () Bool)

(declare-fun lt!237650 () SeekEntryResult!4407)

(assert (=> d!80009 (and (or ((_ is Undefined!4407) lt!237650) (not ((_ is Found!4407) lt!237650)) (and (bvsge (index!19820 lt!237650) #b00000000000000000000000000000000) (bvslt (index!19820 lt!237650) (size!16304 a!3235)))) (or ((_ is Undefined!4407) lt!237650) ((_ is Found!4407) lt!237650) (not ((_ is MissingZero!4407) lt!237650)) (and (bvsge (index!19819 lt!237650) #b00000000000000000000000000000000) (bvslt (index!19819 lt!237650) (size!16304 a!3235)))) (or ((_ is Undefined!4407) lt!237650) ((_ is Found!4407) lt!237650) ((_ is MissingZero!4407) lt!237650) (not ((_ is MissingVacant!4407) lt!237650)) (and (bvsge (index!19822 lt!237650) #b00000000000000000000000000000000) (bvslt (index!19822 lt!237650) (size!16304 a!3235)))) (or ((_ is Undefined!4407) lt!237650) (ite ((_ is Found!4407) lt!237650) (= (select (arr!15940 a!3235) (index!19820 lt!237650)) k0!2280) (ite ((_ is MissingZero!4407) lt!237650) (= (select (arr!15940 a!3235) (index!19819 lt!237650)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4407) lt!237650) (= (select (arr!15940 a!3235) (index!19822 lt!237650)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80009 (= lt!237650 e!302852)))

(declare-fun c!60954 () Bool)

(assert (=> d!80009 (= c!60954 (and ((_ is Intermediate!4407) lt!237652) (undefined!5219 lt!237652)))))

(assert (=> d!80009 (= lt!237652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80009 (validMask!0 mask!3524)))

(assert (=> d!80009 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237650)))

(assert (= (and d!80009 c!60954) b!519047))

(assert (= (and d!80009 (not c!60954)) b!519045))

(assert (= (and b!519045 c!60952) b!519044))

(assert (= (and b!519045 (not c!60952)) b!519048))

(assert (= (and b!519048 c!60953) b!519046))

(assert (= (and b!519048 (not c!60953)) b!519043))

(declare-fun m!500281 () Bool)

(assert (=> b!519043 m!500281))

(declare-fun m!500283 () Bool)

(assert (=> b!519045 m!500283))

(declare-fun m!500285 () Bool)

(assert (=> d!80009 m!500285))

(declare-fun m!500287 () Bool)

(assert (=> d!80009 m!500287))

(declare-fun m!500289 () Bool)

(assert (=> d!80009 m!500289))

(declare-fun m!500291 () Bool)

(assert (=> d!80009 m!500291))

(assert (=> d!80009 m!500289))

(declare-fun m!500293 () Bool)

(assert (=> d!80009 m!500293))

(assert (=> d!80009 m!500127))

(assert (=> b!518851 d!80009))

(declare-fun d!80011 () Bool)

(declare-fun e!302881 () Bool)

(assert (=> d!80011 e!302881))

(declare-fun res!317748 () Bool)

(assert (=> d!80011 (=> (not res!317748) (not e!302881))))

(assert (=> d!80011 (= res!317748 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16304 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16304 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16304 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16304 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16304 a!3235))))))

(declare-fun lt!237672 () Unit!16080)

(declare-fun choose!47 (array!33156 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16080)

(assert (=> d!80011 (= lt!237672 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237554 #b00000000000000000000000000000000 (index!19821 lt!237557) (x!48789 lt!237557) mask!3524))))

(assert (=> d!80011 (validMask!0 mask!3524)))

(assert (=> d!80011 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237554 #b00000000000000000000000000000000 (index!19821 lt!237557) (x!48789 lt!237557) mask!3524) lt!237672)))

(declare-fun b!519090 () Bool)

(assert (=> b!519090 (= e!302881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237554 (select (store (arr!15940 a!3235) i!1204 k0!2280) j!176) (array!33157 (store (arr!15940 a!3235) i!1204 k0!2280) (size!16304 a!3235)) mask!3524) (Intermediate!4407 false (index!19821 lt!237557) (x!48789 lt!237557))))))

(assert (= (and d!80011 res!317748) b!519090))

(declare-fun m!500329 () Bool)

(assert (=> d!80011 m!500329))

(assert (=> d!80011 m!500127))

(assert (=> b!519090 m!500139))

(assert (=> b!519090 m!500145))

(assert (=> b!519090 m!500145))

(declare-fun m!500331 () Bool)

(assert (=> b!519090 m!500331))

(assert (=> b!518846 d!80011))

(declare-fun b!519091 () Bool)

(declare-fun lt!237674 () SeekEntryResult!4407)

(assert (=> b!519091 (and (bvsge (index!19821 lt!237674) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237674) (size!16304 lt!237560)))))

(declare-fun res!317751 () Bool)

(assert (=> b!519091 (= res!317751 (= (select (arr!15940 lt!237560) (index!19821 lt!237674)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302884 () Bool)

(assert (=> b!519091 (=> res!317751 e!302884)))

(declare-fun b!519092 () Bool)

(assert (=> b!519092 (and (bvsge (index!19821 lt!237674) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237674) (size!16304 lt!237560)))))

(assert (=> b!519092 (= e!302884 (= (select (arr!15940 lt!237560) (index!19821 lt!237674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519093 () Bool)

(declare-fun e!302883 () SeekEntryResult!4407)

(declare-fun e!302885 () SeekEntryResult!4407)

(assert (=> b!519093 (= e!302883 e!302885)))

(declare-fun c!60967 () Bool)

(declare-fun lt!237673 () (_ BitVec 64))

(assert (=> b!519093 (= c!60967 (or (= lt!237673 lt!237561) (= (bvadd lt!237673 lt!237673) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519094 () Bool)

(assert (=> b!519094 (and (bvsge (index!19821 lt!237674) #b00000000000000000000000000000000) (bvslt (index!19821 lt!237674) (size!16304 lt!237560)))))

(declare-fun res!317749 () Bool)

(assert (=> b!519094 (= res!317749 (= (select (arr!15940 lt!237560) (index!19821 lt!237674)) lt!237561))))

(assert (=> b!519094 (=> res!317749 e!302884)))

(declare-fun e!302886 () Bool)

(assert (=> b!519094 (= e!302886 e!302884)))

(declare-fun d!80021 () Bool)

(declare-fun e!302882 () Bool)

(assert (=> d!80021 e!302882))

(declare-fun c!60969 () Bool)

(assert (=> d!80021 (= c!60969 (and ((_ is Intermediate!4407) lt!237674) (undefined!5219 lt!237674)))))

(assert (=> d!80021 (= lt!237674 e!302883)))

(declare-fun c!60968 () Bool)

(assert (=> d!80021 (= c!60968 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80021 (= lt!237673 (select (arr!15940 lt!237560) lt!237554))))

(assert (=> d!80021 (validMask!0 mask!3524)))

(assert (=> d!80021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237554 lt!237561 lt!237560 mask!3524) lt!237674)))

(declare-fun b!519095 () Bool)

(assert (=> b!519095 (= e!302885 (Intermediate!4407 false lt!237554 #b00000000000000000000000000000000))))

(declare-fun b!519096 () Bool)

(assert (=> b!519096 (= e!302882 (bvsge (x!48789 lt!237674) #b01111111111111111111111111111110))))

(declare-fun b!519097 () Bool)

(assert (=> b!519097 (= e!302882 e!302886)))

(declare-fun res!317750 () Bool)

(assert (=> b!519097 (= res!317750 (and ((_ is Intermediate!4407) lt!237674) (not (undefined!5219 lt!237674)) (bvslt (x!48789 lt!237674) #b01111111111111111111111111111110) (bvsge (x!48789 lt!237674) #b00000000000000000000000000000000) (bvsge (x!48789 lt!237674) #b00000000000000000000000000000000)))))

(assert (=> b!519097 (=> (not res!317750) (not e!302886))))

(declare-fun b!519098 () Bool)

(assert (=> b!519098 (= e!302883 (Intermediate!4407 true lt!237554 #b00000000000000000000000000000000))))

(declare-fun b!519099 () Bool)

(assert (=> b!519099 (= e!302885 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237554 #b00000000000000000000000000000000 mask!3524) lt!237561 lt!237560 mask!3524))))

(assert (= (and d!80021 c!60968) b!519098))

(assert (= (and d!80021 (not c!60968)) b!519093))

(assert (= (and b!519093 c!60967) b!519095))

(assert (= (and b!519093 (not c!60967)) b!519099))

(assert (= (and d!80021 c!60969) b!519096))

(assert (= (and d!80021 (not c!60969)) b!519097))

(assert (= (and b!519097 res!317750) b!519094))

(assert (= (and b!519094 (not res!317749)) b!519091))

(assert (= (and b!519091 (not res!317751)) b!519092))

(declare-fun m!500339 () Bool)

(assert (=> b!519092 m!500339))

(assert (=> b!519091 m!500339))

(assert (=> b!519094 m!500339))

(assert (=> b!519099 m!500239))

(assert (=> b!519099 m!500239))

(declare-fun m!500343 () Bool)

(assert (=> b!519099 m!500343))

(declare-fun m!500345 () Bool)

(assert (=> d!80021 m!500345))

(assert (=> d!80021 m!500127))

(assert (=> b!518846 d!80021))

(check-sat (not b!519020) (not b!519039) (not b!519043) (not b!519021) (not d!79993) (not b!518926) (not b!519090) (not b!519005) (not d!80021) (not b!518924) (not bm!31730) (not d!79987) (not b!518910) (not d!79991) (not b!519099) (not d!80009) (not b!519018) (not bm!31724) (not d!79965) (not b!519038) (not bm!31731) (not b!518987) (not d!80011) (not b!519041))
(check-sat)
