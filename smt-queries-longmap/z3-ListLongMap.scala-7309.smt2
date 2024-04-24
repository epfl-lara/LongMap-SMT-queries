; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93690 () Bool)

(assert start!93690)

(declare-fun b!1059913 () Bool)

(declare-fun res!707684 () Bool)

(declare-fun e!603113 () Bool)

(assert (=> b!1059913 (=> (not res!707684) (not e!603113))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059913 (= res!707684 (validKeyInArray!0 k0!2747))))

(declare-fun b!1059914 () Bool)

(declare-fun e!603115 () Bool)

(assert (=> b!1059914 (= e!603113 e!603115)))

(declare-fun res!707683 () Bool)

(assert (=> b!1059914 (=> (not res!707683) (not e!603115))))

(declare-datatypes ((array!66808 0))(
  ( (array!66809 (arr!32116 (Array (_ BitVec 32) (_ BitVec 64))) (size!32653 (_ BitVec 32))) )
))
(declare-fun lt!467506 () array!66808)

(declare-fun arrayContainsKey!0 (array!66808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059914 (= res!707683 (arrayContainsKey!0 lt!467506 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66808)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1059914 (= lt!467506 (array!66809 (store (arr!32116 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32653 a!3488)))))

(declare-fun b!1059915 () Bool)

(declare-fun res!707687 () Bool)

(assert (=> b!1059915 (=> (not res!707687) (not e!603113))))

(assert (=> b!1059915 (= res!707687 (= (select (arr!32116 a!3488) i!1381) k0!2747))))

(declare-fun res!707682 () Bool)

(assert (=> start!93690 (=> (not res!707682) (not e!603113))))

(assert (=> start!93690 (= res!707682 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32653 a!3488)) (bvslt (size!32653 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93690 e!603113))

(assert (=> start!93690 true))

(declare-fun array_inv!24898 (array!66808) Bool)

(assert (=> start!93690 (array_inv!24898 a!3488)))

(declare-fun b!1059916 () Bool)

(declare-fun e!603114 () Bool)

(assert (=> b!1059916 (= e!603115 e!603114)))

(declare-fun res!707685 () Bool)

(assert (=> b!1059916 (=> (not res!707685) (not e!603114))))

(declare-fun lt!467507 () (_ BitVec 32))

(assert (=> b!1059916 (= res!707685 (not (= lt!467507 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66808 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1059916 (= lt!467507 (arrayScanForKey!0 lt!467506 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1059917 () Bool)

(assert (=> b!1059917 (= e!603114 (not true))))

(assert (=> b!1059917 (= (select (store (arr!32116 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467507) k0!2747)))

(declare-fun b!1059918 () Bool)

(declare-fun res!707686 () Bool)

(assert (=> b!1059918 (=> (not res!707686) (not e!603113))))

(declare-datatypes ((List!22398 0))(
  ( (Nil!22395) (Cons!22394 (h!23612 (_ BitVec 64)) (t!31697 List!22398)) )
))
(declare-fun arrayNoDuplicates!0 (array!66808 (_ BitVec 32) List!22398) Bool)

(assert (=> b!1059918 (= res!707686 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22395))))

(assert (= (and start!93690 res!707682) b!1059918))

(assert (= (and b!1059918 res!707686) b!1059913))

(assert (= (and b!1059913 res!707684) b!1059915))

(assert (= (and b!1059915 res!707687) b!1059914))

(assert (= (and b!1059914 res!707683) b!1059916))

(assert (= (and b!1059916 res!707685) b!1059917))

(declare-fun m!979925 () Bool)

(assert (=> b!1059917 m!979925))

(declare-fun m!979927 () Bool)

(assert (=> b!1059917 m!979927))

(declare-fun m!979929 () Bool)

(assert (=> b!1059913 m!979929))

(declare-fun m!979931 () Bool)

(assert (=> b!1059914 m!979931))

(assert (=> b!1059914 m!979925))

(declare-fun m!979933 () Bool)

(assert (=> start!93690 m!979933))

(declare-fun m!979935 () Bool)

(assert (=> b!1059915 m!979935))

(declare-fun m!979937 () Bool)

(assert (=> b!1059916 m!979937))

(declare-fun m!979939 () Bool)

(assert (=> b!1059918 m!979939))

(check-sat (not b!1059916) (not b!1059918) (not b!1059914) (not b!1059913) (not start!93690))
(check-sat)
