; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65344 () Bool)

(assert start!65344)

(declare-fun b!742594 () Bool)

(declare-fun res!499776 () Bool)

(declare-fun e!414996 () Bool)

(assert (=> b!742594 (=> (not res!499776) (not e!414996))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41517 0))(
  ( (array!41518 (arr!19872 (Array (_ BitVec 32) (_ BitVec 64))) (size!20293 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41517)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742594 (= res!499776 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20293 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20293 a!3186))))))

(declare-fun b!742595 () Bool)

(declare-datatypes ((SeekEntryResult!7472 0))(
  ( (MissingZero!7472 (index!32256 (_ BitVec 32))) (Found!7472 (index!32257 (_ BitVec 32))) (Intermediate!7472 (undefined!8284 Bool) (index!32258 (_ BitVec 32)) (x!63230 (_ BitVec 32))) (Undefined!7472) (MissingVacant!7472 (index!32259 (_ BitVec 32))) )
))
(declare-fun lt!329892 () SeekEntryResult!7472)

(declare-fun e!415002 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41517 (_ BitVec 32)) SeekEntryResult!7472)

(assert (=> b!742595 (= e!415002 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19872 a!3186) j!159) a!3186 mask!3328) lt!329892))))

(declare-fun b!742596 () Bool)

(declare-fun res!499772 () Bool)

(declare-fun e!414998 () Bool)

