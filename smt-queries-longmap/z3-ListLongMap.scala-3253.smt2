; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45380 () Bool)

(assert start!45380)

(declare-fun b!498677 () Bool)

(declare-fun res!300788 () Bool)

(declare-fun e!292261 () Bool)

(assert (=> b!498677 (=> (not res!300788) (not e!292261))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32206 0))(
  ( (array!32207 (arr!15484 (Array (_ BitVec 32) (_ BitVec 64))) (size!15848 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32206)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498677 (= res!300788 (and (= (size!15848 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15848 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15848 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498678 () Bool)

(declare-fun e!292259 () Bool)

(declare-fun e!292258 () Bool)

(assert (=> b!498678 (= e!292259 e!292258)))

(declare-fun res!300789 () Bool)

(assert (=> b!498678 (=> res!300789 e!292258)))

(declare-datatypes ((SeekEntryResult!3907 0))(
  ( (MissingZero!3907 (index!17810 (_ BitVec 32))) (Found!3907 (index!17811 (_ BitVec 32))) (Intermediate!3907 (undefined!4719 Bool) (index!17812 (_ BitVec 32)) (x!47005 (_ BitVec 32))) (Undefined!3907) (MissingVacant!3907 (index!17813 (_ BitVec 32))) )
))
(declare-fun lt!225998 () SeekEntryResult!3907)

(declare-fun lt!225995 () (_ BitVec 32))

(assert (=> b!498678 (= res!300789 (or (bvsgt #b00000000000000000000000000000000 (x!47005 lt!225998)) (bvsgt (x!47005 lt!225998) #b01111111111111111111111111111110) (bvslt lt!225995 #b00000000000000000000000000000000) (bvsge lt!225995 (size!15848 a!3235)) (bvslt (index!17812 lt!225998) #b00000000000000000000000000000000) (bvsge (index!17812 lt!225998) (size!15848 a!3235)) (not (= lt!225998 (Intermediate!3907 false (index!17812 lt!225998) (x!47005 lt!225998))))))))

(assert (=> b!498678 (and (or (= (select (arr!15484 a!3235) (index!17812 lt!225998)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15484 a!3235) (index!17812 lt!225998)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15484 a!3235) (index!17812 lt!225998)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15484 a!3235) (index!17812 lt!225998)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14863 0))(
  ( (Unit!14864) )
))
(declare-fun lt!225992 () Unit!14863)

(declare-fun e!292262 () Unit!14863)

(assert (=> b!498678 (= lt!225992 e!292262)))

(declare-fun c!59222 () Bool)

(assert (=> b!498678 (= c!59222 (= (select (arr!15484 a!3235) (index!17812 lt!225998)) (select (arr!15484 a!3235) j!176)))))

(assert (=> b!498678 (and (bvslt (x!47005 lt!225998) #b01111111111111111111111111111110) (or (= (select (arr!15484 a!3235) (index!17812 lt!225998)) (select (arr!15484 a!3235) j!176)) (= (select (arr!15484 a!3235) (index!17812 lt!225998)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15484 a!3235) (index!17812 lt!225998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498679 () Bool)

(declare-fun e!292257 () Bool)

(assert (=> b!498679 (= e!292257 (not e!292259))))

(declare-fun res!300798 () Bool)

(assert (=> b!498679 (=> res!300798 e!292259)))

(declare-fun lt!225994 () (_ BitVec 32))

(declare-fun lt!225999 () array!32206)

(declare-fun lt!226000 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32206 (_ BitVec 32)) SeekEntryResult!3907)

(assert (=> b!498679 (= res!300798 (= lt!225998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225994 lt!226000 lt!225999 mask!3524)))))

(assert (=> b!498679 (= lt!225998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225995 (select (arr!15484 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498679 (= lt!225994 (toIndex!0 lt!226000 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!498679 (= lt!226000 (select (store (arr!15484 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498679 (= lt!225995 (toIndex!0 (select (arr!15484 a!3235) j!176) mask!3524))))

(assert (=> b!498679 (= lt!225999 (array!32207 (store (arr!15484 a!3235) i!1204 k0!2280) (size!15848 a!3235)))))

(declare-fun e!292256 () Bool)

(assert (=> b!498679 e!292256))

(declare-fun res!300790 () Bool)

(assert (=> b!498679 (=> (not res!300790) (not e!292256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32206 (_ BitVec 32)) Bool)

(assert (=> b!498679 (= res!300790 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225996 () Unit!14863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14863)

(assert (=> b!498679 (= lt!225996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498680 () Bool)

(declare-fun Unit!14865 () Unit!14863)

(assert (=> b!498680 (= e!292262 Unit!14865)))

(declare-fun lt!225997 () Unit!14863)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32206 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14863)

(assert (=> b!498680 (= lt!225997 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225995 #b00000000000000000000000000000000 (index!17812 lt!225998) (x!47005 lt!225998) mask!3524))))

(declare-fun res!300797 () Bool)

(assert (=> b!498680 (= res!300797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225995 lt!226000 lt!225999 mask!3524) (Intermediate!3907 false (index!17812 lt!225998) (x!47005 lt!225998))))))

(declare-fun e!292260 () Bool)

(assert (=> b!498680 (=> (not res!300797) (not e!292260))))

(assert (=> b!498680 e!292260))

(declare-fun b!498681 () Bool)

(declare-fun res!300787 () Bool)

(assert (=> b!498681 (=> (not res!300787) (not e!292261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498681 (= res!300787 (validKeyInArray!0 (select (arr!15484 a!3235) j!176)))))

(declare-fun b!498682 () Bool)

(declare-fun Unit!14866 () Unit!14863)

(assert (=> b!498682 (= e!292262 Unit!14866)))

(declare-fun b!498684 () Bool)

(assert (=> b!498684 (= e!292258 true)))

(declare-fun lt!225993 () SeekEntryResult!3907)

(assert (=> b!498684 (= lt!225993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225995 lt!226000 lt!225999 mask!3524))))

(declare-fun b!498685 () Bool)

(declare-fun res!300794 () Bool)

(assert (=> b!498685 (=> (not res!300794) (not e!292261))))

(declare-fun arrayContainsKey!0 (array!32206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498685 (= res!300794 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498686 () Bool)

(declare-fun res!300795 () Bool)

(assert (=> b!498686 (=> (not res!300795) (not e!292257))))

(declare-datatypes ((List!9549 0))(
  ( (Nil!9546) (Cons!9545 (h!10419 (_ BitVec 64)) (t!15769 List!9549)) )
))
(declare-fun arrayNoDuplicates!0 (array!32206 (_ BitVec 32) List!9549) Bool)

(assert (=> b!498686 (= res!300795 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9546))))

(declare-fun b!498687 () Bool)

(declare-fun res!300799 () Bool)

(assert (=> b!498687 (=> (not res!300799) (not e!292261))))

(assert (=> b!498687 (= res!300799 (validKeyInArray!0 k0!2280))))

(declare-fun b!498688 () Bool)

(assert (=> b!498688 (= e!292261 e!292257)))

(declare-fun res!300793 () Bool)

(assert (=> b!498688 (=> (not res!300793) (not e!292257))))

(declare-fun lt!225991 () SeekEntryResult!3907)

(assert (=> b!498688 (= res!300793 (or (= lt!225991 (MissingZero!3907 i!1204)) (= lt!225991 (MissingVacant!3907 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32206 (_ BitVec 32)) SeekEntryResult!3907)

(assert (=> b!498688 (= lt!225991 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498689 () Bool)

(declare-fun res!300791 () Bool)

(assert (=> b!498689 (=> res!300791 e!292259)))

(get-info :version)

(assert (=> b!498689 (= res!300791 (or (undefined!4719 lt!225998) (not ((_ is Intermediate!3907) lt!225998))))))

(declare-fun b!498690 () Bool)

(declare-fun res!300792 () Bool)

(assert (=> b!498690 (=> (not res!300792) (not e!292257))))

(assert (=> b!498690 (= res!300792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498691 () Bool)

(assert (=> b!498691 (= e!292256 (= (seekEntryOrOpen!0 (select (arr!15484 a!3235) j!176) a!3235 mask!3524) (Found!3907 j!176)))))

(declare-fun b!498683 () Bool)

(assert (=> b!498683 (= e!292260 false)))

(declare-fun res!300796 () Bool)

(assert (=> start!45380 (=> (not res!300796) (not e!292261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45380 (= res!300796 (validMask!0 mask!3524))))

(assert (=> start!45380 e!292261))

(assert (=> start!45380 true))

(declare-fun array_inv!11343 (array!32206) Bool)

(assert (=> start!45380 (array_inv!11343 a!3235)))

(assert (= (and start!45380 res!300796) b!498677))

(assert (= (and b!498677 res!300788) b!498681))

(assert (= (and b!498681 res!300787) b!498687))

(assert (= (and b!498687 res!300799) b!498685))

(assert (= (and b!498685 res!300794) b!498688))

(assert (= (and b!498688 res!300793) b!498690))

(assert (= (and b!498690 res!300792) b!498686))

(assert (= (and b!498686 res!300795) b!498679))

(assert (= (and b!498679 res!300790) b!498691))

(assert (= (and b!498679 (not res!300798)) b!498689))

(assert (= (and b!498689 (not res!300791)) b!498678))

(assert (= (and b!498678 c!59222) b!498680))

(assert (= (and b!498678 (not c!59222)) b!498682))

(assert (= (and b!498680 res!300797) b!498683))

(assert (= (and b!498678 (not res!300789)) b!498684))

(declare-fun m!480169 () Bool)

(assert (=> start!45380 m!480169))

(declare-fun m!480171 () Bool)

(assert (=> start!45380 m!480171))

(declare-fun m!480173 () Bool)

(assert (=> b!498684 m!480173))

(declare-fun m!480175 () Bool)

(assert (=> b!498690 m!480175))

(declare-fun m!480177 () Bool)

(assert (=> b!498681 m!480177))

(assert (=> b!498681 m!480177))

(declare-fun m!480179 () Bool)

(assert (=> b!498681 m!480179))

(declare-fun m!480181 () Bool)

(assert (=> b!498686 m!480181))

(declare-fun m!480183 () Bool)

(assert (=> b!498685 m!480183))

(declare-fun m!480185 () Bool)

(assert (=> b!498679 m!480185))

(declare-fun m!480187 () Bool)

(assert (=> b!498679 m!480187))

(assert (=> b!498679 m!480177))

(declare-fun m!480189 () Bool)

(assert (=> b!498679 m!480189))

(declare-fun m!480191 () Bool)

(assert (=> b!498679 m!480191))

(declare-fun m!480193 () Bool)

(assert (=> b!498679 m!480193))

(declare-fun m!480195 () Bool)

(assert (=> b!498679 m!480195))

(assert (=> b!498679 m!480177))

(declare-fun m!480197 () Bool)

(assert (=> b!498679 m!480197))

(assert (=> b!498679 m!480177))

(declare-fun m!480199 () Bool)

(assert (=> b!498679 m!480199))

(declare-fun m!480201 () Bool)

(assert (=> b!498680 m!480201))

(assert (=> b!498680 m!480173))

(declare-fun m!480203 () Bool)

(assert (=> b!498688 m!480203))

(declare-fun m!480205 () Bool)

(assert (=> b!498678 m!480205))

(assert (=> b!498678 m!480177))

(declare-fun m!480207 () Bool)

(assert (=> b!498687 m!480207))

(assert (=> b!498691 m!480177))

(assert (=> b!498691 m!480177))

(declare-fun m!480209 () Bool)

(assert (=> b!498691 m!480209))

(check-sat (not start!45380) (not b!498691) (not b!498684) (not b!498679) (not b!498687) (not b!498688) (not b!498686) (not b!498685) (not b!498681) (not b!498680) (not b!498690))
(check-sat)
