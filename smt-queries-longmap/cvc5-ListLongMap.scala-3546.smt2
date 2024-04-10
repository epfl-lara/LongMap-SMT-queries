; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48846 () Bool)

(assert start!48846)

(declare-fun b!537978 () Bool)

(declare-fun res!333188 () Bool)

(declare-fun e!312006 () Bool)

(assert (=> b!537978 (=> (not res!333188) (not e!312006))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34058 0))(
  ( (array!34059 (arr!16368 (Array (_ BitVec 32) (_ BitVec 64))) (size!16732 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34058)

(declare-datatypes ((SeekEntryResult!4826 0))(
  ( (MissingZero!4826 (index!21528 (_ BitVec 32))) (Found!4826 (index!21529 (_ BitVec 32))) (Intermediate!4826 (undefined!5638 Bool) (index!21530 (_ BitVec 32)) (x!50457 (_ BitVec 32))) (Undefined!4826) (MissingVacant!4826 (index!21531 (_ BitVec 32))) )
))
(declare-fun lt!246570 () SeekEntryResult!4826)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34058 (_ BitVec 32)) SeekEntryResult!4826)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537978 (= res!333188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16368 a!3154) j!147) mask!3216) (select (arr!16368 a!3154) j!147) a!3154 mask!3216) lt!246570))))

(declare-fun b!537979 () Bool)

(declare-fun res!333182 () Bool)

(declare-fun e!312005 () Bool)

