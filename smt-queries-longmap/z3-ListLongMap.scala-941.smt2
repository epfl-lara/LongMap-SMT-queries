; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20746 () Bool)

(assert start!20746)

(declare-fun b_free!5401 () Bool)

(declare-fun b_next!5401 () Bool)

(assert (=> start!20746 (= b_free!5401 (not b_next!5401))))

(declare-fun tp!19235 () Bool)

(declare-fun b_and!12161 () Bool)

(assert (=> start!20746 (= tp!19235 b_and!12161)))

(declare-fun mapIsEmpty!8954 () Bool)

(declare-fun mapRes!8954 () Bool)

(assert (=> mapIsEmpty!8954 mapRes!8954))

(declare-fun b!207673 () Bool)

(declare-fun e!135545 () Bool)

(declare-fun tp_is_empty!5257 () Bool)

(assert (=> b!207673 (= e!135545 tp_is_empty!5257)))

(declare-fun b!207674 () Bool)

(declare-fun e!135548 () Bool)

(assert (=> b!207674 (= e!135548 tp_is_empty!5257)))

(declare-fun b!207676 () Bool)

(declare-fun res!100864 () Bool)

(declare-fun e!135546 () Bool)

(assert (=> b!207676 (=> (not res!100864) (not e!135546))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207676 (= res!100864 (validKeyInArray!0 k0!843))))

(declare-fun b!207677 () Bool)

(declare-fun res!100863 () Bool)

(assert (=> b!207677 (=> (not res!100863) (not e!135546))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9717 0))(
  ( (array!9718 (arr!4609 (Array (_ BitVec 32) (_ BitVec 64))) (size!4934 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9717)

(assert (=> b!207677 (= res!100863 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4934 _keys!825))))))

(declare-fun mapNonEmpty!8954 () Bool)

(declare-fun tp!19234 () Bool)

(assert (=> mapNonEmpty!8954 (= mapRes!8954 (and tp!19234 e!135548))))

(declare-datatypes ((V!6657 0))(
  ( (V!6658 (val!2673 Int)) )
))
(declare-datatypes ((ValueCell!2285 0))(
  ( (ValueCellFull!2285 (v!4644 V!6657)) (EmptyCell!2285) )
))
(declare-fun mapValue!8954 () ValueCell!2285)

(declare-fun mapKey!8954 () (_ BitVec 32))

