; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37480 () Bool)

(assert start!37480)

(declare-fun b_free!8607 () Bool)

(declare-fun b_next!8607 () Bool)

(assert (=> start!37480 (= b_free!8607 (not b_next!8607))))

(declare-fun tp!30537 () Bool)

(declare-fun b_and!15849 () Bool)

(assert (=> start!37480 (= tp!30537 b_and!15849)))

(declare-fun b!382024 () Bool)

(declare-fun e!232193 () Bool)

(declare-fun tp_is_empty!9255 () Bool)

(assert (=> b!382024 (= e!232193 tp_is_empty!9255)))

(declare-fun mapIsEmpty!15447 () Bool)

(declare-fun mapRes!15447 () Bool)

(assert (=> mapIsEmpty!15447 mapRes!15447))

(declare-fun b!382025 () Bool)

(declare-fun res!217208 () Bool)

(declare-fun e!232196 () Bool)

(assert (=> b!382025 (=> (not res!217208) (not e!232196))))

(declare-datatypes ((array!22419 0))(
  ( (array!22420 (arr!10678 (Array (_ BitVec 32) (_ BitVec 64))) (size!11030 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22419)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382025 (= res!217208 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382026 () Bool)

(declare-fun res!217206 () Bool)

(assert (=> b!382026 (=> (not res!217206) (not e!232196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382026 (= res!217206 (validKeyInArray!0 k0!778))))

(declare-fun res!217198 () Bool)

(assert (=> start!37480 (=> (not res!217198) (not e!232196))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37480 (= res!217198 (validMask!0 mask!970))))

(assert (=> start!37480 e!232196))

(declare-datatypes ((V!13445 0))(
  ( (V!13446 (val!4672 Int)) )
))
(declare-datatypes ((ValueCell!4284 0))(
  ( (ValueCellFull!4284 (v!6869 V!13445)) (EmptyCell!4284) )
))
(declare-datatypes ((array!22421 0))(
  ( (array!22422 (arr!10679 (Array (_ BitVec 32) ValueCell!4284)) (size!11031 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22421)

(declare-fun e!232197 () Bool)

(declare-fun array_inv!7862 (array!22421) Bool)

(assert (=> start!37480 (and (array_inv!7862 _values!506) e!232197)))

(assert (=> start!37480 tp!30537))

(assert (=> start!37480 true))

(assert (=> start!37480 tp_is_empty!9255))

(declare-fun array_inv!7863 (array!22419) Bool)

(assert (=> start!37480 (array_inv!7863 _keys!658)))

(declare-fun b!382027 () Bool)

(declare-fun e!232198 () Bool)

(assert (=> b!382027 (= e!232198 true)))

(declare-datatypes ((tuple2!6278 0))(
  ( (tuple2!6279 (_1!3150 (_ BitVec 64)) (_2!3150 V!13445)) )
))
(declare-datatypes ((List!6108 0))(
  ( (Nil!6105) (Cons!6104 (h!6960 tuple2!6278) (t!11258 List!6108)) )
))
(declare-datatypes ((ListLongMap!5191 0))(
  ( (ListLongMap!5192 (toList!2611 List!6108)) )
))
(declare-fun lt!179160 () ListLongMap!5191)

(declare-fun lt!179161 () ListLongMap!5191)

(assert (=> b!382027 (= lt!179160 lt!179161)))

(declare-fun b!382028 () Bool)

(declare-fun e!232194 () Bool)

(assert (=> b!382028 (= e!232197 (and e!232194 mapRes!15447))))

(declare-fun condMapEmpty!15447 () Bool)

(declare-fun mapDefault!15447 () ValueCell!4284)

(assert (=> b!382028 (= condMapEmpty!15447 (= (arr!10679 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4284)) mapDefault!15447)))))

(declare-fun b!382029 () Bool)

(declare-fun res!217202 () Bool)

(assert (=> b!382029 (=> (not res!217202) (not e!232196))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382029 (= res!217202 (or (= (select (arr!10678 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10678 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382030 () Bool)

(declare-fun res!217201 () Bool)

(assert (=> b!382030 (=> (not res!217201) (not e!232196))))

(declare-datatypes ((List!6109 0))(
  ( (Nil!6106) (Cons!6105 (h!6961 (_ BitVec 64)) (t!11259 List!6109)) )
))
(declare-fun arrayNoDuplicates!0 (array!22419 (_ BitVec 32) List!6109) Bool)

(assert (=> b!382030 (= res!217201 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6106))))

(declare-fun b!382031 () Bool)

(declare-fun res!217200 () Bool)

(assert (=> b!382031 (=> (not res!217200) (not e!232196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22419 (_ BitVec 32)) Bool)

(assert (=> b!382031 (= res!217200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382032 () Bool)

(declare-fun e!232199 () Bool)

(assert (=> b!382032 (= e!232199 (not e!232198))))

(declare-fun res!217207 () Bool)

(assert (=> b!382032 (=> res!217207 e!232198)))

(declare-fun lt!179158 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382032 (= res!217207 (or (and (not lt!179158) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179158) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179158)))))

(assert (=> b!382032 (= lt!179158 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!179163 () ListLongMap!5191)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13445)

(declare-fun minValue!472 () V!13445)

(declare-fun getCurrentListMap!2018 (array!22419 array!22421 (_ BitVec 32) (_ BitVec 32) V!13445 V!13445 (_ BitVec 32) Int) ListLongMap!5191)

(assert (=> b!382032 (= lt!179163 (getCurrentListMap!2018 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179159 () array!22419)

(declare-fun lt!179157 () array!22421)

(assert (=> b!382032 (= lt!179160 (getCurrentListMap!2018 lt!179159 lt!179157 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179155 () ListLongMap!5191)

(assert (=> b!382032 (and (= lt!179161 lt!179155) (= lt!179155 lt!179161))))

(declare-fun v!373 () V!13445)

(declare-fun lt!179162 () ListLongMap!5191)

(declare-fun +!948 (ListLongMap!5191 tuple2!6278) ListLongMap!5191)

(assert (=> b!382032 (= lt!179155 (+!948 lt!179162 (tuple2!6279 k0!778 v!373)))))

(declare-datatypes ((Unit!11790 0))(
  ( (Unit!11791) )
))
(declare-fun lt!179156 () Unit!11790)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!176 (array!22419 array!22421 (_ BitVec 32) (_ BitVec 32) V!13445 V!13445 (_ BitVec 32) (_ BitVec 64) V!13445 (_ BitVec 32) Int) Unit!11790)

(assert (=> b!382032 (= lt!179156 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!176 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!852 (array!22419 array!22421 (_ BitVec 32) (_ BitVec 32) V!13445 V!13445 (_ BitVec 32) Int) ListLongMap!5191)

(assert (=> b!382032 (= lt!179161 (getCurrentListMapNoExtraKeys!852 lt!179159 lt!179157 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382032 (= lt!179157 (array!22422 (store (arr!10679 _values!506) i!548 (ValueCellFull!4284 v!373)) (size!11031 _values!506)))))

(assert (=> b!382032 (= lt!179162 (getCurrentListMapNoExtraKeys!852 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382033 () Bool)

(declare-fun res!217199 () Bool)

(assert (=> b!382033 (=> (not res!217199) (not e!232196))))

(assert (=> b!382033 (= res!217199 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11030 _keys!658))))))

(declare-fun mapNonEmpty!15447 () Bool)

(declare-fun tp!30536 () Bool)

(assert (=> mapNonEmpty!15447 (= mapRes!15447 (and tp!30536 e!232193))))

(declare-fun mapRest!15447 () (Array (_ BitVec 32) ValueCell!4284))

(declare-fun mapKey!15447 () (_ BitVec 32))

(declare-fun mapValue!15447 () ValueCell!4284)

(assert (=> mapNonEmpty!15447 (= (arr!10679 _values!506) (store mapRest!15447 mapKey!15447 mapValue!15447))))

(declare-fun b!382034 () Bool)

(assert (=> b!382034 (= e!232194 tp_is_empty!9255)))

(declare-fun b!382035 () Bool)

(declare-fun res!217203 () Bool)

(assert (=> b!382035 (=> (not res!217203) (not e!232199))))

(assert (=> b!382035 (= res!217203 (arrayNoDuplicates!0 lt!179159 #b00000000000000000000000000000000 Nil!6106))))

(declare-fun b!382036 () Bool)

(declare-fun res!217205 () Bool)

(assert (=> b!382036 (=> (not res!217205) (not e!232196))))

(assert (=> b!382036 (= res!217205 (and (= (size!11031 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11030 _keys!658) (size!11031 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382037 () Bool)

(assert (=> b!382037 (= e!232196 e!232199)))

(declare-fun res!217204 () Bool)

(assert (=> b!382037 (=> (not res!217204) (not e!232199))))

(assert (=> b!382037 (= res!217204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179159 mask!970))))

(assert (=> b!382037 (= lt!179159 (array!22420 (store (arr!10678 _keys!658) i!548 k0!778) (size!11030 _keys!658)))))

(assert (= (and start!37480 res!217198) b!382036))

(assert (= (and b!382036 res!217205) b!382031))

(assert (= (and b!382031 res!217200) b!382030))

(assert (= (and b!382030 res!217201) b!382033))

(assert (= (and b!382033 res!217199) b!382026))

(assert (= (and b!382026 res!217206) b!382029))

(assert (= (and b!382029 res!217202) b!382025))

(assert (= (and b!382025 res!217208) b!382037))

(assert (= (and b!382037 res!217204) b!382035))

(assert (= (and b!382035 res!217203) b!382032))

(assert (= (and b!382032 (not res!217207)) b!382027))

(assert (= (and b!382028 condMapEmpty!15447) mapIsEmpty!15447))

(assert (= (and b!382028 (not condMapEmpty!15447)) mapNonEmpty!15447))

(get-info :version)

(assert (= (and mapNonEmpty!15447 ((_ is ValueCellFull!4284) mapValue!15447)) b!382024))

(assert (= (and b!382028 ((_ is ValueCellFull!4284) mapDefault!15447)) b!382034))

(assert (= start!37480 b!382028))

(declare-fun m!378887 () Bool)

(assert (=> b!382025 m!378887))

(declare-fun m!378889 () Bool)

(assert (=> b!382026 m!378889))

(declare-fun m!378891 () Bool)

(assert (=> b!382037 m!378891))

(declare-fun m!378893 () Bool)

(assert (=> b!382037 m!378893))

(declare-fun m!378895 () Bool)

(assert (=> b!382032 m!378895))

(declare-fun m!378897 () Bool)

(assert (=> b!382032 m!378897))

(declare-fun m!378899 () Bool)

(assert (=> b!382032 m!378899))

(declare-fun m!378901 () Bool)

(assert (=> b!382032 m!378901))

(declare-fun m!378903 () Bool)

(assert (=> b!382032 m!378903))

(declare-fun m!378905 () Bool)

(assert (=> b!382032 m!378905))

(declare-fun m!378907 () Bool)

(assert (=> b!382032 m!378907))

(declare-fun m!378909 () Bool)

(assert (=> start!37480 m!378909))

(declare-fun m!378911 () Bool)

(assert (=> start!37480 m!378911))

(declare-fun m!378913 () Bool)

(assert (=> start!37480 m!378913))

(declare-fun m!378915 () Bool)

(assert (=> b!382031 m!378915))

(declare-fun m!378917 () Bool)

(assert (=> b!382029 m!378917))

(declare-fun m!378919 () Bool)

(assert (=> b!382035 m!378919))

(declare-fun m!378921 () Bool)

(assert (=> b!382030 m!378921))

(declare-fun m!378923 () Bool)

(assert (=> mapNonEmpty!15447 m!378923))

(check-sat (not b!382026) tp_is_empty!9255 (not start!37480) (not mapNonEmpty!15447) (not b_next!8607) (not b!382025) (not b!382037) b_and!15849 (not b!382031) (not b!382035) (not b!382030) (not b!382032))
(check-sat b_and!15849 (not b_next!8607))