(assert (=> b!537979 (=> (not res!333182) (not e!312005))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537979 (= res!333182 (and (= (size!16732 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16732 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16732 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537980 () Bool)

(declare-fun res!333194 () Bool)

(assert (=> b!537980 (=> (not res!333194) (not e!312005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537980 (= res!333194 (validKeyInArray!0 (select (arr!16368 a!3154) j!147)))))

(declare-fun b!537981 () Bool)

(declare-fun res!333184 () Bool)

(assert (=> b!537981 (=> (not res!333184) (not e!312006))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!537981 (= res!333184 (and (not (= (select (arr!16368 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16368 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16368 a!3154) index!1177) (select (arr!16368 a!3154) j!147)))))))

(declare-fun b!537982 () Bool)

(declare-fun res!333189 () Bool)

(declare-fun e!312009 () Bool)

(assert (=> b!537982 (=> (not res!333189) (not e!312009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34058 (_ BitVec 32)) Bool)

(assert (=> b!537982 (= res!333189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537983 () Bool)

(declare-fun res!333187 () Bool)

(assert (=> b!537983 (=> (not res!333187) (not e!312009))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537983 (= res!333187 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16732 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16732 a!3154)) (= (select (arr!16368 a!3154) resIndex!32) (select (arr!16368 a!3154) j!147))))))

(declare-fun b!537984 () Bool)

(assert (=> b!537984 (= e!312009 e!312006)))

(declare-fun res!333193 () Bool)

(assert (=> b!537984 (=> (not res!333193) (not e!312006))))

(assert (=> b!537984 (= res!333193 (= lt!246570 (Intermediate!4826 false resIndex!32 resX!32)))))

(assert (=> b!537984 (= lt!246570 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16368 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537985 () Bool)

(declare-fun e!312008 () Bool)

(assert (=> b!537985 (= e!312008 false)))

(declare-fun lt!246568 () (_ BitVec 32))

(declare-fun lt!246569 () SeekEntryResult!4826)

(assert (=> b!537985 (= lt!246569 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246568 (select (arr!16368 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333191 () Bool)

(assert (=> start!48846 (=> (not res!333191) (not e!312005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48846 (= res!333191 (validMask!0 mask!3216))))

(assert (=> start!48846 e!312005))

(assert (=> start!48846 true))

(declare-fun array_inv!12164 (array!34058) Bool)

(assert (=> start!48846 (array_inv!12164 a!3154)))

(declare-fun b!537977 () Bool)

(declare-fun res!333192 () Bool)

(assert (=> b!537977 (=> (not res!333192) (not e!312005))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537977 (= res!333192 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537986 () Bool)

(assert (=> b!537986 (= e!312005 e!312009)))

(declare-fun res!333190 () Bool)

(assert (=> b!537986 (=> (not res!333190) (not e!312009))))

(declare-fun lt!246571 () SeekEntryResult!4826)

(assert (=> b!537986 (= res!333190 (or (= lt!246571 (MissingZero!4826 i!1153)) (= lt!246571 (MissingVacant!4826 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34058 (_ BitVec 32)) SeekEntryResult!4826)

(assert (=> b!537986 (= lt!246571 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537987 () Bool)

(declare-fun res!333183 () Bool)

(assert (=> b!537987 (=> (not res!333183) (not e!312005))))

(assert (=> b!537987 (= res!333183 (validKeyInArray!0 k!1998))))

(declare-fun b!537988 () Bool)

(assert (=> b!537988 (= e!312006 e!312008)))

(declare-fun res!333185 () Bool)

(assert (=> b!537988 (=> (not res!333185) (not e!312008))))

(assert (=> b!537988 (= res!333185 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246568 #b00000000000000000000000000000000) (bvslt lt!246568 (size!16732 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537988 (= lt!246568 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537989 () Bool)

(declare-fun res!333186 () Bool)

(assert (=> b!537989 (=> (not res!333186) (not e!312009))))

(declare-datatypes ((List!10487 0))(
  ( (Nil!10484) (Cons!10483 (h!11426 (_ BitVec 64)) (t!16715 List!10487)) )
))
(declare-fun arrayNoDuplicates!0 (array!34058 (_ BitVec 32) List!10487) Bool)

(assert (=> b!537989 (= res!333186 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10484))))

(assert (= (and start!48846 res!333191) b!537979))

(assert (= (and b!537979 res!333182) b!537980))

(assert (= (and b!537980 res!333194) b!537987))

(assert (= (and b!537987 res!333183) b!537977))

(assert (= (and b!537977 res!333192) b!537986))

(assert (= (and b!537986 res!333190) b!537982))

(assert (= (and b!537982 res!333189) b!537989))

(assert (= (and b!537989 res!333186) b!537983))

(assert (= (and b!537983 res!333187) b!537984))

(assert (= (and b!537984 res!333193) b!537978))

(assert (= (and b!537978 res!333188) b!537981))

(assert (= (and b!537981 res!333184) b!537988))

(assert (= (and b!537988 res!333185) b!537985))

(declare-fun m!517113 () Bool)

(assert (=> b!537986 m!517113))

(declare-fun m!517115 () Bool)

(assert (=> b!537987 m!517115))

(declare-fun m!517117 () Bool)

(assert (=> b!537985 m!517117))

(assert (=> b!537985 m!517117))

(declare-fun m!517119 () Bool)

(assert (=> b!537985 m!517119))

(declare-fun m!517121 () Bool)

(assert (=> b!537983 m!517121))

(assert (=> b!537983 m!517117))

(declare-fun m!517123 () Bool)

(assert (=> start!48846 m!517123))

(declare-fun m!517125 () Bool)

(assert (=> start!48846 m!517125))

(assert (=> b!537980 m!517117))

(assert (=> b!537980 m!517117))

(declare-fun m!517127 () Bool)

(assert (=> b!537980 m!517127))

(declare-fun m!517129 () Bool)

(assert (=> b!537989 m!517129))

(declare-fun m!517131 () Bool)

(assert (=> b!537982 m!517131))

(declare-fun m!517133 () Bool)

(assert (=> b!537981 m!517133))

(assert (=> b!537981 m!517117))

(assert (=> b!537984 m!517117))

(assert (=> b!537984 m!517117))

(declare-fun m!517135 () Bool)

(assert (=> b!537984 m!517135))

(declare-fun m!517137 () Bool)

(assert (=> b!537988 m!517137))

(declare-fun m!517139 () Bool)

(assert (=> b!537977 m!517139))

(assert (=> b!537978 m!517117))

(assert (=> b!537978 m!517117))

(declare-fun m!517141 () Bool)

(assert (=> b!537978 m!517141))

(assert (=> b!537978 m!517141))

(assert (=> b!537978 m!517117))

(declare-fun m!517143 () Bool)

(assert (=> b!537978 m!517143))

(push 1)

