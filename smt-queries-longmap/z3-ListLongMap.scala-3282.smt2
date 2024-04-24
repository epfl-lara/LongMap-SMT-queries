; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45626 () Bool)

(assert start!45626)

(declare-fun b!503085 () Bool)

(declare-fun res!304475 () Bool)

(declare-fun e!294635 () Bool)

(assert (=> b!503085 (=> (not res!304475) (not e!294635))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503085 (= res!304475 (validKeyInArray!0 k0!2280))))

(declare-fun b!503086 () Bool)

(declare-datatypes ((Unit!15211 0))(
  ( (Unit!15212) )
))
(declare-fun e!294632 () Unit!15211)

(declare-fun Unit!15213 () Unit!15211)

(assert (=> b!503086 (= e!294632 Unit!15213)))

(declare-fun res!304473 () Bool)

(assert (=> start!45626 (=> (not res!304473) (not e!294635))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45626 (= res!304473 (validMask!0 mask!3524))))

(assert (=> start!45626 e!294635))

(assert (=> start!45626 true))

(declare-datatypes ((array!32383 0))(
  ( (array!32384 (arr!15571 (Array (_ BitVec 32) (_ BitVec 64))) (size!15935 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32383)

(declare-fun array_inv!11430 (array!32383) Bool)

(assert (=> start!45626 (array_inv!11430 a!3235)))

(declare-fun b!503087 () Bool)

(declare-fun e!294629 () Bool)

(declare-fun e!294628 () Bool)

(assert (=> b!503087 (= e!294629 e!294628)))

(declare-fun res!304479 () Bool)

(assert (=> b!503087 (=> res!304479 e!294628)))

(declare-fun lt!228856 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3994 0))(
  ( (MissingZero!3994 (index!18164 (_ BitVec 32))) (Found!3994 (index!18165 (_ BitVec 32))) (Intermediate!3994 (undefined!4806 Bool) (index!18166 (_ BitVec 32)) (x!47336 (_ BitVec 32))) (Undefined!3994) (MissingVacant!3994 (index!18167 (_ BitVec 32))) )
))
(declare-fun lt!228853 () SeekEntryResult!3994)

(assert (=> b!503087 (= res!304479 (or (bvsgt (x!47336 lt!228853) #b01111111111111111111111111111110) (bvslt lt!228856 #b00000000000000000000000000000000) (bvsge lt!228856 (size!15935 a!3235)) (bvslt (index!18166 lt!228853) #b00000000000000000000000000000000) (bvsge (index!18166 lt!228853) (size!15935 a!3235)) (not (= lt!228853 (Intermediate!3994 false (index!18166 lt!228853) (x!47336 lt!228853))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503087 (= (index!18166 lt!228853) i!1204)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!228851 () Unit!15211)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15211)

(assert (=> b!503087 (= lt!228851 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228856 #b00000000000000000000000000000000 (index!18166 lt!228853) (x!47336 lt!228853) mask!3524))))

(assert (=> b!503087 (and (or (= (select (arr!15571 a!3235) (index!18166 lt!228853)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15571 a!3235) (index!18166 lt!228853)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15571 a!3235) (index!18166 lt!228853)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15571 a!3235) (index!18166 lt!228853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228855 () Unit!15211)

(assert (=> b!503087 (= lt!228855 e!294632)))

(declare-fun c!59585 () Bool)

(assert (=> b!503087 (= c!59585 (= (select (arr!15571 a!3235) (index!18166 lt!228853)) (select (arr!15571 a!3235) j!176)))))

(assert (=> b!503087 (and (bvslt (x!47336 lt!228853) #b01111111111111111111111111111110) (or (= (select (arr!15571 a!3235) (index!18166 lt!228853)) (select (arr!15571 a!3235) j!176)) (= (select (arr!15571 a!3235) (index!18166 lt!228853)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15571 a!3235) (index!18166 lt!228853)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503088 () Bool)

(declare-fun res!304474 () Bool)

(assert (=> b!503088 (=> res!304474 e!294629)))

(get-info :version)

(assert (=> b!503088 (= res!304474 (or (undefined!4806 lt!228853) (not ((_ is Intermediate!3994) lt!228853))))))

(declare-fun b!503089 () Bool)

(declare-fun res!304483 () Bool)

(declare-fun e!294636 () Bool)

(assert (=> b!503089 (=> (not res!304483) (not e!294636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32383 (_ BitVec 32)) Bool)

(assert (=> b!503089 (= res!304483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503090 () Bool)

(declare-fun res!304472 () Bool)

(assert (=> b!503090 (=> (not res!304472) (not e!294635))))

(declare-fun arrayContainsKey!0 (array!32383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503090 (= res!304472 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503091 () Bool)

(declare-fun res!304477 () Bool)

(assert (=> b!503091 (=> (not res!304477) (not e!294636))))

(declare-datatypes ((List!9636 0))(
  ( (Nil!9633) (Cons!9632 (h!10509 (_ BitVec 64)) (t!15856 List!9636)) )
))
(declare-fun arrayNoDuplicates!0 (array!32383 (_ BitVec 32) List!9636) Bool)

(assert (=> b!503091 (= res!304477 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9633))))

(declare-fun b!503092 () Bool)

(declare-fun res!304482 () Bool)

(assert (=> b!503092 (=> (not res!304482) (not e!294635))))

(assert (=> b!503092 (= res!304482 (and (= (size!15935 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15935 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15935 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503093 () Bool)

(declare-fun Unit!15214 () Unit!15211)

(assert (=> b!503093 (= e!294632 Unit!15214)))

(declare-fun lt!228850 () Unit!15211)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15211)

(assert (=> b!503093 (= lt!228850 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228856 #b00000000000000000000000000000000 (index!18166 lt!228853) (x!47336 lt!228853) mask!3524))))

(declare-fun lt!228846 () (_ BitVec 64))

(declare-fun res!304486 () Bool)

(declare-fun lt!228847 () array!32383)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32383 (_ BitVec 32)) SeekEntryResult!3994)

(assert (=> b!503093 (= res!304486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228856 lt!228846 lt!228847 mask!3524) (Intermediate!3994 false (index!18166 lt!228853) (x!47336 lt!228853))))))

(declare-fun e!294633 () Bool)

(assert (=> b!503093 (=> (not res!304486) (not e!294633))))

(assert (=> b!503093 e!294633))

(declare-fun b!503094 () Bool)

(assert (=> b!503094 (= e!294636 (not e!294629))))

(declare-fun res!304476 () Bool)

(assert (=> b!503094 (=> res!304476 e!294629)))

(declare-fun lt!228849 () (_ BitVec 32))

(assert (=> b!503094 (= res!304476 (= lt!228853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228849 lt!228846 lt!228847 mask!3524)))))

(assert (=> b!503094 (= lt!228853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228856 (select (arr!15571 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503094 (= lt!228849 (toIndex!0 lt!228846 mask!3524))))

(assert (=> b!503094 (= lt!228846 (select (store (arr!15571 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503094 (= lt!228856 (toIndex!0 (select (arr!15571 a!3235) j!176) mask!3524))))

(assert (=> b!503094 (= lt!228847 (array!32384 (store (arr!15571 a!3235) i!1204 k0!2280) (size!15935 a!3235)))))

(declare-fun e!294634 () Bool)

(assert (=> b!503094 e!294634))

(declare-fun res!304481 () Bool)

(assert (=> b!503094 (=> (not res!304481) (not e!294634))))

(assert (=> b!503094 (= res!304481 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228852 () Unit!15211)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15211)

(assert (=> b!503094 (= lt!228852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503095 () Bool)

(assert (=> b!503095 (= e!294628 true)))

(declare-fun lt!228848 () SeekEntryResult!3994)

(assert (=> b!503095 (= lt!228848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228856 lt!228846 lt!228847 mask!3524))))

(declare-fun b!503096 () Bool)

(declare-fun res!304485 () Bool)

(assert (=> b!503096 (=> res!304485 e!294628)))

(declare-fun e!294631 () Bool)

(assert (=> b!503096 (= res!304485 e!294631)))

(declare-fun res!304484 () Bool)

(assert (=> b!503096 (=> (not res!304484) (not e!294631))))

(assert (=> b!503096 (= res!304484 (bvsgt #b00000000000000000000000000000000 (x!47336 lt!228853)))))

(declare-fun b!503097 () Bool)

(assert (=> b!503097 (= e!294633 false)))

(declare-fun b!503098 () Bool)

(assert (=> b!503098 (= e!294635 e!294636)))

(declare-fun res!304480 () Bool)

(assert (=> b!503098 (=> (not res!304480) (not e!294636))))

(declare-fun lt!228854 () SeekEntryResult!3994)

(assert (=> b!503098 (= res!304480 (or (= lt!228854 (MissingZero!3994 i!1204)) (= lt!228854 (MissingVacant!3994 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32383 (_ BitVec 32)) SeekEntryResult!3994)

(assert (=> b!503098 (= lt!228854 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503099 () Bool)

(declare-fun res!304478 () Bool)

(assert (=> b!503099 (=> (not res!304478) (not e!294635))))

(assert (=> b!503099 (= res!304478 (validKeyInArray!0 (select (arr!15571 a!3235) j!176)))))

(declare-fun b!503100 () Bool)

(assert (=> b!503100 (= e!294634 (= (seekEntryOrOpen!0 (select (arr!15571 a!3235) j!176) a!3235 mask!3524) (Found!3994 j!176)))))

(declare-fun b!503101 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32383 (_ BitVec 32)) SeekEntryResult!3994)

(assert (=> b!503101 (= e!294631 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228856 (index!18166 lt!228853) (select (arr!15571 a!3235) j!176) a!3235 mask!3524) (Found!3994 j!176))))))

(assert (= (and start!45626 res!304473) b!503092))

(assert (= (and b!503092 res!304482) b!503099))

(assert (= (and b!503099 res!304478) b!503085))

(assert (= (and b!503085 res!304475) b!503090))

(assert (= (and b!503090 res!304472) b!503098))

(assert (= (and b!503098 res!304480) b!503089))

(assert (= (and b!503089 res!304483) b!503091))

(assert (= (and b!503091 res!304477) b!503094))

(assert (= (and b!503094 res!304481) b!503100))

(assert (= (and b!503094 (not res!304476)) b!503088))

(assert (= (and b!503088 (not res!304474)) b!503087))

(assert (= (and b!503087 c!59585) b!503093))

(assert (= (and b!503087 (not c!59585)) b!503086))

(assert (= (and b!503093 res!304486) b!503097))

(assert (= (and b!503087 (not res!304479)) b!503096))

(assert (= (and b!503096 res!304484) b!503101))

(assert (= (and b!503096 (not res!304485)) b!503095))

(declare-fun m!484195 () Bool)

(assert (=> b!503099 m!484195))

(assert (=> b!503099 m!484195))

(declare-fun m!484197 () Bool)

(assert (=> b!503099 m!484197))

(declare-fun m!484199 () Bool)

(assert (=> b!503094 m!484199))

(assert (=> b!503094 m!484195))

(declare-fun m!484201 () Bool)

(assert (=> b!503094 m!484201))

(declare-fun m!484203 () Bool)

(assert (=> b!503094 m!484203))

(declare-fun m!484205 () Bool)

(assert (=> b!503094 m!484205))

(declare-fun m!484207 () Bool)

(assert (=> b!503094 m!484207))

(assert (=> b!503094 m!484195))

(declare-fun m!484209 () Bool)

(assert (=> b!503094 m!484209))

(assert (=> b!503094 m!484195))

(declare-fun m!484211 () Bool)

(assert (=> b!503094 m!484211))

(declare-fun m!484213 () Bool)

(assert (=> b!503094 m!484213))

(assert (=> b!503101 m!484195))

(assert (=> b!503101 m!484195))

(declare-fun m!484215 () Bool)

(assert (=> b!503101 m!484215))

(declare-fun m!484217 () Bool)

(assert (=> b!503085 m!484217))

(declare-fun m!484219 () Bool)

(assert (=> b!503087 m!484219))

(declare-fun m!484221 () Bool)

(assert (=> b!503087 m!484221))

(assert (=> b!503087 m!484195))

(declare-fun m!484223 () Bool)

(assert (=> b!503091 m!484223))

(declare-fun m!484225 () Bool)

(assert (=> b!503089 m!484225))

(declare-fun m!484227 () Bool)

(assert (=> b!503090 m!484227))

(declare-fun m!484229 () Bool)

(assert (=> start!45626 m!484229))

(declare-fun m!484231 () Bool)

(assert (=> start!45626 m!484231))

(declare-fun m!484233 () Bool)

(assert (=> b!503095 m!484233))

(declare-fun m!484235 () Bool)

(assert (=> b!503098 m!484235))

(assert (=> b!503100 m!484195))

(assert (=> b!503100 m!484195))

(declare-fun m!484237 () Bool)

(assert (=> b!503100 m!484237))

(declare-fun m!484239 () Bool)

(assert (=> b!503093 m!484239))

(assert (=> b!503093 m!484233))

(check-sat (not start!45626) (not b!503094) (not b!503087) (not b!503091) (not b!503100) (not b!503089) (not b!503095) (not b!503090) (not b!503085) (not b!503101) (not b!503098) (not b!503093) (not b!503099))
(check-sat)
