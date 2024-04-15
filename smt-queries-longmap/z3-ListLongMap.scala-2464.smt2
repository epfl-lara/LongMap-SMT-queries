; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38588 () Bool)

(assert start!38588)

(declare-fun b_free!9139 () Bool)

(declare-fun b_next!9139 () Bool)

(assert (=> start!38588 (= b_free!9139 (not b_next!9139))))

(declare-fun tp!32541 () Bool)

(declare-fun b_and!16499 () Bool)

(assert (=> start!38588 (= tp!32541 b_and!16499)))

(declare-fun b!399732 () Bool)

(declare-fun e!241292 () Bool)

(declare-fun e!241289 () Bool)

(assert (=> b!399732 (= e!241292 e!241289)))

(declare-fun res!229945 () Bool)

(assert (=> b!399732 (=> (not res!229945) (not e!241289))))

(declare-datatypes ((array!23931 0))(
  ( (array!23932 (arr!11415 (Array (_ BitVec 32) (_ BitVec 64))) (size!11768 (_ BitVec 32))) )
))
(declare-fun lt!187409 () array!23931)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23931 (_ BitVec 32)) Bool)

(assert (=> b!399732 (= res!229945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187409 mask!1025))))

(declare-fun _keys!709 () array!23931)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399732 (= lt!187409 (array!23932 (store (arr!11415 _keys!709) i!563 k0!794) (size!11768 _keys!709)))))

(declare-fun b!399733 () Bool)

(declare-fun res!229949 () Bool)

(assert (=> b!399733 (=> (not res!229949) (not e!241292))))

