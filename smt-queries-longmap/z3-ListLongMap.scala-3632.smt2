; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50122 () Bool)

(assert start!50122)

(declare-fun b!548935 () Bool)

(declare-fun res!342172 () Bool)

(declare-fun e!317095 () Bool)

(assert (=> b!548935 (=> (not res!342172) (not e!317095))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34620 0))(
  ( (array!34621 (arr!16627 (Array (_ BitVec 32) (_ BitVec 64))) (size!16991 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34620)

(assert (=> b!548935 (= res!342172 (and (= (size!16991 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16991 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16991 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548936 () Bool)

(declare-fun res!342166 () Bool)

(assert (=> b!548936 (=> (not res!342166) (not e!317095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548936 (= res!342166 (validKeyInArray!0 (select (arr!16627 a!3118) j!142)))))

(declare-fun b!548937 () Bool)

(declare-fun res!342173 () Bool)

(assert (=> b!548937 (=> (not res!342173) (not e!317095))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!548937 (= res!342173 (validKeyInArray!0 k0!1914))))

(declare-fun b!548938 () Bool)

(declare-fun e!317096 () Bool)

(assert (=> b!548938 (= e!317095 e!317096)))

(declare-fun res!342167 () Bool)

(assert (=> b!548938 (=> (not res!342167) (not e!317096))))

(declare-datatypes ((SeekEntryResult!5076 0))(
  ( (MissingZero!5076 (index!22531 (_ BitVec 32))) (Found!5076 (index!22532 (_ BitVec 32))) (Intermediate!5076 (undefined!5888 Bool) (index!22533 (_ BitVec 32)) (x!51467 (_ BitVec 32))) (Undefined!5076) (MissingVacant!5076 (index!22534 (_ BitVec 32))) )
))
(declare-fun lt!249963 () SeekEntryResult!5076)

(assert (=> b!548938 (= res!342167 (or (= lt!249963 (MissingZero!5076 i!1132)) (= lt!249963 (MissingVacant!5076 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34620 (_ BitVec 32)) SeekEntryResult!5076)

(assert (=> b!548938 (= lt!249963 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548939 () Bool)

(declare-fun res!342171 () Bool)

(assert (=> b!548939 (=> (not res!342171) (not e!317096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34620 (_ BitVec 32)) Bool)

(assert (=> b!548939 (= res!342171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!342169 () Bool)

(assert (=> start!50122 (=> (not res!342169) (not e!317095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50122 (= res!342169 (validMask!0 mask!3119))))

(assert (=> start!50122 e!317095))

(assert (=> start!50122 true))

(declare-fun array_inv!12423 (array!34620) Bool)

(assert (=> start!50122 (array_inv!12423 a!3118)))

(declare-fun b!548940 () Bool)

(declare-fun res!342170 () Bool)

(assert (=> b!548940 (=> (not res!342170) (not e!317096))))

(declare-datatypes ((List!10707 0))(
  ( (Nil!10704) (Cons!10703 (h!11673 (_ BitVec 64)) (t!16935 List!10707)) )
))
(declare-fun arrayNoDuplicates!0 (array!34620 (_ BitVec 32) List!10707) Bool)

(assert (=> b!548940 (= res!342170 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10704))))

(declare-fun b!548941 () Bool)

(declare-fun res!342168 () Bool)

(assert (=> b!548941 (=> (not res!342168) (not e!317095))))

(declare-fun arrayContainsKey!0 (array!34620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548941 (= res!342168 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548942 () Bool)

(assert (=> b!548942 (= e!317096 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!249964 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548942 (= lt!249964 (toIndex!0 (select (store (arr!16627 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (= (and start!50122 res!342169) b!548935))

(assert (= (and b!548935 res!342172) b!548936))

(assert (= (and b!548936 res!342166) b!548937))

(assert (= (and b!548937 res!342173) b!548941))

(assert (= (and b!548941 res!342168) b!548938))

(assert (= (and b!548938 res!342167) b!548939))

(assert (= (and b!548939 res!342171) b!548940))

(assert (= (and b!548940 res!342170) b!548942))

(declare-fun m!525843 () Bool)

(assert (=> b!548939 m!525843))

(declare-fun m!525845 () Bool)

(assert (=> b!548937 m!525845))

(declare-fun m!525847 () Bool)

(assert (=> b!548938 m!525847))

(declare-fun m!525849 () Bool)

(assert (=> b!548941 m!525849))

(declare-fun m!525851 () Bool)

(assert (=> b!548942 m!525851))

(declare-fun m!525853 () Bool)

(assert (=> b!548942 m!525853))

(assert (=> b!548942 m!525853))

(declare-fun m!525855 () Bool)

(assert (=> b!548942 m!525855))

(declare-fun m!525857 () Bool)

(assert (=> b!548936 m!525857))

(assert (=> b!548936 m!525857))

(declare-fun m!525859 () Bool)

(assert (=> b!548936 m!525859))

(declare-fun m!525861 () Bool)

(assert (=> start!50122 m!525861))

(declare-fun m!525863 () Bool)

(assert (=> start!50122 m!525863))

(declare-fun m!525865 () Bool)

(assert (=> b!548940 m!525865))

(check-sat (not b!548939) (not b!548937) (not b!548936) (not b!548938) (not b!548941) (not b!548942) (not b!548940) (not start!50122))
(check-sat)
