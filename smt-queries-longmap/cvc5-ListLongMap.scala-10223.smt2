; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120390 () Bool)

(assert start!120390)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95799 0))(
  ( (array!95800 (arr!46250 (Array (_ BitVec 32) (_ BitVec 64))) (size!46800 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95799)

(declare-fun e!793538 () Bool)

(declare-fun b!1401443 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10567 0))(
  ( (MissingZero!10567 (index!44645 (_ BitVec 32))) (Found!10567 (index!44646 (_ BitVec 32))) (Intermediate!10567 (undefined!11379 Bool) (index!44647 (_ BitVec 32)) (x!126282 (_ BitVec 32))) (Undefined!10567) (MissingVacant!10567 (index!44648 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95799 (_ BitVec 32)) SeekEntryResult!10567)

(assert (=> b!1401443 (= e!793538 (= (seekEntryOrOpen!0 (select (arr!46250 a!2901) j!112) a!2901 mask!2840) (Found!10567 j!112)))))

(declare-fun b!1401444 () Bool)

(declare-fun e!793539 () Bool)

(declare-fun e!793536 () Bool)

(assert (=> b!1401444 (= e!793539 e!793536)))

(declare-fun res!939955 () Bool)

(assert (=> b!1401444 (=> res!939955 e!793536)))

(declare-fun lt!616934 () (_ BitVec 32))

(declare-fun lt!616940 () SeekEntryResult!10567)

(declare-fun lt!616939 () SeekEntryResult!10567)

(assert (=> b!1401444 (= res!939955 (or (bvslt (x!126282 lt!616940) #b00000000000000000000000000000000) (bvsgt (x!126282 lt!616940) #b01111111111111111111111111111110) (bvslt (x!126282 lt!616939) #b00000000000000000000000000000000) (bvsgt (x!126282 lt!616939) #b01111111111111111111111111111110) (bvslt lt!616934 #b00000000000000000000000000000000) (bvsge lt!616934 (size!46800 a!2901)) (bvslt (index!44647 lt!616940) #b00000000000000000000000000000000) (bvsge (index!44647 lt!616940) (size!46800 a!2901)) (bvslt (index!44647 lt!616939) #b00000000000000000000000000000000) (bvsge (index!44647 lt!616939) (size!46800 a!2901)) (not (= lt!616940 (Intermediate!10567 false (index!44647 lt!616940) (x!126282 lt!616940)))) (not (= lt!616939 (Intermediate!10567 false (index!44647 lt!616939) (x!126282 lt!616939))))))))

(declare-fun e!793541 () Bool)

(assert (=> b!1401444 e!793541))

(declare-fun res!939964 () Bool)

(assert (=> b!1401444 (=> (not res!939964) (not e!793541))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401444 (= res!939964 (and (not (undefined!11379 lt!616939)) (= (index!44647 lt!616939) i!1037) (bvslt (x!126282 lt!616939) (x!126282 lt!616940)) (= (select (store (arr!46250 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44647 lt!616939)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47138 0))(
  ( (Unit!47139) )
))
(declare-fun lt!616935 () Unit!47138)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47138)

(assert (=> b!1401444 (= lt!616935 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616934 (x!126282 lt!616940) (index!44647 lt!616940) (x!126282 lt!616939) (index!44647 lt!616939) (undefined!11379 lt!616939) mask!2840))))

(declare-fun b!1401445 () Bool)

(declare-fun res!939956 () Bool)

(declare-fun e!793540 () Bool)

(assert (=> b!1401445 (=> (not res!939956) (not e!793540))))

(assert (=> b!1401445 (= res!939956 (and (= (size!46800 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46800 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46800 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401446 () Bool)

(declare-fun res!939963 () Bool)

(assert (=> b!1401446 (=> (not res!939963) (not e!793540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95799 (_ BitVec 32)) Bool)

(assert (=> b!1401446 (= res!939963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401447 () Bool)

(declare-fun res!939959 () Bool)

(assert (=> b!1401447 (=> (not res!939959) (not e!793540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401447 (= res!939959 (validKeyInArray!0 (select (arr!46250 a!2901) i!1037)))))

(declare-fun b!1401448 () Bool)

(declare-fun res!939960 () Bool)

(assert (=> b!1401448 (=> (not res!939960) (not e!793540))))

(declare-datatypes ((List!32769 0))(
  ( (Nil!32766) (Cons!32765 (h!34013 (_ BitVec 64)) (t!47463 List!32769)) )
))
(declare-fun arrayNoDuplicates!0 (array!95799 (_ BitVec 32) List!32769) Bool)

(assert (=> b!1401448 (= res!939960 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32766))))

(declare-fun b!1401449 () Bool)

(declare-fun e!793535 () Bool)

(assert (=> b!1401449 (= e!793540 (not e!793535))))

(declare-fun res!939954 () Bool)

(assert (=> b!1401449 (=> res!939954 e!793535)))

(assert (=> b!1401449 (= res!939954 (or (not (is-Intermediate!10567 lt!616940)) (undefined!11379 lt!616940)))))

(assert (=> b!1401449 e!793538))

(declare-fun res!939961 () Bool)

(assert (=> b!1401449 (=> (not res!939961) (not e!793538))))

(assert (=> b!1401449 (= res!939961 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616941 () Unit!47138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47138)

(assert (=> b!1401449 (= lt!616941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95799 (_ BitVec 32)) SeekEntryResult!10567)

(assert (=> b!1401449 (= lt!616940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616934 (select (arr!46250 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401449 (= lt!616934 (toIndex!0 (select (arr!46250 a!2901) j!112) mask!2840))))

(declare-fun res!939962 () Bool)

(assert (=> start!120390 (=> (not res!939962) (not e!793540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120390 (= res!939962 (validMask!0 mask!2840))))

(assert (=> start!120390 e!793540))

(assert (=> start!120390 true))

(declare-fun array_inv!35278 (array!95799) Bool)

(assert (=> start!120390 (array_inv!35278 a!2901)))

(declare-fun lt!616936 () array!95799)

(declare-fun b!1401450 () Bool)

(declare-fun lt!616938 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95799 (_ BitVec 32)) SeekEntryResult!10567)

(assert (=> b!1401450 (= e!793541 (= (seekEntryOrOpen!0 lt!616938 lt!616936 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126282 lt!616939) (index!44647 lt!616939) (index!44647 lt!616939) (select (arr!46250 a!2901) j!112) lt!616936 mask!2840)))))

(declare-fun b!1401451 () Bool)

(declare-fun res!939958 () Bool)

(assert (=> b!1401451 (=> (not res!939958) (not e!793540))))

(assert (=> b!1401451 (= res!939958 (validKeyInArray!0 (select (arr!46250 a!2901) j!112)))))

(declare-fun b!1401452 () Bool)

(assert (=> b!1401452 (= e!793536 true)))

(declare-fun lt!616937 () SeekEntryResult!10567)

(assert (=> b!1401452 (= lt!616937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616934 lt!616938 lt!616936 mask!2840))))

(declare-fun b!1401453 () Bool)

(assert (=> b!1401453 (= e!793535 e!793539)))

(declare-fun res!939957 () Bool)

(assert (=> b!1401453 (=> res!939957 e!793539)))

(assert (=> b!1401453 (= res!939957 (or (= lt!616940 lt!616939) (not (is-Intermediate!10567 lt!616939))))))

(assert (=> b!1401453 (= lt!616939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616938 mask!2840) lt!616938 lt!616936 mask!2840))))

(assert (=> b!1401453 (= lt!616938 (select (store (arr!46250 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401453 (= lt!616936 (array!95800 (store (arr!46250 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46800 a!2901)))))

(assert (= (and start!120390 res!939962) b!1401445))

(assert (= (and b!1401445 res!939956) b!1401447))

(assert (= (and b!1401447 res!939959) b!1401451))

(assert (= (and b!1401451 res!939958) b!1401446))

(assert (= (and b!1401446 res!939963) b!1401448))

(assert (= (and b!1401448 res!939960) b!1401449))

(assert (= (and b!1401449 res!939961) b!1401443))

(assert (= (and b!1401449 (not res!939954)) b!1401453))

(assert (= (and b!1401453 (not res!939957)) b!1401444))

(assert (= (and b!1401444 res!939964) b!1401450))

(assert (= (and b!1401444 (not res!939955)) b!1401452))

(declare-fun m!1289229 () Bool)

(assert (=> b!1401453 m!1289229))

(assert (=> b!1401453 m!1289229))

(declare-fun m!1289231 () Bool)

(assert (=> b!1401453 m!1289231))

(declare-fun m!1289233 () Bool)

(assert (=> b!1401453 m!1289233))

(declare-fun m!1289235 () Bool)

(assert (=> b!1401453 m!1289235))

(declare-fun m!1289237 () Bool)

(assert (=> b!1401452 m!1289237))

(declare-fun m!1289239 () Bool)

(assert (=> b!1401443 m!1289239))

(assert (=> b!1401443 m!1289239))

(declare-fun m!1289241 () Bool)

(assert (=> b!1401443 m!1289241))

(declare-fun m!1289243 () Bool)

(assert (=> b!1401450 m!1289243))

(assert (=> b!1401450 m!1289239))

(assert (=> b!1401450 m!1289239))

(declare-fun m!1289245 () Bool)

(assert (=> b!1401450 m!1289245))

(declare-fun m!1289247 () Bool)

(assert (=> b!1401448 m!1289247))

(assert (=> b!1401451 m!1289239))

(assert (=> b!1401451 m!1289239))

(declare-fun m!1289249 () Bool)

(assert (=> b!1401451 m!1289249))

(assert (=> b!1401444 m!1289233))

(declare-fun m!1289251 () Bool)

(assert (=> b!1401444 m!1289251))

(declare-fun m!1289253 () Bool)

(assert (=> b!1401444 m!1289253))

(declare-fun m!1289255 () Bool)

(assert (=> b!1401446 m!1289255))

(declare-fun m!1289257 () Bool)

(assert (=> b!1401447 m!1289257))

(assert (=> b!1401447 m!1289257))

(declare-fun m!1289259 () Bool)

(assert (=> b!1401447 m!1289259))

(assert (=> b!1401449 m!1289239))

(declare-fun m!1289261 () Bool)

(assert (=> b!1401449 m!1289261))

(declare-fun m!1289263 () Bool)

(assert (=> b!1401449 m!1289263))

(declare-fun m!1289265 () Bool)

(assert (=> b!1401449 m!1289265))

(assert (=> b!1401449 m!1289239))

(declare-fun m!1289267 () Bool)

(assert (=> b!1401449 m!1289267))

(assert (=> b!1401449 m!1289239))

(declare-fun m!1289269 () Bool)

(assert (=> start!120390 m!1289269))

(declare-fun m!1289271 () Bool)

(assert (=> start!120390 m!1289271))

(push 1)

