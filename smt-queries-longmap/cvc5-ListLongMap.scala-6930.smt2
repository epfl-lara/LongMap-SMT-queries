; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87192 () Bool)

(assert start!87192)

(declare-fun b!1010850 () Bool)

(declare-fun res!679043 () Bool)

(declare-fun e!568680 () Bool)

(assert (=> b!1010850 (=> (not res!679043) (not e!568680))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010850 (= res!679043 (validKeyInArray!0 k!2224))))

(declare-fun b!1010851 () Bool)

(declare-fun res!679036 () Bool)

(assert (=> b!1010851 (=> (not res!679036) (not e!568680))))

(declare-datatypes ((array!63653 0))(
  ( (array!63654 (arr!30643 (Array (_ BitVec 32) (_ BitVec 64))) (size!31145 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63653)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1010851 (= res!679036 (validKeyInArray!0 (select (arr!30643 a!3219) j!170)))))

(declare-fun b!1010852 () Bool)

(declare-fun res!679037 () Bool)

(declare-fun e!568682 () Bool)

(assert (=> b!1010852 (=> (not res!679037) (not e!568682))))

(declare-datatypes ((List!21319 0))(
  ( (Nil!21316) (Cons!21315 (h!22510 (_ BitVec 64)) (t!30320 List!21319)) )
))
(declare-fun arrayNoDuplicates!0 (array!63653 (_ BitVec 32) List!21319) Bool)

(assert (=> b!1010852 (= res!679037 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21316))))

(declare-fun b!1010853 () Bool)

(declare-fun res!679038 () Bool)

(assert (=> b!1010853 (=> (not res!679038) (not e!568682))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63653 (_ BitVec 32)) Bool)

(assert (=> b!1010853 (= res!679038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010854 () Bool)

(declare-fun e!568684 () Bool)

(assert (=> b!1010854 (= e!568684 false)))

(declare-fun lt!446767 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9575 0))(
  ( (MissingZero!9575 (index!40671 (_ BitVec 32))) (Found!9575 (index!40672 (_ BitVec 32))) (Intermediate!9575 (undefined!10387 Bool) (index!40673 (_ BitVec 32)) (x!88084 (_ BitVec 32))) (Undefined!9575) (MissingVacant!9575 (index!40674 (_ BitVec 32))) )
))
(declare-fun lt!446770 () SeekEntryResult!9575)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63653 (_ BitVec 32)) SeekEntryResult!9575)

