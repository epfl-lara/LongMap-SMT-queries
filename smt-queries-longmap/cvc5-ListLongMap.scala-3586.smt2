; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49302 () Bool)

(assert start!49302)

(declare-fun res!337489 () Bool)

(declare-fun e!314130 () Bool)

(assert (=> start!49302 (=> (not res!337489) (not e!314130))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49302 (= res!337489 (validMask!0 mask!3216))))

(assert (=> start!49302 e!314130))

(assert (=> start!49302 true))

(declare-datatypes ((array!34310 0))(
  ( (array!34311 (arr!16488 (Array (_ BitVec 32) (_ BitVec 64))) (size!16852 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34310)

(declare-fun array_inv!12284 (array!34310) Bool)

(assert (=> start!49302 (array_inv!12284 a!3154)))

(declare-fun b!542934 () Bool)

(declare-fun res!337488 () Bool)

(assert (=> b!542934 (=> (not res!337488) (not e!314130))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542934 (= res!337488 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542935 () Bool)

(declare-fun res!337485 () Bool)

(declare-fun e!314131 () Bool)

(assert (=> b!542935 (=> (not res!337485) (not e!314131))))

(declare-datatypes ((List!10607 0))(
  ( (Nil!10604) (Cons!10603 (h!11558 (_ BitVec 64)) (t!16835 List!10607)) )
))
(declare-fun arrayNoDuplicates!0 (array!34310 (_ BitVec 32) List!10607) Bool)

(assert (=> b!542935 (= res!337485 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10604))))

(declare-fun b!542936 () Bool)

(declare-fun res!337491 () Bool)

(assert (=> b!542936 (=> (not res!337491) (not e!314131))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542936 (= res!337491 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16852 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16852 a!3154)) (= (select (arr!16488 a!3154) resIndex!32) (select (arr!16488 a!3154) j!147))))))

(declare-fun b!542937 () Bool)

(declare-fun res!337493 () Bool)

(declare-fun e!314133 () Bool)

(assert (=> b!542937 (=> (not res!337493) (not e!314133))))

(assert (=> b!542937 (= res!337493 (and (not (= (select (arr!16488 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16488 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16488 a!3154) index!1177) (select (arr!16488 a!3154) j!147)))))))

(declare-fun b!542938 () Bool)

(declare-fun res!337492 () Bool)

(assert (=> b!542938 (=> (not res!337492) (not e!314130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542938 (= res!337492 (validKeyInArray!0 (select (arr!16488 a!3154) j!147)))))

(declare-fun b!542939 () Bool)

(declare-fun res!337487 () Bool)

(assert (=> b!542939 (=> (not res!337487) (not e!314130))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542939 (= res!337487 (and (= (size!16852 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16852 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16852 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542940 () Bool)

(declare-fun res!337486 () Bool)

(assert (=> b!542940 (=> (not res!337486) (not e!314131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34310 (_ BitVec 32)) Bool)

(assert (=> b!542940 (= res!337486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542941 () Bool)

(declare-fun res!337490 () Bool)

(assert (=> b!542941 (=> (not res!337490) (not e!314130))))

(assert (=> b!542941 (= res!337490 (validKeyInArray!0 k!1998))))

(declare-fun b!542942 () Bool)

(assert (=> b!542942 (= e!314131 e!314133)))

(declare-fun res!337495 () Bool)

(assert (=> b!542942 (=> (not res!337495) (not e!314133))))

(declare-datatypes ((SeekEntryResult!4946 0))(
  ( (MissingZero!4946 (index!22008 (_ BitVec 32))) (Found!4946 (index!22009 (_ BitVec 32))) (Intermediate!4946 (undefined!5758 Bool) (index!22010 (_ BitVec 32)) (x!50921 (_ BitVec 32))) (Undefined!4946) (MissingVacant!4946 (index!22011 (_ BitVec 32))) )
))
(declare-fun lt!248047 () SeekEntryResult!4946)

(assert (=> b!542942 (= res!337495 (= lt!248047 (Intermediate!4946 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34310 (_ BitVec 32)) SeekEntryResult!4946)

(assert (=> b!542942 (= lt!248047 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16488 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542943 () Bool)

(assert (=> b!542943 (= e!314133 false)))

(declare-fun lt!248046 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542943 (= lt!248046 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542944 () Bool)

(assert (=> b!542944 (= e!314130 e!314131)))

(declare-fun res!337494 () Bool)

(assert (=> b!542944 (=> (not res!337494) (not e!314131))))

(declare-fun lt!248045 () SeekEntryResult!4946)

(assert (=> b!542944 (= res!337494 (or (= lt!248045 (MissingZero!4946 i!1153)) (= lt!248045 (MissingVacant!4946 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34310 (_ BitVec 32)) SeekEntryResult!4946)

(assert (=> b!542944 (= lt!248045 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542945 () Bool)

(declare-fun res!337496 () Bool)

(assert (=> b!542945 (=> (not res!337496) (not e!314133))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542945 (= res!337496 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16488 a!3154) j!147) mask!3216) (select (arr!16488 a!3154) j!147) a!3154 mask!3216) lt!248047))))

(assert (= (and start!49302 res!337489) b!542939))

(assert (= (and b!542939 res!337487) b!542938))

(assert (= (and b!542938 res!337492) b!542941))

(assert (= (and b!542941 res!337490) b!542934))

(assert (= (and b!542934 res!337488) b!542944))

(assert (= (and b!542944 res!337494) b!542940))

(assert (= (and b!542940 res!337486) b!542935))

(assert (= (and b!542935 res!337485) b!542936))

(assert (= (and b!542936 res!337491) b!542942))

(assert (= (and b!542942 res!337495) b!542945))

(assert (= (and b!542945 res!337496) b!542937))

(assert (= (and b!542937 res!337493) b!542943))

(declare-fun m!521109 () Bool)

(assert (=> b!542936 m!521109))

(declare-fun m!521111 () Bool)

(assert (=> b!542936 m!521111))

(declare-fun m!521113 () Bool)

(assert (=> b!542944 m!521113))

(declare-fun m!521115 () Bool)

(assert (=> b!542934 m!521115))

(declare-fun m!521117 () Bool)

(assert (=> start!49302 m!521117))

(declare-fun m!521119 () Bool)

(assert (=> start!49302 m!521119))

(declare-fun m!521121 () Bool)

(assert (=> b!542940 m!521121))

(assert (=> b!542942 m!521111))

(assert (=> b!542942 m!521111))

(declare-fun m!521123 () Bool)

(assert (=> b!542942 m!521123))

(assert (=> b!542938 m!521111))

(assert (=> b!542938 m!521111))

(declare-fun m!521125 () Bool)

(assert (=> b!542938 m!521125))

(declare-fun m!521127 () Bool)

(assert (=> b!542943 m!521127))

(assert (=> b!542945 m!521111))

(assert (=> b!542945 m!521111))

(declare-fun m!521129 () Bool)

(assert (=> b!542945 m!521129))

(assert (=> b!542945 m!521129))

(assert (=> b!542945 m!521111))

(declare-fun m!521131 () Bool)

(assert (=> b!542945 m!521131))

(declare-fun m!521133 () Bool)

(assert (=> b!542937 m!521133))

(assert (=> b!542937 m!521111))

(declare-fun m!521135 () Bool)

(assert (=> b!542935 m!521135))

(declare-fun m!521137 () Bool)

(assert (=> b!542941 m!521137))

(push 1)

