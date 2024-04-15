; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20104 () Bool)

(assert start!20104)

(declare-fun b_free!4759 () Bool)

(declare-fun b_next!4759 () Bool)

(assert (=> start!20104 (= b_free!4759 (not b_next!4759))))

(declare-fun tp!17309 () Bool)

(declare-fun b_and!11479 () Bool)

(assert (=> start!20104 (= tp!17309 b_and!11479)))

(declare-fun b!196787 () Bool)

(declare-fun res!92943 () Bool)

(declare-fun e!129570 () Bool)

(assert (=> b!196787 (=> (not res!92943) (not e!129570))))

(declare-datatypes ((array!8461 0))(
  ( (array!8462 (arr!3980 (Array (_ BitVec 32) (_ BitVec 64))) (size!4306 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8461)

(declare-datatypes ((List!2470 0))(
  ( (Nil!2467) (Cons!2466 (h!3108 (_ BitVec 64)) (t!7392 List!2470)) )
))
(declare-fun arrayNoDuplicates!0 (array!8461 (_ BitVec 32) List!2470) Bool)

(assert (=> b!196787 (= res!92943 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2467))))

(declare-fun b!196788 () Bool)

(declare-fun res!92944 () Bool)

(assert (=> b!196788 (=> (not res!92944) (not e!129570))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196788 (= res!92944 (validKeyInArray!0 k0!843))))

(declare-fun b!196789 () Bool)

(declare-fun res!92939 () Bool)

(assert (=> b!196789 (=> (not res!92939) (not e!129570))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196789 (= res!92939 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4306 _keys!825))))))

(declare-fun b!196790 () Bool)

(declare-fun res!92945 () Bool)

(assert (=> b!196790 (=> (not res!92945) (not e!129570))))

(assert (=> b!196790 (= res!92945 (= (select (arr!3980 _keys!825) i!601) k0!843))))

(declare-fun res!92940 () Bool)

(assert (=> start!20104 (=> (not res!92940) (not e!129570))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20104 (= res!92940 (validMask!0 mask!1149))))

(assert (=> start!20104 e!129570))

