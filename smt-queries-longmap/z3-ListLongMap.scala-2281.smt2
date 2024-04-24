; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37134 () Bool)

(assert start!37134)

(declare-fun b_free!8275 () Bool)

(declare-fun b_next!8275 () Bool)

(assert (=> start!37134 (= b_free!8275 (not b_next!8275))))

(declare-fun tp!29541 () Bool)

(declare-fun b_and!15531 () Bool)

(assert (=> start!37134 (= tp!29541 b_and!15531)))

(declare-fun b!374573 () Bool)

(declare-fun e!228263 () Bool)

(declare-fun tp_is_empty!8923 () Bool)

(assert (=> b!374573 (= e!228263 tp_is_empty!8923)))

(declare-fun b!374574 () Bool)

(declare-fun res!211290 () Bool)

(declare-fun e!228265 () Bool)

(assert (=> b!374574 (=> (not res!211290) (not e!228265))))

(declare-datatypes ((array!21766 0))(
  ( (array!21767 (arr!10351 (Array (_ BitVec 32) (_ BitVec 64))) (size!10703 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21766)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374574 (= res!211290 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14949 () Bool)

(declare-fun mapRes!14949 () Bool)

(declare-fun tp!29540 () Bool)

(declare-fun e!228266 () Bool)

(assert (=> mapNonEmpty!14949 (= mapRes!14949 (and tp!29540 e!228266))))

(declare-datatypes ((V!13003 0))(
  ( (V!13004 (val!4506 Int)) )
))
(declare-datatypes ((ValueCell!4118 0))(
  ( (ValueCellFull!4118 (v!6704 V!13003)) (EmptyCell!4118) )
))
(declare-datatypes ((array!21768 0))(
  ( (array!21769 (arr!10352 (Array (_ BitVec 32) ValueCell!4118)) (size!10704 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21768)

(declare-fun mapValue!14949 () ValueCell!4118)

(declare-fun mapRest!14949 () (Array (_ BitVec 32) ValueCell!4118))

(declare-fun mapKey!14949 () (_ BitVec 32))

(assert (=> mapNonEmpty!14949 (= (arr!10352 _values!506) (store mapRest!14949 mapKey!14949 mapValue!14949))))

(declare-fun b!374575 () Bool)

(assert (=> b!374575 (= e!228266 tp_is_empty!8923)))

(declare-fun b!374577 () Bool)

(declare-fun res!211292 () Bool)

(assert (=> b!374577 (=> (not res!211292) (not e!228265))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374577 (= res!211292 (or (= (select (arr!10351 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10351 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374578 () Bool)

(declare-fun e!228268 () Bool)

(assert (=> b!374578 (= e!228268 true)))

(declare-datatypes ((tuple2!5896 0))(
  ( (tuple2!5897 (_1!2959 (_ BitVec 64)) (_2!2959 V!13003)) )
))
(declare-datatypes ((List!5740 0))(
  ( (Nil!5737) (Cons!5736 (h!6592 tuple2!5896) (t!10882 List!5740)) )
))
(declare-datatypes ((ListLongMap!4811 0))(
  ( (ListLongMap!4812 (toList!2421 List!5740)) )
))
(declare-fun lt!172844 () ListLongMap!4811)

(declare-fun lt!172851 () tuple2!5896)

(declare-fun lt!172852 () ListLongMap!4811)

(declare-fun lt!172848 () tuple2!5896)

(declare-fun +!817 (ListLongMap!4811 tuple2!5896) ListLongMap!4811)

(assert (=> b!374578 (= (+!817 lt!172852 lt!172848) (+!817 lt!172844 lt!172851))))

(declare-fun v!373 () V!13003)

(declare-datatypes ((Unit!11523 0))(
  ( (Unit!11524) )
))
(declare-fun lt!172843 () Unit!11523)

(declare-fun lt!172850 () ListLongMap!4811)

(declare-fun minValue!472 () V!13003)

(declare-fun addCommutativeForDiffKeys!245 (ListLongMap!4811 (_ BitVec 64) V!13003 (_ BitVec 64) V!13003) Unit!11523)

(assert (=> b!374578 (= lt!172843 (addCommutativeForDiffKeys!245 lt!172850 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374579 () Bool)

(declare-fun e!228270 () Bool)

(assert (=> b!374579 (= e!228265 e!228270)))

(declare-fun res!211297 () Bool)

(assert (=> b!374579 (=> (not res!211297) (not e!228270))))

(declare-fun lt!172841 () array!21766)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21766 (_ BitVec 32)) Bool)

(assert (=> b!374579 (= res!211297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172841 mask!970))))

(assert (=> b!374579 (= lt!172841 (array!21767 (store (arr!10351 _keys!658) i!548 k0!778) (size!10703 _keys!658)))))

(declare-fun b!374580 () Bool)

(declare-fun res!211291 () Bool)

(assert (=> b!374580 (=> (not res!211291) (not e!228265))))

(assert (=> b!374580 (= res!211291 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10703 _keys!658))))))

(declare-fun b!374581 () Bool)

(declare-fun e!228264 () Bool)

(assert (=> b!374581 (= e!228270 (not e!228264))))

(declare-fun res!211288 () Bool)

(assert (=> b!374581 (=> res!211288 e!228264)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374581 (= res!211288 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13003)

(declare-fun lt!172838 () ListLongMap!4811)

(declare-fun getCurrentListMap!1879 (array!21766 array!21768 (_ BitVec 32) (_ BitVec 32) V!13003 V!13003 (_ BitVec 32) Int) ListLongMap!4811)

(assert (=> b!374581 (= lt!172838 (getCurrentListMap!1879 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172837 () array!21768)

(declare-fun lt!172839 () ListLongMap!4811)

(assert (=> b!374581 (= lt!172839 (getCurrentListMap!1879 lt!172841 lt!172837 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172840 () ListLongMap!4811)

(declare-fun lt!172836 () ListLongMap!4811)

(assert (=> b!374581 (and (= lt!172840 lt!172836) (= lt!172836 lt!172840))))

(declare-fun lt!172847 () ListLongMap!4811)

(assert (=> b!374581 (= lt!172836 (+!817 lt!172847 lt!172851))))

(assert (=> b!374581 (= lt!172851 (tuple2!5897 k0!778 v!373))))

(declare-fun lt!172845 () Unit!11523)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!66 (array!21766 array!21768 (_ BitVec 32) (_ BitVec 32) V!13003 V!13003 (_ BitVec 32) (_ BitVec 64) V!13003 (_ BitVec 32) Int) Unit!11523)

(assert (=> b!374581 (= lt!172845 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!66 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!726 (array!21766 array!21768 (_ BitVec 32) (_ BitVec 32) V!13003 V!13003 (_ BitVec 32) Int) ListLongMap!4811)

(assert (=> b!374581 (= lt!172840 (getCurrentListMapNoExtraKeys!726 lt!172841 lt!172837 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374581 (= lt!172837 (array!21769 (store (arr!10352 _values!506) i!548 (ValueCellFull!4118 v!373)) (size!10704 _values!506)))))

(assert (=> b!374581 (= lt!172847 (getCurrentListMapNoExtraKeys!726 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374582 () Bool)

(declare-fun res!211287 () Bool)

(assert (=> b!374582 (=> (not res!211287) (not e!228265))))

(declare-datatypes ((List!5741 0))(
  ( (Nil!5738) (Cons!5737 (h!6593 (_ BitVec 64)) (t!10883 List!5741)) )
))
(declare-fun arrayNoDuplicates!0 (array!21766 (_ BitVec 32) List!5741) Bool)

(assert (=> b!374582 (= res!211287 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5738))))

(declare-fun b!374583 () Bool)

(declare-fun e!228269 () Bool)

(assert (=> b!374583 (= e!228269 (and e!228263 mapRes!14949))))

(declare-fun condMapEmpty!14949 () Bool)

(declare-fun mapDefault!14949 () ValueCell!4118)

(assert (=> b!374583 (= condMapEmpty!14949 (= (arr!10352 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4118)) mapDefault!14949)))))

(declare-fun mapIsEmpty!14949 () Bool)

(assert (=> mapIsEmpty!14949 mapRes!14949))

(declare-fun b!374584 () Bool)

(declare-fun res!211295 () Bool)

(assert (=> b!374584 (=> (not res!211295) (not e!228265))))

(assert (=> b!374584 (= res!211295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374585 () Bool)

(declare-fun res!211296 () Bool)

(assert (=> b!374585 (=> (not res!211296) (not e!228265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374585 (= res!211296 (validKeyInArray!0 k0!778))))

(declare-fun b!374576 () Bool)

(assert (=> b!374576 (= e!228264 e!228268)))

(declare-fun res!211293 () Bool)

(assert (=> b!374576 (=> res!211293 e!228268)))

(assert (=> b!374576 (= res!211293 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172849 () ListLongMap!4811)

(assert (=> b!374576 (= lt!172849 lt!172852)))

(assert (=> b!374576 (= lt!172852 (+!817 lt!172850 lt!172851))))

(declare-fun lt!172842 () Unit!11523)

(assert (=> b!374576 (= lt!172842 (addCommutativeForDiffKeys!245 lt!172847 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374576 (= lt!172839 (+!817 lt!172849 lt!172848))))

(declare-fun lt!172846 () tuple2!5896)

(assert (=> b!374576 (= lt!172849 (+!817 lt!172836 lt!172846))))

(assert (=> b!374576 (= lt!172838 lt!172844)))

(assert (=> b!374576 (= lt!172844 (+!817 lt!172850 lt!172848))))

(assert (=> b!374576 (= lt!172850 (+!817 lt!172847 lt!172846))))

(assert (=> b!374576 (= lt!172839 (+!817 (+!817 lt!172840 lt!172846) lt!172848))))

(assert (=> b!374576 (= lt!172848 (tuple2!5897 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374576 (= lt!172846 (tuple2!5897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!211289 () Bool)

(assert (=> start!37134 (=> (not res!211289) (not e!228265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37134 (= res!211289 (validMask!0 mask!970))))

(assert (=> start!37134 e!228265))

(declare-fun array_inv!7684 (array!21768) Bool)

(assert (=> start!37134 (and (array_inv!7684 _values!506) e!228269)))

(assert (=> start!37134 tp!29541))

(assert (=> start!37134 true))

(assert (=> start!37134 tp_is_empty!8923))

(declare-fun array_inv!7685 (array!21766) Bool)

(assert (=> start!37134 (array_inv!7685 _keys!658)))

(declare-fun b!374586 () Bool)

(declare-fun res!211298 () Bool)

(assert (=> b!374586 (=> (not res!211298) (not e!228265))))

(assert (=> b!374586 (= res!211298 (and (= (size!10704 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10703 _keys!658) (size!10704 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374587 () Bool)

(declare-fun res!211294 () Bool)

(assert (=> b!374587 (=> (not res!211294) (not e!228270))))

(assert (=> b!374587 (= res!211294 (arrayNoDuplicates!0 lt!172841 #b00000000000000000000000000000000 Nil!5738))))

(assert (= (and start!37134 res!211289) b!374586))

(assert (= (and b!374586 res!211298) b!374584))

(assert (= (and b!374584 res!211295) b!374582))

(assert (= (and b!374582 res!211287) b!374580))

(assert (= (and b!374580 res!211291) b!374585))

(assert (= (and b!374585 res!211296) b!374577))

(assert (= (and b!374577 res!211292) b!374574))

(assert (= (and b!374574 res!211290) b!374579))

(assert (= (and b!374579 res!211297) b!374587))

(assert (= (and b!374587 res!211294) b!374581))

(assert (= (and b!374581 (not res!211288)) b!374576))

(assert (= (and b!374576 (not res!211293)) b!374578))

(assert (= (and b!374583 condMapEmpty!14949) mapIsEmpty!14949))

(assert (= (and b!374583 (not condMapEmpty!14949)) mapNonEmpty!14949))

(get-info :version)

(assert (= (and mapNonEmpty!14949 ((_ is ValueCellFull!4118) mapValue!14949)) b!374575))

(assert (= (and b!374583 ((_ is ValueCellFull!4118) mapDefault!14949)) b!374573))

(assert (= start!37134 b!374583))

(declare-fun m!371165 () Bool)

(assert (=> b!374582 m!371165))

(declare-fun m!371167 () Bool)

(assert (=> b!374574 m!371167))

(declare-fun m!371169 () Bool)

(assert (=> b!374587 m!371169))

(declare-fun m!371171 () Bool)

(assert (=> b!374579 m!371171))

(declare-fun m!371173 () Bool)

(assert (=> b!374579 m!371173))

(declare-fun m!371175 () Bool)

(assert (=> b!374581 m!371175))

(declare-fun m!371177 () Bool)

(assert (=> b!374581 m!371177))

(declare-fun m!371179 () Bool)

(assert (=> b!374581 m!371179))

(declare-fun m!371181 () Bool)

(assert (=> b!374581 m!371181))

(declare-fun m!371183 () Bool)

(assert (=> b!374581 m!371183))

(declare-fun m!371185 () Bool)

(assert (=> b!374581 m!371185))

(declare-fun m!371187 () Bool)

(assert (=> b!374581 m!371187))

(declare-fun m!371189 () Bool)

(assert (=> mapNonEmpty!14949 m!371189))

(declare-fun m!371191 () Bool)

(assert (=> b!374576 m!371191))

(declare-fun m!371193 () Bool)

(assert (=> b!374576 m!371193))

(declare-fun m!371195 () Bool)

(assert (=> b!374576 m!371195))

(declare-fun m!371197 () Bool)

(assert (=> b!374576 m!371197))

(assert (=> b!374576 m!371193))

(declare-fun m!371199 () Bool)

(assert (=> b!374576 m!371199))

(declare-fun m!371201 () Bool)

(assert (=> b!374576 m!371201))

(declare-fun m!371203 () Bool)

(assert (=> b!374576 m!371203))

(declare-fun m!371205 () Bool)

(assert (=> b!374576 m!371205))

(declare-fun m!371207 () Bool)

(assert (=> b!374578 m!371207))

(declare-fun m!371209 () Bool)

(assert (=> b!374578 m!371209))

(declare-fun m!371211 () Bool)

(assert (=> b!374578 m!371211))

(declare-fun m!371213 () Bool)

(assert (=> b!374584 m!371213))

(declare-fun m!371215 () Bool)

(assert (=> start!37134 m!371215))

(declare-fun m!371217 () Bool)

(assert (=> start!37134 m!371217))

(declare-fun m!371219 () Bool)

(assert (=> start!37134 m!371219))

(declare-fun m!371221 () Bool)

(assert (=> b!374585 m!371221))

(declare-fun m!371223 () Bool)

(assert (=> b!374577 m!371223))

(check-sat tp_is_empty!8923 (not b!374587) (not b_next!8275) b_and!15531 (not b!374578) (not mapNonEmpty!14949) (not b!374581) (not b!374582) (not b!374585) (not b!374579) (not start!37134) (not b!374576) (not b!374574) (not b!374584))
(check-sat b_and!15531 (not b_next!8275))
