; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45456 () Bool)

(assert start!45456)

(declare-fun b!500222 () Bool)

(declare-fun e!293064 () Bool)

(declare-fun e!293062 () Bool)

(assert (=> b!500222 (= e!293064 (not e!293062))))

(declare-fun res!302194 () Bool)

(assert (=> b!500222 (=> res!302194 e!293062)))

(declare-fun lt!226915 () (_ BitVec 64))

(declare-datatypes ((array!32291 0))(
  ( (array!32292 (arr!15527 (Array (_ BitVec 32) (_ BitVec 64))) (size!15892 (_ BitVec 32))) )
))
(declare-fun lt!226920 () array!32291)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3991 0))(
  ( (MissingZero!3991 (index!18146 (_ BitVec 32))) (Found!3991 (index!18147 (_ BitVec 32))) (Intermediate!3991 (undefined!4803 Bool) (index!18148 (_ BitVec 32)) (x!47191 (_ BitVec 32))) (Undefined!3991) (MissingVacant!3991 (index!18149 (_ BitVec 32))) )
))
(declare-fun lt!226924 () SeekEntryResult!3991)

(declare-fun lt!226917 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32291 (_ BitVec 32)) SeekEntryResult!3991)

(assert (=> b!500222 (= res!302194 (= lt!226924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226917 lt!226915 lt!226920 mask!3524)))))

(declare-fun lt!226922 () (_ BitVec 32))

