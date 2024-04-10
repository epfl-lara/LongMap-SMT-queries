; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135474 () Bool)

(assert start!135474)

(declare-fun res!1075483 () Bool)

(declare-fun e!877895 () Bool)

(assert (=> start!135474 (=> (not res!1075483) (not e!877895))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135474 (= res!1075483 (validMask!0 mask!877))))

(assert (=> start!135474 e!877895))

(assert (=> start!135474 true))

(declare-datatypes ((array!105205 0))(
  ( (array!105206 (arr!50753 (Array (_ BitVec 32) (_ BitVec 64))) (size!51303 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105205)

(declare-fun array_inv!39480 (array!105205) Bool)

(assert (=> start!135474 (array_inv!39480 _keys!591)))

(declare-fun b!1574191 () Bool)

(declare-fun res!1075485 () Bool)

(assert (=> b!1574191 (=> (not res!1075485) (not e!877895))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574191 (= res!1075485 (and (= (size!51303 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51303 _keys!591)) (bvslt i!537 (size!51303 _keys!591))))))

(declare-fun b!1574192 () Bool)

(declare-fun res!1075484 () Bool)

(assert (=> b!1574192 (=> (not res!1075484) (not e!877895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574192 (= res!1075484 (validKeyInArray!0 (select (arr!50753 _keys!591) i!537)))))

(declare-fun b!1574193 () Bool)

(assert (=> b!1574193 (= e!877895 (bvsge (size!51303 _keys!591) #b01111111111111111111111111111111))))

(assert (= (and start!135474 res!1075483) b!1574191))

(assert (= (and b!1574191 res!1075485) b!1574192))

(assert (= (and b!1574192 res!1075484) b!1574193))

(declare-fun m!1447449 () Bool)

(assert (=> start!135474 m!1447449))

(declare-fun m!1447451 () Bool)

(assert (=> start!135474 m!1447451))

(declare-fun m!1447453 () Bool)

(assert (=> b!1574192 m!1447453))

(assert (=> b!1574192 m!1447453))

(declare-fun m!1447455 () Bool)

(assert (=> b!1574192 m!1447455))

(check-sat (not b!1574192) (not start!135474))
(check-sat)
(get-model)

(declare-fun d!165149 () Bool)

(assert (=> d!165149 (= (validKeyInArray!0 (select (arr!50753 _keys!591) i!537)) (and (not (= (select (arr!50753 _keys!591) i!537) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50753 _keys!591) i!537) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574192 d!165149))

(declare-fun d!165151 () Bool)

(assert (=> d!165151 (= (validMask!0 mask!877) (and (or (= mask!877 #b00000000000000000000000000000111) (= mask!877 #b00000000000000000000000000001111) (= mask!877 #b00000000000000000000000000011111) (= mask!877 #b00000000000000000000000000111111) (= mask!877 #b00000000000000000000000001111111) (= mask!877 #b00000000000000000000000011111111) (= mask!877 #b00000000000000000000000111111111) (= mask!877 #b00000000000000000000001111111111) (= mask!877 #b00000000000000000000011111111111) (= mask!877 #b00000000000000000000111111111111) (= mask!877 #b00000000000000000001111111111111) (= mask!877 #b00000000000000000011111111111111) (= mask!877 #b00000000000000000111111111111111) (= mask!877 #b00000000000000001111111111111111) (= mask!877 #b00000000000000011111111111111111) (= mask!877 #b00000000000000111111111111111111) (= mask!877 #b00000000000001111111111111111111) (= mask!877 #b00000000000011111111111111111111) (= mask!877 #b00000000000111111111111111111111) (= mask!877 #b00000000001111111111111111111111) (= mask!877 #b00000000011111111111111111111111) (= mask!877 #b00000000111111111111111111111111) (= mask!877 #b00000001111111111111111111111111) (= mask!877 #b00000011111111111111111111111111) (= mask!877 #b00000111111111111111111111111111) (= mask!877 #b00001111111111111111111111111111) (= mask!877 #b00011111111111111111111111111111) (= mask!877 #b00111111111111111111111111111111)) (bvsle mask!877 #b00111111111111111111111111111111)))))

(assert (=> start!135474 d!165151))

(declare-fun d!165155 () Bool)

(assert (=> d!165155 (= (array_inv!39480 _keys!591) (bvsge (size!51303 _keys!591) #b00000000000000000000000000000000))))

(assert (=> start!135474 d!165155))

(check-sat)
