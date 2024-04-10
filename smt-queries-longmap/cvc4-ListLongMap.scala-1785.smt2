; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32414 () Bool)

(assert start!32414)

(declare-fun b!323540 () Bool)

(declare-fun res!177040 () Bool)

(declare-fun e!199974 () Bool)

(assert (=> b!323540 (=> (not res!177040) (not e!199974))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323540 (= res!177040 (validKeyInArray!0 k!2497))))

(declare-fun b!323541 () Bool)

(declare-fun res!177046 () Bool)

(declare-fun e!199971 () Bool)

(assert (=> b!323541 (=> (not res!177046) (not e!199971))))

(declare-datatypes ((array!16553 0))(
  ( (array!16554 (arr!7834 (Array (_ BitVec 32) (_ BitVec 64))) (size!8186 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16553)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323541 (= res!177046 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7834 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323542 () Bool)

(assert (=> b!323542 (= e!199974 e!199971)))

(declare-fun res!177047 () Bool)

(assert (=> b!323542 (=> (not res!177047) (not e!199971))))

(declare-datatypes ((SeekEntryResult!2965 0))(
  ( (MissingZero!2965 (index!14036 (_ BitVec 32))) (Found!2965 (index!14037 (_ BitVec 32))) (Intermediate!2965 (undefined!3777 Bool) (index!14038 (_ BitVec 32)) (x!32289 (_ BitVec 32))) (Undefined!2965) (MissingVacant!2965 (index!14039 (_ BitVec 32))) )
))
(declare-fun lt!156655 () SeekEntryResult!2965)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16553 (_ BitVec 32)) SeekEntryResult!2965)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323542 (= res!177047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156655))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323542 (= lt!156655 (Intermediate!2965 false resIndex!58 resX!58))))

(declare-fun b!323543 () Bool)

(declare-fun res!177039 () Bool)

(assert (=> b!323543 (=> (not res!177039) (not e!199971))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323543 (= res!177039 (and (= (select (arr!7834 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8186 a!3305))))))

(declare-fun b!323544 () Bool)

(assert (=> b!323544 (= e!199971 (not true))))

(assert (=> b!323544 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!10018 0))(
  ( (Unit!10019) )
))
(declare-fun lt!156656 () Unit!10018)

(declare-fun e!199970 () Unit!10018)

(assert (=> b!323544 (= lt!156656 e!199970)))

(declare-fun c!50878 () Bool)

(assert (=> b!323544 (= c!50878 (not (= resIndex!58 index!1840)))))

(declare-fun b!323545 () Bool)

(declare-fun e!199973 () Unit!10018)

(declare-fun Unit!10020 () Unit!10018)

(assert (=> b!323545 (= e!199973 Unit!10020)))

(assert (=> b!323545 false))

(declare-fun b!323546 () Bool)

(declare-fun e!199975 () Unit!10018)

(assert (=> b!323546 (= e!199970 e!199975)))

(declare-fun c!50879 () Bool)

