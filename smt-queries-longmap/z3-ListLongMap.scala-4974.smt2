; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68478 () Bool)

(assert start!68478)

(declare-fun b!794854 () Bool)

(declare-fun res!539001 () Bool)

(declare-fun e!441456 () Bool)

(assert (=> b!794854 (=> (not res!539001) (not e!441456))))

(declare-datatypes ((array!43142 0))(
  ( (array!43143 (arr!20647 (Array (_ BitVec 32) (_ BitVec 64))) (size!21067 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43142)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794854 (= res!539001 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!539004 () Bool)

(assert (=> start!68478 (=> (not res!539004) (not e!441456))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68478 (= res!539004 (validMask!0 mask!3266))))

(assert (=> start!68478 e!441456))

(assert (=> start!68478 true))

(declare-fun array_inv!16506 (array!43142) Bool)

(assert (=> start!68478 (array_inv!16506 a!3170)))

(declare-fun b!794855 () Bool)

(declare-fun res!539005 () Bool)

(declare-fun e!441455 () Bool)

(assert (=> b!794855 (=> (not res!539005) (not e!441455))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794855 (= res!539005 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21067 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20647 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21067 a!3170)) (= (select (arr!20647 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794856 () Bool)

(assert (=> b!794856 (= e!441456 e!441455)))

(declare-fun res!539003 () Bool)

(assert (=> b!794856 (=> (not res!539003) (not e!441455))))

(declare-datatypes ((SeekEntryResult!8194 0))(
  ( (MissingZero!8194 (index!35144 (_ BitVec 32))) (Found!8194 (index!35145 (_ BitVec 32))) (Intermediate!8194 (undefined!9006 Bool) (index!35146 (_ BitVec 32)) (x!66235 (_ BitVec 32))) (Undefined!8194) (MissingVacant!8194 (index!35147 (_ BitVec 32))) )
))
(declare-fun lt!354303 () SeekEntryResult!8194)

(assert (=> b!794856 (= res!539003 (or (= lt!354303 (MissingZero!8194 i!1163)) (= lt!354303 (MissingVacant!8194 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43142 (_ BitVec 32)) SeekEntryResult!8194)

(assert (=> b!794856 (= lt!354303 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794857 () Bool)

(assert (=> b!794857 (= e!441455 false)))

(declare-fun lt!354302 () SeekEntryResult!8194)

(declare-fun lt!354301 () array!43142)

(declare-fun lt!354300 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43142 (_ BitVec 32)) SeekEntryResult!8194)

(assert (=> b!794857 (= lt!354302 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354300 lt!354301 mask!3266))))

(declare-fun lt!354304 () SeekEntryResult!8194)

(assert (=> b!794857 (= lt!354304 (seekEntryOrOpen!0 lt!354300 lt!354301 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794857 (= lt!354300 (select (store (arr!20647 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794857 (= lt!354301 (array!43143 (store (arr!20647 a!3170) i!1163 k0!2044) (size!21067 a!3170)))))

(declare-fun b!794858 () Bool)

(declare-fun res!539000 () Bool)

(assert (=> b!794858 (=> (not res!539000) (not e!441456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794858 (= res!539000 (validKeyInArray!0 k0!2044))))

(declare-fun b!794859 () Bool)

(declare-fun res!539002 () Bool)

(assert (=> b!794859 (=> (not res!539002) (not e!441455))))

(declare-datatypes ((List!14517 0))(
  ( (Nil!14514) (Cons!14513 (h!15648 (_ BitVec 64)) (t!20824 List!14517)) )
))
(declare-fun arrayNoDuplicates!0 (array!43142 (_ BitVec 32) List!14517) Bool)

(assert (=> b!794859 (= res!539002 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14514))))

(declare-fun b!794860 () Bool)

(declare-fun res!539007 () Bool)

(assert (=> b!794860 (=> (not res!539007) (not e!441456))))

(assert (=> b!794860 (= res!539007 (validKeyInArray!0 (select (arr!20647 a!3170) j!153)))))

(declare-fun b!794861 () Bool)

(declare-fun res!538999 () Bool)

(assert (=> b!794861 (=> (not res!538999) (not e!441456))))

(assert (=> b!794861 (= res!538999 (and (= (size!21067 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21067 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21067 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794862 () Bool)

(declare-fun res!539006 () Bool)

(assert (=> b!794862 (=> (not res!539006) (not e!441455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43142 (_ BitVec 32)) Bool)

(assert (=> b!794862 (= res!539006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68478 res!539004) b!794861))

(assert (= (and b!794861 res!538999) b!794860))

(assert (= (and b!794860 res!539007) b!794858))

(assert (= (and b!794858 res!539000) b!794854))

(assert (= (and b!794854 res!539001) b!794856))

(assert (= (and b!794856 res!539003) b!794862))

(assert (= (and b!794862 res!539006) b!794859))

(assert (= (and b!794859 res!539002) b!794855))

(assert (= (and b!794855 res!539005) b!794857))

(declare-fun m!735803 () Bool)

(assert (=> b!794859 m!735803))

(declare-fun m!735805 () Bool)

(assert (=> b!794862 m!735805))

(declare-fun m!735807 () Bool)

(assert (=> b!794854 m!735807))

(declare-fun m!735809 () Bool)

(assert (=> b!794856 m!735809))

(declare-fun m!735811 () Bool)

(assert (=> b!794860 m!735811))

(assert (=> b!794860 m!735811))

(declare-fun m!735813 () Bool)

(assert (=> b!794860 m!735813))

(declare-fun m!735815 () Bool)

(assert (=> start!68478 m!735815))

(declare-fun m!735817 () Bool)

(assert (=> start!68478 m!735817))

(declare-fun m!735819 () Bool)

(assert (=> b!794857 m!735819))

(declare-fun m!735821 () Bool)

(assert (=> b!794857 m!735821))

(declare-fun m!735823 () Bool)

(assert (=> b!794857 m!735823))

(declare-fun m!735825 () Bool)

(assert (=> b!794857 m!735825))

(declare-fun m!735827 () Bool)

(assert (=> b!794855 m!735827))

(declare-fun m!735829 () Bool)

(assert (=> b!794855 m!735829))

(declare-fun m!735831 () Bool)

(assert (=> b!794858 m!735831))

(check-sat (not b!794859) (not b!794862) (not start!68478) (not b!794858) (not b!794857) (not b!794854) (not b!794860) (not b!794856))
(check-sat)
