; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44244 () Bool)

(assert start!44244)

(declare-fun res!289941 () Bool)

(declare-fun e!286303 () Bool)

(assert (=> start!44244 (=> (not res!289941) (not e!286303))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44244 (= res!289941 (validMask!0 mask!3524))))

(assert (=> start!44244 e!286303))

(assert (=> start!44244 true))

(declare-datatypes ((array!31505 0))(
  ( (array!31506 (arr!15146 (Array (_ BitVec 32) (_ BitVec 64))) (size!15511 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31505)

(declare-fun array_inv!11029 (array!31505) Bool)

(assert (=> start!44244 (array_inv!11029 a!3235)))

(declare-fun b!486412 () Bool)

(declare-fun e!286304 () Bool)

(assert (=> b!486412 (= e!286304 false)))

(declare-fun lt!219591 () Bool)

(declare-datatypes ((List!9343 0))(
  ( (Nil!9340) (Cons!9339 (h!10195 (_ BitVec 64)) (t!15562 List!9343)) )
))
(declare-fun arrayNoDuplicates!0 (array!31505 (_ BitVec 32) List!9343) Bool)

(assert (=> b!486412 (= lt!219591 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9340))))

(declare-fun b!486413 () Bool)

(declare-fun res!289942 () Bool)

(assert (=> b!486413 (=> (not res!289942) (not e!286303))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486413 (= res!289942 (and (= (size!15511 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15511 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15511 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486414 () Bool)

(declare-fun res!289946 () Bool)

(assert (=> b!486414 (=> (not res!289946) (not e!286304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31505 (_ BitVec 32)) Bool)

(assert (=> b!486414 (= res!289946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486415 () Bool)

(declare-fun res!289944 () Bool)

(assert (=> b!486415 (=> (not res!289944) (not e!286303))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486415 (= res!289944 (validKeyInArray!0 k0!2280))))

(declare-fun b!486416 () Bool)

(assert (=> b!486416 (= e!286303 e!286304)))

(declare-fun res!289940 () Bool)

(assert (=> b!486416 (=> (not res!289940) (not e!286304))))

(declare-datatypes ((SeekEntryResult!3610 0))(
  ( (MissingZero!3610 (index!16619 (_ BitVec 32))) (Found!3610 (index!16620 (_ BitVec 32))) (Intermediate!3610 (undefined!4422 Bool) (index!16621 (_ BitVec 32)) (x!45761 (_ BitVec 32))) (Undefined!3610) (MissingVacant!3610 (index!16622 (_ BitVec 32))) )
))
(declare-fun lt!219592 () SeekEntryResult!3610)

(assert (=> b!486416 (= res!289940 (or (= lt!219592 (MissingZero!3610 i!1204)) (= lt!219592 (MissingVacant!3610 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31505 (_ BitVec 32)) SeekEntryResult!3610)

(assert (=> b!486416 (= lt!219592 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486417 () Bool)

(declare-fun res!289943 () Bool)

(assert (=> b!486417 (=> (not res!289943) (not e!286303))))

(declare-fun arrayContainsKey!0 (array!31505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486417 (= res!289943 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486418 () Bool)

(declare-fun res!289945 () Bool)

(assert (=> b!486418 (=> (not res!289945) (not e!286303))))

(assert (=> b!486418 (= res!289945 (validKeyInArray!0 (select (arr!15146 a!3235) j!176)))))

(assert (= (and start!44244 res!289941) b!486413))

(assert (= (and b!486413 res!289942) b!486418))

(assert (= (and b!486418 res!289945) b!486415))

(assert (= (and b!486415 res!289944) b!486417))

(assert (= (and b!486417 res!289943) b!486416))

(assert (= (and b!486416 res!289940) b!486414))

(assert (= (and b!486414 res!289946) b!486412))

(declare-fun m!465835 () Bool)

(assert (=> b!486415 m!465835))

(declare-fun m!465837 () Bool)

(assert (=> b!486416 m!465837))

(declare-fun m!465839 () Bool)

(assert (=> b!486414 m!465839))

(declare-fun m!465841 () Bool)

(assert (=> start!44244 m!465841))

(declare-fun m!465843 () Bool)

(assert (=> start!44244 m!465843))

(declare-fun m!465845 () Bool)

(assert (=> b!486418 m!465845))

(assert (=> b!486418 m!465845))

(declare-fun m!465847 () Bool)

(assert (=> b!486418 m!465847))

(declare-fun m!465849 () Bool)

(assert (=> b!486417 m!465849))

(declare-fun m!465851 () Bool)

(assert (=> b!486412 m!465851))

(check-sat (not b!486417) (not b!486418) (not start!44244) (not b!486416) (not b!486415) (not b!486414) (not b!486412))
(check-sat)
