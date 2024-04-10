; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87274 () Bool)

(assert start!87274)

(declare-fun b!1011758 () Bool)

(declare-fun e!569166 () Bool)

(declare-fun e!569165 () Bool)

(assert (=> b!1011758 (= e!569166 e!569165)))

(declare-fun res!679717 () Bool)

(assert (=> b!1011758 (=> (not res!679717) (not e!569165))))

(declare-datatypes ((SeekEntryResult!9586 0))(
  ( (MissingZero!9586 (index!40715 (_ BitVec 32))) (Found!9586 (index!40716 (_ BitVec 32))) (Intermediate!9586 (undefined!10398 Bool) (index!40717 (_ BitVec 32)) (x!88128 (_ BitVec 32))) (Undefined!9586) (MissingVacant!9586 (index!40718 (_ BitVec 32))) )
))
(declare-fun lt!447178 () SeekEntryResult!9586)

(declare-fun lt!447172 () SeekEntryResult!9586)

(assert (=> b!1011758 (= res!679717 (= lt!447178 lt!447172))))

(declare-datatypes ((array!63678 0))(
  ( (array!63679 (arr!30654 (Array (_ BitVec 32) (_ BitVec 64))) (size!31156 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63678)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63678 (_ BitVec 32)) SeekEntryResult!9586)

(assert (=> b!1011758 (= lt!447178 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30654 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011759 () Bool)

(declare-fun res!679722 () Bool)

(declare-fun e!569164 () Bool)

(assert (=> b!1011759 (=> (not res!679722) (not e!569164))))

(declare-fun lt!447180 () array!63678)

(declare-fun lt!447179 () (_ BitVec 64))

(assert (=> b!1011759 (= res!679722 (not (= lt!447178 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447179 lt!447180 mask!3464))))))

(declare-fun b!1011760 () Bool)

(declare-fun e!569163 () Bool)

(assert (=> b!1011760 (= e!569163 e!569166)))

(declare-fun res!679718 () Bool)

(assert (=> b!1011760 (=> (not res!679718) (not e!569166))))

(declare-fun lt!447177 () SeekEntryResult!9586)

(assert (=> b!1011760 (= res!679718 (= lt!447177 lt!447172))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011760 (= lt!447172 (Intermediate!9586 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011760 (= lt!447177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30654 a!3219) j!170) mask!3464) (select (arr!30654 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011761 () Bool)

(declare-fun res!679716 () Bool)

(assert (=> b!1011761 (=> (not res!679716) (not e!569164))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011761 (= res!679716 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011762 () Bool)

(declare-fun e!569167 () Bool)

(assert (=> b!1011762 (= e!569164 e!569167)))

(declare-fun res!679713 () Bool)

(assert (=> b!1011762 (=> (not res!679713) (not e!569167))))

(declare-fun lt!447174 () (_ BitVec 32))

(assert (=> b!1011762 (= res!679713 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447174 #b00000000000000000000000000000000) (bvslt lt!447174 (size!31156 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011762 (= lt!447174 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011763 () Bool)

(declare-fun e!569169 () Bool)

(assert (=> b!1011763 (= e!569169 (not true))))

(assert (=> b!1011763 (= resIndex!38 i!1194)))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((Unit!33038 0))(
  ( (Unit!33039) )
))
(declare-fun lt!447176 () Unit!33038)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!63678 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!33038)

(assert (=> b!1011763 (= lt!447176 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3219 i!1194 k!2224 j!170 lt!447174 (bvadd #b00000000000000000000000000000001 x!1245) resIndex!38 resX!38 mask!3464))))

(declare-fun b!1011764 () Bool)

(assert (=> b!1011764 (= e!569167 e!569169)))

(declare-fun res!679706 () Bool)

(assert (=> b!1011764 (=> (not res!679706) (not e!569169))))

(declare-fun lt!447173 () SeekEntryResult!9586)

(assert (=> b!1011764 (= res!679706 (= lt!447173 lt!447172))))

(assert (=> b!1011764 (= lt!447173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447174 (select (arr!30654 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011765 () Bool)

(assert (=> b!1011765 (= e!569165 e!569164)))

(declare-fun res!679720 () Bool)

(assert (=> b!1011765 (=> (not res!679720) (not e!569164))))

(assert (=> b!1011765 (= res!679720 (not (= lt!447177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447179 mask!3464) lt!447179 lt!447180 mask!3464))))))

(assert (=> b!1011765 (= lt!447179 (select (store (arr!30654 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1011765 (= lt!447180 (array!63679 (store (arr!30654 a!3219) i!1194 k!2224) (size!31156 a!3219)))))

(declare-fun b!1011766 () Bool)

(declare-fun res!679710 () Bool)

(assert (=> b!1011766 (=> (not res!679710) (not e!569163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63678 (_ BitVec 32)) Bool)

(assert (=> b!1011766 (= res!679710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011767 () Bool)

(declare-fun e!569170 () Bool)

(assert (=> b!1011767 (= e!569170 e!569163)))

(declare-fun res!679721 () Bool)

(assert (=> b!1011767 (=> (not res!679721) (not e!569163))))

(declare-fun lt!447175 () SeekEntryResult!9586)

(assert (=> b!1011767 (= res!679721 (or (= lt!447175 (MissingVacant!9586 i!1194)) (= lt!447175 (MissingZero!9586 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63678 (_ BitVec 32)) SeekEntryResult!9586)

(assert (=> b!1011767 (= lt!447175 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1011768 () Bool)

(declare-fun res!679709 () Bool)

(assert (=> b!1011768 (=> (not res!679709) (not e!569170))))

(assert (=> b!1011768 (= res!679709 (and (= (size!31156 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31156 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31156 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011769 () Bool)

(declare-fun res!679719 () Bool)

(assert (=> b!1011769 (=> (not res!679719) (not e!569169))))

(assert (=> b!1011769 (= res!679719 (not (= lt!447173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447174 lt!447179 lt!447180 mask!3464))))))

(declare-fun b!1011770 () Bool)

(declare-fun res!679711 () Bool)

(assert (=> b!1011770 (=> (not res!679711) (not e!569170))))

(declare-fun arrayContainsKey!0 (array!63678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011770 (= res!679711 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011771 () Bool)

(declare-fun res!679708 () Bool)

(assert (=> b!1011771 (=> (not res!679708) (not e!569163))))

(assert (=> b!1011771 (= res!679708 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31156 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31156 a!3219))))))

(declare-fun b!1011757 () Bool)

(declare-fun res!679715 () Bool)

(assert (=> b!1011757 (=> (not res!679715) (not e!569170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011757 (= res!679715 (validKeyInArray!0 (select (arr!30654 a!3219) j!170)))))

(declare-fun res!679707 () Bool)

(assert (=> start!87274 (=> (not res!679707) (not e!569170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87274 (= res!679707 (validMask!0 mask!3464))))

(assert (=> start!87274 e!569170))

(declare-fun array_inv!23778 (array!63678) Bool)

(assert (=> start!87274 (array_inv!23778 a!3219)))

(assert (=> start!87274 true))

(declare-fun b!1011772 () Bool)

(declare-fun res!679712 () Bool)

(assert (=> b!1011772 (=> (not res!679712) (not e!569170))))

(assert (=> b!1011772 (= res!679712 (validKeyInArray!0 k!2224))))

(declare-fun b!1011773 () Bool)

(declare-fun res!679714 () Bool)

(assert (=> b!1011773 (=> (not res!679714) (not e!569163))))

(declare-datatypes ((List!21330 0))(
  ( (Nil!21327) (Cons!21326 (h!22524 (_ BitVec 64)) (t!30331 List!21330)) )
))
(declare-fun arrayNoDuplicates!0 (array!63678 (_ BitVec 32) List!21330) Bool)

(assert (=> b!1011773 (= res!679714 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21327))))

(assert (= (and start!87274 res!679707) b!1011768))

(assert (= (and b!1011768 res!679709) b!1011757))

(assert (= (and b!1011757 res!679715) b!1011772))

(assert (= (and b!1011772 res!679712) b!1011770))

(assert (= (and b!1011770 res!679711) b!1011767))

(assert (= (and b!1011767 res!679721) b!1011766))

(assert (= (and b!1011766 res!679710) b!1011773))

(assert (= (and b!1011773 res!679714) b!1011771))

(assert (= (and b!1011771 res!679708) b!1011760))

(assert (= (and b!1011760 res!679718) b!1011758))

(assert (= (and b!1011758 res!679717) b!1011765))

(assert (= (and b!1011765 res!679720) b!1011759))

(assert (= (and b!1011759 res!679722) b!1011761))

(assert (= (and b!1011761 res!679716) b!1011762))

(assert (= (and b!1011762 res!679713) b!1011764))

(assert (= (and b!1011764 res!679706) b!1011769))

(assert (= (and b!1011769 res!679719) b!1011763))

(declare-fun m!935697 () Bool)

(assert (=> start!87274 m!935697))

(declare-fun m!935699 () Bool)

(assert (=> start!87274 m!935699))

(declare-fun m!935701 () Bool)

(assert (=> b!1011773 m!935701))

(declare-fun m!935703 () Bool)

(assert (=> b!1011762 m!935703))

(declare-fun m!935705 () Bool)

(assert (=> b!1011770 m!935705))

(declare-fun m!935707 () Bool)

(assert (=> b!1011763 m!935707))

(declare-fun m!935709 () Bool)

(assert (=> b!1011758 m!935709))

(assert (=> b!1011758 m!935709))

(declare-fun m!935711 () Bool)

(assert (=> b!1011758 m!935711))

(declare-fun m!935713 () Bool)

(assert (=> b!1011759 m!935713))

(assert (=> b!1011760 m!935709))

(assert (=> b!1011760 m!935709))

(declare-fun m!935715 () Bool)

(assert (=> b!1011760 m!935715))

(assert (=> b!1011760 m!935715))

(assert (=> b!1011760 m!935709))

(declare-fun m!935717 () Bool)

(assert (=> b!1011760 m!935717))

(declare-fun m!935719 () Bool)

(assert (=> b!1011767 m!935719))

(declare-fun m!935721 () Bool)

(assert (=> b!1011772 m!935721))

(declare-fun m!935723 () Bool)

(assert (=> b!1011765 m!935723))

(assert (=> b!1011765 m!935723))

(declare-fun m!935725 () Bool)

(assert (=> b!1011765 m!935725))

(declare-fun m!935727 () Bool)

(assert (=> b!1011765 m!935727))

(declare-fun m!935729 () Bool)

(assert (=> b!1011765 m!935729))

(declare-fun m!935731 () Bool)

(assert (=> b!1011766 m!935731))

(assert (=> b!1011757 m!935709))

(assert (=> b!1011757 m!935709))

(declare-fun m!935733 () Bool)

(assert (=> b!1011757 m!935733))

(declare-fun m!935735 () Bool)

(assert (=> b!1011769 m!935735))

(assert (=> b!1011764 m!935709))

(assert (=> b!1011764 m!935709))

(declare-fun m!935737 () Bool)

(assert (=> b!1011764 m!935737))

(push 1)

