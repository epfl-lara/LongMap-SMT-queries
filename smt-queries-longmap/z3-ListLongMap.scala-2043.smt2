; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35428 () Bool)

(assert start!35428)

(declare-fun b_free!7815 () Bool)

(declare-fun b_next!7815 () Bool)

(assert (=> start!35428 (= b_free!7815 (not b_next!7815))))

(declare-fun tp!27230 () Bool)

(declare-fun b_and!15057 () Bool)

(assert (=> start!35428 (= tp!27230 b_and!15057)))

(declare-fun b!354668 () Bool)

(declare-fun res!196609 () Bool)

(declare-fun e!217404 () Bool)

(assert (=> b!354668 (=> (not res!196609) (not e!217404))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19343 0))(
  ( (array!19344 (arr!9165 (Array (_ BitVec 32) (_ BitVec 64))) (size!9517 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19343)

(declare-datatypes ((V!11485 0))(
  ( (V!11486 (val!3985 Int)) )
))
(declare-datatypes ((ValueCell!3597 0))(
  ( (ValueCellFull!3597 (v!6179 V!11485)) (EmptyCell!3597) )
))
(declare-datatypes ((array!19345 0))(
  ( (array!19346 (arr!9166 (Array (_ BitVec 32) ValueCell!3597)) (size!9518 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19345)

(assert (=> b!354668 (= res!196609 (and (= (size!9518 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9517 _keys!1456) (size!9518 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354669 () Bool)

(declare-fun res!196615 () Bool)

(assert (=> b!354669 (=> (not res!196615) (not e!217404))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!354669 (= res!196615 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9517 _keys!1456))))))

(declare-fun b!354670 () Bool)

(declare-fun e!217405 () Bool)

(declare-fun tp_is_empty!7881 () Bool)

(assert (=> b!354670 (= e!217405 tp_is_empty!7881)))

(declare-fun b!354671 () Bool)

(declare-fun res!196613 () Bool)

(assert (=> b!354671 (=> (not res!196613) (not e!217404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19343 (_ BitVec 32)) Bool)

(assert (=> b!354671 (= res!196613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196611 () Bool)

(assert (=> start!35428 (=> (not res!196611) (not e!217404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35428 (= res!196611 (validMask!0 mask!1842))))

(assert (=> start!35428 e!217404))

(assert (=> start!35428 tp_is_empty!7881))

(assert (=> start!35428 true))

(assert (=> start!35428 tp!27230))

(declare-fun array_inv!6738 (array!19343) Bool)

(assert (=> start!35428 (array_inv!6738 _keys!1456)))

(declare-fun e!217402 () Bool)

(declare-fun array_inv!6739 (array!19345) Bool)

(assert (=> start!35428 (and (array_inv!6739 _values!1208) e!217402)))

(declare-fun b!354672 () Bool)

(declare-fun e!217406 () Bool)

(assert (=> b!354672 (= e!217406 tp_is_empty!7881)))

(declare-fun b!354673 () Bool)

(declare-fun res!196612 () Bool)

(assert (=> b!354673 (=> (not res!196612) (not e!217404))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!354673 (= res!196612 (= (select (arr!9165 _keys!1456) from!1805) k0!1077))))

(declare-fun mapIsEmpty!13329 () Bool)

(declare-fun mapRes!13329 () Bool)

(assert (=> mapIsEmpty!13329 mapRes!13329))

(declare-fun b!354674 () Bool)

(declare-fun res!196610 () Bool)

(assert (=> b!354674 (=> (not res!196610) (not e!217404))))

(declare-datatypes ((List!5305 0))(
  ( (Nil!5302) (Cons!5301 (h!6157 (_ BitVec 64)) (t!10455 List!5305)) )
))
(declare-fun arrayNoDuplicates!0 (array!19343 (_ BitVec 32) List!5305) Bool)

(assert (=> b!354674 (= res!196610 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5302))))

(declare-fun mapNonEmpty!13329 () Bool)

(declare-fun tp!27231 () Bool)

(assert (=> mapNonEmpty!13329 (= mapRes!13329 (and tp!27231 e!217405))))

(declare-fun mapValue!13329 () ValueCell!3597)

(declare-fun mapRest!13329 () (Array (_ BitVec 32) ValueCell!3597))

(declare-fun mapKey!13329 () (_ BitVec 32))

(assert (=> mapNonEmpty!13329 (= (arr!9166 _values!1208) (store mapRest!13329 mapKey!13329 mapValue!13329))))

(declare-fun b!354675 () Bool)

(assert (=> b!354675 (= e!217402 (and e!217406 mapRes!13329))))

(declare-fun condMapEmpty!13329 () Bool)

(declare-fun mapDefault!13329 () ValueCell!3597)

(assert (=> b!354675 (= condMapEmpty!13329 (= (arr!9166 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3597)) mapDefault!13329)))))

(declare-fun b!354676 () Bool)

(declare-fun res!196607 () Bool)

(assert (=> b!354676 (=> (not res!196607) (not e!217404))))

(declare-fun arrayContainsKey!0 (array!19343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354676 (= res!196607 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354677 () Bool)

(declare-fun res!196614 () Bool)

(assert (=> b!354677 (=> (not res!196614) (not e!217404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354677 (= res!196614 (validKeyInArray!0 k0!1077))))

(declare-fun b!354678 () Bool)

(assert (=> b!354678 (= e!217404 (not true))))

(declare-fun minValue!1150 () V!11485)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11485)

(declare-datatypes ((tuple2!5662 0))(
  ( (tuple2!5663 (_1!2842 (_ BitVec 64)) (_2!2842 V!11485)) )
))
(declare-datatypes ((List!5306 0))(
  ( (Nil!5303) (Cons!5302 (h!6158 tuple2!5662) (t!10456 List!5306)) )
))
(declare-datatypes ((ListLongMap!4575 0))(
  ( (ListLongMap!4576 (toList!2303 List!5306)) )
))
(declare-fun contains!2383 (ListLongMap!4575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1824 (array!19343 array!19345 (_ BitVec 32) (_ BitVec 32) V!11485 V!11485 (_ BitVec 32) Int) ListLongMap!4575)

(assert (=> b!354678 (contains!2383 (getCurrentListMap!1824 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9165 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10928 0))(
  ( (Unit!10929) )
))
(declare-fun lt!165737 () Unit!10928)

(declare-fun lemmaValidKeyInArrayIsInListMap!181 (array!19343 array!19345 (_ BitVec 32) (_ BitVec 32) V!11485 V!11485 (_ BitVec 32) Int) Unit!10928)

(assert (=> b!354678 (= lt!165737 (lemmaValidKeyInArrayIsInListMap!181 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354679 () Bool)

(declare-fun res!196608 () Bool)

(assert (=> b!354679 (=> (not res!196608) (not e!217404))))

(assert (=> b!354679 (= res!196608 (validKeyInArray!0 (select (arr!9165 _keys!1456) from!1805)))))

(assert (= (and start!35428 res!196611) b!354668))

(assert (= (and b!354668 res!196609) b!354671))

(assert (= (and b!354671 res!196613) b!354674))

(assert (= (and b!354674 res!196610) b!354677))

(assert (= (and b!354677 res!196614) b!354669))

(assert (= (and b!354669 res!196615) b!354676))

(assert (= (and b!354676 res!196607) b!354673))

(assert (= (and b!354673 res!196612) b!354679))

(assert (= (and b!354679 res!196608) b!354678))

(assert (= (and b!354675 condMapEmpty!13329) mapIsEmpty!13329))

(assert (= (and b!354675 (not condMapEmpty!13329)) mapNonEmpty!13329))

(get-info :version)

(assert (= (and mapNonEmpty!13329 ((_ is ValueCellFull!3597) mapValue!13329)) b!354670))

(assert (= (and b!354675 ((_ is ValueCellFull!3597) mapDefault!13329)) b!354672))

(assert (= start!35428 b!354675))

(declare-fun m!353601 () Bool)

(assert (=> b!354674 m!353601))

(declare-fun m!353603 () Bool)

(assert (=> b!354671 m!353603))

(declare-fun m!353605 () Bool)

(assert (=> mapNonEmpty!13329 m!353605))

(declare-fun m!353607 () Bool)

(assert (=> b!354677 m!353607))

(declare-fun m!353609 () Bool)

(assert (=> b!354676 m!353609))

(declare-fun m!353611 () Bool)

(assert (=> start!35428 m!353611))

(declare-fun m!353613 () Bool)

(assert (=> start!35428 m!353613))

(declare-fun m!353615 () Bool)

(assert (=> start!35428 m!353615))

(declare-fun m!353617 () Bool)

(assert (=> b!354678 m!353617))

(declare-fun m!353619 () Bool)

(assert (=> b!354678 m!353619))

(assert (=> b!354678 m!353617))

(assert (=> b!354678 m!353619))

(declare-fun m!353621 () Bool)

(assert (=> b!354678 m!353621))

(declare-fun m!353623 () Bool)

(assert (=> b!354678 m!353623))

(assert (=> b!354679 m!353619))

(assert (=> b!354679 m!353619))

(declare-fun m!353625 () Bool)

(assert (=> b!354679 m!353625))

(assert (=> b!354673 m!353619))

(check-sat (not start!35428) (not b!354674) (not b!354678) (not b!354679) b_and!15057 (not b_next!7815) tp_is_empty!7881 (not b!354677) (not b!354676) (not mapNonEmpty!13329) (not b!354671))
(check-sat b_and!15057 (not b_next!7815))
