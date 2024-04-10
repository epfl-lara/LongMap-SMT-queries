; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112012 () Bool)

(assert start!112012)

(declare-fun b!1327249 () Bool)

(declare-datatypes ((V!53585 0))(
  ( (V!53586 (val!18255 Int)) )
))
(declare-datatypes ((ValueCell!17282 0))(
  ( (ValueCellFull!17282 (v!20891 V!53585)) (EmptyCell!17282) )
))
(declare-datatypes ((array!89632 0))(
  ( (array!89633 (arr!43287 (Array (_ BitVec 32) ValueCell!17282)) (size!43837 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89632)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89634 0))(
  ( (array!89635 (arr!43288 (Array (_ BitVec 32) (_ BitVec 64))) (size!43838 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89634)

(declare-fun e!756489 () Bool)

(assert (=> b!1327249 (= e!756489 (and (= (size!43837 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43838 _keys!1590) (size!43837 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011) (not (= (size!43838 _keys!1590) (bvadd #b00000000000000000000000000000001 mask!1998)))))))

(declare-fun b!1327250 () Bool)

(declare-fun e!756487 () Bool)

(declare-fun e!756491 () Bool)

(declare-fun mapRes!56200 () Bool)

(assert (=> b!1327250 (= e!756487 (and e!756491 mapRes!56200))))

(declare-fun condMapEmpty!56200 () Bool)

(declare-fun mapDefault!56200 () ValueCell!17282)

