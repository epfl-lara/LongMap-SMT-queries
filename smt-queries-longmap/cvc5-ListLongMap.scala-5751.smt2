; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74334 () Bool)

(assert start!74334)

(declare-fun b_free!15097 () Bool)

(declare-fun b_next!15097 () Bool)

(assert (=> start!74334 (= b_free!15097 (not b_next!15097))))

(declare-fun tp!52965 () Bool)

(declare-fun b_and!24873 () Bool)

(assert (=> start!74334 (= tp!52965 b_and!24873)))

(declare-fun b!874775 () Bool)

(declare-fun res!594496 () Bool)

(declare-fun e!487021 () Bool)

(assert (=> b!874775 (=> (not res!594496) (not e!487021))))

(declare-datatypes ((array!50810 0))(
  ( (array!50811 (arr!24433 (Array (_ BitVec 32) (_ BitVec 64))) (size!24873 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50810)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50810 (_ BitVec 32)) Bool)

(assert (=> b!874775 (= res!594496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27620 () Bool)

(declare-fun mapRes!27620 () Bool)

(declare-fun tp!52966 () Bool)

(declare-fun e!487022 () Bool)

(assert (=> mapNonEmpty!27620 (= mapRes!27620 (and tp!52966 e!487022))))

(declare-datatypes ((V!28169 0))(
  ( (V!28170 (val!8718 Int)) )
))
(declare-datatypes ((ValueCell!8231 0))(
  ( (ValueCellFull!8231 (v!11147 V!28169)) (EmptyCell!8231) )
))
(declare-fun mapRest!27620 () (Array (_ BitVec 32) ValueCell!8231))

(declare-fun mapValue!27620 () ValueCell!8231)

(declare-fun mapKey!27620 () (_ BitVec 32))

(declare-datatypes ((array!50812 0))(
  ( (array!50813 (arr!24434 (Array (_ BitVec 32) ValueCell!8231)) (size!24874 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50812)

(assert (=> mapNonEmpty!27620 (= (arr!24434 _values!688) (store mapRest!27620 mapKey!27620 mapValue!27620))))

(declare-fun mapIsEmpty!27620 () Bool)

(assert (=> mapIsEmpty!27620 mapRes!27620))

(declare-fun b!874776 () Bool)

(declare-fun e!487025 () Bool)

(declare-fun e!487023 () Bool)

(assert (=> b!874776 (= e!487025 (and e!487023 mapRes!27620))))

(declare-fun condMapEmpty!27620 () Bool)

(declare-fun mapDefault!27620 () ValueCell!8231)

