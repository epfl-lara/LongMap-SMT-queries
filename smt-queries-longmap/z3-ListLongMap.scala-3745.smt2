; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51510 () Bool)

(assert start!51510)

(declare-fun b!562910 () Bool)

(declare-fun res!353968 () Bool)

(declare-fun e!324424 () Bool)

(assert (=> b!562910 (=> (not res!353968) (not e!324424))))

(declare-datatypes ((array!35322 0))(
  ( (array!35323 (arr!16960 (Array (_ BitVec 32) (_ BitVec 64))) (size!17324 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35322)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35322 (_ BitVec 32)) Bool)

(assert (=> b!562910 (= res!353968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562911 () Bool)

(declare-fun e!324422 () Bool)

(assert (=> b!562911 (= e!324424 e!324422)))

(declare-fun res!353966 () Bool)

(assert (=> b!562911 (=> (not res!353966) (not e!324422))))

(declare-fun lt!256677 () (_ BitVec 64))

(declare-fun lt!256667 () array!35322)

(declare-fun lt!256668 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5365 0))(
  ( (MissingZero!5365 (index!23687 (_ BitVec 32))) (Found!5365 (index!23688 (_ BitVec 32))) (Intermediate!5365 (undefined!6177 Bool) (index!23689 (_ BitVec 32)) (x!52735 (_ BitVec 32))) (Undefined!5365) (MissingVacant!5365 (index!23690 (_ BitVec 32))) )
))
(declare-fun lt!256678 () SeekEntryResult!5365)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35322 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!562911 (= res!353966 (= lt!256678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256668 lt!256677 lt!256667 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256671 () (_ BitVec 32))

(assert (=> b!562911 (= lt!256678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256671 (select (arr!16960 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562911 (= lt!256668 (toIndex!0 lt!256677 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562911 (= lt!256677 (select (store (arr!16960 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562911 (= lt!256671 (toIndex!0 (select (arr!16960 a!3118) j!142) mask!3119))))

(assert (=> b!562911 (= lt!256667 (array!35323 (store (arr!16960 a!3118) i!1132 k0!1914) (size!17324 a!3118)))))

(declare-fun b!562912 () Bool)

(declare-fun e!324420 () Bool)

(declare-fun e!324426 () Bool)

(assert (=> b!562912 (= e!324420 e!324426)))

(declare-fun res!353962 () Bool)

(assert (=> b!562912 (=> res!353962 e!324426)))

(declare-fun lt!256669 () (_ BitVec 64))

(assert (=> b!562912 (= res!353962 (or (= lt!256669 (select (arr!16960 a!3118) j!142)) (= lt!256669 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562912 (= lt!256669 (select (arr!16960 a!3118) (index!23689 lt!256678)))))

(declare-fun b!562913 () Bool)

(assert (=> b!562913 (= e!324422 (not e!324420))))

(declare-fun res!353963 () Bool)

(assert (=> b!562913 (=> res!353963 e!324420)))

(get-info :version)

(assert (=> b!562913 (= res!353963 (or (undefined!6177 lt!256678) (not ((_ is Intermediate!5365) lt!256678))))))

(declare-fun lt!256666 () SeekEntryResult!5365)

(declare-fun lt!256675 () SeekEntryResult!5365)

(assert (=> b!562913 (= lt!256666 lt!256675)))

(assert (=> b!562913 (= lt!256675 (Found!5365 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35322 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!562913 (= lt!256666 (seekEntryOrOpen!0 (select (arr!16960 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562913 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17575 0))(
  ( (Unit!17576) )
))
(declare-fun lt!256676 () Unit!17575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17575)

(assert (=> b!562913 (= lt!256676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562915 () Bool)

(declare-fun res!353957 () Bool)

(declare-fun e!324425 () Bool)

(assert (=> b!562915 (=> (not res!353957) (not e!324425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562915 (= res!353957 (validKeyInArray!0 k0!1914))))

(declare-fun b!562916 () Bool)

(declare-fun res!353960 () Bool)

(assert (=> b!562916 (=> (not res!353960) (not e!324424))))

(declare-datatypes ((List!10947 0))(
  ( (Nil!10944) (Cons!10943 (h!11949 (_ BitVec 64)) (t!17167 List!10947)) )
))
(declare-fun arrayNoDuplicates!0 (array!35322 (_ BitVec 32) List!10947) Bool)

(assert (=> b!562916 (= res!353960 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10944))))

(declare-fun b!562917 () Bool)

(declare-fun res!353959 () Bool)

(assert (=> b!562917 (=> (not res!353959) (not e!324425))))

(assert (=> b!562917 (= res!353959 (validKeyInArray!0 (select (arr!16960 a!3118) j!142)))))

(declare-fun b!562918 () Bool)

(declare-fun e!324423 () Bool)

(assert (=> b!562918 (= e!324423 true)))

(declare-fun lt!256672 () SeekEntryResult!5365)

(declare-fun lt!256670 () SeekEntryResult!5365)

(assert (=> b!562918 (= lt!256672 lt!256670)))

(declare-fun lt!256673 () Unit!17575)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35322 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17575)

(assert (=> b!562918 (= lt!256673 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52735 lt!256678) (index!23689 lt!256678) (index!23689 lt!256678) mask!3119))))

(declare-fun b!562919 () Bool)

(assert (=> b!562919 (= e!324426 e!324423)))

(declare-fun res!353965 () Bool)

(assert (=> b!562919 (=> res!353965 e!324423)))

(assert (=> b!562919 (= res!353965 (or (bvslt (index!23689 lt!256678) #b00000000000000000000000000000000) (bvsge (index!23689 lt!256678) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52735 lt!256678) #b01111111111111111111111111111110) (bvslt (x!52735 lt!256678) #b00000000000000000000000000000000) (not (= lt!256669 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16960 a!3118) i!1132 k0!1914) (index!23689 lt!256678)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256672 lt!256675))))))

(declare-fun lt!256665 () SeekEntryResult!5365)

(assert (=> b!562919 (= lt!256665 lt!256670)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35322 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!562919 (= lt!256670 (seekKeyOrZeroReturnVacant!0 (x!52735 lt!256678) (index!23689 lt!256678) (index!23689 lt!256678) lt!256677 lt!256667 mask!3119))))

(assert (=> b!562919 (= lt!256665 (seekEntryOrOpen!0 lt!256677 lt!256667 mask!3119))))

(assert (=> b!562919 (= lt!256666 lt!256672)))

(assert (=> b!562919 (= lt!256672 (seekKeyOrZeroReturnVacant!0 (x!52735 lt!256678) (index!23689 lt!256678) (index!23689 lt!256678) (select (arr!16960 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!353967 () Bool)

(assert (=> start!51510 (=> (not res!353967) (not e!324425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51510 (= res!353967 (validMask!0 mask!3119))))

(assert (=> start!51510 e!324425))

(assert (=> start!51510 true))

(declare-fun array_inv!12819 (array!35322) Bool)

(assert (=> start!51510 (array_inv!12819 a!3118)))

(declare-fun b!562914 () Bool)

(assert (=> b!562914 (= e!324425 e!324424)))

(declare-fun res!353961 () Bool)

(assert (=> b!562914 (=> (not res!353961) (not e!324424))))

(declare-fun lt!256674 () SeekEntryResult!5365)

(assert (=> b!562914 (= res!353961 (or (= lt!256674 (MissingZero!5365 i!1132)) (= lt!256674 (MissingVacant!5365 i!1132))))))

(assert (=> b!562914 (= lt!256674 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562920 () Bool)

(declare-fun res!353958 () Bool)

(assert (=> b!562920 (=> (not res!353958) (not e!324425))))

(declare-fun arrayContainsKey!0 (array!35322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562920 (= res!353958 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562921 () Bool)

(declare-fun res!353964 () Bool)

(assert (=> b!562921 (=> (not res!353964) (not e!324425))))

(assert (=> b!562921 (= res!353964 (and (= (size!17324 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17324 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17324 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51510 res!353967) b!562921))

(assert (= (and b!562921 res!353964) b!562917))

(assert (= (and b!562917 res!353959) b!562915))

(assert (= (and b!562915 res!353957) b!562920))

(assert (= (and b!562920 res!353958) b!562914))

(assert (= (and b!562914 res!353961) b!562910))

(assert (= (and b!562910 res!353968) b!562916))

(assert (= (and b!562916 res!353960) b!562911))

(assert (= (and b!562911 res!353966) b!562913))

(assert (= (and b!562913 (not res!353963)) b!562912))

(assert (= (and b!562912 (not res!353962)) b!562919))

(assert (= (and b!562919 (not res!353965)) b!562918))

(declare-fun m!541175 () Bool)

(assert (=> b!562915 m!541175))

(declare-fun m!541177 () Bool)

(assert (=> b!562918 m!541177))

(declare-fun m!541179 () Bool)

(assert (=> b!562911 m!541179))

(declare-fun m!541181 () Bool)

(assert (=> b!562911 m!541181))

(assert (=> b!562911 m!541179))

(declare-fun m!541183 () Bool)

(assert (=> b!562911 m!541183))

(declare-fun m!541185 () Bool)

(assert (=> b!562911 m!541185))

(assert (=> b!562911 m!541179))

(declare-fun m!541187 () Bool)

(assert (=> b!562911 m!541187))

(declare-fun m!541189 () Bool)

(assert (=> b!562911 m!541189))

(declare-fun m!541191 () Bool)

(assert (=> b!562911 m!541191))

(declare-fun m!541193 () Bool)

(assert (=> b!562920 m!541193))

(assert (=> b!562912 m!541179))

(declare-fun m!541195 () Bool)

(assert (=> b!562912 m!541195))

(declare-fun m!541197 () Bool)

(assert (=> start!51510 m!541197))

(declare-fun m!541199 () Bool)

(assert (=> start!51510 m!541199))

(assert (=> b!562913 m!541179))

(assert (=> b!562913 m!541179))

(declare-fun m!541201 () Bool)

(assert (=> b!562913 m!541201))

(declare-fun m!541203 () Bool)

(assert (=> b!562913 m!541203))

(declare-fun m!541205 () Bool)

(assert (=> b!562913 m!541205))

(declare-fun m!541207 () Bool)

(assert (=> b!562910 m!541207))

(declare-fun m!541209 () Bool)

(assert (=> b!562916 m!541209))

(assert (=> b!562919 m!541179))

(declare-fun m!541211 () Bool)

(assert (=> b!562919 m!541211))

(assert (=> b!562919 m!541179))

(declare-fun m!541213 () Bool)

(assert (=> b!562919 m!541213))

(declare-fun m!541215 () Bool)

(assert (=> b!562919 m!541215))

(declare-fun m!541217 () Bool)

(assert (=> b!562919 m!541217))

(assert (=> b!562919 m!541189))

(declare-fun m!541219 () Bool)

(assert (=> b!562914 m!541219))

(assert (=> b!562917 m!541179))

(assert (=> b!562917 m!541179))

(declare-fun m!541221 () Bool)

(assert (=> b!562917 m!541221))

(check-sat (not start!51510) (not b!562911) (not b!562913) (not b!562919) (not b!562915) (not b!562916) (not b!562910) (not b!562914) (not b!562918) (not b!562917) (not b!562920))
(check-sat)
