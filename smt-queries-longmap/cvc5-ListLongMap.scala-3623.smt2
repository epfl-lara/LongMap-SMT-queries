; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49976 () Bool)

(assert start!49976)

(declare-fun res!341367 () Bool)

(declare-fun e!316627 () Bool)

(assert (=> start!49976 (=> (not res!341367) (not e!316627))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49976 (= res!341367 (validMask!0 mask!3119))))

(assert (=> start!49976 e!316627))

(assert (=> start!49976 true))

(declare-datatypes ((array!34558 0))(
  ( (array!34559 (arr!16599 (Array (_ BitVec 32) (_ BitVec 64))) (size!16963 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34558)

(declare-fun array_inv!12395 (array!34558) Bool)

(assert (=> start!49976 (array_inv!12395 a!3118)))

(declare-fun b!547957 () Bool)

(declare-fun e!316628 () Bool)

(assert (=> b!547957 (= e!316628 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!249687 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!547957 (= lt!249687 (toIndex!0 (select (arr!16599 a!3118) j!142) mask!3119))))

(declare-fun b!547958 () Bool)

(declare-fun res!341368 () Bool)

(assert (=> b!547958 (=> (not res!341368) (not e!316628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34558 (_ BitVec 32)) Bool)

(assert (=> b!547958 (= res!341368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547959 () Bool)

(declare-fun res!341365 () Bool)

(assert (=> b!547959 (=> (not res!341365) (not e!316627))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547959 (= res!341365 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547960 () Bool)

(declare-fun res!341369 () Bool)

(assert (=> b!547960 (=> (not res!341369) (not e!316627))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547960 (= res!341369 (and (= (size!16963 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16963 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16963 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547961 () Bool)

(declare-fun res!341366 () Bool)

(assert (=> b!547961 (=> (not res!341366) (not e!316628))))

(declare-datatypes ((List!10679 0))(
  ( (Nil!10676) (Cons!10675 (h!11642 (_ BitVec 64)) (t!16907 List!10679)) )
))
(declare-fun arrayNoDuplicates!0 (array!34558 (_ BitVec 32) List!10679) Bool)

(assert (=> b!547961 (= res!341366 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10676))))

(declare-fun b!547962 () Bool)

(declare-fun res!341372 () Bool)

(assert (=> b!547962 (=> (not res!341372) (not e!316627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547962 (= res!341372 (validKeyInArray!0 (select (arr!16599 a!3118) j!142)))))

(declare-fun b!547963 () Bool)

(declare-fun res!341370 () Bool)

(assert (=> b!547963 (=> (not res!341370) (not e!316627))))

(assert (=> b!547963 (= res!341370 (validKeyInArray!0 k!1914))))

(declare-fun b!547964 () Bool)

(assert (=> b!547964 (= e!316627 e!316628)))

(declare-fun res!341371 () Bool)

(assert (=> b!547964 (=> (not res!341371) (not e!316628))))

(declare-datatypes ((SeekEntryResult!5048 0))(
  ( (MissingZero!5048 (index!22419 (_ BitVec 32))) (Found!5048 (index!22420 (_ BitVec 32))) (Intermediate!5048 (undefined!5860 Bool) (index!22421 (_ BitVec 32)) (x!51364 (_ BitVec 32))) (Undefined!5048) (MissingVacant!5048 (index!22422 (_ BitVec 32))) )
))
(declare-fun lt!249688 () SeekEntryResult!5048)

(assert (=> b!547964 (= res!341371 (or (= lt!249688 (MissingZero!5048 i!1132)) (= lt!249688 (MissingVacant!5048 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34558 (_ BitVec 32)) SeekEntryResult!5048)

(assert (=> b!547964 (= lt!249688 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!49976 res!341367) b!547960))

(assert (= (and b!547960 res!341369) b!547962))

(assert (= (and b!547962 res!341372) b!547963))

(assert (= (and b!547963 res!341370) b!547959))

(assert (= (and b!547959 res!341365) b!547964))

(assert (= (and b!547964 res!341371) b!547958))

(assert (= (and b!547958 res!341368) b!547961))

(assert (= (and b!547961 res!341366) b!547957))

(declare-fun m!525087 () Bool)

(assert (=> b!547964 m!525087))

(declare-fun m!525089 () Bool)

(assert (=> b!547962 m!525089))

(assert (=> b!547962 m!525089))

(declare-fun m!525091 () Bool)

(assert (=> b!547962 m!525091))

(declare-fun m!525093 () Bool)

(assert (=> b!547963 m!525093))

(assert (=> b!547957 m!525089))

(assert (=> b!547957 m!525089))

(declare-fun m!525095 () Bool)

(assert (=> b!547957 m!525095))

(declare-fun m!525097 () Bool)

(assert (=> start!49976 m!525097))

(declare-fun m!525099 () Bool)

(assert (=> start!49976 m!525099))

(declare-fun m!525101 () Bool)

(assert (=> b!547958 m!525101))

(declare-fun m!525103 () Bool)

(assert (=> b!547961 m!525103))

(declare-fun m!525105 () Bool)

(assert (=> b!547959 m!525105))

(push 1)

