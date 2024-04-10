; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49602 () Bool)

(assert start!49602)

(declare-fun b!545693 () Bool)

(declare-fun res!339628 () Bool)

(declare-fun e!315413 () Bool)

(assert (=> b!545693 (=> (not res!339628) (not e!315413))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545693 (= res!339628 (validKeyInArray!0 k!1998))))

(declare-fun b!545694 () Bool)

(declare-fun res!339625 () Bool)

(declare-fun e!315408 () Bool)

(assert (=> b!545694 (=> (not res!339625) (not e!315408))))

(declare-datatypes ((array!34415 0))(
  ( (array!34416 (arr!16536 (Array (_ BitVec 32) (_ BitVec 64))) (size!16900 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34415)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34415 (_ BitVec 32)) Bool)

(assert (=> b!545694 (= res!339625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545695 () Bool)

(declare-fun e!315412 () Bool)

(assert (=> b!545695 (= e!315412 (not true))))

(declare-fun lt!248951 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4994 0))(
  ( (MissingZero!4994 (index!22200 (_ BitVec 32))) (Found!4994 (index!22201 (_ BitVec 32))) (Intermediate!4994 (undefined!5806 Bool) (index!22202 (_ BitVec 32)) (x!51130 (_ BitVec 32))) (Undefined!4994) (MissingVacant!4994 (index!22203 (_ BitVec 32))) )
))
(declare-fun lt!248952 () SeekEntryResult!4994)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34415 (_ BitVec 32)) SeekEntryResult!4994)

(assert (=> b!545695 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248951 (select (store (arr!16536 a!3154) i!1153 k!1998) j!147) (array!34416 (store (arr!16536 a!3154) i!1153 k!1998) (size!16900 a!3154)) mask!3216) lt!248952)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16922 0))(
  ( (Unit!16923) )
))
(declare-fun lt!248953 () Unit!16922)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34415 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16922)

