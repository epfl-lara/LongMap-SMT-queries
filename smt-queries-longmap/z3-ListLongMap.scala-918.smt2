; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20608 () Bool)

(assert start!20608)

(declare-fun b_free!5263 () Bool)

(declare-fun b_next!5263 () Bool)

(assert (=> start!20608 (= b_free!5263 (not b_next!5263))))

(declare-fun tp!18821 () Bool)

(declare-fun b_and!12023 () Bool)

(assert (=> start!20608 (= tp!18821 b_and!12023)))

(declare-fun b!205427 () Bool)

(declare-fun e!134338 () Bool)

(declare-fun e!134336 () Bool)

(declare-fun mapRes!8747 () Bool)

(assert (=> b!205427 (= e!134338 (and e!134336 mapRes!8747))))

(declare-fun condMapEmpty!8747 () Bool)

(declare-datatypes ((V!6473 0))(
  ( (V!6474 (val!2604 Int)) )
))
(declare-datatypes ((ValueCell!2216 0))(
  ( (ValueCellFull!2216 (v!4575 V!6473)) (EmptyCell!2216) )
))
(declare-datatypes ((array!9447 0))(
  ( (array!9448 (arr!4474 (Array (_ BitVec 32) ValueCell!2216)) (size!4799 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9447)

(declare-fun mapDefault!8747 () ValueCell!2216)

(assert (=> b!205427 (= condMapEmpty!8747 (= (arr!4474 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2216)) mapDefault!8747)))))

(declare-fun b!205428 () Bool)

(declare-fun res!99234 () Bool)

(declare-fun e!134339 () Bool)

(assert (=> b!205428 (=> (not res!99234) (not e!134339))))

(declare-datatypes ((array!9449 0))(
  ( (array!9450 (arr!4475 (Array (_ BitVec 32) (_ BitVec 64))) (size!4800 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9449)

(declare-datatypes ((List!2793 0))(
  ( (Nil!2790) (Cons!2789 (h!3431 (_ BitVec 64)) (t!7716 List!2793)) )
))
(declare-fun arrayNoDuplicates!0 (array!9449 (_ BitVec 32) List!2793) Bool)

(assert (=> b!205428 (= res!99234 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2790))))

(declare-fun res!99233 () Bool)

(assert (=> start!20608 (=> (not res!99233) (not e!134339))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20608 (= res!99233 (validMask!0 mask!1149))))

(assert (=> start!20608 e!134339))

(declare-fun array_inv!2931 (array!9447) Bool)

(assert (=> start!20608 (and (array_inv!2931 _values!649) e!134338)))

(assert (=> start!20608 true))

(declare-fun tp_is_empty!5119 () Bool)

(assert (=> start!20608 tp_is_empty!5119))

(declare-fun array_inv!2932 (array!9449) Bool)

(assert (=> start!20608 (array_inv!2932 _keys!825)))

(assert (=> start!20608 tp!18821))

(declare-fun b!205429 () Bool)

(declare-fun res!99240 () Bool)

(assert (=> b!205429 (=> (not res!99240) (not e!134339))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205429 (= res!99240 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4800 _keys!825))))))

(declare-fun mapNonEmpty!8747 () Bool)

(declare-fun tp!18820 () Bool)

(declare-fun e!134333 () Bool)

(assert (=> mapNonEmpty!8747 (= mapRes!8747 (and tp!18820 e!134333))))

(declare-fun mapRest!8747 () (Array (_ BitVec 32) ValueCell!2216))

(declare-fun mapKey!8747 () (_ BitVec 32))

(declare-fun mapValue!8747 () ValueCell!2216)

(assert (=> mapNonEmpty!8747 (= (arr!4474 _values!649) (store mapRest!8747 mapKey!8747 mapValue!8747))))

(declare-fun b!205430 () Bool)

(assert (=> b!205430 (= e!134333 tp_is_empty!5119)))

(declare-fun b!205431 () Bool)

(declare-fun res!99237 () Bool)

(assert (=> b!205431 (=> (not res!99237) (not e!134339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9449 (_ BitVec 32)) Bool)

(assert (=> b!205431 (= res!99237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205432 () Bool)

(declare-fun e!134335 () Bool)

(assert (=> b!205432 (= e!134339 (not e!134335))))

(declare-fun res!99239 () Bool)

(assert (=> b!205432 (=> res!99239 e!134335)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205432 (= res!99239 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3900 0))(
  ( (tuple2!3901 (_1!1961 (_ BitVec 64)) (_2!1961 V!6473)) )
))
(declare-datatypes ((List!2794 0))(
  ( (Nil!2791) (Cons!2790 (h!3432 tuple2!3900) (t!7717 List!2794)) )
))
(declare-datatypes ((ListLongMap!2815 0))(
  ( (ListLongMap!2816 (toList!1423 List!2794)) )
))
(declare-fun lt!104575 () ListLongMap!2815)

(declare-fun zeroValue!615 () V!6473)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6473)

(declare-fun getCurrentListMap!997 (array!9449 array!9447 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) Int) ListLongMap!2815)

(assert (=> b!205432 (= lt!104575 (getCurrentListMap!997 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104576 () ListLongMap!2815)

(declare-fun lt!104572 () array!9447)

(assert (=> b!205432 (= lt!104576 (getCurrentListMap!997 _keys!825 lt!104572 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104578 () ListLongMap!2815)

(declare-fun lt!104577 () ListLongMap!2815)

(assert (=> b!205432 (and (= lt!104578 lt!104577) (= lt!104577 lt!104578))))

(declare-fun lt!104582 () ListLongMap!2815)

(declare-fun lt!104574 () tuple2!3900)

(declare-fun +!477 (ListLongMap!2815 tuple2!3900) ListLongMap!2815)

(assert (=> b!205432 (= lt!104577 (+!477 lt!104582 lt!104574))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6473)

(assert (=> b!205432 (= lt!104574 (tuple2!3901 k0!843 v!520))))

(declare-datatypes ((Unit!6232 0))(
  ( (Unit!6233) )
))
(declare-fun lt!104579 () Unit!6232)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!133 (array!9449 array!9447 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) (_ BitVec 64) V!6473 (_ BitVec 32) Int) Unit!6232)

(assert (=> b!205432 (= lt!104579 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!133 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!390 (array!9449 array!9447 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) Int) ListLongMap!2815)

(assert (=> b!205432 (= lt!104578 (getCurrentListMapNoExtraKeys!390 _keys!825 lt!104572 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205432 (= lt!104572 (array!9448 (store (arr!4474 _values!649) i!601 (ValueCellFull!2216 v!520)) (size!4799 _values!649)))))

(assert (=> b!205432 (= lt!104582 (getCurrentListMapNoExtraKeys!390 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205433 () Bool)

(declare-fun res!99235 () Bool)

(assert (=> b!205433 (=> (not res!99235) (not e!134339))))

(assert (=> b!205433 (= res!99235 (and (= (size!4799 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4800 _keys!825) (size!4799 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8747 () Bool)

(assert (=> mapIsEmpty!8747 mapRes!8747))

(declare-fun b!205434 () Bool)

(declare-fun e!134337 () Bool)

(assert (=> b!205434 (= e!134335 e!134337)))

(declare-fun res!99236 () Bool)

(assert (=> b!205434 (=> res!99236 e!134337)))

(assert (=> b!205434 (= res!99236 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104571 () ListLongMap!2815)

(assert (=> b!205434 (= lt!104575 lt!104571)))

(declare-fun lt!104581 () tuple2!3900)

(assert (=> b!205434 (= lt!104571 (+!477 lt!104582 lt!104581))))

(declare-fun lt!104573 () ListLongMap!2815)

(assert (=> b!205434 (= lt!104576 lt!104573)))

(assert (=> b!205434 (= lt!104573 (+!477 lt!104577 lt!104581))))

(assert (=> b!205434 (= lt!104576 (+!477 lt!104578 lt!104581))))

(assert (=> b!205434 (= lt!104581 (tuple2!3901 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205435 () Bool)

(assert (=> b!205435 (= e!134336 tp_is_empty!5119)))

(declare-fun b!205436 () Bool)

(assert (=> b!205436 (= e!134337 (bvsle #b00000000000000000000000000000000 (size!4800 _keys!825)))))

(assert (=> b!205436 (= lt!104573 (+!477 lt!104571 lt!104574))))

(declare-fun lt!104580 () Unit!6232)

(declare-fun addCommutativeForDiffKeys!181 (ListLongMap!2815 (_ BitVec 64) V!6473 (_ BitVec 64) V!6473) Unit!6232)

(assert (=> b!205436 (= lt!104580 (addCommutativeForDiffKeys!181 lt!104582 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205437 () Bool)

(declare-fun res!99238 () Bool)

(assert (=> b!205437 (=> (not res!99238) (not e!134339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205437 (= res!99238 (validKeyInArray!0 k0!843))))

(declare-fun b!205438 () Bool)

(declare-fun res!99241 () Bool)

(assert (=> b!205438 (=> (not res!99241) (not e!134339))))

(assert (=> b!205438 (= res!99241 (= (select (arr!4475 _keys!825) i!601) k0!843))))

(assert (= (and start!20608 res!99233) b!205433))

(assert (= (and b!205433 res!99235) b!205431))

(assert (= (and b!205431 res!99237) b!205428))

(assert (= (and b!205428 res!99234) b!205429))

(assert (= (and b!205429 res!99240) b!205437))

(assert (= (and b!205437 res!99238) b!205438))

(assert (= (and b!205438 res!99241) b!205432))

(assert (= (and b!205432 (not res!99239)) b!205434))

(assert (= (and b!205434 (not res!99236)) b!205436))

(assert (= (and b!205427 condMapEmpty!8747) mapIsEmpty!8747))

(assert (= (and b!205427 (not condMapEmpty!8747)) mapNonEmpty!8747))

(get-info :version)

(assert (= (and mapNonEmpty!8747 ((_ is ValueCellFull!2216) mapValue!8747)) b!205430))

(assert (= (and b!205427 ((_ is ValueCellFull!2216) mapDefault!8747)) b!205435))

(assert (= start!20608 b!205427))

(declare-fun m!233181 () Bool)

(assert (=> b!205438 m!233181))

(declare-fun m!233183 () Bool)

(assert (=> mapNonEmpty!8747 m!233183))

(declare-fun m!233185 () Bool)

(assert (=> b!205432 m!233185))

(declare-fun m!233187 () Bool)

(assert (=> b!205432 m!233187))

(declare-fun m!233189 () Bool)

(assert (=> b!205432 m!233189))

(declare-fun m!233191 () Bool)

(assert (=> b!205432 m!233191))

(declare-fun m!233193 () Bool)

(assert (=> b!205432 m!233193))

(declare-fun m!233195 () Bool)

(assert (=> b!205432 m!233195))

(declare-fun m!233197 () Bool)

(assert (=> b!205432 m!233197))

(declare-fun m!233199 () Bool)

(assert (=> start!20608 m!233199))

(declare-fun m!233201 () Bool)

(assert (=> start!20608 m!233201))

(declare-fun m!233203 () Bool)

(assert (=> start!20608 m!233203))

(declare-fun m!233205 () Bool)

(assert (=> b!205428 m!233205))

(declare-fun m!233207 () Bool)

(assert (=> b!205431 m!233207))

(declare-fun m!233209 () Bool)

(assert (=> b!205436 m!233209))

(declare-fun m!233211 () Bool)

(assert (=> b!205436 m!233211))

(declare-fun m!233213 () Bool)

(assert (=> b!205437 m!233213))

(declare-fun m!233215 () Bool)

(assert (=> b!205434 m!233215))

(declare-fun m!233217 () Bool)

(assert (=> b!205434 m!233217))

(declare-fun m!233219 () Bool)

(assert (=> b!205434 m!233219))

(check-sat (not b!205437) (not b_next!5263) (not b!205428) (not b!205434) (not b!205431) (not mapNonEmpty!8747) (not b!205432) tp_is_empty!5119 (not b!205436) (not start!20608) b_and!12023)
(check-sat b_and!12023 (not b_next!5263))
