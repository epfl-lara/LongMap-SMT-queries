; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48876 () Bool)

(assert start!48876)

(declare-fun b!538562 () Bool)

(declare-fun res!333770 () Bool)

(declare-fun e!312290 () Bool)

(assert (=> b!538562 (=> (not res!333770) (not e!312290))))

(declare-datatypes ((array!34088 0))(
  ( (array!34089 (arr!16383 (Array (_ BitVec 32) (_ BitVec 64))) (size!16747 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34088)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538562 (= res!333770 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538563 () Bool)

(declare-fun res!333769 () Bool)

(assert (=> b!538563 (=> (not res!333769) (not e!312290))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538563 (= res!333769 (validKeyInArray!0 (select (arr!16383 a!3154) j!147)))))

(declare-fun b!538564 () Bool)

(declare-fun e!312289 () Bool)

(assert (=> b!538564 (= e!312290 e!312289)))

(declare-fun res!333772 () Bool)

(assert (=> b!538564 (=> (not res!333772) (not e!312289))))

(declare-datatypes ((SeekEntryResult!4841 0))(
  ( (MissingZero!4841 (index!21588 (_ BitVec 32))) (Found!4841 (index!21589 (_ BitVec 32))) (Intermediate!4841 (undefined!5653 Bool) (index!21590 (_ BitVec 32)) (x!50512 (_ BitVec 32))) (Undefined!4841) (MissingVacant!4841 (index!21591 (_ BitVec 32))) )
))
(declare-fun lt!246836 () SeekEntryResult!4841)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538564 (= res!333772 (or (= lt!246836 (MissingZero!4841 i!1153)) (= lt!246836 (MissingVacant!4841 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34088 (_ BitVec 32)) SeekEntryResult!4841)

(assert (=> b!538564 (= lt!246836 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538565 () Bool)

(declare-fun res!333774 () Bool)

(assert (=> b!538565 (=> (not res!333774) (not e!312290))))

(assert (=> b!538565 (= res!333774 (validKeyInArray!0 k!1998))))

(declare-fun b!538566 () Bool)

(declare-fun e!312293 () Bool)

(declare-fun e!312292 () Bool)

(assert (=> b!538566 (= e!312293 e!312292)))

(declare-fun res!333773 () Bool)

(assert (=> b!538566 (=> (not res!333773) (not e!312292))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!246835 () SeekEntryResult!4841)

(declare-fun lt!246837 () SeekEntryResult!4841)

(assert (=> b!538566 (= res!333773 (and (= lt!246835 lt!246837) (not (= (select (arr!16383 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16383 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16383 a!3154) index!1177) (select (arr!16383 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34088 (_ BitVec 32)) SeekEntryResult!4841)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538566 (= lt!246835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16383 a!3154) j!147) mask!3216) (select (arr!16383 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538567 () Bool)

(declare-fun e!312288 () Bool)

(assert (=> b!538567 (= e!312288 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246839 () SeekEntryResult!4841)

(declare-fun lt!246840 () (_ BitVec 32))

(assert (=> b!538567 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246840 (select (store (arr!16383 a!3154) i!1153 k!1998) j!147) (array!34089 (store (arr!16383 a!3154) i!1153 k!1998) (size!16747 a!3154)) mask!3216) lt!246839)))

(declare-datatypes ((Unit!16866 0))(
  ( (Unit!16867) )
))
(declare-fun lt!246841 () Unit!16866)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34088 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16866)

(assert (=> b!538567 (= lt!246841 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246840 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538568 () Bool)

(declare-fun e!312294 () Bool)

(assert (=> b!538568 (= e!312294 e!312288)))

(declare-fun res!333777 () Bool)

(assert (=> b!538568 (=> (not res!333777) (not e!312288))))

(declare-fun lt!246838 () SeekEntryResult!4841)

(assert (=> b!538568 (= res!333777 (and (= lt!246838 lt!246839) (= lt!246835 lt!246838)))))

(assert (=> b!538568 (= lt!246838 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246840 (select (arr!16383 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538570 () Bool)

(declare-fun res!333778 () Bool)

(assert (=> b!538570 (=> (not res!333778) (not e!312289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34088 (_ BitVec 32)) Bool)

(assert (=> b!538570 (= res!333778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538571 () Bool)

(declare-fun res!333771 () Bool)

(assert (=> b!538571 (=> (not res!333771) (not e!312289))))

(declare-datatypes ((List!10502 0))(
  ( (Nil!10499) (Cons!10498 (h!11441 (_ BitVec 64)) (t!16730 List!10502)) )
))
(declare-fun arrayNoDuplicates!0 (array!34088 (_ BitVec 32) List!10502) Bool)

(assert (=> b!538571 (= res!333771 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10499))))

(declare-fun b!538572 () Bool)

(assert (=> b!538572 (= e!312289 e!312293)))

(declare-fun res!333768 () Bool)

(assert (=> b!538572 (=> (not res!333768) (not e!312293))))

(assert (=> b!538572 (= res!333768 (= lt!246837 lt!246839))))

(assert (=> b!538572 (= lt!246839 (Intermediate!4841 false resIndex!32 resX!32))))

(assert (=> b!538572 (= lt!246837 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16383 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333767 () Bool)

(assert (=> start!48876 (=> (not res!333767) (not e!312290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48876 (= res!333767 (validMask!0 mask!3216))))

(assert (=> start!48876 e!312290))

(assert (=> start!48876 true))

(declare-fun array_inv!12179 (array!34088) Bool)

(assert (=> start!48876 (array_inv!12179 a!3154)))

(declare-fun b!538569 () Bool)

(assert (=> b!538569 (= e!312292 e!312294)))

(declare-fun res!333775 () Bool)

(assert (=> b!538569 (=> (not res!333775) (not e!312294))))

(assert (=> b!538569 (= res!333775 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246840 #b00000000000000000000000000000000) (bvslt lt!246840 (size!16747 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538569 (= lt!246840 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538573 () Bool)

(declare-fun res!333776 () Bool)

(assert (=> b!538573 (=> (not res!333776) (not e!312290))))

(assert (=> b!538573 (= res!333776 (and (= (size!16747 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16747 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16747 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538574 () Bool)

(declare-fun res!333779 () Bool)

(assert (=> b!538574 (=> (not res!333779) (not e!312289))))

(assert (=> b!538574 (= res!333779 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16747 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16747 a!3154)) (= (select (arr!16383 a!3154) resIndex!32) (select (arr!16383 a!3154) j!147))))))

(assert (= (and start!48876 res!333767) b!538573))

(assert (= (and b!538573 res!333776) b!538563))

(assert (= (and b!538563 res!333769) b!538565))

(assert (= (and b!538565 res!333774) b!538562))

(assert (= (and b!538562 res!333770) b!538564))

(assert (= (and b!538564 res!333772) b!538570))

(assert (= (and b!538570 res!333778) b!538571))

(assert (= (and b!538571 res!333771) b!538574))

(assert (= (and b!538574 res!333779) b!538572))

(assert (= (and b!538572 res!333768) b!538566))

(assert (= (and b!538566 res!333773) b!538569))

(assert (= (and b!538569 res!333775) b!538568))

(assert (= (and b!538568 res!333777) b!538567))

(declare-fun m!517665 () Bool)

(assert (=> b!538572 m!517665))

(assert (=> b!538572 m!517665))

(declare-fun m!517667 () Bool)

(assert (=> b!538572 m!517667))

(declare-fun m!517669 () Bool)

(assert (=> b!538574 m!517669))

(assert (=> b!538574 m!517665))

(declare-fun m!517671 () Bool)

(assert (=> b!538569 m!517671))

(declare-fun m!517673 () Bool)

(assert (=> b!538562 m!517673))

(assert (=> b!538563 m!517665))

(assert (=> b!538563 m!517665))

(declare-fun m!517675 () Bool)

(assert (=> b!538563 m!517675))

(declare-fun m!517677 () Bool)

(assert (=> b!538567 m!517677))

(declare-fun m!517679 () Bool)

(assert (=> b!538567 m!517679))

(assert (=> b!538567 m!517679))

(declare-fun m!517681 () Bool)

(assert (=> b!538567 m!517681))

(declare-fun m!517683 () Bool)

(assert (=> b!538567 m!517683))

(declare-fun m!517685 () Bool)

(assert (=> start!48876 m!517685))

(declare-fun m!517687 () Bool)

(assert (=> start!48876 m!517687))

(declare-fun m!517689 () Bool)

(assert (=> b!538565 m!517689))

(declare-fun m!517691 () Bool)

(assert (=> b!538570 m!517691))

(assert (=> b!538568 m!517665))

(assert (=> b!538568 m!517665))

(declare-fun m!517693 () Bool)

(assert (=> b!538568 m!517693))

(declare-fun m!517695 () Bool)

(assert (=> b!538566 m!517695))

(assert (=> b!538566 m!517665))

(assert (=> b!538566 m!517665))

(declare-fun m!517697 () Bool)

(assert (=> b!538566 m!517697))

(assert (=> b!538566 m!517697))

(assert (=> b!538566 m!517665))

(declare-fun m!517699 () Bool)

(assert (=> b!538566 m!517699))

(declare-fun m!517701 () Bool)

(assert (=> b!538564 m!517701))

(declare-fun m!517703 () Bool)

(assert (=> b!538571 m!517703))

(push 1)

(assert (not b!538566))

(assert (not b!538572))

(assert (not b!538562))

(assert (not b!538564))

(assert (not b!538571))

(assert (not b!538567))

(assert (not b!538565))

(assert (not b!538569))

(assert (not b!538563))

(assert (not b!538568))

(assert (not start!48876))

(assert (not b!538570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

