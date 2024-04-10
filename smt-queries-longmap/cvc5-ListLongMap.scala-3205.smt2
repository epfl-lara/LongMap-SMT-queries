; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44976 () Bool)

(assert start!44976)

(declare-fun b!493293 () Bool)

(declare-fun res!295863 () Bool)

(declare-fun e!289722 () Bool)

(assert (=> b!493293 (=> (not res!295863) (not e!289722))))

(declare-datatypes ((array!31921 0))(
  ( (array!31922 (arr!15345 (Array (_ BitVec 32) (_ BitVec 64))) (size!15709 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31921)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31921 (_ BitVec 32)) Bool)

(assert (=> b!493293 (= res!295863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493294 () Bool)

(declare-fun res!295869 () Bool)

(declare-fun e!289725 () Bool)

(assert (=> b!493294 (=> (not res!295869) (not e!289725))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493294 (= res!295869 (validKeyInArray!0 k!2280))))

(declare-fun b!493295 () Bool)

(assert (=> b!493295 (= e!289725 e!289722)))

(declare-fun res!295864 () Bool)

(assert (=> b!493295 (=> (not res!295864) (not e!289722))))

(declare-datatypes ((SeekEntryResult!3812 0))(
  ( (MissingZero!3812 (index!17427 (_ BitVec 32))) (Found!3812 (index!17428 (_ BitVec 32))) (Intermediate!3812 (undefined!4624 Bool) (index!17429 (_ BitVec 32)) (x!46514 (_ BitVec 32))) (Undefined!3812) (MissingVacant!3812 (index!17430 (_ BitVec 32))) )
))
(declare-fun lt!223080 () SeekEntryResult!3812)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493295 (= res!295864 (or (= lt!223080 (MissingZero!3812 i!1204)) (= lt!223080 (MissingVacant!3812 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31921 (_ BitVec 32)) SeekEntryResult!3812)

(assert (=> b!493295 (= lt!223080 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493296 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!289724 () Bool)

(assert (=> b!493296 (= e!289724 (= (seekEntryOrOpen!0 (select (arr!15345 a!3235) j!176) a!3235 mask!3524) (Found!3812 j!176)))))

(declare-fun res!295865 () Bool)

(assert (=> start!44976 (=> (not res!295865) (not e!289725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44976 (= res!295865 (validMask!0 mask!3524))))

(assert (=> start!44976 e!289725))

(assert (=> start!44976 true))

(declare-fun array_inv!11141 (array!31921) Bool)

(assert (=> start!44976 (array_inv!11141 a!3235)))

(declare-fun b!493297 () Bool)

(declare-fun res!295868 () Bool)

(assert (=> b!493297 (=> (not res!295868) (not e!289725))))

(assert (=> b!493297 (= res!295868 (validKeyInArray!0 (select (arr!15345 a!3235) j!176)))))

(declare-fun b!493298 () Bool)

(declare-fun res!295866 () Bool)

(assert (=> b!493298 (=> (not res!295866) (not e!289725))))

(assert (=> b!493298 (= res!295866 (and (= (size!15709 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15709 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15709 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493299 () Bool)

(declare-fun res!295871 () Bool)

(assert (=> b!493299 (=> (not res!295871) (not e!289722))))

(declare-datatypes ((List!9503 0))(
  ( (Nil!9500) (Cons!9499 (h!10367 (_ BitVec 64)) (t!15731 List!9503)) )
))
(declare-fun arrayNoDuplicates!0 (array!31921 (_ BitVec 32) List!9503) Bool)

(assert (=> b!493299 (= res!295871 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9500))))

(declare-fun b!493300 () Bool)

(assert (=> b!493300 (= e!289722 (not true))))

(declare-fun lt!223079 () (_ BitVec 32))

(declare-fun lt!223082 () SeekEntryResult!3812)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31921 (_ BitVec 32)) SeekEntryResult!3812)

(assert (=> b!493300 (= lt!223082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223079 (select (store (arr!15345 a!3235) i!1204 k!2280) j!176) (array!31922 (store (arr!15345 a!3235) i!1204 k!2280) (size!15709 a!3235)) mask!3524))))

(declare-fun lt!223083 () SeekEntryResult!3812)

(declare-fun lt!223084 () (_ BitVec 32))

(assert (=> b!493300 (= lt!223083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223084 (select (arr!15345 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493300 (= lt!223079 (toIndex!0 (select (store (arr!15345 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493300 (= lt!223084 (toIndex!0 (select (arr!15345 a!3235) j!176) mask!3524))))

(assert (=> b!493300 e!289724))

(declare-fun res!295867 () Bool)

(assert (=> b!493300 (=> (not res!295867) (not e!289724))))

(assert (=> b!493300 (= res!295867 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14570 0))(
  ( (Unit!14571) )
))
(declare-fun lt!223081 () Unit!14570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14570)

(assert (=> b!493300 (= lt!223081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493301 () Bool)

(declare-fun res!295870 () Bool)

(assert (=> b!493301 (=> (not res!295870) (not e!289725))))

(declare-fun arrayContainsKey!0 (array!31921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493301 (= res!295870 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44976 res!295865) b!493298))

(assert (= (and b!493298 res!295866) b!493297))

(assert (= (and b!493297 res!295868) b!493294))

(assert (= (and b!493294 res!295869) b!493301))

(assert (= (and b!493301 res!295870) b!493295))

(assert (= (and b!493295 res!295864) b!493293))

(assert (= (and b!493293 res!295863) b!493299))

(assert (= (and b!493299 res!295871) b!493300))

(assert (= (and b!493300 res!295867) b!493296))

(declare-fun m!474099 () Bool)

(assert (=> b!493300 m!474099))

(declare-fun m!474101 () Bool)

(assert (=> b!493300 m!474101))

(declare-fun m!474103 () Bool)

(assert (=> b!493300 m!474103))

(declare-fun m!474105 () Bool)

(assert (=> b!493300 m!474105))

(declare-fun m!474107 () Bool)

(assert (=> b!493300 m!474107))

(assert (=> b!493300 m!474101))

(declare-fun m!474109 () Bool)

(assert (=> b!493300 m!474109))

(declare-fun m!474111 () Bool)

(assert (=> b!493300 m!474111))

(assert (=> b!493300 m!474107))

(declare-fun m!474113 () Bool)

(assert (=> b!493300 m!474113))

(assert (=> b!493300 m!474107))

(declare-fun m!474115 () Bool)

(assert (=> b!493300 m!474115))

(assert (=> b!493300 m!474101))

(declare-fun m!474117 () Bool)

(assert (=> b!493299 m!474117))

(declare-fun m!474119 () Bool)

(assert (=> b!493294 m!474119))

(declare-fun m!474121 () Bool)

(assert (=> b!493301 m!474121))

(declare-fun m!474123 () Bool)

(assert (=> start!44976 m!474123))

(declare-fun m!474125 () Bool)

(assert (=> start!44976 m!474125))

(assert (=> b!493297 m!474101))

(assert (=> b!493297 m!474101))

(declare-fun m!474127 () Bool)

(assert (=> b!493297 m!474127))

(declare-fun m!474129 () Bool)

(assert (=> b!493295 m!474129))

(declare-fun m!474131 () Bool)

(assert (=> b!493293 m!474131))

(assert (=> b!493296 m!474101))

(assert (=> b!493296 m!474101))

(declare-fun m!474133 () Bool)

(assert (=> b!493296 m!474133))

(push 1)