(declare-fun a!3235 () array!32291)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500222 (= lt!226924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226922 (select (arr!15527 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500222 (= lt!226917 (toIndex!0 lt!226915 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500222 (= lt!226915 (select (store (arr!15527 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500222 (= lt!226922 (toIndex!0 (select (arr!15527 a!3235) j!176) mask!3524))))

(assert (=> b!500222 (= lt!226920 (array!32292 (store (arr!15527 a!3235) i!1204 k0!2280) (size!15892 a!3235)))))

(declare-fun e!293059 () Bool)

(assert (=> b!500222 e!293059))

(declare-fun res!302193 () Bool)

(assert (=> b!500222 (=> (not res!302193) (not e!293059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32291 (_ BitVec 32)) Bool)

(assert (=> b!500222 (= res!302193 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15034 0))(
  ( (Unit!15035) )
))
(declare-fun lt!226918 () Unit!15034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15034)

(assert (=> b!500222 (= lt!226918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500223 () Bool)

(declare-fun e!293058 () Bool)

(assert (=> b!500223 (= e!293062 e!293058)))

(declare-fun res!302187 () Bool)

(assert (=> b!500223 (=> res!302187 e!293058)))

(assert (=> b!500223 (= res!302187 (or (bvsgt #b00000000000000000000000000000000 (x!47191 lt!226924)) (bvsgt (x!47191 lt!226924) #b01111111111111111111111111111110) (bvslt lt!226922 #b00000000000000000000000000000000) (bvsge lt!226922 (size!15892 a!3235)) (bvslt (index!18148 lt!226924) #b00000000000000000000000000000000) (bvsge (index!18148 lt!226924) (size!15892 a!3235)) (not (= lt!226924 (Intermediate!3991 false (index!18148 lt!226924) (x!47191 lt!226924))))))))

(assert (=> b!500223 (and (or (= (select (arr!15527 a!3235) (index!18148 lt!226924)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15527 a!3235) (index!18148 lt!226924)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15527 a!3235) (index!18148 lt!226924)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15527 a!3235) (index!18148 lt!226924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226921 () Unit!15034)

(declare-fun e!293060 () Unit!15034)

(assert (=> b!500223 (= lt!226921 e!293060)))

(declare-fun c!59295 () Bool)

(assert (=> b!500223 (= c!59295 (= (select (arr!15527 a!3235) (index!18148 lt!226924)) (select (arr!15527 a!3235) j!176)))))

(assert (=> b!500223 (and (bvslt (x!47191 lt!226924) #b01111111111111111111111111111110) (or (= (select (arr!15527 a!3235) (index!18148 lt!226924)) (select (arr!15527 a!3235) j!176)) (= (select (arr!15527 a!3235) (index!18148 lt!226924)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15527 a!3235) (index!18148 lt!226924)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!302189 () Bool)

(declare-fun e!293057 () Bool)

(assert (=> start!45456 (=> (not res!302189) (not e!293057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45456 (= res!302189 (validMask!0 mask!3524))))

(assert (=> start!45456 e!293057))

(assert (=> start!45456 true))

(declare-fun array_inv!11410 (array!32291) Bool)

(assert (=> start!45456 (array_inv!11410 a!3235)))

(declare-fun b!500224 () Bool)

(assert (=> b!500224 (= e!293057 e!293064)))

(declare-fun res!302195 () Bool)

(assert (=> b!500224 (=> (not res!302195) (not e!293064))))

(declare-fun lt!226923 () SeekEntryResult!3991)

(assert (=> b!500224 (= res!302195 (or (= lt!226923 (MissingZero!3991 i!1204)) (= lt!226923 (MissingVacant!3991 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32291 (_ BitVec 32)) SeekEntryResult!3991)

(assert (=> b!500224 (= lt!226923 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500225 () Bool)

(declare-fun res!302188 () Bool)

(assert (=> b!500225 (=> (not res!302188) (not e!293057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500225 (= res!302188 (validKeyInArray!0 k0!2280))))

(declare-fun b!500226 () Bool)

(declare-fun res!302196 () Bool)

(assert (=> b!500226 (=> (not res!302196) (not e!293057))))

(assert (=> b!500226 (= res!302196 (and (= (size!15892 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15892 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15892 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500227 () Bool)

(declare-fun Unit!15036 () Unit!15034)

(assert (=> b!500227 (= e!293060 Unit!15036)))

(declare-fun lt!226916 () Unit!15034)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15034)

(assert (=> b!500227 (= lt!226916 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226922 #b00000000000000000000000000000000 (index!18148 lt!226924) (x!47191 lt!226924) mask!3524))))

(declare-fun res!302190 () Bool)

(assert (=> b!500227 (= res!302190 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226922 lt!226915 lt!226920 mask!3524) (Intermediate!3991 false (index!18148 lt!226924) (x!47191 lt!226924))))))

(declare-fun e!293061 () Bool)

(assert (=> b!500227 (=> (not res!302190) (not e!293061))))

(assert (=> b!500227 e!293061))

(declare-fun b!500228 () Bool)

(declare-fun res!302197 () Bool)

(assert (=> b!500228 (=> res!302197 e!293062)))

(get-info :version)

(assert (=> b!500228 (= res!302197 (or (undefined!4803 lt!226924) (not ((_ is Intermediate!3991) lt!226924))))))

(declare-fun b!500229 () Bool)

(assert (=> b!500229 (= e!293061 false)))

(declare-fun b!500230 () Bool)

(assert (=> b!500230 (= e!293058 true)))

(declare-fun lt!226919 () SeekEntryResult!3991)

(assert (=> b!500230 (= lt!226919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226922 lt!226915 lt!226920 mask!3524))))

(declare-fun b!500231 () Bool)

(declare-fun res!302192 () Bool)

(assert (=> b!500231 (=> (not res!302192) (not e!293057))))

(declare-fun arrayContainsKey!0 (array!32291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500231 (= res!302192 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500232 () Bool)

(declare-fun Unit!15037 () Unit!15034)

(assert (=> b!500232 (= e!293060 Unit!15037)))

(declare-fun b!500233 () Bool)

(declare-fun res!302186 () Bool)

(assert (=> b!500233 (=> (not res!302186) (not e!293057))))

(assert (=> b!500233 (= res!302186 (validKeyInArray!0 (select (arr!15527 a!3235) j!176)))))

(declare-fun b!500234 () Bool)

(declare-fun res!302191 () Bool)

(assert (=> b!500234 (=> (not res!302191) (not e!293064))))

(assert (=> b!500234 (= res!302191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500235 () Bool)

(declare-fun res!302198 () Bool)

(assert (=> b!500235 (=> (not res!302198) (not e!293064))))

(declare-datatypes ((List!9724 0))(
  ( (Nil!9721) (Cons!9720 (h!10594 (_ BitVec 64)) (t!15943 List!9724)) )
))
(declare-fun arrayNoDuplicates!0 (array!32291 (_ BitVec 32) List!9724) Bool)

(assert (=> b!500235 (= res!302198 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9721))))

(declare-fun b!500236 () Bool)

(assert (=> b!500236 (= e!293059 (= (seekEntryOrOpen!0 (select (arr!15527 a!3235) j!176) a!3235 mask!3524) (Found!3991 j!176)))))

(assert (= (and start!45456 res!302189) b!500226))

(assert (= (and b!500226 res!302196) b!500233))

(assert (= (and b!500233 res!302186) b!500225))

(assert (= (and b!500225 res!302188) b!500231))

(assert (= (and b!500231 res!302192) b!500224))

(assert (= (and b!500224 res!302195) b!500234))

(assert (= (and b!500234 res!302191) b!500235))

(assert (= (and b!500235 res!302198) b!500222))

(assert (= (and b!500222 res!302193) b!500236))

(assert (= (and b!500222 (not res!302194)) b!500228))

(assert (= (and b!500228 (not res!302197)) b!500223))

(assert (= (and b!500223 c!59295) b!500227))

(assert (= (and b!500223 (not c!59295)) b!500232))

(assert (= (and b!500227 res!302190) b!500229))

(assert (= (and b!500223 (not res!302187)) b!500230))

(declare-fun m!480871 () Bool)

(assert (=> b!500236 m!480871))

(assert (=> b!500236 m!480871))

(declare-fun m!480873 () Bool)

(assert (=> b!500236 m!480873))

(declare-fun m!480875 () Bool)

(assert (=> b!500231 m!480875))

(assert (=> b!500233 m!480871))

(assert (=> b!500233 m!480871))

(declare-fun m!480877 () Bool)

(assert (=> b!500233 m!480877))

(declare-fun m!480879 () Bool)

(assert (=> b!500224 m!480879))

(declare-fun m!480881 () Bool)

(assert (=> b!500227 m!480881))

(declare-fun m!480883 () Bool)

(assert (=> b!500227 m!480883))

(assert (=> b!500230 m!480883))

(declare-fun m!480885 () Bool)

(assert (=> b!500235 m!480885))

(declare-fun m!480887 () Bool)

(assert (=> b!500225 m!480887))

(declare-fun m!480889 () Bool)

(assert (=> b!500234 m!480889))

(declare-fun m!480891 () Bool)

(assert (=> start!45456 m!480891))

(declare-fun m!480893 () Bool)

(assert (=> start!45456 m!480893))

(declare-fun m!480895 () Bool)

(assert (=> b!500222 m!480895))

(declare-fun m!480897 () Bool)

(assert (=> b!500222 m!480897))

(declare-fun m!480899 () Bool)

(assert (=> b!500222 m!480899))

(declare-fun m!480901 () Bool)

(assert (=> b!500222 m!480901))

(assert (=> b!500222 m!480871))

(declare-fun m!480903 () Bool)

(assert (=> b!500222 m!480903))

(assert (=> b!500222 m!480871))

(declare-fun m!480905 () Bool)

(assert (=> b!500222 m!480905))

(assert (=> b!500222 m!480871))

(declare-fun m!480907 () Bool)

(assert (=> b!500222 m!480907))

(declare-fun m!480909 () Bool)

(assert (=> b!500222 m!480909))

(declare-fun m!480911 () Bool)

(assert (=> b!500223 m!480911))

(assert (=> b!500223 m!480871))

(check-sat (not b!500224) (not start!45456) (not b!500227) (not b!500222) (not b!500231) (not b!500225) (not b!500234) (not b!500236) (not b!500233) (not b!500230) (not b!500235))
(check-sat)
