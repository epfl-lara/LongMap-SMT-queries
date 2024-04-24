; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52824 () Bool)

(assert start!52824)

(declare-fun res!363999 () Bool)

(declare-fun e!331256 () Bool)

(assert (=> start!52824 (=> (not res!363999) (not e!331256))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52824 (= res!363999 (validMask!0 mask!3119))))

(assert (=> start!52824 e!331256))

(assert (=> start!52824 true))

(declare-datatypes ((array!35916 0))(
  ( (array!35917 (arr!17239 (Array (_ BitVec 32) (_ BitVec 64))) (size!17603 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35916)

(declare-fun array_inv!13098 (array!35916) Bool)

(assert (=> start!52824 (array_inv!13098 a!3118)))

(declare-fun b!575681 () Bool)

(declare-fun e!331252 () Bool)

(assert (=> b!575681 (= e!331252 true)))

(declare-datatypes ((SeekEntryResult!5644 0))(
  ( (MissingZero!5644 (index!24803 (_ BitVec 32))) (Found!5644 (index!24804 (_ BitVec 32))) (Intermediate!5644 (undefined!6456 Bool) (index!24805 (_ BitVec 32)) (x!53848 (_ BitVec 32))) (Undefined!5644) (MissingVacant!5644 (index!24806 (_ BitVec 32))) )
))
(declare-fun lt!263187 () SeekEntryResult!5644)

(declare-fun lt!263189 () SeekEntryResult!5644)

(assert (=> b!575681 (= lt!263187 lt!263189)))

(declare-datatypes ((Unit!18061 0))(
  ( (Unit!18062) )
))
(declare-fun lt!263190 () Unit!18061)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!263185 () SeekEntryResult!5644)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35916 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18061)

(assert (=> b!575681 (= lt!263190 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53848 lt!263185) (index!24805 lt!263185) (index!24805 lt!263185) mask!3119))))

(declare-fun b!575682 () Bool)

(declare-fun res!363996 () Bool)

(assert (=> b!575682 (=> (not res!363996) (not e!331256))))

