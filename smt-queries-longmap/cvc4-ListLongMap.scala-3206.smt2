; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44986 () Bool)

(assert start!44986)

(declare-fun b!493436 () Bool)

(declare-fun e!289783 () Bool)

(assert (=> b!493436 (= e!289783 true)))

(declare-datatypes ((SeekEntryResult!3817 0))(
  ( (MissingZero!3817 (index!17447 (_ BitVec 32))) (Found!3817 (index!17448 (_ BitVec 32))) (Intermediate!3817 (undefined!4629 Bool) (index!17449 (_ BitVec 32)) (x!46527 (_ BitVec 32))) (Undefined!3817) (MissingVacant!3817 (index!17450 (_ BitVec 32))) )
))
(declare-fun lt!223173 () SeekEntryResult!3817)

(assert (=> b!493436 (= lt!223173 Undefined!3817)))

(declare-fun b!493437 () Bool)

(declare-fun e!289785 () Bool)

(assert (=> b!493437 (= e!289785 (not e!289783))))

(declare-fun res!296014 () Bool)

(assert (=> b!493437 (=> res!296014 e!289783)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31931 0))(
  ( (array!31932 (arr!15350 (Array (_ BitVec 32) (_ BitVec 64))) (size!15714 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31931)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223172 () SeekEntryResult!3817)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!223171 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31931 (_ BitVec 32)) SeekEntryResult!3817)

(assert (=> b!493437 (= res!296014 (= lt!223172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223171 (select (store (arr!15350 a!3235) i!1204 k!2280) j!176) (array!31932 (store (arr!15350 a!3235) i!1204 k!2280) (size!15714 a!3235)) mask!3524)))))

(declare-fun lt!223174 () (_ BitVec 32))

