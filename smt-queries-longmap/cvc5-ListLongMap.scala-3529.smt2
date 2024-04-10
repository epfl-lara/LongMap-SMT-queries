; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48744 () Bool)

(assert start!48744)

(declare-fun res!331203 () Bool)

(declare-fun e!311241 () Bool)

(assert (=> start!48744 (=> (not res!331203) (not e!311241))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48744 (= res!331203 (validMask!0 mask!3216))))

(assert (=> start!48744 e!311241))

(assert (=> start!48744 true))

(declare-datatypes ((array!33956 0))(
  ( (array!33957 (arr!16317 (Array (_ BitVec 32) (_ BitVec 64))) (size!16681 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33956)

(declare-fun array_inv!12113 (array!33956) Bool)

(assert (=> start!48744 (array_inv!12113 a!3154)))

(declare-fun b!535988 () Bool)

(declare-fun res!331202 () Bool)

(declare-fun e!311240 () Bool)

(assert (=> b!535988 (=> (not res!331202) (not e!311240))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535988 (= res!331202 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16681 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16681 a!3154)) (= (select (arr!16317 a!3154) resIndex!32) (select (arr!16317 a!3154) j!147))))))

(declare-fun b!535989 () Bool)

(declare-fun e!311244 () Bool)

(declare-fun e!311243 () Bool)

(assert (=> b!535989 (= e!311244 e!311243)))

(declare-fun res!331195 () Bool)

(assert (=> b!535989 (=> (not res!331195) (not e!311243))))

(declare-fun lt!245956 () (_ BitVec 32))

(assert (=> b!535989 (= res!331195 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245956 #b00000000000000000000000000000000) (bvslt lt!245956 (size!16681 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535989 (= lt!245956 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535990 () Bool)

(declare-fun res!331193 () Bool)

(assert (=> b!535990 (=> (not res!331193) (not e!311240))))

(declare-datatypes ((List!10436 0))(
  ( (Nil!10433) (Cons!10432 (h!11375 (_ BitVec 64)) (t!16664 List!10436)) )
))
(declare-fun arrayNoDuplicates!0 (array!33956 (_ BitVec 32) List!10436) Bool)

(assert (=> b!535990 (= res!331193 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10433))))

(declare-fun b!535991 () Bool)

(declare-fun res!331197 () Bool)

(assert (=> b!535991 (=> (not res!331197) (not e!311244))))

(declare-datatypes ((SeekEntryResult!4775 0))(
  ( (MissingZero!4775 (index!21324 (_ BitVec 32))) (Found!4775 (index!21325 (_ BitVec 32))) (Intermediate!4775 (undefined!5587 Bool) (index!21326 (_ BitVec 32)) (x!50270 (_ BitVec 32))) (Undefined!4775) (MissingVacant!4775 (index!21327 (_ BitVec 32))) )
))
(declare-fun lt!245958 () SeekEntryResult!4775)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33956 (_ BitVec 32)) SeekEntryResult!4775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535991 (= res!331197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16317 a!3154) j!147) mask!3216) (select (arr!16317 a!3154) j!147) a!3154 mask!3216) lt!245958))))

(declare-fun b!535992 () Bool)

(declare-fun res!331200 () Bool)

