; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104846 () Bool)

(assert start!104846)

(declare-fun b_free!26651 () Bool)

(declare-fun b_next!26651 () Bool)

(assert (=> start!104846 (= b_free!26651 (not b_next!26651))))

(declare-fun tp!93443 () Bool)

(declare-fun b_and!44419 () Bool)

(assert (=> start!104846 (= tp!93443 b_and!44419)))

(declare-fun b!1249725 () Bool)

(declare-fun res!833630 () Bool)

(declare-fun e!709340 () Bool)

(assert (=> b!1249725 (=> (not res!833630) (not e!709340))))

(declare-datatypes ((array!80780 0))(
  ( (array!80781 (arr!38957 (Array (_ BitVec 32) (_ BitVec 64))) (size!39493 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80780)

(declare-datatypes ((List!27645 0))(
  ( (Nil!27642) (Cons!27641 (h!28850 (_ BitVec 64)) (t!41116 List!27645)) )
))
(declare-fun arrayNoDuplicates!0 (array!80780 (_ BitVec 32) List!27645) Bool)

(assert (=> b!1249725 (= res!833630 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27642))))

(declare-fun b!1249726 () Bool)

(declare-fun res!833628 () Bool)

(assert (=> b!1249726 (=> (not res!833628) (not e!709340))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47435 0))(
  ( (V!47436 (val!15839 Int)) )
))
(declare-datatypes ((ValueCell!15013 0))(
  ( (ValueCellFull!15013 (v!18535 V!47435)) (EmptyCell!15013) )
))
(declare-datatypes ((array!80782 0))(
  ( (array!80783 (arr!38958 (Array (_ BitVec 32) ValueCell!15013)) (size!39494 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80782)

(assert (=> b!1249726 (= res!833628 (and (= (size!39494 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39493 _keys!1118) (size!39494 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49090 () Bool)

(declare-fun mapRes!49090 () Bool)

(assert (=> mapIsEmpty!49090 mapRes!49090))

(declare-fun b!1249727 () Bool)

(declare-fun e!709338 () Bool)

(declare-fun tp_is_empty!31553 () Bool)

(assert (=> b!1249727 (= e!709338 tp_is_empty!31553)))

(declare-fun b!1249728 () Bool)

(declare-fun e!709342 () Bool)

(declare-fun e!709339 () Bool)

(assert (=> b!1249728 (= e!709342 (and e!709339 mapRes!49090))))

(declare-fun condMapEmpty!49090 () Bool)

(declare-fun mapDefault!49090 () ValueCell!15013)

