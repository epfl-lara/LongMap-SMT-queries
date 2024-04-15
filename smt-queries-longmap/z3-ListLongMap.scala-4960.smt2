; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68250 () Bool)

(assert start!68250)

(declare-fun b!792851 () Bool)

(declare-fun res!537516 () Bool)

(declare-fun e!440474 () Bool)

(assert (=> b!792851 (=> (not res!537516) (not e!440474))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43057 0))(
  ( (array!43058 (arr!20609 (Array (_ BitVec 32) (_ BitVec 64))) (size!21030 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43057)

(assert (=> b!792851 (= res!537516 (and (= (size!21030 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21030 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21030 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792852 () Bool)

(declare-fun res!537512 () Bool)

(assert (=> b!792852 (=> (not res!537512) (not e!440474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792852 (= res!537512 (validKeyInArray!0 (select (arr!20609 a!3170) j!153)))))

(declare-fun b!792854 () Bool)

(declare-fun res!537514 () Bool)

(assert (=> b!792854 (=> (not res!537514) (not e!440474))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792854 (= res!537514 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792855 () Bool)

(declare-fun e!440475 () Bool)

(assert (=> b!792855 (= e!440475 false)))

(declare-fun lt!353405 () Bool)

(declare-datatypes ((List!14611 0))(
  ( (Nil!14608) (Cons!14607 (h!15736 (_ BitVec 64)) (t!20917 List!14611)) )
))
(declare-fun arrayNoDuplicates!0 (array!43057 (_ BitVec 32) List!14611) Bool)

(assert (=> b!792855 (= lt!353405 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14608))))

(declare-fun b!792856 () Bool)

(declare-fun res!537515 () Bool)

(assert (=> b!792856 (=> (not res!537515) (not e!440474))))

(assert (=> b!792856 (= res!537515 (validKeyInArray!0 k0!2044))))

(declare-fun b!792857 () Bool)

(declare-fun res!537510 () Bool)

(assert (=> b!792857 (=> (not res!537510) (not e!440475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43057 (_ BitVec 32)) Bool)

(assert (=> b!792857 (= res!537510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792853 () Bool)

(assert (=> b!792853 (= e!440474 e!440475)))

(declare-fun res!537513 () Bool)

(assert (=> b!792853 (=> (not res!537513) (not e!440475))))

(declare-datatypes ((SeekEntryResult!8197 0))(
  ( (MissingZero!8197 (index!35156 (_ BitVec 32))) (Found!8197 (index!35157 (_ BitVec 32))) (Intermediate!8197 (undefined!9009 Bool) (index!35158 (_ BitVec 32)) (x!66110 (_ BitVec 32))) (Undefined!8197) (MissingVacant!8197 (index!35159 (_ BitVec 32))) )
))
(declare-fun lt!353404 () SeekEntryResult!8197)

(assert (=> b!792853 (= res!537513 (or (= lt!353404 (MissingZero!8197 i!1163)) (= lt!353404 (MissingVacant!8197 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43057 (_ BitVec 32)) SeekEntryResult!8197)

(assert (=> b!792853 (= lt!353404 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!537511 () Bool)

(assert (=> start!68250 (=> (not res!537511) (not e!440474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68250 (= res!537511 (validMask!0 mask!3266))))

(assert (=> start!68250 e!440474))

(assert (=> start!68250 true))

(declare-fun array_inv!16492 (array!43057) Bool)

(assert (=> start!68250 (array_inv!16492 a!3170)))

(assert (= (and start!68250 res!537511) b!792851))

(assert (= (and b!792851 res!537516) b!792852))

(assert (= (and b!792852 res!537512) b!792856))

(assert (= (and b!792856 res!537515) b!792854))

(assert (= (and b!792854 res!537514) b!792853))

(assert (= (and b!792853 res!537513) b!792857))

(assert (= (and b!792857 res!537510) b!792855))

(declare-fun m!732853 () Bool)

(assert (=> b!792856 m!732853))

(declare-fun m!732855 () Bool)

(assert (=> b!792853 m!732855))

(declare-fun m!732857 () Bool)

(assert (=> b!792852 m!732857))

(assert (=> b!792852 m!732857))

(declare-fun m!732859 () Bool)

(assert (=> b!792852 m!732859))

(declare-fun m!732861 () Bool)

(assert (=> b!792857 m!732861))

(declare-fun m!732863 () Bool)

(assert (=> b!792855 m!732863))

(declare-fun m!732865 () Bool)

(assert (=> b!792854 m!732865))

(declare-fun m!732867 () Bool)

(assert (=> start!68250 m!732867))

(declare-fun m!732869 () Bool)

(assert (=> start!68250 m!732869))

(check-sat (not b!792856) (not start!68250) (not b!792854) (not b!792857) (not b!792855) (not b!792852) (not b!792853))
(check-sat)
