; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135890 () Bool)

(assert start!135890)

(declare-fun res!1076473 () Bool)

(declare-fun e!878594 () Bool)

(assert (=> start!135890 (=> (not res!1076473) (not e!878594))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135890 (= res!1076473 (validMask!0 mask!898))))

(assert (=> start!135890 e!878594))

(assert (=> start!135890 true))

(declare-datatypes ((array!105363 0))(
  ( (array!105364 (arr!50818 (Array (_ BitVec 32) (_ BitVec 64))) (size!51370 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105363)

(declare-fun array_inv!39754 (array!105363) Bool)

(assert (=> start!135890 (array_inv!39754 _keys!605)))

(declare-fun b!1575300 () Bool)

(declare-fun res!1076475 () Bool)

(assert (=> b!1575300 (=> (not res!1076475) (not e!878594))))

(assert (=> b!1575300 (= res!1076475 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51370 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575301 () Bool)

(declare-fun res!1076474 () Bool)

(assert (=> b!1575301 (=> (not res!1076474) (not e!878594))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575301 (= res!1076474 (validKeyInArray!0 k!761))))

(declare-fun b!1575302 () Bool)

(assert (=> b!1575302 (= e!878594 false)))

(declare-datatypes ((SeekEntryResult!13718 0))(
  ( (MissingZero!13718 (index!57270 (_ BitVec 32))) (Found!13718 (index!57271 (_ BitVec 32))) (Intermediate!13718 (undefined!14530 Bool) (index!57272 (_ BitVec 32)) (x!142227 (_ BitVec 32))) (Undefined!13718) (MissingVacant!13718 (index!57273 (_ BitVec 32))) )
))
(declare-fun lt!674976 () SeekEntryResult!13718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105363 (_ BitVec 32)) SeekEntryResult!13718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575302 (= lt!674976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135890 res!1076473) b!1575300))

(assert (= (and b!1575300 res!1076475) b!1575301))

(assert (= (and b!1575301 res!1076474) b!1575302))

(declare-fun m!1447697 () Bool)

(assert (=> start!135890 m!1447697))

(declare-fun m!1447699 () Bool)

(assert (=> start!135890 m!1447699))

(declare-fun m!1447701 () Bool)

(assert (=> b!1575301 m!1447701))

(declare-fun m!1447703 () Bool)

(assert (=> b!1575302 m!1447703))

(assert (=> b!1575302 m!1447703))

(declare-fun m!1447705 () Bool)

(assert (=> b!1575302 m!1447705))

(push 1)

(assert (not b!1575301))

(assert (not start!135890))

(assert (not b!1575302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

