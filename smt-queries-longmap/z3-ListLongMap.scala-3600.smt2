; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49592 () Bool)

(assert start!49592)

(declare-fun b!545511 () Bool)

(declare-fun e!315318 () Bool)

(declare-fun e!315319 () Bool)

(assert (=> b!545511 (= e!315318 e!315319)))

(declare-fun res!339449 () Bool)

(assert (=> b!545511 (=> (not res!339449) (not e!315319))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((array!34405 0))(
  ( (array!34406 (arr!16531 (Array (_ BitVec 32) (_ BitVec 64))) (size!16895 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34405)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!248861 () (_ BitVec 32))

(assert (=> b!545511 (= res!339449 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248861 #b00000000000000000000000000000000) (bvslt lt!248861 (size!16895 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545511 (= lt!248861 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545512 () Bool)

(declare-fun e!315317 () Bool)

(declare-fun e!315320 () Bool)

(assert (=> b!545512 (= e!315317 e!315320)))

(declare-fun res!339442 () Bool)

(assert (=> b!545512 (=> (not res!339442) (not e!315320))))

(declare-datatypes ((SeekEntryResult!4989 0))(
  ( (MissingZero!4989 (index!22180 (_ BitVec 32))) (Found!4989 (index!22181 (_ BitVec 32))) (Intermediate!4989 (undefined!5801 Bool) (index!22182 (_ BitVec 32)) (x!51109 (_ BitVec 32))) (Undefined!4989) (MissingVacant!4989 (index!22183 (_ BitVec 32))) )
))
(declare-fun lt!248859 () SeekEntryResult!4989)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545512 (= res!339442 (or (= lt!248859 (MissingZero!4989 i!1153)) (= lt!248859 (MissingVacant!4989 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34405 (_ BitVec 32)) SeekEntryResult!4989)

(assert (=> b!545512 (= lt!248859 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545513 () Bool)

(declare-fun res!339446 () Bool)

(assert (=> b!545513 (=> (not res!339446) (not e!315320))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!545513 (= res!339446 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16895 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16895 a!3154)) (= (select (arr!16531 a!3154) resIndex!32) (select (arr!16531 a!3154) j!147))))))

(declare-fun b!545514 () Bool)

(declare-fun res!339440 () Bool)

(assert (=> b!545514 (=> (not res!339440) (not e!315317))))

(assert (=> b!545514 (= res!339440 (and (= (size!16895 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16895 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16895 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!339441 () Bool)

(assert (=> start!49592 (=> (not res!339441) (not e!315317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49592 (= res!339441 (validMask!0 mask!3216))))

(assert (=> start!49592 e!315317))

(assert (=> start!49592 true))

(declare-fun array_inv!12327 (array!34405) Bool)

(assert (=> start!49592 (array_inv!12327 a!3154)))

(declare-fun b!545515 () Bool)

(declare-fun res!339447 () Bool)

(assert (=> b!545515 (=> (not res!339447) (not e!315317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545515 (= res!339447 (validKeyInArray!0 (select (arr!16531 a!3154) j!147)))))

(declare-fun lt!248863 () SeekEntryResult!4989)

(declare-fun lt!248858 () SeekEntryResult!4989)

(declare-fun lt!248862 () SeekEntryResult!4989)

(declare-fun b!545516 () Bool)

(assert (=> b!545516 (= e!315319 (and (= lt!248862 lt!248858) (not (= lt!248863 lt!248862))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34405 (_ BitVec 32)) SeekEntryResult!4989)

(assert (=> b!545516 (= lt!248862 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248861 (select (arr!16531 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545517 () Bool)

(declare-fun res!339444 () Bool)

(assert (=> b!545517 (=> (not res!339444) (not e!315320))))

(declare-datatypes ((List!10650 0))(
  ( (Nil!10647) (Cons!10646 (h!11610 (_ BitVec 64)) (t!16878 List!10650)) )
))
(declare-fun arrayNoDuplicates!0 (array!34405 (_ BitVec 32) List!10650) Bool)

(assert (=> b!545517 (= res!339444 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10647))))

(declare-fun b!545518 () Bool)

(declare-fun res!339439 () Bool)

(assert (=> b!545518 (=> (not res!339439) (not e!315320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34405 (_ BitVec 32)) Bool)

(assert (=> b!545518 (= res!339439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545519 () Bool)

(declare-fun res!339448 () Bool)

(assert (=> b!545519 (=> (not res!339448) (not e!315317))))

(assert (=> b!545519 (= res!339448 (validKeyInArray!0 k0!1998))))

(declare-fun b!545520 () Bool)

(declare-fun res!339443 () Bool)

(assert (=> b!545520 (=> (not res!339443) (not e!315317))))

(declare-fun arrayContainsKey!0 (array!34405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545520 (= res!339443 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545521 () Bool)

(declare-fun e!315321 () Bool)

(assert (=> b!545521 (= e!315321 e!315318)))

(declare-fun res!339445 () Bool)

(assert (=> b!545521 (=> (not res!339445) (not e!315318))))

(declare-fun lt!248860 () SeekEntryResult!4989)

(assert (=> b!545521 (= res!339445 (and (= lt!248863 lt!248860) (not (= (select (arr!16531 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16531 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16531 a!3154) index!1177) (select (arr!16531 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545521 (= lt!248863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16531 a!3154) j!147) mask!3216) (select (arr!16531 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545522 () Bool)

(assert (=> b!545522 (= e!315320 e!315321)))

(declare-fun res!339438 () Bool)

(assert (=> b!545522 (=> (not res!339438) (not e!315321))))

(assert (=> b!545522 (= res!339438 (= lt!248860 lt!248858))))

(assert (=> b!545522 (= lt!248858 (Intermediate!4989 false resIndex!32 resX!32))))

(assert (=> b!545522 (= lt!248860 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16531 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49592 res!339441) b!545514))

(assert (= (and b!545514 res!339440) b!545515))

(assert (= (and b!545515 res!339447) b!545519))

(assert (= (and b!545519 res!339448) b!545520))

(assert (= (and b!545520 res!339443) b!545512))

(assert (= (and b!545512 res!339442) b!545518))

(assert (= (and b!545518 res!339439) b!545517))

(assert (= (and b!545517 res!339444) b!545513))

(assert (= (and b!545513 res!339446) b!545522))

(assert (= (and b!545522 res!339438) b!545521))

(assert (= (and b!545521 res!339445) b!545511))

(assert (= (and b!545511 res!339449) b!545516))

(declare-fun m!523073 () Bool)

(assert (=> b!545521 m!523073))

(declare-fun m!523075 () Bool)

(assert (=> b!545521 m!523075))

(assert (=> b!545521 m!523075))

(declare-fun m!523077 () Bool)

(assert (=> b!545521 m!523077))

(assert (=> b!545521 m!523077))

(assert (=> b!545521 m!523075))

(declare-fun m!523079 () Bool)

(assert (=> b!545521 m!523079))

(declare-fun m!523081 () Bool)

(assert (=> b!545511 m!523081))

(assert (=> b!545516 m!523075))

(assert (=> b!545516 m!523075))

(declare-fun m!523083 () Bool)

(assert (=> b!545516 m!523083))

(declare-fun m!523085 () Bool)

(assert (=> b!545518 m!523085))

(declare-fun m!523087 () Bool)

(assert (=> b!545513 m!523087))

(assert (=> b!545513 m!523075))

(declare-fun m!523089 () Bool)

(assert (=> b!545512 m!523089))

(declare-fun m!523091 () Bool)

(assert (=> b!545519 m!523091))

(declare-fun m!523093 () Bool)

(assert (=> start!49592 m!523093))

(declare-fun m!523095 () Bool)

(assert (=> start!49592 m!523095))

(assert (=> b!545522 m!523075))

(assert (=> b!545522 m!523075))

(declare-fun m!523097 () Bool)

(assert (=> b!545522 m!523097))

(assert (=> b!545515 m!523075))

(assert (=> b!545515 m!523075))

(declare-fun m!523099 () Bool)

(assert (=> b!545515 m!523099))

(declare-fun m!523101 () Bool)

(assert (=> b!545520 m!523101))

(declare-fun m!523103 () Bool)

(assert (=> b!545517 m!523103))

(check-sat (not b!545519) (not b!545511) (not start!49592) (not b!545517) (not b!545518) (not b!545522) (not b!545516) (not b!545521) (not b!545512) (not b!545520) (not b!545515))
(check-sat)
