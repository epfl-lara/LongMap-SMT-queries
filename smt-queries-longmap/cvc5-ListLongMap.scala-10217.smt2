; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120354 () Bool)

(assert start!120354)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95763 0))(
  ( (array!95764 (arr!46232 (Array (_ BitVec 32) (_ BitVec 64))) (size!46782 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95763)

(declare-datatypes ((SeekEntryResult!10549 0))(
  ( (MissingZero!10549 (index!44573 (_ BitVec 32))) (Found!10549 (index!44574 (_ BitVec 32))) (Intermediate!10549 (undefined!11361 Bool) (index!44575 (_ BitVec 32)) (x!126216 (_ BitVec 32))) (Undefined!10549) (MissingVacant!10549 (index!44576 (_ BitVec 32))) )
))
(declare-fun lt!616504 () SeekEntryResult!10549)

(declare-fun lt!616508 () array!95763)

(declare-fun e!793159 () Bool)

(declare-fun b!1400849 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!616505 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95763 (_ BitVec 32)) SeekEntryResult!10549)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95763 (_ BitVec 32)) SeekEntryResult!10549)

(assert (=> b!1400849 (= e!793159 (= (seekEntryOrOpen!0 lt!616505 lt!616508 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126216 lt!616504) (index!44575 lt!616504) (index!44575 lt!616504) (select (arr!46232 a!2901) j!112) lt!616508 mask!2840)))))

(declare-fun b!1400850 () Bool)

(declare-fun res!939364 () Bool)

(declare-fun e!793160 () Bool)

