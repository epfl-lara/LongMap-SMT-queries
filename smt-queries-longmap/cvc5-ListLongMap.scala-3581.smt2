; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49272 () Bool)

(assert start!49272)

(declare-fun res!336950 () Bool)

(declare-fun e!313952 () Bool)

(assert (=> start!49272 (=> (not res!336950) (not e!313952))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49272 (= res!336950 (validMask!0 mask!3216))))

(assert (=> start!49272 e!313952))

(assert (=> start!49272 true))

(declare-datatypes ((array!34280 0))(
  ( (array!34281 (arr!16473 (Array (_ BitVec 32) (_ BitVec 64))) (size!16837 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34280)

(declare-fun array_inv!12269 (array!34280) Bool)

(assert (=> start!49272 (array_inv!12269 a!3154)))

(declare-fun b!542394 () Bool)

(declare-fun res!336951 () Bool)

(declare-fun e!313953 () Bool)

(assert (=> b!542394 (=> (not res!336951) (not e!313953))))

(declare-datatypes ((List!10592 0))(
  ( (Nil!10589) (Cons!10588 (h!11543 (_ BitVec 64)) (t!16820 List!10592)) )
))
(declare-fun arrayNoDuplicates!0 (array!34280 (_ BitVec 32) List!10592) Bool)

(assert (=> b!542394 (= res!336951 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10589))))

(declare-fun b!542395 () Bool)

(declare-fun res!336956 () Bool)

(assert (=> b!542395 (=> (not res!336956) (not e!313952))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542395 (= res!336956 (and (= (size!16837 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16837 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16837 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542396 () Bool)

(declare-fun res!336949 () Bool)

(declare-fun e!313951 () Bool)

(assert (=> b!542396 (=> (not res!336949) (not e!313951))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!542396 (= res!336949 (and (not (= (select (arr!16473 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16473 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16473 a!3154) index!1177) (select (arr!16473 a!3154) j!147)))))))

(declare-fun b!542397 () Bool)

(assert (=> b!542397 (= e!313953 e!313951)))

(declare-fun res!336954 () Bool)

(assert (=> b!542397 (=> (not res!336954) (not e!313951))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4931 0))(
  ( (MissingZero!4931 (index!21948 (_ BitVec 32))) (Found!4931 (index!21949 (_ BitVec 32))) (Intermediate!4931 (undefined!5743 Bool) (index!21950 (_ BitVec 32)) (x!50866 (_ BitVec 32))) (Undefined!4931) (MissingVacant!4931 (index!21951 (_ BitVec 32))) )
))
(declare-fun lt!247910 () SeekEntryResult!4931)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542397 (= res!336954 (= lt!247910 (Intermediate!4931 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34280 (_ BitVec 32)) SeekEntryResult!4931)

(assert (=> b!542397 (= lt!247910 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16473 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542398 () Bool)

(declare-fun res!336946 () Bool)

(assert (=> b!542398 (=> (not res!336946) (not e!313953))))

(assert (=> b!542398 (= res!336946 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16837 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16837 a!3154)) (= (select (arr!16473 a!3154) resIndex!32) (select (arr!16473 a!3154) j!147))))))

(declare-fun b!542399 () Bool)

(declare-fun res!336955 () Bool)

(assert (=> b!542399 (=> (not res!336955) (not e!313951))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542399 (= res!336955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16473 a!3154) j!147) mask!3216) (select (arr!16473 a!3154) j!147) a!3154 mask!3216) lt!247910))))

(declare-fun b!542400 () Bool)

(declare-fun res!336948 () Bool)

(assert (=> b!542400 (=> (not res!336948) (not e!313953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34280 (_ BitVec 32)) Bool)

(assert (=> b!542400 (= res!336948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542401 () Bool)

(declare-fun res!336945 () Bool)

(assert (=> b!542401 (=> (not res!336945) (not e!313952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542401 (= res!336945 (validKeyInArray!0 (select (arr!16473 a!3154) j!147)))))

(declare-fun b!542402 () Bool)

(assert (=> b!542402 (= e!313951 false)))

(declare-fun lt!247911 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542402 (= lt!247911 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542403 () Bool)

(assert (=> b!542403 (= e!313952 e!313953)))

(declare-fun res!336952 () Bool)

(assert (=> b!542403 (=> (not res!336952) (not e!313953))))

(declare-fun lt!247912 () SeekEntryResult!4931)

(assert (=> b!542403 (= res!336952 (or (= lt!247912 (MissingZero!4931 i!1153)) (= lt!247912 (MissingVacant!4931 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34280 (_ BitVec 32)) SeekEntryResult!4931)

(assert (=> b!542403 (= lt!247912 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542404 () Bool)

(declare-fun res!336953 () Bool)

(assert (=> b!542404 (=> (not res!336953) (not e!313952))))

(declare-fun arrayContainsKey!0 (array!34280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542404 (= res!336953 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542405 () Bool)

(declare-fun res!336947 () Bool)

(assert (=> b!542405 (=> (not res!336947) (not e!313952))))

(assert (=> b!542405 (= res!336947 (validKeyInArray!0 k!1998))))

(assert (= (and start!49272 res!336950) b!542395))

(assert (= (and b!542395 res!336956) b!542401))

(assert (= (and b!542401 res!336945) b!542405))

(assert (= (and b!542405 res!336947) b!542404))

(assert (= (and b!542404 res!336953) b!542403))

(assert (= (and b!542403 res!336952) b!542400))

(assert (= (and b!542400 res!336948) b!542394))

(assert (= (and b!542394 res!336951) b!542398))

(assert (= (and b!542398 res!336946) b!542397))

(assert (= (and b!542397 res!336954) b!542399))

(assert (= (and b!542399 res!336955) b!542396))

(assert (= (and b!542396 res!336949) b!542402))

(declare-fun m!520659 () Bool)

(assert (=> b!542397 m!520659))

(assert (=> b!542397 m!520659))

(declare-fun m!520661 () Bool)

(assert (=> b!542397 m!520661))

(assert (=> b!542399 m!520659))

(assert (=> b!542399 m!520659))

(declare-fun m!520663 () Bool)

(assert (=> b!542399 m!520663))

(assert (=> b!542399 m!520663))

(assert (=> b!542399 m!520659))

(declare-fun m!520665 () Bool)

(assert (=> b!542399 m!520665))

(declare-fun m!520667 () Bool)

(assert (=> b!542405 m!520667))

(declare-fun m!520669 () Bool)

(assert (=> b!542394 m!520669))

(declare-fun m!520671 () Bool)

(assert (=> start!49272 m!520671))

(declare-fun m!520673 () Bool)

(assert (=> start!49272 m!520673))

(declare-fun m!520675 () Bool)

(assert (=> b!542403 m!520675))

(declare-fun m!520677 () Bool)

(assert (=> b!542398 m!520677))

(assert (=> b!542398 m!520659))

(declare-fun m!520679 () Bool)

(assert (=> b!542402 m!520679))

(assert (=> b!542401 m!520659))

(assert (=> b!542401 m!520659))

(declare-fun m!520681 () Bool)

(assert (=> b!542401 m!520681))

(declare-fun m!520683 () Bool)

(assert (=> b!542400 m!520683))

(declare-fun m!520685 () Bool)

(assert (=> b!542404 m!520685))

(declare-fun m!520687 () Bool)

(assert (=> b!542396 m!520687))

(assert (=> b!542396 m!520659))

(push 1)

