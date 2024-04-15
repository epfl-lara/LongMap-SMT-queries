; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20734 () Bool)

(assert start!20734)

(declare-fun b_free!5389 () Bool)

(declare-fun b_next!5389 () Bool)

(assert (=> start!20734 (= b_free!5389 (not b_next!5389))))

(declare-fun tp!19198 () Bool)

(declare-fun b_and!12109 () Bool)

(assert (=> start!20734 (= tp!19198 b_and!12109)))

(declare-fun b!207299 () Bool)

(declare-fun e!135332 () Bool)

(declare-fun tp_is_empty!5245 () Bool)

(assert (=> b!207299 (= e!135332 tp_is_empty!5245)))

(declare-fun b!207300 () Bool)

(declare-fun res!100619 () Bool)

(declare-fun e!135330 () Bool)

(assert (=> b!207300 (=> (not res!100619) (not e!135330))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9685 0))(
  ( (array!9686 (arr!4592 (Array (_ BitVec 32) (_ BitVec 64))) (size!4918 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9685)

(assert (=> b!207300 (= res!100619 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4918 _keys!825))))))

(declare-fun b!207301 () Bool)

(declare-fun res!100617 () Bool)

(assert (=> b!207301 (=> (not res!100617) (not e!135330))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207301 (= res!100617 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8936 () Bool)

(declare-fun mapRes!8936 () Bool)

(declare-fun tp!19199 () Bool)

(declare-fun e!135329 () Bool)

(assert (=> mapNonEmpty!8936 (= mapRes!8936 (and tp!19199 e!135329))))

(declare-datatypes ((V!6641 0))(
  ( (V!6642 (val!2667 Int)) )
))
(declare-datatypes ((ValueCell!2279 0))(
  ( (ValueCellFull!2279 (v!4631 V!6641)) (EmptyCell!2279) )
))
(declare-fun mapRest!8936 () (Array (_ BitVec 32) ValueCell!2279))

(declare-datatypes ((array!9687 0))(
  ( (array!9688 (arr!4593 (Array (_ BitVec 32) ValueCell!2279)) (size!4919 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9687)

(declare-fun mapValue!8936 () ValueCell!2279)

(declare-fun mapKey!8936 () (_ BitVec 32))

(assert (=> mapNonEmpty!8936 (= (arr!4593 _values!649) (store mapRest!8936 mapKey!8936 mapValue!8936))))

(declare-fun res!100618 () Bool)

(assert (=> start!20734 (=> (not res!100618) (not e!135330))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20734 (= res!100618 (validMask!0 mask!1149))))

(assert (=> start!20734 e!135330))

(declare-fun e!135333 () Bool)

(declare-fun array_inv!3019 (array!9687) Bool)

(assert (=> start!20734 (and (array_inv!3019 _values!649) e!135333)))

(assert (=> start!20734 true))

(assert (=> start!20734 tp_is_empty!5245))

(declare-fun array_inv!3020 (array!9685) Bool)

(assert (=> start!20734 (array_inv!3020 _keys!825)))

(assert (=> start!20734 tp!19198))

(declare-fun b!207302 () Bool)

(assert (=> b!207302 (= e!135333 (and e!135332 mapRes!8936))))

(declare-fun condMapEmpty!8936 () Bool)

(declare-fun mapDefault!8936 () ValueCell!2279)

(assert (=> b!207302 (= condMapEmpty!8936 (= (arr!4593 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2279)) mapDefault!8936)))))

(declare-fun b!207303 () Bool)

(declare-fun res!100621 () Bool)

(assert (=> b!207303 (=> (not res!100621) (not e!135330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9685 (_ BitVec 32)) Bool)

(assert (=> b!207303 (= res!100621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207304 () Bool)

(declare-fun res!100616 () Bool)

(assert (=> b!207304 (=> (not res!100616) (not e!135330))))

(declare-datatypes ((List!2930 0))(
  ( (Nil!2927) (Cons!2926 (h!3568 (_ BitVec 64)) (t!7852 List!2930)) )
))
(declare-fun arrayNoDuplicates!0 (array!9685 (_ BitVec 32) List!2930) Bool)

(assert (=> b!207304 (= res!100616 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2927))))

(declare-fun b!207305 () Bool)

(assert (=> b!207305 (= e!135329 tp_is_empty!5245)))

(declare-fun b!207306 () Bool)

(assert (=> b!207306 (= e!135330 (not true))))

(declare-datatypes ((tuple2!4026 0))(
  ( (tuple2!4027 (_1!2024 (_ BitVec 64)) (_2!2024 V!6641)) )
))
(declare-datatypes ((List!2931 0))(
  ( (Nil!2928) (Cons!2927 (h!3569 tuple2!4026) (t!7853 List!2931)) )
))
(declare-datatypes ((ListLongMap!2929 0))(
  ( (ListLongMap!2930 (toList!1480 List!2931)) )
))
(declare-fun lt!106109 () ListLongMap!2929)

(declare-fun zeroValue!615 () V!6641)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6641)

(declare-fun getCurrentListMap!1021 (array!9685 array!9687 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) Int) ListLongMap!2929)

(assert (=> b!207306 (= lt!106109 (getCurrentListMap!1021 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106107 () ListLongMap!2929)

(declare-fun lt!106108 () array!9687)

(assert (=> b!207306 (= lt!106107 (getCurrentListMap!1021 _keys!825 lt!106108 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106103 () ListLongMap!2929)

(declare-fun lt!106106 () ListLongMap!2929)

(assert (=> b!207306 (and (= lt!106103 lt!106106) (= lt!106106 lt!106103))))

(declare-fun lt!106104 () ListLongMap!2929)

(declare-fun v!520 () V!6641)

(declare-fun +!529 (ListLongMap!2929 tuple2!4026) ListLongMap!2929)

(assert (=> b!207306 (= lt!106106 (+!529 lt!106104 (tuple2!4027 k0!843 v!520)))))

(declare-datatypes ((Unit!6298 0))(
  ( (Unit!6299) )
))
(declare-fun lt!106105 () Unit!6298)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!180 (array!9685 array!9687 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) (_ BitVec 64) V!6641 (_ BitVec 32) Int) Unit!6298)

(assert (=> b!207306 (= lt!106105 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!180 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!431 (array!9685 array!9687 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) Int) ListLongMap!2929)

(assert (=> b!207306 (= lt!106103 (getCurrentListMapNoExtraKeys!431 _keys!825 lt!106108 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207306 (= lt!106108 (array!9688 (store (arr!4593 _values!649) i!601 (ValueCellFull!2279 v!520)) (size!4919 _values!649)))))

(assert (=> b!207306 (= lt!106104 (getCurrentListMapNoExtraKeys!431 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207307 () Bool)

(declare-fun res!100620 () Bool)

(assert (=> b!207307 (=> (not res!100620) (not e!135330))))

(assert (=> b!207307 (= res!100620 (and (= (size!4919 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4918 _keys!825) (size!4919 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8936 () Bool)

(assert (=> mapIsEmpty!8936 mapRes!8936))

(declare-fun b!207308 () Bool)

(declare-fun res!100622 () Bool)

(assert (=> b!207308 (=> (not res!100622) (not e!135330))))

(assert (=> b!207308 (= res!100622 (= (select (arr!4592 _keys!825) i!601) k0!843))))

(assert (= (and start!20734 res!100618) b!207307))

(assert (= (and b!207307 res!100620) b!207303))

(assert (= (and b!207303 res!100621) b!207304))

(assert (= (and b!207304 res!100616) b!207300))

(assert (= (and b!207300 res!100619) b!207301))

(assert (= (and b!207301 res!100617) b!207308))

(assert (= (and b!207308 res!100622) b!207306))

(assert (= (and b!207302 condMapEmpty!8936) mapIsEmpty!8936))

(assert (= (and b!207302 (not condMapEmpty!8936)) mapNonEmpty!8936))

(get-info :version)

(assert (= (and mapNonEmpty!8936 ((_ is ValueCellFull!2279) mapValue!8936)) b!207305))

(assert (= (and b!207302 ((_ is ValueCellFull!2279) mapDefault!8936)) b!207299))

(assert (= start!20734 b!207302))

(declare-fun m!234573 () Bool)

(assert (=> mapNonEmpty!8936 m!234573))

(declare-fun m!234575 () Bool)

(assert (=> b!207304 m!234575))

(declare-fun m!234577 () Bool)

(assert (=> start!20734 m!234577))

(declare-fun m!234579 () Bool)

(assert (=> start!20734 m!234579))

(declare-fun m!234581 () Bool)

(assert (=> start!20734 m!234581))

(declare-fun m!234583 () Bool)

(assert (=> b!207306 m!234583))

(declare-fun m!234585 () Bool)

(assert (=> b!207306 m!234585))

(declare-fun m!234587 () Bool)

(assert (=> b!207306 m!234587))

(declare-fun m!234589 () Bool)

(assert (=> b!207306 m!234589))

(declare-fun m!234591 () Bool)

(assert (=> b!207306 m!234591))

(declare-fun m!234593 () Bool)

(assert (=> b!207306 m!234593))

(declare-fun m!234595 () Bool)

(assert (=> b!207306 m!234595))

(declare-fun m!234597 () Bool)

(assert (=> b!207301 m!234597))

(declare-fun m!234599 () Bool)

(assert (=> b!207308 m!234599))

(declare-fun m!234601 () Bool)

(assert (=> b!207303 m!234601))

(check-sat (not b_next!5389) (not b!207304) b_and!12109 tp_is_empty!5245 (not start!20734) (not b!207301) (not b!207306) (not b!207303) (not mapNonEmpty!8936))
(check-sat b_and!12109 (not b_next!5389))
