; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72834 () Bool)

(assert start!72834)

(declare-fun b_free!13749 () Bool)

(declare-fun b_next!13749 () Bool)

(assert (=> start!72834 (= b_free!13749 (not b_next!13749))))

(declare-fun tp!48751 () Bool)

(declare-fun b_and!22835 () Bool)

(assert (=> start!72834 (= tp!48751 b_and!22835)))

(declare-fun b!845242 () Bool)

(declare-fun e!471877 () Bool)

(declare-fun tp_is_empty!15885 () Bool)

(assert (=> b!845242 (= e!471877 tp_is_empty!15885)))

(declare-fun b!845243 () Bool)

(declare-fun res!574199 () Bool)

(declare-fun e!471875 () Bool)

(assert (=> b!845243 (=> (not res!574199) (not e!471875))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47990 0))(
  ( (array!47991 (arr!23026 (Array (_ BitVec 32) (_ BitVec 64))) (size!23466 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47990)

(assert (=> b!845243 (= res!574199 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23466 _keys!868))))))

(declare-fun b!845244 () Bool)

(declare-fun res!574201 () Bool)

(assert (=> b!845244 (=> (not res!574201) (not e!471875))))

(declare-datatypes ((List!16299 0))(
  ( (Nil!16296) (Cons!16295 (h!17426 (_ BitVec 64)) (t!22670 List!16299)) )
))
(declare-fun arrayNoDuplicates!0 (array!47990 (_ BitVec 32) List!16299) Bool)

(assert (=> b!845244 (= res!574201 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16296))))

(declare-fun mapIsEmpty!25427 () Bool)

(declare-fun mapRes!25427 () Bool)

(assert (=> mapIsEmpty!25427 mapRes!25427))

(declare-fun b!845245 () Bool)

(declare-fun e!471876 () Bool)

(assert (=> b!845245 (= e!471876 tp_is_empty!15885)))

(declare-fun b!845246 () Bool)

(declare-fun res!574202 () Bool)