(assert (=> b!323546 (= c!50879 (or (= (select (arr!7834 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7834 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323547 () Bool)

(declare-fun res!177048 () Bool)

(assert (=> b!323547 (=> (not res!177048) (not e!199971))))

(assert (=> b!323547 (= res!177048 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156655))))

(declare-fun b!323548 () Bool)

(declare-fun res!177045 () Bool)

(assert (=> b!323548 (=> (not res!177045) (not e!199974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16553 (_ BitVec 32)) Bool)

(assert (=> b!323548 (= res!177045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323549 () Bool)

(declare-fun res!177044 () Bool)

(assert (=> b!323549 (=> (not res!177044) (not e!199974))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16553 (_ BitVec 32)) SeekEntryResult!2965)

(assert (=> b!323549 (= res!177044 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2965 i!1250)))))

(declare-fun res!177043 () Bool)

(assert (=> start!32414 (=> (not res!177043) (not e!199974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32414 (= res!177043 (validMask!0 mask!3777))))

(assert (=> start!32414 e!199974))

(declare-fun array_inv!5797 (array!16553) Bool)

(assert (=> start!32414 (array_inv!5797 a!3305)))

(assert (=> start!32414 true))

(declare-fun b!323550 () Bool)

(declare-fun Unit!10021 () Unit!10018)

(assert (=> b!323550 (= e!199973 Unit!10021)))

(declare-fun b!323551 () Bool)

(assert (=> b!323551 false))

(declare-fun lt!156657 () Unit!10018)

(assert (=> b!323551 (= lt!156657 e!199973)))

(declare-fun c!50880 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323551 (= c!50880 (is-Intermediate!2965 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10022 () Unit!10018)

(assert (=> b!323551 (= e!199975 Unit!10022)))

(declare-fun b!323552 () Bool)

(declare-fun Unit!10023 () Unit!10018)

(assert (=> b!323552 (= e!199970 Unit!10023)))

(declare-fun b!323553 () Bool)

(declare-fun res!177041 () Bool)

(assert (=> b!323553 (=> (not res!177041) (not e!199974))))

(assert (=> b!323553 (= res!177041 (and (= (size!8186 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8186 a!3305))))))

(declare-fun b!323554 () Bool)

(assert (=> b!323554 false))

(declare-fun Unit!10024 () Unit!10018)

(assert (=> b!323554 (= e!199975 Unit!10024)))

(declare-fun b!323555 () Bool)

(declare-fun res!177042 () Bool)

(assert (=> b!323555 (=> (not res!177042) (not e!199974))))

(declare-fun arrayContainsKey!0 (array!16553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323555 (= res!177042 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32414 res!177043) b!323553))

(assert (= (and b!323553 res!177041) b!323540))

(assert (= (and b!323540 res!177040) b!323555))

(assert (= (and b!323555 res!177042) b!323549))

(assert (= (and b!323549 res!177044) b!323548))

(assert (= (and b!323548 res!177045) b!323542))

(assert (= (and b!323542 res!177047) b!323543))

(assert (= (and b!323543 res!177039) b!323547))

(assert (= (and b!323547 res!177048) b!323541))

(assert (= (and b!323541 res!177046) b!323544))

(assert (= (and b!323544 c!50878) b!323546))

(assert (= (and b!323544 (not c!50878)) b!323552))

(assert (= (and b!323546 c!50879) b!323554))

(assert (= (and b!323546 (not c!50879)) b!323551))

(assert (= (and b!323551 c!50880) b!323550))

(assert (= (and b!323551 (not c!50880)) b!323545))

(declare-fun m!330873 () Bool)

(assert (=> b!323542 m!330873))

(assert (=> b!323542 m!330873))

(declare-fun m!330875 () Bool)

(assert (=> b!323542 m!330875))

(declare-fun m!330877 () Bool)

(assert (=> b!323549 m!330877))

(declare-fun m!330879 () Bool)

(assert (=> start!32414 m!330879))

(declare-fun m!330881 () Bool)

(assert (=> start!32414 m!330881))

(declare-fun m!330883 () Bool)

(assert (=> b!323541 m!330883))

(declare-fun m!330885 () Bool)

(assert (=> b!323548 m!330885))

(declare-fun m!330887 () Bool)

(assert (=> b!323551 m!330887))

(assert (=> b!323551 m!330887))

(declare-fun m!330889 () Bool)

(assert (=> b!323551 m!330889))

(declare-fun m!330891 () Bool)

(assert (=> b!323555 m!330891))

(assert (=> b!323546 m!330883))

(declare-fun m!330893 () Bool)

(assert (=> b!323540 m!330893))

(declare-fun m!330895 () Bool)

(assert (=> b!323547 m!330895))

(declare-fun m!330897 () Bool)

(assert (=> b!323543 m!330897))

(push 1)

(assert (not b!323547))

(assert (not b!323551))

(assert (not b!323540))

