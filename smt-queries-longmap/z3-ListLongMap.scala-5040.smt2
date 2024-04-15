; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68730 () Bool)

(assert start!68730)

(declare-fun b!800702 () Bool)

(declare-fun res!545373 () Bool)

(declare-fun e!443874 () Bool)

(assert (=> b!800702 (=> (not res!545373) (not e!443874))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800702 (= res!545373 (validKeyInArray!0 k0!2044))))

(declare-fun b!800703 () Bool)

(declare-fun e!443873 () Bool)

(declare-fun e!443875 () Bool)

(assert (=> b!800703 (= e!443873 e!443875)))

(declare-fun res!545363 () Bool)

(assert (=> b!800703 (=> (not res!545363) (not e!443875))))

(declare-datatypes ((SeekEntryResult!8437 0))(
  ( (MissingZero!8437 (index!36116 (_ BitVec 32))) (Found!8437 (index!36117 (_ BitVec 32))) (Intermediate!8437 (undefined!9249 Bool) (index!36118 (_ BitVec 32)) (x!66990 (_ BitVec 32))) (Undefined!8437) (MissingVacant!8437 (index!36119 (_ BitVec 32))) )
))
(declare-fun lt!357689 () SeekEntryResult!8437)

(declare-fun lt!357683 () SeekEntryResult!8437)

