; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28578 () Bool)

(assert start!28578)

(declare-fun b!292177 () Bool)

(declare-fun e!184867 () Bool)

(declare-fun e!184869 () Bool)

(assert (=> b!292177 (= e!184867 e!184869)))

(declare-fun res!153235 () Bool)

(assert (=> b!292177 (=> (not res!153235) (not e!184869))))

(declare-fun lt!144629 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2150 0))(
  ( (MissingZero!2150 (index!10770 (_ BitVec 32))) (Found!2150 (index!10771 (_ BitVec 32))) (Intermediate!2150 (undefined!2962 Bool) (index!10772 (_ BitVec 32)) (x!28965 (_ BitVec 32))) (Undefined!2150) (MissingVacant!2150 (index!10773 (_ BitVec 32))) )
))
(declare-fun lt!144630 () SeekEntryResult!2150)

(assert (=> b!292177 (= res!153235 (and (not lt!144629) (= lt!144630 (MissingVacant!2150 i!1256))))))

(declare-fun lt!144626 () SeekEntryResult!2150)

(declare-datatypes ((array!14757 0))(
  ( (array!14758 (arr!7001 (Array (_ BitVec 32) (_ BitVec 64))) (size!7353 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14757)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!144631 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14757 (_ BitVec 32)) SeekEntryResult!2150)

(assert (=> b!292177 (= lt!144626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144631 k!2524 (array!14758 (store (arr!7001 a!3312) i!1256 k!2524) (size!7353 a!3312)) mask!3809))))

(declare-fun lt!144627 () SeekEntryResult!2150)

(assert (=> b!292177 (= lt!144627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144631 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292177 (= lt!144631 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!153234 () Bool)

(declare-fun e!184871 () Bool)

(assert (=> start!28578 (=> (not res!153234) (not e!184871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28578 (= res!153234 (validMask!0 mask!3809))))

(assert (=> start!28578 e!184871))

(assert (=> start!28578 true))

(declare-fun array_inv!4964 (array!14757) Bool)

(assert (=> start!28578 (array_inv!4964 a!3312)))

(declare-fun b!292178 () Bool)

(declare-fun res!153238 () Bool)

(assert (=> b!292178 (=> (not res!153238) (not e!184867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14757 (_ BitVec 32)) Bool)

(assert (=> b!292178 (= res!153238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292179 () Bool)

(declare-fun res!153240 () Bool)

(assert (=> b!292179 (=> (not res!153240) (not e!184871))))

(assert (=> b!292179 (= res!153240 (and (= (size!7353 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7353 a!3312))))))

(declare-fun b!292180 () Bool)

(declare-fun e!184870 () Bool)

(assert (=> b!292180 (= e!184870 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!9162 0))(
  ( (Unit!9163) )
))
(declare-fun lt!144628 () Unit!9162)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14757 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9162)

(assert (=> b!292180 (= lt!144628 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144631 (index!10772 lt!144627) (x!28965 lt!144627) mask!3809))))

(assert (=> b!292180 (= (index!10772 lt!144627) i!1256)))

(declare-fun b!292181 () Bool)

(assert (=> b!292181 (= e!184871 e!184867)))

(declare-fun res!153237 () Bool)

(assert (=> b!292181 (=> (not res!153237) (not e!184867))))

(assert (=> b!292181 (= res!153237 (or lt!144629 (= lt!144630 (MissingVacant!2150 i!1256))))))

(assert (=> b!292181 (= lt!144629 (= lt!144630 (MissingZero!2150 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14757 (_ BitVec 32)) SeekEntryResult!2150)

(assert (=> b!292181 (= lt!144630 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292182 () Bool)

(assert (=> b!292182 (= e!184869 e!184870)))

(declare-fun res!153236 () Bool)

(assert (=> b!292182 (=> (not res!153236) (not e!184870))))

(declare-fun lt!144625 () Bool)

(assert (=> b!292182 (= res!153236 (and (or lt!144625 (not (undefined!2962 lt!144627))) (not lt!144625) (= (select (arr!7001 a!3312) (index!10772 lt!144627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292182 (= lt!144625 (not (is-Intermediate!2150 lt!144627)))))

(declare-fun b!292183 () Bool)

(declare-fun res!153233 () Bool)

(assert (=> b!292183 (=> (not res!153233) (not e!184871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292183 (= res!153233 (validKeyInArray!0 k!2524))))

(declare-fun b!292184 () Bool)

(declare-fun res!153239 () Bool)

(assert (=> b!292184 (=> (not res!153239) (not e!184871))))

(declare-fun arrayContainsKey!0 (array!14757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292184 (= res!153239 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28578 res!153234) b!292179))

(assert (= (and b!292179 res!153240) b!292183))

(assert (= (and b!292183 res!153233) b!292184))

(assert (= (and b!292184 res!153239) b!292181))

(assert (= (and b!292181 res!153237) b!292178))

(assert (= (and b!292178 res!153238) b!292177))

(assert (= (and b!292177 res!153235) b!292182))

(assert (= (and b!292182 res!153236) b!292180))

(declare-fun m!305901 () Bool)

(assert (=> b!292177 m!305901))

(declare-fun m!305903 () Bool)

(assert (=> b!292177 m!305903))

(declare-fun m!305905 () Bool)

(assert (=> b!292177 m!305905))

(declare-fun m!305907 () Bool)

(assert (=> b!292177 m!305907))

(declare-fun m!305909 () Bool)

(assert (=> b!292182 m!305909))

(declare-fun m!305911 () Bool)

(assert (=> b!292184 m!305911))

(declare-fun m!305913 () Bool)

(assert (=> b!292183 m!305913))

(declare-fun m!305915 () Bool)

(assert (=> start!28578 m!305915))

(declare-fun m!305917 () Bool)

(assert (=> start!28578 m!305917))

(declare-fun m!305919 () Bool)

(assert (=> b!292178 m!305919))

(declare-fun m!305921 () Bool)

(assert (=> b!292181 m!305921))

(declare-fun m!305923 () Bool)

(assert (=> b!292180 m!305923))

(push 1)

