; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133930 () Bool)

(assert start!133930)

(declare-fun b_free!32153 () Bool)

(declare-fun b_next!32153 () Bool)

(assert (=> start!133930 (= b_free!32153 (not b_next!32153))))

(declare-fun tp!113761 () Bool)

(declare-fun b_and!51747 () Bool)

(assert (=> start!133930 (= tp!113761 b_and!51747)))

(declare-fun mapIsEmpty!59782 () Bool)

(declare-fun mapRes!59782 () Bool)

(assert (=> mapIsEmpty!59782 mapRes!59782))

(declare-fun b!1565579 () Bool)

(declare-fun res!1070188 () Bool)

(declare-fun e!872639 () Bool)

(assert (=> b!1565579 (=> (not res!1070188) (not e!872639))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104544 0))(
  ( (array!104545 (arr!50459 (Array (_ BitVec 32) (_ BitVec 64))) (size!51009 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104544)

(declare-datatypes ((V!60109 0))(
  ( (V!60110 (val!19547 Int)) )
))
(declare-datatypes ((ValueCell!18433 0))(
  ( (ValueCellFull!18433 (v!22303 V!60109)) (EmptyCell!18433) )
))
(declare-datatypes ((array!104546 0))(
  ( (array!104547 (arr!50460 (Array (_ BitVec 32) ValueCell!18433)) (size!51010 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104546)

(assert (=> b!1565579 (= res!1070188 (and (= (size!51010 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51009 _keys!637) (size!51010 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565580 () Bool)

(declare-fun e!872637 () Bool)

(declare-fun e!872638 () Bool)

(assert (=> b!1565580 (= e!872637 (and e!872638 mapRes!59782))))

(declare-fun condMapEmpty!59782 () Bool)

(declare-fun mapDefault!59782 () ValueCell!18433)

