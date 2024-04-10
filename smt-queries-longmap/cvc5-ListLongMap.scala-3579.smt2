; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49206 () Bool)

(assert start!49206)

(declare-fun b!541890 () Bool)

(declare-fun res!336629 () Bool)

(declare-fun e!313695 () Bool)

(assert (=> b!541890 (=> (not res!336629) (not e!313695))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34265 0))(
  ( (array!34266 (arr!16467 (Array (_ BitVec 32) (_ BitVec 64))) (size!16831 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34265)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541890 (= res!336629 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16831 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16831 a!3154)) (= (select (arr!16467 a!3154) resIndex!32) (select (arr!16467 a!3154) j!147))))))

(declare-fun b!541891 () Bool)

(declare-fun res!336622 () Bool)

(declare-fun e!313697 () Bool)

(assert (=> b!541891 (=> (not res!336622) (not e!313697))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541891 (= res!336622 (validKeyInArray!0 k!1998))))

(declare-fun b!541892 () Bool)

(declare-fun res!336621 () Bool)

(assert (=> b!541892 (=> (not res!336621) (not e!313697))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541892 (= res!336621 (and (= (size!16831 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16831 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16831 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541893 () Bool)

(declare-fun res!336625 () Bool)

(assert (=> b!541893 (=> (not res!336625) (not e!313695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34265 (_ BitVec 32)) Bool)

(assert (=> b!541893 (= res!336625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541894 () Bool)

(assert (=> b!541894 (= e!313697 e!313695)))

(declare-fun res!336626 () Bool)

(assert (=> b!541894 (=> (not res!336626) (not e!313695))))

(declare-datatypes ((SeekEntryResult!4925 0))(
  ( (MissingZero!4925 (index!21924 (_ BitVec 32))) (Found!4925 (index!21925 (_ BitVec 32))) (Intermediate!4925 (undefined!5737 Bool) (index!21926 (_ BitVec 32)) (x!50838 (_ BitVec 32))) (Undefined!4925) (MissingVacant!4925 (index!21927 (_ BitVec 32))) )
))
(declare-fun lt!247754 () SeekEntryResult!4925)

(assert (=> b!541894 (= res!336626 (or (= lt!247754 (MissingZero!4925 i!1153)) (= lt!247754 (MissingVacant!4925 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34265 (_ BitVec 32)) SeekEntryResult!4925)

(assert (=> b!541894 (= lt!247754 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541895 () Bool)

(declare-fun res!336623 () Bool)

(declare-fun e!313696 () Bool)

(assert (=> b!541895 (=> (not res!336623) (not e!313696))))

(declare-fun lt!247756 () SeekEntryResult!4925)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34265 (_ BitVec 32)) SeekEntryResult!4925)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541895 (= res!336623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16467 a!3154) j!147) mask!3216) (select (arr!16467 a!3154) j!147) a!3154 mask!3216) lt!247756))))

(declare-fun b!541896 () Bool)

(declare-fun res!336620 () Bool)

(assert (=> b!541896 (=> (not res!336620) (not e!313696))))

(assert (=> b!541896 (= res!336620 (and (not (= (select (arr!16467 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16467 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16467 a!3154) index!1177) (select (arr!16467 a!3154) j!147)) (= index!1177 resIndex!32)))))

(declare-fun b!541897 () Bool)

(declare-fun res!336628 () Bool)

(assert (=> b!541897 (=> (not res!336628) (not e!313695))))

(declare-datatypes ((List!10586 0))(
  ( (Nil!10583) (Cons!10582 (h!11534 (_ BitVec 64)) (t!16814 List!10586)) )
))
(declare-fun arrayNoDuplicates!0 (array!34265 (_ BitVec 32) List!10586) Bool)

(assert (=> b!541897 (= res!336628 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10583))))

(declare-fun b!541898 () Bool)

(assert (=> b!541898 (= e!313695 e!313696)))

(declare-fun res!336624 () Bool)

(assert (=> b!541898 (=> (not res!336624) (not e!313696))))

(declare-fun lt!247755 () SeekEntryResult!4925)

(assert (=> b!541898 (= res!336624 (= lt!247756 lt!247755))))

(assert (=> b!541898 (= lt!247755 (Intermediate!4925 false resIndex!32 resX!32))))

(assert (=> b!541898 (= lt!247756 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16467 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541899 () Bool)

(declare-fun res!336619 () Bool)

(assert (=> b!541899 (=> (not res!336619) (not e!313697))))

(declare-fun arrayContainsKey!0 (array!34265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541899 (= res!336619 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541900 () Bool)

(declare-fun res!336618 () Bool)

(assert (=> b!541900 (=> (not res!336618) (not e!313697))))

(assert (=> b!541900 (= res!336618 (validKeyInArray!0 (select (arr!16467 a!3154) j!147)))))

(declare-fun res!336627 () Bool)

(assert (=> start!49206 (=> (not res!336627) (not e!313697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49206 (= res!336627 (validMask!0 mask!3216))))

(assert (=> start!49206 e!313697))

(assert (=> start!49206 true))

(declare-fun array_inv!12263 (array!34265) Bool)

(assert (=> start!49206 (array_inv!12263 a!3154)))

(declare-fun b!541901 () Bool)

(assert (=> b!541901 (= e!313696 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16467 a!3154) i!1153 k!1998) j!147) (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154)) mask!3216) lt!247755)))))

(assert (= (and start!49206 res!336627) b!541892))

(assert (= (and b!541892 res!336621) b!541900))

(assert (= (and b!541900 res!336618) b!541891))

(assert (= (and b!541891 res!336622) b!541899))

(assert (= (and b!541899 res!336619) b!541894))

(assert (= (and b!541894 res!336626) b!541893))

(assert (= (and b!541893 res!336625) b!541897))

(assert (= (and b!541897 res!336628) b!541890))

(assert (= (and b!541890 res!336629) b!541898))

(assert (= (and b!541898 res!336624) b!541895))

(assert (= (and b!541895 res!336623) b!541896))

(assert (= (and b!541896 res!336620) b!541901))

(declare-fun m!520311 () Bool)

(assert (=> b!541895 m!520311))

(assert (=> b!541895 m!520311))

(declare-fun m!520313 () Bool)

(assert (=> b!541895 m!520313))

(assert (=> b!541895 m!520313))

(assert (=> b!541895 m!520311))

(declare-fun m!520315 () Bool)

(assert (=> b!541895 m!520315))

(declare-fun m!520317 () Bool)

(assert (=> b!541896 m!520317))

(assert (=> b!541896 m!520311))

(declare-fun m!520319 () Bool)

(assert (=> start!49206 m!520319))

(declare-fun m!520321 () Bool)

(assert (=> start!49206 m!520321))

(assert (=> b!541900 m!520311))

(assert (=> b!541900 m!520311))

(declare-fun m!520323 () Bool)

(assert (=> b!541900 m!520323))

(declare-fun m!520325 () Bool)

(assert (=> b!541897 m!520325))

(declare-fun m!520327 () Bool)

(assert (=> b!541890 m!520327))

(assert (=> b!541890 m!520311))

(declare-fun m!520329 () Bool)

(assert (=> b!541901 m!520329))

(declare-fun m!520331 () Bool)

(assert (=> b!541901 m!520331))

(assert (=> b!541901 m!520331))

(declare-fun m!520333 () Bool)

(assert (=> b!541901 m!520333))

(declare-fun m!520335 () Bool)

(assert (=> b!541891 m!520335))

(declare-fun m!520337 () Bool)

(assert (=> b!541894 m!520337))

(declare-fun m!520339 () Bool)

(assert (=> b!541893 m!520339))

(declare-fun m!520341 () Bool)

(assert (=> b!541899 m!520341))

(assert (=> b!541898 m!520311))

(assert (=> b!541898 m!520311))

(declare-fun m!520343 () Bool)

(assert (=> b!541898 m!520343))

(push 1)

(assert (not b!541901))

(assert (not b!541895))

(assert (not b!541897))

(assert (not b!541898))

(assert (not b!541900))

(assert (not b!541899))

(assert (not start!49206))

(assert (not b!541893))

(assert (not b!541891))

(assert (not b!541894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!542078 () Bool)

(declare-fun e!313791 () Bool)

(declare-fun e!313792 () Bool)

(assert (=> b!542078 (= e!313791 e!313792)))

(declare-fun lt!247817 () (_ BitVec 64))

(assert (=> b!542078 (= lt!247817 (select (arr!16467 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16900 0))(
  ( (Unit!16901) )
))
(declare-fun lt!247815 () Unit!16900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34265 (_ BitVec 64) (_ BitVec 32)) Unit!16900)

(assert (=> b!542078 (= lt!247815 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247817 #b00000000000000000000000000000000))))

(assert (=> b!542078 (arrayContainsKey!0 a!3154 lt!247817 #b00000000000000000000000000000000)))

(declare-fun lt!247816 () Unit!16900)

(assert (=> b!542078 (= lt!247816 lt!247815)))

(declare-fun res!336744 () Bool)

(assert (=> b!542078 (= res!336744 (= (seekEntryOrOpen!0 (select (arr!16467 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4925 #b00000000000000000000000000000000)))))

(assert (=> b!542078 (=> (not res!336744) (not e!313792))))

(declare-fun b!542079 () Bool)

(declare-fun call!32060 () Bool)

(assert (=> b!542079 (= e!313792 call!32060)))

(declare-fun bm!32057 () Bool)

(assert (=> bm!32057 (= call!32060 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!542080 () Bool)

(declare-fun e!313790 () Bool)

(assert (=> b!542080 (= e!313790 e!313791)))

(declare-fun c!62984 () Bool)

(assert (=> b!542080 (= c!62984 (validKeyInArray!0 (select (arr!16467 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542081 () Bool)

(assert (=> b!542081 (= e!313791 call!32060)))

(declare-fun d!81839 () Bool)

(declare-fun res!336743 () Bool)

(assert (=> d!81839 (=> res!336743 e!313790)))

(assert (=> d!81839 (= res!336743 (bvsge #b00000000000000000000000000000000 (size!16831 a!3154)))))

(assert (=> d!81839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313790)))

(assert (= (and d!81839 (not res!336743)) b!542080))

(assert (= (and b!542080 c!62984) b!542078))

(assert (= (and b!542080 (not c!62984)) b!542081))

(assert (= (and b!542078 res!336744) b!542079))

(assert (= (or b!542079 b!542081) bm!32057))

(declare-fun m!520465 () Bool)

(assert (=> b!542078 m!520465))

(declare-fun m!520467 () Bool)

(assert (=> b!542078 m!520467))

(declare-fun m!520469 () Bool)

(assert (=> b!542078 m!520469))

(assert (=> b!542078 m!520465))

(declare-fun m!520471 () Bool)

(assert (=> b!542078 m!520471))

(declare-fun m!520473 () Bool)

(assert (=> bm!32057 m!520473))

(assert (=> b!542080 m!520465))

(assert (=> b!542080 m!520465))

(declare-fun m!520475 () Bool)

(assert (=> b!542080 m!520475))

(assert (=> b!541893 d!81839))

(declare-fun b!542124 () Bool)

(declare-fun e!313819 () Bool)

(declare-fun e!313820 () Bool)

(assert (=> b!542124 (= e!313819 e!313820)))

(declare-fun res!336759 () Bool)

(declare-fun lt!247835 () SeekEntryResult!4925)

(assert (=> b!542124 (= res!336759 (and (is-Intermediate!4925 lt!247835) (not (undefined!5737 lt!247835)) (bvslt (x!50838 lt!247835) #b01111111111111111111111111111110) (bvsge (x!50838 lt!247835) #b00000000000000000000000000000000) (bvsge (x!50838 lt!247835) x!1030)))))

(assert (=> b!542124 (=> (not res!336759) (not e!313820))))

(declare-fun b!542126 () Bool)

(assert (=> b!542126 (= e!313819 (bvsge (x!50838 lt!247835) #b01111111111111111111111111111110))))

(declare-fun b!542127 () Bool)

(declare-fun e!313821 () SeekEntryResult!4925)

(assert (=> b!542127 (= e!313821 (Intermediate!4925 false index!1177 x!1030))))

(declare-fun b!542128 () Bool)

(assert (=> b!542128 (and (bvsge (index!21926 lt!247835) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247835) (size!16831 a!3154)))))

(declare-fun res!336758 () Bool)

(assert (=> b!542128 (= res!336758 (= (select (arr!16467 a!3154) (index!21926 lt!247835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313818 () Bool)

(assert (=> b!542128 (=> res!336758 e!313818)))

(declare-fun b!542129 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542129 (= e!313821 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16467 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542130 () Bool)

(assert (=> b!542130 (and (bvsge (index!21926 lt!247835) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247835) (size!16831 a!3154)))))

(assert (=> b!542130 (= e!313818 (= (select (arr!16467 a!3154) (index!21926 lt!247835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!542131 () Bool)

(declare-fun e!313822 () SeekEntryResult!4925)

(assert (=> b!542131 (= e!313822 (Intermediate!4925 true index!1177 x!1030))))

(declare-fun b!542132 () Bool)

(assert (=> b!542132 (= e!313822 e!313821)))

(declare-fun lt!247836 () (_ BitVec 64))

(declare-fun c!63001 () Bool)

(assert (=> b!542132 (= c!63001 (or (= lt!247836 (select (arr!16467 a!3154) j!147)) (= (bvadd lt!247836 lt!247836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542125 () Bool)

(assert (=> b!542125 (and (bvsge (index!21926 lt!247835) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247835) (size!16831 a!3154)))))

(declare-fun res!336757 () Bool)

(assert (=> b!542125 (= res!336757 (= (select (arr!16467 a!3154) (index!21926 lt!247835)) (select (arr!16467 a!3154) j!147)))))

(assert (=> b!542125 (=> res!336757 e!313818)))

(assert (=> b!542125 (= e!313820 e!313818)))

(declare-fun d!81851 () Bool)

(assert (=> d!81851 e!313819))

(declare-fun c!63000 () Bool)

(assert (=> d!81851 (= c!63000 (and (is-Intermediate!4925 lt!247835) (undefined!5737 lt!247835)))))

(assert (=> d!81851 (= lt!247835 e!313822)))

(declare-fun c!63002 () Bool)

(assert (=> d!81851 (= c!63002 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81851 (= lt!247836 (select (arr!16467 a!3154) index!1177))))

(assert (=> d!81851 (validMask!0 mask!3216)))

(assert (=> d!81851 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16467 a!3154) j!147) a!3154 mask!3216) lt!247835)))

(assert (= (and d!81851 c!63002) b!542131))

(assert (= (and d!81851 (not c!63002)) b!542132))

(assert (= (and b!542132 c!63001) b!542127))

(assert (= (and b!542132 (not c!63001)) b!542129))

(assert (= (and d!81851 c!63000) b!542126))

(assert (= (and d!81851 (not c!63000)) b!542124))

(assert (= (and b!542124 res!336759) b!542125))

(assert (= (and b!542125 (not res!336757)) b!542128))

(assert (= (and b!542128 (not res!336758)) b!542130))

(declare-fun m!520489 () Bool)

(assert (=> b!542130 m!520489))

(assert (=> b!542128 m!520489))

(assert (=> b!542125 m!520489))

(declare-fun m!520491 () Bool)

(assert (=> b!542129 m!520491))

(assert (=> b!542129 m!520491))

(assert (=> b!542129 m!520311))

(declare-fun m!520493 () Bool)

(assert (=> b!542129 m!520493))

(assert (=> d!81851 m!520317))

(assert (=> d!81851 m!520319))

(assert (=> b!541898 d!81851))

(declare-fun d!81857 () Bool)

(declare-fun res!336770 () Bool)

(declare-fun e!313831 () Bool)

(assert (=> d!81857 (=> res!336770 e!313831)))

(assert (=> d!81857 (= res!336770 (= (select (arr!16467 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81857 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!313831)))

(declare-fun b!542143 () Bool)

(declare-fun e!313832 () Bool)

(assert (=> b!542143 (= e!313831 e!313832)))

(declare-fun res!336771 () Bool)

(assert (=> b!542143 (=> (not res!336771) (not e!313832))))

(assert (=> b!542143 (= res!336771 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16831 a!3154)))))

(declare-fun b!542144 () Bool)

(assert (=> b!542144 (= e!313832 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81857 (not res!336770)) b!542143))

(assert (= (and b!542143 res!336771) b!542144))

(assert (=> d!81857 m!520465))

(declare-fun m!520495 () Bool)

(assert (=> b!542144 m!520495))

(assert (=> b!541899 d!81857))

(declare-fun d!81859 () Bool)

(assert (=> d!81859 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49206 d!81859))

(declare-fun d!81865 () Bool)

(assert (=> d!81865 (= (array_inv!12263 a!3154) (bvsge (size!16831 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49206 d!81865))

(declare-fun b!542208 () Bool)

(declare-fun c!63026 () Bool)

(declare-fun lt!247855 () (_ BitVec 64))

(assert (=> b!542208 (= c!63026 (= lt!247855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313875 () SeekEntryResult!4925)

(declare-fun e!313873 () SeekEntryResult!4925)

(assert (=> b!542208 (= e!313875 e!313873)))

(declare-fun b!542209 () Bool)

(declare-fun lt!247854 () SeekEntryResult!4925)

(assert (=> b!542209 (= e!313875 (Found!4925 (index!21926 lt!247854)))))

(declare-fun b!542210 () Bool)

(assert (=> b!542210 (= e!313873 (MissingZero!4925 (index!21926 lt!247854)))))

(declare-fun b!542211 () Bool)

(declare-fun e!313874 () SeekEntryResult!4925)

(assert (=> b!542211 (= e!313874 e!313875)))

(assert (=> b!542211 (= lt!247855 (select (arr!16467 a!3154) (index!21926 lt!247854)))))

(declare-fun c!63024 () Bool)

(assert (=> b!542211 (= c!63024 (= lt!247855 k!1998))))

(declare-fun d!81867 () Bool)

(declare-fun lt!247853 () SeekEntryResult!4925)

(assert (=> d!81867 (and (or (is-Undefined!4925 lt!247853) (not (is-Found!4925 lt!247853)) (and (bvsge (index!21925 lt!247853) #b00000000000000000000000000000000) (bvslt (index!21925 lt!247853) (size!16831 a!3154)))) (or (is-Undefined!4925 lt!247853) (is-Found!4925 lt!247853) (not (is-MissingZero!4925 lt!247853)) (and (bvsge (index!21924 lt!247853) #b00000000000000000000000000000000) (bvslt (index!21924 lt!247853) (size!16831 a!3154)))) (or (is-Undefined!4925 lt!247853) (is-Found!4925 lt!247853) (is-MissingZero!4925 lt!247853) (not (is-MissingVacant!4925 lt!247853)) (and (bvsge (index!21927 lt!247853) #b00000000000000000000000000000000) (bvslt (index!21927 lt!247853) (size!16831 a!3154)))) (or (is-Undefined!4925 lt!247853) (ite (is-Found!4925 lt!247853) (= (select (arr!16467 a!3154) (index!21925 lt!247853)) k!1998) (ite (is-MissingZero!4925 lt!247853) (= (select (arr!16467 a!3154) (index!21924 lt!247853)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4925 lt!247853) (= (select (arr!16467 a!3154) (index!21927 lt!247853)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81867 (= lt!247853 e!313874)))

(declare-fun c!63025 () Bool)

(assert (=> d!81867 (= c!63025 (and (is-Intermediate!4925 lt!247854) (undefined!5737 lt!247854)))))

(assert (=> d!81867 (= lt!247854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81867 (validMask!0 mask!3216)))

(assert (=> d!81867 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247853)))

(declare-fun b!542212 () Bool)

(assert (=> b!542212 (= e!313874 Undefined!4925)))

(declare-fun b!542213 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34265 (_ BitVec 32)) SeekEntryResult!4925)

(assert (=> b!542213 (= e!313873 (seekKeyOrZeroReturnVacant!0 (x!50838 lt!247854) (index!21926 lt!247854) (index!21926 lt!247854) k!1998 a!3154 mask!3216))))

(assert (= (and d!81867 c!63025) b!542212))

(assert (= (and d!81867 (not c!63025)) b!542211))

(assert (= (and b!542211 c!63024) b!542209))

(assert (= (and b!542211 (not c!63024)) b!542208))

(assert (= (and b!542208 c!63026) b!542210))

(assert (= (and b!542208 (not c!63026)) b!542213))

(declare-fun m!520515 () Bool)

(assert (=> b!542211 m!520515))

(declare-fun m!520517 () Bool)

(assert (=> d!81867 m!520517))

(declare-fun m!520519 () Bool)

(assert (=> d!81867 m!520519))

(declare-fun m!520521 () Bool)

(assert (=> d!81867 m!520521))

(assert (=> d!81867 m!520319))

(declare-fun m!520523 () Bool)

(assert (=> d!81867 m!520523))

(declare-fun m!520525 () Bool)

(assert (=> d!81867 m!520525))

(assert (=> d!81867 m!520517))

(declare-fun m!520527 () Bool)

(assert (=> b!542213 m!520527))

(assert (=> b!541894 d!81867))

(declare-fun b!542214 () Bool)

(declare-fun e!313877 () Bool)

(declare-fun e!313878 () Bool)

(assert (=> b!542214 (= e!313877 e!313878)))

(declare-fun res!336795 () Bool)

(declare-fun lt!247856 () SeekEntryResult!4925)

(assert (=> b!542214 (= res!336795 (and (is-Intermediate!4925 lt!247856) (not (undefined!5737 lt!247856)) (bvslt (x!50838 lt!247856) #b01111111111111111111111111111110) (bvsge (x!50838 lt!247856) #b00000000000000000000000000000000) (bvsge (x!50838 lt!247856) #b00000000000000000000000000000000)))))

(assert (=> b!542214 (=> (not res!336795) (not e!313878))))

(declare-fun b!542216 () Bool)

(assert (=> b!542216 (= e!313877 (bvsge (x!50838 lt!247856) #b01111111111111111111111111111110))))

(declare-fun e!313879 () SeekEntryResult!4925)

(declare-fun b!542217 () Bool)

(assert (=> b!542217 (= e!313879 (Intermediate!4925 false (toIndex!0 (select (arr!16467 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542218 () Bool)

(assert (=> b!542218 (and (bvsge (index!21926 lt!247856) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247856) (size!16831 a!3154)))))

(declare-fun res!336794 () Bool)

(assert (=> b!542218 (= res!336794 (= (select (arr!16467 a!3154) (index!21926 lt!247856)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313876 () Bool)

(assert (=> b!542218 (=> res!336794 e!313876)))

(declare-fun b!542219 () Bool)

(assert (=> b!542219 (= e!313879 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16467 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16467 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542220 () Bool)

(assert (=> b!542220 (and (bvsge (index!21926 lt!247856) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247856) (size!16831 a!3154)))))

(assert (=> b!542220 (= e!313876 (= (select (arr!16467 a!3154) (index!21926 lt!247856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!542221 () Bool)

(declare-fun e!313880 () SeekEntryResult!4925)

(assert (=> b!542221 (= e!313880 (Intermediate!4925 true (toIndex!0 (select (arr!16467 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542222 () Bool)

(assert (=> b!542222 (= e!313880 e!313879)))

(declare-fun c!63028 () Bool)

(declare-fun lt!247857 () (_ BitVec 64))

(assert (=> b!542222 (= c!63028 (or (= lt!247857 (select (arr!16467 a!3154) j!147)) (= (bvadd lt!247857 lt!247857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542215 () Bool)

(assert (=> b!542215 (and (bvsge (index!21926 lt!247856) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247856) (size!16831 a!3154)))))

(declare-fun res!336793 () Bool)

(assert (=> b!542215 (= res!336793 (= (select (arr!16467 a!3154) (index!21926 lt!247856)) (select (arr!16467 a!3154) j!147)))))

(assert (=> b!542215 (=> res!336793 e!313876)))

(assert (=> b!542215 (= e!313878 e!313876)))

(declare-fun d!81873 () Bool)

(assert (=> d!81873 e!313877))

(declare-fun c!63027 () Bool)

(assert (=> d!81873 (= c!63027 (and (is-Intermediate!4925 lt!247856) (undefined!5737 lt!247856)))))

(assert (=> d!81873 (= lt!247856 e!313880)))

(declare-fun c!63029 () Bool)

(assert (=> d!81873 (= c!63029 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81873 (= lt!247857 (select (arr!16467 a!3154) (toIndex!0 (select (arr!16467 a!3154) j!147) mask!3216)))))

(assert (=> d!81873 (validMask!0 mask!3216)))

(assert (=> d!81873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16467 a!3154) j!147) mask!3216) (select (arr!16467 a!3154) j!147) a!3154 mask!3216) lt!247856)))

(assert (= (and d!81873 c!63029) b!542221))

(assert (= (and d!81873 (not c!63029)) b!542222))

(assert (= (and b!542222 c!63028) b!542217))

(assert (= (and b!542222 (not c!63028)) b!542219))

(assert (= (and d!81873 c!63027) b!542216))

(assert (= (and d!81873 (not c!63027)) b!542214))

(assert (= (and b!542214 res!336795) b!542215))

(assert (= (and b!542215 (not res!336793)) b!542218))

(assert (= (and b!542218 (not res!336794)) b!542220))

(declare-fun m!520529 () Bool)

(assert (=> b!542220 m!520529))

(assert (=> b!542218 m!520529))

(assert (=> b!542215 m!520529))

(assert (=> b!542219 m!520313))

(declare-fun m!520531 () Bool)

(assert (=> b!542219 m!520531))

(assert (=> b!542219 m!520531))

(assert (=> b!542219 m!520311))

(declare-fun m!520533 () Bool)

(assert (=> b!542219 m!520533))

(assert (=> d!81873 m!520313))

(declare-fun m!520535 () Bool)

(assert (=> d!81873 m!520535))

(assert (=> d!81873 m!520319))

(assert (=> b!541895 d!81873))

(declare-fun d!81875 () Bool)

(declare-fun lt!247868 () (_ BitVec 32))

(declare-fun lt!247867 () (_ BitVec 32))

(assert (=> d!81875 (= lt!247868 (bvmul (bvxor lt!247867 (bvlshr lt!247867 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81875 (= lt!247867 ((_ extract 31 0) (bvand (bvxor (select (arr!16467 a!3154) j!147) (bvlshr (select (arr!16467 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81875 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336796 (let ((h!11538 ((_ extract 31 0) (bvand (bvxor (select (arr!16467 a!3154) j!147) (bvlshr (select (arr!16467 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50845 (bvmul (bvxor h!11538 (bvlshr h!11538 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50845 (bvlshr x!50845 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336796 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336796 #b00000000000000000000000000000000))))))

(assert (=> d!81875 (= (toIndex!0 (select (arr!16467 a!3154) j!147) mask!3216) (bvand (bvxor lt!247868 (bvlshr lt!247868 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!541895 d!81875))

(declare-fun d!81881 () Bool)

(assert (=> d!81881 (= (validKeyInArray!0 (select (arr!16467 a!3154) j!147)) (and (not (= (select (arr!16467 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16467 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541900 d!81881))

(declare-fun b!542238 () Bool)

(declare-fun e!313890 () Bool)

(declare-fun e!313891 () Bool)

(assert (=> b!542238 (= e!313890 e!313891)))

(declare-fun res!336803 () Bool)

(declare-fun lt!247873 () SeekEntryResult!4925)

(assert (=> b!542238 (= res!336803 (and (is-Intermediate!4925 lt!247873) (not (undefined!5737 lt!247873)) (bvslt (x!50838 lt!247873) #b01111111111111111111111111111110) (bvsge (x!50838 lt!247873) #b00000000000000000000000000000000) (bvsge (x!50838 lt!247873) x!1030)))))

(assert (=> b!542238 (=> (not res!336803) (not e!313891))))

(declare-fun b!542240 () Bool)

(assert (=> b!542240 (= e!313890 (bvsge (x!50838 lt!247873) #b01111111111111111111111111111110))))

(declare-fun b!542241 () Bool)

(declare-fun e!313892 () SeekEntryResult!4925)

(assert (=> b!542241 (= e!313892 (Intermediate!4925 false index!1177 x!1030))))

(declare-fun b!542242 () Bool)

(assert (=> b!542242 (and (bvsge (index!21926 lt!247873) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247873) (size!16831 (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154)))))))

(declare-fun res!336802 () Bool)

(assert (=> b!542242 (= res!336802 (= (select (arr!16467 (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154))) (index!21926 lt!247873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313889 () Bool)

(assert (=> b!542242 (=> res!336802 e!313889)))

(declare-fun b!542243 () Bool)

(assert (=> b!542243 (= e!313892 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (store (arr!16467 a!3154) i!1153 k!1998) j!147) (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154)) mask!3216))))

(declare-fun b!542244 () Bool)

(assert (=> b!542244 (and (bvsge (index!21926 lt!247873) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247873) (size!16831 (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154)))))))

(assert (=> b!542244 (= e!313889 (= (select (arr!16467 (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154))) (index!21926 lt!247873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!542245 () Bool)

(declare-fun e!313893 () SeekEntryResult!4925)

(assert (=> b!542245 (= e!313893 (Intermediate!4925 true index!1177 x!1030))))

(declare-fun b!542246 () Bool)

(assert (=> b!542246 (= e!313893 e!313892)))

(declare-fun lt!247874 () (_ BitVec 64))

(declare-fun c!63037 () Bool)

(assert (=> b!542246 (= c!63037 (or (= lt!247874 (select (store (arr!16467 a!3154) i!1153 k!1998) j!147)) (= (bvadd lt!247874 lt!247874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542239 () Bool)

(assert (=> b!542239 (and (bvsge (index!21926 lt!247873) #b00000000000000000000000000000000) (bvslt (index!21926 lt!247873) (size!16831 (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154)))))))

(declare-fun res!336801 () Bool)

(assert (=> b!542239 (= res!336801 (= (select (arr!16467 (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154))) (index!21926 lt!247873)) (select (store (arr!16467 a!3154) i!1153 k!1998) j!147)))))

(assert (=> b!542239 (=> res!336801 e!313889)))

(assert (=> b!542239 (= e!313891 e!313889)))

(declare-fun d!81883 () Bool)

(assert (=> d!81883 e!313890))

(declare-fun c!63036 () Bool)

(assert (=> d!81883 (= c!63036 (and (is-Intermediate!4925 lt!247873) (undefined!5737 lt!247873)))))

(assert (=> d!81883 (= lt!247873 e!313893)))

(declare-fun c!63038 () Bool)

(assert (=> d!81883 (= c!63038 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81883 (= lt!247874 (select (arr!16467 (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154))) index!1177))))

(assert (=> d!81883 (validMask!0 mask!3216)))

(assert (=> d!81883 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16467 a!3154) i!1153 k!1998) j!147) (array!34266 (store (arr!16467 a!3154) i!1153 k!1998) (size!16831 a!3154)) mask!3216) lt!247873)))

(assert (= (and d!81883 c!63038) b!542245))

(assert (= (and d!81883 (not c!63038)) b!542246))

(assert (= (and b!542246 c!63037) b!542241))

(assert (= (and b!542246 (not c!63037)) b!542243))

(assert (= (and d!81883 c!63036) b!542240))

(assert (= (and d!81883 (not c!63036)) b!542238))

(assert (= (and b!542238 res!336803) b!542239))

(assert (= (and b!542239 (not res!336801)) b!542242))

(assert (= (and b!542242 (not res!336802)) b!542244))

(declare-fun m!520559 () Bool)

(assert (=> b!542244 m!520559))

(assert (=> b!542242 m!520559))

(assert (=> b!542239 m!520559))

(assert (=> b!542243 m!520491))

(assert (=> b!542243 m!520491))

(assert (=> b!542243 m!520331))

(declare-fun m!520561 () Bool)

(assert (=> b!542243 m!520561))

(declare-fun m!520563 () Bool)

(assert (=> d!81883 m!520563))

(assert (=> d!81883 m!520319))

(assert (=> b!541901 d!81883))

(declare-fun d!81887 () Bool)

(assert (=> d!81887 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541891 d!81887))

(declare-fun bm!32066 () Bool)

(declare-fun call!32069 () Bool)

(declare-fun c!63041 () Bool)

(assert (=> bm!32066 (= call!32069 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63041 (Cons!10582 (select (arr!16467 a!3154) #b00000000000000000000000000000000) Nil!10583) Nil!10583)))))

(declare-fun b!542258 () Bool)

(declare-fun e!313903 () Bool)

(declare-fun contains!2804 (List!10586 (_ BitVec 64)) Bool)

(assert (=> b!542258 (= e!313903 (contains!2804 Nil!10583 (select (arr!16467 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542259 () Bool)

(declare-fun e!313905 () Bool)

(declare-fun e!313904 () Bool)

(assert (=> b!542259 (= e!313905 e!313904)))

(assert (=> b!542259 (= c!63041 (validKeyInArray!0 (select (arr!16467 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542260 () Bool)

(declare-fun e!313902 () Bool)

(assert (=> b!542260 (= e!313902 e!313905)))

(declare-fun res!336812 () Bool)

(assert (=> b!542260 (=> (not res!336812) (not e!313905))))

(assert (=> b!542260 (= res!336812 (not e!313903))))

(declare-fun res!336811 () Bool)

(assert (=> b!542260 (=> (not res!336811) (not e!313903))))

(assert (=> b!542260 (= res!336811 (validKeyInArray!0 (select (arr!16467 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542261 () Bool)

(assert (=> b!542261 (= e!313904 call!32069)))

(declare-fun d!81889 () Bool)

(declare-fun res!336810 () Bool)

(assert (=> d!81889 (=> res!336810 e!313902)))

(assert (=> d!81889 (= res!336810 (bvsge #b00000000000000000000000000000000 (size!16831 a!3154)))))

(assert (=> d!81889 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10583) e!313902)))

(declare-fun b!542257 () Bool)

(assert (=> b!542257 (= e!313904 call!32069)))

(assert (= (and d!81889 (not res!336810)) b!542260))

(assert (= (and b!542260 res!336811) b!542258))

(assert (= (and b!542260 res!336812) b!542259))

(assert (= (and b!542259 c!63041) b!542261))

(assert (= (and b!542259 (not c!63041)) b!542257))

(assert (= (or b!542261 b!542257) bm!32066))

(assert (=> bm!32066 m!520465))

(declare-fun m!520565 () Bool)

(assert (=> bm!32066 m!520565))

(assert (=> b!542258 m!520465))

(assert (=> b!542258 m!520465))

(declare-fun m!520567 () Bool)

(assert (=> b!542258 m!520567))

(assert (=> b!542259 m!520465))

(assert (=> b!542259 m!520465))

(assert (=> b!542259 m!520475))

(assert (=> b!542260 m!520465))

(assert (=> b!542260 m!520465))

(assert (=> b!542260 m!520475))

(assert (=> b!541897 d!81889))

(push 1)

(assert (not b!542243))

(assert (not b!542078))

(assert (not b!542213))

(assert (not b!542219))

(assert (not bm!32066))

(assert (not d!81851))

(assert (not b!542259))

(assert (not b!542260))

(assert (not b!542258))

(assert (not d!81883))

(assert (not d!81867))

(assert (not b!542129))

(assert (not b!542080))

(assert (not b!542144))

(assert (not bm!32057))

(assert (not d!81873))

(check-sat)

(pop 1)

(push 1)

(check-sat)

