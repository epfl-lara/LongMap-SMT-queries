; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68314 () Bool)

(assert start!68314)

(declare-fun res!538167 () Bool)

(declare-fun e!440834 () Bool)

(assert (=> start!68314 (=> (not res!538167) (not e!440834))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68314 (= res!538167 (validMask!0 mask!3266))))

(assert (=> start!68314 e!440834))

(assert (=> start!68314 true))

(declare-datatypes ((array!43104 0))(
  ( (array!43105 (arr!20632 (Array (_ BitVec 32) (_ BitVec 64))) (size!21053 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43104)

(declare-fun array_inv!16428 (array!43104) Bool)

(assert (=> start!68314 (array_inv!16428 a!3170)))

(declare-fun b!793641 () Bool)

(declare-fun res!538165 () Bool)

(declare-fun e!440833 () Bool)

(assert (=> b!793641 (=> (not res!538165) (not e!440833))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793641 (= res!538165 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21053 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20632 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21053 a!3170)) (= (select (arr!20632 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793642 () Bool)

(assert (=> b!793642 (= e!440834 e!440833)))

(declare-fun res!538162 () Bool)

(assert (=> b!793642 (=> (not res!538162) (not e!440833))))

(declare-datatypes ((SeekEntryResult!8223 0))(
  ( (MissingZero!8223 (index!35260 (_ BitVec 32))) (Found!8223 (index!35261 (_ BitVec 32))) (Intermediate!8223 (undefined!9035 Bool) (index!35262 (_ BitVec 32)) (x!66197 (_ BitVec 32))) (Undefined!8223) (MissingVacant!8223 (index!35263 (_ BitVec 32))) )
))
(declare-fun lt!353774 () SeekEntryResult!8223)

(assert (=> b!793642 (= res!538162 (or (= lt!353774 (MissingZero!8223 i!1163)) (= lt!353774 (MissingVacant!8223 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43104 (_ BitVec 32)) SeekEntryResult!8223)

(assert (=> b!793642 (= lt!353774 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793643 () Bool)

(declare-fun res!538164 () Bool)

(assert (=> b!793643 (=> (not res!538164) (not e!440834))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793643 (= res!538164 (validKeyInArray!0 (select (arr!20632 a!3170) j!153)))))

(declare-fun b!793644 () Bool)

(declare-fun res!538160 () Bool)

(assert (=> b!793644 (=> (not res!538160) (not e!440833))))

(declare-datatypes ((List!14595 0))(
  ( (Nil!14592) (Cons!14591 (h!15720 (_ BitVec 64)) (t!20910 List!14595)) )
))
(declare-fun arrayNoDuplicates!0 (array!43104 (_ BitVec 32) List!14595) Bool)

(assert (=> b!793644 (= res!538160 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14592))))

(declare-fun b!793645 () Bool)

(declare-fun e!440832 () Bool)

(assert (=> b!793645 (= e!440833 e!440832)))

(declare-fun res!538163 () Bool)

(assert (=> b!793645 (=> (not res!538163) (not e!440832))))

(declare-fun lt!353772 () array!43104)

(declare-fun lt!353773 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43104 (_ BitVec 32)) SeekEntryResult!8223)

(assert (=> b!793645 (= res!538163 (= (seekEntryOrOpen!0 lt!353773 lt!353772 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353773 lt!353772 mask!3266)))))

(assert (=> b!793645 (= lt!353773 (select (store (arr!20632 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793645 (= lt!353772 (array!43105 (store (arr!20632 a!3170) i!1163 k0!2044) (size!21053 a!3170)))))

(declare-fun b!793646 () Bool)

(declare-fun res!538169 () Bool)

(assert (=> b!793646 (=> (not res!538169) (not e!440834))))

(declare-fun arrayContainsKey!0 (array!43104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793646 (= res!538169 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793647 () Bool)

(declare-fun res!538161 () Bool)

(assert (=> b!793647 (=> (not res!538161) (not e!440834))))

(assert (=> b!793647 (= res!538161 (and (= (size!21053 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21053 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21053 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793648 () Bool)

(assert (=> b!793648 (= e!440832 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!793649 () Bool)

(declare-fun res!538168 () Bool)

(assert (=> b!793649 (=> (not res!538168) (not e!440833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43104 (_ BitVec 32)) Bool)

(assert (=> b!793649 (= res!538168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793650 () Bool)

(declare-fun res!538166 () Bool)

(assert (=> b!793650 (=> (not res!538166) (not e!440834))))

(assert (=> b!793650 (= res!538166 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68314 res!538167) b!793647))

(assert (= (and b!793647 res!538161) b!793643))

(assert (= (and b!793643 res!538164) b!793650))

(assert (= (and b!793650 res!538166) b!793646))

(assert (= (and b!793646 res!538169) b!793642))

(assert (= (and b!793642 res!538162) b!793649))

(assert (= (and b!793649 res!538168) b!793644))

(assert (= (and b!793644 res!538160) b!793641))

(assert (= (and b!793641 res!538165) b!793645))

(assert (= (and b!793645 res!538163) b!793648))

(declare-fun m!734123 () Bool)

(assert (=> b!793643 m!734123))

(assert (=> b!793643 m!734123))

(declare-fun m!734125 () Bool)

(assert (=> b!793643 m!734125))

(declare-fun m!734127 () Bool)

(assert (=> b!793649 m!734127))

(declare-fun m!734129 () Bool)

(assert (=> b!793642 m!734129))

(declare-fun m!734131 () Bool)

(assert (=> b!793650 m!734131))

(declare-fun m!734133 () Bool)

(assert (=> b!793645 m!734133))

(declare-fun m!734135 () Bool)

(assert (=> b!793645 m!734135))

(declare-fun m!734137 () Bool)

(assert (=> b!793645 m!734137))

(declare-fun m!734139 () Bool)

(assert (=> b!793645 m!734139))

(declare-fun m!734141 () Bool)

(assert (=> b!793646 m!734141))

(declare-fun m!734143 () Bool)

(assert (=> b!793644 m!734143))

(declare-fun m!734145 () Bool)

(assert (=> b!793641 m!734145))

(declare-fun m!734147 () Bool)

(assert (=> b!793641 m!734147))

(declare-fun m!734149 () Bool)

(assert (=> start!68314 m!734149))

(declare-fun m!734151 () Bool)

(assert (=> start!68314 m!734151))

(check-sat (not b!793644) (not b!793646) (not b!793649) (not b!793642) (not b!793650) (not start!68314) (not b!793645) (not b!793643))
(check-sat)
