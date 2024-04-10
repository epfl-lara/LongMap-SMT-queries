; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68686 () Bool)

(assert start!68686)

(declare-fun b!799704 () Bool)

(declare-fun res!544225 () Bool)

(declare-fun e!443455 () Bool)

(assert (=> b!799704 (=> (not res!544225) (not e!443455))))

(declare-datatypes ((array!43476 0))(
  ( (array!43477 (arr!20818 (Array (_ BitVec 32) (_ BitVec 64))) (size!21239 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43476)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799704 (= res!544225 (validKeyInArray!0 (select (arr!20818 a!3170) j!153)))))

(declare-fun b!799705 () Bool)

(declare-fun res!544229 () Bool)

(declare-fun e!443452 () Bool)

(assert (=> b!799705 (=> (not res!544229) (not e!443452))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43476 (_ BitVec 32)) Bool)

(assert (=> b!799705 (= res!544229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799706 () Bool)

(declare-fun res!544223 () Bool)

(assert (=> b!799706 (=> (not res!544223) (not e!443455))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!799706 (= res!544223 (validKeyInArray!0 k0!2044))))

(declare-fun b!799707 () Bool)

(assert (=> b!799707 (= e!443455 e!443452)))

(declare-fun res!544228 () Bool)

(assert (=> b!799707 (=> (not res!544228) (not e!443452))))

(declare-datatypes ((SeekEntryResult!8409 0))(
  ( (MissingZero!8409 (index!36004 (_ BitVec 32))) (Found!8409 (index!36005 (_ BitVec 32))) (Intermediate!8409 (undefined!9221 Bool) (index!36006 (_ BitVec 32)) (x!66879 (_ BitVec 32))) (Undefined!8409) (MissingVacant!8409 (index!36007 (_ BitVec 32))) )
))
(declare-fun lt!357155 () SeekEntryResult!8409)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799707 (= res!544228 (or (= lt!357155 (MissingZero!8409 i!1163)) (= lt!357155 (MissingVacant!8409 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43476 (_ BitVec 32)) SeekEntryResult!8409)

(assert (=> b!799707 (= lt!357155 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799708 () Bool)

(declare-fun e!443456 () Bool)

(declare-fun e!443451 () Bool)

(assert (=> b!799708 (= e!443456 e!443451)))

(declare-fun res!544226 () Bool)

(assert (=> b!799708 (=> (not res!544226) (not e!443451))))

(declare-fun lt!357156 () SeekEntryResult!8409)

(declare-fun lt!357158 () SeekEntryResult!8409)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799708 (= res!544226 (and (= lt!357158 lt!357156) (= lt!357156 (Found!8409 j!153)) (not (= (select (arr!20818 a!3170) index!1236) (select (arr!20818 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43476 (_ BitVec 32)) SeekEntryResult!8409)

(assert (=> b!799708 (= lt!357156 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20818 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799708 (= lt!357158 (seekEntryOrOpen!0 (select (arr!20818 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799709 () Bool)

(assert (=> b!799709 (= e!443452 e!443456)))

(declare-fun res!544234 () Bool)

(assert (=> b!799709 (=> (not res!544234) (not e!443456))))

(declare-fun lt!357161 () array!43476)

(declare-fun lt!357154 () SeekEntryResult!8409)

(declare-fun lt!357160 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!799709 (= res!544234 (= lt!357154 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357160 lt!357161 mask!3266)))))

(assert (=> b!799709 (= lt!357154 (seekEntryOrOpen!0 lt!357160 lt!357161 mask!3266))))

(assert (=> b!799709 (= lt!357160 (select (store (arr!20818 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799709 (= lt!357161 (array!43477 (store (arr!20818 a!3170) i!1163 k0!2044) (size!21239 a!3170)))))

(declare-fun b!799710 () Bool)

(declare-fun res!544233 () Bool)

(assert (=> b!799710 (=> (not res!544233) (not e!443452))))

(declare-datatypes ((List!14781 0))(
  ( (Nil!14778) (Cons!14777 (h!15906 (_ BitVec 64)) (t!21096 List!14781)) )
))
(declare-fun arrayNoDuplicates!0 (array!43476 (_ BitVec 32) List!14781) Bool)

(assert (=> b!799710 (= res!544233 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14778))))

(declare-fun b!799711 () Bool)

(declare-fun res!544224 () Bool)

(assert (=> b!799711 (=> (not res!544224) (not e!443455))))

(declare-fun arrayContainsKey!0 (array!43476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799711 (= res!544224 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799712 () Bool)

(declare-fun e!443453 () Bool)

(assert (=> b!799712 (= e!443453 false)))

(declare-fun lt!357157 () SeekEntryResult!8409)

(declare-fun lt!357159 () (_ BitVec 32))

(assert (=> b!799712 (= lt!357157 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357159 vacantBefore!23 (select (arr!20818 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799713 () Bool)

(declare-fun res!544235 () Bool)

(assert (=> b!799713 (=> (not res!544235) (not e!443455))))

(assert (=> b!799713 (= res!544235 (and (= (size!21239 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21239 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21239 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799714 () Bool)

(assert (=> b!799714 (= e!443451 e!443453)))

(declare-fun res!544231 () Bool)

(assert (=> b!799714 (=> (not res!544231) (not e!443453))))

(assert (=> b!799714 (= res!544231 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357159 #b00000000000000000000000000000000) (bvslt lt!357159 (size!21239 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799714 (= lt!357159 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799715 () Bool)

(declare-fun res!544227 () Bool)

(assert (=> b!799715 (=> (not res!544227) (not e!443452))))

(assert (=> b!799715 (= res!544227 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21239 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20818 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21239 a!3170)) (= (select (arr!20818 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!544232 () Bool)

(assert (=> start!68686 (=> (not res!544232) (not e!443455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68686 (= res!544232 (validMask!0 mask!3266))))

(assert (=> start!68686 e!443455))

(assert (=> start!68686 true))

(declare-fun array_inv!16614 (array!43476) Bool)

(assert (=> start!68686 (array_inv!16614 a!3170)))

(declare-fun b!799716 () Bool)

(declare-fun res!544230 () Bool)

(assert (=> b!799716 (=> (not res!544230) (not e!443453))))

(assert (=> b!799716 (= res!544230 (= lt!357154 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357159 vacantAfter!23 lt!357160 lt!357161 mask!3266)))))

(assert (= (and start!68686 res!544232) b!799713))

(assert (= (and b!799713 res!544235) b!799704))

(assert (= (and b!799704 res!544225) b!799706))

(assert (= (and b!799706 res!544223) b!799711))

(assert (= (and b!799711 res!544224) b!799707))

(assert (= (and b!799707 res!544228) b!799705))

(assert (= (and b!799705 res!544229) b!799710))

(assert (= (and b!799710 res!544233) b!799715))

(assert (= (and b!799715 res!544227) b!799709))

(assert (= (and b!799709 res!544234) b!799708))

(assert (= (and b!799708 res!544226) b!799714))

(assert (= (and b!799714 res!544231) b!799716))

(assert (= (and b!799716 res!544230) b!799712))

(declare-fun m!740735 () Bool)

(assert (=> b!799710 m!740735))

(declare-fun m!740737 () Bool)

(assert (=> b!799711 m!740737))

(declare-fun m!740739 () Bool)

(assert (=> b!799715 m!740739))

(declare-fun m!740741 () Bool)

(assert (=> b!799715 m!740741))

(declare-fun m!740743 () Bool)

(assert (=> b!799712 m!740743))

(assert (=> b!799712 m!740743))

(declare-fun m!740745 () Bool)

(assert (=> b!799712 m!740745))

(declare-fun m!740747 () Bool)

(assert (=> b!799706 m!740747))

(assert (=> b!799704 m!740743))

(assert (=> b!799704 m!740743))

(declare-fun m!740749 () Bool)

(assert (=> b!799704 m!740749))

(declare-fun m!740751 () Bool)

(assert (=> b!799705 m!740751))

(declare-fun m!740753 () Bool)

(assert (=> b!799709 m!740753))

(declare-fun m!740755 () Bool)

(assert (=> b!799709 m!740755))

(declare-fun m!740757 () Bool)

(assert (=> b!799709 m!740757))

(declare-fun m!740759 () Bool)

(assert (=> b!799709 m!740759))

(declare-fun m!740761 () Bool)

(assert (=> b!799716 m!740761))

(declare-fun m!740763 () Bool)

(assert (=> b!799707 m!740763))

(declare-fun m!740765 () Bool)

(assert (=> b!799714 m!740765))

(declare-fun m!740767 () Bool)

(assert (=> b!799708 m!740767))

(assert (=> b!799708 m!740743))

(assert (=> b!799708 m!740743))

(declare-fun m!740769 () Bool)

(assert (=> b!799708 m!740769))

(assert (=> b!799708 m!740743))

(declare-fun m!740771 () Bool)

(assert (=> b!799708 m!740771))

(declare-fun m!740773 () Bool)

(assert (=> start!68686 m!740773))

(declare-fun m!740775 () Bool)

(assert (=> start!68686 m!740775))

(check-sat (not b!799705) (not b!799712) (not b!799706) (not b!799711) (not b!799708) (not b!799707) (not b!799709) (not start!68686) (not b!799714) (not b!799710) (not b!799704) (not b!799716))
(check-sat)