(assert (=> b!1400850 (=> (not res!939364) (not e!793160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400850 (= res!939364 (validKeyInArray!0 (select (arr!46232 a!2901) j!112)))))

(declare-fun b!1400851 () Bool)

(declare-fun res!939360 () Bool)

(assert (=> b!1400851 (=> (not res!939360) (not e!793160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95763 (_ BitVec 32)) Bool)

(assert (=> b!1400851 (= res!939360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400852 () Bool)

(declare-fun res!939363 () Bool)

(assert (=> b!1400852 (=> (not res!939363) (not e!793160))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400852 (= res!939363 (and (= (size!46782 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46782 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46782 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400853 () Bool)

(declare-fun res!939370 () Bool)

(assert (=> b!1400853 (=> (not res!939370) (not e!793160))))

(declare-datatypes ((List!32751 0))(
  ( (Nil!32748) (Cons!32747 (h!33995 (_ BitVec 64)) (t!47445 List!32751)) )
))
(declare-fun arrayNoDuplicates!0 (array!95763 (_ BitVec 32) List!32751) Bool)

(assert (=> b!1400853 (= res!939370 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32748))))

(declare-fun b!1400855 () Bool)

(declare-fun res!939367 () Bool)

(assert (=> b!1400855 (=> (not res!939367) (not e!793160))))

(assert (=> b!1400855 (= res!939367 (validKeyInArray!0 (select (arr!46232 a!2901) i!1037)))))

(declare-fun b!1400856 () Bool)

(declare-fun e!793161 () Bool)

(declare-fun e!793158 () Bool)

(assert (=> b!1400856 (= e!793161 e!793158)))

(declare-fun res!939366 () Bool)

(assert (=> b!1400856 (=> res!939366 e!793158)))

(declare-fun lt!616507 () (_ BitVec 32))

(declare-fun lt!616503 () SeekEntryResult!10549)

(assert (=> b!1400856 (= res!939366 (or (bvslt (x!126216 lt!616503) #b00000000000000000000000000000000) (bvsgt (x!126216 lt!616503) #b01111111111111111111111111111110) (bvslt (x!126216 lt!616504) #b00000000000000000000000000000000) (bvsgt (x!126216 lt!616504) #b01111111111111111111111111111110) (bvslt lt!616507 #b00000000000000000000000000000000) (bvsge lt!616507 (size!46782 a!2901)) (bvslt (index!44575 lt!616503) #b00000000000000000000000000000000) (bvsge (index!44575 lt!616503) (size!46782 a!2901)) (bvslt (index!44575 lt!616504) #b00000000000000000000000000000000) (bvsge (index!44575 lt!616504) (size!46782 a!2901)) (not (= lt!616503 (Intermediate!10549 false (index!44575 lt!616503) (x!126216 lt!616503)))) (not (= lt!616504 (Intermediate!10549 false (index!44575 lt!616504) (x!126216 lt!616504))))))))

(assert (=> b!1400856 e!793159))

(declare-fun res!939368 () Bool)

(assert (=> b!1400856 (=> (not res!939368) (not e!793159))))

(assert (=> b!1400856 (= res!939368 (and (not (undefined!11361 lt!616504)) (= (index!44575 lt!616504) i!1037) (bvslt (x!126216 lt!616504) (x!126216 lt!616503)) (= (select (store (arr!46232 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44575 lt!616504)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47102 0))(
  ( (Unit!47103) )
))
(declare-fun lt!616509 () Unit!47102)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47102)

(assert (=> b!1400856 (= lt!616509 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616507 (x!126216 lt!616503) (index!44575 lt!616503) (x!126216 lt!616504) (index!44575 lt!616504) (undefined!11361 lt!616504) mask!2840))))

(declare-fun b!1400857 () Bool)

(declare-fun e!793163 () Bool)

(assert (=> b!1400857 (= e!793160 (not e!793163))))

(declare-fun res!939365 () Bool)

(assert (=> b!1400857 (=> res!939365 e!793163)))

(assert (=> b!1400857 (= res!939365 (or (not (is-Intermediate!10549 lt!616503)) (undefined!11361 lt!616503)))))

(declare-fun e!793157 () Bool)

(assert (=> b!1400857 e!793157))

(declare-fun res!939361 () Bool)

(assert (=> b!1400857 (=> (not res!939361) (not e!793157))))

(assert (=> b!1400857 (= res!939361 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616502 () Unit!47102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47102)

(assert (=> b!1400857 (= lt!616502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95763 (_ BitVec 32)) SeekEntryResult!10549)

(assert (=> b!1400857 (= lt!616503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616507 (select (arr!46232 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400857 (= lt!616507 (toIndex!0 (select (arr!46232 a!2901) j!112) mask!2840))))

(declare-fun b!1400854 () Bool)

(assert (=> b!1400854 (= e!793163 e!793161)))

(declare-fun res!939369 () Bool)

(assert (=> b!1400854 (=> res!939369 e!793161)))

(assert (=> b!1400854 (= res!939369 (or (= lt!616503 lt!616504) (not (is-Intermediate!10549 lt!616504))))))

(assert (=> b!1400854 (= lt!616504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616505 mask!2840) lt!616505 lt!616508 mask!2840))))

(assert (=> b!1400854 (= lt!616505 (select (store (arr!46232 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400854 (= lt!616508 (array!95764 (store (arr!46232 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46782 a!2901)))))

(declare-fun res!939362 () Bool)

(assert (=> start!120354 (=> (not res!939362) (not e!793160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120354 (= res!939362 (validMask!0 mask!2840))))

(assert (=> start!120354 e!793160))

(assert (=> start!120354 true))

(declare-fun array_inv!35260 (array!95763) Bool)

(assert (=> start!120354 (array_inv!35260 a!2901)))

(declare-fun b!1400858 () Bool)

(assert (=> b!1400858 (= e!793158 true)))

(declare-fun lt!616506 () SeekEntryResult!10549)

(assert (=> b!1400858 (= lt!616506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616507 lt!616505 lt!616508 mask!2840))))

(declare-fun b!1400859 () Bool)

(assert (=> b!1400859 (= e!793157 (= (seekEntryOrOpen!0 (select (arr!46232 a!2901) j!112) a!2901 mask!2840) (Found!10549 j!112)))))

(assert (= (and start!120354 res!939362) b!1400852))

(assert (= (and b!1400852 res!939363) b!1400855))

(assert (= (and b!1400855 res!939367) b!1400850))

(assert (= (and b!1400850 res!939364) b!1400851))

(assert (= (and b!1400851 res!939360) b!1400853))

(assert (= (and b!1400853 res!939370) b!1400857))

(assert (= (and b!1400857 res!939361) b!1400859))

(assert (= (and b!1400857 (not res!939365)) b!1400854))

(assert (= (and b!1400854 (not res!939369)) b!1400856))

(assert (= (and b!1400856 res!939368) b!1400849))

(assert (= (and b!1400856 (not res!939366)) b!1400858))

(declare-fun m!1288437 () Bool)

(assert (=> b!1400857 m!1288437))

(declare-fun m!1288439 () Bool)

(assert (=> b!1400857 m!1288439))

(assert (=> b!1400857 m!1288437))

(declare-fun m!1288441 () Bool)

(assert (=> b!1400857 m!1288441))

(assert (=> b!1400857 m!1288437))

(declare-fun m!1288443 () Bool)

(assert (=> b!1400857 m!1288443))

(declare-fun m!1288445 () Bool)

(assert (=> b!1400857 m!1288445))

(declare-fun m!1288447 () Bool)

(assert (=> b!1400856 m!1288447))

(declare-fun m!1288449 () Bool)

(assert (=> b!1400856 m!1288449))

(declare-fun m!1288451 () Bool)

(assert (=> b!1400856 m!1288451))

(declare-fun m!1288453 () Bool)

(assert (=> start!120354 m!1288453))

(declare-fun m!1288455 () Bool)

(assert (=> start!120354 m!1288455))

(declare-fun m!1288457 () Bool)

(assert (=> b!1400858 m!1288457))

(assert (=> b!1400859 m!1288437))

(assert (=> b!1400859 m!1288437))

(declare-fun m!1288459 () Bool)

(assert (=> b!1400859 m!1288459))

(assert (=> b!1400850 m!1288437))

(assert (=> b!1400850 m!1288437))

(declare-fun m!1288461 () Bool)

(assert (=> b!1400850 m!1288461))

(declare-fun m!1288463 () Bool)

(assert (=> b!1400855 m!1288463))

(assert (=> b!1400855 m!1288463))

(declare-fun m!1288465 () Bool)

(assert (=> b!1400855 m!1288465))

(declare-fun m!1288467 () Bool)

(assert (=> b!1400851 m!1288467))

(declare-fun m!1288469 () Bool)

(assert (=> b!1400849 m!1288469))

(assert (=> b!1400849 m!1288437))

(assert (=> b!1400849 m!1288437))

(declare-fun m!1288471 () Bool)

(assert (=> b!1400849 m!1288471))

(declare-fun m!1288473 () Bool)

(assert (=> b!1400854 m!1288473))

(assert (=> b!1400854 m!1288473))

(declare-fun m!1288475 () Bool)

(assert (=> b!1400854 m!1288475))

(assert (=> b!1400854 m!1288447))

(declare-fun m!1288477 () Bool)

(assert (=> b!1400854 m!1288477))

(declare-fun m!1288479 () Bool)

(assert (=> b!1400853 m!1288479))

(push 1)

