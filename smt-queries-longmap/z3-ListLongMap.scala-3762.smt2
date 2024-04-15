; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51554 () Bool)

(assert start!51554)

(declare-fun b!563988 () Bool)

(declare-fun res!355289 () Bool)

(declare-fun e!324876 () Bool)

(assert (=> b!563988 (=> (not res!355289) (not e!324876))))

(declare-datatypes ((array!35428 0))(
  ( (array!35429 (arr!17015 (Array (_ BitVec 32) (_ BitVec 64))) (size!17380 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35428)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563988 (= res!355289 (validKeyInArray!0 (select (arr!17015 a!3118) j!142)))))

(declare-fun b!563989 () Bool)

(declare-fun res!355284 () Bool)

(declare-fun e!324874 () Bool)

(assert (=> b!563989 (=> (not res!355284) (not e!324874))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35428 (_ BitVec 32)) Bool)

(assert (=> b!563989 (= res!355284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563990 () Bool)

(assert (=> b!563990 (= e!324876 e!324874)))

(declare-fun res!355285 () Bool)

(assert (=> b!563990 (=> (not res!355285) (not e!324874))))

(declare-datatypes ((SeekEntryResult!5461 0))(
  ( (MissingZero!5461 (index!24071 (_ BitVec 32))) (Found!5461 (index!24072 (_ BitVec 32))) (Intermediate!5461 (undefined!6273 Bool) (index!24073 (_ BitVec 32)) (x!52959 (_ BitVec 32))) (Undefined!5461) (MissingVacant!5461 (index!24074 (_ BitVec 32))) )
))
(declare-fun lt!257250 () SeekEntryResult!5461)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563990 (= res!355285 (or (= lt!257250 (MissingZero!5461 i!1132)) (= lt!257250 (MissingVacant!5461 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35428 (_ BitVec 32)) SeekEntryResult!5461)

(assert (=> b!563990 (= lt!257250 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563991 () Bool)

(assert (=> b!563991 (= e!324874 false)))

(declare-fun lt!257251 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563991 (= lt!257251 (toIndex!0 (select (arr!17015 a!3118) j!142) mask!3119))))

(declare-fun res!355283 () Bool)

(assert (=> start!51554 (=> (not res!355283) (not e!324876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51554 (= res!355283 (validMask!0 mask!3119))))

(assert (=> start!51554 e!324876))

(assert (=> start!51554 true))

(declare-fun array_inv!12898 (array!35428) Bool)

(assert (=> start!51554 (array_inv!12898 a!3118)))

(declare-fun b!563992 () Bool)

(declare-fun res!355287 () Bool)

(assert (=> b!563992 (=> (not res!355287) (not e!324876))))

(assert (=> b!563992 (= res!355287 (and (= (size!17380 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17380 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17380 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563993 () Bool)

(declare-fun res!355288 () Bool)

(assert (=> b!563993 (=> (not res!355288) (not e!324874))))

(declare-datatypes ((List!11134 0))(
  ( (Nil!11131) (Cons!11130 (h!12133 (_ BitVec 64)) (t!17353 List!11134)) )
))
(declare-fun arrayNoDuplicates!0 (array!35428 (_ BitVec 32) List!11134) Bool)

(assert (=> b!563993 (= res!355288 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11131))))

(declare-fun b!563994 () Bool)

(declare-fun res!355286 () Bool)

(assert (=> b!563994 (=> (not res!355286) (not e!324876))))

(declare-fun arrayContainsKey!0 (array!35428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563994 (= res!355286 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563995 () Bool)

(declare-fun res!355282 () Bool)

(assert (=> b!563995 (=> (not res!355282) (not e!324876))))

(assert (=> b!563995 (= res!355282 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51554 res!355283) b!563992))

(assert (= (and b!563992 res!355287) b!563988))

(assert (= (and b!563988 res!355289) b!563995))

(assert (= (and b!563995 res!355282) b!563994))

(assert (= (and b!563994 res!355286) b!563990))

(assert (= (and b!563990 res!355285) b!563989))

(assert (= (and b!563989 res!355284) b!563993))

(assert (= (and b!563993 res!355288) b!563991))

(declare-fun m!541931 () Bool)

(assert (=> b!563994 m!541931))

(declare-fun m!541933 () Bool)

(assert (=> b!563991 m!541933))

(assert (=> b!563991 m!541933))

(declare-fun m!541935 () Bool)

(assert (=> b!563991 m!541935))

(declare-fun m!541937 () Bool)

(assert (=> b!563995 m!541937))

(declare-fun m!541939 () Bool)

(assert (=> b!563989 m!541939))

(assert (=> b!563988 m!541933))

(assert (=> b!563988 m!541933))

(declare-fun m!541941 () Bool)

(assert (=> b!563988 m!541941))

(declare-fun m!541943 () Bool)

(assert (=> b!563993 m!541943))

(declare-fun m!541945 () Bool)

(assert (=> b!563990 m!541945))

(declare-fun m!541947 () Bool)

(assert (=> start!51554 m!541947))

(declare-fun m!541949 () Bool)

(assert (=> start!51554 m!541949))

(check-sat (not b!563991) (not b!563993) (not b!563995) (not b!563988) (not start!51554) (not b!563989) (not b!563990) (not b!563994))
(check-sat)
