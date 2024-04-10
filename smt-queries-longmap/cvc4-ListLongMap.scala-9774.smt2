; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115818 () Bool)

(assert start!115818)

(declare-fun res!912848 () Bool)

(declare-fun e!775697 () Bool)

(assert (=> start!115818 (=> (not res!912848) (not e!775697))))

(declare-datatypes ((array!92965 0))(
  ( (array!92966 (arr!44905 (Array (_ BitVec 32) (_ BitVec 64))) (size!45455 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92965)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115818 (= res!912848 (and (bvslt (size!45455 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45455 a!3861))))))

(assert (=> start!115818 e!775697))

(declare-fun array_inv!33933 (array!92965) Bool)

(assert (=> start!115818 (array_inv!33933 a!3861)))

(assert (=> start!115818 true))

(declare-fun b!1369364 () Bool)

(declare-fun res!912850 () Bool)

(assert (=> b!1369364 (=> (not res!912850) (not e!775697))))

(declare-datatypes ((List!31973 0))(
  ( (Nil!31970) (Cons!31969 (h!33178 (_ BitVec 64)) (t!46667 List!31973)) )
))
(declare-fun acc!866 () List!31973)

(declare-fun contains!9655 (List!31973 (_ BitVec 64)) Bool)

(assert (=> b!1369364 (= res!912850 (not (contains!9655 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369365 () Bool)

(declare-fun e!775699 () Bool)

(assert (=> b!1369365 (= e!775697 e!775699)))

(declare-fun res!912845 () Bool)

(assert (=> b!1369365 (=> (not res!912845) (not e!775699))))

(declare-fun arrayNoDuplicates!0 (array!92965 (_ BitVec 32) List!31973) Bool)

(assert (=> b!1369365 (= res!912845 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45247 0))(
  ( (Unit!45248) )
))
(declare-fun lt!602248 () Unit!45247)

(declare-fun newAcc!98 () List!31973)

(declare-fun noDuplicateSubseq!244 (List!31973 List!31973) Unit!45247)

(assert (=> b!1369365 (= lt!602248 (noDuplicateSubseq!244 newAcc!98 acc!866))))

(declare-fun b!1369366 () Bool)

(declare-fun res!912842 () Bool)

(assert (=> b!1369366 (=> (not res!912842) (not e!775699))))

(assert (=> b!1369366 (= res!912842 (bvsge from!3239 (size!45455 a!3861)))))

(declare-fun b!1369367 () Bool)

(declare-fun res!912847 () Bool)

(assert (=> b!1369367 (=> (not res!912847) (not e!775697))))

(declare-fun subseq!1057 (List!31973 List!31973) Bool)

(assert (=> b!1369367 (= res!912847 (subseq!1057 newAcc!98 acc!866))))

(declare-fun b!1369368 () Bool)

(declare-fun res!912844 () Bool)

(assert (=> b!1369368 (=> (not res!912844) (not e!775697))))

(assert (=> b!1369368 (= res!912844 (not (contains!9655 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369369 () Bool)

(declare-fun res!912849 () Bool)

(assert (=> b!1369369 (=> (not res!912849) (not e!775697))))

(assert (=> b!1369369 (= res!912849 (not (contains!9655 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369370 () Bool)

(declare-fun res!912846 () Bool)

(assert (=> b!1369370 (=> (not res!912846) (not e!775697))))

(assert (=> b!1369370 (= res!912846 (not (contains!9655 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369371 () Bool)

(declare-fun res!912843 () Bool)

(assert (=> b!1369371 (=> (not res!912843) (not e!775697))))

(declare-fun noDuplicate!2512 (List!31973) Bool)

(assert (=> b!1369371 (= res!912843 (noDuplicate!2512 acc!866))))

(declare-fun b!1369372 () Bool)

(assert (=> b!1369372 (= e!775699 (not (noDuplicate!2512 newAcc!98)))))

(assert (= (and start!115818 res!912848) b!1369371))

(assert (= (and b!1369371 res!912843) b!1369370))

(assert (= (and b!1369370 res!912846) b!1369364))

(assert (= (and b!1369364 res!912850) b!1369368))

(assert (= (and b!1369368 res!912844) b!1369369))

(assert (= (and b!1369369 res!912849) b!1369367))

(assert (= (and b!1369367 res!912847) b!1369365))

(assert (= (and b!1369365 res!912845) b!1369366))

(assert (= (and b!1369366 res!912842) b!1369372))

(declare-fun m!1253159 () Bool)

(assert (=> b!1369371 m!1253159))

(declare-fun m!1253161 () Bool)

(assert (=> b!1369367 m!1253161))

(declare-fun m!1253163 () Bool)

(assert (=> b!1369365 m!1253163))

(declare-fun m!1253165 () Bool)

(assert (=> b!1369365 m!1253165))

(declare-fun m!1253167 () Bool)

(assert (=> start!115818 m!1253167))

(declare-fun m!1253169 () Bool)

(assert (=> b!1369372 m!1253169))

(declare-fun m!1253171 () Bool)

(assert (=> b!1369370 m!1253171))

(declare-fun m!1253173 () Bool)

(assert (=> b!1369369 m!1253173))

(declare-fun m!1253175 () Bool)

(assert (=> b!1369364 m!1253175))

(declare-fun m!1253177 () Bool)

(assert (=> b!1369368 m!1253177))

(push 1)

(assert (not b!1369364))

(assert (not start!115818))

(assert (not b!1369370))

(assert (not b!1369368))

(assert (not b!1369372))

(assert (not b!1369369))

(assert (not b!1369365))

(assert (not b!1369371))

(assert (not b!1369367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147011 () Bool)

(declare-fun res!912872 () Bool)

(declare-fun e!775724 () Bool)

(assert (=> d!147011 (=> res!912872 e!775724)))

(assert (=> d!147011 (= res!912872 (is-Nil!31970 acc!866))))

(assert (=> d!147011 (= (noDuplicate!2512 acc!866) e!775724)))

(declare-fun b!1369400 () Bool)

(declare-fun e!775725 () Bool)

(assert (=> b!1369400 (= e!775724 e!775725)))

(declare-fun res!912873 () Bool)

(assert (=> b!1369400 (=> (not res!912873) (not e!775725))))

(assert (=> b!1369400 (= res!912873 (not (contains!9655 (t!46667 acc!866) (h!33178 acc!866))))))

(declare-fun b!1369401 () Bool)

(assert (=> b!1369401 (= e!775725 (noDuplicate!2512 (t!46667 acc!866)))))

(assert (= (and d!147011 (not res!912872)) b!1369400))

(assert (= (and b!1369400 res!912873) b!1369401))

(declare-fun m!1253191 () Bool)

(assert (=> b!1369400 m!1253191))

(declare-fun m!1253195 () Bool)

(assert (=> b!1369401 m!1253195))

(assert (=> b!1369371 d!147011))

(declare-fun b!1369429 () Bool)

(declare-fun e!775753 () Bool)

(assert (=> b!1369429 (= e!775753 (contains!9655 acc!866 (select (arr!44905 a!3861) from!3239)))))

(declare-fun b!1369430 () Bool)

(declare-fun e!775752 () Bool)

(declare-fun call!65513 () Bool)

(assert (=> b!1369430 (= e!775752 call!65513)))

(declare-fun d!147017 () Bool)

(declare-fun res!912899 () Bool)

(declare-fun e!775751 () Bool)

(assert (=> d!147017 (=> res!912899 e!775751)))

(assert (=> d!147017 (= res!912899 (bvsge from!3239 (size!45455 a!3861)))))

(assert (=> d!147017 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775751)))

(declare-fun c!127706 () Bool)

(declare-fun bm!65510 () Bool)

(assert (=> bm!65510 (= call!65513 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127706 (Cons!31969 (select (arr!44905 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1369431 () Bool)

(assert (=> b!1369431 (= e!775752 call!65513)))

(declare-fun b!1369432 () Bool)

(declare-fun e!775754 () Bool)

(assert (=> b!1369432 (= e!775754 e!775752)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369432 (= c!127706 (validKeyInArray!0 (select (arr!44905 a!3861) from!3239)))))

(declare-fun b!1369433 () Bool)

(assert (=> b!1369433 (= e!775751 e!775754)))

(declare-fun res!912897 () Bool)

(assert (=> b!1369433 (=> (not res!912897) (not e!775754))))

(assert (=> b!1369433 (= res!912897 (not e!775753))))

(declare-fun res!912898 () Bool)

(assert (=> b!1369433 (=> (not res!912898) (not e!775753))))

(assert (=> b!1369433 (= res!912898 (validKeyInArray!0 (select (arr!44905 a!3861) from!3239)))))

(assert (= (and d!147017 (not res!912899)) b!1369433))

(assert (= (and b!1369433 res!912898) b!1369429))

(assert (= (and b!1369433 res!912897) b!1369432))

(assert (= (and b!1369432 c!127706) b!1369430))

(assert (= (and b!1369432 (not c!127706)) b!1369431))

(assert (= (or b!1369430 b!1369431) bm!65510))

(declare-fun m!1253207 () Bool)

(assert (=> b!1369429 m!1253207))

(assert (=> b!1369429 m!1253207))

(declare-fun m!1253209 () Bool)

(assert (=> b!1369429 m!1253209))

(assert (=> bm!65510 m!1253207))

(declare-fun m!1253211 () Bool)

(assert (=> bm!65510 m!1253211))

(assert (=> b!1369432 m!1253207))

(assert (=> b!1369432 m!1253207))

(declare-fun m!1253213 () Bool)

(assert (=> b!1369432 m!1253213))

(assert (=> b!1369433 m!1253207))

(assert (=> b!1369433 m!1253207))

(assert (=> b!1369433 m!1253213))

(assert (=> b!1369365 d!147017))

(declare-fun d!147027 () Bool)

(assert (=> d!147027 (noDuplicate!2512 newAcc!98)))

(declare-fun lt!602259 () Unit!45247)

(declare-fun choose!2004 (List!31973 List!31973) Unit!45247)

(assert (=> d!147027 (= lt!602259 (choose!2004 newAcc!98 acc!866))))

(declare-fun e!775777 () Bool)

(assert (=> d!147027 e!775777))

(declare-fun res!912919 () Bool)

(assert (=> d!147027 (=> (not res!912919) (not e!775777))))

(assert (=> d!147027 (= res!912919 (subseq!1057 newAcc!98 acc!866))))

(assert (=> d!147027 (= (noDuplicateSubseq!244 newAcc!98 acc!866) lt!602259)))

(declare-fun b!1369459 () Bool)

(assert (=> b!1369459 (= e!775777 (noDuplicate!2512 acc!866))))

(assert (= (and d!147027 res!912919) b!1369459))

(assert (=> d!147027 m!1253169))

(declare-fun m!1253219 () Bool)

(assert (=> d!147027 m!1253219))

(assert (=> d!147027 m!1253161))

(assert (=> b!1369459 m!1253159))

(assert (=> b!1369365 d!147027))

(declare-fun d!147031 () Bool)

(assert (=> d!147031 (= (array_inv!33933 a!3861) (bvsge (size!45455 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115818 d!147031))

(declare-fun d!147035 () Bool)

(declare-fun lt!602268 () Bool)

(declare-fun content!725 (List!31973) (Set (_ BitVec 64)))

(assert (=> d!147035 (= lt!602268 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!725 acc!866)))))

(declare-fun e!775798 () Bool)

(assert (=> d!147035 (= lt!602268 e!775798)))

(declare-fun res!912939 () Bool)

(assert (=> d!147035 (=> (not res!912939) (not e!775798))))

(assert (=> d!147035 (= res!912939 (is-Cons!31969 acc!866))))

(assert (=> d!147035 (= (contains!9655 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602268)))

(declare-fun b!1369479 () Bool)

(declare-fun e!775797 () Bool)

(assert (=> b!1369479 (= e!775798 e!775797)))

(declare-fun res!912940 () Bool)

(assert (=> b!1369479 (=> res!912940 e!775797)))

(assert (=> b!1369479 (= res!912940 (= (h!33178 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369480 () Bool)

(assert (=> b!1369480 (= e!775797 (contains!9655 (t!46667 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147035 res!912939) b!1369479))

(assert (= (and b!1369479 (not res!912940)) b!1369480))

(declare-fun m!1253253 () Bool)

(assert (=> d!147035 m!1253253))

(declare-fun m!1253255 () Bool)

(assert (=> d!147035 m!1253255))

(declare-fun m!1253257 () Bool)

(assert (=> b!1369480 m!1253257))

(assert (=> b!1369370 d!147035))

(declare-fun b!1369511 () Bool)

(declare-fun e!775827 () Bool)

(assert (=> b!1369511 (= e!775827 (subseq!1057 (t!46667 newAcc!98) (t!46667 acc!866)))))

(declare-fun b!1369509 () Bool)

(declare-fun e!775828 () Bool)

(declare-fun e!775829 () Bool)

(assert (=> b!1369509 (= e!775828 e!775829)))

(declare-fun res!912970 () Bool)

(assert (=> b!1369509 (=> (not res!912970) (not e!775829))))

(assert (=> b!1369509 (= res!912970 (is-Cons!31969 acc!866))))

(declare-fun b!1369512 () Bool)

(declare-fun e!775830 () Bool)

(assert (=> b!1369512 (= e!775830 (subseq!1057 newAcc!98 (t!46667 acc!866)))))

(declare-fun b!1369510 () Bool)

(assert (=> b!1369510 (= e!775829 e!775830)))

(declare-fun res!912969 () Bool)

(assert (=> b!1369510 (=> res!912969 e!775830)))

(assert (=> b!1369510 (= res!912969 e!775827)))

(declare-fun res!912972 () Bool)

(assert (=> b!1369510 (=> (not res!912972) (not e!775827))))

(assert (=> b!1369510 (= res!912972 (= (h!33178 newAcc!98) (h!33178 acc!866)))))

