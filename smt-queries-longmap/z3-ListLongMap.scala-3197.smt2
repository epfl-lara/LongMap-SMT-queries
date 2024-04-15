; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44856 () Bool)

(assert start!44856)

(declare-fun b!492058 () Bool)

(declare-fun res!294956 () Bool)

(declare-fun e!289051 () Bool)

(assert (=> b!492058 (=> (not res!294956) (not e!289051))))

(declare-datatypes ((array!31868 0))(
  ( (array!31869 (arr!15320 (Array (_ BitVec 32) (_ BitVec 64))) (size!15685 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31868)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31868 (_ BitVec 32)) Bool)

(assert (=> b!492058 (= res!294956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492059 () Bool)

(declare-fun res!294954 () Bool)

(declare-fun e!289052 () Bool)

(assert (=> b!492059 (=> (not res!294954) (not e!289052))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492059 (= res!294954 (validKeyInArray!0 k0!2280))))

(declare-fun res!294958 () Bool)

(assert (=> start!44856 (=> (not res!294958) (not e!289052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44856 (= res!294958 (validMask!0 mask!3524))))

(assert (=> start!44856 e!289052))

(assert (=> start!44856 true))

(declare-fun array_inv!11203 (array!31868) Bool)

(assert (=> start!44856 (array_inv!11203 a!3235)))

(declare-fun b!492060 () Bool)

(declare-fun res!294953 () Bool)

(assert (=> b!492060 (=> (not res!294953) (not e!289052))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!492060 (= res!294953 (and (= (size!15685 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15685 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15685 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492061 () Bool)

(assert (=> b!492061 (= e!289052 e!289051)))

(declare-fun res!294960 () Bool)

(assert (=> b!492061 (=> (not res!294960) (not e!289051))))

(declare-datatypes ((SeekEntryResult!3784 0))(
  ( (MissingZero!3784 (index!17315 (_ BitVec 32))) (Found!3784 (index!17316 (_ BitVec 32))) (Intermediate!3784 (undefined!4596 Bool) (index!17317 (_ BitVec 32)) (x!46411 (_ BitVec 32))) (Undefined!3784) (MissingVacant!3784 (index!17318 (_ BitVec 32))) )
))
(declare-fun lt!222348 () SeekEntryResult!3784)

(assert (=> b!492061 (= res!294960 (or (= lt!222348 (MissingZero!3784 i!1204)) (= lt!222348 (MissingVacant!3784 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31868 (_ BitVec 32)) SeekEntryResult!3784)

(assert (=> b!492061 (= lt!222348 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492062 () Bool)

(declare-fun res!294955 () Bool)

(assert (=> b!492062 (=> (not res!294955) (not e!289052))))

(declare-fun arrayContainsKey!0 (array!31868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492062 (= res!294955 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492063 () Bool)

(declare-fun res!294961 () Bool)

(assert (=> b!492063 (=> (not res!294961) (not e!289051))))

(declare-datatypes ((List!9517 0))(
  ( (Nil!9514) (Cons!9513 (h!10378 (_ BitVec 64)) (t!15736 List!9517)) )
))
(declare-fun arrayNoDuplicates!0 (array!31868 (_ BitVec 32) List!9517) Bool)

(assert (=> b!492063 (= res!294961 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9514))))

(declare-fun b!492064 () Bool)

(declare-fun e!289053 () Bool)

(assert (=> b!492064 (= e!289053 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!492065 () Bool)

(assert (=> b!492065 (= e!289051 (not e!289053))))

(declare-fun res!294957 () Bool)

(assert (=> b!492065 (=> res!294957 e!289053)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31868 (_ BitVec 32)) SeekEntryResult!3784)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492065 (= res!294957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15320 a!3235) j!176) mask!3524) (select (arr!15320 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15320 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15320 a!3235) i!1204 k0!2280) j!176) (array!31869 (store (arr!15320 a!3235) i!1204 k0!2280) (size!15685 a!3235)) mask!3524)))))

(declare-fun e!289050 () Bool)

(assert (=> b!492065 e!289050))

(declare-fun res!294959 () Bool)

(assert (=> b!492065 (=> (not res!294959) (not e!289050))))

(assert (=> b!492065 (= res!294959 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14500 0))(
  ( (Unit!14501) )
))
(declare-fun lt!222349 () Unit!14500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14500)

(assert (=> b!492065 (= lt!222349 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492066 () Bool)

(declare-fun res!294962 () Bool)

(assert (=> b!492066 (=> (not res!294962) (not e!289052))))

(assert (=> b!492066 (= res!294962 (validKeyInArray!0 (select (arr!15320 a!3235) j!176)))))

(declare-fun b!492067 () Bool)

(assert (=> b!492067 (= e!289050 (= (seekEntryOrOpen!0 (select (arr!15320 a!3235) j!176) a!3235 mask!3524) (Found!3784 j!176)))))

(assert (= (and start!44856 res!294958) b!492060))

(assert (= (and b!492060 res!294953) b!492066))

(assert (= (and b!492066 res!294962) b!492059))

(assert (= (and b!492059 res!294954) b!492062))

(assert (= (and b!492062 res!294955) b!492061))

(assert (= (and b!492061 res!294960) b!492058))

(assert (= (and b!492058 res!294956) b!492063))

(assert (= (and b!492063 res!294961) b!492065))

(assert (= (and b!492065 res!294959) b!492067))

(assert (= (and b!492065 (not res!294957)) b!492064))

(declare-fun m!472279 () Bool)

(assert (=> b!492058 m!472279))

(declare-fun m!472281 () Bool)

(assert (=> b!492062 m!472281))

(declare-fun m!472283 () Bool)

(assert (=> b!492063 m!472283))

(declare-fun m!472285 () Bool)

(assert (=> b!492066 m!472285))

(assert (=> b!492066 m!472285))

(declare-fun m!472287 () Bool)

(assert (=> b!492066 m!472287))

(declare-fun m!472289 () Bool)

(assert (=> b!492059 m!472289))

(assert (=> b!492067 m!472285))

(assert (=> b!492067 m!472285))

(declare-fun m!472291 () Bool)

(assert (=> b!492067 m!472291))

(declare-fun m!472293 () Bool)

(assert (=> b!492065 m!472293))

(declare-fun m!472295 () Bool)

(assert (=> b!492065 m!472295))

(declare-fun m!472297 () Bool)

(assert (=> b!492065 m!472297))

(declare-fun m!472299 () Bool)

(assert (=> b!492065 m!472299))

(assert (=> b!492065 m!472285))

(declare-fun m!472301 () Bool)

(assert (=> b!492065 m!472301))

(assert (=> b!492065 m!472285))

(assert (=> b!492065 m!472299))

(declare-fun m!472303 () Bool)

(assert (=> b!492065 m!472303))

(assert (=> b!492065 m!472297))

(declare-fun m!472305 () Bool)

(assert (=> b!492065 m!472305))

(assert (=> b!492065 m!472285))

(declare-fun m!472307 () Bool)

(assert (=> b!492065 m!472307))

(assert (=> b!492065 m!472297))

(assert (=> b!492065 m!472303))

(declare-fun m!472309 () Bool)

(assert (=> start!44856 m!472309))

(declare-fun m!472311 () Bool)

(assert (=> start!44856 m!472311))

(declare-fun m!472313 () Bool)

(assert (=> b!492061 m!472313))

(check-sat (not start!44856) (not b!492063) (not b!492066) (not b!492059) (not b!492062) (not b!492065) (not b!492067) (not b!492058) (not b!492061))
(check-sat)
