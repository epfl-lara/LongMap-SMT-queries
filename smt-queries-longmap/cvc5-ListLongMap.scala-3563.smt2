; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49002 () Bool)

(assert start!49002)

(declare-fun b!539906 () Bool)

(declare-fun res!334953 () Bool)

(declare-fun e!312909 () Bool)

(assert (=> b!539906 (=> (not res!334953) (not e!312909))))

(declare-datatypes ((array!34163 0))(
  ( (array!34164 (arr!16419 (Array (_ BitVec 32) (_ BitVec 64))) (size!16783 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34163)

(declare-datatypes ((List!10538 0))(
  ( (Nil!10535) (Cons!10534 (h!11480 (_ BitVec 64)) (t!16766 List!10538)) )
))
(declare-fun arrayNoDuplicates!0 (array!34163 (_ BitVec 32) List!10538) Bool)

(assert (=> b!539906 (= res!334953 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10535))))

(declare-fun b!539907 () Bool)

(declare-fun res!334957 () Bool)

(declare-fun e!312908 () Bool)

(assert (=> b!539907 (=> (not res!334957) (not e!312908))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539907 (= res!334957 (and (= (size!16783 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16783 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16783 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539908 () Bool)

(declare-fun res!334955 () Bool)

(assert (=> b!539908 (=> (not res!334955) (not e!312909))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4877 0))(
  ( (MissingZero!4877 (index!21732 (_ BitVec 32))) (Found!4877 (index!21733 (_ BitVec 32))) (Intermediate!4877 (undefined!5689 Bool) (index!21734 (_ BitVec 32)) (x!50650 (_ BitVec 32))) (Undefined!4877) (MissingVacant!4877 (index!21735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34163 (_ BitVec 32)) SeekEntryResult!4877)

(assert (=> b!539908 (= res!334955 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16419 a!3154) j!147) a!3154 mask!3216) (Intermediate!4877 false resIndex!32 resX!32)))))

(declare-fun b!539909 () Bool)

(declare-fun res!334952 () Bool)

(assert (=> b!539909 (=> (not res!334952) (not e!312908))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539909 (= res!334952 (validKeyInArray!0 k!1998))))

(declare-fun res!334960 () Bool)

(assert (=> start!49002 (=> (not res!334960) (not e!312908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49002 (= res!334960 (validMask!0 mask!3216))))

(assert (=> start!49002 e!312908))

(assert (=> start!49002 true))

(declare-fun array_inv!12215 (array!34163) Bool)

(assert (=> start!49002 (array_inv!12215 a!3154)))

(declare-fun b!539910 () Bool)

(declare-fun res!334956 () Bool)

(assert (=> b!539910 (=> (not res!334956) (not e!312908))))

(declare-fun arrayContainsKey!0 (array!34163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539910 (= res!334956 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539911 () Bool)

(assert (=> b!539911 (= e!312908 e!312909)))

(declare-fun res!334961 () Bool)

(assert (=> b!539911 (=> (not res!334961) (not e!312909))))

(declare-fun lt!247272 () SeekEntryResult!4877)

(assert (=> b!539911 (= res!334961 (or (= lt!247272 (MissingZero!4877 i!1153)) (= lt!247272 (MissingVacant!4877 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34163 (_ BitVec 32)) SeekEntryResult!4877)

(assert (=> b!539911 (= lt!247272 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539912 () Bool)

(declare-fun res!334954 () Bool)

(assert (=> b!539912 (=> (not res!334954) (not e!312909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34163 (_ BitVec 32)) Bool)

(assert (=> b!539912 (= res!334954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539913 () Bool)

(assert (=> b!539913 (= e!312909 false)))

(declare-fun lt!247273 () SeekEntryResult!4877)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539913 (= lt!247273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16419 a!3154) j!147) mask!3216) (select (arr!16419 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539914 () Bool)

(declare-fun res!334958 () Bool)

(assert (=> b!539914 (=> (not res!334958) (not e!312908))))

(assert (=> b!539914 (= res!334958 (validKeyInArray!0 (select (arr!16419 a!3154) j!147)))))

(declare-fun b!539915 () Bool)

(declare-fun res!334959 () Bool)

(assert (=> b!539915 (=> (not res!334959) (not e!312909))))

(assert (=> b!539915 (= res!334959 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16783 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16783 a!3154)) (= (select (arr!16419 a!3154) resIndex!32) (select (arr!16419 a!3154) j!147))))))

(assert (= (and start!49002 res!334960) b!539907))

(assert (= (and b!539907 res!334957) b!539914))

(assert (= (and b!539914 res!334958) b!539909))

(assert (= (and b!539909 res!334952) b!539910))

(assert (= (and b!539910 res!334956) b!539911))

(assert (= (and b!539911 res!334961) b!539912))

(assert (= (and b!539912 res!334954) b!539906))

(assert (= (and b!539906 res!334953) b!539915))

(assert (= (and b!539915 res!334959) b!539908))

(assert (= (and b!539908 res!334955) b!539913))

(declare-fun m!518775 () Bool)

(assert (=> b!539911 m!518775))

(declare-fun m!518777 () Bool)

(assert (=> b!539913 m!518777))

(assert (=> b!539913 m!518777))

(declare-fun m!518779 () Bool)

(assert (=> b!539913 m!518779))

(assert (=> b!539913 m!518779))

(assert (=> b!539913 m!518777))

(declare-fun m!518781 () Bool)

(assert (=> b!539913 m!518781))

(declare-fun m!518783 () Bool)

(assert (=> b!539909 m!518783))

(assert (=> b!539914 m!518777))

(assert (=> b!539914 m!518777))

(declare-fun m!518785 () Bool)

(assert (=> b!539914 m!518785))

(declare-fun m!518787 () Bool)

(assert (=> b!539915 m!518787))

(assert (=> b!539915 m!518777))

(declare-fun m!518789 () Bool)

(assert (=> b!539912 m!518789))

(declare-fun m!518791 () Bool)

(assert (=> start!49002 m!518791))

(declare-fun m!518793 () Bool)

(assert (=> start!49002 m!518793))

(declare-fun m!518795 () Bool)

(assert (=> b!539906 m!518795))

(assert (=> b!539908 m!518777))

(assert (=> b!539908 m!518777))

(declare-fun m!518797 () Bool)

(assert (=> b!539908 m!518797))

(declare-fun m!518799 () Bool)

(assert (=> b!539910 m!518799))

(push 1)

