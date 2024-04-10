; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61782 () Bool)

(assert start!61782)

(declare-fun b!691579 () Bool)

(declare-fun res!455930 () Bool)

(declare-fun e!393564 () Bool)

(assert (=> b!691579 (=> (not res!455930) (not e!393564))))

(declare-datatypes ((array!39803 0))(
  ( (array!39804 (arr!19070 (Array (_ BitVec 32) (_ BitVec 64))) (size!19455 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39803)

(declare-datatypes ((List!13111 0))(
  ( (Nil!13108) (Cons!13107 (h!14152 (_ BitVec 64)) (t!19378 List!13111)) )
))
(declare-fun arrayNoDuplicates!0 (array!39803 (_ BitVec 32) List!13111) Bool)

(assert (=> b!691579 (= res!455930 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13108))))

(declare-fun b!691580 () Bool)

(declare-fun e!393563 () Bool)

(declare-fun acc!681 () List!13111)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3688 (List!13111 (_ BitVec 64)) Bool)

(assert (=> b!691580 (= e!393563 (not (contains!3688 acc!681 k!2843)))))

(declare-fun b!691581 () Bool)

(declare-fun res!455939 () Bool)

(assert (=> b!691581 (=> (not res!455939) (not e!393564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691581 (= res!455939 (validKeyInArray!0 k!2843))))

(declare-fun b!691582 () Bool)

(declare-fun res!455929 () Bool)

(assert (=> b!691582 (=> (not res!455929) (not e!393564))))

(declare-fun e!393562 () Bool)

(assert (=> b!691582 (= res!455929 e!393562)))

(declare-fun res!455926 () Bool)

(assert (=> b!691582 (=> res!455926 e!393562)))

(declare-fun e!393559 () Bool)

(assert (=> b!691582 (= res!455926 e!393559)))

(declare-fun res!455933 () Bool)

(assert (=> b!691582 (=> (not res!455933) (not e!393559))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691582 (= res!455933 (bvsgt from!3004 i!1382))))

(declare-fun b!691583 () Bool)

(declare-fun res!455932 () Bool)

(assert (=> b!691583 (=> (not res!455932) (not e!393564))))

(assert (=> b!691583 (= res!455932 (validKeyInArray!0 (select (arr!19070 a!3626) from!3004)))))

(declare-fun b!691584 () Bool)

(declare-datatypes ((Unit!24398 0))(
  ( (Unit!24399) )
))
(declare-fun e!393561 () Unit!24398)

(declare-fun Unit!24400 () Unit!24398)

(assert (=> b!691584 (= e!393561 Unit!24400)))

(declare-fun arrayContainsKey!0 (array!39803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691584 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316482 () Unit!24398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39803 (_ BitVec 64) (_ BitVec 32)) Unit!24398)

(assert (=> b!691584 (= lt!316482 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691584 false))

(declare-fun b!691586 () Bool)

(assert (=> b!691586 (= e!393562 e!393563)))

(declare-fun res!455925 () Bool)

(assert (=> b!691586 (=> (not res!455925) (not e!393563))))

(assert (=> b!691586 (= res!455925 (bvsle from!3004 i!1382))))

(declare-fun b!691587 () Bool)

(declare-fun res!455934 () Bool)

(assert (=> b!691587 (=> (not res!455934) (not e!393564))))

(assert (=> b!691587 (= res!455934 (not (contains!3688 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691588 () Bool)

(declare-fun res!455937 () Bool)

(assert (=> b!691588 (=> (not res!455937) (not e!393564))))

(assert (=> b!691588 (= res!455937 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691589 () Bool)

(declare-fun res!455938 () Bool)

(assert (=> b!691589 (=> (not res!455938) (not e!393564))))

(assert (=> b!691589 (= res!455938 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19455 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691590 () Bool)

(declare-fun res!455936 () Bool)

(assert (=> b!691590 (=> (not res!455936) (not e!393564))))

(assert (=> b!691590 (= res!455936 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691591 () Bool)

(assert (=> b!691591 (= e!393559 (contains!3688 acc!681 k!2843))))

(declare-fun b!691592 () Bool)

(declare-fun res!455928 () Bool)

(assert (=> b!691592 (=> (not res!455928) (not e!393564))))

(declare-fun noDuplicate!935 (List!13111) Bool)

(assert (=> b!691592 (= res!455928 (noDuplicate!935 acc!681))))

(declare-fun b!691593 () Bool)

(declare-fun res!455927 () Bool)

(assert (=> b!691593 (=> (not res!455927) (not e!393564))))

(assert (=> b!691593 (= res!455927 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19455 a!3626))))))

(declare-fun b!691594 () Bool)

(declare-fun res!455935 () Bool)

(assert (=> b!691594 (=> (not res!455935) (not e!393564))))

(assert (=> b!691594 (= res!455935 (not (contains!3688 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691595 () Bool)

(assert (=> b!691595 (= e!393564 false)))

(declare-fun lt!316483 () Unit!24398)

(assert (=> b!691595 (= lt!316483 e!393561)))

(declare-fun c!78194 () Bool)

(assert (=> b!691595 (= c!78194 (= (select (arr!19070 a!3626) from!3004) k!2843))))

(declare-fun res!455931 () Bool)

(assert (=> start!61782 (=> (not res!455931) (not e!393564))))

(assert (=> start!61782 (= res!455931 (and (bvslt (size!19455 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19455 a!3626))))))

(assert (=> start!61782 e!393564))

(assert (=> start!61782 true))

(declare-fun array_inv!14866 (array!39803) Bool)

(assert (=> start!61782 (array_inv!14866 a!3626)))

(declare-fun b!691585 () Bool)

(declare-fun Unit!24401 () Unit!24398)

(assert (=> b!691585 (= e!393561 Unit!24401)))

(assert (= (and start!61782 res!455931) b!691592))

(assert (= (and b!691592 res!455928) b!691594))

(assert (= (and b!691594 res!455935) b!691587))

(assert (= (and b!691587 res!455934) b!691582))

(assert (= (and b!691582 res!455933) b!691591))

(assert (= (and b!691582 (not res!455926)) b!691586))

(assert (= (and b!691586 res!455925) b!691580))

(assert (= (and b!691582 res!455929) b!691579))

(assert (= (and b!691579 res!455930) b!691588))

(assert (= (and b!691588 res!455937) b!691593))

(assert (= (and b!691593 res!455927) b!691581))

(assert (= (and b!691581 res!455939) b!691590))

(assert (= (and b!691590 res!455936) b!691589))

(assert (= (and b!691589 res!455938) b!691583))

(assert (= (and b!691583 res!455932) b!691595))

(assert (= (and b!691595 c!78194) b!691584))

(assert (= (and b!691595 (not c!78194)) b!691585))

(declare-fun m!654537 () Bool)

(assert (=> start!61782 m!654537))

(declare-fun m!654539 () Bool)

(assert (=> b!691590 m!654539))

(declare-fun m!654541 () Bool)

(assert (=> b!691591 m!654541))

(declare-fun m!654543 () Bool)

(assert (=> b!691594 m!654543))

(declare-fun m!654545 () Bool)

(assert (=> b!691581 m!654545))

(declare-fun m!654547 () Bool)

(assert (=> b!691584 m!654547))

(declare-fun m!654549 () Bool)

(assert (=> b!691584 m!654549))

(declare-fun m!654551 () Bool)

(assert (=> b!691592 m!654551))

(declare-fun m!654553 () Bool)

(assert (=> b!691595 m!654553))

(declare-fun m!654555 () Bool)

(assert (=> b!691579 m!654555))

(declare-fun m!654557 () Bool)

(assert (=> b!691588 m!654557))

(assert (=> b!691580 m!654541))

(declare-fun m!654559 () Bool)

(assert (=> b!691587 m!654559))

(assert (=> b!691583 m!654553))

(assert (=> b!691583 m!654553))

(declare-fun m!654561 () Bool)

(assert (=> b!691583 m!654561))

(push 1)

(assert (not start!61782))

(assert (not b!691592))

(assert (not b!691587))

(assert (not b!691581))

(assert (not b!691594))

(assert (not b!691579))

(assert (not b!691588))

(assert (not b!691580))

(assert (not b!691590))

(assert (not b!691583))

(assert (not b!691584))

(assert (not b!691591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

