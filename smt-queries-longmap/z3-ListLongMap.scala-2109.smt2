; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35808 () Bool)

(assert start!35808)

(declare-fun b!359611 () Bool)

(declare-fun e!220265 () Bool)

(declare-fun tp_is_empty!8275 () Bool)

(assert (=> b!359611 (= e!220265 tp_is_empty!8275)))

(declare-fun mapIsEmpty!13920 () Bool)

(declare-fun mapRes!13920 () Bool)

(assert (=> mapIsEmpty!13920 mapRes!13920))

(declare-fun b!359612 () Bool)

(declare-fun res!199925 () Bool)

(declare-fun e!220263 () Bool)

(assert (=> b!359612 (=> (not res!199925) (not e!220263))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20075 0))(
  ( (array!20076 (arr!9531 (Array (_ BitVec 32) (_ BitVec 64))) (size!9884 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20075)

(assert (=> b!359612 (= res!199925 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9884 _keys!1456))))))

(declare-fun b!359613 () Bool)

(declare-fun res!199930 () Bool)

(assert (=> b!359613 (=> (not res!199930) (not e!220263))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!12011 0))(
  ( (V!12012 (val!4182 Int)) )
))
(declare-datatypes ((ValueCell!3794 0))(
  ( (ValueCellFull!3794 (v!6370 V!12011)) (EmptyCell!3794) )
))
(declare-datatypes ((array!20077 0))(
  ( (array!20078 (arr!9532 (Array (_ BitVec 32) ValueCell!3794)) (size!9885 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20077)

(assert (=> b!359613 (= res!199930 (and (= (size!9885 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9884 _keys!1456) (size!9885 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13920 () Bool)

(declare-fun tp!27987 () Bool)

(declare-fun e!220264 () Bool)

(assert (=> mapNonEmpty!13920 (= mapRes!13920 (and tp!27987 e!220264))))

(declare-fun mapRest!13920 () (Array (_ BitVec 32) ValueCell!3794))

(declare-fun mapValue!13920 () ValueCell!3794)

(declare-fun mapKey!13920 () (_ BitVec 32))

(assert (=> mapNonEmpty!13920 (= (arr!9532 _values!1208) (store mapRest!13920 mapKey!13920 mapValue!13920))))

(declare-fun b!359614 () Bool)

(declare-fun res!199929 () Bool)

(assert (=> b!359614 (=> (not res!199929) (not e!220263))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359614 (= res!199929 (validKeyInArray!0 k0!1077))))

(declare-fun b!359615 () Bool)

(declare-fun res!199924 () Bool)

(assert (=> b!359615 (=> (not res!199924) (not e!220263))))

(assert (=> b!359615 (= res!199924 (not (= (select (arr!9531 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359616 () Bool)

(declare-fun e!220266 () Bool)

(assert (=> b!359616 (= e!220266 (and e!220265 mapRes!13920))))

(declare-fun condMapEmpty!13920 () Bool)

(declare-fun mapDefault!13920 () ValueCell!3794)

(assert (=> b!359616 (= condMapEmpty!13920 (= (arr!9532 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3794)) mapDefault!13920)))))

(declare-fun b!359617 () Bool)

(declare-fun res!199927 () Bool)

(assert (=> b!359617 (=> (not res!199927) (not e!220263))))

(declare-fun arrayContainsKey!0 (array!20075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359617 (= res!199927 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!359618 () Bool)

(declare-fun res!199928 () Bool)

(assert (=> b!359618 (=> (not res!199928) (not e!220263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20075 (_ BitVec 32)) Bool)

(assert (=> b!359618 (= res!199928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199926 () Bool)

(assert (=> start!35808 (=> (not res!199926) (not e!220263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35808 (= res!199926 (validMask!0 mask!1842))))

(assert (=> start!35808 e!220263))

(assert (=> start!35808 tp_is_empty!8275))

(assert (=> start!35808 true))

(declare-fun array_inv!7028 (array!20075) Bool)

(assert (=> start!35808 (array_inv!7028 _keys!1456)))

(declare-fun array_inv!7029 (array!20077) Bool)

(assert (=> start!35808 (and (array_inv!7029 _values!1208) e!220266)))

(declare-fun b!359619 () Bool)

(declare-fun res!199923 () Bool)

(assert (=> b!359619 (=> (not res!199923) (not e!220263))))

(declare-datatypes ((List!5444 0))(
  ( (Nil!5441) (Cons!5440 (h!6296 (_ BitVec 64)) (t!10585 List!5444)) )
))
(declare-fun arrayNoDuplicates!0 (array!20075 (_ BitVec 32) List!5444) Bool)

(assert (=> b!359619 (= res!199923 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5441))))

(declare-fun b!359620 () Bool)

(assert (=> b!359620 (= e!220264 tp_is_empty!8275)))

(declare-fun b!359621 () Bool)

(assert (=> b!359621 (= e!220263 (not true))))

(assert (=> b!359621 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12011)

(declare-datatypes ((Unit!11044 0))(
  ( (Unit!11045) )
))
(declare-fun lt!166165 () Unit!11044)

(declare-fun zeroValue!1150 () V!12011)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!45 (array!20075 array!20077 (_ BitVec 32) (_ BitVec 32) V!12011 V!12011 (_ BitVec 64) (_ BitVec 32)) Unit!11044)

(assert (=> b!359621 (= lt!166165 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!45 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (= (and start!35808 res!199926) b!359613))

(assert (= (and b!359613 res!199930) b!359618))

(assert (= (and b!359618 res!199928) b!359619))

(assert (= (and b!359619 res!199923) b!359614))

(assert (= (and b!359614 res!199929) b!359612))

(assert (= (and b!359612 res!199925) b!359617))

(assert (= (and b!359617 res!199927) b!359615))

(assert (= (and b!359615 res!199924) b!359621))

(assert (= (and b!359616 condMapEmpty!13920) mapIsEmpty!13920))

(assert (= (and b!359616 (not condMapEmpty!13920)) mapNonEmpty!13920))

(get-info :version)

(assert (= (and mapNonEmpty!13920 ((_ is ValueCellFull!3794) mapValue!13920)) b!359620))

(assert (= (and b!359616 ((_ is ValueCellFull!3794) mapDefault!13920)) b!359611))

(assert (= start!35808 b!359616))

(declare-fun m!356505 () Bool)

(assert (=> b!359614 m!356505))

(declare-fun m!356507 () Bool)

(assert (=> b!359617 m!356507))

(declare-fun m!356509 () Bool)

(assert (=> b!359618 m!356509))

(declare-fun m!356511 () Bool)

(assert (=> b!359619 m!356511))

(declare-fun m!356513 () Bool)

(assert (=> start!35808 m!356513))

(declare-fun m!356515 () Bool)

(assert (=> start!35808 m!356515))

(declare-fun m!356517 () Bool)

(assert (=> start!35808 m!356517))

(declare-fun m!356519 () Bool)

(assert (=> mapNonEmpty!13920 m!356519))

(declare-fun m!356521 () Bool)

(assert (=> b!359621 m!356521))

(declare-fun m!356523 () Bool)

(assert (=> b!359621 m!356523))

(declare-fun m!356525 () Bool)

(assert (=> b!359615 m!356525))

(check-sat (not b!359617) (not mapNonEmpty!13920) (not start!35808) tp_is_empty!8275 (not b!359621) (not b!359614) (not b!359619) (not b!359618))
(check-sat)
