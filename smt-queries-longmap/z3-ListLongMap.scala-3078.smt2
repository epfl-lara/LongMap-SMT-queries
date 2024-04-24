; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43346 () Bool)

(assert start!43346)

(declare-fun b_free!12187 () Bool)

(declare-fun b_next!12187 () Bool)

(assert (=> start!43346 (= b_free!12187 (not b_next!12187))))

(declare-fun tp!42838 () Bool)

(declare-fun b_and!20953 () Bool)

(assert (=> start!43346 (= tp!42838 b_and!20953)))

(declare-fun b!480236 () Bool)

(declare-fun e!282577 () Bool)

(declare-fun tp_is_empty!13699 () Bool)

(assert (=> b!480236 (= e!282577 tp_is_empty!13699)))

(declare-fun res!286433 () Bool)

(declare-fun e!282580 () Bool)

(assert (=> start!43346 (=> (not res!286433) (not e!282580))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43346 (= res!286433 (validMask!0 mask!2352))))

(assert (=> start!43346 e!282580))

(assert (=> start!43346 true))

(assert (=> start!43346 tp_is_empty!13699))

(declare-datatypes ((V!19337 0))(
  ( (V!19338 (val!6897 Int)) )
))
(declare-datatypes ((ValueCell!6488 0))(
  ( (ValueCellFull!6488 (v!9189 V!19337)) (EmptyCell!6488) )
))
(declare-datatypes ((array!31054 0))(
  ( (array!31055 (arr!14931 (Array (_ BitVec 32) ValueCell!6488)) (size!15289 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31054)

(declare-fun e!282579 () Bool)

(declare-fun array_inv!10844 (array!31054) Bool)

(assert (=> start!43346 (and (array_inv!10844 _values!1516) e!282579)))

(assert (=> start!43346 tp!42838))

(declare-datatypes ((array!31056 0))(
  ( (array!31057 (arr!14932 (Array (_ BitVec 32) (_ BitVec 64))) (size!15290 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31056)

(declare-fun array_inv!10845 (array!31056) Bool)

(assert (=> start!43346 (array_inv!10845 _keys!1874)))

(declare-fun b!480237 () Bool)

(assert (=> b!480237 (= e!282580 (not true))))

(declare-fun lt!218136 () (_ BitVec 32))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31056 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480237 (= lt!218136 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!282581 () Bool)

(assert (=> b!480237 e!282581))

(declare-fun c!57739 () Bool)

(assert (=> b!480237 (= c!57739 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19337)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19337)

(declare-datatypes ((Unit!14051 0))(
  ( (Unit!14052) )
))
(declare-fun lt!218137 () Unit!14051)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!119 (array!31056 array!31054 (_ BitVec 32) (_ BitVec 32) V!19337 V!19337 (_ BitVec 64) Int) Unit!14051)

(assert (=> b!480237 (= lt!218137 (lemmaKeyInListMapIsInArray!119 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480238 () Bool)

(declare-fun arrayContainsKey!0 (array!31056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480238 (= e!282581 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480239 () Bool)

(declare-fun res!286436 () Bool)

(assert (=> b!480239 (=> (not res!286436) (not e!282580))))

(declare-datatypes ((tuple2!8968 0))(
  ( (tuple2!8969 (_1!4495 (_ BitVec 64)) (_2!4495 V!19337)) )
))
(declare-datatypes ((List!9038 0))(
  ( (Nil!9035) (Cons!9034 (h!9890 tuple2!8968) (t!15240 List!9038)) )
))
(declare-datatypes ((ListLongMap!7883 0))(
  ( (ListLongMap!7884 (toList!3957 List!9038)) )
))
(declare-fun contains!2587 (ListLongMap!7883 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2271 (array!31056 array!31054 (_ BitVec 32) (_ BitVec 32) V!19337 V!19337 (_ BitVec 32) Int) ListLongMap!7883)

(assert (=> b!480239 (= res!286436 (contains!2587 (getCurrentListMap!2271 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480240 () Bool)

(declare-fun res!286435 () Bool)

(assert (=> b!480240 (=> (not res!286435) (not e!282580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480240 (= res!286435 (validKeyInArray!0 k0!1332))))

(declare-fun mapIsEmpty!22252 () Bool)

(declare-fun mapRes!22252 () Bool)

(assert (=> mapIsEmpty!22252 mapRes!22252))

(declare-fun b!480241 () Bool)

(declare-fun res!286434 () Bool)

(assert (=> b!480241 (=> (not res!286434) (not e!282580))))

(assert (=> b!480241 (= res!286434 (and (= (size!15289 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15290 _keys!1874) (size!15289 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480242 () Bool)

(assert (=> b!480242 (= e!282581 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480243 () Bool)

(declare-fun res!286432 () Bool)

(assert (=> b!480243 (=> (not res!286432) (not e!282580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31056 (_ BitVec 32)) Bool)

(assert (=> b!480243 (= res!286432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480244 () Bool)

(declare-fun res!286431 () Bool)

(assert (=> b!480244 (=> (not res!286431) (not e!282580))))

(declare-datatypes ((List!9039 0))(
  ( (Nil!9036) (Cons!9035 (h!9891 (_ BitVec 64)) (t!15241 List!9039)) )
))
(declare-fun arrayNoDuplicates!0 (array!31056 (_ BitVec 32) List!9039) Bool)

(assert (=> b!480244 (= res!286431 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9036))))

(declare-fun b!480245 () Bool)

(assert (=> b!480245 (= e!282579 (and e!282577 mapRes!22252))))

(declare-fun condMapEmpty!22252 () Bool)

(declare-fun mapDefault!22252 () ValueCell!6488)

(assert (=> b!480245 (= condMapEmpty!22252 (= (arr!14931 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6488)) mapDefault!22252)))))

(declare-fun mapNonEmpty!22252 () Bool)

(declare-fun tp!42837 () Bool)

(declare-fun e!282582 () Bool)

(assert (=> mapNonEmpty!22252 (= mapRes!22252 (and tp!42837 e!282582))))

(declare-fun mapValue!22252 () ValueCell!6488)

(declare-fun mapKey!22252 () (_ BitVec 32))

(declare-fun mapRest!22252 () (Array (_ BitVec 32) ValueCell!6488))

(assert (=> mapNonEmpty!22252 (= (arr!14931 _values!1516) (store mapRest!22252 mapKey!22252 mapValue!22252))))

(declare-fun b!480246 () Bool)

(assert (=> b!480246 (= e!282582 tp_is_empty!13699)))

(assert (= (and start!43346 res!286433) b!480241))

(assert (= (and b!480241 res!286434) b!480243))

(assert (= (and b!480243 res!286432) b!480244))

(assert (= (and b!480244 res!286431) b!480239))

(assert (= (and b!480239 res!286436) b!480240))

(assert (= (and b!480240 res!286435) b!480237))

(assert (= (and b!480237 c!57739) b!480238))

(assert (= (and b!480237 (not c!57739)) b!480242))

(assert (= (and b!480245 condMapEmpty!22252) mapIsEmpty!22252))

(assert (= (and b!480245 (not condMapEmpty!22252)) mapNonEmpty!22252))

(get-info :version)

(assert (= (and mapNonEmpty!22252 ((_ is ValueCellFull!6488) mapValue!22252)) b!480246))

(assert (= (and b!480245 ((_ is ValueCellFull!6488) mapDefault!22252)) b!480236))

(assert (= start!43346 b!480245))

(declare-fun m!462169 () Bool)

(assert (=> mapNonEmpty!22252 m!462169))

(declare-fun m!462171 () Bool)

(assert (=> b!480243 m!462171))

(declare-fun m!462173 () Bool)

(assert (=> start!43346 m!462173))

(declare-fun m!462175 () Bool)

(assert (=> start!43346 m!462175))

(declare-fun m!462177 () Bool)

(assert (=> start!43346 m!462177))

(declare-fun m!462179 () Bool)

(assert (=> b!480239 m!462179))

(assert (=> b!480239 m!462179))

(declare-fun m!462181 () Bool)

(assert (=> b!480239 m!462181))

(declare-fun m!462183 () Bool)

(assert (=> b!480237 m!462183))

(declare-fun m!462185 () Bool)

(assert (=> b!480237 m!462185))

(declare-fun m!462187 () Bool)

(assert (=> b!480240 m!462187))

(declare-fun m!462189 () Bool)

(assert (=> b!480238 m!462189))

(declare-fun m!462191 () Bool)

(assert (=> b!480244 m!462191))

(check-sat (not b!480239) (not b!480237) tp_is_empty!13699 (not b!480244) (not b!480243) (not start!43346) b_and!20953 (not b!480238) (not b_next!12187) (not b!480240) (not mapNonEmpty!22252))
(check-sat b_and!20953 (not b_next!12187))
