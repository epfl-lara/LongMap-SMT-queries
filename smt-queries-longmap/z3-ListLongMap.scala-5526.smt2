; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73108 () Bool)

(assert start!73108)

(declare-fun b_free!13855 () Bool)

(declare-fun b_next!13855 () Bool)

(assert (=> start!73108 (= b_free!13855 (not b_next!13855))))

(declare-fun tp!49070 () Bool)

(declare-fun b_and!22951 () Bool)

(assert (=> start!73108 (= tp!49070 b_and!22951)))

(declare-fun b!847894 () Bool)

(declare-fun res!575816 () Bool)

(declare-fun e!473251 () Bool)

(assert (=> b!847894 (=> (not res!575816) (not e!473251))))

(declare-datatypes ((array!48245 0))(
  ( (array!48246 (arr!23149 (Array (_ BitVec 32) (_ BitVec 64))) (size!23590 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48245)

(declare-datatypes ((List!16303 0))(
  ( (Nil!16300) (Cons!16299 (h!17436 (_ BitVec 64)) (t!22666 List!16303)) )
))
(declare-fun arrayNoDuplicates!0 (array!48245 (_ BitVec 32) List!16303) Bool)

(assert (=> b!847894 (= res!575816 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16300))))

(declare-fun mapNonEmpty!25586 () Bool)

(declare-fun mapRes!25586 () Bool)

(declare-fun tp!49069 () Bool)

(declare-fun e!473254 () Bool)

(assert (=> mapNonEmpty!25586 (= mapRes!25586 (and tp!49069 e!473254))))

(declare-fun mapKey!25586 () (_ BitVec 32))

(declare-datatypes ((V!26369 0))(
  ( (V!26370 (val!8043 Int)) )
))
(declare-datatypes ((ValueCell!7556 0))(
  ( (ValueCellFull!7556 (v!10468 V!26369)) (EmptyCell!7556) )
))
(declare-fun mapRest!25586 () (Array (_ BitVec 32) ValueCell!7556))

(declare-fun mapValue!25586 () ValueCell!7556)

(declare-datatypes ((array!48247 0))(
  ( (array!48248 (arr!23150 (Array (_ BitVec 32) ValueCell!7556)) (size!23591 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48247)

(assert (=> mapNonEmpty!25586 (= (arr!23150 _values!688) (store mapRest!25586 mapKey!25586 mapValue!25586))))

(declare-fun res!575820 () Bool)

(assert (=> start!73108 (=> (not res!575820) (not e!473251))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73108 (= res!575820 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23590 _keys!868))))))

(assert (=> start!73108 e!473251))

(declare-fun tp_is_empty!15991 () Bool)

(assert (=> start!73108 tp_is_empty!15991))

(assert (=> start!73108 true))

(assert (=> start!73108 tp!49070))

(declare-fun array_inv!18438 (array!48245) Bool)

(assert (=> start!73108 (array_inv!18438 _keys!868)))

(declare-fun e!473253 () Bool)

(declare-fun array_inv!18439 (array!48247) Bool)

(assert (=> start!73108 (and (array_inv!18439 _values!688) e!473253)))

(declare-fun b!847895 () Bool)

(assert (=> b!847895 (= e!473251 false)))

(declare-fun v!557 () V!26369)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10430 0))(
  ( (tuple2!10431 (_1!5226 (_ BitVec 64)) (_2!5226 V!26369)) )
))
(declare-datatypes ((List!16304 0))(
  ( (Nil!16301) (Cons!16300 (h!17437 tuple2!10430) (t!22667 List!16304)) )
))
(declare-datatypes ((ListLongMap!9201 0))(
  ( (ListLongMap!9202 (toList!4616 List!16304)) )
))
(declare-fun lt!381997 () ListLongMap!9201)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26369)

(declare-fun zeroValue!654 () V!26369)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2674 (array!48245 array!48247 (_ BitVec 32) (_ BitVec 32) V!26369 V!26369 (_ BitVec 32) Int) ListLongMap!9201)

