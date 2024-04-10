; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71816 () Bool)

(assert start!71816)

(declare-fun b!834693 () Bool)

(declare-fun res!567620 () Bool)

(declare-fun e!465709 () Bool)

(assert (=> b!834693 (=> (not res!567620) (not e!465709))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834693 (= res!567620 (validKeyInArray!0 k!2968))))

(declare-fun b!834694 () Bool)

(declare-fun res!567625 () Bool)

(assert (=> b!834694 (=> (not res!567625) (not e!465709))))

(declare-datatypes ((array!46726 0))(
  ( (array!46727 (arr!22397 (Array (_ BitVec 32) (_ BitVec 64))) (size!22818 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46726)

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!834694 (= res!567625 (not (validKeyInArray!0 (select (arr!22397 a!4227) i!1466))))))

(declare-fun res!567624 () Bool)

(assert (=> start!71816 (=> (not res!567624) (not e!465709))))

(assert (=> start!71816 (= res!567624 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22818 a!4227))))))

(assert (=> start!71816 e!465709))

(assert (=> start!71816 true))

(declare-fun array_inv!17844 (array!46726) Bool)

(assert (=> start!71816 (array_inv!17844 a!4227)))

(declare-fun lt!379375 () array!46726)

(declare-fun bm!36610 () Bool)

(declare-fun call!36614 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46726 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36610 (= call!36614 (arrayCountValidKeys!0 lt!379375 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834695 () Bool)

(declare-fun e!465710 () Bool)

(assert (=> b!834695 (= e!465710 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!834695 (= (arrayCountValidKeys!0 lt!379375 (bvadd #b00000000000000000000000000000001 i!1466) (size!22818 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22818 a!4227)))))

(declare-datatypes ((Unit!28687 0))(
  ( (Unit!28688) )
))
(declare-fun lt!379378 () Unit!28687)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46726 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28687)

(assert (=> b!834695 (= lt!379378 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834696 () Bool)

(declare-fun res!567623 () Bool)

(assert (=> b!834696 (=> (not res!567623) (not e!465710))))

(assert (=> b!834696 (= res!567623 (= (arrayCountValidKeys!0 lt!379375 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834697 () Bool)

(declare-fun e!465708 () Bool)

(assert (=> b!834697 (= e!465708 e!465710)))

(declare-fun res!567621 () Bool)

(assert (=> b!834697 (=> (not res!567621) (not e!465710))))

(assert (=> b!834697 (= res!567621 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22818 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379377 () Unit!28687)

(declare-fun e!465707 () Unit!28687)

(assert (=> b!834697 (= lt!379377 e!465707)))

(declare-fun c!90932 () Bool)

(assert (=> b!834697 (= c!90932 (validKeyInArray!0 (select (arr!22397 a!4227) to!390)))))

(declare-fun b!834698 () Bool)

(assert (=> b!834698 (= e!465709 e!465708)))

(declare-fun res!567622 () Bool)

(assert (=> b!834698 (=> (not res!567622) (not e!465708))))

(declare-fun lt!379373 () (_ BitVec 32))

(declare-fun lt!379376 () (_ BitVec 32))

(assert (=> b!834698 (= res!567622 (and (= lt!379376 lt!379373) (not (= to!390 (size!22818 a!4227)))))))

(assert (=> b!834698 (= lt!379373 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834698 (= lt!379376 (arrayCountValidKeys!0 lt!379375 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834698 (= lt!379375 (array!46727 (store (arr!22397 a!4227) i!1466 k!2968) (size!22818 a!4227)))))

(declare-fun b!834699 () Bool)

(declare-fun res!567626 () Bool)

(assert (=> b!834699 (=> (not res!567626) (not e!465709))))

(assert (=> b!834699 (= res!567626 (and (bvslt (size!22818 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22818 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834700 () Bool)

(declare-fun lt!379379 () Unit!28687)

(assert (=> b!834700 (= e!465707 lt!379379)))

(declare-fun lt!379380 () Unit!28687)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46726 (_ BitVec 32) (_ BitVec 32)) Unit!28687)

(assert (=> b!834700 (= lt!379380 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36613 () (_ BitVec 32))

(assert (=> b!834700 (= call!36613 lt!379373)))

(assert (=> b!834700 (= lt!379379 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379375 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834700 (= call!36614 lt!379376)))

(declare-fun b!834701 () Bool)

(declare-fun lt!379374 () Unit!28687)

(assert (=> b!834701 (= e!465707 lt!379374)))

(declare-fun lt!379381 () Unit!28687)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46726 (_ BitVec 32) (_ BitVec 32)) Unit!28687)

(assert (=> b!834701 (= lt!379381 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834701 (= call!36613 (bvadd #b00000000000000000000000000000001 lt!379373))))

(assert (=> b!834701 (= lt!379374 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379375 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834701 (= call!36614 (bvadd #b00000000000000000000000000000001 lt!379376))))

(declare-fun bm!36611 () Bool)

(assert (=> bm!36611 (= call!36613 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71816 res!567624) b!834694))

(assert (= (and b!834694 res!567625) b!834693))

(assert (= (and b!834693 res!567620) b!834699))

(assert (= (and b!834699 res!567626) b!834698))

(assert (= (and b!834698 res!567622) b!834697))

(assert (= (and b!834697 c!90932) b!834701))

(assert (= (and b!834697 (not c!90932)) b!834700))

(assert (= (or b!834701 b!834700) bm!36610))

(assert (= (or b!834701 b!834700) bm!36611))

(assert (= (and b!834697 res!567621) b!834696))

(assert (= (and b!834696 res!567623) b!834695))

(declare-fun m!779753 () Bool)

(assert (=> b!834697 m!779753))

(assert (=> b!834697 m!779753))

(declare-fun m!779755 () Bool)

(assert (=> b!834697 m!779755))

(declare-fun m!779757 () Bool)

(assert (=> b!834701 m!779757))

(declare-fun m!779759 () Bool)

(assert (=> b!834701 m!779759))

(declare-fun m!779761 () Bool)

(assert (=> bm!36610 m!779761))

(declare-fun m!779763 () Bool)

(assert (=> start!71816 m!779763))

(declare-fun m!779765 () Bool)

(assert (=> b!834694 m!779765))

(assert (=> b!834694 m!779765))

(declare-fun m!779767 () Bool)

(assert (=> b!834694 m!779767))

(declare-fun m!779769 () Bool)

(assert (=> bm!36611 m!779769))

(declare-fun m!779771 () Bool)

(assert (=> b!834695 m!779771))

(declare-fun m!779773 () Bool)

(assert (=> b!834695 m!779773))

(declare-fun m!779775 () Bool)

(assert (=> b!834695 m!779775))

(declare-fun m!779777 () Bool)

(assert (=> b!834693 m!779777))

(declare-fun m!779779 () Bool)

(assert (=> b!834698 m!779779))

(declare-fun m!779781 () Bool)

(assert (=> b!834698 m!779781))

(declare-fun m!779783 () Bool)

(assert (=> b!834698 m!779783))

(declare-fun m!779785 () Bool)

(assert (=> b!834700 m!779785))

(declare-fun m!779787 () Bool)

(assert (=> b!834700 m!779787))

(assert (=> b!834696 m!779761))

(assert (=> b!834696 m!779769))

(push 1)

(assert (not b!834693))

(assert (not b!834700))

(assert (not start!71816))

(assert (not b!834696))

(assert (not b!834697))

(assert (not bm!36610))

(assert (not b!834694))

