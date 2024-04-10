; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65704 () Bool)

(assert start!65704)

(declare-fun b!753701 () Bool)

(declare-datatypes ((Unit!25988 0))(
  ( (Unit!25989) )
))
(declare-fun e!420371 () Unit!25988)

(declare-fun Unit!25990 () Unit!25988)

(assert (=> b!753701 (= e!420371 Unit!25990)))

(assert (=> b!753701 false))

(declare-fun b!753702 () Bool)

(declare-fun e!420370 () Bool)

(assert (=> b!753702 (= e!420370 true)))

(declare-fun e!420367 () Bool)

(assert (=> b!753702 e!420367))

(declare-fun res!509187 () Bool)

(assert (=> b!753702 (=> (not res!509187) (not e!420367))))

(declare-fun lt!335361 () (_ BitVec 64))

(assert (=> b!753702 (= res!509187 (= lt!335361 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335366 () Unit!25988)

(assert (=> b!753702 (= lt!335366 e!420371)))

(declare-fun c!82641 () Bool)

(assert (=> b!753702 (= c!82641 (= lt!335361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753703 () Bool)

(declare-fun Unit!25991 () Unit!25988)

(assert (=> b!753703 (= e!420371 Unit!25991)))

(declare-fun b!753704 () Bool)

(declare-fun res!509193 () Bool)

(declare-fun e!420375 () Bool)

(assert (=> b!753704 (=> (not res!509193) (not e!420375))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41877 0))(
  ( (array!41878 (arr!20052 (Array (_ BitVec 32) (_ BitVec 64))) (size!20473 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41877)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753704 (= res!509193 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20473 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20473 a!3186))))))

(declare-fun b!753705 () Bool)

(declare-fun res!509196 () Bool)

(declare-fun e!420373 () Bool)

(assert (=> b!753705 (=> (not res!509196) (not e!420373))))

(declare-fun e!420372 () Bool)

(assert (=> b!753705 (= res!509196 e!420372)))

(declare-fun c!82642 () Bool)

(assert (=> b!753705 (= c!82642 (bvsle x!1131 resIntermediateX!5))))

(declare-datatypes ((SeekEntryResult!7652 0))(
  ( (MissingZero!7652 (index!32976 (_ BitVec 32))) (Found!7652 (index!32977 (_ BitVec 32))) (Intermediate!7652 (undefined!8464 Bool) (index!32978 (_ BitVec 32)) (x!63890 (_ BitVec 32))) (Undefined!7652) (MissingVacant!7652 (index!32979 (_ BitVec 32))) )
))
(declare-fun lt!335364 () SeekEntryResult!7652)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!753706 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41877 (_ BitVec 32)) SeekEntryResult!7652)

(assert (=> b!753706 (= e!420372 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20052 a!3186) j!159) a!3186 mask!3328) lt!335364))))

(declare-fun b!753707 () Bool)

(declare-fun res!509182 () Bool)

(declare-fun e!420366 () Bool)

