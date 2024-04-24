; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72934 () Bool)

(assert start!72934)

(declare-fun res!574117 () Bool)

(declare-fun e!471949 () Bool)

(assert (=> start!72934 (=> (not res!574117) (not e!471949))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47907 0))(
  ( (array!47908 (arr!22980 (Array (_ BitVec 32) (_ BitVec 64))) (size!23421 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47907)

(assert (=> start!72934 (= res!574117 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23421 _keys!868))))))

(assert (=> start!72934 e!471949))

(assert (=> start!72934 true))

(declare-fun array_inv!18316 (array!47907) Bool)

(assert (=> start!72934 (array_inv!18316 _keys!868)))

(declare-datatypes ((V!26137 0))(
  ( (V!26138 (val!7956 Int)) )
))
(declare-datatypes ((ValueCell!7469 0))(
  ( (ValueCellFull!7469 (v!10381 V!26137)) (EmptyCell!7469) )
))
(declare-datatypes ((array!47909 0))(
  ( (array!47910 (arr!22981 (Array (_ BitVec 32) ValueCell!7469)) (size!23422 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47909)

(declare-fun e!471947 () Bool)

(declare-fun array_inv!18317 (array!47909) Bool)

(assert (=> start!72934 (and (array_inv!18317 _values!688) e!471947)))

(declare-fun b!845411 () Bool)

(declare-fun e!471946 () Bool)

(declare-fun tp_is_empty!15817 () Bool)

(assert (=> b!845411 (= e!471946 tp_is_empty!15817)))

(declare-fun b!845412 () Bool)

(declare-fun res!574116 () Bool)

(assert (=> b!845412 (=> (not res!574116) (not e!471949))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845412 (= res!574116 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25325 () Bool)

(declare-fun mapRes!25325 () Bool)

(assert (=> mapIsEmpty!25325 mapRes!25325))

(declare-fun mapNonEmpty!25325 () Bool)

(declare-fun tp!48644 () Bool)

(declare-fun e!471945 () Bool)

(assert (=> mapNonEmpty!25325 (= mapRes!25325 (and tp!48644 e!471945))))

(declare-fun mapRest!25325 () (Array (_ BitVec 32) ValueCell!7469))

(declare-fun mapValue!25325 () ValueCell!7469)

(declare-fun mapKey!25325 () (_ BitVec 32))

(assert (=> mapNonEmpty!25325 (= (arr!22981 _values!688) (store mapRest!25325 mapKey!25325 mapValue!25325))))

(declare-fun b!845413 () Bool)

(assert (=> b!845413 (= e!471949 false)))

(declare-fun lt!381653 () Bool)

(declare-datatypes ((List!16202 0))(
  ( (Nil!16199) (Cons!16198 (h!17335 (_ BitVec 64)) (t!22565 List!16202)) )
))
(declare-fun arrayNoDuplicates!0 (array!47907 (_ BitVec 32) List!16202) Bool)

(assert (=> b!845413 (= lt!381653 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16199))))

(declare-fun b!845414 () Bool)

(assert (=> b!845414 (= e!471945 tp_is_empty!15817)))

(declare-fun b!845415 () Bool)

(declare-fun res!574115 () Bool)

(assert (=> b!845415 (=> (not res!574115) (not e!471949))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845415 (= res!574115 (and (= (size!23422 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23421 _keys!868) (size!23422 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845416 () Bool)

(assert (=> b!845416 (= e!471947 (and e!471946 mapRes!25325))))

(declare-fun condMapEmpty!25325 () Bool)

(declare-fun mapDefault!25325 () ValueCell!7469)

(assert (=> b!845416 (= condMapEmpty!25325 (= (arr!22981 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7469)) mapDefault!25325)))))

(declare-fun b!845417 () Bool)

(declare-fun res!574114 () Bool)

(assert (=> b!845417 (=> (not res!574114) (not e!471949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47907 (_ BitVec 32)) Bool)

(assert (=> b!845417 (= res!574114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72934 res!574117) b!845412))

(assert (= (and b!845412 res!574116) b!845415))

(assert (= (and b!845415 res!574115) b!845417))

(assert (= (and b!845417 res!574114) b!845413))

(assert (= (and b!845416 condMapEmpty!25325) mapIsEmpty!25325))

(assert (= (and b!845416 (not condMapEmpty!25325)) mapNonEmpty!25325))

(get-info :version)

(assert (= (and mapNonEmpty!25325 ((_ is ValueCellFull!7469) mapValue!25325)) b!845414))

(assert (= (and b!845416 ((_ is ValueCellFull!7469) mapDefault!25325)) b!845411))

(assert (= start!72934 b!845416))

(declare-fun m!788021 () Bool)

(assert (=> mapNonEmpty!25325 m!788021))

(declare-fun m!788023 () Bool)

(assert (=> start!72934 m!788023))

(declare-fun m!788025 () Bool)

(assert (=> start!72934 m!788025))

(declare-fun m!788027 () Bool)

(assert (=> b!845417 m!788027))

(declare-fun m!788029 () Bool)

(assert (=> b!845412 m!788029))

(declare-fun m!788031 () Bool)

(assert (=> b!845413 m!788031))

(check-sat (not b!845417) (not start!72934) (not b!845412) tp_is_empty!15817 (not mapNonEmpty!25325) (not b!845413))
(check-sat)
