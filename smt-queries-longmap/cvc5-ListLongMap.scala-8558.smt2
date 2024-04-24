; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104728 () Bool)

(assert start!104728)

(declare-fun res!832580 () Bool)

(declare-fun e!708018 () Bool)

(assert (=> start!104728 (=> (not res!832580) (not e!708018))))

(declare-datatypes ((array!80308 0))(
  ( (array!80309 (arr!38725 (Array (_ BitVec 32) (_ BitVec 64))) (size!39262 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80308)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104728 (= res!832580 (and (bvslt (size!39262 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39262 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39262 a!3892))))))

(assert (=> start!104728 e!708018))

(declare-fun array_inv!29663 (array!80308) Bool)

(assert (=> start!104728 (array_inv!29663 a!3892)))

(assert (=> start!104728 true))

(declare-fun b!1248148 () Bool)

(declare-fun res!832579 () Bool)

(assert (=> b!1248148 (=> (not res!832579) (not e!708018))))

(declare-datatypes ((List!27541 0))(
  ( (Nil!27538) (Cons!27537 (h!28755 (_ BitVec 64)) (t!41002 List!27541)) )
))
(declare-fun arrayNoDuplicates!0 (array!80308 (_ BitVec 32) List!27541) Bool)

(assert (=> b!1248148 (= res!832579 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27538))))

(declare-fun b!1248149 () Bool)

(declare-fun res!832578 () Bool)

(assert (=> b!1248149 (=> (not res!832578) (not e!708018))))

(assert (=> b!1248149 (= res!832578 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39262 a!3892)) (= newFrom!287 (size!39262 a!3892))))))

(declare-fun b!1248150 () Bool)

(assert (=> b!1248150 (= e!708018 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27538)))))

(assert (= (and start!104728 res!832580) b!1248148))

(assert (= (and b!1248148 res!832579) b!1248149))

(assert (= (and b!1248149 res!832578) b!1248150))

(declare-fun m!1150179 () Bool)

(assert (=> start!104728 m!1150179))

(declare-fun m!1150181 () Bool)

(assert (=> b!1248148 m!1150181))

(declare-fun m!1150183 () Bool)

(assert (=> b!1248150 m!1150183))

(push 1)

(assert (not b!1248148))

(assert (not b!1248150))

(assert (not start!104728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1248191 () Bool)

(declare-fun e!708052 () Bool)

(declare-fun call!61613 () Bool)

(assert (=> b!1248191 (= e!708052 call!61613)))

(declare-fun b!1248192 () Bool)

(declare-fun e!708051 () Bool)

(assert (=> b!1248192 (= e!708051 e!708052)))

(declare-fun c!122485 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248192 (= c!122485 (validKeyInArray!0 (select (arr!38725 a!3892) from!3270)))))

(declare-fun b!1248193 () Bool)

(declare-fun e!708054 () Bool)

(declare-fun contains!7494 (List!27541 (_ BitVec 64)) Bool)

(assert (=> b!1248193 (= e!708054 (contains!7494 Nil!27538 (select (arr!38725 a!3892) from!3270)))))

(declare-fun b!1248194 () Bool)

(assert (=> b!1248194 (= e!708052 call!61613)))

(declare-fun b!1248195 () Bool)

(declare-fun e!708053 () Bool)

(assert (=> b!1248195 (= e!708053 e!708051)))

(declare-fun res!832607 () Bool)

(assert (=> b!1248195 (=> (not res!832607) (not e!708051))))

(assert (=> b!1248195 (= res!832607 (not e!708054))))

(declare-fun res!832605 () Bool)

(assert (=> b!1248195 (=> (not res!832605) (not e!708054))))

(assert (=> b!1248195 (= res!832605 (validKeyInArray!0 (select (arr!38725 a!3892) from!3270)))))

(declare-fun d!138143 () Bool)

(declare-fun res!832606 () Bool)

(assert (=> d!138143 (=> res!832606 e!708053)))

(assert (=> d!138143 (= res!832606 (bvsge from!3270 (size!39262 a!3892)))))

(assert (=> d!138143 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27538) e!708053)))

(declare-fun bm!61610 () Bool)

(assert (=> bm!61610 (= call!61613 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122485 (Cons!27537 (select (arr!38725 a!3892) from!3270) Nil!27538) Nil!27538)))))

(assert (= (and d!138143 (not res!832606)) b!1248195))

(assert (= (and b!1248195 res!832605) b!1248193))

(assert (= (and b!1248195 res!832607) b!1248192))

