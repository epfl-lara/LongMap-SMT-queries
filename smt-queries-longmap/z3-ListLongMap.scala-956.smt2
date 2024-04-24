; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20836 () Bool)

(assert start!20836)

(declare-fun b_free!5485 () Bool)

(declare-fun b_next!5485 () Bool)

(assert (=> start!20836 (= b_free!5485 (not b_next!5485))))

(declare-fun tp!19495 () Bool)

(declare-fun b_and!12245 () Bool)

(assert (=> start!20836 (= tp!19495 b_and!12245)))

(declare-fun b!208987 () Bool)

(declare-fun res!101769 () Bool)

(declare-fun e!136222 () Bool)

(assert (=> b!208987 (=> (not res!101769) (not e!136222))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6777 0))(
  ( (V!6778 (val!2718 Int)) )
))
(declare-datatypes ((ValueCell!2330 0))(
  ( (ValueCellFull!2330 (v!4689 V!6777)) (EmptyCell!2330) )
))
(declare-datatypes ((array!9889 0))(
  ( (array!9890 (arr!4695 (Array (_ BitVec 32) ValueCell!2330)) (size!5020 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9889)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9891 0))(
  ( (array!9892 (arr!4696 (Array (_ BitVec 32) (_ BitVec 64))) (size!5021 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9891)

(assert (=> b!208987 (= res!101769 (and (= (size!5020 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5021 _keys!825) (size!5020 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208989 () Bool)

(declare-fun res!101768 () Bool)

(assert (=> b!208989 (=> (not res!101768) (not e!136222))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208989 (= res!101768 (= (select (arr!4696 _keys!825) i!601) k0!843))))

(declare-fun b!208990 () Bool)

(declare-fun res!101770 () Bool)

(assert (=> b!208990 (=> (not res!101770) (not e!136222))))

(declare-datatypes ((List!2940 0))(
  ( (Nil!2937) (Cons!2936 (h!3578 (_ BitVec 64)) (t!7863 List!2940)) )
))
(declare-fun arrayNoDuplicates!0 (array!9891 (_ BitVec 32) List!2940) Bool)

(assert (=> b!208990 (= res!101770 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2937))))

(declare-fun b!208991 () Bool)

(assert (=> b!208991 (= e!136222 false)))

(declare-datatypes ((tuple2!4054 0))(
  ( (tuple2!4055 (_1!2038 (_ BitVec 64)) (_2!2038 V!6777)) )
))
(declare-datatypes ((List!2941 0))(
  ( (Nil!2938) (Cons!2937 (h!3579 tuple2!4054) (t!7864 List!2941)) )
))
(declare-datatypes ((ListLongMap!2969 0))(
  ( (ListLongMap!2970 (toList!1500 List!2941)) )
))
(declare-fun lt!106945 () ListLongMap!2969)

(declare-fun v!520 () V!6777)

(declare-fun zeroValue!615 () V!6777)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6777)

(declare-fun getCurrentListMapNoExtraKeys!463 (array!9891 array!9889 (_ BitVec 32) (_ BitVec 32) V!6777 V!6777 (_ BitVec 32) Int) ListLongMap!2969)

(assert (=> b!208991 (= lt!106945 (getCurrentListMapNoExtraKeys!463 _keys!825 (array!9890 (store (arr!4695 _values!649) i!601 (ValueCellFull!2330 v!520)) (size!5020 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106946 () ListLongMap!2969)

(assert (=> b!208991 (= lt!106946 (getCurrentListMapNoExtraKeys!463 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208992 () Bool)

(declare-fun res!101772 () Bool)

(assert (=> b!208992 (=> (not res!101772) (not e!136222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9891 (_ BitVec 32)) Bool)

(assert (=> b!208992 (= res!101772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208993 () Bool)

(declare-fun res!101771 () Bool)

(assert (=> b!208993 (=> (not res!101771) (not e!136222))))

(assert (=> b!208993 (= res!101771 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5021 _keys!825))))))

(declare-fun b!208994 () Bool)

(declare-fun e!136219 () Bool)

(declare-fun tp_is_empty!5347 () Bool)

(assert (=> b!208994 (= e!136219 tp_is_empty!5347)))

(declare-fun b!208995 () Bool)

(declare-fun res!101773 () Bool)

(assert (=> b!208995 (=> (not res!101773) (not e!136222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208995 (= res!101773 (validKeyInArray!0 k0!843))))

(declare-fun b!208996 () Bool)

(declare-fun e!136221 () Bool)

(declare-fun mapRes!9089 () Bool)

(assert (=> b!208996 (= e!136221 (and e!136219 mapRes!9089))))

(declare-fun condMapEmpty!9089 () Bool)

(declare-fun mapDefault!9089 () ValueCell!2330)

(assert (=> b!208996 (= condMapEmpty!9089 (= (arr!4695 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2330)) mapDefault!9089)))))

(declare-fun res!101767 () Bool)

(assert (=> start!20836 (=> (not res!101767) (not e!136222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20836 (= res!101767 (validMask!0 mask!1149))))

(assert (=> start!20836 e!136222))

(declare-fun array_inv!3077 (array!9889) Bool)

(assert (=> start!20836 (and (array_inv!3077 _values!649) e!136221)))

(assert (=> start!20836 true))

(assert (=> start!20836 tp_is_empty!5347))

(declare-fun array_inv!3078 (array!9891) Bool)

(assert (=> start!20836 (array_inv!3078 _keys!825)))

(assert (=> start!20836 tp!19495))

(declare-fun b!208988 () Bool)

(declare-fun e!136220 () Bool)

(assert (=> b!208988 (= e!136220 tp_is_empty!5347)))

(declare-fun mapIsEmpty!9089 () Bool)

(assert (=> mapIsEmpty!9089 mapRes!9089))

(declare-fun mapNonEmpty!9089 () Bool)

(declare-fun tp!19496 () Bool)

(assert (=> mapNonEmpty!9089 (= mapRes!9089 (and tp!19496 e!136220))))

(declare-fun mapValue!9089 () ValueCell!2330)

(declare-fun mapKey!9089 () (_ BitVec 32))

(declare-fun mapRest!9089 () (Array (_ BitVec 32) ValueCell!2330))

(assert (=> mapNonEmpty!9089 (= (arr!4695 _values!649) (store mapRest!9089 mapKey!9089 mapValue!9089))))

(assert (= (and start!20836 res!101767) b!208987))

(assert (= (and b!208987 res!101769) b!208992))

(assert (= (and b!208992 res!101772) b!208990))

(assert (= (and b!208990 res!101770) b!208993))

(assert (= (and b!208993 res!101771) b!208995))

(assert (= (and b!208995 res!101773) b!208989))

(assert (= (and b!208989 res!101768) b!208991))

(assert (= (and b!208996 condMapEmpty!9089) mapIsEmpty!9089))

(assert (= (and b!208996 (not condMapEmpty!9089)) mapNonEmpty!9089))

(get-info :version)

(assert (= (and mapNonEmpty!9089 ((_ is ValueCellFull!2330) mapValue!9089)) b!208988))

(assert (= (and b!208996 ((_ is ValueCellFull!2330) mapDefault!9089)) b!208994))

(assert (= start!20836 b!208996))

(declare-fun m!236619 () Bool)

(assert (=> b!208992 m!236619))

(declare-fun m!236621 () Bool)

(assert (=> b!208991 m!236621))

(declare-fun m!236623 () Bool)

(assert (=> b!208991 m!236623))

(declare-fun m!236625 () Bool)

(assert (=> b!208991 m!236625))

(declare-fun m!236627 () Bool)

(assert (=> b!208990 m!236627))

(declare-fun m!236629 () Bool)

(assert (=> b!208995 m!236629))

(declare-fun m!236631 () Bool)

(assert (=> start!20836 m!236631))

(declare-fun m!236633 () Bool)

(assert (=> start!20836 m!236633))

(declare-fun m!236635 () Bool)

(assert (=> start!20836 m!236635))

(declare-fun m!236637 () Bool)

(assert (=> mapNonEmpty!9089 m!236637))

(declare-fun m!236639 () Bool)

(assert (=> b!208989 m!236639))

(check-sat (not b!208995) tp_is_empty!5347 (not mapNonEmpty!9089) (not b!208990) b_and!12245 (not b!208992) (not b_next!5485) (not start!20836) (not b!208991))
(check-sat b_and!12245 (not b_next!5485))
