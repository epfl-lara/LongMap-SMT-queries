; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28434 () Bool)

(assert start!28434)

(declare-fun b!291169 () Bool)

(declare-fun res!152513 () Bool)

(declare-fun e!184243 () Bool)

(assert (=> b!291169 (=> (not res!152513) (not e!184243))))

(declare-datatypes ((array!14703 0))(
  ( (array!14704 (arr!6977 (Array (_ BitVec 32) (_ BitVec 64))) (size!7329 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14703)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291169 (= res!152513 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291170 () Bool)

(declare-fun e!184245 () Bool)

(declare-datatypes ((SeekEntryResult!2126 0))(
  ( (MissingZero!2126 (index!10674 (_ BitVec 32))) (Found!2126 (index!10675 (_ BitVec 32))) (Intermediate!2126 (undefined!2938 Bool) (index!10676 (_ BitVec 32)) (x!28865 (_ BitVec 32))) (Undefined!2126) (MissingVacant!2126 (index!10677 (_ BitVec 32))) )
))
(declare-fun lt!143990 () SeekEntryResult!2126)

(assert (=> b!291170 (= e!184245 (not (= lt!143990 (Intermediate!2126 false (index!10676 lt!143990) (x!28865 lt!143990)))))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291170 (= (index!10676 lt!143990) i!1256)))

(declare-fun b!291171 () Bool)

(declare-fun res!152509 () Bool)

(assert (=> b!291171 (=> (not res!152509) (not e!184243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291171 (= res!152509 (validKeyInArray!0 k!2524))))

(declare-fun b!291172 () Bool)

(declare-fun res!152514 () Bool)

(declare-fun e!184246 () Bool)

(assert (=> b!291172 (=> (not res!152514) (not e!184246))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14703 (_ BitVec 32)) Bool)

(assert (=> b!291172 (= res!152514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291174 () Bool)

(assert (=> b!291174 (= e!184243 e!184246)))

(declare-fun res!152510 () Bool)

(assert (=> b!291174 (=> (not res!152510) (not e!184246))))

(declare-fun lt!143994 () Bool)

(declare-fun lt!143993 () SeekEntryResult!2126)

(assert (=> b!291174 (= res!152510 (or lt!143994 (= lt!143993 (MissingVacant!2126 i!1256))))))

(assert (=> b!291174 (= lt!143994 (= lt!143993 (MissingZero!2126 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14703 (_ BitVec 32)) SeekEntryResult!2126)

(assert (=> b!291174 (= lt!143993 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!152507 () Bool)

(assert (=> start!28434 (=> (not res!152507) (not e!184243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28434 (= res!152507 (validMask!0 mask!3809))))

(assert (=> start!28434 e!184243))

(assert (=> start!28434 true))

(declare-fun array_inv!4940 (array!14703) Bool)

(assert (=> start!28434 (array_inv!4940 a!3312)))

(declare-fun b!291173 () Bool)

(declare-fun e!184247 () Bool)

(assert (=> b!291173 (= e!184246 e!184247)))

(declare-fun res!152508 () Bool)

(assert (=> b!291173 (=> (not res!152508) (not e!184247))))

(assert (=> b!291173 (= res!152508 (and (not lt!143994) (= lt!143993 (MissingVacant!2126 i!1256))))))

(declare-fun lt!143991 () (_ BitVec 32))

(declare-fun lt!143995 () SeekEntryResult!2126)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14703 (_ BitVec 32)) SeekEntryResult!2126)

(assert (=> b!291173 (= lt!143995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143991 k!2524 (array!14704 (store (arr!6977 a!3312) i!1256 k!2524) (size!7329 a!3312)) mask!3809))))

(assert (=> b!291173 (= lt!143990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143991 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291173 (= lt!143991 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291175 () Bool)

(assert (=> b!291175 (= e!184247 e!184245)))

(declare-fun res!152512 () Bool)

(assert (=> b!291175 (=> (not res!152512) (not e!184245))))

(declare-fun lt!143992 () Bool)

(assert (=> b!291175 (= res!152512 (and (or lt!143992 (not (undefined!2938 lt!143990))) (not lt!143992) (= (select (arr!6977 a!3312) (index!10676 lt!143990)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291175 (= lt!143992 (not (is-Intermediate!2126 lt!143990)))))

(declare-fun b!291176 () Bool)

(declare-fun res!152511 () Bool)

(assert (=> b!291176 (=> (not res!152511) (not e!184243))))

(assert (=> b!291176 (= res!152511 (and (= (size!7329 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7329 a!3312))))))

(assert (= (and start!28434 res!152507) b!291176))

(assert (= (and b!291176 res!152511) b!291171))

(assert (= (and b!291171 res!152509) b!291169))

(assert (= (and b!291169 res!152513) b!291174))

(assert (= (and b!291174 res!152510) b!291172))

(assert (= (and b!291172 res!152514) b!291173))

(assert (= (and b!291173 res!152508) b!291175))

(assert (= (and b!291175 res!152512) b!291170))

(declare-fun m!305127 () Bool)

(assert (=> b!291174 m!305127))

(declare-fun m!305129 () Bool)

(assert (=> b!291171 m!305129))

(declare-fun m!305131 () Bool)

(assert (=> b!291169 m!305131))

(declare-fun m!305133 () Bool)

(assert (=> b!291172 m!305133))

(declare-fun m!305135 () Bool)

(assert (=> b!291173 m!305135))

(declare-fun m!305137 () Bool)

(assert (=> b!291173 m!305137))

(declare-fun m!305139 () Bool)

(assert (=> b!291173 m!305139))

(declare-fun m!305141 () Bool)

(assert (=> b!291173 m!305141))

(declare-fun m!305143 () Bool)

(assert (=> start!28434 m!305143))

(declare-fun m!305145 () Bool)

(assert (=> start!28434 m!305145))

(declare-fun m!305147 () Bool)

(assert (=> b!291175 m!305147))

(push 1)

