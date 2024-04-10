; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33226 () Bool)

(assert start!33226)

(declare-fun b!330554 () Bool)

(declare-fun res!182181 () Bool)

(declare-fun e!202885 () Bool)

(assert (=> b!330554 (=> (not res!182181) (not e!202885))))

(declare-datatypes ((array!16885 0))(
  ( (array!16886 (arr!7985 (Array (_ BitVec 32) (_ BitVec 64))) (size!8337 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16885)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3116 0))(
  ( (MissingZero!3116 (index!14640 (_ BitVec 32))) (Found!3116 (index!14641 (_ BitVec 32))) (Intermediate!3116 (undefined!3928 Bool) (index!14642 (_ BitVec 32)) (x!32923 (_ BitVec 32))) (Undefined!3116) (MissingVacant!3116 (index!14643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16885 (_ BitVec 32)) SeekEntryResult!3116)

(assert (=> b!330554 (= res!182181 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3116 i!1250)))))

(declare-fun b!330555 () Bool)

(declare-fun res!182183 () Bool)

(declare-fun e!202883 () Bool)

(assert (=> b!330555 (=> (not res!182183) (not e!202883))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330555 (= res!182183 (and (= (select (arr!7985 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8337 a!3305))))))

(declare-fun b!330556 () Bool)

(declare-fun res!182177 () Bool)

(assert (=> b!330556 (=> (not res!182177) (not e!202885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330556 (= res!182177 (validKeyInArray!0 k!2497))))

(declare-fun b!330557 () Bool)

(assert (=> b!330557 (= e!202885 e!202883)))

(declare-fun res!182179 () Bool)

(assert (=> b!330557 (=> (not res!182179) (not e!202883))))

(declare-fun lt!158536 () SeekEntryResult!3116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16885 (_ BitVec 32)) SeekEntryResult!3116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330557 (= res!182179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158536))))

(assert (=> b!330557 (= lt!158536 (Intermediate!3116 false resIndex!58 resX!58))))

(declare-fun b!330558 () Bool)

(declare-fun e!202879 () Bool)

(declare-fun e!202884 () Bool)

(assert (=> b!330558 (= e!202879 (not e!202884))))

(declare-fun res!182175 () Bool)

(assert (=> b!330558 (=> res!182175 e!202884)))

(assert (=> b!330558 (= res!182175 (not (= (select (arr!7985 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!330558 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!10302 0))(
  ( (Unit!10303) )
))
(declare-fun lt!158537 () Unit!10302)

(declare-fun e!202880 () Unit!10302)

(assert (=> b!330558 (= lt!158537 e!202880)))

(declare-fun c!51834 () Bool)

(assert (=> b!330558 (= c!51834 (not (= resIndex!58 index!1840)))))

(declare-fun b!330559 () Bool)

(assert (=> b!330559 false))

(declare-fun e!202882 () Unit!10302)

(declare-fun Unit!10304 () Unit!10302)

(assert (=> b!330559 (= e!202882 Unit!10304)))

(declare-fun b!330560 () Bool)

(assert (=> b!330560 (= e!202883 e!202879)))

(declare-fun res!182178 () Bool)

(assert (=> b!330560 (=> (not res!182178) (not e!202879))))

(declare-fun lt!158538 () SeekEntryResult!3116)

(assert (=> b!330560 (= res!182178 (and (= lt!158538 lt!158536) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7985 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(assert (=> b!330560 (= lt!158538 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!330561 () Bool)

(declare-fun e!202878 () Unit!10302)

(declare-fun Unit!10305 () Unit!10302)

(assert (=> b!330561 (= e!202878 Unit!10305)))

(assert (=> b!330561 false))

(declare-fun res!182182 () Bool)

(assert (=> start!33226 (=> (not res!182182) (not e!202885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33226 (= res!182182 (validMask!0 mask!3777))))

(assert (=> start!33226 e!202885))

(declare-fun array_inv!5948 (array!16885) Bool)

(assert (=> start!33226 (array_inv!5948 a!3305)))

(assert (=> start!33226 true))

(declare-fun b!330562 () Bool)

(declare-fun Unit!10306 () Unit!10302)

(assert (=> b!330562 (= e!202878 Unit!10306)))

(declare-fun b!330563 () Bool)

(declare-fun res!182184 () Bool)

(assert (=> b!330563 (=> (not res!182184) (not e!202885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16885 (_ BitVec 32)) Bool)

(assert (=> b!330563 (= res!182184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330564 () Bool)

(assert (=> b!330564 (= e!202880 e!202882)))

(declare-fun c!51832 () Bool)

(assert (=> b!330564 (= c!51832 (or (= (select (arr!7985 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7985 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330565 () Bool)

(assert (=> b!330565 (= e!202884 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305)) mask!3777) lt!158538))))

(declare-fun b!330566 () Bool)

(declare-fun Unit!10307 () Unit!10302)

(assert (=> b!330566 (= e!202880 Unit!10307)))

(declare-fun b!330567 () Bool)

(declare-fun res!182180 () Bool)

(assert (=> b!330567 (=> (not res!182180) (not e!202885))))

(declare-fun arrayContainsKey!0 (array!16885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330567 (= res!182180 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330568 () Bool)

(assert (=> b!330568 false))

(declare-fun lt!158535 () Unit!10302)

(assert (=> b!330568 (= lt!158535 e!202878)))

(declare-fun c!51833 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330568 (= c!51833 (is-Intermediate!3116 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10308 () Unit!10302)

(assert (=> b!330568 (= e!202882 Unit!10308)))

(declare-fun b!330569 () Bool)

(declare-fun res!182176 () Bool)

(assert (=> b!330569 (=> (not res!182176) (not e!202885))))

(assert (=> b!330569 (= res!182176 (and (= (size!8337 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8337 a!3305))))))

(assert (= (and start!33226 res!182182) b!330569))

(assert (= (and b!330569 res!182176) b!330556))

(assert (= (and b!330556 res!182177) b!330567))

(assert (= (and b!330567 res!182180) b!330554))

(assert (= (and b!330554 res!182181) b!330563))

(assert (= (and b!330563 res!182184) b!330557))

(assert (= (and b!330557 res!182179) b!330555))

(assert (= (and b!330555 res!182183) b!330560))

(assert (= (and b!330560 res!182178) b!330558))

(assert (= (and b!330558 c!51834) b!330564))

(assert (= (and b!330558 (not c!51834)) b!330566))

(assert (= (and b!330564 c!51832) b!330559))

(assert (= (and b!330564 (not c!51832)) b!330568))

(assert (= (and b!330568 c!51833) b!330562))

(assert (= (and b!330568 (not c!51833)) b!330561))

(assert (= (and b!330558 (not res!182175)) b!330565))

(declare-fun m!335735 () Bool)

(assert (=> b!330567 m!335735))

(declare-fun m!335737 () Bool)

(assert (=> b!330564 m!335737))

(declare-fun m!335739 () Bool)

(assert (=> b!330554 m!335739))

(declare-fun m!335741 () Bool)

(assert (=> b!330555 m!335741))

(declare-fun m!335743 () Bool)

(assert (=> b!330565 m!335743))

(declare-fun m!335745 () Bool)

(assert (=> b!330565 m!335745))

(assert (=> b!330558 m!335737))

(assert (=> b!330560 m!335737))

(declare-fun m!335747 () Bool)

(assert (=> b!330560 m!335747))

(declare-fun m!335749 () Bool)

(assert (=> start!33226 m!335749))

(declare-fun m!335751 () Bool)

(assert (=> start!33226 m!335751))

(declare-fun m!335753 () Bool)

(assert (=> b!330563 m!335753))

(declare-fun m!335755 () Bool)

(assert (=> b!330557 m!335755))

(assert (=> b!330557 m!335755))

(declare-fun m!335757 () Bool)

(assert (=> b!330557 m!335757))

(declare-fun m!335759 () Bool)

(assert (=> b!330568 m!335759))

(assert (=> b!330568 m!335759))

(declare-fun m!335761 () Bool)

(assert (=> b!330568 m!335761))

(declare-fun m!335763 () Bool)

(assert (=> b!330556 m!335763))

(push 1)

(assert (not b!330568))

(assert (not b!330565))

(assert (not b!330556))

(assert (not b!330557))

(assert (not b!330567))

(assert (not b!330560))

(assert (not b!330563))

(assert (not b!330554))

(assert (not start!33226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70297 () Bool)

(assert (=> d!70297 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33226 d!70297))

(declare-fun d!70303 () Bool)

(assert (=> d!70303 (= (array_inv!5948 a!3305) (bvsge (size!8337 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33226 d!70303))

(declare-fun bm!26161 () Bool)

(declare-fun call!26164 () Bool)

(assert (=> bm!26161 (= call!26164 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun d!70305 () Bool)

(declare-fun res!182255 () Bool)

(declare-fun e!202951 () Bool)

(assert (=> d!70305 (=> res!182255 e!202951)))

(assert (=> d!70305 (= res!182255 (bvsge #b00000000000000000000000000000000 (size!8337 a!3305)))))

(assert (=> d!70305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202951)))

(declare-fun b!330692 () Bool)

(declare-fun e!202950 () Bool)

(assert (=> b!330692 (= e!202951 e!202950)))

(declare-fun c!51861 () Bool)

(assert (=> b!330692 (= c!51861 (validKeyInArray!0 (select (arr!7985 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!330693 () Bool)

(assert (=> b!330693 (= e!202950 call!26164)))

(declare-fun b!330694 () Bool)

(declare-fun e!202952 () Bool)

(assert (=> b!330694 (= e!202952 call!26164)))

(declare-fun b!330695 () Bool)

(assert (=> b!330695 (= e!202950 e!202952)))

(declare-fun lt!158573 () (_ BitVec 64))

(assert (=> b!330695 (= lt!158573 (select (arr!7985 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158574 () Unit!10302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16885 (_ BitVec 64) (_ BitVec 32)) Unit!10302)

(assert (=> b!330695 (= lt!158574 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158573 #b00000000000000000000000000000000))))

(assert (=> b!330695 (arrayContainsKey!0 a!3305 lt!158573 #b00000000000000000000000000000000)))

(declare-fun lt!158575 () Unit!10302)

(assert (=> b!330695 (= lt!158575 lt!158574)))

(declare-fun res!182256 () Bool)

(assert (=> b!330695 (= res!182256 (= (seekEntryOrOpen!0 (select (arr!7985 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3116 #b00000000000000000000000000000000)))))

(assert (=> b!330695 (=> (not res!182256) (not e!202952))))

(assert (= (and d!70305 (not res!182255)) b!330692))

(assert (= (and b!330692 c!51861) b!330695))

(assert (= (and b!330692 (not c!51861)) b!330693))

(assert (= (and b!330695 res!182256) b!330694))

(assert (= (or b!330694 b!330693) bm!26161))

(declare-fun m!335825 () Bool)

(assert (=> bm!26161 m!335825))

(declare-fun m!335827 () Bool)

(assert (=> b!330692 m!335827))

(assert (=> b!330692 m!335827))

(declare-fun m!335829 () Bool)

(assert (=> b!330692 m!335829))

(assert (=> b!330695 m!335827))

(declare-fun m!335831 () Bool)

(assert (=> b!330695 m!335831))

(declare-fun m!335833 () Bool)

(assert (=> b!330695 m!335833))

(assert (=> b!330695 m!335827))

(declare-fun m!335835 () Bool)

(assert (=> b!330695 m!335835))

(assert (=> b!330563 d!70305))

(declare-fun b!330768 () Bool)

(declare-fun lt!158608 () SeekEntryResult!3116)

(assert (=> b!330768 (and (bvsge (index!14642 lt!158608) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158608) (size!8337 a!3305)))))

(declare-fun res!182285 () Bool)

(assert (=> b!330768 (= res!182285 (= (select (arr!7985 a!3305) (index!14642 lt!158608)) k!2497))))

(declare-fun e!202996 () Bool)

(assert (=> b!330768 (=> res!182285 e!202996)))

(declare-fun e!202994 () Bool)

(assert (=> b!330768 (= e!202994 e!202996)))

(declare-fun b!330769 () Bool)

(declare-fun e!202995 () SeekEntryResult!3116)

(declare-fun e!202997 () SeekEntryResult!3116)

(assert (=> b!330769 (= e!202995 e!202997)))

(declare-fun c!51886 () Bool)

(declare-fun lt!158607 () (_ BitVec 64))

(assert (=> b!330769 (= c!51886 (or (= lt!158607 k!2497) (= (bvadd lt!158607 lt!158607) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330770 () Bool)

(assert (=> b!330770 (and (bvsge (index!14642 lt!158608) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158608) (size!8337 a!3305)))))

(declare-fun res!182284 () Bool)

(assert (=> b!330770 (= res!182284 (= (select (arr!7985 a!3305) (index!14642 lt!158608)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330770 (=> res!182284 e!202996)))

(declare-fun b!330771 () Bool)

(declare-fun e!202993 () Bool)

(assert (=> b!330771 (= e!202993 e!202994)))

(declare-fun res!182283 () Bool)

(assert (=> b!330771 (= res!182283 (and (is-Intermediate!3116 lt!158608) (not (undefined!3928 lt!158608)) (bvslt (x!32923 lt!158608) #b01111111111111111111111111111110) (bvsge (x!32923 lt!158608) #b00000000000000000000000000000000) (bvsge (x!32923 lt!158608) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!330771 (=> (not res!182283) (not e!202994))))

(declare-fun b!330772 () Bool)

(assert (=> b!330772 (= e!202997 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!330773 () Bool)

(assert (=> b!330773 (= e!202995 (Intermediate!3116 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun d!70307 () Bool)

(assert (=> d!70307 e!202993))

(declare-fun c!51888 () Bool)

(assert (=> d!70307 (= c!51888 (and (is-Intermediate!3116 lt!158608) (undefined!3928 lt!158608)))))

(assert (=> d!70307 (= lt!158608 e!202995)))

(declare-fun c!51887 () Bool)

(assert (=> d!70307 (= c!51887 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!70307 (= lt!158607 (select (arr!7985 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70307 (validMask!0 mask!3777)))

(assert (=> d!70307 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!158608)))

(declare-fun b!330774 () Bool)

(assert (=> b!330774 (= e!202993 (bvsge (x!32923 lt!158608) #b01111111111111111111111111111110))))

(declare-fun b!330775 () Bool)

(assert (=> b!330775 (and (bvsge (index!14642 lt!158608) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158608) (size!8337 a!3305)))))

(assert (=> b!330775 (= e!202996 (= (select (arr!7985 a!3305) (index!14642 lt!158608)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330776 () Bool)

(assert (=> b!330776 (= e!202997 (Intermediate!3116 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(assert (= (and d!70307 c!51887) b!330773))

(assert (= (and d!70307 (not c!51887)) b!330769))

(assert (= (and b!330769 c!51886) b!330776))

(assert (= (and b!330769 (not c!51886)) b!330772))

(assert (= (and d!70307 c!51888) b!330774))

(assert (= (and d!70307 (not c!51888)) b!330771))

(assert (= (and b!330771 res!182283) b!330768))

(assert (= (and b!330768 (not res!182285)) b!330770))

(assert (= (and b!330770 (not res!182284)) b!330775))

(declare-fun m!335869 () Bool)

(assert (=> b!330768 m!335869))

(assert (=> b!330775 m!335869))

(assert (=> d!70307 m!335759))

(declare-fun m!335871 () Bool)

(assert (=> d!70307 m!335871))

(assert (=> d!70307 m!335749))

(assert (=> b!330772 m!335759))

(declare-fun m!335873 () Bool)

(assert (=> b!330772 m!335873))

(assert (=> b!330772 m!335873))

(declare-fun m!335875 () Bool)

(assert (=> b!330772 m!335875))

(assert (=> b!330770 m!335869))

(assert (=> b!330568 d!70307))

(declare-fun d!70323 () Bool)

(declare-fun lt!158611 () (_ BitVec 32))

(assert (=> d!70323 (and (bvsge lt!158611 #b00000000000000000000000000000000) (bvslt lt!158611 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70323 (= lt!158611 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70323 (validMask!0 mask!3777)))

(assert (=> d!70323 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158611)))

(declare-fun bs!11433 () Bool)

(assert (= bs!11433 d!70323))

(declare-fun m!335877 () Bool)

(assert (=> bs!11433 m!335877))

(assert (=> bs!11433 m!335749))

(assert (=> b!330568 d!70323))

(declare-fun b!330777 () Bool)

(declare-fun lt!158613 () SeekEntryResult!3116)

(assert (=> b!330777 (and (bvsge (index!14642 lt!158613) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158613) (size!8337 a!3305)))))

(declare-fun res!182288 () Bool)

(assert (=> b!330777 (= res!182288 (= (select (arr!7985 a!3305) (index!14642 lt!158613)) k!2497))))

(declare-fun e!203001 () Bool)

(assert (=> b!330777 (=> res!182288 e!203001)))

(declare-fun e!202999 () Bool)

(assert (=> b!330777 (= e!202999 e!203001)))

(declare-fun b!330778 () Bool)

(declare-fun e!203000 () SeekEntryResult!3116)

(declare-fun e!203002 () SeekEntryResult!3116)

(assert (=> b!330778 (= e!203000 e!203002)))

(declare-fun c!51889 () Bool)

(declare-fun lt!158612 () (_ BitVec 64))

(assert (=> b!330778 (= c!51889 (or (= lt!158612 k!2497) (= (bvadd lt!158612 lt!158612) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330779 () Bool)

(assert (=> b!330779 (and (bvsge (index!14642 lt!158613) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158613) (size!8337 a!3305)))))

(declare-fun res!182287 () Bool)

(assert (=> b!330779 (= res!182287 (= (select (arr!7985 a!3305) (index!14642 lt!158613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330779 (=> res!182287 e!203001)))

(declare-fun b!330780 () Bool)

(declare-fun e!202998 () Bool)

(assert (=> b!330780 (= e!202998 e!202999)))

(declare-fun res!182286 () Bool)

(assert (=> b!330780 (= res!182286 (and (is-Intermediate!3116 lt!158613) (not (undefined!3928 lt!158613)) (bvslt (x!32923 lt!158613) #b01111111111111111111111111111110) (bvsge (x!32923 lt!158613) #b00000000000000000000000000000000) (bvsge (x!32923 lt!158613) #b00000000000000000000000000000000)))))

(assert (=> b!330780 (=> (not res!182286) (not e!202999))))

(declare-fun b!330781 () Bool)

(assert (=> b!330781 (= e!203002 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!330782 () Bool)

(assert (=> b!330782 (= e!203000 (Intermediate!3116 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!70329 () Bool)

(assert (=> d!70329 e!202998))

(declare-fun c!51891 () Bool)

(assert (=> d!70329 (= c!51891 (and (is-Intermediate!3116 lt!158613) (undefined!3928 lt!158613)))))

(assert (=> d!70329 (= lt!158613 e!203000)))

(declare-fun c!51890 () Bool)

(assert (=> d!70329 (= c!51890 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70329 (= lt!158612 (select (arr!7985 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70329 (validMask!0 mask!3777)))

(assert (=> d!70329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158613)))

(declare-fun b!330783 () Bool)

(assert (=> b!330783 (= e!202998 (bvsge (x!32923 lt!158613) #b01111111111111111111111111111110))))

(declare-fun b!330784 () Bool)

(assert (=> b!330784 (and (bvsge (index!14642 lt!158613) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158613) (size!8337 a!3305)))))

(assert (=> b!330784 (= e!203001 (= (select (arr!7985 a!3305) (index!14642 lt!158613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330785 () Bool)

(assert (=> b!330785 (= e!203002 (Intermediate!3116 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!70329 c!51890) b!330782))

(assert (= (and d!70329 (not c!51890)) b!330778))

(assert (= (and b!330778 c!51889) b!330785))

(assert (= (and b!330778 (not c!51889)) b!330781))

(assert (= (and d!70329 c!51891) b!330783))

(assert (= (and d!70329 (not c!51891)) b!330780))

(assert (= (and b!330780 res!182286) b!330777))

(assert (= (and b!330777 (not res!182288)) b!330779))

(assert (= (and b!330779 (not res!182287)) b!330784))

(declare-fun m!335879 () Bool)

(assert (=> b!330777 m!335879))

(assert (=> b!330784 m!335879))

(assert (=> d!70329 m!335755))

(declare-fun m!335881 () Bool)

(assert (=> d!70329 m!335881))

(assert (=> d!70329 m!335749))

(assert (=> b!330781 m!335755))

(declare-fun m!335883 () Bool)

(assert (=> b!330781 m!335883))

(assert (=> b!330781 m!335883))

(declare-fun m!335885 () Bool)

(assert (=> b!330781 m!335885))

(assert (=> b!330779 m!335879))

(assert (=> b!330557 d!70329))

(declare-fun d!70331 () Bool)

(declare-fun lt!158625 () (_ BitVec 32))

(declare-fun lt!158624 () (_ BitVec 32))

(assert (=> d!70331 (= lt!158625 (bvmul (bvxor lt!158624 (bvlshr lt!158624 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70331 (= lt!158624 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70331 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182289 (let ((h!5423 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32933 (bvmul (bvxor h!5423 (bvlshr h!5423 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32933 (bvlshr x!32933 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182289 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182289 #b00000000000000000000000000000000))))))

(assert (=> d!70331 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158625 (bvlshr lt!158625 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!330557 d!70331))

(declare-fun d!70333 () Bool)

(declare-fun res!182300 () Bool)

(declare-fun e!203016 () Bool)

(assert (=> d!70333 (=> res!182300 e!203016)))

(assert (=> d!70333 (= res!182300 (= (select (arr!7985 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70333 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!203016)))

(declare-fun b!330802 () Bool)

(declare-fun e!203017 () Bool)

(assert (=> b!330802 (= e!203016 e!203017)))

(declare-fun res!182301 () Bool)

(assert (=> b!330802 (=> (not res!182301) (not e!203017))))

(assert (=> b!330802 (= res!182301 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8337 a!3305)))))

(declare-fun b!330803 () Bool)

(assert (=> b!330803 (= e!203017 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70333 (not res!182300)) b!330802))

(assert (= (and b!330802 res!182301) b!330803))

(assert (=> d!70333 m!335827))

(declare-fun m!335899 () Bool)

(assert (=> b!330803 m!335899))

(assert (=> b!330567 d!70333))

(declare-fun d!70337 () Bool)

(assert (=> d!70337 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!330556 d!70337))

(declare-fun b!330804 () Bool)

(declare-fun lt!158630 () SeekEntryResult!3116)

(assert (=> b!330804 (and (bvsge (index!14642 lt!158630) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158630) (size!8337 a!3305)))))

(declare-fun res!182304 () Bool)

(assert (=> b!330804 (= res!182304 (= (select (arr!7985 a!3305) (index!14642 lt!158630)) k!2497))))

(declare-fun e!203021 () Bool)

(assert (=> b!330804 (=> res!182304 e!203021)))

(declare-fun e!203019 () Bool)

(assert (=> b!330804 (= e!203019 e!203021)))

(declare-fun b!330805 () Bool)

(declare-fun e!203020 () SeekEntryResult!3116)

(declare-fun e!203022 () SeekEntryResult!3116)

(assert (=> b!330805 (= e!203020 e!203022)))

(declare-fun c!51895 () Bool)

(declare-fun lt!158629 () (_ BitVec 64))

(assert (=> b!330805 (= c!51895 (or (= lt!158629 k!2497) (= (bvadd lt!158629 lt!158629) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330806 () Bool)

(assert (=> b!330806 (and (bvsge (index!14642 lt!158630) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158630) (size!8337 a!3305)))))

(declare-fun res!182303 () Bool)

(assert (=> b!330806 (= res!182303 (= (select (arr!7985 a!3305) (index!14642 lt!158630)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330806 (=> res!182303 e!203021)))

(declare-fun b!330807 () Bool)

(declare-fun e!203018 () Bool)

(assert (=> b!330807 (= e!203018 e!203019)))

(declare-fun res!182302 () Bool)

(assert (=> b!330807 (= res!182302 (and (is-Intermediate!3116 lt!158630) (not (undefined!3928 lt!158630)) (bvslt (x!32923 lt!158630) #b01111111111111111111111111111110) (bvsge (x!32923 lt!158630) #b00000000000000000000000000000000) (bvsge (x!32923 lt!158630) x!1490)))))

(assert (=> b!330807 (=> (not res!182302) (not e!203019))))

(declare-fun b!330808 () Bool)

(assert (=> b!330808 (= e!203022 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!330809 () Bool)

(assert (=> b!330809 (= e!203020 (Intermediate!3116 true index!1840 x!1490))))

(declare-fun d!70339 () Bool)

(assert (=> d!70339 e!203018))

(declare-fun c!51897 () Bool)

(assert (=> d!70339 (= c!51897 (and (is-Intermediate!3116 lt!158630) (undefined!3928 lt!158630)))))

(assert (=> d!70339 (= lt!158630 e!203020)))

(declare-fun c!51896 () Bool)

(assert (=> d!70339 (= c!51896 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70339 (= lt!158629 (select (arr!7985 a!3305) index!1840))))

(assert (=> d!70339 (validMask!0 mask!3777)))

(assert (=> d!70339 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158630)))

(declare-fun b!330810 () Bool)

(assert (=> b!330810 (= e!203018 (bvsge (x!32923 lt!158630) #b01111111111111111111111111111110))))

(declare-fun b!330811 () Bool)

(assert (=> b!330811 (and (bvsge (index!14642 lt!158630) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158630) (size!8337 a!3305)))))

(assert (=> b!330811 (= e!203021 (= (select (arr!7985 a!3305) (index!14642 lt!158630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330812 () Bool)

(assert (=> b!330812 (= e!203022 (Intermediate!3116 false index!1840 x!1490))))

(assert (= (and d!70339 c!51896) b!330809))

(assert (= (and d!70339 (not c!51896)) b!330805))

(assert (= (and b!330805 c!51895) b!330812))

(assert (= (and b!330805 (not c!51895)) b!330808))

(assert (= (and d!70339 c!51897) b!330810))

(assert (= (and d!70339 (not c!51897)) b!330807))

(assert (= (and b!330807 res!182302) b!330804))

(assert (= (and b!330804 (not res!182304)) b!330806))

(assert (= (and b!330806 (not res!182303)) b!330811))

(declare-fun m!335901 () Bool)

(assert (=> b!330804 m!335901))

(assert (=> b!330811 m!335901))

(assert (=> d!70339 m!335737))

(assert (=> d!70339 m!335749))

(assert (=> b!330808 m!335759))

(assert (=> b!330808 m!335759))

(declare-fun m!335903 () Bool)

(assert (=> b!330808 m!335903))

(assert (=> b!330806 m!335901))

(assert (=> b!330560 d!70339))

(declare-fun lt!158638 () SeekEntryResult!3116)

(declare-fun b!330825 () Bool)

(assert (=> b!330825 (and (bvsge (index!14642 lt!158638) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158638) (size!8337 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305)))))))

(declare-fun res!182307 () Bool)

(assert (=> b!330825 (= res!182307 (= (select (arr!7985 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305))) (index!14642 lt!158638)) k!2497))))

(declare-fun e!203032 () Bool)

(assert (=> b!330825 (=> res!182307 e!203032)))

(declare-fun e!203030 () Bool)

(assert (=> b!330825 (= e!203030 e!203032)))

(declare-fun b!330826 () Bool)

(declare-fun e!203031 () SeekEntryResult!3116)

(declare-fun e!203033 () SeekEntryResult!3116)

(assert (=> b!330826 (= e!203031 e!203033)))

(declare-fun c!51904 () Bool)

(declare-fun lt!158637 () (_ BitVec 64))

(assert (=> b!330826 (= c!51904 (or (= lt!158637 k!2497) (= (bvadd lt!158637 lt!158637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330827 () Bool)

(assert (=> b!330827 (and (bvsge (index!14642 lt!158638) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158638) (size!8337 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305)))))))

(declare-fun res!182306 () Bool)

(assert (=> b!330827 (= res!182306 (= (select (arr!7985 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305))) (index!14642 lt!158638)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330827 (=> res!182306 e!203032)))

(declare-fun b!330828 () Bool)

(declare-fun e!203029 () Bool)

(assert (=> b!330828 (= e!203029 e!203030)))

(declare-fun res!182305 () Bool)

(assert (=> b!330828 (= res!182305 (and (is-Intermediate!3116 lt!158638) (not (undefined!3928 lt!158638)) (bvslt (x!32923 lt!158638) #b01111111111111111111111111111110) (bvsge (x!32923 lt!158638) #b00000000000000000000000000000000) (bvsge (x!32923 lt!158638) x!1490)))))

(assert (=> b!330828 (=> (not res!182305) (not e!203030))))

(declare-fun b!330829 () Bool)

(assert (=> b!330829 (= e!203033 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305)) mask!3777))))

(declare-fun b!330830 () Bool)

(assert (=> b!330830 (= e!203031 (Intermediate!3116 true index!1840 x!1490))))

(declare-fun d!70341 () Bool)

(assert (=> d!70341 e!203029))

(declare-fun c!51906 () Bool)

(assert (=> d!70341 (= c!51906 (and (is-Intermediate!3116 lt!158638) (undefined!3928 lt!158638)))))

(assert (=> d!70341 (= lt!158638 e!203031)))

(declare-fun c!51905 () Bool)

(assert (=> d!70341 (= c!51905 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70341 (= lt!158637 (select (arr!7985 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305))) index!1840))))

(assert (=> d!70341 (validMask!0 mask!3777)))

(assert (=> d!70341 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305)) mask!3777) lt!158638)))

(declare-fun b!330831 () Bool)

(assert (=> b!330831 (= e!203029 (bvsge (x!32923 lt!158638) #b01111111111111111111111111111110))))

(declare-fun b!330832 () Bool)

(assert (=> b!330832 (and (bvsge (index!14642 lt!158638) #b00000000000000000000000000000000) (bvslt (index!14642 lt!158638) (size!8337 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305)))))))

(assert (=> b!330832 (= e!203032 (= (select (arr!7985 (array!16886 (store (arr!7985 a!3305) i!1250 k!2497) (size!8337 a!3305))) (index!14642 lt!158638)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330833 () Bool)

(assert (=> b!330833 (= e!203033 (Intermediate!3116 false index!1840 x!1490))))

(assert (= (and d!70341 c!51905) b!330830))

(assert (= (and d!70341 (not c!51905)) b!330826))

(assert (= (and b!330826 c!51904) b!330833))

(assert (= (and b!330826 (not c!51904)) b!330829))

(assert (= (and d!70341 c!51906) b!330831))

(assert (= (and d!70341 (not c!51906)) b!330828))

(assert (= (and b!330828 res!182305) b!330825))

(assert (= (and b!330825 (not res!182307)) b!330827))

(assert (= (and b!330827 (not res!182306)) b!330832))

(declare-fun m!335905 () Bool)

(assert (=> b!330825 m!335905))

(assert (=> b!330832 m!335905))

(declare-fun m!335907 () Bool)

(assert (=> d!70341 m!335907))

(assert (=> d!70341 m!335749))

(assert (=> b!330829 m!335759))

(assert (=> b!330829 m!335759))

(declare-fun m!335909 () Bool)

(assert (=> b!330829 m!335909))

(assert (=> b!330827 m!335905))

(assert (=> b!330565 d!70341))

(declare-fun b!330891 () Bool)

(declare-fun e!203067 () SeekEntryResult!3116)

(declare-fun lt!158670 () SeekEntryResult!3116)

(assert (=> b!330891 (= e!203067 (MissingZero!3116 (index!14642 lt!158670)))))

(declare-fun b!330893 () Bool)

(declare-fun e!203068 () SeekEntryResult!3116)

(assert (=> b!330893 (= e!203068 Undefined!3116)))

(declare-fun b!330894 () Bool)

(declare-fun c!51931 () Bool)

(declare-fun lt!158669 () (_ BitVec 64))

(assert (=> b!330894 (= c!51931 (= lt!158669 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203066 () SeekEntryResult!3116)

(assert (=> b!330894 (= e!203066 e!203067)))

(declare-fun b!330895 () Bool)

(assert (=> b!330895 (= e!203068 e!203066)))

(assert (=> b!330895 (= lt!158669 (select (arr!7985 a!3305) (index!14642 lt!158670)))))

(declare-fun c!51933 () Bool)

(assert (=> b!330895 (= c!51933 (= lt!158669 k!2497))))

(declare-fun b!330896 () Bool)

(assert (=> b!330896 (= e!203066 (Found!3116 (index!14642 lt!158670)))))

(declare-fun b!330892 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16885 (_ BitVec 32)) SeekEntryResult!3116)

(assert (=> b!330892 (= e!203067 (seekKeyOrZeroReturnVacant!0 (x!32923 lt!158670) (index!14642 lt!158670) (index!14642 lt!158670) k!2497 a!3305 mask!3777))))

(declare-fun d!70343 () Bool)

(declare-fun lt!158668 () SeekEntryResult!3116)

(assert (=> d!70343 (and (or (is-Undefined!3116 lt!158668) (not (is-Found!3116 lt!158668)) (and (bvsge (index!14641 lt!158668) #b00000000000000000000000000000000) (bvslt (index!14641 lt!158668) (size!8337 a!3305)))) (or (is-Undefined!3116 lt!158668) (is-Found!3116 lt!158668) (not (is-MissingZero!3116 lt!158668)) (and (bvsge (index!14640 lt!158668) #b00000000000000000000000000000000) (bvslt (index!14640 lt!158668) (size!8337 a!3305)))) (or (is-Undefined!3116 lt!158668) (is-Found!3116 lt!158668) (is-MissingZero!3116 lt!158668) (not (is-MissingVacant!3116 lt!158668)) (and (bvsge (index!14643 lt!158668) #b00000000000000000000000000000000) (bvslt (index!14643 lt!158668) (size!8337 a!3305)))) (or (is-Undefined!3116 lt!158668) (ite (is-Found!3116 lt!158668) (= (select (arr!7985 a!3305) (index!14641 lt!158668)) k!2497) (ite (is-MissingZero!3116 lt!158668) (= (select (arr!7985 a!3305) (index!14640 lt!158668)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3116 lt!158668) (= (select (arr!7985 a!3305) (index!14643 lt!158668)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70343 (= lt!158668 e!203068)))

(declare-fun c!51932 () Bool)

(assert (=> d!70343 (= c!51932 (and (is-Intermediate!3116 lt!158670) (undefined!3928 lt!158670)))))

(assert (=> d!70343 (= lt!158670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70343 (validMask!0 mask!3777)))

(assert (=> d!70343 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158668)))

(assert (= (and d!70343 c!51932) b!330893))

(assert (= (and d!70343 (not c!51932)) b!330895))

(assert (= (and b!330895 c!51933) b!330896))

(assert (= (and b!330895 (not c!51933)) b!330894))

(assert (= (and b!330894 c!51931) b!330891))

(assert (= (and b!330894 (not c!51931)) b!330892))

(declare-fun m!335947 () Bool)

(assert (=> b!330895 m!335947))

(declare-fun m!335949 () Bool)

(assert (=> b!330892 m!335949))

(declare-fun m!335951 () Bool)

(assert (=> d!70343 m!335951))

(assert (=> d!70343 m!335755))

(assert (=> d!70343 m!335757))

(declare-fun m!335953 () Bool)

(assert (=> d!70343 m!335953))

(assert (=> d!70343 m!335755))

(declare-fun m!335955 () Bool)

(assert (=> d!70343 m!335955))

(assert (=> d!70343 m!335749))

(assert (=> b!330554 d!70343))

(push 1)

(assert (not b!330808))

(assert (not b!330692))

(assert (not d!70343))

(assert (not b!330781))

(assert (not d!70339))

(assert (not b!330803))

(assert (not b!330772))

(assert (not d!70323))

(assert (not b!330829))

(assert (not bm!26161))

(assert (not d!70329))

(assert (not d!70341))

(assert (not d!70307))

(assert (not b!330892))

(assert (not b!330695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

