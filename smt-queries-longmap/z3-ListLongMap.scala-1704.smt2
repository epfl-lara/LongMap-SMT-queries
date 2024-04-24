; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31296 () Bool)

(assert start!31296)

(declare-fun b!313972 () Bool)

(declare-fun res!169917 () Bool)

(declare-fun e!195626 () Bool)

(assert (=> b!313972 (=> (not res!169917) (not e!195626))))

(declare-datatypes ((array!16025 0))(
  ( (array!16026 (arr!7588 (Array (_ BitVec 32) (_ BitVec 64))) (size!7940 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16025)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313972 (= res!169917 (and (= (size!7940 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7940 a!3293))))))

(declare-fun res!169918 () Bool)

(assert (=> start!31296 (=> (not res!169918) (not e!195626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31296 (= res!169918 (validMask!0 mask!3709))))

(assert (=> start!31296 e!195626))

(declare-fun array_inv!5538 (array!16025) Bool)

(assert (=> start!31296 (array_inv!5538 a!3293)))

(assert (=> start!31296 true))

(declare-fun b!313973 () Bool)

(declare-fun res!169914 () Bool)

(assert (=> b!313973 (=> (not res!169914) (not e!195626))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313973 (= res!169914 (validKeyInArray!0 k0!2441))))

(declare-fun b!313974 () Bool)

(declare-fun e!195627 () Bool)

(assert (=> b!313974 (= e!195626 e!195627)))

(declare-fun res!169915 () Bool)

(assert (=> b!313974 (=> (not res!169915) (not e!195627))))

(declare-datatypes ((SeekEntryResult!2693 0))(
  ( (MissingZero!2693 (index!12948 (_ BitVec 32))) (Found!2693 (index!12949 (_ BitVec 32))) (Intermediate!2693 (undefined!3505 Bool) (index!12950 (_ BitVec 32)) (x!31282 (_ BitVec 32))) (Undefined!2693) (MissingVacant!2693 (index!12951 (_ BitVec 32))) )
))
(declare-fun lt!153804 () SeekEntryResult!2693)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16025 (_ BitVec 32)) SeekEntryResult!2693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313974 (= res!169915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153804))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!313974 (= lt!153804 (Intermediate!2693 false resIndex!52 resX!52))))

(declare-fun b!313975 () Bool)

(declare-fun res!169916 () Bool)

(assert (=> b!313975 (=> (not res!169916) (not e!195626))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16025 (_ BitVec 32)) SeekEntryResult!2693)

(assert (=> b!313975 (= res!169916 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2693 i!1240)))))

(declare-fun b!313976 () Bool)

(declare-fun res!169919 () Bool)

