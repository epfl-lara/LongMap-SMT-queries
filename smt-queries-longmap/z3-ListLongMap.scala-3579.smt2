; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49208 () Bool)

(assert start!49208)

(declare-fun e!313710 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4926 0))(
  ( (MissingZero!4926 (index!21928 (_ BitVec 32))) (Found!4926 (index!21929 (_ BitVec 32))) (Intermediate!4926 (undefined!5738 Bool) (index!21930 (_ BitVec 32)) (x!50839 (_ BitVec 32))) (Undefined!4926) (MissingVacant!4926 (index!21931 (_ BitVec 32))) )
))
(declare-fun lt!247764 () SeekEntryResult!4926)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34267 0))(
  ( (array!34268 (arr!16468 (Array (_ BitVec 32) (_ BitVec 64))) (size!16832 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34267)

(declare-fun b!541926 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34267 (_ BitVec 32)) SeekEntryResult!4926)

(assert (=> b!541926 (= e!313710 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16468 a!3154) i!1153 k0!1998) j!147) (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154)) mask!3216) lt!247764)))))

(declare-fun b!541927 () Bool)

(declare-fun res!336664 () Bool)

(assert (=> b!541927 (=> (not res!336664) (not e!313710))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!541927 (= res!336664 (and (not (= (select (arr!16468 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16468 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16468 a!3154) index!1177) (select (arr!16468 a!3154) j!147)) (= index!1177 resIndex!32)))))

(declare-fun res!336663 () Bool)

(declare-fun e!313709 () Bool)

(assert (=> start!49208 (=> (not res!336663) (not e!313709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49208 (= res!336663 (validMask!0 mask!3216))))

(assert (=> start!49208 e!313709))

(assert (=> start!49208 true))

(declare-fun array_inv!12264 (array!34267) Bool)

(assert (=> start!49208 (array_inv!12264 a!3154)))

(declare-fun b!541928 () Bool)

(declare-fun res!336665 () Bool)

(assert (=> b!541928 (=> (not res!336665) (not e!313709))))

(declare-fun arrayContainsKey!0 (array!34267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541928 (= res!336665 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541929 () Bool)

(declare-fun res!336659 () Bool)

(assert (=> b!541929 (=> (not res!336659) (not e!313709))))

(assert (=> b!541929 (= res!336659 (and (= (size!16832 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16832 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16832 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541930 () Bool)

(declare-fun res!336654 () Bool)

(declare-fun e!313708 () Bool)

(assert (=> b!541930 (=> (not res!336654) (not e!313708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34267 (_ BitVec 32)) Bool)

(assert (=> b!541930 (= res!336654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541931 () Bool)

(assert (=> b!541931 (= e!313708 e!313710)))

(declare-fun res!336656 () Bool)

(assert (=> b!541931 (=> (not res!336656) (not e!313710))))

(declare-fun lt!247765 () SeekEntryResult!4926)

(assert (=> b!541931 (= res!336656 (= lt!247765 lt!247764))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541931 (= lt!247764 (Intermediate!4926 false resIndex!32 resX!32))))

(assert (=> b!541931 (= lt!247765 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16468 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541932 () Bool)

(declare-fun res!336660 () Bool)

(assert (=> b!541932 (=> (not res!336660) (not e!313709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541932 (= res!336660 (validKeyInArray!0 k0!1998))))

(declare-fun b!541933 () Bool)

(declare-fun res!336657 () Bool)

(assert (=> b!541933 (=> (not res!336657) (not e!313710))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541933 (= res!336657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216) lt!247765))))

(declare-fun b!541934 () Bool)

(declare-fun res!336662 () Bool)

(assert (=> b!541934 (=> (not res!336662) (not e!313708))))

(declare-datatypes ((List!10587 0))(
  ( (Nil!10584) (Cons!10583 (h!11535 (_ BitVec 64)) (t!16815 List!10587)) )
))
(declare-fun arrayNoDuplicates!0 (array!34267 (_ BitVec 32) List!10587) Bool)

(assert (=> b!541934 (= res!336662 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10584))))

(declare-fun b!541935 () Bool)

(declare-fun res!336658 () Bool)

(assert (=> b!541935 (=> (not res!336658) (not e!313708))))

(assert (=> b!541935 (= res!336658 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16832 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16832 a!3154)) (= (select (arr!16468 a!3154) resIndex!32) (select (arr!16468 a!3154) j!147))))))

(declare-fun b!541936 () Bool)

(declare-fun res!336661 () Bool)

(assert (=> b!541936 (=> (not res!336661) (not e!313709))))

(assert (=> b!541936 (= res!336661 (validKeyInArray!0 (select (arr!16468 a!3154) j!147)))))

(declare-fun b!541937 () Bool)

(assert (=> b!541937 (= e!313709 e!313708)))

(declare-fun res!336655 () Bool)

(assert (=> b!541937 (=> (not res!336655) (not e!313708))))

(declare-fun lt!247763 () SeekEntryResult!4926)

(assert (=> b!541937 (= res!336655 (or (= lt!247763 (MissingZero!4926 i!1153)) (= lt!247763 (MissingVacant!4926 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34267 (_ BitVec 32)) SeekEntryResult!4926)

(assert (=> b!541937 (= lt!247763 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!49208 res!336663) b!541929))

(assert (= (and b!541929 res!336659) b!541936))

(assert (= (and b!541936 res!336661) b!541932))

(assert (= (and b!541932 res!336660) b!541928))

(assert (= (and b!541928 res!336665) b!541937))

(assert (= (and b!541937 res!336655) b!541930))

(assert (= (and b!541930 res!336654) b!541934))

(assert (= (and b!541934 res!336662) b!541935))

(assert (= (and b!541935 res!336658) b!541931))

(assert (= (and b!541931 res!336656) b!541933))

(assert (= (and b!541933 res!336657) b!541927))

(assert (= (and b!541927 res!336664) b!541926))

(declare-fun m!520345 () Bool)

(assert (=> b!541927 m!520345))

(declare-fun m!520347 () Bool)

(assert (=> b!541927 m!520347))

(declare-fun m!520349 () Bool)

(assert (=> b!541930 m!520349))

(declare-fun m!520351 () Bool)

(assert (=> b!541928 m!520351))

(declare-fun m!520353 () Bool)

(assert (=> b!541926 m!520353))

(declare-fun m!520355 () Bool)

(assert (=> b!541926 m!520355))

(assert (=> b!541926 m!520355))

(declare-fun m!520357 () Bool)

(assert (=> b!541926 m!520357))

(declare-fun m!520359 () Bool)

(assert (=> b!541937 m!520359))

(assert (=> b!541933 m!520347))

(assert (=> b!541933 m!520347))

(declare-fun m!520361 () Bool)

(assert (=> b!541933 m!520361))

(assert (=> b!541933 m!520361))

(assert (=> b!541933 m!520347))

(declare-fun m!520363 () Bool)

(assert (=> b!541933 m!520363))

(declare-fun m!520365 () Bool)

(assert (=> b!541934 m!520365))

(declare-fun m!520367 () Bool)

(assert (=> b!541935 m!520367))

(assert (=> b!541935 m!520347))

(assert (=> b!541931 m!520347))

(assert (=> b!541931 m!520347))

(declare-fun m!520369 () Bool)

(assert (=> b!541931 m!520369))

(declare-fun m!520371 () Bool)

(assert (=> b!541932 m!520371))

(declare-fun m!520373 () Bool)

(assert (=> start!49208 m!520373))

(declare-fun m!520375 () Bool)

(assert (=> start!49208 m!520375))

(assert (=> b!541936 m!520347))

(assert (=> b!541936 m!520347))

(declare-fun m!520377 () Bool)

(assert (=> b!541936 m!520377))

(check-sat (not b!541931) (not b!541936) (not b!541937) (not start!49208) (not b!541932) (not b!541926) (not b!541934) (not b!541933) (not b!541928) (not b!541930))
(check-sat)
(get-model)

(declare-fun d!81821 () Bool)

(assert (=> d!81821 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541932 d!81821))

(declare-fun b!541987 () Bool)

(declare-fun e!313730 () SeekEntryResult!4926)

(declare-fun e!313731 () SeekEntryResult!4926)

(assert (=> b!541987 (= e!313730 e!313731)))

(declare-fun lt!247782 () (_ BitVec 64))

(declare-fun lt!247781 () SeekEntryResult!4926)

(assert (=> b!541987 (= lt!247782 (select (arr!16468 a!3154) (index!21930 lt!247781)))))

(declare-fun c!62960 () Bool)

(assert (=> b!541987 (= c!62960 (= lt!247782 k0!1998))))

(declare-fun b!541988 () Bool)

(assert (=> b!541988 (= e!313731 (Found!4926 (index!21930 lt!247781)))))

(declare-fun b!541989 () Bool)

(declare-fun e!313729 () SeekEntryResult!4926)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34267 (_ BitVec 32)) SeekEntryResult!4926)

(assert (=> b!541989 (= e!313729 (seekKeyOrZeroReturnVacant!0 (x!50839 lt!247781) (index!21930 lt!247781) (index!21930 lt!247781) k0!1998 a!3154 mask!3216))))

(declare-fun b!541990 () Bool)

(assert (=> b!541990 (= e!313730 Undefined!4926)))

(declare-fun b!541991 () Bool)

(declare-fun c!62958 () Bool)

(assert (=> b!541991 (= c!62958 (= lt!247782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541991 (= e!313731 e!313729)))

(declare-fun b!541986 () Bool)

(assert (=> b!541986 (= e!313729 (MissingZero!4926 (index!21930 lt!247781)))))

(declare-fun d!81823 () Bool)

(declare-fun lt!247783 () SeekEntryResult!4926)

(get-info :version)

(assert (=> d!81823 (and (or ((_ is Undefined!4926) lt!247783) (not ((_ is Found!4926) lt!247783)) (and (bvsge (index!21929 lt!247783) #b00000000000000000000000000000000) (bvslt (index!21929 lt!247783) (size!16832 a!3154)))) (or ((_ is Undefined!4926) lt!247783) ((_ is Found!4926) lt!247783) (not ((_ is MissingZero!4926) lt!247783)) (and (bvsge (index!21928 lt!247783) #b00000000000000000000000000000000) (bvslt (index!21928 lt!247783) (size!16832 a!3154)))) (or ((_ is Undefined!4926) lt!247783) ((_ is Found!4926) lt!247783) ((_ is MissingZero!4926) lt!247783) (not ((_ is MissingVacant!4926) lt!247783)) (and (bvsge (index!21931 lt!247783) #b00000000000000000000000000000000) (bvslt (index!21931 lt!247783) (size!16832 a!3154)))) (or ((_ is Undefined!4926) lt!247783) (ite ((_ is Found!4926) lt!247783) (= (select (arr!16468 a!3154) (index!21929 lt!247783)) k0!1998) (ite ((_ is MissingZero!4926) lt!247783) (= (select (arr!16468 a!3154) (index!21928 lt!247783)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4926) lt!247783) (= (select (arr!16468 a!3154) (index!21931 lt!247783)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81823 (= lt!247783 e!313730)))

(declare-fun c!62959 () Bool)

(assert (=> d!81823 (= c!62959 (and ((_ is Intermediate!4926) lt!247781) (undefined!5738 lt!247781)))))

(assert (=> d!81823 (= lt!247781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81823 (validMask!0 mask!3216)))

(assert (=> d!81823 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247783)))

(assert (= (and d!81823 c!62959) b!541990))

(assert (= (and d!81823 (not c!62959)) b!541987))

(assert (= (and b!541987 c!62960) b!541988))

(assert (= (and b!541987 (not c!62960)) b!541991))

(assert (= (and b!541991 c!62958) b!541986))

(assert (= (and b!541991 (not c!62958)) b!541989))

(declare-fun m!520413 () Bool)

(assert (=> b!541987 m!520413))

(declare-fun m!520415 () Bool)

(assert (=> b!541989 m!520415))

(declare-fun m!520417 () Bool)

(assert (=> d!81823 m!520417))

(declare-fun m!520419 () Bool)

(assert (=> d!81823 m!520419))

(declare-fun m!520421 () Bool)

(assert (=> d!81823 m!520421))

(declare-fun m!520423 () Bool)

(assert (=> d!81823 m!520423))

(assert (=> d!81823 m!520373))

(assert (=> d!81823 m!520423))

(declare-fun m!520425 () Bool)

(assert (=> d!81823 m!520425))

(assert (=> b!541937 d!81823))

(declare-fun d!81825 () Bool)

(declare-fun res!336706 () Bool)

(declare-fun e!313736 () Bool)

(assert (=> d!81825 (=> res!336706 e!313736)))

(assert (=> d!81825 (= res!336706 (= (select (arr!16468 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81825 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!313736)))

(declare-fun b!541996 () Bool)

(declare-fun e!313737 () Bool)

(assert (=> b!541996 (= e!313736 e!313737)))

(declare-fun res!336707 () Bool)

(assert (=> b!541996 (=> (not res!336707) (not e!313737))))

(assert (=> b!541996 (= res!336707 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16832 a!3154)))))

(declare-fun b!541997 () Bool)

(assert (=> b!541997 (= e!313737 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81825 (not res!336706)) b!541996))

(assert (= (and b!541996 res!336707) b!541997))

(declare-fun m!520427 () Bool)

(assert (=> d!81825 m!520427))

(declare-fun m!520429 () Bool)

(assert (=> b!541997 m!520429))

(assert (=> b!541928 d!81825))

(declare-fun b!542016 () Bool)

(declare-fun e!313748 () Bool)

(declare-fun e!313749 () Bool)

(assert (=> b!542016 (= e!313748 e!313749)))

(declare-fun res!336716 () Bool)

(declare-fun lt!247789 () SeekEntryResult!4926)

(assert (=> b!542016 (= res!336716 (and ((_ is Intermediate!4926) lt!247789) (not (undefined!5738 lt!247789)) (bvslt (x!50839 lt!247789) #b01111111111111111111111111111110) (bvsge (x!50839 lt!247789) #b00000000000000000000000000000000) (bvsge (x!50839 lt!247789) #b00000000000000000000000000000000)))))

(assert (=> b!542016 (=> (not res!336716) (not e!313749))))

(declare-fun e!313751 () SeekEntryResult!4926)

(declare-fun b!542017 () Bool)

(assert (=> b!542017 (= e!313751 (Intermediate!4926 false (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542018 () Bool)

(declare-fun e!313752 () SeekEntryResult!4926)

(assert (=> b!542018 (= e!313752 e!313751)))

(declare-fun c!62967 () Bool)

(declare-fun lt!247788 () (_ BitVec 64))

(assert (=> b!542018 (= c!62967 (or (= lt!247788 (select (arr!16468 a!3154) j!147)) (= (bvadd lt!247788 lt!247788) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542019 () Bool)

(assert (=> b!542019 (and (bvsge (index!21930 lt!247789) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247789) (size!16832 a!3154)))))

(declare-fun res!336715 () Bool)

(assert (=> b!542019 (= res!336715 (= (select (arr!16468 a!3154) (index!21930 lt!247789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313750 () Bool)

(assert (=> b!542019 (=> res!336715 e!313750)))

(declare-fun b!542020 () Bool)

(assert (=> b!542020 (and (bvsge (index!21930 lt!247789) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247789) (size!16832 a!3154)))))

(declare-fun res!336714 () Bool)

(assert (=> b!542020 (= res!336714 (= (select (arr!16468 a!3154) (index!21930 lt!247789)) (select (arr!16468 a!3154) j!147)))))

(assert (=> b!542020 (=> res!336714 e!313750)))

(assert (=> b!542020 (= e!313749 e!313750)))

(declare-fun d!81827 () Bool)

(assert (=> d!81827 e!313748))

(declare-fun c!62968 () Bool)

(assert (=> d!81827 (= c!62968 (and ((_ is Intermediate!4926) lt!247789) (undefined!5738 lt!247789)))))

(assert (=> d!81827 (= lt!247789 e!313752)))

(declare-fun c!62969 () Bool)

(assert (=> d!81827 (= c!62969 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81827 (= lt!247788 (select (arr!16468 a!3154) (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216)))))

(assert (=> d!81827 (validMask!0 mask!3216)))

(assert (=> d!81827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216) lt!247789)))

(declare-fun b!542021 () Bool)

(assert (=> b!542021 (= e!313752 (Intermediate!4926 true (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542022 () Bool)

(assert (=> b!542022 (= e!313748 (bvsge (x!50839 lt!247789) #b01111111111111111111111111111110))))

(declare-fun b!542023 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542023 (= e!313751 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542024 () Bool)

(assert (=> b!542024 (and (bvsge (index!21930 lt!247789) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247789) (size!16832 a!3154)))))

(assert (=> b!542024 (= e!313750 (= (select (arr!16468 a!3154) (index!21930 lt!247789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81827 c!62969) b!542021))

(assert (= (and d!81827 (not c!62969)) b!542018))

(assert (= (and b!542018 c!62967) b!542017))

(assert (= (and b!542018 (not c!62967)) b!542023))

(assert (= (and d!81827 c!62968) b!542022))

(assert (= (and d!81827 (not c!62968)) b!542016))

(assert (= (and b!542016 res!336716) b!542020))

(assert (= (and b!542020 (not res!336714)) b!542019))

(assert (= (and b!542019 (not res!336715)) b!542024))

(declare-fun m!520431 () Bool)

(assert (=> b!542020 m!520431))

(assert (=> b!542023 m!520361))

(declare-fun m!520433 () Bool)

(assert (=> b!542023 m!520433))

(assert (=> b!542023 m!520433))

(assert (=> b!542023 m!520347))

(declare-fun m!520435 () Bool)

(assert (=> b!542023 m!520435))

(assert (=> b!542024 m!520431))

(assert (=> b!542019 m!520431))

(assert (=> d!81827 m!520361))

(declare-fun m!520437 () Bool)

(assert (=> d!81827 m!520437))

(assert (=> d!81827 m!520373))

(assert (=> b!541933 d!81827))

(declare-fun d!81829 () Bool)

(declare-fun lt!247795 () (_ BitVec 32))

(declare-fun lt!247794 () (_ BitVec 32))

(assert (=> d!81829 (= lt!247795 (bvmul (bvxor lt!247794 (bvlshr lt!247794 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81829 (= lt!247794 ((_ extract 31 0) (bvand (bvxor (select (arr!16468 a!3154) j!147) (bvlshr (select (arr!16468 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81829 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336717 (let ((h!11537 ((_ extract 31 0) (bvand (bvxor (select (arr!16468 a!3154) j!147) (bvlshr (select (arr!16468 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50842 (bvmul (bvxor h!11537 (bvlshr h!11537 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50842 (bvlshr x!50842 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336717 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336717 #b00000000000000000000000000000000))))))

(assert (=> d!81829 (= (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) (bvand (bvxor lt!247795 (bvlshr lt!247795 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!541933 d!81829))

(declare-fun b!542035 () Bool)

(declare-fun e!313761 () Bool)

(declare-fun call!32054 () Bool)

(assert (=> b!542035 (= e!313761 call!32054)))

(declare-fun b!542037 () Bool)

(assert (=> b!542037 (= e!313761 call!32054)))

(declare-fun b!542038 () Bool)

(declare-fun e!313764 () Bool)

(declare-fun contains!2802 (List!10587 (_ BitVec 64)) Bool)

(assert (=> b!542038 (= e!313764 (contains!2802 Nil!10584 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81831 () Bool)

(declare-fun res!336724 () Bool)

(declare-fun e!313762 () Bool)

(assert (=> d!81831 (=> res!336724 e!313762)))

(assert (=> d!81831 (= res!336724 (bvsge #b00000000000000000000000000000000 (size!16832 a!3154)))))

(assert (=> d!81831 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10584) e!313762)))

(declare-fun b!542036 () Bool)

(declare-fun e!313763 () Bool)

(assert (=> b!542036 (= e!313762 e!313763)))

(declare-fun res!336726 () Bool)

(assert (=> b!542036 (=> (not res!336726) (not e!313763))))

(assert (=> b!542036 (= res!336726 (not e!313764))))

(declare-fun res!336725 () Bool)

(assert (=> b!542036 (=> (not res!336725) (not e!313764))))

(assert (=> b!542036 (= res!336725 (validKeyInArray!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542039 () Bool)

(assert (=> b!542039 (= e!313763 e!313761)))

(declare-fun c!62972 () Bool)

(assert (=> b!542039 (= c!62972 (validKeyInArray!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32051 () Bool)

(assert (=> bm!32051 (= call!32054 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62972 (Cons!10583 (select (arr!16468 a!3154) #b00000000000000000000000000000000) Nil!10584) Nil!10584)))))

(assert (= (and d!81831 (not res!336724)) b!542036))

(assert (= (and b!542036 res!336725) b!542038))

(assert (= (and b!542036 res!336726) b!542039))

(assert (= (and b!542039 c!62972) b!542035))

(assert (= (and b!542039 (not c!62972)) b!542037))

(assert (= (or b!542035 b!542037) bm!32051))

(assert (=> b!542038 m!520427))

(assert (=> b!542038 m!520427))

(declare-fun m!520439 () Bool)

(assert (=> b!542038 m!520439))

(assert (=> b!542036 m!520427))

(assert (=> b!542036 m!520427))

(declare-fun m!520441 () Bool)

(assert (=> b!542036 m!520441))

(assert (=> b!542039 m!520427))

(assert (=> b!542039 m!520427))

(assert (=> b!542039 m!520441))

(assert (=> bm!32051 m!520427))

(declare-fun m!520443 () Bool)

(assert (=> bm!32051 m!520443))

(assert (=> b!541934 d!81831))

(declare-fun d!81833 () Bool)

(assert (=> d!81833 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49208 d!81833))

(declare-fun d!81835 () Bool)

(assert (=> d!81835 (= (array_inv!12264 a!3154) (bvsge (size!16832 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49208 d!81835))

(declare-fun b!542048 () Bool)

(declare-fun e!313773 () Bool)

(declare-fun call!32057 () Bool)

(assert (=> b!542048 (= e!313773 call!32057)))

(declare-fun d!81837 () Bool)

(declare-fun res!336731 () Bool)

(declare-fun e!313772 () Bool)

(assert (=> d!81837 (=> res!336731 e!313772)))

(assert (=> d!81837 (= res!336731 (bvsge #b00000000000000000000000000000000 (size!16832 a!3154)))))

(assert (=> d!81837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313772)))

(declare-fun b!542049 () Bool)

(declare-fun e!313771 () Bool)

(assert (=> b!542049 (= e!313771 e!313773)))

(declare-fun lt!247804 () (_ BitVec 64))

(assert (=> b!542049 (= lt!247804 (select (arr!16468 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16898 0))(
  ( (Unit!16899) )
))
(declare-fun lt!247802 () Unit!16898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34267 (_ BitVec 64) (_ BitVec 32)) Unit!16898)

(assert (=> b!542049 (= lt!247802 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247804 #b00000000000000000000000000000000))))

(assert (=> b!542049 (arrayContainsKey!0 a!3154 lt!247804 #b00000000000000000000000000000000)))

(declare-fun lt!247803 () Unit!16898)

(assert (=> b!542049 (= lt!247803 lt!247802)))

(declare-fun res!336732 () Bool)

(assert (=> b!542049 (= res!336732 (= (seekEntryOrOpen!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4926 #b00000000000000000000000000000000)))))

(assert (=> b!542049 (=> (not res!336732) (not e!313773))))

(declare-fun bm!32054 () Bool)

(assert (=> bm!32054 (= call!32057 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!542050 () Bool)

(assert (=> b!542050 (= e!313772 e!313771)))

(declare-fun c!62975 () Bool)

(assert (=> b!542050 (= c!62975 (validKeyInArray!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542051 () Bool)

(assert (=> b!542051 (= e!313771 call!32057)))

(assert (= (and d!81837 (not res!336731)) b!542050))

(assert (= (and b!542050 c!62975) b!542049))

(assert (= (and b!542050 (not c!62975)) b!542051))

(assert (= (and b!542049 res!336732) b!542048))

(assert (= (or b!542048 b!542051) bm!32054))

(assert (=> b!542049 m!520427))

(declare-fun m!520445 () Bool)

(assert (=> b!542049 m!520445))

(declare-fun m!520447 () Bool)

(assert (=> b!542049 m!520447))

(assert (=> b!542049 m!520427))

(declare-fun m!520449 () Bool)

(assert (=> b!542049 m!520449))

(declare-fun m!520451 () Bool)

(assert (=> bm!32054 m!520451))

(assert (=> b!542050 m!520427))

(assert (=> b!542050 m!520427))

(assert (=> b!542050 m!520441))

(assert (=> b!541930 d!81837))

(declare-fun d!81845 () Bool)

(assert (=> d!81845 (= (validKeyInArray!0 (select (arr!16468 a!3154) j!147)) (and (not (= (select (arr!16468 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16468 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541936 d!81845))

(declare-fun b!542058 () Bool)

(declare-fun e!313778 () Bool)

(declare-fun e!313779 () Bool)

(assert (=> b!542058 (= e!313778 e!313779)))

(declare-fun res!336737 () Bool)

(declare-fun lt!247812 () SeekEntryResult!4926)

(assert (=> b!542058 (= res!336737 (and ((_ is Intermediate!4926) lt!247812) (not (undefined!5738 lt!247812)) (bvslt (x!50839 lt!247812) #b01111111111111111111111111111110) (bvsge (x!50839 lt!247812) #b00000000000000000000000000000000) (bvsge (x!50839 lt!247812) x!1030)))))

(assert (=> b!542058 (=> (not res!336737) (not e!313779))))

(declare-fun b!542059 () Bool)

(declare-fun e!313781 () SeekEntryResult!4926)

(assert (=> b!542059 (= e!313781 (Intermediate!4926 false index!1177 x!1030))))

(declare-fun b!542060 () Bool)

(declare-fun e!313782 () SeekEntryResult!4926)

(assert (=> b!542060 (= e!313782 e!313781)))

(declare-fun lt!247811 () (_ BitVec 64))

(declare-fun c!62978 () Bool)

(assert (=> b!542060 (= c!62978 (or (= lt!247811 (select (store (arr!16468 a!3154) i!1153 k0!1998) j!147)) (= (bvadd lt!247811 lt!247811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542061 () Bool)

(assert (=> b!542061 (and (bvsge (index!21930 lt!247812) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247812) (size!16832 (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154)))))))

(declare-fun res!336736 () Bool)

(assert (=> b!542061 (= res!336736 (= (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154))) (index!21930 lt!247812)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313780 () Bool)

(assert (=> b!542061 (=> res!336736 e!313780)))

(declare-fun b!542062 () Bool)

(assert (=> b!542062 (and (bvsge (index!21930 lt!247812) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247812) (size!16832 (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154)))))))

(declare-fun res!336735 () Bool)

(assert (=> b!542062 (= res!336735 (= (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154))) (index!21930 lt!247812)) (select (store (arr!16468 a!3154) i!1153 k0!1998) j!147)))))

(assert (=> b!542062 (=> res!336735 e!313780)))

(assert (=> b!542062 (= e!313779 e!313780)))

(declare-fun d!81847 () Bool)

(assert (=> d!81847 e!313778))

(declare-fun c!62979 () Bool)

(assert (=> d!81847 (= c!62979 (and ((_ is Intermediate!4926) lt!247812) (undefined!5738 lt!247812)))))

(assert (=> d!81847 (= lt!247812 e!313782)))

(declare-fun c!62980 () Bool)

(assert (=> d!81847 (= c!62980 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81847 (= lt!247811 (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154))) index!1177))))

(assert (=> d!81847 (validMask!0 mask!3216)))

(assert (=> d!81847 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16468 a!3154) i!1153 k0!1998) j!147) (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154)) mask!3216) lt!247812)))

(declare-fun b!542063 () Bool)

(assert (=> b!542063 (= e!313782 (Intermediate!4926 true index!1177 x!1030))))

(declare-fun b!542064 () Bool)

(assert (=> b!542064 (= e!313778 (bvsge (x!50839 lt!247812) #b01111111111111111111111111111110))))

(declare-fun b!542065 () Bool)

(assert (=> b!542065 (= e!313781 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (store (arr!16468 a!3154) i!1153 k0!1998) j!147) (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154)) mask!3216))))

(declare-fun b!542066 () Bool)

(assert (=> b!542066 (and (bvsge (index!21930 lt!247812) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247812) (size!16832 (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154)))))))

(assert (=> b!542066 (= e!313780 (= (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k0!1998) (size!16832 a!3154))) (index!21930 lt!247812)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81847 c!62980) b!542063))

(assert (= (and d!81847 (not c!62980)) b!542060))

(assert (= (and b!542060 c!62978) b!542059))

(assert (= (and b!542060 (not c!62978)) b!542065))

(assert (= (and d!81847 c!62979) b!542064))

(assert (= (and d!81847 (not c!62979)) b!542058))

(assert (= (and b!542058 res!336737) b!542062))

(assert (= (and b!542062 (not res!336735)) b!542061))

(assert (= (and b!542061 (not res!336736)) b!542066))

(declare-fun m!520453 () Bool)

(assert (=> b!542062 m!520453))

(declare-fun m!520455 () Bool)

(assert (=> b!542065 m!520455))

(assert (=> b!542065 m!520455))

(assert (=> b!542065 m!520355))

(declare-fun m!520457 () Bool)

(assert (=> b!542065 m!520457))

(assert (=> b!542066 m!520453))

(assert (=> b!542061 m!520453))

(declare-fun m!520459 () Bool)

(assert (=> d!81847 m!520459))

(assert (=> d!81847 m!520373))

(assert (=> b!541926 d!81847))

(declare-fun b!542069 () Bool)

(declare-fun e!313785 () Bool)

(declare-fun e!313786 () Bool)

(assert (=> b!542069 (= e!313785 e!313786)))

(declare-fun res!336742 () Bool)

(declare-fun lt!247814 () SeekEntryResult!4926)

(assert (=> b!542069 (= res!336742 (and ((_ is Intermediate!4926) lt!247814) (not (undefined!5738 lt!247814)) (bvslt (x!50839 lt!247814) #b01111111111111111111111111111110) (bvsge (x!50839 lt!247814) #b00000000000000000000000000000000) (bvsge (x!50839 lt!247814) x!1030)))))

(assert (=> b!542069 (=> (not res!336742) (not e!313786))))

(declare-fun b!542070 () Bool)

(declare-fun e!313788 () SeekEntryResult!4926)

(assert (=> b!542070 (= e!313788 (Intermediate!4926 false index!1177 x!1030))))

(declare-fun b!542071 () Bool)

(declare-fun e!313789 () SeekEntryResult!4926)

(assert (=> b!542071 (= e!313789 e!313788)))

(declare-fun lt!247813 () (_ BitVec 64))

(declare-fun c!62981 () Bool)

(assert (=> b!542071 (= c!62981 (or (= lt!247813 (select (arr!16468 a!3154) j!147)) (= (bvadd lt!247813 lt!247813) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542072 () Bool)

(assert (=> b!542072 (and (bvsge (index!21930 lt!247814) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247814) (size!16832 a!3154)))))

(declare-fun res!336741 () Bool)

(assert (=> b!542072 (= res!336741 (= (select (arr!16468 a!3154) (index!21930 lt!247814)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313787 () Bool)

(assert (=> b!542072 (=> res!336741 e!313787)))

(declare-fun b!542073 () Bool)

(assert (=> b!542073 (and (bvsge (index!21930 lt!247814) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247814) (size!16832 a!3154)))))

(declare-fun res!336740 () Bool)

(assert (=> b!542073 (= res!336740 (= (select (arr!16468 a!3154) (index!21930 lt!247814)) (select (arr!16468 a!3154) j!147)))))

(assert (=> b!542073 (=> res!336740 e!313787)))

(assert (=> b!542073 (= e!313786 e!313787)))

(declare-fun d!81849 () Bool)

(assert (=> d!81849 e!313785))

(declare-fun c!62982 () Bool)

(assert (=> d!81849 (= c!62982 (and ((_ is Intermediate!4926) lt!247814) (undefined!5738 lt!247814)))))

(assert (=> d!81849 (= lt!247814 e!313789)))

(declare-fun c!62983 () Bool)

(assert (=> d!81849 (= c!62983 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81849 (= lt!247813 (select (arr!16468 a!3154) index!1177))))

(assert (=> d!81849 (validMask!0 mask!3216)))

(assert (=> d!81849 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16468 a!3154) j!147) a!3154 mask!3216) lt!247814)))

(declare-fun b!542074 () Bool)

(assert (=> b!542074 (= e!313789 (Intermediate!4926 true index!1177 x!1030))))

(declare-fun b!542075 () Bool)

(assert (=> b!542075 (= e!313785 (bvsge (x!50839 lt!247814) #b01111111111111111111111111111110))))

(declare-fun b!542076 () Bool)

(assert (=> b!542076 (= e!313788 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542077 () Bool)

(assert (=> b!542077 (and (bvsge (index!21930 lt!247814) #b00000000000000000000000000000000) (bvslt (index!21930 lt!247814) (size!16832 a!3154)))))

(assert (=> b!542077 (= e!313787 (= (select (arr!16468 a!3154) (index!21930 lt!247814)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81849 c!62983) b!542074))

(assert (= (and d!81849 (not c!62983)) b!542071))

(assert (= (and b!542071 c!62981) b!542070))

(assert (= (and b!542071 (not c!62981)) b!542076))

(assert (= (and d!81849 c!62982) b!542075))

(assert (= (and d!81849 (not c!62982)) b!542069))

(assert (= (and b!542069 res!336742) b!542073))

(assert (= (and b!542073 (not res!336740)) b!542072))

(assert (= (and b!542072 (not res!336741)) b!542077))

(declare-fun m!520461 () Bool)

(assert (=> b!542073 m!520461))

(assert (=> b!542076 m!520455))

(assert (=> b!542076 m!520455))

(assert (=> b!542076 m!520347))

(declare-fun m!520463 () Bool)

(assert (=> b!542076 m!520463))

(assert (=> b!542077 m!520461))

(assert (=> b!542072 m!520461))

(assert (=> d!81849 m!520345))

(assert (=> d!81849 m!520373))

(assert (=> b!541931 d!81849))

(check-sat (not b!542039) (not b!541997) (not bm!32054) (not b!542050) (not d!81849) (not d!81823) (not b!541989) (not b!542036) (not bm!32051) (not b!542065) (not d!81827) (not b!542049) (not b!542038) (not d!81847) (not b!542076) (not b!542023))
(check-sat)
