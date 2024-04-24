; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29128 () Bool)

(assert start!29128)

(declare-fun b!295623 () Bool)

(declare-fun e!186845 () Bool)

(assert (=> b!295623 (= e!186845 (not true))))

(declare-datatypes ((array!14934 0))(
  ( (array!14935 (arr!7078 (Array (_ BitVec 32) (_ BitVec 64))) (size!7430 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14934)

(declare-datatypes ((SeekEntryResult!2192 0))(
  ( (MissingZero!2192 (index!10938 (_ BitVec 32))) (Found!2192 (index!10939 (_ BitVec 32))) (Intermediate!2192 (undefined!3004 Bool) (index!10940 (_ BitVec 32)) (x!29269 (_ BitVec 32))) (Undefined!2192) (MissingVacant!2192 (index!10941 (_ BitVec 32))) )
))
(declare-fun lt!146623 () SeekEntryResult!2192)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295623 (and (= (select (arr!7078 a!3312) (index!10940 lt!146623)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10940 lt!146623) i!1256))))

(declare-fun b!295624 () Bool)

(declare-fun res!155400 () Bool)

(declare-fun e!186841 () Bool)

(assert (=> b!295624 (=> (not res!155400) (not e!186841))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14934 (_ BitVec 32)) Bool)

(assert (=> b!295624 (= res!155400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295625 () Bool)

(declare-fun res!155396 () Bool)

(declare-fun e!186844 () Bool)

(assert (=> b!295625 (=> (not res!155396) (not e!186844))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295625 (= res!155396 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295626 () Bool)

(declare-fun res!155395 () Bool)

(assert (=> b!295626 (=> (not res!155395) (not e!186844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295626 (= res!155395 (validKeyInArray!0 k0!2524))))

(declare-fun res!155393 () Bool)

(assert (=> start!29128 (=> (not res!155393) (not e!186844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29128 (= res!155393 (validMask!0 mask!3809))))

(assert (=> start!29128 e!186844))

(assert (=> start!29128 true))

(declare-fun array_inv!5028 (array!14934) Bool)

(assert (=> start!29128 (array_inv!5028 a!3312)))

(declare-fun b!295627 () Bool)

(assert (=> b!295627 (= e!186844 e!186841)))

(declare-fun res!155398 () Bool)

(assert (=> b!295627 (=> (not res!155398) (not e!186841))))

(declare-fun lt!146622 () SeekEntryResult!2192)

(declare-fun lt!146624 () Bool)

(assert (=> b!295627 (= res!155398 (or lt!146624 (= lt!146622 (MissingVacant!2192 i!1256))))))

(assert (=> b!295627 (= lt!146624 (= lt!146622 (MissingZero!2192 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14934 (_ BitVec 32)) SeekEntryResult!2192)

(assert (=> b!295627 (= lt!146622 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295628 () Bool)

(declare-fun res!155399 () Bool)

(assert (=> b!295628 (=> (not res!155399) (not e!186844))))

(assert (=> b!295628 (= res!155399 (and (= (size!7430 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7430 a!3312))))))

(declare-fun b!295629 () Bool)

(declare-fun e!186842 () Bool)

(assert (=> b!295629 (= e!186842 e!186845)))

(declare-fun res!155397 () Bool)

(assert (=> b!295629 (=> (not res!155397) (not e!186845))))

(declare-fun lt!146620 () Bool)

(assert (=> b!295629 (= res!155397 (and (or lt!146620 (not (undefined!3004 lt!146623))) (or lt!146620 (not (= (select (arr!7078 a!3312) (index!10940 lt!146623)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146620 (not (= (select (arr!7078 a!3312) (index!10940 lt!146623)) k0!2524))) (not lt!146620)))))

(get-info :version)

(assert (=> b!295629 (= lt!146620 (not ((_ is Intermediate!2192) lt!146623)))))

(declare-fun b!295630 () Bool)

(assert (=> b!295630 (= e!186841 e!186842)))

(declare-fun res!155394 () Bool)

(assert (=> b!295630 (=> (not res!155394) (not e!186842))))

(assert (=> b!295630 (= res!155394 lt!146624)))

(declare-fun lt!146625 () (_ BitVec 32))

(declare-fun lt!146621 () SeekEntryResult!2192)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14934 (_ BitVec 32)) SeekEntryResult!2192)

(assert (=> b!295630 (= lt!146621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146625 k0!2524 (array!14935 (store (arr!7078 a!3312) i!1256 k0!2524) (size!7430 a!3312)) mask!3809))))

(assert (=> b!295630 (= lt!146623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146625 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295630 (= lt!146625 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29128 res!155393) b!295628))

(assert (= (and b!295628 res!155399) b!295626))

(assert (= (and b!295626 res!155395) b!295625))

(assert (= (and b!295625 res!155396) b!295627))

(assert (= (and b!295627 res!155398) b!295624))

(assert (= (and b!295624 res!155400) b!295630))

(assert (= (and b!295630 res!155394) b!295629))

(assert (= (and b!295629 res!155397) b!295623))

(declare-fun m!308885 () Bool)

(assert (=> b!295627 m!308885))

(declare-fun m!308887 () Bool)

(assert (=> b!295630 m!308887))

(declare-fun m!308889 () Bool)

(assert (=> b!295630 m!308889))

(declare-fun m!308891 () Bool)

(assert (=> b!295630 m!308891))

(declare-fun m!308893 () Bool)

(assert (=> b!295630 m!308893))

(declare-fun m!308895 () Bool)

(assert (=> b!295625 m!308895))

(declare-fun m!308897 () Bool)

(assert (=> b!295629 m!308897))

(assert (=> b!295623 m!308897))

(declare-fun m!308899 () Bool)

(assert (=> b!295626 m!308899))

(declare-fun m!308901 () Bool)

(assert (=> start!29128 m!308901))

(declare-fun m!308903 () Bool)

(assert (=> start!29128 m!308903))

(declare-fun m!308905 () Bool)

(assert (=> b!295624 m!308905))

(check-sat (not b!295624) (not b!295630) (not b!295627) (not b!295625) (not b!295626) (not start!29128))
(check-sat)
