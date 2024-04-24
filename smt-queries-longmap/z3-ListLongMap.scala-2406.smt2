; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38062 () Bool)

(assert start!38062)

(declare-fun b_free!9001 () Bool)

(declare-fun b_next!9001 () Bool)

(assert (=> start!38062 (= b_free!9001 (not b_next!9001))))

(declare-fun tp!31779 () Bool)

(declare-fun b_and!16353 () Bool)

(assert (=> start!38062 (= tp!31779 b_and!16353)))

(declare-fun b!392073 () Bool)

(declare-fun e!237440 () Bool)

(declare-fun tp_is_empty!9673 () Bool)

(assert (=> b!392073 (= e!237440 tp_is_empty!9673)))

(declare-fun b!392074 () Bool)

(declare-fun e!237442 () Bool)

(assert (=> b!392074 (= e!237442 tp_is_empty!9673)))

(declare-fun b!392075 () Bool)

(declare-datatypes ((V!14003 0))(
  ( (V!14004 (val!4881 Int)) )
))
(declare-datatypes ((tuple2!6444 0))(
  ( (tuple2!6445 (_1!3233 (_ BitVec 64)) (_2!3233 V!14003)) )
))
(declare-datatypes ((List!6291 0))(
  ( (Nil!6288) (Cons!6287 (h!7143 tuple2!6444) (t!11449 List!6291)) )
))
(declare-datatypes ((ListLongMap!5359 0))(
  ( (ListLongMap!5360 (toList!2695 List!6291)) )
))
(declare-fun lt!185253 () ListLongMap!5359)

(declare-fun lt!185251 () tuple2!6444)

(declare-fun e!237437 () Bool)

(declare-fun lt!185250 () ListLongMap!5359)

(declare-fun +!1049 (ListLongMap!5359 tuple2!6444) ListLongMap!5359)

(assert (=> b!392075 (= e!237437 (= lt!185250 (+!1049 lt!185253 lt!185251)))))

(declare-fun lt!185255 () ListLongMap!5359)

(assert (=> b!392075 (= lt!185250 (+!1049 lt!185255 lt!185251))))

(declare-fun minValue!472 () V!14003)

(assert (=> b!392075 (= lt!185251 (tuple2!6445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392076 () Bool)

(declare-fun e!237443 () Bool)

(declare-fun e!237438 () Bool)

(assert (=> b!392076 (= e!237443 e!237438)))

(declare-fun res!224516 () Bool)

(assert (=> b!392076 (=> (not res!224516) (not e!237438))))

(declare-datatypes ((array!23236 0))(
  ( (array!23237 (arr!11078 (Array (_ BitVec 32) (_ BitVec 64))) (size!11430 (_ BitVec 32))) )
))
(declare-fun lt!185254 () array!23236)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23236 (_ BitVec 32)) Bool)

(assert (=> b!392076 (= res!224516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185254 mask!970))))

(declare-fun _keys!658 () array!23236)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!392076 (= lt!185254 (array!23237 (store (arr!11078 _keys!658) i!548 k0!778) (size!11430 _keys!658)))))

(declare-fun b!392077 () Bool)

(declare-fun res!224517 () Bool)

(assert (=> b!392077 (=> (not res!224517) (not e!237443))))

