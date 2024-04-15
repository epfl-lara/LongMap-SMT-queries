; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43200 () Bool)

(assert start!43200)

(declare-fun b!478641 () Bool)

(declare-fun e!281496 () Bool)

(assert (=> b!478641 (= e!281496 false)))

(declare-fun lt!217555 () Bool)

(declare-datatypes ((array!30875 0))(
  ( (array!30876 (arr!14845 (Array (_ BitVec 32) (_ BitVec 64))) (size!15204 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30875)

(declare-datatypes ((List!9117 0))(
  ( (Nil!9114) (Cons!9113 (h!9969 (_ BitVec 64)) (t!15314 List!9117)) )
))
(declare-fun arrayNoDuplicates!0 (array!30875 (_ BitVec 32) List!9117) Bool)

(assert (=> b!478641 (= lt!217555 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9114))))

(declare-fun mapIsEmpty!22099 () Bool)

(declare-fun mapRes!22099 () Bool)

(assert (=> mapIsEmpty!22099 mapRes!22099))

(declare-fun b!478642 () Bool)

(declare-fun res!285575 () Bool)

(assert (=> b!478642 (=> (not res!285575) (not e!281496))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30875 (_ BitVec 32)) Bool)

(assert (=> b!478642 (= res!285575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22099 () Bool)

(declare-fun tp!42574 () Bool)

(declare-fun e!281497 () Bool)

(assert (=> mapNonEmpty!22099 (= mapRes!22099 (and tp!42574 e!281497))))

(declare-fun mapKey!22099 () (_ BitVec 32))

(declare-datatypes ((V!19209 0))(
  ( (V!19210 (val!6849 Int)) )
))
(declare-datatypes ((ValueCell!6440 0))(
  ( (ValueCellFull!6440 (v!9132 V!19209)) (EmptyCell!6440) )
))
(declare-fun mapValue!22099 () ValueCell!6440)

(declare-datatypes ((array!30877 0))(
  ( (array!30878 (arr!14846 (Array (_ BitVec 32) ValueCell!6440)) (size!15205 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30877)

(declare-fun mapRest!22099 () (Array (_ BitVec 32) ValueCell!6440))

(assert (=> mapNonEmpty!22099 (= (arr!14846 _values!1516) (store mapRest!22099 mapKey!22099 mapValue!22099))))

(declare-fun res!285574 () Bool)

(assert (=> start!43200 (=> (not res!285574) (not e!281496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43200 (= res!285574 (validMask!0 mask!2352))))

(assert (=> start!43200 e!281496))

(assert (=> start!43200 true))

(declare-fun e!281499 () Bool)

(declare-fun array_inv!10800 (array!30877) Bool)

(assert (=> start!43200 (and (array_inv!10800 _values!1516) e!281499)))

(declare-fun array_inv!10801 (array!30875) Bool)

(assert (=> start!43200 (array_inv!10801 _keys!1874)))

(declare-fun b!478643 () Bool)

(declare-fun e!281498 () Bool)

(assert (=> b!478643 (= e!281499 (and e!281498 mapRes!22099))))

(declare-fun condMapEmpty!22099 () Bool)

(declare-fun mapDefault!22099 () ValueCell!6440)

(assert (=> b!478643 (= condMapEmpty!22099 (= (arr!14846 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6440)) mapDefault!22099)))))

(declare-fun b!478644 () Bool)

(declare-fun tp_is_empty!13603 () Bool)

(assert (=> b!478644 (= e!281497 tp_is_empty!13603)))

(declare-fun b!478645 () Bool)

(declare-fun res!285576 () Bool)

(assert (=> b!478645 (=> (not res!285576) (not e!281496))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478645 (= res!285576 (and (= (size!15205 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15204 _keys!1874) (size!15205 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478646 () Bool)

(assert (=> b!478646 (= e!281498 tp_is_empty!13603)))

(assert (= (and start!43200 res!285574) b!478645))

(assert (= (and b!478645 res!285576) b!478642))

(assert (= (and b!478642 res!285575) b!478641))

(assert (= (and b!478643 condMapEmpty!22099) mapIsEmpty!22099))

(assert (= (and b!478643 (not condMapEmpty!22099)) mapNonEmpty!22099))

(get-info :version)

(assert (= (and mapNonEmpty!22099 ((_ is ValueCellFull!6440) mapValue!22099)) b!478644))

(assert (= (and b!478643 ((_ is ValueCellFull!6440) mapDefault!22099)) b!478646))

(assert (= start!43200 b!478643))

(declare-fun m!460287 () Bool)

(assert (=> b!478641 m!460287))

(declare-fun m!460289 () Bool)

(assert (=> b!478642 m!460289))

(declare-fun m!460291 () Bool)

(assert (=> mapNonEmpty!22099 m!460291))

(declare-fun m!460293 () Bool)

(assert (=> start!43200 m!460293))

(declare-fun m!460295 () Bool)

(assert (=> start!43200 m!460295))

(declare-fun m!460297 () Bool)

(assert (=> start!43200 m!460297))

(check-sat (not mapNonEmpty!22099) (not b!478641) (not b!478642) (not start!43200) tp_is_empty!13603)
(check-sat)