(assert (=> b!493437 (= lt!223172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223174 (select (arr!15350 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493437 (= lt!223171 (toIndex!0 (select (store (arr!15350 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493437 (= lt!223174 (toIndex!0 (select (arr!15350 a!3235) j!176) mask!3524))))

(assert (=> b!493437 (= lt!223173 (Found!3817 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31931 (_ BitVec 32)) SeekEntryResult!3817)

(assert (=> b!493437 (= lt!223173 (seekEntryOrOpen!0 (select (arr!15350 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31931 (_ BitVec 32)) Bool)

(assert (=> b!493437 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14580 0))(
  ( (Unit!14581) )
))
(declare-fun lt!223169 () Unit!14580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14580)

(assert (=> b!493437 (= lt!223169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493438 () Bool)

(declare-fun res!296012 () Bool)

(declare-fun e!289784 () Bool)

(assert (=> b!493438 (=> (not res!296012) (not e!289784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493438 (= res!296012 (validKeyInArray!0 (select (arr!15350 a!3235) j!176)))))

(declare-fun b!493439 () Bool)

(declare-fun res!296010 () Bool)

(assert (=> b!493439 (=> (not res!296010) (not e!289784))))

(assert (=> b!493439 (= res!296010 (validKeyInArray!0 k!2280))))

(declare-fun res!296013 () Bool)

(assert (=> start!44986 (=> (not res!296013) (not e!289784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44986 (= res!296013 (validMask!0 mask!3524))))

(assert (=> start!44986 e!289784))

(assert (=> start!44986 true))

(declare-fun array_inv!11146 (array!31931) Bool)

(assert (=> start!44986 (array_inv!11146 a!3235)))

(declare-fun b!493440 () Bool)

(assert (=> b!493440 (= e!289784 e!289785)))

(declare-fun res!296009 () Bool)

(assert (=> b!493440 (=> (not res!296009) (not e!289785))))

(declare-fun lt!223170 () SeekEntryResult!3817)

(assert (=> b!493440 (= res!296009 (or (= lt!223170 (MissingZero!3817 i!1204)) (= lt!223170 (MissingVacant!3817 i!1204))))))

(assert (=> b!493440 (= lt!223170 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493441 () Bool)

(declare-fun res!296011 () Bool)

(assert (=> b!493441 (=> res!296011 e!289783)))

(assert (=> b!493441 (= res!296011 (or (not (is-Intermediate!3817 lt!223172)) (not (undefined!4629 lt!223172))))))

(declare-fun b!493442 () Bool)

(declare-fun res!296006 () Bool)

(assert (=> b!493442 (=> (not res!296006) (not e!289785))))

(declare-datatypes ((List!9508 0))(
  ( (Nil!9505) (Cons!9504 (h!10372 (_ BitVec 64)) (t!15736 List!9508)) )
))
(declare-fun arrayNoDuplicates!0 (array!31931 (_ BitVec 32) List!9508) Bool)

(assert (=> b!493442 (= res!296006 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9505))))

(declare-fun b!493443 () Bool)

(declare-fun res!296015 () Bool)

(assert (=> b!493443 (=> (not res!296015) (not e!289785))))

(assert (=> b!493443 (= res!296015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493444 () Bool)

(declare-fun res!296007 () Bool)

(assert (=> b!493444 (=> (not res!296007) (not e!289784))))

(declare-fun arrayContainsKey!0 (array!31931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493444 (= res!296007 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493445 () Bool)

(declare-fun res!296008 () Bool)

(assert (=> b!493445 (=> (not res!296008) (not e!289784))))

(assert (=> b!493445 (= res!296008 (and (= (size!15714 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15714 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15714 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44986 res!296013) b!493445))

(assert (= (and b!493445 res!296008) b!493438))

(assert (= (and b!493438 res!296012) b!493439))

(assert (= (and b!493439 res!296010) b!493444))

(assert (= (and b!493444 res!296007) b!493440))

(assert (= (and b!493440 res!296009) b!493443))

(assert (= (and b!493443 res!296015) b!493442))

(assert (= (and b!493442 res!296006) b!493437))

(assert (= (and b!493437 (not res!296014)) b!493441))

(assert (= (and b!493441 (not res!296011)) b!493436))

(declare-fun m!474279 () Bool)

(assert (=> b!493439 m!474279))

(declare-fun m!474281 () Bool)

(assert (=> b!493440 m!474281))

(declare-fun m!474283 () Bool)

(assert (=> b!493444 m!474283))

(declare-fun m!474285 () Bool)

(assert (=> b!493438 m!474285))

(assert (=> b!493438 m!474285))

(declare-fun m!474287 () Bool)

(assert (=> b!493438 m!474287))

(declare-fun m!474289 () Bool)

(assert (=> start!44986 m!474289))

(declare-fun m!474291 () Bool)

(assert (=> start!44986 m!474291))

(declare-fun m!474293 () Bool)

(assert (=> b!493437 m!474293))

(declare-fun m!474295 () Bool)

(assert (=> b!493437 m!474295))

(declare-fun m!474297 () Bool)

(assert (=> b!493437 m!474297))

(assert (=> b!493437 m!474285))

(declare-fun m!474299 () Bool)

(assert (=> b!493437 m!474299))

(assert (=> b!493437 m!474285))

(declare-fun m!474301 () Bool)

(assert (=> b!493437 m!474301))

(assert (=> b!493437 m!474285))

(declare-fun m!474303 () Bool)

(assert (=> b!493437 m!474303))

(assert (=> b!493437 m!474297))

(declare-fun m!474305 () Bool)

(assert (=> b!493437 m!474305))

(assert (=> b!493437 m!474297))

(declare-fun m!474307 () Bool)

(assert (=> b!493437 m!474307))

(assert (=> b!493437 m!474285))

(declare-fun m!474309 () Bool)

(assert (=> b!493437 m!474309))

(declare-fun m!474311 () Bool)

(assert (=> b!493443 m!474311))

(declare-fun m!474313 () Bool)

(assert (=> b!493442 m!474313))

(push 1)

(assert (not b!493442))