(declare-datatypes ((array!9719 0))(
  ( (array!9720 (arr!4610 (Array (_ BitVec 32) ValueCell!2285)) (size!4935 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9719)

(declare-fun mapRest!8954 () (Array (_ BitVec 32) ValueCell!2285))

(assert (=> mapNonEmpty!8954 (= (arr!4610 _values!649) (store mapRest!8954 mapKey!8954 mapValue!8954))))

(declare-fun b!207678 () Bool)

(declare-fun res!100861 () Bool)

(assert (=> b!207678 (=> (not res!100861) (not e!135546))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9717 (_ BitVec 32)) Bool)

(assert (=> b!207678 (= res!100861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!100859 () Bool)

(assert (=> start!20746 (=> (not res!100859) (not e!135546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20746 (= res!100859 (validMask!0 mask!1149))))

(assert (=> start!20746 e!135546))

(declare-fun e!135544 () Bool)

(declare-fun array_inv!3017 (array!9719) Bool)

(assert (=> start!20746 (and (array_inv!3017 _values!649) e!135544)))

(assert (=> start!20746 true))

(assert (=> start!20746 tp_is_empty!5257))

(declare-fun array_inv!3018 (array!9717) Bool)

(assert (=> start!20746 (array_inv!3018 _keys!825)))

(assert (=> start!20746 tp!19235))

(declare-fun b!207675 () Bool)

(assert (=> b!207675 (= e!135546 (not true))))

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6657)

(declare-fun zeroValue!615 () V!6657)

(declare-datatypes ((tuple2!4000 0))(
  ( (tuple2!4001 (_1!2011 (_ BitVec 64)) (_2!2011 V!6657)) )
))
(declare-datatypes ((List!2889 0))(
  ( (Nil!2886) (Cons!2885 (h!3527 tuple2!4000) (t!7812 List!2889)) )
))
(declare-datatypes ((ListLongMap!2915 0))(
  ( (ListLongMap!2916 (toList!1473 List!2889)) )
))
(declare-fun lt!106471 () ListLongMap!2915)

(declare-fun getCurrentListMap!1043 (array!9717 array!9719 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) Int) ListLongMap!2915)

(assert (=> b!207675 (= lt!106471 (getCurrentListMap!1043 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106470 () array!9719)

(declare-fun lt!106473 () ListLongMap!2915)

(assert (=> b!207675 (= lt!106473 (getCurrentListMap!1043 _keys!825 lt!106470 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106474 () ListLongMap!2915)

(declare-fun lt!106469 () ListLongMap!2915)

(assert (=> b!207675 (and (= lt!106474 lt!106469) (= lt!106469 lt!106474))))

(declare-fun lt!106472 () ListLongMap!2915)

(declare-fun v!520 () V!6657)

(declare-fun +!527 (ListLongMap!2915 tuple2!4000) ListLongMap!2915)

(assert (=> b!207675 (= lt!106469 (+!527 lt!106472 (tuple2!4001 k0!843 v!520)))))

(declare-datatypes ((Unit!6330 0))(
  ( (Unit!6331) )
))
(declare-fun lt!106475 () Unit!6330)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!179 (array!9717 array!9719 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) (_ BitVec 64) V!6657 (_ BitVec 32) Int) Unit!6330)

(assert (=> b!207675 (= lt!106475 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!179 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!436 (array!9717 array!9719 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) Int) ListLongMap!2915)

(assert (=> b!207675 (= lt!106474 (getCurrentListMapNoExtraKeys!436 _keys!825 lt!106470 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207675 (= lt!106470 (array!9720 (store (arr!4610 _values!649) i!601 (ValueCellFull!2285 v!520)) (size!4935 _values!649)))))

(assert (=> b!207675 (= lt!106472 (getCurrentListMapNoExtraKeys!436 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207679 () Bool)

(declare-fun res!100858 () Bool)

(assert (=> b!207679 (=> (not res!100858) (not e!135546))))

(assert (=> b!207679 (= res!100858 (and (= (size!4935 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4934 _keys!825) (size!4935 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207680 () Bool)

(declare-fun res!100862 () Bool)

(assert (=> b!207680 (=> (not res!100862) (not e!135546))))

(declare-datatypes ((List!2890 0))(
  ( (Nil!2887) (Cons!2886 (h!3528 (_ BitVec 64)) (t!7813 List!2890)) )
))
(declare-fun arrayNoDuplicates!0 (array!9717 (_ BitVec 32) List!2890) Bool)

(assert (=> b!207680 (= res!100862 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2887))))

(declare-fun b!207681 () Bool)

(declare-fun res!100860 () Bool)

(assert (=> b!207681 (=> (not res!100860) (not e!135546))))

(assert (=> b!207681 (= res!100860 (= (select (arr!4609 _keys!825) i!601) k0!843))))

(declare-fun b!207682 () Bool)

(assert (=> b!207682 (= e!135544 (and e!135545 mapRes!8954))))

(declare-fun condMapEmpty!8954 () Bool)

(declare-fun mapDefault!8954 () ValueCell!2285)

(assert (=> b!207682 (= condMapEmpty!8954 (= (arr!4610 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2285)) mapDefault!8954)))))

(assert (= (and start!20746 res!100859) b!207679))

(assert (= (and b!207679 res!100858) b!207678))

(assert (= (and b!207678 res!100861) b!207680))

(assert (= (and b!207680 res!100862) b!207677))

(assert (= (and b!207677 res!100863) b!207676))

(assert (= (and b!207676 res!100864) b!207681))

(assert (= (and b!207681 res!100860) b!207675))

(assert (= (and b!207682 condMapEmpty!8954) mapIsEmpty!8954))

(assert (= (and b!207682 (not condMapEmpty!8954)) mapNonEmpty!8954))

(get-info :version)

(assert (= (and mapNonEmpty!8954 ((_ is ValueCellFull!2285) mapValue!8954)) b!207674))

(assert (= (and b!207682 ((_ is ValueCellFull!2285) mapDefault!8954)) b!207673))

(assert (= start!20746 b!207682))

(declare-fun m!235551 () Bool)

(assert (=> b!207681 m!235551))

(declare-fun m!235553 () Bool)

(assert (=> b!207678 m!235553))

(declare-fun m!235555 () Bool)

(assert (=> b!207675 m!235555))

(declare-fun m!235557 () Bool)

(assert (=> b!207675 m!235557))

(declare-fun m!235559 () Bool)

(assert (=> b!207675 m!235559))

(declare-fun m!235561 () Bool)

(assert (=> b!207675 m!235561))

(declare-fun m!235563 () Bool)

(assert (=> b!207675 m!235563))

(declare-fun m!235565 () Bool)

(assert (=> b!207675 m!235565))

(declare-fun m!235567 () Bool)

(assert (=> b!207675 m!235567))

(declare-fun m!235569 () Bool)

(assert (=> b!207676 m!235569))

(declare-fun m!235571 () Bool)

(assert (=> b!207680 m!235571))

(declare-fun m!235573 () Bool)

(assert (=> mapNonEmpty!8954 m!235573))

(declare-fun m!235575 () Bool)

(assert (=> start!20746 m!235575))

(declare-fun m!235577 () Bool)

(assert (=> start!20746 m!235577))

(declare-fun m!235579 () Bool)

(assert (=> start!20746 m!235579))

(check-sat (not start!20746) (not b!207676) tp_is_empty!5257 (not b!207675) (not b!207678) (not mapNonEmpty!8954) (not b_next!5401) (not b!207680) b_and!12161)
(check-sat b_and!12161 (not b_next!5401))
