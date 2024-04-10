; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32402 () Bool)

(assert start!32402)

(declare-fun b!323252 () Bool)

(declare-fun res!176863 () Bool)

(declare-fun e!199865 () Bool)

(assert (=> b!323252 (=> (not res!176863) (not e!199865))))

(declare-datatypes ((array!16541 0))(
  ( (array!16542 (arr!7828 (Array (_ BitVec 32) (_ BitVec 64))) (size!8180 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16541)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(assert (=> b!323252 (= res!176863 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7828 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323253 () Bool)

(declare-fun res!176864 () Bool)

(assert (=> b!323253 (=> (not res!176864) (not e!199865))))

(declare-datatypes ((SeekEntryResult!2959 0))(
  ( (MissingZero!2959 (index!14012 (_ BitVec 32))) (Found!2959 (index!14013 (_ BitVec 32))) (Intermediate!2959 (undefined!3771 Bool) (index!14014 (_ BitVec 32)) (x!32267 (_ BitVec 32))) (Undefined!2959) (MissingVacant!2959 (index!14015 (_ BitVec 32))) )
))
(declare-fun lt!156603 () SeekEntryResult!2959)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16541 (_ BitVec 32)) SeekEntryResult!2959)

(assert (=> b!323253 (= res!176864 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156603))))

(declare-fun b!323254 () Bool)

(declare-datatypes ((Unit!9976 0))(
  ( (Unit!9977) )
))
(declare-fun e!199862 () Unit!9976)

(declare-fun Unit!9978 () Unit!9976)

(assert (=> b!323254 (= e!199862 Unit!9978)))

(declare-fun b!323255 () Bool)

(declare-fun res!176868 () Bool)

(declare-fun e!199864 () Bool)

(assert (=> b!323255 (=> (not res!176868) (not e!199864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323255 (= res!176868 (validKeyInArray!0 k!2497))))

(declare-fun b!323256 () Bool)

(declare-fun res!176866 () Bool)

(assert (=> b!323256 (=> (not res!176866) (not e!199864))))

(declare-fun arrayContainsKey!0 (array!16541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323256 (= res!176866 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323257 () Bool)

(declare-fun e!199866 () Unit!9976)

(assert (=> b!323257 (= e!199862 e!199866)))

(declare-fun c!50825 () Bool)

(assert (=> b!323257 (= c!50825 (or (= (select (arr!7828 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7828 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323258 () Bool)

(assert (=> b!323258 false))

(declare-fun lt!156601 () Unit!9976)

(declare-fun e!199867 () Unit!9976)

(assert (=> b!323258 (= lt!156601 e!199867)))

(declare-fun c!50824 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323258 (= c!50824 (is-Intermediate!2959 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!9979 () Unit!9976)

(assert (=> b!323258 (= e!199866 Unit!9979)))

(declare-fun b!323259 () Bool)

(assert (=> b!323259 (= e!199865 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323259 (= index!1840 resIndex!58)))

(declare-fun lt!156602 () Unit!9976)

(assert (=> b!323259 (= lt!156602 e!199862)))

(declare-fun c!50826 () Bool)

(assert (=> b!323259 (= c!50826 (not (= resIndex!58 index!1840)))))

(declare-fun b!323260 () Bool)

(declare-fun Unit!9980 () Unit!9976)

(assert (=> b!323260 (= e!199867 Unit!9980)))

(declare-fun res!176859 () Bool)

(assert (=> start!32402 (=> (not res!176859) (not e!199864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32402 (= res!176859 (validMask!0 mask!3777))))

(assert (=> start!32402 e!199864))

(declare-fun array_inv!5791 (array!16541) Bool)

(assert (=> start!32402 (array_inv!5791 a!3305)))

(assert (=> start!32402 true))

(declare-fun b!323261 () Bool)

(declare-fun res!176867 () Bool)

(assert (=> b!323261 (=> (not res!176867) (not e!199864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16541 (_ BitVec 32)) Bool)

(assert (=> b!323261 (= res!176867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323262 () Bool)

(declare-fun Unit!9981 () Unit!9976)

(assert (=> b!323262 (= e!199867 Unit!9981)))

(assert (=> b!323262 false))

(declare-fun b!323263 () Bool)

(assert (=> b!323263 (= e!199864 e!199865)))

(declare-fun res!176862 () Bool)

(assert (=> b!323263 (=> (not res!176862) (not e!199865))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323263 (= res!176862 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156603))))

(assert (=> b!323263 (= lt!156603 (Intermediate!2959 false resIndex!58 resX!58))))

(declare-fun b!323264 () Bool)

(assert (=> b!323264 false))

(declare-fun Unit!9982 () Unit!9976)

(assert (=> b!323264 (= e!199866 Unit!9982)))

(declare-fun b!323265 () Bool)

(declare-fun res!176865 () Bool)

(assert (=> b!323265 (=> (not res!176865) (not e!199865))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323265 (= res!176865 (and (= (select (arr!7828 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8180 a!3305))))))

(declare-fun b!323266 () Bool)

(declare-fun res!176860 () Bool)

(assert (=> b!323266 (=> (not res!176860) (not e!199864))))

(assert (=> b!323266 (= res!176860 (and (= (size!8180 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8180 a!3305))))))

(declare-fun b!323267 () Bool)

(declare-fun res!176861 () Bool)

(assert (=> b!323267 (=> (not res!176861) (not e!199864))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16541 (_ BitVec 32)) SeekEntryResult!2959)

(assert (=> b!323267 (= res!176861 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2959 i!1250)))))

(assert (= (and start!32402 res!176859) b!323266))

(assert (= (and b!323266 res!176860) b!323255))

(assert (= (and b!323255 res!176868) b!323256))

(assert (= (and b!323256 res!176866) b!323267))

(assert (= (and b!323267 res!176861) b!323261))

(assert (= (and b!323261 res!176867) b!323263))

(assert (= (and b!323263 res!176862) b!323265))

(assert (= (and b!323265 res!176865) b!323253))

(assert (= (and b!323253 res!176864) b!323252))

(assert (= (and b!323252 res!176863) b!323259))

(assert (= (and b!323259 c!50826) b!323257))

(assert (= (and b!323259 (not c!50826)) b!323254))

(assert (= (and b!323257 c!50825) b!323264))

(assert (= (and b!323257 (not c!50825)) b!323258))

(assert (= (and b!323258 c!50824) b!323260))

(assert (= (and b!323258 (not c!50824)) b!323262))

(declare-fun m!330717 () Bool)

(assert (=> b!323261 m!330717))

(declare-fun m!330719 () Bool)

(assert (=> b!323255 m!330719))

(declare-fun m!330721 () Bool)

(assert (=> b!323257 m!330721))

(declare-fun m!330723 () Bool)

(assert (=> b!323267 m!330723))

(assert (=> b!323252 m!330721))

(declare-fun m!330725 () Bool)

(assert (=> b!323263 m!330725))

(assert (=> b!323263 m!330725))

(declare-fun m!330727 () Bool)

(assert (=> b!323263 m!330727))

(declare-fun m!330729 () Bool)

(assert (=> b!323265 m!330729))

(declare-fun m!330731 () Bool)

(assert (=> b!323253 m!330731))

(declare-fun m!330733 () Bool)

(assert (=> b!323256 m!330733))

(declare-fun m!330735 () Bool)

(assert (=> b!323258 m!330735))

(assert (=> b!323258 m!330735))

(declare-fun m!330737 () Bool)

(assert (=> b!323258 m!330737))

(declare-fun m!330739 () Bool)

(assert (=> start!32402 m!330739))

(declare-fun m!330741 () Bool)

(assert (=> start!32402 m!330741))

(push 1)

(assert (not b!323258))

(assert (not b!323256))

(assert (not b!323253))

(assert (not start!32402))

(assert (not b!323261))

(assert (not b!323263))

(assert (not b!323255))

(assert (not b!323267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

