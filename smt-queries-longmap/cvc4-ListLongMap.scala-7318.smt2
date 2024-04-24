; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93766 () Bool)

(assert start!93766)

(declare-fun res!707962 () Bool)

(declare-fun e!603355 () Bool)

(assert (=> start!93766 (=> (not res!707962) (not e!603355))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66868 0))(
  ( (array!66869 (arr!32144 (Array (_ BitVec 32) (_ BitVec 64))) (size!32681 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66868)

(assert (=> start!93766 (= res!707962 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32681 a!3475)) (bvslt (size!32681 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93766 e!603355))

(assert (=> start!93766 true))

(declare-fun array_inv!24926 (array!66868) Bool)

(assert (=> start!93766 (array_inv!24926 a!3475)))

(declare-fun b!1060192 () Bool)

(declare-fun res!707963 () Bool)

(assert (=> b!1060192 (=> (not res!707963) (not e!603355))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060192 (= res!707963 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1060193 () Bool)

(declare-fun res!707961 () Bool)

(assert (=> b!1060193 (=> (not res!707961) (not e!603355))))

(assert (=> b!1060193 (= res!707961 (not (= (select (arr!32144 a!3475) from!2850) k!2741)))))

(declare-fun b!1060194 () Bool)

(declare-fun lt!467570 () (_ BitVec 32))

(assert (=> b!1060194 (= e!603355 (or (bvslt lt!467570 #b00000000000000000000000000000000) (bvsge lt!467570 (size!32681 a!3475)) (not (= (select (arr!32144 a!3475) lt!467570) k!2741))))))

(declare-fun arrayScanForKey!0 (array!66868 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1060194 (= lt!467570 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93766 res!707962) b!1060192))

(assert (= (and b!1060192 res!707963) b!1060193))

(assert (= (and b!1060193 res!707961) b!1060194))

(declare-fun m!980171 () Bool)

(assert (=> start!93766 m!980171))

(declare-fun m!980173 () Bool)

(assert (=> b!1060192 m!980173))

(declare-fun m!980175 () Bool)

(assert (=> b!1060193 m!980175))

(declare-fun m!980177 () Bool)

(assert (=> b!1060194 m!980177))

(declare-fun m!980179 () Bool)

(assert (=> b!1060194 m!980179))

(push 1)

(assert (not b!1060192))

(assert (not start!93766))

(assert (not b!1060194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!129127 () Bool)

(declare-fun res!707983 () Bool)

(declare-fun e!603377 () Bool)

(assert (=> d!129127 (=> res!707983 e!603377)))

(assert (=> d!129127 (= res!707983 (= (select (arr!32144 a!3475) from!2850) k!2741))))

(assert (=> d!129127 (= (arrayContainsKey!0 a!3475 k!2741 from!2850) e!603377)))

(declare-fun b!1060224 () Bool)

(declare-fun e!603378 () Bool)

(assert (=> b!1060224 (= e!603377 e!603378)))

(declare-fun res!707984 () Bool)

(assert (=> b!1060224 (=> (not res!707984) (not e!603378))))

(assert (=> b!1060224 (= res!707984 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32681 a!3475)))))

(declare-fun b!1060225 () Bool)

(assert (=> b!1060225 (= e!603378 (arrayContainsKey!0 a!3475 k!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!129127 (not res!707983)) b!1060224))

(assert (= (and b!1060224 res!707984) b!1060225))

(assert (=> d!129127 m!980175))

(declare-fun m!980199 () Bool)

(assert (=> b!1060225 m!980199))

(assert (=> b!1060192 d!129127))

(declare-fun d!129129 () Bool)

(assert (=> d!129129 (= (array_inv!24926 a!3475) (bvsge (size!32681 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93766 d!129129))

(declare-fun d!129133 () Bool)

(declare-fun lt!467582 () (_ BitVec 32))

(assert (=> d!129133 (and (or (bvslt lt!467582 #b00000000000000000000000000000000) (bvsge lt!467582 (size!32681 a!3475)) (and (bvsge lt!467582 #b00000000000000000000000000000000) (bvslt lt!467582 (size!32681 a!3475)))) (bvsge lt!467582 #b00000000000000000000000000000000) (bvslt lt!467582 (size!32681 a!3475)) (= (select (arr!32144 a!3475) lt!467582) k!2741))))

(declare-fun e!603388 () (_ BitVec 32))

(assert (=> d!129133 (= lt!467582 e!603388)))

(declare-fun c!107591 () Bool)

(assert (=> d!129133 (= c!107591 (= (select (arr!32144 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k!2741))))

(assert (=> d!129133 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32681 a!3475)) (bvslt (size!32681 a!3475) #b01111111111111111111111111111111))))

(assert (=> d!129133 (= (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)) lt!467582)))

(declare-fun b!1060238 () Bool)

(assert (=> b!1060238 (= e!603388 (bvadd #b00000000000000000000000000000001 from!2850))))

(declare-fun b!1060239 () Bool)

(assert (=> b!1060239 (= e!603388 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!129133 c!107591) b!1060238))

(assert (= (and d!129133 (not c!107591)) b!1060239))

(declare-fun m!980209 () Bool)

(assert (=> d!129133 m!980209))

(declare-fun m!980211 () Bool)

(assert (=> d!129133 m!980211))

(declare-fun m!980213 () Bool)

(assert (=> b!1060239 m!980213))

(assert (=> b!1060194 d!129133))

(push 1)

(assert (not b!1060225))

(assert (not b!1060239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

