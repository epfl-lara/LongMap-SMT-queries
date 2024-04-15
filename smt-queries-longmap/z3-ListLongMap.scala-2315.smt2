; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37338 () Bool)

(assert start!37338)

(declare-fun b_free!8479 () Bool)

(declare-fun b_next!8479 () Bool)

(assert (=> start!37338 (= b_free!8479 (not b_next!8479))))

(declare-fun tp!30152 () Bool)

(declare-fun b_and!15695 () Bool)

(assert (=> start!37338 (= tp!30152 b_and!15695)))

(declare-fun b!378959 () Bool)

(declare-fun res!214852 () Bool)

(declare-fun e!230569 () Bool)

(assert (=> b!378959 (=> (not res!214852) (not e!230569))))

(declare-datatypes ((array!22159 0))(
  ( (array!22160 (arr!10548 (Array (_ BitVec 32) (_ BitVec 64))) (size!10901 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22159)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378959 (= res!214852 (or (= (select (arr!10548 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10548 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378960 () Bool)

(declare-fun res!214859 () Bool)

(assert (=> b!378960 (=> (not res!214859) (not e!230569))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13275 0))(
  ( (V!13276 (val!4608 Int)) )
))
(declare-datatypes ((ValueCell!4220 0))(
  ( (ValueCellFull!4220 (v!6799 V!13275)) (EmptyCell!4220) )
))
(declare-datatypes ((array!22161 0))(
  ( (array!22162 (arr!10549 (Array (_ BitVec 32) ValueCell!4220)) (size!10902 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22161)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!378960 (= res!214859 (and (= (size!10902 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10901 _keys!658) (size!10902 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378961 () Bool)

(declare-fun res!214855 () Bool)

(declare-fun e!230575 () Bool)

(assert (=> b!378961 (=> (not res!214855) (not e!230575))))

(declare-fun lt!176780 () array!22159)

(declare-datatypes ((List!5967 0))(
  ( (Nil!5964) (Cons!5963 (h!6819 (_ BitVec 64)) (t!11108 List!5967)) )
))
(declare-fun arrayNoDuplicates!0 (array!22159 (_ BitVec 32) List!5967) Bool)

(assert (=> b!378961 (= res!214855 (arrayNoDuplicates!0 lt!176780 #b00000000000000000000000000000000 Nil!5964))))

(declare-fun b!378962 () Bool)

(declare-fun res!214862 () Bool)

(assert (=> b!378962 (=> (not res!214862) (not e!230569))))

(assert (=> b!378962 (= res!214862 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10901 _keys!658))))))

(declare-fun b!378963 () Bool)

(declare-fun e!230573 () Bool)

(declare-fun e!230570 () Bool)

(assert (=> b!378963 (= e!230573 e!230570)))

(declare-fun res!214858 () Bool)

(assert (=> b!378963 (=> res!214858 e!230570)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!378963 (= res!214858 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6138 0))(
  ( (tuple2!6139 (_1!3080 (_ BitVec 64)) (_2!3080 V!13275)) )
))
(declare-datatypes ((List!5968 0))(
  ( (Nil!5965) (Cons!5964 (h!6820 tuple2!6138) (t!11109 List!5968)) )
))
(declare-datatypes ((ListLongMap!5041 0))(
  ( (ListLongMap!5042 (toList!2536 List!5968)) )
))
(declare-fun lt!176781 () ListLongMap!5041)

(declare-fun lt!176777 () ListLongMap!5041)

(assert (=> b!378963 (= lt!176781 lt!176777)))

(declare-fun lt!176775 () ListLongMap!5041)

(declare-fun lt!176776 () tuple2!6138)

(declare-fun +!904 (ListLongMap!5041 tuple2!6138) ListLongMap!5041)

(assert (=> b!378963 (= lt!176777 (+!904 lt!176775 lt!176776))))

(declare-fun lt!176779 () ListLongMap!5041)

(declare-fun lt!176772 () ListLongMap!5041)

(assert (=> b!378963 (= lt!176779 lt!176772)))

(declare-fun lt!176774 () ListLongMap!5041)

(assert (=> b!378963 (= lt!176772 (+!904 lt!176774 lt!176776))))

(declare-fun lt!176770 () ListLongMap!5041)

(assert (=> b!378963 (= lt!176779 (+!904 lt!176770 lt!176776))))

(declare-fun minValue!472 () V!13275)

(assert (=> b!378963 (= lt!176776 (tuple2!6139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378964 () Bool)

(declare-fun res!214860 () Bool)

(assert (=> b!378964 (=> (not res!214860) (not e!230569))))

(assert (=> b!378964 (= res!214860 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5964))))

(declare-fun mapNonEmpty!15255 () Bool)

(declare-fun mapRes!15255 () Bool)

(declare-fun tp!30153 () Bool)

(declare-fun e!230574 () Bool)

(assert (=> mapNonEmpty!15255 (= mapRes!15255 (and tp!30153 e!230574))))

(declare-fun mapRest!15255 () (Array (_ BitVec 32) ValueCell!4220))

(declare-fun mapKey!15255 () (_ BitVec 32))

(declare-fun mapValue!15255 () ValueCell!4220)

(assert (=> mapNonEmpty!15255 (= (arr!10549 _values!506) (store mapRest!15255 mapKey!15255 mapValue!15255))))

(declare-fun b!378965 () Bool)

(declare-fun res!214851 () Bool)

(assert (=> b!378965 (=> (not res!214851) (not e!230569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22159 (_ BitVec 32)) Bool)

(assert (=> b!378965 (= res!214851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!214861 () Bool)

(assert (=> start!37338 (=> (not res!214861) (not e!230569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37338 (= res!214861 (validMask!0 mask!970))))

(assert (=> start!37338 e!230569))

(declare-fun e!230572 () Bool)

(declare-fun array_inv!7774 (array!22161) Bool)

(assert (=> start!37338 (and (array_inv!7774 _values!506) e!230572)))

(assert (=> start!37338 tp!30152))

(assert (=> start!37338 true))

(declare-fun tp_is_empty!9127 () Bool)

(assert (=> start!37338 tp_is_empty!9127))

(declare-fun array_inv!7775 (array!22159) Bool)

(assert (=> start!37338 (array_inv!7775 _keys!658)))

(declare-fun b!378966 () Bool)

(declare-fun res!214853 () Bool)

(assert (=> b!378966 (=> (not res!214853) (not e!230569))))

(declare-fun arrayContainsKey!0 (array!22159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378966 (= res!214853 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378967 () Bool)

(assert (=> b!378967 (= e!230575 (not e!230573))))

(declare-fun res!214857 () Bool)

(assert (=> b!378967 (=> res!214857 e!230573)))

(assert (=> b!378967 (= res!214857 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13275)

(declare-fun getCurrentListMap!1936 (array!22159 array!22161 (_ BitVec 32) (_ BitVec 32) V!13275 V!13275 (_ BitVec 32) Int) ListLongMap!5041)

(assert (=> b!378967 (= lt!176781 (getCurrentListMap!1936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176771 () array!22161)

(assert (=> b!378967 (= lt!176779 (getCurrentListMap!1936 lt!176780 lt!176771 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378967 (and (= lt!176770 lt!176774) (= lt!176774 lt!176770))))

(declare-fun lt!176773 () tuple2!6138)

(assert (=> b!378967 (= lt!176774 (+!904 lt!176775 lt!176773))))

(declare-fun v!373 () V!13275)

(assert (=> b!378967 (= lt!176773 (tuple2!6139 k0!778 v!373))))

(declare-datatypes ((Unit!11670 0))(
  ( (Unit!11671) )
))
(declare-fun lt!176769 () Unit!11670)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!129 (array!22159 array!22161 (_ BitVec 32) (_ BitVec 32) V!13275 V!13275 (_ BitVec 32) (_ BitVec 64) V!13275 (_ BitVec 32) Int) Unit!11670)

(assert (=> b!378967 (= lt!176769 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!129 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!801 (array!22159 array!22161 (_ BitVec 32) (_ BitVec 32) V!13275 V!13275 (_ BitVec 32) Int) ListLongMap!5041)

(assert (=> b!378967 (= lt!176770 (getCurrentListMapNoExtraKeys!801 lt!176780 lt!176771 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378967 (= lt!176771 (array!22162 (store (arr!10549 _values!506) i!548 (ValueCellFull!4220 v!373)) (size!10902 _values!506)))))

(assert (=> b!378967 (= lt!176775 (getCurrentListMapNoExtraKeys!801 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378968 () Bool)

(declare-fun e!230576 () Bool)

(assert (=> b!378968 (= e!230576 tp_is_empty!9127)))

(declare-fun b!378969 () Bool)

(assert (=> b!378969 (= e!230572 (and e!230576 mapRes!15255))))

(declare-fun condMapEmpty!15255 () Bool)

(declare-fun mapDefault!15255 () ValueCell!4220)

(assert (=> b!378969 (= condMapEmpty!15255 (= (arr!10549 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4220)) mapDefault!15255)))))

(declare-fun mapIsEmpty!15255 () Bool)

(assert (=> mapIsEmpty!15255 mapRes!15255))

(declare-fun b!378970 () Bool)

(assert (=> b!378970 (= e!230570 true)))

(assert (=> b!378970 (= lt!176772 (+!904 lt!176777 lt!176773))))

(declare-fun lt!176778 () Unit!11670)

(declare-fun addCommutativeForDiffKeys!302 (ListLongMap!5041 (_ BitVec 64) V!13275 (_ BitVec 64) V!13275) Unit!11670)

(assert (=> b!378970 (= lt!176778 (addCommutativeForDiffKeys!302 lt!176775 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378971 () Bool)

(declare-fun res!214854 () Bool)

(assert (=> b!378971 (=> (not res!214854) (not e!230569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378971 (= res!214854 (validKeyInArray!0 k0!778))))

(declare-fun b!378972 () Bool)

(assert (=> b!378972 (= e!230574 tp_is_empty!9127)))

(declare-fun b!378973 () Bool)

(assert (=> b!378973 (= e!230569 e!230575)))

(declare-fun res!214856 () Bool)

(assert (=> b!378973 (=> (not res!214856) (not e!230575))))

(assert (=> b!378973 (= res!214856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176780 mask!970))))

(assert (=> b!378973 (= lt!176780 (array!22160 (store (arr!10548 _keys!658) i!548 k0!778) (size!10901 _keys!658)))))

(assert (= (and start!37338 res!214861) b!378960))

(assert (= (and b!378960 res!214859) b!378965))

(assert (= (and b!378965 res!214851) b!378964))

(assert (= (and b!378964 res!214860) b!378962))

(assert (= (and b!378962 res!214862) b!378971))

(assert (= (and b!378971 res!214854) b!378959))

(assert (= (and b!378959 res!214852) b!378966))

(assert (= (and b!378966 res!214853) b!378973))

(assert (= (and b!378973 res!214856) b!378961))

(assert (= (and b!378961 res!214855) b!378967))

(assert (= (and b!378967 (not res!214857)) b!378963))

(assert (= (and b!378963 (not res!214858)) b!378970))

(assert (= (and b!378969 condMapEmpty!15255) mapIsEmpty!15255))

(assert (= (and b!378969 (not condMapEmpty!15255)) mapNonEmpty!15255))

(get-info :version)

(assert (= (and mapNonEmpty!15255 ((_ is ValueCellFull!4220) mapValue!15255)) b!378972))

(assert (= (and b!378969 ((_ is ValueCellFull!4220) mapDefault!15255)) b!378968))

(assert (= start!37338 b!378969))

(declare-fun m!375371 () Bool)

(assert (=> b!378971 m!375371))

(declare-fun m!375373 () Bool)

(assert (=> start!37338 m!375373))

(declare-fun m!375375 () Bool)

(assert (=> start!37338 m!375375))

(declare-fun m!375377 () Bool)

(assert (=> start!37338 m!375377))

(declare-fun m!375379 () Bool)

(assert (=> b!378965 m!375379))

(declare-fun m!375381 () Bool)

(assert (=> b!378963 m!375381))

(declare-fun m!375383 () Bool)

(assert (=> b!378963 m!375383))

(declare-fun m!375385 () Bool)

(assert (=> b!378963 m!375385))

(declare-fun m!375387 () Bool)

(assert (=> b!378959 m!375387))

(declare-fun m!375389 () Bool)

(assert (=> b!378964 m!375389))

(declare-fun m!375391 () Bool)

(assert (=> b!378973 m!375391))

(declare-fun m!375393 () Bool)

(assert (=> b!378973 m!375393))

(declare-fun m!375395 () Bool)

(assert (=> b!378961 m!375395))

(declare-fun m!375397 () Bool)

(assert (=> mapNonEmpty!15255 m!375397))

(declare-fun m!375399 () Bool)

(assert (=> b!378967 m!375399))

(declare-fun m!375401 () Bool)

(assert (=> b!378967 m!375401))

(declare-fun m!375403 () Bool)

(assert (=> b!378967 m!375403))

(declare-fun m!375405 () Bool)

(assert (=> b!378967 m!375405))

(declare-fun m!375407 () Bool)

(assert (=> b!378967 m!375407))

(declare-fun m!375409 () Bool)

(assert (=> b!378967 m!375409))

(declare-fun m!375411 () Bool)

(assert (=> b!378967 m!375411))

(declare-fun m!375413 () Bool)

(assert (=> b!378970 m!375413))

(declare-fun m!375415 () Bool)

(assert (=> b!378970 m!375415))

(declare-fun m!375417 () Bool)

(assert (=> b!378966 m!375417))

(check-sat (not b!378961) (not b!378963) b_and!15695 (not b!378971) (not mapNonEmpty!15255) (not start!37338) (not b!378964) (not b!378970) (not b!378967) tp_is_empty!9127 (not b!378966) (not b!378973) (not b!378965) (not b_next!8479))
(check-sat b_and!15695 (not b_next!8479))
