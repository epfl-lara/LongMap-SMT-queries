; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48726 () Bool)

(assert start!48726)

(declare-fun b!535651 () Bool)

(declare-fun res!330857 () Bool)

(declare-fun e!311112 () Bool)

(assert (=> b!535651 (=> (not res!330857) (not e!311112))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33938 0))(
  ( (array!33939 (arr!16308 (Array (_ BitVec 32) (_ BitVec 64))) (size!16672 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33938)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535651 (= res!330857 (and (= (size!16672 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16672 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16672 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535652 () Bool)

(declare-fun e!311114 () Bool)

(assert (=> b!535652 (= e!311112 e!311114)))

(declare-fun res!330859 () Bool)

(assert (=> b!535652 (=> (not res!330859) (not e!311114))))

(declare-datatypes ((SeekEntryResult!4766 0))(
  ( (MissingZero!4766 (index!21288 (_ BitVec 32))) (Found!4766 (index!21289 (_ BitVec 32))) (Intermediate!4766 (undefined!5578 Bool) (index!21290 (_ BitVec 32)) (x!50237 (_ BitVec 32))) (Undefined!4766) (MissingVacant!4766 (index!21291 (_ BitVec 32))) )
))
(declare-fun lt!245862 () SeekEntryResult!4766)

(assert (=> b!535652 (= res!330859 (or (= lt!245862 (MissingZero!4766 i!1153)) (= lt!245862 (MissingVacant!4766 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33938 (_ BitVec 32)) SeekEntryResult!4766)

(assert (=> b!535652 (= lt!245862 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535653 () Bool)

(declare-fun res!330861 () Bool)

(declare-fun e!311113 () Bool)

(assert (=> b!535653 (=> (not res!330861) (not e!311113))))

(declare-fun lt!245863 () SeekEntryResult!4766)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33938 (_ BitVec 32)) SeekEntryResult!4766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535653 (= res!330861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16308 a!3154) j!147) mask!3216) (select (arr!16308 a!3154) j!147) a!3154 mask!3216) lt!245863))))

(declare-fun b!535654 () Bool)

(declare-fun res!330860 () Bool)

(assert (=> b!535654 (=> (not res!330860) (not e!311112))))

(declare-fun arrayContainsKey!0 (array!33938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535654 (= res!330860 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun b!535655 () Bool)

(assert (=> b!535655 (= e!311113 (and (not (= (select (arr!16308 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16308 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16308 a!3154) index!1177) (select (arr!16308 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun res!330864 () Bool)

(assert (=> start!48726 (=> (not res!330864) (not e!311112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48726 (= res!330864 (validMask!0 mask!3216))))

(assert (=> start!48726 e!311112))

(assert (=> start!48726 true))

(declare-fun array_inv!12104 (array!33938) Bool)

(assert (=> start!48726 (array_inv!12104 a!3154)))

(declare-fun b!535656 () Bool)

(declare-fun res!330856 () Bool)

(assert (=> b!535656 (=> (not res!330856) (not e!311112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535656 (= res!330856 (validKeyInArray!0 k!1998))))

(declare-fun b!535657 () Bool)

(declare-fun res!330866 () Bool)

(assert (=> b!535657 (=> (not res!330866) (not e!311114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33938 (_ BitVec 32)) Bool)

(assert (=> b!535657 (= res!330866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535658 () Bool)

(declare-fun res!330865 () Bool)

(assert (=> b!535658 (=> (not res!330865) (not e!311114))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535658 (= res!330865 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16672 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16672 a!3154)) (= (select (arr!16308 a!3154) resIndex!32) (select (arr!16308 a!3154) j!147))))))

(declare-fun b!535659 () Bool)

(declare-fun res!330862 () Bool)

(assert (=> b!535659 (=> (not res!330862) (not e!311114))))

(declare-datatypes ((List!10427 0))(
  ( (Nil!10424) (Cons!10423 (h!11366 (_ BitVec 64)) (t!16655 List!10427)) )
))
(declare-fun arrayNoDuplicates!0 (array!33938 (_ BitVec 32) List!10427) Bool)

(assert (=> b!535659 (= res!330862 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10424))))

(declare-fun b!535660 () Bool)

(assert (=> b!535660 (= e!311114 e!311113)))

(declare-fun res!330858 () Bool)

(assert (=> b!535660 (=> (not res!330858) (not e!311113))))

(assert (=> b!535660 (= res!330858 (= lt!245863 (Intermediate!4766 false resIndex!32 resX!32)))))

(assert (=> b!535660 (= lt!245863 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16308 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535661 () Bool)

(declare-fun res!330863 () Bool)

(assert (=> b!535661 (=> (not res!330863) (not e!311112))))

(assert (=> b!535661 (= res!330863 (validKeyInArray!0 (select (arr!16308 a!3154) j!147)))))

(assert (= (and start!48726 res!330864) b!535651))

(assert (= (and b!535651 res!330857) b!535661))

(assert (= (and b!535661 res!330863) b!535656))

(assert (= (and b!535656 res!330856) b!535654))

(assert (= (and b!535654 res!330860) b!535652))

(assert (= (and b!535652 res!330859) b!535657))

(assert (= (and b!535657 res!330866) b!535659))

(assert (= (and b!535659 res!330862) b!535658))

(assert (= (and b!535658 res!330865) b!535660))

(assert (= (and b!535660 res!330858) b!535653))

(assert (= (and b!535653 res!330861) b!535655))

(declare-fun m!515205 () Bool)

(assert (=> start!48726 m!515205))

(declare-fun m!515207 () Bool)

(assert (=> start!48726 m!515207))

(declare-fun m!515209 () Bool)

(assert (=> b!535652 m!515209))

(declare-fun m!515211 () Bool)

(assert (=> b!535661 m!515211))

(assert (=> b!535661 m!515211))

(declare-fun m!515213 () Bool)

(assert (=> b!535661 m!515213))

(assert (=> b!535660 m!515211))

(assert (=> b!535660 m!515211))

(declare-fun m!515215 () Bool)

(assert (=> b!535660 m!515215))

(declare-fun m!515217 () Bool)

(assert (=> b!535655 m!515217))

(assert (=> b!535655 m!515211))

(assert (=> b!535653 m!515211))

(assert (=> b!535653 m!515211))

(declare-fun m!515219 () Bool)

(assert (=> b!535653 m!515219))

(assert (=> b!535653 m!515219))

(assert (=> b!535653 m!515211))

(declare-fun m!515221 () Bool)

(assert (=> b!535653 m!515221))

(declare-fun m!515223 () Bool)

(assert (=> b!535657 m!515223))

(declare-fun m!515225 () Bool)

(assert (=> b!535654 m!515225))

(declare-fun m!515227 () Bool)

(assert (=> b!535656 m!515227))

(declare-fun m!515229 () Bool)

(assert (=> b!535659 m!515229))

(declare-fun m!515231 () Bool)

(assert (=> b!535658 m!515231))

(assert (=> b!535658 m!515211))

(push 1)

