; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28656 () Bool)

(assert start!28656)

(declare-fun res!153989 () Bool)

(declare-fun e!185268 () Bool)

(assert (=> start!28656 (=> (not res!153989) (not e!185268))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28656 (= res!153989 (validMask!0 mask!3809))))

(assert (=> start!28656 e!185268))

(assert (=> start!28656 true))

(declare-datatypes ((array!14835 0))(
  ( (array!14836 (arr!7040 (Array (_ BitVec 32) (_ BitVec 64))) (size!7392 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14835)

(declare-fun array_inv!5003 (array!14835) Bool)

(assert (=> start!28656 (array_inv!5003 a!3312)))

(declare-fun b!292929 () Bool)

(declare-fun res!153990 () Bool)

(assert (=> b!292929 (=> (not res!153990) (not e!185268))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292929 (= res!153990 (and (= (size!7392 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7392 a!3312))))))

(declare-fun b!292930 () Bool)

(declare-fun res!153985 () Bool)

(assert (=> b!292930 (=> (not res!153985) (not e!185268))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292930 (= res!153985 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292931 () Bool)

(declare-fun res!153987 () Bool)

(assert (=> b!292931 (=> (not res!153987) (not e!185268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292931 (= res!153987 (validKeyInArray!0 k!2524))))

(declare-fun b!292932 () Bool)

(declare-fun res!153986 () Bool)

(declare-fun e!185269 () Bool)

(assert (=> b!292932 (=> (not res!153986) (not e!185269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14835 (_ BitVec 32)) Bool)

(assert (=> b!292932 (= res!153986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292933 () Bool)

(assert (=> b!292933 (= e!185269 false)))

(declare-fun lt!145168 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2189 0))(
  ( (MissingZero!2189 (index!10926 (_ BitVec 32))) (Found!2189 (index!10927 (_ BitVec 32))) (Intermediate!2189 (undefined!3001 Bool) (index!10928 (_ BitVec 32)) (x!29108 (_ BitVec 32))) (Undefined!2189) (MissingVacant!2189 (index!10929 (_ BitVec 32))) )
))
(declare-fun lt!145171 () SeekEntryResult!2189)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14835 (_ BitVec 32)) SeekEntryResult!2189)

(assert (=> b!292933 (= lt!145171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145168 k!2524 (array!14836 (store (arr!7040 a!3312) i!1256 k!2524) (size!7392 a!3312)) mask!3809))))

(declare-fun lt!145169 () SeekEntryResult!2189)

(assert (=> b!292933 (= lt!145169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145168 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292933 (= lt!145168 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292934 () Bool)

(assert (=> b!292934 (= e!185268 e!185269)))

(declare-fun res!153988 () Bool)

(assert (=> b!292934 (=> (not res!153988) (not e!185269))))

(declare-fun lt!145170 () SeekEntryResult!2189)

(assert (=> b!292934 (= res!153988 (or (= lt!145170 (MissingZero!2189 i!1256)) (= lt!145170 (MissingVacant!2189 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14835 (_ BitVec 32)) SeekEntryResult!2189)

(assert (=> b!292934 (= lt!145170 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28656 res!153989) b!292929))

(assert (= (and b!292929 res!153990) b!292931))

(assert (= (and b!292931 res!153987) b!292930))

(assert (= (and b!292930 res!153985) b!292934))

(assert (= (and b!292934 res!153988) b!292932))

(assert (= (and b!292932 res!153986) b!292933))

(declare-fun m!306717 () Bool)

(assert (=> b!292933 m!306717))

(declare-fun m!306719 () Bool)

(assert (=> b!292933 m!306719))

(declare-fun m!306721 () Bool)

(assert (=> b!292933 m!306721))

(declare-fun m!306723 () Bool)

(assert (=> b!292933 m!306723))

(declare-fun m!306725 () Bool)

(assert (=> b!292930 m!306725))

(declare-fun m!306727 () Bool)

(assert (=> b!292931 m!306727))

(declare-fun m!306729 () Bool)

(assert (=> b!292932 m!306729))

(declare-fun m!306731 () Bool)

(assert (=> start!28656 m!306731))

(declare-fun m!306733 () Bool)

(assert (=> start!28656 m!306733))

(declare-fun m!306735 () Bool)

(assert (=> b!292934 m!306735))

(push 1)

