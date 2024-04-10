; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86912 () Bool)

(assert start!86912)

(declare-fun b!1007927 () Bool)

(declare-fun e!567195 () Bool)

(declare-fun e!567197 () Bool)

(assert (=> b!1007927 (= e!567195 e!567197)))

(declare-fun res!676831 () Bool)

(assert (=> b!1007927 (=> (not res!676831) (not e!567197))))

(declare-datatypes ((SeekEntryResult!9533 0))(
  ( (MissingZero!9533 (index!40503 (_ BitVec 32))) (Found!9533 (index!40504 (_ BitVec 32))) (Intermediate!9533 (undefined!10345 Bool) (index!40505 (_ BitVec 32)) (x!87899 (_ BitVec 32))) (Undefined!9533) (MissingVacant!9533 (index!40506 (_ BitVec 32))) )
))
(declare-fun lt!445442 () SeekEntryResult!9533)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007927 (= res!676831 (or (= lt!445442 (MissingVacant!9533 i!1194)) (= lt!445442 (MissingZero!9533 i!1194))))))

(declare-datatypes ((array!63560 0))(
  ( (array!63561 (arr!30601 (Array (_ BitVec 32) (_ BitVec 64))) (size!31103 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63560)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63560 (_ BitVec 32)) SeekEntryResult!9533)

(assert (=> b!1007927 (= lt!445442 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007928 () Bool)

(declare-fun res!676832 () Bool)

(declare-fun e!567194 () Bool)

(assert (=> b!1007928 (=> (not res!676832) (not e!567194))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445445 () array!63560)

(declare-fun lt!445446 () (_ BitVec 64))

(declare-fun lt!445443 () SeekEntryResult!9533)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63560 (_ BitVec 32)) SeekEntryResult!9533)

(assert (=> b!1007928 (= res!676832 (not (= lt!445443 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445446 lt!445445 mask!3464))))))

(declare-fun b!1007929 () Bool)

(declare-fun res!676820 () Bool)

(assert (=> b!1007929 (=> (not res!676820) (not e!567195))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007929 (= res!676820 (validKeyInArray!0 (select (arr!30601 a!3219) j!170)))))

(declare-fun b!1007930 () Bool)

(declare-fun res!676825 () Bool)

(assert (=> b!1007930 (=> (not res!676825) (not e!567195))))

(declare-fun arrayContainsKey!0 (array!63560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007930 (= res!676825 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007931 () Bool)

(assert (=> b!1007931 (= e!567194 false)))

(declare-fun lt!445444 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007931 (= lt!445444 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007932 () Bool)

(declare-fun e!567196 () Bool)

(declare-fun e!567198 () Bool)

(assert (=> b!1007932 (= e!567196 e!567198)))

(declare-fun res!676824 () Bool)

(assert (=> b!1007932 (=> (not res!676824) (not e!567198))))

(declare-fun lt!445448 () SeekEntryResult!9533)

(assert (=> b!1007932 (= res!676824 (= lt!445443 lt!445448))))

(assert (=> b!1007932 (= lt!445443 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30601 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007933 () Bool)

(declare-fun res!676830 () Bool)

(assert (=> b!1007933 (=> (not res!676830) (not e!567195))))

(assert (=> b!1007933 (= res!676830 (and (= (size!31103 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31103 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31103 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007934 () Bool)

(assert (=> b!1007934 (= e!567197 e!567196)))

(declare-fun res!676826 () Bool)

(assert (=> b!1007934 (=> (not res!676826) (not e!567196))))

(declare-fun lt!445447 () SeekEntryResult!9533)

(assert (=> b!1007934 (= res!676826 (= lt!445447 lt!445448))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007934 (= lt!445448 (Intermediate!9533 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007934 (= lt!445447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30601 a!3219) j!170) mask!3464) (select (arr!30601 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007935 () Bool)

(assert (=> b!1007935 (= e!567198 e!567194)))

(declare-fun res!676821 () Bool)

(assert (=> b!1007935 (=> (not res!676821) (not e!567194))))

(assert (=> b!1007935 (= res!676821 (not (= lt!445447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445446 mask!3464) lt!445446 lt!445445 mask!3464))))))

(assert (=> b!1007935 (= lt!445446 (select (store (arr!30601 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007935 (= lt!445445 (array!63561 (store (arr!30601 a!3219) i!1194 k!2224) (size!31103 a!3219)))))

(declare-fun res!676822 () Bool)

(assert (=> start!86912 (=> (not res!676822) (not e!567195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86912 (= res!676822 (validMask!0 mask!3464))))

(assert (=> start!86912 e!567195))

(declare-fun array_inv!23725 (array!63560) Bool)

(assert (=> start!86912 (array_inv!23725 a!3219)))

(assert (=> start!86912 true))

(declare-fun b!1007936 () Bool)

(declare-fun res!676829 () Bool)

(assert (=> b!1007936 (=> (not res!676829) (not e!567197))))

(assert (=> b!1007936 (= res!676829 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31103 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31103 a!3219))))))

(declare-fun b!1007937 () Bool)

(declare-fun res!676833 () Bool)

(assert (=> b!1007937 (=> (not res!676833) (not e!567197))))

(declare-datatypes ((List!21277 0))(
  ( (Nil!21274) (Cons!21273 (h!22459 (_ BitVec 64)) (t!30278 List!21277)) )
))
(declare-fun arrayNoDuplicates!0 (array!63560 (_ BitVec 32) List!21277) Bool)

(assert (=> b!1007937 (= res!676833 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21274))))

(declare-fun b!1007938 () Bool)

(declare-fun res!676827 () Bool)

(assert (=> b!1007938 (=> (not res!676827) (not e!567197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63560 (_ BitVec 32)) Bool)

(assert (=> b!1007938 (= res!676827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007939 () Bool)

(declare-fun res!676823 () Bool)

(assert (=> b!1007939 (=> (not res!676823) (not e!567195))))

(assert (=> b!1007939 (= res!676823 (validKeyInArray!0 k!2224))))

(declare-fun b!1007940 () Bool)

(declare-fun res!676828 () Bool)

(assert (=> b!1007940 (=> (not res!676828) (not e!567194))))

(assert (=> b!1007940 (= res!676828 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86912 res!676822) b!1007933))

(assert (= (and b!1007933 res!676830) b!1007929))

(assert (= (and b!1007929 res!676820) b!1007939))

(assert (= (and b!1007939 res!676823) b!1007930))

(assert (= (and b!1007930 res!676825) b!1007927))

(assert (= (and b!1007927 res!676831) b!1007938))

(assert (= (and b!1007938 res!676827) b!1007937))

(assert (= (and b!1007937 res!676833) b!1007936))

(assert (= (and b!1007936 res!676829) b!1007934))

(assert (= (and b!1007934 res!676826) b!1007932))

(assert (= (and b!1007932 res!676824) b!1007935))

(assert (= (and b!1007935 res!676821) b!1007928))

(assert (= (and b!1007928 res!676832) b!1007940))

(assert (= (and b!1007940 res!676828) b!1007931))

(declare-fun m!932747 () Bool)

(assert (=> b!1007935 m!932747))

(assert (=> b!1007935 m!932747))

(declare-fun m!932749 () Bool)

(assert (=> b!1007935 m!932749))

(declare-fun m!932751 () Bool)

(assert (=> b!1007935 m!932751))

(declare-fun m!932753 () Bool)

(assert (=> b!1007935 m!932753))

(declare-fun m!932755 () Bool)

(assert (=> b!1007934 m!932755))

(assert (=> b!1007934 m!932755))

(declare-fun m!932757 () Bool)

(assert (=> b!1007934 m!932757))

(assert (=> b!1007934 m!932757))

(assert (=> b!1007934 m!932755))

(declare-fun m!932759 () Bool)

(assert (=> b!1007934 m!932759))

(declare-fun m!932761 () Bool)

(assert (=> b!1007927 m!932761))

(declare-fun m!932763 () Bool)

(assert (=> b!1007939 m!932763))

(assert (=> b!1007932 m!932755))

(assert (=> b!1007932 m!932755))

(declare-fun m!932765 () Bool)

(assert (=> b!1007932 m!932765))

(declare-fun m!932767 () Bool)

(assert (=> b!1007938 m!932767))

(declare-fun m!932769 () Bool)

(assert (=> b!1007931 m!932769))

(declare-fun m!932771 () Bool)

(assert (=> b!1007937 m!932771))

(declare-fun m!932773 () Bool)

(assert (=> start!86912 m!932773))

(declare-fun m!932775 () Bool)

(assert (=> start!86912 m!932775))

(declare-fun m!932777 () Bool)

(assert (=> b!1007930 m!932777))

(assert (=> b!1007929 m!932755))

(assert (=> b!1007929 m!932755))

(declare-fun m!932779 () Bool)

(assert (=> b!1007929 m!932779))

(declare-fun m!932781 () Bool)

(assert (=> b!1007928 m!932781))

(push 1)

