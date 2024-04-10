; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65552 () Bool)

(assert start!65552)

(declare-fun b!748612 () Bool)

(declare-fun e!417819 () Bool)

(declare-fun e!417818 () Bool)

(assert (=> b!748612 (= e!417819 e!417818)))

(declare-fun res!505011 () Bool)

(assert (=> b!748612 (=> (not res!505011) (not e!417818))))

(declare-datatypes ((SeekEntryResult!7576 0))(
  ( (MissingZero!7576 (index!32672 (_ BitVec 32))) (Found!7576 (index!32673 (_ BitVec 32))) (Intermediate!7576 (undefined!8388 Bool) (index!32674 (_ BitVec 32)) (x!63606 (_ BitVec 32))) (Undefined!7576) (MissingVacant!7576 (index!32675 (_ BitVec 32))) )
))
(declare-fun lt!332794 () SeekEntryResult!7576)

(declare-fun lt!332787 () SeekEntryResult!7576)

(assert (=> b!748612 (= res!505011 (= lt!332794 lt!332787))))

(declare-fun lt!332793 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41725 0))(
  ( (array!41726 (arr!19976 (Array (_ BitVec 32) (_ BitVec 64))) (size!20397 (_ BitVec 32))) )
))
(declare-fun lt!332795 () array!41725)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41725 (_ BitVec 32)) SeekEntryResult!7576)

(assert (=> b!748612 (= lt!332787 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332793 lt!332795 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748612 (= lt!332794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332793 mask!3328) lt!332793 lt!332795 mask!3328))))

