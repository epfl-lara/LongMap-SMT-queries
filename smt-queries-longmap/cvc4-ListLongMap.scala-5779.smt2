; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74580 () Bool)

(assert start!74580)

(declare-fun b_free!15269 () Bool)

(declare-fun b_next!15269 () Bool)

(assert (=> start!74580 (= b_free!15269 (not b_next!15269))))

(declare-fun tp!53489 () Bool)

(declare-fun b_and!25145 () Bool)

(assert (=> start!74580 (= tp!53489 b_and!25145)))

(declare-fun b!878782 () Bool)

(declare-fun res!597039 () Bool)

(declare-fun e!489061 () Bool)

(assert (=> b!878782 (=> (not res!597039) (not e!489061))))

(declare-datatypes ((array!51152 0))(
  ( (array!51153 (arr!24602 (Array (_ BitVec 32) (_ BitVec 64))) (size!25042 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51152)

(declare-datatypes ((List!17458 0))(
  ( (Nil!17455) (Cons!17454 (h!18585 (_ BitVec 64)) (t!24547 List!17458)) )
))
(declare-fun arrayNoDuplicates!0 (array!51152 (_ BitVec 32) List!17458) Bool)

(assert (=> b!878782 (= res!597039 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17455))))

(declare-fun b!878783 () Bool)

(declare-fun res!597041 () Bool)

(assert (=> b!878783 (=> (not res!597041) (not e!489061))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878783 (= res!597041 (validMask!0 mask!1196))))

(declare-fun b!878784 () Bool)

(declare-fun res!597035 () Bool)

(assert (=> b!878784 (=> (not res!597035) (not e!489061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51152 (_ BitVec 32)) Bool)

(assert (=> b!878784 (= res!597035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878785 () Bool)

(declare-fun res!597033 () Bool)

(assert (=> b!878785 (=> (not res!597033) (not e!489061))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!878785 (= res!597033 (and (= (select (arr!24602 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878786 () Bool)

(declare-fun res!597037 () Bool)

(assert (=> b!878786 (=> (not res!597037) (not e!489061))))

(assert (=> b!878786 (= res!597037 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25042 _keys!868))))))

(declare-fun b!878787 () Bool)

(declare-fun e!489062 () Bool)

(declare-fun e!489063 () Bool)

(declare-fun mapRes!27885 () Bool)

(assert (=> b!878787 (= e!489062 (and e!489063 mapRes!27885))))

(declare-fun condMapEmpty!27885 () Bool)

(declare-datatypes ((V!28397 0))(
  ( (V!28398 (val!8804 Int)) )
))
(declare-datatypes ((ValueCell!8317 0))(
  ( (ValueCellFull!8317 (v!11244 V!28397)) (EmptyCell!8317) )
))
(declare-datatypes ((array!51154 0))(
  ( (array!51155 (arr!24603 (Array (_ BitVec 32) ValueCell!8317)) (size!25043 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51154)

(declare-fun mapDefault!27885 () ValueCell!8317)

