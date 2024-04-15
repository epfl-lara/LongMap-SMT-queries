; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20248 () Bool)

(assert start!20248)

(declare-fun b_free!4903 () Bool)

(declare-fun b_next!4903 () Bool)

(assert (=> start!20248 (= b_free!4903 (not b_next!4903))))

(declare-fun tp!17741 () Bool)

(declare-fun b_and!11623 () Bool)

(assert (=> start!20248 (= tp!17741 b_and!11623)))

(declare-fun res!94455 () Bool)

(declare-fun e!130649 () Bool)

(assert (=> start!20248 (=> (not res!94455) (not e!130649))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20248 (= res!94455 (validMask!0 mask!1149))))

(assert (=> start!20248 e!130649))

(declare-datatypes ((V!5993 0))(
  ( (V!5994 (val!2424 Int)) )
))
(declare-datatypes ((ValueCell!2036 0))(
  ( (ValueCellFull!2036 (v!4388 V!5993)) (EmptyCell!2036) )
))
(declare-datatypes ((array!8739 0))(
  ( (array!8740 (arr!4119 (Array (_ BitVec 32) ValueCell!2036)) (size!4445 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8739)

(declare-fun e!130653 () Bool)

(declare-fun array_inv!2683 (array!8739) Bool)

(assert (=> start!20248 (and (array_inv!2683 _values!649) e!130653)))

(assert (=> start!20248 true))

(declare-fun tp_is_empty!4759 () Bool)

(assert (=> start!20248 tp_is_empty!4759))

(declare-datatypes ((array!8741 0))(
  ( (array!8742 (arr!4120 (Array (_ BitVec 32) (_ BitVec 64))) (size!4446 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8741)

(declare-fun array_inv!2684 (array!8741) Bool)

(assert (=> start!20248 (array_inv!2684 _keys!825)))

(assert (=> start!20248 tp!17741))

(declare-fun b!198947 () Bool)

(declare-fun e!130650 () Bool)

(assert (=> b!198947 (= e!130650 tp_is_empty!4759)))

(declare-fun b!198948 () Bool)

(declare-fun res!94453 () Bool)

(assert (=> b!198948 (=> (not res!94453) (not e!130649))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198948 (= res!94453 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4446 _keys!825))))))

(declare-fun b!198949 () Bool)

(declare-fun res!94451 () Bool)

(assert (=> b!198949 (=> (not res!94451) (not e!130649))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!198949 (= res!94451 (= (select (arr!4120 _keys!825) i!601) k0!843))))

(declare-fun b!198950 () Bool)

(declare-fun e!130651 () Bool)

(assert (=> b!198950 (= e!130651 tp_is_empty!4759)))

(declare-fun b!198951 () Bool)

(declare-fun res!94457 () Bool)

(assert (=> b!198951 (=> (not res!94457) (not e!130649))))

(declare-datatypes ((List!2564 0))(
  ( (Nil!2561) (Cons!2560 (h!3202 (_ BitVec 64)) (t!7486 List!2564)) )
))
(declare-fun arrayNoDuplicates!0 (array!8741 (_ BitVec 32) List!2564) Bool)

(assert (=> b!198951 (= res!94457 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2561))))

(declare-fun b!198952 () Bool)

(declare-fun mapRes!8207 () Bool)

(assert (=> b!198952 (= e!130653 (and e!130650 mapRes!8207))))

(declare-fun condMapEmpty!8207 () Bool)

(declare-fun mapDefault!8207 () ValueCell!2036)

(assert (=> b!198952 (= condMapEmpty!8207 (= (arr!4119 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2036)) mapDefault!8207)))))

(declare-fun b!198953 () Bool)

(declare-fun res!94452 () Bool)

(assert (=> b!198953 (=> (not res!94452) (not e!130649))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198953 (= res!94452 (and (= (size!4445 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4446 _keys!825) (size!4445 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8207 () Bool)

(assert (=> mapIsEmpty!8207 mapRes!8207))

(declare-fun b!198954 () Bool)

(declare-fun res!94454 () Bool)

(assert (=> b!198954 (=> (not res!94454) (not e!130649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8741 (_ BitVec 32)) Bool)

(assert (=> b!198954 (= res!94454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198955 () Bool)

(assert (=> b!198955 (= e!130649 (not true))))

(declare-datatypes ((tuple2!3632 0))(
  ( (tuple2!3633 (_1!1827 (_ BitVec 64)) (_2!1827 V!5993)) )
))
(declare-datatypes ((List!2565 0))(
  ( (Nil!2562) (Cons!2561 (h!3203 tuple2!3632) (t!7487 List!2565)) )
))
(declare-datatypes ((ListLongMap!2535 0))(
  ( (ListLongMap!2536 (toList!1283 List!2565)) )
))
(declare-fun lt!97981 () ListLongMap!2535)

(declare-fun lt!97980 () ListLongMap!2535)

(assert (=> b!198955 (and (= lt!97981 lt!97980) (= lt!97980 lt!97981))))

(declare-fun lt!97979 () ListLongMap!2535)

(declare-fun v!520 () V!5993)

(declare-fun +!332 (ListLongMap!2535 tuple2!3632) ListLongMap!2535)

(assert (=> b!198955 (= lt!97980 (+!332 lt!97979 (tuple2!3633 k0!843 v!520)))))

(declare-fun zeroValue!615 () V!5993)

(declare-datatypes ((Unit!5916 0))(
  ( (Unit!5917) )
))
(declare-fun lt!97982 () Unit!5916)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5993)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!12 (array!8741 array!8739 (_ BitVec 32) (_ BitVec 32) V!5993 V!5993 (_ BitVec 32) (_ BitVec 64) V!5993 (_ BitVec 32) Int) Unit!5916)

(assert (=> b!198955 (= lt!97982 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!12 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!263 (array!8741 array!8739 (_ BitVec 32) (_ BitVec 32) V!5993 V!5993 (_ BitVec 32) Int) ListLongMap!2535)

(assert (=> b!198955 (= lt!97981 (getCurrentListMapNoExtraKeys!263 _keys!825 (array!8740 (store (arr!4119 _values!649) i!601 (ValueCellFull!2036 v!520)) (size!4445 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198955 (= lt!97979 (getCurrentListMapNoExtraKeys!263 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198956 () Bool)

(declare-fun res!94456 () Bool)

(assert (=> b!198956 (=> (not res!94456) (not e!130649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198956 (= res!94456 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8207 () Bool)

(declare-fun tp!17740 () Bool)

(assert (=> mapNonEmpty!8207 (= mapRes!8207 (and tp!17740 e!130651))))

(declare-fun mapKey!8207 () (_ BitVec 32))

(declare-fun mapRest!8207 () (Array (_ BitVec 32) ValueCell!2036))

(declare-fun mapValue!8207 () ValueCell!2036)

(assert (=> mapNonEmpty!8207 (= (arr!4119 _values!649) (store mapRest!8207 mapKey!8207 mapValue!8207))))

(assert (= (and start!20248 res!94455) b!198953))

(assert (= (and b!198953 res!94452) b!198954))

(assert (= (and b!198954 res!94454) b!198951))

(assert (= (and b!198951 res!94457) b!198948))

(assert (= (and b!198948 res!94453) b!198956))

(assert (= (and b!198956 res!94456) b!198949))

(assert (= (and b!198949 res!94451) b!198955))

(assert (= (and b!198952 condMapEmpty!8207) mapIsEmpty!8207))

(assert (= (and b!198952 (not condMapEmpty!8207)) mapNonEmpty!8207))

(get-info :version)

(assert (= (and mapNonEmpty!8207 ((_ is ValueCellFull!2036) mapValue!8207)) b!198950))

(assert (= (and b!198952 ((_ is ValueCellFull!2036) mapDefault!8207)) b!198947))

(assert (= start!20248 b!198952))

(declare-fun m!224985 () Bool)

(assert (=> b!198954 m!224985))

(declare-fun m!224987 () Bool)

(assert (=> b!198956 m!224987))

(declare-fun m!224989 () Bool)

(assert (=> start!20248 m!224989))

(declare-fun m!224991 () Bool)

(assert (=> start!20248 m!224991))

(declare-fun m!224993 () Bool)

(assert (=> start!20248 m!224993))

(declare-fun m!224995 () Bool)

(assert (=> mapNonEmpty!8207 m!224995))

(declare-fun m!224997 () Bool)

(assert (=> b!198951 m!224997))

(declare-fun m!224999 () Bool)

(assert (=> b!198949 m!224999))

(declare-fun m!225001 () Bool)

(assert (=> b!198955 m!225001))

(declare-fun m!225003 () Bool)

(assert (=> b!198955 m!225003))

(declare-fun m!225005 () Bool)

(assert (=> b!198955 m!225005))

(declare-fun m!225007 () Bool)

(assert (=> b!198955 m!225007))

(declare-fun m!225009 () Bool)

(assert (=> b!198955 m!225009))

(check-sat (not b!198956) (not b_next!4903) (not mapNonEmpty!8207) (not b!198954) tp_is_empty!4759 (not b!198955) (not b!198951) b_and!11623 (not start!20248))
(check-sat b_and!11623 (not b_next!4903))
