; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38556 () Bool)

(assert start!38556)

(declare-fun b_free!9093 () Bool)

(declare-fun b_next!9093 () Bool)

(assert (=> start!38556 (= b_free!9093 (not b_next!9093))))

(declare-fun tp!32403 () Bool)

(declare-fun b_and!16479 () Bool)

(assert (=> start!38556 (= tp!32403 b_and!16479)))

(declare-fun b!398830 () Bool)

(declare-fun e!240981 () Bool)

(assert (=> b!398830 (= e!240981 (not true))))

(declare-fun e!240979 () Bool)

(assert (=> b!398830 e!240979))

(declare-fun c!54596 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398830 (= c!54596 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14405 0))(
  ( (V!14406 (val!5032 Int)) )
))
(declare-fun minValue!515 () V!14405)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4644 0))(
  ( (ValueCellFull!4644 (v!7279 V!14405)) (EmptyCell!4644) )
))
(declare-datatypes ((array!23861 0))(
  ( (array!23862 (arr!11380 (Array (_ BitVec 32) ValueCell!4644)) (size!11732 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23861)

(declare-fun zeroValue!515 () V!14405)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12086 0))(
  ( (Unit!12087) )
))
(declare-fun lt!187504 () Unit!12086)

(declare-fun v!412 () V!14405)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23863 0))(
  ( (array!23864 (arr!11381 (Array (_ BitVec 32) (_ BitVec 64))) (size!11733 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23863)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!301 (array!23863 array!23861 (_ BitVec 32) (_ BitVec 32) V!14405 V!14405 (_ BitVec 32) (_ BitVec 64) V!14405 (_ BitVec 32) Int) Unit!12086)

(assert (=> b!398830 (= lt!187504 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!301 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398831 () Bool)

(declare-fun res!229249 () Bool)

(declare-fun e!240984 () Bool)

(assert (=> b!398831 (=> (not res!229249) (not e!240984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398831 (= res!229249 (validMask!0 mask!1025))))

(declare-fun b!398832 () Bool)

(declare-datatypes ((tuple2!6656 0))(
  ( (tuple2!6657 (_1!3339 (_ BitVec 64)) (_2!3339 V!14405)) )
))
(declare-datatypes ((List!6582 0))(
  ( (Nil!6579) (Cons!6578 (h!7434 tuple2!6656) (t!11756 List!6582)) )
))
(declare-datatypes ((ListLongMap!5569 0))(
  ( (ListLongMap!5570 (toList!2800 List!6582)) )
))
(declare-fun call!27944 () ListLongMap!5569)

(declare-fun call!27943 () ListLongMap!5569)

(declare-fun +!1090 (ListLongMap!5569 tuple2!6656) ListLongMap!5569)

(assert (=> b!398832 (= e!240979 (= call!27944 (+!1090 call!27943 (tuple2!6657 k0!794 v!412))))))

(declare-fun b!398833 () Bool)

(assert (=> b!398833 (= e!240984 e!240981)))

(declare-fun res!229254 () Bool)

(assert (=> b!398833 (=> (not res!229254) (not e!240981))))

(declare-fun lt!187505 () array!23863)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23863 (_ BitVec 32)) Bool)

(assert (=> b!398833 (= res!229254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187505 mask!1025))))

(assert (=> b!398833 (= lt!187505 (array!23864 (store (arr!11381 _keys!709) i!563 k0!794) (size!11733 _keys!709)))))

(declare-fun b!398834 () Bool)

(declare-fun res!229248 () Bool)

(assert (=> b!398834 (=> (not res!229248) (not e!240981))))

(assert (=> b!398834 (= res!229248 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11733 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398835 () Bool)

(declare-fun res!229247 () Bool)

(assert (=> b!398835 (=> (not res!229247) (not e!240984))))

(assert (=> b!398835 (= res!229247 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11733 _keys!709))))))

(declare-fun b!398836 () Bool)

(declare-fun e!240980 () Bool)

(declare-fun tp_is_empty!9975 () Bool)

(assert (=> b!398836 (= e!240980 tp_is_empty!9975)))

(declare-fun b!398837 () Bool)

(declare-fun res!229256 () Bool)

(assert (=> b!398837 (=> (not res!229256) (not e!240984))))

(declare-fun arrayContainsKey!0 (array!23863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398837 (= res!229256 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398838 () Bool)

(assert (=> b!398838 (= e!240979 (= call!27943 call!27944))))

(declare-fun b!398839 () Bool)

(declare-fun res!229250 () Bool)

(assert (=> b!398839 (=> (not res!229250) (not e!240981))))

(declare-datatypes ((List!6583 0))(
  ( (Nil!6580) (Cons!6579 (h!7435 (_ BitVec 64)) (t!11757 List!6583)) )
))
(declare-fun arrayNoDuplicates!0 (array!23863 (_ BitVec 32) List!6583) Bool)

(assert (=> b!398839 (= res!229250 (arrayNoDuplicates!0 lt!187505 #b00000000000000000000000000000000 Nil!6580))))

(declare-fun b!398840 () Bool)

(declare-fun res!229257 () Bool)

(assert (=> b!398840 (=> (not res!229257) (not e!240984))))

(assert (=> b!398840 (= res!229257 (or (= (select (arr!11381 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11381 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398841 () Bool)

(declare-fun res!229252 () Bool)

(assert (=> b!398841 (=> (not res!229252) (not e!240984))))

(assert (=> b!398841 (= res!229252 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6580))))

(declare-fun b!398842 () Bool)

(declare-fun e!240978 () Bool)

(assert (=> b!398842 (= e!240978 tp_is_empty!9975)))

(declare-fun b!398843 () Bool)

(declare-fun res!229246 () Bool)

(assert (=> b!398843 (=> (not res!229246) (not e!240984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398843 (= res!229246 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16584 () Bool)

(declare-fun mapRes!16584 () Bool)

(assert (=> mapIsEmpty!16584 mapRes!16584))

(declare-fun bm!27941 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1018 (array!23863 array!23861 (_ BitVec 32) (_ BitVec 32) V!14405 V!14405 (_ BitVec 32) Int) ListLongMap!5569)

(assert (=> bm!27941 (= call!27943 (getCurrentListMapNoExtraKeys!1018 (ite c!54596 _keys!709 lt!187505) (ite c!54596 _values!549 (array!23862 (store (arr!11380 _values!549) i!563 (ValueCellFull!4644 v!412)) (size!11732 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398844 () Bool)

(declare-fun res!229251 () Bool)

(assert (=> b!398844 (=> (not res!229251) (not e!240984))))

(assert (=> b!398844 (= res!229251 (and (= (size!11732 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11733 _keys!709) (size!11732 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398845 () Bool)

(declare-fun e!240983 () Bool)

(assert (=> b!398845 (= e!240983 (and e!240980 mapRes!16584))))

(declare-fun condMapEmpty!16584 () Bool)

(declare-fun mapDefault!16584 () ValueCell!4644)

(assert (=> b!398845 (= condMapEmpty!16584 (= (arr!11380 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4644)) mapDefault!16584)))))

(declare-fun res!229255 () Bool)

(assert (=> start!38556 (=> (not res!229255) (not e!240984))))

(assert (=> start!38556 (= res!229255 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11733 _keys!709))))))

(assert (=> start!38556 e!240984))

(assert (=> start!38556 tp_is_empty!9975))

(assert (=> start!38556 tp!32403))

(assert (=> start!38556 true))

(declare-fun array_inv!8338 (array!23861) Bool)

(assert (=> start!38556 (and (array_inv!8338 _values!549) e!240983)))

(declare-fun array_inv!8339 (array!23863) Bool)

(assert (=> start!38556 (array_inv!8339 _keys!709)))

(declare-fun bm!27940 () Bool)

(assert (=> bm!27940 (= call!27944 (getCurrentListMapNoExtraKeys!1018 (ite c!54596 lt!187505 _keys!709) (ite c!54596 (array!23862 (store (arr!11380 _values!549) i!563 (ValueCellFull!4644 v!412)) (size!11732 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398846 () Bool)

(declare-fun res!229253 () Bool)

(assert (=> b!398846 (=> (not res!229253) (not e!240984))))

(assert (=> b!398846 (= res!229253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16584 () Bool)

(declare-fun tp!32402 () Bool)

(assert (=> mapNonEmpty!16584 (= mapRes!16584 (and tp!32402 e!240978))))

(declare-fun mapKey!16584 () (_ BitVec 32))

(declare-fun mapValue!16584 () ValueCell!4644)

(declare-fun mapRest!16584 () (Array (_ BitVec 32) ValueCell!4644))

(assert (=> mapNonEmpty!16584 (= (arr!11380 _values!549) (store mapRest!16584 mapKey!16584 mapValue!16584))))

(assert (= (and start!38556 res!229255) b!398831))

(assert (= (and b!398831 res!229249) b!398844))

(assert (= (and b!398844 res!229251) b!398846))

(assert (= (and b!398846 res!229253) b!398841))

(assert (= (and b!398841 res!229252) b!398835))

(assert (= (and b!398835 res!229247) b!398843))

(assert (= (and b!398843 res!229246) b!398840))

(assert (= (and b!398840 res!229257) b!398837))

(assert (= (and b!398837 res!229256) b!398833))

(assert (= (and b!398833 res!229254) b!398839))

(assert (= (and b!398839 res!229250) b!398834))

(assert (= (and b!398834 res!229248) b!398830))

(assert (= (and b!398830 c!54596) b!398832))

(assert (= (and b!398830 (not c!54596)) b!398838))

(assert (= (or b!398832 b!398838) bm!27940))

(assert (= (or b!398832 b!398838) bm!27941))

(assert (= (and b!398845 condMapEmpty!16584) mapIsEmpty!16584))

(assert (= (and b!398845 (not condMapEmpty!16584)) mapNonEmpty!16584))

(get-info :version)

(assert (= (and mapNonEmpty!16584 ((_ is ValueCellFull!4644) mapValue!16584)) b!398842))

(assert (= (and b!398845 ((_ is ValueCellFull!4644) mapDefault!16584)) b!398836))

(assert (= start!38556 b!398845))

(declare-fun m!393557 () Bool)

(assert (=> b!398833 m!393557))

(declare-fun m!393559 () Bool)

(assert (=> b!398833 m!393559))

(declare-fun m!393561 () Bool)

(assert (=> b!398839 m!393561))

(declare-fun m!393563 () Bool)

(assert (=> start!38556 m!393563))

(declare-fun m!393565 () Bool)

(assert (=> start!38556 m!393565))

(declare-fun m!393567 () Bool)

(assert (=> b!398832 m!393567))

(declare-fun m!393569 () Bool)

(assert (=> b!398841 m!393569))

(declare-fun m!393571 () Bool)

(assert (=> b!398830 m!393571))

(declare-fun m!393573 () Bool)

(assert (=> b!398831 m!393573))

(declare-fun m!393575 () Bool)

(assert (=> b!398843 m!393575))

(declare-fun m!393577 () Bool)

(assert (=> b!398846 m!393577))

(declare-fun m!393579 () Bool)

(assert (=> b!398837 m!393579))

(declare-fun m!393581 () Bool)

(assert (=> bm!27940 m!393581))

(declare-fun m!393583 () Bool)

(assert (=> bm!27940 m!393583))

(declare-fun m!393585 () Bool)

(assert (=> b!398840 m!393585))

(assert (=> bm!27941 m!393581))

(declare-fun m!393587 () Bool)

(assert (=> bm!27941 m!393587))

(declare-fun m!393589 () Bool)

(assert (=> mapNonEmpty!16584 m!393589))

(check-sat (not b!398839) (not b!398830) (not b!398833) (not b!398843) (not mapNonEmpty!16584) (not bm!27941) (not bm!27940) (not b_next!9093) (not b!398841) (not b!398831) (not start!38556) (not b!398832) (not b!398837) b_and!16479 tp_is_empty!9975 (not b!398846))
(check-sat b_and!16479 (not b_next!9093))
