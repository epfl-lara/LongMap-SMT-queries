; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61860 () Bool)

(assert start!61860)

(declare-fun b!692523 () Bool)

(declare-fun e!393992 () Bool)

(declare-fun e!393995 () Bool)

(assert (=> b!692523 (= e!393992 e!393995)))

(declare-fun res!456763 () Bool)

(assert (=> b!692523 (=> (not res!456763) (not e!393995))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692523 (= res!456763 (bvsle from!3004 i!1382))))

(declare-fun b!692524 () Bool)

(declare-fun res!456756 () Bool)

(declare-fun e!393988 () Bool)

(assert (=> b!692524 (=> (not res!456756) (not e!393988))))

(declare-datatypes ((List!13126 0))(
  ( (Nil!13123) (Cons!13122 (h!14167 (_ BitVec 64)) (t!19396 List!13126)) )
))
(declare-fun acc!681 () List!13126)

(declare-fun contains!3703 (List!13126 (_ BitVec 64)) Bool)

(assert (=> b!692524 (= res!456756 (not (contains!3703 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692525 () Bool)

(declare-fun res!456765 () Bool)

(assert (=> b!692525 (=> (not res!456765) (not e!393988))))

(declare-datatypes ((array!39836 0))(
  ( (array!39837 (arr!19085 (Array (_ BitVec 32) (_ BitVec 64))) (size!19470 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39836)

(declare-fun arrayNoDuplicates!0 (array!39836 (_ BitVec 32) List!13126) Bool)

(assert (=> b!692525 (= res!456765 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13123))))

(declare-fun b!692526 () Bool)

(declare-fun res!456768 () Bool)

(assert (=> b!692526 (=> (not res!456768) (not e!393988))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692526 (= res!456768 (validKeyInArray!0 k!2843))))

(declare-fun b!692527 () Bool)

(declare-fun e!393994 () Bool)

(declare-fun lt!316604 () List!13126)

(assert (=> b!692527 (= e!393994 (contains!3703 lt!316604 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692528 () Bool)

(declare-fun e!393993 () Bool)

(assert (=> b!692528 (= e!393993 e!393994)))

(declare-fun res!456758 () Bool)

(assert (=> b!692528 (=> res!456758 e!393994)))

(assert (=> b!692528 (= res!456758 (contains!3703 lt!316604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692529 () Bool)

(declare-fun e!393996 () Bool)

(assert (=> b!692529 (= e!393996 (contains!3703 acc!681 k!2843))))

(declare-fun b!692530 () Bool)

(declare-fun res!456757 () Bool)

(assert (=> b!692530 (=> (not res!456757) (not e!393988))))

(assert (=> b!692530 (= res!456757 e!393992)))

(declare-fun res!456761 () Bool)

(assert (=> b!692530 (=> res!456761 e!393992)))

(assert (=> b!692530 (= res!456761 e!393996)))

(declare-fun res!456767 () Bool)

(assert (=> b!692530 (=> (not res!456767) (not e!393996))))

(assert (=> b!692530 (= res!456767 (bvsgt from!3004 i!1382))))

(declare-fun res!456760 () Bool)

(assert (=> start!61860 (=> (not res!456760) (not e!393988))))

(assert (=> start!61860 (= res!456760 (and (bvslt (size!19470 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19470 a!3626))))))

(assert (=> start!61860 e!393988))

(assert (=> start!61860 true))

(declare-fun array_inv!14881 (array!39836) Bool)

(assert (=> start!61860 (array_inv!14881 a!3626)))

(declare-fun b!692531 () Bool)

(declare-fun res!456770 () Bool)

(assert (=> b!692531 (=> (not res!456770) (not e!393988))))

(assert (=> b!692531 (= res!456770 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19470 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692532 () Bool)

(declare-fun res!456764 () Bool)

(assert (=> b!692532 (=> (not res!456764) (not e!393988))))

(assert (=> b!692532 (= res!456764 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692533 () Bool)

(declare-datatypes ((Unit!24458 0))(
  ( (Unit!24459) )
))
(declare-fun e!393991 () Unit!24458)

(declare-fun Unit!24460 () Unit!24458)

(assert (=> b!692533 (= e!393991 Unit!24460)))

(declare-fun arrayContainsKey!0 (array!39836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692533 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316606 () Unit!24458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39836 (_ BitVec 64) (_ BitVec 32)) Unit!24458)

(assert (=> b!692533 (= lt!316606 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!692533 false))

(declare-fun b!692534 () Bool)

(declare-fun res!456771 () Bool)

(assert (=> b!692534 (=> (not res!456771) (not e!393993))))

(declare-fun noDuplicate!950 (List!13126) Bool)

(assert (=> b!692534 (= res!456771 (noDuplicate!950 lt!316604))))

(declare-fun b!692535 () Bool)

(declare-fun Unit!24461 () Unit!24458)

(assert (=> b!692535 (= e!393991 Unit!24461)))

(declare-fun b!692536 () Bool)

(declare-fun res!456762 () Bool)

(assert (=> b!692536 (=> (not res!456762) (not e!393988))))

(assert (=> b!692536 (= res!456762 (not (contains!3703 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692537 () Bool)

(declare-fun e!393989 () Bool)

(assert (=> b!692537 (= e!393989 e!393993)))

(declare-fun res!456755 () Bool)

(assert (=> b!692537 (=> (not res!456755) (not e!393993))))

(assert (=> b!692537 (= res!456755 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!415 (List!13126 (_ BitVec 64)) List!13126)

(assert (=> b!692537 (= lt!316604 ($colon$colon!415 acc!681 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692538 () Bool)

(assert (=> b!692538 (= e!393988 e!393989)))

(declare-fun res!456766 () Bool)

(assert (=> b!692538 (=> (not res!456766) (not e!393989))))

(assert (=> b!692538 (= res!456766 (not (= (select (arr!19085 a!3626) from!3004) k!2843)))))

(declare-fun lt!316605 () Unit!24458)

(assert (=> b!692538 (= lt!316605 e!393991)))

(declare-fun c!78251 () Bool)

(assert (=> b!692538 (= c!78251 (= (select (arr!19085 a!3626) from!3004) k!2843))))

(declare-fun b!692539 () Bool)

(assert (=> b!692539 (= e!393995 (not (contains!3703 acc!681 k!2843)))))

(declare-fun b!692540 () Bool)

(declare-fun res!456769 () Bool)

(assert (=> b!692540 (=> (not res!456769) (not e!393988))))

(assert (=> b!692540 (= res!456769 (noDuplicate!950 acc!681))))

(declare-fun b!692541 () Bool)

(declare-fun res!456759 () Bool)

(assert (=> b!692541 (=> (not res!456759) (not e!393988))))

(assert (=> b!692541 (= res!456759 (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692542 () Bool)

(declare-fun res!456772 () Bool)

(assert (=> b!692542 (=> (not res!456772) (not e!393988))))

(assert (=> b!692542 (= res!456772 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19470 a!3626))))))

(declare-fun b!692543 () Bool)

(declare-fun res!456773 () Bool)

(assert (=> b!692543 (=> (not res!456773) (not e!393988))))

(assert (=> b!692543 (= res!456773 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61860 res!456760) b!692540))

(assert (= (and b!692540 res!456769) b!692536))

(assert (= (and b!692536 res!456762) b!692524))

(assert (= (and b!692524 res!456756) b!692530))

(assert (= (and b!692530 res!456767) b!692529))

(assert (= (and b!692530 (not res!456761)) b!692523))

(assert (= (and b!692523 res!456763) b!692539))

(assert (= (and b!692530 res!456757) b!692525))

(assert (= (and b!692525 res!456765) b!692532))

(assert (= (and b!692532 res!456764) b!692542))

(assert (= (and b!692542 res!456772) b!692526))

(assert (= (and b!692526 res!456768) b!692543))

(assert (= (and b!692543 res!456773) b!692531))

(assert (= (and b!692531 res!456770) b!692541))

(assert (= (and b!692541 res!456759) b!692538))

(assert (= (and b!692538 c!78251) b!692533))

(assert (= (and b!692538 (not c!78251)) b!692535))

(assert (= (and b!692538 res!456766) b!692537))

(assert (= (and b!692537 res!456755) b!692534))

(assert (= (and b!692534 res!456771) b!692528))

(assert (= (and b!692528 (not res!456758)) b!692527))

(declare-fun m!655075 () Bool)

(assert (=> start!61860 m!655075))

(declare-fun m!655077 () Bool)

(assert (=> b!692527 m!655077))

(declare-fun m!655079 () Bool)

(assert (=> b!692528 m!655079))

(declare-fun m!655081 () Bool)

(assert (=> b!692538 m!655081))

(declare-fun m!655083 () Bool)

(assert (=> b!692525 m!655083))

(declare-fun m!655085 () Bool)

(assert (=> b!692532 m!655085))

(declare-fun m!655087 () Bool)

(assert (=> b!692533 m!655087))

(declare-fun m!655089 () Bool)

(assert (=> b!692533 m!655089))

(declare-fun m!655091 () Bool)

(assert (=> b!692524 m!655091))

(declare-fun m!655093 () Bool)

(assert (=> b!692540 m!655093))

(declare-fun m!655095 () Bool)

(assert (=> b!692543 m!655095))

(declare-fun m!655097 () Bool)

(assert (=> b!692536 m!655097))

(declare-fun m!655099 () Bool)

(assert (=> b!692526 m!655099))

(declare-fun m!655101 () Bool)

(assert (=> b!692534 m!655101))

(assert (=> b!692541 m!655081))

(assert (=> b!692541 m!655081))

(declare-fun m!655103 () Bool)

(assert (=> b!692541 m!655103))

(declare-fun m!655105 () Bool)

(assert (=> b!692539 m!655105))

(assert (=> b!692537 m!655081))

(assert (=> b!692537 m!655081))

(declare-fun m!655107 () Bool)

(assert (=> b!692537 m!655107))

(assert (=> b!692529 m!655105))

(push 1)

(assert (not b!692529))

(assert (not b!692536))

(assert (not b!692532))

(assert (not b!692524))

(assert (not b!692533))

(assert (not b!692540))

(assert (not b!692534))

(assert (not b!692526))

(assert (not b!692543))

(assert (not b!692541))

(assert (not start!61860))

(assert (not b!692537))

(assert (not b!692539))

(assert (not b!692525))

(assert (not b!692527))

(assert (not b!692528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95623 () Bool)

(declare-fun lt!316613 () Bool)

(declare-fun content!313 (List!13126) (Set (_ BitVec 64)))

(assert (=> d!95623 (= lt!316613 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!313 lt!316604)))))

(declare-fun e!394044 () Bool)

(assert (=> d!95623 (= lt!316613 e!394044)))

(declare-fun res!456816 () Bool)

(assert (=> d!95623 (=> (not res!456816) (not e!394044))))

(assert (=> d!95623 (= res!456816 (is-Cons!13122 lt!316604))))

(assert (=> d!95623 (= (contains!3703 lt!316604 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316613)))

(declare-fun b!692595 () Bool)

(declare-fun e!394043 () Bool)

(assert (=> b!692595 (= e!394044 e!394043)))

(declare-fun res!456815 () Bool)

(assert (=> b!692595 (=> res!456815 e!394043)))

(assert (=> b!692595 (= res!456815 (= (h!14167 lt!316604) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692596 () Bool)

(assert (=> b!692596 (= e!394043 (contains!3703 (t!19396 lt!316604) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95623 res!456816) b!692595))

(assert (= (and b!692595 (not res!456815)) b!692596))

(declare-fun m!655135 () Bool)

(assert (=> d!95623 m!655135))

(declare-fun m!655137 () Bool)

(assert (=> d!95623 m!655137))

(declare-fun m!655139 () Bool)

(assert (=> b!692596 m!655139))

(assert (=> b!692528 d!95623))

(declare-fun d!95631 () Bool)

(declare-fun lt!316614 () Bool)

(assert (=> d!95631 (= lt!316614 (member k!2843 (content!313 acc!681)))))

(declare-fun e!394046 () Bool)

(assert (=> d!95631 (= lt!316614 e!394046)))

(declare-fun res!456818 () Bool)

(assert (=> d!95631 (=> (not res!456818) (not e!394046))))

(assert (=> d!95631 (= res!456818 (is-Cons!13122 acc!681))))

(assert (=> d!95631 (= (contains!3703 acc!681 k!2843) lt!316614)))

(declare-fun b!692597 () Bool)

(declare-fun e!394045 () Bool)

(assert (=> b!692597 (= e!394046 e!394045)))

(declare-fun res!456817 () Bool)

(assert (=> b!692597 (=> res!456817 e!394045)))

(assert (=> b!692597 (= res!456817 (= (h!14167 acc!681) k!2843))))

(declare-fun b!692598 () Bool)

(assert (=> b!692598 (= e!394045 (contains!3703 (t!19396 acc!681) k!2843))))

(assert (= (and d!95631 res!456818) b!692597))

(assert (= (and b!692597 (not res!456817)) b!692598))

(declare-fun m!655141 () Bool)

(assert (=> d!95631 m!655141))

(declare-fun m!655143 () Bool)

(assert (=> d!95631 m!655143))

(declare-fun m!655145 () Bool)

(assert (=> b!692598 m!655145))

(assert (=> b!692539 d!95631))

(assert (=> b!692529 d!95631))

(declare-fun d!95633 () Bool)

(declare-fun res!456831 () Bool)

(declare-fun e!394061 () Bool)

(assert (=> d!95633 (=> res!456831 e!394061)))

(assert (=> d!95633 (= res!456831 (is-Nil!13123 acc!681))))

(assert (=> d!95633 (= (noDuplicate!950 acc!681) e!394061)))

(declare-fun b!692615 () Bool)

(declare-fun e!394062 () Bool)

(assert (=> b!692615 (= e!394061 e!394062)))

(declare-fun res!456832 () Bool)

(assert (=> b!692615 (=> (not res!456832) (not e!394062))))

(assert (=> b!692615 (= res!456832 (not (contains!3703 (t!19396 acc!681) (h!14167 acc!681))))))

(declare-fun b!692616 () Bool)

(assert (=> b!692616 (= e!394062 (noDuplicate!950 (t!19396 acc!681)))))

(assert (= (and d!95633 (not res!456831)) b!692615))

(assert (= (and b!692615 res!456832) b!692616))

(declare-fun m!655163 () Bool)

(assert (=> b!692615 m!655163))

(declare-fun m!655165 () Bool)

(assert (=> b!692616 m!655165))

(assert (=> b!692540 d!95633))

(declare-fun d!95643 () Bool)

(assert (=> d!95643 (= (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)) (and (not (= (select (arr!19085 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19085 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692541 d!95643))

(declare-fun b!692649 () Bool)

(declare-fun e!394094 () Bool)

(declare-fun call!34248 () Bool)

(assert (=> b!692649 (= e!394094 call!34248)))

(declare-fun b!692650 () Bool)

(declare-fun e!394096 () Bool)

(assert (=> b!692650 (= e!394096 e!394094)))

(declare-fun c!78261 () Bool)

(assert (=> b!692650 (= c!78261 (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692651 () Bool)

(declare-fun e!394095 () Bool)

(assert (=> b!692651 (= e!394095 e!394096)))

(declare-fun res!456861 () Bool)

(assert (=> b!692651 (=> (not res!456861) (not e!394096))))

(declare-fun e!394093 () Bool)

(assert (=> b!692651 (= res!456861 (not e!394093))))

(declare-fun res!456862 () Bool)

(assert (=> b!692651 (=> (not res!456862) (not e!394093))))

(assert (=> b!692651 (= res!456862 (validKeyInArray!0 (select (arr!19085 a!3626) from!3004)))))

(declare-fun b!692652 () Bool)

(assert (=> b!692652 (= e!394093 (contains!3703 acc!681 (select (arr!19085 a!3626) from!3004)))))

(declare-fun bm!34245 () Bool)

(assert (=> bm!34245 (= call!34248 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78261 (Cons!13122 (select (arr!19085 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!95649 () Bool)

(declare-fun res!456863 () Bool)

(assert (=> d!95649 (=> res!456863 e!394095)))

(assert (=> d!95649 (= res!456863 (bvsge from!3004 (size!19470 a!3626)))))

(assert (=> d!95649 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394095)))

(declare-fun b!692653 () Bool)

(assert (=> b!692653 (= e!394094 call!34248)))

(assert (= (and d!95649 (not res!456863)) b!692651))

(assert (= (and b!692651 res!456862) b!692652))

(assert (= (and b!692651 res!456861) b!692650))

(assert (= (and b!692650 c!78261) b!692653))

(assert (= (and b!692650 (not c!78261)) b!692649))

(assert (= (or b!692653 b!692649) bm!34245))

(assert (=> b!692650 m!655081))

(assert (=> b!692650 m!655081))

(assert (=> b!692650 m!655103))

(assert (=> b!692651 m!655081))

(assert (=> b!692651 m!655081))

(assert (=> b!692651 m!655103))

(assert (=> b!692652 m!655081))

(assert (=> b!692652 m!655081))

(declare-fun m!655199 () Bool)

(assert (=> b!692652 m!655199))

(assert (=> bm!34245 m!655081))

(declare-fun m!655201 () Bool)

(assert (=> bm!34245 m!655201))

(assert (=> b!692532 d!95649))

(declare-fun d!95669 () Bool)

(declare-fun res!456874 () Bool)

(declare-fun e!394107 () Bool)

(assert (=> d!95669 (=> res!456874 e!394107)))

(assert (=> d!95669 (= res!456874 (= (select (arr!19085 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95669 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!394107)))

(declare-fun b!692664 () Bool)

(declare-fun e!394108 () Bool)

(assert (=> b!692664 (= e!394107 e!394108)))

(declare-fun res!456875 () Bool)

(assert (=> b!692664 (=> (not res!456875) (not e!394108))))

(assert (=> b!692664 (= res!456875 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19470 a!3626)))))

(declare-fun b!692665 () Bool)

(assert (=> b!692665 (= e!394108 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95669 (not res!456874)) b!692664))

(assert (= (and b!692664 res!456875) b!692665))

(declare-fun m!655205 () Bool)

(assert (=> d!95669 m!655205))

(declare-fun m!655207 () Bool)

(assert (=> b!692665 m!655207))

(assert (=> b!692543 d!95669))

(declare-fun d!95673 () Bool)

(declare-fun res!456876 () Bool)

(declare-fun e!394109 () Bool)

(assert (=> d!95673 (=> res!456876 e!394109)))

