; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33212 () Bool)

(assert start!33212)

(declare-fun b!330218 () Bool)

(declare-fun res!181965 () Bool)

(declare-fun e!202751 () Bool)

(assert (=> b!330218 (=> (not res!181965) (not e!202751))))

(declare-datatypes ((array!16871 0))(
  ( (array!16872 (arr!7978 (Array (_ BitVec 32) (_ BitVec 64))) (size!8330 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16871)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330218 (= res!181965 (and (= (size!8330 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8330 a!3305))))))

(declare-fun b!330219 () Bool)

(declare-datatypes ((Unit!10253 0))(
  ( (Unit!10254) )
))
(declare-fun e!202748 () Unit!10253)

(declare-fun Unit!10255 () Unit!10253)

(assert (=> b!330219 (= e!202748 Unit!10255)))

(declare-fun b!330220 () Bool)

(declare-fun e!202753 () Unit!10253)

(declare-fun Unit!10256 () Unit!10253)

(assert (=> b!330220 (= e!202753 Unit!10256)))

(assert (=> b!330220 false))

(declare-fun b!330221 () Bool)

(declare-fun res!181967 () Bool)

(assert (=> b!330221 (=> (not res!181967) (not e!202751))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330221 (= res!181967 (validKeyInArray!0 k!2497))))

(declare-fun b!330222 () Bool)

(assert (=> b!330222 false))

(declare-fun e!202750 () Unit!10253)

(declare-fun Unit!10257 () Unit!10253)

(assert (=> b!330222 (= e!202750 Unit!10257)))

(declare-fun res!181972 () Bool)

(assert (=> start!33212 (=> (not res!181972) (not e!202751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33212 (= res!181972 (validMask!0 mask!3777))))

(assert (=> start!33212 e!202751))

(declare-fun array_inv!5941 (array!16871) Bool)

(assert (=> start!33212 (array_inv!5941 a!3305)))

(assert (=> start!33212 true))

(declare-fun b!330223 () Bool)

(declare-fun res!181971 () Bool)

(declare-fun e!202749 () Bool)

(assert (=> b!330223 (=> (not res!181971) (not e!202749))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330223 (= res!181971 (and (= (select (arr!7978 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8330 a!3305))))))

(declare-fun b!330224 () Bool)

(assert (=> b!330224 (= e!202749 (not true))))

(assert (=> b!330224 (= index!1840 resIndex!58)))

(declare-fun lt!158471 () Unit!10253)

(assert (=> b!330224 (= lt!158471 e!202748)))

(declare-fun c!51769 () Bool)

(assert (=> b!330224 (= c!51769 (not (= resIndex!58 index!1840)))))

(declare-fun b!330225 () Bool)

(declare-fun res!181966 () Bool)

(assert (=> b!330225 (=> (not res!181966) (not e!202749))))

(assert (=> b!330225 (= res!181966 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7978 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!330226 () Bool)

(assert (=> b!330226 false))

(declare-fun lt!158472 () Unit!10253)

(assert (=> b!330226 (= lt!158472 e!202753)))

(declare-fun c!51770 () Bool)

(declare-datatypes ((SeekEntryResult!3109 0))(
  ( (MissingZero!3109 (index!14612 (_ BitVec 32))) (Found!3109 (index!14613 (_ BitVec 32))) (Intermediate!3109 (undefined!3921 Bool) (index!14614 (_ BitVec 32)) (x!32892 (_ BitVec 32))) (Undefined!3109) (MissingVacant!3109 (index!14615 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16871 (_ BitVec 32)) SeekEntryResult!3109)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330226 (= c!51770 (is-Intermediate!3109 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10258 () Unit!10253)

(assert (=> b!330226 (= e!202750 Unit!10258)))

(declare-fun b!330227 () Bool)

(declare-fun res!181969 () Bool)

(assert (=> b!330227 (=> (not res!181969) (not e!202751))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16871 (_ BitVec 32)) SeekEntryResult!3109)

(assert (=> b!330227 (= res!181969 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3109 i!1250)))))

(declare-fun b!330228 () Bool)

(assert (=> b!330228 (= e!202748 e!202750)))

(declare-fun c!51771 () Bool)

(assert (=> b!330228 (= c!51771 (or (= (select (arr!7978 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7978 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330229 () Bool)

(declare-fun res!181974 () Bool)

(assert (=> b!330229 (=> (not res!181974) (not e!202749))))

(declare-fun lt!158470 () SeekEntryResult!3109)

(assert (=> b!330229 (= res!181974 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158470))))

(declare-fun b!330230 () Bool)

(assert (=> b!330230 (= e!202751 e!202749)))

(declare-fun res!181968 () Bool)

(assert (=> b!330230 (=> (not res!181968) (not e!202749))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330230 (= res!181968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158470))))

(assert (=> b!330230 (= lt!158470 (Intermediate!3109 false resIndex!58 resX!58))))

(declare-fun b!330231 () Bool)

(declare-fun res!181970 () Bool)

(assert (=> b!330231 (=> (not res!181970) (not e!202751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16871 (_ BitVec 32)) Bool)

(assert (=> b!330231 (= res!181970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330232 () Bool)

(declare-fun Unit!10259 () Unit!10253)

(assert (=> b!330232 (= e!202753 Unit!10259)))

(declare-fun b!330233 () Bool)

(declare-fun res!181973 () Bool)

(assert (=> b!330233 (=> (not res!181973) (not e!202751))))

(declare-fun arrayContainsKey!0 (array!16871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330233 (= res!181973 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33212 res!181972) b!330218))

(assert (= (and b!330218 res!181965) b!330221))

(assert (= (and b!330221 res!181967) b!330233))

(assert (= (and b!330233 res!181973) b!330227))

(assert (= (and b!330227 res!181969) b!330231))

(assert (= (and b!330231 res!181970) b!330230))

(assert (= (and b!330230 res!181968) b!330223))

(assert (= (and b!330223 res!181971) b!330229))

(assert (= (and b!330229 res!181974) b!330225))

(assert (= (and b!330225 res!181966) b!330224))

(assert (= (and b!330224 c!51769) b!330228))

(assert (= (and b!330224 (not c!51769)) b!330219))

(assert (= (and b!330228 c!51771) b!330222))

(assert (= (and b!330228 (not c!51771)) b!330226))

(assert (= (and b!330226 c!51770) b!330232))

(assert (= (and b!330226 (not c!51770)) b!330220))

(declare-fun m!335553 () Bool)

(assert (=> b!330226 m!335553))

(assert (=> b!330226 m!335553))

(declare-fun m!335555 () Bool)

(assert (=> b!330226 m!335555))

(declare-fun m!335557 () Bool)

(assert (=> start!33212 m!335557))

(declare-fun m!335559 () Bool)

(assert (=> start!33212 m!335559))

(declare-fun m!335561 () Bool)

(assert (=> b!330229 m!335561))

(declare-fun m!335563 () Bool)

(assert (=> b!330228 m!335563))

(assert (=> b!330225 m!335563))

(declare-fun m!335565 () Bool)

(assert (=> b!330223 m!335565))

(declare-fun m!335567 () Bool)

(assert (=> b!330227 m!335567))

(declare-fun m!335569 () Bool)

(assert (=> b!330233 m!335569))

(declare-fun m!335571 () Bool)

(assert (=> b!330231 m!335571))

(declare-fun m!335573 () Bool)

(assert (=> b!330221 m!335573))

(declare-fun m!335575 () Bool)

(assert (=> b!330230 m!335575))

(assert (=> b!330230 m!335575))

(declare-fun m!335577 () Bool)

(assert (=> b!330230 m!335577))

(push 1)

