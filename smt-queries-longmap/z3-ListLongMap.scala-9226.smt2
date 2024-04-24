; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110928 () Bool)

(assert start!110928)

(declare-fun b_free!29539 () Bool)

(declare-fun b_next!29539 () Bool)

(assert (=> start!110928 (= b_free!29539 (not b_next!29539))))

(declare-fun tp!103938 () Bool)

(declare-fun b_and!47749 () Bool)

(assert (=> start!110928 (= tp!103938 b_and!47749)))

(declare-fun res!870183 () Bool)

(declare-fun e!748247 () Bool)

(assert (=> start!110928 (=> (not res!870183) (not e!748247))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110928 (= res!870183 (validMask!0 mask!2040))))

(assert (=> start!110928 e!748247))

(assert (=> start!110928 tp!103938))

(declare-datatypes ((array!87591 0))(
  ( (array!87592 (arr!42271 (Array (_ BitVec 32) (_ BitVec 64))) (size!42822 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87591)

(declare-fun array_inv!32215 (array!87591) Bool)

(assert (=> start!110928 (array_inv!32215 _keys!1628)))

(assert (=> start!110928 true))

(declare-fun tp_is_empty!35269 () Bool)

(assert (=> start!110928 tp_is_empty!35269))

(declare-datatypes ((V!52129 0))(
  ( (V!52130 (val!17709 Int)) )
))
(declare-datatypes ((ValueCell!16736 0))(
  ( (ValueCellFull!16736 (v!20331 V!52129)) (EmptyCell!16736) )
))
(declare-datatypes ((array!87593 0))(
  ( (array!87594 (arr!42272 (Array (_ BitVec 32) ValueCell!16736)) (size!42823 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87593)

(declare-fun e!748249 () Bool)

(declare-fun array_inv!32216 (array!87593) Bool)

(assert (=> start!110928 (and (array_inv!32216 _values!1354) e!748249)))

(declare-fun b!1311346 () Bool)

(declare-fun res!870190 () Bool)

(assert (=> b!1311346 (=> (not res!870190) (not e!748247))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311346 (= res!870190 (validKeyInArray!0 (select (arr!42271 _keys!1628) from!2020)))))

(declare-fun b!1311347 () Bool)

(declare-fun e!748246 () Bool)

(declare-fun mapRes!54532 () Bool)

(assert (=> b!1311347 (= e!748249 (and e!748246 mapRes!54532))))

(declare-fun condMapEmpty!54532 () Bool)

(declare-fun mapDefault!54532 () ValueCell!16736)

(assert (=> b!1311347 (= condMapEmpty!54532 (= (arr!42272 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16736)) mapDefault!54532)))))

(declare-fun b!1311348 () Bool)

(declare-fun res!870185 () Bool)

(assert (=> b!1311348 (=> (not res!870185) (not e!748247))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1311348 (= res!870185 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42822 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54532 () Bool)

(declare-fun tp!103939 () Bool)

(declare-fun e!748248 () Bool)

(assert (=> mapNonEmpty!54532 (= mapRes!54532 (and tp!103939 e!748248))))

(declare-fun mapKey!54532 () (_ BitVec 32))

(declare-fun mapValue!54532 () ValueCell!16736)

(declare-fun mapRest!54532 () (Array (_ BitVec 32) ValueCell!16736))

(assert (=> mapNonEmpty!54532 (= (arr!42272 _values!1354) (store mapRest!54532 mapKey!54532 mapValue!54532))))

(declare-fun mapIsEmpty!54532 () Bool)

(assert (=> mapIsEmpty!54532 mapRes!54532))

(declare-fun b!1311349 () Bool)

(declare-fun res!870184 () Bool)

(assert (=> b!1311349 (=> (not res!870184) (not e!748247))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311349 (= res!870184 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311350 () Bool)

(declare-fun res!870186 () Bool)

(assert (=> b!1311350 (=> (not res!870186) (not e!748247))))

(assert (=> b!1311350 (= res!870186 (and (= (size!42823 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42822 _keys!1628) (size!42823 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311351 () Bool)

(declare-fun res!870188 () Bool)

(assert (=> b!1311351 (=> (not res!870188) (not e!748247))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52129)

(declare-fun zeroValue!1296 () V!52129)

(declare-datatypes ((tuple2!22854 0))(
  ( (tuple2!22855 (_1!11438 (_ BitVec 64)) (_2!11438 V!52129)) )
))
(declare-datatypes ((List!30010 0))(
  ( (Nil!30007) (Cons!30006 (h!31224 tuple2!22854) (t!43608 List!30010)) )
))
(declare-datatypes ((ListLongMap!20519 0))(
  ( (ListLongMap!20520 (toList!10275 List!30010)) )
))
(declare-fun contains!8437 (ListLongMap!20519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5279 (array!87591 array!87593 (_ BitVec 32) (_ BitVec 32) V!52129 V!52129 (_ BitVec 32) Int) ListLongMap!20519)

(assert (=> b!1311351 (= res!870188 (contains!8437 (getCurrentListMap!5279 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311352 () Bool)

(assert (=> b!1311352 (= e!748246 tp_is_empty!35269)))

(declare-fun b!1311353 () Bool)

(assert (=> b!1311353 (= e!748247 (not true))))

(assert (=> b!1311353 (contains!8437 (getCurrentListMap!5279 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43293 0))(
  ( (Unit!43294) )
))
(declare-fun lt!585803 () Unit!43293)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!8 (array!87591 array!87593 (_ BitVec 32) (_ BitVec 32) V!52129 V!52129 (_ BitVec 64) (_ BitVec 32) Int) Unit!43293)

(assert (=> b!1311353 (= lt!585803 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!8 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311354 () Bool)

(declare-fun res!870189 () Bool)

(assert (=> b!1311354 (=> (not res!870189) (not e!748247))))

(assert (=> b!1311354 (= res!870189 (not (= (select (arr!42271 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311355 () Bool)

(declare-fun res!870191 () Bool)

(assert (=> b!1311355 (=> (not res!870191) (not e!748247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87591 (_ BitVec 32)) Bool)

(assert (=> b!1311355 (= res!870191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311356 () Bool)

(assert (=> b!1311356 (= e!748248 tp_is_empty!35269)))

(declare-fun b!1311357 () Bool)

(declare-fun res!870187 () Bool)

(assert (=> b!1311357 (=> (not res!870187) (not e!748247))))

(declare-datatypes ((List!30011 0))(
  ( (Nil!30008) (Cons!30007 (h!31225 (_ BitVec 64)) (t!43609 List!30011)) )
))
(declare-fun arrayNoDuplicates!0 (array!87591 (_ BitVec 32) List!30011) Bool)

(assert (=> b!1311357 (= res!870187 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30008))))

(assert (= (and start!110928 res!870183) b!1311350))

(assert (= (and b!1311350 res!870186) b!1311355))

(assert (= (and b!1311355 res!870191) b!1311357))

(assert (= (and b!1311357 res!870187) b!1311348))

(assert (= (and b!1311348 res!870185) b!1311351))

(assert (= (and b!1311351 res!870188) b!1311354))

(assert (= (and b!1311354 res!870189) b!1311346))

(assert (= (and b!1311346 res!870190) b!1311349))

(assert (= (and b!1311349 res!870184) b!1311353))

(assert (= (and b!1311347 condMapEmpty!54532) mapIsEmpty!54532))

(assert (= (and b!1311347 (not condMapEmpty!54532)) mapNonEmpty!54532))

(get-info :version)

(assert (= (and mapNonEmpty!54532 ((_ is ValueCellFull!16736) mapValue!54532)) b!1311356))

(assert (= (and b!1311347 ((_ is ValueCellFull!16736) mapDefault!54532)) b!1311352))

(assert (= start!110928 b!1311347))

(declare-fun m!1201535 () Bool)

(assert (=> b!1311354 m!1201535))

(declare-fun m!1201537 () Bool)

(assert (=> b!1311351 m!1201537))

(assert (=> b!1311351 m!1201537))

(declare-fun m!1201539 () Bool)

(assert (=> b!1311351 m!1201539))

(assert (=> b!1311346 m!1201535))

(assert (=> b!1311346 m!1201535))

(declare-fun m!1201541 () Bool)

(assert (=> b!1311346 m!1201541))

(declare-fun m!1201543 () Bool)

(assert (=> b!1311357 m!1201543))

(declare-fun m!1201545 () Bool)

(assert (=> mapNonEmpty!54532 m!1201545))

(declare-fun m!1201547 () Bool)

(assert (=> b!1311355 m!1201547))

(declare-fun m!1201549 () Bool)

(assert (=> b!1311353 m!1201549))

(assert (=> b!1311353 m!1201549))

(declare-fun m!1201551 () Bool)

(assert (=> b!1311353 m!1201551))

(declare-fun m!1201553 () Bool)

(assert (=> b!1311353 m!1201553))

(declare-fun m!1201555 () Bool)

(assert (=> start!110928 m!1201555))

(declare-fun m!1201557 () Bool)

(assert (=> start!110928 m!1201557))

(declare-fun m!1201559 () Bool)

(assert (=> start!110928 m!1201559))

(check-sat (not start!110928) (not b!1311357) b_and!47749 (not b!1311353) (not b!1311355) (not mapNonEmpty!54532) (not b!1311351) tp_is_empty!35269 (not b_next!29539) (not b!1311346))
(check-sat b_and!47749 (not b_next!29539))
