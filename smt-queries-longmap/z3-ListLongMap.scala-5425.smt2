; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72502 () Bool)

(assert start!72502)

(declare-fun b!838931 () Bool)

(declare-fun e!468381 () Bool)

(declare-fun tp_is_empty!15385 () Bool)

(assert (=> b!838931 (= e!468381 tp_is_empty!15385)))

(declare-fun b!838932 () Bool)

(declare-fun e!468383 () Bool)

(declare-fun e!468385 () Bool)

(declare-fun mapRes!24677 () Bool)

(assert (=> b!838932 (= e!468383 (and e!468385 mapRes!24677))))

(declare-fun condMapEmpty!24677 () Bool)

(declare-datatypes ((V!25561 0))(
  ( (V!25562 (val!7740 Int)) )
))
(declare-datatypes ((ValueCell!7253 0))(
  ( (ValueCellFull!7253 (v!10165 V!25561)) (EmptyCell!7253) )
))
(declare-datatypes ((array!47067 0))(
  ( (array!47068 (arr!22560 (Array (_ BitVec 32) ValueCell!7253)) (size!23001 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47067)

(declare-fun mapDefault!24677 () ValueCell!7253)

(assert (=> b!838932 (= condMapEmpty!24677 (= (arr!22560 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7253)) mapDefault!24677)))))

(declare-fun res!570227 () Bool)

(declare-fun e!468382 () Bool)

(assert (=> start!72502 (=> (not res!570227) (not e!468382))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47069 0))(
  ( (array!47070 (arr!22561 (Array (_ BitVec 32) (_ BitVec 64))) (size!23002 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47069)

(assert (=> start!72502 (= res!570227 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23002 _keys!868))))))

(assert (=> start!72502 e!468382))

(assert (=> start!72502 true))

(declare-fun array_inv!18018 (array!47069) Bool)

(assert (=> start!72502 (array_inv!18018 _keys!868)))

(declare-fun array_inv!18019 (array!47067) Bool)

(assert (=> start!72502 (and (array_inv!18019 _values!688) e!468383)))

(declare-fun b!838933 () Bool)

(assert (=> b!838933 (= e!468385 tp_is_empty!15385)))

(declare-fun b!838934 () Bool)

(declare-fun res!570229 () Bool)

(assert (=> b!838934 (=> (not res!570229) (not e!468382))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838934 (= res!570229 (validMask!0 mask!1196))))

(declare-fun b!838935 () Bool)

(declare-fun res!570226 () Bool)

(assert (=> b!838935 (=> (not res!570226) (not e!468382))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838935 (= res!570226 (and (= (size!23001 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23002 _keys!868) (size!23001 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838936 () Bool)

(declare-fun res!570228 () Bool)

(assert (=> b!838936 (=> (not res!570228) (not e!468382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47069 (_ BitVec 32)) Bool)

(assert (=> b!838936 (= res!570228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24677 () Bool)

(assert (=> mapIsEmpty!24677 mapRes!24677))

(declare-fun mapNonEmpty!24677 () Bool)

(declare-fun tp!47672 () Bool)

(assert (=> mapNonEmpty!24677 (= mapRes!24677 (and tp!47672 e!468381))))

(declare-fun mapRest!24677 () (Array (_ BitVec 32) ValueCell!7253))

(declare-fun mapKey!24677 () (_ BitVec 32))

(declare-fun mapValue!24677 () ValueCell!7253)

(assert (=> mapNonEmpty!24677 (= (arr!22560 _values!688) (store mapRest!24677 mapKey!24677 mapValue!24677))))

(declare-fun b!838937 () Bool)

(assert (=> b!838937 (= e!468382 false)))

(declare-fun lt!381005 () Bool)

(declare-datatypes ((List!15950 0))(
  ( (Nil!15947) (Cons!15946 (h!17083 (_ BitVec 64)) (t!22313 List!15950)) )
))
(declare-fun arrayNoDuplicates!0 (array!47069 (_ BitVec 32) List!15950) Bool)

(assert (=> b!838937 (= lt!381005 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15947))))

(assert (= (and start!72502 res!570227) b!838934))

(assert (= (and b!838934 res!570229) b!838935))

(assert (= (and b!838935 res!570226) b!838936))

(assert (= (and b!838936 res!570228) b!838937))

(assert (= (and b!838932 condMapEmpty!24677) mapIsEmpty!24677))

(assert (= (and b!838932 (not condMapEmpty!24677)) mapNonEmpty!24677))

(get-info :version)

(assert (= (and mapNonEmpty!24677 ((_ is ValueCellFull!7253) mapValue!24677)) b!838931))

(assert (= (and b!838932 ((_ is ValueCellFull!7253) mapDefault!24677)) b!838933))

(assert (= start!72502 b!838932))

(declare-fun m!783917 () Bool)

(assert (=> b!838936 m!783917))

(declare-fun m!783919 () Bool)

(assert (=> b!838937 m!783919))

(declare-fun m!783921 () Bool)

(assert (=> mapNonEmpty!24677 m!783921))

(declare-fun m!783923 () Bool)

(assert (=> start!72502 m!783923))

(declare-fun m!783925 () Bool)

(assert (=> start!72502 m!783925))

(declare-fun m!783927 () Bool)

(assert (=> b!838934 m!783927))

(check-sat tp_is_empty!15385 (not b!838934) (not start!72502) (not b!838936) (not b!838937) (not mapNonEmpty!24677))
(check-sat)
