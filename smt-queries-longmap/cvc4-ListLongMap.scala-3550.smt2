; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48874 () Bool)

(assert start!48874)

(declare-fun b!538523 () Bool)

(declare-fun e!312272 () Bool)

(declare-fun e!312267 () Bool)

(assert (=> b!538523 (= e!312272 e!312267)))

(declare-fun res!333729 () Bool)

(assert (=> b!538523 (=> (not res!333729) (not e!312267))))

(declare-datatypes ((SeekEntryResult!4840 0))(
  ( (MissingZero!4840 (index!21584 (_ BitVec 32))) (Found!4840 (index!21585 (_ BitVec 32))) (Intermediate!4840 (undefined!5652 Bool) (index!21586 (_ BitVec 32)) (x!50503 (_ BitVec 32))) (Undefined!4840) (MissingVacant!4840 (index!21587 (_ BitVec 32))) )
))
(declare-fun lt!246817 () SeekEntryResult!4840)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538523 (= res!333729 (or (= lt!246817 (MissingZero!4840 i!1153)) (= lt!246817 (MissingVacant!4840 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34086 0))(
  ( (array!34087 (arr!16382 (Array (_ BitVec 32) (_ BitVec 64))) (size!16746 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34086)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34086 (_ BitVec 32)) SeekEntryResult!4840)

(assert (=> b!538523 (= lt!246817 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!333736 () Bool)

(assert (=> start!48874 (=> (not res!333736) (not e!312272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48874 (= res!333736 (validMask!0 mask!3216))))

(assert (=> start!48874 e!312272))

(assert (=> start!48874 true))

(declare-fun array_inv!12178 (array!34086) Bool)

(assert (=> start!48874 (array_inv!12178 a!3154)))

(declare-fun b!538524 () Bool)

(declare-fun res!333730 () Bool)

(assert (=> b!538524 (=> (not res!333730) (not e!312272))))

(declare-fun arrayContainsKey!0 (array!34086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538524 (= res!333730 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538525 () Bool)

(declare-fun e!312270 () Bool)

(assert (=> b!538525 (= e!312270 (not true))))

(declare-fun lt!246816 () SeekEntryResult!4840)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!246820 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34086 (_ BitVec 32)) SeekEntryResult!4840)

(assert (=> b!538525 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246820 (select (store (arr!16382 a!3154) i!1153 k!1998) j!147) (array!34087 (store (arr!16382 a!3154) i!1153 k!1998) (size!16746 a!3154)) mask!3216) lt!246816)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16864 0))(
  ( (Unit!16865) )
))
(declare-fun lt!246818 () Unit!16864)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34086 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16864)

(assert (=> b!538525 (= lt!246818 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246820 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538526 () Bool)

(declare-fun e!312273 () Bool)

(declare-fun e!312268 () Bool)

(assert (=> b!538526 (= e!312273 e!312268)))

(declare-fun res!333739 () Bool)

(assert (=> b!538526 (=> (not res!333739) (not e!312268))))

(assert (=> b!538526 (= res!333739 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246820 #b00000000000000000000000000000000) (bvslt lt!246820 (size!16746 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538526 (= lt!246820 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538527 () Bool)

(declare-fun res!333731 () Bool)

(assert (=> b!538527 (=> (not res!333731) (not e!312267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34086 (_ BitVec 32)) Bool)

(assert (=> b!538527 (= res!333731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538528 () Bool)

(declare-fun res!333734 () Bool)

(assert (=> b!538528 (=> (not res!333734) (not e!312272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538528 (= res!333734 (validKeyInArray!0 (select (arr!16382 a!3154) j!147)))))

(declare-fun b!538529 () Bool)

(declare-fun res!333738 () Bool)

(assert (=> b!538529 (=> (not res!333738) (not e!312272))))

(assert (=> b!538529 (= res!333738 (and (= (size!16746 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16746 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16746 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538530 () Bool)

(declare-fun res!333735 () Bool)

(assert (=> b!538530 (=> (not res!333735) (not e!312267))))

(declare-datatypes ((List!10501 0))(
  ( (Nil!10498) (Cons!10497 (h!11440 (_ BitVec 64)) (t!16729 List!10501)) )
))
(declare-fun arrayNoDuplicates!0 (array!34086 (_ BitVec 32) List!10501) Bool)

(assert (=> b!538530 (= res!333735 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10498))))

(declare-fun b!538531 () Bool)

(declare-fun e!312269 () Bool)

(assert (=> b!538531 (= e!312269 e!312273)))

(declare-fun res!333740 () Bool)

(assert (=> b!538531 (=> (not res!333740) (not e!312273))))

(declare-fun lt!246819 () SeekEntryResult!4840)

(declare-fun lt!246814 () SeekEntryResult!4840)

(assert (=> b!538531 (= res!333740 (and (= lt!246814 lt!246819) (not (= (select (arr!16382 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16382 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16382 a!3154) index!1177) (select (arr!16382 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538531 (= lt!246814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16382 a!3154) j!147) mask!3216) (select (arr!16382 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538532 () Bool)

(declare-fun res!333732 () Bool)

(assert (=> b!538532 (=> (not res!333732) (not e!312272))))

(assert (=> b!538532 (= res!333732 (validKeyInArray!0 k!1998))))

(declare-fun b!538533 () Bool)

(assert (=> b!538533 (= e!312267 e!312269)))

(declare-fun res!333728 () Bool)

(assert (=> b!538533 (=> (not res!333728) (not e!312269))))

(assert (=> b!538533 (= res!333728 (= lt!246819 lt!246816))))

(assert (=> b!538533 (= lt!246816 (Intermediate!4840 false resIndex!32 resX!32))))

(assert (=> b!538533 (= lt!246819 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16382 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538534 () Bool)

(assert (=> b!538534 (= e!312268 e!312270)))

(declare-fun res!333733 () Bool)

(assert (=> b!538534 (=> (not res!333733) (not e!312270))))

(declare-fun lt!246815 () SeekEntryResult!4840)

(assert (=> b!538534 (= res!333733 (and (= lt!246815 lt!246816) (= lt!246814 lt!246815)))))

(assert (=> b!538534 (= lt!246815 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246820 (select (arr!16382 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538535 () Bool)

(declare-fun res!333737 () Bool)

(assert (=> b!538535 (=> (not res!333737) (not e!312267))))

(assert (=> b!538535 (= res!333737 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16746 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16746 a!3154)) (= (select (arr!16382 a!3154) resIndex!32) (select (arr!16382 a!3154) j!147))))))

(assert (= (and start!48874 res!333736) b!538529))

(assert (= (and b!538529 res!333738) b!538528))

(assert (= (and b!538528 res!333734) b!538532))

(assert (= (and b!538532 res!333732) b!538524))

(assert (= (and b!538524 res!333730) b!538523))

(assert (= (and b!538523 res!333729) b!538527))

(assert (= (and b!538527 res!333731) b!538530))

(assert (= (and b!538530 res!333735) b!538535))

(assert (= (and b!538535 res!333737) b!538533))

(assert (= (and b!538533 res!333728) b!538531))

(assert (= (and b!538531 res!333740) b!538526))

(assert (= (and b!538526 res!333739) b!538534))

(assert (= (and b!538534 res!333733) b!538525))

(declare-fun m!517625 () Bool)

(assert (=> b!538535 m!517625))

(declare-fun m!517627 () Bool)

(assert (=> b!538535 m!517627))

(declare-fun m!517629 () Bool)

(assert (=> b!538526 m!517629))

(declare-fun m!517631 () Bool)

(assert (=> b!538524 m!517631))

(declare-fun m!517633 () Bool)

(assert (=> b!538530 m!517633))

(declare-fun m!517635 () Bool)

(assert (=> b!538523 m!517635))

(declare-fun m!517637 () Bool)

(assert (=> b!538525 m!517637))

(declare-fun m!517639 () Bool)

(assert (=> b!538525 m!517639))

(assert (=> b!538525 m!517639))

(declare-fun m!517641 () Bool)

(assert (=> b!538525 m!517641))

(declare-fun m!517643 () Bool)

(assert (=> b!538525 m!517643))

(declare-fun m!517645 () Bool)

(assert (=> b!538531 m!517645))

(assert (=> b!538531 m!517627))

(assert (=> b!538531 m!517627))

(declare-fun m!517647 () Bool)

(assert (=> b!538531 m!517647))

(assert (=> b!538531 m!517647))

(assert (=> b!538531 m!517627))

(declare-fun m!517649 () Bool)

(assert (=> b!538531 m!517649))

(declare-fun m!517651 () Bool)

(assert (=> start!48874 m!517651))

(declare-fun m!517653 () Bool)

(assert (=> start!48874 m!517653))

(declare-fun m!517655 () Bool)

(assert (=> b!538527 m!517655))

(declare-fun m!517657 () Bool)

(assert (=> b!538532 m!517657))

(assert (=> b!538533 m!517627))

(assert (=> b!538533 m!517627))

(declare-fun m!517659 () Bool)

(assert (=> b!538533 m!517659))

(assert (=> b!538534 m!517627))

(assert (=> b!538534 m!517627))

(declare-fun m!517661 () Bool)

(assert (=> b!538534 m!517661))

(assert (=> b!538528 m!517627))

(assert (=> b!538528 m!517627))

(declare-fun m!517663 () Bool)

(assert (=> b!538528 m!517663))

(push 1)

(assert (not b!538527))

(assert (not b!538524))

