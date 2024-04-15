; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51542 () Bool)

(assert start!51542)

(declare-fun b!563860 () Bool)

(declare-fun res!355155 () Bool)

(declare-fun e!324820 () Bool)

(assert (=> b!563860 (=> (not res!355155) (not e!324820))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35416 0))(
  ( (array!35417 (arr!17009 (Array (_ BitVec 32) (_ BitVec 64))) (size!17374 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35416)

(assert (=> b!563860 (= res!355155 (and (= (size!17374 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17374 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17374 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563861 () Bool)

(declare-fun res!355160 () Bool)

(assert (=> b!563861 (=> (not res!355160) (not e!324820))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563861 (= res!355160 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563862 () Bool)

(declare-fun res!355158 () Bool)

(assert (=> b!563862 (=> (not res!355158) (not e!324820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563862 (= res!355158 (validKeyInArray!0 (select (arr!17009 a!3118) j!142)))))

(declare-fun b!563863 () Bool)

(declare-fun res!355157 () Bool)

(declare-fun e!324821 () Bool)

(assert (=> b!563863 (=> (not res!355157) (not e!324821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35416 (_ BitVec 32)) Bool)

(assert (=> b!563863 (= res!355157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563864 () Bool)

(assert (=> b!563864 (= e!324821 false)))

(declare-fun lt!257214 () Bool)

(declare-datatypes ((List!11128 0))(
  ( (Nil!11125) (Cons!11124 (h!12127 (_ BitVec 64)) (t!17347 List!11128)) )
))
(declare-fun arrayNoDuplicates!0 (array!35416 (_ BitVec 32) List!11128) Bool)

(assert (=> b!563864 (= lt!257214 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11125))))

(declare-fun res!355156 () Bool)

(assert (=> start!51542 (=> (not res!355156) (not e!324820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51542 (= res!355156 (validMask!0 mask!3119))))

(assert (=> start!51542 e!324820))

(assert (=> start!51542 true))

(declare-fun array_inv!12892 (array!35416) Bool)

(assert (=> start!51542 (array_inv!12892 a!3118)))

(declare-fun b!563865 () Bool)

(declare-fun res!355159 () Bool)

(assert (=> b!563865 (=> (not res!355159) (not e!324820))))

(assert (=> b!563865 (= res!355159 (validKeyInArray!0 k0!1914))))

(declare-fun b!563866 () Bool)

(assert (=> b!563866 (= e!324820 e!324821)))

(declare-fun res!355154 () Bool)

(assert (=> b!563866 (=> (not res!355154) (not e!324821))))

(declare-datatypes ((SeekEntryResult!5455 0))(
  ( (MissingZero!5455 (index!24047 (_ BitVec 32))) (Found!5455 (index!24048 (_ BitVec 32))) (Intermediate!5455 (undefined!6267 Bool) (index!24049 (_ BitVec 32)) (x!52937 (_ BitVec 32))) (Undefined!5455) (MissingVacant!5455 (index!24050 (_ BitVec 32))) )
))
(declare-fun lt!257215 () SeekEntryResult!5455)

(assert (=> b!563866 (= res!355154 (or (= lt!257215 (MissingZero!5455 i!1132)) (= lt!257215 (MissingVacant!5455 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35416 (_ BitVec 32)) SeekEntryResult!5455)

(assert (=> b!563866 (= lt!257215 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51542 res!355156) b!563860))

(assert (= (and b!563860 res!355155) b!563862))

(assert (= (and b!563862 res!355158) b!563865))

(assert (= (and b!563865 res!355159) b!563861))

(assert (= (and b!563861 res!355160) b!563866))

(assert (= (and b!563866 res!355154) b!563863))

(assert (= (and b!563863 res!355157) b!563864))

(declare-fun m!541823 () Bool)

(assert (=> b!563863 m!541823))

(declare-fun m!541825 () Bool)

(assert (=> b!563866 m!541825))

(declare-fun m!541827 () Bool)

(assert (=> start!51542 m!541827))

(declare-fun m!541829 () Bool)

(assert (=> start!51542 m!541829))

(declare-fun m!541831 () Bool)

(assert (=> b!563864 m!541831))

(declare-fun m!541833 () Bool)

(assert (=> b!563862 m!541833))

(assert (=> b!563862 m!541833))

(declare-fun m!541835 () Bool)

(assert (=> b!563862 m!541835))

(declare-fun m!541837 () Bool)

(assert (=> b!563861 m!541837))

(declare-fun m!541839 () Bool)

(assert (=> b!563865 m!541839))

(check-sat (not b!563866) (not b!563862) (not b!563864) (not start!51542) (not b!563865) (not b!563861) (not b!563863))
(check-sat)
