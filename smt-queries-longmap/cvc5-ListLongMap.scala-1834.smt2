; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33214 () Bool)

(assert start!33214)

(declare-fun b!330266 () Bool)

(declare-fun res!181997 () Bool)

(declare-fun e!202766 () Bool)

(assert (=> b!330266 (=> (not res!181997) (not e!202766))))

(declare-datatypes ((array!16873 0))(
  ( (array!16874 (arr!7979 (Array (_ BitVec 32) (_ BitVec 64))) (size!8331 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16873)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330266 (= res!181997 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330267 () Bool)

(assert (=> b!330267 false))

(declare-datatypes ((Unit!10260 0))(
  ( (Unit!10261) )
))
(declare-fun lt!158480 () Unit!10260)

(declare-fun e!202771 () Unit!10260)

(assert (=> b!330267 (= lt!158480 e!202771)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun c!51778 () Bool)

(declare-datatypes ((SeekEntryResult!3110 0))(
  ( (MissingZero!3110 (index!14616 (_ BitVec 32))) (Found!3110 (index!14617 (_ BitVec 32))) (Intermediate!3110 (undefined!3922 Bool) (index!14618 (_ BitVec 32)) (x!32901 (_ BitVec 32))) (Undefined!3110) (MissingVacant!3110 (index!14619 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16873 (_ BitVec 32)) SeekEntryResult!3110)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330267 (= c!51778 (is-Intermediate!3110 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!202769 () Unit!10260)

(declare-fun Unit!10262 () Unit!10260)

(assert (=> b!330267 (= e!202769 Unit!10262)))

(declare-fun b!330268 () Bool)

(declare-fun Unit!10263 () Unit!10260)

(assert (=> b!330268 (= e!202771 Unit!10263)))

(assert (=> b!330268 false))

(declare-fun b!330269 () Bool)

(declare-fun e!202770 () Unit!10260)

(assert (=> b!330269 (= e!202770 e!202769)))

(declare-fun c!51780 () Bool)

(assert (=> b!330269 (= c!51780 (or (= (select (arr!7979 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7979 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330270 () Bool)

(declare-fun e!202767 () Bool)

(assert (=> b!330270 (= e!202767 (not (= (select (arr!7979 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330270 (= index!1840 resIndex!58)))

(declare-fun lt!158481 () Unit!10260)

(assert (=> b!330270 (= lt!158481 e!202770)))

(declare-fun c!51779 () Bool)

(assert (=> b!330270 (= c!51779 (not (= resIndex!58 index!1840)))))

(declare-fun b!330271 () Bool)

(assert (=> b!330271 false))

(declare-fun Unit!10264 () Unit!10260)

(assert (=> b!330271 (= e!202769 Unit!10264)))

(declare-fun b!330272 () Bool)

(declare-fun res!182000 () Bool)

(assert (=> b!330272 (=> (not res!182000) (not e!202767))))

(declare-fun lt!158479 () SeekEntryResult!3110)

(assert (=> b!330272 (= res!182000 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158479))))

(declare-fun b!330274 () Bool)

(declare-fun res!182004 () Bool)

(assert (=> b!330274 (=> (not res!182004) (not e!202766))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330274 (= res!182004 (and (= (size!8331 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8331 a!3305))))))

(declare-fun b!330275 () Bool)

(declare-fun Unit!10265 () Unit!10260)

(assert (=> b!330275 (= e!202770 Unit!10265)))

(declare-fun b!330276 () Bool)

(declare-fun res!182003 () Bool)

(assert (=> b!330276 (=> (not res!182003) (not e!202766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16873 (_ BitVec 32)) Bool)

(assert (=> b!330276 (= res!182003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330277 () Bool)

(declare-fun res!181999 () Bool)

(assert (=> b!330277 (=> (not res!181999) (not e!202766))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16873 (_ BitVec 32)) SeekEntryResult!3110)

(assert (=> b!330277 (= res!181999 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3110 i!1250)))))

(declare-fun b!330278 () Bool)

(declare-fun res!181998 () Bool)

(assert (=> b!330278 (=> (not res!181998) (not e!202767))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330278 (= res!181998 (and (= (select (arr!7979 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8331 a!3305))))))

(declare-fun b!330273 () Bool)

(assert (=> b!330273 (= e!202766 e!202767)))

(declare-fun res!181996 () Bool)

(assert (=> b!330273 (=> (not res!181996) (not e!202767))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330273 (= res!181996 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158479))))

(assert (=> b!330273 (= lt!158479 (Intermediate!3110 false resIndex!58 resX!58))))

(declare-fun res!182002 () Bool)

(assert (=> start!33214 (=> (not res!182002) (not e!202766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33214 (= res!182002 (validMask!0 mask!3777))))

(assert (=> start!33214 e!202766))

(declare-fun array_inv!5942 (array!16873) Bool)

(assert (=> start!33214 (array_inv!5942 a!3305)))

(assert (=> start!33214 true))

(declare-fun b!330279 () Bool)

(declare-fun Unit!10266 () Unit!10260)

(assert (=> b!330279 (= e!202771 Unit!10266)))

(declare-fun b!330280 () Bool)

(declare-fun res!181995 () Bool)

(assert (=> b!330280 (=> (not res!181995) (not e!202767))))

(assert (=> b!330280 (= res!181995 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7979 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!330281 () Bool)

(declare-fun res!182001 () Bool)

(assert (=> b!330281 (=> (not res!182001) (not e!202766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330281 (= res!182001 (validKeyInArray!0 k!2497))))

(assert (= (and start!33214 res!182002) b!330274))

(assert (= (and b!330274 res!182004) b!330281))

(assert (= (and b!330281 res!182001) b!330266))

(assert (= (and b!330266 res!181997) b!330277))

(assert (= (and b!330277 res!181999) b!330276))

(assert (= (and b!330276 res!182003) b!330273))

(assert (= (and b!330273 res!181996) b!330278))

(assert (= (and b!330278 res!181998) b!330272))

(assert (= (and b!330272 res!182000) b!330280))

(assert (= (and b!330280 res!181995) b!330270))

(assert (= (and b!330270 c!51779) b!330269))

(assert (= (and b!330270 (not c!51779)) b!330275))

(assert (= (and b!330269 c!51780) b!330271))

(assert (= (and b!330269 (not c!51780)) b!330267))

(assert (= (and b!330267 c!51778) b!330279))

(assert (= (and b!330267 (not c!51778)) b!330268))

(declare-fun m!335579 () Bool)

(assert (=> b!330270 m!335579))

(declare-fun m!335581 () Bool)

(assert (=> b!330276 m!335581))

(assert (=> b!330280 m!335579))

(declare-fun m!335583 () Bool)

(assert (=> start!33214 m!335583))

(declare-fun m!335585 () Bool)

(assert (=> start!33214 m!335585))

(declare-fun m!335587 () Bool)

(assert (=> b!330266 m!335587))

(declare-fun m!335589 () Bool)

(assert (=> b!330281 m!335589))

(assert (=> b!330269 m!335579))

(declare-fun m!335591 () Bool)

(assert (=> b!330277 m!335591))

(declare-fun m!335593 () Bool)

(assert (=> b!330273 m!335593))

(assert (=> b!330273 m!335593))

(declare-fun m!335595 () Bool)

(assert (=> b!330273 m!335595))

(declare-fun m!335597 () Bool)

(assert (=> b!330267 m!335597))

(assert (=> b!330267 m!335597))

(declare-fun m!335599 () Bool)

(assert (=> b!330267 m!335599))

(declare-fun m!335601 () Bool)

(assert (=> b!330272 m!335601))

(declare-fun m!335603 () Bool)

(assert (=> b!330278 m!335603))

(push 1)

