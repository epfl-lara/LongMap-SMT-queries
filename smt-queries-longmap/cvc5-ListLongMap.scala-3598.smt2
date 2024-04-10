; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49518 () Bool)

(assert start!49518)

(declare-fun b!544962 () Bool)

(declare-fun res!339070 () Bool)

(declare-fun e!315032 () Bool)

(assert (=> b!544962 (=> (not res!339070) (not e!315032))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34388 0))(
  ( (array!34389 (arr!16524 (Array (_ BitVec 32) (_ BitVec 64))) (size!16888 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34388)

(assert (=> b!544962 (= res!339070 (and (not (= (select (arr!16524 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16524 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16524 a!3154) index!1177) (select (arr!16524 a!3154) j!147)))))))

(declare-fun b!544963 () Bool)

(declare-fun res!339077 () Bool)

(declare-fun e!315030 () Bool)

(assert (=> b!544963 (=> (not res!339077) (not e!315030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544963 (= res!339077 (validKeyInArray!0 (select (arr!16524 a!3154) j!147)))))

(declare-fun b!544964 () Bool)

(declare-fun res!339068 () Bool)

(assert (=> b!544964 (=> (not res!339068) (not e!315030))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!544964 (= res!339068 (validKeyInArray!0 k!1998))))

(declare-fun b!544965 () Bool)

(declare-fun e!315031 () Bool)

(assert (=> b!544965 (= e!315030 e!315031)))

(declare-fun res!339073 () Bool)

(assert (=> b!544965 (=> (not res!339073) (not e!315031))))

(declare-datatypes ((SeekEntryResult!4982 0))(
  ( (MissingZero!4982 (index!22152 (_ BitVec 32))) (Found!4982 (index!22153 (_ BitVec 32))) (Intermediate!4982 (undefined!5794 Bool) (index!22154 (_ BitVec 32)) (x!51077 (_ BitVec 32))) (Undefined!4982) (MissingVacant!4982 (index!22155 (_ BitVec 32))) )
))
(declare-fun lt!248662 () SeekEntryResult!4982)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544965 (= res!339073 (or (= lt!248662 (MissingZero!4982 i!1153)) (= lt!248662 (MissingVacant!4982 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34388 (_ BitVec 32)) SeekEntryResult!4982)

(assert (=> b!544965 (= lt!248662 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!544967 () Bool)

(assert (=> b!544967 (= e!315032 false)))

(declare-fun lt!248660 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544967 (= lt!248660 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544968 () Bool)

(assert (=> b!544968 (= e!315031 e!315032)))

(declare-fun res!339076 () Bool)

(assert (=> b!544968 (=> (not res!339076) (not e!315032))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!248661 () SeekEntryResult!4982)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544968 (= res!339076 (= lt!248661 (Intermediate!4982 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34388 (_ BitVec 32)) SeekEntryResult!4982)

(assert (=> b!544968 (= lt!248661 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16524 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544969 () Bool)

(declare-fun res!339075 () Bool)

(assert (=> b!544969 (=> (not res!339075) (not e!315032))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544969 (= res!339075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16524 a!3154) j!147) mask!3216) (select (arr!16524 a!3154) j!147) a!3154 mask!3216) lt!248661))))

(declare-fun res!339066 () Bool)

(assert (=> start!49518 (=> (not res!339066) (not e!315030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49518 (= res!339066 (validMask!0 mask!3216))))

(assert (=> start!49518 e!315030))

(assert (=> start!49518 true))

(declare-fun array_inv!12320 (array!34388) Bool)

(assert (=> start!49518 (array_inv!12320 a!3154)))

(declare-fun b!544966 () Bool)

(declare-fun res!339071 () Bool)

(assert (=> b!544966 (=> (not res!339071) (not e!315031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34388 (_ BitVec 32)) Bool)

(assert (=> b!544966 (= res!339071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544970 () Bool)

(declare-fun res!339074 () Bool)

(assert (=> b!544970 (=> (not res!339074) (not e!315030))))

(assert (=> b!544970 (= res!339074 (and (= (size!16888 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16888 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16888 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544971 () Bool)

(declare-fun res!339069 () Bool)

(assert (=> b!544971 (=> (not res!339069) (not e!315030))))

(declare-fun arrayContainsKey!0 (array!34388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544971 (= res!339069 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544972 () Bool)

(declare-fun res!339067 () Bool)

(assert (=> b!544972 (=> (not res!339067) (not e!315031))))

(declare-datatypes ((List!10643 0))(
  ( (Nil!10640) (Cons!10639 (h!11600 (_ BitVec 64)) (t!16871 List!10643)) )
))
(declare-fun arrayNoDuplicates!0 (array!34388 (_ BitVec 32) List!10643) Bool)

(assert (=> b!544972 (= res!339067 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10640))))

(declare-fun b!544973 () Bool)

(declare-fun res!339072 () Bool)

(assert (=> b!544973 (=> (not res!339072) (not e!315031))))

(assert (=> b!544973 (= res!339072 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16888 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16888 a!3154)) (= (select (arr!16524 a!3154) resIndex!32) (select (arr!16524 a!3154) j!147))))))

(assert (= (and start!49518 res!339066) b!544970))

(assert (= (and b!544970 res!339074) b!544963))

(assert (= (and b!544963 res!339077) b!544964))

(assert (= (and b!544964 res!339068) b!544971))

(assert (= (and b!544971 res!339069) b!544965))

(assert (= (and b!544965 res!339073) b!544966))

(assert (= (and b!544966 res!339071) b!544972))

(assert (= (and b!544972 res!339067) b!544973))

(assert (= (and b!544973 res!339072) b!544968))

(assert (= (and b!544968 res!339076) b!544969))

(assert (= (and b!544969 res!339075) b!544962))

(assert (= (and b!544962 res!339070) b!544967))

(declare-fun m!522693 () Bool)

(assert (=> b!544967 m!522693))

(declare-fun m!522695 () Bool)

(assert (=> start!49518 m!522695))

(declare-fun m!522697 () Bool)

(assert (=> start!49518 m!522697))

(declare-fun m!522699 () Bool)

(assert (=> b!544969 m!522699))

(assert (=> b!544969 m!522699))

(declare-fun m!522701 () Bool)

(assert (=> b!544969 m!522701))

(assert (=> b!544969 m!522701))

(assert (=> b!544969 m!522699))

(declare-fun m!522703 () Bool)

(assert (=> b!544969 m!522703))

(declare-fun m!522705 () Bool)

(assert (=> b!544973 m!522705))

(assert (=> b!544973 m!522699))

(declare-fun m!522707 () Bool)

(assert (=> b!544962 m!522707))

(assert (=> b!544962 m!522699))

(declare-fun m!522709 () Bool)

(assert (=> b!544964 m!522709))

(declare-fun m!522711 () Bool)

(assert (=> b!544965 m!522711))

(assert (=> b!544963 m!522699))

(assert (=> b!544963 m!522699))

(declare-fun m!522713 () Bool)

(assert (=> b!544963 m!522713))

(declare-fun m!522715 () Bool)

(assert (=> b!544972 m!522715))

(declare-fun m!522717 () Bool)

(assert (=> b!544966 m!522717))

(declare-fun m!522719 () Bool)

(assert (=> b!544971 m!522719))

(assert (=> b!544968 m!522699))

(assert (=> b!544968 m!522699))

(declare-fun m!522721 () Bool)

(assert (=> b!544968 m!522721))

(push 1)

