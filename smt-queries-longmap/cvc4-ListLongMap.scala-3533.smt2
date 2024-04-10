; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48772 () Bool)

(assert start!48772)

(declare-fun b!536534 () Bool)

(declare-fun e!311450 () Bool)

(declare-fun e!311454 () Bool)

(assert (=> b!536534 (= e!311450 e!311454)))

(declare-fun res!331744 () Bool)

(assert (=> b!536534 (=> (not res!331744) (not e!311454))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246124 () (_ BitVec 32))

(declare-datatypes ((array!33984 0))(
  ( (array!33985 (arr!16331 (Array (_ BitVec 32) (_ BitVec 64))) (size!16695 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33984)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536534 (= res!331744 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246124 #b00000000000000000000000000000000) (bvslt lt!246124 (size!16695 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536534 (= lt!246124 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536535 () Bool)

(declare-fun res!331750 () Bool)

(declare-fun e!311453 () Bool)

(assert (=> b!536535 (=> (not res!331750) (not e!311453))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536535 (= res!331750 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536536 () Bool)

(declare-fun e!311452 () Bool)

(assert (=> b!536536 (= e!311452 e!311450)))

(declare-fun res!331743 () Bool)

(assert (=> b!536536 (=> (not res!331743) (not e!311450))))

(declare-datatypes ((SeekEntryResult!4789 0))(
  ( (MissingZero!4789 (index!21380 (_ BitVec 32))) (Found!4789 (index!21381 (_ BitVec 32))) (Intermediate!4789 (undefined!5601 Bool) (index!21382 (_ BitVec 32)) (x!50316 (_ BitVec 32))) (Undefined!4789) (MissingVacant!4789 (index!21383 (_ BitVec 32))) )
))
(declare-fun lt!246125 () SeekEntryResult!4789)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536536 (= res!331743 (= lt!246125 (Intermediate!4789 false resIndex!32 resX!32)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33984 (_ BitVec 32)) SeekEntryResult!4789)

(assert (=> b!536536 (= lt!246125 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16331 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536538 () Bool)

(declare-fun res!331745 () Bool)

(assert (=> b!536538 (=> (not res!331745) (not e!311453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536538 (= res!331745 (validKeyInArray!0 k!1998))))

(declare-fun b!536539 () Bool)

(assert (=> b!536539 (= e!311453 e!311452)))

(declare-fun res!331740 () Bool)

(assert (=> b!536539 (=> (not res!331740) (not e!311452))))

(declare-fun lt!246126 () SeekEntryResult!4789)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536539 (= res!331740 (or (= lt!246126 (MissingZero!4789 i!1153)) (= lt!246126 (MissingVacant!4789 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33984 (_ BitVec 32)) SeekEntryResult!4789)

(assert (=> b!536539 (= lt!246126 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536540 () Bool)

(declare-fun res!331739 () Bool)

(assert (=> b!536540 (=> (not res!331739) (not e!311452))))

(declare-datatypes ((List!10450 0))(
  ( (Nil!10447) (Cons!10446 (h!11389 (_ BitVec 64)) (t!16678 List!10450)) )
))
(declare-fun arrayNoDuplicates!0 (array!33984 (_ BitVec 32) List!10450) Bool)

(assert (=> b!536540 (= res!331739 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10447))))

(declare-fun b!536541 () Bool)

(declare-fun res!331747 () Bool)

(assert (=> b!536541 (=> (not res!331747) (not e!311452))))

(assert (=> b!536541 (= res!331747 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16695 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16695 a!3154)) (= (select (arr!16331 a!3154) resIndex!32) (select (arr!16331 a!3154) j!147))))))

(declare-fun b!536542 () Bool)

(declare-fun res!331751 () Bool)

(assert (=> b!536542 (=> (not res!331751) (not e!311453))))

(assert (=> b!536542 (= res!331751 (and (= (size!16695 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16695 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16695 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536543 () Bool)

(declare-fun res!331749 () Bool)

(assert (=> b!536543 (=> (not res!331749) (not e!311450))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536543 (= res!331749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16331 a!3154) j!147) mask!3216) (select (arr!16331 a!3154) j!147) a!3154 mask!3216) lt!246125))))

(declare-fun b!536544 () Bool)

(declare-fun res!331748 () Bool)

(assert (=> b!536544 (=> (not res!331748) (not e!311450))))

(assert (=> b!536544 (= res!331748 (and (not (= (select (arr!16331 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16331 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16331 a!3154) index!1177) (select (arr!16331 a!3154) j!147)))))))

(declare-fun b!536537 () Bool)

(declare-fun res!331746 () Bool)

(assert (=> b!536537 (=> (not res!331746) (not e!311452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33984 (_ BitVec 32)) Bool)

(assert (=> b!536537 (= res!331746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!331741 () Bool)

(assert (=> start!48772 (=> (not res!331741) (not e!311453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48772 (= res!331741 (validMask!0 mask!3216))))

(assert (=> start!48772 e!311453))

(assert (=> start!48772 true))

(declare-fun array_inv!12127 (array!33984) Bool)

(assert (=> start!48772 (array_inv!12127 a!3154)))

(declare-fun b!536545 () Bool)

(declare-fun res!331742 () Bool)

(assert (=> b!536545 (=> (not res!331742) (not e!311453))))

(assert (=> b!536545 (= res!331742 (validKeyInArray!0 (select (arr!16331 a!3154) j!147)))))

(declare-fun b!536546 () Bool)

(assert (=> b!536546 (= e!311454 false)))

(declare-fun lt!246127 () SeekEntryResult!4789)

(assert (=> b!536546 (= lt!246127 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246124 (select (arr!16331 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48772 res!331741) b!536542))

(assert (= (and b!536542 res!331751) b!536545))

(assert (= (and b!536545 res!331742) b!536538))

(assert (= (and b!536538 res!331745) b!536535))

(assert (= (and b!536535 res!331750) b!536539))

(assert (= (and b!536539 res!331740) b!536537))

(assert (= (and b!536537 res!331746) b!536540))

(assert (= (and b!536540 res!331739) b!536541))

(assert (= (and b!536541 res!331747) b!536536))

(assert (= (and b!536536 res!331743) b!536543))

(assert (= (and b!536543 res!331749) b!536544))

(assert (= (and b!536544 res!331748) b!536534))

(assert (= (and b!536534 res!331744) b!536546))

(declare-fun m!515929 () Bool)

(assert (=> b!536544 m!515929))

(declare-fun m!515931 () Bool)

(assert (=> b!536544 m!515931))

(assert (=> b!536543 m!515931))

(assert (=> b!536543 m!515931))

(declare-fun m!515933 () Bool)

(assert (=> b!536543 m!515933))

(assert (=> b!536543 m!515933))

(assert (=> b!536543 m!515931))

(declare-fun m!515935 () Bool)

(assert (=> b!536543 m!515935))

(declare-fun m!515937 () Bool)

(assert (=> b!536537 m!515937))

(declare-fun m!515939 () Bool)

(assert (=> start!48772 m!515939))

(declare-fun m!515941 () Bool)

(assert (=> start!48772 m!515941))

(declare-fun m!515943 () Bool)

(assert (=> b!536535 m!515943))

(declare-fun m!515945 () Bool)

(assert (=> b!536540 m!515945))

(assert (=> b!536546 m!515931))

(assert (=> b!536546 m!515931))

(declare-fun m!515947 () Bool)

(assert (=> b!536546 m!515947))

(declare-fun m!515949 () Bool)

(assert (=> b!536538 m!515949))

(assert (=> b!536545 m!515931))

(assert (=> b!536545 m!515931))

(declare-fun m!515951 () Bool)

(assert (=> b!536545 m!515951))

(assert (=> b!536536 m!515931))

(assert (=> b!536536 m!515931))

(declare-fun m!515953 () Bool)

(assert (=> b!536536 m!515953))

(declare-fun m!515955 () Bool)

(assert (=> b!536541 m!515955))

(assert (=> b!536541 m!515931))

(declare-fun m!515957 () Bool)

(assert (=> b!536534 m!515957))

(declare-fun m!515959 () Bool)

(assert (=> b!536539 m!515959))

(push 1)

(assert (not b!536545))

(assert (not b!536537))

(assert (not b!536536))

(assert (not b!536535))

(assert (not b!536546))

(assert (not b!536539))

(assert (not b!536540))

(assert (not b!536534))

