; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60240 () Bool)

(assert start!60240)

(declare-fun b!675027 () Bool)

(declare-fun e!385224 () Bool)

(declare-fun e!385223 () Bool)

(assert (=> b!675027 (= e!385224 e!385223)))

(declare-fun res!441474 () Bool)

(assert (=> b!675027 (=> (not res!441474) (not e!385223))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675027 (= res!441474 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675028 () Bool)

(declare-fun res!441468 () Bool)

(declare-fun e!385221 () Bool)

(assert (=> b!675028 (=> (not res!441468) (not e!385221))))

(declare-datatypes ((List!12877 0))(
  ( (Nil!12874) (Cons!12873 (h!13918 (_ BitVec 64)) (t!19105 List!12877)) )
))
(declare-fun acc!681 () List!12877)

(declare-fun contains!3454 (List!12877 (_ BitVec 64)) Bool)

(assert (=> b!675028 (= res!441468 (not (contains!3454 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675029 () Bool)

(declare-fun e!385225 () Bool)

(assert (=> b!675029 (= e!385221 e!385225)))

(declare-fun res!441478 () Bool)

(assert (=> b!675029 (=> (not res!441478) (not e!385225))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39287 0))(
  ( (array!39288 (arr!18836 (Array (_ BitVec 32) (_ BitVec 64))) (size!19200 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39287)

(assert (=> b!675029 (= res!441478 (not (= (select (arr!18836 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23756 0))(
  ( (Unit!23757) )
))
(declare-fun lt!312706 () Unit!23756)

(declare-fun e!385229 () Unit!23756)

(assert (=> b!675029 (= lt!312706 e!385229)))

(declare-fun c!77153 () Bool)

(assert (=> b!675029 (= c!77153 (= (select (arr!18836 a!3626) from!3004) k!2843))))

(declare-fun b!675030 () Bool)

(declare-fun res!441459 () Bool)

(declare-fun e!385227 () Bool)

(assert (=> b!675030 (=> (not res!441459) (not e!385227))))

(declare-fun lt!312705 () List!12877)

(declare-fun noDuplicate!701 (List!12877) Bool)

(assert (=> b!675030 (= res!441459 (noDuplicate!701 lt!312705))))

(declare-fun b!675031 () Bool)

(declare-fun res!441465 () Bool)

(assert (=> b!675031 (=> (not res!441465) (not e!385221))))

(declare-fun arrayContainsKey!0 (array!39287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675031 (= res!441465 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675032 () Bool)

(declare-fun res!441460 () Bool)

(assert (=> b!675032 (=> (not res!441460) (not e!385221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675032 (= res!441460 (validKeyInArray!0 (select (arr!18836 a!3626) from!3004)))))

(declare-fun res!441457 () Bool)

(assert (=> start!60240 (=> (not res!441457) (not e!385221))))

(assert (=> start!60240 (= res!441457 (and (bvslt (size!19200 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19200 a!3626))))))

(assert (=> start!60240 e!385221))

(assert (=> start!60240 true))

(declare-fun array_inv!14632 (array!39287) Bool)

(assert (=> start!60240 (array_inv!14632 a!3626)))

(declare-fun b!675033 () Bool)

(declare-fun e!385230 () Bool)

(declare-fun e!385228 () Bool)

(assert (=> b!675033 (= e!385230 e!385228)))

(declare-fun res!441467 () Bool)

(assert (=> b!675033 (=> (not res!441467) (not e!385228))))

(assert (=> b!675033 (= res!441467 (bvsle from!3004 i!1382))))

(declare-fun b!675034 () Bool)

(assert (=> b!675034 (= e!385225 e!385227)))

(declare-fun res!441461 () Bool)

(assert (=> b!675034 (=> (not res!441461) (not e!385227))))

(assert (=> b!675034 (= res!441461 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!304 (List!12877 (_ BitVec 64)) List!12877)

(assert (=> b!675034 (= lt!312705 ($colon$colon!304 acc!681 (select (arr!18836 a!3626) from!3004)))))

(declare-fun b!675035 () Bool)

(declare-fun res!441470 () Bool)

(assert (=> b!675035 (=> (not res!441470) (not e!385227))))

(assert (=> b!675035 (= res!441470 (not (contains!3454 lt!312705 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675036 () Bool)

(declare-fun res!441469 () Bool)

(assert (=> b!675036 (=> (not res!441469) (not e!385221))))

(assert (=> b!675036 (= res!441469 (noDuplicate!701 acc!681))))

(declare-fun b!675037 () Bool)

(declare-fun res!441473 () Bool)

(assert (=> b!675037 (=> (not res!441473) (not e!385221))))

(assert (=> b!675037 (= res!441473 e!385230)))

(declare-fun res!441456 () Bool)

(assert (=> b!675037 (=> res!441456 e!385230)))

(declare-fun e!385226 () Bool)

(assert (=> b!675037 (= res!441456 e!385226)))

(declare-fun res!441464 () Bool)

(assert (=> b!675037 (=> (not res!441464) (not e!385226))))

(assert (=> b!675037 (= res!441464 (bvsgt from!3004 i!1382))))

(declare-fun b!675038 () Bool)

(assert (=> b!675038 (= e!385227 (not true))))

(declare-fun arrayNoDuplicates!0 (array!39287 (_ BitVec 32) List!12877) Bool)

(assert (=> b!675038 (arrayNoDuplicates!0 (array!39288 (store (arr!18836 a!3626) i!1382 k!2843) (size!19200 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312705)))

(declare-fun lt!312704 () Unit!23756)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12877) Unit!23756)

(assert (=> b!675038 (= lt!312704 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312705))))

(declare-fun b!675039 () Bool)

(assert (=> b!675039 (= e!385228 (not (contains!3454 acc!681 k!2843)))))

(declare-fun b!675040 () Bool)

(declare-fun e!385220 () Bool)

(assert (=> b!675040 (= e!385220 (contains!3454 lt!312705 k!2843))))

(declare-fun b!675041 () Bool)

(declare-fun res!441458 () Bool)

(assert (=> b!675041 (=> (not res!441458) (not e!385221))))

(assert (=> b!675041 (= res!441458 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12874))))

(declare-fun b!675042 () Bool)

(declare-fun res!441462 () Bool)

(assert (=> b!675042 (=> (not res!441462) (not e!385221))))

(assert (=> b!675042 (= res!441462 (validKeyInArray!0 k!2843))))

(declare-fun b!675043 () Bool)

(declare-fun res!441475 () Bool)

(assert (=> b!675043 (=> (not res!441475) (not e!385227))))

(assert (=> b!675043 (= res!441475 e!385224)))

(declare-fun res!441472 () Bool)

(assert (=> b!675043 (=> res!441472 e!385224)))

(assert (=> b!675043 (= res!441472 e!385220)))

(declare-fun res!441476 () Bool)

(assert (=> b!675043 (=> (not res!441476) (not e!385220))))

(assert (=> b!675043 (= res!441476 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675044 () Bool)

(assert (=> b!675044 (= e!385223 (not (contains!3454 lt!312705 k!2843)))))

(declare-fun b!675045 () Bool)

(declare-fun Unit!23758 () Unit!23756)

(assert (=> b!675045 (= e!385229 Unit!23758)))

(declare-fun b!675046 () Bool)

(declare-fun res!441463 () Bool)

(assert (=> b!675046 (=> (not res!441463) (not e!385221))))

(assert (=> b!675046 (= res!441463 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675047 () Bool)

(declare-fun res!441471 () Bool)

(assert (=> b!675047 (=> (not res!441471) (not e!385227))))

(assert (=> b!675047 (= res!441471 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312705))))

(declare-fun b!675048 () Bool)

(declare-fun res!441466 () Bool)

(assert (=> b!675048 (=> (not res!441466) (not e!385221))))

(assert (=> b!675048 (= res!441466 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19200 a!3626))))))

(declare-fun b!675049 () Bool)

(declare-fun res!441477 () Bool)

(assert (=> b!675049 (=> (not res!441477) (not e!385221))))

(assert (=> b!675049 (= res!441477 (not (contains!3454 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675050 () Bool)

(declare-fun res!441479 () Bool)

(assert (=> b!675050 (=> (not res!441479) (not e!385221))))

(assert (=> b!675050 (= res!441479 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19200 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675051 () Bool)

(declare-fun Unit!23759 () Unit!23756)

(assert (=> b!675051 (= e!385229 Unit!23759)))

(assert (=> b!675051 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312703 () Unit!23756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39287 (_ BitVec 64) (_ BitVec 32)) Unit!23756)

(assert (=> b!675051 (= lt!312703 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!675051 false))

(declare-fun b!675052 () Bool)

(declare-fun res!441455 () Bool)

(assert (=> b!675052 (=> (not res!441455) (not e!385227))))

(assert (=> b!675052 (= res!441455 (not (contains!3454 lt!312705 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675053 () Bool)

(assert (=> b!675053 (= e!385226 (contains!3454 acc!681 k!2843))))

(assert (= (and start!60240 res!441457) b!675036))

(assert (= (and b!675036 res!441469) b!675028))

(assert (= (and b!675028 res!441468) b!675049))

(assert (= (and b!675049 res!441477) b!675037))

(assert (= (and b!675037 res!441464) b!675053))

(assert (= (and b!675037 (not res!441456)) b!675033))

(assert (= (and b!675033 res!441467) b!675039))

(assert (= (and b!675037 res!441473) b!675041))

(assert (= (and b!675041 res!441458) b!675046))

(assert (= (and b!675046 res!441463) b!675048))

(assert (= (and b!675048 res!441466) b!675042))

(assert (= (and b!675042 res!441462) b!675031))

(assert (= (and b!675031 res!441465) b!675050))

(assert (= (and b!675050 res!441479) b!675032))

(assert (= (and b!675032 res!441460) b!675029))

(assert (= (and b!675029 c!77153) b!675051))

(assert (= (and b!675029 (not c!77153)) b!675045))

(assert (= (and b!675029 res!441478) b!675034))

(assert (= (and b!675034 res!441461) b!675030))

(assert (= (and b!675030 res!441459) b!675035))

(assert (= (and b!675035 res!441470) b!675052))

(assert (= (and b!675052 res!441455) b!675043))

(assert (= (and b!675043 res!441476) b!675040))

(assert (= (and b!675043 (not res!441472)) b!675027))

(assert (= (and b!675027 res!441474) b!675044))

(assert (= (and b!675043 res!441475) b!675047))

(assert (= (and b!675047 res!441471) b!675038))

(declare-fun m!642711 () Bool)

(assert (=> b!675038 m!642711))

(declare-fun m!642713 () Bool)

(assert (=> b!675038 m!642713))

(declare-fun m!642715 () Bool)

(assert (=> b!675038 m!642715))

(declare-fun m!642717 () Bool)

(assert (=> b!675032 m!642717))

(assert (=> b!675032 m!642717))

(declare-fun m!642719 () Bool)

(assert (=> b!675032 m!642719))

(declare-fun m!642721 () Bool)

(assert (=> b!675052 m!642721))

(declare-fun m!642723 () Bool)

(assert (=> b!675053 m!642723))

(assert (=> b!675039 m!642723))

(declare-fun m!642725 () Bool)

(assert (=> b!675036 m!642725))

(declare-fun m!642727 () Bool)

(assert (=> b!675040 m!642727))

(declare-fun m!642729 () Bool)

(assert (=> b!675046 m!642729))

(declare-fun m!642731 () Bool)

(assert (=> b!675051 m!642731))

(declare-fun m!642733 () Bool)

(assert (=> b!675051 m!642733))

(declare-fun m!642735 () Bool)

(assert (=> b!675028 m!642735))

(assert (=> b!675029 m!642717))

(declare-fun m!642737 () Bool)

(assert (=> b!675030 m!642737))

(declare-fun m!642739 () Bool)

(assert (=> b!675035 m!642739))

(declare-fun m!642741 () Bool)

(assert (=> b!675049 m!642741))

(declare-fun m!642743 () Bool)

(assert (=> b!675031 m!642743))

(assert (=> b!675034 m!642717))

(assert (=> b!675034 m!642717))

(declare-fun m!642745 () Bool)

(assert (=> b!675034 m!642745))

(declare-fun m!642747 () Bool)

(assert (=> b!675047 m!642747))

(declare-fun m!642749 () Bool)

(assert (=> start!60240 m!642749))

(declare-fun m!642751 () Bool)

(assert (=> b!675042 m!642751))

(assert (=> b!675044 m!642727))

(declare-fun m!642753 () Bool)

(assert (=> b!675041 m!642753))

(push 1)

