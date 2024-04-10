; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113360 () Bool)

(assert start!113360)

(declare-fun b_free!31411 () Bool)

(declare-fun b_next!31411 () Bool)

(assert (=> start!113360 (= b_free!31411 (not b_next!31411))))

(declare-fun tp!110037 () Bool)

(declare-fun b_and!50675 () Bool)

(assert (=> start!113360 (= tp!110037 b_and!50675)))

(declare-fun b!1345446 () Bool)

(declare-fun res!892749 () Bool)

(declare-fun e!765607 () Bool)

(assert (=> b!1345446 (=> (not res!892749) (not e!765607))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91662 0))(
  ( (array!91663 (arr!44287 (Array (_ BitVec 32) (_ BitVec 64))) (size!44837 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91662)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345446 (= res!892749 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44837 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345447 () Bool)

(declare-fun res!892744 () Bool)

(assert (=> b!1345447 (=> (not res!892744) (not e!765607))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91662 (_ BitVec 32)) Bool)

(assert (=> b!1345447 (= res!892744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345448 () Bool)

(declare-fun res!892751 () Bool)

(assert (=> b!1345448 (=> (not res!892751) (not e!765607))))

(assert (=> b!1345448 (= res!892751 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345449 () Bool)

(declare-fun e!765611 () Bool)

(declare-fun tp_is_empty!37411 () Bool)

(assert (=> b!1345449 (= e!765611 tp_is_empty!37411)))

(declare-fun res!892752 () Bool)

(assert (=> start!113360 (=> (not res!892752) (not e!765607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113360 (= res!892752 (validMask!0 mask!1977))))

(assert (=> start!113360 e!765607))

(assert (=> start!113360 tp_is_empty!37411))

(assert (=> start!113360 true))

(declare-fun array_inv!33373 (array!91662) Bool)

(assert (=> start!113360 (array_inv!33373 _keys!1571)))

(declare-datatypes ((V!54985 0))(
  ( (V!54986 (val!18780 Int)) )
))
(declare-datatypes ((ValueCell!17807 0))(
  ( (ValueCellFull!17807 (v!21428 V!54985)) (EmptyCell!17807) )
))
(declare-datatypes ((array!91664 0))(
  ( (array!91665 (arr!44288 (Array (_ BitVec 32) ValueCell!17807)) (size!44838 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91664)

(declare-fun e!765609 () Bool)

(declare-fun array_inv!33374 (array!91664) Bool)

(assert (=> start!113360 (and (array_inv!33374 _values!1303) e!765609)))

(assert (=> start!113360 tp!110037))

(declare-fun b!1345450 () Bool)

(declare-fun res!892742 () Bool)

(assert (=> b!1345450 (=> (not res!892742) (not e!765607))))

(assert (=> b!1345450 (= res!892742 (and (= (size!44838 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44837 _keys!1571) (size!44838 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345451 () Bool)

(declare-fun e!765606 () Bool)

(assert (=> b!1345451 (= e!765606 tp_is_empty!37411)))

(declare-fun b!1345452 () Bool)

(declare-fun mapRes!57823 () Bool)

(assert (=> b!1345452 (= e!765609 (and e!765606 mapRes!57823))))

(declare-fun condMapEmpty!57823 () Bool)

(declare-fun mapDefault!57823 () ValueCell!17807)

