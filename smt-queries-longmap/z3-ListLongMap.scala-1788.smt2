; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32414 () Bool)

(assert start!32414)

(declare-fun b!323601 () Bool)

(declare-datatypes ((Unit!10031 0))(
  ( (Unit!10032) )
))
(declare-fun e!199921 () Unit!10031)

(declare-fun Unit!10033 () Unit!10031)

(assert (=> b!323601 (= e!199921 Unit!10033)))

(declare-fun b!323602 () Bool)

(declare-fun e!199923 () Bool)

(declare-fun e!199920 () Bool)

(assert (=> b!323602 (= e!199923 e!199920)))

(declare-fun res!177128 () Bool)

(assert (=> b!323602 (=> (not res!177128) (not e!199920))))

(declare-datatypes ((array!16557 0))(
  ( (array!16558 (arr!7836 (Array (_ BitVec 32) (_ BitVec 64))) (size!8189 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16557)

(declare-datatypes ((SeekEntryResult!2966 0))(
  ( (MissingZero!2966 (index!14040 (_ BitVec 32))) (Found!2966 (index!14041 (_ BitVec 32))) (Intermediate!2966 (undefined!3778 Bool) (index!14042 (_ BitVec 32)) (x!32309 (_ BitVec 32))) (Undefined!2966) (MissingVacant!2966 (index!14043 (_ BitVec 32))) )
))
(declare-fun lt!156483 () SeekEntryResult!2966)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16557 (_ BitVec 32)) SeekEntryResult!2966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323602 (= res!177128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156483))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323602 (= lt!156483 (Intermediate!2966 false resIndex!58 resX!58))))

(declare-fun b!323603 () Bool)

(assert (=> b!323603 false))

(declare-fun e!199922 () Unit!10031)

(declare-fun Unit!10034 () Unit!10031)

(assert (=> b!323603 (= e!199922 Unit!10034)))

(declare-fun b!323604 () Bool)

(declare-fun res!177121 () Bool)

