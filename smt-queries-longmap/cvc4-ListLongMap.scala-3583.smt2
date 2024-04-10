; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49288 () Bool)

(assert start!49288)

(declare-fun b!542682 () Bool)

(declare-fun res!337235 () Bool)

(declare-fun e!314046 () Bool)

(assert (=> b!542682 (=> (not res!337235) (not e!314046))))

(declare-datatypes ((array!34296 0))(
  ( (array!34297 (arr!16481 (Array (_ BitVec 32) (_ BitVec 64))) (size!16845 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34296)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34296 (_ BitVec 32)) Bool)

(assert (=> b!542682 (= res!337235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542683 () Bool)

(declare-fun res!337233 () Bool)

(assert (=> b!542683 (=> (not res!337233) (not e!314046))))

(declare-datatypes ((List!10600 0))(
  ( (Nil!10597) (Cons!10596 (h!11551 (_ BitVec 64)) (t!16828 List!10600)) )
))
(declare-fun arrayNoDuplicates!0 (array!34296 (_ BitVec 32) List!10600) Bool)

(assert (=> b!542683 (= res!337233 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10597))))

(declare-fun b!542684 () Bool)

(declare-fun res!337239 () Bool)

(assert (=> b!542684 (=> (not res!337239) (not e!314046))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542684 (= res!337239 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16845 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16845 a!3154)) (= (select (arr!16481 a!3154) resIndex!32) (select (arr!16481 a!3154) j!147))))))

(declare-fun b!542685 () Bool)

(declare-fun e!314047 () Bool)

(assert (=> b!542685 (= e!314047 false)))

(declare-fun lt!247983 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542685 (= lt!247983 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542686 () Bool)

(declare-fun res!337244 () Bool)

(assert (=> b!542686 (=> (not res!337244) (not e!314047))))

(declare-datatypes ((SeekEntryResult!4939 0))(
  ( (MissingZero!4939 (index!21980 (_ BitVec 32))) (Found!4939 (index!21981 (_ BitVec 32))) (Intermediate!4939 (undefined!5751 Bool) (index!21982 (_ BitVec 32)) (x!50890 (_ BitVec 32))) (Undefined!4939) (MissingVacant!4939 (index!21983 (_ BitVec 32))) )
))
(declare-fun lt!247984 () SeekEntryResult!4939)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34296 (_ BitVec 32)) SeekEntryResult!4939)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542686 (= res!337244 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16481 a!3154) j!147) mask!3216) (select (arr!16481 a!3154) j!147) a!3154 mask!3216) lt!247984))))

(declare-fun b!542687 () Bool)

(assert (=> b!542687 (= e!314046 e!314047)))

(declare-fun res!337241 () Bool)

(assert (=> b!542687 (=> (not res!337241) (not e!314047))))

(assert (=> b!542687 (= res!337241 (= lt!247984 (Intermediate!4939 false resIndex!32 resX!32)))))

