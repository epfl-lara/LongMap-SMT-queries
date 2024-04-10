; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50128 () Bool)

(assert start!50128)

(declare-fun b!549007 () Bool)

(declare-fun res!342239 () Bool)

(declare-fun e!317123 () Bool)

(assert (=> b!549007 (=> (not res!342239) (not e!317123))))

(declare-datatypes ((array!34626 0))(
  ( (array!34627 (arr!16630 (Array (_ BitVec 32) (_ BitVec 64))) (size!16994 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34626)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549007 (= res!342239 (validKeyInArray!0 (select (arr!16630 a!3118) j!142)))))

(declare-fun b!549008 () Bool)

(declare-fun res!342245 () Bool)

(declare-fun e!317124 () Bool)

(assert (=> b!549008 (=> (not res!342245) (not e!317124))))

(declare-datatypes ((List!10710 0))(
  ( (Nil!10707) (Cons!10706 (h!11676 (_ BitVec 64)) (t!16938 List!10710)) )
))
(declare-fun arrayNoDuplicates!0 (array!34626 (_ BitVec 32) List!10710) Bool)

(assert (=> b!549008 (= res!342245 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10707))))

(declare-fun b!549009 () Bool)

(declare-fun res!342238 () Bool)

(assert (=> b!549009 (=> (not res!342238) (not e!317123))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549009 (= res!342238 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549010 () Bool)

(assert (=> b!549010 (= e!317123 e!317124)))

(declare-fun res!342242 () Bool)

(assert (=> b!549010 (=> (not res!342242) (not e!317124))))

(declare-datatypes ((SeekEntryResult!5079 0))(
  ( (MissingZero!5079 (index!22543 (_ BitVec 32))) (Found!5079 (index!22544 (_ BitVec 32))) (Intermediate!5079 (undefined!5891 Bool) (index!22545 (_ BitVec 32)) (x!51478 (_ BitVec 32))) (Undefined!5079) (MissingVacant!5079 (index!22546 (_ BitVec 32))) )
))
(declare-fun lt!249982 () SeekEntryResult!5079)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549010 (= res!342242 (or (= lt!249982 (MissingZero!5079 i!1132)) (= lt!249982 (MissingVacant!5079 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34626 (_ BitVec 32)) SeekEntryResult!5079)

(assert (=> b!549010 (= lt!249982 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!342243 () Bool)

(assert (=> start!50128 (=> (not res!342243) (not e!317123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50128 (= res!342243 (validMask!0 mask!3119))))

(assert (=> start!50128 e!317123))

(assert (=> start!50128 true))

(declare-fun array_inv!12426 (array!34626) Bool)

(assert (=> start!50128 (array_inv!12426 a!3118)))

(declare-fun b!549011 () Bool)

(assert (=> b!549011 (= e!317124 false)))

(declare-fun lt!249981 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549011 (= lt!249981 (toIndex!0 (select (store (arr!16630 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549012 () Bool)

(declare-fun res!342241 () Bool)

(assert (=> b!549012 (=> (not res!342241) (not e!317124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34626 (_ BitVec 32)) Bool)

(assert (=> b!549012 (= res!342241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549013 () Bool)

(declare-fun res!342244 () Bool)

(assert (=> b!549013 (=> (not res!342244) (not e!317123))))

(assert (=> b!549013 (= res!342244 (and (= (size!16994 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16994 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16994 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549014 () Bool)

(declare-fun res!342240 () Bool)

(assert (=> b!549014 (=> (not res!342240) (not e!317123))))

(assert (=> b!549014 (= res!342240 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50128 res!342243) b!549013))

(assert (= (and b!549013 res!342244) b!549007))

(assert (= (and b!549007 res!342239) b!549014))

(assert (= (and b!549014 res!342240) b!549009))

(assert (= (and b!549009 res!342238) b!549010))

(assert (= (and b!549010 res!342242) b!549012))

(assert (= (and b!549012 res!342241) b!549008))

(assert (= (and b!549008 res!342245) b!549011))

(declare-fun m!525915 () Bool)

(assert (=> b!549008 m!525915))

(declare-fun m!525917 () Bool)

(assert (=> b!549007 m!525917))

(assert (=> b!549007 m!525917))

(declare-fun m!525919 () Bool)

(assert (=> b!549007 m!525919))

(declare-fun m!525921 () Bool)

(assert (=> b!549014 m!525921))

(declare-fun m!525923 () Bool)

(assert (=> start!50128 m!525923))

(declare-fun m!525925 () Bool)

(assert (=> start!50128 m!525925))

(declare-fun m!525927 () Bool)

(assert (=> b!549010 m!525927))

(declare-fun m!525929 () Bool)

(assert (=> b!549009 m!525929))

(declare-fun m!525931 () Bool)

(assert (=> b!549011 m!525931))

(declare-fun m!525933 () Bool)

(assert (=> b!549011 m!525933))

(assert (=> b!549011 m!525933))

(declare-fun m!525935 () Bool)

(assert (=> b!549011 m!525935))

(declare-fun m!525937 () Bool)

(assert (=> b!549012 m!525937))

(check-sat (not b!549014) (not start!50128) (not b!549007) (not b!549010) (not b!549012) (not b!549008) (not b!549011) (not b!549009))
(check-sat)
