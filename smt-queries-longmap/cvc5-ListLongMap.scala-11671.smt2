; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136522 () Bool)

(assert start!136522)

(declare-fun b!1577758 () Bool)

(declare-fun res!1077860 () Bool)

(declare-fun e!880030 () Bool)

(assert (=> b!1577758 (=> (not res!1077860) (not e!880030))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577758 (= res!1077860 (validKeyInArray!0 k!768))))

(declare-fun b!1577759 () Bool)

(declare-fun res!1077859 () Bool)

(assert (=> b!1577759 (=> (not res!1077859) (not e!880030))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105632 0))(
  ( (array!105633 (arr!50932 (Array (_ BitVec 32) (_ BitVec 64))) (size!51482 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105632)

(assert (=> b!1577759 (= res!1077859 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50932 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50932 _keys!610) ee!12) (select (arr!50932 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577757 () Bool)

(declare-fun res!1077858 () Bool)

(assert (=> b!1577757 (=> (not res!1077858) (not e!880030))))

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577757 (= res!1077858 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51482 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077861 () Bool)

(assert (=> start!136522 (=> (not res!1077861) (not e!880030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136522 (= res!1077861 (validMask!0 mask!910))))

(assert (=> start!136522 e!880030))

(assert (=> start!136522 true))

(declare-fun array_inv!39659 (array!105632) Bool)

(assert (=> start!136522 (array_inv!39659 _keys!610)))

(declare-fun b!1577760 () Bool)

(declare-datatypes ((SeekEntryResult!13761 0))(
  ( (MissingZero!13761 (index!57442 (_ BitVec 32))) (Found!13761 (index!57443 (_ BitVec 32))) (Intermediate!13761 (undefined!14573 Bool) (index!57444 (_ BitVec 32)) (x!142584 (_ BitVec 32))) (Undefined!13761) (MissingVacant!13761 (index!57445 (_ BitVec 32))) )
))
(declare-fun lt!676093 () SeekEntryResult!13761)

(assert (=> b!1577760 (= e!880030 (ite (and (is-Intermediate!13761 lt!676093) (undefined!14573 lt!676093)) (bvslt (x!142584 lt!676093) #b01111111111111111111111111111110) (or (not (is-Intermediate!13761 lt!676093)) (undefined!14573 lt!676093) (bvsge (x!142584 lt!676093) #b01111111111111111111111111111110) (bvslt (x!142584 lt!676093) #b00000000000000000000000000000000) (bvslt (x!142584 lt!676093) x!458) (and (not (= (select (arr!50932 _keys!610) (index!57444 lt!676093)) k!768)) (not (= (select (arr!50932 _keys!610) (index!57444 lt!676093)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50932 _keys!610) (index!57444 lt!676093)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105632 (_ BitVec 32)) SeekEntryResult!13761)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577760 (= lt!676093 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(assert (= (and start!136522 res!1077861) b!1577757))

(assert (= (and b!1577757 res!1077858) b!1577758))

(assert (= (and b!1577758 res!1077860) b!1577759))

(assert (= (and b!1577759 res!1077859) b!1577760))

(declare-fun m!1449895 () Bool)

(assert (=> b!1577758 m!1449895))

(declare-fun m!1449897 () Bool)

(assert (=> b!1577759 m!1449897))

(declare-fun m!1449899 () Bool)

(assert (=> start!136522 m!1449899))

(declare-fun m!1449901 () Bool)

(assert (=> start!136522 m!1449901))

(declare-fun m!1449903 () Bool)

(assert (=> b!1577760 m!1449903))

(declare-fun m!1449905 () Bool)

(assert (=> b!1577760 m!1449905))

(assert (=> b!1577760 m!1449905))

(declare-fun m!1449907 () Bool)

(assert (=> b!1577760 m!1449907))

(push 1)

(assert (not b!1577760))

(assert (not b!1577758))

(assert (not start!136522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1577803 () Bool)

(declare-fun e!880057 () Bool)

(declare-fun lt!676105 () SeekEntryResult!13761)

(assert (=> b!1577803 (= e!880057 (bvsge (x!142584 lt!676105) #b01111111111111111111111111111110))))

(declare-fun b!1577804 () Bool)

(declare-fun e!880058 () Bool)

(assert (=> b!1577804 (= e!880057 e!880058)))

(declare-fun res!1077892 () Bool)

(assert (=> b!1577804 (= res!1077892 (and (is-Intermediate!13761 lt!676105) (not (undefined!14573 lt!676105)) (bvslt (x!142584 lt!676105) #b01111111111111111111111111111110) (bvsge (x!142584 lt!676105) #b00000000000000000000000000000000) (bvsge (x!142584 lt!676105) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577804 (=> (not res!1077892) (not e!880058))))

(declare-fun b!1577805 () Bool)

(declare-fun e!880056 () SeekEntryResult!13761)

(declare-fun e!880054 () SeekEntryResult!13761)

(assert (=> b!1577805 (= e!880056 e!880054)))

(declare-fun c!146240 () Bool)

(declare-fun lt!676104 () (_ BitVec 64))

(assert (=> b!1577805 (= c!146240 (or (= lt!676104 k!768) (= (bvadd lt!676104 lt!676104) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165963 () Bool)

(assert (=> d!165963 e!880057))

(declare-fun c!146241 () Bool)

(assert (=> d!165963 (= c!146241 (and (is-Intermediate!13761 lt!676105) (undefined!14573 lt!676105)))))

(assert (=> d!165963 (= lt!676105 e!880056)))

(declare-fun c!146239 () Bool)

(assert (=> d!165963 (= c!146239 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(assert (=> d!165963 (= lt!676104 (select (arr!50932 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165963 (validMask!0 mask!910)))

(assert (=> d!165963 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910) lt!676105)))

(declare-fun b!1577806 () Bool)

(assert (=> b!1577806 (= e!880056 (Intermediate!13761 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577807 () Bool)

(assert (=> b!1577807 (and (bvsge (index!57444 lt!676105) #b00000000000000000000000000000000) (bvslt (index!57444 lt!676105) (size!51482 _keys!610)))))

(declare-fun res!1077893 () Bool)

(assert (=> b!1577807 (= res!1077893 (= (select (arr!50932 _keys!610) (index!57444 lt!676105)) k!768))))

(declare-fun e!880055 () Bool)

(assert (=> b!1577807 (=> res!1077893 e!880055)))

(assert (=> b!1577807 (= e!880058 e!880055)))

(declare-fun b!1577808 () Bool)

(assert (=> b!1577808 (= e!880054 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577809 () Bool)

(assert (=> b!1577809 (and (bvsge (index!57444 lt!676105) #b00000000000000000000000000000000) (bvslt (index!57444 lt!676105) (size!51482 _keys!610)))))

(declare-fun res!1077894 () Bool)

(assert (=> b!1577809 (= res!1077894 (= (select (arr!50932 _keys!610) (index!57444 lt!676105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577809 (=> res!1077894 e!880055)))

(declare-fun b!1577810 () Bool)

(assert (=> b!1577810 (and (bvsge (index!57444 lt!676105) #b00000000000000000000000000000000) (bvslt (index!57444 lt!676105) (size!51482 _keys!610)))))

(assert (=> b!1577810 (= e!880055 (= (select (arr!50932 _keys!610) (index!57444 lt!676105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577811 () Bool)

(assert (=> b!1577811 (= e!880054 (Intermediate!13761 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(assert (= (and d!165963 c!146239) b!1577806))

(assert (= (and d!165963 (not c!146239)) b!1577805))

(assert (= (and b!1577805 c!146240) b!1577811))

(assert (= (and b!1577805 (not c!146240)) b!1577808))

(assert (= (and d!165963 c!146241) b!1577803))

(assert (= (and d!165963 (not c!146241)) b!1577804))

(assert (= (and b!1577804 res!1077892) b!1577807))

(assert (= (and b!1577807 (not res!1077893)) b!1577809))

(assert (= (and b!1577809 (not res!1077894)) b!1577810))

(declare-fun m!1449937 () Bool)

(assert (=> b!1577810 m!1449937))

(assert (=> b!1577807 m!1449937))

(assert (=> b!1577809 m!1449937))

(assert (=> b!1577808 m!1449905))

(declare-fun m!1449939 () Bool)

(assert (=> b!1577808 m!1449939))

(assert (=> b!1577808 m!1449939))

(declare-fun m!1449941 () Bool)

(assert (=> b!1577808 m!1449941))

(assert (=> d!165963 m!1449905))

(declare-fun m!1449943 () Bool)

(assert (=> d!165963 m!1449943))

(assert (=> d!165963 m!1449899))

(assert (=> b!1577760 d!165963))

(declare-fun d!165969 () Bool)

(declare-fun lt!676108 () (_ BitVec 32))

(assert (=> d!165969 (and (bvsge lt!676108 #b00000000000000000000000000000000) (bvslt lt!676108 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165969 (= lt!676108 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165969 (validMask!0 mask!910)))

(assert (=> d!165969 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676108)))

(declare-fun bs!45601 () Bool)

(assert (= bs!45601 d!165969))

(declare-fun m!1449945 () Bool)

(assert (=> bs!45601 m!1449945))

(assert (=> bs!45601 m!1449899))

(assert (=> b!1577760 d!165969))

(declare-fun d!165973 () Bool)

(assert (=> d!165973 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577758 d!165973))

(declare-fun d!165975 () Bool)

(assert (=> d!165975 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136522 d!165975))

(declare-fun d!165981 () Bool)

(assert (=> d!165981 (= (array_inv!39659 _keys!610) (bvsge (size!51482 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136522 d!165981))

(push 1)

(assert (not d!165969))

(assert (not d!165963))

(assert (not b!1577808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

