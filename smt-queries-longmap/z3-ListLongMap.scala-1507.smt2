; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28564 () Bool)

(assert start!28564)

(declare-fun res!153189 () Bool)

(declare-fun e!184847 () Bool)

(assert (=> start!28564 (=> (not res!153189) (not e!184847))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28564 (= res!153189 (validMask!0 mask!3809))))

(assert (=> start!28564 e!184847))

(assert (=> start!28564 true))

(declare-datatypes ((array!14748 0))(
  ( (array!14749 (arr!6997 (Array (_ BitVec 32) (_ BitVec 64))) (size!7349 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14748)

(declare-fun array_inv!4947 (array!14748) Bool)

(assert (=> start!28564 (array_inv!4947 a!3312)))

(declare-fun b!292152 () Bool)

(declare-fun e!184846 () Bool)

(declare-fun e!184848 () Bool)

(assert (=> b!292152 (= e!184846 e!184848)))

(declare-fun res!153185 () Bool)

(assert (=> b!292152 (=> (not res!153185) (not e!184848))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144623 () Bool)

(declare-datatypes ((SeekEntryResult!2111 0))(
  ( (MissingZero!2111 (index!10614 (_ BitVec 32))) (Found!2111 (index!10615 (_ BitVec 32))) (Intermediate!2111 (undefined!2923 Bool) (index!10616 (_ BitVec 32)) (x!28918 (_ BitVec 32))) (Undefined!2111) (MissingVacant!2111 (index!10617 (_ BitVec 32))) )
))
(declare-fun lt!144622 () SeekEntryResult!2111)

(assert (=> b!292152 (= res!153185 (and (not lt!144623) (= lt!144622 (MissingVacant!2111 i!1256))))))

(declare-fun lt!144625 () (_ BitVec 32))

(declare-fun lt!144621 () SeekEntryResult!2111)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14748 (_ BitVec 32)) SeekEntryResult!2111)

(assert (=> b!292152 (= lt!144621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144625 k0!2524 (array!14749 (store (arr!6997 a!3312) i!1256 k0!2524) (size!7349 a!3312)) mask!3809))))

(declare-fun lt!144627 () SeekEntryResult!2111)

(assert (=> b!292152 (= lt!144627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144625 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292152 (= lt!144625 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292153 () Bool)

(declare-fun e!184849 () Bool)

(assert (=> b!292153 (= e!184848 e!184849)))

(declare-fun res!153188 () Bool)

(assert (=> b!292153 (=> (not res!153188) (not e!184849))))

(declare-fun lt!144624 () Bool)

(assert (=> b!292153 (= res!153188 (and (or lt!144624 (not (undefined!2923 lt!144627))) (not lt!144624) (= (select (arr!6997 a!3312) (index!10616 lt!144627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292153 (= lt!144624 (not ((_ is Intermediate!2111) lt!144627)))))

(declare-fun b!292154 () Bool)

(declare-fun res!153187 () Bool)

(assert (=> b!292154 (=> (not res!153187) (not e!184846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14748 (_ BitVec 32)) Bool)

(assert (=> b!292154 (= res!153187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292155 () Bool)

(declare-fun res!153186 () Bool)

(assert (=> b!292155 (=> (not res!153186) (not e!184847))))

(assert (=> b!292155 (= res!153186 (and (= (size!7349 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7349 a!3312))))))

(declare-fun b!292156 () Bool)

(assert (=> b!292156 (= e!184847 e!184846)))

(declare-fun res!153184 () Bool)

(assert (=> b!292156 (=> (not res!153184) (not e!184846))))

(assert (=> b!292156 (= res!153184 (or lt!144623 (= lt!144622 (MissingVacant!2111 i!1256))))))

(assert (=> b!292156 (= lt!144623 (= lt!144622 (MissingZero!2111 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14748 (_ BitVec 32)) SeekEntryResult!2111)

(assert (=> b!292156 (= lt!144622 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292157 () Bool)

(declare-fun res!153183 () Bool)

(assert (=> b!292157 (=> (not res!153183) (not e!184847))))

(declare-fun arrayContainsKey!0 (array!14748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292157 (= res!153183 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292158 () Bool)

(assert (=> b!292158 (= e!184849 (not true))))

(declare-datatypes ((Unit!9124 0))(
  ( (Unit!9125) )
))
(declare-fun lt!144626 () Unit!9124)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14748 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9124)

(assert (=> b!292158 (= lt!144626 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144625 (index!10616 lt!144627) (x!28918 lt!144627) mask!3809))))

(assert (=> b!292158 (= (index!10616 lt!144627) i!1256)))

(declare-fun b!292159 () Bool)

(declare-fun res!153182 () Bool)

(assert (=> b!292159 (=> (not res!153182) (not e!184847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292159 (= res!153182 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28564 res!153189) b!292155))

(assert (= (and b!292155 res!153186) b!292159))

(assert (= (and b!292159 res!153182) b!292157))

(assert (= (and b!292157 res!153183) b!292156))

(assert (= (and b!292156 res!153184) b!292154))

(assert (= (and b!292154 res!153187) b!292152))

(assert (= (and b!292152 res!153185) b!292153))

(assert (= (and b!292153 res!153188) b!292158))

(declare-fun m!306035 () Bool)

(assert (=> b!292152 m!306035))

(declare-fun m!306037 () Bool)

(assert (=> b!292152 m!306037))

(declare-fun m!306039 () Bool)

(assert (=> b!292152 m!306039))

(declare-fun m!306041 () Bool)

(assert (=> b!292152 m!306041))

(declare-fun m!306043 () Bool)

(assert (=> start!28564 m!306043))

(declare-fun m!306045 () Bool)

(assert (=> start!28564 m!306045))

(declare-fun m!306047 () Bool)

(assert (=> b!292159 m!306047))

(declare-fun m!306049 () Bool)

(assert (=> b!292157 m!306049))

(declare-fun m!306051 () Bool)

(assert (=> b!292158 m!306051))

(declare-fun m!306053 () Bool)

(assert (=> b!292154 m!306053))

(declare-fun m!306055 () Bool)

(assert (=> b!292156 m!306055))

(declare-fun m!306057 () Bool)

(assert (=> b!292153 m!306057))

(check-sat (not start!28564) (not b!292157) (not b!292156) (not b!292154) (not b!292159) (not b!292158) (not b!292152))
(check-sat)
