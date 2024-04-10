; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73670 () Bool)

(assert start!73670)

(declare-fun b_free!14585 () Bool)

(declare-fun b_next!14585 () Bool)

(assert (=> start!73670 (= b_free!14585 (not b_next!14585))))

(declare-fun tp!51258 () Bool)

(declare-fun b_and!24149 () Bool)

(assert (=> start!73670 (= tp!51258 b_and!24149)))

(declare-fun b!862875 () Bool)

(declare-fun res!586354 () Bool)

(declare-fun e!480728 () Bool)

(assert (=> b!862875 (=> (not res!586354) (not e!480728))))

(declare-datatypes ((array!49606 0))(
  ( (array!49607 (arr!23834 (Array (_ BitVec 32) (_ BitVec 64))) (size!24274 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49606)

(declare-datatypes ((List!16935 0))(
  ( (Nil!16932) (Cons!16931 (h!18062 (_ BitVec 64)) (t!23786 List!16935)) )
))
(declare-fun arrayNoDuplicates!0 (array!49606 (_ BitVec 32) List!16935) Bool)

(assert (=> b!862875 (= res!586354 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16932))))

(declare-fun b!862876 () Bool)

(declare-fun res!586358 () Bool)

(assert (=> b!862876 (=> (not res!586358) (not e!480728))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49606 (_ BitVec 32)) Bool)

(assert (=> b!862876 (= res!586358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862877 () Bool)

(declare-fun res!586361 () Bool)

(assert (=> b!862877 (=> (not res!586361) (not e!480728))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27341 0))(
  ( (V!27342 (val!8408 Int)) )
))
(declare-datatypes ((ValueCell!7921 0))(
  ( (ValueCellFull!7921 (v!10833 V!27341)) (EmptyCell!7921) )
))
(declare-datatypes ((array!49608 0))(
  ( (array!49609 (arr!23835 (Array (_ BitVec 32) ValueCell!7921)) (size!24275 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49608)

(assert (=> b!862877 (= res!586361 (and (= (size!24275 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24274 _keys!868) (size!24275 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862878 () Bool)

(declare-fun e!480724 () Bool)

(declare-fun tp_is_empty!16721 () Bool)

(assert (=> b!862878 (= e!480724 tp_is_empty!16721)))

(declare-fun b!862879 () Bool)

(declare-fun e!480722 () Bool)

(declare-fun mapRes!26681 () Bool)

(assert (=> b!862879 (= e!480722 (and e!480724 mapRes!26681))))

(declare-fun condMapEmpty!26681 () Bool)

(declare-fun mapDefault!26681 () ValueCell!7921)

