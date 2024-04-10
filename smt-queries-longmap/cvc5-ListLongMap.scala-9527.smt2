; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113024 () Bool)

(assert start!113024)

(declare-fun b_free!31075 () Bool)

(declare-fun b_next!31075 () Bool)

(assert (=> start!113024 (= b_free!31075 (not b_next!31075))))

(declare-fun tp!109029 () Bool)

(declare-fun b_and!50105 () Bool)

(assert (=> start!113024 (= tp!109029 b_and!50105)))

(declare-fun b!1339620 () Bool)

(declare-fun res!888665 () Bool)

(declare-fun e!763043 () Bool)

(assert (=> b!1339620 (=> (not res!888665) (not e!763043))))

(declare-datatypes ((array!91006 0))(
  ( (array!91007 (arr!43959 (Array (_ BitVec 32) (_ BitVec 64))) (size!44509 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91006)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91006 (_ BitVec 32)) Bool)

(assert (=> b!1339620 (= res!888665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339621 () Bool)

(declare-fun e!763041 () Bool)

(declare-fun tp_is_empty!37075 () Bool)

(assert (=> b!1339621 (= e!763041 tp_is_empty!37075)))

(declare-fun b!1339622 () Bool)

(declare-fun e!763040 () Bool)

(declare-fun e!763039 () Bool)

(declare-fun mapRes!57319 () Bool)

(assert (=> b!1339622 (= e!763040 (and e!763039 mapRes!57319))))

(declare-fun condMapEmpty!57319 () Bool)

(declare-datatypes ((V!54537 0))(
  ( (V!54538 (val!18612 Int)) )
))
(declare-datatypes ((ValueCell!17639 0))(
  ( (ValueCellFull!17639 (v!21260 V!54537)) (EmptyCell!17639) )
))
(declare-datatypes ((array!91008 0))(
  ( (array!91009 (arr!43960 (Array (_ BitVec 32) ValueCell!17639)) (size!44510 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91008)

(declare-fun mapDefault!57319 () ValueCell!17639)

