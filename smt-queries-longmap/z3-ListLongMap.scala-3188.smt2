; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44756 () Bool)

(assert start!44756)

(declare-fun b!491307 () Bool)

(declare-fun e!288698 () Bool)

(declare-fun e!288699 () Bool)

(assert (=> b!491307 (= e!288698 e!288699)))

(declare-fun res!294251 () Bool)

(assert (=> b!491307 (=> (not res!294251) (not e!288699))))

(declare-datatypes ((SeekEntryResult!3762 0))(
  ( (MissingZero!3762 (index!17227 (_ BitVec 32))) (Found!3762 (index!17228 (_ BitVec 32))) (Intermediate!3762 (undefined!4574 Bool) (index!17229 (_ BitVec 32)) (x!46316 (_ BitVec 32))) (Undefined!3762) (MissingVacant!3762 (index!17230 (_ BitVec 32))) )
))
(declare-fun lt!222070 () SeekEntryResult!3762)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491307 (= res!294251 (or (= lt!222070 (MissingZero!3762 i!1204)) (= lt!222070 (MissingVacant!3762 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31815 0))(
  ( (array!31816 (arr!15295 (Array (_ BitVec 32) (_ BitVec 64))) (size!15659 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31815)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31815 (_ BitVec 32)) SeekEntryResult!3762)

(assert (=> b!491307 (= lt!222070 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491308 () Bool)

(declare-fun e!288696 () Bool)

(assert (=> b!491308 (= e!288699 (not e!288696))))

(declare-fun res!294244 () Bool)

(assert (=> b!491308 (=> res!294244 e!288696)))

(declare-fun lt!222065 () array!31815)

(declare-fun lt!222066 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31815 (_ BitVec 32)) SeekEntryResult!3762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491308 (= res!294244 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15295 a!3235) j!176) mask!3524) (select (arr!15295 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222066 mask!3524) lt!222066 lt!222065 mask!3524))))))

(assert (=> b!491308 (= lt!222066 (select (store (arr!15295 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491308 (= lt!222065 (array!31816 (store (arr!15295 a!3235) i!1204 k0!2280) (size!15659 a!3235)))))

(declare-fun lt!222069 () SeekEntryResult!3762)

(assert (=> b!491308 (= lt!222069 (Found!3762 j!176))))

(assert (=> b!491308 (= lt!222069 (seekEntryOrOpen!0 (select (arr!15295 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31815 (_ BitVec 32)) Bool)

(assert (=> b!491308 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14470 0))(
  ( (Unit!14471) )
))
(declare-fun lt!222067 () Unit!14470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14470)

(assert (=> b!491308 (= lt!222067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491309 () Bool)

(declare-fun res!294243 () Bool)

(assert (=> b!491309 (=> (not res!294243) (not e!288698))))

(assert (=> b!491309 (= res!294243 (and (= (size!15659 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15659 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15659 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491310 () Bool)

(declare-fun res!294245 () Bool)

(assert (=> b!491310 (=> (not res!294245) (not e!288698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491310 (= res!294245 (validKeyInArray!0 (select (arr!15295 a!3235) j!176)))))

(declare-fun b!491312 () Bool)

(declare-fun res!294248 () Bool)

(assert (=> b!491312 (=> (not res!294248) (not e!288699))))

(assert (=> b!491312 (= res!294248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491313 () Bool)

(declare-fun res!294246 () Bool)

(assert (=> b!491313 (=> (not res!294246) (not e!288698))))

(declare-fun arrayContainsKey!0 (array!31815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491313 (= res!294246 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294249 () Bool)

(assert (=> start!44756 (=> (not res!294249) (not e!288698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44756 (= res!294249 (validMask!0 mask!3524))))

(assert (=> start!44756 e!288698))

(assert (=> start!44756 true))

(declare-fun array_inv!11091 (array!31815) Bool)

(assert (=> start!44756 (array_inv!11091 a!3235)))

(declare-fun b!491311 () Bool)

(declare-fun res!294247 () Bool)

(assert (=> b!491311 (=> (not res!294247) (not e!288699))))

(declare-datatypes ((List!9453 0))(
  ( (Nil!9450) (Cons!9449 (h!10311 (_ BitVec 64)) (t!15681 List!9453)) )
))
(declare-fun arrayNoDuplicates!0 (array!31815 (_ BitVec 32) List!9453) Bool)

(assert (=> b!491311 (= res!294247 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9450))))

(declare-fun b!491314 () Bool)

(assert (=> b!491314 (= e!288696 true)))

(assert (=> b!491314 (= lt!222069 (seekEntryOrOpen!0 lt!222066 lt!222065 mask!3524))))

(declare-fun lt!222068 () Unit!14470)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31815 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14470)

(assert (=> b!491314 (= lt!222068 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491315 () Bool)

(declare-fun res!294250 () Bool)

(assert (=> b!491315 (=> (not res!294250) (not e!288698))))

(assert (=> b!491315 (= res!294250 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44756 res!294249) b!491309))

(assert (= (and b!491309 res!294243) b!491310))

(assert (= (and b!491310 res!294245) b!491315))

(assert (= (and b!491315 res!294250) b!491313))

(assert (= (and b!491313 res!294246) b!491307))

(assert (= (and b!491307 res!294251) b!491312))

(assert (= (and b!491312 res!294248) b!491311))

(assert (= (and b!491311 res!294247) b!491308))

(assert (= (and b!491308 (not res!294244)) b!491314))

(declare-fun m!471823 () Bool)

(assert (=> b!491308 m!471823))

(declare-fun m!471825 () Bool)

(assert (=> b!491308 m!471825))

(assert (=> b!491308 m!471823))

(declare-fun m!471827 () Bool)

(assert (=> b!491308 m!471827))

(declare-fun m!471829 () Bool)

(assert (=> b!491308 m!471829))

(declare-fun m!471831 () Bool)

(assert (=> b!491308 m!471831))

(declare-fun m!471833 () Bool)

(assert (=> b!491308 m!471833))

(declare-fun m!471835 () Bool)

(assert (=> b!491308 m!471835))

(declare-fun m!471837 () Bool)

(assert (=> b!491308 m!471837))

(assert (=> b!491308 m!471835))

(assert (=> b!491308 m!471833))

(assert (=> b!491308 m!471835))

(declare-fun m!471839 () Bool)

(assert (=> b!491308 m!471839))

(assert (=> b!491308 m!471835))

(declare-fun m!471841 () Bool)

(assert (=> b!491308 m!471841))

(declare-fun m!471843 () Bool)

(assert (=> b!491307 m!471843))

(declare-fun m!471845 () Bool)

(assert (=> start!44756 m!471845))

(declare-fun m!471847 () Bool)

(assert (=> start!44756 m!471847))

(assert (=> b!491310 m!471835))

(assert (=> b!491310 m!471835))

(declare-fun m!471849 () Bool)

(assert (=> b!491310 m!471849))

(declare-fun m!471851 () Bool)

(assert (=> b!491311 m!471851))

(declare-fun m!471853 () Bool)

(assert (=> b!491315 m!471853))

(declare-fun m!471855 () Bool)

(assert (=> b!491314 m!471855))

(declare-fun m!471857 () Bool)

(assert (=> b!491314 m!471857))

(declare-fun m!471859 () Bool)

(assert (=> b!491312 m!471859))

(declare-fun m!471861 () Bool)

(assert (=> b!491313 m!471861))

(check-sat (not b!491312) (not b!491311) (not b!491307) (not b!491308) (not b!491313) (not b!491310) (not start!44756) (not b!491315) (not b!491314))
(check-sat)
