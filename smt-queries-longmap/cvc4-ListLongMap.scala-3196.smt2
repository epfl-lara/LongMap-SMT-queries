; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44866 () Bool)

(assert start!44866)

(declare-fun b!492300 () Bool)

(declare-fun res!295056 () Bool)

(declare-fun e!289211 () Bool)

(assert (=> b!492300 (=> (not res!295056) (not e!289211))))

(declare-datatypes ((array!31868 0))(
  ( (array!31869 (arr!15320 (Array (_ BitVec 32) (_ BitVec 64))) (size!15684 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31868)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492300 (= res!295056 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!295060 () Bool)

(assert (=> start!44866 (=> (not res!295060) (not e!289211))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44866 (= res!295060 (validMask!0 mask!3524))))

(assert (=> start!44866 e!289211))

(assert (=> start!44866 true))

(declare-fun array_inv!11116 (array!31868) Bool)

(assert (=> start!44866 (array_inv!11116 a!3235)))

(declare-fun b!492301 () Bool)

(declare-fun res!295059 () Bool)

(assert (=> b!492301 (=> (not res!295059) (not e!289211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492301 (= res!295059 (validKeyInArray!0 k!2280))))

(declare-fun b!492302 () Bool)

(declare-fun res!295054 () Bool)

(declare-fun e!289209 () Bool)

(assert (=> b!492302 (=> (not res!295054) (not e!289209))))

(declare-datatypes ((List!9478 0))(
  ( (Nil!9475) (Cons!9474 (h!10339 (_ BitVec 64)) (t!15706 List!9478)) )
))
(declare-fun arrayNoDuplicates!0 (array!31868 (_ BitVec 32) List!9478) Bool)

(assert (=> b!492302 (= res!295054 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9475))))

(declare-fun b!492303 () Bool)

(assert (=> b!492303 (= e!289211 e!289209)))

(declare-fun res!295055 () Bool)

(assert (=> b!492303 (=> (not res!295055) (not e!289209))))

(declare-datatypes ((SeekEntryResult!3787 0))(
  ( (MissingZero!3787 (index!17327 (_ BitVec 32))) (Found!3787 (index!17328 (_ BitVec 32))) (Intermediate!3787 (undefined!4599 Bool) (index!17329 (_ BitVec 32)) (x!46411 (_ BitVec 32))) (Undefined!3787) (MissingVacant!3787 (index!17330 (_ BitVec 32))) )
))
(declare-fun lt!222575 () SeekEntryResult!3787)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492303 (= res!295055 (or (= lt!222575 (MissingZero!3787 i!1204)) (= lt!222575 (MissingVacant!3787 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31868 (_ BitVec 32)) SeekEntryResult!3787)

(assert (=> b!492303 (= lt!222575 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492304 () Bool)

(declare-fun res!295053 () Bool)

(assert (=> b!492304 (=> (not res!295053) (not e!289209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31868 (_ BitVec 32)) Bool)

(assert (=> b!492304 (= res!295053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492305 () Bool)

(assert (=> b!492305 (= e!289209 (not true))))

(declare-fun lt!222576 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222573 () SeekEntryResult!3787)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31868 (_ BitVec 32)) SeekEntryResult!3787)

(assert (=> b!492305 (= lt!222573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222576 (select (store (arr!15320 a!3235) i!1204 k!2280) j!176) (array!31869 (store (arr!15320 a!3235) i!1204 k!2280) (size!15684 a!3235)) mask!3524))))

(declare-fun lt!222574 () (_ BitVec 32))

(declare-fun lt!222577 () SeekEntryResult!3787)

(assert (=> b!492305 (= lt!222577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222574 (select (arr!15320 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492305 (= lt!222576 (toIndex!0 (select (store (arr!15320 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!492305 (= lt!222574 (toIndex!0 (select (arr!15320 a!3235) j!176) mask!3524))))

(declare-fun e!289212 () Bool)

(assert (=> b!492305 e!289212))

(declare-fun res!295061 () Bool)

(assert (=> b!492305 (=> (not res!295061) (not e!289212))))

(assert (=> b!492305 (= res!295061 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14520 0))(
  ( (Unit!14521) )
))
(declare-fun lt!222572 () Unit!14520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14520)

(assert (=> b!492305 (= lt!222572 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492306 () Bool)

(assert (=> b!492306 (= e!289212 (= (seekEntryOrOpen!0 (select (arr!15320 a!3235) j!176) a!3235 mask!3524) (Found!3787 j!176)))))

(declare-fun b!492307 () Bool)

(declare-fun res!295057 () Bool)

(assert (=> b!492307 (=> (not res!295057) (not e!289211))))

(assert (=> b!492307 (= res!295057 (and (= (size!15684 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15684 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15684 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492308 () Bool)

(declare-fun res!295058 () Bool)

(assert (=> b!492308 (=> (not res!295058) (not e!289211))))

(assert (=> b!492308 (= res!295058 (validKeyInArray!0 (select (arr!15320 a!3235) j!176)))))

(assert (= (and start!44866 res!295060) b!492307))

(assert (= (and b!492307 res!295057) b!492308))

(assert (= (and b!492308 res!295058) b!492301))

(assert (= (and b!492301 res!295059) b!492300))

(assert (= (and b!492300 res!295056) b!492303))

(assert (= (and b!492303 res!295055) b!492304))

(assert (= (and b!492304 res!295053) b!492302))

(assert (= (and b!492302 res!295054) b!492305))

(assert (= (and b!492305 res!295061) b!492306))

(declare-fun m!472995 () Bool)

(assert (=> b!492308 m!472995))

(assert (=> b!492308 m!472995))

(declare-fun m!472997 () Bool)

(assert (=> b!492308 m!472997))

(declare-fun m!472999 () Bool)

(assert (=> b!492302 m!472999))

(declare-fun m!473001 () Bool)

(assert (=> b!492300 m!473001))

(declare-fun m!473003 () Bool)

(assert (=> b!492304 m!473003))

(declare-fun m!473005 () Bool)

(assert (=> b!492301 m!473005))

(assert (=> b!492305 m!472995))

(declare-fun m!473007 () Bool)

(assert (=> b!492305 m!473007))

(declare-fun m!473009 () Bool)

(assert (=> b!492305 m!473009))

(declare-fun m!473011 () Bool)

(assert (=> b!492305 m!473011))

(declare-fun m!473013 () Bool)

(assert (=> b!492305 m!473013))

(assert (=> b!492305 m!472995))

(declare-fun m!473015 () Bool)

(assert (=> b!492305 m!473015))

(assert (=> b!492305 m!472995))

(declare-fun m!473017 () Bool)

(assert (=> b!492305 m!473017))

(assert (=> b!492305 m!473013))

(declare-fun m!473019 () Bool)

(assert (=> b!492305 m!473019))

(assert (=> b!492305 m!473013))

(declare-fun m!473021 () Bool)

(assert (=> b!492305 m!473021))

(declare-fun m!473023 () Bool)

(assert (=> b!492303 m!473023))

(declare-fun m!473025 () Bool)

(assert (=> start!44866 m!473025))

(declare-fun m!473027 () Bool)

(assert (=> start!44866 m!473027))

(assert (=> b!492306 m!472995))

(assert (=> b!492306 m!472995))

(declare-fun m!473029 () Bool)

(assert (=> b!492306 m!473029))

(push 1)

