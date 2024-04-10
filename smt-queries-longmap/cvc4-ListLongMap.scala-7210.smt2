; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92326 () Bool)

(assert start!92326)

(declare-fun b!1049395 () Bool)

(declare-fun e!595388 () Bool)

(declare-fun e!595389 () Bool)

(assert (=> b!1049395 (= e!595388 e!595389)))

(declare-fun res!698529 () Bool)

(assert (=> b!1049395 (=> (not res!698529) (not e!595389))))

(declare-fun lt!463494 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049395 (= res!698529 (not (= lt!463494 i!1381)))))

(declare-datatypes ((array!66127 0))(
  ( (array!66128 (arr!31803 (Array (_ BitVec 32) (_ BitVec 64))) (size!32339 (_ BitVec 32))) )
))
(declare-fun lt!463496 () array!66127)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66127 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049395 (= lt!463494 (arrayScanForKey!0 lt!463496 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049396 () Bool)

(declare-fun e!595387 () Bool)

(declare-fun e!595384 () Bool)

(assert (=> b!1049396 (= e!595387 e!595384)))

(declare-fun res!698527 () Bool)

(assert (=> b!1049396 (=> res!698527 e!595384)))

(declare-fun a!3488 () array!66127)

(assert (=> b!1049396 (= res!698527 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32339 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049396 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34326 0))(
  ( (Unit!34327) )
))
(declare-fun lt!463497 () Unit!34326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66127 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34326)

(assert (=> b!1049396 (= lt!463497 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463494 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22115 0))(
  ( (Nil!22112) (Cons!22111 (h!23320 (_ BitVec 64)) (t!31422 List!22115)) )
))
(declare-fun arrayNoDuplicates!0 (array!66127 (_ BitVec 32) List!22115) Bool)

(assert (=> b!1049396 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22112)))

(declare-fun lt!463493 () Unit!34326)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66127 (_ BitVec 32) (_ BitVec 32)) Unit!34326)