(declare-datatypes ((V!5801 0))(
  ( (V!5802 (val!2352 Int)) )
))
(declare-datatypes ((ValueCell!1964 0))(
  ( (ValueCellFull!1964 (v!4316 V!5801)) (EmptyCell!1964) )
))
(declare-datatypes ((array!8463 0))(
  ( (array!8464 (arr!3981 (Array (_ BitVec 32) ValueCell!1964)) (size!4307 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8463)

(declare-fun e!129571 () Bool)

(declare-fun array_inv!2585 (array!8463) Bool)

(assert (=> start!20104 (and (array_inv!2585 _values!649) e!129571)))

(assert (=> start!20104 true))

(declare-fun tp_is_empty!4615 () Bool)

(assert (=> start!20104 tp_is_empty!4615))

(declare-fun array_inv!2586 (array!8461) Bool)

(assert (=> start!20104 (array_inv!2586 _keys!825)))

(assert (=> start!20104 tp!17309))

(declare-fun mapNonEmpty!7991 () Bool)

(declare-fun mapRes!7991 () Bool)

(declare-fun tp!17308 () Bool)

(declare-fun e!129573 () Bool)

(assert (=> mapNonEmpty!7991 (= mapRes!7991 (and tp!17308 e!129573))))

(declare-fun mapRest!7991 () (Array (_ BitVec 32) ValueCell!1964))

(declare-fun mapValue!7991 () ValueCell!1964)

(declare-fun mapKey!7991 () (_ BitVec 32))

(assert (=> mapNonEmpty!7991 (= (arr!3981 _values!649) (store mapRest!7991 mapKey!7991 mapValue!7991))))

(declare-fun b!196791 () Bool)

(declare-fun e!129569 () Bool)

(assert (=> b!196791 (= e!129571 (and e!129569 mapRes!7991))))

(declare-fun condMapEmpty!7991 () Bool)

(declare-fun mapDefault!7991 () ValueCell!1964)

(assert (=> b!196791 (= condMapEmpty!7991 (= (arr!3981 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1964)) mapDefault!7991)))))

(declare-fun b!196792 () Bool)

(declare-fun res!92941 () Bool)

(assert (=> b!196792 (=> (not res!92941) (not e!129570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8461 (_ BitVec 32)) Bool)

(assert (=> b!196792 (= res!92941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196793 () Bool)

(assert (=> b!196793 (= e!129569 tp_is_empty!4615)))

(declare-fun b!196794 () Bool)

(assert (=> b!196794 (= e!129570 false)))

(declare-datatypes ((tuple2!3540 0))(
  ( (tuple2!3541 (_1!1781 (_ BitVec 64)) (_2!1781 V!5801)) )
))
(declare-datatypes ((List!2471 0))(
  ( (Nil!2468) (Cons!2467 (h!3109 tuple2!3540) (t!7393 List!2471)) )
))
(declare-datatypes ((ListLongMap!2443 0))(
  ( (ListLongMap!2444 (toList!1237 List!2471)) )
))
(declare-fun lt!97487 () ListLongMap!2443)

(declare-fun zeroValue!615 () V!5801)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5801)

(declare-fun getCurrentListMapNoExtraKeys!217 (array!8461 array!8463 (_ BitVec 32) (_ BitVec 32) V!5801 V!5801 (_ BitVec 32) Int) ListLongMap!2443)

(assert (=> b!196794 (= lt!97487 (getCurrentListMapNoExtraKeys!217 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196795 () Bool)

(assert (=> b!196795 (= e!129573 tp_is_empty!4615)))

(declare-fun b!196796 () Bool)

(declare-fun res!92942 () Bool)

(assert (=> b!196796 (=> (not res!92942) (not e!129570))))

(assert (=> b!196796 (= res!92942 (and (= (size!4307 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4306 _keys!825) (size!4307 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7991 () Bool)

(assert (=> mapIsEmpty!7991 mapRes!7991))

(assert (= (and start!20104 res!92940) b!196796))

(assert (= (and b!196796 res!92942) b!196792))

(assert (= (and b!196792 res!92941) b!196787))

(assert (= (and b!196787 res!92943) b!196789))

(assert (= (and b!196789 res!92939) b!196788))

(assert (= (and b!196788 res!92944) b!196790))

(assert (= (and b!196790 res!92945) b!196794))

(assert (= (and b!196791 condMapEmpty!7991) mapIsEmpty!7991))

(assert (= (and b!196791 (not condMapEmpty!7991)) mapNonEmpty!7991))

(get-info :version)

(assert (= (and mapNonEmpty!7991 ((_ is ValueCellFull!1964) mapValue!7991)) b!196795))

(assert (= (and b!196791 ((_ is ValueCellFull!1964) mapDefault!7991)) b!196793))

(assert (= start!20104 b!196791))

(declare-fun m!223401 () Bool)

(assert (=> b!196787 m!223401))

(declare-fun m!223403 () Bool)

(assert (=> start!20104 m!223403))

(declare-fun m!223405 () Bool)

(assert (=> start!20104 m!223405))

(declare-fun m!223407 () Bool)

(assert (=> start!20104 m!223407))

(declare-fun m!223409 () Bool)

(assert (=> b!196792 m!223409))

(declare-fun m!223411 () Bool)

(assert (=> b!196790 m!223411))

(declare-fun m!223413 () Bool)

(assert (=> b!196788 m!223413))

(declare-fun m!223415 () Bool)

(assert (=> mapNonEmpty!7991 m!223415))

(declare-fun m!223417 () Bool)

(assert (=> b!196794 m!223417))

(check-sat b_and!11479 (not b_next!4759) (not mapNonEmpty!7991) (not b!196787) (not start!20104) (not b!196794) tp_is_empty!4615 (not b!196792) (not b!196788))
(check-sat b_and!11479 (not b_next!4759))