(assert (= (and b!1248192 c!122485) b!1248194))

(assert (= (and b!1248192 (not c!122485)) b!1248191))

(assert (= (or b!1248194 b!1248191) bm!61610))

(declare-fun m!1150201 () Bool)

(assert (=> b!1248192 m!1150201))

(assert (=> b!1248192 m!1150201))

(declare-fun m!1150203 () Bool)

(assert (=> b!1248192 m!1150203))

(assert (=> b!1248193 m!1150201))

(assert (=> b!1248193 m!1150201))

(declare-fun m!1150205 () Bool)

(assert (=> b!1248193 m!1150205))

(assert (=> b!1248195 m!1150201))

(assert (=> b!1248195 m!1150201))

(assert (=> b!1248195 m!1150203))

(assert (=> bm!61610 m!1150201))

(declare-fun m!1150207 () Bool)

(assert (=> bm!61610 m!1150207))

(assert (=> b!1248148 d!138143))

(declare-fun b!1248196 () Bool)

(declare-fun e!708056 () Bool)

(declare-fun call!61614 () Bool)

(assert (=> b!1248196 (= e!708056 call!61614)))

(declare-fun b!1248197 () Bool)

(declare-fun e!708055 () Bool)

(assert (=> b!1248197 (= e!708055 e!708056)))

(declare-fun c!122486 () Bool)

(assert (=> b!1248197 (= c!122486 (validKeyInArray!0 (select (arr!38725 a!3892) newFrom!287)))))

(declare-fun b!1248198 () Bool)

(declare-fun e!708058 () Bool)

(assert (=> b!1248198 (= e!708058 (contains!7494 Nil!27538 (select (arr!38725 a!3892) newFrom!287)))))

(declare-fun b!1248199 () Bool)

(assert (=> b!1248199 (= e!708056 call!61614)))

(declare-fun b!1248200 () Bool)

(declare-fun e!708057 () Bool)

(assert (=> b!1248200 (= e!708057 e!708055)))

(declare-fun res!832610 () Bool)

(assert (=> b!1248200 (=> (not res!832610) (not e!708055))))

(assert (=> b!1248200 (= res!832610 (not e!708058))))

(declare-fun res!832608 () Bool)

(assert (=> b!1248200 (=> (not res!832608) (not e!708058))))

(assert (=> b!1248200 (= res!832608 (validKeyInArray!0 (select (arr!38725 a!3892) newFrom!287)))))

(declare-fun d!138149 () Bool)

(declare-fun res!832609 () Bool)

(assert (=> d!138149 (=> res!832609 e!708057)))

(assert (=> d!138149 (= res!832609 (bvsge newFrom!287 (size!39262 a!3892)))))

(assert (=> d!138149 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27538) e!708057)))

(declare-fun bm!61611 () Bool)

(assert (=> bm!61611 (= call!61614 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!122486 (Cons!27537 (select (arr!38725 a!3892) newFrom!287) Nil!27538) Nil!27538)))))

(assert (= (and d!138149 (not res!832609)) b!1248200))

(assert (= (and b!1248200 res!832608) b!1248198))

(assert (= (and b!1248200 res!832610) b!1248197))

(assert (= (and b!1248197 c!122486) b!1248199))

(assert (= (and b!1248197 (not c!122486)) b!1248196))

(assert (= (or b!1248199 b!1248196) bm!61611))

(declare-fun m!1150209 () Bool)

(assert (=> b!1248197 m!1150209))

(assert (=> b!1248197 m!1150209))

(declare-fun m!1150211 () Bool)

(assert (=> b!1248197 m!1150211))

(assert (=> b!1248198 m!1150209))

(assert (=> b!1248198 m!1150209))

(declare-fun m!1150213 () Bool)

(assert (=> b!1248198 m!1150213))

(assert (=> b!1248200 m!1150209))

(assert (=> b!1248200 m!1150209))

(assert (=> b!1248200 m!1150211))

(assert (=> bm!61611 m!1150209))

(declare-fun m!1150215 () Bool)

(assert (=> bm!61611 m!1150215))

(assert (=> b!1248150 d!138149))

(declare-fun d!138151 () Bool)

(assert (=> d!138151 (= (array_inv!29663 a!3892) (bvsge (size!39262 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104728 d!138151))

(push 1)

(assert (not b!1248195))

(assert (not b!1248192))

(assert (not b!1248193))

(assert (not bm!61611))

(assert (not b!1248197))

(assert (not b!1248200))

(assert (not b!1248198))

(assert (not bm!61610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

