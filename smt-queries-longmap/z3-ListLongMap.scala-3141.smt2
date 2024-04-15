; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44256 () Bool)

(assert start!44256)

(declare-fun res!290072 () Bool)

(declare-fun e!286358 () Bool)

(assert (=> start!44256 (=> (not res!290072) (not e!286358))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44256 (= res!290072 (validMask!0 mask!3524))))

(assert (=> start!44256 e!286358))

(assert (=> start!44256 true))

(declare-datatypes ((array!31517 0))(
  ( (array!31518 (arr!15152 (Array (_ BitVec 32) (_ BitVec 64))) (size!15517 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31517)

(declare-fun array_inv!11035 (array!31517) Bool)

(assert (=> start!44256 (array_inv!11035 a!3235)))

(declare-fun b!486538 () Bool)

(declare-fun res!290068 () Bool)

(declare-fun e!286359 () Bool)

(assert (=> b!486538 (=> (not res!290068) (not e!286359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31517 (_ BitVec 32)) Bool)

(assert (=> b!486538 (= res!290068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486539 () Bool)

(declare-fun res!290069 () Bool)

(assert (=> b!486539 (=> (not res!290069) (not e!286358))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486539 (= res!290069 (validKeyInArray!0 (select (arr!15152 a!3235) j!176)))))

(declare-fun b!486540 () Bool)

(declare-fun res!290067 () Bool)

(assert (=> b!486540 (=> (not res!290067) (not e!286358))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!486540 (= res!290067 (validKeyInArray!0 k0!2280))))

(declare-fun b!486541 () Bool)

(assert (=> b!486541 (= e!286358 e!286359)))

(declare-fun res!290071 () Bool)

(assert (=> b!486541 (=> (not res!290071) (not e!286359))))

(declare-datatypes ((SeekEntryResult!3616 0))(
  ( (MissingZero!3616 (index!16643 (_ BitVec 32))) (Found!3616 (index!16644 (_ BitVec 32))) (Intermediate!3616 (undefined!4428 Bool) (index!16645 (_ BitVec 32)) (x!45783 (_ BitVec 32))) (Undefined!3616) (MissingVacant!3616 (index!16646 (_ BitVec 32))) )
))
(declare-fun lt!219627 () SeekEntryResult!3616)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486541 (= res!290071 (or (= lt!219627 (MissingZero!3616 i!1204)) (= lt!219627 (MissingVacant!3616 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31517 (_ BitVec 32)) SeekEntryResult!3616)

(assert (=> b!486541 (= lt!219627 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486542 () Bool)

(declare-fun res!290066 () Bool)

(assert (=> b!486542 (=> (not res!290066) (not e!286358))))

(declare-fun arrayContainsKey!0 (array!31517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486542 (= res!290066 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486543 () Bool)

(declare-fun res!290070 () Bool)

(assert (=> b!486543 (=> (not res!290070) (not e!286358))))

(assert (=> b!486543 (= res!290070 (and (= (size!15517 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15517 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15517 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486544 () Bool)

(assert (=> b!486544 (= e!286359 false)))

(declare-fun lt!219628 () Bool)

(declare-datatypes ((List!9349 0))(
  ( (Nil!9346) (Cons!9345 (h!10201 (_ BitVec 64)) (t!15568 List!9349)) )
))
(declare-fun arrayNoDuplicates!0 (array!31517 (_ BitVec 32) List!9349) Bool)

(assert (=> b!486544 (= lt!219628 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9346))))

(assert (= (and start!44256 res!290072) b!486543))

(assert (= (and b!486543 res!290070) b!486539))

(assert (= (and b!486539 res!290069) b!486540))

(assert (= (and b!486540 res!290067) b!486542))

(assert (= (and b!486542 res!290066) b!486541))

(assert (= (and b!486541 res!290071) b!486538))

(assert (= (and b!486538 res!290068) b!486544))

(declare-fun m!465943 () Bool)

(assert (=> b!486541 m!465943))

(declare-fun m!465945 () Bool)

(assert (=> start!44256 m!465945))

(declare-fun m!465947 () Bool)

(assert (=> start!44256 m!465947))

(declare-fun m!465949 () Bool)

(assert (=> b!486540 m!465949))

(declare-fun m!465951 () Bool)

(assert (=> b!486539 m!465951))

(assert (=> b!486539 m!465951))

(declare-fun m!465953 () Bool)

(assert (=> b!486539 m!465953))

(declare-fun m!465955 () Bool)

(assert (=> b!486538 m!465955))

(declare-fun m!465957 () Bool)

(assert (=> b!486544 m!465957))

(declare-fun m!465959 () Bool)

(assert (=> b!486542 m!465959))

(check-sat (not b!486538) (not b!486540) (not b!486539) (not b!486541) (not b!486542) (not b!486544) (not start!44256))
(check-sat)
