; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20638 () Bool)

(assert start!20638)

(declare-fun b_free!5293 () Bool)

(declare-fun b_next!5293 () Bool)

(assert (=> start!20638 (= b_free!5293 (not b_next!5293))))

(declare-fun tp!18911 () Bool)

(declare-fun b_and!12013 () Bool)

(assert (=> start!20638 (= tp!18911 b_and!12013)))

(declare-fun res!99527 () Bool)

(declare-fun e!134524 () Bool)

(assert (=> start!20638 (=> (not res!99527) (not e!134524))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20638 (= res!99527 (validMask!0 mask!1149))))

(assert (=> start!20638 e!134524))

(declare-datatypes ((V!6513 0))(
  ( (V!6514 (val!2619 Int)) )
))
(declare-datatypes ((ValueCell!2231 0))(
  ( (ValueCellFull!2231 (v!4583 V!6513)) (EmptyCell!2231) )
))
(declare-datatypes ((array!9495 0))(
  ( (array!9496 (arr!4497 (Array (_ BitVec 32) ValueCell!2231)) (size!4823 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9495)

(declare-fun e!134526 () Bool)

(declare-fun array_inv!2957 (array!9495) Bool)

(assert (=> start!20638 (and (array_inv!2957 _values!649) e!134526)))

(assert (=> start!20638 true))

(declare-fun tp_is_empty!5149 () Bool)

(assert (=> start!20638 tp_is_empty!5149))

(declare-datatypes ((array!9497 0))(
  ( (array!9498 (arr!4498 (Array (_ BitVec 32) (_ BitVec 64))) (size!4824 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9497)

(declare-fun array_inv!2958 (array!9497) Bool)

(assert (=> start!20638 (array_inv!2958 _keys!825)))

(assert (=> start!20638 tp!18911))

(declare-fun b!205773 () Bool)

(declare-fun e!134529 () Bool)

(declare-fun e!134525 () Bool)

(assert (=> b!205773 (= e!134529 e!134525)))

(declare-fun res!99522 () Bool)

(assert (=> b!205773 (=> res!99522 e!134525)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205773 (= res!99522 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3958 0))(
  ( (tuple2!3959 (_1!1990 (_ BitVec 64)) (_2!1990 V!6513)) )
))
(declare-datatypes ((List!2860 0))(
  ( (Nil!2857) (Cons!2856 (h!3498 tuple2!3958) (t!7782 List!2860)) )
))
(declare-datatypes ((ListLongMap!2861 0))(
  ( (ListLongMap!2862 (toList!1446 List!2860)) )
))
(declare-fun lt!104873 () ListLongMap!2861)

(declare-fun lt!104874 () ListLongMap!2861)

(assert (=> b!205773 (= lt!104873 lt!104874)))

(declare-fun lt!104879 () ListLongMap!2861)

(declare-fun lt!104881 () tuple2!3958)

(declare-fun +!495 (ListLongMap!2861 tuple2!3958) ListLongMap!2861)

(assert (=> b!205773 (= lt!104874 (+!495 lt!104879 lt!104881))))

(declare-fun lt!104872 () ListLongMap!2861)

(declare-fun lt!104877 () ListLongMap!2861)

(assert (=> b!205773 (= lt!104872 lt!104877)))

(declare-fun lt!104878 () ListLongMap!2861)

(assert (=> b!205773 (= lt!104877 (+!495 lt!104878 lt!104881))))

(declare-fun lt!104871 () ListLongMap!2861)

(assert (=> b!205773 (= lt!104872 (+!495 lt!104871 lt!104881))))

(declare-fun minValue!615 () V!6513)

(assert (=> b!205773 (= lt!104881 (tuple2!3959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205774 () Bool)

(assert (=> b!205774 (= e!134525 true)))

(declare-fun lt!104882 () tuple2!3958)

(assert (=> b!205774 (= lt!104877 (+!495 lt!104874 lt!104882))))

(declare-fun v!520 () V!6513)

(declare-datatypes ((Unit!6230 0))(
  ( (Unit!6231) )
))
(declare-fun lt!104876 () Unit!6230)

(declare-fun addCommutativeForDiffKeys!181 (ListLongMap!2861 (_ BitVec 64) V!6513 (_ BitVec 64) V!6513) Unit!6230)

(assert (=> b!205774 (= lt!104876 (addCommutativeForDiffKeys!181 lt!104879 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205775 () Bool)

(declare-fun e!134527 () Bool)

(declare-fun mapRes!8792 () Bool)

(assert (=> b!205775 (= e!134526 (and e!134527 mapRes!8792))))

(declare-fun condMapEmpty!8792 () Bool)

(declare-fun mapDefault!8792 () ValueCell!2231)

(assert (=> b!205775 (= condMapEmpty!8792 (= (arr!4497 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2231)) mapDefault!8792)))))

(declare-fun b!205776 () Bool)

(declare-fun res!99524 () Bool)

(assert (=> b!205776 (=> (not res!99524) (not e!134524))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205776 (= res!99524 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4824 _keys!825))))))

(declare-fun b!205777 () Bool)

(declare-fun e!134523 () Bool)

(assert (=> b!205777 (= e!134523 tp_is_empty!5149)))

(declare-fun mapNonEmpty!8792 () Bool)

(declare-fun tp!18910 () Bool)

(assert (=> mapNonEmpty!8792 (= mapRes!8792 (and tp!18910 e!134523))))

(declare-fun mapKey!8792 () (_ BitVec 32))

(declare-fun mapValue!8792 () ValueCell!2231)

(declare-fun mapRest!8792 () (Array (_ BitVec 32) ValueCell!2231))

(assert (=> mapNonEmpty!8792 (= (arr!4497 _values!649) (store mapRest!8792 mapKey!8792 mapValue!8792))))

(declare-fun b!205778 () Bool)

(assert (=> b!205778 (= e!134527 tp_is_empty!5149)))

(declare-fun b!205779 () Bool)

(declare-fun res!99523 () Bool)

(assert (=> b!205779 (=> (not res!99523) (not e!134524))))

(declare-datatypes ((List!2861 0))(
  ( (Nil!2858) (Cons!2857 (h!3499 (_ BitVec 64)) (t!7783 List!2861)) )
))
(declare-fun arrayNoDuplicates!0 (array!9497 (_ BitVec 32) List!2861) Bool)

(assert (=> b!205779 (= res!99523 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2858))))

(declare-fun mapIsEmpty!8792 () Bool)

(assert (=> mapIsEmpty!8792 mapRes!8792))

(declare-fun b!205780 () Bool)

(declare-fun res!99526 () Bool)

(assert (=> b!205780 (=> (not res!99526) (not e!134524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9497 (_ BitVec 32)) Bool)

(assert (=> b!205780 (= res!99526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205781 () Bool)

(declare-fun res!99529 () Bool)

(assert (=> b!205781 (=> (not res!99529) (not e!134524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205781 (= res!99529 (validKeyInArray!0 k0!843))))

(declare-fun b!205782 () Bool)

(assert (=> b!205782 (= e!134524 (not e!134529))))

(declare-fun res!99530 () Bool)

(assert (=> b!205782 (=> res!99530 e!134529)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205782 (= res!99530 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6513)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!989 (array!9497 array!9495 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) Int) ListLongMap!2861)

(assert (=> b!205782 (= lt!104873 (getCurrentListMap!989 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104875 () array!9495)

(assert (=> b!205782 (= lt!104872 (getCurrentListMap!989 _keys!825 lt!104875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205782 (and (= lt!104871 lt!104878) (= lt!104878 lt!104871))))

(assert (=> b!205782 (= lt!104878 (+!495 lt!104879 lt!104882))))

(assert (=> b!205782 (= lt!104882 (tuple2!3959 k0!843 v!520))))

(declare-fun lt!104880 () Unit!6230)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!148 (array!9497 array!9495 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) (_ BitVec 64) V!6513 (_ BitVec 32) Int) Unit!6230)

(assert (=> b!205782 (= lt!104880 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!148 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!399 (array!9497 array!9495 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) Int) ListLongMap!2861)

(assert (=> b!205782 (= lt!104871 (getCurrentListMapNoExtraKeys!399 _keys!825 lt!104875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205782 (= lt!104875 (array!9496 (store (arr!4497 _values!649) i!601 (ValueCellFull!2231 v!520)) (size!4823 _values!649)))))

(assert (=> b!205782 (= lt!104879 (getCurrentListMapNoExtraKeys!399 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205783 () Bool)

(declare-fun res!99528 () Bool)

(assert (=> b!205783 (=> (not res!99528) (not e!134524))))

(assert (=> b!205783 (= res!99528 (and (= (size!4823 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4824 _keys!825) (size!4823 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205784 () Bool)

(declare-fun res!99525 () Bool)

(assert (=> b!205784 (=> (not res!99525) (not e!134524))))

(assert (=> b!205784 (= res!99525 (= (select (arr!4498 _keys!825) i!601) k0!843))))

(assert (= (and start!20638 res!99527) b!205783))

(assert (= (and b!205783 res!99528) b!205780))

(assert (= (and b!205780 res!99526) b!205779))

(assert (= (and b!205779 res!99523) b!205776))

(assert (= (and b!205776 res!99524) b!205781))

(assert (= (and b!205781 res!99529) b!205784))

(assert (= (and b!205784 res!99525) b!205782))

(assert (= (and b!205782 (not res!99530)) b!205773))

(assert (= (and b!205773 (not res!99522)) b!205774))

(assert (= (and b!205775 condMapEmpty!8792) mapIsEmpty!8792))

(assert (= (and b!205775 (not condMapEmpty!8792)) mapNonEmpty!8792))

(get-info :version)

(assert (= (and mapNonEmpty!8792 ((_ is ValueCellFull!2231) mapValue!8792)) b!205777))

(assert (= (and b!205775 ((_ is ValueCellFull!2231) mapDefault!8792)) b!205778))

(assert (= start!20638 b!205775))

(declare-fun m!232983 () Bool)

(assert (=> start!20638 m!232983))

(declare-fun m!232985 () Bool)

(assert (=> start!20638 m!232985))

(declare-fun m!232987 () Bool)

(assert (=> start!20638 m!232987))

(declare-fun m!232989 () Bool)

(assert (=> b!205774 m!232989))

(declare-fun m!232991 () Bool)

(assert (=> b!205774 m!232991))

(declare-fun m!232993 () Bool)

(assert (=> b!205773 m!232993))

(declare-fun m!232995 () Bool)

(assert (=> b!205773 m!232995))

(declare-fun m!232997 () Bool)

(assert (=> b!205773 m!232997))

(declare-fun m!232999 () Bool)

(assert (=> b!205779 m!232999))

(declare-fun m!233001 () Bool)

(assert (=> b!205782 m!233001))

(declare-fun m!233003 () Bool)

(assert (=> b!205782 m!233003))

(declare-fun m!233005 () Bool)

(assert (=> b!205782 m!233005))

(declare-fun m!233007 () Bool)

(assert (=> b!205782 m!233007))

(declare-fun m!233009 () Bool)

(assert (=> b!205782 m!233009))

(declare-fun m!233011 () Bool)

(assert (=> b!205782 m!233011))

(declare-fun m!233013 () Bool)

(assert (=> b!205782 m!233013))

(declare-fun m!233015 () Bool)

(assert (=> b!205781 m!233015))

(declare-fun m!233017 () Bool)

(assert (=> b!205780 m!233017))

(declare-fun m!233019 () Bool)

(assert (=> b!205784 m!233019))

(declare-fun m!233021 () Bool)

(assert (=> mapNonEmpty!8792 m!233021))

(check-sat (not b!205780) tp_is_empty!5149 (not mapNonEmpty!8792) (not b!205781) (not b_next!5293) (not start!20638) (not b!205779) (not b!205773) b_and!12013 (not b!205782) (not b!205774))
(check-sat b_and!12013 (not b_next!5293))
