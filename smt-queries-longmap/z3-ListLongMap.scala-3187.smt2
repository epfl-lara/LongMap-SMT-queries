; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44738 () Bool)

(assert start!44738)

(declare-fun b!491138 () Bool)

(declare-fun res!294136 () Bool)

(declare-fun e!288611 () Bool)

(assert (=> b!491138 (=> (not res!294136) (not e!288611))))

(declare-datatypes ((array!31798 0))(
  ( (array!31799 (arr!15286 (Array (_ BitVec 32) (_ BitVec 64))) (size!15650 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31798)

(declare-datatypes ((List!9351 0))(
  ( (Nil!9348) (Cons!9347 (h!10209 (_ BitVec 64)) (t!15571 List!9351)) )
))
(declare-fun arrayNoDuplicates!0 (array!31798 (_ BitVec 32) List!9351) Bool)

(assert (=> b!491138 (= res!294136 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9348))))

(declare-fun res!294130 () Bool)

(declare-fun e!288609 () Bool)

(assert (=> start!44738 (=> (not res!294130) (not e!288609))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44738 (= res!294130 (validMask!0 mask!3524))))

(assert (=> start!44738 e!288609))

(assert (=> start!44738 true))

(declare-fun array_inv!11145 (array!31798) Bool)

(assert (=> start!44738 (array_inv!11145 a!3235)))

(declare-fun b!491139 () Bool)

(declare-fun res!294133 () Bool)

(assert (=> b!491139 (=> (not res!294133) (not e!288609))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491139 (= res!294133 (validKeyInArray!0 (select (arr!15286 a!3235) j!176)))))

(declare-fun b!491140 () Bool)

(declare-fun res!294128 () Bool)

(assert (=> b!491140 (=> (not res!294128) (not e!288609))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491140 (= res!294128 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491141 () Bool)

(declare-fun res!294131 () Bool)

(assert (=> b!491141 (=> (not res!294131) (not e!288611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31798 (_ BitVec 32)) Bool)

(assert (=> b!491141 (= res!294131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491142 () Bool)

(declare-fun res!294129 () Bool)

(assert (=> b!491142 (=> (not res!294129) (not e!288609))))

(assert (=> b!491142 (= res!294129 (validKeyInArray!0 k0!2280))))

(declare-fun b!491143 () Bool)

(declare-fun res!294135 () Bool)

(assert (=> b!491143 (=> (not res!294135) (not e!288609))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491143 (= res!294135 (and (= (size!15650 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15650 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15650 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491144 () Bool)

(assert (=> b!491144 (= e!288609 e!288611)))

(declare-fun res!294132 () Bool)

(assert (=> b!491144 (=> (not res!294132) (not e!288611))))

(declare-datatypes ((SeekEntryResult!3709 0))(
  ( (MissingZero!3709 (index!17015 (_ BitVec 32))) (Found!3709 (index!17016 (_ BitVec 32))) (Intermediate!3709 (undefined!4521 Bool) (index!17017 (_ BitVec 32)) (x!46252 (_ BitVec 32))) (Undefined!3709) (MissingVacant!3709 (index!17018 (_ BitVec 32))) )
))
(declare-fun lt!222006 () SeekEntryResult!3709)

(assert (=> b!491144 (= res!294132 (or (= lt!222006 (MissingZero!3709 i!1204)) (= lt!222006 (MissingVacant!3709 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31798 (_ BitVec 32)) SeekEntryResult!3709)

(assert (=> b!491144 (= lt!222006 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491145 () Bool)

(declare-fun e!288612 () Bool)

(assert (=> b!491145 (= e!288612 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!222005 () SeekEntryResult!3709)

(declare-fun lt!222008 () array!31798)

(declare-fun lt!222007 () (_ BitVec 64))

(assert (=> b!491145 (= lt!222005 (seekEntryOrOpen!0 lt!222007 lt!222008 mask!3524))))

(declare-datatypes ((Unit!14425 0))(
  ( (Unit!14426) )
))
(declare-fun lt!222009 () Unit!14425)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31798 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14425)

(assert (=> b!491145 (= lt!222009 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491146 () Bool)

(assert (=> b!491146 (= e!288611 (not e!288612))))

(declare-fun res!294134 () Bool)

(assert (=> b!491146 (=> res!294134 e!288612)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31798 (_ BitVec 32)) SeekEntryResult!3709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491146 (= res!294134 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15286 a!3235) j!176) mask!3524) (select (arr!15286 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222007 mask!3524) lt!222007 lt!222008 mask!3524))))))

(assert (=> b!491146 (= lt!222007 (select (store (arr!15286 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491146 (= lt!222008 (array!31799 (store (arr!15286 a!3235) i!1204 k0!2280) (size!15650 a!3235)))))

(assert (=> b!491146 (= lt!222005 (Found!3709 j!176))))

(assert (=> b!491146 (= lt!222005 (seekEntryOrOpen!0 (select (arr!15286 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491146 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222010 () Unit!14425)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14425)

(assert (=> b!491146 (= lt!222010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44738 res!294130) b!491143))

(assert (= (and b!491143 res!294135) b!491139))

(assert (= (and b!491139 res!294133) b!491142))

(assert (= (and b!491142 res!294129) b!491140))

(assert (= (and b!491140 res!294128) b!491144))

(assert (= (and b!491144 res!294132) b!491141))

(assert (= (and b!491141 res!294131) b!491138))

(assert (= (and b!491138 res!294136) b!491146))

(assert (= (and b!491146 (not res!294134)) b!491145))

(declare-fun m!471847 () Bool)

(assert (=> b!491142 m!471847))

(declare-fun m!471849 () Bool)

(assert (=> b!491140 m!471849))

(declare-fun m!471851 () Bool)

(assert (=> b!491145 m!471851))

(declare-fun m!471853 () Bool)

(assert (=> b!491145 m!471853))

(declare-fun m!471855 () Bool)

(assert (=> b!491146 m!471855))

(declare-fun m!471857 () Bool)

(assert (=> b!491146 m!471857))

(declare-fun m!471859 () Bool)

(assert (=> b!491146 m!471859))

(declare-fun m!471861 () Bool)

(assert (=> b!491146 m!471861))

(declare-fun m!471863 () Bool)

(assert (=> b!491146 m!471863))

(declare-fun m!471865 () Bool)

(assert (=> b!491146 m!471865))

(declare-fun m!471867 () Bool)

(assert (=> b!491146 m!471867))

(declare-fun m!471869 () Bool)

(assert (=> b!491146 m!471869))

(assert (=> b!491146 m!471863))

(assert (=> b!491146 m!471861))

(assert (=> b!491146 m!471863))

(assert (=> b!491146 m!471867))

(declare-fun m!471871 () Bool)

(assert (=> b!491146 m!471871))

(assert (=> b!491146 m!471863))

(declare-fun m!471873 () Bool)

(assert (=> b!491146 m!471873))

(assert (=> b!491139 m!471863))

(assert (=> b!491139 m!471863))

(declare-fun m!471875 () Bool)

(assert (=> b!491139 m!471875))

(declare-fun m!471877 () Bool)

(assert (=> b!491141 m!471877))

(declare-fun m!471879 () Bool)

(assert (=> b!491144 m!471879))

(declare-fun m!471881 () Bool)

(assert (=> b!491138 m!471881))

(declare-fun m!471883 () Bool)

(assert (=> start!44738 m!471883))

(declare-fun m!471885 () Bool)

(assert (=> start!44738 m!471885))

(check-sat (not b!491145) (not b!491141) (not b!491138) (not b!491144) (not b!491142) (not b!491146) (not b!491139) (not start!44738) (not b!491140))
(check-sat)
