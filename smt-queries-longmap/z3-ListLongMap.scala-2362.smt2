; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37620 () Bool)

(assert start!37620)

(declare-fun b_free!8761 () Bool)

(declare-fun b_next!8761 () Bool)

(assert (=> start!37620 (= b_free!8761 (not b_next!8761))))

(declare-fun tp!30998 () Bool)

(declare-fun b_and!16017 () Bool)

(assert (=> start!37620 (= tp!30998 b_and!16017)))

(declare-fun res!219750 () Bool)

(declare-fun e!233792 () Bool)

(assert (=> start!37620 (=> (not res!219750) (not e!233792))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37620 (= res!219750 (validMask!0 mask!970))))

(assert (=> start!37620 e!233792))

(declare-datatypes ((V!13651 0))(
  ( (V!13652 (val!4749 Int)) )
))
(declare-datatypes ((ValueCell!4361 0))(
  ( (ValueCellFull!4361 (v!6947 V!13651)) (EmptyCell!4361) )
))
(declare-datatypes ((array!22710 0))(
  ( (array!22711 (arr!10823 (Array (_ BitVec 32) ValueCell!4361)) (size!11175 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22710)

(declare-fun e!233794 () Bool)

(declare-fun array_inv!8004 (array!22710) Bool)

(assert (=> start!37620 (and (array_inv!8004 _values!506) e!233794)))

(assert (=> start!37620 tp!30998))

(assert (=> start!37620 true))

(declare-fun tp_is_empty!9409 () Bool)

(assert (=> start!37620 tp_is_empty!9409))

(declare-datatypes ((array!22712 0))(
  ( (array!22713 (arr!10824 (Array (_ BitVec 32) (_ BitVec 64))) (size!11176 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22712)

(declare-fun array_inv!8005 (array!22712) Bool)

(assert (=> start!37620 (array_inv!8005 _keys!658)))

(declare-fun b!385220 () Bool)

(declare-fun res!219755 () Bool)

(assert (=> b!385220 (=> (not res!219755) (not e!233792))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385220 (= res!219755 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11176 _keys!658))))))

(declare-fun b!385221 () Bool)

(declare-fun res!219751 () Bool)

(assert (=> b!385221 (=> (not res!219751) (not e!233792))))

(declare-datatypes ((List!6105 0))(
  ( (Nil!6102) (Cons!6101 (h!6957 (_ BitVec 64)) (t!11247 List!6105)) )
))
(declare-fun arrayNoDuplicates!0 (array!22712 (_ BitVec 32) List!6105) Bool)

(assert (=> b!385221 (= res!219751 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6102))))

(declare-fun b!385222 () Bool)

(declare-fun res!219749 () Bool)

(declare-fun e!233791 () Bool)

(assert (=> b!385222 (=> (not res!219749) (not e!233791))))

(declare-fun lt!181554 () array!22712)

(assert (=> b!385222 (= res!219749 (arrayNoDuplicates!0 lt!181554 #b00000000000000000000000000000000 Nil!6102))))

(declare-fun b!385223 () Bool)

(declare-fun res!219757 () Bool)

(assert (=> b!385223 (=> (not res!219757) (not e!233792))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385223 (= res!219757 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385224 () Bool)

(declare-fun res!219748 () Bool)

(assert (=> b!385224 (=> (not res!219748) (not e!233792))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385224 (= res!219748 (and (= (size!11175 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11176 _keys!658) (size!11175 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385225 () Bool)

(declare-fun e!233789 () Bool)

(declare-fun e!233796 () Bool)

(assert (=> b!385225 (= e!233789 e!233796)))

(declare-fun res!219758 () Bool)

(assert (=> b!385225 (=> res!219758 e!233796)))

(declare-datatypes ((tuple2!6268 0))(
  ( (tuple2!6269 (_1!3145 (_ BitVec 64)) (_2!3145 V!13651)) )
))
(declare-datatypes ((List!6106 0))(
  ( (Nil!6103) (Cons!6102 (h!6958 tuple2!6268) (t!11248 List!6106)) )
))
(declare-datatypes ((ListLongMap!5183 0))(
  ( (ListLongMap!5184 (toList!2607 List!6106)) )
))
(declare-fun lt!181557 () ListLongMap!5183)

(declare-fun lt!181556 () ListLongMap!5183)

(declare-fun lt!181561 () tuple2!6268)

(declare-fun +!999 (ListLongMap!5183 tuple2!6268) ListLongMap!5183)

(assert (=> b!385225 (= res!219758 (not (= (+!999 lt!181557 lt!181561) lt!181556)))))

(declare-fun lt!181553 () ListLongMap!5183)

(assert (=> b!385225 (= lt!181556 lt!181553)))

(declare-fun b!385226 () Bool)

(declare-fun e!233793 () Bool)

(declare-fun mapRes!15678 () Bool)

(assert (=> b!385226 (= e!233794 (and e!233793 mapRes!15678))))

(declare-fun condMapEmpty!15678 () Bool)

(declare-fun mapDefault!15678 () ValueCell!4361)

(assert (=> b!385226 (= condMapEmpty!15678 (= (arr!10823 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4361)) mapDefault!15678)))))

(declare-fun b!385227 () Bool)

(assert (=> b!385227 (= e!233791 (not e!233789))))

(declare-fun res!219754 () Bool)

(assert (=> b!385227 (=> res!219754 e!233789)))

(declare-fun lt!181558 () Bool)

(assert (=> b!385227 (= res!219754 (or (and (not lt!181558) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181558) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181558)))))

(assert (=> b!385227 (= lt!181558 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13651)

(declare-fun minValue!472 () V!13651)

(declare-fun getCurrentListMap!2037 (array!22712 array!22710 (_ BitVec 32) (_ BitVec 32) V!13651 V!13651 (_ BitVec 32) Int) ListLongMap!5183)

(assert (=> b!385227 (= lt!181557 (getCurrentListMap!2037 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181559 () array!22710)

(assert (=> b!385227 (= lt!181556 (getCurrentListMap!2037 lt!181554 lt!181559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181555 () ListLongMap!5183)

(assert (=> b!385227 (and (= lt!181553 lt!181555) (= lt!181555 lt!181553))))

(declare-fun lt!181560 () ListLongMap!5183)

(assert (=> b!385227 (= lt!181555 (+!999 lt!181560 lt!181561))))

(declare-fun v!373 () V!13651)

(assert (=> b!385227 (= lt!181561 (tuple2!6269 k0!778 v!373))))

(declare-datatypes ((Unit!11869 0))(
  ( (Unit!11870) )
))
(declare-fun lt!181552 () Unit!11869)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!224 (array!22712 array!22710 (_ BitVec 32) (_ BitVec 32) V!13651 V!13651 (_ BitVec 32) (_ BitVec 64) V!13651 (_ BitVec 32) Int) Unit!11869)

(assert (=> b!385227 (= lt!181552 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!224 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!884 (array!22712 array!22710 (_ BitVec 32) (_ BitVec 32) V!13651 V!13651 (_ BitVec 32) Int) ListLongMap!5183)

(assert (=> b!385227 (= lt!181553 (getCurrentListMapNoExtraKeys!884 lt!181554 lt!181559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385227 (= lt!181559 (array!22711 (store (arr!10823 _values!506) i!548 (ValueCellFull!4361 v!373)) (size!11175 _values!506)))))

(assert (=> b!385227 (= lt!181560 (getCurrentListMapNoExtraKeys!884 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385228 () Bool)

(assert (=> b!385228 (= e!233792 e!233791)))

(declare-fun res!219756 () Bool)

(assert (=> b!385228 (=> (not res!219756) (not e!233791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22712 (_ BitVec 32)) Bool)

(assert (=> b!385228 (= res!219756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181554 mask!970))))

(assert (=> b!385228 (= lt!181554 (array!22713 (store (arr!10824 _keys!658) i!548 k0!778) (size!11176 _keys!658)))))

(declare-fun b!385229 () Bool)

(declare-fun res!219747 () Bool)

(assert (=> b!385229 (=> (not res!219747) (not e!233792))))

(assert (=> b!385229 (= res!219747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385230 () Bool)

(assert (=> b!385230 (= e!233796 (bvsle #b00000000000000000000000000000000 (size!11176 _keys!658)))))

(declare-fun b!385231 () Bool)

(declare-fun res!219752 () Bool)

(assert (=> b!385231 (=> (not res!219752) (not e!233792))))

(assert (=> b!385231 (= res!219752 (or (= (select (arr!10824 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10824 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15678 () Bool)

(assert (=> mapIsEmpty!15678 mapRes!15678))

(declare-fun b!385232 () Bool)

(declare-fun res!219753 () Bool)

(assert (=> b!385232 (=> (not res!219753) (not e!233792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385232 (= res!219753 (validKeyInArray!0 k0!778))))

(declare-fun b!385233 () Bool)

(declare-fun e!233790 () Bool)

(assert (=> b!385233 (= e!233790 tp_is_empty!9409)))

(declare-fun b!385234 () Bool)

(assert (=> b!385234 (= e!233793 tp_is_empty!9409)))

(declare-fun mapNonEmpty!15678 () Bool)

(declare-fun tp!30999 () Bool)

(assert (=> mapNonEmpty!15678 (= mapRes!15678 (and tp!30999 e!233790))))

(declare-fun mapKey!15678 () (_ BitVec 32))

(declare-fun mapRest!15678 () (Array (_ BitVec 32) ValueCell!4361))

(declare-fun mapValue!15678 () ValueCell!4361)

(assert (=> mapNonEmpty!15678 (= (arr!10823 _values!506) (store mapRest!15678 mapKey!15678 mapValue!15678))))

(assert (= (and start!37620 res!219750) b!385224))

(assert (= (and b!385224 res!219748) b!385229))

(assert (= (and b!385229 res!219747) b!385221))

(assert (= (and b!385221 res!219751) b!385220))

(assert (= (and b!385220 res!219755) b!385232))

(assert (= (and b!385232 res!219753) b!385231))

(assert (= (and b!385231 res!219752) b!385223))

(assert (= (and b!385223 res!219757) b!385228))

(assert (= (and b!385228 res!219756) b!385222))

(assert (= (and b!385222 res!219749) b!385227))

(assert (= (and b!385227 (not res!219754)) b!385225))

(assert (= (and b!385225 (not res!219758)) b!385230))

(assert (= (and b!385226 condMapEmpty!15678) mapIsEmpty!15678))

(assert (= (and b!385226 (not condMapEmpty!15678)) mapNonEmpty!15678))

(get-info :version)

(assert (= (and mapNonEmpty!15678 ((_ is ValueCellFull!4361) mapValue!15678)) b!385233))

(assert (= (and b!385226 ((_ is ValueCellFull!4361) mapDefault!15678)) b!385234))

(assert (= start!37620 b!385226))

(declare-fun m!382145 () Bool)

(assert (=> start!37620 m!382145))

(declare-fun m!382147 () Bool)

(assert (=> start!37620 m!382147))

(declare-fun m!382149 () Bool)

(assert (=> start!37620 m!382149))

(declare-fun m!382151 () Bool)

(assert (=> b!385227 m!382151))

(declare-fun m!382153 () Bool)

(assert (=> b!385227 m!382153))

(declare-fun m!382155 () Bool)

(assert (=> b!385227 m!382155))

(declare-fun m!382157 () Bool)

(assert (=> b!385227 m!382157))

(declare-fun m!382159 () Bool)

(assert (=> b!385227 m!382159))

(declare-fun m!382161 () Bool)

(assert (=> b!385227 m!382161))

(declare-fun m!382163 () Bool)

(assert (=> b!385227 m!382163))

(declare-fun m!382165 () Bool)

(assert (=> b!385225 m!382165))

(declare-fun m!382167 () Bool)

(assert (=> b!385228 m!382167))

(declare-fun m!382169 () Bool)

(assert (=> b!385228 m!382169))

(declare-fun m!382171 () Bool)

(assert (=> b!385223 m!382171))

(declare-fun m!382173 () Bool)

(assert (=> b!385232 m!382173))

(declare-fun m!382175 () Bool)

(assert (=> b!385229 m!382175))

(declare-fun m!382177 () Bool)

(assert (=> mapNonEmpty!15678 m!382177))

(declare-fun m!382179 () Bool)

(assert (=> b!385221 m!382179))

(declare-fun m!382181 () Bool)

(assert (=> b!385231 m!382181))

(declare-fun m!382183 () Bool)

(assert (=> b!385222 m!382183))

(check-sat (not b!385223) (not b!385221) tp_is_empty!9409 (not b!385222) b_and!16017 (not b!385227) (not b!385229) (not b!385225) (not mapNonEmpty!15678) (not b!385232) (not b_next!8761) (not start!37620) (not b!385228))
(check-sat b_and!16017 (not b_next!8761))