(assert (=> b!535992 (=> (not res!331200) (not e!311241))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535992 (= res!331200 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535993 () Bool)

(declare-fun res!331199 () Bool)

(assert (=> b!535993 (=> (not res!331199) (not e!311240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33956 (_ BitVec 32)) Bool)

(assert (=> b!535993 (= res!331199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535994 () Bool)

(declare-fun res!331204 () Bool)

(assert (=> b!535994 (=> (not res!331204) (not e!311241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535994 (= res!331204 (validKeyInArray!0 k!1998))))

(declare-fun b!535995 () Bool)

(assert (=> b!535995 (= e!311243 false)))

(declare-fun lt!245959 () SeekEntryResult!4775)

(assert (=> b!535995 (= lt!245959 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245956 (select (arr!16317 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535996 () Bool)

(declare-fun res!331205 () Bool)

(assert (=> b!535996 (=> (not res!331205) (not e!311244))))

(assert (=> b!535996 (= res!331205 (and (not (= (select (arr!16317 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16317 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16317 a!3154) index!1177) (select (arr!16317 a!3154) j!147)))))))

(declare-fun b!535997 () Bool)

(assert (=> b!535997 (= e!311241 e!311240)))

(declare-fun res!331198 () Bool)

(assert (=> b!535997 (=> (not res!331198) (not e!311240))))

(declare-fun lt!245957 () SeekEntryResult!4775)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535997 (= res!331198 (or (= lt!245957 (MissingZero!4775 i!1153)) (= lt!245957 (MissingVacant!4775 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33956 (_ BitVec 32)) SeekEntryResult!4775)

(assert (=> b!535997 (= lt!245957 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535998 () Bool)

(assert (=> b!535998 (= e!311240 e!311244)))

(declare-fun res!331201 () Bool)

(assert (=> b!535998 (=> (not res!331201) (not e!311244))))

(assert (=> b!535998 (= res!331201 (= lt!245958 (Intermediate!4775 false resIndex!32 resX!32)))))

(assert (=> b!535998 (= lt!245958 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16317 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535999 () Bool)

(declare-fun res!331196 () Bool)

(assert (=> b!535999 (=> (not res!331196) (not e!311241))))

(assert (=> b!535999 (= res!331196 (and (= (size!16681 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16681 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16681 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536000 () Bool)

(declare-fun res!331194 () Bool)

(assert (=> b!536000 (=> (not res!331194) (not e!311241))))

(assert (=> b!536000 (= res!331194 (validKeyInArray!0 (select (arr!16317 a!3154) j!147)))))

(assert (= (and start!48744 res!331203) b!535999))

(assert (= (and b!535999 res!331196) b!536000))

(assert (= (and b!536000 res!331194) b!535994))

(assert (= (and b!535994 res!331204) b!535992))

(assert (= (and b!535992 res!331200) b!535997))

(assert (= (and b!535997 res!331198) b!535993))

(assert (= (and b!535993 res!331199) b!535990))

(assert (= (and b!535990 res!331193) b!535988))

(assert (= (and b!535988 res!331202) b!535998))

(assert (= (and b!535998 res!331201) b!535991))

(assert (= (and b!535991 res!331197) b!535996))

(assert (= (and b!535996 res!331205) b!535989))

(assert (= (and b!535989 res!331195) b!535995))

(declare-fun m!515481 () Bool)

(assert (=> b!535989 m!515481))

(declare-fun m!515483 () Bool)

(assert (=> b!535995 m!515483))

(assert (=> b!535995 m!515483))

(declare-fun m!515485 () Bool)

(assert (=> b!535995 m!515485))

(declare-fun m!515487 () Bool)

(assert (=> b!535992 m!515487))

(assert (=> b!536000 m!515483))

(assert (=> b!536000 m!515483))

(declare-fun m!515489 () Bool)

(assert (=> b!536000 m!515489))

(declare-fun m!515491 () Bool)

(assert (=> b!535997 m!515491))

(declare-fun m!515493 () Bool)

(assert (=> b!535990 m!515493))

(assert (=> b!535998 m!515483))

(assert (=> b!535998 m!515483))

(declare-fun m!515495 () Bool)

(assert (=> b!535998 m!515495))

(declare-fun m!515497 () Bool)

(assert (=> b!535988 m!515497))

(assert (=> b!535988 m!515483))

(declare-fun m!515499 () Bool)

(assert (=> start!48744 m!515499))

(declare-fun m!515501 () Bool)

(assert (=> start!48744 m!515501))

(declare-fun m!515503 () Bool)

(assert (=> b!535996 m!515503))

(assert (=> b!535996 m!515483))

(declare-fun m!515505 () Bool)

(assert (=> b!535994 m!515505))

(assert (=> b!535991 m!515483))

(assert (=> b!535991 m!515483))

(declare-fun m!515507 () Bool)

(assert (=> b!535991 m!515507))

(assert (=> b!535991 m!515507))

(assert (=> b!535991 m!515483))

(declare-fun m!515509 () Bool)

(assert (=> b!535991 m!515509))

(declare-fun m!515511 () Bool)

(assert (=> b!535993 m!515511))

(push 1)

