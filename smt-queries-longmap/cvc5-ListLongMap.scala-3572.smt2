; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49110 () Bool)

(assert start!49110)

(declare-fun b!540986 () Bool)

(declare-fun res!335878 () Bool)

(declare-fun e!313327 () Bool)

(assert (=> b!540986 (=> (not res!335878) (not e!313327))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((array!34220 0))(
  ( (array!34221 (arr!16446 (Array (_ BitVec 32) (_ BitVec 64))) (size!16810 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34220)

(assert (=> b!540986 (= res!335878 (and (= (size!16810 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16810 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16810 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540987 () Bool)

(declare-fun res!335873 () Bool)

(declare-fun e!313329 () Bool)

(assert (=> b!540987 (=> (not res!335873) (not e!313329))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540987 (= res!335873 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16810 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16810 a!3154)) (= (select (arr!16446 a!3154) resIndex!32) (select (arr!16446 a!3154) j!147))))))

(declare-fun b!540988 () Bool)

(assert (=> b!540988 (= e!313329 false)))

(declare-datatypes ((SeekEntryResult!4904 0))(
  ( (MissingZero!4904 (index!21840 (_ BitVec 32))) (Found!4904 (index!21841 (_ BitVec 32))) (Intermediate!4904 (undefined!5716 Bool) (index!21842 (_ BitVec 32)) (x!50755 (_ BitVec 32))) (Undefined!4904) (MissingVacant!4904 (index!21843 (_ BitVec 32))) )
))
(declare-fun lt!247531 () SeekEntryResult!4904)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34220 (_ BitVec 32)) SeekEntryResult!4904)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540988 (= lt!247531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16446 a!3154) j!147) mask!3216) (select (arr!16446 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540989 () Bool)

(declare-fun res!335875 () Bool)

(assert (=> b!540989 (=> (not res!335875) (not e!313327))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540989 (= res!335875 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540990 () Bool)

(declare-fun res!335877 () Bool)

(assert (=> b!540990 (=> (not res!335877) (not e!313329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34220 (_ BitVec 32)) Bool)

(assert (=> b!540990 (= res!335877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540991 () Bool)

(declare-fun res!335881 () Bool)

(assert (=> b!540991 (=> (not res!335881) (not e!313327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540991 (= res!335881 (validKeyInArray!0 (select (arr!16446 a!3154) j!147)))))

(declare-fun b!540992 () Bool)

(declare-fun res!335882 () Bool)

(assert (=> b!540992 (=> (not res!335882) (not e!313329))))

(assert (=> b!540992 (= res!335882 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16446 a!3154) j!147) a!3154 mask!3216) (Intermediate!4904 false resIndex!32 resX!32)))))

(declare-fun b!540993 () Bool)

(declare-fun res!335874 () Bool)

(assert (=> b!540993 (=> (not res!335874) (not e!313329))))

(declare-datatypes ((List!10565 0))(
  ( (Nil!10562) (Cons!10561 (h!11510 (_ BitVec 64)) (t!16793 List!10565)) )
))
(declare-fun arrayNoDuplicates!0 (array!34220 (_ BitVec 32) List!10565) Bool)

(assert (=> b!540993 (= res!335874 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10562))))

(declare-fun res!335879 () Bool)

(assert (=> start!49110 (=> (not res!335879) (not e!313327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49110 (= res!335879 (validMask!0 mask!3216))))

(assert (=> start!49110 e!313327))

(assert (=> start!49110 true))

(declare-fun array_inv!12242 (array!34220) Bool)

(assert (=> start!49110 (array_inv!12242 a!3154)))

(declare-fun b!540994 () Bool)

(declare-fun res!335880 () Bool)

(assert (=> b!540994 (=> (not res!335880) (not e!313327))))

(assert (=> b!540994 (= res!335880 (validKeyInArray!0 k!1998))))

(declare-fun b!540995 () Bool)

(assert (=> b!540995 (= e!313327 e!313329)))

(declare-fun res!335876 () Bool)

(assert (=> b!540995 (=> (not res!335876) (not e!313329))))

(declare-fun lt!247530 () SeekEntryResult!4904)

(assert (=> b!540995 (= res!335876 (or (= lt!247530 (MissingZero!4904 i!1153)) (= lt!247530 (MissingVacant!4904 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34220 (_ BitVec 32)) SeekEntryResult!4904)

(assert (=> b!540995 (= lt!247530 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49110 res!335879) b!540986))

(assert (= (and b!540986 res!335878) b!540991))

(assert (= (and b!540991 res!335881) b!540994))

(assert (= (and b!540994 res!335880) b!540989))

(assert (= (and b!540989 res!335875) b!540995))

(assert (= (and b!540995 res!335876) b!540990))

(assert (= (and b!540990 res!335877) b!540993))

(assert (= (and b!540993 res!335874) b!540987))

(assert (= (and b!540987 res!335873) b!540992))

(assert (= (and b!540992 res!335882) b!540988))

(declare-fun m!519621 () Bool)

(assert (=> b!540988 m!519621))

(assert (=> b!540988 m!519621))

(declare-fun m!519623 () Bool)

(assert (=> b!540988 m!519623))

(assert (=> b!540988 m!519623))

(assert (=> b!540988 m!519621))

(declare-fun m!519625 () Bool)

(assert (=> b!540988 m!519625))

(declare-fun m!519627 () Bool)

(assert (=> start!49110 m!519627))

(declare-fun m!519629 () Bool)

(assert (=> start!49110 m!519629))

(assert (=> b!540992 m!519621))

(assert (=> b!540992 m!519621))

(declare-fun m!519631 () Bool)

(assert (=> b!540992 m!519631))

(declare-fun m!519633 () Bool)

(assert (=> b!540993 m!519633))

(declare-fun m!519635 () Bool)

(assert (=> b!540989 m!519635))

(declare-fun m!519637 () Bool)

(assert (=> b!540990 m!519637))

(declare-fun m!519639 () Bool)

(assert (=> b!540994 m!519639))

(assert (=> b!540991 m!519621))

(assert (=> b!540991 m!519621))

(declare-fun m!519641 () Bool)

(assert (=> b!540991 m!519641))

(declare-fun m!519643 () Bool)

(assert (=> b!540987 m!519643))

(assert (=> b!540987 m!519621))

(declare-fun m!519645 () Bool)

(assert (=> b!540995 m!519645))

(push 1)

