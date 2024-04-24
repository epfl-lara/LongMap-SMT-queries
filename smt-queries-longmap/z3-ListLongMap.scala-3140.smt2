; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44252 () Bool)

(assert start!44252)

(declare-fun b!486685 () Bool)

(declare-fun res!290127 () Bool)

(declare-fun e!286466 () Bool)

(assert (=> b!486685 (=> (not res!290127) (not e!286466))))

(declare-datatypes ((array!31504 0))(
  ( (array!31505 (arr!15145 (Array (_ BitVec 32) (_ BitVec 64))) (size!15509 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31504)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486685 (= res!290127 (validKeyInArray!0 (select (arr!15145 a!3235) j!176)))))

(declare-fun res!290130 () Bool)

(assert (=> start!44252 (=> (not res!290130) (not e!286466))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44252 (= res!290130 (validMask!0 mask!3524))))

(assert (=> start!44252 e!286466))

(assert (=> start!44252 true))

(declare-fun array_inv!11004 (array!31504) Bool)

(assert (=> start!44252 (array_inv!11004 a!3235)))

(declare-fun b!486686 () Bool)

(declare-fun e!286465 () Bool)

(assert (=> b!486686 (= e!286466 e!286465)))

(declare-fun res!290129 () Bool)

(assert (=> b!486686 (=> (not res!290129) (not e!286465))))

(declare-datatypes ((SeekEntryResult!3568 0))(
  ( (MissingZero!3568 (index!16451 (_ BitVec 32))) (Found!3568 (index!16452 (_ BitVec 32))) (Intermediate!3568 (undefined!4380 Bool) (index!16453 (_ BitVec 32)) (x!45729 (_ BitVec 32))) (Undefined!3568) (MissingVacant!3568 (index!16454 (_ BitVec 32))) )
))
(declare-fun lt!219856 () SeekEntryResult!3568)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486686 (= res!290129 (or (= lt!219856 (MissingZero!3568 i!1204)) (= lt!219856 (MissingVacant!3568 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31504 (_ BitVec 32)) SeekEntryResult!3568)

(assert (=> b!486686 (= lt!219856 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486687 () Bool)

(declare-fun res!290131 () Bool)

(assert (=> b!486687 (=> (not res!290131) (not e!286466))))

(declare-fun arrayContainsKey!0 (array!31504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486687 (= res!290131 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486688 () Bool)

(declare-fun res!290126 () Bool)

(assert (=> b!486688 (=> (not res!290126) (not e!286465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31504 (_ BitVec 32)) Bool)

(assert (=> b!486688 (= res!290126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486689 () Bool)

(declare-fun res!290125 () Bool)

(assert (=> b!486689 (=> (not res!290125) (not e!286466))))

(assert (=> b!486689 (= res!290125 (and (= (size!15509 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15509 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15509 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486690 () Bool)

(assert (=> b!486690 (= e!286465 false)))

(declare-fun lt!219855 () Bool)

(declare-datatypes ((List!9210 0))(
  ( (Nil!9207) (Cons!9206 (h!10062 (_ BitVec 64)) (t!15430 List!9210)) )
))
(declare-fun arrayNoDuplicates!0 (array!31504 (_ BitVec 32) List!9210) Bool)

(assert (=> b!486690 (= lt!219855 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9207))))

(declare-fun b!486691 () Bool)

(declare-fun res!290128 () Bool)

(assert (=> b!486691 (=> (not res!290128) (not e!286466))))

(assert (=> b!486691 (= res!290128 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44252 res!290130) b!486689))

(assert (= (and b!486689 res!290125) b!486685))

(assert (= (and b!486685 res!290127) b!486691))

(assert (= (and b!486691 res!290128) b!486687))

(assert (= (and b!486687 res!290131) b!486686))

(assert (= (and b!486686 res!290129) b!486688))

(assert (= (and b!486688 res!290126) b!486690))

(declare-fun m!466825 () Bool)

(assert (=> b!486688 m!466825))

(declare-fun m!466827 () Bool)

(assert (=> b!486686 m!466827))

(declare-fun m!466829 () Bool)

(assert (=> b!486685 m!466829))

(assert (=> b!486685 m!466829))

(declare-fun m!466831 () Bool)

(assert (=> b!486685 m!466831))

(declare-fun m!466833 () Bool)

(assert (=> start!44252 m!466833))

(declare-fun m!466835 () Bool)

(assert (=> start!44252 m!466835))

(declare-fun m!466837 () Bool)

(assert (=> b!486691 m!466837))

(declare-fun m!466839 () Bool)

(assert (=> b!486690 m!466839))

(declare-fun m!466841 () Bool)

(assert (=> b!486687 m!466841))

(check-sat (not b!486690) (not b!486685) (not b!486686) (not b!486687) (not start!44252) (not b!486688) (not b!486691))
(check-sat)