(declare-datatypes ((array!43537 0))(
  ( (array!43538 (arr!20849 (Array (_ BitVec 32) (_ BitVec 64))) (size!21270 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43537)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800703 (= res!545363 (and (= lt!357683 lt!357689) (= lt!357689 (Found!8437 j!153)) (not (= (select (arr!20849 a!3170) index!1236) (select (arr!20849 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43537 (_ BitVec 32)) SeekEntryResult!8437)

(assert (=> b!800703 (= lt!357689 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20849 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43537 (_ BitVec 32)) SeekEntryResult!8437)

(assert (=> b!800703 (= lt!357683 (seekEntryOrOpen!0 (select (arr!20849 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800704 () Bool)

(declare-fun e!443876 () Bool)

(assert (=> b!800704 (= e!443874 e!443876)))

(declare-fun res!545362 () Bool)

(assert (=> b!800704 (=> (not res!545362) (not e!443876))))

(declare-fun lt!357687 () SeekEntryResult!8437)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800704 (= res!545362 (or (= lt!357687 (MissingZero!8437 i!1163)) (= lt!357687 (MissingVacant!8437 i!1163))))))

(assert (=> b!800704 (= lt!357687 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800705 () Bool)

(declare-fun res!545371 () Bool)

(assert (=> b!800705 (=> (not res!545371) (not e!443874))))

(assert (=> b!800705 (= res!545371 (and (= (size!21270 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21270 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21270 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800706 () Bool)

(declare-fun res!545369 () Bool)

(assert (=> b!800706 (=> (not res!545369) (not e!443876))))

(declare-datatypes ((List!14851 0))(
  ( (Nil!14848) (Cons!14847 (h!15976 (_ BitVec 64)) (t!21157 List!14851)) )
))
(declare-fun arrayNoDuplicates!0 (array!43537 (_ BitVec 32) List!14851) Bool)

(assert (=> b!800706 (= res!545369 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14848))))

(declare-fun b!800707 () Bool)

(declare-fun res!545370 () Bool)

(assert (=> b!800707 (=> (not res!545370) (not e!443876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43537 (_ BitVec 32)) Bool)

(assert (=> b!800707 (= res!545370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800708 () Bool)

(declare-fun e!443877 () Bool)

(assert (=> b!800708 (= e!443875 e!443877)))

(declare-fun res!545368 () Bool)

(assert (=> b!800708 (=> (not res!545368) (not e!443877))))

(declare-fun lt!357688 () (_ BitVec 32))

(assert (=> b!800708 (= res!545368 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357688 #b00000000000000000000000000000000) (bvslt lt!357688 (size!21270 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800708 (= lt!357688 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800710 () Bool)

(assert (=> b!800710 (= e!443877 false)))

(declare-fun lt!357686 () SeekEntryResult!8437)

(assert (=> b!800710 (= lt!357686 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357688 vacantBefore!23 (select (arr!20849 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800711 () Bool)

(assert (=> b!800711 (= e!443876 e!443873)))

(declare-fun res!545366 () Bool)

(assert (=> b!800711 (=> (not res!545366) (not e!443873))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357682 () array!43537)

(declare-fun lt!357685 () (_ BitVec 64))

(declare-fun lt!357684 () SeekEntryResult!8437)

(assert (=> b!800711 (= res!545366 (= lt!357684 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357685 lt!357682 mask!3266)))))

(assert (=> b!800711 (= lt!357684 (seekEntryOrOpen!0 lt!357685 lt!357682 mask!3266))))

(assert (=> b!800711 (= lt!357685 (select (store (arr!20849 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800711 (= lt!357682 (array!43538 (store (arr!20849 a!3170) i!1163 k0!2044) (size!21270 a!3170)))))

(declare-fun b!800712 () Bool)

(declare-fun res!545361 () Bool)

(assert (=> b!800712 (=> (not res!545361) (not e!443874))))

(assert (=> b!800712 (= res!545361 (validKeyInArray!0 (select (arr!20849 a!3170) j!153)))))

(declare-fun b!800713 () Bool)

(declare-fun res!545364 () Bool)

(assert (=> b!800713 (=> (not res!545364) (not e!443874))))

(declare-fun arrayContainsKey!0 (array!43537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800713 (= res!545364 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800714 () Bool)

(declare-fun res!545365 () Bool)

(assert (=> b!800714 (=> (not res!545365) (not e!443876))))

(assert (=> b!800714 (= res!545365 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21270 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20849 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21270 a!3170)) (= (select (arr!20849 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800709 () Bool)

(declare-fun res!545367 () Bool)

(assert (=> b!800709 (=> (not res!545367) (not e!443877))))

(assert (=> b!800709 (= res!545367 (= lt!357684 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357688 vacantAfter!23 lt!357685 lt!357682 mask!3266)))))

(declare-fun res!545372 () Bool)

(assert (=> start!68730 (=> (not res!545372) (not e!443874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68730 (= res!545372 (validMask!0 mask!3266))))

(assert (=> start!68730 e!443874))

(assert (=> start!68730 true))

(declare-fun array_inv!16732 (array!43537) Bool)

(assert (=> start!68730 (array_inv!16732 a!3170)))

(assert (= (and start!68730 res!545372) b!800705))

(assert (= (and b!800705 res!545371) b!800712))

(assert (= (and b!800712 res!545361) b!800702))

(assert (= (and b!800702 res!545373) b!800713))

(assert (= (and b!800713 res!545364) b!800704))

(assert (= (and b!800704 res!545362) b!800707))

(assert (= (and b!800707 res!545370) b!800706))

(assert (= (and b!800706 res!545369) b!800714))

(assert (= (and b!800714 res!545365) b!800711))

(assert (= (and b!800711 res!545366) b!800703))

(assert (= (and b!800703 res!545363) b!800708))

(assert (= (and b!800708 res!545368) b!800709))

(assert (= (and b!800709 res!545367) b!800710))

(declare-fun m!741337 () Bool)

(assert (=> b!800711 m!741337))

(declare-fun m!741339 () Bool)

(assert (=> b!800711 m!741339))

(declare-fun m!741341 () Bool)

(assert (=> b!800711 m!741341))

(declare-fun m!741343 () Bool)

(assert (=> b!800711 m!741343))

(declare-fun m!741345 () Bool)

(assert (=> b!800712 m!741345))

(assert (=> b!800712 m!741345))

(declare-fun m!741347 () Bool)

(assert (=> b!800712 m!741347))

(declare-fun m!741349 () Bool)

(assert (=> b!800714 m!741349))

(declare-fun m!741351 () Bool)

(assert (=> b!800714 m!741351))

(declare-fun m!741353 () Bool)

(assert (=> b!800703 m!741353))

(assert (=> b!800703 m!741345))

(assert (=> b!800703 m!741345))

(declare-fun m!741355 () Bool)

(assert (=> b!800703 m!741355))

(assert (=> b!800703 m!741345))

(declare-fun m!741357 () Bool)

(assert (=> b!800703 m!741357))

(declare-fun m!741359 () Bool)

(assert (=> b!800706 m!741359))

(declare-fun m!741361 () Bool)

(assert (=> b!800713 m!741361))

(declare-fun m!741363 () Bool)

(assert (=> start!68730 m!741363))

(declare-fun m!741365 () Bool)

(assert (=> start!68730 m!741365))

(declare-fun m!741367 () Bool)

(assert (=> b!800708 m!741367))

(declare-fun m!741369 () Bool)

(assert (=> b!800707 m!741369))

(declare-fun m!741371 () Bool)

(assert (=> b!800704 m!741371))

(declare-fun m!741373 () Bool)

(assert (=> b!800702 m!741373))

(assert (=> b!800710 m!741345))

(assert (=> b!800710 m!741345))

(declare-fun m!741375 () Bool)

(assert (=> b!800710 m!741375))

(declare-fun m!741377 () Bool)

(assert (=> b!800709 m!741377))

(check-sat (not b!800706) (not b!800713) (not b!800703) (not b!800711) (not b!800708) (not b!800710) (not b!800702) (not b!800707) (not b!800704) (not b!800712) (not start!68730) (not b!800709))
(check-sat)