(assert (=> b!1049396 (= lt!463493 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049397 () Bool)

(declare-fun e!595383 () Bool)

(declare-fun e!595390 () Bool)

(assert (=> b!1049397 (= e!595383 e!595390)))

(declare-fun res!698526 () Bool)

(assert (=> b!1049397 (=> res!698526 e!595390)))

(assert (=> b!1049397 (= res!698526 (bvsle lt!463494 i!1381))))

(declare-fun b!1049398 () Bool)

(assert (=> b!1049398 (= e!595389 (not e!595387))))

(declare-fun res!698520 () Bool)

(assert (=> b!1049398 (=> res!698520 e!595387)))

(assert (=> b!1049398 (= res!698520 (bvsle lt!463494 i!1381))))

(assert (=> b!1049398 e!595383))

(declare-fun res!698528 () Bool)

(assert (=> b!1049398 (=> (not res!698528) (not e!595383))))

(assert (=> b!1049398 (= res!698528 (= (select (store (arr!31803 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463494) k!2747))))

(declare-fun b!1049399 () Bool)

(declare-fun res!698522 () Bool)

(declare-fun e!595385 () Bool)

(assert (=> b!1049399 (=> (not res!698522) (not e!595385))))

(assert (=> b!1049399 (= res!698522 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22112))))

(declare-fun b!1049400 () Bool)

(assert (=> b!1049400 (= e!595385 e!595388)))

(declare-fun res!698530 () Bool)

(assert (=> b!1049400 (=> (not res!698530) (not e!595388))))

(assert (=> b!1049400 (= res!698530 (arrayContainsKey!0 lt!463496 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049400 (= lt!463496 (array!66128 (store (arr!31803 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32339 a!3488)))))

(declare-fun b!1049401 () Bool)

(declare-fun res!698531 () Bool)

(assert (=> b!1049401 (=> res!698531 e!595384)))

(declare-fun noDuplicate!1493 (List!22115) Bool)

(assert (=> b!1049401 (= res!698531 (not (noDuplicate!1493 Nil!22112)))))

(declare-fun b!1049394 () Bool)

(declare-fun res!698525 () Bool)

(assert (=> b!1049394 (=> (not res!698525) (not e!595385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049394 (= res!698525 (validKeyInArray!0 k!2747))))

(declare-fun res!698521 () Bool)

(assert (=> start!92326 (=> (not res!698521) (not e!595385))))

(assert (=> start!92326 (= res!698521 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32339 a!3488)) (bvslt (size!32339 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92326 e!595385))

(assert (=> start!92326 true))

(declare-fun array_inv!24583 (array!66127) Bool)

(assert (=> start!92326 (array_inv!24583 a!3488)))

(declare-fun b!1049402 () Bool)

(declare-fun res!698524 () Bool)

(assert (=> b!1049402 (=> (not res!698524) (not e!595385))))

(assert (=> b!1049402 (= res!698524 (= (select (arr!31803 a!3488) i!1381) k!2747))))

(declare-fun b!1049403 () Bool)

(assert (=> b!1049403 (= e!595384 true)))

(declare-fun lt!463495 () Bool)

(declare-fun contains!6108 (List!22115 (_ BitVec 64)) Bool)

(assert (=> b!1049403 (= lt!463495 (contains!6108 Nil!22112 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049404 () Bool)

(declare-fun res!698523 () Bool)

(assert (=> b!1049404 (=> res!698523 e!595384)))

(assert (=> b!1049404 (= res!698523 (contains!6108 Nil!22112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049405 () Bool)

(assert (=> b!1049405 (= e!595390 (arrayContainsKey!0 a!3488 k!2747 lt!463494))))

(assert (= (and start!92326 res!698521) b!1049399))

(assert (= (and b!1049399 res!698522) b!1049394))

(assert (= (and b!1049394 res!698525) b!1049402))

(assert (= (and b!1049402 res!698524) b!1049400))

(assert (= (and b!1049400 res!698530) b!1049395))

(assert (= (and b!1049395 res!698529) b!1049398))

(assert (= (and b!1049398 res!698528) b!1049397))

(assert (= (and b!1049397 (not res!698526)) b!1049405))

(assert (= (and b!1049398 (not res!698520)) b!1049396))

(assert (= (and b!1049396 (not res!698527)) b!1049401))

(assert (= (and b!1049401 (not res!698531)) b!1049404))

(assert (= (and b!1049404 (not res!698523)) b!1049403))

(declare-fun m!970161 () Bool)

(assert (=> b!1049402 m!970161))

(declare-fun m!970163 () Bool)

(assert (=> b!1049400 m!970163))

(declare-fun m!970165 () Bool)

(assert (=> b!1049400 m!970165))

(declare-fun m!970167 () Bool)

(assert (=> b!1049405 m!970167))

(declare-fun m!970169 () Bool)

(assert (=> b!1049404 m!970169))

(declare-fun m!970171 () Bool)

(assert (=> b!1049403 m!970171))

(declare-fun m!970173 () Bool)

(assert (=> b!1049396 m!970173))

(declare-fun m!970175 () Bool)

(assert (=> b!1049396 m!970175))

(declare-fun m!970177 () Bool)

(assert (=> b!1049396 m!970177))

(declare-fun m!970179 () Bool)

(assert (=> b!1049396 m!970179))

(assert (=> b!1049398 m!970165))

(declare-fun m!970181 () Bool)

(assert (=> b!1049398 m!970181))

(declare-fun m!970183 () Bool)

(assert (=> b!1049395 m!970183))

(declare-fun m!970185 () Bool)

(assert (=> start!92326 m!970185))

(declare-fun m!970187 () Bool)

(assert (=> b!1049394 m!970187))

(declare-fun m!970189 () Bool)

(assert (=> b!1049401 m!970189))

(declare-fun m!970191 () Bool)

(assert (=> b!1049399 m!970191))

(push 1)

(assert (not start!92326))

(assert (not b!1049399))

(assert (not b!1049404))

(assert (not b!1049403))

(assert (not b!1049395))

(assert (not b!1049405))

(assert (not b!1049394))

(assert (not b!1049400))

(assert (not b!1049401))

(assert (not b!1049396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

