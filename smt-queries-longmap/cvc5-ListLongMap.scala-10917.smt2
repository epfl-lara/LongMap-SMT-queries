; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128070 () Bool)

(assert start!128070)

(declare-fun b!1503372 () Bool)

(declare-fun res!1023269 () Bool)

(declare-fun e!841100 () Bool)

(assert (=> b!1503372 (=> (not res!1023269) (not e!841100))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100265 0))(
  ( (array!100266 (arr!48387 (Array (_ BitVec 32) (_ BitVec 64))) (size!48938 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100265)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503372 (= res!1023269 (and (= (size!48938 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48938 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48938 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503373 () Bool)

(declare-fun res!1023274 () Bool)

(assert (=> b!1503373 (=> (not res!1023274) (not e!841100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503373 (= res!1023274 (validKeyInArray!0 (select (arr!48387 a!2850) i!996)))))

(declare-fun b!1503375 () Bool)

(declare-fun res!1023268 () Bool)

(declare-fun e!841099 () Bool)

(assert (=> b!1503375 (=> (not res!1023268) (not e!841099))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1503375 (= res!1023268 (not (= (select (arr!48387 a!2850) index!625) (select (arr!48387 a!2850) j!87))))))

(declare-fun b!1503376 () Bool)

(declare-fun res!1023265 () Bool)

(declare-fun e!841098 () Bool)

(assert (=> b!1503376 (=> (not res!1023265) (not e!841098))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653863 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12490 0))(
  ( (MissingZero!12490 (index!52352 (_ BitVec 32))) (Found!12490 (index!52353 (_ BitVec 32))) (Intermediate!12490 (undefined!13302 Bool) (index!52354 (_ BitVec 32)) (x!134209 (_ BitVec 32))) (Undefined!12490) (MissingVacant!12490 (index!52355 (_ BitVec 32))) )
))
(declare-fun lt!653865 () SeekEntryResult!12490)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100265 (_ BitVec 32)) SeekEntryResult!12490)

(assert (=> b!1503376 (= res!1023265 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653863 vacantBefore!10 (select (arr!48387 a!2850) j!87) a!2850 mask!2661) lt!653865))))

(declare-fun b!1503377 () Bool)

(declare-fun res!1023270 () Bool)

(assert (=> b!1503377 (=> (not res!1023270) (not e!841100))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503377 (= res!1023270 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48938 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48938 a!2850)) (= (select (arr!48387 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48387 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48938 a!2850))))))

(declare-fun b!1503378 () Bool)

(assert (=> b!1503378 (= e!841098 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(assert (=> b!1503378 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653863 vacantAfter!10 (select (store (arr!48387 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100266 (store (arr!48387 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48938 a!2850)) mask!2661) lt!653865)))

(declare-datatypes ((Unit!50171 0))(
  ( (Unit!50172) )
))
(declare-fun lt!653864 () Unit!50171)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50171)

(assert (=> b!1503378 (= lt!653864 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653863 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1503379 () Bool)

(declare-fun res!1023266 () Bool)

(assert (=> b!1503379 (=> (not res!1023266) (not e!841100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100265 (_ BitVec 32)) Bool)

(assert (=> b!1503379 (= res!1023266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503380 () Bool)

(declare-fun res!1023275 () Bool)

(assert (=> b!1503380 (=> (not res!1023275) (not e!841100))))

(declare-datatypes ((List!34866 0))(
  ( (Nil!34863) (Cons!34862 (h!36274 (_ BitVec 64)) (t!49552 List!34866)) )
))
(declare-fun arrayNoDuplicates!0 (array!100265 (_ BitVec 32) List!34866) Bool)

(assert (=> b!1503380 (= res!1023275 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34863))))

(declare-fun b!1503381 () Bool)

(assert (=> b!1503381 (= e!841100 e!841099)))

(declare-fun res!1023271 () Bool)

(assert (=> b!1503381 (=> (not res!1023271) (not e!841099))))

(assert (=> b!1503381 (= res!1023271 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48387 a!2850) j!87) a!2850 mask!2661) lt!653865))))

(assert (=> b!1503381 (= lt!653865 (Found!12490 j!87))))

(declare-fun b!1503382 () Bool)

(assert (=> b!1503382 (= e!841099 e!841098)))

(declare-fun res!1023272 () Bool)

(assert (=> b!1503382 (=> (not res!1023272) (not e!841098))))

(assert (=> b!1503382 (= res!1023272 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653863 #b00000000000000000000000000000000) (bvslt lt!653863 (size!48938 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503382 (= lt!653863 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1503374 () Bool)

(declare-fun res!1023267 () Bool)

(assert (=> b!1503374 (=> (not res!1023267) (not e!841100))))

(assert (=> b!1503374 (= res!1023267 (validKeyInArray!0 (select (arr!48387 a!2850) j!87)))))

(declare-fun res!1023273 () Bool)

(assert (=> start!128070 (=> (not res!1023273) (not e!841100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128070 (= res!1023273 (validMask!0 mask!2661))))

(assert (=> start!128070 e!841100))

(assert (=> start!128070 true))

(declare-fun array_inv!37668 (array!100265) Bool)

(assert (=> start!128070 (array_inv!37668 a!2850)))

(assert (= (and start!128070 res!1023273) b!1503372))

(assert (= (and b!1503372 res!1023269) b!1503373))

(assert (= (and b!1503373 res!1023274) b!1503374))

(assert (= (and b!1503374 res!1023267) b!1503379))

(assert (= (and b!1503379 res!1023266) b!1503380))

(assert (= (and b!1503380 res!1023275) b!1503377))

(assert (= (and b!1503377 res!1023270) b!1503381))

(assert (= (and b!1503381 res!1023271) b!1503375))

(assert (= (and b!1503375 res!1023268) b!1503382))

(assert (= (and b!1503382 res!1023272) b!1503376))

(assert (= (and b!1503376 res!1023265) b!1503378))

(declare-fun m!1386565 () Bool)

(assert (=> b!1503377 m!1386565))

(declare-fun m!1386567 () Bool)

(assert (=> b!1503377 m!1386567))

(declare-fun m!1386569 () Bool)

(assert (=> b!1503377 m!1386569))

(declare-fun m!1386571 () Bool)

(assert (=> b!1503374 m!1386571))

(assert (=> b!1503374 m!1386571))

(declare-fun m!1386573 () Bool)

(assert (=> b!1503374 m!1386573))

(declare-fun m!1386575 () Bool)

(assert (=> b!1503379 m!1386575))

(declare-fun m!1386577 () Bool)

(assert (=> b!1503373 m!1386577))

(assert (=> b!1503373 m!1386577))

(declare-fun m!1386579 () Bool)

(assert (=> b!1503373 m!1386579))

(assert (=> b!1503381 m!1386571))

(assert (=> b!1503381 m!1386571))

(declare-fun m!1386581 () Bool)

(assert (=> b!1503381 m!1386581))

(declare-fun m!1386583 () Bool)

(assert (=> b!1503382 m!1386583))

(declare-fun m!1386585 () Bool)

(assert (=> b!1503375 m!1386585))

(assert (=> b!1503375 m!1386571))

(assert (=> b!1503376 m!1386571))

(assert (=> b!1503376 m!1386571))

(declare-fun m!1386587 () Bool)

(assert (=> b!1503376 m!1386587))

(declare-fun m!1386589 () Bool)

(assert (=> b!1503380 m!1386589))

(assert (=> b!1503378 m!1386567))

(declare-fun m!1386591 () Bool)

(assert (=> b!1503378 m!1386591))

(assert (=> b!1503378 m!1386591))

(declare-fun m!1386593 () Bool)

(assert (=> b!1503378 m!1386593))

(declare-fun m!1386595 () Bool)

(assert (=> b!1503378 m!1386595))

(declare-fun m!1386597 () Bool)

(assert (=> start!128070 m!1386597))

(declare-fun m!1386599 () Bool)

(assert (=> start!128070 m!1386599))

(push 1)

(assert (not b!1503376))

(assert (not b!1503382))

(assert (not b!1503380))

(assert (not start!128070))

(assert (not b!1503374))

(assert (not b!1503381))

(assert (not b!1503379))

(assert (not b!1503378))

(assert (not b!1503373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

