; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32410 () Bool)

(assert start!32410)

(declare-fun b!323445 () Bool)

(declare-datatypes ((Unit!10004 0))(
  ( (Unit!10005) )
))
(declare-fun e!199934 () Unit!10004)

(declare-fun Unit!10006 () Unit!10004)

(assert (=> b!323445 (= e!199934 Unit!10006)))

(assert (=> b!323445 false))

(declare-fun b!323446 () Bool)

(declare-fun Unit!10007 () Unit!10004)

(assert (=> b!323446 (= e!199934 Unit!10007)))

(declare-fun b!323447 () Bool)

(declare-fun e!199935 () Unit!10004)

(declare-fun Unit!10008 () Unit!10004)

(assert (=> b!323447 (= e!199935 Unit!10008)))

(declare-fun b!323448 () Bool)

(declare-fun res!176982 () Bool)

(declare-fun e!199937 () Bool)

(assert (=> b!323448 (=> (not res!176982) (not e!199937))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323448 (= res!176982 (validKeyInArray!0 k!2497))))

(declare-fun b!323449 () Bool)

(declare-fun e!199938 () Unit!10004)

(assert (=> b!323449 (= e!199935 e!199938)))

(declare-fun c!50860 () Bool)

(declare-datatypes ((array!16549 0))(
  ( (array!16550 (arr!7832 (Array (_ BitVec 32) (_ BitVec 64))) (size!8184 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16549)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!323449 (= c!50860 (or (= (select (arr!7832 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7832 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323450 () Bool)

(declare-fun res!176984 () Bool)

(assert (=> b!323450 (=> (not res!176984) (not e!199937))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16549 (_ BitVec 32)) Bool)

(assert (=> b!323450 (= res!176984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323451 () Bool)

(declare-fun res!176979 () Bool)

(declare-fun e!199939 () Bool)

(assert (=> b!323451 (=> (not res!176979) (not e!199939))))

(declare-datatypes ((SeekEntryResult!2963 0))(
  ( (MissingZero!2963 (index!14028 (_ BitVec 32))) (Found!2963 (index!14029 (_ BitVec 32))) (Intermediate!2963 (undefined!3775 Bool) (index!14030 (_ BitVec 32)) (x!32287 (_ BitVec 32))) (Undefined!2963) (MissingVacant!2963 (index!14031 (_ BitVec 32))) )
))
(declare-fun lt!156639 () SeekEntryResult!2963)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16549 (_ BitVec 32)) SeekEntryResult!2963)

(assert (=> b!323451 (= res!176979 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156639))))

(declare-fun b!323452 () Bool)

(declare-fun res!176986 () Bool)

(assert (=> b!323452 (=> (not res!176986) (not e!199937))))

(declare-fun arrayContainsKey!0 (array!16549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323452 (= res!176986 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323453 () Bool)

(assert (=> b!323453 (= e!199939 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323453 (= index!1840 resIndex!58)))

(declare-fun lt!156637 () Unit!10004)

(assert (=> b!323453 (= lt!156637 e!199935)))

(declare-fun c!50862 () Bool)

(assert (=> b!323453 (= c!50862 (not (= resIndex!58 index!1840)))))

(declare-fun b!323454 () Bool)

(declare-fun res!176983 () Bool)

(assert (=> b!323454 (=> (not res!176983) (not e!199939))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323454 (= res!176983 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7832 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323455 () Bool)

(declare-fun res!176987 () Bool)

(assert (=> b!323455 (=> (not res!176987) (not e!199939))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323455 (= res!176987 (and (= (select (arr!7832 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8184 a!3305))))))

(declare-fun res!176988 () Bool)

(assert (=> start!32410 (=> (not res!176988) (not e!199937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32410 (= res!176988 (validMask!0 mask!3777))))

(assert (=> start!32410 e!199937))

(declare-fun array_inv!5795 (array!16549) Bool)

(assert (=> start!32410 (array_inv!5795 a!3305)))

(assert (=> start!32410 true))

(declare-fun b!323444 () Bool)

(declare-fun res!176980 () Bool)

(assert (=> b!323444 (=> (not res!176980) (not e!199937))))

(assert (=> b!323444 (= res!176980 (and (= (size!8184 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8184 a!3305))))))

(declare-fun b!323456 () Bool)

(assert (=> b!323456 false))

(declare-fun lt!156638 () Unit!10004)

(assert (=> b!323456 (= lt!156638 e!199934)))

(declare-fun c!50861 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323456 (= c!50861 (is-Intermediate!2963 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10009 () Unit!10004)

(assert (=> b!323456 (= e!199938 Unit!10009)))

(declare-fun b!323457 () Bool)

(declare-fun res!176985 () Bool)

(assert (=> b!323457 (=> (not res!176985) (not e!199937))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16549 (_ BitVec 32)) SeekEntryResult!2963)

(assert (=> b!323457 (= res!176985 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2963 i!1250)))))

(declare-fun b!323458 () Bool)

(assert (=> b!323458 false))

(declare-fun Unit!10010 () Unit!10004)

(assert (=> b!323458 (= e!199938 Unit!10010)))

(declare-fun b!323459 () Bool)

(assert (=> b!323459 (= e!199937 e!199939)))

(declare-fun res!176981 () Bool)

(assert (=> b!323459 (=> (not res!176981) (not e!199939))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323459 (= res!176981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156639))))

(assert (=> b!323459 (= lt!156639 (Intermediate!2963 false resIndex!58 resX!58))))

(assert (= (and start!32410 res!176988) b!323444))

(assert (= (and b!323444 res!176980) b!323448))

(assert (= (and b!323448 res!176982) b!323452))

(assert (= (and b!323452 res!176986) b!323457))

(assert (= (and b!323457 res!176985) b!323450))

(assert (= (and b!323450 res!176984) b!323459))

(assert (= (and b!323459 res!176981) b!323455))

(assert (= (and b!323455 res!176987) b!323451))

(assert (= (and b!323451 res!176979) b!323454))

(assert (= (and b!323454 res!176983) b!323453))

(assert (= (and b!323453 c!50862) b!323449))

(assert (= (and b!323453 (not c!50862)) b!323447))

(assert (= (and b!323449 c!50860) b!323458))

(assert (= (and b!323449 (not c!50860)) b!323456))

(assert (= (and b!323456 c!50861) b!323446))

(assert (= (and b!323456 (not c!50861)) b!323445))

(declare-fun m!330821 () Bool)

(assert (=> b!323457 m!330821))

(declare-fun m!330823 () Bool)

(assert (=> b!323448 m!330823))

(declare-fun m!330825 () Bool)

(assert (=> b!323455 m!330825))

(declare-fun m!330827 () Bool)

(assert (=> b!323450 m!330827))

(declare-fun m!330829 () Bool)

(assert (=> b!323449 m!330829))

(declare-fun m!330831 () Bool)

(assert (=> b!323451 m!330831))

(declare-fun m!330833 () Bool)

(assert (=> start!32410 m!330833))

(declare-fun m!330835 () Bool)

(assert (=> start!32410 m!330835))

(assert (=> b!323454 m!330829))

(declare-fun m!330837 () Bool)

(assert (=> b!323459 m!330837))

(assert (=> b!323459 m!330837))

(declare-fun m!330839 () Bool)

(assert (=> b!323459 m!330839))

(declare-fun m!330841 () Bool)

(assert (=> b!323456 m!330841))

(assert (=> b!323456 m!330841))

(declare-fun m!330843 () Bool)

(assert (=> b!323456 m!330843))

(declare-fun m!330845 () Bool)

(assert (=> b!323452 m!330845))

(push 1)

