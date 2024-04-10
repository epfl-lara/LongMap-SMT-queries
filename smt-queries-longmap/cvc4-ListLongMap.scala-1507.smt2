; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28576 () Bool)

(assert start!28576)

(declare-fun res!153210 () Bool)

(declare-fun e!184853 () Bool)

(assert (=> start!28576 (=> (not res!153210) (not e!184853))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28576 (= res!153210 (validMask!0 mask!3809))))

(assert (=> start!28576 e!184853))

(assert (=> start!28576 true))

(declare-datatypes ((array!14755 0))(
  ( (array!14756 (arr!7000 (Array (_ BitVec 32) (_ BitVec 64))) (size!7352 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14755)

(declare-fun array_inv!4963 (array!14755) Bool)

(assert (=> start!28576 (array_inv!4963 a!3312)))

(declare-fun b!292153 () Bool)

(declare-fun e!184854 () Bool)

(assert (=> b!292153 (= e!184853 e!184854)))

(declare-fun res!153215 () Bool)

(assert (=> b!292153 (=> (not res!153215) (not e!184854))))

(declare-datatypes ((SeekEntryResult!2149 0))(
  ( (MissingZero!2149 (index!10766 (_ BitVec 32))) (Found!2149 (index!10767 (_ BitVec 32))) (Intermediate!2149 (undefined!2961 Bool) (index!10768 (_ BitVec 32)) (x!28956 (_ BitVec 32))) (Undefined!2149) (MissingVacant!2149 (index!10769 (_ BitVec 32))) )
))
(declare-fun lt!144610 () SeekEntryResult!2149)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144605 () Bool)

(assert (=> b!292153 (= res!153215 (or lt!144605 (= lt!144610 (MissingVacant!2149 i!1256))))))

(assert (=> b!292153 (= lt!144605 (= lt!144610 (MissingZero!2149 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14755 (_ BitVec 32)) SeekEntryResult!2149)

(assert (=> b!292153 (= lt!144610 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292154 () Bool)

(declare-fun e!184855 () Bool)

(assert (=> b!292154 (= e!184855 (not true))))

(declare-datatypes ((Unit!9160 0))(
  ( (Unit!9161) )
))
(declare-fun lt!144604 () Unit!9160)

(declare-fun lt!144606 () SeekEntryResult!2149)

(declare-fun lt!144609 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14755 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9160)

(assert (=> b!292154 (= lt!144604 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144609 (index!10768 lt!144606) (x!28956 lt!144606) mask!3809))))

(assert (=> b!292154 (= (index!10768 lt!144606) i!1256)))

(declare-fun b!292155 () Bool)

(declare-fun e!184852 () Bool)

(assert (=> b!292155 (= e!184854 e!184852)))

(declare-fun res!153211 () Bool)

(assert (=> b!292155 (=> (not res!153211) (not e!184852))))

(assert (=> b!292155 (= res!153211 (and (not lt!144605) (= lt!144610 (MissingVacant!2149 i!1256))))))

(declare-fun lt!144608 () SeekEntryResult!2149)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14755 (_ BitVec 32)) SeekEntryResult!2149)

(assert (=> b!292155 (= lt!144608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144609 k!2524 (array!14756 (store (arr!7000 a!3312) i!1256 k!2524) (size!7352 a!3312)) mask!3809))))

(assert (=> b!292155 (= lt!144606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144609 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292155 (= lt!144609 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292156 () Bool)

(assert (=> b!292156 (= e!184852 e!184855)))

(declare-fun res!153216 () Bool)

(assert (=> b!292156 (=> (not res!153216) (not e!184855))))

(declare-fun lt!144607 () Bool)

(assert (=> b!292156 (= res!153216 (and (or lt!144607 (not (undefined!2961 lt!144606))) (not lt!144607) (= (select (arr!7000 a!3312) (index!10768 lt!144606)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292156 (= lt!144607 (not (is-Intermediate!2149 lt!144606)))))

(declare-fun b!292157 () Bool)

(declare-fun res!153214 () Bool)

(assert (=> b!292157 (=> (not res!153214) (not e!184854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14755 (_ BitVec 32)) Bool)

(assert (=> b!292157 (= res!153214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292158 () Bool)

(declare-fun res!153212 () Bool)

(assert (=> b!292158 (=> (not res!153212) (not e!184853))))

(declare-fun arrayContainsKey!0 (array!14755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292158 (= res!153212 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292159 () Bool)

(declare-fun res!153209 () Bool)

(assert (=> b!292159 (=> (not res!153209) (not e!184853))))

(assert (=> b!292159 (= res!153209 (and (= (size!7352 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7352 a!3312))))))

(declare-fun b!292160 () Bool)

(declare-fun res!153213 () Bool)

(assert (=> b!292160 (=> (not res!153213) (not e!184853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292160 (= res!153213 (validKeyInArray!0 k!2524))))

(assert (= (and start!28576 res!153210) b!292159))

(assert (= (and b!292159 res!153209) b!292160))

(assert (= (and b!292160 res!153213) b!292158))

(assert (= (and b!292158 res!153212) b!292153))

(assert (= (and b!292153 res!153215) b!292157))

(assert (= (and b!292157 res!153214) b!292155))

(assert (= (and b!292155 res!153211) b!292156))

(assert (= (and b!292156 res!153216) b!292154))

(declare-fun m!305877 () Bool)

(assert (=> b!292157 m!305877))

(declare-fun m!305879 () Bool)

(assert (=> b!292153 m!305879))

(declare-fun m!305881 () Bool)

(assert (=> b!292158 m!305881))

(declare-fun m!305883 () Bool)

(assert (=> b!292154 m!305883))

(declare-fun m!305885 () Bool)

(assert (=> b!292155 m!305885))

(declare-fun m!305887 () Bool)

(assert (=> b!292155 m!305887))

(declare-fun m!305889 () Bool)

(assert (=> b!292155 m!305889))

(declare-fun m!305891 () Bool)

(assert (=> b!292155 m!305891))

(declare-fun m!305893 () Bool)

(assert (=> start!28576 m!305893))

(declare-fun m!305895 () Bool)

(assert (=> start!28576 m!305895))

(declare-fun m!305897 () Bool)

(assert (=> b!292156 m!305897))

(declare-fun m!305899 () Bool)

(assert (=> b!292160 m!305899))

(push 1)

