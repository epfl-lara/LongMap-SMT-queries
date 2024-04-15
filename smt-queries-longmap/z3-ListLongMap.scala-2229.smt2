; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36822 () Bool)

(assert start!36822)

(declare-fun b_free!7963 () Bool)

(declare-fun b_next!7963 () Bool)

(assert (=> start!36822 (= b_free!7963 (not b_next!7963))))

(declare-fun tp!28605 () Bool)

(declare-fun b_and!15179 () Bool)

(assert (=> start!36822 (= tp!28605 b_and!15179)))

(declare-fun b!368047 () Bool)

(declare-fun e!225104 () Bool)

(declare-fun tp_is_empty!8611 () Bool)

(assert (=> b!368047 (= e!225104 tp_is_empty!8611)))

(declare-fun b!368048 () Bool)

(declare-fun res!206269 () Bool)

(declare-fun e!225103 () Bool)

(assert (=> b!368048 (=> (not res!206269) (not e!225103))))

(declare-datatypes ((array!21159 0))(
  ( (array!21160 (arr!10048 (Array (_ BitVec 32) (_ BitVec 64))) (size!10401 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21159)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368048 (= res!206269 (or (= (select (arr!10048 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10048 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368049 () Bool)

(declare-fun res!206262 () Bool)

(assert (=> b!368049 (=> (not res!206262) (not e!225103))))

(declare-datatypes ((List!5561 0))(
  ( (Nil!5558) (Cons!5557 (h!6413 (_ BitVec 64)) (t!10702 List!5561)) )
))
(declare-fun arrayNoDuplicates!0 (array!21159 (_ BitVec 32) List!5561) Bool)

(assert (=> b!368049 (= res!206262 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5558))))

(declare-fun b!368050 () Bool)

(declare-fun res!206261 () Bool)

(assert (=> b!368050 (=> (not res!206261) (not e!225103))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12587 0))(
  ( (V!12588 (val!4350 Int)) )
))
(declare-datatypes ((ValueCell!3962 0))(
  ( (ValueCellFull!3962 (v!6541 V!12587)) (EmptyCell!3962) )
))
(declare-datatypes ((array!21161 0))(
  ( (array!21162 (arr!10049 (Array (_ BitVec 32) ValueCell!3962)) (size!10402 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21161)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!368050 (= res!206261 (and (= (size!10402 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10401 _keys!658) (size!10402 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368051 () Bool)

(declare-fun res!206268 () Bool)

(assert (=> b!368051 (=> (not res!206268) (not e!225103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21159 (_ BitVec 32)) Bool)

(assert (=> b!368051 (= res!206268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368053 () Bool)

(declare-fun res!206270 () Bool)

(assert (=> b!368053 (=> (not res!206270) (not e!225103))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368053 (= res!206270 (validKeyInArray!0 k0!778))))

(declare-fun b!368054 () Bool)

(declare-fun e!225106 () Bool)

(assert (=> b!368054 (= e!225106 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5732 0))(
  ( (tuple2!5733 (_1!2877 (_ BitVec 64)) (_2!2877 V!12587)) )
))
(declare-datatypes ((List!5562 0))(
  ( (Nil!5559) (Cons!5558 (h!6414 tuple2!5732) (t!10703 List!5562)) )
))
(declare-datatypes ((ListLongMap!4635 0))(
  ( (ListLongMap!4636 (toList!2333 List!5562)) )
))
(declare-fun lt!169278 () ListLongMap!4635)

(declare-fun zeroValue!472 () V!12587)

(declare-fun minValue!472 () V!12587)

(declare-fun getCurrentListMapNoExtraKeys!624 (array!21159 array!21161 (_ BitVec 32) (_ BitVec 32) V!12587 V!12587 (_ BitVec 32) Int) ListLongMap!4635)

(assert (=> b!368054 (= lt!169278 (getCurrentListMapNoExtraKeys!624 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14481 () Bool)

(declare-fun mapRes!14481 () Bool)

(assert (=> mapIsEmpty!14481 mapRes!14481))

(declare-fun b!368055 () Bool)

(declare-fun res!206263 () Bool)

(assert (=> b!368055 (=> (not res!206263) (not e!225103))))

(declare-fun arrayContainsKey!0 (array!21159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368055 (= res!206263 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368056 () Bool)

(declare-fun res!206265 () Bool)

(assert (=> b!368056 (=> (not res!206265) (not e!225103))))

(assert (=> b!368056 (= res!206265 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10401 _keys!658))))))

(declare-fun b!368057 () Bool)

(declare-fun e!225105 () Bool)

(assert (=> b!368057 (= e!225105 tp_is_empty!8611)))

(declare-fun b!368058 () Bool)

(declare-fun res!206267 () Bool)

(assert (=> b!368058 (=> (not res!206267) (not e!225106))))

(declare-fun lt!169277 () array!21159)

(assert (=> b!368058 (= res!206267 (arrayNoDuplicates!0 lt!169277 #b00000000000000000000000000000000 Nil!5558))))

(declare-fun b!368052 () Bool)

(declare-fun e!225102 () Bool)

(assert (=> b!368052 (= e!225102 (and e!225104 mapRes!14481))))

(declare-fun condMapEmpty!14481 () Bool)

(declare-fun mapDefault!14481 () ValueCell!3962)

(assert (=> b!368052 (= condMapEmpty!14481 (= (arr!10049 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3962)) mapDefault!14481)))))

(declare-fun res!206264 () Bool)

(assert (=> start!36822 (=> (not res!206264) (not e!225103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36822 (= res!206264 (validMask!0 mask!970))))

(assert (=> start!36822 e!225103))

(assert (=> start!36822 true))

(declare-fun array_inv!7444 (array!21161) Bool)

(assert (=> start!36822 (and (array_inv!7444 _values!506) e!225102)))

(assert (=> start!36822 tp!28605))

(assert (=> start!36822 tp_is_empty!8611))

(declare-fun array_inv!7445 (array!21159) Bool)

(assert (=> start!36822 (array_inv!7445 _keys!658)))

(declare-fun mapNonEmpty!14481 () Bool)

(declare-fun tp!28604 () Bool)

(assert (=> mapNonEmpty!14481 (= mapRes!14481 (and tp!28604 e!225105))))

(declare-fun mapRest!14481 () (Array (_ BitVec 32) ValueCell!3962))

(declare-fun mapValue!14481 () ValueCell!3962)

(declare-fun mapKey!14481 () (_ BitVec 32))

(assert (=> mapNonEmpty!14481 (= (arr!10049 _values!506) (store mapRest!14481 mapKey!14481 mapValue!14481))))

(declare-fun b!368059 () Bool)

(assert (=> b!368059 (= e!225103 e!225106)))

(declare-fun res!206266 () Bool)

(assert (=> b!368059 (=> (not res!206266) (not e!225106))))

(assert (=> b!368059 (= res!206266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169277 mask!970))))

(assert (=> b!368059 (= lt!169277 (array!21160 (store (arr!10048 _keys!658) i!548 k0!778) (size!10401 _keys!658)))))

(assert (= (and start!36822 res!206264) b!368050))

(assert (= (and b!368050 res!206261) b!368051))

(assert (= (and b!368051 res!206268) b!368049))

(assert (= (and b!368049 res!206262) b!368056))

(assert (= (and b!368056 res!206265) b!368053))

(assert (= (and b!368053 res!206270) b!368048))

(assert (= (and b!368048 res!206269) b!368055))

(assert (= (and b!368055 res!206263) b!368059))

(assert (= (and b!368059 res!206266) b!368058))

(assert (= (and b!368058 res!206267) b!368054))

(assert (= (and b!368052 condMapEmpty!14481) mapIsEmpty!14481))

(assert (= (and b!368052 (not condMapEmpty!14481)) mapNonEmpty!14481))

(get-info :version)

(assert (= (and mapNonEmpty!14481 ((_ is ValueCellFull!3962) mapValue!14481)) b!368057))

(assert (= (and b!368052 ((_ is ValueCellFull!3962) mapDefault!14481)) b!368047))

(assert (= start!36822 b!368052))

(declare-fun m!364277 () Bool)

(assert (=> b!368059 m!364277))

(declare-fun m!364279 () Bool)

(assert (=> b!368059 m!364279))

(declare-fun m!364281 () Bool)

(assert (=> b!368048 m!364281))

(declare-fun m!364283 () Bool)

(assert (=> b!368051 m!364283))

(declare-fun m!364285 () Bool)

(assert (=> b!368049 m!364285))

(declare-fun m!364287 () Bool)

(assert (=> b!368058 m!364287))

(declare-fun m!364289 () Bool)

(assert (=> start!36822 m!364289))

(declare-fun m!364291 () Bool)

(assert (=> start!36822 m!364291))

(declare-fun m!364293 () Bool)

(assert (=> start!36822 m!364293))

(declare-fun m!364295 () Bool)

(assert (=> mapNonEmpty!14481 m!364295))

(declare-fun m!364297 () Bool)

(assert (=> b!368054 m!364297))

(declare-fun m!364299 () Bool)

(assert (=> b!368053 m!364299))

(declare-fun m!364301 () Bool)

(assert (=> b!368055 m!364301))

(check-sat (not b!368054) (not b!368051) b_and!15179 tp_is_empty!8611 (not b!368058) (not mapNonEmpty!14481) (not b_next!7963) (not b!368055) (not start!36822) (not b!368053) (not b!368049) (not b!368059))
(check-sat b_and!15179 (not b_next!7963))
