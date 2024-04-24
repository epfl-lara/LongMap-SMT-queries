; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72442 () Bool)

(assert start!72442)

(declare-fun b!838302 () Bool)

(declare-fun res!569868 () Bool)

(declare-fun e!467932 () Bool)

(assert (=> b!838302 (=> (not res!569868) (not e!467932))))

(declare-datatypes ((array!46949 0))(
  ( (array!46950 (arr!22501 (Array (_ BitVec 32) (_ BitVec 64))) (size!22942 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46949)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46949 (_ BitVec 32)) Bool)

(assert (=> b!838302 (= res!569868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24587 () Bool)

(declare-fun mapRes!24587 () Bool)

(assert (=> mapIsEmpty!24587 mapRes!24587))

(declare-fun mapNonEmpty!24587 () Bool)

(declare-fun tp!47582 () Bool)

(declare-fun e!467933 () Bool)

(assert (=> mapNonEmpty!24587 (= mapRes!24587 (and tp!47582 e!467933))))

(declare-datatypes ((V!25481 0))(
  ( (V!25482 (val!7710 Int)) )
))
(declare-datatypes ((ValueCell!7223 0))(
  ( (ValueCellFull!7223 (v!10135 V!25481)) (EmptyCell!7223) )
))
(declare-fun mapValue!24587 () ValueCell!7223)

(declare-fun mapRest!24587 () (Array (_ BitVec 32) ValueCell!7223))

(declare-datatypes ((array!46951 0))(
  ( (array!46952 (arr!22502 (Array (_ BitVec 32) ValueCell!7223)) (size!22943 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46951)

(declare-fun mapKey!24587 () (_ BitVec 32))

(assert (=> mapNonEmpty!24587 (= (arr!22502 _values!688) (store mapRest!24587 mapKey!24587 mapValue!24587))))

(declare-fun b!838303 () Bool)

(declare-fun res!569869 () Bool)

(assert (=> b!838303 (=> (not res!569869) (not e!467932))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838303 (= res!569869 (and (= (size!22943 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22942 _keys!868) (size!22943 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838304 () Bool)

(declare-fun res!569867 () Bool)

(assert (=> b!838304 (=> (not res!569867) (not e!467932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838304 (= res!569867 (validMask!0 mask!1196))))

(declare-fun b!838305 () Bool)

(declare-fun e!467934 () Bool)

(declare-fun tp_is_empty!15325 () Bool)

(assert (=> b!838305 (= e!467934 tp_is_empty!15325)))

(declare-fun b!838306 () Bool)

(assert (=> b!838306 (= e!467932 false)))

(declare-fun lt!380915 () Bool)

(declare-datatypes ((List!15930 0))(
  ( (Nil!15927) (Cons!15926 (h!17063 (_ BitVec 64)) (t!22293 List!15930)) )
))
(declare-fun arrayNoDuplicates!0 (array!46949 (_ BitVec 32) List!15930) Bool)

(assert (=> b!838306 (= lt!380915 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15927))))

(declare-fun b!838307 () Bool)

(assert (=> b!838307 (= e!467933 tp_is_empty!15325)))

(declare-fun res!569866 () Bool)

(assert (=> start!72442 (=> (not res!569866) (not e!467932))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72442 (= res!569866 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22942 _keys!868))))))

(assert (=> start!72442 e!467932))

(assert (=> start!72442 true))

(declare-fun array_inv!17978 (array!46949) Bool)

(assert (=> start!72442 (array_inv!17978 _keys!868)))

(declare-fun e!467935 () Bool)

(declare-fun array_inv!17979 (array!46951) Bool)

(assert (=> start!72442 (and (array_inv!17979 _values!688) e!467935)))

(declare-fun b!838301 () Bool)

(assert (=> b!838301 (= e!467935 (and e!467934 mapRes!24587))))

(declare-fun condMapEmpty!24587 () Bool)

(declare-fun mapDefault!24587 () ValueCell!7223)

(assert (=> b!838301 (= condMapEmpty!24587 (= (arr!22502 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7223)) mapDefault!24587)))))

(assert (= (and start!72442 res!569866) b!838304))

(assert (= (and b!838304 res!569867) b!838303))

(assert (= (and b!838303 res!569869) b!838302))

(assert (= (and b!838302 res!569868) b!838306))

(assert (= (and b!838301 condMapEmpty!24587) mapIsEmpty!24587))

(assert (= (and b!838301 (not condMapEmpty!24587)) mapNonEmpty!24587))

(get-info :version)

(assert (= (and mapNonEmpty!24587 ((_ is ValueCellFull!7223) mapValue!24587)) b!838307))

(assert (= (and b!838301 ((_ is ValueCellFull!7223) mapDefault!24587)) b!838305))

(assert (= start!72442 b!838301))

(declare-fun m!783557 () Bool)

(assert (=> b!838302 m!783557))

(declare-fun m!783559 () Bool)

(assert (=> start!72442 m!783559))

(declare-fun m!783561 () Bool)

(assert (=> start!72442 m!783561))

(declare-fun m!783563 () Bool)

(assert (=> b!838304 m!783563))

(declare-fun m!783565 () Bool)

(assert (=> mapNonEmpty!24587 m!783565))

(declare-fun m!783567 () Bool)

(assert (=> b!838306 m!783567))

(check-sat tp_is_empty!15325 (not b!838306) (not b!838304) (not start!72442) (not b!838302) (not mapNonEmpty!24587))
(check-sat)
