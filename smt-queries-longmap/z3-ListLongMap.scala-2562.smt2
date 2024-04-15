; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39176 () Bool)

(assert start!39176)

(declare-fun b_free!9457 () Bool)

(declare-fun b_next!9457 () Bool)

(assert (=> start!39176 (= b_free!9457 (not b_next!9457))))

(declare-fun tp!33899 () Bool)

(declare-fun b_and!16817 () Bool)

(assert (=> start!39176 (= tp!33899 b_and!16817)))

(declare-fun res!239732 () Bool)

(declare-fun e!246815 () Bool)

(assert (=> start!39176 (=> (not res!239732) (not e!246815))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25069 0))(
  ( (array!25070 (arr!11984 (Array (_ BitVec 32) (_ BitVec 64))) (size!12337 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25069)

(assert (=> start!39176 (= res!239732 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12337 _keys!709))))))

(assert (=> start!39176 e!246815))

(declare-fun tp_is_empty!10609 () Bool)

(assert (=> start!39176 tp_is_empty!10609))

(assert (=> start!39176 tp!33899))

(assert (=> start!39176 true))

(declare-datatypes ((V!15251 0))(
  ( (V!15252 (val!5349 Int)) )
))
(declare-datatypes ((ValueCell!4961 0))(
  ( (ValueCellFull!4961 (v!7590 V!15251)) (EmptyCell!4961) )
))
(declare-datatypes ((array!25071 0))(
  ( (array!25072 (arr!11985 (Array (_ BitVec 32) ValueCell!4961)) (size!12338 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25071)

(declare-fun e!246821 () Bool)

(declare-fun array_inv!8792 (array!25071) Bool)

(assert (=> start!39176 (and (array_inv!8792 _values!549) e!246821)))

(declare-fun array_inv!8793 (array!25069) Bool)

(assert (=> start!39176 (array_inv!8793 _keys!709)))

(declare-fun b!412622 () Bool)

(declare-fun e!246817 () Bool)

(assert (=> b!412622 (= e!246817 tp_is_empty!10609)))

(declare-fun b!412623 () Bool)

(declare-fun e!246822 () Bool)

(assert (=> b!412623 (= e!246822 tp_is_empty!10609)))

(declare-fun b!412624 () Bool)

(declare-fun res!239726 () Bool)

(assert (=> b!412624 (=> (not res!239726) (not e!246815))))

(declare-datatypes ((List!6943 0))(
  ( (Nil!6940) (Cons!6939 (h!7795 (_ BitVec 64)) (t!12108 List!6943)) )
))
(declare-fun arrayNoDuplicates!0 (array!25069 (_ BitVec 32) List!6943) Bool)

(assert (=> b!412624 (= res!239726 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6940))))

(declare-fun b!412625 () Bool)

(declare-fun res!239729 () Bool)

(declare-fun e!246820 () Bool)

(assert (=> b!412625 (=> (not res!239729) (not e!246820))))

(declare-fun lt!189344 () array!25069)

(assert (=> b!412625 (= res!239729 (arrayNoDuplicates!0 lt!189344 #b00000000000000000000000000000000 Nil!6940))))

(declare-fun minValue!515 () V!15251)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189341 () array!25071)

(declare-fun c!54828 () Bool)

(declare-fun zeroValue!515 () V!15251)

(declare-datatypes ((tuple2!6924 0))(
  ( (tuple2!6925 (_1!3473 (_ BitVec 64)) (_2!3473 V!15251)) )
))
(declare-datatypes ((List!6944 0))(
  ( (Nil!6941) (Cons!6940 (h!7796 tuple2!6924) (t!12109 List!6944)) )
))
(declare-datatypes ((ListLongMap!5827 0))(
  ( (ListLongMap!5828 (toList!2929 List!6944)) )
))
(declare-fun call!28525 () ListLongMap!5827)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28521 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1143 (array!25069 array!25071 (_ BitVec 32) (_ BitVec 32) V!15251 V!15251 (_ BitVec 32) Int) ListLongMap!5827)

(assert (=> bm!28521 (= call!28525 (getCurrentListMapNoExtraKeys!1143 (ite c!54828 lt!189344 _keys!709) (ite c!54828 lt!189341 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412626 () Bool)

(declare-fun res!239725 () Bool)

(assert (=> b!412626 (=> (not res!239725) (not e!246815))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412626 (= res!239725 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412627 () Bool)

(declare-fun e!246819 () Bool)

(assert (=> b!412627 (= e!246819 (not true))))

(declare-fun e!246818 () Bool)

(assert (=> b!412627 e!246818))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412627 (= c!54828 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12190 0))(
  ( (Unit!12191) )
))
(declare-fun lt!189342 () Unit!12190)

(declare-fun v!412 () V!15251)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!358 (array!25069 array!25071 (_ BitVec 32) (_ BitVec 32) V!15251 V!15251 (_ BitVec 32) (_ BitVec 64) V!15251 (_ BitVec 32) Int) Unit!12190)

(assert (=> b!412627 (= lt!189342 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!358 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412628 () Bool)

(assert (=> b!412628 (= e!246820 e!246819)))

(declare-fun res!239724 () Bool)

(assert (=> b!412628 (=> (not res!239724) (not e!246819))))

(assert (=> b!412628 (= res!239724 (= from!863 i!563))))

(declare-fun lt!189340 () ListLongMap!5827)

(assert (=> b!412628 (= lt!189340 (getCurrentListMapNoExtraKeys!1143 lt!189344 lt!189341 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!412628 (= lt!189341 (array!25072 (store (arr!11985 _values!549) i!563 (ValueCellFull!4961 v!412)) (size!12338 _values!549)))))

(declare-fun lt!189343 () ListLongMap!5827)

(assert (=> b!412628 (= lt!189343 (getCurrentListMapNoExtraKeys!1143 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412629 () Bool)

(declare-fun res!239721 () Bool)

(assert (=> b!412629 (=> (not res!239721) (not e!246815))))

(assert (=> b!412629 (= res!239721 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12337 _keys!709))))))

(declare-fun b!412630 () Bool)

(declare-fun call!28524 () ListLongMap!5827)

(declare-fun +!1174 (ListLongMap!5827 tuple2!6924) ListLongMap!5827)

(assert (=> b!412630 (= e!246818 (= call!28525 (+!1174 call!28524 (tuple2!6925 k0!794 v!412))))))

(declare-fun b!412631 () Bool)

(declare-fun res!239727 () Bool)

(assert (=> b!412631 (=> (not res!239727) (not e!246815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25069 (_ BitVec 32)) Bool)

(assert (=> b!412631 (= res!239727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412632 () Bool)

(declare-fun res!239728 () Bool)

(assert (=> b!412632 (=> (not res!239728) (not e!246815))))

(assert (=> b!412632 (= res!239728 (or (= (select (arr!11984 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11984 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412633 () Bool)

(declare-fun res!239733 () Bool)

(assert (=> b!412633 (=> (not res!239733) (not e!246815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412633 (= res!239733 (validMask!0 mask!1025))))

(declare-fun b!412634 () Bool)

(assert (=> b!412634 (= e!246815 e!246820)))

(declare-fun res!239722 () Bool)

(assert (=> b!412634 (=> (not res!239722) (not e!246820))))

(assert (=> b!412634 (= res!239722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189344 mask!1025))))

(assert (=> b!412634 (= lt!189344 (array!25070 (store (arr!11984 _keys!709) i!563 k0!794) (size!12337 _keys!709)))))

(declare-fun mapNonEmpty!17535 () Bool)

(declare-fun mapRes!17535 () Bool)

(declare-fun tp!33900 () Bool)

(assert (=> mapNonEmpty!17535 (= mapRes!17535 (and tp!33900 e!246817))))

(declare-fun mapValue!17535 () ValueCell!4961)

(declare-fun mapKey!17535 () (_ BitVec 32))

(declare-fun mapRest!17535 () (Array (_ BitVec 32) ValueCell!4961))

(assert (=> mapNonEmpty!17535 (= (arr!11985 _values!549) (store mapRest!17535 mapKey!17535 mapValue!17535))))

(declare-fun b!412635 () Bool)

(assert (=> b!412635 (= e!246818 (= call!28524 call!28525))))

(declare-fun b!412636 () Bool)

(declare-fun res!239731 () Bool)

(assert (=> b!412636 (=> (not res!239731) (not e!246820))))

(assert (=> b!412636 (= res!239731 (bvsle from!863 i!563))))

(declare-fun b!412637 () Bool)

(assert (=> b!412637 (= e!246821 (and e!246822 mapRes!17535))))

(declare-fun condMapEmpty!17535 () Bool)

(declare-fun mapDefault!17535 () ValueCell!4961)

(assert (=> b!412637 (= condMapEmpty!17535 (= (arr!11985 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4961)) mapDefault!17535)))))

(declare-fun b!412638 () Bool)

(declare-fun res!239730 () Bool)

(assert (=> b!412638 (=> (not res!239730) (not e!246815))))

(assert (=> b!412638 (= res!239730 (and (= (size!12338 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12337 _keys!709) (size!12338 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412639 () Bool)

(declare-fun res!239723 () Bool)

(assert (=> b!412639 (=> (not res!239723) (not e!246815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412639 (= res!239723 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17535 () Bool)

(assert (=> mapIsEmpty!17535 mapRes!17535))

(declare-fun bm!28522 () Bool)

(assert (=> bm!28522 (= call!28524 (getCurrentListMapNoExtraKeys!1143 (ite c!54828 _keys!709 lt!189344) (ite c!54828 _values!549 lt!189341) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39176 res!239732) b!412633))

(assert (= (and b!412633 res!239733) b!412638))

(assert (= (and b!412638 res!239730) b!412631))

(assert (= (and b!412631 res!239727) b!412624))

(assert (= (and b!412624 res!239726) b!412629))

(assert (= (and b!412629 res!239721) b!412639))

(assert (= (and b!412639 res!239723) b!412632))

(assert (= (and b!412632 res!239728) b!412626))

(assert (= (and b!412626 res!239725) b!412634))

(assert (= (and b!412634 res!239722) b!412625))

(assert (= (and b!412625 res!239729) b!412636))

(assert (= (and b!412636 res!239731) b!412628))

(assert (= (and b!412628 res!239724) b!412627))

(assert (= (and b!412627 c!54828) b!412630))

(assert (= (and b!412627 (not c!54828)) b!412635))

(assert (= (or b!412630 b!412635) bm!28521))

(assert (= (or b!412630 b!412635) bm!28522))

(assert (= (and b!412637 condMapEmpty!17535) mapIsEmpty!17535))

(assert (= (and b!412637 (not condMapEmpty!17535)) mapNonEmpty!17535))

(get-info :version)

(assert (= (and mapNonEmpty!17535 ((_ is ValueCellFull!4961) mapValue!17535)) b!412622))

(assert (= (and b!412637 ((_ is ValueCellFull!4961) mapDefault!17535)) b!412623))

(assert (= start!39176 b!412637))

(declare-fun m!401829 () Bool)

(assert (=> b!412634 m!401829))

(declare-fun m!401831 () Bool)

(assert (=> b!412634 m!401831))

(declare-fun m!401833 () Bool)

(assert (=> b!412633 m!401833))

(declare-fun m!401835 () Bool)

(assert (=> b!412639 m!401835))

(declare-fun m!401837 () Bool)

(assert (=> b!412631 m!401837))

(declare-fun m!401839 () Bool)

(assert (=> b!412624 m!401839))

(declare-fun m!401841 () Bool)

(assert (=> start!39176 m!401841))

(declare-fun m!401843 () Bool)

(assert (=> start!39176 m!401843))

(declare-fun m!401845 () Bool)

(assert (=> bm!28521 m!401845))

(declare-fun m!401847 () Bool)

(assert (=> b!412632 m!401847))

(declare-fun m!401849 () Bool)

(assert (=> b!412625 m!401849))

(declare-fun m!401851 () Bool)

(assert (=> b!412628 m!401851))

(declare-fun m!401853 () Bool)

(assert (=> b!412628 m!401853))

(declare-fun m!401855 () Bool)

(assert (=> b!412628 m!401855))

(declare-fun m!401857 () Bool)

(assert (=> b!412626 m!401857))

(declare-fun m!401859 () Bool)

(assert (=> bm!28522 m!401859))

(declare-fun m!401861 () Bool)

(assert (=> mapNonEmpty!17535 m!401861))

(declare-fun m!401863 () Bool)

(assert (=> b!412627 m!401863))

(declare-fun m!401865 () Bool)

(assert (=> b!412630 m!401865))

(check-sat (not b!412626) (not mapNonEmpty!17535) (not b!412631) (not b!412625) (not b!412634) (not b!412633) (not b!412624) (not b!412628) (not b!412630) (not b_next!9457) (not bm!28522) (not start!39176) b_and!16817 (not bm!28521) tp_is_empty!10609 (not b!412627) (not b!412639))
(check-sat b_and!16817 (not b_next!9457))
