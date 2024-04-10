; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68956 () Bool)

(assert start!68956)

(declare-fun res!548911 () Bool)

(declare-fun e!445633 () Bool)

(assert (=> start!68956 (=> (not res!548911) (not e!445633))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68956 (= res!548911 (validMask!0 mask!3266))))

(assert (=> start!68956 e!445633))

(assert (=> start!68956 true))

(declare-datatypes ((array!43746 0))(
  ( (array!43747 (arr!20953 (Array (_ BitVec 32) (_ BitVec 64))) (size!21374 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43746)

(declare-fun array_inv!16749 (array!43746) Bool)

(assert (=> start!68956 (array_inv!16749 a!3170)))

(declare-fun b!804390 () Bool)

(declare-fun res!548915 () Bool)

(assert (=> b!804390 (=> (not res!548915) (not e!445633))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804390 (= res!548915 (validKeyInArray!0 (select (arr!20953 a!3170) j!153)))))

(declare-fun b!804391 () Bool)

(declare-fun res!548914 () Bool)

(assert (=> b!804391 (=> (not res!548914) (not e!445633))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!804391 (= res!548914 (validKeyInArray!0 k0!2044))))

(declare-fun b!804392 () Bool)

(declare-fun res!548910 () Bool)

(assert (=> b!804392 (=> (not res!548910) (not e!445633))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804392 (= res!548910 (and (= (size!21374 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21374 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21374 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804393 () Bool)

(declare-fun e!445634 () Bool)

(assert (=> b!804393 (= e!445634 false)))

(declare-fun lt!360139 () Bool)

(declare-datatypes ((List!14916 0))(
  ( (Nil!14913) (Cons!14912 (h!16041 (_ BitVec 64)) (t!21231 List!14916)) )
))
(declare-fun arrayNoDuplicates!0 (array!43746 (_ BitVec 32) List!14916) Bool)

(assert (=> b!804393 (= lt!360139 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14913))))

(declare-fun b!804394 () Bool)

(assert (=> b!804394 (= e!445633 e!445634)))

(declare-fun res!548912 () Bool)

(assert (=> b!804394 (=> (not res!548912) (not e!445634))))

(declare-datatypes ((SeekEntryResult!8544 0))(
  ( (MissingZero!8544 (index!36544 (_ BitVec 32))) (Found!8544 (index!36545 (_ BitVec 32))) (Intermediate!8544 (undefined!9356 Bool) (index!36546 (_ BitVec 32)) (x!67374 (_ BitVec 32))) (Undefined!8544) (MissingVacant!8544 (index!36547 (_ BitVec 32))) )
))
(declare-fun lt!360140 () SeekEntryResult!8544)

(assert (=> b!804394 (= res!548912 (or (= lt!360140 (MissingZero!8544 i!1163)) (= lt!360140 (MissingVacant!8544 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43746 (_ BitVec 32)) SeekEntryResult!8544)

(assert (=> b!804394 (= lt!360140 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804395 () Bool)

(declare-fun res!548909 () Bool)

(assert (=> b!804395 (=> (not res!548909) (not e!445633))))

(declare-fun arrayContainsKey!0 (array!43746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804395 (= res!548909 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804396 () Bool)

(declare-fun res!548913 () Bool)

(assert (=> b!804396 (=> (not res!548913) (not e!445634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43746 (_ BitVec 32)) Bool)

(assert (=> b!804396 (= res!548913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68956 res!548911) b!804392))

(assert (= (and b!804392 res!548910) b!804390))

(assert (= (and b!804390 res!548915) b!804391))

(assert (= (and b!804391 res!548914) b!804395))

(assert (= (and b!804395 res!548909) b!804394))

(assert (= (and b!804394 res!548912) b!804396))

(assert (= (and b!804396 res!548913) b!804393))

(declare-fun m!746273 () Bool)

(assert (=> b!804395 m!746273))

(declare-fun m!746275 () Bool)

(assert (=> b!804393 m!746275))

(declare-fun m!746277 () Bool)

(assert (=> b!804390 m!746277))

(assert (=> b!804390 m!746277))

(declare-fun m!746279 () Bool)

(assert (=> b!804390 m!746279))

(declare-fun m!746281 () Bool)

(assert (=> b!804391 m!746281))

(declare-fun m!746283 () Bool)

(assert (=> b!804394 m!746283))

(declare-fun m!746285 () Bool)

(assert (=> b!804396 m!746285))

(declare-fun m!746287 () Bool)

(assert (=> start!68956 m!746287))

(declare-fun m!746289 () Bool)

(assert (=> start!68956 m!746289))

(check-sat (not b!804395) (not b!804394) (not b!804391) (not b!804390) (not start!68956) (not b!804393) (not b!804396))
(check-sat)