(assert (=> b!542687 (= lt!247984 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16481 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542688 () Bool)

(declare-fun res!337242 () Bool)

(declare-fun e!314048 () Bool)

(assert (=> b!542688 (=> (not res!337242) (not e!314048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542688 (= res!337242 (validKeyInArray!0 (select (arr!16481 a!3154) j!147)))))

(declare-fun b!542689 () Bool)

(declare-fun res!337236 () Bool)

(assert (=> b!542689 (=> (not res!337236) (not e!314048))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!542689 (= res!337236 (validKeyInArray!0 k!1998))))

(declare-fun b!542690 () Bool)

(declare-fun res!337238 () Bool)

(assert (=> b!542690 (=> (not res!337238) (not e!314048))))

(declare-fun arrayContainsKey!0 (array!34296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542690 (= res!337238 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542691 () Bool)

(declare-fun res!337240 () Bool)

(assert (=> b!542691 (=> (not res!337240) (not e!314048))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542691 (= res!337240 (and (= (size!16845 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16845 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16845 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!337234 () Bool)

(assert (=> start!49288 (=> (not res!337234) (not e!314048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49288 (= res!337234 (validMask!0 mask!3216))))

(assert (=> start!49288 e!314048))

(assert (=> start!49288 true))

(declare-fun array_inv!12277 (array!34296) Bool)

(assert (=> start!49288 (array_inv!12277 a!3154)))

(declare-fun b!542692 () Bool)

(assert (=> b!542692 (= e!314048 e!314046)))

(declare-fun res!337237 () Bool)

(assert (=> b!542692 (=> (not res!337237) (not e!314046))))

(declare-fun lt!247982 () SeekEntryResult!4939)

(assert (=> b!542692 (= res!337237 (or (= lt!247982 (MissingZero!4939 i!1153)) (= lt!247982 (MissingVacant!4939 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34296 (_ BitVec 32)) SeekEntryResult!4939)

(assert (=> b!542692 (= lt!247982 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542693 () Bool)

(declare-fun res!337243 () Bool)

(assert (=> b!542693 (=> (not res!337243) (not e!314047))))

(assert (=> b!542693 (= res!337243 (and (not (= (select (arr!16481 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16481 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16481 a!3154) index!1177) (select (arr!16481 a!3154) j!147)))))))

(assert (= (and start!49288 res!337234) b!542691))

(assert (= (and b!542691 res!337240) b!542688))

(assert (= (and b!542688 res!337242) b!542689))

(assert (= (and b!542689 res!337236) b!542690))

(assert (= (and b!542690 res!337238) b!542692))

(assert (= (and b!542692 res!337237) b!542682))

(assert (= (and b!542682 res!337235) b!542683))

(assert (= (and b!542683 res!337233) b!542684))

(assert (= (and b!542684 res!337239) b!542687))

(assert (= (and b!542687 res!337241) b!542686))

(assert (= (and b!542686 res!337244) b!542693))

(assert (= (and b!542693 res!337243) b!542685))

(declare-fun m!520899 () Bool)

(assert (=> start!49288 m!520899))

(declare-fun m!520901 () Bool)

(assert (=> start!49288 m!520901))

(declare-fun m!520903 () Bool)

(assert (=> b!542693 m!520903))

(declare-fun m!520905 () Bool)

(assert (=> b!542693 m!520905))

(declare-fun m!520907 () Bool)

(assert (=> b!542684 m!520907))

(assert (=> b!542684 m!520905))

(declare-fun m!520909 () Bool)

(assert (=> b!542692 m!520909))

(assert (=> b!542686 m!520905))

(assert (=> b!542686 m!520905))

(declare-fun m!520911 () Bool)

(assert (=> b!542686 m!520911))

(assert (=> b!542686 m!520911))

(assert (=> b!542686 m!520905))

(declare-fun m!520913 () Bool)

(assert (=> b!542686 m!520913))

(assert (=> b!542688 m!520905))

(assert (=> b!542688 m!520905))

(declare-fun m!520915 () Bool)

(assert (=> b!542688 m!520915))

(declare-fun m!520917 () Bool)

(assert (=> b!542682 m!520917))

(declare-fun m!520919 () Bool)

(assert (=> b!542685 m!520919))

(declare-fun m!520921 () Bool)

(assert (=> b!542689 m!520921))

(declare-fun m!520923 () Bool)

(assert (=> b!542683 m!520923))

(assert (=> b!542687 m!520905))

(assert (=> b!542687 m!520905))

(declare-fun m!520925 () Bool)

(assert (=> b!542687 m!520925))

(declare-fun m!520927 () Bool)

(assert (=> b!542690 m!520927))

(push 1)

(assert (not b!542687))

(assert (not b!542689))

(assert (not start!49288))

(assert (not b!542686))

(assert (not b!542692))

(assert (not b!542685))

(assert (not b!542683))