(assert (=> b!323604 (=> (not res!177121) (not e!199923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323604 (= res!177121 (validKeyInArray!0 k0!2497))))

(declare-fun b!323605 () Bool)

(declare-fun res!177126 () Bool)

(assert (=> b!323605 (=> (not res!177126) (not e!199920))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323605 (= res!177126 (and (= (select (arr!7836 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8189 a!3305))))))

(declare-fun res!177127 () Bool)

(assert (=> start!32414 (=> (not res!177127) (not e!199923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32414 (= res!177127 (validMask!0 mask!3777))))

(assert (=> start!32414 e!199923))

(declare-fun array_inv!5808 (array!16557) Bool)

(assert (=> start!32414 (array_inv!5808 a!3305)))

(assert (=> start!32414 true))

(declare-fun b!323606 () Bool)

(declare-fun e!199925 () Unit!10031)

(declare-fun Unit!10035 () Unit!10031)

(assert (=> b!323606 (= e!199925 Unit!10035)))

(assert (=> b!323606 false))

(declare-fun b!323607 () Bool)

(declare-fun res!177122 () Bool)

(assert (=> b!323607 (=> (not res!177122) (not e!199923))))

(assert (=> b!323607 (= res!177122 (and (= (size!8189 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8189 a!3305))))))

(declare-fun b!323608 () Bool)

(declare-fun res!177125 () Bool)

(assert (=> b!323608 (=> (not res!177125) (not e!199920))))

(assert (=> b!323608 (= res!177125 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156483))))

(declare-fun b!323609 () Bool)

(assert (=> b!323609 (= e!199920 (not true))))

(assert (=> b!323609 (= index!1840 resIndex!58)))

(declare-fun lt!156484 () Unit!10031)

(assert (=> b!323609 (= lt!156484 e!199921)))

(declare-fun c!50870 () Bool)

(assert (=> b!323609 (= c!50870 (not (= resIndex!58 index!1840)))))

(declare-fun b!323610 () Bool)

(declare-fun res!177120 () Bool)

(assert (=> b!323610 (=> (not res!177120) (not e!199923))))

(declare-fun arrayContainsKey!0 (array!16557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323610 (= res!177120 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323611 () Bool)

(declare-fun Unit!10036 () Unit!10031)

(assert (=> b!323611 (= e!199925 Unit!10036)))

(declare-fun b!323612 () Bool)

(declare-fun res!177123 () Bool)

(assert (=> b!323612 (=> (not res!177123) (not e!199923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16557 (_ BitVec 32)) Bool)

(assert (=> b!323612 (= res!177123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323613 () Bool)

(declare-fun res!177124 () Bool)

(assert (=> b!323613 (=> (not res!177124) (not e!199923))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16557 (_ BitVec 32)) SeekEntryResult!2966)

(assert (=> b!323613 (= res!177124 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2966 i!1250)))))

(declare-fun b!323614 () Bool)

(assert (=> b!323614 false))

(declare-fun lt!156485 () Unit!10031)

(assert (=> b!323614 (= lt!156485 e!199925)))

(declare-fun c!50868 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323614 (= c!50868 ((_ is Intermediate!2966) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10037 () Unit!10031)

(assert (=> b!323614 (= e!199922 Unit!10037)))

(declare-fun b!323615 () Bool)

(assert (=> b!323615 (= e!199921 e!199922)))

(declare-fun c!50869 () Bool)

(assert (=> b!323615 (= c!50869 (or (= (select (arr!7836 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7836 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323616 () Bool)

(declare-fun res!177129 () Bool)

(assert (=> b!323616 (=> (not res!177129) (not e!199920))))

(assert (=> b!323616 (= res!177129 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7836 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(assert (= (and start!32414 res!177127) b!323607))

(assert (= (and b!323607 res!177122) b!323604))

(assert (= (and b!323604 res!177121) b!323610))

(assert (= (and b!323610 res!177120) b!323613))

(assert (= (and b!323613 res!177124) b!323612))

(assert (= (and b!323612 res!177123) b!323602))

(assert (= (and b!323602 res!177128) b!323605))

(assert (= (and b!323605 res!177126) b!323608))

(assert (= (and b!323608 res!177125) b!323616))

(assert (= (and b!323616 res!177129) b!323609))

(assert (= (and b!323609 c!50870) b!323615))

(assert (= (and b!323609 (not c!50870)) b!323601))

(assert (= (and b!323615 c!50869) b!323603))

(assert (= (and b!323615 (not c!50869)) b!323614))

(assert (= (and b!323614 c!50868) b!323611))

(assert (= (and b!323614 (not c!50868)) b!323606))

(declare-fun m!330325 () Bool)

(assert (=> b!323615 m!330325))

(declare-fun m!330327 () Bool)

(assert (=> b!323614 m!330327))

(assert (=> b!323614 m!330327))

(declare-fun m!330329 () Bool)

(assert (=> b!323614 m!330329))

(declare-fun m!330331 () Bool)

(assert (=> b!323608 m!330331))

(declare-fun m!330333 () Bool)

(assert (=> b!323602 m!330333))

(assert (=> b!323602 m!330333))

(declare-fun m!330335 () Bool)

(assert (=> b!323602 m!330335))

(declare-fun m!330337 () Bool)

(assert (=> b!323604 m!330337))

(declare-fun m!330339 () Bool)

(assert (=> b!323610 m!330339))

(assert (=> b!323616 m!330325))

(declare-fun m!330341 () Bool)

(assert (=> b!323605 m!330341))

(declare-fun m!330343 () Bool)

(assert (=> b!323613 m!330343))

(declare-fun m!330345 () Bool)

(assert (=> b!323612 m!330345))

(declare-fun m!330347 () Bool)

(assert (=> start!32414 m!330347))

(declare-fun m!330349 () Bool)

(assert (=> start!32414 m!330349))

(check-sat (not b!323613) (not b!323608) (not b!323612) (not b!323604) (not b!323602) (not b!323610) (not b!323614) (not start!32414))
(check-sat)
