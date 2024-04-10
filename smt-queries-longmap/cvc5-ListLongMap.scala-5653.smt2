; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73702 () Bool)

(assert start!73702)

(declare-fun b_free!14617 () Bool)

(declare-fun b_next!14617 () Bool)

(assert (=> start!73702 (= b_free!14617 (not b_next!14617))))

(declare-fun tp!51354 () Bool)

(declare-fun b_and!24213 () Bool)

(assert (=> start!73702 (= tp!51354 b_and!24213)))

(declare-fun b!863675 () Bool)

(declare-fun res!586885 () Bool)

(declare-fun e!481162 () Bool)

(assert (=> b!863675 (=> (not res!586885) (not e!481162))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49668 0))(
  ( (array!49669 (arr!23865 (Array (_ BitVec 32) (_ BitVec 64))) (size!24305 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49668)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!863675 (= res!586885 (and (= (select (arr!23865 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863676 () Bool)

(declare-fun res!586887 () Bool)

(assert (=> b!863676 (=> (not res!586887) (not e!481162))))

(assert (=> b!863676 (= res!586887 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24305 _keys!868))))))

(declare-fun mapNonEmpty!26729 () Bool)

(declare-fun mapRes!26729 () Bool)

(declare-fun tp!51355 () Bool)

(declare-fun e!481156 () Bool)

(assert (=> mapNonEmpty!26729 (= mapRes!26729 (and tp!51355 e!481156))))

(declare-fun mapKey!26729 () (_ BitVec 32))

(declare-datatypes ((V!27385 0))(
  ( (V!27386 (val!8424 Int)) )
))
(declare-datatypes ((ValueCell!7937 0))(
  ( (ValueCellFull!7937 (v!10849 V!27385)) (EmptyCell!7937) )
))
(declare-fun mapRest!26729 () (Array (_ BitVec 32) ValueCell!7937))

(declare-datatypes ((array!49670 0))(
  ( (array!49671 (arr!23866 (Array (_ BitVec 32) ValueCell!7937)) (size!24306 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49670)

(declare-fun mapValue!26729 () ValueCell!7937)

(assert (=> mapNonEmpty!26729 (= (arr!23866 _values!688) (store mapRest!26729 mapKey!26729 mapValue!26729))))

(declare-fun b!863678 () Bool)

(declare-fun res!586880 () Bool)

(assert (=> b!863678 (=> (not res!586880) (not e!481162))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!863678 (= res!586880 (and (= (size!24306 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24305 _keys!868) (size!24306 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863679 () Bool)

(declare-fun e!481157 () Bool)

(declare-fun tp_is_empty!16753 () Bool)

(assert (=> b!863679 (= e!481157 tp_is_empty!16753)))

(declare-fun b!863680 () Bool)

(declare-fun e!481154 () Bool)

(assert (=> b!863680 (= e!481154 (and e!481157 mapRes!26729))))

(declare-fun condMapEmpty!26729 () Bool)

(declare-fun mapDefault!26729 () ValueCell!7937)

