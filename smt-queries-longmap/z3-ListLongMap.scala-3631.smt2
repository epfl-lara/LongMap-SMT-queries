; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50160 () Bool)

(assert start!50160)

(declare-fun b!549039 () Bool)

(declare-fun res!342169 () Bool)

(declare-fun e!317188 () Bool)

(assert (=> b!549039 (=> (not res!342169) (not e!317188))))

(declare-datatypes ((array!34605 0))(
  ( (array!34606 (arr!16618 (Array (_ BitVec 32) (_ BitVec 64))) (size!16982 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34605)

(declare-datatypes ((List!10605 0))(
  ( (Nil!10602) (Cons!10601 (h!11574 (_ BitVec 64)) (t!16825 List!10605)) )
))
(declare-fun arrayNoDuplicates!0 (array!34605 (_ BitVec 32) List!10605) Bool)

(assert (=> b!549039 (= res!342169 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10602))))

(declare-fun b!549040 () Bool)

(declare-fun res!342171 () Bool)

(declare-fun e!317190 () Bool)

(assert (=> b!549040 (=> (not res!342171) (not e!317190))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549040 (= res!342171 (validKeyInArray!0 k0!1914))))

(declare-fun b!549041 () Bool)

(assert (=> b!549041 (= e!317188 false)))

(declare-fun lt!250050 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549041 (= lt!250050 (toIndex!0 (select (store (arr!16618 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549042 () Bool)

(assert (=> b!549042 (= e!317190 e!317188)))

(declare-fun res!342165 () Bool)

(assert (=> b!549042 (=> (not res!342165) (not e!317188))))

(declare-datatypes ((SeekEntryResult!5023 0))(
  ( (MissingZero!5023 (index!22319 (_ BitVec 32))) (Found!5023 (index!22320 (_ BitVec 32))) (Intermediate!5023 (undefined!5835 Bool) (index!22321 (_ BitVec 32)) (x!51409 (_ BitVec 32))) (Undefined!5023) (MissingVacant!5023 (index!22322 (_ BitVec 32))) )
))
(declare-fun lt!250051 () SeekEntryResult!5023)

(assert (=> b!549042 (= res!342165 (or (= lt!250051 (MissingZero!5023 i!1132)) (= lt!250051 (MissingVacant!5023 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34605 (_ BitVec 32)) SeekEntryResult!5023)

(assert (=> b!549042 (= lt!250051 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549043 () Bool)

(declare-fun res!342167 () Bool)

(assert (=> b!549043 (=> (not res!342167) (not e!317188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34605 (_ BitVec 32)) Bool)

(assert (=> b!549043 (= res!342167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!342168 () Bool)

(assert (=> start!50160 (=> (not res!342168) (not e!317190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50160 (= res!342168 (validMask!0 mask!3119))))

(assert (=> start!50160 e!317190))

(assert (=> start!50160 true))

(declare-fun array_inv!12477 (array!34605) Bool)

(assert (=> start!50160 (array_inv!12477 a!3118)))

(declare-fun b!549044 () Bool)

(declare-fun res!342166 () Bool)

(assert (=> b!549044 (=> (not res!342166) (not e!317190))))

(assert (=> b!549044 (= res!342166 (and (= (size!16982 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16982 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16982 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549045 () Bool)

(declare-fun res!342170 () Bool)

(assert (=> b!549045 (=> (not res!342170) (not e!317190))))

(assert (=> b!549045 (= res!342170 (validKeyInArray!0 (select (arr!16618 a!3118) j!142)))))

(declare-fun b!549046 () Bool)

(declare-fun res!342172 () Bool)

(assert (=> b!549046 (=> (not res!342172) (not e!317190))))

(declare-fun arrayContainsKey!0 (array!34605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549046 (= res!342172 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50160 res!342168) b!549044))

(assert (= (and b!549044 res!342166) b!549045))

(assert (= (and b!549045 res!342170) b!549040))

(assert (= (and b!549040 res!342171) b!549046))

(assert (= (and b!549046 res!342172) b!549042))

(assert (= (and b!549042 res!342165) b!549043))

(assert (= (and b!549043 res!342167) b!549039))

(assert (= (and b!549039 res!342169) b!549041))

(declare-fun m!526085 () Bool)

(assert (=> b!549039 m!526085))

(declare-fun m!526087 () Bool)

(assert (=> b!549045 m!526087))

(assert (=> b!549045 m!526087))

(declare-fun m!526089 () Bool)

(assert (=> b!549045 m!526089))

(declare-fun m!526091 () Bool)

(assert (=> b!549046 m!526091))

(declare-fun m!526093 () Bool)

(assert (=> b!549041 m!526093))

(declare-fun m!526095 () Bool)

(assert (=> b!549041 m!526095))

(assert (=> b!549041 m!526095))

(declare-fun m!526097 () Bool)

(assert (=> b!549041 m!526097))

(declare-fun m!526099 () Bool)

(assert (=> b!549043 m!526099))

(declare-fun m!526101 () Bool)

(assert (=> b!549040 m!526101))

(declare-fun m!526103 () Bool)

(assert (=> start!50160 m!526103))

(declare-fun m!526105 () Bool)

(assert (=> start!50160 m!526105))

(declare-fun m!526107 () Bool)

(assert (=> b!549042 m!526107))

(check-sat (not start!50160) (not b!549042) (not b!549040) (not b!549041) (not b!549043) (not b!549039) (not b!549046) (not b!549045))
(check-sat)
