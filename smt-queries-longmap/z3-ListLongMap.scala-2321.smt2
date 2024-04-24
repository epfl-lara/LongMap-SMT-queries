; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37374 () Bool)

(assert start!37374)

(declare-fun b_free!8515 () Bool)

(declare-fun b_next!8515 () Bool)

(assert (=> start!37374 (= b_free!8515 (not b_next!8515))))

(declare-fun tp!30260 () Bool)

(declare-fun b_and!15771 () Bool)

(assert (=> start!37374 (= tp!30260 b_and!15771)))

(declare-fun b!379991 () Bool)

(declare-fun res!215625 () Bool)

(declare-fun e!231148 () Bool)

(assert (=> b!379991 (=> (not res!215625) (not e!231148))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13323 0))(
  ( (V!13324 (val!4626 Int)) )
))
(declare-datatypes ((ValueCell!4238 0))(
  ( (ValueCellFull!4238 (v!6824 V!13323)) (EmptyCell!4238) )
))
(declare-datatypes ((array!22232 0))(
  ( (array!22233 (arr!10584 (Array (_ BitVec 32) ValueCell!4238)) (size!10936 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22232)

(declare-datatypes ((array!22234 0))(
  ( (array!22235 (arr!10585 (Array (_ BitVec 32) (_ BitVec 64))) (size!10937 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22234)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!379991 (= res!215625 (and (= (size!10936 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10937 _keys!658) (size!10936 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379992 () Bool)

(declare-fun e!231150 () Bool)

(declare-fun e!231149 () Bool)

(assert (=> b!379992 (= e!231150 (not e!231149))))

(declare-fun res!215632 () Bool)

(assert (=> b!379992 (=> res!215632 e!231149)))

(assert (=> b!379992 (= res!215632 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6084 0))(
  ( (tuple2!6085 (_1!3053 (_ BitVec 64)) (_2!3053 V!13323)) )
))
(declare-datatypes ((List!5921 0))(
  ( (Nil!5918) (Cons!5917 (h!6773 tuple2!6084) (t!11063 List!5921)) )
))
(declare-datatypes ((ListLongMap!4999 0))(
  ( (ListLongMap!5000 (toList!2515 List!5921)) )
))
(declare-fun lt!177728 () ListLongMap!4999)

(declare-fun zeroValue!472 () V!13323)

(declare-fun minValue!472 () V!13323)

(declare-fun getCurrentListMap!1954 (array!22234 array!22232 (_ BitVec 32) (_ BitVec 32) V!13323 V!13323 (_ BitVec 32) Int) ListLongMap!4999)

(assert (=> b!379992 (= lt!177728 (getCurrentListMap!1954 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177734 () array!22232)

(declare-fun lt!177729 () ListLongMap!4999)

(declare-fun lt!177736 () array!22234)

(assert (=> b!379992 (= lt!177729 (getCurrentListMap!1954 lt!177736 lt!177734 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177733 () ListLongMap!4999)

(declare-fun lt!177735 () ListLongMap!4999)

(assert (=> b!379992 (and (= lt!177733 lt!177735) (= lt!177735 lt!177733))))

(declare-fun lt!177732 () ListLongMap!4999)

(declare-fun lt!177724 () tuple2!6084)

(declare-fun +!911 (ListLongMap!4999 tuple2!6084) ListLongMap!4999)

(assert (=> b!379992 (= lt!177735 (+!911 lt!177732 lt!177724))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13323)

(assert (=> b!379992 (= lt!177724 (tuple2!6085 k0!778 v!373))))

(declare-datatypes ((Unit!11703 0))(
  ( (Unit!11704) )
))
(declare-fun lt!177726 () Unit!11703)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!141 (array!22234 array!22232 (_ BitVec 32) (_ BitVec 32) V!13323 V!13323 (_ BitVec 32) (_ BitVec 64) V!13323 (_ BitVec 32) Int) Unit!11703)

(assert (=> b!379992 (= lt!177726 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!141 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!801 (array!22234 array!22232 (_ BitVec 32) (_ BitVec 32) V!13323 V!13323 (_ BitVec 32) Int) ListLongMap!4999)

(assert (=> b!379992 (= lt!177733 (getCurrentListMapNoExtraKeys!801 lt!177736 lt!177734 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379992 (= lt!177734 (array!22233 (store (arr!10584 _values!506) i!548 (ValueCellFull!4238 v!373)) (size!10936 _values!506)))))

(assert (=> b!379992 (= lt!177732 (getCurrentListMapNoExtraKeys!801 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379993 () Bool)

(declare-fun res!215627 () Bool)

(assert (=> b!379993 (=> (not res!215627) (not e!231148))))

(assert (=> b!379993 (= res!215627 (or (= (select (arr!10585 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10585 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379994 () Bool)

(declare-fun res!215628 () Bool)

(assert (=> b!379994 (=> (not res!215628) (not e!231148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379994 (= res!215628 (validKeyInArray!0 k0!778))))

(declare-fun b!379995 () Bool)

(declare-fun res!215634 () Bool)

(assert (=> b!379995 (=> (not res!215634) (not e!231148))))

(declare-fun arrayContainsKey!0 (array!22234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379995 (= res!215634 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15309 () Bool)

(declare-fun mapRes!15309 () Bool)

(assert (=> mapIsEmpty!15309 mapRes!15309))

(declare-fun b!379996 () Bool)

(declare-fun e!231145 () Bool)

(declare-fun e!231143 () Bool)

(assert (=> b!379996 (= e!231145 (and e!231143 mapRes!15309))))

(declare-fun condMapEmpty!15309 () Bool)

(declare-fun mapDefault!15309 () ValueCell!4238)

(assert (=> b!379996 (= condMapEmpty!15309 (= (arr!10584 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4238)) mapDefault!15309)))))

(declare-fun b!379997 () Bool)

(declare-fun res!215633 () Bool)

(assert (=> b!379997 (=> (not res!215633) (not e!231150))))

(declare-datatypes ((List!5922 0))(
  ( (Nil!5919) (Cons!5918 (h!6774 (_ BitVec 64)) (t!11064 List!5922)) )
))
(declare-fun arrayNoDuplicates!0 (array!22234 (_ BitVec 32) List!5922) Bool)

(assert (=> b!379997 (= res!215633 (arrayNoDuplicates!0 lt!177736 #b00000000000000000000000000000000 Nil!5919))))

(declare-fun b!379998 () Bool)

(declare-fun tp_is_empty!9163 () Bool)

(assert (=> b!379998 (= e!231143 tp_is_empty!9163)))

(declare-fun b!380000 () Bool)

(declare-fun e!231147 () Bool)

(assert (=> b!380000 (= e!231147 tp_is_empty!9163)))

(declare-fun b!380001 () Bool)

(declare-fun res!215631 () Bool)

(assert (=> b!380001 (=> (not res!215631) (not e!231148))))

(assert (=> b!380001 (= res!215631 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5919))))

(declare-fun b!380002 () Bool)

(declare-fun e!231146 () Bool)

(assert (=> b!380002 (= e!231149 e!231146)))

(declare-fun res!215636 () Bool)

(assert (=> b!380002 (=> res!215636 e!231146)))

(assert (=> b!380002 (= res!215636 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177731 () ListLongMap!4999)

(assert (=> b!380002 (= lt!177728 lt!177731)))

(declare-fun lt!177730 () tuple2!6084)

(assert (=> b!380002 (= lt!177731 (+!911 lt!177732 lt!177730))))

(declare-fun lt!177725 () ListLongMap!4999)

(assert (=> b!380002 (= lt!177729 lt!177725)))

(assert (=> b!380002 (= lt!177725 (+!911 lt!177735 lt!177730))))

(assert (=> b!380002 (= lt!177729 (+!911 lt!177733 lt!177730))))

(assert (=> b!380002 (= lt!177730 (tuple2!6085 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15309 () Bool)

(declare-fun tp!30261 () Bool)

(assert (=> mapNonEmpty!15309 (= mapRes!15309 (and tp!30261 e!231147))))

(declare-fun mapRest!15309 () (Array (_ BitVec 32) ValueCell!4238))

(declare-fun mapKey!15309 () (_ BitVec 32))

(declare-fun mapValue!15309 () ValueCell!4238)

(assert (=> mapNonEmpty!15309 (= (arr!10584 _values!506) (store mapRest!15309 mapKey!15309 mapValue!15309))))

(declare-fun res!215629 () Bool)

(assert (=> start!37374 (=> (not res!215629) (not e!231148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37374 (= res!215629 (validMask!0 mask!970))))

(assert (=> start!37374 e!231148))

(declare-fun array_inv!7838 (array!22232) Bool)

(assert (=> start!37374 (and (array_inv!7838 _values!506) e!231145)))

(assert (=> start!37374 tp!30260))

(assert (=> start!37374 true))

(assert (=> start!37374 tp_is_empty!9163))

(declare-fun array_inv!7839 (array!22234) Bool)

(assert (=> start!37374 (array_inv!7839 _keys!658)))

(declare-fun b!379999 () Bool)

(declare-fun res!215630 () Bool)

(assert (=> b!379999 (=> (not res!215630) (not e!231148))))

(assert (=> b!379999 (= res!215630 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10937 _keys!658))))))

(declare-fun b!380003 () Bool)

(assert (=> b!380003 (= e!231146 true)))

(assert (=> b!380003 (= lt!177725 (+!911 lt!177731 lt!177724))))

(declare-fun lt!177727 () Unit!11703)

(declare-fun addCommutativeForDiffKeys!322 (ListLongMap!4999 (_ BitVec 64) V!13323 (_ BitVec 64) V!13323) Unit!11703)

(assert (=> b!380003 (= lt!177727 (addCommutativeForDiffKeys!322 lt!177732 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380004 () Bool)

(declare-fun res!215626 () Bool)

(assert (=> b!380004 (=> (not res!215626) (not e!231148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22234 (_ BitVec 32)) Bool)

(assert (=> b!380004 (= res!215626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380005 () Bool)

(assert (=> b!380005 (= e!231148 e!231150)))

(declare-fun res!215635 () Bool)

(assert (=> b!380005 (=> (not res!215635) (not e!231150))))

(assert (=> b!380005 (= res!215635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177736 mask!970))))

(assert (=> b!380005 (= lt!177736 (array!22235 (store (arr!10585 _keys!658) i!548 k0!778) (size!10937 _keys!658)))))

(assert (= (and start!37374 res!215629) b!379991))

(assert (= (and b!379991 res!215625) b!380004))

(assert (= (and b!380004 res!215626) b!380001))

(assert (= (and b!380001 res!215631) b!379999))

(assert (= (and b!379999 res!215630) b!379994))

(assert (= (and b!379994 res!215628) b!379993))

(assert (= (and b!379993 res!215627) b!379995))

(assert (= (and b!379995 res!215634) b!380005))

(assert (= (and b!380005 res!215635) b!379997))

(assert (= (and b!379997 res!215633) b!379992))

(assert (= (and b!379992 (not res!215632)) b!380002))

(assert (= (and b!380002 (not res!215636)) b!380003))

(assert (= (and b!379996 condMapEmpty!15309) mapIsEmpty!15309))

(assert (= (and b!379996 (not condMapEmpty!15309)) mapNonEmpty!15309))

(get-info :version)

(assert (= (and mapNonEmpty!15309 ((_ is ValueCellFull!4238) mapValue!15309)) b!380000))

(assert (= (and b!379996 ((_ is ValueCellFull!4238) mapDefault!15309)) b!379998))

(assert (= start!37374 b!379996))

(declare-fun m!377189 () Bool)

(assert (=> b!379994 m!377189))

(declare-fun m!377191 () Bool)

(assert (=> start!37374 m!377191))

(declare-fun m!377193 () Bool)

(assert (=> start!37374 m!377193))

(declare-fun m!377195 () Bool)

(assert (=> start!37374 m!377195))

(declare-fun m!377197 () Bool)

(assert (=> b!379997 m!377197))

(declare-fun m!377199 () Bool)

(assert (=> b!380005 m!377199))

(declare-fun m!377201 () Bool)

(assert (=> b!380005 m!377201))

(declare-fun m!377203 () Bool)

(assert (=> b!380001 m!377203))

(declare-fun m!377205 () Bool)

(assert (=> b!379995 m!377205))

(declare-fun m!377207 () Bool)

(assert (=> mapNonEmpty!15309 m!377207))

(declare-fun m!377209 () Bool)

(assert (=> b!379993 m!377209))

(declare-fun m!377211 () Bool)

(assert (=> b!379992 m!377211))

(declare-fun m!377213 () Bool)

(assert (=> b!379992 m!377213))

(declare-fun m!377215 () Bool)

(assert (=> b!379992 m!377215))

(declare-fun m!377217 () Bool)

(assert (=> b!379992 m!377217))

(declare-fun m!377219 () Bool)

(assert (=> b!379992 m!377219))

(declare-fun m!377221 () Bool)

(assert (=> b!379992 m!377221))

(declare-fun m!377223 () Bool)

(assert (=> b!379992 m!377223))

(declare-fun m!377225 () Bool)

(assert (=> b!380004 m!377225))

(declare-fun m!377227 () Bool)

(assert (=> b!380002 m!377227))

(declare-fun m!377229 () Bool)

(assert (=> b!380002 m!377229))

(declare-fun m!377231 () Bool)

(assert (=> b!380002 m!377231))

(declare-fun m!377233 () Bool)

(assert (=> b!380003 m!377233))

(declare-fun m!377235 () Bool)

(assert (=> b!380003 m!377235))

(check-sat (not b!380002) (not start!37374) (not b!380005) (not b!380003) (not b_next!8515) (not mapNonEmpty!15309) b_and!15771 (not b!379992) (not b!379994) (not b!380004) (not b!380001) tp_is_empty!9163 (not b!379995) (not b!379997))
(check-sat b_and!15771 (not b_next!8515))