(assert (=> b!1010854 (= lt!446770 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446767 (select (arr!30643 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!679041 () Bool)

(assert (=> start!87192 (=> (not res!679041) (not e!568680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87192 (= res!679041 (validMask!0 mask!3464))))

(assert (=> start!87192 e!568680))

(declare-fun array_inv!23767 (array!63653) Bool)

(assert (=> start!87192 (array_inv!23767 a!3219)))

(assert (=> start!87192 true))

(declare-fun b!1010855 () Bool)

(assert (=> b!1010855 (= e!568680 e!568682)))

(declare-fun res!679033 () Bool)

(assert (=> b!1010855 (=> (not res!679033) (not e!568682))))

(declare-fun lt!446768 () SeekEntryResult!9575)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010855 (= res!679033 (or (= lt!446768 (MissingVacant!9575 i!1194)) (= lt!446768 (MissingZero!9575 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63653 (_ BitVec 32)) SeekEntryResult!9575)

(assert (=> b!1010855 (= lt!446768 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010856 () Bool)

(declare-fun e!568683 () Bool)

(assert (=> b!1010856 (= e!568682 e!568683)))

(declare-fun res!679031 () Bool)

(assert (=> b!1010856 (=> (not res!679031) (not e!568683))))

(declare-fun lt!446769 () SeekEntryResult!9575)

(declare-fun lt!446772 () SeekEntryResult!9575)

(assert (=> b!1010856 (= res!679031 (= lt!446769 lt!446772))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010856 (= lt!446772 (Intermediate!9575 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010856 (= lt!446769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30643 a!3219) j!170) mask!3464) (select (arr!30643 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010857 () Bool)

(declare-fun res!679034 () Bool)

(declare-fun e!568679 () Bool)

(assert (=> b!1010857 (=> (not res!679034) (not e!568679))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!446766 () SeekEntryResult!9575)

(declare-fun lt!446765 () (_ BitVec 64))

(declare-fun lt!446771 () array!63653)

(assert (=> b!1010857 (= res!679034 (not (= lt!446766 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446765 lt!446771 mask!3464))))))

(declare-fun b!1010858 () Bool)

(declare-fun res!679044 () Bool)

(assert (=> b!1010858 (=> (not res!679044) (not e!568682))))

(assert (=> b!1010858 (= res!679044 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31145 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31145 a!3219))))))

(declare-fun b!1010859 () Bool)

(declare-fun res!679042 () Bool)

(assert (=> b!1010859 (=> (not res!679042) (not e!568680))))

(declare-fun arrayContainsKey!0 (array!63653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010859 (= res!679042 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010860 () Bool)

(declare-fun e!568678 () Bool)

(assert (=> b!1010860 (= e!568678 e!568679)))

(declare-fun res!679030 () Bool)

(assert (=> b!1010860 (=> (not res!679030) (not e!568679))))

(assert (=> b!1010860 (= res!679030 (not (= lt!446769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446765 mask!3464) lt!446765 lt!446771 mask!3464))))))

(assert (=> b!1010860 (= lt!446765 (select (store (arr!30643 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010860 (= lt!446771 (array!63654 (store (arr!30643 a!3219) i!1194 k!2224) (size!31145 a!3219)))))

(declare-fun b!1010861 () Bool)

(assert (=> b!1010861 (= e!568679 e!568684)))

(declare-fun res!679040 () Bool)

(assert (=> b!1010861 (=> (not res!679040) (not e!568684))))

(assert (=> b!1010861 (= res!679040 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446767 #b00000000000000000000000000000000) (bvslt lt!446767 (size!31145 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010861 (= lt!446767 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010862 () Bool)

(declare-fun res!679035 () Bool)

(assert (=> b!1010862 (=> (not res!679035) (not e!568680))))

(assert (=> b!1010862 (= res!679035 (and (= (size!31145 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31145 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31145 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010863 () Bool)

(assert (=> b!1010863 (= e!568683 e!568678)))

(declare-fun res!679039 () Bool)

(assert (=> b!1010863 (=> (not res!679039) (not e!568678))))

(assert (=> b!1010863 (= res!679039 (= lt!446766 lt!446772))))

(assert (=> b!1010863 (= lt!446766 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30643 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010864 () Bool)

(declare-fun res!679032 () Bool)

(assert (=> b!1010864 (=> (not res!679032) (not e!568679))))

(assert (=> b!1010864 (= res!679032 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!87192 res!679041) b!1010862))

(assert (= (and b!1010862 res!679035) b!1010851))

(assert (= (and b!1010851 res!679036) b!1010850))

(assert (= (and b!1010850 res!679043) b!1010859))

(assert (= (and b!1010859 res!679042) b!1010855))

(assert (= (and b!1010855 res!679033) b!1010853))

(assert (= (and b!1010853 res!679038) b!1010852))

(assert (= (and b!1010852 res!679037) b!1010858))

(assert (= (and b!1010858 res!679044) b!1010856))

(assert (= (and b!1010856 res!679031) b!1010863))

(assert (= (and b!1010863 res!679039) b!1010860))

(assert (= (and b!1010860 res!679030) b!1010857))

(assert (= (and b!1010857 res!679034) b!1010864))

(assert (= (and b!1010864 res!679032) b!1010861))

(assert (= (and b!1010861 res!679040) b!1010854))

(declare-fun m!935031 () Bool)

(assert (=> b!1010854 m!935031))

(assert (=> b!1010854 m!935031))

(declare-fun m!935033 () Bool)

(assert (=> b!1010854 m!935033))

(declare-fun m!935035 () Bool)

(assert (=> b!1010861 m!935035))

(declare-fun m!935037 () Bool)

(assert (=> b!1010860 m!935037))

(assert (=> b!1010860 m!935037))

(declare-fun m!935039 () Bool)

(assert (=> b!1010860 m!935039))

(declare-fun m!935041 () Bool)

(assert (=> b!1010860 m!935041))

(declare-fun m!935043 () Bool)

(assert (=> b!1010860 m!935043))

(declare-fun m!935045 () Bool)

(assert (=> b!1010852 m!935045))

(declare-fun m!935047 () Bool)

(assert (=> b!1010853 m!935047))

(declare-fun m!935049 () Bool)

(assert (=> b!1010850 m!935049))

(assert (=> b!1010851 m!935031))

(assert (=> b!1010851 m!935031))

(declare-fun m!935051 () Bool)

(assert (=> b!1010851 m!935051))

(declare-fun m!935053 () Bool)

(assert (=> b!1010857 m!935053))

(declare-fun m!935055 () Bool)

(assert (=> start!87192 m!935055))

(declare-fun m!935057 () Bool)

(assert (=> start!87192 m!935057))

(assert (=> b!1010856 m!935031))

(assert (=> b!1010856 m!935031))

(declare-fun m!935059 () Bool)

(assert (=> b!1010856 m!935059))

(assert (=> b!1010856 m!935059))

(assert (=> b!1010856 m!935031))

(declare-fun m!935061 () Bool)

(assert (=> b!1010856 m!935061))

(declare-fun m!935063 () Bool)

(assert (=> b!1010855 m!935063))

(assert (=> b!1010863 m!935031))

(assert (=> b!1010863 m!935031))

(declare-fun m!935065 () Bool)

(assert (=> b!1010863 m!935065))

(declare-fun m!935067 () Bool)

(assert (=> b!1010859 m!935067))

(push 1)

