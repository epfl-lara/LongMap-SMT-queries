; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31030 () Bool)

(assert start!31030)

(declare-fun b!311987 () Bool)

(declare-fun res!168442 () Bool)

(declare-fun e!194596 () Bool)

(assert (=> b!311987 (=> (not res!168442) (not e!194596))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311987 (= res!168442 (validKeyInArray!0 k0!2441))))

(declare-fun b!311988 () Bool)

(declare-fun e!194595 () Bool)

(assert (=> b!311988 (= e!194596 e!194595)))

(declare-fun res!168443 () Bool)

(assert (=> b!311988 (=> (not res!168443) (not e!194595))))

(declare-datatypes ((array!15932 0))(
  ( (array!15933 (arr!7548 (Array (_ BitVec 32) (_ BitVec 64))) (size!7900 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15932)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2688 0))(
  ( (MissingZero!2688 (index!12928 (_ BitVec 32))) (Found!2688 (index!12929 (_ BitVec 32))) (Intermediate!2688 (undefined!3500 Bool) (index!12930 (_ BitVec 32)) (x!31141 (_ BitVec 32))) (Undefined!2688) (MissingVacant!2688 (index!12931 (_ BitVec 32))) )
))
(declare-fun lt!152669 () SeekEntryResult!2688)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15932 (_ BitVec 32)) SeekEntryResult!2688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311988 (= res!168443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152669))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311988 (= lt!152669 (Intermediate!2688 false resIndex!52 resX!52))))

(declare-fun b!311990 () Bool)

(declare-fun res!168449 () Bool)

(assert (=> b!311990 (=> (not res!168449) (not e!194596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15932 (_ BitVec 32)) Bool)

(assert (=> b!311990 (= res!168449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311991 () Bool)

(declare-fun res!168447 () Bool)

(assert (=> b!311991 (=> (not res!168447) (not e!194596))))

(declare-fun arrayContainsKey!0 (array!15932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311991 (= res!168447 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311992 () Bool)

(declare-fun e!194593 () Bool)

(assert (=> b!311992 (= e!194593 true)))

(declare-fun lt!152670 () SeekEntryResult!2688)

(declare-fun lt!152671 () SeekEntryResult!2688)

(assert (=> b!311992 (= lt!152670 lt!152671)))

(declare-fun lt!152666 () (_ BitVec 32))

(declare-datatypes ((Unit!9607 0))(
  ( (Unit!9608) )
))
(declare-fun lt!152672 () Unit!9607)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15932 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9607)

(assert (=> b!311992 (= lt!152672 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152666 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311993 () Bool)

(declare-fun res!168448 () Bool)

(assert (=> b!311993 (=> (not res!168448) (not e!194595))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311993 (= res!168448 (and (= (select (arr!7548 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7900 a!3293))))))

(declare-fun b!311994 () Bool)

(declare-fun e!194594 () Bool)

(assert (=> b!311994 (= e!194594 (not e!194593))))

(declare-fun res!168444 () Bool)

(assert (=> b!311994 (=> res!168444 e!194593)))

(assert (=> b!311994 (= res!168444 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152666 #b00000000000000000000000000000000) (bvsge lt!152666 (size!7900 a!3293)) (not (= lt!152671 lt!152669))))))

(declare-fun lt!152667 () SeekEntryResult!2688)

(assert (=> b!311994 (= lt!152667 lt!152670)))

(declare-fun lt!152673 () array!15932)

(assert (=> b!311994 (= lt!152670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152666 k0!2441 lt!152673 mask!3709))))

(assert (=> b!311994 (= lt!152667 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152673 mask!3709))))

(assert (=> b!311994 (= lt!152673 (array!15933 (store (arr!7548 a!3293) i!1240 k0!2441) (size!7900 a!3293)))))

(declare-fun lt!152668 () SeekEntryResult!2688)

(assert (=> b!311994 (= lt!152668 lt!152671)))

(assert (=> b!311994 (= lt!152671 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152666 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311994 (= lt!152666 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311995 () Bool)

(declare-fun res!168445 () Bool)

(assert (=> b!311995 (=> (not res!168445) (not e!194596))))

(assert (=> b!311995 (= res!168445 (and (= (size!7900 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7900 a!3293))))))

(declare-fun b!311996 () Bool)

(assert (=> b!311996 (= e!194595 e!194594)))

(declare-fun res!168446 () Bool)

(assert (=> b!311996 (=> (not res!168446) (not e!194594))))

(assert (=> b!311996 (= res!168446 (and (= lt!152668 lt!152669) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7548 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311996 (= lt!152668 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!168450 () Bool)

(assert (=> start!31030 (=> (not res!168450) (not e!194596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31030 (= res!168450 (validMask!0 mask!3709))))

(assert (=> start!31030 e!194596))

(declare-fun array_inv!5511 (array!15932) Bool)

(assert (=> start!31030 (array_inv!5511 a!3293)))

(assert (=> start!31030 true))

(declare-fun b!311989 () Bool)

(declare-fun res!168441 () Bool)

(assert (=> b!311989 (=> (not res!168441) (not e!194596))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15932 (_ BitVec 32)) SeekEntryResult!2688)

(assert (=> b!311989 (= res!168441 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2688 i!1240)))))

(assert (= (and start!31030 res!168450) b!311995))

(assert (= (and b!311995 res!168445) b!311987))

(assert (= (and b!311987 res!168442) b!311991))

(assert (= (and b!311991 res!168447) b!311989))

(assert (= (and b!311989 res!168441) b!311990))

(assert (= (and b!311990 res!168449) b!311988))

(assert (= (and b!311988 res!168443) b!311993))

(assert (= (and b!311993 res!168448) b!311996))

(assert (= (and b!311996 res!168446) b!311994))

(assert (= (and b!311994 (not res!168444)) b!311992))

(declare-fun m!322011 () Bool)

(assert (=> b!311989 m!322011))

(declare-fun m!322013 () Bool)

(assert (=> b!311987 m!322013))

(declare-fun m!322015 () Bool)

(assert (=> b!311991 m!322015))

(declare-fun m!322017 () Bool)

(assert (=> b!311994 m!322017))

(declare-fun m!322019 () Bool)

(assert (=> b!311994 m!322019))

(declare-fun m!322021 () Bool)

(assert (=> b!311994 m!322021))

(declare-fun m!322023 () Bool)

(assert (=> b!311994 m!322023))

(declare-fun m!322025 () Bool)

(assert (=> b!311994 m!322025))

(declare-fun m!322027 () Bool)

(assert (=> b!311990 m!322027))

(declare-fun m!322029 () Bool)

(assert (=> start!31030 m!322029))

(declare-fun m!322031 () Bool)

(assert (=> start!31030 m!322031))

(declare-fun m!322033 () Bool)

(assert (=> b!311988 m!322033))

(assert (=> b!311988 m!322033))

(declare-fun m!322035 () Bool)

(assert (=> b!311988 m!322035))

(declare-fun m!322037 () Bool)

(assert (=> b!311993 m!322037))

(declare-fun m!322039 () Bool)

(assert (=> b!311992 m!322039))

(declare-fun m!322041 () Bool)

(assert (=> b!311996 m!322041))

(declare-fun m!322043 () Bool)

(assert (=> b!311996 m!322043))

(check-sat (not start!31030) (not b!311988) (not b!311987) (not b!311991) (not b!311989) (not b!311994) (not b!311990) (not b!311992) (not b!311996))
(check-sat)
