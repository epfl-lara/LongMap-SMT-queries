; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93370 () Bool)

(assert start!93370)

(declare-fun b!1057966 () Bool)

(declare-fun e!601794 () Bool)

(declare-fun e!601792 () Bool)

(assert (=> b!1057966 (= e!601794 e!601792)))

(declare-fun res!706581 () Bool)

(assert (=> b!1057966 (=> (not res!706581) (not e!601792))))

(declare-datatypes ((List!22394 0))(
  ( (Nil!22391) (Cons!22390 (h!23599 (_ BitVec 64)) (t!31701 List!22394)) )
))
(declare-fun contains!6206 (List!22394 (_ BitVec 64)) Bool)

(assert (=> b!1057966 (= res!706581 (not (contains!6206 Nil!22391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1057967 () Bool)

(declare-fun res!706589 () Bool)

(assert (=> b!1057967 (=> res!706589 e!601794)))

(declare-fun noDuplicate!1562 (List!22394) Bool)

(assert (=> b!1057967 (= res!706589 (not (noDuplicate!1562 Nil!22391)))))

(declare-fun b!1057968 () Bool)

(declare-fun res!706592 () Bool)

(declare-fun e!601795 () Bool)

(assert (=> b!1057968 (=> (not res!706592) (not e!601795))))

(declare-datatypes ((array!66724 0))(
  ( (array!66725 (arr!32082 (Array (_ BitVec 32) (_ BitVec 64))) (size!32618 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66724)

(declare-fun arrayNoDuplicates!0 (array!66724 (_ BitVec 32) List!22394) Bool)

(assert (=> b!1057968 (= res!706592 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22391))))

(declare-fun b!1057969 () Bool)

(declare-fun e!601798 () Bool)

(assert (=> b!1057969 (= e!601798 e!601794)))

(declare-fun res!706587 () Bool)

(assert (=> b!1057969 (=> res!706587 e!601794)))

(declare-fun lt!466676 () (_ BitVec 32))

(declare-fun lt!466674 () (_ BitVec 32))

(assert (=> b!1057969 (= res!706587 (or (bvslt lt!466674 #b00000000000000000000000000000000) (bvsge lt!466676 (size!32618 a!3488)) (bvsge lt!466674 (size!32618 a!3488))))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057969 (arrayContainsKey!0 a!3488 k!2747 lt!466676)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((Unit!34686 0))(
  ( (Unit!34687) )
))
(declare-fun lt!466677 () Unit!34686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34686)

(assert (=> b!1057969 (= lt!466677 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466676))))

(assert (=> b!1057969 (= lt!466676 (bvadd #b00000000000000000000000000000001 lt!466674))))

(assert (=> b!1057969 (arrayNoDuplicates!0 a!3488 lt!466674 Nil!22391)))

(declare-fun lt!466673 () Unit!34686)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66724 (_ BitVec 32) (_ BitVec 32)) Unit!34686)

(assert (=> b!1057969 (= lt!466673 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466674))))

(declare-fun b!1057970 () Bool)

(declare-fun res!706583 () Bool)

(assert (=> b!1057970 (=> (not res!706583) (not e!601795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057970 (= res!706583 (validKeyInArray!0 k!2747))))

(declare-fun b!1057971 () Bool)

(assert (=> b!1057971 (= e!601792 (not (contains!6206 Nil!22391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1057972 () Bool)

(declare-fun e!601793 () Bool)

(declare-fun e!601797 () Bool)

(assert (=> b!1057972 (= e!601793 e!601797)))

(declare-fun res!706585 () Bool)

(assert (=> b!1057972 (=> (not res!706585) (not e!601797))))

(assert (=> b!1057972 (= res!706585 (not (= lt!466674 i!1381)))))

(declare-fun lt!466675 () array!66724)

(declare-fun arrayScanForKey!0 (array!66724 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057972 (= lt!466674 (arrayScanForKey!0 lt!466675 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!706582 () Bool)

(assert (=> start!93370 (=> (not res!706582) (not e!601795))))

(assert (=> start!93370 (= res!706582 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32618 a!3488)) (bvslt (size!32618 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93370 e!601795))

(assert (=> start!93370 true))

(declare-fun array_inv!24862 (array!66724) Bool)

(assert (=> start!93370 (array_inv!24862 a!3488)))

(declare-fun b!1057965 () Bool)

(assert (=> b!1057965 (= e!601797 (not e!601798))))

(declare-fun res!706591 () Bool)

(assert (=> b!1057965 (=> res!706591 e!601798)))

(assert (=> b!1057965 (= res!706591 (or (bvsgt lt!466674 i!1381) (bvsle i!1381 lt!466674)))))

(declare-fun e!601790 () Bool)

(assert (=> b!1057965 e!601790))

(declare-fun res!706584 () Bool)

(assert (=> b!1057965 (=> (not res!706584) (not e!601790))))

(assert (=> b!1057965 (= res!706584 (= (select (store (arr!32082 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466674) k!2747))))

(declare-fun e!601791 () Bool)

(declare-fun b!1057973 () Bool)

(assert (=> b!1057973 (= e!601791 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057974 () Bool)

(declare-fun res!706586 () Bool)

(assert (=> b!1057974 (=> (not res!706586) (not e!601795))))

(assert (=> b!1057974 (= res!706586 (= (select (arr!32082 a!3488) i!1381) k!2747))))

(declare-fun b!1057975 () Bool)

(assert (=> b!1057975 (= e!601790 e!601791)))

(declare-fun res!706588 () Bool)

(assert (=> b!1057975 (=> res!706588 e!601791)))

(assert (=> b!1057975 (= res!706588 (or (bvsgt lt!466674 i!1381) (bvsle i!1381 lt!466674)))))

(declare-fun b!1057976 () Bool)

(assert (=> b!1057976 (= e!601795 e!601793)))

(declare-fun res!706590 () Bool)

(assert (=> b!1057976 (=> (not res!706590) (not e!601793))))

(assert (=> b!1057976 (= res!706590 (arrayContainsKey!0 lt!466675 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057976 (= lt!466675 (array!66725 (store (arr!32082 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32618 a!3488)))))

(assert (= (and start!93370 res!706582) b!1057968))

(assert (= (and b!1057968 res!706592) b!1057970))

(assert (= (and b!1057970 res!706583) b!1057974))

(assert (= (and b!1057974 res!706586) b!1057976))

(assert (= (and b!1057976 res!706590) b!1057972))

(assert (= (and b!1057972 res!706585) b!1057965))

(assert (= (and b!1057965 res!706584) b!1057975))

(assert (= (and b!1057975 (not res!706588)) b!1057973))

(assert (= (and b!1057965 (not res!706591)) b!1057969))

(assert (= (and b!1057969 (not res!706587)) b!1057967))

(assert (= (and b!1057967 (not res!706589)) b!1057966))

(assert (= (and b!1057966 res!706581) b!1057971))

(declare-fun m!977619 () Bool)

(assert (=> b!1057973 m!977619))

(declare-fun m!977621 () Bool)

(assert (=> b!1057974 m!977621))

(declare-fun m!977623 () Bool)

(assert (=> b!1057976 m!977623))

(declare-fun m!977625 () Bool)

(assert (=> b!1057976 m!977625))

(declare-fun m!977627 () Bool)

(assert (=> b!1057968 m!977627))

(declare-fun m!977629 () Bool)

(assert (=> b!1057970 m!977629))

(declare-fun m!977631 () Bool)

(assert (=> start!93370 m!977631))

(declare-fun m!977633 () Bool)

(assert (=> b!1057972 m!977633))

(declare-fun m!977635 () Bool)

(assert (=> b!1057967 m!977635))

(declare-fun m!977637 () Bool)

(assert (=> b!1057969 m!977637))

(declare-fun m!977639 () Bool)

(assert (=> b!1057969 m!977639))

(declare-fun m!977641 () Bool)

(assert (=> b!1057969 m!977641))

(declare-fun m!977643 () Bool)

(assert (=> b!1057969 m!977643))

(assert (=> b!1057965 m!977625))

(declare-fun m!977645 () Bool)

(assert (=> b!1057965 m!977645))

(declare-fun m!977647 () Bool)

(assert (=> b!1057971 m!977647))

(declare-fun m!977649 () Bool)

(assert (=> b!1057966 m!977649))

(push 1)

(assert (not b!1057973))

(assert (not b!1057969))

(assert (not b!1057970))

(assert (not b!1057966))

(assert (not b!1057972))

(assert (not b!1057976))

(assert (not start!93370))

(assert (not b!1057971))

(assert (not b!1057967))

(assert (not b!1057968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128545 () Bool)

(assert (=> d!128545 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057970 d!128545))

(declare-fun d!128551 () Bool)

(declare-fun lt!466695 () Bool)

(declare-fun content!533 (List!22394) (Set (_ BitVec 64)))

(assert (=> d!128551 (= lt!466695 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!533 Nil!22391)))))

(declare-fun e!601854 () Bool)

(assert (=> d!128551 (= lt!466695 e!601854)))

(declare-fun res!706637 () Bool)

(assert (=> d!128551 (=> (not res!706637) (not e!601854))))

(assert (=> d!128551 (= res!706637 (is-Cons!22390 Nil!22391))))

(assert (=> d!128551 (= (contains!6206 Nil!22391 #b0000000000000000000000000000000000000000000000000000000000000000) lt!466695)))

(declare-fun b!1058041 () Bool)

(declare-fun e!601853 () Bool)

(assert (=> b!1058041 (= e!601854 e!601853)))

(declare-fun res!706638 () Bool)

(assert (=> b!1058041 (=> res!706638 e!601853)))

(assert (=> b!1058041 (= res!706638 (= (h!23599 Nil!22391) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058042 () Bool)

(assert (=> b!1058042 (= e!601853 (contains!6206 (t!31701 Nil!22391) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128551 res!706637) b!1058041))

(assert (= (and b!1058041 (not res!706638)) b!1058042))

(declare-fun m!977705 () Bool)

(assert (=> d!128551 m!977705))

(declare-fun m!977707 () Bool)

(assert (=> d!128551 m!977707))

(declare-fun m!977709 () Bool)

(assert (=> b!1058042 m!977709))

(assert (=> b!1057966 d!128551))

(declare-fun d!128559 () Bool)

(declare-fun res!706653 () Bool)

(declare-fun e!601869 () Bool)

(assert (=> d!128559 (=> res!706653 e!601869)))

(assert (=> d!128559 (= res!706653 (= (select (arr!32082 lt!466675) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128559 (= (arrayContainsKey!0 lt!466675 k!2747 #b00000000000000000000000000000000) e!601869)))

(declare-fun b!1058057 () Bool)

(declare-fun e!601870 () Bool)

(assert (=> b!1058057 (= e!601869 e!601870)))

(declare-fun res!706654 () Bool)

(assert (=> b!1058057 (=> (not res!706654) (not e!601870))))

(assert (=> b!1058057 (= res!706654 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32618 lt!466675)))))

(declare-fun b!1058058 () Bool)

(assert (=> b!1058058 (= e!601870 (arrayContainsKey!0 lt!466675 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128559 (not res!706653)) b!1058057))

(assert (= (and b!1058057 res!706654) b!1058058))

(declare-fun m!977723 () Bool)

(assert (=> d!128559 m!977723))

(declare-fun m!977725 () Bool)

(assert (=> b!1058058 m!977725))

(assert (=> b!1057976 d!128559))

(declare-fun d!128567 () Bool)

(declare-fun lt!466700 () Bool)

(assert (=> d!128567 (= lt!466700 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!533 Nil!22391)))))

(declare-fun e!601872 () Bool)

(assert (=> d!128567 (= lt!466700 e!601872)))

(declare-fun res!706655 () Bool)

(assert (=> d!128567 (=> (not res!706655) (not e!601872))))

(assert (=> d!128567 (= res!706655 (is-Cons!22390 Nil!22391))))

(assert (=> d!128567 (= (contains!6206 Nil!22391 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466700)))

(declare-fun b!1058059 () Bool)

(declare-fun e!601871 () Bool)

(assert (=> b!1058059 (= e!601872 e!601871)))

(declare-fun res!706656 () Bool)

(assert (=> b!1058059 (=> res!706656 e!601871)))

(assert (=> b!1058059 (= res!706656 (= (h!23599 Nil!22391) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058060 () Bool)

(assert (=> b!1058060 (= e!601871 (contains!6206 (t!31701 Nil!22391) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128567 res!706655) b!1058059))

(assert (= (and b!1058059 (not res!706656)) b!1058060))

(assert (=> d!128567 m!977705))

(declare-fun m!977727 () Bool)

(assert (=> d!128567 m!977727))

(declare-fun m!977729 () Bool)

(assert (=> b!1058060 m!977729))

(assert (=> b!1057971 d!128567))

(declare-fun d!128569 () Bool)

(declare-fun res!706657 () Bool)

(declare-fun e!601873 () Bool)

(assert (=> d!128569 (=> res!706657 e!601873)))

(assert (=> d!128569 (= res!706657 (= (select (arr!32082 a!3488) i!1381) k!2747))))

(assert (=> d!128569 (= (arrayContainsKey!0 a!3488 k!2747 i!1381) e!601873)))

(declare-fun b!1058061 () Bool)

(declare-fun e!601874 () Bool)

(assert (=> b!1058061 (= e!601873 e!601874)))

(declare-fun res!706658 () Bool)

(assert (=> b!1058061 (=> (not res!706658) (not e!601874))))

(assert (=> b!1058061 (= res!706658 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32618 a!3488)))))

(declare-fun b!1058062 () Bool)

(assert (=> b!1058062 (= e!601874 (arrayContainsKey!0 a!3488 k!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128569 (not res!706657)) b!1058061))

(assert (= (and b!1058061 res!706658) b!1058062))

(assert (=> d!128569 m!977621))

(declare-fun m!977731 () Bool)

(assert (=> b!1058062 m!977731))

(assert (=> b!1057973 d!128569))

(declare-fun d!128571 () Bool)

(declare-fun lt!466706 () (_ BitVec 32))

(assert (=> d!128571 (and (or (bvslt lt!466706 #b00000000000000000000000000000000) (bvsge lt!466706 (size!32618 lt!466675)) (and (bvsge lt!466706 #b00000000000000000000000000000000) (bvslt lt!466706 (size!32618 lt!466675)))) (bvsge lt!466706 #b00000000000000000000000000000000) (bvslt lt!466706 (size!32618 lt!466675)) (= (select (arr!32082 lt!466675) lt!466706) k!2747))))

