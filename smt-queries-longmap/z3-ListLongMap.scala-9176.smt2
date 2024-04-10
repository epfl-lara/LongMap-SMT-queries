; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110362 () Bool)

(assert start!110362)

(declare-fun b!1306128 () Bool)

(declare-fun e!745076 () Bool)

(declare-fun tp_is_empty!34971 () Bool)

(assert (=> b!1306128 (= e!745076 tp_is_empty!34971)))

(declare-fun b!1306129 () Bool)

(declare-fun e!745073 () Bool)

(declare-fun e!745077 () Bool)

(declare-fun mapRes!54070 () Bool)

(assert (=> b!1306129 (= e!745073 (and e!745077 mapRes!54070))))

(declare-fun condMapEmpty!54070 () Bool)

(declare-datatypes ((V!51731 0))(
  ( (V!51732 (val!17560 Int)) )
))
(declare-datatypes ((ValueCell!16587 0))(
  ( (ValueCellFull!16587 (v!20186 V!51731)) (EmptyCell!16587) )
))
(declare-datatypes ((array!86956 0))(
  ( (array!86957 (arr!41963 (Array (_ BitVec 32) ValueCell!16587)) (size!42513 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86956)

(declare-fun mapDefault!54070 () ValueCell!16587)

(assert (=> b!1306129 (= condMapEmpty!54070 (= (arr!41963 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16587)) mapDefault!54070)))))

(declare-fun b!1306130 () Bool)

(assert (=> b!1306130 (= e!745077 tp_is_empty!34971)))

(declare-fun mapNonEmpty!54070 () Bool)

(declare-fun tp!103150 () Bool)

(assert (=> mapNonEmpty!54070 (= mapRes!54070 (and tp!103150 e!745076))))

(declare-fun mapRest!54070 () (Array (_ BitVec 32) ValueCell!16587))

(declare-fun mapKey!54070 () (_ BitVec 32))

(declare-fun mapValue!54070 () ValueCell!16587)

(assert (=> mapNonEmpty!54070 (= (arr!41963 _values!1354) (store mapRest!54070 mapKey!54070 mapValue!54070))))

(declare-datatypes ((array!86958 0))(
  ( (array!86959 (arr!41964 (Array (_ BitVec 32) (_ BitVec 64))) (size!42514 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86958)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun b!1306131 () Bool)

(declare-fun e!745075 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306131 (= e!745075 (and (= (size!42513 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42514 _keys!1628) (size!42513 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011) (= (size!42514 _keys!1628) (bvadd #b00000000000000000000000000000001 mask!2040)) (bvsgt #b00000000000000000000000000000000 (size!42514 _keys!1628))))))

(declare-fun res!867151 () Bool)

(assert (=> start!110362 (=> (not res!867151) (not e!745075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110362 (= res!867151 (validMask!0 mask!2040))))

(assert (=> start!110362 e!745075))

(assert (=> start!110362 true))

(declare-fun array_inv!31729 (array!86956) Bool)

(assert (=> start!110362 (and (array_inv!31729 _values!1354) e!745073)))

(declare-fun array_inv!31730 (array!86958) Bool)

(assert (=> start!110362 (array_inv!31730 _keys!1628)))

(declare-fun mapIsEmpty!54070 () Bool)

(assert (=> mapIsEmpty!54070 mapRes!54070))

(assert (= (and start!110362 res!867151) b!1306131))

(assert (= (and b!1306129 condMapEmpty!54070) mapIsEmpty!54070))

(assert (= (and b!1306129 (not condMapEmpty!54070)) mapNonEmpty!54070))

(get-info :version)

(assert (= (and mapNonEmpty!54070 ((_ is ValueCellFull!16587) mapValue!54070)) b!1306128))

(assert (= (and b!1306129 ((_ is ValueCellFull!16587) mapDefault!54070)) b!1306130))

(assert (= start!110362 b!1306129))

(declare-fun m!1197289 () Bool)

(assert (=> mapNonEmpty!54070 m!1197289))

(declare-fun m!1197291 () Bool)

(assert (=> start!110362 m!1197291))

(declare-fun m!1197293 () Bool)

(assert (=> start!110362 m!1197293))

(declare-fun m!1197295 () Bool)

(assert (=> start!110362 m!1197295))

(check-sat (not start!110362) (not mapNonEmpty!54070) tp_is_empty!34971)
(check-sat)
(get-model)

(declare-fun d!142215 () Bool)

(assert (=> d!142215 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110362 d!142215))

(declare-fun d!142217 () Bool)

(assert (=> d!142217 (= (array_inv!31729 _values!1354) (bvsge (size!42513 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110362 d!142217))

(declare-fun d!142219 () Bool)

(assert (=> d!142219 (= (array_inv!31730 _keys!1628) (bvsge (size!42514 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110362 d!142219))

(declare-fun mapNonEmpty!54076 () Bool)

(declare-fun mapRes!54076 () Bool)

(declare-fun tp!103156 () Bool)

(declare-fun e!745098 () Bool)

(assert (=> mapNonEmpty!54076 (= mapRes!54076 (and tp!103156 e!745098))))

(declare-fun mapValue!54076 () ValueCell!16587)

(declare-fun mapKey!54076 () (_ BitVec 32))

(declare-fun mapRest!54076 () (Array (_ BitVec 32) ValueCell!16587))

(assert (=> mapNonEmpty!54076 (= mapRest!54070 (store mapRest!54076 mapKey!54076 mapValue!54076))))

(declare-fun mapIsEmpty!54076 () Bool)

(assert (=> mapIsEmpty!54076 mapRes!54076))

(declare-fun b!1306150 () Bool)

(assert (=> b!1306150 (= e!745098 tp_is_empty!34971)))

(declare-fun b!1306151 () Bool)

(declare-fun e!745097 () Bool)

(assert (=> b!1306151 (= e!745097 tp_is_empty!34971)))

(declare-fun condMapEmpty!54076 () Bool)

(declare-fun mapDefault!54076 () ValueCell!16587)

(assert (=> mapNonEmpty!54070 (= condMapEmpty!54076 (= mapRest!54070 ((as const (Array (_ BitVec 32) ValueCell!16587)) mapDefault!54076)))))

(assert (=> mapNonEmpty!54070 (= tp!103150 (and e!745097 mapRes!54076))))

(assert (= (and mapNonEmpty!54070 condMapEmpty!54076) mapIsEmpty!54076))

(assert (= (and mapNonEmpty!54070 (not condMapEmpty!54076)) mapNonEmpty!54076))

(assert (= (and mapNonEmpty!54076 ((_ is ValueCellFull!16587) mapValue!54076)) b!1306150))

(assert (= (and mapNonEmpty!54070 ((_ is ValueCellFull!16587) mapDefault!54076)) b!1306151))

(declare-fun m!1197305 () Bool)

(assert (=> mapNonEmpty!54076 m!1197305))

(check-sat (not mapNonEmpty!54076) tp_is_empty!34971)
(check-sat)
