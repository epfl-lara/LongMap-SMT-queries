; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45194 () Bool)

(assert start!45194)

(declare-fun b!496024 () Bool)

(declare-fun res!298412 () Bool)

(declare-fun e!290936 () Bool)

(assert (=> b!496024 (=> (not res!298412) (not e!290936))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496024 (= res!298412 (validKeyInArray!0 k0!2280))))

(declare-fun b!496025 () Bool)

(declare-fun res!298414 () Bool)

(assert (=> b!496025 (=> (not res!298414) (not e!290936))))

(declare-datatypes ((array!32082 0))(
  ( (array!32083 (arr!15424 (Array (_ BitVec 32) (_ BitVec 64))) (size!15788 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32082)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496025 (= res!298414 (validKeyInArray!0 (select (arr!15424 a!3235) j!176)))))

(declare-fun b!496026 () Bool)

(declare-fun res!298415 () Bool)

(assert (=> b!496026 (=> (not res!298415) (not e!290936))))

(declare-fun arrayContainsKey!0 (array!32082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496026 (= res!298415 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!298418 () Bool)

(assert (=> start!45194 (=> (not res!298418) (not e!290936))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45194 (= res!298418 (validMask!0 mask!3524))))

(assert (=> start!45194 e!290936))

(assert (=> start!45194 true))

(declare-fun array_inv!11220 (array!32082) Bool)

(assert (=> start!45194 (array_inv!11220 a!3235)))

(declare-fun b!496027 () Bool)

(declare-fun res!298420 () Bool)

(declare-fun e!290934 () Bool)

(assert (=> b!496027 (=> res!298420 e!290934)))

(declare-datatypes ((SeekEntryResult!3891 0))(
  ( (MissingZero!3891 (index!17743 (_ BitVec 32))) (Found!3891 (index!17744 (_ BitVec 32))) (Intermediate!3891 (undefined!4703 Bool) (index!17745 (_ BitVec 32)) (x!46807 (_ BitVec 32))) (Undefined!3891) (MissingVacant!3891 (index!17746 (_ BitVec 32))) )
))
(declare-fun lt!224553 () SeekEntryResult!3891)

(get-info :version)

(assert (=> b!496027 (= res!298420 (or (undefined!4703 lt!224553) (not ((_ is Intermediate!3891) lt!224553))))))

(declare-fun b!496028 () Bool)

(declare-fun res!298416 () Bool)

(declare-fun e!290933 () Bool)

(assert (=> b!496028 (=> (not res!298416) (not e!290933))))

(declare-datatypes ((List!9582 0))(
  ( (Nil!9579) (Cons!9578 (h!10449 (_ BitVec 64)) (t!15810 List!9582)) )
))
(declare-fun arrayNoDuplicates!0 (array!32082 (_ BitVec 32) List!9582) Bool)

(assert (=> b!496028 (= res!298416 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9579))))

(declare-fun b!496029 () Bool)

(assert (=> b!496029 (= e!290936 e!290933)))

(declare-fun res!298417 () Bool)

(assert (=> b!496029 (=> (not res!298417) (not e!290933))))

(declare-fun lt!224556 () SeekEntryResult!3891)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496029 (= res!298417 (or (= lt!224556 (MissingZero!3891 i!1204)) (= lt!224556 (MissingVacant!3891 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32082 (_ BitVec 32)) SeekEntryResult!3891)

(assert (=> b!496029 (= lt!224556 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496030 () Bool)

(assert (=> b!496030 (= e!290934 true)))

(assert (=> b!496030 (and (bvslt (x!46807 lt!224553) #b01111111111111111111111111111110) (or (= (select (arr!15424 a!3235) (index!17745 lt!224553)) (select (arr!15424 a!3235) j!176)) (= (select (arr!15424 a!3235) (index!17745 lt!224553)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15424 a!3235) (index!17745 lt!224553)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!290935 () Bool)

(declare-fun b!496031 () Bool)

(assert (=> b!496031 (= e!290935 (= (seekEntryOrOpen!0 (select (arr!15424 a!3235) j!176) a!3235 mask!3524) (Found!3891 j!176)))))

(declare-fun b!496032 () Bool)

(declare-fun res!298419 () Bool)

(assert (=> b!496032 (=> (not res!298419) (not e!290933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32082 (_ BitVec 32)) Bool)

(assert (=> b!496032 (= res!298419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496033 () Bool)

(declare-fun res!298413 () Bool)

(assert (=> b!496033 (=> (not res!298413) (not e!290936))))

(assert (=> b!496033 (= res!298413 (and (= (size!15788 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15788 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15788 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496034 () Bool)

(assert (=> b!496034 (= e!290933 (not e!290934))))

(declare-fun res!298421 () Bool)

(assert (=> b!496034 (=> res!298421 e!290934)))

(declare-fun lt!224554 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32082 (_ BitVec 32)) SeekEntryResult!3891)

(assert (=> b!496034 (= res!298421 (= lt!224553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224554 (select (store (arr!15424 a!3235) i!1204 k0!2280) j!176) (array!32083 (store (arr!15424 a!3235) i!1204 k0!2280) (size!15788 a!3235)) mask!3524)))))

(declare-fun lt!224557 () (_ BitVec 32))

(assert (=> b!496034 (= lt!224553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224557 (select (arr!15424 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496034 (= lt!224554 (toIndex!0 (select (store (arr!15424 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496034 (= lt!224557 (toIndex!0 (select (arr!15424 a!3235) j!176) mask!3524))))

(assert (=> b!496034 e!290935))

(declare-fun res!298411 () Bool)

(assert (=> b!496034 (=> (not res!298411) (not e!290935))))

(assert (=> b!496034 (= res!298411 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14728 0))(
  ( (Unit!14729) )
))
(declare-fun lt!224555 () Unit!14728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14728)

(assert (=> b!496034 (= lt!224555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45194 res!298418) b!496033))

(assert (= (and b!496033 res!298413) b!496025))

(assert (= (and b!496025 res!298414) b!496024))

(assert (= (and b!496024 res!298412) b!496026))

(assert (= (and b!496026 res!298415) b!496029))

(assert (= (and b!496029 res!298417) b!496032))

(assert (= (and b!496032 res!298419) b!496028))

(assert (= (and b!496028 res!298416) b!496034))

(assert (= (and b!496034 res!298411) b!496031))

(assert (= (and b!496034 (not res!298421)) b!496027))

(assert (= (and b!496027 (not res!298420)) b!496030))

(declare-fun m!477197 () Bool)

(assert (=> b!496028 m!477197))

(declare-fun m!477199 () Bool)

(assert (=> b!496034 m!477199))

(declare-fun m!477201 () Bool)

(assert (=> b!496034 m!477201))

(declare-fun m!477203 () Bool)

(assert (=> b!496034 m!477203))

(declare-fun m!477205 () Bool)

(assert (=> b!496034 m!477205))

(declare-fun m!477207 () Bool)

(assert (=> b!496034 m!477207))

(assert (=> b!496034 m!477203))

(declare-fun m!477209 () Bool)

(assert (=> b!496034 m!477209))

(declare-fun m!477211 () Bool)

(assert (=> b!496034 m!477211))

(assert (=> b!496034 m!477203))

(declare-fun m!477213 () Bool)

(assert (=> b!496034 m!477213))

(assert (=> b!496034 m!477205))

(declare-fun m!477215 () Bool)

(assert (=> b!496034 m!477215))

(assert (=> b!496034 m!477205))

(declare-fun m!477217 () Bool)

(assert (=> b!496024 m!477217))

(declare-fun m!477219 () Bool)

(assert (=> b!496032 m!477219))

(assert (=> b!496031 m!477205))

(assert (=> b!496031 m!477205))

(declare-fun m!477221 () Bool)

(assert (=> b!496031 m!477221))

(declare-fun m!477223 () Bool)

(assert (=> start!45194 m!477223))

(declare-fun m!477225 () Bool)

(assert (=> start!45194 m!477225))

(assert (=> b!496025 m!477205))

(assert (=> b!496025 m!477205))

(declare-fun m!477227 () Bool)

(assert (=> b!496025 m!477227))

(declare-fun m!477229 () Bool)

(assert (=> b!496026 m!477229))

(declare-fun m!477231 () Bool)

(assert (=> b!496029 m!477231))

(declare-fun m!477233 () Bool)

(assert (=> b!496030 m!477233))

(assert (=> b!496030 m!477205))

(check-sat (not b!496024) (not b!496025) (not b!496028) (not b!496031) (not start!45194) (not b!496026) (not b!496034) (not b!496029) (not b!496032))
(check-sat)
