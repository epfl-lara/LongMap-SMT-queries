; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51566 () Bool)

(assert start!51566)

(declare-fun b!564123 () Bool)

(declare-fun res!355420 () Bool)

(declare-fun e!324928 () Bool)

(assert (=> b!564123 (=> (not res!355420) (not e!324928))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564123 (= res!355420 (validKeyInArray!0 k0!1914))))

(declare-fun b!564124 () Bool)

(declare-fun res!355421 () Bool)

(declare-fun e!324930 () Bool)

(assert (=> b!564124 (=> (not res!355421) (not e!324930))))

(declare-datatypes ((array!35440 0))(
  ( (array!35441 (arr!17021 (Array (_ BitVec 32) (_ BitVec 64))) (size!17386 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35440)

(declare-datatypes ((List!11140 0))(
  ( (Nil!11137) (Cons!11136 (h!12139 (_ BitVec 64)) (t!17359 List!11140)) )
))
(declare-fun arrayNoDuplicates!0 (array!35440 (_ BitVec 32) List!11140) Bool)

(assert (=> b!564124 (= res!355421 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11137))))

(declare-fun res!355418 () Bool)

(assert (=> start!51566 (=> (not res!355418) (not e!324928))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51566 (= res!355418 (validMask!0 mask!3119))))

(assert (=> start!51566 e!324928))

(assert (=> start!51566 true))

(declare-fun array_inv!12904 (array!35440) Bool)

(assert (=> start!51566 (array_inv!12904 a!3118)))

(declare-fun b!564125 () Bool)

(declare-fun res!355424 () Bool)

(assert (=> b!564125 (=> (not res!355424) (not e!324930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35440 (_ BitVec 32)) Bool)

(assert (=> b!564125 (= res!355424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564126 () Bool)

(assert (=> b!564126 (= e!324928 e!324930)))

(declare-fun res!355417 () Bool)

(assert (=> b!564126 (=> (not res!355417) (not e!324930))))

(declare-datatypes ((SeekEntryResult!5467 0))(
  ( (MissingZero!5467 (index!24095 (_ BitVec 32))) (Found!5467 (index!24096 (_ BitVec 32))) (Intermediate!5467 (undefined!6279 Bool) (index!24097 (_ BitVec 32)) (x!52981 (_ BitVec 32))) (Undefined!5467) (MissingVacant!5467 (index!24098 (_ BitVec 32))) )
))
(declare-fun lt!257286 () SeekEntryResult!5467)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564126 (= res!355417 (or (= lt!257286 (MissingZero!5467 i!1132)) (= lt!257286 (MissingVacant!5467 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35440 (_ BitVec 32)) SeekEntryResult!5467)

(assert (=> b!564126 (= lt!257286 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564127 () Bool)

(assert (=> b!564127 (= e!324930 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257287 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564127 (= lt!257287 (toIndex!0 (select (store (arr!17021 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!564128 () Bool)

(declare-fun res!355423 () Bool)

(assert (=> b!564128 (=> (not res!355423) (not e!324928))))

(assert (=> b!564128 (= res!355423 (validKeyInArray!0 (select (arr!17021 a!3118) j!142)))))

(declare-fun b!564129 () Bool)

(declare-fun res!355422 () Bool)

(assert (=> b!564129 (=> (not res!355422) (not e!324928))))

(declare-fun arrayContainsKey!0 (array!35440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564129 (= res!355422 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564130 () Bool)

(declare-fun res!355419 () Bool)

(assert (=> b!564130 (=> (not res!355419) (not e!324928))))

(assert (=> b!564130 (= res!355419 (and (= (size!17386 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17386 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17386 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51566 res!355418) b!564130))

(assert (= (and b!564130 res!355419) b!564128))

(assert (= (and b!564128 res!355423) b!564123))

(assert (= (and b!564123 res!355420) b!564129))

(assert (= (and b!564129 res!355422) b!564126))

(assert (= (and b!564126 res!355417) b!564125))

(assert (= (and b!564125 res!355424) b!564124))

(assert (= (and b!564124 res!355421) b!564127))

(declare-fun m!542045 () Bool)

(assert (=> b!564126 m!542045))

(declare-fun m!542047 () Bool)

(assert (=> b!564124 m!542047))

(declare-fun m!542049 () Bool)

(assert (=> b!564128 m!542049))

(assert (=> b!564128 m!542049))

(declare-fun m!542051 () Bool)

(assert (=> b!564128 m!542051))

(declare-fun m!542053 () Bool)

(assert (=> b!564129 m!542053))

(declare-fun m!542055 () Bool)

(assert (=> b!564125 m!542055))

(declare-fun m!542057 () Bool)

(assert (=> b!564127 m!542057))

(declare-fun m!542059 () Bool)

(assert (=> b!564127 m!542059))

(assert (=> b!564127 m!542059))

(declare-fun m!542061 () Bool)

(assert (=> b!564127 m!542061))

(declare-fun m!542063 () Bool)

(assert (=> start!51566 m!542063))

(declare-fun m!542065 () Bool)

(assert (=> start!51566 m!542065))

(declare-fun m!542067 () Bool)

(assert (=> b!564123 m!542067))

(check-sat (not b!564126) (not b!564127) (not b!564124) (not b!564129) (not start!51566) (not b!564125) (not b!564128) (not b!564123))
(check-sat)
