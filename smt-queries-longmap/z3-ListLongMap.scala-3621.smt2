; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49924 () Bool)

(assert start!49924)

(declare-fun b!547684 () Bool)

(declare-fun res!341187 () Bool)

(declare-fun e!316474 () Bool)

(assert (=> b!547684 (=> (not res!341187) (not e!316474))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547684 (= res!341187 (validKeyInArray!0 k0!1914))))

(declare-fun b!547685 () Bool)

(declare-fun e!316475 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!547685 (= e!316475 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!547686 () Bool)

(declare-fun res!341184 () Bool)

(assert (=> b!547686 (=> (not res!341184) (not e!316474))))

(declare-datatypes ((array!34545 0))(
  ( (array!34546 (arr!16594 (Array (_ BitVec 32) (_ BitVec 64))) (size!16958 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34545)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!547686 (= res!341184 (validKeyInArray!0 (select (arr!16594 a!3118) j!142)))))

(declare-fun b!547687 () Bool)

(declare-fun res!341185 () Bool)

(assert (=> b!547687 (=> (not res!341185) (not e!316475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34545 (_ BitVec 32)) Bool)

(assert (=> b!547687 (= res!341185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341189 () Bool)

(assert (=> start!49924 (=> (not res!341189) (not e!316474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49924 (= res!341189 (validMask!0 mask!3119))))

(assert (=> start!49924 e!316474))

(assert (=> start!49924 true))

(declare-fun array_inv!12390 (array!34545) Bool)

(assert (=> start!49924 (array_inv!12390 a!3118)))

(declare-fun b!547688 () Bool)

(assert (=> b!547688 (= e!316474 e!316475)))

(declare-fun res!341183 () Bool)

(assert (=> b!547688 (=> (not res!341183) (not e!316475))))

(declare-datatypes ((SeekEntryResult!5043 0))(
  ( (MissingZero!5043 (index!22399 (_ BitVec 32))) (Found!5043 (index!22400 (_ BitVec 32))) (Intermediate!5043 (undefined!5855 Bool) (index!22401 (_ BitVec 32)) (x!51343 (_ BitVec 32))) (Undefined!5043) (MissingVacant!5043 (index!22402 (_ BitVec 32))) )
))
(declare-fun lt!249616 () SeekEntryResult!5043)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547688 (= res!341183 (or (= lt!249616 (MissingZero!5043 i!1132)) (= lt!249616 (MissingVacant!5043 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34545 (_ BitVec 32)) SeekEntryResult!5043)

(assert (=> b!547688 (= lt!249616 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547689 () Bool)

(declare-fun res!341182 () Bool)

(assert (=> b!547689 (=> (not res!341182) (not e!316474))))

(assert (=> b!547689 (= res!341182 (and (= (size!16958 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16958 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16958 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547690 () Bool)

(declare-fun res!341186 () Bool)

(assert (=> b!547690 (=> (not res!341186) (not e!316475))))

(declare-datatypes ((List!10674 0))(
  ( (Nil!10671) (Cons!10670 (h!11637 (_ BitVec 64)) (t!16902 List!10674)) )
))
(declare-fun arrayNoDuplicates!0 (array!34545 (_ BitVec 32) List!10674) Bool)

(assert (=> b!547690 (= res!341186 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10671))))

(declare-fun b!547691 () Bool)

(declare-fun res!341188 () Bool)

(assert (=> b!547691 (=> (not res!341188) (not e!316474))))

(declare-fun arrayContainsKey!0 (array!34545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547691 (= res!341188 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49924 res!341189) b!547689))

(assert (= (and b!547689 res!341182) b!547686))

(assert (= (and b!547686 res!341184) b!547684))

(assert (= (and b!547684 res!341187) b!547691))

(assert (= (and b!547691 res!341188) b!547688))

(assert (= (and b!547688 res!341183) b!547687))

(assert (= (and b!547687 res!341185) b!547690))

(assert (= (and b!547690 res!341186) b!547685))

(declare-fun m!524901 () Bool)

(assert (=> b!547690 m!524901))

(declare-fun m!524903 () Bool)

(assert (=> start!49924 m!524903))

(declare-fun m!524905 () Bool)

(assert (=> start!49924 m!524905))

(declare-fun m!524907 () Bool)

(assert (=> b!547691 m!524907))

(declare-fun m!524909 () Bool)

(assert (=> b!547686 m!524909))

(assert (=> b!547686 m!524909))

(declare-fun m!524911 () Bool)

(assert (=> b!547686 m!524911))

(declare-fun m!524913 () Bool)

(assert (=> b!547688 m!524913))

(declare-fun m!524915 () Bool)

(assert (=> b!547684 m!524915))

(declare-fun m!524917 () Bool)

(assert (=> b!547687 m!524917))

(check-sat (not b!547687) (not b!547690) (not b!547684) (not b!547691) (not start!49924) (not b!547688) (not b!547686))
(check-sat)
