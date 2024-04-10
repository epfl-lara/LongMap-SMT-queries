; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48492 () Bool)

(assert start!48492)

(declare-fun b!532679 () Bool)

(declare-fun res!328033 () Bool)

(declare-fun e!310093 () Bool)

(assert (=> b!532679 (=> (not res!328033) (not e!310093))))

(declare-datatypes ((array!33755 0))(
  ( (array!33756 (arr!16218 (Array (_ BitVec 32) (_ BitVec 64))) (size!16582 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33755)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532679 (= res!328033 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532680 () Bool)

(declare-fun res!328029 () Bool)

(declare-fun e!310094 () Bool)

(assert (=> b!532680 (=> (not res!328029) (not e!310094))))

(declare-datatypes ((List!10337 0))(
  ( (Nil!10334) (Cons!10333 (h!11273 (_ BitVec 64)) (t!16565 List!10337)) )
))
(declare-fun arrayNoDuplicates!0 (array!33755 (_ BitVec 32) List!10337) Bool)

(assert (=> b!532680 (= res!328029 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10334))))

(declare-fun b!532681 () Bool)

(declare-fun res!328034 () Bool)

(assert (=> b!532681 (=> (not res!328034) (not e!310093))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532681 (= res!328034 (validKeyInArray!0 (select (arr!16218 a!3154) j!147)))))

(declare-fun b!532682 () Bool)

(declare-fun res!328025 () Bool)

(assert (=> b!532682 (=> (not res!328025) (not e!310094))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4676 0))(
  ( (MissingZero!4676 (index!20928 (_ BitVec 32))) (Found!4676 (index!20929 (_ BitVec 32))) (Intermediate!4676 (undefined!5488 Bool) (index!20930 (_ BitVec 32)) (x!49901 (_ BitVec 32))) (Undefined!4676) (MissingVacant!4676 (index!20931 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33755 (_ BitVec 32)) SeekEntryResult!4676)

(assert (=> b!532682 (= res!328025 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16218 a!3154) j!147) a!3154 mask!3216) (Intermediate!4676 false resIndex!32 resX!32)))))

(declare-fun b!532683 () Bool)

(declare-fun res!328030 () Bool)

(assert (=> b!532683 (=> (not res!328030) (not e!310093))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532683 (= res!328030 (and (= (size!16582 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16582 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16582 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!328026 () Bool)

(assert (=> start!48492 (=> (not res!328026) (not e!310093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48492 (= res!328026 (validMask!0 mask!3216))))

(assert (=> start!48492 e!310093))

(assert (=> start!48492 true))

(declare-fun array_inv!12014 (array!33755) Bool)

(assert (=> start!48492 (array_inv!12014 a!3154)))

(declare-fun b!532684 () Bool)

(declare-fun lt!245260 () (_ BitVec 32))

(assert (=> b!532684 (= e!310094 (and (bvsge mask!3216 #b00000000000000000000000000000000) (or (bvslt lt!245260 #b00000000000000000000000000000000) (bvsge lt!245260 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532684 (= lt!245260 (toIndex!0 (select (arr!16218 a!3154) j!147) mask!3216))))

(declare-fun b!532685 () Bool)

(declare-fun res!328027 () Bool)

(assert (=> b!532685 (=> (not res!328027) (not e!310093))))

(assert (=> b!532685 (= res!328027 (validKeyInArray!0 k!1998))))

(declare-fun b!532686 () Bool)

(declare-fun res!328031 () Bool)

(assert (=> b!532686 (=> (not res!328031) (not e!310094))))

(assert (=> b!532686 (= res!328031 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16582 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16582 a!3154)) (= (select (arr!16218 a!3154) resIndex!32) (select (arr!16218 a!3154) j!147))))))

(declare-fun b!532687 () Bool)

(declare-fun res!328032 () Bool)

(assert (=> b!532687 (=> (not res!328032) (not e!310094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33755 (_ BitVec 32)) Bool)

(assert (=> b!532687 (= res!328032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532688 () Bool)

(assert (=> b!532688 (= e!310093 e!310094)))

(declare-fun res!328028 () Bool)

(assert (=> b!532688 (=> (not res!328028) (not e!310094))))

(declare-fun lt!245259 () SeekEntryResult!4676)

(assert (=> b!532688 (= res!328028 (or (= lt!245259 (MissingZero!4676 i!1153)) (= lt!245259 (MissingVacant!4676 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33755 (_ BitVec 32)) SeekEntryResult!4676)

(assert (=> b!532688 (= lt!245259 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48492 res!328026) b!532683))

(assert (= (and b!532683 res!328030) b!532681))

(assert (= (and b!532681 res!328034) b!532685))

(assert (= (and b!532685 res!328027) b!532679))

(assert (= (and b!532679 res!328033) b!532688))

(assert (= (and b!532688 res!328028) b!532687))

(assert (= (and b!532687 res!328032) b!532680))

(assert (= (and b!532680 res!328029) b!532686))

(assert (= (and b!532686 res!328031) b!532682))

(assert (= (and b!532682 res!328025) b!532684))

(declare-fun m!512781 () Bool)

(assert (=> b!532685 m!512781))

(declare-fun m!512783 () Bool)

(assert (=> b!532682 m!512783))

(assert (=> b!532682 m!512783))

(declare-fun m!512785 () Bool)

(assert (=> b!532682 m!512785))

(declare-fun m!512787 () Bool)

(assert (=> b!532687 m!512787))

(declare-fun m!512789 () Bool)

(assert (=> b!532686 m!512789))

(assert (=> b!532686 m!512783))

(assert (=> b!532681 m!512783))

(assert (=> b!532681 m!512783))

(declare-fun m!512791 () Bool)

(assert (=> b!532681 m!512791))

(assert (=> b!532684 m!512783))

(assert (=> b!532684 m!512783))

(declare-fun m!512793 () Bool)

(assert (=> b!532684 m!512793))

(declare-fun m!512795 () Bool)

(assert (=> b!532679 m!512795))

(declare-fun m!512797 () Bool)

(assert (=> b!532688 m!512797))

(declare-fun m!512799 () Bool)

(assert (=> start!48492 m!512799))

(declare-fun m!512801 () Bool)

(assert (=> start!48492 m!512801))

(declare-fun m!512803 () Bool)

(assert (=> b!532680 m!512803))

(push 1)

(assert (not b!532685))

(assert (not b!532680))

(assert (not start!48492))

(assert (not b!532682))

(assert (not b!532687))

(assert (not b!532688))

(assert (not b!532684))

(assert (not b!532681))

(assert (not b!532679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!532800 () Bool)

(declare-fun e!310149 () SeekEntryResult!4676)

(assert (=> b!532800 (= e!310149 (Intermediate!4676 false index!1177 x!1030))))

(declare-fun d!81401 () Bool)

(declare-fun e!310145 () Bool)

(assert (=> d!81401 e!310145))

(declare-fun c!62654 () Bool)

(declare-fun lt!245284 () SeekEntryResult!4676)

(assert (=> d!81401 (= c!62654 (and (is-Intermediate!4676 lt!245284) (undefined!5488 lt!245284)))))

(declare-fun e!310146 () SeekEntryResult!4676)

(assert (=> d!81401 (= lt!245284 e!310146)))

(declare-fun c!62653 () Bool)

(assert (=> d!81401 (= c!62653 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!245283 () (_ BitVec 64))

(assert (=> d!81401 (= lt!245283 (select (arr!16218 a!3154) index!1177))))

(assert (=> d!81401 (validMask!0 mask!3216)))

(assert (=> d!81401 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16218 a!3154) j!147) a!3154 mask!3216) lt!245284)))

(declare-fun b!532801 () Bool)

(assert (=> b!532801 (and (bvsge (index!20930 lt!245284) #b00000000000000000000000000000000) (bvslt (index!20930 lt!245284) (size!16582 a!3154)))))

(declare-fun e!310148 () Bool)

(assert (=> b!532801 (= e!310148 (= (select (arr!16218 a!3154) (index!20930 lt!245284)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!532802 () Bool)

(declare-fun e!310147 () Bool)

(assert (=> b!532802 (= e!310145 e!310147)))

(declare-fun res!328118 () Bool)

(assert (=> b!532802 (= res!328118 (and (is-Intermediate!4676 lt!245284) (not (undefined!5488 lt!245284)) (bvslt (x!49901 lt!245284) #b01111111111111111111111111111110) (bvsge (x!49901 lt!245284) #b00000000000000000000000000000000) (bvsge (x!49901 lt!245284) x!1030)))))

(assert (=> b!532802 (=> (not res!328118) (not e!310147))))

(declare-fun b!532803 () Bool)

(assert (=> b!532803 (= e!310146 e!310149)))

(declare-fun c!62652 () Bool)

(assert (=> b!532803 (= c!62652 (or (= lt!245283 (select (arr!16218 a!3154) j!147)) (= (bvadd lt!245283 lt!245283) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!532804 () Bool)

(assert (=> b!532804 (and (bvsge (index!20930 lt!245284) #b00000000000000000000000000000000) (bvslt (index!20930 lt!245284) (size!16582 a!3154)))))

(declare-fun res!328116 () Bool)

(assert (=> b!532804 (= res!328116 (= (select (arr!16218 a!3154) (index!20930 lt!245284)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532804 (=> res!328116 e!310148)))

(declare-fun b!532805 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532805 (= e!310149 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16218 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532806 () Bool)

(assert (=> b!532806 (= e!310146 (Intermediate!4676 true index!1177 x!1030))))

(declare-fun b!532807 () Bool)

(assert (=> b!532807 (= e!310145 (bvsge (x!49901 lt!245284) #b01111111111111111111111111111110))))

(declare-fun b!532808 () Bool)

(assert (=> b!532808 (and (bvsge (index!20930 lt!245284) #b00000000000000000000000000000000) (bvslt (index!20930 lt!245284) (size!16582 a!3154)))))

(declare-fun res!328117 () Bool)

(assert (=> b!532808 (= res!328117 (= (select (arr!16218 a!3154) (index!20930 lt!245284)) (select (arr!16218 a!3154) j!147)))))

(assert (=> b!532808 (=> res!328117 e!310148)))

(assert (=> b!532808 (= e!310147 e!310148)))

(assert (= (and d!81401 c!62653) b!532806))

(assert (= (and d!81401 (not c!62653)) b!532803))

(assert (= (and b!532803 c!62652) b!532800))

(assert (= (and b!532803 (not c!62652)) b!532805))

(assert (= (and d!81401 c!62654) b!532807))

(assert (= (and d!81401 (not c!62654)) b!532802))

(assert (= (and b!532802 res!328118) b!532808))

(assert (= (and b!532808 (not res!328117)) b!532804))

(assert (= (and b!532804 (not res!328116)) b!532801))

(declare-fun m!512865 () Bool)

(assert (=> b!532801 m!512865))

(declare-fun m!512867 () Bool)

(assert (=> b!532805 m!512867))

(assert (=> b!532805 m!512867))

(assert (=> b!532805 m!512783))

(declare-fun m!512869 () Bool)

(assert (=> b!532805 m!512869))

(assert (=> b!532804 m!512865))

(assert (=> b!532808 m!512865))

(declare-fun m!512871 () Bool)

(assert (=> d!81401 m!512871))

(assert (=> d!81401 m!512799))

(assert (=> b!532682 d!81401))

(declare-fun d!81407 () Bool)

(assert (=> d!81407 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48492 d!81407))

(declare-fun d!81417 () Bool)

(assert (=> d!81417 (= (array_inv!12014 a!3154) (bvsge (size!16582 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48492 d!81417))

(declare-fun b!532896 () Bool)

(declare-fun e!310210 () SeekEntryResult!4676)

(assert (=> b!532896 (= e!310210 Undefined!4676)))

(declare-fun b!532897 () Bool)

(declare-fun e!310212 () SeekEntryResult!4676)

(declare-fun lt!245313 () SeekEntryResult!4676)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33755 (_ BitVec 32)) SeekEntryResult!4676)

(assert (=> b!532897 (= e!310212 (seekKeyOrZeroReturnVacant!0 (x!49901 lt!245313) (index!20930 lt!245313) (index!20930 lt!245313) k!1998 a!3154 mask!3216))))

(declare-fun b!532898 () Bool)

(declare-fun e!310211 () SeekEntryResult!4676)

(assert (=> b!532898 (= e!310211 (Found!4676 (index!20930 lt!245313)))))

(declare-fun b!532899 () Bool)

(assert (=> b!532899 (= e!310210 e!310211)))

(declare-fun lt!245314 () (_ BitVec 64))

(assert (=> b!532899 (= lt!245314 (select (arr!16218 a!3154) (index!20930 lt!245313)))))

(declare-fun c!62679 () Bool)

(assert (=> b!532899 (= c!62679 (= lt!245314 k!1998))))

(declare-fun b!532900 () Bool)

(declare-fun c!62681 () Bool)

(assert (=> b!532900 (= c!62681 (= lt!245314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532900 (= e!310211 e!310212)))

(declare-fun b!532901 () Bool)

(assert (=> b!532901 (= e!310212 (MissingZero!4676 (index!20930 lt!245313)))))

(declare-fun d!81419 () Bool)

(declare-fun lt!245312 () SeekEntryResult!4676)

(assert (=> d!81419 (and (or (is-Undefined!4676 lt!245312) (not (is-Found!4676 lt!245312)) (and (bvsge (index!20929 lt!245312) #b00000000000000000000000000000000) (bvslt (index!20929 lt!245312) (size!16582 a!3154)))) (or (is-Undefined!4676 lt!245312) (is-Found!4676 lt!245312) (not (is-MissingZero!4676 lt!245312)) (and (bvsge (index!20928 lt!245312) #b00000000000000000000000000000000) (bvslt (index!20928 lt!245312) (size!16582 a!3154)))) (or (is-Undefined!4676 lt!245312) (is-Found!4676 lt!245312) (is-MissingZero!4676 lt!245312) (not (is-MissingVacant!4676 lt!245312)) (and (bvsge (index!20931 lt!245312) #b00000000000000000000000000000000) (bvslt (index!20931 lt!245312) (size!16582 a!3154)))) (or (is-Undefined!4676 lt!245312) (ite (is-Found!4676 lt!245312) (= (select (arr!16218 a!3154) (index!20929 lt!245312)) k!1998) (ite (is-MissingZero!4676 lt!245312) (= (select (arr!16218 a!3154) (index!20928 lt!245312)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4676 lt!245312) (= (select (arr!16218 a!3154) (index!20931 lt!245312)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81419 (= lt!245312 e!310210)))

(declare-fun c!62680 () Bool)

(assert (=> d!81419 (= c!62680 (and (is-Intermediate!4676 lt!245313) (undefined!5488 lt!245313)))))

(assert (=> d!81419 (= lt!245313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81419 (validMask!0 mask!3216)))

(assert (=> d!81419 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!245312)))

(assert (= (and d!81419 c!62680) b!532896))

(assert (= (and d!81419 (not c!62680)) b!532899))

(assert (= (and b!532899 c!62679) b!532898))

(assert (= (and b!532899 (not c!62679)) b!532900))

(assert (= (and b!532900 c!62681) b!532901))

(assert (= (and b!532900 (not c!62681)) b!532897))

(declare-fun m!512905 () Bool)

(assert (=> b!532897 m!512905))

(declare-fun m!512907 () Bool)

(assert (=> b!532899 m!512907))

(declare-fun m!512909 () Bool)

(assert (=> d!81419 m!512909))

(declare-fun m!512911 () Bool)

(assert (=> d!81419 m!512911))

(assert (=> d!81419 m!512799))

(declare-fun m!512913 () Bool)

(assert (=> d!81419 m!512913))

(declare-fun m!512915 () Bool)

(assert (=> d!81419 m!512915))

(declare-fun m!512917 () Bool)

(assert (=> d!81419 m!512917))

(assert (=> d!81419 m!512913))

(assert (=> b!532688 d!81419))

(declare-fun d!81439 () Bool)

(declare-fun lt!245326 () (_ BitVec 32))

(declare-fun lt!245325 () (_ BitVec 32))

(assert (=> d!81439 (= lt!245326 (bvmul (bvxor lt!245325 (bvlshr lt!245325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81439 (= lt!245325 ((_ extract 31 0) (bvand (bvxor (select (arr!16218 a!3154) j!147) (bvlshr (select (arr!16218 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81439 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!328160 (let ((h!11278 ((_ extract 31 0) (bvand (bvxor (select (arr!16218 a!3154) j!147) (bvlshr (select (arr!16218 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49909 (bvmul (bvxor h!11278 (bvlshr h!11278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49909 (bvlshr x!49909 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!328160 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!328160 #b00000000000000000000000000000000))))))

(assert (=> d!81439 (= (toIndex!0 (select (arr!16218 a!3154) j!147) mask!3216) (bvand (bvxor lt!245326 (bvlshr lt!245326 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!532684 d!81439))

(declare-fun d!81443 () Bool)

(declare-fun res!328169 () Bool)

(declare-fun e!310223 () Bool)

(assert (=> d!81443 (=> res!328169 e!310223)))

(assert (=> d!81443 (= res!328169 (= (select (arr!16218 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81443 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!310223)))

(declare-fun b!532914 () Bool)

(declare-fun e!310224 () Bool)

(assert (=> b!532914 (= e!310223 e!310224)))

(declare-fun res!328170 () Bool)

(assert (=> b!532914 (=> (not res!328170) (not e!310224))))

(assert (=> b!532914 (= res!328170 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16582 a!3154)))))

(declare-fun b!532915 () Bool)

(assert (=> b!532915 (= e!310224 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81443 (not res!328169)) b!532914))

(assert (= (and b!532914 res!328170) b!532915))

(declare-fun m!512919 () Bool)

(assert (=> d!81443 m!512919))

(declare-fun m!512921 () Bool)

(assert (=> b!532915 m!512921))

(assert (=> b!532679 d!81443))

(declare-fun d!81445 () Bool)

(assert (=> d!81445 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532685 d!81445))

(declare-fun b!532948 () Bool)

(declare-fun e!310245 () Bool)

(declare-fun contains!2791 (List!10337 (_ BitVec 64)) Bool)

(assert (=> b!532948 (= e!310245 (contains!2791 Nil!10334 (select (arr!16218 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532949 () Bool)

(declare-fun e!310246 () Bool)

(declare-fun e!310248 () Bool)

(assert (=> b!532949 (= e!310246 e!310248)))

(declare-fun c!62696 () Bool)

(assert (=> b!532949 (= c!62696 (validKeyInArray!0 (select (arr!16218 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532950 () Bool)

(declare-fun call!31994 () Bool)

(assert (=> b!532950 (= e!310248 call!31994)))

(declare-fun bm!31991 () Bool)

(assert (=> bm!31991 (= call!31994 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62696 (Cons!10333 (select (arr!16218 a!3154) #b00000000000000000000000000000000) Nil!10334) Nil!10334)))))

(declare-fun b!532952 () Bool)

(assert (=> b!532952 (= e!310248 call!31994)))

(declare-fun d!81447 () Bool)

(declare-fun res!328179 () Bool)

(declare-fun e!310247 () Bool)

(assert (=> d!81447 (=> res!328179 e!310247)))

(assert (=> d!81447 (= res!328179 (bvsge #b00000000000000000000000000000000 (size!16582 a!3154)))))

(assert (=> d!81447 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10334) e!310247)))

(declare-fun b!532951 () Bool)

(assert (=> b!532951 (= e!310247 e!310246)))

(declare-fun res!328181 () Bool)

(assert (=> b!532951 (=> (not res!328181) (not e!310246))))

(assert (=> b!532951 (= res!328181 (not e!310245))))

(declare-fun res!328180 () Bool)

(assert (=> b!532951 (=> (not res!328180) (not e!310245))))

(assert (=> b!532951 (= res!328180 (validKeyInArray!0 (select (arr!16218 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81447 (not res!328179)) b!532951))

(assert (= (and b!532951 res!328180) b!532948))

(assert (= (and b!532951 res!328181) b!532949))

(assert (= (and b!532949 c!62696) b!532950))

(assert (= (and b!532949 (not c!62696)) b!532952))

(assert (= (or b!532950 b!532952) bm!31991))

(assert (=> b!532948 m!512919))

(assert (=> b!532948 m!512919))

(declare-fun m!512945 () Bool)

(assert (=> b!532948 m!512945))

(assert (=> b!532949 m!512919))

(assert (=> b!532949 m!512919))

(declare-fun m!512947 () Bool)

(assert (=> b!532949 m!512947))

(assert (=> bm!31991 m!512919))

(declare-fun m!512949 () Bool)

(assert (=> bm!31991 m!512949))

(assert (=> b!532951 m!512919))

(assert (=> b!532951 m!512919))

(assert (=> b!532951 m!512947))

(assert (=> b!532680 d!81447))

(declare-fun d!81453 () Bool)

(assert (=> d!81453 (= (validKeyInArray!0 (select (arr!16218 a!3154) j!147)) (and (not (= (select (arr!16218 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16218 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532681 d!81453))

(declare-fun bm!31994 () Bool)

(declare-fun call!31997 () Bool)

(assert (=> bm!31994 (= call!31997 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532961 () Bool)

(declare-fun e!310256 () Bool)

(declare-fun e!310257 () Bool)

(assert (=> b!532961 (= e!310256 e!310257)))

(declare-fun lt!245352 () (_ BitVec 64))

(assert (=> b!532961 (= lt!245352 (select (arr!16218 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16844 0))(
  ( (Unit!16845) )
))
(declare-fun lt!245351 () Unit!16844)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33755 (_ BitVec 64) (_ BitVec 32)) Unit!16844)

(assert (=> b!532961 (= lt!245351 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245352 #b00000000000000000000000000000000))))

(assert (=> b!532961 (arrayContainsKey!0 a!3154 lt!245352 #b00000000000000000000000000000000)))

(declare-fun lt!245353 () Unit!16844)

(assert (=> b!532961 (= lt!245353 lt!245351)))

(declare-fun res!328187 () Bool)

(assert (=> b!532961 (= res!328187 (= (seekEntryOrOpen!0 (select (arr!16218 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4676 #b00000000000000000000000000000000)))))

(assert (=> b!532961 (=> (not res!328187) (not e!310257))))

(declare-fun b!532962 () Bool)

(assert (=> b!532962 (= e!310256 call!31997)))

(declare-fun b!532964 () Bool)

(declare-fun e!310255 () Bool)

(assert (=> b!532964 (= e!310255 e!310256)))

(declare-fun c!62699 () Bool)

(assert (=> b!532964 (= c!62699 (validKeyInArray!0 (select (arr!16218 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532963 () Bool)

(assert (=> b!532963 (= e!310257 call!31997)))

(declare-fun d!81455 () Bool)

(declare-fun res!328186 () Bool)

(assert (=> d!81455 (=> res!328186 e!310255)))

(assert (=> d!81455 (= res!328186 (bvsge #b00000000000000000000000000000000 (size!16582 a!3154)))))

(assert (=> d!81455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!310255)))

(assert (= (and d!81455 (not res!328186)) b!532964))

(assert (= (and b!532964 c!62699) b!532961))

(assert (= (and b!532964 (not c!62699)) b!532962))

(assert (= (and b!532961 res!328187) b!532963))

(assert (= (or b!532963 b!532962) bm!31994))

(declare-fun m!512951 () Bool)

(assert (=> bm!31994 m!512951))

(assert (=> b!532961 m!512919))

(declare-fun m!512953 () Bool)

(assert (=> b!532961 m!512953))

(declare-fun m!512955 () Bool)

(assert (=> b!532961 m!512955))

(assert (=> b!532961 m!512919))

(declare-fun m!512957 () Bool)

(assert (=> b!532961 m!512957))

(assert (=> b!532964 m!512919))

(assert (=> b!532964 m!512919))

(assert (=> b!532964 m!512947))

(assert (=> b!532687 d!81455))

(push 1)

(assert (not b!532964))

(assert (not b!532961))

(assert (not b!532915))

(assert (not d!81419))

(assert (not b!532951))

(assert (not bm!31991))

(assert (not b!532897))

(assert (not b!532949))

(assert (not d!81401))

(assert (not b!532805))

(assert (not bm!31994))

(assert (not b!532948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

