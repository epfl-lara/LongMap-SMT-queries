; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38606 () Bool)

(assert start!38606)

(declare-fun b_free!9157 () Bool)

(declare-fun b_next!9157 () Bool)

(assert (=> start!38606 (= b_free!9157 (not b_next!9157))))

(declare-fun tp!32594 () Bool)

(declare-fun b_and!16517 () Bool)

(assert (=> start!38606 (= tp!32594 b_and!16517)))

(declare-fun b!400191 () Bool)

(declare-fun res!230273 () Bool)

(declare-fun e!241479 () Bool)

(assert (=> b!400191 (=> (not res!230273) (not e!241479))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400191 (= res!230273 (validMask!0 mask!1025))))

(declare-fun b!400192 () Bool)

(declare-fun e!241482 () Bool)

(declare-fun tp_is_empty!10039 () Bool)

(assert (=> b!400192 (= e!241482 tp_is_empty!10039)))

(declare-fun b!400193 () Bool)

(declare-fun res!230271 () Bool)

(assert (=> b!400193 (=> (not res!230271) (not e!241479))))

(declare-datatypes ((array!23967 0))(
  ( (array!23968 (arr!11433 (Array (_ BitVec 32) (_ BitVec 64))) (size!11786 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23967)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400193 (= res!230271 (or (= (select (arr!11433 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11433 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400194 () Bool)

(declare-fun res!230269 () Bool)

(assert (=> b!400194 (=> (not res!230269) (not e!241479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23967 (_ BitVec 32)) Bool)

(assert (=> b!400194 (= res!230269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!14491 0))(
  ( (V!14492 (val!5064 Int)) )
))
(declare-datatypes ((tuple2!6690 0))(
  ( (tuple2!6691 (_1!3356 (_ BitVec 64)) (_2!3356 V!14491)) )
))
(declare-datatypes ((List!6598 0))(
  ( (Nil!6595) (Cons!6594 (h!7450 tuple2!6690) (t!11763 List!6598)) )
))
(declare-datatypes ((ListLongMap!5593 0))(
  ( (ListLongMap!5594 (toList!2812 List!6598)) )
))
(declare-fun call!28110 () ListLongMap!5593)

(declare-fun v!412 () V!14491)

(declare-fun e!241477 () Bool)

(declare-fun b!400195 () Bool)

(declare-fun call!28111 () ListLongMap!5593)

(declare-fun +!1123 (ListLongMap!5593 tuple2!6690) ListLongMap!5593)

(assert (=> b!400195 (= e!241477 (= call!28111 (+!1123 call!28110 (tuple2!6691 k0!794 v!412))))))

(declare-fun b!400196 () Bool)

(declare-fun e!241480 () Bool)

(assert (=> b!400196 (= e!241479 e!241480)))

(declare-fun res!230272 () Bool)

(assert (=> b!400196 (=> (not res!230272) (not e!241480))))

(declare-fun lt!187463 () array!23967)

(assert (=> b!400196 (= res!230272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187463 mask!1025))))

(assert (=> b!400196 (= lt!187463 (array!23968 (store (arr!11433 _keys!709) i!563 k0!794) (size!11786 _keys!709)))))

(declare-fun b!400197 () Bool)

(declare-fun res!230274 () Bool)

(assert (=> b!400197 (=> (not res!230274) (not e!241479))))

(assert (=> b!400197 (= res!230274 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11786 _keys!709))))))

(declare-fun b!400198 () Bool)

(declare-fun res!230279 () Bool)

(assert (=> b!400198 (=> (not res!230279) (not e!241479))))

(declare-datatypes ((List!6599 0))(
  ( (Nil!6596) (Cons!6595 (h!7451 (_ BitVec 64)) (t!11764 List!6599)) )
))
(declare-fun arrayNoDuplicates!0 (array!23967 (_ BitVec 32) List!6599) Bool)

(assert (=> b!400198 (= res!230279 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6596))))

(declare-fun b!400199 () Bool)

(declare-fun res!230277 () Bool)

(assert (=> b!400199 (=> (not res!230277) (not e!241479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400199 (= res!230277 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16680 () Bool)

(declare-fun mapRes!16680 () Bool)

(declare-fun tp!32595 () Bool)

(declare-fun e!241481 () Bool)

(assert (=> mapNonEmpty!16680 (= mapRes!16680 (and tp!32595 e!241481))))

(declare-datatypes ((ValueCell!4676 0))(
  ( (ValueCellFull!4676 (v!7305 V!14491)) (EmptyCell!4676) )
))
(declare-datatypes ((array!23969 0))(
  ( (array!23970 (arr!11434 (Array (_ BitVec 32) ValueCell!4676)) (size!11787 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23969)

(declare-fun mapKey!16680 () (_ BitVec 32))

(declare-fun mapValue!16680 () ValueCell!4676)

(declare-fun mapRest!16680 () (Array (_ BitVec 32) ValueCell!4676))

(assert (=> mapNonEmpty!16680 (= (arr!11434 _values!549) (store mapRest!16680 mapKey!16680 mapValue!16680))))

(declare-fun b!400200 () Bool)

(declare-fun e!241478 () Bool)

(assert (=> b!400200 (= e!241478 (and e!241482 mapRes!16680))))

(declare-fun condMapEmpty!16680 () Bool)

(declare-fun mapDefault!16680 () ValueCell!4676)

(assert (=> b!400200 (= condMapEmpty!16680 (= (arr!11434 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4676)) mapDefault!16680)))))

(declare-fun b!400201 () Bool)

(assert (=> b!400201 (= e!241477 (= call!28110 call!28111))))

(declare-fun b!400202 () Bool)

(assert (=> b!400202 (= e!241480 (not true))))

(assert (=> b!400202 e!241477))

(declare-fun c!54621 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400202 (= c!54621 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14491)

(declare-datatypes ((Unit!12104 0))(
  ( (Unit!12105) )
))
(declare-fun lt!187462 () Unit!12104)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!315 (array!23967 array!23969 (_ BitVec 32) (_ BitVec 32) V!14491 V!14491 (_ BitVec 32) (_ BitVec 64) V!14491 (_ BitVec 32) Int) Unit!12104)

(assert (=> b!400202 (= lt!187462 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!315 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28107 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1031 (array!23967 array!23969 (_ BitVec 32) (_ BitVec 32) V!14491 V!14491 (_ BitVec 32) Int) ListLongMap!5593)

(assert (=> bm!28107 (= call!28111 (getCurrentListMapNoExtraKeys!1031 (ite c!54621 lt!187463 _keys!709) (ite c!54621 (array!23970 (store (arr!11434 _values!549) i!563 (ValueCellFull!4676 v!412)) (size!11787 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16680 () Bool)

(assert (=> mapIsEmpty!16680 mapRes!16680))

(declare-fun b!400203 () Bool)

(declare-fun res!230276 () Bool)

(assert (=> b!400203 (=> (not res!230276) (not e!241480))))

(assert (=> b!400203 (= res!230276 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11786 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400204 () Bool)

(declare-fun res!230278 () Bool)

(assert (=> b!400204 (=> (not res!230278) (not e!241480))))

(assert (=> b!400204 (= res!230278 (arrayNoDuplicates!0 lt!187463 #b00000000000000000000000000000000 Nil!6596))))

(declare-fun b!400205 () Bool)

(declare-fun res!230275 () Bool)

(assert (=> b!400205 (=> (not res!230275) (not e!241479))))

(declare-fun arrayContainsKey!0 (array!23967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400205 (= res!230275 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400206 () Bool)

(declare-fun res!230270 () Bool)

(assert (=> b!400206 (=> (not res!230270) (not e!241479))))

(assert (=> b!400206 (= res!230270 (and (= (size!11787 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11786 _keys!709) (size!11787 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28108 () Bool)

(assert (=> bm!28108 (= call!28110 (getCurrentListMapNoExtraKeys!1031 (ite c!54621 _keys!709 lt!187463) (ite c!54621 _values!549 (array!23970 (store (arr!11434 _values!549) i!563 (ValueCellFull!4676 v!412)) (size!11787 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400207 () Bool)

(assert (=> b!400207 (= e!241481 tp_is_empty!10039)))

(declare-fun res!230280 () Bool)

(assert (=> start!38606 (=> (not res!230280) (not e!241479))))

(assert (=> start!38606 (= res!230280 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11786 _keys!709))))))

(assert (=> start!38606 e!241479))

(assert (=> start!38606 tp_is_empty!10039))

(assert (=> start!38606 tp!32594))

(assert (=> start!38606 true))

(declare-fun array_inv!8390 (array!23969) Bool)

(assert (=> start!38606 (and (array_inv!8390 _values!549) e!241478)))

(declare-fun array_inv!8391 (array!23967) Bool)

(assert (=> start!38606 (array_inv!8391 _keys!709)))

(assert (= (and start!38606 res!230280) b!400191))

(assert (= (and b!400191 res!230273) b!400206))

(assert (= (and b!400206 res!230270) b!400194))

(assert (= (and b!400194 res!230269) b!400198))

(assert (= (and b!400198 res!230279) b!400197))

(assert (= (and b!400197 res!230274) b!400199))

(assert (= (and b!400199 res!230277) b!400193))

(assert (= (and b!400193 res!230271) b!400205))

(assert (= (and b!400205 res!230275) b!400196))

(assert (= (and b!400196 res!230272) b!400204))

(assert (= (and b!400204 res!230278) b!400203))

(assert (= (and b!400203 res!230276) b!400202))

(assert (= (and b!400202 c!54621) b!400195))

(assert (= (and b!400202 (not c!54621)) b!400201))

(assert (= (or b!400195 b!400201) bm!28107))

(assert (= (or b!400195 b!400201) bm!28108))

(assert (= (and b!400200 condMapEmpty!16680) mapIsEmpty!16680))

(assert (= (and b!400200 (not condMapEmpty!16680)) mapNonEmpty!16680))

(get-info :version)

(assert (= (and mapNonEmpty!16680 ((_ is ValueCellFull!4676) mapValue!16680)) b!400207))

(assert (= (and b!400200 ((_ is ValueCellFull!4676) mapDefault!16680)) b!400192))

(assert (= start!38606 b!400200))

(declare-fun m!393921 () Bool)

(assert (=> b!400202 m!393921))

(declare-fun m!393923 () Bool)

(assert (=> b!400193 m!393923))

(declare-fun m!393925 () Bool)

(assert (=> b!400204 m!393925))

(declare-fun m!393927 () Bool)

(assert (=> bm!28108 m!393927))

(declare-fun m!393929 () Bool)

(assert (=> bm!28108 m!393929))

(assert (=> bm!28107 m!393927))

(declare-fun m!393931 () Bool)

(assert (=> bm!28107 m!393931))

(declare-fun m!393933 () Bool)

(assert (=> b!400196 m!393933))

(declare-fun m!393935 () Bool)

(assert (=> b!400196 m!393935))

(declare-fun m!393937 () Bool)

(assert (=> b!400194 m!393937))

(declare-fun m!393939 () Bool)

(assert (=> b!400195 m!393939))

(declare-fun m!393941 () Bool)

(assert (=> start!38606 m!393941))

(declare-fun m!393943 () Bool)

(assert (=> start!38606 m!393943))

(declare-fun m!393945 () Bool)

(assert (=> b!400191 m!393945))

(declare-fun m!393947 () Bool)

(assert (=> b!400199 m!393947))

(declare-fun m!393949 () Bool)

(assert (=> mapNonEmpty!16680 m!393949))

(declare-fun m!393951 () Bool)

(assert (=> b!400205 m!393951))

(declare-fun m!393953 () Bool)

(assert (=> b!400198 m!393953))

(check-sat (not b!400202) (not b!400199) (not mapNonEmpty!16680) (not bm!28108) (not b!400204) (not start!38606) (not b!400205) (not b!400191) (not b_next!9157) (not b!400195) (not b!400196) (not b!400198) (not bm!28107) (not b!400194) b_and!16517 tp_is_empty!10039)
(check-sat b_and!16517 (not b_next!9157))
