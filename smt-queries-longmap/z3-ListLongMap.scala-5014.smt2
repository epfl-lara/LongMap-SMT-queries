; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68596 () Bool)

(assert start!68596)

(declare-fun b!798110 () Bool)

(declare-fun res!542632 () Bool)

(declare-fun e!442736 () Bool)

(assert (=> b!798110 (=> (not res!542632) (not e!442736))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798110 (= res!542632 (validKeyInArray!0 k0!2044))))

(declare-fun res!542639 () Bool)

(assert (=> start!68596 (=> (not res!542639) (not e!442736))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68596 (= res!542639 (validMask!0 mask!3266))))

(assert (=> start!68596 e!442736))

(assert (=> start!68596 true))

(declare-datatypes ((array!43386 0))(
  ( (array!43387 (arr!20773 (Array (_ BitVec 32) (_ BitVec 64))) (size!21194 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43386)

(declare-fun array_inv!16569 (array!43386) Bool)

(assert (=> start!68596 (array_inv!16569 a!3170)))

(declare-fun b!798111 () Bool)

(declare-fun res!542636 () Bool)

(assert (=> b!798111 (=> (not res!542636) (not e!442736))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798111 (= res!542636 (and (= (size!21194 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21194 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21194 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798112 () Bool)

(declare-fun res!542634 () Bool)

(assert (=> b!798112 (=> (not res!542634) (not e!442736))))

(assert (=> b!798112 (= res!542634 (validKeyInArray!0 (select (arr!20773 a!3170) j!153)))))

(declare-fun b!798113 () Bool)

(declare-fun e!442737 () Bool)

(declare-fun e!442739 () Bool)

(assert (=> b!798113 (= e!442737 e!442739)))

(declare-fun res!542635 () Bool)

(assert (=> b!798113 (=> (not res!542635) (not e!442739))))

(declare-datatypes ((SeekEntryResult!8364 0))(
  ( (MissingZero!8364 (index!35824 (_ BitVec 32))) (Found!8364 (index!35825 (_ BitVec 32))) (Intermediate!8364 (undefined!9176 Bool) (index!35826 (_ BitVec 32)) (x!66714 (_ BitVec 32))) (Undefined!8364) (MissingVacant!8364 (index!35827 (_ BitVec 32))) )
))
(declare-fun lt!356209 () SeekEntryResult!8364)

(declare-fun lt!356206 () SeekEntryResult!8364)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798113 (= res!542635 (and (= lt!356209 lt!356206) (= lt!356206 (Found!8364 j!153)) (= (select (arr!20773 a!3170) index!1236) (select (arr!20773 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43386 (_ BitVec 32)) SeekEntryResult!8364)

(assert (=> b!798113 (= lt!356206 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20773 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43386 (_ BitVec 32)) SeekEntryResult!8364)

(assert (=> b!798113 (= lt!356209 (seekEntryOrOpen!0 (select (arr!20773 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798114 () Bool)

(assert (=> b!798114 (= e!442739 (not true))))

(declare-fun lt!356207 () SeekEntryResult!8364)

(assert (=> b!798114 (= lt!356207 (Found!8364 index!1236))))

(declare-fun b!798115 () Bool)

(declare-fun e!442738 () Bool)

(assert (=> b!798115 (= e!442736 e!442738)))

(declare-fun res!542637 () Bool)

(assert (=> b!798115 (=> (not res!542637) (not e!442738))))

(declare-fun lt!356208 () SeekEntryResult!8364)

(assert (=> b!798115 (= res!542637 (or (= lt!356208 (MissingZero!8364 i!1163)) (= lt!356208 (MissingVacant!8364 i!1163))))))

(assert (=> b!798115 (= lt!356208 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798116 () Bool)

(declare-fun res!542631 () Bool)

(assert (=> b!798116 (=> (not res!542631) (not e!442738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43386 (_ BitVec 32)) Bool)

(assert (=> b!798116 (= res!542631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798117 () Bool)

(declare-fun res!542630 () Bool)

(assert (=> b!798117 (=> (not res!542630) (not e!442738))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!798117 (= res!542630 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21194 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20773 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21194 a!3170)) (= (select (arr!20773 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798118 () Bool)

(assert (=> b!798118 (= e!442738 e!442737)))

(declare-fun res!542638 () Bool)

(assert (=> b!798118 (=> (not res!542638) (not e!442737))))

(declare-fun lt!356205 () SeekEntryResult!8364)

(assert (=> b!798118 (= res!542638 (= lt!356205 lt!356207))))

(declare-fun lt!356210 () array!43386)

(declare-fun lt!356204 () (_ BitVec 64))

(assert (=> b!798118 (= lt!356207 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356204 lt!356210 mask!3266))))

(assert (=> b!798118 (= lt!356205 (seekEntryOrOpen!0 lt!356204 lt!356210 mask!3266))))

(assert (=> b!798118 (= lt!356204 (select (store (arr!20773 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798118 (= lt!356210 (array!43387 (store (arr!20773 a!3170) i!1163 k0!2044) (size!21194 a!3170)))))

(declare-fun b!798119 () Bool)

(declare-fun res!542629 () Bool)

(assert (=> b!798119 (=> (not res!542629) (not e!442738))))

(declare-datatypes ((List!14736 0))(
  ( (Nil!14733) (Cons!14732 (h!15861 (_ BitVec 64)) (t!21051 List!14736)) )
))
(declare-fun arrayNoDuplicates!0 (array!43386 (_ BitVec 32) List!14736) Bool)

(assert (=> b!798119 (= res!542629 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14733))))

(declare-fun b!798120 () Bool)

(declare-fun res!542633 () Bool)

(assert (=> b!798120 (=> (not res!542633) (not e!442736))))

(declare-fun arrayContainsKey!0 (array!43386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798120 (= res!542633 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68596 res!542639) b!798111))

(assert (= (and b!798111 res!542636) b!798112))

(assert (= (and b!798112 res!542634) b!798110))

(assert (= (and b!798110 res!542632) b!798120))

(assert (= (and b!798120 res!542633) b!798115))

(assert (= (and b!798115 res!542637) b!798116))

(assert (= (and b!798116 res!542631) b!798119))

(assert (= (and b!798119 res!542629) b!798117))

(assert (= (and b!798117 res!542630) b!798118))

(assert (= (and b!798118 res!542638) b!798113))

(assert (= (and b!798113 res!542635) b!798114))

(declare-fun m!738995 () Bool)

(assert (=> b!798118 m!738995))

(declare-fun m!738997 () Bool)

(assert (=> b!798118 m!738997))

(declare-fun m!738999 () Bool)

(assert (=> b!798118 m!738999))

(declare-fun m!739001 () Bool)

(assert (=> b!798118 m!739001))

(declare-fun m!739003 () Bool)

(assert (=> b!798117 m!739003))

(declare-fun m!739005 () Bool)

(assert (=> b!798117 m!739005))

(declare-fun m!739007 () Bool)

(assert (=> start!68596 m!739007))

(declare-fun m!739009 () Bool)

(assert (=> start!68596 m!739009))

(declare-fun m!739011 () Bool)

(assert (=> b!798113 m!739011))

(declare-fun m!739013 () Bool)

(assert (=> b!798113 m!739013))

(assert (=> b!798113 m!739013))

(declare-fun m!739015 () Bool)

(assert (=> b!798113 m!739015))

(assert (=> b!798113 m!739013))

(declare-fun m!739017 () Bool)

(assert (=> b!798113 m!739017))

(declare-fun m!739019 () Bool)

(assert (=> b!798115 m!739019))

(declare-fun m!739021 () Bool)

(assert (=> b!798120 m!739021))

(declare-fun m!739023 () Bool)

(assert (=> b!798119 m!739023))

(declare-fun m!739025 () Bool)

(assert (=> b!798110 m!739025))

(declare-fun m!739027 () Bool)

(assert (=> b!798116 m!739027))

(assert (=> b!798112 m!739013))

(assert (=> b!798112 m!739013))

(declare-fun m!739029 () Bool)

(assert (=> b!798112 m!739029))

(check-sat (not b!798118) (not b!798113) (not b!798116) (not b!798119) (not b!798120) (not b!798115) (not start!68596) (not b!798112) (not b!798110))
(check-sat)
