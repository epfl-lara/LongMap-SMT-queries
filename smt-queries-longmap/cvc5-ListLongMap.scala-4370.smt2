; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60310 () Bool)

(assert start!60310)

(declare-fun b!675618 () Bool)

(declare-fun res!441948 () Bool)

(declare-fun e!385515 () Bool)

(assert (=> b!675618 (=> (not res!441948) (not e!385515))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39295 0))(
  ( (array!39296 (arr!18837 (Array (_ BitVec 32) (_ BitVec 64))) (size!19201 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39295)

(assert (=> b!675618 (= res!441948 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19201 a!3626))))))

(declare-fun b!675619 () Bool)

(declare-fun res!441944 () Bool)

(assert (=> b!675619 (=> (not res!441944) (not e!385515))))

(declare-datatypes ((List!12785 0))(
  ( (Nil!12782) (Cons!12781 (h!13829 (_ BitVec 64)) (t!19005 List!12785)) )
))
(declare-fun acc!681 () List!12785)

(declare-fun contains!3437 (List!12785 (_ BitVec 64)) Bool)

(assert (=> b!675619 (= res!441944 (not (contains!3437 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675620 () Bool)

(declare-fun res!441940 () Bool)

(assert (=> b!675620 (=> (not res!441940) (not e!385515))))

(assert (=> b!675620 (= res!441940 (not (contains!3437 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!441934 () Bool)

(assert (=> start!60310 (=> (not res!441934) (not e!385515))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60310 (= res!441934 (and (bvslt (size!19201 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19201 a!3626))))))

(assert (=> start!60310 e!385515))

(assert (=> start!60310 true))

(declare-fun array_inv!14696 (array!39295) Bool)

(assert (=> start!60310 (array_inv!14696 a!3626)))

(declare-fun b!675621 () Bool)

(declare-fun e!385514 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!675621 (= e!385514 (contains!3437 acc!681 k!2843))))

(declare-fun b!675622 () Bool)

(declare-fun res!441939 () Bool)

(assert (=> b!675622 (=> (not res!441939) (not e!385515))))

(declare-fun e!385510 () Bool)

(assert (=> b!675622 (= res!441939 e!385510)))

(declare-fun res!441938 () Bool)

(assert (=> b!675622 (=> res!441938 e!385510)))

(declare-fun e!385508 () Bool)

(assert (=> b!675622 (= res!441938 e!385508)))

(declare-fun res!441947 () Bool)

(assert (=> b!675622 (=> (not res!441947) (not e!385508))))

(assert (=> b!675622 (= res!441947 (bvsgt from!3004 i!1382))))

(declare-fun b!675623 () Bool)

(declare-fun res!441949 () Bool)

(assert (=> b!675623 (=> (not res!441949) (not e!385515))))

(declare-fun noDuplicate!711 (List!12785) Bool)

(assert (=> b!675623 (= res!441949 (noDuplicate!711 acc!681))))

(declare-fun b!675624 () Bool)

(assert (=> b!675624 (= e!385508 (contains!3437 acc!681 k!2843))))

(declare-fun b!675625 () Bool)

(declare-fun res!441945 () Bool)

(assert (=> b!675625 (=> (not res!441945) (not e!385515))))

(declare-fun arrayNoDuplicates!0 (array!39295 (_ BitVec 32) List!12785) Bool)

(assert (=> b!675625 (= res!441945 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12782))))

(declare-fun b!675626 () Bool)

(assert (=> b!675626 (= e!385515 false)))

(declare-fun lt!312826 () Bool)

(assert (=> b!675626 (= lt!312826 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675627 () Bool)

(declare-fun e!385509 () Bool)

(assert (=> b!675627 (= e!385509 (not (contains!3437 acc!681 k!2843)))))

(declare-fun b!675628 () Bool)

(declare-fun res!441941 () Bool)

(assert (=> b!675628 (=> (not res!441941) (not e!385515))))

(declare-fun e!385511 () Bool)

(assert (=> b!675628 (= res!441941 e!385511)))

(declare-fun res!441936 () Bool)

(assert (=> b!675628 (=> res!441936 e!385511)))

(assert (=> b!675628 (= res!441936 e!385514)))

(declare-fun res!441943 () Bool)

(assert (=> b!675628 (=> (not res!441943) (not e!385514))))

(assert (=> b!675628 (= res!441943 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675629 () Bool)

(assert (=> b!675629 (= e!385510 e!385509)))

(declare-fun res!441942 () Bool)

(assert (=> b!675629 (=> (not res!441942) (not e!385509))))

(assert (=> b!675629 (= res!441942 (bvsle from!3004 i!1382))))

(declare-fun b!675630 () Bool)

(declare-fun e!385513 () Bool)

(assert (=> b!675630 (= e!385511 e!385513)))

(declare-fun res!441933 () Bool)

(assert (=> b!675630 (=> (not res!441933) (not e!385513))))

(assert (=> b!675630 (= res!441933 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675631 () Bool)

(declare-fun res!441952 () Bool)

(assert (=> b!675631 (=> (not res!441952) (not e!385515))))

(assert (=> b!675631 (= res!441952 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675632 () Bool)

(declare-fun res!441937 () Bool)

(assert (=> b!675632 (=> (not res!441937) (not e!385515))))

(assert (=> b!675632 (= res!441937 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19201 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675633 () Bool)

(assert (=> b!675633 (= e!385513 (not (contains!3437 acc!681 k!2843)))))

(declare-fun b!675634 () Bool)

(declare-fun res!441946 () Bool)

(assert (=> b!675634 (=> (not res!441946) (not e!385515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675634 (= res!441946 (validKeyInArray!0 k!2843))))

(declare-fun b!675635 () Bool)

(declare-fun res!441935 () Bool)

(assert (=> b!675635 (=> (not res!441935) (not e!385515))))

(declare-fun arrayContainsKey!0 (array!39295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675635 (= res!441935 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675636 () Bool)

(declare-fun res!441951 () Bool)

(assert (=> b!675636 (=> (not res!441951) (not e!385515))))

(assert (=> b!675636 (= res!441951 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675637 () Bool)

(declare-fun res!441950 () Bool)

(assert (=> b!675637 (=> (not res!441950) (not e!385515))))

(assert (=> b!675637 (= res!441950 (not (validKeyInArray!0 (select (arr!18837 a!3626) from!3004))))))

(assert (= (and start!60310 res!441934) b!675623))

(assert (= (and b!675623 res!441949) b!675619))

(assert (= (and b!675619 res!441944) b!675620))

(assert (= (and b!675620 res!441940) b!675622))

(assert (= (and b!675622 res!441947) b!675624))

(assert (= (and b!675622 (not res!441938)) b!675629))

(assert (= (and b!675629 res!441942) b!675627))

(assert (= (and b!675622 res!441939) b!675625))

(assert (= (and b!675625 res!441945) b!675631))

(assert (= (and b!675631 res!441952) b!675618))

(assert (= (and b!675618 res!441948) b!675634))

(assert (= (and b!675634 res!441946) b!675635))

(assert (= (and b!675635 res!441935) b!675632))

(assert (= (and b!675632 res!441937) b!675637))

(assert (= (and b!675637 res!441950) b!675636))

(assert (= (and b!675636 res!441951) b!675628))

(assert (= (and b!675628 res!441943) b!675621))

(assert (= (and b!675628 (not res!441936)) b!675630))

(assert (= (and b!675630 res!441933) b!675633))

(assert (= (and b!675628 res!441941) b!675626))

(declare-fun m!643573 () Bool)

(assert (=> b!675633 m!643573))

(declare-fun m!643575 () Bool)

(assert (=> b!675620 m!643575))

(declare-fun m!643577 () Bool)

(assert (=> b!675635 m!643577))

(declare-fun m!643579 () Bool)

(assert (=> b!675625 m!643579))

(declare-fun m!643581 () Bool)

(assert (=> b!675623 m!643581))

(declare-fun m!643583 () Bool)

(assert (=> b!675626 m!643583))

(declare-fun m!643585 () Bool)

(assert (=> start!60310 m!643585))

(assert (=> b!675621 m!643573))

(declare-fun m!643587 () Bool)

(assert (=> b!675637 m!643587))

(assert (=> b!675637 m!643587))

(declare-fun m!643589 () Bool)

(assert (=> b!675637 m!643589))

(declare-fun m!643591 () Bool)

(assert (=> b!675631 m!643591))

(assert (=> b!675627 m!643573))

(declare-fun m!643593 () Bool)

(assert (=> b!675619 m!643593))

(declare-fun m!643595 () Bool)

(assert (=> b!675634 m!643595))

(assert (=> b!675624 m!643573))

(push 1)

(assert (not b!675627))

(assert (not b!675631))

(assert (not b!675621))

(assert (not b!675624))

(assert (not b!675625))

(assert (not b!675634))

(assert (not b!675623))

(assert (not b!675635))

(assert (not b!675626))

(assert (not b!675633))

(assert (not b!675637))

(assert (not start!60310))

(assert (not b!675619))

(assert (not b!675620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

