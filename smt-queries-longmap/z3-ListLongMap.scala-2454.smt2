; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38528 () Bool)

(assert start!38528)

(declare-fun b_free!9079 () Bool)

(declare-fun b_next!9079 () Bool)

(assert (=> start!38528 (= b_free!9079 (not b_next!9079))))

(declare-fun tp!32360 () Bool)

(declare-fun b_and!16439 () Bool)

(assert (=> start!38528 (= tp!32360 b_and!16439)))

(declare-fun b!398202 () Bool)

(declare-fun e!240663 () Bool)

(declare-fun e!240662 () Bool)

(assert (=> b!398202 (= e!240663 e!240662)))

(declare-fun res!228866 () Bool)

(assert (=> b!398202 (=> (not res!228866) (not e!240662))))

(declare-datatypes ((array!23813 0))(
  ( (array!23814 (arr!11356 (Array (_ BitVec 32) (_ BitVec 64))) (size!11709 (_ BitVec 32))) )
))
(declare-fun lt!187228 () array!23813)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23813 (_ BitVec 32)) Bool)

(assert (=> b!398202 (= res!228866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187228 mask!1025))))

(declare-fun _keys!709 () array!23813)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398202 (= lt!187228 (array!23814 (store (arr!11356 _keys!709) i!563 k0!794) (size!11709 _keys!709)))))

(declare-fun b!398203 () Bool)

(declare-fun res!228867 () Bool)

(assert (=> b!398203 (=> (not res!228867) (not e!240663))))

(declare-datatypes ((List!6527 0))(
  ( (Nil!6524) (Cons!6523 (h!7379 (_ BitVec 64)) (t!11692 List!6527)) )
))
(declare-fun arrayNoDuplicates!0 (array!23813 (_ BitVec 32) List!6527) Bool)

(assert (=> b!398203 (= res!228867 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6524))))

(declare-fun b!398204 () Bool)

(declare-fun res!228873 () Bool)

(assert (=> b!398204 (=> (not res!228873) (not e!240663))))

