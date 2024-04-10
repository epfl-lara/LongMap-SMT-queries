; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44998 () Bool)

(assert start!44998)

(declare-fun b!493616 () Bool)

(declare-fun res!296194 () Bool)

(declare-fun e!289855 () Bool)

(assert (=> b!493616 (=> (not res!296194) (not e!289855))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31943 0))(
  ( (array!31944 (arr!15356 (Array (_ BitVec 32) (_ BitVec 64))) (size!15720 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31943)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493616 (= res!296194 (and (= (size!15720 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15720 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15720 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493617 () Bool)

(declare-fun e!289856 () Bool)

(declare-fun e!289857 () Bool)

(assert (=> b!493617 (= e!289856 (not e!289857))))

(declare-fun res!296187 () Bool)

(assert (=> b!493617 (=> res!296187 e!289857)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3823 0))(
  ( (MissingZero!3823 (index!17471 (_ BitVec 32))) (Found!3823 (index!17472 (_ BitVec 32))) (Intermediate!3823 (undefined!4635 Bool) (index!17473 (_ BitVec 32)) (x!46549 (_ BitVec 32))) (Undefined!3823) (MissingVacant!3823 (index!17474 (_ BitVec 32))) )
))
(declare-fun lt!223281 () SeekEntryResult!3823)

(declare-fun lt!223282 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31943 (_ BitVec 32)) SeekEntryResult!3823)

(assert (=> b!493617 (= res!296187 (= lt!223281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223282 (select (store (arr!15356 a!3235) i!1204 k!2280) j!176) (array!31944 (store (arr!15356 a!3235) i!1204 k!2280) (size!15720 a!3235)) mask!3524)))))

(declare-fun lt!223277 () (_ BitVec 32))

(assert (=> b!493617 (= lt!223281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223277 (select (arr!15356 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493617 (= lt!223282 (toIndex!0 (select (store (arr!15356 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493617 (= lt!223277 (toIndex!0 (select (arr!15356 a!3235) j!176) mask!3524))))

(declare-fun lt!223278 () SeekEntryResult!3823)

(assert (=> b!493617 (= lt!223278 (Found!3823 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31943 (_ BitVec 32)) SeekEntryResult!3823)

(assert (=> b!493617 (= lt!223278 (seekEntryOrOpen!0 (select (arr!15356 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31943 (_ BitVec 32)) Bool)

(assert (=> b!493617 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14592 0))(
  ( (Unit!14593) )
))
(declare-fun lt!223279 () Unit!14592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14592)

(assert (=> b!493617 (= lt!223279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493619 () Bool)

(declare-fun res!296186 () Bool)

(assert (=> b!493619 (=> (not res!296186) (not e!289856))))

(assert (=> b!493619 (= res!296186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493620 () Bool)

(assert (=> b!493620 (= e!289857 true)))

(assert (=> b!493620 (= lt!223278 Undefined!3823)))

(declare-fun b!493621 () Bool)

(declare-fun res!296192 () Bool)

(assert (=> b!493621 (=> (not res!296192) (not e!289855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493621 (= res!296192 (validKeyInArray!0 k!2280))))

(declare-fun b!493622 () Bool)

(declare-fun res!296189 () Bool)

(assert (=> b!493622 (=> (not res!296189) (not e!289855))))

(assert (=> b!493622 (= res!296189 (validKeyInArray!0 (select (arr!15356 a!3235) j!176)))))

(declare-fun b!493623 () Bool)

(declare-fun res!296191 () Bool)

(assert (=> b!493623 (=> (not res!296191) (not e!289856))))

(declare-datatypes ((List!9514 0))(
  ( (Nil!9511) (Cons!9510 (h!10378 (_ BitVec 64)) (t!15742 List!9514)) )
))
(declare-fun arrayNoDuplicates!0 (array!31943 (_ BitVec 32) List!9514) Bool)

(assert (=> b!493623 (= res!296191 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9511))))

(declare-fun b!493624 () Bool)

(assert (=> b!493624 (= e!289855 e!289856)))

(declare-fun res!296193 () Bool)

(assert (=> b!493624 (=> (not res!296193) (not e!289856))))

(declare-fun lt!223280 () SeekEntryResult!3823)

(assert (=> b!493624 (= res!296193 (or (= lt!223280 (MissingZero!3823 i!1204)) (= lt!223280 (MissingVacant!3823 i!1204))))))

(assert (=> b!493624 (= lt!223280 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493625 () Bool)

(declare-fun res!296188 () Bool)

(assert (=> b!493625 (=> res!296188 e!289857)))

(assert (=> b!493625 (= res!296188 (or (not (is-Intermediate!3823 lt!223281)) (not (undefined!4635 lt!223281))))))

(declare-fun res!296195 () Bool)

(assert (=> start!44998 (=> (not res!296195) (not e!289855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44998 (= res!296195 (validMask!0 mask!3524))))

(assert (=> start!44998 e!289855))

(assert (=> start!44998 true))

(declare-fun array_inv!11152 (array!31943) Bool)

(assert (=> start!44998 (array_inv!11152 a!3235)))

(declare-fun b!493618 () Bool)

(declare-fun res!296190 () Bool)

(assert (=> b!493618 (=> (not res!296190) (not e!289855))))

(declare-fun arrayContainsKey!0 (array!31943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493618 (= res!296190 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44998 res!296195) b!493616))

(assert (= (and b!493616 res!296194) b!493622))

(assert (= (and b!493622 res!296189) b!493621))

(assert (= (and b!493621 res!296192) b!493618))

(assert (= (and b!493618 res!296190) b!493624))

(assert (= (and b!493624 res!296193) b!493619))

(assert (= (and b!493619 res!296186) b!493623))

(assert (= (and b!493623 res!296191) b!493617))

(assert (= (and b!493617 (not res!296187)) b!493625))

(assert (= (and b!493625 (not res!296188)) b!493620))

(declare-fun m!474495 () Bool)

(assert (=> b!493619 m!474495))

(declare-fun m!474497 () Bool)

(assert (=> b!493618 m!474497))

(declare-fun m!474499 () Bool)

(assert (=> start!44998 m!474499))

(declare-fun m!474501 () Bool)

(assert (=> start!44998 m!474501))

(declare-fun m!474503 () Bool)

(assert (=> b!493624 m!474503))

(declare-fun m!474505 () Bool)

(assert (=> b!493622 m!474505))

(assert (=> b!493622 m!474505))

(declare-fun m!474507 () Bool)

(assert (=> b!493622 m!474507))

(declare-fun m!474509 () Bool)

(assert (=> b!493623 m!474509))

(declare-fun m!474511 () Bool)

(assert (=> b!493621 m!474511))

(declare-fun m!474513 () Bool)

(assert (=> b!493617 m!474513))

(declare-fun m!474515 () Bool)

(assert (=> b!493617 m!474515))

(declare-fun m!474517 () Bool)

(assert (=> b!493617 m!474517))

(assert (=> b!493617 m!474505))

(declare-fun m!474519 () Bool)

(assert (=> b!493617 m!474519))

(assert (=> b!493617 m!474517))

(declare-fun m!474521 () Bool)

(assert (=> b!493617 m!474521))

(declare-fun m!474523 () Bool)

(assert (=> b!493617 m!474523))

(assert (=> b!493617 m!474505))

(declare-fun m!474525 () Bool)

(assert (=> b!493617 m!474525))

(assert (=> b!493617 m!474517))

(declare-fun m!474527 () Bool)

(assert (=> b!493617 m!474527))

(assert (=> b!493617 m!474505))

(declare-fun m!474529 () Bool)

(assert (=> b!493617 m!474529))

(assert (=> b!493617 m!474505))

(push 1)

(assert (not b!493619))

(assert (not b!493618))

(assert (not start!44998))

