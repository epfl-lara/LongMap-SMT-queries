; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31050 () Bool)

(assert start!31050)

(declare-fun b!312287 () Bool)

(declare-fun res!168743 () Bool)

(declare-fun e!194746 () Bool)

(assert (=> b!312287 (=> (not res!168743) (not e!194746))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312287 (= res!168743 (validKeyInArray!0 k!2441))))

(declare-fun b!312288 () Bool)

(declare-fun res!168746 () Bool)

(assert (=> b!312288 (=> (not res!168746) (not e!194746))))

(declare-datatypes ((array!15952 0))(
  ( (array!15953 (arr!7558 (Array (_ BitVec 32) (_ BitVec 64))) (size!7910 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15952)

(declare-fun arrayContainsKey!0 (array!15952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312288 (= res!168746 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168745 () Bool)

(assert (=> start!31050 (=> (not res!168745) (not e!194746))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31050 (= res!168745 (validMask!0 mask!3709))))

(assert (=> start!31050 e!194746))

(declare-fun array_inv!5521 (array!15952) Bool)

(assert (=> start!31050 (array_inv!5521 a!3293)))

(assert (=> start!31050 true))

(declare-fun b!312289 () Bool)

(declare-fun res!168742 () Bool)

(assert (=> b!312289 (=> (not res!168742) (not e!194746))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312289 (= res!168742 (and (= (size!7910 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7910 a!3293))))))

(declare-fun b!312290 () Bool)

(declare-fun e!194745 () Bool)

(declare-fun e!194742 () Bool)

(assert (=> b!312290 (= e!194745 e!194742)))

(declare-fun res!168748 () Bool)

(assert (=> b!312290 (=> (not res!168748) (not e!194742))))

(declare-datatypes ((SeekEntryResult!2698 0))(
  ( (MissingZero!2698 (index!12968 (_ BitVec 32))) (Found!2698 (index!12969 (_ BitVec 32))) (Intermediate!2698 (undefined!3510 Bool) (index!12970 (_ BitVec 32)) (x!31175 (_ BitVec 32))) (Undefined!2698) (MissingVacant!2698 (index!12971 (_ BitVec 32))) )
))
(declare-fun lt!152907 () SeekEntryResult!2698)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!152913 () SeekEntryResult!2698)

(assert (=> b!312290 (= res!168748 (and (= lt!152907 lt!152913) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7558 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15952 (_ BitVec 32)) SeekEntryResult!2698)

(assert (=> b!312290 (= lt!152907 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312291 () Bool)

(declare-fun res!168749 () Bool)

(assert (=> b!312291 (=> (not res!168749) (not e!194745))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312291 (= res!168749 (and (= (select (arr!7558 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7910 a!3293))))))

(declare-fun b!312292 () Bool)

(declare-fun e!194743 () Bool)

(assert (=> b!312292 (= e!194742 (not e!194743))))

(declare-fun res!168744 () Bool)

(assert (=> b!312292 (=> res!168744 e!194743)))

(declare-fun lt!152912 () SeekEntryResult!2698)

(declare-fun lt!152911 () (_ BitVec 32))

(assert (=> b!312292 (= res!168744 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152911 #b00000000000000000000000000000000) (bvsge lt!152911 (size!7910 a!3293)) (not (= lt!152912 lt!152913))))))

(declare-fun lt!152910 () SeekEntryResult!2698)

(declare-fun lt!152906 () SeekEntryResult!2698)

(assert (=> b!312292 (= lt!152910 lt!152906)))

(declare-fun lt!152909 () array!15952)

(assert (=> b!312292 (= lt!152906 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152911 k!2441 lt!152909 mask!3709))))

(assert (=> b!312292 (= lt!152910 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152909 mask!3709))))

(assert (=> b!312292 (= lt!152909 (array!15953 (store (arr!7558 a!3293) i!1240 k!2441) (size!7910 a!3293)))))

(assert (=> b!312292 (= lt!152907 lt!152912)))

(assert (=> b!312292 (= lt!152912 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152911 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312292 (= lt!152911 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312293 () Bool)

(assert (=> b!312293 (= e!194743 true)))

(assert (=> b!312293 (= lt!152906 lt!152912)))

(declare-datatypes ((Unit!9627 0))(
  ( (Unit!9628) )
))
(declare-fun lt!152908 () Unit!9627)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15952 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9627)

(assert (=> b!312293 (= lt!152908 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152911 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312294 () Bool)

(declare-fun res!168750 () Bool)

(assert (=> b!312294 (=> (not res!168750) (not e!194746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15952 (_ BitVec 32)) Bool)

(assert (=> b!312294 (= res!168750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312295 () Bool)

(declare-fun res!168741 () Bool)

(assert (=> b!312295 (=> (not res!168741) (not e!194746))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15952 (_ BitVec 32)) SeekEntryResult!2698)

(assert (=> b!312295 (= res!168741 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2698 i!1240)))))

(declare-fun b!312296 () Bool)

(assert (=> b!312296 (= e!194746 e!194745)))

(declare-fun res!168747 () Bool)

(assert (=> b!312296 (=> (not res!168747) (not e!194745))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312296 (= res!168747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152913))))

(assert (=> b!312296 (= lt!152913 (Intermediate!2698 false resIndex!52 resX!52))))

(assert (= (and start!31050 res!168745) b!312289))

(assert (= (and b!312289 res!168742) b!312287))

(assert (= (and b!312287 res!168743) b!312288))

(assert (= (and b!312288 res!168746) b!312295))

(assert (= (and b!312295 res!168741) b!312294))

(assert (= (and b!312294 res!168750) b!312296))

(assert (= (and b!312296 res!168747) b!312291))

(assert (= (and b!312291 res!168749) b!312290))

(assert (= (and b!312290 res!168748) b!312292))

(assert (= (and b!312292 (not res!168744)) b!312293))

(declare-fun m!322351 () Bool)

(assert (=> b!312296 m!322351))

(assert (=> b!312296 m!322351))

(declare-fun m!322353 () Bool)

(assert (=> b!312296 m!322353))

(declare-fun m!322355 () Bool)

(assert (=> b!312295 m!322355))

(declare-fun m!322357 () Bool)

(assert (=> b!312287 m!322357))

(declare-fun m!322359 () Bool)

(assert (=> b!312288 m!322359))

(declare-fun m!322361 () Bool)

(assert (=> b!312290 m!322361))

(declare-fun m!322363 () Bool)

(assert (=> b!312290 m!322363))

(declare-fun m!322365 () Bool)

(assert (=> b!312294 m!322365))

(declare-fun m!322367 () Bool)

(assert (=> b!312291 m!322367))

(declare-fun m!322369 () Bool)

(assert (=> start!31050 m!322369))

(declare-fun m!322371 () Bool)

(assert (=> start!31050 m!322371))

(declare-fun m!322373 () Bool)

(assert (=> b!312292 m!322373))

(declare-fun m!322375 () Bool)

(assert (=> b!312292 m!322375))

(declare-fun m!322377 () Bool)

(assert (=> b!312292 m!322377))

(declare-fun m!322379 () Bool)

(assert (=> b!312292 m!322379))

(declare-fun m!322381 () Bool)

(assert (=> b!312292 m!322381))

(declare-fun m!322383 () Bool)

(assert (=> b!312293 m!322383))

(push 1)

(assert (not start!31050))

(assert (not b!312287))

(assert (not b!312295))

(assert (not b!312293))