(assert (=> b!575682 (= res!363996 (and (= (size!17603 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17603 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17603 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575683 () Bool)

(declare-fun e!331255 () Bool)

(declare-fun e!331257 () Bool)

(assert (=> b!575683 (= e!331255 e!331257)))

(declare-fun res!363993 () Bool)

(assert (=> b!575683 (=> res!363993 e!331257)))

(declare-fun lt!263184 () (_ BitVec 64))

(assert (=> b!575683 (= res!363993 (or (= lt!263184 (select (arr!17239 a!3118) j!142)) (= lt!263184 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575683 (= lt!263184 (select (arr!17239 a!3118) (index!24805 lt!263185)))))

(declare-fun b!575684 () Bool)

(declare-fun res!363998 () Bool)

(declare-fun e!331253 () Bool)

(assert (=> b!575684 (=> (not res!363998) (not e!331253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35916 (_ BitVec 32)) Bool)

(assert (=> b!575684 (= res!363998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575685 () Bool)

(declare-fun res!364003 () Bool)

(assert (=> b!575685 (=> (not res!364003) (not e!331256))))

(declare-fun arrayContainsKey!0 (array!35916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575685 (= res!364003 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575686 () Bool)

(assert (=> b!575686 (= e!331256 e!331253)))

(declare-fun res!363997 () Bool)

(assert (=> b!575686 (=> (not res!363997) (not e!331253))))

(declare-fun lt!263197 () SeekEntryResult!5644)

(assert (=> b!575686 (= res!363997 (or (= lt!263197 (MissingZero!5644 i!1132)) (= lt!263197 (MissingVacant!5644 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35916 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!575686 (= lt!263197 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575687 () Bool)

(assert (=> b!575687 (= e!331257 e!331252)))

(declare-fun res!364002 () Bool)

(assert (=> b!575687 (=> res!364002 e!331252)))

(declare-fun lt!263194 () SeekEntryResult!5644)

(assert (=> b!575687 (= res!364002 (or (bvslt (index!24805 lt!263185) #b00000000000000000000000000000000) (bvsge (index!24805 lt!263185) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53848 lt!263185) #b01111111111111111111111111111110) (bvslt (x!53848 lt!263185) #b00000000000000000000000000000000) (not (= lt!263184 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17239 a!3118) i!1132 k0!1914) (index!24805 lt!263185)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263187 lt!263194))))))

(declare-fun lt!263192 () SeekEntryResult!5644)

(assert (=> b!575687 (= lt!263192 lt!263189)))

(declare-fun lt!263188 () array!35916)

(declare-fun lt!263191 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35916 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!575687 (= lt!263189 (seekKeyOrZeroReturnVacant!0 (x!53848 lt!263185) (index!24805 lt!263185) (index!24805 lt!263185) lt!263191 lt!263188 mask!3119))))

(assert (=> b!575687 (= lt!263192 (seekEntryOrOpen!0 lt!263191 lt!263188 mask!3119))))

(declare-fun lt!263195 () SeekEntryResult!5644)

(assert (=> b!575687 (= lt!263195 lt!263187)))

(assert (=> b!575687 (= lt!263187 (seekKeyOrZeroReturnVacant!0 (x!53848 lt!263185) (index!24805 lt!263185) (index!24805 lt!263185) (select (arr!17239 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575688 () Bool)

(declare-fun res!363995 () Bool)

(assert (=> b!575688 (=> (not res!363995) (not e!331256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575688 (= res!363995 (validKeyInArray!0 k0!1914))))

(declare-fun b!575689 () Bool)

(declare-fun e!331254 () Bool)

(assert (=> b!575689 (= e!331253 e!331254)))

(declare-fun res!364001 () Bool)

(assert (=> b!575689 (=> (not res!364001) (not e!331254))))

(declare-fun lt!263196 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35916 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!575689 (= res!364001 (= lt!263185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263196 lt!263191 lt!263188 mask!3119)))))

(declare-fun lt!263193 () (_ BitVec 32))

(assert (=> b!575689 (= lt!263185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263193 (select (arr!17239 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575689 (= lt!263196 (toIndex!0 lt!263191 mask!3119))))

(assert (=> b!575689 (= lt!263191 (select (store (arr!17239 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575689 (= lt!263193 (toIndex!0 (select (arr!17239 a!3118) j!142) mask!3119))))

(assert (=> b!575689 (= lt!263188 (array!35917 (store (arr!17239 a!3118) i!1132 k0!1914) (size!17603 a!3118)))))

(declare-fun b!575690 () Bool)

(declare-fun res!363992 () Bool)

(assert (=> b!575690 (=> (not res!363992) (not e!331253))))

(declare-datatypes ((List!11226 0))(
  ( (Nil!11223) (Cons!11222 (h!12264 (_ BitVec 64)) (t!17446 List!11226)) )
))
(declare-fun arrayNoDuplicates!0 (array!35916 (_ BitVec 32) List!11226) Bool)

(assert (=> b!575690 (= res!363992 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11223))))

(declare-fun b!575691 () Bool)

(declare-fun res!363994 () Bool)

(assert (=> b!575691 (=> (not res!363994) (not e!331256))))

(assert (=> b!575691 (= res!363994 (validKeyInArray!0 (select (arr!17239 a!3118) j!142)))))

(declare-fun b!575692 () Bool)

(assert (=> b!575692 (= e!331254 (not e!331255))))

(declare-fun res!364000 () Bool)

(assert (=> b!575692 (=> res!364000 e!331255)))

(get-info :version)

(assert (=> b!575692 (= res!364000 (or (undefined!6456 lt!263185) (not ((_ is Intermediate!5644) lt!263185))))))

(assert (=> b!575692 (= lt!263195 lt!263194)))

(assert (=> b!575692 (= lt!263194 (Found!5644 j!142))))

(assert (=> b!575692 (= lt!263195 (seekEntryOrOpen!0 (select (arr!17239 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575692 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263186 () Unit!18061)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18061)

(assert (=> b!575692 (= lt!263186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52824 res!363999) b!575682))

(assert (= (and b!575682 res!363996) b!575691))

(assert (= (and b!575691 res!363994) b!575688))

(assert (= (and b!575688 res!363995) b!575685))

(assert (= (and b!575685 res!364003) b!575686))

(assert (= (and b!575686 res!363997) b!575684))

(assert (= (and b!575684 res!363998) b!575690))

(assert (= (and b!575690 res!363992) b!575689))

(assert (= (and b!575689 res!364001) b!575692))

(assert (= (and b!575692 (not res!364000)) b!575683))

(assert (= (and b!575683 (not res!363993)) b!575687))

(assert (= (and b!575687 (not res!364002)) b!575681))

(declare-fun m!554687 () Bool)

(assert (=> b!575692 m!554687))

(assert (=> b!575692 m!554687))

(declare-fun m!554689 () Bool)

(assert (=> b!575692 m!554689))

(declare-fun m!554691 () Bool)

(assert (=> b!575692 m!554691))

(declare-fun m!554693 () Bool)

(assert (=> b!575692 m!554693))

(declare-fun m!554695 () Bool)

(assert (=> b!575686 m!554695))

(assert (=> b!575691 m!554687))

(assert (=> b!575691 m!554687))

(declare-fun m!554697 () Bool)

(assert (=> b!575691 m!554697))

(declare-fun m!554699 () Bool)

(assert (=> b!575690 m!554699))

(declare-fun m!554701 () Bool)

(assert (=> b!575681 m!554701))

(assert (=> b!575683 m!554687))

(declare-fun m!554703 () Bool)

(assert (=> b!575683 m!554703))

(declare-fun m!554705 () Bool)

(assert (=> b!575685 m!554705))

(assert (=> b!575689 m!554687))

(declare-fun m!554707 () Bool)

(assert (=> b!575689 m!554707))

(declare-fun m!554709 () Bool)

(assert (=> b!575689 m!554709))

(assert (=> b!575689 m!554687))

(declare-fun m!554711 () Bool)

(assert (=> b!575689 m!554711))

(assert (=> b!575689 m!554687))

(declare-fun m!554713 () Bool)

(assert (=> b!575689 m!554713))

(declare-fun m!554715 () Bool)

(assert (=> b!575689 m!554715))

(declare-fun m!554717 () Bool)

(assert (=> b!575689 m!554717))

(declare-fun m!554719 () Bool)

(assert (=> b!575688 m!554719))

(declare-fun m!554721 () Bool)

(assert (=> b!575687 m!554721))

(declare-fun m!554723 () Bool)

(assert (=> b!575687 m!554723))

(declare-fun m!554725 () Bool)

(assert (=> b!575687 m!554725))

(assert (=> b!575687 m!554687))

(assert (=> b!575687 m!554687))

(declare-fun m!554727 () Bool)

(assert (=> b!575687 m!554727))

(assert (=> b!575687 m!554715))

(declare-fun m!554729 () Bool)

(assert (=> b!575684 m!554729))

(declare-fun m!554731 () Bool)

(assert (=> start!52824 m!554731))

(declare-fun m!554733 () Bool)

(assert (=> start!52824 m!554733))

(check-sat (not b!575686) (not b!575689) (not b!575687) (not b!575688) (not b!575681) (not b!575692) (not b!575684) (not start!52824) (not b!575691) (not b!575690) (not b!575685))
(check-sat)