(declare-fun arrayContainsKey!0 (array!23813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398204 (= res!228873 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398205 () Bool)

(declare-fun e!240657 () Bool)

(declare-datatypes ((V!14387 0))(
  ( (V!14388 (val!5025 Int)) )
))
(declare-datatypes ((tuple2!6614 0))(
  ( (tuple2!6615 (_1!3318 (_ BitVec 64)) (_2!3318 V!14387)) )
))
(declare-datatypes ((List!6528 0))(
  ( (Nil!6525) (Cons!6524 (h!7380 tuple2!6614) (t!11693 List!6528)) )
))
(declare-datatypes ((ListLongMap!5517 0))(
  ( (ListLongMap!5518 (toList!2774 List!6528)) )
))
(declare-fun call!27877 () ListLongMap!5517)

(declare-fun call!27876 () ListLongMap!5517)

(assert (=> b!398205 (= e!240657 (= call!27877 call!27876))))

(declare-fun b!398206 () Bool)

(assert (=> b!398206 (= e!240662 (not true))))

(assert (=> b!398206 e!240657))

(declare-fun c!54504 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!398206 (= c!54504 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14387)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4637 0))(
  ( (ValueCellFull!4637 (v!7266 V!14387)) (EmptyCell!4637) )
))
(declare-datatypes ((array!23815 0))(
  ( (array!23816 (arr!11357 (Array (_ BitVec 32) ValueCell!4637)) (size!11710 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23815)

(declare-fun zeroValue!515 () V!14387)

(declare-fun v!412 () V!14387)

(declare-datatypes ((Unit!12048 0))(
  ( (Unit!12049) )
))
(declare-fun lt!187229 () Unit!12048)

(declare-fun defaultEntry!557 () Int)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!287 (array!23813 array!23815 (_ BitVec 32) (_ BitVec 32) V!14387 V!14387 (_ BitVec 32) (_ BitVec 64) V!14387 (_ BitVec 32) Int) Unit!12048)

(assert (=> b!398206 (= lt!187229 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!287 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398207 () Bool)

(declare-fun res!228875 () Bool)

(assert (=> b!398207 (=> (not res!228875) (not e!240662))))

(assert (=> b!398207 (= res!228875 (arrayNoDuplicates!0 lt!187228 #b00000000000000000000000000000000 Nil!6524))))

(declare-fun bm!27873 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!996 (array!23813 array!23815 (_ BitVec 32) (_ BitVec 32) V!14387 V!14387 (_ BitVec 32) Int) ListLongMap!5517)

(assert (=> bm!27873 (= call!27877 (getCurrentListMapNoExtraKeys!996 (ite c!54504 _keys!709 lt!187228) (ite c!54504 _values!549 (array!23816 (store (arr!11357 _values!549) i!563 (ValueCellFull!4637 v!412)) (size!11710 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398208 () Bool)

(declare-fun e!240659 () Bool)

(declare-fun e!240661 () Bool)

(declare-fun mapRes!16563 () Bool)

(assert (=> b!398208 (= e!240659 (and e!240661 mapRes!16563))))

(declare-fun condMapEmpty!16563 () Bool)

(declare-fun mapDefault!16563 () ValueCell!4637)

(assert (=> b!398208 (= condMapEmpty!16563 (= (arr!11357 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4637)) mapDefault!16563)))))

(declare-fun mapNonEmpty!16563 () Bool)

(declare-fun tp!32361 () Bool)

(declare-fun e!240660 () Bool)

(assert (=> mapNonEmpty!16563 (= mapRes!16563 (and tp!32361 e!240660))))

(declare-fun mapKey!16563 () (_ BitVec 32))

(declare-fun mapValue!16563 () ValueCell!4637)

(declare-fun mapRest!16563 () (Array (_ BitVec 32) ValueCell!4637))

(assert (=> mapNonEmpty!16563 (= (arr!11357 _values!549) (store mapRest!16563 mapKey!16563 mapValue!16563))))

(declare-fun b!398209 () Bool)

(declare-fun res!228876 () Bool)

(assert (=> b!398209 (=> (not res!228876) (not e!240663))))

(assert (=> b!398209 (= res!228876 (or (= (select (arr!11356 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11356 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398210 () Bool)

(declare-fun res!228870 () Bool)

(assert (=> b!398210 (=> (not res!228870) (not e!240663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398210 (= res!228870 (validMask!0 mask!1025))))

(declare-fun res!228874 () Bool)

(assert (=> start!38528 (=> (not res!228874) (not e!240663))))

(assert (=> start!38528 (= res!228874 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11709 _keys!709))))))

(assert (=> start!38528 e!240663))

(declare-fun tp_is_empty!9961 () Bool)

(assert (=> start!38528 tp_is_empty!9961))

(assert (=> start!38528 tp!32360))

(assert (=> start!38528 true))

(declare-fun array_inv!8336 (array!23815) Bool)

(assert (=> start!38528 (and (array_inv!8336 _values!549) e!240659)))

(declare-fun array_inv!8337 (array!23813) Bool)

(assert (=> start!38528 (array_inv!8337 _keys!709)))

(declare-fun b!398211 () Bool)

(assert (=> b!398211 (= e!240660 tp_is_empty!9961)))

(declare-fun b!398212 () Bool)

(declare-fun res!228871 () Bool)

(assert (=> b!398212 (=> (not res!228871) (not e!240662))))

(assert (=> b!398212 (= res!228871 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11709 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398213 () Bool)

(declare-fun res!228872 () Bool)

(assert (=> b!398213 (=> (not res!228872) (not e!240663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398213 (= res!228872 (validKeyInArray!0 k0!794))))

(declare-fun b!398214 () Bool)

(assert (=> b!398214 (= e!240661 tp_is_empty!9961)))

(declare-fun b!398215 () Bool)

(declare-fun res!228865 () Bool)

(assert (=> b!398215 (=> (not res!228865) (not e!240663))))

(assert (=> b!398215 (= res!228865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11709 _keys!709))))))

(declare-fun b!398216 () Bool)

(declare-fun res!228868 () Bool)

(assert (=> b!398216 (=> (not res!228868) (not e!240663))))

(assert (=> b!398216 (= res!228868 (and (= (size!11710 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11709 _keys!709) (size!11710 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398217 () Bool)

(declare-fun res!228869 () Bool)

(assert (=> b!398217 (=> (not res!228869) (not e!240663))))

(assert (=> b!398217 (= res!228869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!27874 () Bool)

(assert (=> bm!27874 (= call!27876 (getCurrentListMapNoExtraKeys!996 (ite c!54504 lt!187228 _keys!709) (ite c!54504 (array!23816 (store (arr!11357 _values!549) i!563 (ValueCellFull!4637 v!412)) (size!11710 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16563 () Bool)

(assert (=> mapIsEmpty!16563 mapRes!16563))

(declare-fun b!398218 () Bool)

(declare-fun +!1094 (ListLongMap!5517 tuple2!6614) ListLongMap!5517)

(assert (=> b!398218 (= e!240657 (= call!27876 (+!1094 call!27877 (tuple2!6615 k0!794 v!412))))))

(assert (= (and start!38528 res!228874) b!398210))

(assert (= (and b!398210 res!228870) b!398216))

(assert (= (and b!398216 res!228868) b!398217))

(assert (= (and b!398217 res!228869) b!398203))

(assert (= (and b!398203 res!228867) b!398215))

(assert (= (and b!398215 res!228865) b!398213))

(assert (= (and b!398213 res!228872) b!398209))

(assert (= (and b!398209 res!228876) b!398204))

(assert (= (and b!398204 res!228873) b!398202))

(assert (= (and b!398202 res!228866) b!398207))

(assert (= (and b!398207 res!228875) b!398212))

(assert (= (and b!398212 res!228871) b!398206))

(assert (= (and b!398206 c!54504) b!398218))

(assert (= (and b!398206 (not c!54504)) b!398205))

(assert (= (or b!398218 b!398205) bm!27874))

(assert (= (or b!398218 b!398205) bm!27873))

(assert (= (and b!398208 condMapEmpty!16563) mapIsEmpty!16563))

(assert (= (and b!398208 (not condMapEmpty!16563)) mapNonEmpty!16563))

(get-info :version)

(assert (= (and mapNonEmpty!16563 ((_ is ValueCellFull!4637) mapValue!16563)) b!398211))

(assert (= (and b!398208 ((_ is ValueCellFull!4637) mapDefault!16563)) b!398214))

(assert (= start!38528 b!398208))

(declare-fun m!392595 () Bool)

(assert (=> start!38528 m!392595))

(declare-fun m!392597 () Bool)

(assert (=> start!38528 m!392597))

(declare-fun m!392599 () Bool)

(assert (=> b!398209 m!392599))

(declare-fun m!392601 () Bool)

(assert (=> bm!27874 m!392601))

(declare-fun m!392603 () Bool)

(assert (=> bm!27874 m!392603))

(declare-fun m!392605 () Bool)

(assert (=> b!398218 m!392605))

(declare-fun m!392607 () Bool)

(assert (=> b!398210 m!392607))

(declare-fun m!392609 () Bool)

(assert (=> b!398207 m!392609))

(declare-fun m!392611 () Bool)

(assert (=> b!398203 m!392611))

(declare-fun m!392613 () Bool)

(assert (=> mapNonEmpty!16563 m!392613))

(declare-fun m!392615 () Bool)

(assert (=> b!398206 m!392615))

(declare-fun m!392617 () Bool)

(assert (=> b!398202 m!392617))

(declare-fun m!392619 () Bool)

(assert (=> b!398202 m!392619))

(declare-fun m!392621 () Bool)

(assert (=> b!398204 m!392621))

(declare-fun m!392623 () Bool)

(assert (=> b!398217 m!392623))

(declare-fun m!392625 () Bool)

(assert (=> b!398213 m!392625))

(assert (=> bm!27873 m!392601))

(declare-fun m!392627 () Bool)

(assert (=> bm!27873 m!392627))

(check-sat tp_is_empty!9961 (not b!398203) (not b!398207) (not start!38528) (not b!398210) (not b!398202) (not bm!27873) (not b!398217) (not b_next!9079) (not b!398206) (not b!398213) (not b!398204) (not b!398218) (not mapNonEmpty!16563) (not bm!27874) b_and!16439)
(check-sat b_and!16439 (not b_next!9079))
