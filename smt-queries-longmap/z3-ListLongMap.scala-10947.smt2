; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128060 () Bool)

(assert start!128060)

(declare-fun b!1504146 () Bool)

(declare-fun e!840829 () Bool)

(assert (=> b!1504146 (= e!840829 false)))

(declare-fun lt!653644 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504146 (= lt!653644 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504147 () Bool)

(declare-fun res!1024935 () Bool)

(assert (=> b!1504147 (=> (not res!1024935) (not e!840829))))

(declare-datatypes ((array!100336 0))(
  ( (array!100337 (arr!48423 (Array (_ BitVec 32) (_ BitVec 64))) (size!48973 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100336)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100336 (_ BitVec 32)) Bool)

(assert (=> b!1504147 (= res!1024935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504148 () Bool)

(declare-fun res!1024942 () Bool)

(assert (=> b!1504148 (=> (not res!1024942) (not e!840829))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504148 (= res!1024942 (and (= (size!48973 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48973 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48973 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504149 () Bool)

(declare-fun res!1024939 () Bool)

(assert (=> b!1504149 (=> (not res!1024939) (not e!840829))))

(declare-datatypes ((List!34915 0))(
  ( (Nil!34912) (Cons!34911 (h!36308 (_ BitVec 64)) (t!49609 List!34915)) )
))
(declare-fun arrayNoDuplicates!0 (array!100336 (_ BitVec 32) List!34915) Bool)

(assert (=> b!1504149 (= res!1024939 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34912))))

(declare-fun b!1504150 () Bool)

(declare-fun res!1024938 () Bool)

(assert (=> b!1504150 (=> (not res!1024938) (not e!840829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504150 (= res!1024938 (validKeyInArray!0 (select (arr!48423 a!2850) j!87)))))

(declare-fun b!1504151 () Bool)

(declare-fun res!1024934 () Bool)

(assert (=> b!1504151 (=> (not res!1024934) (not e!840829))))

(assert (=> b!1504151 (= res!1024934 (not (= (select (arr!48423 a!2850) index!625) (select (arr!48423 a!2850) j!87))))))

(declare-fun b!1504152 () Bool)

(declare-fun res!1024937 () Bool)

(assert (=> b!1504152 (=> (not res!1024937) (not e!840829))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12621 0))(
  ( (MissingZero!12621 (index!52876 (_ BitVec 32))) (Found!12621 (index!52877 (_ BitVec 32))) (Intermediate!12621 (undefined!13433 Bool) (index!52878 (_ BitVec 32)) (x!134555 (_ BitVec 32))) (Undefined!12621) (MissingVacant!12621 (index!52879 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100336 (_ BitVec 32)) SeekEntryResult!12621)

(assert (=> b!1504152 (= res!1024937 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48423 a!2850) j!87) a!2850 mask!2661) (Found!12621 j!87)))))

(declare-fun res!1024941 () Bool)

(assert (=> start!128060 (=> (not res!1024941) (not e!840829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128060 (= res!1024941 (validMask!0 mask!2661))))

(assert (=> start!128060 e!840829))

(assert (=> start!128060 true))

(declare-fun array_inv!37451 (array!100336) Bool)

(assert (=> start!128060 (array_inv!37451 a!2850)))

(declare-fun b!1504153 () Bool)

(declare-fun res!1024936 () Bool)

(assert (=> b!1504153 (=> (not res!1024936) (not e!840829))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504153 (= res!1024936 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48973 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48973 a!2850)) (= (select (arr!48423 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48423 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48973 a!2850))))))

(declare-fun b!1504154 () Bool)

(declare-fun res!1024940 () Bool)

(assert (=> b!1504154 (=> (not res!1024940) (not e!840829))))

(assert (=> b!1504154 (= res!1024940 (validKeyInArray!0 (select (arr!48423 a!2850) i!996)))))

(assert (= (and start!128060 res!1024941) b!1504148))

(assert (= (and b!1504148 res!1024942) b!1504154))

(assert (= (and b!1504154 res!1024940) b!1504150))

(assert (= (and b!1504150 res!1024938) b!1504147))

(assert (= (and b!1504147 res!1024935) b!1504149))

(assert (= (and b!1504149 res!1024939) b!1504153))

(assert (= (and b!1504153 res!1024936) b!1504152))

(assert (= (and b!1504152 res!1024937) b!1504151))

(assert (= (and b!1504151 res!1024934) b!1504146))

(declare-fun m!1387355 () Bool)

(assert (=> b!1504153 m!1387355))

(declare-fun m!1387357 () Bool)

(assert (=> b!1504153 m!1387357))

(declare-fun m!1387359 () Bool)

(assert (=> b!1504153 m!1387359))

(declare-fun m!1387361 () Bool)

(assert (=> start!128060 m!1387361))

(declare-fun m!1387363 () Bool)

(assert (=> start!128060 m!1387363))

(declare-fun m!1387365 () Bool)

(assert (=> b!1504154 m!1387365))

(assert (=> b!1504154 m!1387365))

(declare-fun m!1387367 () Bool)

(assert (=> b!1504154 m!1387367))

(declare-fun m!1387369 () Bool)

(assert (=> b!1504146 m!1387369))

(declare-fun m!1387371 () Bool)

(assert (=> b!1504150 m!1387371))

(assert (=> b!1504150 m!1387371))

(declare-fun m!1387373 () Bool)

(assert (=> b!1504150 m!1387373))

(declare-fun m!1387375 () Bool)

(assert (=> b!1504147 m!1387375))

(assert (=> b!1504152 m!1387371))

(assert (=> b!1504152 m!1387371))

(declare-fun m!1387377 () Bool)

(assert (=> b!1504152 m!1387377))

(declare-fun m!1387379 () Bool)

(assert (=> b!1504149 m!1387379))

(declare-fun m!1387381 () Bool)

(assert (=> b!1504151 m!1387381))

(assert (=> b!1504151 m!1387371))

(check-sat (not b!1504150) (not b!1504149) (not b!1504147) (not start!128060) (not b!1504154) (not b!1504146) (not b!1504152))
