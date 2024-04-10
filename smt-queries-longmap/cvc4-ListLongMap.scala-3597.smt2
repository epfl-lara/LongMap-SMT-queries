; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49516 () Bool)

(assert start!49516)

(declare-fun b!544927 () Bool)

(declare-fun res!339031 () Bool)

(declare-fun e!315018 () Bool)

(assert (=> b!544927 (=> (not res!339031) (not e!315018))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34386 0))(
  ( (array!34387 (arr!16523 (Array (_ BitVec 32) (_ BitVec 64))) (size!16887 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34386)

(assert (=> b!544927 (= res!339031 (and (not (= (select (arr!16523 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16523 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16523 a!3154) index!1177) (select (arr!16523 a!3154) j!147)))))))

(declare-fun b!544928 () Bool)

(declare-fun res!339040 () Bool)

(declare-fun e!315021 () Bool)

(assert (=> b!544928 (=> (not res!339040) (not e!315021))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544928 (= res!339040 (and (= (size!16887 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16887 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16887 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544929 () Bool)

(declare-fun res!339036 () Bool)

(declare-fun e!315020 () Bool)

(assert (=> b!544929 (=> (not res!339036) (not e!315020))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544929 (= res!339036 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16887 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16887 a!3154)) (= (select (arr!16523 a!3154) resIndex!32) (select (arr!16523 a!3154) j!147))))))

(declare-fun b!544930 () Bool)

(declare-fun res!339039 () Bool)

(assert (=> b!544930 (=> (not res!339039) (not e!315021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544930 (= res!339039 (validKeyInArray!0 (select (arr!16523 a!3154) j!147)))))

(declare-fun b!544931 () Bool)

(assert (=> b!544931 (= e!315021 e!315020)))

(declare-fun res!339032 () Bool)

(assert (=> b!544931 (=> (not res!339032) (not e!315020))))

(declare-datatypes ((SeekEntryResult!4981 0))(
  ( (MissingZero!4981 (index!22148 (_ BitVec 32))) (Found!4981 (index!22149 (_ BitVec 32))) (Intermediate!4981 (undefined!5793 Bool) (index!22150 (_ BitVec 32)) (x!51068 (_ BitVec 32))) (Undefined!4981) (MissingVacant!4981 (index!22151 (_ BitVec 32))) )
))
(declare-fun lt!248652 () SeekEntryResult!4981)

(assert (=> b!544931 (= res!339032 (or (= lt!248652 (MissingZero!4981 i!1153)) (= lt!248652 (MissingVacant!4981 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34386 (_ BitVec 32)) SeekEntryResult!4981)

(assert (=> b!544931 (= lt!248652 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!544932 () Bool)

(declare-fun res!339030 () Bool)

(assert (=> b!544932 (=> (not res!339030) (not e!315018))))

(declare-fun lt!248651 () SeekEntryResult!4981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34386 (_ BitVec 32)) SeekEntryResult!4981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544932 (= res!339030 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16523 a!3154) j!147) mask!3216) (select (arr!16523 a!3154) j!147) a!3154 mask!3216) lt!248651))))

(declare-fun b!544933 () Bool)

(assert (=> b!544933 (= e!315018 false)))

(declare-fun lt!248653 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544933 (= lt!248653 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544934 () Bool)

(assert (=> b!544934 (= e!315020 e!315018)))

(declare-fun res!339034 () Bool)

(assert (=> b!544934 (=> (not res!339034) (not e!315018))))

(assert (=> b!544934 (= res!339034 (= lt!248651 (Intermediate!4981 false resIndex!32 resX!32)))))

(assert (=> b!544934 (= lt!248651 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16523 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544935 () Bool)

(declare-fun res!339033 () Bool)

(assert (=> b!544935 (=> (not res!339033) (not e!315021))))

(declare-fun arrayContainsKey!0 (array!34386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544935 (= res!339033 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!339035 () Bool)

(assert (=> start!49516 (=> (not res!339035) (not e!315021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49516 (= res!339035 (validMask!0 mask!3216))))

(assert (=> start!49516 e!315021))

(assert (=> start!49516 true))

(declare-fun array_inv!12319 (array!34386) Bool)

(assert (=> start!49516 (array_inv!12319 a!3154)))

(declare-fun b!544926 () Bool)

(declare-fun res!339037 () Bool)

(assert (=> b!544926 (=> (not res!339037) (not e!315020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34386 (_ BitVec 32)) Bool)

(assert (=> b!544926 (= res!339037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544936 () Bool)

(declare-fun res!339041 () Bool)

(assert (=> b!544936 (=> (not res!339041) (not e!315020))))

(declare-datatypes ((List!10642 0))(
  ( (Nil!10639) (Cons!10638 (h!11599 (_ BitVec 64)) (t!16870 List!10642)) )
))
(declare-fun arrayNoDuplicates!0 (array!34386 (_ BitVec 32) List!10642) Bool)

(assert (=> b!544936 (= res!339041 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10639))))

(declare-fun b!544937 () Bool)

(declare-fun res!339038 () Bool)

(assert (=> b!544937 (=> (not res!339038) (not e!315021))))

(assert (=> b!544937 (= res!339038 (validKeyInArray!0 k!1998))))

(assert (= (and start!49516 res!339035) b!544928))

(assert (= (and b!544928 res!339040) b!544930))

(assert (= (and b!544930 res!339039) b!544937))

(assert (= (and b!544937 res!339038) b!544935))

(assert (= (and b!544935 res!339033) b!544931))

(assert (= (and b!544931 res!339032) b!544926))

(assert (= (and b!544926 res!339037) b!544936))

(assert (= (and b!544936 res!339041) b!544929))

(assert (= (and b!544929 res!339036) b!544934))

(assert (= (and b!544934 res!339034) b!544932))

(assert (= (and b!544932 res!339030) b!544927))

(assert (= (and b!544927 res!339031) b!544933))

(declare-fun m!522663 () Bool)

(assert (=> start!49516 m!522663))

(declare-fun m!522665 () Bool)

(assert (=> start!49516 m!522665))

(declare-fun m!522667 () Bool)

(assert (=> b!544936 m!522667))

(declare-fun m!522669 () Bool)

(assert (=> b!544926 m!522669))

(declare-fun m!522671 () Bool)

(assert (=> b!544929 m!522671))

(declare-fun m!522673 () Bool)

(assert (=> b!544929 m!522673))

(declare-fun m!522675 () Bool)

(assert (=> b!544927 m!522675))

(assert (=> b!544927 m!522673))

(declare-fun m!522677 () Bool)

(assert (=> b!544935 m!522677))

(assert (=> b!544932 m!522673))

(assert (=> b!544932 m!522673))

(declare-fun m!522679 () Bool)

(assert (=> b!544932 m!522679))

(assert (=> b!544932 m!522679))

(assert (=> b!544932 m!522673))

(declare-fun m!522681 () Bool)

(assert (=> b!544932 m!522681))

(declare-fun m!522683 () Bool)

(assert (=> b!544931 m!522683))

(assert (=> b!544930 m!522673))

(assert (=> b!544930 m!522673))

(declare-fun m!522685 () Bool)

(assert (=> b!544930 m!522685))

(declare-fun m!522687 () Bool)

(assert (=> b!544933 m!522687))

(declare-fun m!522689 () Bool)

(assert (=> b!544937 m!522689))

(assert (=> b!544934 m!522673))

(assert (=> b!544934 m!522673))

(declare-fun m!522691 () Bool)

(assert (=> b!544934 m!522691))

(push 1)

(assert (not b!544932))

(assert (not b!544933))

(assert (not b!544926))

(assert (not b!544930))

(assert (not b!544936))

