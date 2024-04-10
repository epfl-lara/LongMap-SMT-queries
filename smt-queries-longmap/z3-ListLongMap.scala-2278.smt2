; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37132 () Bool)

(assert start!37132)

(declare-fun b_free!8259 () Bool)

(declare-fun b_next!8259 () Bool)

(assert (=> start!37132 (= b_free!8259 (not b_next!8259))))

(declare-fun tp!29493 () Bool)

(declare-fun b_and!15501 () Bool)

(assert (=> start!37132 (= tp!29493 b_and!15501)))

(declare-fun b!374262 () Bool)

(declare-fun res!211005 () Bool)

(declare-fun e!228107 () Bool)

(assert (=> b!374262 (=> (not res!211005) (not e!228107))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21753 0))(
  ( (array!21754 (arr!10345 (Array (_ BitVec 32) (_ BitVec 64))) (size!10697 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21753)

(assert (=> b!374262 (= res!211005 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10697 _keys!658))))))

(declare-fun b!374263 () Bool)

(declare-fun res!211011 () Bool)

(assert (=> b!374263 (=> (not res!211011) (not e!228107))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374263 (= res!211011 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374264 () Bool)

(declare-fun e!228108 () Bool)

(declare-fun e!228109 () Bool)

(declare-fun mapRes!14925 () Bool)

(assert (=> b!374264 (= e!228108 (and e!228109 mapRes!14925))))

(declare-fun condMapEmpty!14925 () Bool)

(declare-datatypes ((V!12981 0))(
  ( (V!12982 (val!4498 Int)) )
))
(declare-datatypes ((ValueCell!4110 0))(
  ( (ValueCellFull!4110 (v!6695 V!12981)) (EmptyCell!4110) )
))
(declare-datatypes ((array!21755 0))(
  ( (array!21756 (arr!10346 (Array (_ BitVec 32) ValueCell!4110)) (size!10698 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21755)

(declare-fun mapDefault!14925 () ValueCell!4110)

(assert (=> b!374264 (= condMapEmpty!14925 (= (arr!10346 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4110)) mapDefault!14925)))))

(declare-fun b!374265 () Bool)

(declare-fun e!228105 () Bool)

(declare-fun tp_is_empty!8907 () Bool)

(assert (=> b!374265 (= e!228105 tp_is_empty!8907)))

(declare-fun b!374266 () Bool)

(declare-fun res!211002 () Bool)

(declare-fun e!228104 () Bool)

(assert (=> b!374266 (=> (not res!211002) (not e!228104))))

(declare-fun lt!172419 () array!21753)

(declare-datatypes ((List!5824 0))(
  ( (Nil!5821) (Cons!5820 (h!6676 (_ BitVec 64)) (t!10974 List!5824)) )
))
(declare-fun arrayNoDuplicates!0 (array!21753 (_ BitVec 32) List!5824) Bool)

(assert (=> b!374266 (= res!211002 (arrayNoDuplicates!0 lt!172419 #b00000000000000000000000000000000 Nil!5821))))

(declare-fun b!374267 () Bool)

(declare-fun e!228110 () Bool)

(declare-fun e!228106 () Bool)

(assert (=> b!374267 (= e!228110 e!228106)))

(declare-fun res!211004 () Bool)

(assert (=> b!374267 (=> res!211004 e!228106)))

(assert (=> b!374267 (= res!211004 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5978 0))(
  ( (tuple2!5979 (_1!3000 (_ BitVec 64)) (_2!3000 V!12981)) )
))
(declare-datatypes ((List!5825 0))(
  ( (Nil!5822) (Cons!5821 (h!6677 tuple2!5978) (t!10975 List!5825)) )
))
(declare-datatypes ((ListLongMap!4891 0))(
  ( (ListLongMap!4892 (toList!2461 List!5825)) )
))
(declare-fun lt!172420 () ListLongMap!4891)

(declare-fun lt!172422 () ListLongMap!4891)

(assert (=> b!374267 (= lt!172420 lt!172422)))

(declare-fun lt!172411 () ListLongMap!4891)

(declare-fun lt!172410 () tuple2!5978)

(declare-fun +!807 (ListLongMap!4891 tuple2!5978) ListLongMap!4891)

(assert (=> b!374267 (= lt!172422 (+!807 lt!172411 lt!172410))))

(declare-fun v!373 () V!12981)

(declare-datatypes ((Unit!11520 0))(
  ( (Unit!11521) )
))
(declare-fun lt!172414 () Unit!11520)

(declare-fun lt!172415 () ListLongMap!4891)

(declare-fun zeroValue!472 () V!12981)

(declare-fun addCommutativeForDiffKeys!231 (ListLongMap!4891 (_ BitVec 64) V!12981 (_ BitVec 64) V!12981) Unit!11520)

(assert (=> b!374267 (= lt!172414 (addCommutativeForDiffKeys!231 lt!172415 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172424 () ListLongMap!4891)

(declare-fun lt!172416 () tuple2!5978)

(assert (=> b!374267 (= lt!172424 (+!807 lt!172420 lt!172416))))

(declare-fun lt!172417 () ListLongMap!4891)

(declare-fun lt!172409 () tuple2!5978)

(assert (=> b!374267 (= lt!172420 (+!807 lt!172417 lt!172409))))

(declare-fun lt!172412 () ListLongMap!4891)

(declare-fun lt!172418 () ListLongMap!4891)

(assert (=> b!374267 (= lt!172412 lt!172418)))

(assert (=> b!374267 (= lt!172418 (+!807 lt!172411 lt!172416))))

(assert (=> b!374267 (= lt!172411 (+!807 lt!172415 lt!172409))))

(declare-fun lt!172425 () ListLongMap!4891)

(assert (=> b!374267 (= lt!172424 (+!807 (+!807 lt!172425 lt!172409) lt!172416))))

(declare-fun minValue!472 () V!12981)

(assert (=> b!374267 (= lt!172416 (tuple2!5979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374267 (= lt!172409 (tuple2!5979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374268 () Bool)

(declare-fun res!211003 () Bool)

(assert (=> b!374268 (=> (not res!211003) (not e!228107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374268 (= res!211003 (validKeyInArray!0 k0!778))))

(declare-fun res!211008 () Bool)

(assert (=> start!37132 (=> (not res!211008) (not e!228107))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37132 (= res!211008 (validMask!0 mask!970))))

(assert (=> start!37132 e!228107))

(declare-fun array_inv!7628 (array!21755) Bool)

(assert (=> start!37132 (and (array_inv!7628 _values!506) e!228108)))

(assert (=> start!37132 tp!29493))

(assert (=> start!37132 true))

(assert (=> start!37132 tp_is_empty!8907))

(declare-fun array_inv!7629 (array!21753) Bool)

(assert (=> start!37132 (array_inv!7629 _keys!658)))

(declare-fun b!374269 () Bool)

(declare-fun res!211010 () Bool)

(assert (=> b!374269 (=> (not res!211010) (not e!228107))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374269 (= res!211010 (and (= (size!10698 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10697 _keys!658) (size!10698 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374270 () Bool)

(assert (=> b!374270 (= e!228106 true)))

(assert (=> b!374270 (= (+!807 lt!172422 lt!172416) (+!807 lt!172418 lt!172410))))

(declare-fun lt!172421 () Unit!11520)

(assert (=> b!374270 (= lt!172421 (addCommutativeForDiffKeys!231 lt!172411 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374271 () Bool)

(declare-fun res!211013 () Bool)

(assert (=> b!374271 (=> (not res!211013) (not e!228107))))

(assert (=> b!374271 (= res!211013 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5821))))

(declare-fun b!374272 () Bool)

(assert (=> b!374272 (= e!228104 (not e!228110))))

(declare-fun res!211012 () Bool)

(assert (=> b!374272 (=> res!211012 e!228110)))

(assert (=> b!374272 (= res!211012 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1899 (array!21753 array!21755 (_ BitVec 32) (_ BitVec 32) V!12981 V!12981 (_ BitVec 32) Int) ListLongMap!4891)

(assert (=> b!374272 (= lt!172412 (getCurrentListMap!1899 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172423 () array!21755)

(assert (=> b!374272 (= lt!172424 (getCurrentListMap!1899 lt!172419 lt!172423 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374272 (and (= lt!172425 lt!172417) (= lt!172417 lt!172425))))

(assert (=> b!374272 (= lt!172417 (+!807 lt!172415 lt!172410))))

(assert (=> b!374272 (= lt!172410 (tuple2!5979 k0!778 v!373))))

(declare-fun lt!172413 () Unit!11520)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!57 (array!21753 array!21755 (_ BitVec 32) (_ BitVec 32) V!12981 V!12981 (_ BitVec 32) (_ BitVec 64) V!12981 (_ BitVec 32) Int) Unit!11520)

(assert (=> b!374272 (= lt!172413 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!57 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!733 (array!21753 array!21755 (_ BitVec 32) (_ BitVec 32) V!12981 V!12981 (_ BitVec 32) Int) ListLongMap!4891)

(assert (=> b!374272 (= lt!172425 (getCurrentListMapNoExtraKeys!733 lt!172419 lt!172423 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374272 (= lt!172423 (array!21756 (store (arr!10346 _values!506) i!548 (ValueCellFull!4110 v!373)) (size!10698 _values!506)))))

(assert (=> b!374272 (= lt!172415 (getCurrentListMapNoExtraKeys!733 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14925 () Bool)

(declare-fun tp!29492 () Bool)

(assert (=> mapNonEmpty!14925 (= mapRes!14925 (and tp!29492 e!228105))))

(declare-fun mapValue!14925 () ValueCell!4110)

(declare-fun mapRest!14925 () (Array (_ BitVec 32) ValueCell!4110))

(declare-fun mapKey!14925 () (_ BitVec 32))

(assert (=> mapNonEmpty!14925 (= (arr!10346 _values!506) (store mapRest!14925 mapKey!14925 mapValue!14925))))

(declare-fun b!374273 () Bool)

(assert (=> b!374273 (= e!228107 e!228104)))

(declare-fun res!211007 () Bool)

(assert (=> b!374273 (=> (not res!211007) (not e!228104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21753 (_ BitVec 32)) Bool)

(assert (=> b!374273 (= res!211007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172419 mask!970))))

(assert (=> b!374273 (= lt!172419 (array!21754 (store (arr!10345 _keys!658) i!548 k0!778) (size!10697 _keys!658)))))

(declare-fun mapIsEmpty!14925 () Bool)

(assert (=> mapIsEmpty!14925 mapRes!14925))

(declare-fun b!374274 () Bool)

(declare-fun res!211006 () Bool)

(assert (=> b!374274 (=> (not res!211006) (not e!228107))))

(assert (=> b!374274 (= res!211006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374275 () Bool)

(declare-fun res!211009 () Bool)

(assert (=> b!374275 (=> (not res!211009) (not e!228107))))

(assert (=> b!374275 (= res!211009 (or (= (select (arr!10345 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10345 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374276 () Bool)

(assert (=> b!374276 (= e!228109 tp_is_empty!8907)))

(assert (= (and start!37132 res!211008) b!374269))

(assert (= (and b!374269 res!211010) b!374274))

(assert (= (and b!374274 res!211006) b!374271))

(assert (= (and b!374271 res!211013) b!374262))

(assert (= (and b!374262 res!211005) b!374268))

(assert (= (and b!374268 res!211003) b!374275))

(assert (= (and b!374275 res!211009) b!374263))

(assert (= (and b!374263 res!211011) b!374273))

(assert (= (and b!374273 res!211007) b!374266))

(assert (= (and b!374266 res!211002) b!374272))

(assert (= (and b!374272 (not res!211012)) b!374267))

(assert (= (and b!374267 (not res!211004)) b!374270))

(assert (= (and b!374264 condMapEmpty!14925) mapIsEmpty!14925))

(assert (= (and b!374264 (not condMapEmpty!14925)) mapNonEmpty!14925))

(get-info :version)

(assert (= (and mapNonEmpty!14925 ((_ is ValueCellFull!4110) mapValue!14925)) b!374265))

(assert (= (and b!374264 ((_ is ValueCellFull!4110) mapDefault!14925)) b!374276))

(assert (= start!37132 b!374264))

(declare-fun m!370455 () Bool)

(assert (=> mapNonEmpty!14925 m!370455))

(declare-fun m!370457 () Bool)

(assert (=> b!374273 m!370457))

(declare-fun m!370459 () Bool)

(assert (=> b!374273 m!370459))

(declare-fun m!370461 () Bool)

(assert (=> b!374267 m!370461))

(declare-fun m!370463 () Bool)

(assert (=> b!374267 m!370463))

(declare-fun m!370465 () Bool)

(assert (=> b!374267 m!370465))

(assert (=> b!374267 m!370463))

(declare-fun m!370467 () Bool)

(assert (=> b!374267 m!370467))

(declare-fun m!370469 () Bool)

(assert (=> b!374267 m!370469))

(declare-fun m!370471 () Bool)

(assert (=> b!374267 m!370471))

(declare-fun m!370473 () Bool)

(assert (=> b!374267 m!370473))

(declare-fun m!370475 () Bool)

(assert (=> b!374267 m!370475))

(declare-fun m!370477 () Bool)

(assert (=> b!374271 m!370477))

(declare-fun m!370479 () Bool)

(assert (=> b!374263 m!370479))

(declare-fun m!370481 () Bool)

(assert (=> b!374268 m!370481))

(declare-fun m!370483 () Bool)

(assert (=> b!374275 m!370483))

(declare-fun m!370485 () Bool)

(assert (=> b!374272 m!370485))

(declare-fun m!370487 () Bool)

(assert (=> b!374272 m!370487))

(declare-fun m!370489 () Bool)

(assert (=> b!374272 m!370489))

(declare-fun m!370491 () Bool)

(assert (=> b!374272 m!370491))

(declare-fun m!370493 () Bool)

(assert (=> b!374272 m!370493))

(declare-fun m!370495 () Bool)

(assert (=> b!374272 m!370495))

(declare-fun m!370497 () Bool)

(assert (=> b!374272 m!370497))

(declare-fun m!370499 () Bool)

(assert (=> start!37132 m!370499))

(declare-fun m!370501 () Bool)

(assert (=> start!37132 m!370501))

(declare-fun m!370503 () Bool)

(assert (=> start!37132 m!370503))

(declare-fun m!370505 () Bool)

(assert (=> b!374266 m!370505))

(declare-fun m!370507 () Bool)

(assert (=> b!374270 m!370507))

(declare-fun m!370509 () Bool)

(assert (=> b!374270 m!370509))

(declare-fun m!370511 () Bool)

(assert (=> b!374270 m!370511))

(declare-fun m!370513 () Bool)

(assert (=> b!374274 m!370513))

(check-sat (not start!37132) (not b!374267) (not b!374271) (not b!374268) (not b_next!8259) (not b!374270) b_and!15501 (not b!374263) tp_is_empty!8907 (not b!374272) (not mapNonEmpty!14925) (not b!374274) (not b!374266) (not b!374273))
(check-sat b_and!15501 (not b_next!8259))
