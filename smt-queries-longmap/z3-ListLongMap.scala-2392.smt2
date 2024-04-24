; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37844 () Bool)

(assert start!37844)

(declare-fun b_free!8917 () Bool)

(declare-fun b_next!8917 () Bool)

(assert (=> start!37844 (= b_free!8917 (not b_next!8917))))

(declare-fun tp!31509 () Bool)

(declare-fun b_and!16197 () Bool)

(assert (=> start!37844 (= tp!31509 b_and!16197)))

(declare-fun b!388969 () Bool)

(declare-fun res!222462 () Bool)

(declare-fun e!235676 () Bool)

(assert (=> b!388969 (=> (not res!222462) (not e!235676))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388969 (= res!222462 (validKeyInArray!0 k0!778))))

(declare-fun b!388970 () Bool)

(declare-fun res!222473 () Bool)

(declare-fun e!235677 () Bool)

(assert (=> b!388970 (=> (not res!222473) (not e!235677))))

(declare-datatypes ((array!23058 0))(
  ( (array!23059 (arr!10995 (Array (_ BitVec 32) (_ BitVec 64))) (size!11347 (_ BitVec 32))) )
))
(declare-fun lt!182807 () array!23058)

(declare-datatypes ((List!6220 0))(
  ( (Nil!6217) (Cons!6216 (h!7072 (_ BitVec 64)) (t!11366 List!6220)) )
))
(declare-fun arrayNoDuplicates!0 (array!23058 (_ BitVec 32) List!6220) Bool)