(assert (=> b!847895 (= lt!381997 (getCurrentListMapNoExtraKeys!2674 _keys!868 (array!48248 (store (arr!23150 _values!688) i!612 (ValueCellFull!7556 v!557)) (size!23591 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381998 () ListLongMap!9201)

(assert (=> b!847895 (= lt!381998 (getCurrentListMapNoExtraKeys!2674 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847896 () Bool)

(declare-fun e!473250 () Bool)

(assert (=> b!847896 (= e!473250 tp_is_empty!15991)))

(declare-fun mapIsEmpty!25586 () Bool)

(assert (=> mapIsEmpty!25586 mapRes!25586))

(declare-fun b!847897 () Bool)

(declare-fun res!575815 () Bool)

(assert (=> b!847897 (=> (not res!575815) (not e!473251))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847897 (= res!575815 (validKeyInArray!0 k0!854))))

(declare-fun b!847898 () Bool)

(assert (=> b!847898 (= e!473253 (and e!473250 mapRes!25586))))

(declare-fun condMapEmpty!25586 () Bool)

(declare-fun mapDefault!25586 () ValueCell!7556)

(assert (=> b!847898 (= condMapEmpty!25586 (= (arr!23150 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7556)) mapDefault!25586)))))

(declare-fun b!847899 () Bool)

(declare-fun res!575817 () Bool)

(assert (=> b!847899 (=> (not res!575817) (not e!473251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847899 (= res!575817 (validMask!0 mask!1196))))

(declare-fun b!847900 () Bool)

(declare-fun res!575818 () Bool)

(assert (=> b!847900 (=> (not res!575818) (not e!473251))))

(assert (=> b!847900 (= res!575818 (and (= (size!23591 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23590 _keys!868) (size!23591 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847901 () Bool)

(declare-fun res!575819 () Bool)

(assert (=> b!847901 (=> (not res!575819) (not e!473251))))

(assert (=> b!847901 (= res!575819 (and (= (select (arr!23149 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847902 () Bool)

(declare-fun res!575814 () Bool)

(assert (=> b!847902 (=> (not res!575814) (not e!473251))))

(assert (=> b!847902 (= res!575814 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23590 _keys!868))))))

(declare-fun b!847903 () Bool)

(assert (=> b!847903 (= e!473254 tp_is_empty!15991)))

(declare-fun b!847904 () Bool)

(declare-fun res!575821 () Bool)

(assert (=> b!847904 (=> (not res!575821) (not e!473251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48245 (_ BitVec 32)) Bool)

(assert (=> b!847904 (= res!575821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73108 res!575820) b!847899))

(assert (= (and b!847899 res!575817) b!847900))

(assert (= (and b!847900 res!575818) b!847904))

(assert (= (and b!847904 res!575821) b!847894))

(assert (= (and b!847894 res!575816) b!847902))

(assert (= (and b!847902 res!575814) b!847897))

(assert (= (and b!847897 res!575815) b!847901))

(assert (= (and b!847901 res!575819) b!847895))

(assert (= (and b!847898 condMapEmpty!25586) mapIsEmpty!25586))

(assert (= (and b!847898 (not condMapEmpty!25586)) mapNonEmpty!25586))

(get-info :version)

(assert (= (and mapNonEmpty!25586 ((_ is ValueCellFull!7556) mapValue!25586)) b!847903))

(assert (= (and b!847898 ((_ is ValueCellFull!7556) mapDefault!25586)) b!847896))

(assert (= start!73108 b!847898))

(declare-fun m!789497 () Bool)

(assert (=> b!847894 m!789497))

(declare-fun m!789499 () Bool)

(assert (=> b!847895 m!789499))

(declare-fun m!789501 () Bool)

(assert (=> b!847895 m!789501))

(declare-fun m!789503 () Bool)

(assert (=> b!847895 m!789503))

(declare-fun m!789505 () Bool)

(assert (=> start!73108 m!789505))

(declare-fun m!789507 () Bool)

(assert (=> start!73108 m!789507))

(declare-fun m!789509 () Bool)

(assert (=> b!847899 m!789509))

(declare-fun m!789511 () Bool)

(assert (=> b!847904 m!789511))

(declare-fun m!789513 () Bool)

(assert (=> mapNonEmpty!25586 m!789513))

(declare-fun m!789515 () Bool)

(assert (=> b!847897 m!789515))

(declare-fun m!789517 () Bool)

(assert (=> b!847901 m!789517))

(check-sat (not b!847899) (not b!847897) (not b_next!13855) (not mapNonEmpty!25586) (not start!73108) b_and!22951 (not b!847895) tp_is_empty!15991 (not b!847894) (not b!847904))
(check-sat b_and!22951 (not b_next!13855))
