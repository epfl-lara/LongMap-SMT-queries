; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45178 () Bool)

(assert start!45178)

(declare-fun b!495760 () Bool)

(declare-fun e!290816 () Bool)

(assert (=> b!495760 (= e!290816 true)))

(declare-datatypes ((SeekEntryResult!3883 0))(
  ( (MissingZero!3883 (index!17711 (_ BitVec 32))) (Found!3883 (index!17712 (_ BitVec 32))) (Intermediate!3883 (undefined!4695 Bool) (index!17713 (_ BitVec 32)) (x!46775 (_ BitVec 32))) (Undefined!3883) (MissingVacant!3883 (index!17714 (_ BitVec 32))) )
))
(declare-fun lt!224435 () SeekEntryResult!3883)

(declare-datatypes ((array!32066 0))(
  ( (array!32067 (arr!15416 (Array (_ BitVec 32) (_ BitVec 64))) (size!15780 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32066)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495760 (and (bvslt (x!46775 lt!224435) #b01111111111111111111111111111110) (or (= (select (arr!15416 a!3235) (index!17713 lt!224435)) (select (arr!15416 a!3235) j!176)) (= (select (arr!15416 a!3235) (index!17713 lt!224435)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15416 a!3235) (index!17713 lt!224435)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495761 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!290815 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32066 (_ BitVec 32)) SeekEntryResult!3883)

(assert (=> b!495761 (= e!290815 (= (seekEntryOrOpen!0 (select (arr!15416 a!3235) j!176) a!3235 mask!3524) (Found!3883 j!176)))))

(declare-fun b!495762 () Bool)

(declare-fun res!298150 () Bool)

(declare-fun e!290814 () Bool)

(assert (=> b!495762 (=> (not res!298150) (not e!290814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495762 (= res!298150 (validKeyInArray!0 (select (arr!15416 a!3235) j!176)))))

(declare-fun b!495763 () Bool)

(declare-fun e!290817 () Bool)

(assert (=> b!495763 (= e!290814 e!290817)))

(declare-fun res!298154 () Bool)

(assert (=> b!495763 (=> (not res!298154) (not e!290817))))

(declare-fun lt!224434 () SeekEntryResult!3883)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495763 (= res!298154 (or (= lt!224434 (MissingZero!3883 i!1204)) (= lt!224434 (MissingVacant!3883 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!495763 (= lt!224434 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495764 () Bool)

(declare-fun res!298151 () Bool)

(assert (=> b!495764 (=> (not res!298151) (not e!290817))))

(declare-datatypes ((List!9574 0))(
  ( (Nil!9571) (Cons!9570 (h!10441 (_ BitVec 64)) (t!15802 List!9574)) )
))
(declare-fun arrayNoDuplicates!0 (array!32066 (_ BitVec 32) List!9574) Bool)

(assert (=> b!495764 (= res!298151 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9571))))

(declare-fun b!495765 () Bool)

(declare-fun res!298153 () Bool)

(assert (=> b!495765 (=> (not res!298153) (not e!290814))))

(declare-fun arrayContainsKey!0 (array!32066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495765 (= res!298153 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495767 () Bool)

(assert (=> b!495767 (= e!290817 (not e!290816))))

(declare-fun res!298148 () Bool)

(assert (=> b!495767 (=> res!298148 e!290816)))

(declare-fun lt!224433 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32066 (_ BitVec 32)) SeekEntryResult!3883)

(assert (=> b!495767 (= res!298148 (= lt!224435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224433 (select (store (arr!15416 a!3235) i!1204 k!2280) j!176) (array!32067 (store (arr!15416 a!3235) i!1204 k!2280) (size!15780 a!3235)) mask!3524)))))

(declare-fun lt!224437 () (_ BitVec 32))

(assert (=> b!495767 (= lt!224435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224437 (select (arr!15416 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495767 (= lt!224433 (toIndex!0 (select (store (arr!15416 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495767 (= lt!224437 (toIndex!0 (select (arr!15416 a!3235) j!176) mask!3524))))

(assert (=> b!495767 e!290815))

(declare-fun res!298155 () Bool)

(assert (=> b!495767 (=> (not res!298155) (not e!290815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32066 (_ BitVec 32)) Bool)

(assert (=> b!495767 (= res!298155 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14712 0))(
  ( (Unit!14713) )
))
(declare-fun lt!224436 () Unit!14712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14712)

(assert (=> b!495767 (= lt!224436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495768 () Bool)

(declare-fun res!298156 () Bool)

(assert (=> b!495768 (=> (not res!298156) (not e!290814))))

(assert (=> b!495768 (= res!298156 (and (= (size!15780 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15780 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15780 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495769 () Bool)

(declare-fun res!298152 () Bool)

(assert (=> b!495769 (=> (not res!298152) (not e!290817))))

(assert (=> b!495769 (= res!298152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495770 () Bool)

(declare-fun res!298149 () Bool)

(assert (=> b!495770 (=> (not res!298149) (not e!290814))))

(assert (=> b!495770 (= res!298149 (validKeyInArray!0 k!2280))))

(declare-fun b!495766 () Bool)

(declare-fun res!298147 () Bool)

(assert (=> b!495766 (=> res!298147 e!290816)))

(assert (=> b!495766 (= res!298147 (or (undefined!4695 lt!224435) (not (is-Intermediate!3883 lt!224435))))))

(declare-fun res!298157 () Bool)

(assert (=> start!45178 (=> (not res!298157) (not e!290814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45178 (= res!298157 (validMask!0 mask!3524))))

(assert (=> start!45178 e!290814))

(assert (=> start!45178 true))

(declare-fun array_inv!11212 (array!32066) Bool)

(assert (=> start!45178 (array_inv!11212 a!3235)))

(assert (= (and start!45178 res!298157) b!495768))

(assert (= (and b!495768 res!298156) b!495762))

(assert (= (and b!495762 res!298150) b!495770))

(assert (= (and b!495770 res!298149) b!495765))

(assert (= (and b!495765 res!298153) b!495763))

(assert (= (and b!495763 res!298154) b!495769))

(assert (= (and b!495769 res!298152) b!495764))

(assert (= (and b!495764 res!298151) b!495767))

(assert (= (and b!495767 res!298155) b!495761))

(assert (= (and b!495767 (not res!298148)) b!495766))

(assert (= (and b!495766 (not res!298147)) b!495760))

(declare-fun m!476893 () Bool)

(assert (=> b!495763 m!476893))

(declare-fun m!476895 () Bool)

(assert (=> b!495765 m!476895))

(declare-fun m!476897 () Bool)

(assert (=> b!495769 m!476897))

(declare-fun m!476899 () Bool)

(assert (=> b!495770 m!476899))

(declare-fun m!476901 () Bool)

(assert (=> b!495761 m!476901))

(assert (=> b!495761 m!476901))

(declare-fun m!476903 () Bool)

(assert (=> b!495761 m!476903))

(declare-fun m!476905 () Bool)

(assert (=> b!495760 m!476905))

(assert (=> b!495760 m!476901))

(declare-fun m!476907 () Bool)

(assert (=> start!45178 m!476907))

(declare-fun m!476909 () Bool)

(assert (=> start!45178 m!476909))

(declare-fun m!476911 () Bool)

(assert (=> b!495767 m!476911))

(declare-fun m!476913 () Bool)

(assert (=> b!495767 m!476913))

(declare-fun m!476915 () Bool)

(assert (=> b!495767 m!476915))

(declare-fun m!476917 () Bool)

(assert (=> b!495767 m!476917))

(assert (=> b!495767 m!476901))

(declare-fun m!476919 () Bool)

(assert (=> b!495767 m!476919))

(assert (=> b!495767 m!476901))

(declare-fun m!476921 () Bool)

(assert (=> b!495767 m!476921))

(assert (=> b!495767 m!476911))

(declare-fun m!476923 () Bool)

(assert (=> b!495767 m!476923))

(assert (=> b!495767 m!476901))

(declare-fun m!476925 () Bool)

(assert (=> b!495767 m!476925))

(assert (=> b!495767 m!476911))

(assert (=> b!495762 m!476901))

(assert (=> b!495762 m!476901))

(declare-fun m!476927 () Bool)

(assert (=> b!495762 m!476927))

(declare-fun m!476929 () Bool)

(assert (=> b!495764 m!476929))

(push 1)

