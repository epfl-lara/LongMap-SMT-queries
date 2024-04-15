; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74212 () Bool)

(assert start!74212)

(declare-fun b!873003 () Bool)

(declare-fun e!486144 () Bool)

(declare-fun tp_is_empty!17251 () Bool)

(assert (=> b!873003 (= e!486144 tp_is_empty!17251)))

(declare-fun b!873004 () Bool)

(declare-fun res!593309 () Bool)

(declare-fun e!486147 () Bool)

(assert (=> b!873004 (=> (not res!593309) (not e!486147))))

(declare-datatypes ((array!50621 0))(
  ( (array!50622 (arr!24340 (Array (_ BitVec 32) (_ BitVec 64))) (size!24782 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50621)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50621 (_ BitVec 32)) Bool)

(assert (=> b!873004 (= res!593309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873005 () Bool)

(declare-fun res!593308 () Bool)

(assert (=> b!873005 (=> (not res!593308) (not e!486147))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28049 0))(
  ( (V!28050 (val!8673 Int)) )
))
(declare-datatypes ((ValueCell!8186 0))(
  ( (ValueCellFull!8186 (v!11096 V!28049)) (EmptyCell!8186) )
))
(declare-datatypes ((array!50623 0))(
  ( (array!50624 (arr!24341 (Array (_ BitVec 32) ValueCell!8186)) (size!24783 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50623)

(assert (=> b!873005 (= res!593308 (and (= (size!24783 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24782 _keys!868) (size!24783 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873006 () Bool)

(declare-fun res!593310 () Bool)

(assert (=> b!873006 (=> (not res!593310) (not e!486147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873006 (= res!593310 (validMask!0 mask!1196))))

(declare-fun b!873007 () Bool)

(declare-fun e!486146 () Bool)

(declare-fun mapRes!27482 () Bool)

(assert (=> b!873007 (= e!486146 (and e!486144 mapRes!27482))))

(declare-fun condMapEmpty!27482 () Bool)

(declare-fun mapDefault!27482 () ValueCell!8186)

(assert (=> b!873007 (= condMapEmpty!27482 (= (arr!24341 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8186)) mapDefault!27482)))))

(declare-fun mapNonEmpty!27482 () Bool)

(declare-fun tp!52709 () Bool)

(declare-fun e!486145 () Bool)

(assert (=> mapNonEmpty!27482 (= mapRes!27482 (and tp!52709 e!486145))))

(declare-fun mapValue!27482 () ValueCell!8186)

(declare-fun mapKey!27482 () (_ BitVec 32))

(declare-fun mapRest!27482 () (Array (_ BitVec 32) ValueCell!8186))

(assert (=> mapNonEmpty!27482 (= (arr!24341 _values!688) (store mapRest!27482 mapKey!27482 mapValue!27482))))

(declare-fun res!593307 () Bool)

(assert (=> start!74212 (=> (not res!593307) (not e!486147))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74212 (= res!593307 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24782 _keys!868))))))

(assert (=> start!74212 e!486147))

(assert (=> start!74212 true))

(declare-fun array_inv!19264 (array!50621) Bool)

(assert (=> start!74212 (array_inv!19264 _keys!868)))

(declare-fun array_inv!19265 (array!50623) Bool)

(assert (=> start!74212 (and (array_inv!19265 _values!688) e!486146)))

(declare-fun mapIsEmpty!27482 () Bool)

(assert (=> mapIsEmpty!27482 mapRes!27482))

(declare-fun b!873008 () Bool)

(assert (=> b!873008 (= e!486147 false)))

(declare-fun lt!395513 () Bool)

(declare-datatypes ((List!17294 0))(
  ( (Nil!17291) (Cons!17290 (h!18421 (_ BitVec 64)) (t!24324 List!17294)) )
))
(declare-fun arrayNoDuplicates!0 (array!50621 (_ BitVec 32) List!17294) Bool)

(assert (=> b!873008 (= lt!395513 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17291))))

(declare-fun b!873009 () Bool)

(assert (=> b!873009 (= e!486145 tp_is_empty!17251)))

(assert (= (and start!74212 res!593307) b!873006))

(assert (= (and b!873006 res!593310) b!873005))

(assert (= (and b!873005 res!593308) b!873004))

(assert (= (and b!873004 res!593309) b!873008))

(assert (= (and b!873007 condMapEmpty!27482) mapIsEmpty!27482))

(assert (= (and b!873007 (not condMapEmpty!27482)) mapNonEmpty!27482))

(get-info :version)

(assert (= (and mapNonEmpty!27482 ((_ is ValueCellFull!8186) mapValue!27482)) b!873009))

(assert (= (and b!873007 ((_ is ValueCellFull!8186) mapDefault!27482)) b!873003))

(assert (= start!74212 b!873007))

(declare-fun m!813071 () Bool)

(assert (=> b!873004 m!813071))

(declare-fun m!813073 () Bool)

(assert (=> mapNonEmpty!27482 m!813073))

(declare-fun m!813075 () Bool)

(assert (=> b!873006 m!813075))

(declare-fun m!813077 () Bool)

(assert (=> b!873008 m!813077))

(declare-fun m!813079 () Bool)

(assert (=> start!74212 m!813079))

(declare-fun m!813081 () Bool)

(assert (=> start!74212 m!813081))

(check-sat (not start!74212) tp_is_empty!17251 (not mapNonEmpty!27482) (not b!873006) (not b!873008) (not b!873004))
(check-sat)
