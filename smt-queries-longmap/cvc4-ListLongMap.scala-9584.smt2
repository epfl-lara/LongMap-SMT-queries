; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113370 () Bool)

(assert start!113370)

(declare-fun b_free!31421 () Bool)

(declare-fun b_next!31421 () Bool)

(assert (=> start!113370 (= b_free!31421 (not b_next!31421))))

(declare-fun tp!110067 () Bool)

(declare-fun b_and!50695 () Bool)

(assert (=> start!113370 (= tp!110067 b_and!50695)))

(declare-fun b!1345666 () Bool)

(declare-fun res!892909 () Bool)

(declare-fun e!765697 () Bool)

(assert (=> b!1345666 (=> (not res!892909) (not e!765697))))

(declare-datatypes ((array!91682 0))(
  ( (array!91683 (arr!44297 (Array (_ BitVec 32) (_ BitVec 64))) (size!44847 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91682)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91682 (_ BitVec 32)) Bool)

(assert (=> b!1345666 (= res!892909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345667 () Bool)

(declare-fun e!765701 () Bool)

(declare-fun tp_is_empty!37421 () Bool)

(assert (=> b!1345667 (= e!765701 tp_is_empty!37421)))

(declare-fun b!1345668 () Bool)

(declare-fun res!892915 () Bool)

(assert (=> b!1345668 (=> (not res!892915) (not e!765697))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345668 (= res!892915 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345669 () Bool)

(declare-fun res!892908 () Bool)

(assert (=> b!1345669 (=> (not res!892908) (not e!765697))))

(declare-datatypes ((List!31371 0))(
  ( (Nil!31368) (Cons!31367 (h!32576 (_ BitVec 64)) (t!45949 List!31371)) )
))
(declare-fun arrayNoDuplicates!0 (array!91682 (_ BitVec 32) List!31371) Bool)

(assert (=> b!1345669 (= res!892908 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31368))))

(declare-fun mapNonEmpty!57838 () Bool)

(declare-fun mapRes!57838 () Bool)

(declare-fun tp!110068 () Bool)

(declare-fun e!765696 () Bool)

(assert (=> mapNonEmpty!57838 (= mapRes!57838 (and tp!110068 e!765696))))

(declare-datatypes ((V!54997 0))(
  ( (V!54998 (val!18785 Int)) )
))
(declare-datatypes ((ValueCell!17812 0))(
  ( (ValueCellFull!17812 (v!21433 V!54997)) (EmptyCell!17812) )
))
(declare-fun mapRest!57838 () (Array (_ BitVec 32) ValueCell!17812))

(declare-fun mapKey!57838 () (_ BitVec 32))

(declare-datatypes ((array!91684 0))(
  ( (array!91685 (arr!44298 (Array (_ BitVec 32) ValueCell!17812)) (size!44848 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91684)

(declare-fun mapValue!57838 () ValueCell!17812)

(assert (=> mapNonEmpty!57838 (= (arr!44298 _values!1303) (store mapRest!57838 mapKey!57838 mapValue!57838))))

(declare-fun b!1345671 () Bool)

(declare-fun e!765698 () Bool)

(assert (=> b!1345671 (= e!765698 (and e!765701 mapRes!57838))))

(declare-fun condMapEmpty!57838 () Bool)

(declare-fun mapDefault!57838 () ValueCell!17812)

