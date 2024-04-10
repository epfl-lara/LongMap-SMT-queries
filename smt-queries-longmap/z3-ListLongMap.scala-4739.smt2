; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65496 () Bool)

(assert start!65496)

(declare-fun b!746851 () Bool)

(declare-fun e!417056 () Bool)

(declare-fun e!417050 () Bool)

(assert (=> b!746851 (= e!417056 e!417050)))

(declare-fun res!503571 () Bool)

(assert (=> b!746851 (=> res!503571 e!417050)))

(declare-datatypes ((array!41669 0))(
  ( (array!41670 (arr!19948 (Array (_ BitVec 32) (_ BitVec 64))) (size!20369 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41669)

(declare-fun lt!331947 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7548 0))(
  ( (MissingZero!7548 (index!32560 (_ BitVec 32))) (Found!7548 (index!32561 (_ BitVec 32))) (Intermediate!7548 (undefined!8360 Bool) (index!32562 (_ BitVec 32)) (x!63506 (_ BitVec 32))) (Undefined!7548) (MissingVacant!7548 (index!32563 (_ BitVec 32))) )
))
(declare-fun lt!331950 () SeekEntryResult!7548)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!331955 () SeekEntryResult!7548)

(assert (=> b!746851 (= res!503571 (or (not (= lt!331955 lt!331950)) (= (select (store (arr!19948 a!3186) i!1173 k0!2102) index!1321) lt!331947) (not (= (select (store (arr!19948 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41669 (_ BitVec 32)) SeekEntryResult!7548)

(assert (=> b!746851 (= lt!331955 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19948 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!331951 () SeekEntryResult!7548)

(declare-fun e!417049 () Bool)

(declare-fun b!746852 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41669 (_ BitVec 32)) SeekEntryResult!7548)

(assert (=> b!746852 (= e!417049 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19948 a!3186) j!159) a!3186 mask!3328) lt!331951))))

(declare-fun b!746853 () Bool)

(declare-fun res!503585 () Bool)

(declare-fun e!417055 () Bool)

(assert (=> b!746853 (=> (not res!503585) (not e!417055))))

(assert (=> b!746853 (= res!503585 e!417049)))

(declare-fun c!82021 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746853 (= c!82021 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746855 () Bool)

(declare-fun e!417054 () Bool)

(assert (=> b!746855 (= e!417054 (not e!417056))))

(declare-fun res!503570 () Bool)

(assert (=> b!746855 (=> res!503570 e!417056)))

(declare-fun lt!331954 () SeekEntryResult!7548)

(get-info :version)

(assert (=> b!746855 (= res!503570 (or (not ((_ is Intermediate!7548) lt!331954)) (bvslt x!1131 (x!63506 lt!331954)) (not (= x!1131 (x!63506 lt!331954))) (not (= index!1321 (index!32562 lt!331954)))))))

(declare-fun e!417051 () Bool)

(assert (=> b!746855 e!417051))

(declare-fun res!503573 () Bool)

(assert (=> b!746855 (=> (not res!503573) (not e!417051))))

(declare-fun lt!331948 () SeekEntryResult!7548)

(assert (=> b!746855 (= res!503573 (= lt!331948 lt!331950))))

(assert (=> b!746855 (= lt!331950 (Found!7548 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41669 (_ BitVec 32)) SeekEntryResult!7548)

(assert (=> b!746855 (= lt!331948 (seekEntryOrOpen!0 (select (arr!19948 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41669 (_ BitVec 32)) Bool)

(assert (=> b!746855 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25576 0))(
  ( (Unit!25577) )
))
(declare-fun lt!331946 () Unit!25576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25576)

(assert (=> b!746855 (= lt!331946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746856 () Bool)

(declare-fun res!503578 () Bool)

(declare-fun e!417052 () Bool)

(assert (=> b!746856 (=> (not res!503578) (not e!417052))))

(declare-datatypes ((List!13950 0))(
  ( (Nil!13947) (Cons!13946 (h!15018 (_ BitVec 64)) (t!20265 List!13950)) )
))
(declare-fun arrayNoDuplicates!0 (array!41669 (_ BitVec 32) List!13950) Bool)

(assert (=> b!746856 (= res!503578 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13947))))

(declare-fun b!746857 () Bool)

(assert (=> b!746857 (= e!417052 e!417055)))

(declare-fun res!503579 () Bool)

(assert (=> b!746857 (=> (not res!503579) (not e!417055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746857 (= res!503579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19948 a!3186) j!159) mask!3328) (select (arr!19948 a!3186) j!159) a!3186 mask!3328) lt!331951))))

(assert (=> b!746857 (= lt!331951 (Intermediate!7548 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746858 () Bool)

(declare-fun res!503574 () Bool)

(declare-fun e!417048 () Bool)

(assert (=> b!746858 (=> (not res!503574) (not e!417048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746858 (= res!503574 (validKeyInArray!0 (select (arr!19948 a!3186) j!159)))))

(declare-fun b!746859 () Bool)

(assert (=> b!746859 (= e!417049 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19948 a!3186) j!159) a!3186 mask!3328) (Found!7548 j!159)))))

(declare-fun b!746860 () Bool)

(assert (=> b!746860 (= e!417050 true)))

(assert (=> b!746860 (= lt!331948 lt!331955)))

(declare-fun b!746861 () Bool)

(declare-fun res!503572 () Bool)

(assert (=> b!746861 (=> (not res!503572) (not e!417048))))

(assert (=> b!746861 (= res!503572 (and (= (size!20369 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20369 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20369 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746862 () Bool)

(declare-fun res!503575 () Bool)

(assert (=> b!746862 (=> (not res!503575) (not e!417052))))

(assert (=> b!746862 (= res!503575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746863 () Bool)

(assert (=> b!746863 (= e!417055 e!417054)))

(declare-fun res!503584 () Bool)

(assert (=> b!746863 (=> (not res!503584) (not e!417054))))

(declare-fun lt!331949 () SeekEntryResult!7548)

(assert (=> b!746863 (= res!503584 (= lt!331949 lt!331954))))

(declare-fun lt!331952 () array!41669)

(assert (=> b!746863 (= lt!331954 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331947 lt!331952 mask!3328))))

(assert (=> b!746863 (= lt!331949 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331947 mask!3328) lt!331947 lt!331952 mask!3328))))

(assert (=> b!746863 (= lt!331947 (select (store (arr!19948 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746863 (= lt!331952 (array!41670 (store (arr!19948 a!3186) i!1173 k0!2102) (size!20369 a!3186)))))

(declare-fun b!746864 () Bool)

(assert (=> b!746864 (= e!417048 e!417052)))

(declare-fun res!503580 () Bool)

(assert (=> b!746864 (=> (not res!503580) (not e!417052))))

(declare-fun lt!331953 () SeekEntryResult!7548)

(assert (=> b!746864 (= res!503580 (or (= lt!331953 (MissingZero!7548 i!1173)) (= lt!331953 (MissingVacant!7548 i!1173))))))

(assert (=> b!746864 (= lt!331953 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746854 () Bool)

(assert (=> b!746854 (= e!417051 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19948 a!3186) j!159) a!3186 mask!3328) lt!331950))))

(declare-fun res!503583 () Bool)

(assert (=> start!65496 (=> (not res!503583) (not e!417048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65496 (= res!503583 (validMask!0 mask!3328))))

(assert (=> start!65496 e!417048))

(assert (=> start!65496 true))

(declare-fun array_inv!15744 (array!41669) Bool)

(assert (=> start!65496 (array_inv!15744 a!3186)))

(declare-fun b!746865 () Bool)

(declare-fun res!503576 () Bool)

(assert (=> b!746865 (=> (not res!503576) (not e!417055))))

(assert (=> b!746865 (= res!503576 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19948 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746866 () Bool)

(declare-fun res!503581 () Bool)

(assert (=> b!746866 (=> (not res!503581) (not e!417052))))

(assert (=> b!746866 (= res!503581 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20369 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20369 a!3186))))))

(declare-fun b!746867 () Bool)

(declare-fun res!503582 () Bool)

(assert (=> b!746867 (=> (not res!503582) (not e!417048))))

(assert (=> b!746867 (= res!503582 (validKeyInArray!0 k0!2102))))

(declare-fun b!746868 () Bool)

(declare-fun res!503577 () Bool)

(assert (=> b!746868 (=> (not res!503577) (not e!417048))))

(declare-fun arrayContainsKey!0 (array!41669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746868 (= res!503577 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65496 res!503583) b!746861))

(assert (= (and b!746861 res!503572) b!746858))

(assert (= (and b!746858 res!503574) b!746867))

(assert (= (and b!746867 res!503582) b!746868))

(assert (= (and b!746868 res!503577) b!746864))

(assert (= (and b!746864 res!503580) b!746862))

(assert (= (and b!746862 res!503575) b!746856))

(assert (= (and b!746856 res!503578) b!746866))

(assert (= (and b!746866 res!503581) b!746857))

(assert (= (and b!746857 res!503579) b!746865))

(assert (= (and b!746865 res!503576) b!746853))

(assert (= (and b!746853 c!82021) b!746852))

(assert (= (and b!746853 (not c!82021)) b!746859))

(assert (= (and b!746853 res!503585) b!746863))

(assert (= (and b!746863 res!503584) b!746855))

(assert (= (and b!746855 res!503573) b!746854))

(assert (= (and b!746855 (not res!503570)) b!746851))

(assert (= (and b!746851 (not res!503571)) b!746860))

(declare-fun m!697063 () Bool)

(assert (=> b!746864 m!697063))

(declare-fun m!697065 () Bool)

(assert (=> b!746852 m!697065))

(assert (=> b!746852 m!697065))

(declare-fun m!697067 () Bool)

(assert (=> b!746852 m!697067))

(assert (=> b!746858 m!697065))

(assert (=> b!746858 m!697065))

(declare-fun m!697069 () Bool)

(assert (=> b!746858 m!697069))

(declare-fun m!697071 () Bool)

(assert (=> b!746865 m!697071))

(declare-fun m!697073 () Bool)

(assert (=> b!746851 m!697073))

(declare-fun m!697075 () Bool)

(assert (=> b!746851 m!697075))

(assert (=> b!746851 m!697065))

(assert (=> b!746851 m!697065))

(declare-fun m!697077 () Bool)

(assert (=> b!746851 m!697077))

(declare-fun m!697079 () Bool)

(assert (=> b!746868 m!697079))

(declare-fun m!697081 () Bool)

(assert (=> b!746856 m!697081))

(declare-fun m!697083 () Bool)

(assert (=> b!746867 m!697083))

(declare-fun m!697085 () Bool)

(assert (=> start!65496 m!697085))

(declare-fun m!697087 () Bool)

(assert (=> start!65496 m!697087))

(assert (=> b!746857 m!697065))

(assert (=> b!746857 m!697065))

(declare-fun m!697089 () Bool)

(assert (=> b!746857 m!697089))

(assert (=> b!746857 m!697089))

(assert (=> b!746857 m!697065))

(declare-fun m!697091 () Bool)

(assert (=> b!746857 m!697091))

(declare-fun m!697093 () Bool)

(assert (=> b!746863 m!697093))

(declare-fun m!697095 () Bool)

(assert (=> b!746863 m!697095))

(declare-fun m!697097 () Bool)

(assert (=> b!746863 m!697097))

(declare-fun m!697099 () Bool)

(assert (=> b!746863 m!697099))

(assert (=> b!746863 m!697095))

(assert (=> b!746863 m!697073))

(assert (=> b!746854 m!697065))

(assert (=> b!746854 m!697065))

(declare-fun m!697101 () Bool)

(assert (=> b!746854 m!697101))

(assert (=> b!746855 m!697065))

(assert (=> b!746855 m!697065))

(declare-fun m!697103 () Bool)

(assert (=> b!746855 m!697103))

(declare-fun m!697105 () Bool)

(assert (=> b!746855 m!697105))

(declare-fun m!697107 () Bool)

(assert (=> b!746855 m!697107))

(declare-fun m!697109 () Bool)

(assert (=> b!746862 m!697109))

(assert (=> b!746859 m!697065))

(assert (=> b!746859 m!697065))

(assert (=> b!746859 m!697077))

(check-sat (not b!746858) (not b!746852) (not b!746855) (not b!746868) (not b!746864) (not b!746862) (not b!746857) (not b!746854) (not b!746859) (not b!746856) (not b!746863) (not b!746867) (not start!65496) (not b!746851))
(check-sat)