(assert (=> b!545695 (= lt!248953 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!248951 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545696 () Bool)

(declare-fun e!315414 () Bool)

(declare-fun e!315410 () Bool)

(assert (=> b!545696 (= e!315414 e!315410)))

(declare-fun res!339620 () Bool)

(assert (=> b!545696 (=> (not res!339620) (not e!315410))))

(assert (=> b!545696 (= res!339620 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248951 #b00000000000000000000000000000000) (bvslt lt!248951 (size!16900 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545696 (= lt!248951 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545697 () Bool)

(declare-fun e!315411 () Bool)

(assert (=> b!545697 (= e!315408 e!315411)))

(declare-fun res!339624 () Bool)

(assert (=> b!545697 (=> (not res!339624) (not e!315411))))

(declare-fun lt!248956 () SeekEntryResult!4994)

(assert (=> b!545697 (= res!339624 (= lt!248956 lt!248952))))

(assert (=> b!545697 (= lt!248952 (Intermediate!4994 false resIndex!32 resX!32))))

(assert (=> b!545697 (= lt!248956 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16536 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545698 () Bool)

(assert (=> b!545698 (= e!315413 e!315408)))

(declare-fun res!339622 () Bool)

(assert (=> b!545698 (=> (not res!339622) (not e!315408))))

(declare-fun lt!248954 () SeekEntryResult!4994)

(assert (=> b!545698 (= res!339622 (or (= lt!248954 (MissingZero!4994 i!1153)) (= lt!248954 (MissingVacant!4994 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34415 (_ BitVec 32)) SeekEntryResult!4994)

(assert (=> b!545698 (= lt!248954 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!339630 () Bool)

(assert (=> start!49602 (=> (not res!339630) (not e!315413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49602 (= res!339630 (validMask!0 mask!3216))))

(assert (=> start!49602 e!315413))

(assert (=> start!49602 true))

(declare-fun array_inv!12332 (array!34415) Bool)

(assert (=> start!49602 (array_inv!12332 a!3154)))

(declare-fun b!545699 () Bool)

(declare-fun res!339623 () Bool)

(assert (=> b!545699 (=> (not res!339623) (not e!315408))))

(declare-datatypes ((List!10655 0))(
  ( (Nil!10652) (Cons!10651 (h!11615 (_ BitVec 64)) (t!16883 List!10655)) )
))
(declare-fun arrayNoDuplicates!0 (array!34415 (_ BitVec 32) List!10655) Bool)

(assert (=> b!545699 (= res!339623 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10652))))

(declare-fun b!545700 () Bool)

(assert (=> b!545700 (= e!315410 e!315412)))

(declare-fun res!339632 () Bool)

(assert (=> b!545700 (=> (not res!339632) (not e!315412))))

(declare-fun lt!248950 () SeekEntryResult!4994)

(declare-fun lt!248955 () SeekEntryResult!4994)

(assert (=> b!545700 (= res!339632 (and (= lt!248950 lt!248952) (= lt!248955 lt!248950)))))

(assert (=> b!545700 (= lt!248950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248951 (select (arr!16536 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545701 () Bool)

(assert (=> b!545701 (= e!315411 e!315414)))

(declare-fun res!339629 () Bool)

(assert (=> b!545701 (=> (not res!339629) (not e!315414))))

(assert (=> b!545701 (= res!339629 (and (= lt!248955 lt!248956) (not (= (select (arr!16536 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16536 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16536 a!3154) index!1177) (select (arr!16536 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545701 (= lt!248955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16536 a!3154) j!147) mask!3216) (select (arr!16536 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545702 () Bool)

(declare-fun res!339631 () Bool)

(assert (=> b!545702 (=> (not res!339631) (not e!315413))))

(assert (=> b!545702 (= res!339631 (validKeyInArray!0 (select (arr!16536 a!3154) j!147)))))

(declare-fun b!545703 () Bool)

(declare-fun res!339626 () Bool)

(assert (=> b!545703 (=> (not res!339626) (not e!315413))))

(assert (=> b!545703 (= res!339626 (and (= (size!16900 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16900 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16900 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545704 () Bool)

(declare-fun res!339627 () Bool)

(assert (=> b!545704 (=> (not res!339627) (not e!315408))))

(assert (=> b!545704 (= res!339627 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16900 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16900 a!3154)) (= (select (arr!16536 a!3154) resIndex!32) (select (arr!16536 a!3154) j!147))))))

(declare-fun b!545705 () Bool)

(declare-fun res!339621 () Bool)

(assert (=> b!545705 (=> (not res!339621) (not e!315413))))

(declare-fun arrayContainsKey!0 (array!34415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545705 (= res!339621 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49602 res!339630) b!545703))

(assert (= (and b!545703 res!339626) b!545702))

(assert (= (and b!545702 res!339631) b!545693))

(assert (= (and b!545693 res!339628) b!545705))

(assert (= (and b!545705 res!339621) b!545698))

(assert (= (and b!545698 res!339622) b!545694))

(assert (= (and b!545694 res!339625) b!545699))

(assert (= (and b!545699 res!339623) b!545704))

(assert (= (and b!545704 res!339627) b!545697))

(assert (= (and b!545697 res!339624) b!545701))

(assert (= (and b!545701 res!339629) b!545696))

(assert (= (and b!545696 res!339620) b!545700))

(assert (= (and b!545700 res!339632) b!545695))

(declare-fun m!523233 () Bool)

(assert (=> b!545696 m!523233))

(declare-fun m!523235 () Bool)

(assert (=> b!545694 m!523235))

(declare-fun m!523237 () Bool)

(assert (=> b!545700 m!523237))

(assert (=> b!545700 m!523237))

(declare-fun m!523239 () Bool)

(assert (=> b!545700 m!523239))

(declare-fun m!523241 () Bool)

(assert (=> b!545693 m!523241))

(declare-fun m!523243 () Bool)

(assert (=> b!545701 m!523243))

(assert (=> b!545701 m!523237))

(assert (=> b!545701 m!523237))

(declare-fun m!523245 () Bool)

(assert (=> b!545701 m!523245))

(assert (=> b!545701 m!523245))

(assert (=> b!545701 m!523237))

(declare-fun m!523247 () Bool)

(assert (=> b!545701 m!523247))

(declare-fun m!523249 () Bool)

(assert (=> start!49602 m!523249))

(declare-fun m!523251 () Bool)

(assert (=> start!49602 m!523251))

(declare-fun m!523253 () Bool)

(assert (=> b!545704 m!523253))

(assert (=> b!545704 m!523237))

(assert (=> b!545702 m!523237))

(assert (=> b!545702 m!523237))

(declare-fun m!523255 () Bool)

(assert (=> b!545702 m!523255))

(assert (=> b!545697 m!523237))

(assert (=> b!545697 m!523237))

(declare-fun m!523257 () Bool)

(assert (=> b!545697 m!523257))

(declare-fun m!523259 () Bool)

(assert (=> b!545705 m!523259))

(declare-fun m!523261 () Bool)

(assert (=> b!545698 m!523261))

(declare-fun m!523263 () Bool)

(assert (=> b!545699 m!523263))

(declare-fun m!523265 () Bool)

(assert (=> b!545695 m!523265))

(declare-fun m!523267 () Bool)

(assert (=> b!545695 m!523267))

(assert (=> b!545695 m!523267))

(declare-fun m!523269 () Bool)

(assert (=> b!545695 m!523269))

(declare-fun m!523271 () Bool)

(assert (=> b!545695 m!523271))

(push 1)

(assert (not b!545693))

(assert (not b!545700))

(assert (not b!545694))

(assert (not b!545695))

(assert (not b!545702))

(assert (not b!545696))

(assert (not b!545697))

(assert (not b!545698))

(assert (not start!49602))

(assert (not b!545705))

(assert (not b!545699))

(assert (not b!545701))

(check-sat)

