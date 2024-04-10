; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31046 () Bool)

(assert start!31046)

(declare-fun b!312227 () Bool)

(declare-fun res!168686 () Bool)

(declare-fun e!194712 () Bool)

(assert (=> b!312227 (=> (not res!168686) (not e!194712))))

(declare-datatypes ((array!15948 0))(
  ( (array!15949 (arr!7556 (Array (_ BitVec 32) (_ BitVec 64))) (size!7908 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15948)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312227 (= res!168686 (and (= (select (arr!7556 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7908 a!3293))))))

(declare-fun b!312228 () Bool)

(declare-fun res!168681 () Bool)

(declare-fun e!194715 () Bool)

(assert (=> b!312228 (=> (not res!168681) (not e!194715))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2696 0))(
  ( (MissingZero!2696 (index!12960 (_ BitVec 32))) (Found!2696 (index!12961 (_ BitVec 32))) (Intermediate!2696 (undefined!3508 Bool) (index!12962 (_ BitVec 32)) (x!31173 (_ BitVec 32))) (Undefined!2696) (MissingVacant!2696 (index!12963 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15948 (_ BitVec 32)) SeekEntryResult!2696)

(assert (=> b!312228 (= res!168681 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2696 i!1240)))))

(declare-fun b!312229 () Bool)

(declare-fun e!194713 () Bool)

(assert (=> b!312229 (= e!194712 e!194713)))

(declare-fun res!168683 () Bool)

(assert (=> b!312229 (=> (not res!168683) (not e!194713))))

(declare-fun lt!152863 () SeekEntryResult!2696)

(declare-fun lt!152864 () SeekEntryResult!2696)

(assert (=> b!312229 (= res!168683 (and (= lt!152863 lt!152864) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7556 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15948 (_ BitVec 32)) SeekEntryResult!2696)

(assert (=> b!312229 (= lt!152863 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312230 () Bool)

(assert (=> b!312230 (= e!194715 e!194712)))

(declare-fun res!168685 () Bool)

(assert (=> b!312230 (=> (not res!168685) (not e!194712))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312230 (= res!168685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152864))))

(assert (=> b!312230 (= lt!152864 (Intermediate!2696 false resIndex!52 resX!52))))

(declare-fun b!312231 () Bool)

(declare-fun e!194714 () Bool)

(assert (=> b!312231 (= e!194714 true)))

(declare-fun lt!152861 () SeekEntryResult!2696)

(declare-fun lt!152859 () SeekEntryResult!2696)

(assert (=> b!312231 (= lt!152861 lt!152859)))

(declare-datatypes ((Unit!9623 0))(
  ( (Unit!9624) )
))
(declare-fun lt!152862 () Unit!9623)

(declare-fun lt!152858 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15948 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9623)

(assert (=> b!312231 (= lt!152862 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152858 resIndex!52 resX!52 mask!3709))))

(declare-fun res!168682 () Bool)

(assert (=> start!31046 (=> (not res!168682) (not e!194715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31046 (= res!168682 (validMask!0 mask!3709))))

(assert (=> start!31046 e!194715))

(declare-fun array_inv!5519 (array!15948) Bool)

(assert (=> start!31046 (array_inv!5519 a!3293)))

(assert (=> start!31046 true))

(declare-fun b!312232 () Bool)

(declare-fun res!168690 () Bool)

(assert (=> b!312232 (=> (not res!168690) (not e!194715))))

(assert (=> b!312232 (= res!168690 (and (= (size!7908 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7908 a!3293))))))

(declare-fun b!312233 () Bool)

(declare-fun res!168689 () Bool)

(assert (=> b!312233 (=> (not res!168689) (not e!194715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312233 (= res!168689 (validKeyInArray!0 k!2441))))

(declare-fun b!312234 () Bool)

(assert (=> b!312234 (= e!194713 (not e!194714))))

(declare-fun res!168688 () Bool)

(assert (=> b!312234 (=> res!168688 e!194714)))

(assert (=> b!312234 (= res!168688 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152858 #b00000000000000000000000000000000) (bvsge lt!152858 (size!7908 a!3293)) (not (= lt!152859 lt!152864))))))

(declare-fun lt!152860 () SeekEntryResult!2696)

(assert (=> b!312234 (= lt!152860 lt!152861)))

(declare-fun lt!152865 () array!15948)

(assert (=> b!312234 (= lt!152861 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152858 k!2441 lt!152865 mask!3709))))

(assert (=> b!312234 (= lt!152860 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152865 mask!3709))))

(assert (=> b!312234 (= lt!152865 (array!15949 (store (arr!7556 a!3293) i!1240 k!2441) (size!7908 a!3293)))))

(assert (=> b!312234 (= lt!152863 lt!152859)))

(assert (=> b!312234 (= lt!152859 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152858 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312234 (= lt!152858 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312235 () Bool)

(declare-fun res!168687 () Bool)

(assert (=> b!312235 (=> (not res!168687) (not e!194715))))

(declare-fun arrayContainsKey!0 (array!15948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312235 (= res!168687 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312236 () Bool)

(declare-fun res!168684 () Bool)

(assert (=> b!312236 (=> (not res!168684) (not e!194715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15948 (_ BitVec 32)) Bool)

(assert (=> b!312236 (= res!168684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31046 res!168682) b!312232))

(assert (= (and b!312232 res!168690) b!312233))

(assert (= (and b!312233 res!168689) b!312235))

(assert (= (and b!312235 res!168687) b!312228))

(assert (= (and b!312228 res!168681) b!312236))

(assert (= (and b!312236 res!168684) b!312230))

(assert (= (and b!312230 res!168685) b!312227))

(assert (= (and b!312227 res!168686) b!312229))

(assert (= (and b!312229 res!168683) b!312234))

(assert (= (and b!312234 (not res!168688)) b!312231))

(declare-fun m!322283 () Bool)

(assert (=> b!312227 m!322283))

(declare-fun m!322285 () Bool)

(assert (=> b!312236 m!322285))

(declare-fun m!322287 () Bool)

(assert (=> b!312230 m!322287))

(assert (=> b!312230 m!322287))

(declare-fun m!322289 () Bool)

(assert (=> b!312230 m!322289))

(declare-fun m!322291 () Bool)

(assert (=> b!312233 m!322291))

(declare-fun m!322293 () Bool)

(assert (=> b!312228 m!322293))

(declare-fun m!322295 () Bool)

(assert (=> start!31046 m!322295))

(declare-fun m!322297 () Bool)

(assert (=> start!31046 m!322297))

(declare-fun m!322299 () Bool)

(assert (=> b!312235 m!322299))

(declare-fun m!322301 () Bool)

(assert (=> b!312229 m!322301))

(declare-fun m!322303 () Bool)

(assert (=> b!312229 m!322303))

(declare-fun m!322305 () Bool)

(assert (=> b!312234 m!322305))

(declare-fun m!322307 () Bool)

(assert (=> b!312234 m!322307))

(declare-fun m!322309 () Bool)

(assert (=> b!312234 m!322309))

(declare-fun m!322311 () Bool)

(assert (=> b!312234 m!322311))

(declare-fun m!322313 () Bool)

(assert (=> b!312234 m!322313))

(declare-fun m!322315 () Bool)

(assert (=> b!312231 m!322315))

(push 1)

