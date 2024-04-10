; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69552 () Bool)

(assert start!69552)

(declare-fun b!810560 () Bool)

(declare-fun e!448664 () Bool)

(declare-fun e!448662 () Bool)

(assert (=> b!810560 (= e!448664 e!448662)))

(declare-fun res!553843 () Bool)

(assert (=> b!810560 (=> (not res!553843) (not e!448662))))

(declare-fun lt!363305 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!44048 0))(
  ( (array!44049 (arr!21095 (Array (_ BitVec 32) (_ BitVec 64))) (size!21516 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44048)

(assert (=> b!810560 (= res!553843 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363305 #b00000000000000000000000000000000) (bvslt lt!363305 (size!21516 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810560 (= lt!363305 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810561 () Bool)

(declare-fun res!553848 () Bool)

(declare-fun e!448663 () Bool)

(assert (=> b!810561 (=> (not res!553848) (not e!448663))))

(declare-datatypes ((List!15058 0))(
  ( (Nil!15055) (Cons!15054 (h!16183 (_ BitVec 64)) (t!21373 List!15058)) )
))
(declare-fun arrayNoDuplicates!0 (array!44048 (_ BitVec 32) List!15058) Bool)

(assert (=> b!810561 (= res!553848 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15055))))

(declare-fun b!810562 () Bool)

(declare-fun res!553841 () Bool)

(declare-fun e!448665 () Bool)

(assert (=> b!810562 (=> (not res!553841) (not e!448665))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810562 (= res!553841 (validKeyInArray!0 k!2044))))

(declare-fun b!810563 () Bool)

(declare-fun res!553849 () Bool)

(assert (=> b!810563 (=> (not res!553849) (not e!448665))))

(declare-fun arrayContainsKey!0 (array!44048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810563 (= res!553849 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810564 () Bool)

(declare-fun res!553850 () Bool)

(assert (=> b!810564 (=> (not res!553850) (not e!448665))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810564 (= res!553850 (and (= (size!21516 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21516 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21516 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810565 () Bool)

(assert (=> b!810565 (= e!448665 e!448663)))

(declare-fun res!553844 () Bool)

(assert (=> b!810565 (=> (not res!553844) (not e!448663))))

(declare-datatypes ((SeekEntryResult!8686 0))(
  ( (MissingZero!8686 (index!37112 (_ BitVec 32))) (Found!8686 (index!37113 (_ BitVec 32))) (Intermediate!8686 (undefined!9498 Bool) (index!37114 (_ BitVec 32)) (x!67922 (_ BitVec 32))) (Undefined!8686) (MissingVacant!8686 (index!37115 (_ BitVec 32))) )
))
(declare-fun lt!363298 () SeekEntryResult!8686)

(assert (=> b!810565 (= res!553844 (or (= lt!363298 (MissingZero!8686 i!1163)) (= lt!363298 (MissingVacant!8686 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44048 (_ BitVec 32)) SeekEntryResult!8686)

(assert (=> b!810565 (= lt!363298 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810566 () Bool)

(declare-fun res!553839 () Bool)

(assert (=> b!810566 (=> (not res!553839) (not e!448663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44048 (_ BitVec 32)) Bool)

(assert (=> b!810566 (= res!553839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810567 () Bool)

(declare-fun res!553837 () Bool)

(assert (=> b!810567 (=> (not res!553837) (not e!448662))))

(declare-fun lt!363300 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363301 () SeekEntryResult!8686)

(declare-fun lt!363303 () array!44048)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44048 (_ BitVec 32)) SeekEntryResult!8686)

(assert (=> b!810567 (= res!553837 (= lt!363301 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363305 vacantAfter!23 lt!363300 lt!363303 mask!3266)))))

(declare-fun b!810569 () Bool)

(declare-fun e!448666 () Bool)

(assert (=> b!810569 (= e!448666 e!448664)))

(declare-fun res!553846 () Bool)

(assert (=> b!810569 (=> (not res!553846) (not e!448664))))

(declare-fun lt!363297 () SeekEntryResult!8686)

(declare-fun lt!363299 () SeekEntryResult!8686)

(assert (=> b!810569 (= res!553846 (and (= lt!363297 lt!363299) (not (= (select (arr!21095 a!3170) index!1236) (select (arr!21095 a!3170) j!153)))))))

(assert (=> b!810569 (= lt!363299 (Found!8686 j!153))))

(declare-fun b!810570 () Bool)

(declare-fun e!448667 () Bool)

(assert (=> b!810570 (= e!448667 e!448666)))

(declare-fun res!553840 () Bool)

(assert (=> b!810570 (=> (not res!553840) (not e!448666))))

(declare-fun lt!363304 () SeekEntryResult!8686)

(assert (=> b!810570 (= res!553840 (= lt!363304 lt!363297))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810570 (= lt!363297 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21095 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810570 (= lt!363304 (seekEntryOrOpen!0 (select (arr!21095 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810571 () Bool)

(declare-fun res!553838 () Bool)

(assert (=> b!810571 (=> (not res!553838) (not e!448665))))

(assert (=> b!810571 (= res!553838 (validKeyInArray!0 (select (arr!21095 a!3170) j!153)))))

(declare-fun b!810572 () Bool)

(assert (=> b!810572 (= e!448663 e!448667)))

(declare-fun res!553847 () Bool)

(assert (=> b!810572 (=> (not res!553847) (not e!448667))))

(assert (=> b!810572 (= res!553847 (= lt!363301 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363300 lt!363303 mask!3266)))))

(assert (=> b!810572 (= lt!363301 (seekEntryOrOpen!0 lt!363300 lt!363303 mask!3266))))

(assert (=> b!810572 (= lt!363300 (select (store (arr!21095 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810572 (= lt!363303 (array!44049 (store (arr!21095 a!3170) i!1163 k!2044) (size!21516 a!3170)))))

(declare-fun lt!363302 () SeekEntryResult!8686)

(declare-fun b!810573 () Bool)

(assert (=> b!810573 (= e!448662 (and (= lt!363304 lt!363302) (= lt!363302 lt!363299) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1077)) (bvsub #b01111111111111111111111111111110 x!1077))))))

(assert (=> b!810573 (= lt!363302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363305 vacantBefore!23 (select (arr!21095 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810568 () Bool)

(declare-fun res!553842 () Bool)

(assert (=> b!810568 (=> (not res!553842) (not e!448663))))

(assert (=> b!810568 (= res!553842 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21516 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21095 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21516 a!3170)) (= (select (arr!21095 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!553845 () Bool)

(assert (=> start!69552 (=> (not res!553845) (not e!448665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69552 (= res!553845 (validMask!0 mask!3266))))

(assert (=> start!69552 e!448665))

(assert (=> start!69552 true))

(declare-fun array_inv!16891 (array!44048) Bool)

(assert (=> start!69552 (array_inv!16891 a!3170)))

(assert (= (and start!69552 res!553845) b!810564))

(assert (= (and b!810564 res!553850) b!810571))

(assert (= (and b!810571 res!553838) b!810562))

(assert (= (and b!810562 res!553841) b!810563))

(assert (= (and b!810563 res!553849) b!810565))

(assert (= (and b!810565 res!553844) b!810566))

(assert (= (and b!810566 res!553839) b!810561))

(assert (= (and b!810561 res!553848) b!810568))

(assert (= (and b!810568 res!553842) b!810572))

(assert (= (and b!810572 res!553847) b!810570))

(assert (= (and b!810570 res!553840) b!810569))

(assert (= (and b!810569 res!553846) b!810560))

(assert (= (and b!810560 res!553843) b!810567))

(assert (= (and b!810567 res!553837) b!810573))

(declare-fun m!752747 () Bool)

(assert (=> b!810563 m!752747))

(declare-fun m!752749 () Bool)

(assert (=> b!810561 m!752749))

(declare-fun m!752751 () Bool)

(assert (=> b!810567 m!752751))

(declare-fun m!752753 () Bool)

(assert (=> b!810571 m!752753))

(assert (=> b!810571 m!752753))

(declare-fun m!752755 () Bool)

(assert (=> b!810571 m!752755))

(declare-fun m!752757 () Bool)

(assert (=> b!810565 m!752757))

(declare-fun m!752759 () Bool)

(assert (=> b!810562 m!752759))

(assert (=> b!810573 m!752753))

(assert (=> b!810573 m!752753))

(declare-fun m!752761 () Bool)

(assert (=> b!810573 m!752761))

(declare-fun m!752763 () Bool)

(assert (=> b!810566 m!752763))

(declare-fun m!752765 () Bool)

(assert (=> b!810569 m!752765))

(assert (=> b!810569 m!752753))

(assert (=> b!810570 m!752753))

(assert (=> b!810570 m!752753))

(declare-fun m!752767 () Bool)

(assert (=> b!810570 m!752767))

(assert (=> b!810570 m!752753))

(declare-fun m!752769 () Bool)

(assert (=> b!810570 m!752769))

(declare-fun m!752771 () Bool)

(assert (=> b!810572 m!752771))

(declare-fun m!752773 () Bool)

(assert (=> b!810572 m!752773))

(declare-fun m!752775 () Bool)

(assert (=> b!810572 m!752775))

(declare-fun m!752777 () Bool)

(assert (=> b!810572 m!752777))

(declare-fun m!752779 () Bool)

(assert (=> b!810560 m!752779))

(declare-fun m!752781 () Bool)

(assert (=> b!810568 m!752781))

(declare-fun m!752783 () Bool)

(assert (=> b!810568 m!752783))

(declare-fun m!752785 () Bool)

(assert (=> start!69552 m!752785))

(declare-fun m!752787 () Bool)

(assert (=> start!69552 m!752787))

(push 1)

(assert (not b!810565))

(assert (not b!810566))

(assert (not b!810561))

(assert (not b!810570))

(assert (not b!810567))

(assert (not b!810572))

(assert (not b!810563))

(assert (not b!810571))

(assert (not start!69552))

(assert (not b!810573))

(assert (not b!810560))

(assert (not b!810562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