(assert (=> b!388970 (= res!222473 (arrayNoDuplicates!0 lt!182807 #b00000000000000000000000000000000 Nil!6217))))

(declare-fun res!222466 () Bool)

(assert (=> start!37844 (=> (not res!222466) (not e!235676))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37844 (= res!222466 (validMask!0 mask!970))))

(assert (=> start!37844 e!235676))

(declare-datatypes ((V!13891 0))(
  ( (V!13892 (val!4839 Int)) )
))
(declare-datatypes ((ValueCell!4451 0))(
  ( (ValueCellFull!4451 (v!7045 V!13891)) (EmptyCell!4451) )
))
(declare-datatypes ((array!23060 0))(
  ( (array!23061 (arr!10996 (Array (_ BitVec 32) ValueCell!4451)) (size!11348 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23060)

(declare-fun e!235675 () Bool)

(declare-fun array_inv!8126 (array!23060) Bool)

(assert (=> start!37844 (and (array_inv!8126 _values!506) e!235675)))

(assert (=> start!37844 tp!31509))

(assert (=> start!37844 true))

(declare-fun tp_is_empty!9589 () Bool)

(assert (=> start!37844 tp_is_empty!9589))

(declare-fun _keys!658 () array!23058)

(declare-fun array_inv!8127 (array!23058) Bool)

(assert (=> start!37844 (array_inv!8127 _keys!658)))

(declare-fun b!388971 () Bool)

(assert (=> b!388971 (= e!235676 e!235677)))

(declare-fun res!222471 () Bool)

(assert (=> b!388971 (=> (not res!222471) (not e!235677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23058 (_ BitVec 32)) Bool)

(assert (=> b!388971 (= res!222471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182807 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388971 (= lt!182807 (array!23059 (store (arr!10995 _keys!658) i!548 k0!778) (size!11347 _keys!658)))))

(declare-fun b!388972 () Bool)

(declare-fun res!222472 () Bool)

(assert (=> b!388972 (=> (not res!222472) (not e!235676))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388972 (= res!222472 (and (= (size!11348 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11347 _keys!658) (size!11348 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!6368 0))(
  ( (tuple2!6369 (_1!3195 (_ BitVec 64)) (_2!3195 V!13891)) )
))
(declare-fun lt!182809 () tuple2!6368)

(declare-datatypes ((List!6221 0))(
  ( (Nil!6218) (Cons!6217 (h!7073 tuple2!6368) (t!11367 List!6221)) )
))
(declare-datatypes ((ListLongMap!5283 0))(
  ( (ListLongMap!5284 (toList!2657 List!6221)) )
))
(declare-fun lt!182808 () ListLongMap!5283)

(declare-fun b!388973 () Bool)

(declare-fun e!235678 () Bool)

(declare-fun lt!182814 () tuple2!6368)

(declare-fun lt!182815 () ListLongMap!5283)

(declare-fun +!1011 (ListLongMap!5283 tuple2!6368) ListLongMap!5283)

(assert (=> b!388973 (= e!235678 (= lt!182808 (+!1011 (+!1011 lt!182815 lt!182814) lt!182809)))))

(declare-fun b!388974 () Bool)

(declare-fun e!235680 () Bool)

(assert (=> b!388974 (= e!235680 tp_is_empty!9589)))

(declare-fun lt!182811 () ListLongMap!5283)

(declare-fun b!388975 () Bool)

(declare-fun lt!182812 () ListLongMap!5283)

(declare-fun e!235674 () Bool)

(assert (=> b!388975 (= e!235674 (= lt!182811 (+!1011 (+!1011 lt!182812 lt!182814) lt!182809)))))

(assert (=> b!388975 e!235678))

(declare-fun res!222469 () Bool)

(assert (=> b!388975 (=> (not res!222469) (not e!235678))))

(declare-fun lt!182813 () ListLongMap!5283)

(assert (=> b!388975 (= res!222469 (= lt!182811 (+!1011 (+!1011 lt!182813 lt!182814) lt!182809)))))

(declare-fun minValue!472 () V!13891)

(assert (=> b!388975 (= lt!182809 (tuple2!6369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!13891)

(assert (=> b!388975 (= lt!182814 (tuple2!6369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15954 () Bool)

(declare-fun mapRes!15954 () Bool)

(declare-fun tp!31508 () Bool)

(declare-fun e!235673 () Bool)

(assert (=> mapNonEmpty!15954 (= mapRes!15954 (and tp!31508 e!235673))))

(declare-fun mapKey!15954 () (_ BitVec 32))

(declare-fun mapRest!15954 () (Array (_ BitVec 32) ValueCell!4451))

(declare-fun mapValue!15954 () ValueCell!4451)

(assert (=> mapNonEmpty!15954 (= (arr!10996 _values!506) (store mapRest!15954 mapKey!15954 mapValue!15954))))

(declare-fun b!388976 () Bool)

(declare-fun res!222464 () Bool)

(assert (=> b!388976 (=> (not res!222464) (not e!235676))))

(declare-fun arrayContainsKey!0 (array!23058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388976 (= res!222464 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388977 () Bool)

(assert (=> b!388977 (= e!235673 tp_is_empty!9589)))

(declare-fun b!388978 () Bool)

(declare-fun res!222467 () Bool)

(assert (=> b!388978 (=> (not res!222467) (not e!235676))))

(assert (=> b!388978 (= res!222467 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6217))))

(declare-fun b!388979 () Bool)

(declare-fun res!222468 () Bool)

(assert (=> b!388979 (=> (not res!222468) (not e!235676))))

(assert (=> b!388979 (= res!222468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388980 () Bool)

(declare-fun res!222465 () Bool)

(assert (=> b!388980 (=> (not res!222465) (not e!235676))))

(assert (=> b!388980 (= res!222465 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11347 _keys!658))))))

(declare-fun b!388981 () Bool)

(declare-fun res!222470 () Bool)

(assert (=> b!388981 (=> (not res!222470) (not e!235676))))

(assert (=> b!388981 (= res!222470 (or (= (select (arr!10995 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10995 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388982 () Bool)

(assert (=> b!388982 (= e!235675 (and e!235680 mapRes!15954))))

(declare-fun condMapEmpty!15954 () Bool)

(declare-fun mapDefault!15954 () ValueCell!4451)

(assert (=> b!388982 (= condMapEmpty!15954 (= (arr!10996 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4451)) mapDefault!15954)))))

(declare-fun mapIsEmpty!15954 () Bool)

(assert (=> mapIsEmpty!15954 mapRes!15954))

(declare-fun b!388983 () Bool)

(assert (=> b!388983 (= e!235677 (not e!235674))))

(declare-fun res!222463 () Bool)

(assert (=> b!388983 (=> res!222463 e!235674)))

(assert (=> b!388983 (= res!222463 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2042 (array!23058 array!23060 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) Int) ListLongMap!5283)

(assert (=> b!388983 (= lt!182808 (getCurrentListMap!2042 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182816 () array!23060)

(assert (=> b!388983 (= lt!182811 (getCurrentListMap!2042 lt!182807 lt!182816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388983 (and (= lt!182813 lt!182812) (= lt!182812 lt!182813))))

(declare-fun v!373 () V!13891)

(assert (=> b!388983 (= lt!182812 (+!1011 lt!182815 (tuple2!6369 k0!778 v!373)))))

(declare-datatypes ((Unit!11891 0))(
  ( (Unit!11892) )
))
(declare-fun lt!182810 () Unit!11891)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!233 (array!23058 array!23060 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) (_ BitVec 64) V!13891 (_ BitVec 32) Int) Unit!11891)

(assert (=> b!388983 (= lt!182810 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!233 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!931 (array!23058 array!23060 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) Int) ListLongMap!5283)

(assert (=> b!388983 (= lt!182813 (getCurrentListMapNoExtraKeys!931 lt!182807 lt!182816 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388983 (= lt!182816 (array!23061 (store (arr!10996 _values!506) i!548 (ValueCellFull!4451 v!373)) (size!11348 _values!506)))))

(assert (=> b!388983 (= lt!182815 (getCurrentListMapNoExtraKeys!931 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37844 res!222466) b!388972))

(assert (= (and b!388972 res!222472) b!388979))

(assert (= (and b!388979 res!222468) b!388978))

(assert (= (and b!388978 res!222467) b!388980))

(assert (= (and b!388980 res!222465) b!388969))

(assert (= (and b!388969 res!222462) b!388981))

(assert (= (and b!388981 res!222470) b!388976))

(assert (= (and b!388976 res!222464) b!388971))

(assert (= (and b!388971 res!222471) b!388970))

(assert (= (and b!388970 res!222473) b!388983))

(assert (= (and b!388983 (not res!222463)) b!388975))

(assert (= (and b!388975 res!222469) b!388973))

(assert (= (and b!388982 condMapEmpty!15954) mapIsEmpty!15954))

(assert (= (and b!388982 (not condMapEmpty!15954)) mapNonEmpty!15954))

(get-info :version)

(assert (= (and mapNonEmpty!15954 ((_ is ValueCellFull!4451) mapValue!15954)) b!388977))

(assert (= (and b!388982 ((_ is ValueCellFull!4451) mapDefault!15954)) b!388974))

(assert (= start!37844 b!388982))

(declare-fun m!385249 () Bool)

(assert (=> b!388978 m!385249))

(declare-fun m!385251 () Bool)

(assert (=> b!388979 m!385251))

(declare-fun m!385253 () Bool)

(assert (=> b!388983 m!385253))

(declare-fun m!385255 () Bool)

(assert (=> b!388983 m!385255))

(declare-fun m!385257 () Bool)

(assert (=> b!388983 m!385257))

(declare-fun m!385259 () Bool)

(assert (=> b!388983 m!385259))

(declare-fun m!385261 () Bool)

(assert (=> b!388983 m!385261))

(declare-fun m!385263 () Bool)

(assert (=> b!388983 m!385263))

(declare-fun m!385265 () Bool)

(assert (=> b!388983 m!385265))

(declare-fun m!385267 () Bool)

(assert (=> b!388976 m!385267))

(declare-fun m!385269 () Bool)

(assert (=> b!388969 m!385269))

(declare-fun m!385271 () Bool)

(assert (=> b!388981 m!385271))

(declare-fun m!385273 () Bool)

(assert (=> b!388973 m!385273))

(assert (=> b!388973 m!385273))

(declare-fun m!385275 () Bool)

(assert (=> b!388973 m!385275))

(declare-fun m!385277 () Bool)

(assert (=> mapNonEmpty!15954 m!385277))

(declare-fun m!385279 () Bool)

(assert (=> b!388975 m!385279))

(assert (=> b!388975 m!385279))

(declare-fun m!385281 () Bool)

(assert (=> b!388975 m!385281))

(declare-fun m!385283 () Bool)

(assert (=> b!388975 m!385283))

(assert (=> b!388975 m!385283))

(declare-fun m!385285 () Bool)

(assert (=> b!388975 m!385285))

(declare-fun m!385287 () Bool)

(assert (=> start!37844 m!385287))

(declare-fun m!385289 () Bool)

(assert (=> start!37844 m!385289))

(declare-fun m!385291 () Bool)

(assert (=> start!37844 m!385291))

(declare-fun m!385293 () Bool)

(assert (=> b!388970 m!385293))

(declare-fun m!385295 () Bool)

(assert (=> b!388971 m!385295))

(declare-fun m!385297 () Bool)

(assert (=> b!388971 m!385297))

(check-sat (not b!388979) (not b!388983) b_and!16197 (not b!388971) (not b!388973) (not b!388970) (not b!388969) (not start!37844) (not b!388975) (not b_next!8917) (not mapNonEmpty!15954) tp_is_empty!9589 (not b!388976) (not b!388978))
(check-sat b_and!16197 (not b_next!8917))
