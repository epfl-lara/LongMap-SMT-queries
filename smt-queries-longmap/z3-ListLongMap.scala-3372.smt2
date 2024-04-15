; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46332 () Bool)

(assert start!46332)

(declare-fun b!512763 () Bool)

(declare-fun e!299412 () Bool)

(declare-fun e!299415 () Bool)

(assert (=> b!512763 (= e!299412 (not e!299415))))

(declare-fun res!313385 () Bool)

(assert (=> b!512763 (=> res!313385 e!299415)))

(declare-fun lt!234654 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32939 0))(
  ( (array!32940 (arr!15845 (Array (_ BitVec 32) (_ BitVec 64))) (size!16210 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32939)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4309 0))(
  ( (MissingZero!4309 (index!19424 (_ BitVec 32))) (Found!4309 (index!19425 (_ BitVec 32))) (Intermediate!4309 (undefined!5121 Bool) (index!19426 (_ BitVec 32)) (x!48381 (_ BitVec 32))) (Undefined!4309) (MissingVacant!4309 (index!19427 (_ BitVec 32))) )
))
(declare-fun lt!234652 () SeekEntryResult!4309)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32939 (_ BitVec 32)) SeekEntryResult!4309)

(assert (=> b!512763 (= res!313385 (= lt!234652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234654 (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235)) mask!3524)))))

(declare-fun lt!234655 () (_ BitVec 32))

