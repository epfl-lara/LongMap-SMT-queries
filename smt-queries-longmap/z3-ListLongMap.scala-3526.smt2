; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48718 () Bool)

(assert start!48718)

(declare-fun e!311076 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun b!535590 () Bool)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33929 0))(
  ( (array!33930 (arr!16303 (Array (_ BitVec 32) (_ BitVec 64))) (size!16667 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33929)

(assert (=> b!535590 (= e!311076 (and (not (= (select (arr!16303 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16303 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16303 a!3154) index!1177) (select (arr!16303 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000))))))

(declare-fun res!330854 () Bool)

(declare-fun e!311073 () Bool)

(assert (=> start!48718 (=> (not res!330854) (not e!311073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48718 (= res!330854 (validMask!0 mask!3216))))

(assert (=> start!48718 e!311073))

(assert (=> start!48718 true))

(declare-fun array_inv!12162 (array!33929) Bool)

(assert (=> start!48718 (array_inv!12162 a!3154)))

(declare-fun b!535591 () Bool)

(declare-fun res!330850 () Bool)

(declare-fun e!311074 () Bool)

(assert (=> b!535591 (=> (not res!330850) (not e!311074))))

(declare-datatypes ((List!10329 0))(
  ( (Nil!10326) (Cons!10325 (h!11268 (_ BitVec 64)) (t!16549 List!10329)) )
))
(declare-fun arrayNoDuplicates!0 (array!33929 (_ BitVec 32) List!10329) Bool)

(assert (=> b!535591 (= res!330850 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10326))))

(declare-fun b!535592 () Bool)

(declare-fun res!330857 () Bool)

(assert (=> b!535592 (=> (not res!330857) (not e!311074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33929 (_ BitVec 32)) Bool)

(assert (=> b!535592 (= res!330857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535593 () Bool)

(assert (=> b!535593 (= e!311073 e!311074)))

(declare-fun res!330849 () Bool)

(assert (=> b!535593 (=> (not res!330849) (not e!311074))))

(declare-datatypes ((SeekEntryResult!4717 0))(
  ( (MissingZero!4717 (index!21092 (_ BitVec 32))) (Found!4717 (index!21093 (_ BitVec 32))) (Intermediate!4717 (undefined!5529 Bool) (index!21094 (_ BitVec 32)) (x!50185 (_ BitVec 32))) (Undefined!4717) (MissingVacant!4717 (index!21095 (_ BitVec 32))) )
))
(declare-fun lt!245875 () SeekEntryResult!4717)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535593 (= res!330849 (or (= lt!245875 (MissingZero!4717 i!1153)) (= lt!245875 (MissingVacant!4717 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33929 (_ BitVec 32)) SeekEntryResult!4717)

(assert (=> b!535593 (= lt!245875 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535594 () Bool)

(declare-fun res!330856 () Bool)

(assert (=> b!535594 (=> (not res!330856) (not e!311073))))

(declare-fun arrayContainsKey!0 (array!33929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535594 (= res!330856 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535595 () Bool)

(declare-fun res!330859 () Bool)

(assert (=> b!535595 (=> (not res!330859) (not e!311074))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535595 (= res!330859 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16667 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16667 a!3154)) (= (select (arr!16303 a!3154) resIndex!32) (select (arr!16303 a!3154) j!147))))))

(declare-fun b!535596 () Bool)

(declare-fun res!330852 () Bool)

(assert (=> b!535596 (=> (not res!330852) (not e!311073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535596 (= res!330852 (validKeyInArray!0 (select (arr!16303 a!3154) j!147)))))

(declare-fun b!535597 () Bool)

(declare-fun res!330855 () Bool)

(assert (=> b!535597 (=> (not res!330855) (not e!311073))))

(assert (=> b!535597 (= res!330855 (validKeyInArray!0 k0!1998))))

(declare-fun b!535598 () Bool)

(declare-fun res!330853 () Bool)

(assert (=> b!535598 (=> (not res!330853) (not e!311073))))

(assert (=> b!535598 (= res!330853 (and (= (size!16667 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16667 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16667 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535599 () Bool)

(declare-fun res!330851 () Bool)

(assert (=> b!535599 (=> (not res!330851) (not e!311076))))

(declare-fun lt!245874 () SeekEntryResult!4717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33929 (_ BitVec 32)) SeekEntryResult!4717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535599 (= res!330851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216) (select (arr!16303 a!3154) j!147) a!3154 mask!3216) lt!245874))))

(declare-fun b!535600 () Bool)

(assert (=> b!535600 (= e!311074 e!311076)))

(declare-fun res!330858 () Bool)

(assert (=> b!535600 (=> (not res!330858) (not e!311076))))

(assert (=> b!535600 (= res!330858 (= lt!245874 (Intermediate!4717 false resIndex!32 resX!32)))))

(assert (=> b!535600 (= lt!245874 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16303 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48718 res!330854) b!535598))

(assert (= (and b!535598 res!330853) b!535596))

(assert (= (and b!535596 res!330852) b!535597))

(assert (= (and b!535597 res!330855) b!535594))

(assert (= (and b!535594 res!330856) b!535593))

(assert (= (and b!535593 res!330849) b!535592))

(assert (= (and b!535592 res!330857) b!535591))

(assert (= (and b!535591 res!330850) b!535595))

(assert (= (and b!535595 res!330859) b!535600))

(assert (= (and b!535600 res!330858) b!535599))

(assert (= (and b!535599 res!330851) b!535590))

(declare-fun m!515389 () Bool)

(assert (=> b!535596 m!515389))

(assert (=> b!535596 m!515389))

(declare-fun m!515391 () Bool)

(assert (=> b!535596 m!515391))

(declare-fun m!515393 () Bool)

(assert (=> b!535595 m!515393))

(assert (=> b!535595 m!515389))

(declare-fun m!515395 () Bool)

(assert (=> b!535597 m!515395))

(assert (=> b!535599 m!515389))

(assert (=> b!535599 m!515389))

(declare-fun m!515397 () Bool)

(assert (=> b!535599 m!515397))

(assert (=> b!535599 m!515397))

(assert (=> b!535599 m!515389))

(declare-fun m!515399 () Bool)

(assert (=> b!535599 m!515399))

(assert (=> b!535600 m!515389))

(assert (=> b!535600 m!515389))

(declare-fun m!515401 () Bool)

(assert (=> b!535600 m!515401))

(declare-fun m!515403 () Bool)

(assert (=> b!535591 m!515403))

(declare-fun m!515405 () Bool)

(assert (=> b!535590 m!515405))

(assert (=> b!535590 m!515389))

(declare-fun m!515407 () Bool)

(assert (=> b!535594 m!515407))

(declare-fun m!515409 () Bool)

(assert (=> b!535593 m!515409))

(declare-fun m!515411 () Bool)

(assert (=> b!535592 m!515411))

(declare-fun m!515413 () Bool)

(assert (=> start!48718 m!515413))

(declare-fun m!515415 () Bool)

(assert (=> start!48718 m!515415))

(check-sat (not b!535591) (not b!535594) (not b!535600) (not b!535593) (not b!535597) (not b!535596) (not b!535592) (not b!535599) (not start!48718))
(check-sat)
(get-model)

(declare-fun bm!31983 () Bool)

(declare-fun call!31986 () Bool)

(assert (=> bm!31983 (= call!31986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!535675 () Bool)

(declare-fun e!311109 () Bool)

(assert (=> b!535675 (= e!311109 call!31986)))

(declare-fun d!81553 () Bool)

(declare-fun res!330931 () Bool)

(declare-fun e!311108 () Bool)

(assert (=> d!81553 (=> res!330931 e!311108)))

(assert (=> d!81553 (= res!330931 (bvsge #b00000000000000000000000000000000 (size!16667 a!3154)))))

(assert (=> d!81553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!311108)))

(declare-fun b!535676 () Bool)

(assert (=> b!535676 (= e!311108 e!311109)))

(declare-fun c!62684 () Bool)

(assert (=> b!535676 (= c!62684 (validKeyInArray!0 (select (arr!16303 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!535677 () Bool)

(declare-fun e!311107 () Bool)

(assert (=> b!535677 (= e!311109 e!311107)))

(declare-fun lt!245896 () (_ BitVec 64))

(assert (=> b!535677 (= lt!245896 (select (arr!16303 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16817 0))(
  ( (Unit!16818) )
))
(declare-fun lt!245894 () Unit!16817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33929 (_ BitVec 64) (_ BitVec 32)) Unit!16817)

(assert (=> b!535677 (= lt!245894 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245896 #b00000000000000000000000000000000))))

(assert (=> b!535677 (arrayContainsKey!0 a!3154 lt!245896 #b00000000000000000000000000000000)))

(declare-fun lt!245895 () Unit!16817)

(assert (=> b!535677 (= lt!245895 lt!245894)))

(declare-fun res!330930 () Bool)

(assert (=> b!535677 (= res!330930 (= (seekEntryOrOpen!0 (select (arr!16303 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4717 #b00000000000000000000000000000000)))))

(assert (=> b!535677 (=> (not res!330930) (not e!311107))))

(declare-fun b!535678 () Bool)

(assert (=> b!535678 (= e!311107 call!31986)))

(assert (= (and d!81553 (not res!330931)) b!535676))

(assert (= (and b!535676 c!62684) b!535677))

(assert (= (and b!535676 (not c!62684)) b!535675))

(assert (= (and b!535677 res!330930) b!535678))

(assert (= (or b!535678 b!535675) bm!31983))

(declare-fun m!515473 () Bool)

(assert (=> bm!31983 m!515473))

(declare-fun m!515475 () Bool)

(assert (=> b!535676 m!515475))

(assert (=> b!535676 m!515475))

(declare-fun m!515477 () Bool)

(assert (=> b!535676 m!515477))

(assert (=> b!535677 m!515475))

(declare-fun m!515479 () Bool)

(assert (=> b!535677 m!515479))

(declare-fun m!515481 () Bool)

(assert (=> b!535677 m!515481))

(assert (=> b!535677 m!515475))

(declare-fun m!515483 () Bool)

(assert (=> b!535677 m!515483))

(assert (=> b!535592 d!81553))

(declare-fun d!81555 () Bool)

(assert (=> d!81555 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!535597 d!81555))

(declare-fun d!81557 () Bool)

(declare-fun e!311151 () Bool)

(assert (=> d!81557 e!311151))

(declare-fun c!62700 () Bool)

(declare-fun lt!245907 () SeekEntryResult!4717)

(get-info :version)

(assert (=> d!81557 (= c!62700 (and ((_ is Intermediate!4717) lt!245907) (undefined!5529 lt!245907)))))

(declare-fun e!311154 () SeekEntryResult!4717)

(assert (=> d!81557 (= lt!245907 e!311154)))

(declare-fun c!62702 () Bool)

(assert (=> d!81557 (= c!62702 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!245908 () (_ BitVec 64))

(assert (=> d!81557 (= lt!245908 (select (arr!16303 a!3154) (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216)))))

(assert (=> d!81557 (validMask!0 mask!3216)))

(assert (=> d!81557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216) (select (arr!16303 a!3154) j!147) a!3154 mask!3216) lt!245907)))

(declare-fun b!535736 () Bool)

(declare-fun e!311153 () SeekEntryResult!4717)

(assert (=> b!535736 (= e!311154 e!311153)))

(declare-fun c!62701 () Bool)

(assert (=> b!535736 (= c!62701 (or (= lt!245908 (select (arr!16303 a!3154) j!147)) (= (bvadd lt!245908 lt!245908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!535737 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535737 (= e!311153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16303 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535738 () Bool)

(assert (=> b!535738 (and (bvsge (index!21094 lt!245907) #b00000000000000000000000000000000) (bvslt (index!21094 lt!245907) (size!16667 a!3154)))))

(declare-fun e!311150 () Bool)

(assert (=> b!535738 (= e!311150 (= (select (arr!16303 a!3154) (index!21094 lt!245907)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!535739 () Bool)

(assert (=> b!535739 (and (bvsge (index!21094 lt!245907) #b00000000000000000000000000000000) (bvslt (index!21094 lt!245907) (size!16667 a!3154)))))

(declare-fun res!330960 () Bool)

(assert (=> b!535739 (= res!330960 (= (select (arr!16303 a!3154) (index!21094 lt!245907)) (select (arr!16303 a!3154) j!147)))))

(assert (=> b!535739 (=> res!330960 e!311150)))

(declare-fun e!311152 () Bool)

(assert (=> b!535739 (= e!311152 e!311150)))

(declare-fun b!535740 () Bool)

(assert (=> b!535740 (= e!311153 (Intermediate!4717 false (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!535741 () Bool)

(assert (=> b!535741 (= e!311151 (bvsge (x!50185 lt!245907) #b01111111111111111111111111111110))))

(declare-fun b!535742 () Bool)

(assert (=> b!535742 (and (bvsge (index!21094 lt!245907) #b00000000000000000000000000000000) (bvslt (index!21094 lt!245907) (size!16667 a!3154)))))

(declare-fun res!330959 () Bool)

(assert (=> b!535742 (= res!330959 (= (select (arr!16303 a!3154) (index!21094 lt!245907)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!535742 (=> res!330959 e!311150)))

(declare-fun b!535743 () Bool)

(assert (=> b!535743 (= e!311154 (Intermediate!4717 true (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!535744 () Bool)

(assert (=> b!535744 (= e!311151 e!311152)))

(declare-fun res!330961 () Bool)

(assert (=> b!535744 (= res!330961 (and ((_ is Intermediate!4717) lt!245907) (not (undefined!5529 lt!245907)) (bvslt (x!50185 lt!245907) #b01111111111111111111111111111110) (bvsge (x!50185 lt!245907) #b00000000000000000000000000000000) (bvsge (x!50185 lt!245907) #b00000000000000000000000000000000)))))

(assert (=> b!535744 (=> (not res!330961) (not e!311152))))

(assert (= (and d!81557 c!62702) b!535743))

(assert (= (and d!81557 (not c!62702)) b!535736))

(assert (= (and b!535736 c!62701) b!535740))

(assert (= (and b!535736 (not c!62701)) b!535737))

(assert (= (and d!81557 c!62700) b!535741))

(assert (= (and d!81557 (not c!62700)) b!535744))

(assert (= (and b!535744 res!330961) b!535739))

(assert (= (and b!535739 (not res!330960)) b!535742))

(assert (= (and b!535742 (not res!330959)) b!535738))

(declare-fun m!515499 () Bool)

(assert (=> b!535742 m!515499))

(assert (=> b!535739 m!515499))

(assert (=> b!535738 m!515499))

(assert (=> b!535737 m!515397))

(declare-fun m!515501 () Bool)

(assert (=> b!535737 m!515501))

(assert (=> b!535737 m!515501))

(assert (=> b!535737 m!515389))

(declare-fun m!515503 () Bool)

(assert (=> b!535737 m!515503))

(assert (=> d!81557 m!515397))

(declare-fun m!515505 () Bool)

(assert (=> d!81557 m!515505))

(assert (=> d!81557 m!515413))

(assert (=> b!535599 d!81557))

(declare-fun d!81573 () Bool)

(declare-fun lt!245917 () (_ BitVec 32))

(declare-fun lt!245916 () (_ BitVec 32))

(assert (=> d!81573 (= lt!245917 (bvmul (bvxor lt!245916 (bvlshr lt!245916 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81573 (= lt!245916 ((_ extract 31 0) (bvand (bvxor (select (arr!16303 a!3154) j!147) (bvlshr (select (arr!16303 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81573 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!330962 (let ((h!11271 ((_ extract 31 0) (bvand (bvxor (select (arr!16303 a!3154) j!147) (bvlshr (select (arr!16303 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50189 (bvmul (bvxor h!11271 (bvlshr h!11271 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50189 (bvlshr x!50189 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!330962 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!330962 #b00000000000000000000000000000000))))))

(assert (=> d!81573 (= (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216) (bvand (bvxor lt!245917 (bvlshr lt!245917 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!535599 d!81573))

(declare-fun b!535817 () Bool)

(declare-fun c!62731 () Bool)

(declare-fun lt!245944 () (_ BitVec 64))

(assert (=> b!535817 (= c!62731 (= lt!245944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!311194 () SeekEntryResult!4717)

(declare-fun e!311196 () SeekEntryResult!4717)

(assert (=> b!535817 (= e!311194 e!311196)))

(declare-fun b!535818 () Bool)

(declare-fun lt!245942 () SeekEntryResult!4717)

(assert (=> b!535818 (= e!311194 (Found!4717 (index!21094 lt!245942)))))

(declare-fun b!535819 () Bool)

(declare-fun e!311195 () SeekEntryResult!4717)

(assert (=> b!535819 (= e!311195 e!311194)))

(assert (=> b!535819 (= lt!245944 (select (arr!16303 a!3154) (index!21094 lt!245942)))))

(declare-fun c!62730 () Bool)

(assert (=> b!535819 (= c!62730 (= lt!245944 k0!1998))))

(declare-fun d!81577 () Bool)

(declare-fun lt!245943 () SeekEntryResult!4717)

(assert (=> d!81577 (and (or ((_ is Undefined!4717) lt!245943) (not ((_ is Found!4717) lt!245943)) (and (bvsge (index!21093 lt!245943) #b00000000000000000000000000000000) (bvslt (index!21093 lt!245943) (size!16667 a!3154)))) (or ((_ is Undefined!4717) lt!245943) ((_ is Found!4717) lt!245943) (not ((_ is MissingZero!4717) lt!245943)) (and (bvsge (index!21092 lt!245943) #b00000000000000000000000000000000) (bvslt (index!21092 lt!245943) (size!16667 a!3154)))) (or ((_ is Undefined!4717) lt!245943) ((_ is Found!4717) lt!245943) ((_ is MissingZero!4717) lt!245943) (not ((_ is MissingVacant!4717) lt!245943)) (and (bvsge (index!21095 lt!245943) #b00000000000000000000000000000000) (bvslt (index!21095 lt!245943) (size!16667 a!3154)))) (or ((_ is Undefined!4717) lt!245943) (ite ((_ is Found!4717) lt!245943) (= (select (arr!16303 a!3154) (index!21093 lt!245943)) k0!1998) (ite ((_ is MissingZero!4717) lt!245943) (= (select (arr!16303 a!3154) (index!21092 lt!245943)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4717) lt!245943) (= (select (arr!16303 a!3154) (index!21095 lt!245943)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81577 (= lt!245943 e!311195)))

(declare-fun c!62732 () Bool)

(assert (=> d!81577 (= c!62732 (and ((_ is Intermediate!4717) lt!245942) (undefined!5529 lt!245942)))))

(assert (=> d!81577 (= lt!245942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81577 (validMask!0 mask!3216)))

(assert (=> d!81577 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!245943)))

(declare-fun b!535820 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33929 (_ BitVec 32)) SeekEntryResult!4717)

(assert (=> b!535820 (= e!311196 (seekKeyOrZeroReturnVacant!0 (x!50185 lt!245942) (index!21094 lt!245942) (index!21094 lt!245942) k0!1998 a!3154 mask!3216))))

(declare-fun b!535821 () Bool)

(assert (=> b!535821 (= e!311195 Undefined!4717)))

(declare-fun b!535822 () Bool)

(assert (=> b!535822 (= e!311196 (MissingZero!4717 (index!21094 lt!245942)))))

(assert (= (and d!81577 c!62732) b!535821))

(assert (= (and d!81577 (not c!62732)) b!535819))

(assert (= (and b!535819 c!62730) b!535818))

(assert (= (and b!535819 (not c!62730)) b!535817))

(assert (= (and b!535817 c!62731) b!535822))

(assert (= (and b!535817 (not c!62731)) b!535820))

(declare-fun m!515535 () Bool)

(assert (=> b!535819 m!515535))

(declare-fun m!515537 () Bool)

(assert (=> d!81577 m!515537))

(declare-fun m!515539 () Bool)

(assert (=> d!81577 m!515539))

(declare-fun m!515541 () Bool)

(assert (=> d!81577 m!515541))

(declare-fun m!515543 () Bool)

(assert (=> d!81577 m!515543))

(assert (=> d!81577 m!515413))

(declare-fun m!515545 () Bool)

(assert (=> d!81577 m!515545))

(assert (=> d!81577 m!515539))

(declare-fun m!515547 () Bool)

(assert (=> b!535820 m!515547))

(assert (=> b!535593 d!81577))

(declare-fun d!81587 () Bool)

(declare-fun e!311198 () Bool)

(assert (=> d!81587 e!311198))

(declare-fun c!62733 () Bool)

(declare-fun lt!245945 () SeekEntryResult!4717)

(assert (=> d!81587 (= c!62733 (and ((_ is Intermediate!4717) lt!245945) (undefined!5529 lt!245945)))))

(declare-fun e!311201 () SeekEntryResult!4717)

(assert (=> d!81587 (= lt!245945 e!311201)))

(declare-fun c!62735 () Bool)

(assert (=> d!81587 (= c!62735 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!245946 () (_ BitVec 64))

(assert (=> d!81587 (= lt!245946 (select (arr!16303 a!3154) index!1177))))

(assert (=> d!81587 (validMask!0 mask!3216)))

(assert (=> d!81587 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16303 a!3154) j!147) a!3154 mask!3216) lt!245945)))

(declare-fun b!535823 () Bool)

(declare-fun e!311200 () SeekEntryResult!4717)

(assert (=> b!535823 (= e!311201 e!311200)))

(declare-fun c!62734 () Bool)

(assert (=> b!535823 (= c!62734 (or (= lt!245946 (select (arr!16303 a!3154) j!147)) (= (bvadd lt!245946 lt!245946) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!535824 () Bool)

(assert (=> b!535824 (= e!311200 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16303 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535825 () Bool)

(assert (=> b!535825 (and (bvsge (index!21094 lt!245945) #b00000000000000000000000000000000) (bvslt (index!21094 lt!245945) (size!16667 a!3154)))))

(declare-fun e!311197 () Bool)

(assert (=> b!535825 (= e!311197 (= (select (arr!16303 a!3154) (index!21094 lt!245945)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!535826 () Bool)

(assert (=> b!535826 (and (bvsge (index!21094 lt!245945) #b00000000000000000000000000000000) (bvslt (index!21094 lt!245945) (size!16667 a!3154)))))

(declare-fun res!330983 () Bool)

(assert (=> b!535826 (= res!330983 (= (select (arr!16303 a!3154) (index!21094 lt!245945)) (select (arr!16303 a!3154) j!147)))))

(assert (=> b!535826 (=> res!330983 e!311197)))

(declare-fun e!311199 () Bool)

(assert (=> b!535826 (= e!311199 e!311197)))

(declare-fun b!535827 () Bool)

(assert (=> b!535827 (= e!311200 (Intermediate!4717 false index!1177 x!1030))))

(declare-fun b!535828 () Bool)

(assert (=> b!535828 (= e!311198 (bvsge (x!50185 lt!245945) #b01111111111111111111111111111110))))

(declare-fun b!535829 () Bool)

(assert (=> b!535829 (and (bvsge (index!21094 lt!245945) #b00000000000000000000000000000000) (bvslt (index!21094 lt!245945) (size!16667 a!3154)))))

(declare-fun res!330982 () Bool)

(assert (=> b!535829 (= res!330982 (= (select (arr!16303 a!3154) (index!21094 lt!245945)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!535829 (=> res!330982 e!311197)))

(declare-fun b!535830 () Bool)

(assert (=> b!535830 (= e!311201 (Intermediate!4717 true index!1177 x!1030))))

(declare-fun b!535831 () Bool)

(assert (=> b!535831 (= e!311198 e!311199)))

(declare-fun res!330984 () Bool)

(assert (=> b!535831 (= res!330984 (and ((_ is Intermediate!4717) lt!245945) (not (undefined!5529 lt!245945)) (bvslt (x!50185 lt!245945) #b01111111111111111111111111111110) (bvsge (x!50185 lt!245945) #b00000000000000000000000000000000) (bvsge (x!50185 lt!245945) x!1030)))))

(assert (=> b!535831 (=> (not res!330984) (not e!311199))))

(assert (= (and d!81587 c!62735) b!535830))

(assert (= (and d!81587 (not c!62735)) b!535823))

(assert (= (and b!535823 c!62734) b!535827))

(assert (= (and b!535823 (not c!62734)) b!535824))

(assert (= (and d!81587 c!62733) b!535828))

(assert (= (and d!81587 (not c!62733)) b!535831))

(assert (= (and b!535831 res!330984) b!535826))

(assert (= (and b!535826 (not res!330983)) b!535829))

(assert (= (and b!535829 (not res!330982)) b!535825))

(declare-fun m!515549 () Bool)

(assert (=> b!535829 m!515549))

(assert (=> b!535826 m!515549))

(assert (=> b!535825 m!515549))

(declare-fun m!515551 () Bool)

(assert (=> b!535824 m!515551))

(assert (=> b!535824 m!515551))

(assert (=> b!535824 m!515389))

(declare-fun m!515553 () Bool)

(assert (=> b!535824 m!515553))

(assert (=> d!81587 m!515405))

(assert (=> d!81587 m!515413))

(assert (=> b!535600 d!81587))

(declare-fun d!81589 () Bool)

(declare-fun res!330989 () Bool)

(declare-fun e!311206 () Bool)

(assert (=> d!81589 (=> res!330989 e!311206)))

(assert (=> d!81589 (= res!330989 (= (select (arr!16303 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81589 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!311206)))

(declare-fun b!535836 () Bool)

(declare-fun e!311207 () Bool)

(assert (=> b!535836 (= e!311206 e!311207)))

(declare-fun res!330990 () Bool)

(assert (=> b!535836 (=> (not res!330990) (not e!311207))))

(assert (=> b!535836 (= res!330990 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16667 a!3154)))))

(declare-fun b!535837 () Bool)

(assert (=> b!535837 (= e!311207 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81589 (not res!330989)) b!535836))

(assert (= (and b!535836 res!330990) b!535837))

(assert (=> d!81589 m!515475))

(declare-fun m!515555 () Bool)

(assert (=> b!535837 m!515555))

(assert (=> b!535594 d!81589))

(declare-fun d!81591 () Bool)

(assert (=> d!81591 (= (validKeyInArray!0 (select (arr!16303 a!3154) j!147)) (and (not (= (select (arr!16303 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16303 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!535596 d!81591))

(declare-fun d!81593 () Bool)

(assert (=> d!81593 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48718 d!81593))

(declare-fun d!81601 () Bool)

(assert (=> d!81601 (= (array_inv!12162 a!3154) (bvsge (size!16667 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48718 d!81601))

(declare-fun b!535882 () Bool)

(declare-fun e!311245 () Bool)

(declare-fun call!31998 () Bool)

(assert (=> b!535882 (= e!311245 call!31998)))

(declare-fun d!81603 () Bool)

(declare-fun res!331017 () Bool)

(declare-fun e!311244 () Bool)

(assert (=> d!81603 (=> res!331017 e!311244)))

(assert (=> d!81603 (= res!331017 (bvsge #b00000000000000000000000000000000 (size!16667 a!3154)))))

(assert (=> d!81603 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10326) e!311244)))

(declare-fun b!535883 () Bool)

(declare-fun e!311242 () Bool)

(assert (=> b!535883 (= e!311242 e!311245)))

(declare-fun c!62746 () Bool)

(assert (=> b!535883 (= c!62746 (validKeyInArray!0 (select (arr!16303 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!535884 () Bool)

(assert (=> b!535884 (= e!311244 e!311242)))

(declare-fun res!331015 () Bool)

(assert (=> b!535884 (=> (not res!331015) (not e!311242))))

(declare-fun e!311243 () Bool)

(assert (=> b!535884 (= res!331015 (not e!311243))))

(declare-fun res!331016 () Bool)

(assert (=> b!535884 (=> (not res!331016) (not e!311243))))

(assert (=> b!535884 (= res!331016 (validKeyInArray!0 (select (arr!16303 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!535885 () Bool)

(assert (=> b!535885 (= e!311245 call!31998)))

(declare-fun bm!31995 () Bool)

(assert (=> bm!31995 (= call!31998 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62746 (Cons!10325 (select (arr!16303 a!3154) #b00000000000000000000000000000000) Nil!10326) Nil!10326)))))

(declare-fun b!535886 () Bool)

(declare-fun contains!2770 (List!10329 (_ BitVec 64)) Bool)

(assert (=> b!535886 (= e!311243 (contains!2770 Nil!10326 (select (arr!16303 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81603 (not res!331017)) b!535884))

(assert (= (and b!535884 res!331016) b!535886))

(assert (= (and b!535884 res!331015) b!535883))

(assert (= (and b!535883 c!62746) b!535885))

(assert (= (and b!535883 (not c!62746)) b!535882))

(assert (= (or b!535885 b!535882) bm!31995))

(assert (=> b!535883 m!515475))

(assert (=> b!535883 m!515475))

(assert (=> b!535883 m!515477))

(assert (=> b!535884 m!515475))

(assert (=> b!535884 m!515475))

(assert (=> b!535884 m!515477))

(assert (=> bm!31995 m!515475))

(declare-fun m!515575 () Bool)

(assert (=> bm!31995 m!515575))

(assert (=> b!535886 m!515475))

(assert (=> b!535886 m!515475))

(declare-fun m!515577 () Bool)

(assert (=> b!535886 m!515577))

(assert (=> b!535591 d!81603))

(check-sat (not b!535677) (not b!535837) (not b!535886) (not b!535737) (not d!81557) (not b!535883) (not bm!31983) (not b!535884) (not b!535824) (not d!81587) (not b!535676) (not d!81577) (not b!535820) (not bm!31995))
(check-sat)
