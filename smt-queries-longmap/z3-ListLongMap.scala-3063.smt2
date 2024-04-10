; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43222 () Bool)

(assert start!43222)

(declare-fun mapNonEmpty!22111 () Bool)

(declare-fun mapRes!22111 () Bool)

(declare-fun tp!42586 () Bool)

(declare-fun e!281731 () Bool)

(assert (=> mapNonEmpty!22111 (= mapRes!22111 (and tp!42586 e!281731))))

(declare-datatypes ((V!19219 0))(
  ( (V!19220 (val!6853 Int)) )
))
(declare-datatypes ((ValueCell!6444 0))(
  ( (ValueCellFull!6444 (v!9142 V!19219)) (EmptyCell!6444) )
))
(declare-fun mapValue!22111 () ValueCell!6444)

(declare-fun mapRest!22111 () (Array (_ BitVec 32) ValueCell!6444))

(declare-fun mapKey!22111 () (_ BitVec 32))

(declare-datatypes ((array!30897 0))(
  ( (array!30898 (arr!14856 (Array (_ BitVec 32) ValueCell!6444)) (size!15214 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30897)

(assert (=> mapNonEmpty!22111 (= (arr!14856 _values!1516) (store mapRest!22111 mapKey!22111 mapValue!22111))))

(declare-fun b!478984 () Bool)

(declare-fun e!281730 () Bool)

(declare-fun e!281733 () Bool)

(assert (=> b!478984 (= e!281730 (and e!281733 mapRes!22111))))

(declare-fun condMapEmpty!22111 () Bool)

(declare-fun mapDefault!22111 () ValueCell!6444)

(assert (=> b!478984 (= condMapEmpty!22111 (= (arr!14856 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6444)) mapDefault!22111)))))

(declare-fun b!478985 () Bool)

(declare-fun tp_is_empty!13611 () Bool)

(assert (=> b!478985 (= e!281733 tp_is_empty!13611)))

(declare-fun b!478986 () Bool)

(declare-fun e!281729 () Bool)

(assert (=> b!478986 (= e!281729 false)))

(declare-fun lt!217801 () Bool)

(declare-datatypes ((array!30899 0))(
  ( (array!30900 (arr!14857 (Array (_ BitVec 32) (_ BitVec 64))) (size!15215 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30899)

(declare-datatypes ((List!9078 0))(
  ( (Nil!9075) (Cons!9074 (h!9930 (_ BitVec 64)) (t!15284 List!9078)) )
))
(declare-fun arrayNoDuplicates!0 (array!30899 (_ BitVec 32) List!9078) Bool)

(assert (=> b!478986 (= lt!217801 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9075))))

(declare-fun b!478987 () Bool)

(assert (=> b!478987 (= e!281731 tp_is_empty!13611)))

(declare-fun res!285741 () Bool)

(assert (=> start!43222 (=> (not res!285741) (not e!281729))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43222 (= res!285741 (validMask!0 mask!2352))))

(assert (=> start!43222 e!281729))

(assert (=> start!43222 true))

(declare-fun array_inv!10720 (array!30897) Bool)

(assert (=> start!43222 (and (array_inv!10720 _values!1516) e!281730)))

(declare-fun array_inv!10721 (array!30899) Bool)

(assert (=> start!43222 (array_inv!10721 _keys!1874)))

(declare-fun b!478988 () Bool)

(declare-fun res!285740 () Bool)

(assert (=> b!478988 (=> (not res!285740) (not e!281729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30899 (_ BitVec 32)) Bool)

(assert (=> b!478988 (= res!285740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22111 () Bool)

(assert (=> mapIsEmpty!22111 mapRes!22111))

(declare-fun b!478989 () Bool)

(declare-fun res!285739 () Bool)

(assert (=> b!478989 (=> (not res!285739) (not e!281729))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478989 (= res!285739 (and (= (size!15214 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15215 _keys!1874) (size!15214 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43222 res!285741) b!478989))

(assert (= (and b!478989 res!285739) b!478988))

(assert (= (and b!478988 res!285740) b!478986))

(assert (= (and b!478984 condMapEmpty!22111) mapIsEmpty!22111))

(assert (= (and b!478984 (not condMapEmpty!22111)) mapNonEmpty!22111))

(get-info :version)

(assert (= (and mapNonEmpty!22111 ((_ is ValueCellFull!6444) mapValue!22111)) b!478987))

(assert (= (and b!478984 ((_ is ValueCellFull!6444) mapDefault!22111)) b!478985))

(assert (= start!43222 b!478984))

(declare-fun m!461069 () Bool)

(assert (=> mapNonEmpty!22111 m!461069))

(declare-fun m!461071 () Bool)

(assert (=> b!478986 m!461071))

(declare-fun m!461073 () Bool)

(assert (=> start!43222 m!461073))

(declare-fun m!461075 () Bool)

(assert (=> start!43222 m!461075))

(declare-fun m!461077 () Bool)

(assert (=> start!43222 m!461077))

(declare-fun m!461079 () Bool)

(assert (=> b!478988 m!461079))

(check-sat (not b!478986) (not start!43222) (not b!478988) (not mapNonEmpty!22111) tp_is_empty!13611)
(check-sat)
