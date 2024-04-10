; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72338 () Bool)

(assert start!72338)

(declare-fun mapIsEmpty!24683 () Bool)

(declare-fun mapRes!24683 () Bool)

(assert (=> mapIsEmpty!24683 mapRes!24683))

(declare-fun b!838071 () Bool)

(declare-fun res!569906 () Bool)

(declare-fun e!467831 () Bool)

(assert (=> b!838071 (=> (not res!569906) (not e!467831))))

(declare-datatypes ((array!47070 0))(
  ( (array!47071 (arr!22566 (Array (_ BitVec 32) (_ BitVec 64))) (size!23006 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47070)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47070 (_ BitVec 32)) Bool)

(assert (=> b!838071 (= res!569906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838072 () Bool)

(declare-fun e!467830 () Bool)

(declare-fun tp_is_empty!15389 () Bool)

(assert (=> b!838072 (= e!467830 tp_is_empty!15389)))

(declare-fun b!838073 () Bool)

(declare-fun res!569907 () Bool)

(assert (=> b!838073 (=> (not res!569907) (not e!467831))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25565 0))(
  ( (V!25566 (val!7742 Int)) )
))
(declare-datatypes ((ValueCell!7255 0))(
  ( (ValueCellFull!7255 (v!10167 V!25565)) (EmptyCell!7255) )
))
(declare-datatypes ((array!47072 0))(
  ( (array!47073 (arr!22567 (Array (_ BitVec 32) ValueCell!7255)) (size!23007 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47072)

(assert (=> b!838073 (= res!569907 (and (= (size!23007 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23006 _keys!868) (size!23007 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838070 () Bool)

(declare-fun e!467829 () Bool)

(assert (=> b!838070 (= e!467829 tp_is_empty!15389)))

(declare-fun res!569909 () Bool)

(assert (=> start!72338 (=> (not res!569909) (not e!467831))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72338 (= res!569909 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23006 _keys!868))))))

(assert (=> start!72338 e!467831))

(assert (=> start!72338 true))

(declare-fun array_inv!17982 (array!47070) Bool)

(assert (=> start!72338 (array_inv!17982 _keys!868)))

(declare-fun e!467833 () Bool)

(declare-fun array_inv!17983 (array!47072) Bool)

(assert (=> start!72338 (and (array_inv!17983 _values!688) e!467833)))

(declare-fun b!838074 () Bool)

(declare-fun res!569908 () Bool)

(assert (=> b!838074 (=> (not res!569908) (not e!467831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838074 (= res!569908 (validMask!0 mask!1196))))

(declare-fun b!838075 () Bool)

(assert (=> b!838075 (= e!467833 (and e!467829 mapRes!24683))))

(declare-fun condMapEmpty!24683 () Bool)

(declare-fun mapDefault!24683 () ValueCell!7255)

