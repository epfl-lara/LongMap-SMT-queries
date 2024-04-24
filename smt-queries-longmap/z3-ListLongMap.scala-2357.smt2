; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37590 () Bool)

(assert start!37590)

(declare-fun b_free!8731 () Bool)

(declare-fun b_next!8731 () Bool)

(assert (=> start!37590 (= b_free!8731 (not b_next!8731))))

(declare-fun tp!30908 () Bool)

(declare-fun b_and!15987 () Bool)

(assert (=> start!37590 (= tp!30908 b_and!15987)))

(declare-fun b!384588 () Bool)

(declare-fun res!219259 () Bool)

(declare-fun e!233474 () Bool)

(assert (=> b!384588 (=> (not res!219259) (not e!233474))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384588 (= res!219259 (validKeyInArray!0 k0!778))))

(declare-fun b!384589 () Bool)

(declare-fun e!233477 () Bool)

(declare-fun e!233472 () Bool)

(declare-fun mapRes!15633 () Bool)

(assert (=> b!384589 (= e!233477 (and e!233472 mapRes!15633))))

(declare-fun condMapEmpty!15633 () Bool)

(declare-datatypes ((V!13611 0))(
  ( (V!13612 (val!4734 Int)) )
))
(declare-datatypes ((ValueCell!4346 0))(
  ( (ValueCellFull!4346 (v!6932 V!13611)) (EmptyCell!4346) )
))
(declare-datatypes ((array!22652 0))(
  ( (array!22653 (arr!10794 (Array (_ BitVec 32) ValueCell!4346)) (size!11146 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22652)

(declare-fun mapDefault!15633 () ValueCell!4346)

(assert (=> b!384589 (= condMapEmpty!15633 (= (arr!10794 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4346)) mapDefault!15633)))))

(declare-fun res!219258 () Bool)

(assert (=> start!37590 (=> (not res!219258) (not e!233474))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37590 (= res!219258 (validMask!0 mask!970))))

(assert (=> start!37590 e!233474))

(declare-fun array_inv!7986 (array!22652) Bool)

(assert (=> start!37590 (and (array_inv!7986 _values!506) e!233477)))

(assert (=> start!37590 tp!30908))

(assert (=> start!37590 true))

(declare-fun tp_is_empty!9379 () Bool)

(assert (=> start!37590 tp_is_empty!9379))

(declare-datatypes ((array!22654 0))(
  ( (array!22655 (arr!10795 (Array (_ BitVec 32) (_ BitVec 64))) (size!11147 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22654)

(declare-fun array_inv!7987 (array!22654) Bool)

(assert (=> start!37590 (array_inv!7987 _keys!658)))

(declare-fun b!384590 () Bool)

(declare-fun res!219252 () Bool)

(assert (=> b!384590 (=> (not res!219252) (not e!233474))))

(declare-fun arrayContainsKey!0 (array!22654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384590 (= res!219252 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384591 () Bool)

(assert (=> b!384591 (= e!233472 tp_is_empty!9379)))

(declare-fun b!384592 () Bool)

(declare-fun e!233476 () Bool)

(assert (=> b!384592 (= e!233476 true)))

(declare-datatypes ((tuple2!6248 0))(
  ( (tuple2!6249 (_1!3135 (_ BitVec 64)) (_2!3135 V!13611)) )
))
(declare-datatypes ((List!6084 0))(
  ( (Nil!6081) (Cons!6080 (h!6936 tuple2!6248) (t!11226 List!6084)) )
))
(declare-datatypes ((ListLongMap!5163 0))(
  ( (ListLongMap!5164 (toList!2597 List!6084)) )
))
(declare-fun lt!181062 () ListLongMap!5163)

(declare-fun lt!181063 () ListLongMap!5163)

(declare-fun lt!181067 () tuple2!6248)

(declare-fun +!989 (ListLongMap!5163 tuple2!6248) ListLongMap!5163)

(assert (=> b!384592 (= lt!181062 (+!989 lt!181063 lt!181067))))

(declare-fun lt!181059 () ListLongMap!5163)

(declare-fun lt!181061 () ListLongMap!5163)

(assert (=> b!384592 (= lt!181059 lt!181061)))

(declare-fun b!384593 () Bool)

(declare-fun res!219256 () Bool)

(declare-fun e!233475 () Bool)

(assert (=> b!384593 (=> (not res!219256) (not e!233475))))

(declare-fun lt!181060 () array!22654)

(declare-datatypes ((List!6085 0))(
  ( (Nil!6082) (Cons!6081 (h!6937 (_ BitVec 64)) (t!11227 List!6085)) )
))
(declare-fun arrayNoDuplicates!0 (array!22654 (_ BitVec 32) List!6085) Bool)

(assert (=> b!384593 (= res!219256 (arrayNoDuplicates!0 lt!181060 #b00000000000000000000000000000000 Nil!6082))))

(declare-fun b!384594 () Bool)

(declare-fun e!233478 () Bool)

(assert (=> b!384594 (= e!233478 tp_is_empty!9379)))

(declare-fun b!384595 () Bool)

(declare-fun res!219260 () Bool)

(assert (=> b!384595 (=> (not res!219260) (not e!233474))))

(assert (=> b!384595 (= res!219260 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6082))))

(declare-fun mapNonEmpty!15633 () Bool)

(declare-fun tp!30909 () Bool)

(assert (=> mapNonEmpty!15633 (= mapRes!15633 (and tp!30909 e!233478))))

(declare-fun mapValue!15633 () ValueCell!4346)

(declare-fun mapKey!15633 () (_ BitVec 32))

(declare-fun mapRest!15633 () (Array (_ BitVec 32) ValueCell!4346))

(assert (=> mapNonEmpty!15633 (= (arr!10794 _values!506) (store mapRest!15633 mapKey!15633 mapValue!15633))))

(declare-fun b!384596 () Bool)

(declare-fun res!219257 () Bool)

(assert (=> b!384596 (=> (not res!219257) (not e!233474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22654 (_ BitVec 32)) Bool)

(assert (=> b!384596 (= res!219257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15633 () Bool)

(assert (=> mapIsEmpty!15633 mapRes!15633))

(declare-fun b!384597 () Bool)

(assert (=> b!384597 (= e!233475 (not e!233476))))

(declare-fun res!219253 () Bool)

(assert (=> b!384597 (=> res!219253 e!233476)))

(declare-fun lt!181068 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384597 (= res!219253 (or (and (not lt!181068) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181068) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181068)))))

(assert (=> b!384597 (= lt!181068 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13611)

(declare-fun minValue!472 () V!13611)

(declare-fun getCurrentListMap!2027 (array!22654 array!22652 (_ BitVec 32) (_ BitVec 32) V!13611 V!13611 (_ BitVec 32) Int) ListLongMap!5163)

(assert (=> b!384597 (= lt!181063 (getCurrentListMap!2027 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181069 () array!22652)

(assert (=> b!384597 (= lt!181059 (getCurrentListMap!2027 lt!181060 lt!181069 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181066 () ListLongMap!5163)

(assert (=> b!384597 (and (= lt!181061 lt!181066) (= lt!181066 lt!181061))))

(declare-fun lt!181064 () ListLongMap!5163)

(assert (=> b!384597 (= lt!181066 (+!989 lt!181064 lt!181067))))

(declare-fun v!373 () V!13611)

(assert (=> b!384597 (= lt!181067 (tuple2!6249 k0!778 v!373))))

(declare-datatypes ((Unit!11849 0))(
  ( (Unit!11850) )
))
(declare-fun lt!181065 () Unit!11849)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!214 (array!22654 array!22652 (_ BitVec 32) (_ BitVec 32) V!13611 V!13611 (_ BitVec 32) (_ BitVec 64) V!13611 (_ BitVec 32) Int) Unit!11849)

(assert (=> b!384597 (= lt!181065 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!214 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!874 (array!22654 array!22652 (_ BitVec 32) (_ BitVec 32) V!13611 V!13611 (_ BitVec 32) Int) ListLongMap!5163)

(assert (=> b!384597 (= lt!181061 (getCurrentListMapNoExtraKeys!874 lt!181060 lt!181069 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384597 (= lt!181069 (array!22653 (store (arr!10794 _values!506) i!548 (ValueCellFull!4346 v!373)) (size!11146 _values!506)))))

(assert (=> b!384597 (= lt!181064 (getCurrentListMapNoExtraKeys!874 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384598 () Bool)

(declare-fun res!219251 () Bool)

(assert (=> b!384598 (=> (not res!219251) (not e!233474))))

(assert (=> b!384598 (= res!219251 (and (= (size!11146 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11147 _keys!658) (size!11146 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384599 () Bool)

(declare-fun res!219254 () Bool)

(assert (=> b!384599 (=> (not res!219254) (not e!233474))))

(assert (=> b!384599 (= res!219254 (or (= (select (arr!10795 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10795 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384600 () Bool)

(assert (=> b!384600 (= e!233474 e!233475)))

(declare-fun res!219255 () Bool)

(assert (=> b!384600 (=> (not res!219255) (not e!233475))))

(assert (=> b!384600 (= res!219255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181060 mask!970))))

(assert (=> b!384600 (= lt!181060 (array!22655 (store (arr!10795 _keys!658) i!548 k0!778) (size!11147 _keys!658)))))

(declare-fun b!384601 () Bool)

(declare-fun res!219250 () Bool)

(assert (=> b!384601 (=> (not res!219250) (not e!233474))))

(assert (=> b!384601 (= res!219250 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11147 _keys!658))))))

(assert (= (and start!37590 res!219258) b!384598))

(assert (= (and b!384598 res!219251) b!384596))

(assert (= (and b!384596 res!219257) b!384595))

(assert (= (and b!384595 res!219260) b!384601))

(assert (= (and b!384601 res!219250) b!384588))

(assert (= (and b!384588 res!219259) b!384599))

(assert (= (and b!384599 res!219254) b!384590))

(assert (= (and b!384590 res!219252) b!384600))

(assert (= (and b!384600 res!219255) b!384593))

(assert (= (and b!384593 res!219256) b!384597))

(assert (= (and b!384597 (not res!219253)) b!384592))

(assert (= (and b!384589 condMapEmpty!15633) mapIsEmpty!15633))

(assert (= (and b!384589 (not condMapEmpty!15633)) mapNonEmpty!15633))

(get-info :version)

(assert (= (and mapNonEmpty!15633 ((_ is ValueCellFull!4346) mapValue!15633)) b!384594))

(assert (= (and b!384589 ((_ is ValueCellFull!4346) mapDefault!15633)) b!384591))

(assert (= start!37590 b!384589))

(declare-fun m!381545 () Bool)

(assert (=> mapNonEmpty!15633 m!381545))

(declare-fun m!381547 () Bool)

(assert (=> b!384590 m!381547))

(declare-fun m!381549 () Bool)

(assert (=> b!384599 m!381549))

(declare-fun m!381551 () Bool)

(assert (=> b!384597 m!381551))

(declare-fun m!381553 () Bool)

(assert (=> b!384597 m!381553))

(declare-fun m!381555 () Bool)

(assert (=> b!384597 m!381555))

(declare-fun m!381557 () Bool)

(assert (=> b!384597 m!381557))

(declare-fun m!381559 () Bool)

(assert (=> b!384597 m!381559))

(declare-fun m!381561 () Bool)

(assert (=> b!384597 m!381561))

(declare-fun m!381563 () Bool)

(assert (=> b!384597 m!381563))

(declare-fun m!381565 () Bool)

(assert (=> start!37590 m!381565))

(declare-fun m!381567 () Bool)

(assert (=> start!37590 m!381567))

(declare-fun m!381569 () Bool)

(assert (=> start!37590 m!381569))

(declare-fun m!381571 () Bool)

(assert (=> b!384588 m!381571))

(declare-fun m!381573 () Bool)

(assert (=> b!384595 m!381573))

(declare-fun m!381575 () Bool)

(assert (=> b!384600 m!381575))

(declare-fun m!381577 () Bool)

(assert (=> b!384600 m!381577))

(declare-fun m!381579 () Bool)

(assert (=> b!384596 m!381579))

(declare-fun m!381581 () Bool)

(assert (=> b!384592 m!381581))

(declare-fun m!381583 () Bool)

(assert (=> b!384593 m!381583))

(check-sat (not b!384588) (not b!384592) (not b!384595) (not b!384590) (not b!384593) (not b!384600) (not mapNonEmpty!15633) tp_is_empty!9379 (not b!384597) (not b_next!8731) b_and!15987 (not b!384596) (not start!37590))
(check-sat b_and!15987 (not b_next!8731))
