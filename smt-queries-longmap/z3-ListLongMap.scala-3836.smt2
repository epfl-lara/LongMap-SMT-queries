; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52768 () Bool)

(assert start!52768)

(declare-fun b!575301 () Bool)

(declare-fun res!363724 () Bool)

(declare-fun e!331023 () Bool)

(assert (=> b!575301 (=> (not res!363724) (not e!331023))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575301 (= res!363724 (validKeyInArray!0 k0!1914))))

(declare-fun b!575302 () Bool)

(declare-fun e!331018 () Bool)

(assert (=> b!575302 (= e!331023 e!331018)))

(declare-fun res!363722 () Bool)

(assert (=> b!575302 (=> (not res!363722) (not e!331018))))

(declare-datatypes ((SeekEntryResult!5688 0))(
  ( (MissingZero!5688 (index!24979 (_ BitVec 32))) (Found!5688 (index!24980 (_ BitVec 32))) (Intermediate!5688 (undefined!6500 Bool) (index!24981 (_ BitVec 32)) (x!53873 (_ BitVec 32))) (Undefined!5688) (MissingVacant!5688 (index!24982 (_ BitVec 32))) )
))
(declare-fun lt!262872 () SeekEntryResult!5688)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575302 (= res!363722 (or (= lt!262872 (MissingZero!5688 i!1132)) (= lt!262872 (MissingVacant!5688 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35913 0))(
  ( (array!35914 (arr!17239 (Array (_ BitVec 32) (_ BitVec 64))) (size!17603 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35913)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35913 (_ BitVec 32)) SeekEntryResult!5688)

(assert (=> b!575302 (= lt!262872 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575303 () Bool)

(declare-fun res!363726 () Bool)

(assert (=> b!575303 (=> (not res!363726) (not e!331018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35913 (_ BitVec 32)) Bool)

(assert (=> b!575303 (= res!363726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575304 () Bool)

(declare-fun res!363728 () Bool)

(assert (=> b!575304 (=> (not res!363728) (not e!331018))))

(declare-datatypes ((List!11319 0))(
  ( (Nil!11316) (Cons!11315 (h!12354 (_ BitVec 64)) (t!17547 List!11319)) )
))
(declare-fun arrayNoDuplicates!0 (array!35913 (_ BitVec 32) List!11319) Bool)

(assert (=> b!575304 (= res!363728 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11316))))

(declare-fun b!575305 () Bool)

(declare-fun e!331021 () Bool)

(assert (=> b!575305 (= e!331021 true)))

(declare-fun lt!262873 () SeekEntryResult!5688)

(declare-fun lt!262864 () SeekEntryResult!5688)

(assert (=> b!575305 (= lt!262873 lt!262864)))

(declare-fun lt!262866 () SeekEntryResult!5688)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((Unit!18078 0))(
  ( (Unit!18079) )
))
(declare-fun lt!262869 () Unit!18078)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18078)

(assert (=> b!575305 (= lt!262869 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53873 lt!262866) (index!24981 lt!262866) (index!24981 lt!262866) mask!3119))))

(declare-fun b!575306 () Bool)

(declare-fun res!363727 () Bool)

(assert (=> b!575306 (=> (not res!363727) (not e!331023))))

(declare-fun arrayContainsKey!0 (array!35913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575306 (= res!363727 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575307 () Bool)

(declare-fun e!331022 () Bool)

(declare-fun e!331017 () Bool)

(assert (=> b!575307 (= e!331022 e!331017)))

(declare-fun res!363719 () Bool)

(assert (=> b!575307 (=> res!363719 e!331017)))

(declare-fun lt!262863 () (_ BitVec 64))

(assert (=> b!575307 (= res!363719 (or (= lt!262863 (select (arr!17239 a!3118) j!142)) (= lt!262863 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575307 (= lt!262863 (select (arr!17239 a!3118) (index!24981 lt!262866)))))

(declare-fun res!363725 () Bool)

(assert (=> start!52768 (=> (not res!363725) (not e!331023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52768 (= res!363725 (validMask!0 mask!3119))))

(assert (=> start!52768 e!331023))

(assert (=> start!52768 true))

(declare-fun array_inv!13035 (array!35913) Bool)

(assert (=> start!52768 (array_inv!13035 a!3118)))

(declare-fun b!575308 () Bool)

(declare-fun res!363723 () Bool)

(assert (=> b!575308 (=> (not res!363723) (not e!331023))))

(assert (=> b!575308 (= res!363723 (validKeyInArray!0 (select (arr!17239 a!3118) j!142)))))

(declare-fun b!575309 () Bool)

(declare-fun res!363721 () Bool)

(assert (=> b!575309 (=> (not res!363721) (not e!331023))))

(assert (=> b!575309 (= res!363721 (and (= (size!17603 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17603 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17603 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575310 () Bool)

(declare-fun e!331019 () Bool)

(assert (=> b!575310 (= e!331019 (not e!331022))))

(declare-fun res!363718 () Bool)

(assert (=> b!575310 (=> res!363718 e!331022)))

(get-info :version)

(assert (=> b!575310 (= res!363718 (or (undefined!6500 lt!262866) (not ((_ is Intermediate!5688) lt!262866))))))

(declare-fun lt!262876 () SeekEntryResult!5688)

(declare-fun lt!262870 () SeekEntryResult!5688)

(assert (=> b!575310 (= lt!262876 lt!262870)))

(assert (=> b!575310 (= lt!262870 (Found!5688 j!142))))

(assert (=> b!575310 (= lt!262876 (seekEntryOrOpen!0 (select (arr!17239 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575310 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262865 () Unit!18078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18078)

(assert (=> b!575310 (= lt!262865 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575311 () Bool)

(assert (=> b!575311 (= e!331018 e!331019)))

(declare-fun res!363720 () Bool)

(assert (=> b!575311 (=> (not res!363720) (not e!331019))))

(declare-fun lt!262868 () (_ BitVec 32))

(declare-fun lt!262875 () array!35913)

(declare-fun lt!262874 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35913 (_ BitVec 32)) SeekEntryResult!5688)

(assert (=> b!575311 (= res!363720 (= lt!262866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262868 lt!262874 lt!262875 mask!3119)))))

(declare-fun lt!262867 () (_ BitVec 32))

(assert (=> b!575311 (= lt!262866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262867 (select (arr!17239 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575311 (= lt!262868 (toIndex!0 lt!262874 mask!3119))))

(assert (=> b!575311 (= lt!262874 (select (store (arr!17239 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575311 (= lt!262867 (toIndex!0 (select (arr!17239 a!3118) j!142) mask!3119))))

(assert (=> b!575311 (= lt!262875 (array!35914 (store (arr!17239 a!3118) i!1132 k0!1914) (size!17603 a!3118)))))

(declare-fun b!575312 () Bool)

(assert (=> b!575312 (= e!331017 e!331021)))

(declare-fun res!363717 () Bool)

(assert (=> b!575312 (=> res!363717 e!331021)))

(assert (=> b!575312 (= res!363717 (or (bvslt (index!24981 lt!262866) #b00000000000000000000000000000000) (bvsge (index!24981 lt!262866) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53873 lt!262866) #b01111111111111111111111111111110) (bvslt (x!53873 lt!262866) #b00000000000000000000000000000000) (not (= lt!262863 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17239 a!3118) i!1132 k0!1914) (index!24981 lt!262866)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262873 lt!262870))))))

(declare-fun lt!262871 () SeekEntryResult!5688)

(assert (=> b!575312 (= lt!262871 lt!262864)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35913 (_ BitVec 32)) SeekEntryResult!5688)

(assert (=> b!575312 (= lt!262864 (seekKeyOrZeroReturnVacant!0 (x!53873 lt!262866) (index!24981 lt!262866) (index!24981 lt!262866) lt!262874 lt!262875 mask!3119))))

(assert (=> b!575312 (= lt!262871 (seekEntryOrOpen!0 lt!262874 lt!262875 mask!3119))))

(assert (=> b!575312 (= lt!262876 lt!262873)))

(assert (=> b!575312 (= lt!262873 (seekKeyOrZeroReturnVacant!0 (x!53873 lt!262866) (index!24981 lt!262866) (index!24981 lt!262866) (select (arr!17239 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and start!52768 res!363725) b!575309))

(assert (= (and b!575309 res!363721) b!575308))

(assert (= (and b!575308 res!363723) b!575301))

(assert (= (and b!575301 res!363724) b!575306))

(assert (= (and b!575306 res!363727) b!575302))

(assert (= (and b!575302 res!363722) b!575303))

(assert (= (and b!575303 res!363726) b!575304))

(assert (= (and b!575304 res!363728) b!575311))

(assert (= (and b!575311 res!363720) b!575310))

(assert (= (and b!575310 (not res!363718)) b!575307))

(assert (= (and b!575307 (not res!363719)) b!575312))

(assert (= (and b!575312 (not res!363717)) b!575305))

(declare-fun m!554109 () Bool)

(assert (=> b!575308 m!554109))

(assert (=> b!575308 m!554109))

(declare-fun m!554111 () Bool)

(assert (=> b!575308 m!554111))

(assert (=> b!575307 m!554109))

(declare-fun m!554113 () Bool)

(assert (=> b!575307 m!554113))

(declare-fun m!554115 () Bool)

(assert (=> b!575305 m!554115))

(declare-fun m!554117 () Bool)

(assert (=> b!575304 m!554117))

(declare-fun m!554119 () Bool)

(assert (=> b!575303 m!554119))

(declare-fun m!554121 () Bool)

(assert (=> b!575302 m!554121))

(declare-fun m!554123 () Bool)

(assert (=> b!575312 m!554123))

(assert (=> b!575312 m!554109))

(declare-fun m!554125 () Bool)

(assert (=> b!575312 m!554125))

(declare-fun m!554127 () Bool)

(assert (=> b!575312 m!554127))

(declare-fun m!554129 () Bool)

(assert (=> b!575312 m!554129))

(assert (=> b!575312 m!554109))

(declare-fun m!554131 () Bool)

(assert (=> b!575312 m!554131))

(declare-fun m!554133 () Bool)

(assert (=> b!575301 m!554133))

(declare-fun m!554135 () Bool)

(assert (=> start!52768 m!554135))

(declare-fun m!554137 () Bool)

(assert (=> start!52768 m!554137))

(declare-fun m!554139 () Bool)

(assert (=> b!575306 m!554139))

(declare-fun m!554141 () Bool)

(assert (=> b!575311 m!554141))

(assert (=> b!575311 m!554109))

(declare-fun m!554143 () Bool)

(assert (=> b!575311 m!554143))

(assert (=> b!575311 m!554109))

(declare-fun m!554145 () Bool)

(assert (=> b!575311 m!554145))

(declare-fun m!554147 () Bool)

(assert (=> b!575311 m!554147))

(assert (=> b!575311 m!554129))

(assert (=> b!575311 m!554109))

(declare-fun m!554149 () Bool)

(assert (=> b!575311 m!554149))

(assert (=> b!575310 m!554109))

(assert (=> b!575310 m!554109))

(declare-fun m!554151 () Bool)

(assert (=> b!575310 m!554151))

(declare-fun m!554153 () Bool)

(assert (=> b!575310 m!554153))

(declare-fun m!554155 () Bool)

(assert (=> b!575310 m!554155))

(check-sat (not b!575302) (not b!575301) (not b!575308) (not b!575310) (not b!575304) (not start!52768) (not b!575306) (not b!575303) (not b!575311) (not b!575305) (not b!575312))
(check-sat)
