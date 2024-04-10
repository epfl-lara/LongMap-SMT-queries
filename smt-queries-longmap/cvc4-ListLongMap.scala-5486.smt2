; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72704 () Bool)

(assert start!72704)

(declare-fun b!843857 () Bool)

(declare-fun e!470901 () Bool)

(assert (=> b!843857 (= e!470901 false)))

(declare-fun lt!381199 () Bool)

(declare-datatypes ((array!47754 0))(
  ( (array!47755 (arr!22908 (Array (_ BitVec 32) (_ BitVec 64))) (size!23348 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47754)

(declare-datatypes ((List!16252 0))(
  ( (Nil!16249) (Cons!16248 (h!17379 (_ BitVec 64)) (t!22623 List!16252)) )
))
(declare-fun arrayNoDuplicates!0 (array!47754 (_ BitVec 32) List!16252) Bool)

(assert (=> b!843857 (= lt!381199 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16249))))

(declare-fun b!843858 () Bool)

(declare-fun e!470902 () Bool)

(declare-fun tp_is_empty!15755 () Bool)

(assert (=> b!843858 (= e!470902 tp_is_empty!15755)))

(declare-fun b!843859 () Bool)

(declare-fun e!470900 () Bool)

(assert (=> b!843859 (= e!470900 tp_is_empty!15755)))

(declare-fun b!843860 () Bool)

(declare-fun res!573401 () Bool)

(assert (=> b!843860 (=> (not res!573401) (not e!470901))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843860 (= res!573401 (validMask!0 mask!1196))))

(declare-fun b!843861 () Bool)

(declare-fun res!573400 () Bool)

(assert (=> b!843861 (=> (not res!573400) (not e!470901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47754 (_ BitVec 32)) Bool)

(assert (=> b!843861 (= res!573400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843862 () Bool)

(declare-fun res!573398 () Bool)

(assert (=> b!843862 (=> (not res!573398) (not e!470901))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26053 0))(
  ( (V!26054 (val!7925 Int)) )
))
(declare-datatypes ((ValueCell!7438 0))(
  ( (ValueCellFull!7438 (v!10350 V!26053)) (EmptyCell!7438) )
))
(declare-datatypes ((array!47756 0))(
  ( (array!47757 (arr!22909 (Array (_ BitVec 32) ValueCell!7438)) (size!23349 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47756)

(assert (=> b!843862 (= res!573398 (and (= (size!23349 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23348 _keys!868) (size!23349 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25232 () Bool)

(declare-fun mapRes!25232 () Bool)

(assert (=> mapIsEmpty!25232 mapRes!25232))

(declare-fun b!843863 () Bool)

(declare-fun e!470898 () Bool)

(assert (=> b!843863 (= e!470898 (and e!470900 mapRes!25232))))

(declare-fun condMapEmpty!25232 () Bool)

(declare-fun mapDefault!25232 () ValueCell!7438)