(assert (=> b!742596 (=> (not res!499772) (not e!414998))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742596 (= res!499772 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19872 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742597 () Bool)

(declare-fun e!415004 () Bool)

(declare-fun e!414999 () Bool)

(assert (=> b!742597 (= e!415004 (not e!414999))))

(declare-fun res!499769 () Bool)

(assert (=> b!742597 (=> res!499769 e!414999)))

(declare-fun lt!329891 () SeekEntryResult!7472)

(assert (=> b!742597 (= res!499769 (or (not (is-Intermediate!7472 lt!329891)) (bvslt x!1131 (x!63230 lt!329891)) (not (= x!1131 (x!63230 lt!329891))) (not (= index!1321 (index!32258 lt!329891)))))))

(declare-fun e!414997 () Bool)

(assert (=> b!742597 e!414997))

(declare-fun res!499780 () Bool)

(assert (=> b!742597 (=> (not res!499780) (not e!414997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41517 (_ BitVec 32)) Bool)

(assert (=> b!742597 (= res!499780 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25424 0))(
  ( (Unit!25425) )
))
(declare-fun lt!329894 () Unit!25424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25424)

(assert (=> b!742597 (= lt!329894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742598 () Bool)

(declare-fun res!499777 () Bool)

(declare-fun e!415000 () Bool)

(assert (=> b!742598 (=> (not res!499777) (not e!415000))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742598 (= res!499777 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!415001 () Bool)

(declare-fun lt!329895 () SeekEntryResult!7472)

(declare-fun b!742599 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41517 (_ BitVec 32)) SeekEntryResult!7472)

(assert (=> b!742599 (= e!415001 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19872 a!3186) j!159) a!3186 mask!3328) lt!329895))))

(declare-fun b!742600 () Bool)

(declare-fun res!499783 () Bool)

(assert (=> b!742600 (=> (not res!499783) (not e!415000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742600 (= res!499783 (validKeyInArray!0 (select (arr!19872 a!3186) j!159)))))

(declare-fun res!499771 () Bool)

(assert (=> start!65344 (=> (not res!499771) (not e!415000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65344 (= res!499771 (validMask!0 mask!3328))))

(assert (=> start!65344 e!415000))

(assert (=> start!65344 true))

(declare-fun array_inv!15668 (array!41517) Bool)

(assert (=> start!65344 (array_inv!15668 a!3186)))

(declare-fun b!742601 () Bool)

(assert (=> b!742601 (= e!415002 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19872 a!3186) j!159) a!3186 mask!3328) (Found!7472 j!159)))))

(declare-fun b!742602 () Bool)

(assert (=> b!742602 (= e!415000 e!414996)))

(declare-fun res!499784 () Bool)

(assert (=> b!742602 (=> (not res!499784) (not e!414996))))

(declare-fun lt!329893 () SeekEntryResult!7472)

(assert (=> b!742602 (= res!499784 (or (= lt!329893 (MissingZero!7472 i!1173)) (= lt!329893 (MissingVacant!7472 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41517 (_ BitVec 32)) SeekEntryResult!7472)

(assert (=> b!742602 (= lt!329893 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742603 () Bool)

(declare-fun res!499770 () Bool)

(assert (=> b!742603 (=> (not res!499770) (not e!414998))))

(assert (=> b!742603 (= res!499770 e!415002)))

(declare-fun c!81793 () Bool)

(assert (=> b!742603 (= c!81793 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742604 () Bool)

(declare-fun res!499774 () Bool)

(assert (=> b!742604 (=> (not res!499774) (not e!415000))))

(assert (=> b!742604 (= res!499774 (validKeyInArray!0 k!2102))))

(declare-fun b!742605 () Bool)

(assert (=> b!742605 (= e!414997 e!415001)))

(declare-fun res!499773 () Bool)

(assert (=> b!742605 (=> (not res!499773) (not e!415001))))

(assert (=> b!742605 (= res!499773 (= (seekEntryOrOpen!0 (select (arr!19872 a!3186) j!159) a!3186 mask!3328) lt!329895))))

(assert (=> b!742605 (= lt!329895 (Found!7472 j!159))))

(declare-fun b!742606 () Bool)

(assert (=> b!742606 (= e!414996 e!414998)))

(declare-fun res!499775 () Bool)

(assert (=> b!742606 (=> (not res!499775) (not e!414998))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742606 (= res!499775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19872 a!3186) j!159) mask!3328) (select (arr!19872 a!3186) j!159) a!3186 mask!3328) lt!329892))))

(assert (=> b!742606 (= lt!329892 (Intermediate!7472 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742607 () Bool)

(declare-fun res!499779 () Bool)

(assert (=> b!742607 (=> (not res!499779) (not e!415000))))

(assert (=> b!742607 (= res!499779 (and (= (size!20293 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20293 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20293 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742608 () Bool)

(assert (=> b!742608 (= e!414998 e!415004)))

(declare-fun res!499778 () Bool)

(assert (=> b!742608 (=> (not res!499778) (not e!415004))))

(declare-fun lt!329896 () SeekEntryResult!7472)

(assert (=> b!742608 (= res!499778 (= lt!329896 lt!329891))))

(declare-fun lt!329890 () (_ BitVec 64))

(declare-fun lt!329897 () array!41517)

(assert (=> b!742608 (= lt!329891 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329890 lt!329897 mask!3328))))

(assert (=> b!742608 (= lt!329896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329890 mask!3328) lt!329890 lt!329897 mask!3328))))

(assert (=> b!742608 (= lt!329890 (select (store (arr!19872 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742608 (= lt!329897 (array!41518 (store (arr!19872 a!3186) i!1173 k!2102) (size!20293 a!3186)))))

(declare-fun b!742609 () Bool)

(declare-fun res!499782 () Bool)

(assert (=> b!742609 (=> (not res!499782) (not e!414996))))

(declare-datatypes ((List!13874 0))(
  ( (Nil!13871) (Cons!13870 (h!14942 (_ BitVec 64)) (t!20189 List!13874)) )
))
(declare-fun arrayNoDuplicates!0 (array!41517 (_ BitVec 32) List!13874) Bool)

(assert (=> b!742609 (= res!499782 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13871))))

(declare-fun b!742610 () Bool)

(assert (=> b!742610 (= e!414999 true)))

(declare-fun lt!329889 () SeekEntryResult!7472)

(assert (=> b!742610 (= lt!329889 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19872 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!742611 () Bool)

(declare-fun res!499781 () Bool)

(assert (=> b!742611 (=> (not res!499781) (not e!414996))))

(assert (=> b!742611 (= res!499781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65344 res!499771) b!742607))

(assert (= (and b!742607 res!499779) b!742600))

(assert (= (and b!742600 res!499783) b!742604))

(assert (= (and b!742604 res!499774) b!742598))

(assert (= (and b!742598 res!499777) b!742602))

(assert (= (and b!742602 res!499784) b!742611))

(assert (= (and b!742611 res!499781) b!742609))

(assert (= (and b!742609 res!499782) b!742594))

(assert (= (and b!742594 res!499776) b!742606))

(assert (= (and b!742606 res!499775) b!742596))

(assert (= (and b!742596 res!499772) b!742603))

(assert (= (and b!742603 c!81793) b!742595))

(assert (= (and b!742603 (not c!81793)) b!742601))

(assert (= (and b!742603 res!499770) b!742608))

(assert (= (and b!742608 res!499778) b!742597))

(assert (= (and b!742597 res!499780) b!742605))

(assert (= (and b!742605 res!499773) b!742599))

(assert (= (and b!742597 (not res!499769)) b!742610))

(declare-fun m!693433 () Bool)

(assert (=> b!742595 m!693433))

(assert (=> b!742595 m!693433))

(declare-fun m!693435 () Bool)

(assert (=> b!742595 m!693435))

(assert (=> b!742606 m!693433))

(assert (=> b!742606 m!693433))

(declare-fun m!693437 () Bool)

(assert (=> b!742606 m!693437))

(assert (=> b!742606 m!693437))

(assert (=> b!742606 m!693433))

(declare-fun m!693439 () Bool)

(assert (=> b!742606 m!693439))

(declare-fun m!693441 () Bool)

(assert (=> b!742602 m!693441))

(declare-fun m!693443 () Bool)

(assert (=> b!742596 m!693443))

(declare-fun m!693445 () Bool)

(assert (=> b!742598 m!693445))

(declare-fun m!693447 () Bool)

(assert (=> b!742604 m!693447))

(declare-fun m!693449 () Bool)

(assert (=> b!742609 m!693449))

(assert (=> b!742610 m!693433))

(assert (=> b!742610 m!693433))

(declare-fun m!693451 () Bool)

(assert (=> b!742610 m!693451))

(declare-fun m!693453 () Bool)

(assert (=> b!742597 m!693453))

(declare-fun m!693455 () Bool)

(assert (=> b!742597 m!693455))

(declare-fun m!693457 () Bool)

(assert (=> b!742611 m!693457))

(assert (=> b!742600 m!693433))

(assert (=> b!742600 m!693433))

(declare-fun m!693459 () Bool)

(assert (=> b!742600 m!693459))

(declare-fun m!693461 () Bool)

(assert (=> b!742608 m!693461))

(declare-fun m!693463 () Bool)

(assert (=> b!742608 m!693463))

(assert (=> b!742608 m!693461))

(declare-fun m!693465 () Bool)

(assert (=> b!742608 m!693465))

(declare-fun m!693467 () Bool)

(assert (=> b!742608 m!693467))

(declare-fun m!693469 () Bool)

(assert (=> b!742608 m!693469))

(declare-fun m!693471 () Bool)

(assert (=> start!65344 m!693471))

(declare-fun m!693473 () Bool)

(assert (=> start!65344 m!693473))

(assert (=> b!742605 m!693433))

(assert (=> b!742605 m!693433))

(declare-fun m!693475 () Bool)

(assert (=> b!742605 m!693475))

(assert (=> b!742599 m!693433))

(assert (=> b!742599 m!693433))

(declare-fun m!693477 () Bool)

(assert (=> b!742599 m!693477))

(assert (=> b!742601 m!693433))

(assert (=> b!742601 m!693433))

(assert (=> b!742601 m!693451))

(push 1)

