; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51548 () Bool)

(assert start!51548)

(declare-fun b!563923 () Bool)

(declare-fun res!355218 () Bool)

(declare-fun e!324847 () Bool)

(assert (=> b!563923 (=> (not res!355218) (not e!324847))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563923 (= res!355218 (validKeyInArray!0 k0!1914))))

(declare-fun b!563924 () Bool)

(declare-fun res!355220 () Bool)

(assert (=> b!563924 (=> (not res!355220) (not e!324847))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35422 0))(
  ( (array!35423 (arr!17012 (Array (_ BitVec 32) (_ BitVec 64))) (size!17377 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35422)

(assert (=> b!563924 (= res!355220 (and (= (size!17377 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17377 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17377 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563925 () Bool)

(declare-fun e!324848 () Bool)

(assert (=> b!563925 (= e!324847 e!324848)))

(declare-fun res!355219 () Bool)

(assert (=> b!563925 (=> (not res!355219) (not e!324848))))

(declare-datatypes ((SeekEntryResult!5458 0))(
  ( (MissingZero!5458 (index!24059 (_ BitVec 32))) (Found!5458 (index!24060 (_ BitVec 32))) (Intermediate!5458 (undefined!6270 Bool) (index!24061 (_ BitVec 32)) (x!52948 (_ BitVec 32))) (Undefined!5458) (MissingVacant!5458 (index!24062 (_ BitVec 32))) )
))
(declare-fun lt!257232 () SeekEntryResult!5458)

(assert (=> b!563925 (= res!355219 (or (= lt!257232 (MissingZero!5458 i!1132)) (= lt!257232 (MissingVacant!5458 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35422 (_ BitVec 32)) SeekEntryResult!5458)

(assert (=> b!563925 (= lt!257232 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563926 () Bool)

(declare-fun res!355223 () Bool)

(assert (=> b!563926 (=> (not res!355223) (not e!324847))))

(declare-fun arrayContainsKey!0 (array!35422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563926 (= res!355223 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563927 () Bool)

(assert (=> b!563927 (= e!324848 false)))

(declare-fun lt!257233 () Bool)

(declare-datatypes ((List!11131 0))(
  ( (Nil!11128) (Cons!11127 (h!12130 (_ BitVec 64)) (t!17350 List!11131)) )
))
(declare-fun arrayNoDuplicates!0 (array!35422 (_ BitVec 32) List!11131) Bool)

(assert (=> b!563927 (= lt!257233 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11128))))

(declare-fun b!563928 () Bool)

(declare-fun res!355222 () Bool)

(assert (=> b!563928 (=> (not res!355222) (not e!324847))))

(assert (=> b!563928 (= res!355222 (validKeyInArray!0 (select (arr!17012 a!3118) j!142)))))

(declare-fun res!355217 () Bool)

(assert (=> start!51548 (=> (not res!355217) (not e!324847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51548 (= res!355217 (validMask!0 mask!3119))))

(assert (=> start!51548 e!324847))

(assert (=> start!51548 true))

(declare-fun array_inv!12895 (array!35422) Bool)

(assert (=> start!51548 (array_inv!12895 a!3118)))

(declare-fun b!563929 () Bool)

(declare-fun res!355221 () Bool)

(assert (=> b!563929 (=> (not res!355221) (not e!324848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35422 (_ BitVec 32)) Bool)

(assert (=> b!563929 (= res!355221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51548 res!355217) b!563924))

(assert (= (and b!563924 res!355220) b!563928))

(assert (= (and b!563928 res!355222) b!563923))

(assert (= (and b!563923 res!355218) b!563926))

(assert (= (and b!563926 res!355223) b!563925))

(assert (= (and b!563925 res!355219) b!563929))

(assert (= (and b!563929 res!355221) b!563927))

(declare-fun m!541877 () Bool)

(assert (=> b!563926 m!541877))

(declare-fun m!541879 () Bool)

(assert (=> b!563929 m!541879))

(declare-fun m!541881 () Bool)

(assert (=> b!563923 m!541881))

(declare-fun m!541883 () Bool)

(assert (=> start!51548 m!541883))

(declare-fun m!541885 () Bool)

(assert (=> start!51548 m!541885))

(declare-fun m!541887 () Bool)

(assert (=> b!563925 m!541887))

(declare-fun m!541889 () Bool)

(assert (=> b!563928 m!541889))

(assert (=> b!563928 m!541889))

(declare-fun m!541891 () Bool)

(assert (=> b!563928 m!541891))

(declare-fun m!541893 () Bool)

(assert (=> b!563927 m!541893))

(check-sat (not b!563927) (not b!563923) (not b!563926) (not b!563928) (not b!563929) (not start!51548) (not b!563925))
(check-sat)
