; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37366 () Bool)

(assert start!37366)

(declare-fun b_free!8493 () Bool)

(declare-fun b_next!8493 () Bool)

(assert (=> start!37366 (= b_free!8493 (not b_next!8493))))

(declare-fun tp!30194 () Bool)

(declare-fun b_and!15735 () Bool)

(assert (=> start!37366 (= tp!30194 b_and!15735)))

(declare-fun b!379545 () Bool)

(declare-fun res!215239 () Bool)

(declare-fun e!230915 () Bool)

(assert (=> b!379545 (=> (not res!215239) (not e!230915))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22203 0))(
  ( (array!22204 (arr!10570 (Array (_ BitVec 32) (_ BitVec 64))) (size!10922 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22203)

(assert (=> b!379545 (= res!215239 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10922 _keys!658))))))

(declare-fun b!379546 () Bool)

(declare-fun e!230914 () Bool)

(declare-fun tp_is_empty!9141 () Bool)

(assert (=> b!379546 (= e!230914 tp_is_empty!9141)))

(declare-fun b!379547 () Bool)

(declare-fun e!230917 () Bool)

(assert (=> b!379547 (= e!230917 tp_is_empty!9141)))

(declare-fun b!379549 () Bool)

(declare-fun e!230912 () Bool)

(assert (=> b!379549 (= e!230912 (bvsle #b00000000000000000000000000000000 (size!10922 _keys!658)))))

(declare-datatypes ((V!13293 0))(
  ( (V!13294 (val!4615 Int)) )
))
(declare-datatypes ((tuple2!6176 0))(
  ( (tuple2!6177 (_1!3099 (_ BitVec 64)) (_2!3099 V!13293)) )
))
(declare-datatypes ((List!6012 0))(
  ( (Nil!6009) (Cons!6008 (h!6864 tuple2!6176) (t!11162 List!6012)) )
))
(declare-datatypes ((ListLongMap!5089 0))(
  ( (ListLongMap!5090 (toList!2560 List!6012)) )
))
(declare-fun lt!177281 () ListLongMap!5089)

(declare-fun lt!177285 () ListLongMap!5089)

(declare-fun lt!177276 () tuple2!6176)

(declare-fun +!906 (ListLongMap!5089 tuple2!6176) ListLongMap!5089)

(assert (=> b!379549 (= lt!177281 (+!906 lt!177285 lt!177276))))

(declare-fun v!373 () V!13293)

(declare-fun lt!177278 () ListLongMap!5089)

(declare-datatypes ((Unit!11708 0))(
  ( (Unit!11709) )
))
(declare-fun lt!177288 () Unit!11708)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!13293)

(declare-fun addCommutativeForDiffKeys!304 (ListLongMap!5089 (_ BitVec 64) V!13293 (_ BitVec 64) V!13293) Unit!11708)

(assert (=> b!379549 (= lt!177288 (addCommutativeForDiffKeys!304 lt!177278 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15276 () Bool)

(declare-fun mapRes!15276 () Bool)

(assert (=> mapIsEmpty!15276 mapRes!15276))

(declare-fun b!379550 () Bool)

(declare-fun res!215235 () Bool)

(assert (=> b!379550 (=> (not res!215235) (not e!230915))))

(declare-datatypes ((List!6013 0))(
  ( (Nil!6010) (Cons!6009 (h!6865 (_ BitVec 64)) (t!11163 List!6013)) )
))
(declare-fun arrayNoDuplicates!0 (array!22203 (_ BitVec 32) List!6013) Bool)

(assert (=> b!379550 (= res!215235 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6010))))

(declare-fun b!379551 () Bool)

(declare-fun e!230916 () Bool)

(declare-fun e!230913 () Bool)

(assert (=> b!379551 (= e!230916 (not e!230913))))

(declare-fun res!215238 () Bool)

(assert (=> b!379551 (=> res!215238 e!230913)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379551 (= res!215238 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4227 0))(
  ( (ValueCellFull!4227 (v!6812 V!13293)) (EmptyCell!4227) )
))
(declare-datatypes ((array!22205 0))(
  ( (array!22206 (arr!10571 (Array (_ BitVec 32) ValueCell!4227)) (size!10923 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22205)

(declare-fun lt!177280 () ListLongMap!5089)

(declare-fun zeroValue!472 () V!13293)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1981 (array!22203 array!22205 (_ BitVec 32) (_ BitVec 32) V!13293 V!13293 (_ BitVec 32) Int) ListLongMap!5089)

(assert (=> b!379551 (= lt!177280 (getCurrentListMap!1981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177282 () ListLongMap!5089)

(declare-fun lt!177284 () array!22205)

(declare-fun lt!177286 () array!22203)

(assert (=> b!379551 (= lt!177282 (getCurrentListMap!1981 lt!177286 lt!177284 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177283 () ListLongMap!5089)

(declare-fun lt!177287 () ListLongMap!5089)

(assert (=> b!379551 (and (= lt!177283 lt!177287) (= lt!177287 lt!177283))))

(assert (=> b!379551 (= lt!177287 (+!906 lt!177278 lt!177276))))

(assert (=> b!379551 (= lt!177276 (tuple2!6177 k0!778 v!373))))

(declare-fun lt!177277 () Unit!11708)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!139 (array!22203 array!22205 (_ BitVec 32) (_ BitVec 32) V!13293 V!13293 (_ BitVec 32) (_ BitVec 64) V!13293 (_ BitVec 32) Int) Unit!11708)

(assert (=> b!379551 (= lt!177277 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!139 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!815 (array!22203 array!22205 (_ BitVec 32) (_ BitVec 32) V!13293 V!13293 (_ BitVec 32) Int) ListLongMap!5089)

(assert (=> b!379551 (= lt!177283 (getCurrentListMapNoExtraKeys!815 lt!177286 lt!177284 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379551 (= lt!177284 (array!22206 (store (arr!10571 _values!506) i!548 (ValueCellFull!4227 v!373)) (size!10923 _values!506)))))

(assert (=> b!379551 (= lt!177278 (getCurrentListMapNoExtraKeys!815 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15276 () Bool)

(declare-fun tp!30195 () Bool)

(assert (=> mapNonEmpty!15276 (= mapRes!15276 (and tp!30195 e!230917))))

(declare-fun mapRest!15276 () (Array (_ BitVec 32) ValueCell!4227))

(declare-fun mapValue!15276 () ValueCell!4227)

(declare-fun mapKey!15276 () (_ BitVec 32))

(assert (=> mapNonEmpty!15276 (= (arr!10571 _values!506) (store mapRest!15276 mapKey!15276 mapValue!15276))))

(declare-fun b!379552 () Bool)

(assert (=> b!379552 (= e!230913 e!230912)))

(declare-fun res!215236 () Bool)

(assert (=> b!379552 (=> res!215236 e!230912)))

(assert (=> b!379552 (= res!215236 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379552 (= lt!177280 lt!177285)))

(declare-fun lt!177279 () tuple2!6176)

(assert (=> b!379552 (= lt!177285 (+!906 lt!177278 lt!177279))))

(assert (=> b!379552 (= lt!177282 lt!177281)))

(assert (=> b!379552 (= lt!177281 (+!906 lt!177287 lt!177279))))

(assert (=> b!379552 (= lt!177282 (+!906 lt!177283 lt!177279))))

(assert (=> b!379552 (= lt!177279 (tuple2!6177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379553 () Bool)

(declare-fun e!230911 () Bool)

(assert (=> b!379553 (= e!230911 (and e!230914 mapRes!15276))))

(declare-fun condMapEmpty!15276 () Bool)

(declare-fun mapDefault!15276 () ValueCell!4227)

(assert (=> b!379553 (= condMapEmpty!15276 (= (arr!10571 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4227)) mapDefault!15276)))))

(declare-fun b!379548 () Bool)

(declare-fun res!215233 () Bool)

(assert (=> b!379548 (=> (not res!215233) (not e!230915))))

(assert (=> b!379548 (= res!215233 (or (= (select (arr!10570 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10570 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!215241 () Bool)

(assert (=> start!37366 (=> (not res!215241) (not e!230915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37366 (= res!215241 (validMask!0 mask!970))))

(assert (=> start!37366 e!230915))

(declare-fun array_inv!7784 (array!22205) Bool)

(assert (=> start!37366 (and (array_inv!7784 _values!506) e!230911)))

(assert (=> start!37366 tp!30194))

(assert (=> start!37366 true))

(assert (=> start!37366 tp_is_empty!9141))

(declare-fun array_inv!7785 (array!22203) Bool)

(assert (=> start!37366 (array_inv!7785 _keys!658)))

(declare-fun b!379554 () Bool)

(declare-fun res!215232 () Bool)

(assert (=> b!379554 (=> (not res!215232) (not e!230915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22203 (_ BitVec 32)) Bool)

(assert (=> b!379554 (= res!215232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379555 () Bool)

(declare-fun res!215234 () Bool)

(assert (=> b!379555 (=> (not res!215234) (not e!230916))))

(assert (=> b!379555 (= res!215234 (arrayNoDuplicates!0 lt!177286 #b00000000000000000000000000000000 Nil!6010))))

(declare-fun b!379556 () Bool)

(declare-fun res!215243 () Bool)

(assert (=> b!379556 (=> (not res!215243) (not e!230915))))

(assert (=> b!379556 (= res!215243 (and (= (size!10923 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10922 _keys!658) (size!10923 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379557 () Bool)

(assert (=> b!379557 (= e!230915 e!230916)))

(declare-fun res!215237 () Bool)

(assert (=> b!379557 (=> (not res!215237) (not e!230916))))

(assert (=> b!379557 (= res!215237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177286 mask!970))))

(assert (=> b!379557 (= lt!177286 (array!22204 (store (arr!10570 _keys!658) i!548 k0!778) (size!10922 _keys!658)))))

(declare-fun b!379558 () Bool)

(declare-fun res!215240 () Bool)

(assert (=> b!379558 (=> (not res!215240) (not e!230915))))

(declare-fun arrayContainsKey!0 (array!22203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379558 (= res!215240 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379559 () Bool)

(declare-fun res!215242 () Bool)

(assert (=> b!379559 (=> (not res!215242) (not e!230915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379559 (= res!215242 (validKeyInArray!0 k0!778))))

(assert (= (and start!37366 res!215241) b!379556))

(assert (= (and b!379556 res!215243) b!379554))

(assert (= (and b!379554 res!215232) b!379550))

(assert (= (and b!379550 res!215235) b!379545))

(assert (= (and b!379545 res!215239) b!379559))

(assert (= (and b!379559 res!215242) b!379548))

(assert (= (and b!379548 res!215233) b!379558))

(assert (= (and b!379558 res!215240) b!379557))

(assert (= (and b!379557 res!215237) b!379555))

(assert (= (and b!379555 res!215234) b!379551))

(assert (= (and b!379551 (not res!215238)) b!379552))

(assert (= (and b!379552 (not res!215236)) b!379549))

(assert (= (and b!379553 condMapEmpty!15276) mapIsEmpty!15276))

(assert (= (and b!379553 (not condMapEmpty!15276)) mapNonEmpty!15276))

(get-info :version)

(assert (= (and mapNonEmpty!15276 ((_ is ValueCellFull!4227) mapValue!15276)) b!379547))

(assert (= (and b!379553 ((_ is ValueCellFull!4227) mapDefault!15276)) b!379546))

(assert (= start!37366 b!379553))

(declare-fun m!376431 () Bool)

(assert (=> b!379549 m!376431))

(declare-fun m!376433 () Bool)

(assert (=> b!379549 m!376433))

(declare-fun m!376435 () Bool)

(assert (=> b!379557 m!376435))

(declare-fun m!376437 () Bool)

(assert (=> b!379557 m!376437))

(declare-fun m!376439 () Bool)

(assert (=> b!379548 m!376439))

(declare-fun m!376441 () Bool)

(assert (=> b!379551 m!376441))

(declare-fun m!376443 () Bool)

(assert (=> b!379551 m!376443))

(declare-fun m!376445 () Bool)

(assert (=> b!379551 m!376445))

(declare-fun m!376447 () Bool)

(assert (=> b!379551 m!376447))

(declare-fun m!376449 () Bool)

(assert (=> b!379551 m!376449))

(declare-fun m!376451 () Bool)

(assert (=> b!379551 m!376451))

(declare-fun m!376453 () Bool)

(assert (=> b!379551 m!376453))

(declare-fun m!376455 () Bool)

(assert (=> b!379550 m!376455))

(declare-fun m!376457 () Bool)

(assert (=> b!379555 m!376457))

(declare-fun m!376459 () Bool)

(assert (=> b!379558 m!376459))

(declare-fun m!376461 () Bool)

(assert (=> start!37366 m!376461))

(declare-fun m!376463 () Bool)

(assert (=> start!37366 m!376463))

(declare-fun m!376465 () Bool)

(assert (=> start!37366 m!376465))

(declare-fun m!376467 () Bool)

(assert (=> mapNonEmpty!15276 m!376467))

(declare-fun m!376469 () Bool)

(assert (=> b!379554 m!376469))

(declare-fun m!376471 () Bool)

(assert (=> b!379552 m!376471))

(declare-fun m!376473 () Bool)

(assert (=> b!379552 m!376473))

(declare-fun m!376475 () Bool)

(assert (=> b!379552 m!376475))

(declare-fun m!376477 () Bool)

(assert (=> b!379559 m!376477))

(check-sat (not b!379552) (not b!379559) (not mapNonEmpty!15276) (not b!379550) (not b!379551) (not b!379554) (not start!37366) (not b!379557) b_and!15735 (not b!379555) (not b!379549) (not b!379558) (not b_next!8493) tp_is_empty!9141)
(check-sat b_and!15735 (not b_next!8493))