(assert (=> b!399733 (= res!229949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399734 () Bool)

(declare-fun res!229951 () Bool)

(assert (=> b!399734 (=> (not res!229951) (not e!241289))))

(declare-datatypes ((List!6581 0))(
  ( (Nil!6578) (Cons!6577 (h!7433 (_ BitVec 64)) (t!11746 List!6581)) )
))
(declare-fun arrayNoDuplicates!0 (array!23931 (_ BitVec 32) List!6581) Bool)

(assert (=> b!399734 (= res!229951 (arrayNoDuplicates!0 lt!187409 #b00000000000000000000000000000000 Nil!6578))))

(declare-fun b!399735 () Bool)

(declare-fun e!241288 () Bool)

(declare-datatypes ((V!14467 0))(
  ( (V!14468 (val!5055 Int)) )
))
(declare-datatypes ((tuple2!6672 0))(
  ( (tuple2!6673 (_1!3347 (_ BitVec 64)) (_2!3347 V!14467)) )
))
(declare-datatypes ((List!6582 0))(
  ( (Nil!6579) (Cons!6578 (h!7434 tuple2!6672) (t!11747 List!6582)) )
))
(declare-datatypes ((ListLongMap!5575 0))(
  ( (ListLongMap!5576 (toList!2803 List!6582)) )
))
(declare-fun call!28056 () ListLongMap!5575)

(declare-fun call!28057 () ListLongMap!5575)

(assert (=> b!399735 (= e!241288 (= call!28056 call!28057))))

(declare-fun b!399736 () Bool)

(declare-fun res!229955 () Bool)

(assert (=> b!399736 (=> (not res!229955) (not e!241292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399736 (= res!229955 (validMask!0 mask!1025))))

(declare-fun b!399737 () Bool)

(declare-fun res!229953 () Bool)

(assert (=> b!399737 (=> (not res!229953) (not e!241292))))

(assert (=> b!399737 (= res!229953 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11768 _keys!709))))))

(declare-fun b!399738 () Bool)

(declare-fun res!229952 () Bool)

(assert (=> b!399738 (=> (not res!229952) (not e!241292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399738 (= res!229952 (validKeyInArray!0 k0!794))))

(declare-fun b!399739 () Bool)

(declare-fun e!241293 () Bool)

(declare-fun e!241287 () Bool)

(declare-fun mapRes!16653 () Bool)

(assert (=> b!399739 (= e!241293 (and e!241287 mapRes!16653))))

(declare-fun condMapEmpty!16653 () Bool)

(declare-datatypes ((ValueCell!4667 0))(
  ( (ValueCellFull!4667 (v!7296 V!14467)) (EmptyCell!4667) )
))
(declare-datatypes ((array!23933 0))(
  ( (array!23934 (arr!11416 (Array (_ BitVec 32) ValueCell!4667)) (size!11769 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23933)

(declare-fun mapDefault!16653 () ValueCell!4667)

(assert (=> b!399739 (= condMapEmpty!16653 (= (arr!11416 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4667)) mapDefault!16653)))))

(declare-fun b!399740 () Bool)

(declare-fun res!229956 () Bool)

(assert (=> b!399740 (=> (not res!229956) (not e!241292))))

(assert (=> b!399740 (= res!229956 (or (= (select (arr!11415 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11415 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399741 () Bool)

(declare-fun res!229948 () Bool)

(assert (=> b!399741 (=> (not res!229948) (not e!241292))))

(declare-fun arrayContainsKey!0 (array!23931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399741 (= res!229948 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399742 () Bool)

(assert (=> b!399742 (= e!241289 (not true))))

(assert (=> b!399742 e!241288))

(declare-fun c!54594 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!399742 (= c!54594 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14467)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12090 0))(
  ( (Unit!12091) )
))
(declare-fun lt!187408 () Unit!12090)

(declare-fun v!412 () V!14467)

(declare-fun zeroValue!515 () V!14467)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!308 (array!23931 array!23933 (_ BitVec 32) (_ BitVec 32) V!14467 V!14467 (_ BitVec 32) (_ BitVec 64) V!14467 (_ BitVec 32) Int) Unit!12090)

(assert (=> b!399742 (= lt!187408 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!308 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399743 () Bool)

(declare-fun res!229946 () Bool)

(assert (=> b!399743 (=> (not res!229946) (not e!241292))))

(assert (=> b!399743 (= res!229946 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6578))))

(declare-fun b!399744 () Bool)

(declare-fun res!229954 () Bool)

(assert (=> b!399744 (=> (not res!229954) (not e!241289))))

(assert (=> b!399744 (= res!229954 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11768 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16653 () Bool)

(assert (=> mapIsEmpty!16653 mapRes!16653))

(declare-fun bm!28053 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1022 (array!23931 array!23933 (_ BitVec 32) (_ BitVec 32) V!14467 V!14467 (_ BitVec 32) Int) ListLongMap!5575)

(assert (=> bm!28053 (= call!28057 (getCurrentListMapNoExtraKeys!1022 (ite c!54594 lt!187409 _keys!709) (ite c!54594 (array!23934 (store (arr!11416 _values!549) i!563 (ValueCellFull!4667 v!412)) (size!11769 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!229950 () Bool)

(assert (=> start!38588 (=> (not res!229950) (not e!241292))))

(assert (=> start!38588 (= res!229950 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11768 _keys!709))))))

(assert (=> start!38588 e!241292))

(declare-fun tp_is_empty!10021 () Bool)

(assert (=> start!38588 tp_is_empty!10021))

(assert (=> start!38588 tp!32541))

(assert (=> start!38588 true))

(declare-fun array_inv!8376 (array!23933) Bool)

(assert (=> start!38588 (and (array_inv!8376 _values!549) e!241293)))

(declare-fun array_inv!8377 (array!23931) Bool)

(assert (=> start!38588 (array_inv!8377 _keys!709)))

(declare-fun b!399745 () Bool)

(declare-fun res!229947 () Bool)

(assert (=> b!399745 (=> (not res!229947) (not e!241292))))

(assert (=> b!399745 (= res!229947 (and (= (size!11769 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11768 _keys!709) (size!11769 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399746 () Bool)

(declare-fun e!241291 () Bool)

(assert (=> b!399746 (= e!241291 tp_is_empty!10021)))

(declare-fun bm!28054 () Bool)

(assert (=> bm!28054 (= call!28056 (getCurrentListMapNoExtraKeys!1022 (ite c!54594 _keys!709 lt!187409) (ite c!54594 _values!549 (array!23934 (store (arr!11416 _values!549) i!563 (ValueCellFull!4667 v!412)) (size!11769 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16653 () Bool)

(declare-fun tp!32540 () Bool)

(assert (=> mapNonEmpty!16653 (= mapRes!16653 (and tp!32540 e!241291))))

(declare-fun mapValue!16653 () ValueCell!4667)

(declare-fun mapKey!16653 () (_ BitVec 32))

(declare-fun mapRest!16653 () (Array (_ BitVec 32) ValueCell!4667))

(assert (=> mapNonEmpty!16653 (= (arr!11416 _values!549) (store mapRest!16653 mapKey!16653 mapValue!16653))))

(declare-fun b!399747 () Bool)

(assert (=> b!399747 (= e!241287 tp_is_empty!10021)))

(declare-fun b!399748 () Bool)

(declare-fun +!1116 (ListLongMap!5575 tuple2!6672) ListLongMap!5575)

(assert (=> b!399748 (= e!241288 (= call!28057 (+!1116 call!28056 (tuple2!6673 k0!794 v!412))))))

(assert (= (and start!38588 res!229950) b!399736))

(assert (= (and b!399736 res!229955) b!399745))

(assert (= (and b!399745 res!229947) b!399733))

(assert (= (and b!399733 res!229949) b!399743))

(assert (= (and b!399743 res!229946) b!399737))

(assert (= (and b!399737 res!229953) b!399738))

(assert (= (and b!399738 res!229952) b!399740))

(assert (= (and b!399740 res!229956) b!399741))

(assert (= (and b!399741 res!229948) b!399732))

(assert (= (and b!399732 res!229945) b!399734))

(assert (= (and b!399734 res!229951) b!399744))

(assert (= (and b!399744 res!229954) b!399742))

(assert (= (and b!399742 c!54594) b!399748))

(assert (= (and b!399742 (not c!54594)) b!399735))

(assert (= (or b!399748 b!399735) bm!28053))

(assert (= (or b!399748 b!399735) bm!28054))

(assert (= (and b!399739 condMapEmpty!16653) mapIsEmpty!16653))

(assert (= (and b!399739 (not condMapEmpty!16653)) mapNonEmpty!16653))

(get-info :version)

(assert (= (and mapNonEmpty!16653 ((_ is ValueCellFull!4667) mapValue!16653)) b!399746))

(assert (= (and b!399739 ((_ is ValueCellFull!4667) mapDefault!16653)) b!399747))

(assert (= start!38588 b!399739))

(declare-fun m!393615 () Bool)

(assert (=> bm!28054 m!393615))

(declare-fun m!393617 () Bool)

(assert (=> bm!28054 m!393617))

(declare-fun m!393619 () Bool)

(assert (=> b!399733 m!393619))

(declare-fun m!393621 () Bool)

(assert (=> start!38588 m!393621))

(declare-fun m!393623 () Bool)

(assert (=> start!38588 m!393623))

(declare-fun m!393625 () Bool)

(assert (=> b!399736 m!393625))

(declare-fun m!393627 () Bool)

(assert (=> b!399742 m!393627))

(declare-fun m!393629 () Bool)

(assert (=> b!399743 m!393629))

(declare-fun m!393631 () Bool)

(assert (=> b!399740 m!393631))

(assert (=> bm!28053 m!393615))

(declare-fun m!393633 () Bool)

(assert (=> bm!28053 m!393633))

(declare-fun m!393635 () Bool)

(assert (=> b!399734 m!393635))

(declare-fun m!393637 () Bool)

(assert (=> b!399738 m!393637))

(declare-fun m!393639 () Bool)

(assert (=> b!399732 m!393639))

(declare-fun m!393641 () Bool)

(assert (=> b!399732 m!393641))

(declare-fun m!393643 () Bool)

(assert (=> b!399748 m!393643))

(declare-fun m!393645 () Bool)

(assert (=> mapNonEmpty!16653 m!393645))

(declare-fun m!393647 () Bool)

(assert (=> b!399741 m!393647))

(check-sat (not mapNonEmpty!16653) (not start!38588) (not b_next!9139) (not b!399736) (not b!399748) (not bm!28053) (not b!399732) (not b!399741) (not b!399738) b_and!16499 (not b!399742) (not b!399743) (not bm!28054) tp_is_empty!10021 (not b!399734) (not b!399733))
(check-sat b_and!16499 (not b_next!9139))