(declare-fun a!3186 () array!41725)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!748612 (= lt!332793 (select (store (arr!19976 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748612 (= lt!332795 (array!41726 (store (arr!19976 a!3186) i!1173 k!2102) (size!20397 a!3186)))))

(declare-fun res!505014 () Bool)

(declare-fun e!417817 () Bool)

(assert (=> start!65552 (=> (not res!505014) (not e!417817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65552 (= res!505014 (validMask!0 mask!3328))))

(assert (=> start!65552 e!417817))

(assert (=> start!65552 true))

(declare-fun array_inv!15772 (array!41725) Bool)

(assert (=> start!65552 (array_inv!15772 a!3186)))

(declare-fun b!748613 () Bool)

(declare-fun res!505013 () Bool)

(assert (=> b!748613 (=> (not res!505013) (not e!417817))))

(assert (=> b!748613 (= res!505013 (and (= (size!20397 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20397 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20397 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!417820 () Bool)

(declare-fun b!748614 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41725 (_ BitVec 32)) SeekEntryResult!7576)

(assert (=> b!748614 (= e!417820 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) (Found!7576 j!159)))))

(declare-fun b!748615 () Bool)

(declare-fun res!505015 () Bool)

(declare-fun e!417816 () Bool)

(assert (=> b!748615 (=> res!505015 e!417816)))

(declare-fun lt!332788 () SeekEntryResult!7576)

(assert (=> b!748615 (= res!505015 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332788)))))

(declare-fun b!748616 () Bool)

(declare-fun res!505006 () Bool)

(assert (=> b!748616 (=> (not res!505006) (not e!417817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748616 (= res!505006 (validKeyInArray!0 k!2102))))

(declare-fun b!748617 () Bool)

(declare-fun e!417813 () Bool)

(assert (=> b!748617 (= e!417817 e!417813)))

(declare-fun res!505018 () Bool)

(assert (=> b!748617 (=> (not res!505018) (not e!417813))))

(declare-fun lt!332789 () SeekEntryResult!7576)

(assert (=> b!748617 (= res!505018 (or (= lt!332789 (MissingZero!7576 i!1173)) (= lt!332789 (MissingVacant!7576 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41725 (_ BitVec 32)) SeekEntryResult!7576)

(assert (=> b!748617 (= lt!332789 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!748618 () Bool)

(declare-fun res!505016 () Bool)

(assert (=> b!748618 (=> (not res!505016) (not e!417817))))

(assert (=> b!748618 (= res!505016 (validKeyInArray!0 (select (arr!19976 a!3186) j!159)))))

(declare-fun b!748619 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!417814 () Bool)

(assert (=> b!748619 (= e!417814 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332788))))

(declare-fun b!748620 () Bool)

(assert (=> b!748620 (= e!417816 true)))

(assert (=> b!748620 (= (select (store (arr!19976 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25684 0))(
  ( (Unit!25685) )
))
(declare-fun lt!332791 () Unit!25684)

(declare-fun e!417815 () Unit!25684)

(assert (=> b!748620 (= lt!332791 e!417815)))

(declare-fun c!82186 () Bool)

(assert (=> b!748620 (= c!82186 (= (select (store (arr!19976 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748621 () Bool)

(assert (=> b!748621 (= e!417813 e!417819)))

(declare-fun res!505009 () Bool)

(assert (=> b!748621 (=> (not res!505009) (not e!417819))))

(declare-fun lt!332790 () SeekEntryResult!7576)

(assert (=> b!748621 (= res!505009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19976 a!3186) j!159) mask!3328) (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332790))))

(assert (=> b!748621 (= lt!332790 (Intermediate!7576 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748622 () Bool)

(declare-fun res!505003 () Bool)

(assert (=> b!748622 (=> (not res!505003) (not e!417813))))

(assert (=> b!748622 (= res!505003 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20397 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20397 a!3186))))))

(declare-fun b!748623 () Bool)

(assert (=> b!748623 (= e!417820 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19976 a!3186) j!159) a!3186 mask!3328) lt!332790))))

(declare-fun b!748624 () Bool)

(assert (=> b!748624 (= e!417818 (not e!417816))))

(declare-fun res!505004 () Bool)

(assert (=> b!748624 (=> res!505004 e!417816)))

(assert (=> b!748624 (= res!505004 (or (not (is-Intermediate!7576 lt!332787)) (bvslt x!1131 (x!63606 lt!332787)) (not (= x!1131 (x!63606 lt!332787))) (not (= index!1321 (index!32674 lt!332787)))))))

(assert (=> b!748624 e!417814))

(declare-fun res!505017 () Bool)

(assert (=> b!748624 (=> (not res!505017) (not e!417814))))

(declare-fun lt!332792 () SeekEntryResult!7576)

(assert (=> b!748624 (= res!505017 (= lt!332792 lt!332788))))

(assert (=> b!748624 (= lt!332788 (Found!7576 j!159))))

(assert (=> b!748624 (= lt!332792 (seekEntryOrOpen!0 (select (arr!19976 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41725 (_ BitVec 32)) Bool)

(assert (=> b!748624 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332786 () Unit!25684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25684)

(assert (=> b!748624 (= lt!332786 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748625 () Bool)

(declare-fun res!505010 () Bool)

(assert (=> b!748625 (=> (not res!505010) (not e!417813))))

(assert (=> b!748625 (= res!505010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748626 () Bool)

(declare-fun res!505019 () Bool)

(assert (=> b!748626 (=> (not res!505019) (not e!417819))))

(assert (=> b!748626 (= res!505019 e!417820)))

(declare-fun c!82185 () Bool)

(assert (=> b!748626 (= c!82185 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748627 () Bool)

(declare-fun res!505012 () Bool)

(assert (=> b!748627 (=> res!505012 e!417816)))

(assert (=> b!748627 (= res!505012 (= (select (store (arr!19976 a!3186) i!1173 k!2102) index!1321) lt!332793))))

(declare-fun b!748628 () Bool)

(declare-fun res!505008 () Bool)

(assert (=> b!748628 (=> (not res!505008) (not e!417813))))

(declare-datatypes ((List!13978 0))(
  ( (Nil!13975) (Cons!13974 (h!15046 (_ BitVec 64)) (t!20293 List!13978)) )
))
(declare-fun arrayNoDuplicates!0 (array!41725 (_ BitVec 32) List!13978) Bool)

(assert (=> b!748628 (= res!505008 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13975))))

(declare-fun b!748629 () Bool)

(declare-fun Unit!25686 () Unit!25684)

(assert (=> b!748629 (= e!417815 Unit!25686)))

(assert (=> b!748629 false))

(declare-fun b!748630 () Bool)

(declare-fun res!505005 () Bool)

(assert (=> b!748630 (=> (not res!505005) (not e!417817))))

(declare-fun arrayContainsKey!0 (array!41725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748630 (= res!505005 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748631 () Bool)

(declare-fun Unit!25687 () Unit!25684)

(assert (=> b!748631 (= e!417815 Unit!25687)))

(declare-fun b!748632 () Bool)

(declare-fun res!505007 () Bool)

(assert (=> b!748632 (=> (not res!505007) (not e!417819))))

(assert (=> b!748632 (= res!505007 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19976 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65552 res!505014) b!748613))

(assert (= (and b!748613 res!505013) b!748618))

(assert (= (and b!748618 res!505016) b!748616))

(assert (= (and b!748616 res!505006) b!748630))

(assert (= (and b!748630 res!505005) b!748617))

(assert (= (and b!748617 res!505018) b!748625))

(assert (= (and b!748625 res!505010) b!748628))

(assert (= (and b!748628 res!505008) b!748622))

(assert (= (and b!748622 res!505003) b!748621))

(assert (= (and b!748621 res!505009) b!748632))

(assert (= (and b!748632 res!505007) b!748626))

(assert (= (and b!748626 c!82185) b!748623))

(assert (= (and b!748626 (not c!82185)) b!748614))

(assert (= (and b!748626 res!505019) b!748612))

(assert (= (and b!748612 res!505011) b!748624))

(assert (= (and b!748624 res!505017) b!748619))

(assert (= (and b!748624 (not res!505004)) b!748615))

(assert (= (and b!748615 (not res!505015)) b!748627))

(assert (= (and b!748627 (not res!505012)) b!748620))

(assert (= (and b!748620 c!82186) b!748629))

(assert (= (and b!748620 (not c!82186)) b!748631))

(declare-fun m!698413 () Bool)

(assert (=> b!748624 m!698413))

(assert (=> b!748624 m!698413))

(declare-fun m!698415 () Bool)

(assert (=> b!748624 m!698415))

(declare-fun m!698417 () Bool)

(assert (=> b!748624 m!698417))

(declare-fun m!698419 () Bool)

(assert (=> b!748624 m!698419))

(assert (=> b!748618 m!698413))

(assert (=> b!748618 m!698413))

(declare-fun m!698421 () Bool)

(assert (=> b!748618 m!698421))

(declare-fun m!698423 () Bool)

(assert (=> b!748632 m!698423))

(declare-fun m!698425 () Bool)

(assert (=> b!748620 m!698425))

(declare-fun m!698427 () Bool)

(assert (=> b!748620 m!698427))

(declare-fun m!698429 () Bool)

(assert (=> b!748617 m!698429))

(declare-fun m!698431 () Bool)

(assert (=> b!748616 m!698431))

(assert (=> b!748614 m!698413))

(assert (=> b!748614 m!698413))

(declare-fun m!698433 () Bool)

(assert (=> b!748614 m!698433))

(assert (=> b!748615 m!698413))

(assert (=> b!748615 m!698413))

(assert (=> b!748615 m!698433))

(declare-fun m!698435 () Bool)

(assert (=> start!65552 m!698435))

(declare-fun m!698437 () Bool)

(assert (=> start!65552 m!698437))

(assert (=> b!748623 m!698413))

(assert (=> b!748623 m!698413))

(declare-fun m!698439 () Bool)

(assert (=> b!748623 m!698439))

(assert (=> b!748619 m!698413))

(assert (=> b!748619 m!698413))

(declare-fun m!698441 () Bool)

(assert (=> b!748619 m!698441))

(assert (=> b!748627 m!698425))

(assert (=> b!748627 m!698427))

(declare-fun m!698443 () Bool)

(assert (=> b!748625 m!698443))

(assert (=> b!748621 m!698413))

(assert (=> b!748621 m!698413))

(declare-fun m!698445 () Bool)

(assert (=> b!748621 m!698445))

(assert (=> b!748621 m!698445))

(assert (=> b!748621 m!698413))

(declare-fun m!698447 () Bool)

(assert (=> b!748621 m!698447))

(declare-fun m!698449 () Bool)

(assert (=> b!748612 m!698449))

(declare-fun m!698451 () Bool)

(assert (=> b!748612 m!698451))

(declare-fun m!698453 () Bool)

(assert (=> b!748612 m!698453))

(assert (=> b!748612 m!698425))

(declare-fun m!698455 () Bool)

(assert (=> b!748612 m!698455))

(assert (=> b!748612 m!698449))

(declare-fun m!698457 () Bool)

(assert (=> b!748630 m!698457))

(declare-fun m!698459 () Bool)

(assert (=> b!748628 m!698459))

(push 1)

