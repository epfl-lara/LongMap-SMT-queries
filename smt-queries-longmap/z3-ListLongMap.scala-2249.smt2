; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36942 () Bool)

(assert start!36942)

(declare-fun b_free!8083 () Bool)

(declare-fun b_next!8083 () Bool)

(assert (=> start!36942 (= b_free!8083 (not b_next!8083))))

(declare-fun tp!28965 () Bool)

(declare-fun b_and!15339 () Bool)

(assert (=> start!36942 (= tp!28965 b_and!15339)))

(declare-fun b!370609 () Bool)

(declare-fun res!208191 () Bool)

(declare-fun e!226324 () Bool)

(assert (=> b!370609 (=> (not res!208191) (not e!226324))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370609 (= res!208191 (validKeyInArray!0 k0!778))))

(declare-fun b!370610 () Bool)

(declare-fun res!208192 () Bool)

(assert (=> b!370610 (=> (not res!208192) (not e!226324))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12747 0))(
  ( (V!12748 (val!4410 Int)) )
))
(declare-datatypes ((ValueCell!4022 0))(
  ( (ValueCellFull!4022 (v!6608 V!12747)) (EmptyCell!4022) )
))
(declare-datatypes ((array!21390 0))(
  ( (array!21391 (arr!10163 (Array (_ BitVec 32) ValueCell!4022)) (size!10515 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21390)

(declare-datatypes ((array!21392 0))(
  ( (array!21393 (arr!10164 (Array (_ BitVec 32) (_ BitVec 64))) (size!10516 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21392)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370610 (= res!208192 (and (= (size!10515 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10516 _keys!658) (size!10515 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370611 () Bool)

(declare-fun res!208188 () Bool)

(assert (=> b!370611 (=> (not res!208188) (not e!226324))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370611 (= res!208188 (or (= (select (arr!10164 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10164 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370613 () Bool)

(declare-fun e!226325 () Bool)

(declare-fun tp_is_empty!8731 () Bool)

(assert (=> b!370613 (= e!226325 tp_is_empty!8731)))

(declare-fun b!370614 () Bool)

(declare-fun res!208187 () Bool)

(assert (=> b!370614 (=> (not res!208187) (not e!226324))))

(declare-datatypes ((List!5587 0))(
  ( (Nil!5584) (Cons!5583 (h!6439 (_ BitVec 64)) (t!10729 List!5587)) )
))
(declare-fun arrayNoDuplicates!0 (array!21392 (_ BitVec 32) List!5587) Bool)

(assert (=> b!370614 (= res!208187 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5584))))

(declare-fun mapIsEmpty!14661 () Bool)

(declare-fun mapRes!14661 () Bool)

(assert (=> mapIsEmpty!14661 mapRes!14661))

(declare-fun mapNonEmpty!14661 () Bool)

(declare-fun tp!28964 () Bool)

(declare-fun e!226326 () Bool)

(assert (=> mapNonEmpty!14661 (= mapRes!14661 (and tp!28964 e!226326))))

(declare-fun mapKey!14661 () (_ BitVec 32))

(declare-fun mapRest!14661 () (Array (_ BitVec 32) ValueCell!4022))

(declare-fun mapValue!14661 () ValueCell!4022)

(assert (=> mapNonEmpty!14661 (= (arr!10163 _values!506) (store mapRest!14661 mapKey!14661 mapValue!14661))))

(declare-fun b!370615 () Bool)

(declare-fun e!226327 () Bool)

(assert (=> b!370615 (= e!226324 e!226327)))

(declare-fun res!208193 () Bool)

(assert (=> b!370615 (=> (not res!208193) (not e!226327))))

(declare-fun lt!170038 () array!21392)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21392 (_ BitVec 32)) Bool)

(assert (=> b!370615 (= res!208193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170038 mask!970))))

(assert (=> b!370615 (= lt!170038 (array!21393 (store (arr!10164 _keys!658) i!548 k0!778) (size!10516 _keys!658)))))

(declare-fun b!370616 () Bool)

(declare-fun res!208196 () Bool)

(assert (=> b!370616 (=> (not res!208196) (not e!226327))))

(assert (=> b!370616 (= res!208196 (arrayNoDuplicates!0 lt!170038 #b00000000000000000000000000000000 Nil!5584))))

(declare-fun b!370617 () Bool)

(declare-fun e!226329 () Bool)

(assert (=> b!370617 (= e!226329 (and e!226325 mapRes!14661))))

(declare-fun condMapEmpty!14661 () Bool)

(declare-fun mapDefault!14661 () ValueCell!4022)

(assert (=> b!370617 (= condMapEmpty!14661 (= (arr!10163 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4022)) mapDefault!14661)))))

(declare-fun b!370618 () Bool)

(declare-fun res!208189 () Bool)

(assert (=> b!370618 (=> (not res!208189) (not e!226324))))

(assert (=> b!370618 (= res!208189 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10516 _keys!658))))))

(declare-fun res!208194 () Bool)

(assert (=> start!36942 (=> (not res!208194) (not e!226324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36942 (= res!208194 (validMask!0 mask!970))))

(assert (=> start!36942 e!226324))

(declare-fun array_inv!7538 (array!21390) Bool)

(assert (=> start!36942 (and (array_inv!7538 _values!506) e!226329)))

(assert (=> start!36942 tp!28965))

(assert (=> start!36942 true))

(assert (=> start!36942 tp_is_empty!8731))

(declare-fun array_inv!7539 (array!21392) Bool)

(assert (=> start!36942 (array_inv!7539 _keys!658)))

(declare-fun b!370612 () Bool)

(assert (=> b!370612 (= e!226327 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5754 0))(
  ( (tuple2!5755 (_1!2888 (_ BitVec 64)) (_2!2888 V!12747)) )
))
(declare-datatypes ((List!5588 0))(
  ( (Nil!5585) (Cons!5584 (h!6440 tuple2!5754) (t!10730 List!5588)) )
))
(declare-datatypes ((ListLongMap!4669 0))(
  ( (ListLongMap!4670 (toList!2350 List!5588)) )
))
(declare-fun lt!170036 () ListLongMap!4669)

(declare-fun zeroValue!472 () V!12747)

(declare-fun v!373 () V!12747)

(declare-fun minValue!472 () V!12747)

(declare-fun getCurrentListMapNoExtraKeys!659 (array!21392 array!21390 (_ BitVec 32) (_ BitVec 32) V!12747 V!12747 (_ BitVec 32) Int) ListLongMap!4669)

(assert (=> b!370612 (= lt!170036 (getCurrentListMapNoExtraKeys!659 lt!170038 (array!21391 (store (arr!10163 _values!506) i!548 (ValueCellFull!4022 v!373)) (size!10515 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170037 () ListLongMap!4669)

(assert (=> b!370612 (= lt!170037 (getCurrentListMapNoExtraKeys!659 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370619 () Bool)

(declare-fun res!208190 () Bool)

(assert (=> b!370619 (=> (not res!208190) (not e!226324))))

(declare-fun arrayContainsKey!0 (array!21392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370619 (= res!208190 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370620 () Bool)

(assert (=> b!370620 (= e!226326 tp_is_empty!8731)))

(declare-fun b!370621 () Bool)

(declare-fun res!208195 () Bool)

(assert (=> b!370621 (=> (not res!208195) (not e!226324))))

(assert (=> b!370621 (= res!208195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36942 res!208194) b!370610))

(assert (= (and b!370610 res!208192) b!370621))

(assert (= (and b!370621 res!208195) b!370614))

(assert (= (and b!370614 res!208187) b!370618))

(assert (= (and b!370618 res!208189) b!370609))

(assert (= (and b!370609 res!208191) b!370611))

(assert (= (and b!370611 res!208188) b!370619))

(assert (= (and b!370619 res!208190) b!370615))

(assert (= (and b!370615 res!208193) b!370616))

(assert (= (and b!370616 res!208196) b!370612))

(assert (= (and b!370617 condMapEmpty!14661) mapIsEmpty!14661))

(assert (= (and b!370617 (not condMapEmpty!14661)) mapNonEmpty!14661))

(get-info :version)

(assert (= (and mapNonEmpty!14661 ((_ is ValueCellFull!4022) mapValue!14661)) b!370620))

(assert (= (and b!370617 ((_ is ValueCellFull!4022) mapDefault!14661)) b!370613))

(assert (= start!36942 b!370617))

(declare-fun m!366983 () Bool)

(assert (=> mapNonEmpty!14661 m!366983))

(declare-fun m!366985 () Bool)

(assert (=> b!370611 m!366985))

(declare-fun m!366987 () Bool)

(assert (=> b!370609 m!366987))

(declare-fun m!366989 () Bool)

(assert (=> b!370619 m!366989))

(declare-fun m!366991 () Bool)

(assert (=> b!370621 m!366991))

(declare-fun m!366993 () Bool)

(assert (=> b!370616 m!366993))

(declare-fun m!366995 () Bool)

(assert (=> b!370612 m!366995))

(declare-fun m!366997 () Bool)

(assert (=> b!370612 m!366997))

(declare-fun m!366999 () Bool)

(assert (=> b!370612 m!366999))

(declare-fun m!367001 () Bool)

(assert (=> b!370615 m!367001))

(declare-fun m!367003 () Bool)

(assert (=> b!370615 m!367003))

(declare-fun m!367005 () Bool)

(assert (=> b!370614 m!367005))

(declare-fun m!367007 () Bool)

(assert (=> start!36942 m!367007))

(declare-fun m!367009 () Bool)

(assert (=> start!36942 m!367009))

(declare-fun m!367011 () Bool)

(assert (=> start!36942 m!367011))

(check-sat (not b!370616) (not b_next!8083) (not b!370612) b_and!15339 (not b!370621) (not mapNonEmpty!14661) (not b!370615) (not b!370614) (not b!370619) tp_is_empty!8731 (not start!36942) (not b!370609))
(check-sat b_and!15339 (not b_next!8083))