(assert (=> b!313976 (=> (not res!169919) (not e!195626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16025 (_ BitVec 32)) Bool)

(assert (=> b!313976 (= res!169919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313977 () Bool)

(declare-fun res!169913 () Bool)

(assert (=> b!313977 (=> (not res!169913) (not e!195627))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!313977 (= res!169913 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153804))))

(declare-fun b!313978 () Bool)

(declare-fun res!169912 () Bool)

(assert (=> b!313978 (=> (not res!169912) (not e!195627))))

(assert (=> b!313978 (= res!169912 (and (= (select (arr!7588 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7940 a!3293))))))

(declare-fun b!313979 () Bool)

(declare-fun res!169920 () Bool)

(assert (=> b!313979 (=> (not res!169920) (not e!195626))))

(declare-fun arrayContainsKey!0 (array!16025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313979 (= res!169920 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313980 () Bool)

(assert (=> b!313980 (= e!195627 (bvslt (bvsub #b01111111111111111111111111111110 x!1427) #b00000000000000000000000000000000))))

(assert (= (and start!31296 res!169918) b!313972))

(assert (= (and b!313972 res!169917) b!313973))

(assert (= (and b!313973 res!169914) b!313979))

(assert (= (and b!313979 res!169920) b!313975))

(assert (= (and b!313975 res!169916) b!313976))

(assert (= (and b!313976 res!169919) b!313974))

(assert (= (and b!313974 res!169915) b!313978))

(assert (= (and b!313978 res!169912) b!313977))

(assert (= (and b!313977 res!169913) b!313980))

(declare-fun m!323857 () Bool)

(assert (=> b!313973 m!323857))

(declare-fun m!323859 () Bool)

(assert (=> b!313978 m!323859))

(declare-fun m!323861 () Bool)

(assert (=> b!313974 m!323861))

(assert (=> b!313974 m!323861))

(declare-fun m!323863 () Bool)

(assert (=> b!313974 m!323863))

(declare-fun m!323865 () Bool)

(assert (=> b!313977 m!323865))

(declare-fun m!323867 () Bool)

(assert (=> start!31296 m!323867))

(declare-fun m!323869 () Bool)

(assert (=> start!31296 m!323869))

(declare-fun m!323871 () Bool)

(assert (=> b!313976 m!323871))

(declare-fun m!323873 () Bool)

(assert (=> b!313975 m!323873))

(declare-fun m!323875 () Bool)

(assert (=> b!313979 m!323875))

(check-sat (not b!313977) (not b!313975) (not b!313979) (not b!313974) (not b!313973) (not start!31296) (not b!313976))
(check-sat)
(get-model)

(declare-fun d!68737 () Bool)

(assert (=> d!68737 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31296 d!68737))

(declare-fun d!68741 () Bool)

(assert (=> d!68741 (= (array_inv!5538 a!3293) (bvsge (size!7940 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31296 d!68741))

(declare-fun d!68745 () Bool)

(assert (=> d!68745 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313973 d!68745))

(declare-fun d!68747 () Bool)

(declare-fun res!169979 () Bool)

(declare-fun e!195650 () Bool)

(assert (=> d!68747 (=> res!169979 e!195650)))

(assert (=> d!68747 (= res!169979 (= (select (arr!7588 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68747 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195650)))

(declare-fun b!314039 () Bool)

(declare-fun e!195651 () Bool)

(assert (=> b!314039 (= e!195650 e!195651)))

(declare-fun res!169980 () Bool)

(assert (=> b!314039 (=> (not res!169980) (not e!195651))))

(assert (=> b!314039 (= res!169980 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7940 a!3293)))))

(declare-fun b!314040 () Bool)

(assert (=> b!314040 (= e!195651 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68747 (not res!169979)) b!314039))

(assert (= (and b!314039 res!169980) b!314040))

(declare-fun m!323917 () Bool)

(assert (=> d!68747 m!323917))

(declare-fun m!323919 () Bool)

(assert (=> b!314040 m!323919))

(assert (=> b!313979 d!68747))

(declare-fun b!314104 () Bool)

(declare-fun e!195693 () SeekEntryResult!2693)

(assert (=> b!314104 (= e!195693 (Intermediate!2693 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314105 () Bool)

(declare-fun e!195696 () SeekEntryResult!2693)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314105 (= e!195696 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314106 () Bool)

(declare-fun e!195692 () Bool)

(declare-fun lt!153831 () SeekEntryResult!2693)

(assert (=> b!314106 (= e!195692 (bvsge (x!31282 lt!153831) #b01111111111111111111111111111110))))

(declare-fun b!314107 () Bool)

(assert (=> b!314107 (and (bvsge (index!12950 lt!153831) #b00000000000000000000000000000000) (bvslt (index!12950 lt!153831) (size!7940 a!3293)))))

(declare-fun res!170010 () Bool)

(assert (=> b!314107 (= res!170010 (= (select (arr!7588 a!3293) (index!12950 lt!153831)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195694 () Bool)

(assert (=> b!314107 (=> res!170010 e!195694)))

(declare-fun b!314108 () Bool)

(assert (=> b!314108 (= e!195693 e!195696)))

(declare-fun c!49661 () Bool)

(declare-fun lt!153830 () (_ BitVec 64))

(assert (=> b!314108 (= c!49661 (or (= lt!153830 k0!2441) (= (bvadd lt!153830 lt!153830) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314109 () Bool)

(assert (=> b!314109 (and (bvsge (index!12950 lt!153831) #b00000000000000000000000000000000) (bvslt (index!12950 lt!153831) (size!7940 a!3293)))))

(assert (=> b!314109 (= e!195694 (= (select (arr!7588 a!3293) (index!12950 lt!153831)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314110 () Bool)

(assert (=> b!314110 (and (bvsge (index!12950 lt!153831) #b00000000000000000000000000000000) (bvslt (index!12950 lt!153831) (size!7940 a!3293)))))

(declare-fun res!170009 () Bool)

(assert (=> b!314110 (= res!170009 (= (select (arr!7588 a!3293) (index!12950 lt!153831)) k0!2441))))

(assert (=> b!314110 (=> res!170009 e!195694)))

(declare-fun e!195695 () Bool)

(assert (=> b!314110 (= e!195695 e!195694)))

(declare-fun b!314111 () Bool)

(assert (=> b!314111 (= e!195692 e!195695)))

(declare-fun res!170011 () Bool)

(get-info :version)

(assert (=> b!314111 (= res!170011 (and ((_ is Intermediate!2693) lt!153831) (not (undefined!3505 lt!153831)) (bvslt (x!31282 lt!153831) #b01111111111111111111111111111110) (bvsge (x!31282 lt!153831) #b00000000000000000000000000000000) (bvsge (x!31282 lt!153831) #b00000000000000000000000000000000)))))

(assert (=> b!314111 (=> (not res!170011) (not e!195695))))

(declare-fun b!314112 () Bool)

(assert (=> b!314112 (= e!195696 (Intermediate!2693 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68751 () Bool)

(assert (=> d!68751 e!195692))

(declare-fun c!49659 () Bool)

(assert (=> d!68751 (= c!49659 (and ((_ is Intermediate!2693) lt!153831) (undefined!3505 lt!153831)))))

(assert (=> d!68751 (= lt!153831 e!195693)))

(declare-fun c!49660 () Bool)

(assert (=> d!68751 (= c!49660 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68751 (= lt!153830 (select (arr!7588 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68751 (validMask!0 mask!3709)))

(assert (=> d!68751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153831)))

(assert (= (and d!68751 c!49660) b!314104))

(assert (= (and d!68751 (not c!49660)) b!314108))

(assert (= (and b!314108 c!49661) b!314112))

(assert (= (and b!314108 (not c!49661)) b!314105))

(assert (= (and d!68751 c!49659) b!314106))

(assert (= (and d!68751 (not c!49659)) b!314111))

(assert (= (and b!314111 res!170011) b!314110))

(assert (= (and b!314110 (not res!170009)) b!314107))

(assert (= (and b!314107 (not res!170010)) b!314109))

(assert (=> d!68751 m!323861))

(declare-fun m!323943 () Bool)

(assert (=> d!68751 m!323943))

(assert (=> d!68751 m!323867))

(declare-fun m!323945 () Bool)

(assert (=> b!314107 m!323945))

(assert (=> b!314105 m!323861))

(declare-fun m!323947 () Bool)

(assert (=> b!314105 m!323947))

(assert (=> b!314105 m!323947))

(declare-fun m!323949 () Bool)

(assert (=> b!314105 m!323949))

(assert (=> b!314109 m!323945))

(assert (=> b!314110 m!323945))

(assert (=> b!313974 d!68751))

(declare-fun d!68761 () Bool)

(declare-fun lt!153843 () (_ BitVec 32))

(declare-fun lt!153842 () (_ BitVec 32))

(assert (=> d!68761 (= lt!153843 (bvmul (bvxor lt!153842 (bvlshr lt!153842 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68761 (= lt!153842 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68761 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170012 (let ((h!5271 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31288 (bvmul (bvxor h!5271 (bvlshr h!5271 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31288 (bvlshr x!31288 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170012 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170012 #b00000000000000000000000000000000))))))

(assert (=> d!68761 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153843 (bvlshr lt!153843 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313974 d!68761))

(declare-fun b!314161 () Bool)

(declare-fun e!195725 () SeekEntryResult!2693)

(declare-fun lt!153864 () SeekEntryResult!2693)

(assert (=> b!314161 (= e!195725 (MissingZero!2693 (index!12950 lt!153864)))))

(declare-fun b!314162 () Bool)

(declare-fun e!195723 () SeekEntryResult!2693)

(assert (=> b!314162 (= e!195723 (Found!2693 (index!12950 lt!153864)))))

(declare-fun d!68765 () Bool)

(declare-fun lt!153865 () SeekEntryResult!2693)

(assert (=> d!68765 (and (or ((_ is Undefined!2693) lt!153865) (not ((_ is Found!2693) lt!153865)) (and (bvsge (index!12949 lt!153865) #b00000000000000000000000000000000) (bvslt (index!12949 lt!153865) (size!7940 a!3293)))) (or ((_ is Undefined!2693) lt!153865) ((_ is Found!2693) lt!153865) (not ((_ is MissingZero!2693) lt!153865)) (and (bvsge (index!12948 lt!153865) #b00000000000000000000000000000000) (bvslt (index!12948 lt!153865) (size!7940 a!3293)))) (or ((_ is Undefined!2693) lt!153865) ((_ is Found!2693) lt!153865) ((_ is MissingZero!2693) lt!153865) (not ((_ is MissingVacant!2693) lt!153865)) (and (bvsge (index!12951 lt!153865) #b00000000000000000000000000000000) (bvslt (index!12951 lt!153865) (size!7940 a!3293)))) (or ((_ is Undefined!2693) lt!153865) (ite ((_ is Found!2693) lt!153865) (= (select (arr!7588 a!3293) (index!12949 lt!153865)) k0!2441) (ite ((_ is MissingZero!2693) lt!153865) (= (select (arr!7588 a!3293) (index!12948 lt!153865)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2693) lt!153865) (= (select (arr!7588 a!3293) (index!12951 lt!153865)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195724 () SeekEntryResult!2693)

(assert (=> d!68765 (= lt!153865 e!195724)))

(declare-fun c!49680 () Bool)

(assert (=> d!68765 (= c!49680 (and ((_ is Intermediate!2693) lt!153864) (undefined!3505 lt!153864)))))

(assert (=> d!68765 (= lt!153864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68765 (validMask!0 mask!3709)))

(assert (=> d!68765 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153865)))

(declare-fun b!314163 () Bool)

(assert (=> b!314163 (= e!195724 e!195723)))

(declare-fun lt!153866 () (_ BitVec 64))

(assert (=> b!314163 (= lt!153866 (select (arr!7588 a!3293) (index!12950 lt!153864)))))

(declare-fun c!49681 () Bool)

(assert (=> b!314163 (= c!49681 (= lt!153866 k0!2441))))

(declare-fun b!314164 () Bool)

(assert (=> b!314164 (= e!195724 Undefined!2693)))

(declare-fun b!314165 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16025 (_ BitVec 32)) SeekEntryResult!2693)

(assert (=> b!314165 (= e!195725 (seekKeyOrZeroReturnVacant!0 (x!31282 lt!153864) (index!12950 lt!153864) (index!12950 lt!153864) k0!2441 a!3293 mask!3709))))

(declare-fun b!314166 () Bool)

(declare-fun c!49682 () Bool)

(assert (=> b!314166 (= c!49682 (= lt!153866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314166 (= e!195723 e!195725)))

(assert (= (and d!68765 c!49680) b!314164))

(assert (= (and d!68765 (not c!49680)) b!314163))

(assert (= (and b!314163 c!49681) b!314162))

(assert (= (and b!314163 (not c!49681)) b!314166))

(assert (= (and b!314166 c!49682) b!314161))

(assert (= (and b!314166 (not c!49682)) b!314165))

(assert (=> d!68765 m!323861))

(assert (=> d!68765 m!323863))

(declare-fun m!323967 () Bool)

(assert (=> d!68765 m!323967))

(assert (=> d!68765 m!323867))

(assert (=> d!68765 m!323861))

(declare-fun m!323969 () Bool)

(assert (=> d!68765 m!323969))

(declare-fun m!323971 () Bool)

(assert (=> d!68765 m!323971))

(declare-fun m!323973 () Bool)

(assert (=> b!314163 m!323973))

(declare-fun m!323975 () Bool)

(assert (=> b!314165 m!323975))

(assert (=> b!313975 d!68765))

(declare-fun b!314193 () Bool)

(declare-fun e!195741 () Bool)

(declare-fun e!195742 () Bool)

(assert (=> b!314193 (= e!195741 e!195742)))

(declare-fun lt!153883 () (_ BitVec 64))

(assert (=> b!314193 (= lt!153883 (select (arr!7588 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9649 0))(
  ( (Unit!9650) )
))
(declare-fun lt!153884 () Unit!9649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16025 (_ BitVec 64) (_ BitVec 32)) Unit!9649)

(assert (=> b!314193 (= lt!153884 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153883 #b00000000000000000000000000000000))))

(assert (=> b!314193 (arrayContainsKey!0 a!3293 lt!153883 #b00000000000000000000000000000000)))

(declare-fun lt!153882 () Unit!9649)

(assert (=> b!314193 (= lt!153882 lt!153884)))

(declare-fun res!170031 () Bool)

(assert (=> b!314193 (= res!170031 (= (seekEntryOrOpen!0 (select (arr!7588 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2693 #b00000000000000000000000000000000)))))

(assert (=> b!314193 (=> (not res!170031) (not e!195742))))

(declare-fun bm!25952 () Bool)

(declare-fun call!25955 () Bool)

(assert (=> bm!25952 (= call!25955 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68777 () Bool)

(declare-fun res!170030 () Bool)

(declare-fun e!195743 () Bool)

(assert (=> d!68777 (=> res!170030 e!195743)))

(assert (=> d!68777 (= res!170030 (bvsge #b00000000000000000000000000000000 (size!7940 a!3293)))))

(assert (=> d!68777 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195743)))

(declare-fun b!314194 () Bool)

(assert (=> b!314194 (= e!195742 call!25955)))

(declare-fun b!314195 () Bool)

(assert (=> b!314195 (= e!195743 e!195741)))

(declare-fun c!49694 () Bool)

(assert (=> b!314195 (= c!49694 (validKeyInArray!0 (select (arr!7588 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!314196 () Bool)

(assert (=> b!314196 (= e!195741 call!25955)))

(assert (= (and d!68777 (not res!170030)) b!314195))

(assert (= (and b!314195 c!49694) b!314193))

(assert (= (and b!314195 (not c!49694)) b!314196))

(assert (= (and b!314193 res!170031) b!314194))

(assert (= (or b!314194 b!314196) bm!25952))

(assert (=> b!314193 m!323917))

(declare-fun m!323987 () Bool)

(assert (=> b!314193 m!323987))

(declare-fun m!323989 () Bool)

(assert (=> b!314193 m!323989))

(assert (=> b!314193 m!323917))

(declare-fun m!323991 () Bool)

(assert (=> b!314193 m!323991))

(declare-fun m!323993 () Bool)

(assert (=> bm!25952 m!323993))

(assert (=> b!314195 m!323917))

(assert (=> b!314195 m!323917))

(declare-fun m!323995 () Bool)

(assert (=> b!314195 m!323995))

(assert (=> b!313976 d!68777))

(declare-fun b!314197 () Bool)

(declare-fun e!195745 () SeekEntryResult!2693)

(assert (=> b!314197 (= e!195745 (Intermediate!2693 true index!1781 x!1427))))

(declare-fun e!195748 () SeekEntryResult!2693)

(declare-fun b!314198 () Bool)

(assert (=> b!314198 (= e!195748 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314199 () Bool)

(declare-fun e!195744 () Bool)

(declare-fun lt!153886 () SeekEntryResult!2693)

(assert (=> b!314199 (= e!195744 (bvsge (x!31282 lt!153886) #b01111111111111111111111111111110))))

(declare-fun b!314200 () Bool)

(assert (=> b!314200 (and (bvsge (index!12950 lt!153886) #b00000000000000000000000000000000) (bvslt (index!12950 lt!153886) (size!7940 a!3293)))))

(declare-fun res!170033 () Bool)

(assert (=> b!314200 (= res!170033 (= (select (arr!7588 a!3293) (index!12950 lt!153886)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195746 () Bool)

(assert (=> b!314200 (=> res!170033 e!195746)))

(declare-fun b!314201 () Bool)

(assert (=> b!314201 (= e!195745 e!195748)))

(declare-fun c!49697 () Bool)

(declare-fun lt!153885 () (_ BitVec 64))

(assert (=> b!314201 (= c!49697 (or (= lt!153885 k0!2441) (= (bvadd lt!153885 lt!153885) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314202 () Bool)

(assert (=> b!314202 (and (bvsge (index!12950 lt!153886) #b00000000000000000000000000000000) (bvslt (index!12950 lt!153886) (size!7940 a!3293)))))

(assert (=> b!314202 (= e!195746 (= (select (arr!7588 a!3293) (index!12950 lt!153886)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314203 () Bool)

(assert (=> b!314203 (and (bvsge (index!12950 lt!153886) #b00000000000000000000000000000000) (bvslt (index!12950 lt!153886) (size!7940 a!3293)))))

(declare-fun res!170032 () Bool)

(assert (=> b!314203 (= res!170032 (= (select (arr!7588 a!3293) (index!12950 lt!153886)) k0!2441))))

(assert (=> b!314203 (=> res!170032 e!195746)))

(declare-fun e!195747 () Bool)

(assert (=> b!314203 (= e!195747 e!195746)))

(declare-fun b!314204 () Bool)

(assert (=> b!314204 (= e!195744 e!195747)))

(declare-fun res!170034 () Bool)

(assert (=> b!314204 (= res!170034 (and ((_ is Intermediate!2693) lt!153886) (not (undefined!3505 lt!153886)) (bvslt (x!31282 lt!153886) #b01111111111111111111111111111110) (bvsge (x!31282 lt!153886) #b00000000000000000000000000000000) (bvsge (x!31282 lt!153886) x!1427)))))

(assert (=> b!314204 (=> (not res!170034) (not e!195747))))

(declare-fun b!314205 () Bool)

(assert (=> b!314205 (= e!195748 (Intermediate!2693 false index!1781 x!1427))))

(declare-fun d!68785 () Bool)

(assert (=> d!68785 e!195744))

(declare-fun c!49695 () Bool)

(assert (=> d!68785 (= c!49695 (and ((_ is Intermediate!2693) lt!153886) (undefined!3505 lt!153886)))))

(assert (=> d!68785 (= lt!153886 e!195745)))

(declare-fun c!49696 () Bool)

(assert (=> d!68785 (= c!49696 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68785 (= lt!153885 (select (arr!7588 a!3293) index!1781))))

(assert (=> d!68785 (validMask!0 mask!3709)))

(assert (=> d!68785 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153886)))

(assert (= (and d!68785 c!49696) b!314197))

(assert (= (and d!68785 (not c!49696)) b!314201))

(assert (= (and b!314201 c!49697) b!314205))

(assert (= (and b!314201 (not c!49697)) b!314198))

(assert (= (and d!68785 c!49695) b!314199))

(assert (= (and d!68785 (not c!49695)) b!314204))

(assert (= (and b!314204 res!170034) b!314203))

(assert (= (and b!314203 (not res!170032)) b!314200))

(assert (= (and b!314200 (not res!170033)) b!314202))

(declare-fun m!323997 () Bool)

(assert (=> d!68785 m!323997))

(assert (=> d!68785 m!323867))

(declare-fun m!323999 () Bool)

(assert (=> b!314200 m!323999))

(declare-fun m!324001 () Bool)

(assert (=> b!314198 m!324001))

(assert (=> b!314198 m!324001))

(declare-fun m!324003 () Bool)

(assert (=> b!314198 m!324003))

(assert (=> b!314202 m!323999))

(assert (=> b!314203 m!323999))

(assert (=> b!313977 d!68785))

(check-sat (not b!314165) (not d!68785) (not bm!25952) (not b!314105) (not b!314195) (not d!68765) (not d!68751) (not b!314198) (not b!314040) (not b!314193))
(check-sat)
