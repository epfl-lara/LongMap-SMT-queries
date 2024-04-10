; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71804 () Bool)

(assert start!71804)

(declare-fun b!834541 () Bool)

(declare-fun e!465617 () Bool)

(declare-fun e!465618 () Bool)

(assert (=> b!834541 (= e!465617 e!465618)))

(declare-fun res!567508 () Bool)

(assert (=> b!834541 (=> (not res!567508) (not e!465618))))

(declare-datatypes ((array!46714 0))(
  ( (array!46715 (arr!22391 (Array (_ BitVec 32) (_ BitVec 64))) (size!22812 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46714)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834541 (= res!567508 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22812 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28675 0))(
  ( (Unit!28676) )
))
(declare-fun lt!379203 () Unit!28675)

(declare-fun e!465620 () Unit!28675)

(assert (=> b!834541 (= lt!379203 e!465620)))

(declare-fun c!90914 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834541 (= c!90914 (validKeyInArray!0 (select (arr!22391 a!4227) to!390)))))

(declare-fun bm!36574 () Bool)

(declare-fun lt!379204 () array!46714)

(declare-fun call!36577 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46714 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36574 (= call!36577 (arrayCountValidKeys!0 lt!379204 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834542 () Bool)

(declare-fun lt!379206 () Unit!28675)

(assert (=> b!834542 (= e!465620 lt!379206)))

(declare-fun lt!379209 () Unit!28675)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46714 (_ BitVec 32) (_ BitVec 32)) Unit!28675)

(assert (=> b!834542 (= lt!379209 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36578 () (_ BitVec 32))

(declare-fun lt!379205 () (_ BitVec 32))

(assert (=> b!834542 (= call!36578 lt!379205)))

(assert (=> b!834542 (= lt!379206 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379204 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379207 () (_ BitVec 32))

(assert (=> b!834542 (= call!36577 lt!379207)))

(declare-fun b!834543 () Bool)

(declare-fun e!465621 () Bool)

(assert (=> b!834543 (= e!465621 e!465617)))

(declare-fun res!567505 () Bool)

(assert (=> b!834543 (=> (not res!567505) (not e!465617))))

(assert (=> b!834543 (= res!567505 (and (= lt!379207 lt!379205) (not (= to!390 (size!22812 a!4227)))))))

(assert (=> b!834543 (= lt!379205 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834543 (= lt!379207 (arrayCountValidKeys!0 lt!379204 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834543 (= lt!379204 (array!46715 (store (arr!22391 a!4227) i!1466 k!2968) (size!22812 a!4227)))))

(declare-fun b!834544 () Bool)

(declare-fun res!567509 () Bool)

(assert (=> b!834544 (=> (not res!567509) (not e!465621))))

(assert (=> b!834544 (= res!567509 (and (bvslt (size!22812 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22812 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567506 () Bool)

(assert (=> start!71804 (=> (not res!567506) (not e!465621))))

(assert (=> start!71804 (= res!567506 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22812 a!4227))))))

(assert (=> start!71804 e!465621))

(assert (=> start!71804 true))

(declare-fun array_inv!17838 (array!46714) Bool)

(assert (=> start!71804 (array_inv!17838 a!4227)))

(declare-fun b!834545 () Bool)

(declare-fun lt!379201 () Unit!28675)

(assert (=> b!834545 (= e!465620 lt!379201)))

(declare-fun lt!379210 () Unit!28675)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46714 (_ BitVec 32) (_ BitVec 32)) Unit!28675)

(assert (=> b!834545 (= lt!379210 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834545 (= call!36578 (bvadd #b00000000000000000000000000000001 lt!379205))))

(assert (=> b!834545 (= lt!379201 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379204 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834545 (= call!36577 (bvadd #b00000000000000000000000000000001 lt!379207))))

(declare-fun b!834546 () Bool)

(declare-fun res!567504 () Bool)

(assert (=> b!834546 (=> (not res!567504) (not e!465621))))

(assert (=> b!834546 (= res!567504 (not (validKeyInArray!0 (select (arr!22391 a!4227) i!1466))))))

(declare-fun b!834547 () Bool)

(assert (=> b!834547 (= e!465618 false)))

(declare-fun lt!379202 () (_ BitVec 32))

(assert (=> b!834547 (= lt!379202 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379208 () (_ BitVec 32))

(assert (=> b!834547 (= lt!379208 (arrayCountValidKeys!0 lt!379204 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36575 () Bool)

(assert (=> bm!36575 (= call!36578 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834548 () Bool)

(declare-fun res!567507 () Bool)

(assert (=> b!834548 (=> (not res!567507) (not e!465621))))

(assert (=> b!834548 (= res!567507 (validKeyInArray!0 k!2968))))

(assert (= (and start!71804 res!567506) b!834546))

(assert (= (and b!834546 res!567504) b!834548))

(assert (= (and b!834548 res!567507) b!834544))

(assert (= (and b!834544 res!567509) b!834543))

(assert (= (and b!834543 res!567505) b!834541))

(assert (= (and b!834541 c!90914) b!834545))

(assert (= (and b!834541 (not c!90914)) b!834542))

(assert (= (or b!834545 b!834542) bm!36574))

(assert (= (or b!834545 b!834542) bm!36575))

(assert (= (and b!834541 res!567508) b!834547))

(declare-fun m!779557 () Bool)

(assert (=> bm!36574 m!779557))

(declare-fun m!779559 () Bool)

(assert (=> b!834541 m!779559))

(assert (=> b!834541 m!779559))

(declare-fun m!779561 () Bool)

(assert (=> b!834541 m!779561))

(declare-fun m!779563 () Bool)

(assert (=> bm!36575 m!779563))

(declare-fun m!779565 () Bool)

(assert (=> b!834548 m!779565))

(declare-fun m!779567 () Bool)

(assert (=> b!834545 m!779567))

(declare-fun m!779569 () Bool)

(assert (=> b!834545 m!779569))

(assert (=> b!834547 m!779563))

(assert (=> b!834547 m!779557))

(declare-fun m!779571 () Bool)

(assert (=> b!834542 m!779571))

(declare-fun m!779573 () Bool)

(assert (=> b!834542 m!779573))

(declare-fun m!779575 () Bool)

(assert (=> b!834543 m!779575))

(declare-fun m!779577 () Bool)

(assert (=> b!834543 m!779577))

(declare-fun m!779579 () Bool)

(assert (=> b!834543 m!779579))

(declare-fun m!779581 () Bool)

(assert (=> b!834546 m!779581))

(assert (=> b!834546 m!779581))

(declare-fun m!779583 () Bool)

(assert (=> b!834546 m!779583))

(declare-fun m!779585 () Bool)

(assert (=> start!71804 m!779585))

(push 1)

(assert (not b!834546))

(assert (not b!834543))

(assert (not bm!36575))

(assert (not b!834547))

(assert (not b!834545))

