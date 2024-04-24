; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120566 () Bool)

(assert start!120566)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1402385 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!794152 () Bool)

(declare-datatypes ((array!95897 0))(
  ( (array!95898 (arr!46297 (Array (_ BitVec 32) (_ BitVec 64))) (size!46848 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95897)

(declare-datatypes ((SeekEntryResult!10517 0))(
  ( (MissingZero!10517 (index!44445 (_ BitVec 32))) (Found!10517 (index!44446 (_ BitVec 32))) (Intermediate!10517 (undefined!11329 Bool) (index!44447 (_ BitVec 32)) (x!126235 (_ BitVec 32))) (Undefined!10517) (MissingVacant!10517 (index!44448 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95897 (_ BitVec 32)) SeekEntryResult!10517)

(assert (=> b!1402385 (= e!794152 (= (seekEntryOrOpen!0 (select (arr!46297 a!2901) j!112) a!2901 mask!2840) (Found!10517 j!112)))))

(declare-fun b!1402386 () Bool)

(declare-fun res!940215 () Bool)

(declare-fun e!794147 () Bool)

(assert (=> b!1402386 (=> (not res!940215) (not e!794147))))

(declare-datatypes ((List!32803 0))(
  ( (Nil!32800) (Cons!32799 (h!34055 (_ BitVec 64)) (t!47489 List!32803)) )
))
(declare-fun arrayNoDuplicates!0 (array!95897 (_ BitVec 32) List!32803) Bool)

(assert (=> b!1402386 (= res!940215 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32800))))

(declare-fun b!1402387 () Bool)

(declare-fun e!794151 () Bool)

(assert (=> b!1402387 (= e!794151 true)))

(declare-fun lt!617193 () array!95897)

(declare-fun lt!617190 () SeekEntryResult!10517)

(declare-fun lt!617192 () (_ BitVec 64))

(declare-fun lt!617189 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95897 (_ BitVec 32)) SeekEntryResult!10517)

(assert (=> b!1402387 (= lt!617190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617189 lt!617192 lt!617193 mask!2840))))

(declare-fun b!1402388 () Bool)

(declare-fun e!794148 () Bool)

(declare-fun e!794150 () Bool)

(assert (=> b!1402388 (= e!794148 e!794150)))

(declare-fun res!940213 () Bool)

(assert (=> b!1402388 (=> res!940213 e!794150)))

(declare-fun lt!617194 () SeekEntryResult!10517)

(declare-fun lt!617188 () SeekEntryResult!10517)

(get-info :version)

(assert (=> b!1402388 (= res!940213 (or (= lt!617194 lt!617188) (not ((_ is Intermediate!10517) lt!617188))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402388 (= lt!617188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617192 mask!2840) lt!617192 lt!617193 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402388 (= lt!617192 (select (store (arr!46297 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402388 (= lt!617193 (array!95898 (store (arr!46297 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46848 a!2901)))))

(declare-fun b!1402389 () Bool)

(declare-fun res!940221 () Bool)

(assert (=> b!1402389 (=> (not res!940221) (not e!794147))))

(assert (=> b!1402389 (= res!940221 (and (= (size!46848 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46848 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46848 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402390 () Bool)

(assert (=> b!1402390 (= e!794150 e!794151)))

(declare-fun res!940216 () Bool)

(assert (=> b!1402390 (=> res!940216 e!794151)))

(assert (=> b!1402390 (= res!940216 (or (bvslt (x!126235 lt!617194) #b00000000000000000000000000000000) (bvsgt (x!126235 lt!617194) #b01111111111111111111111111111110) (bvslt (x!126235 lt!617188) #b00000000000000000000000000000000) (bvsgt (x!126235 lt!617188) #b01111111111111111111111111111110) (bvslt lt!617189 #b00000000000000000000000000000000) (bvsge lt!617189 (size!46848 a!2901)) (bvslt (index!44447 lt!617194) #b00000000000000000000000000000000) (bvsge (index!44447 lt!617194) (size!46848 a!2901)) (bvslt (index!44447 lt!617188) #b00000000000000000000000000000000) (bvsge (index!44447 lt!617188) (size!46848 a!2901)) (not (= lt!617194 (Intermediate!10517 false (index!44447 lt!617194) (x!126235 lt!617194)))) (not (= lt!617188 (Intermediate!10517 false (index!44447 lt!617188) (x!126235 lt!617188))))))))

(declare-fun e!794153 () Bool)

(assert (=> b!1402390 e!794153))

(declare-fun res!940222 () Bool)

(assert (=> b!1402390 (=> (not res!940222) (not e!794153))))

(assert (=> b!1402390 (= res!940222 (and (not (undefined!11329 lt!617188)) (= (index!44447 lt!617188) i!1037) (bvslt (x!126235 lt!617188) (x!126235 lt!617194)) (= (select (store (arr!46297 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44447 lt!617188)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47065 0))(
  ( (Unit!47066) )
))
(declare-fun lt!617191 () Unit!47065)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47065)

(assert (=> b!1402390 (= lt!617191 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617189 (x!126235 lt!617194) (index!44447 lt!617194) (x!126235 lt!617188) (index!44447 lt!617188) (undefined!11329 lt!617188) mask!2840))))

(declare-fun b!1402391 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95897 (_ BitVec 32)) SeekEntryResult!10517)

(assert (=> b!1402391 (= e!794153 (= (seekEntryOrOpen!0 lt!617192 lt!617193 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126235 lt!617188) (index!44447 lt!617188) (index!44447 lt!617188) (select (arr!46297 a!2901) j!112) lt!617193 mask!2840)))))

(declare-fun b!1402392 () Bool)

(declare-fun res!940219 () Bool)

(assert (=> b!1402392 (=> (not res!940219) (not e!794147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95897 (_ BitVec 32)) Bool)

(assert (=> b!1402392 (= res!940219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402393 () Bool)

(declare-fun res!940214 () Bool)

(assert (=> b!1402393 (=> (not res!940214) (not e!794147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402393 (= res!940214 (validKeyInArray!0 (select (arr!46297 a!2901) j!112)))))

(declare-fun b!1402395 () Bool)

(assert (=> b!1402395 (= e!794147 (not e!794148))))

(declare-fun res!940217 () Bool)

(assert (=> b!1402395 (=> res!940217 e!794148)))

(assert (=> b!1402395 (= res!940217 (or (not ((_ is Intermediate!10517) lt!617194)) (undefined!11329 lt!617194)))))

(assert (=> b!1402395 e!794152))

(declare-fun res!940218 () Bool)

(assert (=> b!1402395 (=> (not res!940218) (not e!794152))))

(assert (=> b!1402395 (= res!940218 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617195 () Unit!47065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47065)

(assert (=> b!1402395 (= lt!617195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402395 (= lt!617194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617189 (select (arr!46297 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402395 (= lt!617189 (toIndex!0 (select (arr!46297 a!2901) j!112) mask!2840))))

(declare-fun b!1402394 () Bool)

(declare-fun res!940212 () Bool)

(assert (=> b!1402394 (=> (not res!940212) (not e!794147))))

(assert (=> b!1402394 (= res!940212 (validKeyInArray!0 (select (arr!46297 a!2901) i!1037)))))

(declare-fun res!940220 () Bool)

(assert (=> start!120566 (=> (not res!940220) (not e!794147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120566 (= res!940220 (validMask!0 mask!2840))))

(assert (=> start!120566 e!794147))

(assert (=> start!120566 true))

(declare-fun array_inv!35578 (array!95897) Bool)

(assert (=> start!120566 (array_inv!35578 a!2901)))

(assert (= (and start!120566 res!940220) b!1402389))

(assert (= (and b!1402389 res!940221) b!1402394))

(assert (= (and b!1402394 res!940212) b!1402393))

(assert (= (and b!1402393 res!940214) b!1402392))

(assert (= (and b!1402392 res!940219) b!1402386))

(assert (= (and b!1402386 res!940215) b!1402395))

(assert (= (and b!1402395 res!940218) b!1402385))

(assert (= (and b!1402395 (not res!940217)) b!1402388))

(assert (= (and b!1402388 (not res!940213)) b!1402390))

(assert (= (and b!1402390 res!940222) b!1402391))

(assert (= (and b!1402390 (not res!940216)) b!1402387))

(declare-fun m!1290337 () Bool)

(assert (=> b!1402387 m!1290337))

(declare-fun m!1290339 () Bool)

(assert (=> b!1402395 m!1290339))

(declare-fun m!1290341 () Bool)

(assert (=> b!1402395 m!1290341))

(assert (=> b!1402395 m!1290339))

(declare-fun m!1290343 () Bool)

(assert (=> b!1402395 m!1290343))

(assert (=> b!1402395 m!1290339))

(declare-fun m!1290345 () Bool)

(assert (=> b!1402395 m!1290345))

(declare-fun m!1290347 () Bool)

(assert (=> b!1402395 m!1290347))

(declare-fun m!1290349 () Bool)

(assert (=> b!1402388 m!1290349))

(assert (=> b!1402388 m!1290349))

(declare-fun m!1290351 () Bool)

(assert (=> b!1402388 m!1290351))

(declare-fun m!1290353 () Bool)

(assert (=> b!1402388 m!1290353))

(declare-fun m!1290355 () Bool)

(assert (=> b!1402388 m!1290355))

(declare-fun m!1290357 () Bool)

(assert (=> b!1402394 m!1290357))

(assert (=> b!1402394 m!1290357))

(declare-fun m!1290359 () Bool)

(assert (=> b!1402394 m!1290359))

(assert (=> b!1402385 m!1290339))

(assert (=> b!1402385 m!1290339))

(declare-fun m!1290361 () Bool)

(assert (=> b!1402385 m!1290361))

(declare-fun m!1290363 () Bool)

(assert (=> b!1402386 m!1290363))

(declare-fun m!1290365 () Bool)

(assert (=> b!1402391 m!1290365))

(assert (=> b!1402391 m!1290339))

(assert (=> b!1402391 m!1290339))

(declare-fun m!1290367 () Bool)

(assert (=> b!1402391 m!1290367))

(declare-fun m!1290369 () Bool)

(assert (=> b!1402392 m!1290369))

(assert (=> b!1402390 m!1290353))

(declare-fun m!1290371 () Bool)

(assert (=> b!1402390 m!1290371))

(declare-fun m!1290373 () Bool)

(assert (=> b!1402390 m!1290373))

(declare-fun m!1290375 () Bool)

(assert (=> start!120566 m!1290375))

(declare-fun m!1290377 () Bool)

(assert (=> start!120566 m!1290377))

(assert (=> b!1402393 m!1290339))

(assert (=> b!1402393 m!1290339))

(declare-fun m!1290379 () Bool)

(assert (=> b!1402393 m!1290379))

(check-sat (not b!1402386) (not b!1402390) (not start!120566) (not b!1402388) (not b!1402392) (not b!1402395) (not b!1402394) (not b!1402391) (not b!1402387) (not b!1402385) (not b!1402393))
(check-sat)
