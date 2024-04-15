; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50630 () Bool)

(assert start!50630)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5188 0))(
  ( (MissingZero!5188 (index!22979 (_ BitVec 32))) (Found!5188 (index!22980 (_ BitVec 32))) (Intermediate!5188 (undefined!6000 Bool) (index!22981 (_ BitVec 32)) (x!51913 (_ BitVec 32))) (Undefined!5188) (MissingVacant!5188 (index!22982 (_ BitVec 32))) )
))
(declare-fun lt!251282 () SeekEntryResult!5188)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!319131 () Bool)

(declare-fun b!553282 () Bool)

(declare-datatypes ((array!34864 0))(
  ( (array!34865 (arr!16742 (Array (_ BitVec 32) (_ BitVec 64))) (size!17107 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34864)

(get-info :version)

(assert (=> b!553282 (= e!319131 (not (or (not ((_ is Intermediate!5188) lt!251282)) (undefined!6000 lt!251282) (not (= (select (arr!16742 a!3118) (index!22981 lt!251282)) (select (arr!16742 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319128 () Bool)

(assert (=> b!553282 e!319128))

(declare-fun res!345836 () Bool)

(assert (=> b!553282 (=> (not res!345836) (not e!319128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34864 (_ BitVec 32)) Bool)

(assert (=> b!553282 (= res!345836 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17136 0))(
  ( (Unit!17137) )
))
(declare-fun lt!251281 () Unit!17136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17136)

(assert (=> b!553282 (= lt!251281 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553283 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34864 (_ BitVec 32)) SeekEntryResult!5188)

(assert (=> b!553283 (= e!319128 (= (seekEntryOrOpen!0 (select (arr!16742 a!3118) j!142) a!3118 mask!3119) (Found!5188 j!142)))))

(declare-fun b!553284 () Bool)

(declare-fun e!319130 () Bool)

(declare-fun e!319129 () Bool)

(assert (=> b!553284 (= e!319130 e!319129)))

(declare-fun res!345845 () Bool)

(assert (=> b!553284 (=> (not res!345845) (not e!319129))))

(declare-fun lt!251284 () SeekEntryResult!5188)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553284 (= res!345845 (or (= lt!251284 (MissingZero!5188 i!1132)) (= lt!251284 (MissingVacant!5188 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!553284 (= lt!251284 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553285 () Bool)

(assert (=> b!553285 (= e!319129 e!319131)))

(declare-fun res!345844 () Bool)

(assert (=> b!553285 (=> (not res!345844) (not e!319131))))

(declare-fun lt!251283 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34864 (_ BitVec 32)) SeekEntryResult!5188)

(assert (=> b!553285 (= res!345844 (= lt!251282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251283 (select (store (arr!16742 a!3118) i!1132 k0!1914) j!142) (array!34865 (store (arr!16742 a!3118) i!1132 k0!1914) (size!17107 a!3118)) mask!3119)))))

(declare-fun lt!251280 () (_ BitVec 32))

(assert (=> b!553285 (= lt!251282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251280 (select (arr!16742 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553285 (= lt!251283 (toIndex!0 (select (store (arr!16742 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553285 (= lt!251280 (toIndex!0 (select (arr!16742 a!3118) j!142) mask!3119))))

(declare-fun res!345839 () Bool)

(assert (=> start!50630 (=> (not res!345839) (not e!319130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50630 (= res!345839 (validMask!0 mask!3119))))

(assert (=> start!50630 e!319130))

(assert (=> start!50630 true))

(declare-fun array_inv!12625 (array!34864) Bool)

(assert (=> start!50630 (array_inv!12625 a!3118)))

(declare-fun b!553286 () Bool)

(declare-fun res!345841 () Bool)

(assert (=> b!553286 (=> (not res!345841) (not e!319130))))

(assert (=> b!553286 (= res!345841 (and (= (size!17107 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17107 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17107 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553287 () Bool)

(declare-fun res!345838 () Bool)

(assert (=> b!553287 (=> (not res!345838) (not e!319130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553287 (= res!345838 (validKeyInArray!0 k0!1914))))

(declare-fun b!553288 () Bool)

(declare-fun res!345840 () Bool)

(assert (=> b!553288 (=> (not res!345840) (not e!319129))))

(declare-datatypes ((List!10861 0))(
  ( (Nil!10858) (Cons!10857 (h!11842 (_ BitVec 64)) (t!17080 List!10861)) )
))
(declare-fun arrayNoDuplicates!0 (array!34864 (_ BitVec 32) List!10861) Bool)

(assert (=> b!553288 (= res!345840 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10858))))

(declare-fun b!553289 () Bool)

(declare-fun res!345843 () Bool)

(assert (=> b!553289 (=> (not res!345843) (not e!319130))))

(assert (=> b!553289 (= res!345843 (validKeyInArray!0 (select (arr!16742 a!3118) j!142)))))

(declare-fun b!553290 () Bool)

(declare-fun res!345842 () Bool)

(assert (=> b!553290 (=> (not res!345842) (not e!319130))))

(declare-fun arrayContainsKey!0 (array!34864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553290 (= res!345842 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553291 () Bool)

(declare-fun res!345837 () Bool)

(assert (=> b!553291 (=> (not res!345837) (not e!319129))))

(assert (=> b!553291 (= res!345837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50630 res!345839) b!553286))

(assert (= (and b!553286 res!345841) b!553289))

(assert (= (and b!553289 res!345843) b!553287))

(assert (= (and b!553287 res!345838) b!553290))

(assert (= (and b!553290 res!345842) b!553284))

(assert (= (and b!553284 res!345845) b!553291))

(assert (= (and b!553291 res!345837) b!553288))

(assert (= (and b!553288 res!345840) b!553285))

(assert (= (and b!553285 res!345844) b!553282))

(assert (= (and b!553282 res!345836) b!553283))

(declare-fun m!529883 () Bool)

(assert (=> b!553290 m!529883))

(declare-fun m!529885 () Bool)

(assert (=> b!553287 m!529885))

(declare-fun m!529887 () Bool)

(assert (=> b!553283 m!529887))

(assert (=> b!553283 m!529887))

(declare-fun m!529889 () Bool)

(assert (=> b!553283 m!529889))

(assert (=> b!553285 m!529887))

(declare-fun m!529891 () Bool)

(assert (=> b!553285 m!529891))

(assert (=> b!553285 m!529887))

(declare-fun m!529893 () Bool)

(assert (=> b!553285 m!529893))

(assert (=> b!553285 m!529887))

(declare-fun m!529895 () Bool)

(assert (=> b!553285 m!529895))

(assert (=> b!553285 m!529893))

(declare-fun m!529897 () Bool)

(assert (=> b!553285 m!529897))

(declare-fun m!529899 () Bool)

(assert (=> b!553285 m!529899))

(assert (=> b!553285 m!529893))

(declare-fun m!529901 () Bool)

(assert (=> b!553285 m!529901))

(declare-fun m!529903 () Bool)

(assert (=> start!50630 m!529903))

(declare-fun m!529905 () Bool)

(assert (=> start!50630 m!529905))

(declare-fun m!529907 () Bool)

(assert (=> b!553282 m!529907))

(assert (=> b!553282 m!529887))

(declare-fun m!529909 () Bool)

(assert (=> b!553282 m!529909))

(declare-fun m!529911 () Bool)

(assert (=> b!553282 m!529911))

(declare-fun m!529913 () Bool)

(assert (=> b!553284 m!529913))

(declare-fun m!529915 () Bool)

(assert (=> b!553291 m!529915))

(assert (=> b!553289 m!529887))

(assert (=> b!553289 m!529887))

(declare-fun m!529917 () Bool)

(assert (=> b!553289 m!529917))

(declare-fun m!529919 () Bool)

(assert (=> b!553288 m!529919))

(check-sat (not b!553287) (not b!553290) (not b!553285) (not start!50630) (not b!553288) (not b!553283) (not b!553289) (not b!553284) (not b!553282) (not b!553291))
(check-sat)
