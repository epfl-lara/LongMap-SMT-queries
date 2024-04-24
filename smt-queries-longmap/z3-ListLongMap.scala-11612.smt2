; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135910 () Bool)

(assert start!135910)

(declare-fun b!1576650 () Bool)

(declare-fun e!879416 () Bool)

(declare-datatypes ((array!105335 0))(
  ( (array!105336 (arr!50809 (Array (_ BitVec 32) (_ BitVec 64))) (size!51360 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105335)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!105335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1576650 (= e!879416 (not (arrayContainsKey!0 _keys!591 (select (arr!50809 _keys!591) i!537) i!537)))))

(declare-fun b!1576649 () Bool)

(declare-fun res!1076364 () Bool)

(assert (=> b!1576649 (=> (not res!1076364) (not e!879416))))

(assert (=> b!1576649 (= res!1076364 (bvslt (size!51360 _keys!591) #b01111111111111111111111111111111))))

(declare-fun b!1576647 () Bool)

(declare-fun res!1076363 () Bool)

(assert (=> b!1576647 (=> (not res!1076363) (not e!879416))))

(declare-fun mask!877 () (_ BitVec 32))

(assert (=> b!1576647 (= res!1076363 (and (= (size!51360 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51360 _keys!591)) (bvslt i!537 (size!51360 _keys!591))))))

(declare-fun res!1076366 () Bool)

(assert (=> start!135910 (=> (not res!1076366) (not e!879416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135910 (= res!1076366 (validMask!0 mask!877))))

(assert (=> start!135910 e!879416))

(assert (=> start!135910 true))

(declare-fun array_inv!39764 (array!105335) Bool)

(assert (=> start!135910 (array_inv!39764 _keys!591)))

(declare-fun b!1576648 () Bool)

(declare-fun res!1076365 () Bool)

(assert (=> b!1576648 (=> (not res!1076365) (not e!879416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576648 (= res!1076365 (validKeyInArray!0 (select (arr!50809 _keys!591) i!537)))))

(assert (= (and start!135910 res!1076366) b!1576647))

(assert (= (and b!1576647 res!1076363) b!1576648))

(assert (= (and b!1576648 res!1076365) b!1576649))

(assert (= (and b!1576649 res!1076364) b!1576650))

(declare-fun m!1449723 () Bool)

(assert (=> b!1576650 m!1449723))

(assert (=> b!1576650 m!1449723))

(declare-fun m!1449725 () Bool)

(assert (=> b!1576650 m!1449725))

(declare-fun m!1449727 () Bool)

(assert (=> start!135910 m!1449727))

(declare-fun m!1449729 () Bool)

(assert (=> start!135910 m!1449729))

(assert (=> b!1576648 m!1449723))

(assert (=> b!1576648 m!1449723))

(declare-fun m!1449731 () Bool)

(assert (=> b!1576648 m!1449731))

(check-sat (not start!135910) (not b!1576650) (not b!1576648))
(check-sat)
(get-model)

(declare-fun d!165873 () Bool)

(assert (=> d!165873 (= (validMask!0 mask!877) (and (or (= mask!877 #b00000000000000000000000000000111) (= mask!877 #b00000000000000000000000000001111) (= mask!877 #b00000000000000000000000000011111) (= mask!877 #b00000000000000000000000000111111) (= mask!877 #b00000000000000000000000001111111) (= mask!877 #b00000000000000000000000011111111) (= mask!877 #b00000000000000000000000111111111) (= mask!877 #b00000000000000000000001111111111) (= mask!877 #b00000000000000000000011111111111) (= mask!877 #b00000000000000000000111111111111) (= mask!877 #b00000000000000000001111111111111) (= mask!877 #b00000000000000000011111111111111) (= mask!877 #b00000000000000000111111111111111) (= mask!877 #b00000000000000001111111111111111) (= mask!877 #b00000000000000011111111111111111) (= mask!877 #b00000000000000111111111111111111) (= mask!877 #b00000000000001111111111111111111) (= mask!877 #b00000000000011111111111111111111) (= mask!877 #b00000000000111111111111111111111) (= mask!877 #b00000000001111111111111111111111) (= mask!877 #b00000000011111111111111111111111) (= mask!877 #b00000000111111111111111111111111) (= mask!877 #b00000001111111111111111111111111) (= mask!877 #b00000011111111111111111111111111) (= mask!877 #b00000111111111111111111111111111) (= mask!877 #b00001111111111111111111111111111) (= mask!877 #b00011111111111111111111111111111) (= mask!877 #b00111111111111111111111111111111)) (bvsle mask!877 #b00111111111111111111111111111111)))))

(assert (=> start!135910 d!165873))

(declare-fun d!165883 () Bool)

(assert (=> d!165883 (= (array_inv!39764 _keys!591) (bvsge (size!51360 _keys!591) #b00000000000000000000000000000000))))

(assert (=> start!135910 d!165883))

(declare-fun d!165885 () Bool)

(declare-fun res!1076395 () Bool)

(declare-fun e!879433 () Bool)

(assert (=> d!165885 (=> res!1076395 e!879433)))

(assert (=> d!165885 (= res!1076395 (= (select (arr!50809 _keys!591) i!537) (select (arr!50809 _keys!591) i!537)))))

(assert (=> d!165885 (= (arrayContainsKey!0 _keys!591 (select (arr!50809 _keys!591) i!537) i!537) e!879433)))

(declare-fun b!1576679 () Bool)

(declare-fun e!879434 () Bool)

(assert (=> b!1576679 (= e!879433 e!879434)))

(declare-fun res!1076396 () Bool)

(assert (=> b!1576679 (=> (not res!1076396) (not e!879434))))

(assert (=> b!1576679 (= res!1076396 (bvslt (bvadd i!537 #b00000000000000000000000000000001) (size!51360 _keys!591)))))

(declare-fun b!1576680 () Bool)

(assert (=> b!1576680 (= e!879434 (arrayContainsKey!0 _keys!591 (select (arr!50809 _keys!591) i!537) (bvadd i!537 #b00000000000000000000000000000001)))))

(assert (= (and d!165885 (not res!1076395)) b!1576679))

(assert (= (and b!1576679 res!1076396) b!1576680))

(assert (=> d!165885 m!1449723))

(assert (=> b!1576680 m!1449723))

(declare-fun m!1449753 () Bool)

(assert (=> b!1576680 m!1449753))

(assert (=> b!1576650 d!165885))

(declare-fun d!165887 () Bool)

(assert (=> d!165887 (= (validKeyInArray!0 (select (arr!50809 _keys!591) i!537)) (and (not (= (select (arr!50809 _keys!591) i!537) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50809 _keys!591) i!537) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576648 d!165887))

(check-sat (not b!1576680))
(check-sat)
