; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31852 () Bool)

(assert start!31852)

(declare-fun b!318422 () Bool)

(declare-fun e!197858 () Bool)

(declare-fun e!197856 () Bool)

(assert (=> b!318422 (= e!197858 e!197856)))

(declare-fun res!173004 () Bool)

(assert (=> b!318422 (=> (not res!173004) (not e!197856))))

(declare-datatypes ((array!16223 0))(
  ( (array!16224 (arr!7677 (Array (_ BitVec 32) (_ BitVec 64))) (size!8029 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16223)

(declare-datatypes ((SeekEntryResult!2817 0))(
  ( (MissingZero!2817 (index!13444 (_ BitVec 32))) (Found!2817 (index!13445 (_ BitVec 32))) (Intermediate!2817 (undefined!3629 Bool) (index!13446 (_ BitVec 32)) (x!31698 (_ BitVec 32))) (Undefined!2817) (MissingVacant!2817 (index!13447 (_ BitVec 32))) )
))
(declare-fun lt!155345 () SeekEntryResult!2817)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16223 (_ BitVec 32)) SeekEntryResult!2817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318422 (= res!173004 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155345))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318422 (= lt!155345 (Intermediate!2817 false resIndex!52 resX!52))))

(declare-fun b!318423 () Bool)

(declare-fun res!173005 () Bool)

(assert (=> b!318423 (=> (not res!173005) (not e!197858))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318423 (= res!173005 (and (= (size!8029 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8029 a!3293))))))

(declare-fun b!318424 () Bool)

(declare-fun res!173003 () Bool)

(assert (=> b!318424 (=> (not res!173003) (not e!197858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318424 (= res!173003 (validKeyInArray!0 k0!2441))))

(declare-fun b!318425 () Bool)

(declare-fun res!173002 () Bool)

(assert (=> b!318425 (=> (not res!173002) (not e!197856))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318425 (= res!173002 (and (= (select (arr!7677 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8029 a!3293))))))

(declare-fun b!318426 () Bool)

(declare-fun res!173009 () Bool)

(assert (=> b!318426 (=> (not res!173009) (not e!197858))))

(declare-fun arrayContainsKey!0 (array!16223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318426 (= res!173009 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!173001 () Bool)

(assert (=> start!31852 (=> (not res!173001) (not e!197858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31852 (= res!173001 (validMask!0 mask!3709))))

(assert (=> start!31852 e!197858))

(declare-fun array_inv!5640 (array!16223) Bool)

(assert (=> start!31852 (array_inv!5640 a!3293)))

(assert (=> start!31852 true))

(declare-fun b!318427 () Bool)

(declare-fun e!197859 () Bool)

(assert (=> b!318427 (= e!197856 e!197859)))

(declare-fun res!173010 () Bool)

(assert (=> b!318427 (=> (not res!173010) (not e!197859))))

(declare-fun lt!155344 () SeekEntryResult!2817)

(assert (=> b!318427 (= res!173010 (and (= lt!155344 lt!155345) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7677 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318427 (= lt!155344 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318428 () Bool)

(declare-fun res!173006 () Bool)

(assert (=> b!318428 (=> (not res!173006) (not e!197858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16223 (_ BitVec 32)) Bool)

(assert (=> b!318428 (= res!173006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318429 () Bool)

(assert (=> b!318429 (= e!197859 (not (bvsle (bvadd #b00000000000000000000000000000001 x!1427) resX!52)))))

(declare-fun e!197860 () Bool)

(assert (=> b!318429 e!197860))

(declare-fun res!173007 () Bool)

(assert (=> b!318429 (=> (not res!173007) (not e!197860))))

(declare-fun lt!155346 () (_ BitVec 32))

(assert (=> b!318429 (= res!173007 (= lt!155344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155346 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318429 (= lt!155346 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318430 () Bool)

(declare-fun res!173008 () Bool)

(assert (=> b!318430 (=> (not res!173008) (not e!197858))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16223 (_ BitVec 32)) SeekEntryResult!2817)

(assert (=> b!318430 (= res!173008 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2817 i!1240)))))

(declare-fun b!318431 () Bool)

(declare-fun lt!155343 () array!16223)

(assert (=> b!318431 (= e!197860 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155343 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155346 k0!2441 lt!155343 mask!3709)))))

(assert (=> b!318431 (= lt!155343 (array!16224 (store (arr!7677 a!3293) i!1240 k0!2441) (size!8029 a!3293)))))

(assert (= (and start!31852 res!173001) b!318423))

(assert (= (and b!318423 res!173005) b!318424))

(assert (= (and b!318424 res!173003) b!318426))

(assert (= (and b!318426 res!173009) b!318430))

(assert (= (and b!318430 res!173008) b!318428))

(assert (= (and b!318428 res!173006) b!318422))

(assert (= (and b!318422 res!173004) b!318425))

(assert (= (and b!318425 res!173002) b!318427))

(assert (= (and b!318427 res!173010) b!318429))

(assert (= (and b!318429 res!173007) b!318431))

(declare-fun m!327121 () Bool)

(assert (=> b!318425 m!327121))

(declare-fun m!327123 () Bool)

(assert (=> b!318424 m!327123))

(declare-fun m!327125 () Bool)

(assert (=> b!318427 m!327125))

(declare-fun m!327127 () Bool)

(assert (=> b!318427 m!327127))

(declare-fun m!327129 () Bool)

(assert (=> b!318422 m!327129))

(assert (=> b!318422 m!327129))

(declare-fun m!327131 () Bool)

(assert (=> b!318422 m!327131))

(declare-fun m!327133 () Bool)

(assert (=> b!318428 m!327133))

(declare-fun m!327135 () Bool)

(assert (=> b!318429 m!327135))

(declare-fun m!327137 () Bool)

(assert (=> b!318429 m!327137))

(declare-fun m!327139 () Bool)

(assert (=> b!318426 m!327139))

(declare-fun m!327141 () Bool)

(assert (=> start!31852 m!327141))

(declare-fun m!327143 () Bool)

(assert (=> start!31852 m!327143))

(declare-fun m!327145 () Bool)

(assert (=> b!318430 m!327145))

(declare-fun m!327147 () Bool)

(assert (=> b!318431 m!327147))

(declare-fun m!327149 () Bool)

(assert (=> b!318431 m!327149))

(declare-fun m!327151 () Bool)

(assert (=> b!318431 m!327151))

(check-sat (not b!318427) (not b!318422) (not b!318428) (not b!318424) (not b!318429) (not b!318426) (not start!31852) (not b!318430) (not b!318431))
(check-sat)