(assert (=> b!845246 (=> (not res!574202) (not e!471875))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845246 (= res!574202 (and (= (select (arr!23026 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845247 () Bool)

(declare-fun res!574204 () Bool)

(assert (=> b!845247 (=> (not res!574204) (not e!471875))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26227 0))(
  ( (V!26228 (val!7990 Int)) )
))
(declare-datatypes ((ValueCell!7503 0))(
  ( (ValueCellFull!7503 (v!10415 V!26227)) (EmptyCell!7503) )
))
(declare-datatypes ((array!47992 0))(
  ( (array!47993 (arr!23027 (Array (_ BitVec 32) ValueCell!7503)) (size!23467 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47992)

(assert (=> b!845247 (= res!574204 (and (= (size!23467 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23466 _keys!868) (size!23467 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845249 () Bool)

(declare-fun res!574205 () Bool)

(assert (=> b!845249 (=> (not res!574205) (not e!471875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845249 (= res!574205 (validMask!0 mask!1196))))

(declare-fun b!845250 () Bool)

(declare-fun res!574200 () Bool)

(assert (=> b!845250 (=> (not res!574200) (not e!471875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47990 (_ BitVec 32)) Bool)

(assert (=> b!845250 (= res!574200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25427 () Bool)

(declare-fun tp!48750 () Bool)

(assert (=> mapNonEmpty!25427 (= mapRes!25427 (and tp!48750 e!471876))))

(declare-fun mapRest!25427 () (Array (_ BitVec 32) ValueCell!7503))

(declare-fun mapKey!25427 () (_ BitVec 32))

(declare-fun mapValue!25427 () ValueCell!7503)

(assert (=> mapNonEmpty!25427 (= (arr!23027 _values!688) (store mapRest!25427 mapKey!25427 mapValue!25427))))

(declare-fun b!845251 () Bool)

(assert (=> b!845251 (= e!471875 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10436 0))(
  ( (tuple2!10437 (_1!5229 (_ BitVec 64)) (_2!5229 V!26227)) )
))
(declare-datatypes ((List!16300 0))(
  ( (Nil!16297) (Cons!16296 (h!17427 tuple2!10436) (t!22671 List!16300)) )
))
(declare-datatypes ((ListLongMap!9205 0))(
  ( (ListLongMap!9206 (toList!4618 List!16300)) )
))
(declare-fun lt!381394 () ListLongMap!9205)

(declare-fun minValue!654 () V!26227)

(declare-fun zeroValue!654 () V!26227)

(declare-fun getCurrentListMapNoExtraKeys!2603 (array!47990 array!47992 (_ BitVec 32) (_ BitVec 32) V!26227 V!26227 (_ BitVec 32) Int) ListLongMap!9205)

(assert (=> b!845251 (= lt!381394 (getCurrentListMapNoExtraKeys!2603 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845252 () Bool)

(declare-fun res!574203 () Bool)

(assert (=> b!845252 (=> (not res!574203) (not e!471875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845252 (= res!574203 (validKeyInArray!0 k0!854))))

(declare-fun res!574198 () Bool)

(assert (=> start!72834 (=> (not res!574198) (not e!471875))))

(assert (=> start!72834 (= res!574198 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23466 _keys!868))))))

(assert (=> start!72834 e!471875))

(assert (=> start!72834 true))

(assert (=> start!72834 tp!48751))

(declare-fun array_inv!18298 (array!47990) Bool)

(assert (=> start!72834 (array_inv!18298 _keys!868)))

(declare-fun e!471873 () Bool)

(declare-fun array_inv!18299 (array!47992) Bool)

(assert (=> start!72834 (and (array_inv!18299 _values!688) e!471873)))

(assert (=> start!72834 tp_is_empty!15885))

(declare-fun b!845248 () Bool)

(assert (=> b!845248 (= e!471873 (and e!471877 mapRes!25427))))

(declare-fun condMapEmpty!25427 () Bool)

(declare-fun mapDefault!25427 () ValueCell!7503)

(assert (=> b!845248 (= condMapEmpty!25427 (= (arr!23027 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7503)) mapDefault!25427)))))

(assert (= (and start!72834 res!574198) b!845249))

(assert (= (and b!845249 res!574205) b!845247))

(assert (= (and b!845247 res!574204) b!845250))

(assert (= (and b!845250 res!574200) b!845244))

(assert (= (and b!845244 res!574201) b!845243))

(assert (= (and b!845243 res!574199) b!845252))

(assert (= (and b!845252 res!574203) b!845246))

(assert (= (and b!845246 res!574202) b!845251))

(assert (= (and b!845248 condMapEmpty!25427) mapIsEmpty!25427))

(assert (= (and b!845248 (not condMapEmpty!25427)) mapNonEmpty!25427))

(get-info :version)

(assert (= (and mapNonEmpty!25427 ((_ is ValueCellFull!7503) mapValue!25427)) b!845245))

(assert (= (and b!845248 ((_ is ValueCellFull!7503) mapDefault!25427)) b!845242))

(assert (= start!72834 b!845248))

(declare-fun m!787143 () Bool)

(assert (=> b!845249 m!787143))

(declare-fun m!787145 () Bool)

(assert (=> b!845250 m!787145))

(declare-fun m!787147 () Bool)

(assert (=> start!72834 m!787147))

(declare-fun m!787149 () Bool)

(assert (=> start!72834 m!787149))

(declare-fun m!787151 () Bool)

(assert (=> b!845246 m!787151))

(declare-fun m!787153 () Bool)

(assert (=> b!845244 m!787153))

(declare-fun m!787155 () Bool)

(assert (=> b!845252 m!787155))

(declare-fun m!787157 () Bool)

(assert (=> mapNonEmpty!25427 m!787157))

(declare-fun m!787159 () Bool)

(assert (=> b!845251 m!787159))

(check-sat (not b_next!13749) (not b!845251) (not mapNonEmpty!25427) tp_is_empty!15885 (not b!845250) (not b!845252) (not b!845249) (not b!845244) (not start!72834) b_and!22835)
(check-sat b_and!22835 (not b_next!13749))
