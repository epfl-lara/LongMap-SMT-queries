; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28916 () Bool)

(assert start!28916)

(declare-fun b!294420 () Bool)

(declare-fun res!154792 () Bool)

(declare-fun e!186123 () Bool)

(assert (=> b!294420 (=> (not res!154792) (not e!186123))))

(declare-datatypes ((array!14899 0))(
  ( (array!14900 (arr!7066 (Array (_ BitVec 32) (_ BitVec 64))) (size!7418 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14899)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14899 (_ BitVec 32)) Bool)

(assert (=> b!294420 (= res!154792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294421 () Bool)

(declare-fun e!186124 () Bool)

(assert (=> b!294421 (= e!186124 e!186123)))

(declare-fun res!154797 () Bool)

(assert (=> b!294421 (=> (not res!154797) (not e!186123))))

(declare-fun lt!145956 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2215 0))(
  ( (MissingZero!2215 (index!11030 (_ BitVec 32))) (Found!2215 (index!11031 (_ BitVec 32))) (Intermediate!2215 (undefined!3027 Bool) (index!11032 (_ BitVec 32)) (x!29227 (_ BitVec 32))) (Undefined!2215) (MissingVacant!2215 (index!11033 (_ BitVec 32))) )
))
(declare-fun lt!145957 () SeekEntryResult!2215)

(assert (=> b!294421 (= res!154797 (or lt!145956 (= lt!145957 (MissingVacant!2215 i!1256))))))

(assert (=> b!294421 (= lt!145956 (= lt!145957 (MissingZero!2215 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14899 (_ BitVec 32)) SeekEntryResult!2215)

(assert (=> b!294421 (= lt!145957 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!294422 () Bool)

(declare-fun res!154794 () Bool)

(assert (=> b!294422 (=> (not res!154794) (not e!186124))))

(declare-fun arrayContainsKey!0 (array!14899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294422 (= res!154794 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154795 () Bool)

(assert (=> start!28916 (=> (not res!154795) (not e!186124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28916 (= res!154795 (validMask!0 mask!3809))))

(assert (=> start!28916 e!186124))

(assert (=> start!28916 true))

(declare-fun array_inv!5029 (array!14899) Bool)

(assert (=> start!28916 (array_inv!5029 a!3312)))

(declare-fun b!294423 () Bool)

(declare-fun lt!145955 () SeekEntryResult!2215)

(assert (=> b!294423 (= e!186123 (and lt!145956 (let ((bdg!6235 (not (is-Intermediate!2215 lt!145955)))) (and (or bdg!6235 (not (undefined!3027 lt!145955))) (or bdg!6235 (not (= (select (arr!7066 a!3312) (index!11032 lt!145955)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6235) (= (select (arr!7066 a!3312) (index!11032 lt!145955)) k!2524)))))))

(declare-fun lt!145959 () (_ BitVec 32))

(declare-fun lt!145958 () SeekEntryResult!2215)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14899 (_ BitVec 32)) SeekEntryResult!2215)

(assert (=> b!294423 (= lt!145958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145959 k!2524 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312)) mask!3809))))

(assert (=> b!294423 (= lt!145955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145959 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294423 (= lt!145959 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!294424 () Bool)

(declare-fun res!154793 () Bool)

(assert (=> b!294424 (=> (not res!154793) (not e!186124))))

(assert (=> b!294424 (= res!154793 (and (= (size!7418 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7418 a!3312))))))

(declare-fun b!294425 () Bool)

(declare-fun res!154796 () Bool)

(assert (=> b!294425 (=> (not res!154796) (not e!186124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294425 (= res!154796 (validKeyInArray!0 k!2524))))

(assert (= (and start!28916 res!154795) b!294424))

(assert (= (and b!294424 res!154793) b!294425))

(assert (= (and b!294425 res!154796) b!294422))

(assert (= (and b!294422 res!154794) b!294421))

(assert (= (and b!294421 res!154797) b!294420))

(assert (= (and b!294420 res!154792) b!294423))

(declare-fun m!307889 () Bool)

(assert (=> b!294421 m!307889))

(declare-fun m!307891 () Bool)

(assert (=> b!294422 m!307891))

(declare-fun m!307893 () Bool)

(assert (=> b!294425 m!307893))

(declare-fun m!307895 () Bool)

(assert (=> start!28916 m!307895))

(declare-fun m!307897 () Bool)

(assert (=> start!28916 m!307897))

(declare-fun m!307899 () Bool)

(assert (=> b!294420 m!307899))

(declare-fun m!307901 () Bool)

(assert (=> b!294423 m!307901))

(declare-fun m!307903 () Bool)

(assert (=> b!294423 m!307903))

(declare-fun m!307905 () Bool)

(assert (=> b!294423 m!307905))

(declare-fun m!307907 () Bool)

(assert (=> b!294423 m!307907))

(declare-fun m!307909 () Bool)

(assert (=> b!294423 m!307909))

(push 1)

(assert (not b!294425))

(assert (not b!294423))

(assert (not b!294421))

(assert (not b!294420))

(assert (not start!28916))

(assert (not b!294422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66803 () Bool)

(assert (=> d!66803 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28916 d!66803))

(declare-fun d!66811 () Bool)

(assert (=> d!66811 (= (array_inv!5029 a!3312) (bvsge (size!7418 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28916 d!66811))

(declare-fun e!186178 () SeekEntryResult!2215)

(declare-fun b!294501 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294501 (= e!186178 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145959 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312)) mask!3809))))

(declare-fun d!66815 () Bool)

(declare-fun e!186176 () Bool)

(assert (=> d!66815 e!186176))

(declare-fun c!47407 () Bool)

(declare-fun lt!145989 () SeekEntryResult!2215)

(assert (=> d!66815 (= c!47407 (and (is-Intermediate!2215 lt!145989) (undefined!3027 lt!145989)))))

(declare-fun e!186174 () SeekEntryResult!2215)

(assert (=> d!66815 (= lt!145989 e!186174)))

(declare-fun c!47408 () Bool)

(assert (=> d!66815 (= c!47408 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145988 () (_ BitVec 64))

(assert (=> d!66815 (= lt!145988 (select (arr!7066 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312))) lt!145959))))

(assert (=> d!66815 (validMask!0 mask!3809)))

(assert (=> d!66815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145959 k!2524 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312)) mask!3809) lt!145989)))

(declare-fun b!294502 () Bool)

(assert (=> b!294502 (= e!186178 (Intermediate!2215 false lt!145959 #b00000000000000000000000000000000))))

(declare-fun b!294503 () Bool)

(assert (=> b!294503 (= e!186176 (bvsge (x!29227 lt!145989) #b01111111111111111111111111111110))))

(declare-fun b!294504 () Bool)

(assert (=> b!294504 (and (bvsge (index!11032 lt!145989) #b00000000000000000000000000000000) (bvslt (index!11032 lt!145989) (size!7418 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312)))))))

(declare-fun e!186177 () Bool)

(assert (=> b!294504 (= e!186177 (= (select (arr!7066 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312))) (index!11032 lt!145989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294505 () Bool)

(assert (=> b!294505 (and (bvsge (index!11032 lt!145989) #b00000000000000000000000000000000) (bvslt (index!11032 lt!145989) (size!7418 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312)))))))

(declare-fun res!154832 () Bool)

(assert (=> b!294505 (= res!154832 (= (select (arr!7066 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312))) (index!11032 lt!145989)) k!2524))))

(assert (=> b!294505 (=> res!154832 e!186177)))

(declare-fun e!186175 () Bool)

(assert (=> b!294505 (= e!186175 e!186177)))

(declare-fun b!294506 () Bool)

(assert (=> b!294506 (= e!186174 e!186178)))

(declare-fun c!47409 () Bool)

(assert (=> b!294506 (= c!47409 (or (= lt!145988 k!2524) (= (bvadd lt!145988 lt!145988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294507 () Bool)

(assert (=> b!294507 (= e!186174 (Intermediate!2215 true lt!145959 #b00000000000000000000000000000000))))

(declare-fun b!294508 () Bool)

(assert (=> b!294508 (and (bvsge (index!11032 lt!145989) #b00000000000000000000000000000000) (bvslt (index!11032 lt!145989) (size!7418 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312)))))))

(declare-fun res!154833 () Bool)

(assert (=> b!294508 (= res!154833 (= (select (arr!7066 (array!14900 (store (arr!7066 a!3312) i!1256 k!2524) (size!7418 a!3312))) (index!11032 lt!145989)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294508 (=> res!154833 e!186177)))

(declare-fun b!294509 () Bool)

(assert (=> b!294509 (= e!186176 e!186175)))

(declare-fun res!154831 () Bool)

(assert (=> b!294509 (= res!154831 (and (is-Intermediate!2215 lt!145989) (not (undefined!3027 lt!145989)) (bvslt (x!29227 lt!145989) #b01111111111111111111111111111110) (bvsge (x!29227 lt!145989) #b00000000000000000000000000000000) (bvsge (x!29227 lt!145989) #b00000000000000000000000000000000)))))

(assert (=> b!294509 (=> (not res!154831) (not e!186175))))

(assert (= (and d!66815 c!47408) b!294507))

(assert (= (and d!66815 (not c!47408)) b!294506))

(assert (= (and b!294506 c!47409) b!294502))

(assert (= (and b!294506 (not c!47409)) b!294501))

(assert (= (and d!66815 c!47407) b!294503))

(assert (= (and d!66815 (not c!47407)) b!294509))

(assert (= (and b!294509 res!154831) b!294505))

(assert (= (and b!294505 (not res!154832)) b!294508))

(assert (= (and b!294508 (not res!154833)) b!294504))

(declare-fun m!307945 () Bool)

(assert (=> d!66815 m!307945))

(assert (=> d!66815 m!307895))

(declare-fun m!307947 () Bool)

(assert (=> b!294508 m!307947))

(assert (=> b!294505 m!307947))

(assert (=> b!294504 m!307947))

(declare-fun m!307951 () Bool)

(assert (=> b!294501 m!307951))

(assert (=> b!294501 m!307951))

(declare-fun m!307955 () Bool)

(assert (=> b!294501 m!307955))

(assert (=> b!294423 d!66815))

(declare-fun e!186188 () SeekEntryResult!2215)

(declare-fun b!294519 () Bool)

(assert (=> b!294519 (= e!186188 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145959 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun d!66825 () Bool)

(declare-fun e!186186 () Bool)

(assert (=> d!66825 e!186186))

(declare-fun c!47413 () Bool)

(declare-fun lt!145993 () SeekEntryResult!2215)

(assert (=> d!66825 (= c!47413 (and (is-Intermediate!2215 lt!145993) (undefined!3027 lt!145993)))))

(declare-fun e!186184 () SeekEntryResult!2215)

(assert (=> d!66825 (= lt!145993 e!186184)))

(declare-fun c!47414 () Bool)

(assert (=> d!66825 (= c!47414 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145992 () (_ BitVec 64))

(assert (=> d!66825 (= lt!145992 (select (arr!7066 a!3312) lt!145959))))

(assert (=> d!66825 (validMask!0 mask!3809)))

(assert (=> d!66825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145959 k!2524 a!3312 mask!3809) lt!145993)))

(declare-fun b!294520 () Bool)

(assert (=> b!294520 (= e!186188 (Intermediate!2215 false lt!145959 #b00000000000000000000000000000000))))

(declare-fun b!294521 () Bool)

(assert (=> b!294521 (= e!186186 (bvsge (x!29227 lt!145993) #b01111111111111111111111111111110))))

(declare-fun b!294522 () Bool)

(assert (=> b!294522 (and (bvsge (index!11032 lt!145993) #b00000000000000000000000000000000) (bvslt (index!11032 lt!145993) (size!7418 a!3312)))))

(declare-fun e!186187 () Bool)

(assert (=> b!294522 (= e!186187 (= (select (arr!7066 a!3312) (index!11032 lt!145993)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294523 () Bool)

(assert (=> b!294523 (and (bvsge (index!11032 lt!145993) #b00000000000000000000000000000000) (bvslt (index!11032 lt!145993) (size!7418 a!3312)))))

(declare-fun res!154838 () Bool)

(assert (=> b!294523 (= res!154838 (= (select (arr!7066 a!3312) (index!11032 lt!145993)) k!2524))))

(assert (=> b!294523 (=> res!154838 e!186187)))

(declare-fun e!186185 () Bool)

(assert (=> b!294523 (= e!186185 e!186187)))

(declare-fun b!294524 () Bool)

(assert (=> b!294524 (= e!186184 e!186188)))

(declare-fun c!47415 () Bool)

(assert (=> b!294524 (= c!47415 (or (= lt!145992 k!2524) (= (bvadd lt!145992 lt!145992) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294525 () Bool)

(assert (=> b!294525 (= e!186184 (Intermediate!2215 true lt!145959 #b00000000000000000000000000000000))))

(declare-fun b!294526 () Bool)

(assert (=> b!294526 (and (bvsge (index!11032 lt!145993) #b00000000000000000000000000000000) (bvslt (index!11032 lt!145993) (size!7418 a!3312)))))

(declare-fun res!154839 () Bool)

(assert (=> b!294526 (= res!154839 (= (select (arr!7066 a!3312) (index!11032 lt!145993)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294526 (=> res!154839 e!186187)))

(declare-fun b!294527 () Bool)

(assert (=> b!294527 (= e!186186 e!186185)))

(declare-fun res!154837 () Bool)

(assert (=> b!294527 (= res!154837 (and (is-Intermediate!2215 lt!145993) (not (undefined!3027 lt!145993)) (bvslt (x!29227 lt!145993) #b01111111111111111111111111111110) (bvsge (x!29227 lt!145993) #b00000000000000000000000000000000) (bvsge (x!29227 lt!145993) #b00000000000000000000000000000000)))))

(assert (=> b!294527 (=> (not res!154837) (not e!186185))))

(assert (= (and d!66825 c!47414) b!294525))

(assert (= (and d!66825 (not c!47414)) b!294524))

(assert (= (and b!294524 c!47415) b!294520))

(assert (= (and b!294524 (not c!47415)) b!294519))

(assert (= (and d!66825 c!47413) b!294521))

(assert (= (and d!66825 (not c!47413)) b!294527))

(assert (= (and b!294527 res!154837) b!294523))

(assert (= (and b!294523 (not res!154838)) b!294526))

(assert (= (and b!294526 (not res!154839)) b!294522))

(declare-fun m!307959 () Bool)

(assert (=> d!66825 m!307959))

(assert (=> d!66825 m!307895))

(declare-fun m!307961 () Bool)

(assert (=> b!294526 m!307961))

(assert (=> b!294523 m!307961))

(assert (=> b!294522 m!307961))

(assert (=> b!294519 m!307951))

(assert (=> b!294519 m!307951))

(declare-fun m!307963 () Bool)

(assert (=> b!294519 m!307963))

(assert (=> b!294423 d!66825))

(declare-fun d!66829 () Bool)

(declare-fun lt!146009 () (_ BitVec 32))

(declare-fun lt!146008 () (_ BitVec 32))

(assert (=> d!66829 (= lt!146009 (bvmul (bvxor lt!146008 (bvlshr lt!146008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66829 (= lt!146008 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66829 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154841 (let ((h!5281 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29231 (bvmul (bvxor h!5281 (bvlshr h!5281 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29231 (bvlshr x!29231 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154841 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154841 #b00000000000000000000000000000000))))))

(assert (=> d!66829 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!146009 (bvlshr lt!146009 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294423 d!66829))

(declare-fun d!66833 () Bool)

(declare-fun res!154852 () Bool)

(declare-fun e!186203 () Bool)

(assert (=> d!66833 (=> res!154852 e!186203)))

(assert (=> d!66833 (= res!154852 (= (select (arr!7066 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66833 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186203)))

(declare-fun b!294550 () Bool)

(declare-fun e!186204 () Bool)

(assert (=> b!294550 (= e!186203 e!186204)))

(declare-fun res!154853 () Bool)

(assert (=> b!294550 (=> (not res!154853) (not e!186204))))

(assert (=> b!294550 (= res!154853 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7418 a!3312)))))

(declare-fun b!294551 () Bool)

(assert (=> b!294551 (= e!186204 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66833 (not res!154852)) b!294550))

(assert (= (and b!294550 res!154853) b!294551))

(declare-fun m!307965 () Bool)

(assert (=> d!66833 m!307965))

(declare-fun m!307967 () Bool)

(assert (=> b!294551 m!307967))

(assert (=> b!294422 d!66833))

(declare-fun b!294606 () Bool)

(declare-fun e!186238 () SeekEntryResult!2215)

(declare-fun lt!146035 () SeekEntryResult!2215)

(assert (=> b!294606 (= e!186238 (Found!2215 (index!11032 lt!146035)))))

(declare-fun b!294607 () Bool)

(declare-fun e!186237 () SeekEntryResult!2215)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14899 (_ BitVec 32)) SeekEntryResult!2215)

(assert (=> b!294607 (= e!186237 (seekKeyOrZeroReturnVacant!0 (x!29227 lt!146035) (index!11032 lt!146035) (index!11032 lt!146035) k!2524 a!3312 mask!3809))))

(declare-fun d!66835 () Bool)

(declare-fun lt!146036 () SeekEntryResult!2215)

(assert (=> d!66835 (and (or (is-Undefined!2215 lt!146036) (not (is-Found!2215 lt!146036)) (and (bvsge (index!11031 lt!146036) #b00000000000000000000000000000000) (bvslt (index!11031 lt!146036) (size!7418 a!3312)))) (or (is-Undefined!2215 lt!146036) (is-Found!2215 lt!146036) (not (is-MissingZero!2215 lt!146036)) (and (bvsge (index!11030 lt!146036) #b00000000000000000000000000000000) (bvslt (index!11030 lt!146036) (size!7418 a!3312)))) (or (is-Undefined!2215 lt!146036) (is-Found!2215 lt!146036) (is-MissingZero!2215 lt!146036) (not (is-MissingVacant!2215 lt!146036)) (and (bvsge (index!11033 lt!146036) #b00000000000000000000000000000000) (bvslt (index!11033 lt!146036) (size!7418 a!3312)))) (or (is-Undefined!2215 lt!146036) (ite (is-Found!2215 lt!146036) (= (select (arr!7066 a!3312) (index!11031 lt!146036)) k!2524) (ite (is-MissingZero!2215 lt!146036) (= (select (arr!7066 a!3312) (index!11030 lt!146036)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2215 lt!146036) (= (select (arr!7066 a!3312) (index!11033 lt!146036)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!186236 () SeekEntryResult!2215)

(assert (=> d!66835 (= lt!146036 e!186236)))

(declare-fun c!47445 () Bool)

(assert (=> d!66835 (= c!47445 (and (is-Intermediate!2215 lt!146035) (undefined!3027 lt!146035)))))

(assert (=> d!66835 (= lt!146035 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66835 (validMask!0 mask!3809)))

(assert (=> d!66835 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!146036)))

(declare-fun b!294608 () Bool)

(assert (=> b!294608 (= e!186236 Undefined!2215)))

(declare-fun b!294609 () Bool)

(declare-fun c!47444 () Bool)

(declare-fun lt!146037 () (_ BitVec 64))

(assert (=> b!294609 (= c!47444 (= lt!146037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294609 (= e!186238 e!186237)))

(declare-fun b!294610 () Bool)

(assert (=> b!294610 (= e!186237 (MissingZero!2215 (index!11032 lt!146035)))))

(declare-fun b!294611 () Bool)

(assert (=> b!294611 (= e!186236 e!186238)))

(assert (=> b!294611 (= lt!146037 (select (arr!7066 a!3312) (index!11032 lt!146035)))))

(declare-fun c!47443 () Bool)

(assert (=> b!294611 (= c!47443 (= lt!146037 k!2524))))

(assert (= (and d!66835 c!47445) b!294608))

(assert (= (and d!66835 (not c!47445)) b!294611))

(assert (= (and b!294611 c!47443) b!294606))

(assert (= (and b!294611 (not c!47443)) b!294609))

(assert (= (and b!294609 c!47444) b!294610))

(assert (= (and b!294609 (not c!47444)) b!294607))

(declare-fun m!307997 () Bool)

(assert (=> b!294607 m!307997))

(declare-fun m!307999 () Bool)

(assert (=> d!66835 m!307999))

(declare-fun m!308001 () Bool)

(assert (=> d!66835 m!308001))

(assert (=> d!66835 m!307895))

(assert (=> d!66835 m!307905))

(declare-fun m!308003 () Bool)

(assert (=> d!66835 m!308003))

(assert (=> d!66835 m!307905))

(declare-fun m!308005 () Bool)

(assert (=> d!66835 m!308005))

(declare-fun m!308007 () Bool)

(assert (=> b!294611 m!308007))

(assert (=> b!294421 d!66835))

(declare-fun b!294632 () Bool)

(declare-fun e!186251 () Bool)

(declare-fun e!186253 () Bool)

(assert (=> b!294632 (= e!186251 e!186253)))

(declare-fun lt!146052 () (_ BitVec 64))

(assert (=> b!294632 (= lt!146052 (select (arr!7066 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9206 0))(
  ( (Unit!9207) )
))
(declare-fun lt!146051 () Unit!9206)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14899 (_ BitVec 64) (_ BitVec 32)) Unit!9206)

(assert (=> b!294632 (= lt!146051 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146052 #b00000000000000000000000000000000))))

(assert (=> b!294632 (arrayContainsKey!0 a!3312 lt!146052 #b00000000000000000000000000000000)))

(declare-fun lt!146050 () Unit!9206)

(assert (=> b!294632 (= lt!146050 lt!146051)))

(declare-fun res!154871 () Bool)

(assert (=> b!294632 (= res!154871 (= (seekEntryOrOpen!0 (select (arr!7066 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2215 #b00000000000000000000000000000000)))))