(assert (=> b!753707 (=> (not res!509182) (not e!420366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753707 (= res!509182 (validKeyInArray!0 (select (arr!20052 a!3186) j!159)))))

(declare-fun b!753708 () Bool)

(declare-fun lt!335359 () SeekEntryResult!7652)

(declare-fun lt!335368 () SeekEntryResult!7652)

(assert (=> b!753708 (= e!420367 (= lt!335359 lt!335368))))

(declare-fun b!753709 () Bool)

(declare-fun res!509184 () Bool)

(assert (=> b!753709 (=> (not res!509184) (not e!420366))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753709 (= res!509184 (validKeyInArray!0 k!2102))))

(declare-fun b!753710 () Bool)

(declare-fun e!420368 () Bool)

(assert (=> b!753710 (= e!420368 e!420370)))

(declare-fun res!509191 () Bool)

(assert (=> b!753710 (=> res!509191 e!420370)))

(declare-fun lt!335362 () (_ BitVec 64))

(assert (=> b!753710 (= res!509191 (= lt!335361 lt!335362))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753710 (= lt!335361 (select (store (arr!20052 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753711 () Bool)

(declare-fun e!420377 () Bool)

(declare-fun e!420369 () Bool)

(assert (=> b!753711 (= e!420377 (not e!420369))))

(declare-fun res!509189 () Bool)

(assert (=> b!753711 (=> res!509189 e!420369)))

(declare-fun lt!335367 () SeekEntryResult!7652)

(assert (=> b!753711 (= res!509189 (or (not (is-Intermediate!7652 lt!335367)) (bvslt x!1131 (x!63890 lt!335367)) (not (= x!1131 (x!63890 lt!335367))) (not (= index!1321 (index!32978 lt!335367)))))))

(declare-fun e!420376 () Bool)

(assert (=> b!753711 e!420376))

(declare-fun res!509197 () Bool)

(assert (=> b!753711 (=> (not res!509197) (not e!420376))))

(declare-fun lt!335358 () SeekEntryResult!7652)

(assert (=> b!753711 (= res!509197 (= lt!335359 lt!335358))))

(assert (=> b!753711 (= lt!335358 (Found!7652 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41877 (_ BitVec 32)) SeekEntryResult!7652)

(assert (=> b!753711 (= lt!335359 (seekEntryOrOpen!0 (select (arr!20052 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41877 (_ BitVec 32)) Bool)

(assert (=> b!753711 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335369 () Unit!25988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25988)

(assert (=> b!753711 (= lt!335369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753712 () Bool)

(assert (=> b!753712 (= e!420375 e!420373)))

(declare-fun res!509190 () Bool)

(assert (=> b!753712 (=> (not res!509190) (not e!420373))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753712 (= res!509190 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20052 a!3186) j!159) mask!3328) (select (arr!20052 a!3186) j!159) a!3186 mask!3328) lt!335364))))

(assert (=> b!753712 (= lt!335364 (Intermediate!7652 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753713 () Bool)

(declare-fun res!509180 () Bool)

(assert (=> b!753713 (=> (not res!509180) (not e!420375))))

(assert (=> b!753713 (= res!509180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753714 () Bool)

(declare-fun res!509186 () Bool)

(assert (=> b!753714 (=> (not res!509186) (not e!420375))))

(declare-datatypes ((List!14054 0))(
  ( (Nil!14051) (Cons!14050 (h!15122 (_ BitVec 64)) (t!20369 List!14054)) )
))
(declare-fun arrayNoDuplicates!0 (array!41877 (_ BitVec 32) List!14054) Bool)

(assert (=> b!753714 (= res!509186 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14051))))

(declare-fun b!753715 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41877 (_ BitVec 32)) SeekEntryResult!7652)

(assert (=> b!753715 (= e!420376 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20052 a!3186) j!159) a!3186 mask!3328) lt!335358))))

(declare-fun b!753716 () Bool)

(declare-fun res!509188 () Bool)

(assert (=> b!753716 (=> (not res!509188) (not e!420366))))

(assert (=> b!753716 (= res!509188 (and (= (size!20473 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20473 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20473 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753717 () Bool)

(assert (=> b!753717 (= e!420373 e!420377)))

(declare-fun res!509194 () Bool)

(assert (=> b!753717 (=> (not res!509194) (not e!420377))))

(declare-fun lt!335365 () SeekEntryResult!7652)

(assert (=> b!753717 (= res!509194 (= lt!335365 lt!335367))))

(declare-fun lt!335360 () array!41877)

(assert (=> b!753717 (= lt!335367 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335362 lt!335360 mask!3328))))

(assert (=> b!753717 (= lt!335365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335362 mask!3328) lt!335362 lt!335360 mask!3328))))

(assert (=> b!753717 (= lt!335362 (select (store (arr!20052 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753717 (= lt!335360 (array!41878 (store (arr!20052 a!3186) i!1173 k!2102) (size!20473 a!3186)))))

(declare-fun b!753718 () Bool)

(declare-fun res!509183 () Bool)

(assert (=> b!753718 (=> (not res!509183) (not e!420373))))

(assert (=> b!753718 (= res!509183 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20052 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!509181 () Bool)

(assert (=> start!65704 (=> (not res!509181) (not e!420366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65704 (= res!509181 (validMask!0 mask!3328))))

(assert (=> start!65704 e!420366))

(assert (=> start!65704 true))

(declare-fun array_inv!15848 (array!41877) Bool)

(assert (=> start!65704 (array_inv!15848 a!3186)))

(declare-fun b!753719 () Bool)

(declare-fun res!509185 () Bool)

(assert (=> b!753719 (=> (not res!509185) (not e!420366))))

(declare-fun arrayContainsKey!0 (array!41877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753719 (= res!509185 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753720 () Bool)

(assert (=> b!753720 (= e!420372 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20052 a!3186) j!159) a!3186 mask!3328) (Found!7652 j!159)))))

(declare-fun b!753721 () Bool)

(assert (=> b!753721 (= e!420369 e!420368)))

(declare-fun res!509192 () Bool)

(assert (=> b!753721 (=> res!509192 e!420368)))

(assert (=> b!753721 (= res!509192 (not (= lt!335368 lt!335358)))))

(assert (=> b!753721 (= lt!335368 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20052 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753722 () Bool)

(assert (=> b!753722 (= e!420366 e!420375)))

(declare-fun res!509198 () Bool)

(assert (=> b!753722 (=> (not res!509198) (not e!420375))))

(declare-fun lt!335363 () SeekEntryResult!7652)

(assert (=> b!753722 (= res!509198 (or (= lt!335363 (MissingZero!7652 i!1173)) (= lt!335363 (MissingVacant!7652 i!1173))))))

(assert (=> b!753722 (= lt!335363 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753723 () Bool)

(declare-fun res!509195 () Bool)

(assert (=> b!753723 (=> (not res!509195) (not e!420367))))

(assert (=> b!753723 (= res!509195 (= (seekEntryOrOpen!0 lt!335362 lt!335360 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335362 lt!335360 mask!3328)))))

(assert (= (and start!65704 res!509181) b!753716))

(assert (= (and b!753716 res!509188) b!753707))

(assert (= (and b!753707 res!509182) b!753709))

(assert (= (and b!753709 res!509184) b!753719))

(assert (= (and b!753719 res!509185) b!753722))

(assert (= (and b!753722 res!509198) b!753713))

(assert (= (and b!753713 res!509180) b!753714))

(assert (= (and b!753714 res!509186) b!753704))

(assert (= (and b!753704 res!509193) b!753712))

(assert (= (and b!753712 res!509190) b!753718))

(assert (= (and b!753718 res!509183) b!753705))

(assert (= (and b!753705 c!82642) b!753706))

(assert (= (and b!753705 (not c!82642)) b!753720))

(assert (= (and b!753705 res!509196) b!753717))

(assert (= (and b!753717 res!509194) b!753711))

(assert (= (and b!753711 res!509197) b!753715))

(assert (= (and b!753711 (not res!509189)) b!753721))

(assert (= (and b!753721 (not res!509192)) b!753710))

(assert (= (and b!753710 (not res!509191)) b!753702))

(assert (= (and b!753702 c!82641) b!753701))

(assert (= (and b!753702 (not c!82641)) b!753703))

(assert (= (and b!753702 res!509187) b!753723))

(assert (= (and b!753723 res!509195) b!753708))

(declare-fun m!702331 () Bool)

(assert (=> b!753707 m!702331))

(assert (=> b!753707 m!702331))

(declare-fun m!702333 () Bool)

(assert (=> b!753707 m!702333))

(declare-fun m!702335 () Bool)

(assert (=> b!753723 m!702335))

(declare-fun m!702337 () Bool)

(assert (=> b!753723 m!702337))

(declare-fun m!702339 () Bool)

(assert (=> b!753717 m!702339))

(declare-fun m!702341 () Bool)

(assert (=> b!753717 m!702341))

(declare-fun m!702343 () Bool)

(assert (=> b!753717 m!702343))

(declare-fun m!702345 () Bool)

(assert (=> b!753717 m!702345))

(assert (=> b!753717 m!702339))

(declare-fun m!702347 () Bool)

(assert (=> b!753717 m!702347))

(assert (=> b!753710 m!702341))

(declare-fun m!702349 () Bool)

(assert (=> b!753710 m!702349))

(declare-fun m!702351 () Bool)

(assert (=> b!753719 m!702351))

(declare-fun m!702353 () Bool)

(assert (=> b!753709 m!702353))

(declare-fun m!702355 () Bool)

(assert (=> b!753718 m!702355))

(assert (=> b!753715 m!702331))

(assert (=> b!753715 m!702331))

(declare-fun m!702357 () Bool)

(assert (=> b!753715 m!702357))

(assert (=> b!753721 m!702331))

(assert (=> b!753721 m!702331))

(declare-fun m!702359 () Bool)

(assert (=> b!753721 m!702359))

(declare-fun m!702361 () Bool)

(assert (=> start!65704 m!702361))

(declare-fun m!702363 () Bool)

(assert (=> start!65704 m!702363))

(declare-fun m!702365 () Bool)

(assert (=> b!753722 m!702365))

(declare-fun m!702367 () Bool)

(assert (=> b!753714 m!702367))

(assert (=> b!753720 m!702331))

(assert (=> b!753720 m!702331))

(assert (=> b!753720 m!702359))

(assert (=> b!753712 m!702331))

(assert (=> b!753712 m!702331))

(declare-fun m!702369 () Bool)

(assert (=> b!753712 m!702369))

(assert (=> b!753712 m!702369))

(assert (=> b!753712 m!702331))

(declare-fun m!702371 () Bool)

(assert (=> b!753712 m!702371))

(assert (=> b!753711 m!702331))

(assert (=> b!753711 m!702331))

(declare-fun m!702373 () Bool)

(assert (=> b!753711 m!702373))

(declare-fun m!702375 () Bool)

(assert (=> b!753711 m!702375))

(declare-fun m!702377 () Bool)

(assert (=> b!753711 m!702377))

(declare-fun m!702379 () Bool)

(assert (=> b!753713 m!702379))

(assert (=> b!753706 m!702331))

(assert (=> b!753706 m!702331))

(declare-fun m!702381 () Bool)

(assert (=> b!753706 m!702381))

(push 1)

