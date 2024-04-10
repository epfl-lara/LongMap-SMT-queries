; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40570 () Bool)

(assert start!40570)

(declare-fun b_free!10581 () Bool)

(declare-fun b_next!10581 () Bool)

(assert (=> start!40570 (= b_free!10581 (not b_next!10581))))

(declare-fun tp!37562 () Bool)

(declare-fun b_and!18589 () Bool)

(assert (=> start!40570 (= tp!37562 b_and!18589)))

(declare-fun b!447242 () Bool)

(declare-fun res!265581 () Bool)

(declare-fun e!262647 () Bool)

(assert (=> b!447242 (=> (not res!265581) (not e!262647))))

(declare-datatypes ((array!27645 0))(
  ( (array!27646 (arr!13268 (Array (_ BitVec 32) (_ BitVec 64))) (size!13620 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27645)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447242 (= res!265581 (or (= (select (arr!13268 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13268 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447243 () Bool)

(declare-fun res!265576 () Bool)

(assert (=> b!447243 (=> (not res!265576) (not e!262647))))

(declare-datatypes ((List!7938 0))(
  ( (Nil!7935) (Cons!7934 (h!8790 (_ BitVec 64)) (t!13700 List!7938)) )
))
(declare-fun arrayNoDuplicates!0 (array!27645 (_ BitVec 32) List!7938) Bool)

(assert (=> b!447243 (= res!265576 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7935))))

(declare-fun mapNonEmpty!19512 () Bool)

(declare-fun mapRes!19512 () Bool)

(declare-fun tp!37563 () Bool)

(declare-fun e!262650 () Bool)

(assert (=> mapNonEmpty!19512 (= mapRes!19512 (and tp!37563 e!262650))))

(declare-datatypes ((V!16997 0))(
  ( (V!16998 (val!6004 Int)) )
))
(declare-datatypes ((ValueCell!5616 0))(
  ( (ValueCellFull!5616 (v!8259 V!16997)) (EmptyCell!5616) )
))
(declare-fun mapRest!19512 () (Array (_ BitVec 32) ValueCell!5616))

(declare-datatypes ((array!27647 0))(
  ( (array!27648 (arr!13269 (Array (_ BitVec 32) ValueCell!5616)) (size!13621 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27647)

(declare-fun mapValue!19512 () ValueCell!5616)

(declare-fun mapKey!19512 () (_ BitVec 32))

(assert (=> mapNonEmpty!19512 (= (arr!13269 _values!549) (store mapRest!19512 mapKey!19512 mapValue!19512))))

(declare-fun b!447244 () Bool)

(declare-fun res!265580 () Bool)

(assert (=> b!447244 (=> (not res!265580) (not e!262647))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27645 (_ BitVec 32)) Bool)

(assert (=> b!447244 (= res!265580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447245 () Bool)

(declare-fun res!265584 () Bool)

(assert (=> b!447245 (=> (not res!265584) (not e!262647))))

(assert (=> b!447245 (= res!265584 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13620 _keys!709))))))

(declare-fun b!447246 () Bool)

(declare-fun res!265579 () Bool)

(assert (=> b!447246 (=> (not res!265579) (not e!262647))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447246 (= res!265579 (validKeyInArray!0 k0!794))))

(declare-fun b!447247 () Bool)

(declare-fun res!265577 () Bool)

(assert (=> b!447247 (=> (not res!265577) (not e!262647))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447247 (= res!265577 (and (= (size!13621 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13620 _keys!709) (size!13621 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447248 () Bool)

(declare-fun res!265582 () Bool)

(assert (=> b!447248 (=> (not res!265582) (not e!262647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447248 (= res!265582 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19512 () Bool)

(assert (=> mapIsEmpty!19512 mapRes!19512))

(declare-fun b!447249 () Bool)

(declare-fun res!265583 () Bool)

(assert (=> b!447249 (=> (not res!265583) (not e!262647))))

(declare-fun arrayContainsKey!0 (array!27645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447249 (= res!265583 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447250 () Bool)

(declare-fun e!262652 () Bool)

(declare-fun e!262648 () Bool)

(assert (=> b!447250 (= e!262652 (and e!262648 mapRes!19512))))

(declare-fun condMapEmpty!19512 () Bool)

(declare-fun mapDefault!19512 () ValueCell!5616)

(assert (=> b!447250 (= condMapEmpty!19512 (= (arr!13269 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5616)) mapDefault!19512)))))

(declare-fun b!447251 () Bool)

(declare-fun e!262649 () Bool)

(assert (=> b!447251 (= e!262647 e!262649)))

(declare-fun res!265578 () Bool)

(assert (=> b!447251 (=> (not res!265578) (not e!262649))))

(declare-fun lt!203930 () array!27645)

(assert (=> b!447251 (= res!265578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203930 mask!1025))))

(assert (=> b!447251 (= lt!203930 (array!27646 (store (arr!13268 _keys!709) i!563 k0!794) (size!13620 _keys!709)))))

(declare-fun b!447252 () Bool)

(declare-fun res!265587 () Bool)

(assert (=> b!447252 (=> (not res!265587) (not e!262649))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447252 (= res!265587 (bvsle from!863 i!563))))

(declare-fun b!447253 () Bool)

(declare-fun res!265585 () Bool)

(assert (=> b!447253 (=> (not res!265585) (not e!262649))))

(assert (=> b!447253 (= res!265585 (arrayNoDuplicates!0 lt!203930 #b00000000000000000000000000000000 Nil!7935))))

(declare-fun b!447254 () Bool)

(declare-fun tp_is_empty!11919 () Bool)

(assert (=> b!447254 (= e!262648 tp_is_empty!11919)))

(declare-fun b!447255 () Bool)

(assert (=> b!447255 (= e!262649 (bvsge i!563 (size!13621 _values!549)))))

(declare-fun minValue!515 () V!16997)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7876 0))(
  ( (tuple2!7877 (_1!3949 (_ BitVec 64)) (_2!3949 V!16997)) )
))
(declare-datatypes ((List!7939 0))(
  ( (Nil!7936) (Cons!7935 (h!8791 tuple2!7876) (t!13701 List!7939)) )
))
(declare-datatypes ((ListLongMap!6789 0))(
  ( (ListLongMap!6790 (toList!3410 List!7939)) )
))
(declare-fun lt!203931 () ListLongMap!6789)

(declare-fun zeroValue!515 () V!16997)

(declare-fun getCurrentListMapNoExtraKeys!1596 (array!27645 array!27647 (_ BitVec 32) (_ BitVec 32) V!16997 V!16997 (_ BitVec 32) Int) ListLongMap!6789)

(assert (=> b!447255 (= lt!203931 (getCurrentListMapNoExtraKeys!1596 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!265586 () Bool)

(assert (=> start!40570 (=> (not res!265586) (not e!262647))))

(assert (=> start!40570 (= res!265586 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13620 _keys!709))))))

(assert (=> start!40570 e!262647))

(assert (=> start!40570 tp_is_empty!11919))

(assert (=> start!40570 tp!37562))

(assert (=> start!40570 true))

(declare-fun array_inv!9622 (array!27647) Bool)

(assert (=> start!40570 (and (array_inv!9622 _values!549) e!262652)))

(declare-fun array_inv!9623 (array!27645) Bool)

(assert (=> start!40570 (array_inv!9623 _keys!709)))

(declare-fun b!447256 () Bool)

(assert (=> b!447256 (= e!262650 tp_is_empty!11919)))

(assert (= (and start!40570 res!265586) b!447248))

(assert (= (and b!447248 res!265582) b!447247))

(assert (= (and b!447247 res!265577) b!447244))

(assert (= (and b!447244 res!265580) b!447243))

(assert (= (and b!447243 res!265576) b!447245))

(assert (= (and b!447245 res!265584) b!447246))

(assert (= (and b!447246 res!265579) b!447242))

(assert (= (and b!447242 res!265581) b!447249))

(assert (= (and b!447249 res!265583) b!447251))

(assert (= (and b!447251 res!265578) b!447253))

(assert (= (and b!447253 res!265585) b!447252))

(assert (= (and b!447252 res!265587) b!447255))

(assert (= (and b!447250 condMapEmpty!19512) mapIsEmpty!19512))

(assert (= (and b!447250 (not condMapEmpty!19512)) mapNonEmpty!19512))

(get-info :version)

(assert (= (and mapNonEmpty!19512 ((_ is ValueCellFull!5616) mapValue!19512)) b!447256))

(assert (= (and b!447250 ((_ is ValueCellFull!5616) mapDefault!19512)) b!447254))

(assert (= start!40570 b!447250))

(declare-fun m!432201 () Bool)

(assert (=> b!447244 m!432201))

(declare-fun m!432203 () Bool)

(assert (=> b!447251 m!432203))

(declare-fun m!432205 () Bool)

(assert (=> b!447251 m!432205))

(declare-fun m!432207 () Bool)

(assert (=> b!447243 m!432207))

(declare-fun m!432209 () Bool)

(assert (=> b!447242 m!432209))

(declare-fun m!432211 () Bool)

(assert (=> mapNonEmpty!19512 m!432211))

(declare-fun m!432213 () Bool)

(assert (=> b!447253 m!432213))

(declare-fun m!432215 () Bool)

(assert (=> b!447248 m!432215))

(declare-fun m!432217 () Bool)

(assert (=> b!447255 m!432217))

(declare-fun m!432219 () Bool)

(assert (=> start!40570 m!432219))

(declare-fun m!432221 () Bool)

(assert (=> start!40570 m!432221))

(declare-fun m!432223 () Bool)

(assert (=> b!447246 m!432223))

(declare-fun m!432225 () Bool)

(assert (=> b!447249 m!432225))

(check-sat (not b!447246) (not mapNonEmpty!19512) (not b!447243) tp_is_empty!11919 (not b!447253) (not b!447255) b_and!18589 (not b_next!10581) (not b!447251) (not start!40570) (not b!447248) (not b!447244) (not b!447249))
(check-sat b_and!18589 (not b_next!10581))
