; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28408 () Bool)

(assert start!28408)

(declare-fun b!290857 () Bool)

(declare-fun res!152202 () Bool)

(declare-fun e!184048 () Bool)

(assert (=> b!290857 (=> (not res!152202) (not e!184048))))

(declare-datatypes ((array!14677 0))(
  ( (array!14678 (arr!6964 (Array (_ BitVec 32) (_ BitVec 64))) (size!7316 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14677)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14677 (_ BitVec 32)) Bool)

(assert (=> b!290857 (= res!152202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290858 () Bool)

(declare-fun res!152195 () Bool)

(declare-fun e!184052 () Bool)

(assert (=> b!290858 (=> (not res!152195) (not e!184052))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290858 (= res!152195 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290859 () Bool)

(declare-fun e!184050 () Bool)

(declare-fun e!184049 () Bool)

(assert (=> b!290859 (= e!184050 e!184049)))

(declare-fun res!152196 () Bool)

(assert (=> b!290859 (=> (not res!152196) (not e!184049))))

(declare-fun lt!143757 () Bool)

(declare-datatypes ((SeekEntryResult!2113 0))(
  ( (MissingZero!2113 (index!10622 (_ BitVec 32))) (Found!2113 (index!10623 (_ BitVec 32))) (Intermediate!2113 (undefined!2925 Bool) (index!10624 (_ BitVec 32)) (x!28812 (_ BitVec 32))) (Undefined!2113) (MissingVacant!2113 (index!10625 (_ BitVec 32))) )
))
(declare-fun lt!143760 () SeekEntryResult!2113)

(assert (=> b!290859 (= res!152196 (and (or lt!143757 (not (undefined!2925 lt!143760))) (not lt!143757) (= (select (arr!6964 a!3312) (index!10624 lt!143760)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290859 (= lt!143757 (not (is-Intermediate!2113 lt!143760)))))

(declare-fun b!290860 () Bool)

(assert (=> b!290860 (= e!184052 e!184048)))

(declare-fun res!152197 () Bool)

(assert (=> b!290860 (=> (not res!152197) (not e!184048))))

(declare-fun lt!143759 () SeekEntryResult!2113)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143758 () Bool)

(assert (=> b!290860 (= res!152197 (or lt!143758 (= lt!143759 (MissingVacant!2113 i!1256))))))

(assert (=> b!290860 (= lt!143758 (= lt!143759 (MissingZero!2113 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14677 (_ BitVec 32)) SeekEntryResult!2113)

(assert (=> b!290860 (= lt!143759 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290861 () Bool)

(assert (=> b!290861 (= e!184049 (not true))))

(assert (=> b!290861 (= (index!10624 lt!143760) i!1256)))

(declare-fun b!290863 () Bool)

(assert (=> b!290863 (= e!184048 e!184050)))

(declare-fun res!152198 () Bool)

(assert (=> b!290863 (=> (not res!152198) (not e!184050))))

(assert (=> b!290863 (= res!152198 (and (not lt!143758) (= lt!143759 (MissingVacant!2113 i!1256))))))

(declare-fun lt!143761 () SeekEntryResult!2113)

(declare-fun lt!143756 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14677 (_ BitVec 32)) SeekEntryResult!2113)

(assert (=> b!290863 (= lt!143761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143756 k!2524 (array!14678 (store (arr!6964 a!3312) i!1256 k!2524) (size!7316 a!3312)) mask!3809))))

(assert (=> b!290863 (= lt!143760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143756 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290863 (= lt!143756 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290864 () Bool)

(declare-fun res!152199 () Bool)

(assert (=> b!290864 (=> (not res!152199) (not e!184052))))

(assert (=> b!290864 (= res!152199 (and (= (size!7316 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7316 a!3312))))))

(declare-fun res!152201 () Bool)

(assert (=> start!28408 (=> (not res!152201) (not e!184052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28408 (= res!152201 (validMask!0 mask!3809))))

(assert (=> start!28408 e!184052))

(assert (=> start!28408 true))

(declare-fun array_inv!4927 (array!14677) Bool)

(assert (=> start!28408 (array_inv!4927 a!3312)))

(declare-fun b!290862 () Bool)

(declare-fun res!152200 () Bool)

(assert (=> b!290862 (=> (not res!152200) (not e!184052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290862 (= res!152200 (validKeyInArray!0 k!2524))))

(assert (= (and start!28408 res!152201) b!290864))

(assert (= (and b!290864 res!152199) b!290862))

(assert (= (and b!290862 res!152200) b!290858))

(assert (= (and b!290858 res!152195) b!290860))

(assert (= (and b!290860 res!152197) b!290857))

(assert (= (and b!290857 res!152202) b!290863))

(assert (= (and b!290863 res!152198) b!290859))

(assert (= (and b!290859 res!152196) b!290861))

(declare-fun m!304841 () Bool)

(assert (=> b!290859 m!304841))

(declare-fun m!304843 () Bool)

(assert (=> b!290857 m!304843))

(declare-fun m!304845 () Bool)

(assert (=> b!290860 m!304845))

(declare-fun m!304847 () Bool)

(assert (=> b!290863 m!304847))

(declare-fun m!304849 () Bool)

(assert (=> b!290863 m!304849))

(declare-fun m!304851 () Bool)

(assert (=> b!290863 m!304851))

(declare-fun m!304853 () Bool)

(assert (=> b!290863 m!304853))

(declare-fun m!304855 () Bool)

(assert (=> b!290862 m!304855))

(declare-fun m!304857 () Bool)

(assert (=> start!28408 m!304857))

(declare-fun m!304859 () Bool)

(assert (=> start!28408 m!304859))

(declare-fun m!304861 () Bool)

(assert (=> b!290858 m!304861))

(push 1)

