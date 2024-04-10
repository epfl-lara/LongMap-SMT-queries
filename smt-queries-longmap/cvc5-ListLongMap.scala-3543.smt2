; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48828 () Bool)

(assert start!48828)

(declare-fun res!332842 () Bool)

(declare-fun e!311870 () Bool)

(assert (=> start!48828 (=> (not res!332842) (not e!311870))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48828 (= res!332842 (validMask!0 mask!3216))))

(assert (=> start!48828 e!311870))

(assert (=> start!48828 true))

(declare-datatypes ((array!34040 0))(
  ( (array!34041 (arr!16359 (Array (_ BitVec 32) (_ BitVec 64))) (size!16723 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34040)

(declare-fun array_inv!12155 (array!34040) Bool)

(assert (=> start!48828 (array_inv!12155 a!3154)))

(declare-fun b!537626 () Bool)

(declare-fun res!332843 () Bool)

(declare-fun e!311871 () Bool)

(assert (=> b!537626 (=> (not res!332843) (not e!311871))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537626 (= res!332843 (and (not (= (select (arr!16359 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16359 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16359 a!3154) index!1177) (select (arr!16359 a!3154) j!147)))))))

(declare-fun b!537627 () Bool)

(declare-fun res!332832 () Bool)

(declare-fun e!311874 () Bool)

(assert (=> b!537627 (=> (not res!332832) (not e!311874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34040 (_ BitVec 32)) Bool)

(assert (=> b!537627 (= res!332832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537628 () Bool)

(declare-fun res!332835 () Bool)

(assert (=> b!537628 (=> (not res!332835) (not e!311870))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537628 (= res!332835 (and (= (size!16723 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16723 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16723 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537629 () Bool)

(assert (=> b!537629 (= e!311870 e!311874)))

(declare-fun res!332831 () Bool)

(assert (=> b!537629 (=> (not res!332831) (not e!311874))))

(declare-datatypes ((SeekEntryResult!4817 0))(
  ( (MissingZero!4817 (index!21492 (_ BitVec 32))) (Found!4817 (index!21493 (_ BitVec 32))) (Intermediate!4817 (undefined!5629 Bool) (index!21494 (_ BitVec 32)) (x!50424 (_ BitVec 32))) (Undefined!4817) (MissingVacant!4817 (index!21495 (_ BitVec 32))) )
))
(declare-fun lt!246463 () SeekEntryResult!4817)

(assert (=> b!537629 (= res!332831 (or (= lt!246463 (MissingZero!4817 i!1153)) (= lt!246463 (MissingVacant!4817 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34040 (_ BitVec 32)) SeekEntryResult!4817)

(assert (=> b!537629 (= lt!246463 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537630 () Bool)

(declare-fun e!311873 () Bool)

(assert (=> b!537630 (= e!311873 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246462 () SeekEntryResult!4817)

(declare-fun lt!246460 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34040 (_ BitVec 32)) SeekEntryResult!4817)

(assert (=> b!537630 (= lt!246462 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246460 (select (arr!16359 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537631 () Bool)

(declare-fun res!332837 () Bool)

(assert (=> b!537631 (=> (not res!332837) (not e!311871))))

(declare-fun lt!246461 () SeekEntryResult!4817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537631 (= res!332837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16359 a!3154) j!147) mask!3216) (select (arr!16359 a!3154) j!147) a!3154 mask!3216) lt!246461))))

(declare-fun b!537632 () Bool)

(assert (=> b!537632 (= e!311871 e!311873)))

(declare-fun res!332838 () Bool)

(assert (=> b!537632 (=> (not res!332838) (not e!311873))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537632 (= res!332838 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246460 #b00000000000000000000000000000000) (bvslt lt!246460 (size!16723 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537632 (= lt!246460 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537633 () Bool)

(declare-fun res!332836 () Bool)

(assert (=> b!537633 (=> (not res!332836) (not e!311874))))

(declare-datatypes ((List!10478 0))(
  ( (Nil!10475) (Cons!10474 (h!11417 (_ BitVec 64)) (t!16706 List!10478)) )
))
(declare-fun arrayNoDuplicates!0 (array!34040 (_ BitVec 32) List!10478) Bool)

(assert (=> b!537633 (= res!332836 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10475))))

(declare-fun b!537634 () Bool)

(declare-fun res!332834 () Bool)

(assert (=> b!537634 (=> (not res!332834) (not e!311870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537634 (= res!332834 (validKeyInArray!0 k!1998))))

(declare-fun b!537635 () Bool)

(declare-fun res!332839 () Bool)

(assert (=> b!537635 (=> (not res!332839) (not e!311870))))

(declare-fun arrayContainsKey!0 (array!34040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537635 (= res!332839 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537636 () Bool)

(declare-fun res!332841 () Bool)

(assert (=> b!537636 (=> (not res!332841) (not e!311874))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537636 (= res!332841 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16723 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16723 a!3154)) (= (select (arr!16359 a!3154) resIndex!32) (select (arr!16359 a!3154) j!147))))))

(declare-fun b!537637 () Bool)

(declare-fun res!332833 () Bool)

(assert (=> b!537637 (=> (not res!332833) (not e!311870))))

(assert (=> b!537637 (= res!332833 (validKeyInArray!0 (select (arr!16359 a!3154) j!147)))))

(declare-fun b!537638 () Bool)

(assert (=> b!537638 (= e!311874 e!311871)))

(declare-fun res!332840 () Bool)

(assert (=> b!537638 (=> (not res!332840) (not e!311871))))

(assert (=> b!537638 (= res!332840 (= lt!246461 (Intermediate!4817 false resIndex!32 resX!32)))))

(assert (=> b!537638 (= lt!246461 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16359 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48828 res!332842) b!537628))

(assert (= (and b!537628 res!332835) b!537637))

(assert (= (and b!537637 res!332833) b!537634))

(assert (= (and b!537634 res!332834) b!537635))

(assert (= (and b!537635 res!332839) b!537629))

(assert (= (and b!537629 res!332831) b!537627))

(assert (= (and b!537627 res!332832) b!537633))

(assert (= (and b!537633 res!332836) b!537636))

(assert (= (and b!537636 res!332841) b!537638))

(assert (= (and b!537638 res!332840) b!537631))

(assert (= (and b!537631 res!332837) b!537626))

(assert (= (and b!537626 res!332843) b!537632))

(assert (= (and b!537632 res!332838) b!537630))

(declare-fun m!516825 () Bool)

(assert (=> b!537638 m!516825))

(assert (=> b!537638 m!516825))

(declare-fun m!516827 () Bool)

(assert (=> b!537638 m!516827))

(declare-fun m!516829 () Bool)

(assert (=> b!537629 m!516829))

(assert (=> b!537630 m!516825))

(assert (=> b!537630 m!516825))

(declare-fun m!516831 () Bool)

(assert (=> b!537630 m!516831))

(declare-fun m!516833 () Bool)

(assert (=> b!537635 m!516833))

(declare-fun m!516835 () Bool)

(assert (=> start!48828 m!516835))

(declare-fun m!516837 () Bool)

(assert (=> start!48828 m!516837))

(declare-fun m!516839 () Bool)

(assert (=> b!537627 m!516839))

(declare-fun m!516841 () Bool)

(assert (=> b!537634 m!516841))

(declare-fun m!516843 () Bool)

(assert (=> b!537636 m!516843))

(assert (=> b!537636 m!516825))

(assert (=> b!537631 m!516825))

(assert (=> b!537631 m!516825))

(declare-fun m!516845 () Bool)

(assert (=> b!537631 m!516845))

(assert (=> b!537631 m!516845))

(assert (=> b!537631 m!516825))

(declare-fun m!516847 () Bool)

(assert (=> b!537631 m!516847))

(declare-fun m!516849 () Bool)

(assert (=> b!537626 m!516849))

(assert (=> b!537626 m!516825))

(declare-fun m!516851 () Bool)

(assert (=> b!537632 m!516851))

(declare-fun m!516853 () Bool)

(assert (=> b!537633 m!516853))

(assert (=> b!537637 m!516825))

(assert (=> b!537637 m!516825))

(declare-fun m!516855 () Bool)

(assert (=> b!537637 m!516855))

(push 1)