(assert (=> b!512763 (= lt!234652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234655 (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512763 (= lt!234654 (toIndex!0 (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512763 (= lt!234655 (toIndex!0 (select (arr!15845 a!3235) j!176) mask!3524))))

(declare-fun e!299413 () Bool)

(assert (=> b!512763 e!299413))

(declare-fun res!313384 () Bool)

(assert (=> b!512763 (=> (not res!313384) (not e!299413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32939 (_ BitVec 32)) Bool)

(assert (=> b!512763 (= res!313384 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15862 0))(
  ( (Unit!15863) )
))
(declare-fun lt!234651 () Unit!15862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15862)

(assert (=> b!512763 (= lt!234651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512764 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32939 (_ BitVec 32)) SeekEntryResult!4309)

(assert (=> b!512764 (= e!299413 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) (Found!4309 j!176)))))

(declare-fun b!512765 () Bool)

(declare-fun res!313391 () Bool)

(assert (=> b!512765 (=> (not res!313391) (not e!299412))))

(assert (=> b!512765 (= res!313391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512766 () Bool)

(declare-fun res!313390 () Bool)

(declare-fun e!299414 () Bool)

(assert (=> b!512766 (=> (not res!313390) (not e!299414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512766 (= res!313390 (validKeyInArray!0 (select (arr!15845 a!3235) j!176)))))

(declare-fun b!512767 () Bool)

(assert (=> b!512767 (= e!299415 (and (bvsge (index!19426 lt!234652) #b00000000000000000000000000000000) (bvslt (index!19426 lt!234652) (size!16210 a!3235))))))

(assert (=> b!512767 (bvslt (x!48381 lt!234652) #b01111111111111111111111111111110)))

(declare-fun b!512768 () Bool)

(declare-fun res!313392 () Bool)

(assert (=> b!512768 (=> (not res!313392) (not e!299414))))

(assert (=> b!512768 (= res!313392 (validKeyInArray!0 k0!2280))))

(declare-fun b!512769 () Bool)

(declare-fun res!313394 () Bool)

(assert (=> b!512769 (=> res!313394 e!299415)))

(get-info :version)

(assert (=> b!512769 (= res!313394 (or (undefined!5121 lt!234652) (not ((_ is Intermediate!4309) lt!234652))))))

(declare-fun b!512770 () Bool)

(declare-fun res!313386 () Bool)

(assert (=> b!512770 (=> (not res!313386) (not e!299412))))

(declare-datatypes ((List!10042 0))(
  ( (Nil!10039) (Cons!10038 (h!10921 (_ BitVec 64)) (t!16261 List!10042)) )
))
(declare-fun arrayNoDuplicates!0 (array!32939 (_ BitVec 32) List!10042) Bool)

(assert (=> b!512770 (= res!313386 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10039))))

(declare-fun b!512771 () Bool)

(assert (=> b!512771 (= e!299414 e!299412)))

(declare-fun res!313393 () Bool)

(assert (=> b!512771 (=> (not res!313393) (not e!299412))))

(declare-fun lt!234653 () SeekEntryResult!4309)

(assert (=> b!512771 (= res!313393 (or (= lt!234653 (MissingZero!4309 i!1204)) (= lt!234653 (MissingVacant!4309 i!1204))))))

(assert (=> b!512771 (= lt!234653 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!313388 () Bool)

(assert (=> start!46332 (=> (not res!313388) (not e!299414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46332 (= res!313388 (validMask!0 mask!3524))))

(assert (=> start!46332 e!299414))

(assert (=> start!46332 true))

(declare-fun array_inv!11728 (array!32939) Bool)

(assert (=> start!46332 (array_inv!11728 a!3235)))

(declare-fun b!512772 () Bool)

(declare-fun res!313387 () Bool)

(assert (=> b!512772 (=> (not res!313387) (not e!299414))))

(assert (=> b!512772 (= res!313387 (and (= (size!16210 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16210 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16210 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512773 () Bool)

(declare-fun res!313389 () Bool)

(assert (=> b!512773 (=> (not res!313389) (not e!299414))))

(declare-fun arrayContainsKey!0 (array!32939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512773 (= res!313389 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46332 res!313388) b!512772))

(assert (= (and b!512772 res!313387) b!512766))

(assert (= (and b!512766 res!313390) b!512768))

(assert (= (and b!512768 res!313392) b!512773))

(assert (= (and b!512773 res!313389) b!512771))

(assert (= (and b!512771 res!313393) b!512765))

(assert (= (and b!512765 res!313391) b!512770))

(assert (= (and b!512770 res!313386) b!512763))

(assert (= (and b!512763 res!313384) b!512764))

(assert (= (and b!512763 (not res!313385)) b!512769))

(assert (= (and b!512769 (not res!313394)) b!512767))

(declare-fun m!493921 () Bool)

(assert (=> b!512765 m!493921))

(declare-fun m!493923 () Bool)

(assert (=> b!512764 m!493923))

(assert (=> b!512764 m!493923))

(declare-fun m!493925 () Bool)

(assert (=> b!512764 m!493925))

(declare-fun m!493927 () Bool)

(assert (=> b!512773 m!493927))

(declare-fun m!493929 () Bool)

(assert (=> b!512770 m!493929))

(declare-fun m!493931 () Bool)

(assert (=> start!46332 m!493931))

(declare-fun m!493933 () Bool)

(assert (=> start!46332 m!493933))

(declare-fun m!493935 () Bool)

(assert (=> b!512768 m!493935))

(assert (=> b!512766 m!493923))

(assert (=> b!512766 m!493923))

(declare-fun m!493937 () Bool)

(assert (=> b!512766 m!493937))

(declare-fun m!493939 () Bool)

(assert (=> b!512763 m!493939))

(declare-fun m!493941 () Bool)

(assert (=> b!512763 m!493941))

(declare-fun m!493943 () Bool)

(assert (=> b!512763 m!493943))

(assert (=> b!512763 m!493923))

(declare-fun m!493945 () Bool)

(assert (=> b!512763 m!493945))

(assert (=> b!512763 m!493923))

(declare-fun m!493947 () Bool)

(assert (=> b!512763 m!493947))

(assert (=> b!512763 m!493943))

(declare-fun m!493949 () Bool)

(assert (=> b!512763 m!493949))

(assert (=> b!512763 m!493923))

(declare-fun m!493951 () Bool)

(assert (=> b!512763 m!493951))

(assert (=> b!512763 m!493943))

(declare-fun m!493953 () Bool)

(assert (=> b!512763 m!493953))

(declare-fun m!493955 () Bool)

(assert (=> b!512771 m!493955))

(check-sat (not start!46332) (not b!512764) (not b!512766) (not b!512768) (not b!512763) (not b!512773) (not b!512765) (not b!512770) (not b!512771))
(check-sat)
(get-model)

(declare-fun d!78877 () Bool)

(declare-fun res!313465 () Bool)

(declare-fun e!299450 () Bool)

(assert (=> d!78877 (=> res!313465 e!299450)))

(assert (=> d!78877 (= res!313465 (= (select (arr!15845 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78877 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299450)))

(declare-fun b!512844 () Bool)

(declare-fun e!299451 () Bool)

(assert (=> b!512844 (= e!299450 e!299451)))

(declare-fun res!313466 () Bool)

(assert (=> b!512844 (=> (not res!313466) (not e!299451))))

(assert (=> b!512844 (= res!313466 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16210 a!3235)))))

(declare-fun b!512845 () Bool)

(assert (=> b!512845 (= e!299451 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78877 (not res!313465)) b!512844))

(assert (= (and b!512844 res!313466) b!512845))

(declare-fun m!494029 () Bool)

(assert (=> d!78877 m!494029))

(declare-fun m!494031 () Bool)

(assert (=> b!512845 m!494031))

(assert (=> b!512773 d!78877))

(declare-fun d!78879 () Bool)

(assert (=> d!78879 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46332 d!78879))

(declare-fun d!78881 () Bool)

(assert (=> d!78881 (= (array_inv!11728 a!3235) (bvsge (size!16210 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46332 d!78881))

(declare-fun d!78883 () Bool)

(assert (=> d!78883 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512768 d!78883))

(declare-fun b!512897 () Bool)

(declare-fun e!299484 () SeekEntryResult!4309)

(assert (=> b!512897 (= e!299484 (Intermediate!4309 false lt!234654 #b00000000000000000000000000000000))))

(declare-fun b!512898 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512898 (= e!299484 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234654 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235)) mask!3524))))

(declare-fun b!512899 () Bool)

(declare-fun e!299487 () SeekEntryResult!4309)

(assert (=> b!512899 (= e!299487 e!299484)))

(declare-fun lt!234701 () (_ BitVec 64))

(declare-fun c!59987 () Bool)

(assert (=> b!512899 (= c!59987 (or (= lt!234701 (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!234701 lt!234701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!512900 () Bool)

(declare-fun e!299485 () Bool)

(declare-fun e!299488 () Bool)

(assert (=> b!512900 (= e!299485 e!299488)))

(declare-fun res!313490 () Bool)

(declare-fun lt!234700 () SeekEntryResult!4309)

(assert (=> b!512900 (= res!313490 (and ((_ is Intermediate!4309) lt!234700) (not (undefined!5121 lt!234700)) (bvslt (x!48381 lt!234700) #b01111111111111111111111111111110) (bvsge (x!48381 lt!234700) #b00000000000000000000000000000000) (bvsge (x!48381 lt!234700) #b00000000000000000000000000000000)))))

(assert (=> b!512900 (=> (not res!313490) (not e!299488))))

(declare-fun b!512901 () Bool)

(assert (=> b!512901 (and (bvsge (index!19426 lt!234700) #b00000000000000000000000000000000) (bvslt (index!19426 lt!234700) (size!16210 (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235)))))))

(declare-fun res!313491 () Bool)

(assert (=> b!512901 (= res!313491 (= (select (arr!15845 (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235))) (index!19426 lt!234700)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299486 () Bool)

(assert (=> b!512901 (=> res!313491 e!299486)))

(declare-fun b!512902 () Bool)

(assert (=> b!512902 (= e!299487 (Intermediate!4309 true lt!234654 #b00000000000000000000000000000000))))

(declare-fun d!78885 () Bool)

(assert (=> d!78885 e!299485))

(declare-fun c!59986 () Bool)

(assert (=> d!78885 (= c!59986 (and ((_ is Intermediate!4309) lt!234700) (undefined!5121 lt!234700)))))

(assert (=> d!78885 (= lt!234700 e!299487)))

(declare-fun c!59988 () Bool)

(assert (=> d!78885 (= c!59988 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78885 (= lt!234701 (select (arr!15845 (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235))) lt!234654))))

(assert (=> d!78885 (validMask!0 mask!3524)))

(assert (=> d!78885 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234654 (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235)) mask!3524) lt!234700)))

(declare-fun b!512903 () Bool)

(assert (=> b!512903 (and (bvsge (index!19426 lt!234700) #b00000000000000000000000000000000) (bvslt (index!19426 lt!234700) (size!16210 (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235)))))))

(assert (=> b!512903 (= e!299486 (= (select (arr!15845 (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235))) (index!19426 lt!234700)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512904 () Bool)

(assert (=> b!512904 (and (bvsge (index!19426 lt!234700) #b00000000000000000000000000000000) (bvslt (index!19426 lt!234700) (size!16210 (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235)))))))

(declare-fun res!313489 () Bool)

(assert (=> b!512904 (= res!313489 (= (select (arr!15845 (array!32940 (store (arr!15845 a!3235) i!1204 k0!2280) (size!16210 a!3235))) (index!19426 lt!234700)) (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!512904 (=> res!313489 e!299486)))

(assert (=> b!512904 (= e!299488 e!299486)))

(declare-fun b!512905 () Bool)

(assert (=> b!512905 (= e!299485 (bvsge (x!48381 lt!234700) #b01111111111111111111111111111110))))

(assert (= (and d!78885 c!59988) b!512902))

(assert (= (and d!78885 (not c!59988)) b!512899))

(assert (= (and b!512899 c!59987) b!512897))

(assert (= (and b!512899 (not c!59987)) b!512898))

(assert (= (and d!78885 c!59986) b!512905))

(assert (= (and d!78885 (not c!59986)) b!512900))

(assert (= (and b!512900 res!313490) b!512904))

(assert (= (and b!512904 (not res!313489)) b!512901))

(assert (= (and b!512901 (not res!313491)) b!512903))

(declare-fun m!494041 () Bool)

(assert (=> b!512898 m!494041))

(assert (=> b!512898 m!494041))

(assert (=> b!512898 m!493943))

(declare-fun m!494043 () Bool)

(assert (=> b!512898 m!494043))

(declare-fun m!494045 () Bool)

(assert (=> b!512903 m!494045))

(assert (=> b!512901 m!494045))

(assert (=> b!512904 m!494045))

(declare-fun m!494047 () Bool)

(assert (=> d!78885 m!494047))

(assert (=> d!78885 m!493931))

(assert (=> b!512763 d!78885))

(declare-fun d!78897 () Bool)

(declare-fun lt!234709 () (_ BitVec 32))

(declare-fun lt!234708 () (_ BitVec 32))

(assert (=> d!78897 (= lt!234709 (bvmul (bvxor lt!234708 (bvlshr lt!234708 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78897 (= lt!234708 ((_ extract 31 0) (bvand (bvxor (select (arr!15845 a!3235) j!176) (bvlshr (select (arr!15845 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78897 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313495 (let ((h!10925 ((_ extract 31 0) (bvand (bvxor (select (arr!15845 a!3235) j!176) (bvlshr (select (arr!15845 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48387 (bvmul (bvxor h!10925 (bvlshr h!10925 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48387 (bvlshr x!48387 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313495 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313495 #b00000000000000000000000000000000))))))

(assert (=> d!78897 (= (toIndex!0 (select (arr!15845 a!3235) j!176) mask!3524) (bvand (bvxor lt!234709 (bvlshr lt!234709 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512763 d!78897))

(declare-fun b!512915 () Bool)

(declare-fun e!299494 () SeekEntryResult!4309)

(assert (=> b!512915 (= e!299494 (Intermediate!4309 false lt!234655 #b00000000000000000000000000000000))))

(declare-fun b!512916 () Bool)

(assert (=> b!512916 (= e!299494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234655 #b00000000000000000000000000000000 mask!3524) (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512917 () Bool)

(declare-fun e!299497 () SeekEntryResult!4309)

(assert (=> b!512917 (= e!299497 e!299494)))

(declare-fun c!59993 () Bool)

(declare-fun lt!234711 () (_ BitVec 64))

(assert (=> b!512917 (= c!59993 (or (= lt!234711 (select (arr!15845 a!3235) j!176)) (= (bvadd lt!234711 lt!234711) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!512918 () Bool)

(declare-fun e!299495 () Bool)

(declare-fun e!299498 () Bool)

(assert (=> b!512918 (= e!299495 e!299498)))

(declare-fun res!313497 () Bool)

(declare-fun lt!234710 () SeekEntryResult!4309)

(assert (=> b!512918 (= res!313497 (and ((_ is Intermediate!4309) lt!234710) (not (undefined!5121 lt!234710)) (bvslt (x!48381 lt!234710) #b01111111111111111111111111111110) (bvsge (x!48381 lt!234710) #b00000000000000000000000000000000) (bvsge (x!48381 lt!234710) #b00000000000000000000000000000000)))))

(assert (=> b!512918 (=> (not res!313497) (not e!299498))))

(declare-fun b!512919 () Bool)

(assert (=> b!512919 (and (bvsge (index!19426 lt!234710) #b00000000000000000000000000000000) (bvslt (index!19426 lt!234710) (size!16210 a!3235)))))

(declare-fun res!313498 () Bool)

(assert (=> b!512919 (= res!313498 (= (select (arr!15845 a!3235) (index!19426 lt!234710)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299496 () Bool)

(assert (=> b!512919 (=> res!313498 e!299496)))

(declare-fun b!512920 () Bool)

(assert (=> b!512920 (= e!299497 (Intermediate!4309 true lt!234655 #b00000000000000000000000000000000))))

(declare-fun d!78901 () Bool)

(assert (=> d!78901 e!299495))

(declare-fun c!59992 () Bool)

(assert (=> d!78901 (= c!59992 (and ((_ is Intermediate!4309) lt!234710) (undefined!5121 lt!234710)))))

(assert (=> d!78901 (= lt!234710 e!299497)))

(declare-fun c!59994 () Bool)

(assert (=> d!78901 (= c!59994 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78901 (= lt!234711 (select (arr!15845 a!3235) lt!234655))))

(assert (=> d!78901 (validMask!0 mask!3524)))

(assert (=> d!78901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234655 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) lt!234710)))

(declare-fun b!512921 () Bool)

(assert (=> b!512921 (and (bvsge (index!19426 lt!234710) #b00000000000000000000000000000000) (bvslt (index!19426 lt!234710) (size!16210 a!3235)))))

(assert (=> b!512921 (= e!299496 (= (select (arr!15845 a!3235) (index!19426 lt!234710)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512922 () Bool)

(assert (=> b!512922 (and (bvsge (index!19426 lt!234710) #b00000000000000000000000000000000) (bvslt (index!19426 lt!234710) (size!16210 a!3235)))))

(declare-fun res!313496 () Bool)

(assert (=> b!512922 (= res!313496 (= (select (arr!15845 a!3235) (index!19426 lt!234710)) (select (arr!15845 a!3235) j!176)))))

(assert (=> b!512922 (=> res!313496 e!299496)))

(assert (=> b!512922 (= e!299498 e!299496)))

(declare-fun b!512923 () Bool)

(assert (=> b!512923 (= e!299495 (bvsge (x!48381 lt!234710) #b01111111111111111111111111111110))))

(assert (= (and d!78901 c!59994) b!512920))

(assert (= (and d!78901 (not c!59994)) b!512917))

(assert (= (and b!512917 c!59993) b!512915))

(assert (= (and b!512917 (not c!59993)) b!512916))

(assert (= (and d!78901 c!59992) b!512923))

(assert (= (and d!78901 (not c!59992)) b!512918))

(assert (= (and b!512918 res!313497) b!512922))

(assert (= (and b!512922 (not res!313496)) b!512919))

(assert (= (and b!512919 (not res!313498)) b!512921))

(declare-fun m!494057 () Bool)

(assert (=> b!512916 m!494057))

(assert (=> b!512916 m!494057))

(assert (=> b!512916 m!493923))

(declare-fun m!494059 () Bool)

(assert (=> b!512916 m!494059))

(declare-fun m!494061 () Bool)

(assert (=> b!512921 m!494061))

(assert (=> b!512919 m!494061))

(assert (=> b!512922 m!494061))

(declare-fun m!494063 () Bool)

(assert (=> d!78901 m!494063))

(assert (=> d!78901 m!493931))

(assert (=> b!512763 d!78901))

(declare-fun d!78903 () Bool)

(declare-fun res!313509 () Bool)

(declare-fun e!299516 () Bool)

(assert (=> d!78903 (=> res!313509 e!299516)))

(assert (=> d!78903 (= res!313509 (bvsge j!176 (size!16210 a!3235)))))

(assert (=> d!78903 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299516)))

(declare-fun call!31519 () Bool)

(declare-fun bm!31516 () Bool)

(assert (=> bm!31516 (= call!31519 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512948 () Bool)

(declare-fun e!299517 () Bool)

(assert (=> b!512948 (= e!299516 e!299517)))

(declare-fun c!60002 () Bool)

(assert (=> b!512948 (= c!60002 (validKeyInArray!0 (select (arr!15845 a!3235) j!176)))))

(declare-fun b!512949 () Bool)

(declare-fun e!299518 () Bool)

(assert (=> b!512949 (= e!299518 call!31519)))

(declare-fun b!512950 () Bool)

(assert (=> b!512950 (= e!299517 e!299518)))

(declare-fun lt!234739 () (_ BitVec 64))

(assert (=> b!512950 (= lt!234739 (select (arr!15845 a!3235) j!176))))

(declare-fun lt!234738 () Unit!15862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32939 (_ BitVec 64) (_ BitVec 32)) Unit!15862)

(assert (=> b!512950 (= lt!234738 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234739 j!176))))

(assert (=> b!512950 (arrayContainsKey!0 a!3235 lt!234739 #b00000000000000000000000000000000)))

(declare-fun lt!234740 () Unit!15862)

(assert (=> b!512950 (= lt!234740 lt!234738)))

(declare-fun res!313510 () Bool)

(assert (=> b!512950 (= res!313510 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) (Found!4309 j!176)))))

(assert (=> b!512950 (=> (not res!313510) (not e!299518))))

(declare-fun b!512951 () Bool)

(assert (=> b!512951 (= e!299517 call!31519)))

(assert (= (and d!78903 (not res!313509)) b!512948))

(assert (= (and b!512948 c!60002) b!512950))

(assert (= (and b!512948 (not c!60002)) b!512951))

(assert (= (and b!512950 res!313510) b!512949))

(assert (= (or b!512949 b!512951) bm!31516))

(declare-fun m!494073 () Bool)

(assert (=> bm!31516 m!494073))

(assert (=> b!512948 m!493923))

(assert (=> b!512948 m!493923))

(assert (=> b!512948 m!493937))

(assert (=> b!512950 m!493923))

(declare-fun m!494075 () Bool)

(assert (=> b!512950 m!494075))

(declare-fun m!494077 () Bool)

(assert (=> b!512950 m!494077))

(assert (=> b!512950 m!493923))

(assert (=> b!512950 m!493925))

(assert (=> b!512763 d!78903))

(declare-fun d!78911 () Bool)

(assert (=> d!78911 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234748 () Unit!15862)

(declare-fun choose!38 (array!32939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15862)

(assert (=> d!78911 (= lt!234748 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78911 (validMask!0 mask!3524)))

(assert (=> d!78911 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234748)))

(declare-fun bs!16217 () Bool)

(assert (= bs!16217 d!78911))

(assert (=> bs!16217 m!493947))

(declare-fun m!494101 () Bool)

(assert (=> bs!16217 m!494101))

(assert (=> bs!16217 m!493931))

(assert (=> b!512763 d!78911))

(declare-fun d!78917 () Bool)

(declare-fun lt!234750 () (_ BitVec 32))

(declare-fun lt!234749 () (_ BitVec 32))

(assert (=> d!78917 (= lt!234750 (bvmul (bvxor lt!234749 (bvlshr lt!234749 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78917 (= lt!234749 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78917 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313495 (let ((h!10925 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48387 (bvmul (bvxor h!10925 (bvlshr h!10925 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48387 (bvlshr x!48387 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313495 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313495 #b00000000000000000000000000000000))))))

(assert (=> d!78917 (= (toIndex!0 (select (store (arr!15845 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!234750 (bvlshr lt!234750 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512763 d!78917))

(declare-fun b!513029 () Bool)

(declare-fun e!299566 () SeekEntryResult!4309)

(declare-fun lt!234778 () SeekEntryResult!4309)

(assert (=> b!513029 (= e!299566 (MissingZero!4309 (index!19426 lt!234778)))))

(declare-fun b!513030 () Bool)

(declare-fun e!299565 () SeekEntryResult!4309)

(assert (=> b!513030 (= e!299565 Undefined!4309)))

(declare-fun d!78921 () Bool)

(declare-fun lt!234780 () SeekEntryResult!4309)

(assert (=> d!78921 (and (or ((_ is Undefined!4309) lt!234780) (not ((_ is Found!4309) lt!234780)) (and (bvsge (index!19425 lt!234780) #b00000000000000000000000000000000) (bvslt (index!19425 lt!234780) (size!16210 a!3235)))) (or ((_ is Undefined!4309) lt!234780) ((_ is Found!4309) lt!234780) (not ((_ is MissingZero!4309) lt!234780)) (and (bvsge (index!19424 lt!234780) #b00000000000000000000000000000000) (bvslt (index!19424 lt!234780) (size!16210 a!3235)))) (or ((_ is Undefined!4309) lt!234780) ((_ is Found!4309) lt!234780) ((_ is MissingZero!4309) lt!234780) (not ((_ is MissingVacant!4309) lt!234780)) (and (bvsge (index!19427 lt!234780) #b00000000000000000000000000000000) (bvslt (index!19427 lt!234780) (size!16210 a!3235)))) (or ((_ is Undefined!4309) lt!234780) (ite ((_ is Found!4309) lt!234780) (= (select (arr!15845 a!3235) (index!19425 lt!234780)) (select (arr!15845 a!3235) j!176)) (ite ((_ is MissingZero!4309) lt!234780) (= (select (arr!15845 a!3235) (index!19424 lt!234780)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4309) lt!234780) (= (select (arr!15845 a!3235) (index!19427 lt!234780)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78921 (= lt!234780 e!299565)))

(declare-fun c!60035 () Bool)

(assert (=> d!78921 (= c!60035 (and ((_ is Intermediate!4309) lt!234778) (undefined!5121 lt!234778)))))

(assert (=> d!78921 (= lt!234778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15845 a!3235) j!176) mask!3524) (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78921 (validMask!0 mask!3524)))

(assert (=> d!78921 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) lt!234780)))

(declare-fun b!513031 () Bool)

(declare-fun e!299564 () SeekEntryResult!4309)

(assert (=> b!513031 (= e!299565 e!299564)))

(declare-fun lt!234779 () (_ BitVec 64))

(assert (=> b!513031 (= lt!234779 (select (arr!15845 a!3235) (index!19426 lt!234778)))))

(declare-fun c!60036 () Bool)

(assert (=> b!513031 (= c!60036 (= lt!234779 (select (arr!15845 a!3235) j!176)))))

(declare-fun b!513032 () Bool)

(assert (=> b!513032 (= e!299564 (Found!4309 (index!19426 lt!234778)))))

(declare-fun b!513033 () Bool)

(declare-fun c!60034 () Bool)

(assert (=> b!513033 (= c!60034 (= lt!234779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513033 (= e!299564 e!299566)))

(declare-fun b!513034 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32939 (_ BitVec 32)) SeekEntryResult!4309)

(assert (=> b!513034 (= e!299566 (seekKeyOrZeroReturnVacant!0 (x!48381 lt!234778) (index!19426 lt!234778) (index!19426 lt!234778) (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!78921 c!60035) b!513030))

(assert (= (and d!78921 (not c!60035)) b!513031))

(assert (= (and b!513031 c!60036) b!513032))

(assert (= (and b!513031 (not c!60036)) b!513033))

(assert (= (and b!513033 c!60034) b!513029))

(assert (= (and b!513033 (not c!60034)) b!513034))

(assert (=> d!78921 m!493945))

(assert (=> d!78921 m!493923))

(declare-fun m!494147 () Bool)

(assert (=> d!78921 m!494147))

(declare-fun m!494149 () Bool)

(assert (=> d!78921 m!494149))

(declare-fun m!494151 () Bool)

(assert (=> d!78921 m!494151))

(assert (=> d!78921 m!493931))

(declare-fun m!494153 () Bool)

(assert (=> d!78921 m!494153))

(assert (=> d!78921 m!493923))

(assert (=> d!78921 m!493945))

(declare-fun m!494155 () Bool)

(assert (=> b!513031 m!494155))

(assert (=> b!513034 m!493923))

(declare-fun m!494157 () Bool)

(assert (=> b!513034 m!494157))

(assert (=> b!512764 d!78921))

(declare-fun b!513068 () Bool)

(declare-fun e!299596 () Bool)

(declare-fun e!299593 () Bool)

(assert (=> b!513068 (= e!299596 e!299593)))

(declare-fun res!313547 () Bool)

(assert (=> b!513068 (=> (not res!313547) (not e!299593))))

(declare-fun e!299594 () Bool)

(assert (=> b!513068 (= res!313547 (not e!299594))))

(declare-fun res!313548 () Bool)

(assert (=> b!513068 (=> (not res!313548) (not e!299594))))

(assert (=> b!513068 (= res!313548 (validKeyInArray!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513069 () Bool)

(declare-fun contains!2714 (List!10042 (_ BitVec 64)) Bool)

(assert (=> b!513069 (= e!299594 (contains!2714 Nil!10039 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78943 () Bool)

(declare-fun res!313546 () Bool)

(assert (=> d!78943 (=> res!313546 e!299596)))

(assert (=> d!78943 (= res!313546 (bvsge #b00000000000000000000000000000000 (size!16210 a!3235)))))

(assert (=> d!78943 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10039) e!299596)))

(declare-fun b!513070 () Bool)

(declare-fun e!299595 () Bool)

(assert (=> b!513070 (= e!299593 e!299595)))

(declare-fun c!60044 () Bool)

(assert (=> b!513070 (= c!60044 (validKeyInArray!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513071 () Bool)

(declare-fun call!31527 () Bool)

(assert (=> b!513071 (= e!299595 call!31527)))

(declare-fun bm!31524 () Bool)

(assert (=> bm!31524 (= call!31527 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60044 (Cons!10038 (select (arr!15845 a!3235) #b00000000000000000000000000000000) Nil!10039) Nil!10039)))))

(declare-fun b!513072 () Bool)

(assert (=> b!513072 (= e!299595 call!31527)))

(assert (= (and d!78943 (not res!313546)) b!513068))

(assert (= (and b!513068 res!313548) b!513069))

(assert (= (and b!513068 res!313547) b!513070))

(assert (= (and b!513070 c!60044) b!513071))

(assert (= (and b!513070 (not c!60044)) b!513072))

(assert (= (or b!513071 b!513072) bm!31524))

(assert (=> b!513068 m!494029))

(assert (=> b!513068 m!494029))

(declare-fun m!494165 () Bool)

(assert (=> b!513068 m!494165))

(assert (=> b!513069 m!494029))

(assert (=> b!513069 m!494029))

(declare-fun m!494167 () Bool)

(assert (=> b!513069 m!494167))

(assert (=> b!513070 m!494029))

(assert (=> b!513070 m!494029))

(assert (=> b!513070 m!494165))

(assert (=> bm!31524 m!494029))

(declare-fun m!494169 () Bool)

(assert (=> bm!31524 m!494169))

(assert (=> b!512770 d!78943))

(declare-fun d!78947 () Bool)

(declare-fun res!313549 () Bool)

(declare-fun e!299597 () Bool)

(assert (=> d!78947 (=> res!313549 e!299597)))

(assert (=> d!78947 (= res!313549 (bvsge #b00000000000000000000000000000000 (size!16210 a!3235)))))

(assert (=> d!78947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299597)))

(declare-fun bm!31525 () Bool)

(declare-fun call!31528 () Bool)

(assert (=> bm!31525 (= call!31528 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513073 () Bool)

(declare-fun e!299598 () Bool)

(assert (=> b!513073 (= e!299597 e!299598)))

(declare-fun c!60045 () Bool)

(assert (=> b!513073 (= c!60045 (validKeyInArray!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513074 () Bool)

(declare-fun e!299599 () Bool)

(assert (=> b!513074 (= e!299599 call!31528)))

(declare-fun b!513075 () Bool)

(assert (=> b!513075 (= e!299598 e!299599)))

(declare-fun lt!234788 () (_ BitVec 64))

(assert (=> b!513075 (= lt!234788 (select (arr!15845 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234787 () Unit!15862)

(assert (=> b!513075 (= lt!234787 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234788 #b00000000000000000000000000000000))))

(assert (=> b!513075 (arrayContainsKey!0 a!3235 lt!234788 #b00000000000000000000000000000000)))

(declare-fun lt!234789 () Unit!15862)

(assert (=> b!513075 (= lt!234789 lt!234787)))

(declare-fun res!313550 () Bool)

(assert (=> b!513075 (= res!313550 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4309 #b00000000000000000000000000000000)))))

(assert (=> b!513075 (=> (not res!313550) (not e!299599))))

(declare-fun b!513076 () Bool)

(assert (=> b!513076 (= e!299598 call!31528)))

(assert (= (and d!78947 (not res!313549)) b!513073))

(assert (= (and b!513073 c!60045) b!513075))

(assert (= (and b!513073 (not c!60045)) b!513076))

(assert (= (and b!513075 res!313550) b!513074))

(assert (= (or b!513074 b!513076) bm!31525))

(declare-fun m!494171 () Bool)

(assert (=> bm!31525 m!494171))

(assert (=> b!513073 m!494029))

(assert (=> b!513073 m!494029))

(assert (=> b!513073 m!494165))

(assert (=> b!513075 m!494029))

(declare-fun m!494173 () Bool)

(assert (=> b!513075 m!494173))

(declare-fun m!494175 () Bool)

(assert (=> b!513075 m!494175))

(assert (=> b!513075 m!494029))

(declare-fun m!494177 () Bool)

(assert (=> b!513075 m!494177))

(assert (=> b!512765 d!78947))

(declare-fun b!513077 () Bool)

(declare-fun e!299602 () SeekEntryResult!4309)

(declare-fun lt!234790 () SeekEntryResult!4309)

(assert (=> b!513077 (= e!299602 (MissingZero!4309 (index!19426 lt!234790)))))

(declare-fun b!513078 () Bool)

(declare-fun e!299601 () SeekEntryResult!4309)

(assert (=> b!513078 (= e!299601 Undefined!4309)))

(declare-fun d!78949 () Bool)

(declare-fun lt!234792 () SeekEntryResult!4309)

(assert (=> d!78949 (and (or ((_ is Undefined!4309) lt!234792) (not ((_ is Found!4309) lt!234792)) (and (bvsge (index!19425 lt!234792) #b00000000000000000000000000000000) (bvslt (index!19425 lt!234792) (size!16210 a!3235)))) (or ((_ is Undefined!4309) lt!234792) ((_ is Found!4309) lt!234792) (not ((_ is MissingZero!4309) lt!234792)) (and (bvsge (index!19424 lt!234792) #b00000000000000000000000000000000) (bvslt (index!19424 lt!234792) (size!16210 a!3235)))) (or ((_ is Undefined!4309) lt!234792) ((_ is Found!4309) lt!234792) ((_ is MissingZero!4309) lt!234792) (not ((_ is MissingVacant!4309) lt!234792)) (and (bvsge (index!19427 lt!234792) #b00000000000000000000000000000000) (bvslt (index!19427 lt!234792) (size!16210 a!3235)))) (or ((_ is Undefined!4309) lt!234792) (ite ((_ is Found!4309) lt!234792) (= (select (arr!15845 a!3235) (index!19425 lt!234792)) k0!2280) (ite ((_ is MissingZero!4309) lt!234792) (= (select (arr!15845 a!3235) (index!19424 lt!234792)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4309) lt!234792) (= (select (arr!15845 a!3235) (index!19427 lt!234792)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78949 (= lt!234792 e!299601)))

(declare-fun c!60047 () Bool)

(assert (=> d!78949 (= c!60047 (and ((_ is Intermediate!4309) lt!234790) (undefined!5121 lt!234790)))))

(assert (=> d!78949 (= lt!234790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78949 (validMask!0 mask!3524)))

(assert (=> d!78949 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!234792)))

(declare-fun b!513079 () Bool)

(declare-fun e!299600 () SeekEntryResult!4309)

(assert (=> b!513079 (= e!299601 e!299600)))

(declare-fun lt!234791 () (_ BitVec 64))

(assert (=> b!513079 (= lt!234791 (select (arr!15845 a!3235) (index!19426 lt!234790)))))

(declare-fun c!60048 () Bool)

(assert (=> b!513079 (= c!60048 (= lt!234791 k0!2280))))

(declare-fun b!513080 () Bool)

(assert (=> b!513080 (= e!299600 (Found!4309 (index!19426 lt!234790)))))

(declare-fun b!513081 () Bool)

(declare-fun c!60046 () Bool)

(assert (=> b!513081 (= c!60046 (= lt!234791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513081 (= e!299600 e!299602)))

(declare-fun b!513082 () Bool)

(assert (=> b!513082 (= e!299602 (seekKeyOrZeroReturnVacant!0 (x!48381 lt!234790) (index!19426 lt!234790) (index!19426 lt!234790) k0!2280 a!3235 mask!3524))))

(assert (= (and d!78949 c!60047) b!513078))

(assert (= (and d!78949 (not c!60047)) b!513079))

(assert (= (and b!513079 c!60048) b!513080))

(assert (= (and b!513079 (not c!60048)) b!513081))

(assert (= (and b!513081 c!60046) b!513077))

(assert (= (and b!513081 (not c!60046)) b!513082))

(declare-fun m!494179 () Bool)

(assert (=> d!78949 m!494179))

(declare-fun m!494183 () Bool)

(assert (=> d!78949 m!494183))

(declare-fun m!494185 () Bool)

(assert (=> d!78949 m!494185))

(declare-fun m!494189 () Bool)

(assert (=> d!78949 m!494189))

(assert (=> d!78949 m!493931))

(declare-fun m!494193 () Bool)

(assert (=> d!78949 m!494193))

(assert (=> d!78949 m!494179))

(declare-fun m!494195 () Bool)

(assert (=> b!513079 m!494195))

(declare-fun m!494197 () Bool)

(assert (=> b!513082 m!494197))

(assert (=> b!512771 d!78949))

(declare-fun d!78953 () Bool)

(assert (=> d!78953 (= (validKeyInArray!0 (select (arr!15845 a!3235) j!176)) (and (not (= (select (arr!15845 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15845 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512766 d!78953))

(check-sat (not d!78911) (not b!513073) (not bm!31525) (not b!512916) (not b!512950) (not b!512948) (not d!78885) (not b!513034) (not bm!31516) (not bm!31524) (not d!78949) (not b!513075) (not b!513070) (not b!513069) (not b!513082) (not b!512845) (not b!513068) (not d!78921) (not b!512898) (not d!78901))
(check-sat)