(declare-fun arrayContainsKey!0 (array!23236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392077 (= res!224517 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392078 () Bool)

(declare-fun res!224523 () Bool)

(assert (=> b!392078 (=> (not res!224523) (not e!237443))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4493 0))(
  ( (ValueCellFull!4493 (v!7111 V!14003)) (EmptyCell!4493) )
))
(declare-datatypes ((array!23238 0))(
  ( (array!23239 (arr!11079 (Array (_ BitVec 32) ValueCell!4493)) (size!11431 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23238)

(assert (=> b!392078 (= res!224523 (and (= (size!11431 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11430 _keys!658) (size!11431 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!224520 () Bool)

(assert (=> start!38062 (=> (not res!224520) (not e!237443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38062 (= res!224520 (validMask!0 mask!970))))

(assert (=> start!38062 e!237443))

(declare-fun e!237439 () Bool)

(declare-fun array_inv!8188 (array!23238) Bool)

(assert (=> start!38062 (and (array_inv!8188 _values!506) e!237439)))

(assert (=> start!38062 tp!31779))

(assert (=> start!38062 true))

(assert (=> start!38062 tp_is_empty!9673))

(declare-fun array_inv!8189 (array!23236) Bool)

(assert (=> start!38062 (array_inv!8189 _keys!658)))

(declare-fun b!392079 () Bool)

(assert (=> b!392079 (= e!237438 (not e!237437))))

(declare-fun res!224522 () Bool)

(assert (=> b!392079 (=> res!224522 e!237437)))

(assert (=> b!392079 (= res!224522 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14003)

(declare-fun lt!185257 () ListLongMap!5359)

(declare-fun getCurrentListMap!2073 (array!23236 array!23238 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) Int) ListLongMap!5359)

(assert (=> b!392079 (= lt!185257 (getCurrentListMap!2073 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185249 () array!23238)

(assert (=> b!392079 (= lt!185250 (getCurrentListMap!2073 lt!185254 lt!185249 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392079 (and (= lt!185255 lt!185253) (= lt!185253 lt!185255))))

(declare-fun v!373 () V!14003)

(declare-fun lt!185252 () ListLongMap!5359)

(assert (=> b!392079 (= lt!185253 (+!1049 lt!185252 (tuple2!6445 k0!778 v!373)))))

(declare-datatypes ((Unit!11969 0))(
  ( (Unit!11970) )
))
(declare-fun lt!185256 () Unit!11969)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!264 (array!23236 array!23238 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) (_ BitVec 64) V!14003 (_ BitVec 32) Int) Unit!11969)

(assert (=> b!392079 (= lt!185256 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!264 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!962 (array!23236 array!23238 (_ BitVec 32) (_ BitVec 32) V!14003 V!14003 (_ BitVec 32) Int) ListLongMap!5359)

(assert (=> b!392079 (= lt!185255 (getCurrentListMapNoExtraKeys!962 lt!185254 lt!185249 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392079 (= lt!185249 (array!23239 (store (arr!11079 _values!506) i!548 (ValueCellFull!4493 v!373)) (size!11431 _values!506)))))

(assert (=> b!392079 (= lt!185252 (getCurrentListMapNoExtraKeys!962 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392080 () Bool)

(declare-fun res!224526 () Bool)

(assert (=> b!392080 (=> (not res!224526) (not e!237443))))

(assert (=> b!392080 (= res!224526 (or (= (select (arr!11078 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11078 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392081 () Bool)

(declare-fun res!224524 () Bool)

(assert (=> b!392081 (=> (not res!224524) (not e!237443))))

(assert (=> b!392081 (= res!224524 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11430 _keys!658))))))

(declare-fun b!392082 () Bool)

(declare-fun mapRes!16098 () Bool)

(assert (=> b!392082 (= e!237439 (and e!237442 mapRes!16098))))

(declare-fun condMapEmpty!16098 () Bool)

(declare-fun mapDefault!16098 () ValueCell!4493)

(assert (=> b!392082 (= condMapEmpty!16098 (= (arr!11079 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4493)) mapDefault!16098)))))

(declare-fun b!392083 () Bool)

(declare-fun res!224518 () Bool)

(assert (=> b!392083 (=> (not res!224518) (not e!237443))))

(assert (=> b!392083 (= res!224518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392084 () Bool)

(declare-fun res!224519 () Bool)

(assert (=> b!392084 (=> (not res!224519) (not e!237443))))

(declare-datatypes ((List!6292 0))(
  ( (Nil!6289) (Cons!6288 (h!7144 (_ BitVec 64)) (t!11450 List!6292)) )
))
(declare-fun arrayNoDuplicates!0 (array!23236 (_ BitVec 32) List!6292) Bool)

(assert (=> b!392084 (= res!224519 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6289))))

(declare-fun b!392085 () Bool)

(declare-fun res!224525 () Bool)

(assert (=> b!392085 (=> (not res!224525) (not e!237438))))

(assert (=> b!392085 (= res!224525 (arrayNoDuplicates!0 lt!185254 #b00000000000000000000000000000000 Nil!6289))))

(declare-fun mapIsEmpty!16098 () Bool)

(assert (=> mapIsEmpty!16098 mapRes!16098))

(declare-fun b!392086 () Bool)

(declare-fun res!224521 () Bool)

(assert (=> b!392086 (=> (not res!224521) (not e!237443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392086 (= res!224521 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16098 () Bool)

(declare-fun tp!31778 () Bool)

(assert (=> mapNonEmpty!16098 (= mapRes!16098 (and tp!31778 e!237440))))

(declare-fun mapKey!16098 () (_ BitVec 32))

(declare-fun mapRest!16098 () (Array (_ BitVec 32) ValueCell!4493))

(declare-fun mapValue!16098 () ValueCell!4493)

(assert (=> mapNonEmpty!16098 (= (arr!11079 _values!506) (store mapRest!16098 mapKey!16098 mapValue!16098))))

(assert (= (and start!38062 res!224520) b!392078))

(assert (= (and b!392078 res!224523) b!392083))

(assert (= (and b!392083 res!224518) b!392084))

(assert (= (and b!392084 res!224519) b!392081))

(assert (= (and b!392081 res!224524) b!392086))

(assert (= (and b!392086 res!224521) b!392080))

(assert (= (and b!392080 res!224526) b!392077))

(assert (= (and b!392077 res!224517) b!392076))

(assert (= (and b!392076 res!224516) b!392085))

(assert (= (and b!392085 res!224525) b!392079))

(assert (= (and b!392079 (not res!224522)) b!392075))

(assert (= (and b!392082 condMapEmpty!16098) mapIsEmpty!16098))

(assert (= (and b!392082 (not condMapEmpty!16098)) mapNonEmpty!16098))

(get-info :version)

(assert (= (and mapNonEmpty!16098 ((_ is ValueCellFull!4493) mapValue!16098)) b!392073))

(assert (= (and b!392082 ((_ is ValueCellFull!4493) mapDefault!16098)) b!392074))

(assert (= start!38062 b!392082))

(declare-fun m!388751 () Bool)

(assert (=> b!392085 m!388751))

(declare-fun m!388753 () Bool)

(assert (=> b!392075 m!388753))

(declare-fun m!388755 () Bool)

(assert (=> b!392075 m!388755))

(declare-fun m!388757 () Bool)

(assert (=> b!392086 m!388757))

(declare-fun m!388759 () Bool)

(assert (=> b!392076 m!388759))

(declare-fun m!388761 () Bool)

(assert (=> b!392076 m!388761))

(declare-fun m!388763 () Bool)

(assert (=> b!392080 m!388763))

(declare-fun m!388765 () Bool)

(assert (=> b!392084 m!388765))

(declare-fun m!388767 () Bool)

(assert (=> mapNonEmpty!16098 m!388767))

(declare-fun m!388769 () Bool)

(assert (=> b!392079 m!388769))

(declare-fun m!388771 () Bool)

(assert (=> b!392079 m!388771))

(declare-fun m!388773 () Bool)

(assert (=> b!392079 m!388773))

(declare-fun m!388775 () Bool)

(assert (=> b!392079 m!388775))

(declare-fun m!388777 () Bool)

(assert (=> b!392079 m!388777))

(declare-fun m!388779 () Bool)

(assert (=> b!392079 m!388779))

(declare-fun m!388781 () Bool)

(assert (=> b!392079 m!388781))

(declare-fun m!388783 () Bool)

(assert (=> b!392083 m!388783))

(declare-fun m!388785 () Bool)

(assert (=> start!38062 m!388785))

(declare-fun m!388787 () Bool)

(assert (=> start!38062 m!388787))

(declare-fun m!388789 () Bool)

(assert (=> start!38062 m!388789))

(declare-fun m!388791 () Bool)

(assert (=> b!392077 m!388791))

(check-sat (not b!392076) (not b_next!9001) (not b!392083) (not start!38062) (not b!392086) (not b!392079) (not b!392084) b_and!16353 (not b!392085) (not mapNonEmpty!16098) (not b!392077) tp_is_empty!9673 (not b!392075))
(check-sat b_and!16353 (not b_next!9001))
